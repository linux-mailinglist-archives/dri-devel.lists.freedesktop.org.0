Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DA2611488
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 16:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EB210E84A;
	Fri, 28 Oct 2022 14:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD89110E84A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 14:27:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id y10so3336016wma.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 07:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I8uTjmTgDl9cTXcnHuhRfW69h3WUIxNN9Nt33f9aCM0=;
 b=D/SpFYlC8Zu22pLXMx8S5Hjj44Wb2SrY8FW39yaXE1r0q/velZ4e8giEx9PDdqWUHu
 4uQRJapO6PZLUizXWzsyCPzfCLF5zLMIxy0Bl/7XQfEjf3XhX7nHekgo6pSbND287SaI
 qKt5gONOcCup05S2AcNwRBz0Vb+LHcuqV16Cfzm/HBuKiSlh/7b2nI5mDBfiRYkeXKJk
 BzSq6aWfsnu0F5nfS8jHbe/nCIJn2CsxKPMf2ygBVrVSdhHXRPlvjVmuUZbpFRzim5Ho
 yqUhVwPkGJDWy0dmeXet9add0Dd+iZ46MnpY9qZf/VYVCicSlsGQBdeO56Uh8SOszlrJ
 G9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I8uTjmTgDl9cTXcnHuhRfW69h3WUIxNN9Nt33f9aCM0=;
 b=ddoiyVAZE/tNBvW7ZRDQGv+bZgfrN1fUrWeK7J+gR9GFLGbp3veTBvjAPjOhd2hYqS
 +jcM/3ZjIE4xD4ZzeaK+w7QC2Hf8tMOisJFkuHUUrypBtuqP/9akUyQIzcC8Qexnrcd0
 YTfPqjIYSo6citnvQAYxKsF9KrYDr4ggtEB2L/r4N+xypPH47AhGv/SBDdzLkvlUBEsY
 L9RVDo/dgmbmAHGMaKF2x/wxB6HHzn9IzaFCw5xq0MSatdnuMunum57dUVGsOd5jFWjA
 EAMfpAz1xL2a2TNaN1xS5fXUpaqWe36QpDte0WAjDKWefLuX47WkBqKZsJZ5hcN3jI85
 kgug==
X-Gm-Message-State: ACrzQf0Uem46zNv3cx94CNPUtKYIuHhHC2v72E1cJNWXqnFDIpGlBFRF
 eN6DnS+pPNN8gOi0C8oxSjVrZQ==
X-Google-Smtp-Source: AMsMyM4Vqq56LjT96b5RxTO8K2G/AAPSN5OZztLKI98rBQ3IhiMBcvfgKfMgJw5xI/SJ8ZMEhDThYg==
X-Received: by 2002:a05:600c:3b1d:b0:3c6:ff0d:6a60 with SMTP id
 m29-20020a05600c3b1d00b003c6ff0d6a60mr9712623wms.183.1666967260275; 
 Fri, 28 Oct 2022 07:27:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a7bce06000000b003c6c76b43a1sm4179717wmc.13.2022.10.28.07.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 07:27:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
In-Reply-To: <20221026125246.3188260-1-a.fatoum@pengutronix.de>
References: <20221026125246.3188260-1-a.fatoum@pengutronix.de>
Subject: Re: [PATCH v2] drm: bridge: adv7511: use dev_err_probe in probe
 function
Message-Id: <166696725937.855825.511703215271737930.b4-ty@linaro.org>
Date: Fri, 28 Oct 2022 16:27:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 26 Oct 2022 14:52:46 +0200, Ahmad Fatoum wrote:
> adv7511 probe may need to be attempted multiple times before no
> -EPROBE_DEFER is returned. Currently, every such probe results in
> an error message:
> 
> [    4.534229] adv7511 1-003d: failed to find dsi host
> [    4.580288] adv7511 1-003d: failed to find dsi host
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm: bridge: adv7511: use dev_err_probe in probe function
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2a865248399a13bb2b2bcc50297069a7521de258

-- 
Neil
