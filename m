Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C05AA4594AC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 19:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD5F89C07;
	Mon, 22 Nov 2021 18:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EDD89C07
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 18:25:56 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id h23so19076136ila.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 10:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V922HWuq8uLsxYG22PIxd+gFocBtJqGUO9t4zkKvHEU=;
 b=d/GtbXqVSvLQS2G2429Kg5rVUGFSB42mFR5vGLs9c+X9co8Zob61EBvEn+WlkbjuL0
 l/YV0T9huF3f3llpCQkvYIBcCexKlV7PUtdXHxBCZbq04/IRB5eXL1V08pz0dxJvqW8O
 BDYakDFQFKAT3uZhAoCGPsnx24RISCzX6icY/VVvicS8sSlc3DjEcNku5hzzHwc7w92i
 SsaW1y02+asop/wQokGHvxYwjwSURErfQn2pwPDw6HHLSxSCTsigRypa5abWwelYS011
 qMP8mLXvJZrSqtJ5bDEpn5Ie8CZzvDmZKJjagALtkEOQTR10OgYMqvc1wkyvHsXcAYka
 uhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V922HWuq8uLsxYG22PIxd+gFocBtJqGUO9t4zkKvHEU=;
 b=jZA9yTUiciXzxPmAdNXAmC5E8CvyhcP5Me4XezekmJEZRBPx8t2AdJXSctOgG0Hjof
 7Cji4w+t46+KvTE+quLaAjhR4oUJxso5rU4DFLP2YvQrZWKG9qr5jZn2YYTcGkfOgjXG
 DeKotZMKsv6xyfZviiS7iHXoe9pZCYuDjLWK2/hkNpsbuf7rPsC1PIZd2UB7fWsmzdfr
 z3Rjg2ta0JfCyL7+C9e4jE8F7ghUDVXnj9fZ5NGWyQjGj0cKP4RYU1Y4S31yOrRt2YJj
 8iwcPTBFRvbgCACdO0Ulx6qxyzYWfLDF7CuxV2W4N2YTOCauxB5MdbQK+Lw5k7Jqe6Is
 GnTw==
X-Gm-Message-State: AOAM533Z3GHZg9VonWDoIOanAyU4/vVDJ5g7eU0HD/hXK1tMm4VPVYDW
 tiwm1BkMKAnePlMadClOEjl3dtN0xmWA3VBVpJ0s6g==
X-Google-Smtp-Source: ABdhPJwtRxEmpfX55RYrsWOEQIG12prkfLrYv5SFJCGGONMfN0b5CSPxI+Oz80us5P6a8v2FfEGKqBSE0i7JecH3Y+g=
X-Received: by 2002:a05:6e02:1b01:: with SMTP id
 i1mr14238957ilv.94.1637605555358; 
 Mon, 22 Nov 2021 10:25:55 -0800 (PST)
MIME-Version: 1.0
References: <20211104122426.9597-1-yunfei.dong@mediatek.com>
 <725024c7-b605-2de6-0a9e-e3e044ae5b3f@collabora.com>
In-Reply-To: <725024c7-b605-2de6-0a9e-e3e044ae5b3f@collabora.com>
From: Steve Cho <stevecho@google.com>
Date: Mon, 22 Nov 2021 10:25:19 -0800
Message-ID: <CAN0yncHWWjRzJLGi90t0G8N=Qc7kKq4NKnHko8e7Jvg+PzCNLw@mail.gmail.com>
Subject: Re: [PATCH v3] media: mtk-vcodec: Align width and height to 64 bytes
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Content-Type: multipart/alternative; boundary="000000000000692ca905d164c1b1"
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000692ca905d164c1b1
Content-Type: text/plain; charset="UTF-8"

Thank you Dafna for providing the feedback.

Yes, I agree that ALIGN(x, 64) is clear enough.
I forgot the history, but I think it was probably one of my comment before.
For this case, it is also only used in one place, so not much benefit in
that sense as well.
(Unless it is planned to be used in many other places.)

Yunfei, either way is fine with me.
Wasn't this change was already merged in media stage though?

Thanks,
Steve

On Sun, Nov 21, 2021 at 11:11 PM Dafna Hirschfeld <
dafna.hirschfeld@collabora.com> wrote:

