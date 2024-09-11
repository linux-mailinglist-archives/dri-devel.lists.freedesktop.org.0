Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E780F9751E4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 14:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D73C10E9D3;
	Wed, 11 Sep 2024 12:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OxWCdQr2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8C410E9D3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 12:21:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 60CE1A44BFD;
 Wed, 11 Sep 2024 12:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE63C4CEC5;
 Wed, 11 Sep 2024 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726057286;
 bh=zkDvPHD9waoczVeuUBXDcIZtXJB7vVQr6OpezhAsA7M=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=OxWCdQr2Nm0/vPl2R1022IHDtP+rFkNsshVwj02hnbRH/pNEpV6Cc/TPmmT3kFB/D
 geRxpdp8cdVcFGXXGtixEaeD7RJHJjdhKakYPTnyOB2Cj5psLwbdq/c0wbT/3Inu2U
 bwZxhOZJL0KG9Fau8G/Wi3Il+NUoTgQe7vaP/+xNyQPU8Ivx4ars0WY44WSVmbs/38
 weCeT1zVccLLJSgUIW3fQbaWsVaeUprOJJQ6a0uHZ9CONHfhwLTsajOy8ujfA8UOuh
 cQzCth31qOT0Xs079KjOFEdTp529LUBIM0ooRVd3GHa7gPmNYJ9/qjh83A3SjgpIKP
 2C7Bxp3rF1K9Q==
Date: Wed, 11 Sep 2024 14:21:24 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>, 
 "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "bentiss@kernel.org" <bentiss@kernel.org>, 
 =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>, 
 Orlando Chamberlain <orlandoch.dev@gmail.com>, 
 Kerem Karabay <kekrby@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: Re: [PATCH v5 0/10] Touch Bar support for T2 Macs
In-Reply-To: <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
Message-ID: <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Sat, 31 Aug 2024, Aditya Garg wrote:

> Hi Maintainers
> 
> It has been 2 weeks but I still haven't received a single reply on this 
> version of the patch series. Consider this email as a friendly reminder.

I think it makes most sense to take this whole set through hid.git, but 
for that, I'd like to get Acked-by/Reviewed-by for patches 9 and 10 (drm 
bits).

Dave, Daniel, .. ?

Thanks,

-- 
Jiri Kosina
SUSE Labs

