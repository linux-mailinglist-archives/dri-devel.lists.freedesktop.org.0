Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060DE7E5A1F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 16:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3449D10E168;
	Wed,  8 Nov 2023 15:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A56010E168
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 15:35:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2531CCE10DA;
 Wed,  8 Nov 2023 15:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2072FC433C8;
 Wed,  8 Nov 2023 15:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699457745;
 bh=IgF6+bXpdf75WXeAvSDDhYfuqLKw54SZ5acCbfcmfCM=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ARShJAydwt6xGIMUHXoxDBU8oryuoqHXFOpcQQ+d6cLMDU6EO46fqFyeQ7KsP0K4l
 q+CM7FpfXEnnbhVVjBVjiKtoyxzB+daPnZPVAjRAKAIGjCrEhKFTwPi2ueWf5tWo6g
 dRzVSUVYl18keZDoeuT35fzRactdWJDiDuxTezN93qDJoJx60XLoGTiQuIJNnbAN3S
 3Z/9CM7IfAaI95wSbzJLiwbMav40wi0PRuKVCqXX79mL3YO3v5N/v9ogEvh1uI050t
 cb6P/uqg/ZBClDcMKzizo23lyL1zRhLfFuCZffLl1qLIh/0/rIH1IaRpTm8xcHlbcb
 /hRAJ/91WuEcA==
Message-ID: <302dfeb3069105f55d516d5b474cae18.mripard@kernel.org>
Date: Wed, 08 Nov 2023 15:35:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Hsin-Yi Wang" <hsinyi@chromium.org>
Subject: Re: [PATCH v6 1/5] drm/panel-edp: drm/panel-edp: Fix AUO B116XAK01
 name and timing
In-Reply-To: <20231107204611.3082200-2-hsinyi@chromium.org>
References: <20231107204611.3082200-2-hsinyi@chromium.org>
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
Cc: Maxime Ripard <mripard@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Douglas
 Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Nov 2023 12:41:51 -0800, Hsin-Yi Wang wrote:
> Rename AUO 0x405c B116XAK01 to B116XAK01.0 and adjust the timing of
> auo_b116xak01: T3=200, T12=500, T7_max = 50 according to decoding edid
> and datasheet.
> 
> Fixes: da458286a5e2 ("drm/panel: Add support for AUO B116XAK01 panel")
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
