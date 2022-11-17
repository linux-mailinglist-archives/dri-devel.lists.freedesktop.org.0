Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E682262E68D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 22:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD43886A4;
	Thu, 17 Nov 2022 21:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BC310E684
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 21:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668719622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JdHxCrAA75LHeJjXhCbYjuZBkD6VZt5/PuWa1imaMYE=;
 b=YbaYI/fO5Lv6aSbMysdSMUn9mEUx3vkzZTKTjHXeQ6lzQaqSKSzf1g/7N9jcGKZ6NtYZlH
 KtEkaBG4//2Z2RHCZ2SzpUqGEW1JfJKOrXraGd80voO+bKPI1b+OhGEQ2mtx0X7A1dbJwV
 GESHCGykt/Wukcbs3ycomYpi7NN72U8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-MLV0vETbPWujy_PurSuqFw-1; Thu, 17 Nov 2022 16:13:40 -0500
X-MC-Unique: MLV0vETbPWujy_PurSuqFw-1
Received: by mail-lj1-f199.google.com with SMTP id
 r7-20020a2e8e27000000b00278d0cb565dso1066581ljk.14
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JdHxCrAA75LHeJjXhCbYjuZBkD6VZt5/PuWa1imaMYE=;
 b=QprLLKIKDGXI99iysTMZpubkEaGOvTYSsfBplKQEFZEmucu8u4RepPjp+M9eme8C1n
 X/9V8ZhLwTtDVNhuXd6tPytlKHKgv3tT1JKQYLscmfyXnoIDGeTit0SmHxiWtFc9mETn
 A5wWk2spOGebqs3NMLsB9vXP+2LBZrueZWV5T3LysrIQdef4qj72qV/bKSBSUBej4DL0
 iLcA4qro9oFh4ONb3gVmIKLWY3U5nySjxD1L3yi2/XOWW6ONtvKyN4FGHBVk+0J4YnVk
 AEjBJFZsKcIGASJNNGr9JrmdZ7sZRjc4YV5+hMNemHPoJes6DE8e47vwGUCqW2iz3bgo
 f/7Q==
X-Gm-Message-State: ANoB5pnXbyTW3WBqRbncmduWI2giEdHvlT9SHikHFIf6ozUGgNwdJPgB
 EDNk045F6lBKk5n1+su5Cnig1sMA0Ns/tRIE0BBwmz1E11xSb6ALzUuEMQ6jhxR3Fh7iDlMbtwG
 VO6/J59qkq3JLXiVGCNu/YUASDGFNopF6cJBab2Z26lYF
X-Received: by 2002:a2e:9d50:0:b0:26f:db16:4735 with SMTP id
 y16-20020a2e9d50000000b0026fdb164735mr1668243ljj.323.1668719617922; 
 Thu, 17 Nov 2022 13:13:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4IF/PhJzymY1UBKTZDsgHQ8DrcXkzgs4Ywbj6gvJy9wautQH5r93bv9GHYn+67ejUtafThrX9dlY/myWMnpEs=
X-Received: by 2002:a2e:9d50:0:b0:26f:db16:4735 with SMTP id
 y16-20020a2e9d50000000b0026fdb164735mr1668234ljj.323.1668719617470; Thu, 17
 Nov 2022 13:13:37 -0800 (PST)
MIME-Version: 1.0
References: <CA+hFU4w8=yTU5tQgqZj4qUvJddAQL9fj5teTVSB_dvNcwCyr6g@mail.gmail.com>
 <CAPY8ntCnAjGy0e55raxV=2bgi1YPSringrKdRmJHeS+Li=3yeg@mail.gmail.com>
In-Reply-To: <CAPY8ntCnAjGy0e55raxV=2bgi1YPSringrKdRmJHeS+Li=3yeg@mail.gmail.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 17 Nov 2022 22:13:26 +0100
Message-ID: <CA+hFU4x0PGs-8oUBSXQa9uTNvvW80ZPFnheoBWO0SZnxJ=FKXA@mail.gmail.com>
Subject: Re: The state of Quantization Range handling
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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

Hi Dave,

I noticed that I didn't get the Broadcast RGB property thanks to you
(more below)

