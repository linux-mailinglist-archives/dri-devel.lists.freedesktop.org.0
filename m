Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03F1AEE2F9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C3010E49E;
	Mon, 30 Jun 2025 15:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JViLIe9z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6000410E49B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:44:55 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso1910568f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751298294; x=1751903094; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aeVzWwNkoBBqZJtVN+edAm9nLWzeultF12pDHLy0tUQ=;
 b=JViLIe9z2MDWtydXL/L70MM2sQ8A+lVC3kblaVtBenxGEyfVnNEgjM/xNpdPgyIjjD
 WwxdeARb3UHNb4PoLadZfrtAoTV/KSC8QxBWlZXe1WuvAK+NVWPbdrPdZfox42nnlXxK
 BXZ9/aSqVwDNHsZ4PhyA4DMeRnt4wq4xaQ0eVPF1p59AMdY9LFlkxMdntqRIs+VWm4WP
 0OUYlYqjmFrpgl8yZUsngWOVp+3gzrW0jLdLtqCxE0IaxvlLHD8cQhsoaRDVKBSGwPvm
 i8kq9xyLzGMUnSIQu2wG7Wu1TcQKDo2ARLR+7nDHrgv1Q5+2ScXaCorYJLxBIEBbW4bz
 tm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751298294; x=1751903094;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aeVzWwNkoBBqZJtVN+edAm9nLWzeultF12pDHLy0tUQ=;
 b=VHUZicvSOzuPKRiJVAxKc9DCnzcCMENfUB7xmoXXnQJdgqhjMScGuMVGFL2oQWC4Fh
 TY5F69Ny8YA4SVrdQUmPhmZ4D0muw+mXkwXY/j9sIa2pPG1cv35PU+0Ho7z0om3aBsWV
 TZplkwz0BTYTn9bSwXgdH6HGeloamR8YyCuE9W/aqFcVqTrQoSebQBYeZ1Q8PAvr698q
 fdnw6ASC7or5scY0Jg8bUTdR0GC5dZFR99/mpNqv0gx9galB61OvnPB8JPGw+MWoS8EJ
 Zwhhr/Xb4h8/8TXrtrhNj8zG2FEj22lwl4OhlRt2/2O2xnoeeMEAcmw+2uDhyvg/KqwQ
 +AVQ==
X-Gm-Message-State: AOJu0Ywuix8UJnrQBEPkfNWqZUwteluTF9n+hYyUlZ1Um+HRsnzjKr4J
 j6/tZmopnF+rbfS5O5fan/ollOdFMmK1yTamJUMmtPrWQS3dCvFhfEnXl9oStiec5gQ=
X-Gm-Gg: ASbGncue8bm4aVGUnZeqSsOkeYsARK+6vJSLVvk/Wu/B5KUA9iIkyS9iHvEnsb3Xc4m
 Utja/ZAA8v+uoxwxCUqMWCZ/+8SwSj+0fekd2SCJq4kWmLBQHtCk0XWCRISiBST2JymqYPWmWqo
 VGyAQp/YKT87WxQdtX5vRJkcZpaA/gnB3X8X8gTBGPzd5WQHlo1MawYDVXGWOxq8vsfbdATPkQj
 0eLO0aD6kNQqqKHBjtOxIkx1AQR6K412HjuL0qz51jy2Hn2k2zHl24rlAadNypSsIWO90jUbemL
 KGvGABA+ddMKNXdnZh963rMPT54np5dVW0JE0cM1tMmLI+um1Nhw5X17L26US8/tijctQje3ohi
 Rz4HPQSk=
X-Google-Smtp-Source: AGHT+IE54hqVNFYfuy0JLh3yRJ09i1zRjrGwAGDzhoNtqX53CK3xe+yMOcVBS5HMp08OOGC0/6C+rw==
X-Received: by 2002:a05:6000:1804:b0:3a4:f379:65b6 with SMTP id
 ffacd0b85a97d-3a8fe79bb4bmr9095245f8f.46.1751298293833; 
 Mon, 30 Jun 2025 08:44:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e7524sm10834062f8f.12.2025.06.30.08.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 08:44:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250608-fix-aud-hpd-bridge-v1-1-4641a6f8e381@oss.qualcomm.com>
References: <20250608-fix-aud-hpd-bridge-v1-1-4641a6f8e381@oss.qualcomm.com>
Subject: Re: [PATCH] drm/bridge: aux-hpd-bridge: fix assignment of the of_node
Message-Id: <175129829317.2307732.14905194956807398865.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 17:44:53 +0200
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

On Sun, 08 Jun 2025 18:52:04 +0300, Dmitry Baryshkov wrote:
> Perform fix similar to the one in the commit 85e444a68126 ("drm/bridge:
> Fix assignment of the of_node of the parent to aux bridge").
> 
> The assignment of the of_node to the aux HPD bridge needs to mark the
> of_node as reused, otherwise driver core will attempt to bind resources
> like pinctrl, which is going to fail as corresponding pins are already
> marked as used by the parent device.
> Fix that by using the device_set_of_node_from_dev() helper instead of
> assigning it directly.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/bridge: aux-hpd-bridge: fix assignment of the of_node
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e8537cad824065b0425fb0429e762e14a08067c2

-- 
Neil

