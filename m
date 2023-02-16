Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA36699927
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 16:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917F310E343;
	Thu, 16 Feb 2023 15:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D6610E343;
 Thu, 16 Feb 2023 15:43:35 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-16e55be7c76so2972075fac.6; 
 Thu, 16 Feb 2023 07:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kqlQpAcf4Wzqxl4xb6eYdityvsH5h6NrcJ/4N8vqGOw=;
 b=Rn6hnLZHCyzsW3ia+odAtRTqvLM57Tby00RNJwM4y/PnsvyV3lfpewlXHk5roCuvf9
 cGQXUic06mx5lM1l1Jdiau4R0mTEej2Jzd8WzGJObLIEyo94SNXtcdE570YfmZSG+82Q
 7FrGhUox1fVAJf2SFHxp/K8n8/5QQsGSzIuXCC9ucz9lnNSvw7q7noAfN+6unCnXlpBl
 uXVjys/dJJzQReW4YPFaB2qX+8xBxILmZPIHfptv6+DCMo7njI1so9wkL5ZJCskBq+VQ
 +UsgHIGUIwp5iFxz6CD7eQIqVse4mH5quBgww64r/Pu3d/+RuHCuTcZKG+/1uDNtxGUH
 oArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kqlQpAcf4Wzqxl4xb6eYdityvsH5h6NrcJ/4N8vqGOw=;
 b=E/SmdjP6KtEdLOcTyNlhAcFNTJx0BoOlhgP5TNhvOPs78+vPQm7cJK1UDo6jxVDFcp
 kRhNT7owY1vSfzKbW1VoZgdsUh1BqXecAjtvw4ih2V1EFI8Fk+0GHc4HtbZGnWmriQdn
 2la/vbxF5drZiV4zuGH7Y3TBvy5GPRxgcdxiGxVPD3Sn09RfYSdudqHz/kRW49+KAAff
 BP7wxv84wIjIdmDntEuIYujoty1fZsOBwFHdXgcKOyOcjtSRGxoV2kRAtyf4uYC3hPFD
 OP2BRbgjY5Gjo1RRCg+6roGx1zgQSLqJ974qdI4QzOw03ry/XGHxRxHnNzldpYBbMBL/
 vw+g==
X-Gm-Message-State: AO0yUKXAwR8jPJDV85ASMXWMH8zKlPkeTTQ2lW/6mIsrRl9BFuymfEYa
 7Qyr1kPH95q2PlecytVeuJgxiqd2vHNo78PUx38=
X-Google-Smtp-Source: AK7set8zV6kztpb942cWwc7QIXkWsM6GGG3OhkMmlxnVNDIPPU+m34fRKDI5PjsANqYtzrxZON8VxSodb1x6kME2Bf8=
X-Received: by 2002:a05:6870:808d:b0:16e:8a56:d0d2 with SMTP id
 q13-20020a056870808d00b0016e8a56d0d2mr38204oab.38.1676562214504; Thu, 16 Feb
 2023 07:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
 <2a70e80c-d683-f9af-93fd-9f81d5028825@linux.intel.com>
In-Reply-To: <2a70e80c-d683-f9af-93fd-9f81d5028825@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 16 Feb 2023 07:43:54 -0800
Message-ID: <CAF6AEGvHFYXvsrrydsvCyfaryiksY_7J=BXAV0zHfAoevm_-aA@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC v2 0/5] Waitboost drm syncobj waits
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 3:19 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 14/02/2023 19:14, Rob Clark wrote:
> > On Fri, Feb 10, 2023 at 5:07 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>
> >> In i915 we have this concept of "wait boosting" where we give a priori=
ty boost
> >> for instance to fences which are actively waited upon from userspace. =
This has
> >> it's pros and cons and can certainly be discussed at lenght. However f=
act is
> >> some workloads really like it.
> >>
> >> Problem is that with the arrival of drm syncobj and a new userspace wa=
iting
> >> entry point it added, the waitboost mechanism was bypassed. Hence I co=
oked up
> >> this mini series really (really) quickly to see if some discussion can=
 be had.
> >>
> >> It adds a concept of "wait count" to dma fence, which is incremented f=
or every
> >> explicit dma_fence_enable_sw_signaling and dma_fence_add_wait_callback=
 (like
> >> dma_fence_add_callback but from explicit/userspace wait paths).
> >
> > I was thinking about a similar thing, but in the context of dma_fence
> > (or rather sync_file) fd poll()ing.  How does the kernel differentiate
> > between "housekeeping" poll()ers that don't want to trigger boost but
> > simply know when to do cleanup, and waiters who are waiting with some
> > urgency.  I think we could use EPOLLPRI for this purpose.
>
> Sounds plausible to allow distinguishing the two.
>
> I wasn't aware one can set POLLPRI in pollfd.events but it appears it cou=
ld be allowed:
>
> /* Event types that can be polled for.  These bits may be set in `events'
>     to indicate the interesting event types; they will appear in `revents=
'
>     to indicate the status of the file descriptor.  */
> #define POLLIN          0x001           /* There is data to read.  */
> #define POLLPRI         0x002           /* There is urgent data to read. =
 */
> #define POLLOUT         0x004           /* Writing now will not block.  *=
/
>
> > Not sure how that translates to waits via the syncobj.  But I think we
> > want to let userspace give some hint about urgent vs housekeeping
> > waits.
>
> Probably DRM_SYNCOBJ_WAIT_FLAGS_<something>.
>
> Both look easy additions on top of my series. It would be just a matter o=
f dma_fence_add_callback vs dma_fence_add_wait_callback based on flags, as =
that's how I called the "explicit userspace wait" one.
>
> It would require userspace changes to make use of it but that is probably=
 okay, or even preferable, since it makes the thing less of a heuristic. Wh=
at I don't know however is how feasible is to wire it up with say OpenCL, O=
penGL or Vulkan, to allow application writers distinguish between house kee=
ping vs performance sensitive waits.
>

I think to start with, we consider API level waits as
POLLPRI/DRM_SYNCOBJ_WAIT_PRI until someone types up an extension to
give the app control.  I guess most housekeeping waits will be within
the driver.

(I could see the argument for making "PRI" the default and having a
new flag for non-boosting waits.. but POLLPRI is also some sort of
precedent)

> > Also, on a related topic: https://lwn.net/Articles/868468/
>
> Right, I missed that one.
>
> One thing to mention is that my motivation here wasn't strictly waits rel=
ating to frame presentation but clvk workloads which constantly move betwee=
n the CPU and GPU. Even outside the compute domain, I think this is a workl=
oad characteristic where waitboost in general helps. The concept of deadlin=
e could still be used I guess, just setting it for some artificially early =
value, when the actual time does not exist. But scanning that discussion se=
ems the proposal got bogged down in interactions between mode setting and s=
tuff?
>

Yeah, it isn't _exactly_ the same thing but it is the same class of
problem where GPU stalling on something else sends the freq in the
wrong direction.  Probably we could consider wait-boosting as simply
an immediate deadline to unify the two things.

BR,
-R


> Regards,
>
> Tvrtko
