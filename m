Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F801760B7C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F036C10E3A2;
	Tue, 25 Jul 2023 07:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895D610E339;
 Mon, 24 Jul 2023 17:16:03 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id F30DA5C0176;
 Mon, 24 Jul 2023 13:16:00 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute2.internal (MEProxy); Mon, 24 Jul 2023 13:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dymek.me; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1690218960; x=1690305360; bh=id
 Kj2ASfwZqfnrjhLGpjl4JQ0T7IJDG1zW5qQpC4ECI=; b=QEjCHRoR6eYizkYa+k
 HmzSrm9w4HKrHrnOuIl2Ng4syPK3n8YLqXP7VyG+Vs5znh0upjGLbH2MgTAxyf5A
 N3IhpvkAbP5W6AYeEP5iGMrbfHsyBwKi5lPiEoN5Oj2xwa2NUBjeCMOFXNF5NHP9
 UpxJWUrJ5fVR5lZGa7u0jw/jM5wJjm9owF7/V96NrvRk6ea7KXG3tpLsAx7P+EUG
 2wSZzKw3LV96XbkKQCkz3hA3+IAGuuoSFYAK41qexdldzQA0CI7W1zyvNpszbN8o
 itJex4PGGBSQO05KjoSm4N4bTDnB2ycLyp0op/b388Pt6KhGrHUFxCmRQdk1eS3/
 hLfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1690218960; x=1690305360; bh=idKj2ASfwZqfn
 rjhLGpjl4JQ0T7IJDG1zW5qQpC4ECI=; b=OqhOPFFlJAz+CnNuhmlFuClvbjrtd
 J6m1ASuMFteSdYh1BulFPuSHr54g4Ew1OaAEuuuD/YE6ADqpdh7Pr8dXRUMXSqsu
 IzM3eUR/82EP9+q/oReZkc9Gh0e77hlKxNnnOENpJguvbPHIFVAW6TfVgNj58JzO
 3kgqES2BUHXG/XpcFK5dXMdwPzIB1jVZOV4ClvztoSGGItacyN4ECfWfWtqinfHi
 HxFnsw3kD1BRzUm/3kdZFCgEGtHB347kheT+CJHEosWANV6skSA+P5QTm0PI8Dst
 s0uCMkn/CweLBaaOQ3rNT9GLWeb0XvE8HKQwp1dPhHJl5lhMIOL5cPt4g==
X-ME-Sender: <xms:z7G-ZCOvlgDQWV-ybtxO33cGJ3WPP7iloSuRrJ3kJY9LjKqMY5c03Q>
 <xme:z7G-ZA8gvLc0jedJImdUZx3dWjtfC6laRbCjrRvw02iHsQPIkmv567cYix7BhZ9uY
 xmnHy8_RAmB1UhBWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrheekgddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvvefutgesrg
 dtreerreerjeenucfhrhhomhepfdforghrkhcuffihmhgvkhdfuceomhgrrhhkseguhihm
 vghkrdhmvgeqnecuggftrfgrthhtvghrnhepgfeuudefveegueelfeekueeuteevuedvff
 dvkedtveeuteegvddtveetfeefkedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepmhgrrhhkseguhihmvghkrdhmvg
X-ME-Proxy: <xmx:0LG-ZJR4G8eXKgBeZJQ9xWT4CfdDJo1hdaj7Fzu3B72Qg-Zo7Dt8Tg>
 <xmx:0LG-ZCu7WjrDvdn0g5RESpalgzqUOIQeMPwG63J1TadbfatQlvR2OA>
 <xmx:0LG-ZKcXsm4Z-aq4a42IANf5e5dDJOCE1RxMwp341D2fmP1BUmXzNg>
 <xmx:0LG-ZCQj6nrVnYyOoHMALlaeQ0T6RstHerfaaMandl0cHPHV6Iy7aQ>
Feedback-ID: ia4a1448b:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DE414A60077; Mon, 24 Jul 2023 13:15:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <6f8d6649-5b53-4a44-8b9e-0ffd00af3fb6@app.fastmail.com>
In-Reply-To: <f25017a660f8a3a4e49258a1d96003dc@208suo.com>
References: <tencent_0FA6AE16A21AAA2E9481C6FE598BA70CC405@qq.com>
 <f25017a660f8a3a4e49258a1d96003dc@208suo.com>
Date: Mon, 24 Jul 2023 13:15:39 -0400
From: "Mark Dymek" <mark@dymek.me>
To: huzhi001@208suo.com, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [Nouveau] [PATCH] drm/nouveau/fifo:Fix Nineteen occurrences of the
 gk104.c error: ERROR: space prohibited before that ':' (ctx:WxW) ERROR:
 trailing statements should be on next line ERROR: space prohibited
 before that ':' (ctx:WxW) ERROR: trailing statements should be on next
 line ERROR: space prohibited before that ':' (ctx:WxW) ERROR: trailing
 statements should be on next line ERROR: trailing statements should be
 on next line ERROR: space prohibited before that ':' (ctx:WxW) ERROR:
 trailing statements should be on next line ERROR: space prohibited
 before that ':' (ctx:WxW) ERROR: trailing statements should be on next
 line ERROR: space prohibited before that ':' (ctx:WxW) ERROR: trailing
 statements should be on next line ERROR: space prohibited before that
 ':' (ctx:WxW) ERROR: trailing statements should be on next line ERROR:
 space prohibited before that ':' (ctx:WxE) ERROR: space prohibited
 before that ':' (ctx:WxE) ERROR: trailing statements should be on next
 line ERROR: trailing s tatements should be on next line
