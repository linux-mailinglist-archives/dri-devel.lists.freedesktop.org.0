Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACC34437A8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 22:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E0A737FB;
	Tue,  2 Nov 2021 21:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64DB73257
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 16:44:06 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id b203so11029188iof.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v5nqr+mWoDX34ke8EKRh8PdpLENqg9zfxxbknlMQDYA=;
 b=Czz4O/XS6eGt5Fh/4nalt1WGoKGMOAZslHRa3XF82IZZSGhK06tLDzeN1MuJffUIAC
 8FyDvSsrxSOCzhH4A406M4HEBP0R6IpdAYOdYJw2JqFyUyMi37Gm+dLXMx2plb1xLgto
 YG5hPtP/yvw5FDAIsXp+QSK5kiqgBUzD0mDY1NRIL/pq1XVbXi6IJJq2Wb1pWYYunVAa
 7C+rWUZ1blrSZjGvfTFGo/vgi2wSBw8BT+DOEcbHyqsPN/ntm8EeaNIz0yErWzsPAF8e
 CxttCsVYk0wy2gN+bfXfbEyrv8LGyV+8Wa/laBUoIRJM043g3NrYEHRqmmBryt1Qm/59
 BkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v5nqr+mWoDX34ke8EKRh8PdpLENqg9zfxxbknlMQDYA=;
 b=kkbCAGAQl4W4xvZofcERpwy75g4LbpRA8LgIKiSw3clscGkkRShvn5WCaAT1towOE0
 cvLgfV57ikM68IbYNbpVh4nyXpE8FdPEBJOG6rM55sTvZSJOyLGdNQUsnTL17Z3uy2B8
 86fl2TkoLV9G45JpqeRQijYmiwWMZ9bb991Orc72lQxuTo+xx3/Y0pdScK2L+mMF/i5d
 sRz27w1ofocksTuXhXhUZFXOV+6FVcvFLWlFhyJTwesi4H3UfMZi/fkAkTIZIQ44vM5g
 7BtxN4LNAFPXSdFe2+3h8+QzMJigBsXfmxfUY/CEQPHMJTZWPtxAhYfXEEcW3sENcrsr
 cv8A==
X-Gm-Message-State: AOAM533S8yt/KYCntkXVpfIbnIRlPEFr5kiBBiXq4bC95NmLunngNKjO
 gIYuTnouyoA9kN4Oi9LHzx1caGBoSyV2f8E87qC3oQ==
X-Google-Smtp-Source: ABdhPJzzeIXbjfmNNwKaelc2pOfntRsmA33q9yNvrZMlcFE6zKsd9eird7nfZLnnaV4jzS1SAP3310mDWESAt8qAMAM=
X-Received: by 2002:a5e:8701:: with SMTP id y1mr22186457ioj.192.1635871445801; 
 Tue, 02 Nov 2021 09:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211029094510.2411-1-yunfei.dong@mediatek.com>
In-Reply-To: <20211029094510.2411-1-yunfei.dong@mediatek.com>
From: Steve Cho <stevecho@google.com>
Date: Tue, 2 Nov 2021 09:43:29 -0700
Message-ID: <CAN0yncGtLC0D_MeNxu7nKBoixquwv+OKvrmo+izqLRWxiGWFJQ@mail.gmail.com>
Subject: Re: [PATCH v1] media: mtk-vcodec: Align width and height to 64
To: Yunfei Dong <yunfei.dong@mediatek.com>
Content-Type: multipart/alternative; boundary="0000000000006d452a05cfd100a1"
X-Mailman-Approved-At: Tue, 02 Nov 2021 21:11:30 +0000
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
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000006d452a05cfd100a1
Content-Type: text/plain; charset="UTF-8"

Thank you Yunfei for following up with this change.

This change is the last missing piece to enable VD on Kukui with Chromium.
This patch fixed the corruption we were seeing on Kukui with certain tests.

One comment from me is just to use defined macro or variable instead of
hard coding 64.

"User get width and height are 64 align when set format."

This sentence might need to be reworded. It is not clear to me.

