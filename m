Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0596A6BCD8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 15:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7DC10E13D;
	Fri, 21 Mar 2025 14:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="GeeKdI3J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F5B10E13D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 14:22:00 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-601c12ac8d0so981675eaf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 07:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1742566920; x=1743171720; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mcVxA1VHtyBYF8KJXePYHpM4uFmJ330ExNm6gOhpsyQ=;
 b=GeeKdI3Ja7b5wP3JazXvVtKUG6ozRZsNehQYstTxtXstVHRPxr6cuxkmYncVnwX6hq
 bfNd4LWd8BB1n1vcBmxYPlKr3rtKGW5NXt8jrxuLo3u22APRsQ6d2X5UPG8ta+Xskcsf
 4Oju9A+q4tb9lq/fIVdQW0fUOIixhpjs8cCRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742566920; x=1743171720;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mcVxA1VHtyBYF8KJXePYHpM4uFmJ330ExNm6gOhpsyQ=;
 b=AMSm5wYR/RRhR34BG1c8g2E1IIfGKS0Ki9KIZeUhecR+iUGpAFRvWjYcf3EGk7z7N6
 gaKZaA4lVgMQA5MMnpg8b8SJzyFUoXWHqwnNZhHdvoYPGDaD1GRCr7IIkvch3ozy86o+
 wsSjsTUiacCJYwyj6L8F+NxUFt0O6knFuvCoZrxICjpVk6tikFt8fNeKU3tCtei4fJL7
 hb5pXgRwLz+MGdrRTo6ciIyYpVP6g4bif6ULlDXschG5vR0ip1NEOEsyRXBXhKJ1OQL5
 dnn/6Z9F4FAJo2p0a4zxrl8S9q0snA9S3sYYGzykXojMDFKbznnHHg7C6pabS5LdeMk+
 LvPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAOYJw8o8swfRG46cYwXLCc9vI6lAGJfnowh1uHT67cEvRvLyFGzrz4Qs/ouZ0JN/EkjuDPmqmb/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4mVoad/EjiCGVGdts424pl6O/VYbfxkeRVXM1OS9dXhxYvXmq
 sRvphiSzLyM0qyETdlKYoFZ+xyDPzJHDfcjudokX9XO26zzQl2rtMAmddU/fq+wQvpnvHqChmOO
 ymU9/+txHfNtxD9Dk54HXMSoKH++F/R4c4eorbA==
X-Gm-Gg: ASbGnctFErce9yvM6n76mJeJ0ndSVUCU3j+3qexDdt5zIvK8liNRTe91kGY6jueCV17
 h1Tt5iIKC+eSV2ij7wfkYziedU/j+ssxMjC8Keb1925idXxzcE4A0Z4WdjexcgDktEiGygQfIgG
 JnMjWCnOygSivyRW4+CzQAC4rCOSKdBlG6KolXpOXFJYdfQ0pET7OEEMk=
X-Google-Smtp-Source: AGHT+IGw8AOt7k2t4Ww0oY4fJ7gcpGfr9mRnJgiDVtkIF2nXX99Czb+MT4u5qWmKayx8l471LS8pBDWf7ox+VQev7/k=
X-Received: by 2002:a05:6820:2508:b0:601:3b6a:7634 with SMTP id
 006d021491bc7-602345846c8mr1548282eaf.4.1742566919869; Fri, 21 Mar 2025
 07:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw_a+3qLjUn0=SqjVL=N6ExRbw0u9TamwGwigWwDwc23Q@mail.gmail.com>
 <50869fd0-00df-40ab-8dfa-844670e6e850@linux.intel.com>
 <Z8czJa7QsCBGfQRd@phenom.ffwll.local>
 <bf25d370-7658-4ad6-b568-03621d3708a8@linux.intel.com>
In-Reply-To: <bf25d370-7658-4ad6-b568-03621d3708a8@linux.intel.com>
From: Simona Vetter <simona.vetter@ffwll.ch>
Date: Fri, 21 Mar 2025 15:21:48 +0100
X-Gm-Features: AQ5f1Jo_nGi3uF0koXz3FnAxLb-KyxGwrkRXBY2Mq_ihPWRSpHiezUgD1a8kQqo
Message-ID: <CAKMK7uGnmt7JTcBVFCbdSswFnZ2og-cmdHO_rsAEBv0_GFq4XQ@mail.gmail.com>
Subject: Re: firmware requirements
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Min Ma <min.ma@amd.com>,
 Lizhi Hou <lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Mar 2025 at 11:16, Jacek Lawrynowicz
