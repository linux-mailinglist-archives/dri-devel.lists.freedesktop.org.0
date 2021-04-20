Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB023655FD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 12:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09E26E5A0;
	Tue, 20 Apr 2021 10:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D60589BF6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 10:18:14 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 p10-20020a1c544a0000b02901387e17700fso735472wmi.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 03:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cH0rGckPR5nlkuOQYF6RTadD6+Qauh+YmIPVFqFky9o=;
 b=RcickEIDYR3s1X48pURWUIV354SunLbac+wDNG43y0RI1TP6hm7qUTE/LfH+jKMdnc
 9GfBn6WcYCSWdJD42Xo34Qa7tTece1Bockoc8PKq9UPzIvBY9TXbnsBok1TxXWWSwCne
 3ZsydrJABlBU5PTINLlt4znQxlNswNo72g2BRx96ObormZuQcbCSnCHENVhYsC/jM1gL
 xaR8YTA+6sSnOI8EmP6jrVMT3YI4qRVONPUjN0zFGtOCnze8ELUkU/puEYl7w5m9PvvI
 S4KkaAwLYsSpEyAmfaf/2R87iqw3Mi4FJu0JG3BHFlI16oZ7VqPt7qaZDak0kDyxTqgw
 JrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cH0rGckPR5nlkuOQYF6RTadD6+Qauh+YmIPVFqFky9o=;
 b=bYkOowfXlizYEVWLhtGdzzH0cvRzDjgK4XxzycucI0fz3EkrX9vITCLtql7tOPXGyU
 +XHp4wkO3HRMlfRGVOGkwaOMn/tw1MFtql1PNm6wy2msLmi56Ot25q9MrsMH8ghbY0Jr
 oN4bmUc0ykgfPAc5tH79/csqsHZVU34AORVTF06joypwaoyXjFAscE1YCIhIFwU13enE
 gqtVDf6EuD3K5IfOp2Eh+Evu+ljIPQYAmyY6eORdSfIJbK1f+FROtLsVq35xYWusFRv9
 CiBUN9rw8pUR3Wnwl/PcWp0bEoOS4gumqFlP+2SgHiLBdocejekFqgUdFvjROmATJTrc
 0LQg==
X-Gm-Message-State: AOAM532gUhayzetuic2yCCKnkx1iJRwsJ4X1wB0f9Tki30FdVqtehC45
 O/bADbQybZymmgYpHa+Lw4klvXrucaxLt7Vzi1Lydw==
X-Google-Smtp-Source: ABdhPJwZ6YcGi0ysxPtRYaIWFxwOhLL4POauABx1AfIjBMPM0b9kk1GnikHfwflbhfZbeoQ+31qMaWpgfFpYo5kGCbs=
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr3812575wmj.84.1618913892675;
 Tue, 20 Apr 2021 03:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <a28f2wvjsZ0pMcKjyC4C5DgvT59Bn32JORf1DdTei3818_ZXYRGV19m5IpaWqELPeDNPSj2SRbMznfuCrCYmO0mLtpaxN5MprB3QRk3Isww=@emersion.fr>
In-Reply-To: <a28f2wvjsZ0pMcKjyC4C5DgvT59Bn32JORf1DdTei3818_ZXYRGV19m5IpaWqELPeDNPSj2SRbMznfuCrCYmO0mLtpaxN5MprB3QRk3Isww=@emersion.fr>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Apr 2021 11:17:26 +0100
Message-ID: <CAPj87rO_DJtq6_XO400FK2u97CWXDo5Px21Q+svAPg8r+WEuCg@mail.gmail.com>
Subject: Re: Split render/display SoCs, Mesa's renderonly,
 and Wayland dmabuf hints
To: Simon Ser <contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============0286788301=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0286788301==
Content-Type: multipart/alternative; boundary="0000000000007ec73005c064c3b8"

--0000000000007ec73005c064c3b8
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 19 Apr 2021 at 13:06, Simon Ser <contact@emersion.fr> wrote:

> I'm working on a Wayland extension [1] that, among other things, allows
> compositors to advertise the preferred device to be used by Wayland
> clients.
>
> In general, compositors will send a render node. However, in the case
> of split render/display SoCs, things get a little bit complicated.
>
> [...]
>

Thanks for the write-up Simon!


> There are a few solutions:
>
> 1. Require compositors to discover the render device by trying to import
>    a buffer. For each available render device, the compositor would
>    allocate a buffer, export it as a DMA-BUF, import it to the
>    display-only device, then try to drmModeAddFB.
>

