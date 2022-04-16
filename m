Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C2E5045A5
	for <lists+dri-devel@lfdr.de>; Sun, 17 Apr 2022 00:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046D510E094;
	Sat, 16 Apr 2022 22:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D56410E094
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 22:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1650147707; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c/WEy9igLdMF6qXHZ2Fu05qwd1kA31Bd9CuNUZh2kOA=;
 b=D6u9xReUm4GM9kw5rMxGs2ezpzAEIk90Li/60w5xPTaOquVxS1ZHIBuE+16ohgASdF+ZLH
 LbeN5P6T8LFemxN2dzREfB3hBq20bLwm/QnkI5IpkfpTWuWNWmb4RRQ4dtUT7weApqN5zf
 N+0Uu23laIyhyki9BSMILsbVWdUhlXk=
From: Paul Cercueil <paul@crapouillou.net>
To: paul.kocialkowski@bootlin.com
Subject: Re: [PATCH v3] drm: of: Properly try all possible cases for
 bridge/panel detection
Date: Sat, 16 Apr 2022 23:21:41 +0100
Message-Id: <20220416222141.72321-1-paul@crapouillou.net>
In-Reply-To: <20220329132732.628474-1-paul.kocialkowski@bootlin.com>
References: <20220329132732.628474-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
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
Cc: thomas.petazzoni@bootlin.com, airlied@linux.ie, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jagan@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

This patch breaks the ingenic-drm driver.

It calls drm_of_find_panel_or_bridge(np, 0, i, ...) starting for i=0, until
-ENODEV is returned, which does not happen anymore.

The idea is to probe all the connected panels/bridges, should it be done
differently now?

Cheers,
-Paul
