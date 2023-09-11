Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E81379A7B7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 13:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD5C10E2D3;
	Mon, 11 Sep 2023 11:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CAF10E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 11:51:19 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-401bbfc05fcso48223495e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 04:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694433077; x=1695037877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ww454ABm0e8trsLnc33ejqXe5wnztAS93RgRcAuT70E=;
 b=reqKhQI+vdnIDF8fk4Zv1E2MZL/J+bqOSfzZEgcyKen2UrhVR4HwSMdF4qcTArvxb9
 u1qvgszLI9E6pIYCwYkCURvDLaHUcpE1Qd/deJ/eDuTKDAvOo/v9zzhOPZhbi9QlyeM8
 i4GJkUyFxL5dF3BRGsMu9vpUkTXX73VfwLQlxefxo14dpuH5/UVkvPzvfIfWe2gSHU3B
 rtGMRm5R6OmVK6AK9aNVv0XDhAHoQG9CSIuoiAC6ZM3GWwiLmoVkhlHsWvHh6zeZFpQl
 Q3JnxBURLNZeAcqS2ybmiJ4/Uewg4YcD4c91Q5AfRppLV3V87poD9KSJsyQBHxbF6dfn
 MxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694433077; x=1695037877;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ww454ABm0e8trsLnc33ejqXe5wnztAS93RgRcAuT70E=;
 b=FS5mMNDQvhBrOEb3YE0/rO+2nJpYyBIoyCgVx/OTMIPEW6reMw4GtKiBM+Q5PXkKRw
 4y5Swti4SLb3GvZ0UypL60120XRSe9dJ/bstfqPanvLvKF55eKAVIEV+IrOp70hmS+10
 fMbp0rxYMQz6TY1DRAxn4gy9tePN+3WC5ZN6byXT5CFCgCK/cjR18Ea2KJO8sxA+KqIg
 9Ta4Rfs5dWkPoBTLRxQE344sicD4hpHI39n66SltFr6p2mqI/CgoTOoRG2LjRgx28ida
 il+oQaIh3LOSRVg2pnxA3dNoGfCjajoSlPOsFpT74QDbh9pHAqxWUDdRlsZcJRi59VwO
 F0Qg==
X-Gm-Message-State: AOJu0Ywau7OGU+3AiuDwGSi1wjItpnpztBpv+VIEnVl3FI8nFP1pZ5Dk
 833H8pi9DeHYsrBnYUlbM/UhPw==
X-Google-Smtp-Source: AGHT+IEC51HEOzB8YLu5pRlRlfDq6GnSU+STLPmLRPMCzXSUm1O2JEARrpIN5nbrnIAngXmVrT+ruA==
X-Received: by 2002:a7b:c7c6:0:b0:3fe:f726:4a94 with SMTP id
 z6-20020a7bc7c6000000b003fef7264a94mr8824039wmk.14.1694433077663; 
 Mon, 11 Sep 2023 04:51:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05600c044e00b003feff926fc5sm9750210wmb.17.2023.09.11.04.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 04:51:16 -0700 (PDT)
Message-ID: <a5321150-4ace-9bd2-fc5b-462a4ccc130c@linaro.org>
Date: Mon, 11 Sep 2023 13:51:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] arm64: defconfig: Enable DA9211 regulator
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 linux-arm-kernel@lists.infradead.org
References: <20230911104139.617448-1-vignesh.raman@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230911104139.617448-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: peng.fan@nxp.com, emma@anholt.net, catalin.marinas@arm.com,
 dri-devel@lists.freedesktop.org, rafal@milecki.pl, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be, robdclark@google.com,
 david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, nfraprado@collabora.com, daniels@collabora.com,
 arnd@arndb.de, mripard@kernel.org, helen.koike@collabora.com,
 anholt@google.com, linux-mediatek@lists.infradead.org,
 robclark@freedesktop.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
 konrad.dybcio@linaro.org, dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/09/2023 12:41, Vignesh Raman wrote:
> Mediatek mt8173 board fails to boot with DA9211 regulator disabled.
> Enabling CONFIG_REGULATOR_DA9211=y in drm-ci fixes the issue.
> 
> So enable it in the defconfig since kernel-ci also requires it.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>


Your CC list is a bit too big... Just Cc Mediatek SoC maintainers and
that's it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

