Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3BC95BB56
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 18:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA31210E0AA;
	Thu, 22 Aug 2024 16:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="IiOdQCtl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFB910E0AA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 16:06:42 +0000 (UTC)
Delivered-To: angelogioacchino.delregno@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724342797; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OhKSG5vD8zTqFxCWiUl939PMcq1y48WA22QvvGEuDbpgijj5N2ppSwWR4N4F2Rr+30HtzvJSK2cUgdlddAXK3+aGm7Y1N9znVNNbl/aZydonZeTHopWdaBhLN9ncVlHV2ljQAuKOHgAPTWvXJEPUn90+uj3IgACEFeyO62ULfww=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724342797;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=87tmlEsafAzofaY1NSGv3qtcgJLjPPfLzmQEl9/8F0A=; 
 b=jhF31cqoR7O8s++GB+a2HDMnjCnOQH9ETIcdtn3PcjmlesTGzGbdCtPyYhdDtQ9H8gt1YqniUSjEiZtmpLgnLfdWJp3YdG9eM36wEt8yojHSxDg9FKIWRd6YtQ5nUtFWtutv/kf5XLj042qo/8NWTUDZBs1MHkAAAOp/SCq8TU0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724342797; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=87tmlEsafAzofaY1NSGv3qtcgJLjPPfLzmQEl9/8F0A=;
 b=IiOdQCtl4ydhm6JZ17+vy+2AW34dFmBecENcFxD+RkyMDd0bUHMCglExIoeTChTu
 lphYP9EC7nOoXwTf/9xC3ND/TOyvdx9JE+mmrdxrHLPPWG4+UENuRMezwCIvR7XHw2I
 85qNfHVQ6eb2WS8Bt+WuLi37hlCMKbWAVEOKa7Aw=
Received: by mx.zohomail.com with SMTPS id 1724342794590410.25595519500223;
 Thu, 22 Aug 2024 09:06:34 -0700 (PDT)
Date: Thu, 22 Aug 2024 12:06:31 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Rohit Agarwal <rohiagar@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/3] arm64: dts: mediatek: mt8186: Add svs node
Message-ID: <545e9e80-5b38-40f5-9a23-ff5112b13917@notapiano>
References: <20240822064650.1473930-1-rohiagar@chromium.org>
 <20240822064650.1473930-4-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240822064650.1473930-4-rohiagar@chromium.org>
X-ZohoMailClient: External
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

On Thu, Aug 22, 2024 at 06:46:50AM +0000, Rohit Agarwal wrote:
> Add clock/irq/efuse setting in svs nodes for mt8186 SoC.
> 
> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index e27c69ec8bdd..a51f3d8ce745 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -1361,6 +1361,18 @@ spi0: spi@1100a000 {
>  			status = "disabled";
>  		};
>  
> +		svs: svs@1100b000 {

There's already another node at address 1100b000:

		lvts: thermal-sensor@1100b000

You should set the starting address of the SVS to 1100bc00 and decrease the
iospace for lvts to avoid intersection. See this commit for a similar change on
mt8195:
https://lore.kernel.org/all/20231121125044.78642-21-angelogioacchino.delregno@collabora.com/

Thanks,
Nícolas
