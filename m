Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D9B1E214F
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 13:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1197A6E158;
	Tue, 26 May 2020 11:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3B56E158
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 11:52:11 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id b13so2165340vsm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 04:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TdWbJz4fRI4rPPfvBRmvU1nA+Zj/EtsCseD5YyknxoM=;
 b=PbbHA2M2VHZgud/jqIxWp4iT6q/H7tiW5/VFLDOkX4yPSe3dmJN5PKgn3GmdhQjnMV
 J13qIAIGD30vQRHvbOQ7jJ0nJYXQooDINort/GULM6xtsMrT4XdSNjbVFefGAxIuDJLi
 HECWpjZHHrgZNwKBWpsoNyw+XPDcKZgdm+Pq/7sTS43iHsLS6ZPrZ8ThfR+MUIVaxxIJ
 duo5vtiQwi2bXwFgEBOekQT3vrW+ciGlWinQuMCMN/V3nIZjofpHYQiKHcSIFrWXXb+P
 hJvDd1kTuOHcuDBBs4LzOx2be1Ktn10k4BC4DyiiIXiKVrNARpTTjUza6BIP0slCKlIa
 iIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TdWbJz4fRI4rPPfvBRmvU1nA+Zj/EtsCseD5YyknxoM=;
 b=Ws2/jGEDkTYg7n27mSxyvOPN5avIaHBKdp9Dzkzf57d3QZVOwXzgsMGbf3RW/cXpmr
 Rk8sQhOeE6MDV1p07HKfctwMepCX1NPLqp9OzAyyCRDxlYIcUf7DuSARWl03PEOKwhWl
 +LFEmU3H8bGHQoQ33VwoZjVsGESFaD9RpPUSKC9/kZ5/W1FYdzuCtpmxamdCp3yG+Wo8
 rE5WjPxhuRji34Susls/xGyqg/keyUvzeznSLJhwREmINzJOIYIOFWmBguX1+6TrW6m7
 RA4p2jrV9pq+BZr4XJg8z6YT6/498qbt1ItoME2xyJVgNuYqKbFqXUOup/G/oJAa7Kkx
 rpag==
X-Gm-Message-State: AOAM5328/I3N9G1Hc2fujUFfXRiKPxVgKDeE3Qmy4CoJKFtn3l71DxfO
 OIJEXshla9K/d/vhrxYHeD/BoeQuEhBsU3ldw/E=
X-Google-Smtp-Source: ABdhPJxcOPYNQzpzvNRxjwwtw8JKg0ihKVeufHdrGLto+wVF0DbAwUnbbfk0OENNhDramctyMbAJWD+234HBXO7wJjo=
X-Received: by 2002:a67:fa81:: with SMTP id f1mr464645vsq.104.1590493929446;
 Tue, 26 May 2020 04:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
 <20200526103921.0817ee0b@eldfell.localdomain>
In-Reply-To: <20200526103921.0817ee0b@eldfell.localdomain>
From: Yogish Kulkarni <yogishkulkarni@gmail.com>
Date: Tue, 26 May 2020 17:21:58 +0530
Message-ID: <CAL3Fm-+6y3oZ_i+U_pVUe5OzZYO2+RPVWz20DSef0CzuHnzJVA@mail.gmail.com>
Subject: Re: Dynamically change enumeration list of DRM enumeration property
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1593355293=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1593355293==
Content-Type: multipart/alternative; boundary="000000000000aea04905a68bb95e"

--000000000000aea04905a68bb95e
Content-Type: text/plain; charset="UTF-8"

Thanks, Daniel & Pekka.

It might be bad idea to destroy and re-create the connector enum property
from HOTPLUG handler in DRM. But if this is done through
DRM_IOCTL_MODE_GETCONNECTOR, there won't be race, right ? From code walk
through it seems that Weston will call this IOCTL for newly connected
display found through HOTPLUG event and DRM driver will update the EDID
through the call sequence triggered by this IOCTL. On the similar line if
existing connector property is destroyed and re-created with new enmu list
through this IOCTL call chain, then there won't be race ?

Thanks,
-Yogish

