Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EC18FE5C0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 13:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7130C10E913;
	Thu,  6 Jun 2024 11:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YwqKqQ+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD17410E170
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 19:58:31 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-35e4aaa0f33so199292f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 12:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717617510; x=1718222310; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pf8r5yLzRWnbsxS/Ko313LwbjIGVpyyp6EBPhDw6O18=;
 b=YwqKqQ+v3EUkJ71A803Fx52pDtWtg7dWZxUVfaW14KKvQYYSWexwwBX3sD28TqtGWR
 UbkOiK1ci+GfElL1DLTfmrAGHaw5W189vV/Mmx/nrlw7ZheCxGQHvBU5/QqNsgdfZWxW
 5qIupZI7a0PMLvH6TYfryFEDYhiE+vnJXjUQep5FqCLG49uexYkdRpIkQEjUF22rfbTB
 LYbMCc6EJeqdxnDsurkRh3nHJRyT29KeT4f0CW26KbaB3Iz0lIDcLe1K2do0Lxtx4byT
 GUuzh9IDQS7btWPRwIvA9a+Rth51mYF/o5EAJX9U8JFBvHOENE5KeBSh+U8b2ntQwdWD
 eLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717617510; x=1718222310;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pf8r5yLzRWnbsxS/Ko313LwbjIGVpyyp6EBPhDw6O18=;
 b=RC42lmmNXoh05JlhpgGIS1Ut4dFwHiOqXYL2sSFrvok5fVaif/Go2L9KTJUVdynHCW
 KtJvQ30IrmAHmYjZly7yCwUxu3SUnkOCZEM06H0LrELr53Q2QR59shTCAK24Rnzo/m4D
 /EnHEdWK8pDVDZzwEIJfet2DtbTUQWrDKZa9ncOS274ee0bv0MRkb3Lv0UdLLoo2hJqG
 fekUtq6rt7v56/3blJdBiKt2tJzTwQExIidpYl8TeR6+QJdCNLCNY89qQsGWJu8ZBZMO
 TBM0rjAwxzQp/zzvYuL3JygqohCW2aLL5ccwV5BzNUHYI7v5bO4fRRvfKkSlO0hDC4Gd
 rwOQ==
X-Gm-Message-State: AOJu0Yx20gsGtQcJXgqWO8JqKZL/D6MkOe1GIdT/9N5IQHhKu+EsCAtk
 PyBaSUPb9l6z3Ai4A5Tplmmjd5SyTGSR5BJfHYdoVLUqoGgqpDmi
X-Google-Smtp-Source: AGHT+IFIRSDuYx9C8w8Mwft2Esuzx2rYHBnh1PEvECrLGF7NHqqpntJiuiOWp3KIW3ubAgGvnJx6DA==
X-Received: by 2002:a05:6000:dcf:b0:354:fcbf:f3c0 with SMTP id
 ffacd0b85a97d-35e8406decfmr2999235f8f.4.1717617509710; 
 Wed, 05 Jun 2024 12:58:29 -0700 (PDT)
Received: from [192.168.0.9] (cm-83-97-153-254.telecable.es. [83.97.153.254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm15323756f8f.73.2024.06.05.12.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 12:58:29 -0700 (PDT)
Message-ID: <02e22411-e22e-41f7-8bca-95c8ef5a4346@gmail.com>
Date: Wed, 5 Jun 2024 21:58:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] drm/bridge: synopsys: Add DW HDMI QP TX controller
 driver
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Algea Cao <algea.cao@rock-chips.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <20240601-b4-rk3588-bridge-upstream-v1-13-f6203753232b@collabora.com>
 <2554679.TLnPLrj5Ze@diego>
Content-Language: en-US
From: Luis de Arquer <ldearquer@gmail.com>
In-Reply-To: <2554679.TLnPLrj5Ze@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 06 Jun 2024 11:47:04 +0000
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

On 6/5/24 16:48, Heiko Stübner wrote:
> Without this change, connecting to a DVI display does not work, and
> reading the EDID ends in the "i2c read error" below.

I had a lot of problems initially with the vendor driver on my DVI 
display, and am aware that several changes were required.

However, I tested Cristian patch and worked fine. All modes were 
apparently detected from the display and they all worked. But maybe I 
was just lucky and it was using a somehow cached table, I can't say.

This is an AOC DVI display from 2011 with a passive adapter.



Luis
