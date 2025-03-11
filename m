Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CC1A5CFA8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3957210E06F;
	Tue, 11 Mar 2025 19:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IYROV393";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C57110E06F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 19:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741722307;
 bh=2QZ5+1hf2x2oRIQkI4em1zNoU9lY+dMrOoGs/Ctv6KA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IYROV39306iQpZ4v7jOCgFeyCc1GFXFQBy2yLxFlWEoez5cAFOULJHrEJOqbF8HA6
 ALAt8IwHH+o484vtVn9kZHKGKT4KTARY1Z6dboZQZq96T6uq8CYG7NN9WriNMC1Qvn
 7+dGXWWxSWhKGdYWo2TjKez8ESCpXdIg17CgPb218DJ/cdOGYMSKHIjN+ATD+kbzae
 mPXhpaQDycGyvmrraSBljBoX5HfmVmlHqNwTyBtCoaY6Pmqa/8xBWC72+dd57eHVdB
 ohi0C3fp9QKn+41M/S1ICKIYBygzEAQSA3v8RkhptaHkQwQ+e5Si7nce8unz9A2kkp
 S6nUGrf/paXsA==
Received: from notapiano (unknown [70.107.117.78])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A80C817E1540;
 Tue, 11 Mar 2025 20:45:05 +0100 (CET)
Date: Tue, 11 Mar 2025 16:45:03 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-mediatek@lists.infradead.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 daniels@collabora.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: defconfig: mediatek: enable PHY drivers
Message-ID: <717b84da-f307-41e9-9dc3-67ea653cac5f@notapiano>
References: <20250311061703.16850-1-vignesh.raman@collabora.com>
 <dc659e19-c1ae-42d8-84c9-0d2aafa81fe2@kernel.org>
 <daa0733c-14e3-44df-8374-33aba6662813@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <daa0733c-14e3-44df-8374-33aba6662813@collabora.com>
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

On Tue, Mar 11, 2025 at 05:26:37PM +0530, Vignesh Raman wrote:
> Hi Krzysztof,
> 
> On 11/03/25 12:54, Krzysztof Kozlowski wrote:
> > On 11/03/2025 07:16, Vignesh Raman wrote:
> > > The mediatek display driver fails to probe on mt8173 and mt8183 in
> > > v6.14-rc4, with the following errors:
> > 
> > Which boards?
> 
> These are the boards,
> https://lava.pages.collabora.com/docs/boards/chromebooks/boards/hana/
> https://lava.pages.collabora.com/docs/boards/chromebooks/boards/jacuzzi/

You can use the Devicetree name to identify them in a way that's meaningful for
the kernel:

mt8173-elm-hana
mt8183-kukui-jacuzzi-juniper-sku16

Thanks,
Nícolas
