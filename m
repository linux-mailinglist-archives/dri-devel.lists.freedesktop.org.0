Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 835457E4BE1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 23:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A876610E100;
	Tue,  7 Nov 2023 22:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1FD10E12C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 22:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699396639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mcQ7qFfph2OIPDIUDXoOo7W/UZw4LGQy2JoQD5/WzDE=;
 b=KZRox8eKXNDt45sCBdSXZbOrhwZHWLVhHw9yz9E9DydO3RiMigRun3Pb6i6ubcark4uu9i
 565mH/mrT8nCJwwzCgRWqYjOoX1qzqPN+LkI0WAae9cdHhghcv26pkHMT5h/Soiw7Fptri
 VaBY2ZEFte8SzEE/QvBiOU8xEjuZlDs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-kTEPAobiPTqB7DQg5gBa9g-1; Tue, 07 Nov 2023 17:37:14 -0500
X-MC-Unique: kTEPAobiPTqB7DQg5gBa9g-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-41ce372d248so69121261cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 14:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699396634; x=1700001434;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vlacgRhTLZA2unwvGYeaijQlPiAJxIRhNWMnGZpwUKw=;
 b=dTNA/nxpSy92/1hwluJthHJ0dZ9XLpgbeBFOmzinoBYsSQI2cf5mHKc0CbebhzSSY8
 v/ZjXhDHmWIb6nuCVN3yGiCf9OnMWfs8Hg3BtxxRs2pXOTHc+I08zgh+4Q20g5e4tkYx
 h+aPuoFSwkwKuJEMmwpXYH5zP3//oQpAYnhK1ZA+nQlKA5EvX72jCn7YMd+GWXRF0f+i
 4tPxSLQln38LYV/wOUzWX2X32OpD5LoXru5yaDtKVbDPXd0K+NZzBRJHOIC5o2VQwYsE
 wkUjrmEI/PWcsKC+5p9Pv7aZYZr4KOr3my4IJV7Acmxd1Fd3rUKwWDMxngnLH6cdUQ2Y
 clbg==
X-Gm-Message-State: AOJu0Yz7sU50XGyF1wEkmDXQjLdNu5kkydWhJiZSpgZp/CN1dPvyOrGV
 WwCAmUgXUsPnbKjNmoSbC3LTJwA80eko//jL2KJWCnJ+lr6DwsMh4WglGVa/hdGIw3nR9s5+O6m
 oRbn4jXJwjopieoXHB8meK/+uNRhl
X-Received: by 2002:a05:622a:11c9:b0:410:9089:6b77 with SMTP id
 n9-20020a05622a11c900b0041090896b77mr290068qtk.10.1699396634463; 
 Tue, 07 Nov 2023 14:37:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEclAW8F1spIZ8QXH0POunk/JxdQMD9tui/F8JPqc/8PVEEr0j/F9C6WBa8EHqktwDWYqq5Dg==
X-Received: by 2002:a05:622a:11c9:b0:410:9089:6b77 with SMTP id
 n9-20020a05622a11c900b0041090896b77mr290056qtk.10.1699396634218; 
 Tue, 07 Nov 2023 14:37:14 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a05622a02ca00b004181a8a3e2dsm154461qtx.41.2023.11.07.14.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 14:37:13 -0800 (PST)
Message-ID: <a3c3af68629b8dd413a1adf282c0fe1137852b9c.camel@redhat.com>
Subject: Re: [PATCH v4 08/30] drm/dp_mst: Add HBLANK expansion quirk for
 Synaptics MST hubs
From: Lyude Paul <lyude@redhat.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 07 Nov 2023 17:37:13 -0500
In-Reply-To: <20231030155843.2251023-9-imre.deak@intel.com>
References: <20231030155843.2251023-1-imre.deak@intel.com>
 <20231030155843.2251023-9-imre.deak@intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2023-10-30 at 17:58 +0200, Imre Deak wrote:
> Add a quirk for Synaptics MST hubs, which require a workaround - at leat
> on i915 - for some modes, on which the hub applies HBLANK expansion.
> These modes will only work by enabling DSC decompression for them, a
> follow-up patch will do this in i915.
>=20
> v2:
> - Fix the quirk name in its DocBook description.
>=20
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 2 ++
>  include/drm/display/drm_dp_helper.h     | 7 +++++++
>  2 files changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/di=
splay/drm_dp_helper.c
> index f3680f4e69708..e5d7970a9ddd0 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2245,6 +2245,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] =
=3D {
>  =09{ OUI(0x00, 0x00, 0x00), DEVICE_ID('C', 'H', '7', '5', '1', '1'), fal=
se, BIT(DP_DPCD_QUIRK_NO_SINK_COUNT) },
>  =09/* Synaptics DP1.4 MST hubs can support DSC without virtual DPCD */
>  =09{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_DSC_W=
ITHOUT_VIRTUAL_DPCD) },
> +=09/* Synaptics DP1.4 MST hubs require DSC for some modes on which it ap=
plies HBLANK expansion. */
> +=09{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_HBLAN=
K_EXPANSION_REQUIRES_DSC) },
>  =09/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_=
MAX_LINK_RATE */
>  =09{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, =
BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
>  };
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/dr=
m_dp_helper.h
> index 3d74b2cec72fd..da94932f4262b 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -632,6 +632,13 @@ enum drm_dp_quirk {
>  =09 * the DP_MAX_LINK_RATE register reporting a lower max multiplier.
>  =09 */
>  =09DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS,
> +=09/**
> +=09 * @DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC:
> +=09 *
> +=09 * The device applies HBLANK expansion for some modes, but this
> +=09 * requires enabling DSC.
> +=09 */
> +=09DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC,
>  };
> =20
>  /**

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

