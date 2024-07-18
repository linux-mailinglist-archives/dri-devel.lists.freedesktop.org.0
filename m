Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF65934C46
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 13:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8FB10E78D;
	Thu, 18 Jul 2024 11:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="4gHUvNBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BB910E78D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 11:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721301385;
 bh=yzrtypeLSjgTpA1ibO4fLpAZ53cWe3qvHSB3tV2gkzs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=4gHUvNBCDaGrv/F4bxZWI83aaUEK+JY04kcTD9sBaPm+ruAo03sB9dOR3klGcBssb
 Vi5sSdyvCKc2HSqHqu5gGwSAg4SKfeVIwPn44eiwI1GBkgrry1aoFEPEs4tMrCYQSn
 jMLtI1zuiT6ig2x2DKFp7tx7uH0FsatIlYYi/7jawjF/EAa7wuZjHonH9vzsXYjsVy
 aHQipavfr5CGowrt4N4nsMQbtY8l2llZLfXfJBYOHv9dDvifJaDru1AyyDvp6iF8Jy
 bVkKCStDCKS804lircH60EDoo68KlxMdvM/H5y18RrLrXzeJ5KMx12RSfTf6SrBY6q
 5WxEhsvj9Cllw==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 84A5B37813D3;
 Thu, 18 Jul 2024 11:16:23 +0000 (UTC)
Message-ID: <6d958123-1e4e-4a40-aedb-9a88de6e7dda@collabora.com>
Date: Thu, 18 Jul 2024 08:16:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: update link to Gitlab server
To: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, vignesh.raman@collabora.com,
 sergi.blanch.torne@collabora.com, guilherme.gallo@collabora.com,
 robdclark@gmail.com
References: <20240717235221.64629-1-deborah.brouwer@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240717235221.64629-1-deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17/07/2024 20:52, Deborah Brouwer wrote:
> Before building an image, the build script looks to see if there are fixes
> to apply from an upstream repository. The link for the upstream repository
> git://anongit.freedesktop.org/drm/drm became obsolete with the move to
> Gitlab server in March 2024. Until recently, this obsolete link was
> harmless because anongit would at least respond that there were no such
> fixes available. In the last few days anongit has stopped responding to
> requests causing the build script to hang indefinitely.
> 
> Update the link from anongit to the Gitlab server to prevent the build
> script from hanging indefinitely.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> Link to pipeline for this change:
> https://gitlab.freedesktop.org/dbrouwer/kernel/-/pipelines/1226742
> 
>   drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index b09976c3d2c2..259fb1c9a855 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -2,7 +2,7 @@ variables:
>     DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
>     DRM_CI_COMMIT_SHA: &drm-ci-commit-sha e2b9c5a9e3e4f9b532067af8022eaef8d6fc6c00
>   
> -  UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
> +  UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
>     TARGET_BRANCH: drm-next
>   
>     IGT_VERSION: f13702b8e4e847c56da3ef6f0969065d686049c5

