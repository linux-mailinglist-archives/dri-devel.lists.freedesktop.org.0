Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F031D805CA2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 18:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE1610E5D5;
	Tue,  5 Dec 2023 17:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E2010E5C9;
 Tue,  5 Dec 2023 17:53:47 +0000 (UTC)
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C564B660715D;
 Tue,  5 Dec 2023 17:53:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701798825;
 bh=+zVb91c+m6mZWUppmt1UznPtzffYZ0X/qe9UpFAAl2c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h+anahSCRErixp18RZj78XZZkgGVstCESab6hj/QTNL25llGiPXgGS41aQ3YEpyU3
 Q/V0e4tsDTAatpkPpdp1JNoyDNUpXOIj0D86xRwNL/DmakZzF1AwFsgLLMqvCPKZmb
 F+bHjc9h1I83M2wrg86rYQIdmlhDTXPvyqU2cj0w2tG1fkfy+yPpbjaFgYYfskEZLC
 mhvbqdIJvbt952TTPq3XxwqbsG9MLbAlYCwYNn9qwbo5KhK7MbX80Xu131ov1E3YXp
 5TnuDwtpNH+yAnl8VfmFKcx1JEsMNTQ7i5dDvdsj6erfZMKsoODrrC06HbJnhMNVH1
 E7F0p/2k0++MA==
Message-ID: <87815255-5a1f-4d19-b8ea-e9defac954cb@collabora.com>
Date: Tue, 5 Dec 2023 14:53:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: remove rebase-merge directory
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231202221353.1276288-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231202221353.1276288-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 David Heidelberg <david.heidelberg@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 02/12/2023 19:13, Dmitry Baryshkov wrote:
> Gitlab runner can cache git repository, including the unfinished rebase
> merge status. New CI job will come as a fresh checkout, however this
> will not destroy the unfinished rebase, failing our build script.
> Destroy the unfinished rebase state.
> 
> Suggested-by: David Heidelberg <david.heidelberg@collabora.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks!
Helen

> ---
>   drivers/gpu/drm/ci/build.sh | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index e5c5dcedd108..ca2923ed2290 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -58,6 +58,9 @@ git config --global user.email "fdo@example.com"
>   git config --global user.name "freedesktop.org CI"
>   git config --global pull.rebase true
>   
> +# cleanup git state on the worker
> +rm -rf .git/rebase-merge
> +
>   # Try to merge fixes from target repo
>   if [ "$(git ls-remote --exit-code --heads ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes)" ]; then
>       git pull ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes
