Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 274F662E71D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 22:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7485C10E693;
	Thu, 17 Nov 2022 21:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB0910E68F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 21:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668721193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L4zGPUJrLWhe164ZndXPGoSFQIhcyrJ68N+dDmJZRm4=;
 b=Q+2JAhoF1QYR+dgpz1IYzZYq2aSwR4swVxTm8n9ah3q5BNut8xCA9YiEiv3/f+Teu5Q9Vw
 dGKyLsf7uAV1H5vquZdvLddA9DuC6srgtDyKKAQ4UypWEwUYnn0M0EtCN69W3xN7bsRs13
 eOUIhAdswSR+4qnJsQJTYSMKR6b6UKY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-a07LFceiMfKItfLHKqVvjg-1; Thu, 17 Nov 2022 16:39:50 -0500
X-MC-Unique: a07LFceiMfKItfLHKqVvjg-1
Received: by mail-lf1-f71.google.com with SMTP id
 y26-20020a0565123f1a00b004b4b8aabd0cso733266lfa.16
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:39:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L4zGPUJrLWhe164ZndXPGoSFQIhcyrJ68N+dDmJZRm4=;
 b=vred4QiS1yQY8Lwk4PmzZBHvFUYXi372oEMRYTN1n72CAgyWfAdqN8CYiiXO0E7dUh
 W0AksaAiia3OWDGptXOg/22qv0NCwFszmwvOG3JWtx62Dg3uG4Y/SI0I7AttwS+hEXCX
 INDeZPD3b/oR4FOMDaRK4/1XQ/CGPbmfRQvYZ0CclCJOqndMfyRdloj5uPqPHUzQ3CIQ
 QPlu5Ja6bVExqrmE6+mJnXowQrrIxQkody0Lann/W2rmWl0aGbU2bszETVTZE7wGEQ63
 vA7JXl9fYFNxhXs8te8cSj7uRBC20rfuma/vWuhZgWAK6iLX5KrZZ5hSza0RDZKwh5i/
 RhBQ==
X-Gm-Message-State: ANoB5pkF6eun7DZzN4aEPgt7CaWJhnoTNEYSOq+/el5NICOX7IlNiAeq
 uOz0bNel1lzsEaNKYirpbb2kOw7iNXqv6nWlXBXiJMKtSjcSn/LIk3oTsq4ChnIP+VmlPDp8P5A
 OzwmQiAU9hDomwy+0UO0ncy+ryVFWOIaNZsslFHtoYX05
X-Received: by 2002:a2e:9d50:0:b0:26f:db16:4735 with SMTP id
 y16-20020a2e9d50000000b0026fdb164735mr1689175ljj.323.1668721188114; 
 Thu, 17 Nov 2022 13:39:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf51zBvUuJUmnFPjODXoH1qogL6Uq6/RHp7Kgx1Hit5THCMV1GS2JSmMGgpO67SFVuCXb/4L8OyeKjbhep05uWg=
X-Received: by 2002:a2e:9d50:0:b0:26f:db16:4735 with SMTP id
 y16-20020a2e9d50000000b0026fdb164735mr1689168ljj.323.1668721187820; Thu, 17
 Nov 2022 13:39:47 -0800 (PST)
MIME-Version: 1.0
References: <CA+hFU4w8=yTU5tQgqZj4qUvJddAQL9fj5teTVSB_dvNcwCyr6g@mail.gmail.com>
 <20221116143401.3d7621b9@eldfell>
