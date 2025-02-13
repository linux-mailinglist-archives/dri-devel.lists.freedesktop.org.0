Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4290AA33550
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD4110E379;
	Thu, 13 Feb 2025 02:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jG3hljxa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C053710E24D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 02:11:13 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30613802a6bso3997091fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 18:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739412672; x=1740017472; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uETtlEXGg3xvcgX20Aitn/IHvXITMfEocH7m+5/CDRc=;
 b=jG3hljxayvK1cnLCxS/zGn81/yMEv38KbLzZ31Bc4VX8g7Jry5oa3tUhoUkC3058R1
 d/2eIz5yXWA5gvXwrsTro8vPNhQvxnSLK1fqj4j2BBV8SditcWu1/GNAxbwYKiXhtO0w
 1V9t0kocCU7zqDkIRI0Oq5i7djqnTp72Fy1GOeJ9UQcaIcudNlHsS1fiBjkGX+VbSXDu
 q113Uaud9D4biV8c68Sra6rEAtk3oGJ8hZnZZ754aL0XhaI0kHdIDiEzjhF0BmgzG2cV
 ufrnGFPhemrp3FnSkjLW6ZtbdK9vHva4aWfe/dLYwQckevBUTWCn/hZnZSQRva1/pseb
 K7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739412672; x=1740017472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uETtlEXGg3xvcgX20Aitn/IHvXITMfEocH7m+5/CDRc=;
 b=iBYirzkfSu5/LdywrmHiHJh+rBa5uxgAsZYjwZNU5QSLZDjXIDfGa/d1VmXVwJYhDu
 o7tsW9hX4HfnXuH5mbYI4NgEbnxhmqu1rEv0H4pc2W5nvH90jcRjDNGNgOMuBX1mS5+J
 taL1NrAhqq/rQWapWVDggB2D/w88ZbKENTXj+C/QU1n/OFiSfWuH4vutlCsm+HTZ10on
 BMnLWde2k8Um7ZPgku3z98pdBh89bOfpZKgN2f+pCL54UGkKLmhsJj3Mgn2JqiP/wdKM
 BAqOTSU50AJ3i20bbuu3mZF+214hFMNmTNGt+RNjGtcMohGTZNfumWJqFEjyMm/vYfAh
 Iv0g==
X-Gm-Message-State: AOJu0Yx9X7qxd5XZHGpCS4bj3v459CWZ36oRS9qM65AkNm9rLbOzN1fV
 VWPojfHHYjodUxbf24HUia8WiIocEbTIBYkNANEEpI7QEGEV2mH5w6RRyXlNydc=
X-Gm-Gg: ASbGncv+yRpqlNBj/TKG9gnhqp96o9NjEquKgk6wbiL4p9FI0R+M0m6HOSo4QWo914E
 wHLQI/pB8Z0MaVMMCchGAYj4AU+MUAXL/Z6GA63dobpVgDUzTMkFFgByESDm5T2q/UoILVFB2A6
 xjHfW94Qyupyit1znuYm0oIdcHuT0SbGbF/IJq5g7oDhEn+LS5C3de26N6EtNA6KFOoy0UHY62W
 XwxrKEO+QYpn1N9G1fMGSD19xgDT3O/U1aNbcox5a73sAUceVcUplays1gTheSvTETyjnPEfoUB
 eQ3b3kbS89DHBV5O8JvfR2eivsVn4zjBTnQF5kGJoL+aHWdgzucugfaN/2I=
X-Google-Smtp-Source: AGHT+IHCQB6RMFGTUdTRgyNEU298nfvRKm1DnMj3OhLiPjx5ynnKK0R/puRmL0YjByCysEp5/mqPLA==
X-Received: by 2002:a05:6512:1248:b0:545:9e4:ca91 with SMTP id
 2adb3069b0e04-5451ddcaf22mr407917e87.39.1739412671798; 
 Wed, 12 Feb 2025 18:11:11 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f105d2dsm32063e87.128.2025.02.12.18.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 18:11:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm: drop i2c subdir from Makefile
Date: Thu, 13 Feb 2025 04:11:08 +0200
Message-ID: <173941266332.601413.7867289561015884943.b4-ty@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250213-fix-tda-v1-1-d3d34b2dc907@linaro.org>
References: <20250213-fix-tda-v1-1-d3d34b2dc907@linaro.org>
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

On Thu, 13 Feb 2025 02:49:41 +0200, Dmitry Baryshkov wrote:
> The commit 325ba852d148 ("drm/i2c: move TDA998x driver under
> drivers/gpu/drm/bridge") deleted the drivers/gpu/drm/i2c/ subdir, but
> didn't update upper level Makefile. Drop corresponding line to fix build
> issues.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm: drop i2c subdir from Makefile
      commit: efc84f661e0a1b73449d678a89ad86d61bbf6bf4

Best regards,
-- 
With best wishes
Dmitry

