Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5240C4DC294
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 10:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC32410E10E;
	Thu, 17 Mar 2022 09:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4769710E10E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 09:25:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p9so6405871wra.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 02:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8BSAlNjZuCEu5XRer0aOyCn7BXVwDId04N4ElKF4B3k=;
 b=EbAmyOKp63GBC9K3r7IshZIupB9OzicalsNrE4+xkT0nkbteqJKWpohekxHoc8KXXl
 zwuzIqiECjwqR4cFKaPN/ktk5Yo824Nct8n1DdUHodicyYNRV+W9wY1dkyI/p8gaUuTv
 RMxn1HC9SGeG3ampY+RakL8idUD8ttPUdyBLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8BSAlNjZuCEu5XRer0aOyCn7BXVwDId04N4ElKF4B3k=;
 b=6SHMTt0riBPWL+6AOkUuEef4m/X6lCilefC5Pdx31lSFJtMr3ofsuL4RZi35pGxIV1
 ZmnOxPS7IIaU5KB4bIChyWFLy0KCD74+mg1a9jUxHUCgqZOap39gmgZLyyeSv5fzW1Tb
 IUk7gPLIRs+sBw8LLi6sI4vkSSZrzy7iXIPWbI88rENeVg2FaYGlXLJOLc0LwHM1tv6j
 NAekxK9Ne+2sUa/NSACwqB4NKPBxe5Bii/dNINkVKwiw7lBNXWeg2ph4+A9dJ8Q/ZPzH
 tk76PXZfXdpZVFdUP4rrLUduJkyqgJ5KCLoyUXdRJX1BAK/SgJ934ppwUc7M6wWWqVQX
 We8Q==
X-Gm-Message-State: AOAM531/WG5/qxd59ueKB11ZKAFRlu1ZKFzqgc0ZDzmn+wLgQZBxu5G0
 iLg0b55nMYHFq4uFnx0nMOKZyg==
X-Google-Smtp-Source: ABdhPJyfrL7rcL8gGouyrJ6oXT5ycMAnAN198ZXqWaDoEsdXloV13vg6dmPf4IMppHEh53waIww3sw==
X-Received: by 2002:a5d:6746:0:b0:203:d6c1:9c5b with SMTP id
 l6-20020a5d6746000000b00203d6c19c5bmr3170842wrw.446.1647509136581; 
 Thu, 17 Mar 2022 02:25:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k31-20020a05600c1c9f00b00389d2e0ba2asm3765936wms.16.2022.03.17.02.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 02:25:36 -0700 (PDT)
Date: Thu, 17 Mar 2022 10:25:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Message-ID: <YjL+jom1S6at7xQd@phenom.ffwll.local>
References: <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
 <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
 <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
 <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
 <2980e6a0-624e-2b80-c5d0-c40dfce76fb8@amd.com>
 <CAF6AEGvC=k4xLA-0iTSf660X2o04E+ivjnThZA-=WANKzLSvpA@mail.gmail.com>
 <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
 <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
 <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 14, 2022 at 10:23:27AM -0400, Alex Deucher wrote:
> On Fri, Mar 11, 2022 at 3:30 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Thu, 10 Mar 2022 11:56:41 -0800
> > Rob Clark <robdclark@gmail.com> wrote:
> >
> > > For something like just notifying a compositor that a gpu crash
> > > happened, perhaps drm_event is more suitable.  See
> > > virtio_gpu_fence_event_create() for an example of adding new event
> > > types.  Although maybe you want it to be an event which is not device
> > > specific.  This isn't so much of a debugging use-case as simply
> > > notification.
> >
> > Hi,
> >
> > for this particular use case, are we now talking about the display
> > device (KMS) crashing or the rendering device (OpenGL/Vulkan) crashing?
> >
> > If the former, I wasn't aware that display device crashes are a thing.
> > How should a userspace display server react to those?
> >
> > If the latter, don't we have EGL extensions or Vulkan API already to
> > deliver that?
> >
> > The above would be about device crashes that directly affect the
> > display server. Is that the use case in mind here, or is it instead
> > about notifying the display server that some application has caused a
> > driver/hardware crash? If the latter, how should a display server react
> > to that? Disconnect the application?
> >
> > Shashank, what is the actual use case you are developing this for?
> >
> > I've read all the emails here so far, and I don't recall seeing it
> > explained.
> >
> 
> The idea is that a support daemon or compositor would listen for GPU
> reset notifications and do something useful with them (kill the guilty
> app, restart the desktop environment, etc.).  Today when the GPU
> resets, most applications just continue assuming nothing is wrong,
> meanwhile the GPU has stopped accepting work until the apps re-init
> their context so all of their command submissions just get rejected.
> 
> > Btw. somewhat relatedly, there has been work aiming to allow
> > graceful hot-unplug of DRM devices. There is a kernel doc outlining how
> > the various APIs should react towards userspace when a DRM device
> > suddenly disappears. That seems to have some overlap here IMO.
> >
> > See https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#device-hot-unplug
> > which also has a couple pointers to EGL and Vulkan APIs.
> 
> The problem is most applications don't use the GL or VK robustness
> APIs.  You could use something like that in the compositor, but those
> APIs tend to be focused more on the application itself rather than the
> GPU in general.  E.g., Is my context lost.  Which is fine for
> restarting your context, but doesn't really help if you want to try
> and do something with another application (i.e., the likely guilty
> app).  Also, on dGPU at least, when you reset the GPU, vram is usually
> lost (either due to the memory controller being reset, or vram being
> zero'd on init due to ECC support), so even if you are not the guilty
> process, in that case you'd need to re-init your context anyway.

Isn't that what arb robustness and all that stuff is for? Doing that
through sysfs event sounds very wrong, since in general apps just don't
have access to that. Also vk equivalent is vk_error_device_lost. Iirc both
have information like whether the app was the guilty one causing the hang,
or whether it was just victimized because the gpu can't do anything else
than a full gpu reset which nukes everything (like amdgpu currently has,
aside from the thread unblock trick in the first attempt).

And if your app/compositor doesn't use robust contexts then the userspace
driver gets to do a best effort attempt at recovery, or exit(). Whatever
you can do really.

Also note that you don't actually want an event, but a query ioctl (plus
maybe a specific errno on your CS ioctl). Neither of the above flows
supports events for gpu resets. RESET_STATS ioctl is the i915
implementation of this stuff.

For the core dump aspect yes pls devcoredump and not reinvented wheels
(and i915 is a bad example here, but in defence the i915 sysfs hang event
predates devcoredump).

Cheers, Daniel


> 
> Alex
> 
> >
> >
> > Thanks,
> > pq

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
