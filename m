Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021EC4C4282
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 11:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5E610E896;
	Fri, 25 Feb 2022 10:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7000610E8BA
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 10:38:48 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso5720463ooa.4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 02:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=xZ4zjaBnvBmfIipJXsuhj1ZP+RFg/unPs4PTp2Z5ieY=;
 b=yiQZqYII3sc13NjjIWXB18MkoyJYXTOkBrGG9g6xtnwDMS+IKf0QJGwiFsDu2eILzf
 A6d3TFy72zl8E0B1RHUJoZTybOXn+AHRBlxvmwGl9FGpQgY6l17dqhGl9AQQViadNTbj
 0wKUtFNrho/JVAk0b0XTP5tmAQJoi5bhzC3X7Wr0IPGzrHeXZ2bPnPjzfjqBYmjoaySx
 0qREFcmejieCPGBJoQWWfUauQ4BDYDTPR818CHpBDFajp1aELdNmmolIzDVDDOXO9v4O
 DFag+yzvCf3OpGKQPkeQXZTRILxB2h1015709bpGG9S9B1dUydKW3dRlQwGPhmATDDoN
 DWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=xZ4zjaBnvBmfIipJXsuhj1ZP+RFg/unPs4PTp2Z5ieY=;
 b=JOYpj1NsekV6y/UVBanTp3K8jft+6IOjVwv+RcXlNY9oyHMhsmCnwYso46ozSwyLWo
 I91+vnan7/V3wEUGB8V6wls+j/fk1jBn/tEFLHxfznwhlFPz42K1kCaqLzrHHOMdO14+
 hXFeg9lBWyQHs6PE67Kjn0gXHmLgBjbPCqBz9qTQxlj/Dan27PGQ6dOZc7smG3JeL3ra
 cswR30BSzOHk63fdJajcv5KXoqs4mkLQOmOtRvQgPVHKvmiTCzxdrNcBF5fmkORTvfsE
 3Co4e8lkWmb4sOk9S7hm/UQ7tohNvhb1ZmBrtq+x/5MGmhEtG4dSPP1Xmri3l8ZvSU7b
 BoQA==
X-Gm-Message-State: AOAM53032kyaF/IJjU5oT4DCjCrHVRXD0Dj6QaOx/cLObAVODUnyz0SA
 dVrxpL5/SHxUbixZ2bk8Y/VknhNcshu09FCSY4ts3Q==
X-Google-Smtp-Source: ABdhPJzKoOVyeE+Q0+YDcG+MhLAzrtOSeZ4qRlKcY1izzMw0S8O6ExkCYq91DUvdulYydl69odknNpE/qzy8Fdq6FIY=
X-Received: by 2002:a05:6870:b486:b0:d6:f01f:41cc with SMTP id
 y6-20020a056870b48600b000d6f01f41ccmr196276oap.41.1645785527660; Fri, 25 Feb
 2022 02:38:47 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 02:38:47 -0800
MIME-Version: 1.0
In-Reply-To: <a7605c9f-55f9-c7cc-f2b9-89ddbffb4927@collabora.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-5-granquet@baylibre.com>
 <a7605c9f-55f9-c7cc-f2b9-89ddbffb4927@collabora.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 02:38:47 -0800
