Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF3D7A7A00
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 13:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBBB10E481;
	Wed, 20 Sep 2023 11:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB27210E481
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:05:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 08A52CE19B8;
 Wed, 20 Sep 2023 11:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD56C433C7;
 Wed, 20 Sep 2023 11:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695207952;
 bh=Zi2Khccv/+i3nHyL8HWXKarAMeRR6q2SDsIIdj9WjLw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QZAzfUWyIrW1UkrFhWnimGWt0RUa41ZoOyQIq3IqsrmusEa77/nnqrE4WDy27YRNo
 gcx4u6GK/O3BiPxlqa1nr6uE5gc2RYfQMY9e3fgoZqOC5ut70GaeNHKvc/6Q7EZ3se
 PJF/W1n3oibfu7qU+jJqlV7TSRfPDz9un18eyQsG94VMvUYpfJWKuqKVSMo/A2dxpT
 Uqf+2SERqwdMfnHtJWKdoHai7IO/QJbeLZWo4OEryXKw9ppI3Gg0MmZtn9PQMH42wj
 l0KAGgOCQFppwwpPIPZLQ7+63pLsLJD81keih44+qnYPQTVzRK7nLojzJB88A0jyqa
 chZB0WZ2Riq7A==
From: Robert Foss <rfoss@kernel.org>
To: dri-devel@lists.freedesktop.org, Alicja Michalska <ahplka19@gmail.com>
In-Reply-To: <ZPvagaXnQ/TlNEkJ@tora>
References: <ZPvagaXnQ/TlNEkJ@tora>
Subject: Re: [PATCH] drm/bridge/analogix/anx78xx: Add missing definition
Message-Id: <169520795049.2886650.4710970227040679417.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 13:05:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: neil.armstrong@linaro.org, andrzej.hajda@intel.com,
 Laurent.pinchart@ideasonboard.com, jernej.skrabec@gmail.com, jonas@kwiboo.se
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 9 Sep 2023 04:37:53 +0200, Alicja Michalska wrote:
> Analogix ANX78XX driver is missing definitions for anx7816.
> It uses the same I2C register set as anx7818.
> 
> 

Applied, thanks!

[1/1] drm/bridge/analogix/anx78xx: Add missing definition
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bb9fb4a42de1



Rob

