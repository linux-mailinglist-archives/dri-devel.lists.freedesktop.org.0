Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF32114B0F3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 09:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7752D6ED14;
	Tue, 28 Jan 2020 08:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F356E8D7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 18:46:03 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q8so5311742pfh.7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 10:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:from:subject:to:cc:user-agent:date;
 bh=SAf0wlfw+TNd2DzftwsbonJldFJ5p2J5PC2nZzFZ18o=;
 b=J/lBecyP+6ceXQ/zWohjXYEmnPCnobOv9FN6yiXpAbDIqJTCdKTfi0gpkPgOTFJI8m
 tqCgE2PP3GVUwKlAePYObUsCJEijlnsNuYaVp+uiAfHxAcF8te0xzX1RKMfa6VxX+3mH
 vOguqsVESWgUG4oHCLa8o1N1lce8WIEqDbw/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
 :user-agent:date;
 bh=SAf0wlfw+TNd2DzftwsbonJldFJ5p2J5PC2nZzFZ18o=;
 b=cAJJJMuG8bH0Vm4uPYtGaZExsRDYO2nGNr/3junpQ0Two4ZjSXe8p/HU4vvCrka1JU
 L58e2TSw2NQQKt8jNY+Kn5eVNUp2vh7Mi7s/Jze3C5KCk30gX/j33HuukIwYFG4SL0Nw
 x1OfPuOaol0nHXqE0o7c4gYJtDArwChvX8dE0dvWKzZBWX7LU3iDkm8RJG5YDKP/FAtO
 bD7bPyrV104H2rVcPIORGihC52M/HsJ3Cx3y8RfW7oTrZlUCXE+9v33mLZuTZXd647Zf
 7mrpFa/zY8qKaKVidXT9XFxQwK/b2mpNilpZ36yuXuVxBtBHobCJ0iQkVpt3kQhHVCZ1
 1lSw==
X-Gm-Message-State: APjAAAU6XhxsQquBQrEO8hxXcLjeRnCeN5Ue/qMJdo+e9i5MoTI/22U+
 NZ6/WnVbrmkMaIaJHXW0tLinrQ==
X-Google-Smtp-Source: APXvYqzpHq5KdTUu1Ff269ZBNEmFhjHamx/h+1X/OxalS68FdPJVJkwMOn9rEub6f5DtdzHNYxFPLA==
X-Received: by 2002:a63:5920:: with SMTP id n32mr20427594pgb.443.1580150762587; 
 Mon, 27 Jan 2020 10:46:02 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id j14sm16858839pgs.57.2020.01.27.10.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 10:46:01 -0800 (PST)
Message-ID: <5e2f2fe9.1c69fb81.6d20f.a6b4@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <1579819245-21913-1-git-send-email-abhinavk@codeaurora.org>
References: <1579819245-21913-1-git-send-email-abhinavk@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm: Parse Colorimetry data block from EDID
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
User-Agent: alot/0.8.1
Date: Mon, 27 Jan 2020 10:46:01 -0800
X-Mailman-Approved-At: Tue, 28 Jan 2020 08:36:33 +0000
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
Cc: adelva@google.com, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, seanpaul@chromium.org,
 aravindh@codeaurora.org, Uma Shankar <uma.shankar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2020-01-23 14:40:45)
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 99769d6..148bfa4 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4199,6 +4200,57 @@ static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
>         mode->clock = clock;
>  }
>  
> +static bool cea_db_is_hdmi_colorimetry_data_block(const u8 *db)
> +{
> +       if (cea_db_tag(db) != USE_EXTENDED_TAG)
> +               return false;
> +
> +       if (db[1] != COLORIMETRY_DATA_BLOCK)
> +               return false;
> +
> +       if (cea_db_payload_len(db) < 2)
> +               return false;
> +
> +       return true;
> +}
> +
> +static void
> +drm_parse_colorimetry_data_block(struct drm_connector *connector, const u8 *db)
> +{
> +       struct drm_hdmi_info *info = &connector->display_info.hdmi;
> +
> +       /* As per CEA 861-G spec */
> +       /* Byte 3 Bit 0: xvYCC_601 */
> +       if (db[2] & BIT(0))

Why not use the defines added in drm_edid.h in this patch? Then the
comments can be removed because the code would look like

	if (db[2] & DRM_EDID_CLRMETRY_xvYCC_601)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
