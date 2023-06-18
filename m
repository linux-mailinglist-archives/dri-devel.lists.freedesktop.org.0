Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15A27346AB
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 16:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1DF10E0AD;
	Sun, 18 Jun 2023 14:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A8810E0AD
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 14:41:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0AD560AB7;
 Sun, 18 Jun 2023 14:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0163FC433C0;
 Sun, 18 Jun 2023 14:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687099266;
 bh=K36LPtS7cFKbuaUZZHHl8/j5LOCx0vREpCqqg84LxhQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=g5FmtpsXsxlyL8WSTaxSAFvrq5V2AHMQrdpxG+NLFPJ2bcfYtsFkxLUJmjDE21toq
 lM6tENWltMRMB+KB27NhSzxW73YnnKTxR7lVdrsONMbGth9/8+BB3oXQTlfdlkTj67
 YkDRn+WCVmQe1N6ADH0xR0LlFUIGolUHAlem7/5Y6/aghaI1PmiwRjUP4v63GvEFh3
 YpnFPne4jkSNhmN+E/H35mka0XtUaW3LbBMax1phFeMzZgiuPMi9HqPUmgYVF1zjHG
 3gjumGPmz8OzUgYA0vxuW82f/E35gdRvhktVFvj66RyybpCUCz2nn2nAow5a6TKMkr
 ixBH++RLpZsfA==
Message-ID: <19d00fbb0a27f1ab5f8685ba45422702.mripard@kernel.org>
Date: Sun, 18 Jun 2023 14:41:03 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 6/6] drm/panel: sitronix-st7789v: Check display ID
In-Reply-To: <20230616163255.2804163-7-miquel.raynal@bootlin.com>
References: <20230616163255.2804163-7-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Thierry
 Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael
 Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Jun 2023 18:32:55 +0200, Miquel Raynal wrote:
> A very basic debugging rule when a device is connected for the first
> time is to access a read-only register which contains known data in
> order to ensure the communication protocol is properly working. This
> driver lacked any read helper which is often a critical piece for
> speed-up bring-ups.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