On Tue, Nov 15, 2022 at 2:16 PM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Sebastian
>
> Thanks for starting the conversation - it's stalled a number of times
> previously.
>
> On Mon, 14 Nov 2022 at 23:12, Sebastian Wick <sebastian.wick@redhat.com> wrote:
> >
> > There are still regular bug reports about monitors (sinks) and sources
> > disagreeing about the quantization range of the pixel data. In
> > particular sources sending full range data when the sink expects
> > limited range. From a user space perspective, this is all hidden in
> > the kernel. We send full range data to the kernel and then hope it
> > does the right thing but as the bug reports show: some combinations of
> > displays and drivers result in problems.
>
> I'll agree that we as Raspberry Pi also get a number of bug reports
> where sinks don't always look at the infoframes and misinterpret the
> data.
>
> > In general the whole handling of the quantization range on linux is
> > not defined or documented at all. User space sends full range data
> > because that's what seems to work most of the time but technically
> > this is all undefined and user space can not fix those issues. Some
> > compositors have resorted to giving users the option to choose the
> > quantization range but this really should only be necessary for
> > straight up broken hardware.
>
> Wowsers! Making userspace worry about limited range data would be a
> very weird decision in my view, so compositors should always deal in
> full range data.

Making this a user space problem is IMO the ideal way to deal with it
but that's a bit harder to do (I'll answer that in the reply to
Pekka). So let's just assume we all agree that user space only deals
with full range data.

> How would composition of multiple DRM planes work if some are limited
> range and some are full but you want limited range output? Your
> hardware needs to have CSC matrices to convert full range down to
> limited range, and know that you want to use them to effectively
> compose to limited range.
> In fact you can't currently tell DRM that an RGB plane is limited
> range - the values in enum drm_color_range are
> DRM_COLOR_YCBCR_LIMITED_RANGE and DRM_COLOR_YCBCR_FULL_RANGE [1].
>
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
>
> How often have you encountered the out-of-range bits being used?
> Personally I've never come across it. Is it really that common?
> If trying to pass non-video data from the client then you need to pray
> there is no scaling or filtering during composition as it could
> legitimately be corrupted.

All true, and personally I've also never encountered this which is why
I'd like to ignore all of that for now.

>
> > Either way, this must be documented. My suggestion is to say that the
> > kernel always expects full range data as input and is responsible for
> > scaling it to limited range data if the sink expects limited range
> > data.
>
> AIUI That is the current situation. It certainly fits the way that all
> our hardware works.
>
> > Another problem is that some displays do not behave correctly. It must
> > be possible to override the kernel when the user detects such a
> > situation. This override then controls if the driver converts the full
> > range data coming from the client or not (Default, Force Limited,
> > Force Full). It does not try to control what range the sink expects.
>
> Sorry, I'm not clear from the description. Is this a plane, crtc, or
> connector property?
>
> "Data coming from the client" would imply a plane property only -
> effectively extending enum drm_color_range for RGB formats.
>
> If it is a connector property then what do you mean by not controlling
> the range? It doesn't change the AVI Infoframe or GCP and leaves the
> sink thinking it is the default? If so, doesn't that mean this control
> can now make a compliant sink incorrectly render the data? Assuming
> the driver is using drm_hdmi_avi_infoframe_quant_range [2], then the
> sink is likely to be told explicitly that it is one value which is
> then actually wrong.
>
>
> Or is this a flag to tell the crtc to compose all planes to a limited
> range output, thereby updating all the CSC matrices used for RGB and
> YCbCr planes? There's still no guarantee that the composition won't
> clip the video to the specified output range thereby losing the out of
> range values you carefully crafted.
>
> > Let's call this the Quantization Range Override property which should
> > be implemented by all drivers.
> >
> > All drivers should make sure their behavior is correct:
> >
> > * check that drivers choose the correct default quantization range for
> > the selected mode
> > * whenever explicit control is available, use it and set the
> > quantization range to full
> > * make sure that the hardware converts from full range to limited
> > range whenever the sink expects limited range
> > * implement the Quantization Range Override property
> >
> > I'm volunteering for the documentation, UAPI and maybe even the drm
> > core parts if there is willingness to tackle the issue.
> >
> > Appendix A: Broadcast RGB property
> >
> > A few drivers already implement the Broadcast RGB property to control
> > the quantization range. However, it is pointless: It can be set to
> > Auto, Full and Limited when the sink supports explicitly setting the
> > quantization range. The driver expects full range content and converts
> > it to limited range content when necessary. Selecting limited range
> > never makes any sense: the out-of-range bits can't be used because the
> > input is full range.
>
> As above, how real is that use case?

I don't know. Nobody was able to use those bits before so it's hard to
tell but like I said before, I think this can be ignored for now.

