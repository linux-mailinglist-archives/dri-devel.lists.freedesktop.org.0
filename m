Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A784DA1A31F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42DB10E7E5;
	Thu, 23 Jan 2025 11:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bL0ssAAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7A310E7E5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 11:38:37 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso905025e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 03:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737632315; x=1738237115; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SilrE6EYesIpIyH32MAkUE9bS+VyjL8XA4lAwTU4UrU=;
 b=bL0ssAAyfjrMWdg/8/vnPVr6eTCHZZKKtgTkzOO+R9HMXKxYMvAW5ZEGDof66oUr6A
 hyjbkdyWXzEDXo/MADcnEdMZ6MVhqoSkZTWwEPFgAUmgCtLmrTyxObfLvi4L51utQgMI
 bM+luVt1xCy897swRdItZdfejr4t9e29E+K5/v5/ZDnwJ/wK0VJC93IVi7+akosu/ETU
 8Of45F3lj3gnekg1HWlch1/m/+JeEVi6wPIIfi5n/TG8mo/veq6vxFkUrM/ZSSNd8YAr
 XVmsKTiAaKWtWzneZYdn8v1U8jPhSKYc0jUrgAaspkKUR8wdH93rCJfrmzIYi7ALeEEF
 6dEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737632315; x=1738237115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SilrE6EYesIpIyH32MAkUE9bS+VyjL8XA4lAwTU4UrU=;
 b=CdnImU8jUWHYZFai6Dojj0uWswDbea5qjcquDR/JQhZQ8pJnLDII6+3MK+J+bfC1S9
 mBzOST8VXmyCKRNvR8H3QBafLhoGKyIbgk1BTcR+KyYsIu6IgynHgXT/DQUHrbW5I4Zi
 rtTcTB0BBWyRBGOi48EYqsoVkkGHA9Zx6obOT40en3NgxvnydsCg1G8wa1iLu3Cxd9+i
 VV4EQbZGRjo+uquPZY1flS/QN7HZwWp/yQT8KIoorzvww3BMQxr+rCcwaajXLWDo8FTa
 yQXI5CM3pjBWdnlDLUhwDKvc0/AuiRQ7Q34nxLWsPqw2eKxuJ5J0dx5SQVLJ/g5zaw9v
 KthA==
X-Gm-Message-State: AOJu0YxBU2rNKDI2baQ9T3/ixjXogj1bihdB4xV4hmqot0CL23peAYHW
 AGcyGAtUl/qTDUbrL49/Utvj0CYc4ekdb4VrNpabFhbKkWRmOizjKSDMuSs+m8LuI5l2D9CeTlA
 pTJ4=
X-Gm-Gg: ASbGncv9nLDjidgYMZq2KHpbHH68iIw2p2Cw2RyR8e7e9Ri+9bKg7jebl84muOechM3
 1t1RVnZJ32C9Nu+V6sh1xwjJWHvfC7Qn82Hkb25JX9oxpp7r+ogqjA3YmWI38ACRszzDvyYYapx
 aAjB5epxO+uqdvBSMAu8Ijqh+9u17ZuKv9BNKPk6lOnPNvCuqKF2MSNwlwMg6GMi8FzCzE1WKrh
 QsBTY+BwV/UVu3zD65c/EbjlPvd8hDZEV/MRchtmx38kpiN+RU4bGXrg2OXhlt+5jhLVRrZI9se
 QL41N4KhZxTmIWvS3P51bEO9rlG5kkOn3/UxAcsei09xnLeW
X-Google-Smtp-Source: AGHT+IEROFP8vvNLe0hTplLw6jGsi6lsdcyy/HUDmpcENyS0ZF/Nhc4VolkoKbdaIBVF6sctzO+H2g==
X-Received: by 2002:a05:6512:2394:b0:542:2972:4e1e with SMTP id
 2adb3069b0e04-5439c2471f0mr9996052e87.12.1737632315388; 
 Thu, 23 Jan 2025 03:38:35 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af72a23sm2612677e87.172.2025.01.23.03.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 03:38:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Jesse Van Gavere <jesseevg@gmail.com>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Adam Ford <aford173@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Mads Bligaard Nielsen <bli@bang-olufsen.dk>, Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v2] drm/bridge: adv7511: Switch to atomic operations
Date: Thu, 23 Jan 2025 13:38:31 +0200
Message-ID: <173763216769.2675239.9420904271160199552.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250106121054.96739-1-jesseevg@gmail.com>
References: <20250106121054.96739-1-jesseevg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 06 Jan 2025 13:10:54 +0100, Jesse Van Gavere wrote:
> Use the atomic version of enable/disable.
> 
> To support bridges where bus format negotiation is needed such as TIDSS we
> need to implement atomic_get_input_bus_fmts, prepare the driver for this by
> switching the existing operations to it's atomic variants.
> 
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: adv7511: Switch to atomic operations
      commit: ed868bcb4f5cecbb61c4f057aa7550650643ac3b

Best regards,
-- 
With best wishes
Dmitry

