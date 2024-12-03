Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717159E1EBE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397A610EA09;
	Tue,  3 Dec 2024 14:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="j7R0Eerv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8083710EA09
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 14:12:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733235130; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MPZXdW8Y3hPGPnRj2DfwUcn1zkCEX3n+Zyk4APU5ZUhJ2A91OrjUD00lyiFo2EZ4tb9ab8kWl8gA3vlsSBJz0qfX0MY3O5NMvNImZb8iy4DGUF2nGFrQ2xlp3RkZ6pfNbylgBeCHXaPpyW/VZHdu4rssz73l1/KBgMHRo1IjKmQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733235130;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7g6w0PTEih4JLogvfupPa5HvZYEHouhugF1ggPgJrp8=; 
 b=HpwgIP1kVbKhgmA76uVmL/tpDTuYDTsA0Iz8ZoLuTDYUa52LDLM0STKXt5s2mRGrxd/UVMMefUDaGKqJ+N6r+lw6JWiJoFo/7fUSsC0Q3Pyq/oweNJLTvkIQMIthjSJsnPnWEOrU1lMylpDhABDOXwSnBsp9zyDobX6GEkWu6RQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733235130; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=7g6w0PTEih4JLogvfupPa5HvZYEHouhugF1ggPgJrp8=;
 b=j7R0EervXmxMigrPI6jKVtC803bSeW0USc9iyXP0ynvoVB5iCKOZdZzFhixLql/G
 HZcZaZnQApwkJG8VEdufA2dGcXnm0za/dBItIh9HUmHkFXmHsd2andDRBHgMCzI2K5k
 XcJkc6Fb4qJCWmSSpeo1/axqTSW1iQBXMbRTrOFE=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1733235128934380.5176694792625;
 Tue, 3 Dec 2024 06:12:08 -0800 (PST)
Date: Tue, 03 Dec 2024 11:12:08 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Cc: "dri-devel" <dri-devel@lists.freedesktop.org>,
 "daniels" <daniels@collabora.com>, "airlied" <airlied@gmail.com>,
 "daniel" <daniel@ffwll.ch>, "robdclark" <robdclark@gmail.com>,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 "sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
 "jani.nikula" <jani.nikula@linux.intel.com>,
 "dmitry.baryshkov" <dmitry.baryshkov@linaro.org>,
 "mripard" <mripard@kernel.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <1938cdd3a4b.10ab98f77527721.7719837795987945098@collabora.com>
In-Reply-To: <20241128042025.611659-1-vignesh.raman@collabora.com>
References: <20241128042025.611659-1-vignesh.raman@collabora.com>
Subject: Re: [PATCH v1 0/2] drm/ci: uprev mesa and modify gitlab rules
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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

Hi Vignesh,

Thanks for your patchset.



---- On Thu, 28 Nov 2024 01:20:19 -0300 Vignesh Raman  wrote ---

 > Uprev mesa to adapt to the latest changes in mesa-ci, 
 > including new container jobs and stages. Update the 
 > lava-submit script to align with recent mesa-ci changes 
 > for using LAVA rootfs overlays. Modify gitLab rules 
 > to include scheduled pipelines. 
 >  
 > Pipeline link, 
 > https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1318024 

I see this pipeline has a few failures, most of them are because outdated xfails files and timeouts.
Could we fix that first? So when we test this patchset we can verify if it introduces any issues or not.

Thanks
Helen

 >  
 > Vignesh Raman (2): 
 >  drm/ci: uprev mesa 
 >  drm/ci: update gitlab rules 
 >  
 >  drivers/gpu/drm/ci/build.sh       |   2 +- 
 >  drivers/gpu/drm/ci/build.yml      | 104 ++++++++++++++++- 
 >  drivers/gpu/drm/ci/container.yml  |  22 ++-- 
 >  drivers/gpu/drm/ci/gitlab-ci.yml  | 185 ++++++++++++++++-------------- 
 >  drivers/gpu/drm/ci/image-tags.yml |  11 +- 
 >  drivers/gpu/drm/ci/lava-submit.sh |  99 +++++++++++----- 
 >  drivers/gpu/drm/ci/test.yml       |  33 +++--- 
 >  7 files changed, 314 insertions(+), 142 deletions(-) 
 >  
 > -- 
 > 2.43.0 
 >  
 > 

