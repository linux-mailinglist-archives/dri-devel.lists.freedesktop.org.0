Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D242804C3E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FEA10E4A7;
	Tue,  5 Dec 2023 08:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE9010E4A1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:26:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40bd5ea84d6so16997535e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 00:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701764814; x=1702369614; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u8z1G//lxs01T/5lt3W2SRfFFQQSfR5y5qtuiOgOqS8=;
 b=AXKm4RR3HU8pPE+Po++7Lv5BfdyKy1QADy/yLLAslVcGOd3+OItLJ2CGkUfW6fv4ru
 d23bRQR20GbqKwM5pLvL43cniQhjUaAcc70lBk17+kLCcH6clW8cOJ7l6dp01or6QTPz
 VSDEFfvy8qNNHBQ6GCwQ3YQZ8wlUltXg+tqYJN9/11B85hOb6kfMDJF6dd0JMjngRHxO
 D2nCwP8ylupsbk4O1rBVbQ+PwPjTCBos8ZVxKpuNElkUIdRx0ruRvBKOyjU8pXUliROZ
 9LgqheHkYXbaQi35qOSo8IjSVJw0huOz+WVqmWr9MdZ3npucD+vmrps7lkPrq+h7u3gZ
 EFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701764814; x=1702369614;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u8z1G//lxs01T/5lt3W2SRfFFQQSfR5y5qtuiOgOqS8=;
 b=er7YAQYK+wfbJKSnbL31zBsKOt34apQ0iYJyRmZ5kUAlMiSTqT+Hw1fhBL/UZqMmS/
 Vs90zNAgoi5CoLP3TVbx/qoAkfOYU0eFtvMgw+ScI4AiVTy27Kb8BtpppW3KZ8NVjUUC
 QUfcpp/UYz9m8dDUvDQP/nyDMBQhpghpHWeUp/tX3mEas8CLHJW4IsYXywS3HCSMSnL5
 TJbIt+iD5mld59VYNqiknsVYPD4uJHGihhTUA+crUEdTzomzZzoaPH2MobyXsSE9bqek
 n8lUq+inJX32Z8v1q80rpbt5JkLVXabExEVld+1DjVa5PqmSili3T72GwX8imo22xWyj
 eOtA==
X-Gm-Message-State: AOJu0YwO7g4QN1f/P2FIre8LiFm/+YGc7TRfd+v2rqBLAhd2QtuQWH4e
 14gPqXsMff4vcqjvr9Rdbhs+3Q==
X-Google-Smtp-Source: AGHT+IFCMMvrABPHwS0NJdVCcXSdpuq3NACgGkVh6j9EYUzk74mmdJWxN4/71i9g2VB1GlznRsJr2w==
X-Received: by 2002:a05:600c:a02:b0:40b:5e56:7b6b with SMTP id
 z2-20020a05600c0a0200b0040b5e567b6bmr283025wmp.180.1701764814623; 
 Tue, 05 Dec 2023 00:26:54 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a05600c3ac400b0040b538047b4sm21329282wms.3.2023.12.05.00.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 00:26:54 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
In-Reply-To: <20231123-drm-panel-ili9881c-am8001280g-v1-0-fdf4d624c211@pengutronix.de>
References: <20231123-drm-panel-ili9881c-am8001280g-v1-0-fdf4d624c211@pengutronix.de>
Subject: Re: [PATCH 0/3] drm/panel: ilitek-ili9881c: Support Ampire
 AM8001280G LCD panel
Message-Id: <170176481371.4073725.12586560786525230750.b4-ty@linaro.org>
Date: Tue, 05 Dec 2023 09:26:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marco Felsch <m.felsch@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 23 Nov 2023 18:08:04 +0100, Philipp Zabel wrote:
> Add support for Ampire AM8001280G LCD panels to the Ilitek ILI9881C
> driver.
> 
> Also set prepare_prev_first, to make sure that the DSI host controller
> is initialized to LP-11 before the panel is powered up. Tested to work
> with samsung-dsim on i.MX8MM after commit 0c14d3130654 ("drm: bridge:
> samsung-dsim: Fix i.MX8M enable flow to meet spec").
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/3] drm/panel: ilitek-ili9881c: make use of prepare_prev_first
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=68c193c8d4a403222ce51c8b08bd1715f8b74274
[2/3] dt-bindings: ili9881c: Add Ampire AM8001280G LCD panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=7ff02f82c3e9ddd5dd81957c8659d350261196ae
[3/3] drm/panel: ilitek-ili9881c: Add Ampire AM8001280G LCD panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2748848ceaf32671927c3b19672ba3104a1dba7e

-- 
Neil

