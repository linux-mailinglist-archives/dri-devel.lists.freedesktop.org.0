Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957E36776AF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 09:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A4910E322;
	Mon, 23 Jan 2023 08:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64A610E322
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 08:48:25 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id m15so8378326wms.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 00:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fprSFVrrJnip/JTZ37qMzy2gRM9AV21W/+RUwbxSVAc=;
 b=G3wEtCktiXpKXO7gbXkzeOUQSo4i5jg5M1xnnovKINwwAGDloR8BE4pWdIviar144X
 nQUALEqMDZ7NFF2Exd06H67XJp0rRWm1iz261S31dYHt1Q3CWmARWE8jGMiktnddzuLG
 GMX4yFuiMTXXzyZubOKw+I9wQBDmhCkqh91rUHpxzAdQryclK1XLQBnE/xj4GnxJKlrS
 vE26TX9Sq42+jyXFnTawzoukkKfcC4C7dJhWLXxmcziRrbIBDfMfdvYgc5Mt9Hj3pbvU
 lxeLXGNn3VMcwf5CbS74yNr9IER++f6trQBOcMzqKvmb5sUhU6Tt6TUyUxoB2NDbcj06
 nytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fprSFVrrJnip/JTZ37qMzy2gRM9AV21W/+RUwbxSVAc=;
 b=QuX29lKVkT5RCAw42aPVKw2ociAhK3Oo1XCJmbFe2z8YfnC7+5XaohUtgbg1LZMNkz
 MotRwMADnh79CL5pUZ51tIG0V5do2+KrGf1KYorncMzLl7FU42quC+M5VpwfsF/nJWph
 YqWkakrueM5Lan/38KxjwqKWyTgzee68yoKyXyVBzv7/qD07hA09b5Vt2CBwRfax1Mxf
 733KYZkXw09ilUEpZTWMCEJLW6A8GgLtPe5yZOCt3CHwSvOHuKsEIIBPuWv9Gljz23h/
 121Xd2eDFxGbvPqp66QkuqVj4Ana7SyqwLPjbVua/TyomCA/BiWtR5YRp1/Q8l1OZgCn
 oH1g==
X-Gm-Message-State: AFqh2kqfyNfVHzh3af+A9VFci0thfDVLG+1BGGmGIgnukSaQtqYwsHMc
 OSg7sCKoRgx2ErcQDOhlRSSEwA==
X-Google-Smtp-Source: AMrXdXtdtS5fuxBNA0md8yjriXvzIDmJ7LM4InlDyxE/6GHR5d5ygvek+mbvRKs0XNOWmQVq3dTCkw==
X-Received: by 2002:a1c:7216:0:b0:3cf:614e:b587 with SMTP id
 n22-20020a1c7216000000b003cf614eb587mr23472481wmc.26.1674463704102; 
 Mon, 23 Jan 2023 00:48:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a1c7912000000b003db00747fdesm10024711wme.15.2023.01.23.00.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 00:48:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20230123021449.969243-1-victor.liu@nxp.com>
References: <20230123021449.969243-1-victor.liu@nxp.com>
Subject: Re: [PATCH v3 0/2] drm/bridge: fsl-ldb: Add i.MX93 LDB support
Message-Id: <167446370312.2000622.5778653160134240013.b4-ty@linaro.org>
Date: Mon, 23 Jan 2023 09:48:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.1
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
Cc: marex@denx.de, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 linux-imx@nxp.com, jernej.skrabec@gmail.com, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, robert.foss@linaro.org, andrzej.hajda@intel.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 23 Jan 2023 10:14:47 +0800, Liu Ying wrote:
> This patch set aims to add i.MX93 LVDS Display Bridge(LDB) support in
> the existing i.MX8mp LDB DRM bridge driver.  Same to i.MX8mp LDB, i.MX93
> LDB is controlled by mediamix blk-ctrl through two registers.  i.MX93
> LDB supports only one LVDS channel(channel 0) while i.MX8mp supports at
> most two.
> 
> Patch 1/2 adds device tree binding for i.MX93 LDB in the existing
> fsl,ldb.yaml.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: display: bridge: ldb: Add i.MX93 LDB
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5e68a0ca59c0891d6b7da8ae7f6764565ff67c6d
[2/2] drm/bridge: fsl-ldb: Add i.MX93 LDB support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=48865413c9ddab68a774b506b1940af0f6b6089d

-- 
Neil