In-Reply-To: <20221116143401.3d7621b9@eldfell>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 17 Nov 2022 22:39:36 +0100
Message-ID: <CA+hFU4z59z=P1pYzmxY=Mz=XWK9_zk7J2FtoKY=QJmztAN8J7Q@mail.gmail.com>
Subject: Re: The state of Quantization Range handling
To: Pekka Paalanen <ppaalanen@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 16, 2022 at 1:34 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Tue, 15 Nov 2022 00:11:56 +0100
> Sebastian Wick <sebastian.wick@redhat.com> wrote:
>
> > There are still regular bug reports about monitors (sinks) and sources
> > disagreeing about the quantization range of the pixel data. In
> > particular sources sending full range data when the sink expects
> > limited range. From a user space perspective, this is all hidden in
> > the kernel. We send full range data to the kernel and then hope it
> > does the right thing but as the bug reports show: some combinations of
> > displays and drivers result in problems.
> >
> > In general the whole handling of the quantization range on linux is
> > not defined or documented at all. User space sends full range data
> > because that's what seems to work most of the time but technically
> > this is all undefined and user space can not fix those issues. Some
> > compositors have resorted to giving users the option to choose the
> > quantization range but this really should only be necessary for
> > straight up broken hardware.
> >
> > Quantization Range can be explicitly controlled by AVI InfoFrame or
> > HDMI General Control Packets. This is the ideal case and when the
> > source uses them there is not a lot that can go wrong. Not all
> > displays support those explicit controls in which case the chosen
> > video format (IT, CE, SD; details in CTA-861-H 5.1) influences which
> > quantization range the sink expects.
> >
> > This means that we have to expect that sometimes we have to send
> > limited and sometimes full range content. The big question however
> > that is not answered in the docs: who is responsible for making sure
> > the data is in the correct range? Is it the kernel or user space?
> >
> > If it's the kernel: does user space supply full range or limited range
> > content? Each of those has a disadvantage. If we send full range
> > content and the driver scales it down to limited range, we can't use
> > the out-of-range bits to transfer information. If we send limited
> > range content and the driver scales it up we lose information.
> >
> > Either way, this must be documented. My suggestion is to say that the
> > kernel always expects full range data as input and is responsible for
> > scaling it to limited range data if the sink expects limited range
> > data.
>
> Hi Sebastian,
>
> you are proposing the that driver/hardware will do either no range
> conversion, or full-to-limited range conversion. Limited-to-full range
> conversion would never be supported.
>
> I still wonder if limited-to-full range conversion could be useful with
> video content.
>
> > Another problem is that some displays do not behave correctly. It must
> > be possible to override the kernel when the user detects such a
> > situation. This override then controls if the driver converts the full
> > range data coming from the client or not (Default, Force Limited,
> > Force Full). It does not try to control what range the sink expects.
> > Let's call this the Quantization Range Override property which should
> > be implemented by all drivers.
>
> In other words, a CRTC "quantization range conversion" property with
> values:
> - auto, with the assumption that color pipeline always produces full-range
> - identity
> - full-to-limited
> (- limited-to-full)
>
> If this property was truly independent of the metadata being sent to
> the sink, and of the framebuffer format, it would allow us to do four
> ways: both full/limited framebuffer on both full/limited sink. It would
> allow us to send sub-blacks and super-whites as well.
>
> More precisely, framebuffers would always have *undefined* quantization
> range. The configuration of the color pipeline then determines how that
> data is manipulated into a video signal.
>
> So I am advocating the same design as with color spaces: do not tell
> KMS what your colorspaces are. Instead tell KMS what operations it
> needs to do with the pixel data, and what metadata to send to the sink.
>
> > All drivers should make sure their behavior is correct:
> >
> > * check that drivers choose the correct default quantization range for
> > the selected mode
>
> Mode implying a quantization range is awkward, but maybe the kernel
> established modes should just have a flag for it. Then userspace would
> know. Unless the video mode system is extended to communicate
> IT/CE/SD/VIC and whatnot to userspace, making the modes better defined.
> Then userspace would know too.
>
> > * whenever explicit control is available, use it and set the
> > quantization range to full
> > * make sure that the hardware converts from full range to limited
> > range whenever the sink expects limited range
> > * implement the Quantization Range Override property
> >
> > I'm volunteering for the documentation, UAPI and maybe even the drm
> > core parts if there is willingness to tackle the issue.
>
> Is it a good idea to put even more automation/magic into configuring
> the color pipeline and metadata for a sink, making them even more
> intertwined?
>
> I would prefer the opposite direction, making thing more explicit and
> orthogonal.

In general I completely agree with this, I just don't think it's
feasible with the current state of KMS. For the color pipeline API [1]
that's exactly the behavior I want but it should be guarded behind a
DRM cap.

For that new API, user space needs direct control over the
quantization range infoframe and the kernel has to somehow tell user
space what quantization range the sink expects for the default
behavior. User space then programs the infoframe when possible and
builds the color pipeline in such a way that the output is whatever
the sink expects.

The issue really is that if we push this all to user space it would be
a backwards incompatible change. So let's fix the current situation in
a backwards compatible way and then get it right for the new API that
user space can opt-into.

Does that make sense?

>
>
> Thanks,
> pq
>
> > Appendix A: Broadcast RGB property
> >
> > A few drivers already implement the Broadcast RGB property to control
> > the quantization range. However, it is pointless: It can be set to
> > Auto, Full and Limited when the sink supports explicitly setting the
> > quantization range. The driver expects full range content and converts
> > it to limited range content when necessary. Selecting limited range
> > never makes any sense: the out-of-range bits can't be used because the
> > input is full range. Selecting Default never makes sense: relying on
> > the default quantization range is risky because sinks often get it
> > wrong and as we established there is no reason to select limited range
> > if not necessary. The limited and full options also are not suitable
> > as an override because the property is not available if the sink does
> > not support explicitly setting the quantization range.
> >
>

[1] https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11