I don't think this is actually tractable? Assuming that 'allocate a buffer'
means 'obtain a gbm_device for the render node directly and allocate a
gbm_bo from it', even with compatible formats and modifiers this will fail
for more restrictive display hardware. imx-drm and pl111 (combined with vc4
on some Raspberry Pis) will fail this, since they'll take different
allocation paths when they're bound through kmsro vs. directly, accounting
for things like contiguous allocation. So we'd get false negatives on at
least some platforms.


> 2. Allow compositors to query the render device magically opened by
>    kmsro. This could be done either via EGL_EXT_device_drm, or via a
>    new EGL extension.
>

This would be my strong preference, and I don't entirely understand
anholt's pushback here. The way I see it, GBM is about allocation for
scanout, and EGL is about rendering. If, on a split GPU/display system, we
create a gbm_device from a KMS display-only device node, then creating an
EGLDisplay from that magically binds us to a completely different DRM GPU
node, and anything using that EGLDisplay will use that GPU device to render.

Being able to discover the GPU device node through the device query is
really useful, because it tells us exactly what implicit magic EGL did
under the hood, and about the device that EGL will use. Being able to
discover the display node is much less useful; it does tell us how GBM will
allocate buffers, but the user already knows which device is in use because
they supplied it to GBM. I see the display node as a property of GBM, and
the GPU node as a property of EGL, even if EGL does do (*waves hands*)
stuff under the hood to ensure the two are compatible.

If we had EGL_EXT_explicit_device, things get even more weird, I think;
would the device query on an EGLDisplay created with a combination of a
gbm_device native display handle and an explicit EGLDevice handle return
the scanout device from GBM or the GPU device from EGL? On my reading, I'd
expect it to be the latter; if the queries returned very different things
based on whether GPU device selection was implicit (returning the KMS node)
or explicit (GPU node), that would definitely violate the principle of
least surprise.


> 3. Allow compositors to query the kernel drivers to know which devices
>    are compatible with each other. Some uAPI to query a compatible
>    display device from a render-only device, or vice-versa, has been
>    suggested in the past.
>