<jacek.lawrynowicz@linux.intel.com> wrote:
>
> Hi,
>
> On 3/4/2025 6:06 PM, Simona Vetter wrote:
> > Hi Jacek!
> >
> > Bit late reply, was sick last week and still recovering from missed mails.
> >
> > On Thu, Feb 20, 2025 at 11:50:10AM +0100, Jacek Lawrynowicz wrote:
> >> On 2/19/2025 10:01 PM, Dave Airlie wrote:
> >>> I'd just like to remind everyone of the firmware requirements for
> >>> vendors that control their firmware and the driver upstreams:
> >>>
> >>> https://docs.kernel.org/driver-api/firmware/firmware-usage-guidelines.html
> >>>
> >>> Intel VPU it seems like you are not currently shipping upstream
> >>> firmware, and might have tied your fw and userspace together.
> >>
> >> Yep, this is correct :/
> >>
> >>> I'm cc'ing the AMD XDNA driver as it recently landed and I'd like them
> >>> to confirm they are following the above requirements.
> >>>
> >>> The main reason we don't allow userspace/fw direct linkage is if a
> >>> user deploys two containers with two different userspace drivers in
> >>> them on the same hardware, what is the kernel driver supposed to do?
> >>
> >> This makes sense, but I didn't see anything in the firmware usage
> >
> > Well, when Dave wrote that documentation section and I reviewed it we
> > figured that's clear from the rules we have. There's two rules:
> >
> > - firmware is not allowed to break the kernel. This is not limited to
> >   "does the kernel driver keep loading", but fully extends to anything the
> >   kernel driver does or needs to fullfill its job.
> > - the kernel is not allowed to break userspace. This is not limited to the
> >   uapi structures, but anything they point at or implicitly reference, any
> >   implementation details userspace relies on, any other hidden semantics
> >   that aren't entirely transparent. Everything really that can result in a
> >   bug report from users.
> >
> > If the firmware upgrade still works with the kernel, but changes the
> > how the overall uapi works, then the firmware broke the kernel.
> >
> > I think the two individiual steps above are very clear already, but I
> > guess that both together mean that firmware isn't allowed to break
> > userspace isn't clear. Can you please send a patch to add that as another
> > very explicit bullet to the existing list in the fw guidelines?
>
> Sure, I've sent the patch.

Thanks a lot!

> >> guidelines about needing user-space and firmware to be compatible.
> >> It is focused on making sure the kernel driver works well with the
> >> firmware.
> >> Our intel_vpu driver sticks to the basics with the firmware ABI, so
> >> we've got backward and forward compatibility covered from the initial
> >> release.
> >>
> >> Now, when it comes to user space and firmware, that's a whole other
> >> story. We've made some headway, but there's still a lot to do.
> >> Our firmware is pretty massive (like 10 times bigger than your average
> >> GPU firmware) which makes things trickier than what other drivers deal
> >> with.
> >> That's why we didn't put the firmware in linux-firmware right away, but
> >> we'll get the next release in there.
> >>
> >> We will continue working on separating user space from the firmware more
> >> to make things smoother.
> >>
> >>> Firmware should be abstracted in the kernel if it is not possible to
> >>> build proper fw APIs for userspace to use directly, by proper I mean
> >>> forward and backwards compatible.
> >>
> >> This dependents on a project. In our case only user space should provide
> >> this compatibility.
> >> We don't even parse command buffers at the moment in kernel space.
> >>
> >> For your reference, we release updates for both the user space and
> >> firmware every couple of weeks here:
> >> https://github.com/intel/linux-npu-driver/releases
> >
> > Yeah you need to fix this. With containers and other packages runtimes
> > there's really no connection between the base os image, and the userspace
> > you're running. Which means you really cannot assume that on any given
> > system there's only one abi version across the firmware and userspace
> > libraries. So even without upstreams "no breaking uapi" guarantee this
> > does not work in production.
>
> We should be able to provide backward compatibility, so new FW will work with all past userspace versions.
> The base OS just has to use up-to-date FW. This should satisfy FW requirements, right?

Yeah new userspace not working without newer firmware is ok. It's not
great for userspace and ideally you limit this to exceptional cases
only or make those additional features an optional requirement, but
it's not a concern for upstream. It's old userspace breaking on newer
firmware that would not be ok. So I think you're good. Would be good
to update the wording on the website to reflect that too.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