On Tue, May 26, 2020 at 1:09 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Tue, 26 May 2020 10:01:23 +0530
> Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:
>
> > Hi,
> >
> > Is it possible to dynamically change enumeration list of  DRM enumeration
> > property ? Motivation behind this question is to understand whether it is
> > possible to create connector enum property (e.g a property which will
> list
> > supported output encodings -  like yuv420, yuv422 etc) whose list of
> > supported enum values could be changed dynamically e.g. based on which
> sink
> > is connected.
> >
> > I think there is existing EDID connector property whose value changes
> based
> > on connected sink. EDID is a BLOB property, I am trying to understand if
> > this is also possible for ENUM type property. There is
> > "drm_property_replace_blob" to replace blob but I wasn't able to find any
> > API which could replace list of supported enums. Alternatively, would it
> be
> > good idea to destroy custom enum property created by a driver and create
> > new enum property with new list of supported enums e.g when there is a
> > HOTPLUG event.
>
> Hi,
>
> looking at Weston code, it *might* cope with it. A hotplug event does
> cause Weston to re-discover all properties of a connector. This is
> specific to connectors only.
>
> The race exists though: userspace might be poking at KMS after you
> changed the property in the kernel but before userspace handles the
> hotplug event. You'd have to check that does not cause regressions. I
> guess for a completely new property, the risk seems low, as userspace
> does not know to poke at it (risk of using outdated property or value
> IDs causing unexpected atomic commit failure). Also I'm not aware of
> any KMS program that would yet attempt blind KMS state save & restore
> to sanitize the KMS state after dropping and re-gaining DRM master.
>
> You'd have to check all other KMS using programs too: every Wayland
> compositor, Xorg, DRM Vulkan WSI(?), ...
>
>
> Thanks,
> pq
>

--000000000000aea04905a68bb95e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, Daniel &amp; Pekka.</div><div><br></div><div>=
It might be bad idea to destroy and re-create the connector enum property f=
rom HOTPLUG handler in DRM. But if this is done through DRM_IOCTL_MODE_GETC=
ONNECTOR, there won&#39;t be race, right ? From code walk through it seems =
that Weston will call this IOCTL for newly connected display found through =
HOTPLUG event and DRM driver will update the EDID through the call sequence=
 triggered by this IOCTL. On the similar line if existing connector propert=
y is destroyed and re-created with new enmu list through this IOCTL call ch=
ain, then there won&#39;t be race ?</div><div><br></div><div>Thanks,</div><=
div>-Yogish<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, May 26, 2020 at 1:09 PM Pekka Paalanen &lt;<a =
href=3D"mailto:ppaalanen@gmail.com">ppaalanen@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 26 May 2020 =
10:01:23 +0530<br>
Yogish Kulkarni &lt;<a href=3D"mailto:yogishkulkarni@gmail.com" target=3D"_=
blank">yogishkulkarni@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hi,<br>
&gt; <br>
&gt; Is it possible to dynamically change enumeration list of=C2=A0 DRM enu=
meration<br>
&gt; property ? Motivation behind this question is to understand whether it=
 is<br>
&gt; possible to create connector enum property (e.g a property which will =
list<br>
&gt; supported output encodings -=C2=A0 like yuv420, yuv422 etc) whose list=
 of<br>
&gt; supported enum values could be changed dynamically e.g. based on which=
 sink<br>
&gt; is connected.<br>
&gt; <br>
&gt; I think there is existing EDID connector property whose value changes =
based<br>
&gt; on connected sink. EDID is a BLOB property, I am trying to understand =
if<br>
&gt; this is also possible for ENUM type property. There is<br>
&gt; &quot;drm_property_replace_blob&quot; to replace blob but I wasn&#39;t=
 able to find any<br>
&gt; API which could replace list of supported enums. Alternatively, would =
it be<br>
&gt; good idea to destroy custom enum property created by a driver and crea=
te<br>
&gt; new enum property with new list of supported enums e.g when there is a=
<br>
&gt; HOTPLUG event.<br>
<br>
Hi,<br>
<br>
looking at Weston code, it *might* cope with it. A hotplug event does<br>
cause Weston to re-discover all properties of a connector. This is<br>
specific to connectors only.<br>
<br>
The race exists though: userspace might be poking at KMS after you<br>
changed the property in the kernel but before userspace handles the<br>
hotplug event. You&#39;d have to check that does not cause regressions. I<b=
r>
guess for a completely new property, the risk seems low, as userspace<br>
does not know to poke at it (risk of using outdated property or value<br>
IDs causing unexpected atomic commit failure). Also I&#39;m not aware of<br=
>
any KMS program that would yet attempt blind KMS state save &amp; restore<b=
r>
to sanitize the KMS state after dropping and re-gaining DRM master.<br>
<br>
You&#39;d have to check all other KMS using programs too: every Wayland<br>
compositor, Xorg, DRM Vulkan WSI(?), ...<br>
<br>
<br>
Thanks,<br>
pq<br>
</blockquote></div>

--000000000000aea04905a68bb95e--

--===============1593355293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1593355293==--