Message-ID: <CABnWg9v-gamMoex-CSLY9uOPKbcm3dBDvYLSRX9LHuhYua=wDQ@mail.gmail.com>
Subject: Re: [PATCH v8 04/19] video/hdmi: Add audio_infoframe packing for DP
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@linux.ie, 
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com, 
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mripard@kernel.org, 
 p.zabel@pengutronix.de, robh+dt@kernel.org, tzimmermann@suse.de, 
 vkoul@kernel.org
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting AngeloGioacchino Del Regno (2022-02-21 15:30:07)
> Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> >
> > Similar to HDMI, DP uses audio infoframes as well which are structured
> > very similar to the HDMI ones.
> >
> > This patch adds a helper function to pack the HDMI audio infoframe for
> > DP, called hdmi_audio_infoframe_pack_for_dp().
> > hdmi_audio_infoframe_pack_only() is split into two parts. One of them
> > packs the payload only and can be used for HDMI and DP.
> >
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >   drivers/video/hdmi.c        | 83 ++++++++++++++++++++++++++++---------
> >   include/drm/drm_dp_helper.h |  2 +
> >   include/linux/hdmi.h        |  7 +++-
> >   3 files changed, 72 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> > index 947be761dfa40..63e74d9fd210e 100644
> > --- a/drivers/video/hdmi.c
> > +++ b/drivers/video/hdmi.c
> > @@ -21,6 +21,7 @@
> >    * DEALINGS IN THE SOFTWARE.
> >    */
> >
> > +#include <drm/drm_dp_helper.h>
> >   #include <linux/bitops.h>
> >   #include <linux/bug.h>
> >   #include <linux/errno.h>
> > @@ -381,12 +382,34 @@ static int hdmi_audio_infoframe_check_only(const struct hdmi_audio_infoframe *fr
> >    *
> >    * Returns 0 on success or a negative error code on failure.
> >    */
> > -int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame)
> > +int hdmi_audio_infoframe_check(const struct hdmi_audio_infoframe *frame)
> >   {
> >       return hdmi_audio_infoframe_check_only(frame);
> >   }
> >   EXPORT_SYMBOL(hdmi_audio_infoframe_check);
> >
> > +static void
> > +hdmi_audio_infoframe_pack_payload(const struct hdmi_audio_infoframe *frame,
> > +                               u8 *buffer)
> > +{
> > +     u8 channels;
> > +
> > +     if (frame->channels >= 2)
> > +             channels = frame->channels - 1;
> > +     else
> > +             channels = 0;
> > +
> > +     buffer[0] = ((frame->coding_type & 0xf) << 4) | (channels & 0x7);
> > +     buffer[1] = ((frame->sample_frequency & 0x7) << 2) |
> > +              (frame->sample_size & 0x3);
> > +     buffer[2] = frame->coding_type_ext & 0x1f;
> > +     buffer[3] = frame->channel_allocation;
> > +     buffer[4] = (frame->level_shift_value & 0xf) << 3;
> > +
> > +     if (frame->downmix_inhibit)
> > +             buffer[4] |= BIT(7);
> > +}
> > +
> >   /**
> >    * hdmi_audio_infoframe_pack_only() - write HDMI audio infoframe to binary buffer
> >    * @frame: HDMI audio infoframe
> > @@ -404,7 +427,6 @@ EXPORT_SYMBOL(hdmi_audio_infoframe_check);
> >   ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
> >                                      void *buffer, size_t size)
> >   {
> > -     unsigned char channels;
> >       u8 *ptr = buffer;
> >       size_t length;
> >       int ret;
> > @@ -420,28 +442,13 @@ ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
> >
> >       memset(buffer, 0, size);
> >
> > -     if (frame->channels >= 2)
> > -             channels = frame->channels - 1;
> > -     else
> > -             channels = 0;
> > -
> >       ptr[0] = frame->type;
> >       ptr[1] = frame->version;
> >       ptr[2] = frame->length;
> >       ptr[3] = 0; /* checksum */
> >
> > -     /* start infoframe payload */
> > -     ptr += HDMI_INFOFRAME_HEADER_SIZE;
> > -
> > -     ptr[0] = ((frame->coding_type & 0xf) << 4) | (channels & 0x7);
> > -     ptr[1] = ((frame->sample_frequency & 0x7) << 2) |
> > -              (frame->sample_size & 0x3);
> > -     ptr[2] = frame->coding_type_ext & 0x1f;
> > -     ptr[3] = frame->channel_allocation;
> > -     ptr[4] = (frame->level_shift_value & 0xf) << 3;
> > -
> > -     if (frame->downmix_inhibit)
> > -             ptr[4] |= BIT(7);
> > +     hdmi_audio_infoframe_pack_payload(frame,
> > +                                       ptr + HDMI_INFOFRAME_HEADER_SIZE);
> >
> >       hdmi_infoframe_set_checksum(buffer, length);
> >
> > @@ -479,6 +486,44 @@ ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
> >   }
> >   EXPORT_SYMBOL(hdmi_audio_infoframe_pack);
> >
> > +/**
> > + * hdmi_audio_infoframe_pack_for_dp - Pack a HDMI Audio infoframe for
> > + *                                    displayport
>
> This fits in one line (82 cols is ok)... but, anyway, please capitalize D and P
> in the DisplayPort word.
>

Yeah, I ran clang-format and didn't want to contradict the tool :)
I'll fix that for v9

> > + *
> > + * @frame HDMI Audio infoframe
>
> You're almost there! You missed a colon after each description.
> Also, I personally like seeing indented descriptions as, in my opinion, this
> enhances human readability, as it's a bit more pleasing to the eye... but
> it's not a requirement, so you be the judge.
>
> * @frame:      HDMI Audio infoframe
> * @sdp:        Secondary data packet......
> * @dp_version: DisplayPort version......
>
> Please fix.
>

I completly forgot to generate and check the kerneldoc.
Sorry.

> > + * @sdp secondary data packet for display port. This is filled with the
> > + * appropriate data
> > + * @dp_version Display Port version to be encoded in the header
> > + *
> > + * Packs a HDMI Audio Infoframe to be sent over Display Port. This function
> > + * fills the secondary data packet to be used for Display Port.
> > + *
> > + * Return: Number of total written bytes or a negative errno on failure.
> > + */
> > +ssize_t
> > +hdmi_audio_infoframe_pack_for_dp(const struct hdmi_audio_infoframe *frame,
> > +                              struct dp_sdp *sdp, u8 dp_version)
> > +{
> > +     int ret;
> > +
> > +     ret = hdmi_audio_infoframe_check(frame);
> > +     if (ret)
> > +             return ret;
> > +
> > +     memset(sdp->db, 0, sizeof(sdp->db));
> > +
> > +     // Secondary-data packet header
>
> Please, C-style comments:
>
>         /* Secondary-data packet header */
>
> Thanks,
> Angelo

I think this is not the only case of C++ comment that slipped past me...
I'll revise the whole series.

Thx,
Guillaume.
