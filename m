Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 781AA6D7ABB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 13:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD6510E8D7;
	Wed,  5 Apr 2023 11:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C8B10E8D7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 11:09:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2B59636CD;
 Wed,  5 Apr 2023 11:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D610C433D2;
 Wed,  5 Apr 2023 11:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680692971;
 bh=lnf0iwuUDvW9wdbteItQFxCNsHUmMoHMnP8PazM8nBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a7NW/CPt4JISpyNjcdqip0YL/J2vq8qDkU3bJaCNKWMvuo1ZgPdfkJ09kec6x7TCg
 b1dX8EmxVYJoHc0DtyGJRJ84ZjrCsbO4PWyIHqvSvxEUutgD3/VLPWuWkqwNJYyr/+
 Mr6sl0tVDI25CDQGzRItPHyQjFTPAECDQExHka10swpM3BPrDbjbtIJUBRMmRrc3aW
 4fRE+cb8ibMXzMgep6u5NIlbw1wBIxRzS8ei8Lg+4K5ms4Egd/hh3RJ6qP5WRqZMvZ
 t3YW++LU4ymToZ8QammXDATgYdAYue0ubAkZJjZhObpoUFJkJAcEp3FqaK1ABoeWeB
 CQJhrqSlkFXrA==
From: rfoss@kernel.org
To: Marek Vasut <marex@denx.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Do not generate HFP/HBP/HSA and
 EOT packet
Date: Wed,  5 Apr 2023 13:09:26 +0200
Message-Id: <168069295019.3846853.1518463992289825801.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403190242.224490-1-marex@denx.de>
References: <20230403190242.224490-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Mon, 3 Apr 2023 21:02:42 +0200, Marek Vasut wrote:
> Do not generate the HS front and back porch gaps, the HSA gap and
> EOT packet, as per "SN65DSI83 datasheet SLLSEC1I - SEPTEMBER 2012
> - REVISED OCTOBER 2020", page 22, these packets are not required.
> This makes the TI SN65DSI83 bridge work with Samsung DSIM on i.MX8MN.
> 
> 

Applied, thanks!

[1/1] drm/bridge: ti-sn65dsi83: Do not generate HFP/HBP/HSA and EOT packet
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ca161b259cc8



Rob