>
> > Selecting Default never makes sense: relying on
> > the default quantization range is risky because sinks often get it
> > wrong
>
> Sinks *sometimes* get it wrong. I'd suggest >99.99% of devices follow
> the spec and get it right, and it's only the odd-balls that you need
> an override for.
>
> > and as we established there is no reason to select limited range
> > if not necessary.
>
> Not necessary based on what criteria?
> eg The display's EDID CTA-861 extension block has said that it
> supports VIC 16 for 1080p60. Looking at CTA-861-F (the version I had
> to hand) section 5.1 therefore says that it should be encoded using
> Limited Range as it is a CE video format. The first paragraph does
> state:
> "When present, encoding parameters specified in the AVI Infoframe, or
> other interface-specific controls, shall take precedence over any
> default parameter defined in this sub-section".
> However then section 6.4 (page 58) when describing Q0 and Q1 states:
> "A source shall not send a non-zero Q value that does not correspond
> to the default RGB Quantization Range for the transmitted Picture
> unless the Sink indicates support for the Q bit in a Video
> Capabilities Data Block (see 7.5.6)"
> So if this is being passed back to userspace to choose, it now needs
> to be parsing the EDID to find the VCD block to work out which range
> is permitted.
> At least if this is done within the kernel it is done once (see
> drm_default_rgb_quant_range() [3]) and that implementation should be
> correct.
>
> > The limited and full options also are not suitable
> > as an override because the property is not available if the sink does
> > not support explicitly setting the quantization range.
>
> The property being available or not would be an implementation
> question. I see no conditionals in the i915 HDMI implementation on
> whether "Broadcast RGB" is available or actioned based on the EDID.
>
> Are you looking at this as a programmatically decided value, or as an
> override for dealing with misbehaving sinks?
> My view is that a fully auto mode deals with all devices that follow
> the specs. These controls should only be needed for misbehaving sinks
> or other very specific use cases where the user accepts they can ask
> for something which the sink doesn't support (often deliberately).
> There's no requirement to try and programmatically set them from
> within a compositor or other system app.
>
> This does then hit the issue of DRM requiring an open source project
> implementing any new property. How do you do that when the control is
> really an override for dodgy hardware rather than something that is
> expected to be used programmatically? Time to drop back to a module
> parameter then....
>
> In the Raspberry Pi vendor kernel we have implemented "Broadcast RGB"
> following the i915 pattern (and always effective), and I've yet to
> have anyone report that it doesn't solve the problem with their sink.
> It can make an HDMI analyser complain, but that's due to Q0 & Q1 being
> set to a non-zero and non-default value when the EDID VCD doesn't
> allow it, so not a big deal.

You know what, this confused me because it's not how I thought the
"Broadcast RGB" behaves so I checked the code and it does indeed what
you say. I probably should have done that before.

The only complaint I have is that when the property is set to "Auto"
and the sink can accept full range data, it still might choose limited
range because it follows the default quantization range behavior. The
other two options indeed force the driver to output either limited or
full range content, even if that's not what the sink expects. It's not
good that as a user space developer I have to literally read the code
of a specific kernel driver to understand what a KMS property does.

So I guess what I'm advocating for is to move the Broadcast RGB
property to core DRM, document everything correctly, prefer full range
with "Auto" selected, and implement it for all the drivers.

>
>
> If you're starting a discussion on quantization, then there is also
> the subject of switching between RGB and YCbCr 4:4:4 (or 4:2:2). I'll
> agree it's less common to get a sink only accepting YCbCr, but I
> actually had a support query over just that recently. Some software
> using a Blackmagic Decklink Studio 4K capture card (our HDMI sink)
> could only support YCbCr444 capture, and the software wasn't
> configuring the hardware CSC of the card when fed RGB. It's largely
> the same discussion: is it purely up to the kernel to choose, or does
> userspace get to influence it?
> So far all the discussions seem to have decided that the kernel should
> just make the choice. However there is no system reason for choosing
> YCbCr444 over RGB, and that leaves these stranger use cases out in the
> cold and just not supportable under Linux. Let's go and recommend
> Windows instead as generally this option will be under the advanced
> options of the graphics driver :-(

Yes, that's also on my list of horribly broken things that need fixing.

The other extreme is AMD basically always choosing YCC over RGB to
reduce the bandwidth resulting in bad text rendition.

Then there is the Colorspace infoframe which requires choosing YCC and
RGB color space variants which is literally impossible to do correctly
because user space simply does not know.

>
> Cheers.
>   Dave
>
> [1] https://elixir.bootlin.com/linux/latest/source/include/drm/drm_color_mgmt.h#L84
> [2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_edid.c#L6756
> [3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_edid.c#L5642
>

