Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6B4444819
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 19:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C8D73E5C;
	Wed,  3 Nov 2021 18:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754E273E5C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 18:18:07 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id 2so587897iou.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O23yy0XNaLc0R410pYr/V33NeRlDl1su4/qTlADNJK0=;
 b=PmBMPAJMTJSzmZXAokQHOShr6T/x9odJ/mnPDhQPtu0T6DHU7qEVZ2d+NnBxFu2cSE
 EhRJmGI8N+/LE8ZNSh+n2bA8+Ux9UvMkyX68sz9/yHWeVKwHBKZOwQcn2/Uxjz1UUDuV
 H55yzHltcvoNicqIJr5fchzCbTGwoZxKAoyC1XkPKrT2GWPHyrnq+RdGM4ErHU9LLf0Q
 79f0VeCtpYCHVVdvAhB0LLIJyKtJ1jAEZPtGuagY2nKL4anpRljWUSef4GMm+g7foEuY
 lr3iHGQNPYus41MMK/2slkqUBB7A4FN8Uaq5pkWNvbX54Cu6mIfQJ261M0jK1PFy5dLG
 bwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O23yy0XNaLc0R410pYr/V33NeRlDl1su4/qTlADNJK0=;
 b=WCxn4Rrfy2lbg969ueMyeatw+fNSqlPTNQ/v9tmITY8bpRskbCnYf6NxulIvLSagkP
 8uzekQhSKcu438HSZo5ZstT5CjUEqTN0uATaLq2Kv7XRlXnUlo88nhmnksOuVfCba/lX
 rY+6EA0KonygFrDbOgiDYn6kcQt+xk4U07mvexPYS5En29OqTHQEPViHUbznTagnCWaH
 TnDvlwlF4EVgItmgz8nE7xEpCX7ufCunOVc52SWxB+5m1N/8D64kLhty26HsP7rSqFcu
 6DtAhUIDFThoOtMrgAZldhQBvztbtgziCu+YmQ5Q2naN4RLUVFW2zCRFrWtdwgjZj1Il
 C9yg==
X-Gm-Message-State: AOAM531lID+UG/T2OJA6hvWXBKxip050yMxidGS5l5SdYHpHny1xQH+r
 DKvW/OpPhBtJky24AhoyMxTYH+O1Ch5iNwS2HqwRgg==
X-Google-Smtp-Source: ABdhPJzHbA7Bu2iKENsPydeGCqpNqdobu5r4ToGJSw9CwhawlRaQTsxDl3byqGQ9csTexqO7E7esD0HRWGe9sAqxpLc=
X-Received: by 2002:a05:6602:19a:: with SMTP id
 m26mr15046938ioo.162.1635963486488; 
 Wed, 03 Nov 2021 11:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211103033708.14469-1-yunfei.dong@mediatek.com>
 <b398917ca0c467d83c795f02f751609a52d56edb.camel@ndufresne.ca>
In-Reply-To: <b398917ca0c467d83c795f02f751609a52d56edb.camel@ndufresne.ca>
From: Steve Cho <stevecho@google.com>
Date: Wed, 3 Nov 2021 11:17:30 -0700
Message-ID: <CAN0yncEu6sCYXQeg1Os7BZZHXG2KMb=MLSR1Z0j9yRssdxt8DQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: mtk-vcodec: Align width and height to 64 bytes
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: multipart/alternative; boundary="0000000000007aad9405cfe66e78"
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
 Yunfei Dong <yunfei.dong@mediatek.com>,
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
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000007aad9405cfe66e78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Yunfei for the update. Looks good to me.
As mentioned earlier, I tested to verify that this fix resolved
the corruption issue on Kukui.

Tested-by: Steve Cho <stevecho@chromium.org>

Thanks,
Steve

On Wed, Nov 3, 2021 at 8:23 AM Nicolas Dufresne <nicolas@ndufresne.ca>
wrote:

> Le mercredi 03 novembre 2021 =C3=A0 11:37 +0800, Yunfei Dong a =C3=A9crit=
 :
