Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D36CB3BEE2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 17:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A6810EBF9;
	Fri, 29 Aug 2025 15:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="GtC4ix8g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF0610EBF9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 15:11:28 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7704f3c4708so2656283b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756480288; x=1757085088;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MKVIGNn1cEq2YWpF5MnDqFEUCjnk9rekqsdebgbty2M=;
 b=GtC4ix8gN8pEQWDYZyCq+3o/XBjVEVhGdfEe30mo3r5MLyMSS2mKhJzWp4z1G81z6e
 AKjb+uVfn7+tj2kc64e+mJzN9Ix8y51kmXZP38QAm1BWpjKoWsoBi+w81p06ApACCvc/
 qj5OGEy4XNRzS590Sx0xmjipIO3R6HR2qfsS/NF5L9N4V3G4g9AzAsiZuN0M1+WrOp3j
 2P2MgoDrKbIm3Ezq5uq0OduHmgK/ElIwrfklQf4zZ2Eqdmnek7d2aXXd8VgyV04l4s5O
 yagYVk4b8kXM5yUlIZ89xyQ78MdSrlkMzWWaG8YAy+bSw3Wi+VRCmCGljCl8p3RWVwr7
 q+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756480288; x=1757085088;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MKVIGNn1cEq2YWpF5MnDqFEUCjnk9rekqsdebgbty2M=;
 b=nnqnUiLdHBJNqcj741jNdOfiKcxy8HqGcyIP/mO729Tn7DEnoJDJ1indjR4Og2tKGi
 K1U0w5j0jklm09QSJIwUE0AsFBbOXFJcBoAZyQo9zX71vtgQp+gNSiwTFrbDIaOpIPWA
 XQj+//uQ0bKtSihMy+naYQIQYWFTmEgfF3+WWqeAlpFlUWXJw1Gnme7GlTt86uhtQUf2
 754hPu1+nlTP8AjTgZKOF+nS/OCZ6WG9Xvv+bQTidA6qwX4UfhxH5eDn8lNuLDRkLTj0
 mKprmnoVYK0ndpxKUWeBl8HJiGy8VrkZ1ei6vwA3LmKvhrWlj5+8GDt8v4WrS1L++Dz0
 RI6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTG4/g6xp5/4IOJKH4py0/WkxeMv4uisQ404SekvKzOSYaHf7J2pJTJZFVjy/Wterg7IwjeFFQIMo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhhJo9DqdTrN72YY7/Jwg6elng1M5/XsoxF4F4gJynILOUcmnU
 cXEs9oQgAkp4k86tpR2DLwAxJgx6qcSsdmO4u2JMdkr81x2lc2nr0giQloTn225QHvvTIIgfNZ/
 PUVgNYp/LsH+yzLjHvl0G8m7UxE8V5El6uFZgK2Kw/lwTnadWkRwgW9pQ0xAK
X-Gm-Gg: ASbGncuVa73Et3nzf9iMfkKRpqUEMdq6zeEnyEgDZloyQuMRs6yiSwwh5aLxsddxGVw
 agQoyLBdWqdjILX3JB7N+vcQbaY2I36CaCjU9ZNrlnaf6m51NgU4Ief8DUSK5BFNo9+eIbiE/IM
 qBHET2lLdQoiGV+dc878U62uOJAyqdMr9vNli62MBum3etUymLUwz/MglwyA9sST30u53lgwx4v
 IVTq9CHzOYl72W6
X-Google-Smtp-Source: AGHT+IHGuK+XPEJZnoxSJC5I7lDP0ZoQ+n66AiaBsrF0OgVB4dkv+81+YUciDWeRwKYQ7j4CfvTN3OcksYb1HiKXD3Q=
X-Received: by 2002:a17:903:b0d:b0:246:d70e:ea82 with SMTP id
 d9443c01a7336-246d70eee46mr278790365ad.5.1756480288279; Fri, 29 Aug 2025
 08:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com>
 <20250825-rk3588-hdmi-cec-v3-4-95324fb22592@collabora.com>
In-Reply-To: <20250825-rk3588-hdmi-cec-v3-4-95324fb22592@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 Aug 2025 17:11:16 +0200
X-Gm-Features: Ac12FXw0jSvkKD9n-NKvt8cWwlJ3T6SlQZFX3ax5d_8FYdRiZJRd202BjgA0Vpg
Message-ID: <CAPj87rNf3JHveEbtBB-DpmpobDG-kE5nOeNPUaVW-xn70V1jTQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in
 dw_hdmi_qp_plat_data
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Aug 2025 at 10:57, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> In order to support the CEC interface of the DesignWare HDMI QP IP
> block, setup platform data to include the required IRQ number.

Reviewed-by: Daniel Stone <daniels@collabora.com>
