Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A283530E7B
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 12:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E2710F007;
	Mon, 23 May 2022 10:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DA010F007
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 10:57:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id s28so20647323wrb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 03:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=BG7Id+lD+AQs0Pegzcqk1XktexibNQHiu13oHrpbb3M=;
 b=R6hjr4vVGrFUXLG1QDuRZ3HDw6zAcnC9oR0wGnabT+tDUhO0BdqFnTJVAfJeALzc/j
 ZHvPBQbbc4Z2heu9EjRjiZXXTt2cbdQEvBNNXqhGbkRwt+cQXmgMJ7/hG6fERNlGnlsx
 SS2a01naIC5RPByBPFfaZBefQZ05aAJEnL9pZTrp6Z4Befp2M+K16xQ9Mi6VSuTT9fdK
 iygWO3hIFNhbxo64OndbysVlNlMf6ZCpzspjLznSa+T4xhjplCz2L4299OArzxRkG4eL
 UvvCugiIKttC7KT9lis3g0TzGRPLKsqKA6coX3ZK9CRs9lxK0jJYJS1ZR+oOvro/05SR
 ZkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=BG7Id+lD+AQs0Pegzcqk1XktexibNQHiu13oHrpbb3M=;
 b=v0b2sJrFYE9PJGwMD6JRPRPFWZ9nrhb9z/Mo5n39TBZ+JdB6LVlv+TJs1jOmRFFlGT
 SjsCgCmjQqrMbufMDKYsaWLDfrta3bfNBaNx+r/eBlI/i711i6AF9eHITJaHF0TR9C8o
 V06g9PFhtGCVhVLafsT8F33XzxDlTtE5s7JU35DM0EgQybCutlM45eBBsE1H2MvU+SUd
 dInQ8kGzdUA2qeLiTGFrkbcu10wHh7NJw2wAbTryNyYf6u3qh4ZJXy+CvePpLFu9vYdi
 qZxTOuxSNrgvpyuJ8iKjAM7Pq3FOw+mposv++0UjVNUtiWWSMfoAx4E4L8I/uRoO5+Yb
 rn5w==
X-Gm-Message-State: AOAM530lM3z5BDi5SHkhCTD7yqt+r2tDsFDpVp9G3v/F04is0k9AwN4Q
 aXU5IZF2JwU7n38eJBVEbAE=
X-Google-Smtp-Source: ABdhPJzcu/U7hQf2EKjkWxdjrxDDsZbj+4xkWy47utplrljg5CDn1H+9R4diFxBpCAClUAm6OUSYsQ==
X-Received: by 2002:a05:6000:24b:b0:20d:24e:a1ce with SMTP id
 m11-20020a056000024b00b0020d024ea1cemr10309067wrz.159.1653303449301; 
 Mon, 23 May 2022 03:57:29 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 p2-20020adfa202000000b0020adc114136sm11704389wra.0.2022.05.23.03.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:57:28 -0700 (PDT)
Message-ID: <652139e639c7e80795e01b3b4f88ba03b85d66c5.camel@gmail.com>
Subject: Re: [PATCH v10 03/21] drm/edid: Convert cea_sad helper struct to
 kernelDoc
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod
 Koul <vkoul@kernel.org>, Helge Deller <deller@gmx.de>,  CK Hu
 <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>
Date: Mon, 23 May 2022 12:57:26 +0200
In-Reply-To: <20220523104758.29531-4-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-4-granquet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 
MIME-Version: 1.0
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
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>=20

We need a commit message here.

> ---
> =C2=A0include/drm/drm_edid.h | 12 +++++++++---
> =C2=A01 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 144c495b99c4..37c420423625 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -359,12 +359,18 @@ struct edid {
> =C2=A0
> =C2=A0#define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1]
> << 8))
> =C2=A0
> -/* Short Audio Descriptor */
> +/**
> + * struct cea_sad - Short Audio Descriptor.
> + * @format: See HDMI_AUDIO_CODING_TYPE_*.
> + * @channels: max number of channels - 1.
> + * @freq: See CEA_SAD_FREQ_*.
> + * @byte2: meaning depends on format.
> + */
> =C2=A0struct cea_sad {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 format;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 channels; /* max number of =
channels - 1 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 channels;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 freq;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 byte2; /* meaning depends o=
n format */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 byte2;
> =C2=A0};
> =C2=A0
> =C2=A0struct drm_encoder;

