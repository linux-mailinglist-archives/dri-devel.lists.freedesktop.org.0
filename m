Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A91B85AD1E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 21:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FB110E24D;
	Mon, 19 Feb 2024 20:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="3X7YNmey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1461F10E252;
 Mon, 19 Feb 2024 20:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708374368;
 bh=kyosV47JTi0wpAR/5w3/fTsHOGbVDVvLMTUT+Swn/aw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=3X7YNmeyROwNimof/BElkf0c+nJpnJjggiSaIIFSCvocEYKcrjk0uASQ95xB0vewx
 iYjXONra2WeZNOR4o3y9OGZgcOLXxk7tslPYlAM20GrophOahnTvO+8kxAOCOKsONy
 5t9OdrRHx/Atpl8iwhairHw7CmGHJWDa2Cayufax9HieUI/o3s0iAfQUC4Qekzbe2a
 U3NlH6pEcot62kCiUIB7fOuYGkdzqV96wpORMie8FNl2nmdjXcBzXzdcPx/sH74rna
 8SaHTVeO1KbTM/buxDIM7mHQMDABq5ngBSVJpKGNAwpnnVhW/4rvldwyHfzbmUiecy
 H96I128MvS36w==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3A8A63782081;
 Mon, 19 Feb 2024 20:26:03 +0000 (UTC)
Message-ID: <d62d3507-20ee-4230-ba2e-c530ea5a9a60@collabora.com>
Date: Mon, 19 Feb 2024 17:26:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/ci: update msm-apq8096-fails list
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
 <20240218041204.2522828-2-dmitry.baryshkov@linaro.org>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240218041204.2522828-2-dmitry.baryshkov@linaro.org>
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



On 18/02/2024 01:12, Dmitry Baryshkov wrote:
> Mark two tests as passing on the APQ8096 / db820c platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>   drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> index 2cd49e8ee47f..88a1fc0a3b0d 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> @@ -1,4 +1,2 @@
>   kms_3d,Fail
>   kms_addfb_basic@addfb25-bad-modifier,Fail
> -kms_force_connector_basic@force-edid,Fail
> -kms_hdmi_inject@inject-4k,Fail
