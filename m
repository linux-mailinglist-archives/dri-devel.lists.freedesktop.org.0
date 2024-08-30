Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A3D966946
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 21:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232E710EAE3;
	Fri, 30 Aug 2024 19:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="S2iJPtbD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 550 seconds by postgrey-1.36 at gabe;
 Fri, 30 Aug 2024 19:05:03 UTC
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E731F10EAE3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 19:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725044151;
 bh=IHK+Ntd8fM5v8Ld8ghChA+2WvtW78d2VyJV67u5VSsw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S2iJPtbDNO7YHcg1+4daBeQVQMv0AHjjYygS1s7EJCHZP8HXJy9iWQzl+gl/7ICmP
 ZCx4p66CN5fsbWJ6ga4UV42jcVG9s7mym1irLmgg2f9Hu0uywysYwiemK93yXuHq8J
 njuK0n/zdgQWbBr0EBXW6F8h0AB5ALMltYrbOFBcWzojfwgtldTmf79tzj4alBJ9DB
 t/Q2XYxBg6gALtFnmw7PlotW3LuKXQ68LhHncJk12IpuUgUOpxMEXZ9KYR4VhZRRuN
 vb0mtQgFZgTupyBz3pvIwMp0UWlKlJyOQjqNQqHECLbfjOBvkLxpqp71rafgpvzwTC
 MsXkvd7Il56MQ==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net
 [100.2.116.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A06E17E10DB;
 Fri, 30 Aug 2024 20:55:49 +0200 (CEST)
Date: Fri, 30 Aug 2024 14:55:47 -0400
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
Subject: Re: [PATCH v4 3/3] arm64: dts: mediatek: mt8186: Add svs node
Message-ID: <ccc4f1cd-c57c-417b-8f34-6b1e45cec6e2@notapiano>
References: <20240830084544.2898512-1-rohiagar@chromium.org>
 <20240830084544.2898512-4-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240830084544.2898512-4-rohiagar@chromium.org>
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

On Fri, Aug 30, 2024 at 08:45:44AM +0000, Rohit Agarwal wrote:
> Add clock/irq/efuse setting in svs nodes for mt8186 SoC.
> 
> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Although FWIW the SVS driver fails to probe as is, as for MT8186 it expects
"cpu-big", "cpu-little" and "cci" thermal zones, which are not present in DT
currently. The first two seem to be a matter of renaming (eg there's cpu-little0
and cpu-little1), while cci is completely missing in DT.

Thanks,
Nícolas