>
>
> On 04.11.21 14:24, Yunfei Dong wrote:
> > Width and height need to 64 bytes aligned when setting the format.
> > Need to make sure all is 64 bytes align when use width and height to
> > calculate buffer size.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Tested-by: Steve Cho <stevecho@chromium.org>
> > ---
> >   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h        | 1 +
> >   drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c | 4 ++--
> >   2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > index e30806c1faea..66cd6d2242c3 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > @@ -11,6 +11,7 @@
> >   #include <media/videobuf2-core.h>
> >   #include <media/v4l2-mem2mem.h>
> >
> > +#define VCODEC_DEC_ALIGNED_64 64
>
> This define is a bit useless, it doesn't improve readability,
> if you do ALIGN(x, 64) it is already clear enough.
>
> Thank,
> Dafna
>
> >   #define VCODEC_CAPABILITY_4K_DISABLED       0x10
> >   #define VCODEC_DEC_4K_CODED_WIDTH   4096U
> >   #define VCODEC_DEC_4K_CODED_HEIGHT  2304U
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> > index d402fc4bda69..e1a3011772a9 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> > +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> > @@ -562,8 +562,8 @@ static void get_pic_info(struct vdec_h264_slice_inst
> *inst,
> >   {
> >       struct mtk_vcodec_ctx *ctx = inst->ctx;
> >
> > -     ctx->picinfo.buf_w = (ctx->picinfo.pic_w + 15) & 0xFFFFFFF0;
> > -     ctx->picinfo.buf_h = (ctx->picinfo.pic_h + 31) & 0xFFFFFFE0;
> > +     ctx->picinfo.buf_w = ALIGN(ctx->picinfo.pic_w,
> VCODEC_DEC_ALIGNED_64);
> > +     ctx->picinfo.buf_h = ALIGN(ctx->picinfo.pic_h,
> VCODEC_DEC_ALIGNED_64);
> >       ctx->picinfo.fb_sz[0] = ctx->picinfo.buf_w * ctx->picinfo.buf_h;
> >       ctx->picinfo.fb_sz[1] = ctx->picinfo.fb_sz[0] >> 1;
> >       inst->vsi_ctx.dec.cap_num_planes =
> >
>

--000000000000692ca905d164c1b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you Dafna for providing the feedback.=C2=A0<div><br>=
</div><div>Yes, I agree that ALIGN(x, 64) is clear enough.=C2=A0</div><div>=
<div>I forgot the history, but I think it was probably one of my comment be=
fore.=C2=A0<br></div><div>For this case, it is also only used in one place,=
 so not much benefit in that sense as well.</div><div>(Unless it is planned=
 to be used in many other places.)</div><div><br></div><div>Yunfei, either =
way is fine with me.=C2=A0</div><div>Wasn&#39;t this change was already=C2=
=A0merged in media stage though?</div><div><br></div><div><div><div dir=3D"=
ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr">Thanks,<div>Steve</div></div></div></div></div></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 2=
1, 2021 at 11:11 PM Dafna Hirschfeld &lt;<a href=3D"mailto:dafna.hirschfeld=
@collabora.com">dafna.hirschfeld@collabora.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 04.11.21 14:24, Yunfei Dong wrote:<br>
&gt; Width and height need to 64 bytes aligned when setting the format.<br>
&gt; Need to make sure all is 64 bytes align when use width and height to<b=
r>
&gt; calculate buffer size.<br>
&gt; <br>
&gt; Signed-off-by: Yunfei Dong &lt;<a href=3D"mailto:yunfei.dong@mediatek.=
com" target=3D"_blank">yunfei.dong@mediatek.com</a>&gt;<br>
&gt; Acked-by: Nicolas Dufresne &lt;<a href=3D"mailto:nicolas.dufresne@coll=
abora.com" target=3D"_blank">nicolas.dufresne@collabora.com</a>&gt;<br>
&gt; Tested-by: Steve Cho &lt;<a href=3D"mailto:stevecho@chromium.org" targ=
et=3D"_blank">stevecho@chromium.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c =
| 4 ++--<br>
&gt;=C2=A0 =C2=A02 files changed, 3 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/driv=
ers/media/platform/mtk-vcodec/mtk_vcodec_dec.h<br>
&gt; index e30806c1faea..66cd6d2242c3 100644<br>
&gt; --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h<br>
&gt; +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h<br>
&gt; @@ -11,6 +11,7 @@<br>
&gt;=C2=A0 =C2=A0#include &lt;media/videobuf2-core.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;media/v4l2-mem2mem.h&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#define VCODEC_DEC_ALIGNED_64 64<br>
<br>
This define is a bit useless, it doesn&#39;t improve readability,<br>
if you do ALIGN(x, 64) it is already clear enough.<br>
<br>
Thank,<br>
Dafna<br>
<br>
&gt;=C2=A0 =C2=A0#define VCODEC_CAPABILITY_4K_DISABLED=C2=A0 =C2=A0 =C2=A0 =
=C2=A00x10<br>
&gt;=C2=A0 =C2=A0#define VCODEC_DEC_4K_CODED_WIDTH=C2=A0 =C2=A04096U<br>
&gt;=C2=A0 =C2=A0#define VCODEC_DEC_4K_CODED_HEIGHT=C2=A0 2304U<br>
&gt; diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c=
 b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c<br>
&gt; index d402fc4bda69..e1a3011772a9 100644<br>
&gt; --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c<br>
&gt; +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c<br>
&gt; @@ -562,8 +562,8 @@ static void get_pic_info(struct vdec_h264_slice_in=
st *inst,<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtk_vcodec_ctx *ctx =3D inst-&gt;ctx;=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ctx-&gt;picinfo.buf_w =3D (ctx-&gt;picinfo.pic_w =
+ 15) &amp; 0xFFFFFFF0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ctx-&gt;picinfo.buf_h =3D (ctx-&gt;picinfo.pic_h =
+ 31) &amp; 0xFFFFFFE0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;picinfo.buf_w =3D ALIGN(ctx-&gt;picinfo.p=
ic_w, VCODEC_DEC_ALIGNED_64);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;picinfo.buf_h =3D ALIGN(ctx-&gt;picinfo.p=
ic_h, VCODEC_DEC_ALIGNED_64);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;picinfo.fb_sz[0] =3D ctx-&gt;picinfo=
.buf_w * ctx-&gt;picinfo.buf_h;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;picinfo.fb_sz[1] =3D ctx-&gt;picinfo=
.fb_sz[0] &gt;&gt; 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inst-&gt;vsi_ctx.dec.cap_num_planes =3D<br>
&gt; <br>
</blockquote></div>

--000000000000692ca905d164c1b1--
