Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EB3A28E51
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 15:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D289410E7C5;
	Wed,  5 Feb 2025 14:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="hWaRw8+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C582F10E7C5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 14:11:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1738764683; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=H0yw1SIUJ1JolLxhI1QjGxb3JUVUYEceNThalOFEe0hVvDT8TwhKkygDeJKd1cbENuQ+vzrEwBBZMFvlaNj2wqHkls1WEqTFaYG7LTS6d9Q6VDwAlNL0V2gQk+yr4I/uYkBxTQdrsSa79T3yG1NIQt5CNZp8BE2/YGfhFuW/HDY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1738764683;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VgmSayAGKFLeF5c3BvsonNcZQluhGDauHCVTiCxbwlY=; 
 b=gpvpGs3igfZydYHl/eqx6K9qtReZLSr9mXbOFK5QKcOl38SaUldmTHnCs54yE1v27/S7cm75Fn5MNykcqwBfPnZsZq+oKZGSH8ZM8MrHlnqcAAIPBHHEds4GtgiQUgi+aX5tbBrAcFqJJZ+Tg/tdZ1AXXeJO6wR62b/JWmZoJug=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738764683; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=VgmSayAGKFLeF5c3BvsonNcZQluhGDauHCVTiCxbwlY=;
 b=hWaRw8+asSZy4mKITzaKzI3+0x+kGedwlR6oO/oNXYX0fHjBsVluAHv5sp/9fLoR
 HeNFyne8mJrB92CDQqBItweRLkC14NifL618ByKFxsyHRRLh9kvjwTX9TJdLNgSO56o
 9+Sp1CZU7xxmyPK3py6AZY3mbxkyF2zzIz3/7eYk=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1738764680669688.0736532108742;
 Wed, 5 Feb 2025 06:11:20 -0800 (PST)
Date: Wed, 05 Feb 2025 11:11:20 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Cc: "dri-devel" <dri-devel@lists.freedesktop.org>,
 "daniels" <daniels@collabora.com>, "airlied" <airlied@gmail.com>,
 "simona.vetter" <simona.vetter@ffwll.ch>,
 "robdclark" <robdclark@gmail.com>,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 "sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
 "valentine.burley" <valentine.burley@collabora.com>,
 "jani.nikula" <jani.nikula@linux.intel.com>,
 "dmitry.baryshkov" <dmitry.baryshkov@linaro.org>,
 "mripard" <mripard@kernel.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <194d6737dc8.103ea99f8673408.2437691126328305495@collabora.com>
In-Reply-To: <20250205081652.1928927-1-vignesh.raman@collabora.com>
References: <20250205081652.1928927-1-vignesh.raman@collabora.com>
Subject: Re: [PATCH v2 0/3] drm/ci: uprev mesa and modify gitlab rules
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





---- On Wed, 05 Feb 2025 05:16:45 -0300 Vignesh Raman  wrote ---

 > Uprev mesa to adapt to the latest changes in mesa-ci, 
 > including new container jobs and stages. Update the 
 > lava-submit script to align with recent mes-ci changes 
 > for using LAVA rootfs overlays. Modify gitLab rules 
 > to include scheduled pipelines. Also update the 
 > expectation files. 
 >  
 > Pipeline link, 
 > https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1358207 
 >  
 > Link to v1, 
 > https://lore.kernel.org/all/20241128042025.611659-1-vignesh.raman@collabora.com/ 
 >  
 > Vignesh Raman (2): 
 >  drm/ci: uprev mesa 
 >  drm/ci: update gitlab rules 
 >  drm/ci: update expectation files 
 >  
 >  drivers/gpu/drm/ci/build.sh                   |   2 +- 
 >  drivers/gpu/drm/ci/build.yml                  | 104 +++++++++- 
 >  drivers/gpu/drm/ci/container.yml              |  22 +- 
 >  drivers/gpu/drm/ci/gitlab-ci.yml              | 195 ++++++++++-------- 
 >  drivers/gpu/drm/ci/igt_runner.sh              |  13 +- 
 >  drivers/gpu/drm/ci/image-tags.yml             |  11 +- 
 >  drivers/gpu/drm/ci/lava-submit.sh             | 100 ++++++--- 
 >  drivers/gpu/drm/ci/test.yml                   |  37 ++-- 
 >  drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   2 + 
 >  9 files changed, 325 insertions(+), 161 deletions(-) 
 >  
 > -- 
 > 2.43.0 
 >  
 > 

Applied to drm-misc-next

Thanks
Helen
