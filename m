Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7A7B35CE0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 13:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D379510E106;
	Tue, 26 Aug 2025 11:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=bob.beckett@collabora.com header.b="JWNY/jY9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DF810E0CD;
 Tue, 26 Aug 2025 11:39:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756208370; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Rb9xn2fTOKKaWYDTKVtb6tXJcRftlBOsdEJhPIKiwlcSXev+MfNP2sCtFS3Ys/K86r9vwfOaX3rBGNgjJ48t36fkB03crSEnD+eORHec7H5CdtsdpNuXKTy4Z4gAvGZp7q+0Y7HSekphh7W9bQxMpUbNIbWnHErJjMgZGbb87R8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756208370;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2HU9eUcc8WGG2gaX/M8M9tjRaoa9qsJqLwJNN74sr4M=; 
 b=LsBJTlzMZu8Iu0jCTvKkH6cyF2JefFj2Y0PfwQopHt2KsGjjLmqkDLUsJEQlz55UTkuvZR2xBKLTLxCe6qEMvdCorS1pOgXAQrVvMp7a8JblWSMCfZ1RuO4UgP6e+2Fd01bRKBkuxNONJdh+6clb3vR+va0uEvvRYcFI3w+GkCc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=bob.beckett@collabora.com;
 dmarc=pass header.from=<bob.beckett@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756208370; 
 s=zohomail; d=collabora.com; i=bob.beckett@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=2HU9eUcc8WGG2gaX/M8M9tjRaoa9qsJqLwJNN74sr4M=;
 b=JWNY/jY95QR9At+berP4+i2NTg7PoyEZjJVW+Ey+tiEUa10e0H29Sbf/comqeIw0
 bEuz0uA+GWzyA+Houh7/Ot2K1oMHkxe+eRu3CEmEo1U2jv7lBqw6VtA0PB9cuo0456g
 9rGNCm2UKkrpRXP7aV9AQwDsa0fQMJbHhh+yWpXg=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 17562083275301017.6621271839762;
 Tue, 26 Aug 2025 04:38:47 -0700 (PDT)
Date: Tue, 26 Aug 2025 12:38:47 +0100
From: Robert Beckett <bob.beckett@collabora.com>
To: "Antheas Kapenekakis" <lkml@antheas.dev>
Cc: "amd-gfx" <amd-gfx@lists.freedesktop.org>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>, "philm" <philm@manjaro.org>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?Q?=22Christian_K=C3=B6nig=22?= <christian.koenig@amd.com>,
 "Mario Limonciello" <mario.limonciello@amd.com>
Message-ID: <198e62c6b4d.895a68a41708589.706102196190635345@collabora.com>
In-Reply-To: <20250824200202.1744335-6-lkml@antheas.dev>
References: <20250824200202.1744335-1-lkml@antheas.dev>
 <20250824200202.1744335-6-lkml@antheas.dev>
Subject: Re: [PATCH v1 5/5] drm: panel-backlight-quirks: Add Steam Decks
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


 ---- On Sun, 24 Aug 2025 21:02:02 +0100  Antheas Kapenekakis <lkml@antheas.dev> wrote --- 
 > On the SteamOS kernel, Valve universally makes minimum brightness 0
 > for all devices. SteamOS is (was?) meant for the Steam Deck, so
 > enabling it universally is reasonable. However, it causes issues in
 > certain devices. Therefore, introduce it just for the Steam Deck here.
 > 
 > SteamOS kernel does not have a public mirror, but this replaces commit
 > 806dd74bb225 ("amd/drm: override backlight min value from 12 -> 0")
 > in the latest, as of this writing, SteamOS kernel (6.11.11-valve24).
 > See unofficial mirror reconstructed from sources below.
 > 
 > Link: https://gitlab.com/evlaV/linux-integration/-/commit/806dd74bb225
 > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
 > ---
 >  drivers/gpu/drm/drm_panel_backlight_quirks.c | 17 ++++++++++++++++-
 >  1 file changed, 16 insertions(+), 1 deletion(-)
 > 
 > diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
 > index 78c430b07d6a..5c24f4a86519 100644
 > --- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
 > +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
 > @@ -73,7 +73,22 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
 >          .dmi_match_other.field = DMI_PRODUCT_NAME,
 >          .dmi_match_other.value = "ONEXPLAYER F1 EVA-02",
 >          .quirk = { .brightness_mask = 3, },
 > -    }
 > +    },
 > +    /* Steam Deck models */
 > +    {
 > +        .dmi_match.field = DMI_SYS_VENDOR,
 > +        .dmi_match.value = "Valve",
 > +        .dmi_match_other.field = DMI_PRODUCT_NAME,
 > +        .dmi_match_other.value = "Jupiter",
 > +        .quirk = { .min_brightness = 1, },
 > +    },
 > +    {
 > +        .dmi_match.field = DMI_SYS_VENDOR,
 > +        .dmi_match.value = "Valve",
 > +        .dmi_match_other.field = DMI_PRODUCT_NAME,
 > +        .dmi_match_other.value = "Galileo",
 > +        .quirk = { .min_brightness = 1, },
 > +    },
 >  };
 >  
 >  static bool drm_panel_min_backlight_quirk_matches(
 > -- 
 > 2.50.1
 > 

Reviewed-by: Robert Beckett <bob.beckett@collabora.com>
 

