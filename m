Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE801D95A4
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 13:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DF56E317;
	Tue, 19 May 2020 11:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875C56E317
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 11:49:18 +0000 (UTC)
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 25D5E20758;
 Tue, 19 May 2020 11:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589888958;
 bh=gt+DL+h2Jj48KB77zFys0B0Z8pdsBWERL6n/XavhLUU=;
 h=Date:From:To:To:To:Cc:Cc:Subject:In-Reply-To:References:From;
 b=zWtqkPDItTlUx+MqRZN1NurUjdIXCOdHMBZDtThcoQVNyxZZmo4NPiiIigEuEIccw
 urT77pytAZl8csK6oOQlB6r9RDfDRilY5jaO0kKoKJTg8d4G03IkG1ib4sgWeARs/g
 9TtpI1EL3LUh0ihcj6N56mddCnIVMZTARAdcSExQ=
Date: Tue, 19 May 2020 11:49:17 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 06/12] gpu/drm: Ingenic: Fix incorrect assumption about
 plane->index
In-Reply-To: <20200516215057.392609-6-paul@crapouillou.net>
References: <20200516215057.392609-6-paul@crapouillou.net>
Message-Id: <20200519114918.25D5E20758@mail.kernel.org>
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
Cc: od@zcrc.me, stable@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 90b86fcc47b4 ("DRM: Add KMS driver for the Ingenic JZ47xx SoCs").

The bot has tested the following trees: v5.6.13, v5.4.41.

v5.6.13: Build OK!
v5.4.41: Failed to apply! Possible dependencies:
    52e4607dace1 ("gpu/drm: ingenic: Use the plane's src_[x,y] to configure DMA length")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
