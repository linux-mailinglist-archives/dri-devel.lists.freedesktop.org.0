Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0606B67A8A6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 03:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B1A10E292;
	Wed, 25 Jan 2023 02:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE8F10E292
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 02:16:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3B7BB816C8;
 Wed, 25 Jan 2023 02:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F002FC433EF;
 Wed, 25 Jan 2023 02:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674613011;
 bh=zZoiazOdr0WVIgnfYHUQMchhbVuc3yE58s/t/MbFb/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rfYtBn0/kLxdndFPFB/peNmT7my0W5DSbnUTufb8LrtKnzGt4nyu5Kobxr19VcVae
 CgH0cN2/SoWPzynaXi4divhYZ0iMOM6MXPAyOwfJXtUNZxTBlDIFUFCNGYL3gbrctp
 moiYjlVdr8ftyFQEBuvQ8LJgedURQOsTfc/icFcKQp1eN0w5i3LiFBGzPfpLqzQiEd
 LErVKgwlm2eNC6ch3v5MG+RoIPnHRNpflUcgZGoyag32kN+kdmCofbocaZP+BX42G6
 i+AucnGRVtC+2W3IeeUwT5A7s1GNOd7qLdkwt2L04c9nLnHME9+80CnDSUyr5c2uFH
 GFSJRrQSxcFow==
Date: Wed, 25 Jan 2023 10:16:44 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 3/6] ARM: dts: freescale: Use new media bus type macros
Message-ID: <20230125021643.GA20713@T480>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615221410.27459-4-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 16, 2022 at 01:14:07AM +0300, Laurent Pinchart wrote:
> Now that a header exists with macros for the media interface bus-type
> values, replace hardcoding numerical constants with the corresponding
> macros in the DT sources.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied, thanks!
