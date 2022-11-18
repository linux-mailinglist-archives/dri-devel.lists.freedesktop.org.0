Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CF162F9BC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 16:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EFF10E746;
	Fri, 18 Nov 2022 15:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617AC893ED
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 15:53:46 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id vv4so4737871ejc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 07:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FyQ+14zvMT7VrA4M4I6XAMtkyyEu3ioJESJ13Q+Vqf8=;
 b=eekqTE+rr8QVkOYasZ547zEzqYQJ75Jj7j/ekWxNd49skSOwRLUWM80yh6Vo5E7JpG
 HX0PjzCRxtnaO20bK7QSeKUB3atS+2nC/Pt65G/edR+XxQTvrJp3ukgL43QKpWzZG7VB
 okw/uTtcwK215rgKs52znnBxR5J1JsdQgccS11HyYeAWvIelQsI90hKNvo5ZX/ocKL6v
 yvAKRwIELDYLjocqt00jYrkDuD95s/EX2dJEdRMaFTys0H+Rpsv4fUL+YBgqeKAdDXep
 IPwuLQNqHzgUzdKnyHWfzZoerpSvlZHXE7p7t3PGRCyERyiwcR5wwIbW8t4ti9xlax8o
 NBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FyQ+14zvMT7VrA4M4I6XAMtkyyEu3ioJESJ13Q+Vqf8=;
 b=jbFGLVx5nHFwsi/vmtXcK3o7kV6mTcfwzhpSysC4ckY0aZnKjBcnMBUOA6Syq7jraC
 wAzmXyuCInjb92M4l3i9theX4XbexWNnChFS7DwEbOokDj7UU7pcF7Sj11s5lF4safAF
 +jDYjhzwgtDN+CtgEZIU2OB+da+EuO5I6fnfzX4F1ATVf7GGtmulK9O21OJviawgEHmQ
 k9rD0gaVwDnq39aWlS2zzjsXQYy2vMLomkEl6b08w0NA5Qbtq6zSUenoBwo3C6+1yQnT
 e55iLLKLSTBb8HAIMlGxNZKMO2oUQM9gMiEAe/dTgAD82eXJJWMcbIRHbD3oF44cF4WM
 xzdA==
X-Gm-Message-State: ANoB5plFpfNe/1QOHpeIZiHvJEWpzCNs89WvmVJeZ5rwzxwThH9J//QK
 bDgI5mykKdc9dI8p2Wc4Y7CUZbAEljMuoKVIBhxXYA==
X-Google-Smtp-Source: AA0mqf7W3nP3ZRA5KM+bVG3VDwcuhtvxumaMqp2wKHT5+9vU6ly5a3esrxrdTPS2uA42Xt7n3Co1nmThoU1FrS1DbCE=
X-Received: by 2002:a17:906:6a0c:b0:7ad:9f03:aa46 with SMTP id
 qw12-20020a1709066a0c00b007ad9f03aa46mr6709076ejc.175.1668786824808; Fri, 18
 Nov 2022 07:53:44 -0800 (PST)
MIME-Version: 1.0
References: <CA+hFU4w8=yTU5tQgqZj4qUvJddAQL9fj5teTVSB_dvNcwCyr6g@mail.gmail.com>
 <CAPY8ntCnAjGy0e55raxV=2bgi1YPSringrKdRmJHeS+Li=3yeg@mail.gmail.com>
 <CA+hFU4x0PGs-8oUBSXQa9uTNvvW80ZPFnheoBWO0SZnxJ=FKXA@mail.gmail.com>
 <20221118121530.23c7c3ee@eldfell>
In-Reply-To: <20221118121530.23c7c3ee@eldfell>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Nov 2022 15:53:29 +0000
Message-ID: <CAPY8ntCux_s-iNaYSH4Fs+kwNAiSfTat5saT0jiDcxaVwpGp=g@mail.gmail.com>
Subject: Re: The state of Quantization Range handling
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka

On Fri, 18 Nov 2022 at 10:15, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Thu, 17 Nov 2022 22:13:26 +0100
> Sebastian Wick <sebastian.wick@redhat.com> wrote:
>
> > Hi Dave,
> >
> > I noticed that I didn't get the Broadcast RGB property thanks to you
> > (more below)
> >
> > On Tue, Nov 15, 2022 at 2:16 PM Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> > >
> > > Hi Sebastian
> > >
> > > Thanks for starting the conversation - it's stalled a number of times
> > > previously.
> > >
> > > On Mon, 14 Nov 2022 at 23:12, Sebastian Wick <sebastian.wick@redhat.com> wrote:
> > > >
> > > > There are still regular bug reports about monitors (sinks) and sources
> > > > disagreeing about the quantization range of the pixel data. In
> > > > particular sources sending full range data when the sink expects
> > > > limited range. From a user space perspective, this is all hidden in
> > > > the kernel. We send full range data to the kernel and then hope it
> > > > does the right thing but as the bug reports show: some combinations of
> > > > displays and drivers result in problems.
> > >
> > > I'll agree that we as Raspberry Pi also get a number of bug reports
> > > where sinks don't always look at the infoframes and misinterpret the
> > > data.
> > >
> > > > In general the whole handling of the quantization range on linux is
> > > > not defined or documented at all. User space sends full range data
> > > > because that's what seems to work most of the time but technically
> > > > this is all undefined and user space can not fix those issues. Some
> > > > compositors have resorted to giving users the option to choose the
> > > > quantization range but this really should only be necessary for
> > > > straight up broken hardware.
> > >
> > > Wowsers! Making userspace worry about limited range data would be a
> > > very weird decision in my view, so compositors should always deal in
> > > full range data.
> >
> > Making this a user space problem is IMO the ideal way to deal with it
> > but that's a bit harder to do (I'll answer that in the reply to
> > Pekka). So let's just assume we all agree that user space only deals
> > with full range data.
>
> Limited range was invented for some reason, so it must have some use
> somewhere, at least in the past. Maybe it was needed to calibrate mixed
> digital/analog video processing chains with test images that needed to
> contain sub-blacks and super-whites, to make sure that sub-blacks come
> out as the nominal black etc. Just because desktop computers do not
> seem to have any need for limited range, I personally wouldn't be as
> arrogant as to say it's never useful. Maybe there are professional
> video/broadcasting needs that currently can only be realized with
> proprietary OS/hardware, because Linux just can't do it today?
>
> Why would TVs support limited range, if it was never useful? Why would
> video sources produce limited range if it was always strictly inferior
> to full range?
>
> Even digital image processing algorithms might make use of
> out-of-unit-range values, not just analog circuitry for overshoot.
>
> But no, I can't give a real example, just speculation. Hence it's fine
> by me to discard limited range processing for now. Still, what I
> explain below would allow limited range processing without any extra
> complexity by making the KMS color pipeline better defined and less
> limiting for userspace.

AIUI limited range comes from the analogue world, or possibly creative
(film/TV) world, hence being used on Consumer devices rather than IT
ones (CTA and CEA modes vs VESA and DMT modes).

YCbCr output from video codecs typically uses a range of 16-235,
therefore a media player wanting to pass the decoded video out to the
display exactly as-is needs to be able to signal that to the display
for it to be interpreted correctly.
HDMI extended DVI. I believe both YCbCr support and range control were
added to the HDMI spec at the same time, presumably to allow for this
use case. Limited range RGB seems to be a bit of a quirk though.

Just to be annoying, JPEG uses full range YCbCr.

> > > How would composition of multiple DRM planes work if some are limited
> > > range and some are full but you want limited range output? Your
> > > hardware needs to have CSC matrices to convert full range down to
> > > limited range, and know that you want to use them to effectively
> > > compose to limited range.
> > > In fact you can't currently tell DRM that an RGB plane is limited
> > > range - the values in enum drm_color_range are
> > > DRM_COLOR_YCBCR_LIMITED_RANGE and DRM_COLOR_YCBCR_FULL_RANGE [1].
>
> Yeah, that's because range conversion has been conflated with
> YUV-to-RGB conversion, and the result is always full-range RGB in
> practise, AFAIU. There is no way to feed limited range color into the
> further color pipeline in KMS, but that's actually a good thing.(*)
>
> The following is my opinion of the future, as someone who has been
> thinking about how to make HDR work on Wayland while allowing the
> display quality and hardware optimizations that Wayland was designed
> for:
>
>
> Userspace should not tell KMS about a plane being limited range at all.
> The reason is the same why userspace should not tell KMS about what
> colorspace a plane is in.
>
> Instead, userspace wants to program specific mathematical operations
> into KMS hardware without any associated or implied semantics. It's
> just math. The actual semantics have been worked out by userspace
> before-hand. This allows to use the KMS hardware to its fullest effect,
> even for things the hardware or KMS UAPI designers did not anticipate.
>
> IMO, framebuffers and KMS planes should ultimately be in undefined
> quantization range, undefined color space, and undefined dynamic range.
> The correct processing of the pixel values is programmed by per-plane
> KMS properties like CTM, LUT, and more specialized components like
> quantization range converter or YUV-to-RGB converter (which is just
> another CTM at a different point, really) where userspace explicitly
> programs the *operation*, and not the input and output types hoping the
> driver and hardware does something sensible.

