Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D55762C2E9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 16:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A4E10E12F;
	Wed, 16 Nov 2022 15:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B9110E12F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 15:45:26 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id j2so21419673ybb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 07:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u46I6go/saTRIVVfpJob0gPVrpMrbJdeJpSXHHVVJQQ=;
 b=SgN/WkakGEHfrc/+/Zer8Bi4Bvl+Q4PKwpqGfiz/x3kj2OQxojmQtm0SvkAgbZb4ah
 1d9M8akX+xN3kORy+gQi1FweYbODOY8tktpwjl413BDsBTSaXcI0L9EoD3KLwRQQndbf
 aEB6Lts0HAFHwutWx7Wnuwj1cegrYdM1EQjII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u46I6go/saTRIVVfpJob0gPVrpMrbJdeJpSXHHVVJQQ=;
 b=ZT/bnV35AptFfbuwl2O9n6nidNTG9e+rvhCrxpgvBB9iZRRvGBTMABtit+/LaYOm0p
 TM5IrSR5BTRvChMAKHWdWqebUTiyHfKvHh1rOLEole+xGkU6Hi5e3hu/+SUZ/EqMpJD2
 Q5TSPVXIMZyGymYu9Oc4d3R91/gdMyg4bHoP01jS0cgKyuzb4YaeXC/Yh725BvdkXA1K
 A6RZitQbomekxaPfQu3JYBQ8DuRkVENBXQxtEbQ29Q/aQzgJGsJtaMcBTInL4jyxGBv9
 lIQj4lFZyGPYCN7xKG8ksR0m/Wltx7Ucovno508//4kttElz4nk8uZyPpgc5CI6XNcNN
 G1yQ==
X-Gm-Message-State: ANoB5pmfOHF9z2/0r47k7jmnZfOjWcwkRHb264w8hjQWnmUkmJwDpdlX
 2VawvYspDUc5q6+xA+I8BmJVD+Q7cd07m+7eOZKehA==
X-Google-Smtp-Source: AA0mqf6TjNeRj9uOCEi4E77KeqyvFXUaQvgB+JF/BfhLS/pPYGblneEtNkSsZ6z5rmJYuAfKccPMeoPDVszPeUXDro0=
X-Received: by 2002:a25:aac8:0:b0:6d0:707:9b8c with SMTP id
 t66-20020a25aac8000000b006d007079b8cmr22308755ybi.538.1668613525641; Wed, 16
 Nov 2022 07:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20221012191226.1646315-1-greenjustin@chromium.org>
 <CAAOTY__e43sEkXCc=F0oFopqm=4N22zpbVBqLpLqj1fc1Sn1wg@mail.gmail.com>
In-Reply-To: <CAAOTY__e43sEkXCc=F0oFopqm=4N22zpbVBqLpLqj1fc1Sn1wg@mail.gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Wed, 16 Nov 2022 10:45:14 -0500
Message-ID: <CAHC42RfKHwULZ_4O8y=S8NQgOadrqYtF93VQmp9qcJxEjFRtaA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: Add AFBC support to Mediatek DRM driver
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: airlied@linux.ie, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuang,

> > +       mtk_ovl_set_afbc(dev, cmdq_pkt, idx, is_afbc);
> >         mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
> >                               DISP_REG_OVL_CON(idx));
> > -       mtk_ddp_write_relaxed(cmdq_pkt, pitch, &ovl->cmdq_reg, ovl->regs,
> > +       mtk_ddp_write_relaxed(cmdq_pkt, overlay_pitch.split_pitch.lsb, &ovl->cmdq_reg, ovl->regs,
> >                               DISP_REG_OVL_PITCH(idx));
>
> Is this general for all MediaTek SoC? If so, separate this to an
> independent patch. Otherwise, use a device variable to separate this
> setting.

Yes and no. Technically all MediaTek SoCs have two separate registers
for the pitch, each are 16 bits, so this code is technically always
needed. However, because the lsb register is 16 bit, this issue has
never come up, because nobody has tried to display a plane that was
16384 ARGB pixels across. In fact, I think most MediaTek SoCs have a
resolution limit of 4K. The reason this issue comes up now is because
"pitch" is calculated differently for AFBC frames, and actually refers
to the size in bytes of one row of AFBC blocks. Should I still
separate this into an independent patch?

> >  }
> > @@ -492,6 +567,15 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
> >         .smi_id_en = true,
> >  };
> >
> > +static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
>
> In this binding document, mt8195 ovl is compatible to mt8133 ovl.
> Please confirm that mt8195 is not identical with mt8133.

Do you mean MT8183? If so, we do not have any documentation indicating
that the MT8183 supports AFBC. Do you have some reason to believe
otherwise?

> Usually the pitch needs alignment. So I guess the formula is
>
> hdr_pitch = ALIGN(width_in_blocks * AFBC_HEADER_BLOCK_SIZE,
> AFBC_HEADER_ALIGNMENT);
> hdr_size = hdr_pitch * height_in_blocks;

The documentation does not indicate that the pitch needs alignment
beyond the AFBC header block size.

> Could you explain the meaning of hdr_pitch?

hdr_pitch refers to the size in bytes of one row of AFBC header
blocks. AFBC is a proprietary compressed frame buffer format, but from
what public information we have, it appears to be block compressed
data stored in 2 contiguous planes. The first is called the "header"
plane, and the second is called the "body" plane. The header plane
contains metadata for each block of pixel data, and the body plane
contains sparse compressed block data.


I'll send another patch with the other changes you mentioned.

Thanks!
Justin
