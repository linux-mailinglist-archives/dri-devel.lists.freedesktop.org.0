Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E1E6E972C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 16:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466C510EC6D;
	Thu, 20 Apr 2023 14:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1613310EC6A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 14:33:02 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2a8bca69e8bso5477741fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682001180; x=1684593180;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qxUBEBnff0FS5uWK1Xy6+WkZa1SWO0jyLNTiw6td0Tg=;
 b=c0fBL6gljKJg2U5xC8i5InaVYMXL+9/qFKvMeTL5sEdZlJ+5MsUMgQorTocD+ZZr7R
 nXPuc3kzONj+oEoOIARLORifiuZQIHlfg+jm+egwcilfOZAZDkVrRwOcEHSh9dpiTLYa
 hA+d9ho40Od86hBr23gyMCf++z/uwKSJM+2B2x061aV0DXHaTMsjSgmtf6lwNNwDlFDF
 OYpgiw+zoO8G3qVyXWHPzuC8b8mJgyiJade0OMfH2o9pc6A9CZ0RYPW6inK8vxZHMPBb
 BZxBhQsrIZt/1gCAGHYoYTiFXmrhwxhRGB3uJ7HWCHoBjOvh6WLTFOk8ZtSL3fYtkQGi
 pZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682001180; x=1684593180;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qxUBEBnff0FS5uWK1Xy6+WkZa1SWO0jyLNTiw6td0Tg=;
 b=PzmOKCwPzxlR0W57cbTKPVTI7bZISqTNZI1T3KXlrAS0RQEY3xT+xRvmilrtVA7JhR
 aJztPmAhEFAJqi2cPcjGDMa880nEAFsRiCgfQ/39cq55dwALHgcx1fSWK0ldvRygqQRa
 kvGdpYpeXeYS1C59kDbX8He7QSUlixYuMr5BraEbZc4M/c4Lmp7UIPnbesn3fVt5CwYj
 YjxdcDMKSu7i3hNhoZb5q2DW9MTKMsUfcLfCwzxNT6SuARkFPFObX0tZFExYhscgPzMW
 ++ari499m33vCkpOWmf+iEbauOyDe8muA8kQOObHh/syVV//6lzGuNGNmTC7FrGGfP+f
 6I2w==
X-Gm-Message-State: AAQBX9dNvGEG4BpmPUVzyD758Y16sYPMBcqOaK4oRPG+vRnEIigIvP9r
 mtJeLd/7cx+hgpSSZYqfbH+JFQ==
X-Google-Smtp-Source: AKy350bT9WLnfTYOgyXhMG2gNFX0pcaVYe702TIX25PW1dp9FSB/gs13aejCsz1XO5Ug3vfDx6VnwA==
X-Received: by 2002:ac2:4a8d:0:b0:4ee:d562:5752 with SMTP id
 l13-20020ac24a8d000000b004eed5625752mr521375lfp.27.1682001180631; 
 Thu, 20 Apr 2023 07:33:00 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h12-20020ac25d6c000000b004db3900da02sm234026lft.73.2023.04.20.07.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 07:33:00 -0700 (PDT)
Message-ID: <2aad9be0-bda3-7992-de1c-69d90dc1ecc6@linaro.org>
Date: Thu, 20 Apr 2023 17:32:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/3] drm/msm/dpu: Assign missing writeback log_mask
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230418-dpu-drop-useless-for-lookup-v1-0-b9897ceb6f3e@somainline.org>
 <20230418-dpu-drop-useless-for-lookup-v1-2-b9897ceb6f3e@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230418-dpu-drop-useless-for-lookup-v1-2-b9897ceb6f3e@somainline.org>
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2023 02:14, Marijn Suijten wrote:
> The WB debug log mask ended up never being assigned, leading to writes
> to this block to never be logged even if the mask is enabled in
> dpu_hw_util_log_mask via sysfs.
> 
> Fixes: 84a33d0fd921 ("drm/msm/dpu: add dpu_hw_wb abstraction for writeback blocks")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 1 +
>   1 file changed, 1 insertion(+)

With the mentioned commit message changes:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