> > Width and height need to 64 bytes aligned when setting the format.
> > Need to make sure all is 64 bytes align when use width and height to
> > calculate buffer size.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > Change-Id: I39886b1a6b433c92565ddbf297eb193456eec1d2
>
> Perhaps avoid this tag later ? Another perhaps, there is a tag to indicat=
e
> which
> patch introduce that bug, if you add this tag, the patch will be
> automatically
> backported into relevant stable kernel. The format is:
>
> > Fixes: <short-hash> ("<short commit description")
>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
> > ---
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h        | 1 +
> >  drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c | 4 ++--
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > index e30806c1faea..66cd6d2242c3 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > @@ -11,6 +11,7 @@
> >  #include <media/videobuf2-core.h>
> >  #include <media/v4l2-mem2mem.h>
> >
> > +#define VCODEC_DEC_ALIGNED_64 64
> >  #define VCODEC_CAPABILITY_4K_DISABLED        0x10
> >  #define VCODEC_DEC_4K_CODED_WIDTH    4096U
> >  #define VCODEC_DEC_4K_CODED_HEIGHT   2304U
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> > index d402fc4bda69..e1a3011772a9 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> > +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> > @@ -562,8 +562,8 @@ static void get_pic_info(struct vdec_h264_slice_ins=
t
> *inst,
> >  {
> >       struct mtk_vcodec_ctx *ctx =3D inst->ctx;
> >
> > -     ctx->picinfo.buf_w =3D (ctx->picinfo.pic_w + 15) & 0xFFFFFFF0;
> > -     ctx->picinfo.buf_h =3D (ctx->picinfo.pic_h + 31) & 0xFFFFFFE0;
> > +     ctx->picinfo.buf_w =3D ALIGN(ctx->picinfo.pic_w,
> VCODEC_DEC_ALIGNED_64);
> > +     ctx->picinfo.buf_h =3D ALIGN(ctx->picinfo.pic_h,
> VCODEC_DEC_ALIGNED_64);
> >       ctx->picinfo.fb_sz[0] =3D ctx->picinfo.buf_w * ctx->picinfo.buf_h=
;
> >       ctx->picinfo.fb_sz[1] =3D ctx->picinfo.fb_sz[0] >> 1;
> >       inst->vsi_ctx.dec.cap_num_planes =3D
>
>

--0000000000007aad9405cfe66e78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you Yunfei for the update. Looks good to me.=C2=
=A0</div><div>As mentioned earlier, I tested to verify that this fix resolv=
ed the=C2=A0corruption issue on Kukui.</div><div><br></div>Tested-by: Steve=
 Cho &lt;<a href=3D"mailto:stevecho@chromium.org">stevecho@chromium.org</a>=
&gt;<div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Thanks,<div>Steve</div>=
</div></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 3, 2021 at 8:23 AM Nicolas Dufresne &lt=
;<a href=3D"mailto:nicolas@ndufresne.ca">nicolas@ndufresne.ca</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le mercredi 03=
 novembre 2021 =C3=A0 11:37 +0800, Yunfei Dong a =C3=A9crit=C2=A0:<br>
&gt; Width and height need to 64 bytes aligned when setting the format.<br>
&gt; Need to make sure all is 64 bytes align when use width and height to<b=
r>
&gt; calculate buffer size.<br>
&gt; <br>
&gt; Signed-off-by: Yunfei Dong &lt;<a href=3D"mailto:yunfei.dong@mediatek.=
com" target=3D"_blank">yunfei.dong@mediatek.com</a>&gt;<br>
&gt; Change-Id: I39886b1a6b433c92565ddbf297eb193456eec1d2<br>
<br>
Perhaps avoid this tag later ? Another perhaps, there is a tag to indicate =
which<br>
patch introduce that bug, if you add this tag, the patch will be automatica=
lly<br>
backported into relevant stable kernel. The format is:<br>
<br>
&gt; Fixes: &lt;short-hash&gt; (&quot;&lt;short commit description&quot;)<b=
r>
<br>
Acked-by: Nicolas Dufresne &lt;<a href=3D"mailto:nicolas.dufresne@collabora=
.com" target=3D"_blank">nicolas.dufresne@collabora.com</a>&gt;<br>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c | 4 ++=
--<br>
&gt;=C2=A0 2 files changed, 3 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/driv=
ers/media/platform/mtk-vcodec/mtk_vcodec_dec.h<br>
&gt; index e30806c1faea..66cd6d2242c3 100644<br>
&gt; --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h<br>
&gt; +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h<br>
&gt; @@ -11,6 +11,7 @@<br>
&gt;=C2=A0 #include &lt;media/videobuf2-core.h&gt;<br>
&gt;=C2=A0 #include &lt;media/v4l2-mem2mem.h&gt;<br>
&gt;=C2=A0 <br>
&gt; +#define VCODEC_DEC_ALIGNED_64 64<br>
&gt;=C2=A0 #define VCODEC_CAPABILITY_4K_DISABLED=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0x10<br>
&gt;=C2=A0 #define VCODEC_DEC_4K_CODED_WIDTH=C2=A0 =C2=A0 4096U<br>
&gt;=C2=A0 #define VCODEC_DEC_4K_CODED_HEIGHT=C2=A0 =C2=A02304U<br>
&gt; diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c=
 b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c<br>
&gt; index d402fc4bda69..e1a3011772a9 100644<br>
&gt; --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c<br>
&gt; +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c<br>
&gt; @@ -562,8 +562,8 @@ static void get_pic_info(struct vdec_h264_slice_in=
st *inst,<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtk_vcodec_ctx *ctx =3D inst-&gt;ctx;=
<br>
&gt;=C2=A0 <br>
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
<br>
</blockquote></div>

--0000000000007aad9405cfe66e78--