What does 'compatible' mean? Would an Intel iGPU and and AMD dGPU be
compatible with each other? Would a Mali GPU bound to system memory through
AMBA be as compatible with the display controller as it would with an AMD
GPU on PCIE? I think a query which only exposed whether or not devices
could share dmabufs with each other is far too generic to be helpful for
the actual usecase we have, as well as not being useful enough for other
usecases ('well you _can_ use dmabufs from your AMD GPU on your Mali GPU,
but only if they were allocated in the right domain').


> (1) has a number of limitations and gotchas. It requires allocating
> real buffers, this has a rather big cost for something done at
> compositor initialization time. It requires to select a buffer format
> and modifier compatible with both devices, so it can't be isolated in
> a simple function (and e.g. shared between all compositors in libdrm).
>

We're already going to have to do throwaway allocations to make Intel's
tiled modes work; I'd rather not extend this out to doing throwaway
allocations across device combinations as well as modifier lists.


> Some drivers will allow to drmModeAddFB buffers that can't be scanned
> out, and will only reject the buffer at atomic commit time.
>

This is 100% a KMS driver bug and should be fixed there. It's not
catastrophic, since commits can fail for any reason or none at all and
compositors are expected to handle this, but they should absolutely be
rejecting buffers which can never be scanned out at all at AddFB time.


> (2) wouldn't work with non-EGL APIs such as Vulkan. Eric Anholt seemed
> pretty opposed to this idea, but I didn't fully understood why.
>

Well, Vulkan doesn't have GBM in the same way, right? In the Vulkan case,
we already know exactly what the GPU is, because it's the VkPhysicalDevice
you had to explicitly select to create the VkDevice etc; if you're using
GBM it's because you've _also_ created a gbm_device for the KMS node and
are allocating gbm_bos to import to VkDeviceMemory/VkImage, so you already
have both pieces of information. (If you're creating VkDeviceMemory/VkImage
in Vulkan then exporting dmabuf from there, since there's no way to specify
a target device, it's a blind guess as to whether it'll actually work for
KMS. Maybe it will! But maybe not.)


> I don't know how feasible (3) is. The kernel drivers must be able to
> decide whether buffers coming from another driver can be scanned out,
> but how early can they give an answer? Can they give an answer solely
> based on a DRM node, and not a DMA-BUF?
>

Maybe! But maybe not.


> Feedback is welcome. Do you agree with the premise that compositors
> need access to the render node?


Yes, strongly. Compositors may optimise for direct paths (e.g. direct
scanout of client buffers through KMS, directly providing client buffers to
media codecs for streaming) where possible. But they must always have a
'device of last resort': if these optimal paths are not possible (your
codec doesn't like your client buffers, you can't do direct scanout because
a notification occluded your client content and you've run out of overlay
planes, you're on Intel and your display FIFO size is measured in bits),
the compositor needs to know that it can access the client buffers somehow.

This is done by always importing into a GPU device - for most current
compositors as an EGLImage, for some others as a VkImage - and falling back
to GL composition paths, or GL blits, or even ReadPixels if strictly
necessary, so your client content continues to be accessible.

There is no way to do this without telling the client what that GPU device
node is, so it can allocate accordingly. Thanks to the implicit device
selection performed when creating an EGLDisplay from a gbm_device, we
cannot currently discover what that device node is.


> Do you have any other potential solution in mind?


I can't think of any right now, but am open to hearing them.


> Which solution would you prefer?


For all the reasons above, strongly #2, i.e. that querying the DRM device
node from the EGLDevice returned by querying an EGLDisplay created from a
gbm_device, returns the GPU device's render node and not the KMS device's
primary node.

Cheers,
Daniel

--0000000000007ec73005c064c3b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, 19 Apr 2021 at 13:06, Simon Se=
r &lt;<a href=3D"mailto:contact@emersion.fr">contact@emersion.fr</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I&#39;m wor=
king on a Wayland extension [1] that, among other things, allows<br>
compositors to advertise the preferred device to be used by Wayland<br>
clients.<br>
<br>
In general, compositors will send a render node. However, in the case<br>
of split render/display SoCs, things get a little bit complicated.<br>
<br>[...]<br></blockquote><div><br></div><div>Thanks for the write-up Simon=
!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
here are a few solutions:<br>
<br>
1. Require compositors to discover the render device by trying to import<br=
>
=C2=A0 =C2=A0a buffer. For each available render device, the compositor wou=
ld<br>
=C2=A0 =C2=A0allocate a buffer, export it as a DMA-BUF, import it to the<br=
>
=C2=A0 =C2=A0display-only device, then try to drmModeAddFB.<br></blockquote=
><div><br></div><div>I don&#39;t think this is actually tractable? Assuming=
 that &#39;allocate a buffer&#39; means &#39;obtain a gbm_device for the re=
nder node directly and allocate a gbm_bo from it&#39;, even with compatible=
 formats and modifiers this will fail for more restrictive display hardware=
. imx-drm and pl111 (combined with vc4 on some Raspberry Pis) will fail thi=
s, since they&#39;ll take different allocation paths when they&#39;re bound=
 through kmsro vs. directly, accounting for things like contiguous allocati=
on. So we&#39;d get false negatives on at least some platforms.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
2. Allow compositors to query the render device magically opened by<br>
=C2=A0 =C2=A0kmsro. This could be done either via EGL_EXT_device_drm, or vi=
a a<br>
=C2=A0 =C2=A0new EGL extension.<br></blockquote><div><br></div><div>This wo=
uld be my strong preference, and I don&#39;t entirely understand anholt&#39=
;s pushback here. The way I see it, GBM is about allocation for scanout, an=
d EGL is about rendering. If, on a split GPU/display system, we create a gb=
m_device from a KMS display-only device node, then creating an EGLDisplay f=
rom that magically binds us to a completely different DRM GPU node, and any=
thing using that EGLDisplay will use that GPU device to render.</div><div><=
br></div><div>Being able to discover the GPU device node through the device=
 query is really useful, because it tells us exactly what implicit magic EG=
L did under the hood, and about the device that EGL will use. Being able to=
 discover the display node is much less useful; it does tell us how GBM wil=
l allocate buffers, but the user already knows which device is in use becau=
se they supplied it to GBM. I see the display node as a property of GBM, an=
d the GPU node as a property of EGL, even if EGL does do (*waves hands*) st=
uff under the hood to ensure the two are compatible.</div><div><br></div><d=
iv>If we had EGL_EXT_explicit_device, things get even more weird, I think; =
would the device query on an EGLDisplay created with a combination of a gbm=
_device native display handle and an explicit EGLDevice handle return the s=
canout device from GBM or the GPU device from EGL? On my reading, I&#39;d e=
xpect it to be the latter; if the queries returned very different things ba=
sed on whether GPU device selection was implicit (returning the KMS node) o=
r explicit (GPU node), that would definitely violate the principle of least=
 surprise.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
3. Allow compositors to query the kernel drivers to know which devices<br>
=C2=A0 =C2=A0are compatible with each other. Some uAPI to query a compatibl=
e<br>
=C2=A0 =C2=A0display device from a render-only device, or vice-versa, has b=
een<br>
=C2=A0 =C2=A0suggested in the past.<br></blockquote><div><br></div><div>Wha=
t does &#39;compatible&#39; mean? Would an Intel iGPU and and AMD dGPU be c=
ompatible with each other? Would a Mali GPU bound to system memory through =
AMBA be as compatible with the display controller as it would with an AMD G=
PU on PCIE? I think a query which only exposed whether or not devices could=
 share dmabufs=C2=A0with each other is far too generic to be helpful for th=
e actual usecase=C2=A0we have, as well as not being useful enough for other=
 usecases (&#39;well you _can_ use dmabufs from your AMD GPU on your Mali G=
PU, but only if they were allocated in the right domain&#39;).</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
(1) has a number of limitations and gotchas. It requires allocating<br>
real buffers, this has a rather big cost for something done at<br>
compositor initialization time. It requires to select a buffer format<br>
and modifier compatible with both devices, so it can&#39;t be isolated in<b=
r>
a simple function (and e.g. shared between all compositors in libdrm).<br><=
/blockquote><div><br></div><div>We&#39;re already going to have to do throw=
away allocations to make Intel&#39;s tiled modes work; I&#39;d rather not e=
xtend this out to doing throwaway allocations across device combinations as=
 well as modifier lists.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
Some drivers will allow to drmModeAddFB buffers that can&#39;t be scanned<b=
r>
out, and will only reject the buffer at atomic commit time.<br></blockquote=
><div><br></div><div>This is 100% a KMS driver bug and should be fixed ther=
e. It&#39;s not catastrophic, since commits can fail for any reason or none=
 at all and compositors are expected to handle this, but they should absolu=
tely be rejecting buffers which can never be scanned out at all at AddFB ti=
me.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
(2) wouldn&#39;t work with non-EGL APIs such as Vulkan. Eric Anholt seemed<=
br>
pretty opposed to this idea, but I didn&#39;t fully understood why.<br></bl=
ockquote><div><br></div><div>Well, Vulkan doesn&#39;t have GBM in the same =
way, right? In the Vulkan case, we already know exactly what the GPU is, be=
cause it&#39;s the VkPhysicalDevice you had to explicitly select to create =
the VkDevice=C2=A0etc; if you&#39;re using GBM it&#39;s because you&#39;ve =
_also_ created a gbm_device for the KMS node and are allocating gbm_bos to =
import to VkDeviceMemory/VkImage, so you already have both pieces of inform=
ation. (If you&#39;re creating VkDeviceMemory/VkImage in Vulkan then export=
ing dmabuf from there, since there&#39;s no way to specify a target device,=
 it&#39;s a blind guess as to whether it&#39;ll actually work for KMS. Mayb=
e it will! But maybe not.)</div><div><span style=3D"">=C2=A0</span></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
I don&#39;t know how feasible (3) is. The kernel drivers must be able to<br=
>
decide whether buffers coming from another driver can be scanned out,<br>
but how early can they give an answer? Can they give an answer solely<br>
based on a DRM node, and not a DMA-BUF?<br></blockquote><div><br></div><div=
>Maybe! But maybe not.</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
Feedback is welcome. Do you agree with the premise that compositors<br>
need access to the render node?</blockquote><div><br></div><div>Yes, strong=
ly. Compositors may optimise for direct paths (e.g. direct scanout of clien=
t buffers through KMS, directly providing client buffers to media codecs fo=
r streaming) where possible. But they must always have a &#39;device of las=
t resort&#39;: if these optimal paths are not possible (your codec doesn&#3=
9;t like your client buffers, you can&#39;t do direct scanout because a not=
ification occluded your client content and you&#39;ve run out of overlay pl=
anes, you&#39;re on Intel and your display FIFO size is measured in bits), =
the compositor needs to know that it can access the client buffers somehow.=
</div><div><br></div><div>This is done by always importing into a GPU devic=
e - for most current compositors as an EGLImage, for some others as a VkIma=
ge - and falling back to GL composition paths, or GL blits, or even ReadPix=
els if strictly necessary, so your client content continues to be accessibl=
e.</div><div><br></div><div>There is no way to do this without telling the =
client what that GPU device node is, so it can allocate accordingly. Thanks=
 to the implicit device selection performed when creating an EGLDisplay fro=
m a gbm_device, we cannot currently discover what that device node is.</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Do you =
have any other potential solution in mind?</blockquote><div><br></div><div>=
I can&#39;t think of any right now,=C2=A0but am open to hearing them.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Which so=
lution would you prefer?</blockquote><div><br></div><div>For all the reason=
s above, strongly #2, i.e. that querying the DRM device node from the EGLDe=
vice returned by querying an EGLDisplay created from a gbm_device, returns =
the GPU device&#39;s render node and not the KMS device&#39;s primary node.=
</div><div><br></div><div>Cheers,</div><div>Daniel</div></div></div>

--0000000000007ec73005c064c3b8--

--===============0286788301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0286788301==--