How do you describe the functionality available on constrained
hardware that has fixed matrices for YUV to RGB conversions using the
normal BT601 and 709?
Or hardware that has no per plane matrix for RGB? (I believe vc4 fits
into this category).

I'd also propose that you need a load of helpers so that the "normal"
use cases of eg BT601 YCbCr to the default composition space is
handled for simply. Otherwise the enforced complexity to userspace has
just exploded.

Or seeing as properties like COLOR_ENCODING and COLOR_RANGE already
exist in the UAPI, add a "custom" mode to those that will enable all
your other magic properties.

> In that design, there is no problem at all to blend multiple planes of
> differing quantization ranges together. Userspace first chooses the
> blending space, a radiometrically linear RGB limited range BT.709 space
> for example, and then programs each plane to produce exactly that. Then
> CRTC properties are programmed to produce the desired type of output
> signal. Finally, connector properties are programmed to send the
> appropriate metadata to the sink. Of course, userspace takes the sink
> capabilities into account before deciding all this.
>
> The thing KMS UAPI is missing are the per-plane properties.

And hardware support on many platforms.
I've just checked, and vc4 always composes to RGB. Things like YCbCr
for HDMI are handled in the HDMI tx block. How do we tell userspace
that it has no choice over the blending space?

If you're trying to make things totally comprehensive, please don't
miss out chroma-siting as that is another property that is missing
from KMS for YCbCr planes.
MPEG-2, MPEG-4 and H264 differ from JPEG and MPEG-1 in default
chroma-siting, and HEVC differs again.

Conversion of HDR to/from SDR is going to be an interesting problem on
many platforms. I won't claim enough knowledge on the subject, but
obviously there needs to be a choice made over which mode composition
should happen in, and other planes will need to be converted. Is that
conversion going to be totally generic?


Lots of questions posed by this discussion, but I'm not sure that they
are specifically relevant to HDMI quantization ranges at this stage.
All RGB buffers should be full range, and full/limited range
conversion should be controlled via a similar mechanism to "Broadcast
RGB" but in the KMS core.

Checking drm_hdmi_avi_infoframe_quant_range(), it already does the
correct thing with regard to the EDID VCD block and signalling the
quantization range. The implementation of range choice on i915 (and
vendor vc4 tree) could be improved to also check
display_info->rgb_quant_range_selectable and choose FULL even for CEA
modes if the display allows it, but that may expose more compatibility
issues with monitors where the EDID is a little iffy.

Cheers
  Dave

> (*) The reason it is a good thing that one cannot have limited range
> framebuffers is that it would raise problems on how to handle pixel
> values outside of the nominal range, that is, the sub-black and
> super-white channel values. The immediate problem is that LUT stages
> need normalized input and they cannot extrapolate. So if nominal
> quantization range is normalized to 0.0-1.0 for LUT input, sub-black
> would be negative values and super-white would be greater than 1.0
> values, which a LUT cannot sensibly handle. That makes the whole
> concept of limited range problematic in the color pipeline. But, if the
> color pipeline elements like LUTs are defined *as if* the data was
> always full range, it becomes well-defined and useful how the elements
> work, and userspace can produce a proper programming that is guaranteed
> to work.
>
> By completely removing the concept of quantization range and its
> "automatic" handling from the KMS color pipeline and adding processing
> elements to do scaling+offset at suitable stages, we gain the ability
> to accept, process, blend, and produce pixels in any quantization
> range, color space or dynamic range at will.
>
> Another thing such an approach solves is how to interpret
> floating-point pixel data which can naturally represent
> out-of-unit-range values.
>
>
> Thanks,
> pq
>
> > > Cheers.
> > >   Dave
> > >
> > > [1] https://elixir.bootlin.com/linux/latest/source/include/drm/drm_color_mgmt.h#L84
> > > [2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_edid.c#L6756
> > > [3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_edid.c#L5642
> > >
> >
>
