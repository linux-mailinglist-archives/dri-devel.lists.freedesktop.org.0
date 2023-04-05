Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 510D26D77B5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 11:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE0710E892;
	Wed,  5 Apr 2023 09:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFAF10E892
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 09:05:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F9E7622DD;
 Wed,  5 Apr 2023 09:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982EFC433EF;
 Wed,  5 Apr 2023 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680685514;
 bh=6UOsNk0X2EylcfvdlpsXSdVi0P2RDTf/zQlUU+hIU30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eCQM04hnhxN9QaN2hNVsod74aSBvna4szC05s51/Aejemx6VZiBunQLX3Z+xh8YHL
 skzl4/2sPMH915F88Xk+LFyrcmJg4JV5b9tyHOkuhdSg0qVVeKHpkJRnJaZeugE7hq
 N197X7UteLj7qwbC9AZPiQ+iJDUpbjdr1j2+fLcmea5Lm8fSqVaxGrfbYbOhnhn+fX
 4crzQQMQxyNXfErVI3MCkKqA7dsBDYq+k9FgvXAnVnqf6qKkT1PsXoVj6SmrlVHd6r
 WRtLvWNHy6XS9mXgLmc0raCJ+gK/jMkm/qyRl3zgm0m8EyI114FMt23785MgTuGpNz
 IU81/H82SKcxg==
From: rfoss@kernel.org
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm: bridge: ldb: add missing \n in dev_warn()
 string
Date: Wed,  5 Apr 2023 11:05:07 +0200
Message-Id: <168068549313.3820417.2469721913539804296.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405081058.2347130-1-luca.ceresoli@bootlin.com>
References: <20230405081058.2347130-1-luca.ceresoli@bootlin.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Wed, 5 Apr 2023 10:10:56 +0200, Luca Ceresoli wrote:
> dev_warn() and similar require a training \n.
> 
> 

Applied, thanks!

[1/2] drm: bridge: ldb: add missing \n in dev_warn() string
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8cc0b604f234
[2/2] drm: bridge: ldb: add support for using channel 1 only
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e09220f42b5c



Rob

