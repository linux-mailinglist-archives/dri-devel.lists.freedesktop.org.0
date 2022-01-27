Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FE349EDE6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 23:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CBA10E1CC;
	Thu, 27 Jan 2022 22:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6143C10E1CE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 22:00:46 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id 9so5475820iou.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 14:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VK/dZftvqR3un8//xcyv8MZt0r4FAyY3KekloOvipZk=;
 b=RD842jVYWkNelIEuuAKj/aCPKcVb7FaeSSE6C06CBcbYYFDBKi5QmTOEpdzSOs+PdB
 VXScBlV9eoLkldvHkiIjdBrp4B3yQeBPoRBq39cJXdz37uHqA33eIrhxh2WD+geFsawy
 gxnytIIXztdUgLvut91yY6QqqVjImEwmgt2HgkKcwbRr+ezCWzxeCGBYpqR/4IWS4Itp
 8lYsduuVpPr4jid78eUdizSBUH25mUpNtxWeqUm/FgL8/ftY9WVK628gHWQl84nMJ9d6
 wUUOVk6lzSIV1PeBX5LeK0i5SLIgpCAzwx5GUaBO7KSQtAEmCVvdT2I5203AKrGglYfk
 A7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VK/dZftvqR3un8//xcyv8MZt0r4FAyY3KekloOvipZk=;
 b=KXY3SdsLK4OZV1ovV2ueVHBgBevWm84F3taVo/T4MVtgAIUigmgTkmToEWrZV874NK
 eNQ9jE865USGh8JlzbRA5JPFzxRi7qT1nlKuxemyRbKdkD5Z3x+EIo2qCdAWeyWcaL83
 vjtcgvIU3Z0XMScsZ4oLgDDcXvSCDpDzJGjWHa5LRM1WGRIjImz1Gg1sPcJbglcvw5Eu
 WdY9/GPnVRhdYdZM4y1MS/f+T+P3uJcqN+QECTdikIJgEMuICFfRk6Z+r9fwNf/rwTtB
 6MDjMvgCs++oC7iNkSQGT5n+ai/71yyiVxNIjWZvfatACDYl5/DQPy7/VR7a7AiPND2M
 9nIg==
X-Gm-Message-State: AOAM533OEtLhedleZPh1+yHbWxQyZDK30UA5SWbrnNBeDQINZokgEeob
 sL44bbV+Qv9MMvwFQRxT2q26yN2+WERHE0e/g94Keg==
X-Google-Smtp-Source: ABdhPJyyaG1nXEdajNmIncs4U0178aj84rxp+iBeB0Mz56L5mGoCiA1gd6VTweLcVZaggtlys8nG4iNgKXc6uzASni4=
X-Received: by 2002:a02:93ee:: with SMTP id z101mr3013597jah.108.1643320845539; 
 Thu, 27 Jan 2022 14:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20220122035316.18179-1-yunfei.dong@mediatek.com>
 <20220122035316.18179-11-yunfei.dong@mediatek.com>
In-Reply-To: <20220122035316.18179-11-yunfei.dong@mediatek.com>
From: Steve Cho <stevecho@google.com>
Date: Thu, 27 Jan 2022 14:00:09 -0800
Message-ID: <CAN0yncFR2Nt8Gr0-Yv7pBoGTzOqY0hYZ7EuGWCfgJvt_b33Omw@mail.gmail.com>
Subject: Re: [PATCH v6, 10/15] media: mtk-vcodec: Fix v4l2-compliance fail
To: Yunfei Dong <yunfei.dong@mediatek.com>
Content-Type: multipart/alternative; boundary="00000000000040735c05d6977331"
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
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tfiga@google.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Alexandre Courbot <acourbot@chromium.org>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000040735c05d6977331
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Steve Cho <stevecho@chromium.org>

Thanks,
Steve

On Fri, Jan 21, 2022 at 7:53 PM Yunfei Dong <yunfei.dong@mediatek.com>
wrote:

> Need to use default pic info when get pic info fail.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> index ba188d16f0fb..5a429ed83ed4 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> @@ -478,11 +478,14 @@ static int vidioc_vdec_s_fmt(struct file *file, void
> *priv,
>                 ctx->picinfo.pic_w = pix_mp->width;
>                 ctx->picinfo.pic_h = pix_mp->height;
>
> +               /*
> +                * If get pic info fail, need to use the default pic info
> params, or
> +                * v4l2-compliance will fail
> +                */
>                 ret = vdec_if_get_param(ctx, GET_PARAM_PIC_INFO,
> &ctx->picinfo);
>                 if (ret) {
>                         mtk_v4l2_err("[%d]Error!! Get
> GET_PARAM_PICTURE_INFO Fail",
>                                      ctx->id);
> -                       return -EINVAL;
>                 }
>
>                 ctx->last_decoded_picinfo = ctx->picinfo;
> --
> 2.25.1
>
>

--00000000000040735c05d6977331
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Reviewed-by: Steve Cho &lt;<a href=3D"mailto:stevecho=
@chromium.org">stevecho@chromium.org</a>&gt;<br></div><div><br></div><div><=
div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_sign=
ature"><div dir=3D"ltr">Thanks,<div>Steve</div></div></div></div></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, Jan 21, 2022 at 7:53 PM Yunfei Dong &lt;<a href=3D"mailto:yunfei.dong@m=
ediatek.com">yunfei.dong@mediatek.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Need to use default pic info when get =
pic info fail.<br>
<br>
Signed-off-by: Yunfei Dong &lt;<a href=3D"mailto:yunfei.dong@mediatek.com" =
target=3D"_blank">yunfei.dong@mediatek.com</a>&gt;<br>
---<br>
=C2=A0drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/m=
edia/platform/mtk-vcodec/mtk_vcodec_dec.c<br>
index ba188d16f0fb..5a429ed83ed4 100644<br>
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c<br>
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c<br>
@@ -478,11 +478,14 @@ static int vidioc_vdec_s_fmt(struct file *file, void =
*priv,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;picinfo.pic=
_w =3D pix_mp-&gt;width;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;picinfo.pic=
_h =3D pix_mp-&gt;height;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * If get pic info =
fail, need to use the default pic info params, or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * v4l2-compliance =
will fail<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D vdec_if_get=
_param(ctx, GET_PARAM_PIC_INFO, &amp;ctx-&gt;picinfo);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mtk_v4l2_err(&quot;[%d]Error!! Get GET_PARAM_PICTURE_INFO Fail&q=
uot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;id);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;last_decode=
d_picinfo =3D ctx-&gt;picinfo;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--00000000000040735c05d6977331--
