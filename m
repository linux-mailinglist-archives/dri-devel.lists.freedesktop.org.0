Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56325BF69DC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 15:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F3210E5E0;
	Tue, 21 Oct 2025 13:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nCFrou7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA5910E5E0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 13:01:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 03EFB6040F;
 Tue, 21 Oct 2025 13:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED48C4CEF1;
 Tue, 21 Oct 2025 13:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761051696;
 bh=bAOSuzIkzsOMAD3DqjZxBinmkAaLtQ6iZXn/jLl6V2M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nCFrou7hkHM2i3UwEjobo/NFRNvv8GUkcdcdedMIjJLBr3GyGSHXvCpUua5SdmUdg
 sMlGwu29ciX1fx5rx3OhTIOpdiCTFK3oqdvOpoI4ej/V87yZfc7WQECv2CDTrzL3cN
 I4ANO5Rx+lLGzEgC6q1pfCGT9LD7oHiRoEG68FZBaIG7D8PWBJw3qhu3ZuDcTFEQZ+
 YS9dVq/de3rffqLGJiA4chc9C9YUmC4yUYP1Ktz1JwkICwiSUlQAouPODfSCuT72j4
 CFlaaRUh9ovua5iNbnQPBmo7LAV2IgmCij3mwFpATmUGuNNyUkUSQYiBJySrzPkmlF
 sb6kkoFNcK+RA==
Date: Tue, 21 Oct 2025 08:01:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, kernel@collabora.com,
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8365 SoC
Message-ID: <176105169286.4039322.13842766904505593753.robh@kernel.org>
References: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
 <20251021-mt8365-enable-gpu-v2-1-17e05cff2c86@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-mt8365-enable-gpu-v2-1-17e05cff2c86@collabora.com>
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


On Tue, 21 Oct 2025 09:30:51 +0200, Louis-Alexis Eyraud wrote:
> Add a compatible for the MediaTek MT8365 SoC, that has an integrated
> ARM Mali G52 MC1 GPU and compatible with arm,mali-bifrost.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

