Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717EBACEA9A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 09:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFAD10E7CC;
	Thu,  5 Jun 2025 07:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w4G9I2kr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC5E10E7CC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 07:00:39 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso597754f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 00:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749106838; x=1749711638; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rlK7s9hxYkP0fqG8NeRDwRlzrAkK56Jhj+uxNhhkaGY=;
 b=w4G9I2krXCnPrVhWh+SaCKorjeJhbUVWCvQMjD18lBLt9AbPvGeZGakFBmmbSNT6GJ
 GJUxcGC/AvK/ChLdHjjCe55Y0KCOWOjnZb5YTYnMi43wgBgQTCKnu4jgV4XOvJqrb9oq
 0T1GStiznM5fsdQkrpT/Bnfn4x3FJQ58pwjfMed5OU7AMJurXLuI+hiSaaXbQRGxRpJS
 3VfFnLSefsvRkLs2sgsiqk9U3b4GM6V/424aubphCOrYOpVc7d0NYAnsUaaIudkbfDCN
 QJahtlHEdCVkudS4AiFU9tq3483kv6YtoApKgtwVkHT3Na8zRBbZa0UAQApVVTTpUtYo
 8HUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749106838; x=1749711638;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rlK7s9hxYkP0fqG8NeRDwRlzrAkK56Jhj+uxNhhkaGY=;
 b=h99B4gMJobOnL+yTr5rSzA+t0K3d+4hC5qltvBSNYKCBu54zFQogrhLDp7+OWCvFrd
 yaAbTh5kYM799dfhwww3gCpLO6Y6c61JhOs4RSmAE0Lbor/PvH9iDA9PHfN2VhaIrfH0
 8uSaQHleVN4ubZLvhMKyZabYIkKC7GsTPLz64zIdTccdTD5U+IbHcRVKONzDyTCm9ZlZ
 EHTmkq3xpMnSq4YHB12GCt6pGut3rHsLYlHnNddbUsTeuKPKVX78mqbwZ6H2KYXMWv3D
 W4nsTbnUGcLm3NenALv8bQgf/ywZ83vzIl6ZWmyPuUZDh+iSyLeKcRpb8H/3fwijeYVl
 NaGA==
X-Gm-Message-State: AOJu0YxU4NdSt49TIlj293yHMMGnYrRki1T+h7098xhPi/4wEtWXLZZY
 YaBUIRYd7pSZrcQerhEezh8+HoW4Od6e0yU3/tnOC9scrypcZ+zsdzc/Oabl0QSDQvI=
X-Gm-Gg: ASbGncvYHdYS84DtpNcHtpEAh95lcJ0NoYVPsd4ke+kRh6X4zvzBkOxVAsSZC6RysqK
 vTQfvU4namZOXMwBBZ03pCzQHsNlbMTXhJR2JjAFGqewyReksZL4XcCfnYzr4uMDdaBLP1JttMA
 3UI9WsN/UogOXxJlO7mIxTgUIGBWn9q9sE64LZwwPE2kNyA8IF/wPW7oUPa4WpGgwXQZ1nc48IN
 s6qfCmLlgrGHNTmThVZjNNc3axPs/tagnsiLxTipUjWYcWvqxuK2PqkY0CKb2Xk7z3L2kHxY1//
 cz49PMrbY2pLNhg9YJaJ4BNZB9dBHBgqgXV1jibiuoJSsw42Cyuxy3fklFeqxdhthKjXbKrH
X-Google-Smtp-Source: AGHT+IHRa5OR95z8ChTOsgh6ZF0ULPxGBqO+Qh7XGD0tx0MVnd3aFcSf2jaAuKX7fF2f7gm0uQ1fwQ==
X-Received: by 2002:a05:6000:381:b0:3a0:b940:d479 with SMTP id
 ffacd0b85a97d-3a51d97982amr4562193f8f.53.1749106837754; 
 Thu, 05 Jun 2025 00:00:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451f97f79b4sm14517935e9.2.2025.06.05.00.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 00:00:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
In-Reply-To: <20250521173204.1.Ic0375a9360698592f27afbf1f60f4996d504ed4f@changeid>
References: <20250521173204.1.Ic0375a9360698592f27afbf1f60f4996d504ed4f@changeid>
Subject: Re: [PATCH] drm/panel-edp: Clarify the `prepare_to_enable`
 description in comments
Message-Id: <174910683704.1447880.16330281361195978590.b4-ty@linaro.org>
Date: Thu, 05 Jun 2025 09:00:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

Hi,

On Wed, 21 May 2025 17:32:05 -0700, Douglas Anderson wrote:
> It's unclear why I originally wrote in the description of
> `prepare_to_enable` that "This is not specified in a standard way on
> eDP timing diagrams" and then also wrote "It is effectively the time
> from HPD going high till you can turn on the backlight." It seems
> pretty clear that it's (T4+T5+T6+T8)-min. Either I was confused when I
> wrote this or I was looking at some strange panel datasheet that I can
> no longer find.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel-edp: Clarify the `prepare_to_enable` description in comments
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0b3d99425891e3c4a87259afb88fbd1168dc7707

-- 
Neil