Content-Type: multipart/alternative; boundary=fb81da4b909a46b4a6fb5f653089f9e2
X-Mailman-Approved-At: Tue, 25 Jul 2023 07:19:08 +0000
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--fb81da4b909a46b4a6fb5f653089f9e2
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

not sure how i got signed up for this and i don=E2=80=99t see a way to u=
nsubscribe. this is flooding my email with things i don=E2=80=99t care a=
bout.=20

On Fri, Jul 14, 2023, at 1:14 AM, huzhi001@208suo.com wrote:
> Signed-off-by: ZhiHu <huzhi001@208suo.com>
> ---
>   .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.c  | 40 ++++++++++++++---=
--
>   1 file changed, 29 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c=20
> b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> index d8a4d773a58c..b99e0a7c96bb 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> @@ -137,15 +137,29 @@ gk104_ectx_bind(struct nvkm_engn *engn, struct=20
> nvkm_cctx *cctx, struct nvkm_chan
>       u64 addr =3D 0ULL;
>=20
>       switch (engn->engine->subdev.type) {
> -    case NVKM_ENGINE_SW    : return;
> -    case NVKM_ENGINE_GR    : ptr0 =3D 0x0210; break;
> -    case NVKM_ENGINE_SEC   : ptr0 =3D 0x0220; break;
> -    case NVKM_ENGINE_MSPDEC: ptr0 =3D 0x0250; break;
> -    case NVKM_ENGINE_MSPPP : ptr0 =3D 0x0260; break;
> -    case NVKM_ENGINE_MSVLD : ptr0 =3D 0x0270; break;
> -    case NVKM_ENGINE_VIC   : ptr0 =3D 0x0280; break;
> -    case NVKM_ENGINE_MSENC : ptr0 =3D 0x0290; break;
> -    case NVKM_ENGINE_NVDEC :
> +    case NVKM_ENGINE_SW:
> +        return;
> +    case NVKM_ENGINE_GR:
> +        ptr0 =3D 0x0210;
> +        break;
> +    case NVKM_ENGINE_SEC:
> +        ptr0 =3D 0x0220;
> +        break;
> +    case NVKM_ENGINE_MSPDEC:
> +        ptr0 =3D 0x0250;
> +        break;
> +    case NVKM_ENGINE_MSPPP:
> +        ptr0 =3D 0x0260;
> +        break;
> +    case NVKM_ENGINE_MSVLD:
> +        ptr0 =3D 0x0270;
> +        break;
> +    case NVKM_ENGINE_VIC:
> +        ptr0 =3D 0x0280; break;
> +    case NVKM_ENGINE_MSENC:
> +        ptr0 =3D 0x0290;
> +        break;
> +    case NVKM_ENGINE_NVDEC:
>           ptr1 =3D 0x0270;
>           ptr0 =3D 0x0210;
>           break;
> @@ -435,8 +449,12 @@ gk104_runl_commit(struct nvkm_runl *runl, struct=20
> nvkm_memory *memory, u32 start,
>       int target;
>=20
>       switch (nvkm_memory_target(memory)) {
> -    case NVKM_MEM_TARGET_VRAM: target =3D 0; break;
> -    case NVKM_MEM_TARGET_NCOH: target =3D 3; break;
> +    case NVKM_MEM_TARGET_VRAM:
> +        target =3D 0;
> +        break;
> +    case NVKM_MEM_TARGET_NCOH:
> +        target =3D 3;
> +        break;
>       default:
>           WARN_ON(1);
>           return;
>=20
--fb81da4b909a46b4a6fb5f653089f9e2
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>not sure how i =
got signed up for this and i don=E2=80=99t see a way to unsubscribe. thi=
s is flooding my email with things i don=E2=80=99t care about.&nbsp;</di=
v><div><br></div><div>On Fri, Jul 14, 2023, at 1:14 AM,&nbsp;<a href=3D"=
mailto:huzhi001@208suo.com">huzhi001@208suo.com</a> wrote:<br></div><blo=
ckquote type=3D"cite" id=3D"qt" style=3D""><div>Signed-off-by: ZhiHu &lt=
;<a href=3D"mailto:huzhi001@208suo.com">huzhi001@208suo.com</a>&gt;<br><=
/div><div>---<br></div><div>&nbsp; .../gpu/drm/nouveau/nvkm/engine/fifo/=
gk104.c&nbsp; | 40 ++++++++++++++-----<br></div><div>&nbsp; 1 file chang=
ed, 29 insertions(+), 11 deletions(-)<br></div><div><br></div><div>diff =
--git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c&nbsp;<br></div>=
<div>b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c<br></div><div>in=
dex d8a4d773a58c..b99e0a7c96bb 100644<br></div><div>--- a/drivers/gpu/dr=
m/nouveau/nvkm/engine/fifo/gk104.c<br></div><div>+++ b/drivers/gpu/drm/n=
ouveau/nvkm/engine/fifo/gk104.c<br></div><div>@@ -137,15 +137,29 @@ gk10=
4_ectx_bind(struct nvkm_engn *engn, struct&nbsp;<br></div><div>nvkm_cctx=
 *cctx, struct nvkm_chan<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u6=
4 addr =3D 0ULL;<br></div><div><br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; switch (engn-&gt;engine-&gt;subdev.type) {<br></div><div>-&nbsp;&nb=
sp;&nbsp; case NVKM_ENGINE_SW&nbsp;&nbsp;&nbsp; : return;<br></div><div>=
-&nbsp;&nbsp;&nbsp; case NVKM_ENGINE_GR&nbsp;&nbsp;&nbsp; : ptr0 =3D 0x0=
210; break;<br></div><div>-&nbsp;&nbsp;&nbsp; case NVKM_ENGINE_SEC&nbsp;=
&nbsp; : ptr0 =3D 0x0220; break;<br></div><div>-&nbsp;&nbsp;&nbsp; case =
NVKM_ENGINE_MSPDEC: ptr0 =3D 0x0250; break;<br></div><div>-&nbsp;&nbsp;&=
nbsp; case NVKM_ENGINE_MSPPP : ptr0 =3D 0x0260; break;<br></div><div>-&n=
bsp;&nbsp;&nbsp; case NVKM_ENGINE_MSVLD : ptr0 =3D 0x0270; break;<br></d=
iv><div>-&nbsp;&nbsp;&nbsp; case NVKM_ENGINE_VIC&nbsp;&nbsp; : ptr0 =3D =
0x0280; break;<br></div><div>-&nbsp;&nbsp;&nbsp; case NVKM_ENGINE_MSENC =
: ptr0 =3D 0x0290; break;<br></div><div>-&nbsp;&nbsp;&nbsp; case NVKM_EN=
GINE_NVDEC :<br></div><div>+&nbsp;&nbsp;&nbsp; case NVKM_ENGINE_SW:<br><=
/div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br></div><=
div>+&nbsp;&nbsp;&nbsp; case NVKM_ENGINE_GR:<br></div><div>+&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr0 =3D 0x0210;<br></div><div>+&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br></div><div>+&nbsp;&nbsp;&nbs=
p; case NVKM_ENGINE_SEC:<br></div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ptr0 =3D 0x0220;<br></div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; break;<br></div><div>+&nbsp;&nbsp;&nbsp; case NVKM_ENGINE_=
MSPDEC:<br></div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr0 =3D=
 0x0250;<br></div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br></div><div>+&nbsp;&nbsp;&nbsp; case NVKM_ENGINE_MSPPP:<br></div><di=
v>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr0 =3D 0x0260;<br></div>=
<div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br></div><div>+&=
nbsp;&nbsp;&nbsp; case NVKM_ENGINE_MSVLD:<br></div><div>+&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ptr0 =3D 0x0270;<br></div><div>+&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br></div><div>+&nbsp;&nbsp;&nbsp; =
case NVKM_ENGINE_VIC:<br></div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ptr0 =3D 0x0280; break;<br></div><div>+&nbsp;&nbsp;&nbsp; case N=
VKM_ENGINE_MSENC:<br></div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ptr0 =3D 0x0290;<br></div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; break;<br></div><div>+&nbsp;&nbsp;&nbsp; case NVKM_ENGINE_NVDEC:<=
br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr=
1 =3D 0x0270;<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ptr0 =3D 0x0210;<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; break;<br></div><div>@@ -435,8 +449,12 @@ gk104=
_runl_commit(struct nvkm_runl *runl, struct&nbsp;<br></div><div>nvkm_mem=
ory *memory, u32 start,<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int=
 target;<br></div><div><br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; swi=
tch (nvkm_memory_target(memory)) {<br></div><div>-&nbsp;&nbsp;&nbsp; cas=
e NVKM_MEM_TARGET_VRAM: target =3D 0; break;<br></div><div>-&nbsp;&nbsp;=
&nbsp; case NVKM_MEM_TARGET_NCOH: target =3D 3; break;<br></div><div>+&n=
bsp;&nbsp;&nbsp; case NVKM_MEM_TARGET_VRAM:<br></div><div>+&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; target =3D 0;<br></div><div>+&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br></div><div>+&nbsp;&nbsp;&nbsp; c=
ase NVKM_MEM_TARGET_NCOH:<br></div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; target =3D 3;<br></div><div>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; break;<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:=
<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WA=
RN_ON(1);<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; return;<br></div><div><br></div></blockquote></body></html>
--fb81da4b909a46b4a6fb5f653089f9e2--
