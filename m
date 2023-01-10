Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C036D663CF9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 10:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E4A10E574;
	Tue, 10 Jan 2023 09:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9E910E574
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 09:34:26 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4AA566602D6F;
 Tue, 10 Jan 2023 09:34:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673343264;
 bh=2X++/CX/YTAfIcjlM+DL6gfRl75tPuYYPGsfmxgOiGE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OefKhWDdnqvlYAqc/ThdX441MkImgzCrRjY1+pFgFjiOCZjJ/XehLQdzQ/ZF//jzD
 iXBkxh8mqvB/O3bJr0gpVcEnZ4CCrw/1pa59q1NrWTYhtk2PZBnise3AQrLYCpLz65
 4GPR/9wf+MXUjIP9QZ1/QdB5VooBClY/wMD7z+enttc9fo0+oM+L14mblHmMzaTtf+
 1Xl/TrHJxxgefbGblH3l0yjTpDvlfl92VKQba3ajbhshYj9+62IeHLXFNJ3LcGA47z
 w4MpK7ARbvRw6/td8yfjypsT0TDzZRIuvC17+0/WIHkzX4GmdA26QRf64u4Odr4S2A
 p0VNLfnOwsWKA==
Message-ID: <9102d7a1-e40d-1201-f1e8-eeb12923502a@collabora.com>
Date: Tue, 10 Jan 2023 10:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/mediatek: include missing headers
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230110091647.13265-1-miles.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230110091647.13265-1-miles.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 10/01/23 10:16, Miles Chen ha scritto:
> Fix the follow sparse warnings by adding missing headers:
> 
> drivers/gpu/drm/mediatek/mtk_cec.c:251:24: sparse: warning: symbol 'mtk_cec_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:221:24: sparse: warning: symbol 'mtk_disp_ccorr_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_disp_rdma.c:390:24: sparse: warning: symbol 'mtk_disp_rdma_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_disp_gamma.c:209:24: sparse: warning: symbol 'mtk_disp_gamma_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_disp_ovl.c:565:24: sparse: warning: symbol 'mtk_disp_ovl_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_disp_color.c:164:24: sparse: warning: symbol 'mtk_disp_color_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_disp_aal.c:161:24: sparse: warning: symbol 'mtk_disp_aal_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_dpi.c:1109:24: sparse: warning: symbol 'mtk_dpi_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c:340:24: sparse: warning: symbol 'mtk_hdmi_ddc_driver' was not declared. Should it be static?
> drivers/gpu/drm/mediatek/mtk_dsi.c:1223:24: sparse: warning: symbol 'mtk_dsi_driver' was not declared. Should it be static?
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


