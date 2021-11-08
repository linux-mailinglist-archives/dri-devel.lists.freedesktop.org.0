Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69975449EEA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 00:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5311D6E194;
	Mon,  8 Nov 2021 23:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B956E194
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 23:03:57 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id h2so18633867ili.11
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 15:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oqm8gZl7S7N5OZrA3EfwBDo/GASlcv8f5FZwaOwjX1A=;
 b=CwdsHJhnT4mL96ZDxe4GytVM8OUm++cqH0U8hk3c0LGX/IjAV92+UJa5yUmzF3onZJ
 lxbwEJ8bZMl755xE66aMp2tb0jYtQOMoZD17YcB26IKlQKJXAS5wNxe7y75ByylWQh1z
 TMkBhKM1NrPL7L4CHNdxbXVSQRpnOhtfJhGCJ0uF/AVW55B0xdSZPOzKo8u90fJvX7Wf
 u5Y9QG7Ie+3JzQpzwmobSQ0sxyxrto3dZHZD8GdD4wdC6eY3PC0QjNV7dAZ8p6eOzcQ+
 8sJwvcrYRimrpc+2ncxC8WB6LkeMNmoCeMMmpCdYOPY7FmsX5JgIGQ/F2QEuIKhXfU8j
 prgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oqm8gZl7S7N5OZrA3EfwBDo/GASlcv8f5FZwaOwjX1A=;
 b=QPqqcnXPr+Ac7DrBeTNcK5P/D2KV8boze4MKlxK9w+l6yiCQC/YoRAQSb1ezIbFNhC
 /iooJgHne7h8UBW3QVqiTY+0mHlQd7qOiO7InOFi7lFFTojPtzn68KTleseHbYtW5Bcq
 v0WzTnQ83ddOgjZZeNCEIlMwJeQtbs14ltEdbHxMeYEtmk4HCQSGI0B0YNmdaUbq54Wi
 mp+eDKp9wbqy0eC+N6MYXf97Oa5u25uOzrxKyYUT8Sra+UoLbbfFUF/YZbegjUYlwrgd
 xSvUOL1k9RuUWcJSFdf9dwGe4hRTF8vBClTZ60+GoYDKhiK1rhBq83iqDN7lTk5dtHUh
 ej5w==
X-Gm-Message-State: AOAM531vFaEcqhnNMiekuvsp/uhy1xoxkqN1pcF7bogLDBrzpF3XTIZf
 +5oq/BO6vCh6gra3uZjRQ9xNp/5Jv8nBnJQvCCpQvQ==
X-Google-Smtp-Source: ABdhPJwtvQztSDzpYItlHZAgkUIGyVVIwTu9sv+DFJt8TkM0jHi6fzuAl+IKld/1SKME276/EtXjTES6cMAhQZjxT00=
X-Received: by 2002:a92:de4d:: with SMTP id e13mr1859923ilr.283.1636412636516; 
 Mon, 08 Nov 2021 15:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
 <20211029035527.454-18-yunfei.dong@mediatek.com>
In-Reply-To: <20211029035527.454-18-yunfei.dong@mediatek.com>
From: Steve Cho <stevecho@google.com>
Date: Mon, 8 Nov 2021 15:03:20 -0800
Message-ID: <CAN0yncFcg8nqrarHtxW=JKy19cZW=a8MSTdYw4+BwweiTT9bAg@mail.gmail.com>
Subject: Re: [PATCH v8, 17/17] media: mtk-vcodec: Use codec type to separate
 different hardware
To: Yunfei Dong <yunfei.dong@mediatek.com>
Content-Type: multipart/alternative; boundary="000000000000e8503f05d04f0121"
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000e8503f05d04f0121
Content-Type: text/plain; charset="UTF-8"

LGTM to few nits.

Thanks,
Steve

On Thu, Oct 28, 2021 at 8:56 PM Yunfei Dong <yunfei.dong@mediatek.com>
wrote:

> There are just one core thread, in order to separeate different
> hardware, using codec type to separeate it in scp driver.
>
s/There are/There is/ ?
s/separeate/separate/ ?


> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-By: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  .../media/platform/mtk-vcodec/vdec_ipi_msg.h  | 12 ++++---
>  .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 34 ++++++++++++++++---
>  .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  4 +++
>  3 files changed, 41 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> index 9d8079c4f976..c488f0c40190 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
> @@ -35,6 +35,8 @@ enum vdec_ipi_msgid {
>   * @msg_id     : vdec_ipi_msgid
>   * @vpu_inst_addr : VPU decoder instance address. Used if ABI version < 2.
>   * @inst_id     : instance ID. Used if the ABI version >= 2.
> + * @codec_type : Codec fourcc
> + * @reserved   : reserved param
>
nit: s/Codec/codec/ and other places too.


>   */
>  struct vdec_ap_ipi_cmd {
>         uint32_t msg_id;
> @@ -42,6 +44,8 @@ struct vdec_ap_ipi_cmd {
>                 uint32_t vpu_inst_addr;
>                 uint32_t inst_id;
>         };
> +       uint32_t codec_type;
> +       uint32_t reserved;
>  };
>
>  /**
> @@ -59,12 +63,12 @@ struct vdec_vpu_ipi_ack {
>  /**
>   * struct vdec_ap_ipi_init - for AP_IPIMSG_DEC_INIT
>   * @msg_id     : AP_IPIMSG_DEC_INIT
> - * @reserved   : Reserved field
> + * @codec_type : Codec fourcc
>   * @ap_inst_addr       : AP video decoder instance address
>   */
>  struct vdec_ap_ipi_init {
>         uint32_t msg_id;
> -       uint32_t reserved;
> +       uint32_t codec_type;
>         uint64_t ap_inst_addr;
>  };
>
> @@ -77,7 +81,7 @@ struct vdec_ap_ipi_init {
>   *     H264 decoder [0]:buf_sz [1]:nal_start
>   *     VP8 decoder  [0]:width/height
>   *     VP9 decoder  [0]:profile, [1][2] width/height
> - * @reserved   : Reserved field
> + * @codec_type : Codec fourcc
>   */
>  struct vdec_ap_ipi_dec_start {
>         uint32_t msg_id;
> @@ -86,7 +90,7 @@ struct vdec_ap_ipi_dec_start {
>                 uint32_t inst_id;
>         };
>         uint32_t data[3];
> -       uint32_t reserved;
> +       uint32_t codec_type;
>  };
>
>  /**
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> index bfd8e87dceff..c84fac52fe26 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
> @@ -100,18 +100,29 @@ static void vpu_dec_ipi_handler(void *data, unsigned
> int len, void *priv)
>
>  static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int
> len)
>  {
> -       int err;
> +       int err, id, msgid;
>
> -       mtk_vcodec_debug(vpu, "id=%X", *(uint32_t *)msg);
> +       msgid = *(uint32_t *)msg;
> +       mtk_vcodec_debug(vpu, "id=%X", msgid);
>
>         vpu->failure = 0;
>         vpu->signaled = 0;
>
> -       err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, vpu->id,
> msg,
> +       if (vpu->ctx->dev->vdec_pdata->hw_arch ==
> MTK_VDEC_LAT_SINGLE_CORE) {
> +               if (msgid == AP_IPIMSG_DEC_CORE ||
> +                       msgid == AP_IPIMSG_DEC_CORE_END)
> +                       id = vpu->core_id;
> +               else
> +                       id = vpu->id;
> +       } else {
> +               id = vpu->id;
> +       }
> +
> +       err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, id, msg,
>                                      len, 2000);
>         if (err) {
>                 mtk_vcodec_err(vpu, "send fail vpu_id=%d msg_id=%X
> status=%d",
> -                              vpu->id, *(uint32_t *)msg, err);
> +                              id, msgid, err);
>                 return err;
>         }
>
> @@ -131,6 +142,7 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst
> *vpu, unsigned int msg_id)
>                 msg.vpu_inst_addr = vpu->inst_addr;
>         else
>                 msg.inst_id = vpu->inst_id;
> +       msg.codec_type = vpu->codec_type;
>
>         err = vcodec_vpu_send_msg(vpu, &msg, sizeof(msg));
>         mtk_vcodec_debug(vpu, "- id=%X ret=%d", msg_id, err);
> @@ -149,14 +161,25 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
>
>         err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler,
> vpu->id,
>                                          vpu->handler, "vdec", NULL);
> -       if (err != 0) {
> +       if (err) {
>                 mtk_vcodec_err(vpu, "vpu_ipi_register fail status=%d",
> err);
>                 return err;
>         }
>
> +       if (vpu->ctx->dev->vdec_pdata->hw_arch ==
> MTK_VDEC_LAT_SINGLE_CORE) {
> +               err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler,
> +                                        vpu->core_id, vpu->handler,
> +                                        "vdec", NULL);
> +               if (err) {
> +                       mtk_vcodec_err(vpu, "vpu_ipi_register core fail
> status=%d", err);
> +                       return err;
> +               }
> +       }
> +
>         memset(&msg, 0, sizeof(msg));
>         msg.msg_id = AP_IPIMSG_DEC_INIT;
>         msg.ap_inst_addr = (unsigned long)vpu;
> +       msg.codec_type = vpu->codec_type;
>
>         mtk_vcodec_debug(vpu, "vdec_inst=%p", vpu);
>
> @@ -187,6 +210,7 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t
> *data, unsigned int len)
>
>         for (i = 0; i < len; i++)
>                 msg.data[i] = data[i];
> +       msg.codec_type = vpu->codec_type;
>
>         err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
>         mtk_vcodec_debug(vpu, "- ret=%d", err);
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> index ae24b75d1649..802660770a87 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> @@ -14,6 +14,7 @@ struct mtk_vcodec_ctx;
>  /**
>   * struct vdec_vpu_inst - VPU instance for video codec
>   * @id          : ipi msg id for each decoder
> + * @core_id     : core id used to separate different hardware
>   * @vsi         : driver structure allocated by VPU side and shared to AP
> side
>   *                for control and info share
>   * @failure     : VPU execution result status, 0: success, others: fail
> @@ -26,9 +27,11 @@ struct mtk_vcodec_ctx;
>   * @dev                : platform device of VPU
>   * @wq          : wait queue to wait VPU message ack
>   * @handler     : ipi handler for each decoder
> + * @codec_type     : used codec type to separate different codecs
>

nit: s/used/use/ ?


>   */
>  struct vdec_vpu_inst {
>         int id;
> +       int core_id;
>         void *vsi;
>         int32_t failure;
>         uint32_t inst_addr;
> @@ -38,6 +41,7 @@ struct vdec_vpu_inst {
>         struct mtk_vcodec_ctx *ctx;
>         wait_queue_head_t wq;
>         mtk_vcodec_ipi_handler handler;
> +       unsigned int codec_type;
>  };
>
>  /**
> --
> 2.25.1
>
>

--000000000000e8503f05d04f0121
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>LGTM to few nits.=C2=A0</div><div><br></div><div dir=
=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"=
gmail_signature"><div dir=3D"ltr">Thanks,<div>Steve</div></div></div></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Thu, Oct 28, 2021 at 8:56 PM Yunfei Dong &lt;<a href=3D"mailto:yunfei.do=
ng@mediatek.com">yunfei.dong@mediatek.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">There are just one core thread, in=
 order to separeate different<br>
hardware, using codec type to separeate it in scp driver.<br></blockquote><=
div>s/There are/There is/ ?</div><div>s/separeate/separate/ ?</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Yunfei Dong &lt;<a href=3D"mailto:yunfei.dong@mediatek.com" =
target=3D"_blank">yunfei.dong@mediatek.com</a>&gt;<br>
Reviewed-By: AngeloGioacchino Del Regno &lt;<a href=3D"mailto:angelogioacch=
ino.delregno@collabora.com" target=3D"_blank">angelogioacchino.delregno@col=
labora.com</a>&gt;<br>
---<br>
=C2=A0.../media/platform/mtk-vcodec/vdec_ipi_msg.h=C2=A0 | 12 ++++---<br>
=C2=A0.../media/platform/mtk-vcodec/vdec_vpu_if.c=C2=A0 =C2=A0| 34 ++++++++=
++++++++---<br>
=C2=A0.../media/platform/mtk-vcodec/vdec_vpu_if.h=C2=A0 =C2=A0|=C2=A0 4 +++=
<br>
=C2=A03 files changed, 41 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/med=
ia/platform/mtk-vcodec/vdec_ipi_msg.h<br>
index 9d8079c4f976..c488f0c40190 100644<br>
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h<br>
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h<br>
@@ -35,6 +35,8 @@ enum vdec_ipi_msgid {<br>
=C2=A0 * @msg_id=C2=A0 =C2=A0 =C2=A0: vdec_ipi_msgid<br>
=C2=A0 * @vpu_inst_addr : VPU decoder instance address. Used if ABI version=
 &lt; 2.<br>
=C2=A0 * @inst_id=C2=A0 =C2=A0 =C2=A0: instance ID. Used if the ABI version=
 &gt;=3D 2.<br>
+ * @codec_type : Codec fourcc<br>
+ * @reserved=C2=A0 =C2=A0: reserved param<br></blockquote><div>nit: s/Code=
c/codec/ and other places too.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
=C2=A0 */<br>
=C2=A0struct vdec_ap_ipi_cmd {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t msg_id;<br>
@@ -42,6 +44,8 @@ struct vdec_ap_ipi_cmd {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t vpu_inst_a=
ddr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t inst_id;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t codec_type;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t reserved;<br>
=C2=A0};<br>
<br>
=C2=A0/**<br>
@@ -59,12 +63,12 @@ struct vdec_vpu_ipi_ack {<br>
=C2=A0/**<br>
=C2=A0 * struct vdec_ap_ipi_init - for AP_IPIMSG_DEC_INIT<br>
=C2=A0 * @msg_id=C2=A0 =C2=A0 =C2=A0: AP_IPIMSG_DEC_INIT<br>
- * @reserved=C2=A0 =C2=A0: Reserved field<br>
+ * @codec_type : Codec fourcc<br>
=C2=A0 * @ap_inst_addr=C2=A0 =C2=A0 =C2=A0 =C2=A0: AP video decoder instanc=
e address<br>
=C2=A0 */<br>
=C2=A0struct vdec_ap_ipi_init {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t msg_id;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t reserved;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t codec_type;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t ap_inst_addr;<br>
=C2=A0};<br>
<br>
@@ -77,7 +81,7 @@ struct vdec_ap_ipi_init {<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0H264 decoder [0]:buf_sz [1]:nal_start<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0VP8 decoder=C2=A0 [0]:width/height<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0VP9 decoder=C2=A0 [0]:profile, [1][2] width/hei=
ght<br>
- * @reserved=C2=A0 =C2=A0: Reserved field<br>
+ * @codec_type : Codec fourcc<br>
=C2=A0 */<br>
=C2=A0struct vdec_ap_ipi_dec_start {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t msg_id;<br>
@@ -86,7 +90,7 @@ struct vdec_ap_ipi_dec_start {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t inst_id;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t data[3];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t reserved;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t codec_type;<br>
=C2=A0};<br>
<br>
=C2=A0/**<br>
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/medi=
a/platform/mtk-vcodec/vdec_vpu_if.c<br>
index bfd8e87dceff..c84fac52fe26 100644<br>
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c<br>
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c<br>
@@ -100,18 +100,29 @@ static void vpu_dec_ipi_handler(void *data, unsigned =
int len, void *priv)<br>
<br>
=C2=A0static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, =
int len)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err, id, msgid;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mtk_vcodec_debug(vpu, &quot;id=3D%X&quot;, *(ui=
nt32_t *)msg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0msgid =3D *(uint32_t *)msg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mtk_vcodec_debug(vpu, &quot;id=3D%X&quot;, msgi=
d);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vpu-&gt;failure =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vpu-&gt;signaled =3D 0;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D mtk_vcodec_fw_ipi_send(vpu-&gt;ctx-&gt;=
dev-&gt;fw_handler, vpu-&gt;id, msg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vpu-&gt;ctx-&gt;dev-&gt;vdec_pdata-&gt;hw_a=
rch =3D=3D MTK_VDEC_LAT_SINGLE_CORE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (msgid =3D=3D AP=
_IPIMSG_DEC_CORE ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0msgid =3D=3D AP_IPIMSG_DEC_CORE_END)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0id =3D vpu-&gt;core_id;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0id =3D vpu-&gt;id;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id =3D vpu-&gt;id;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D mtk_vcodec_fw_ipi_send(vpu-&gt;ctx-&gt;=
dev-&gt;fw_handler, id, msg,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len, 2000);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtk_vcodec_err(vpu,=
 &quot;send fail vpu_id=3D%d msg_id=3D%X status=3D%d&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vpu-&gt;id, *(uint32_t *)msg, err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id, msgid, err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -131,6 +142,7 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu=
, unsigned int msg_id)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.vpu_inst_addr =
=3D vpu-&gt;inst_addr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.inst_id =3D vpu=
-&gt;inst_id;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0msg.codec_type =3D vpu-&gt;codec_type;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D vcodec_vpu_send_msg(vpu, &amp;msg, size=
of(msg));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtk_vcodec_debug(vpu, &quot;- id=3D%X ret=3D%d&=
quot;, msg_id, err);<br>
@@ -149,14 +161,25 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D mtk_vcodec_fw_ipi_register(vpu-&gt;ctx-=
&gt;dev-&gt;fw_handler, vpu-&gt;id,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vp=
u-&gt;handler, &quot;vdec&quot;, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtk_vcodec_err(vpu,=
 &quot;vpu_ipi_register fail status=3D%d&quot;, err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vpu-&gt;ctx-&gt;dev-&gt;vdec_pdata-&gt;hw_a=
rch =3D=3D MTK_VDEC_LAT_SINGLE_CORE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D mtk_vcodec_=
fw_ipi_register(vpu-&gt;ctx-&gt;dev-&gt;fw_handler,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vpu-&gt;=
core_id, vpu-&gt;handler,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;vd=
ec&quot;, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mtk_vcodec_err(vpu, &quot;vpu_ipi_register core fail status=3D%d&=
quot;, err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;msg, 0, sizeof(msg));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.msg_id =3D AP_IPIMSG_DEC_INIT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.ap_inst_addr =3D (unsigned long)vpu;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0msg.codec_type =3D vpu-&gt;codec_type;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtk_vcodec_debug(vpu, &quot;vdec_inst=3D%p&quot=
;, vpu);<br>
<br>
@@ -187,6 +210,7 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *=
data, unsigned int len)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; len; i++)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.data[i] =3D dat=
a[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0msg.codec_type =3D vpu-&gt;codec_type;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D vcodec_vpu_send_msg(vpu, (void *)&amp;m=
sg, sizeof(msg));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtk_vcodec_debug(vpu, &quot;- ret=3D%d&quot;, e=
rr);<br>
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/medi=
a/platform/mtk-vcodec/vdec_vpu_if.h<br>
index ae24b75d1649..802660770a87 100644<br>
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h<br>
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h<br>
@@ -14,6 +14,7 @@ struct mtk_vcodec_ctx;<br>
=C2=A0/**<br>
=C2=A0 * struct vdec_vpu_inst - VPU instance for video codec<br>
=C2=A0 * @id=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : ipi msg id for each decode=
r<br>
+ * @core_id=C2=A0 =C2=A0 =C2=A0: core id used to separate different hardwa=
re<br>
=C2=A0 * @vsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: driver structure allocated=
 by VPU side and shared to AP side<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for control=
 and info share<br>
=C2=A0 * @failure=C2=A0 =C2=A0 =C2=A0: VPU execution result status, 0: succ=
ess, others: fail<br>
@@ -26,9 +27,11 @@ struct mtk_vcodec_ctx;<br>
=C2=A0 * @dev=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : plat=
form device of VPU<br>
=C2=A0 * @wq=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : wait queue to wait VPU mes=
sage ack<br>
=C2=A0 * @handler=C2=A0 =C2=A0 =C2=A0: ipi handler for each decoder<br>
+ * @codec_type=C2=A0 =C2=A0 =C2=A0: used codec type to separate different =
codecs<br></blockquote><div><br></div><div>nit: s/used/use/ ?</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 */<br>
=C2=A0struct vdec_vpu_inst {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int id;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int core_id;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *vsi;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int32_t failure;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t inst_addr;<br>
@@ -38,6 +41,7 @@ struct vdec_vpu_inst {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mtk_vcodec_ctx *ctx;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wait_queue_head_t wq;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtk_vcodec_ipi_handler handler;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int codec_type;<br>
=C2=A0};<br>
<br>
=C2=A0/**<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000e8503f05d04f0121--