Maybe something like "Width and height need to be 64 bytes aligned when
setting the format."

Thanks,
Steve

On Fri, Oct 29, 2021 at 2:45 AM Yunfei Dong <yunfei.dong@mediatek.com>
wrote:

> User get width and height are 64 align when set format. Need to make
> sure all is 64 align when use width and height to calculate buffer size.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> index 946c23088308..28c17204f9a1 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> @@ -562,8 +562,8 @@ static void get_pic_info(struct vdec_h264_slice_inst
> *inst,
>  {
>         struct mtk_vcodec_ctx *ctx = inst->ctx;
>
> -       ctx->picinfo.buf_w = (ctx->picinfo.pic_w + 15) & 0xFFFFFFF0;
> -       ctx->picinfo.buf_h = (ctx->picinfo.pic_h + 31) & 0xFFFFFFE0;
> +       ctx->picinfo.buf_w = ALIGN(ctx->picinfo.pic_w, 64);
> +       ctx->picinfo.buf_h = ALIGN(ctx->picinfo.pic_h, 64);
>         ctx->picinfo.fb_sz[0] = ctx->picinfo.buf_w * ctx->picinfo.buf_h;
>         ctx->picinfo.fb_sz[1] = ctx->picinfo.fb_sz[0] >> 1;
>         inst->vsi_ctx.dec.cap_num_planes =
> --
> 2.25.1
>
>

--0000000000006d452a05cfd100a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you Yunfei for following up with this change.=C2=A0<=
div><br></div><div>This change is the last missing piece to enable VD on Ku=
kui with Chromium.=C2=A0</div><div>This patch fixed the corruption=C2=A0we =
were seeing on Kukui with=C2=A0certain tests.</div><div><br></div><div>One =
comment from me is just to use defined macro or variable instead of hard co=
ding 64.=C2=A0</div><div><br></div><div>&quot;User get width and height are=
 64 align when set format.&quot;<br></div><div><br></div><div>This sentence=
 might need to be reworded. It is not clear to me.=C2=A0</div><div><br></di=
v><div>Maybe something like &quot;Width and height need to be 64 bytes alig=
ned when setting the format.&quot;<br></div><div><br clear=3D"all"><div><di=
v dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=
<div dir=3D"ltr">Thanks,<div>Steve</div></div></div></div></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct=
 29, 2021 at 2:45 AM Yunfei Dong &lt;<a href=3D"mailto:yunfei.dong@mediatek=
.com">yunfei.dong@mediatek.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">User get width and height are 64 align when s=
et format. Need to make<br>
sure all is 64 align when use width and height to calculate buffer size.<br=
>
<br>
Signed-off-by: Yunfei Dong &lt;<a href=3D"mailto:yunfei.dong@mediatek.com" =
target=3D"_blank">yunfei.dong@mediatek.com</a>&gt;<br>
---<br>
=C2=A0drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c | 4 ++--<br=
>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c b/dr=
ivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c<br>
index 946c23088308..28c17204f9a1 100644<br>
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c<br>
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c<br>
@@ -562,8 +562,8 @@ static void get_pic_info(struct vdec_h264_slice_inst *i=
nst,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mtk_vcodec_ctx *ctx =3D inst-&gt;ctx;<br=
>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;picinfo.buf_w =3D (ctx-&gt;picinfo.pic_=
w + 15) &amp; 0xFFFFFFF0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;picinfo.buf_h =3D (ctx-&gt;picinfo.pic_=
h + 31) &amp; 0xFFFFFFE0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;picinfo.buf_w =3D ALIGN(ctx-&gt;picinfo=
.pic_w, 64);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;picinfo.buf_h =3D ALIGN(ctx-&gt;picinfo=
.pic_h, 64);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;picinfo.fb_sz[0] =3D ctx-&gt;picinfo.bu=
f_w * ctx-&gt;picinfo.buf_h;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;picinfo.fb_sz[1] =3D ctx-&gt;picinfo.fb=
_sz[0] &gt;&gt; 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 inst-&gt;vsi_ctx.dec.cap_num_planes =3D<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000006d452a05cfd100a1--
