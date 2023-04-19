Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A236E8523
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 00:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB9010E057;
	Wed, 19 Apr 2023 22:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B3D10E057
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 22:44:18 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id y24so707232ljm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 15:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681944257; x=1684536257;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=68AGYlQ6GL8Id5Bj4tL7yDrVLE8ybeIun+9u5kU+miQ=;
 b=AuJGpMUOVAQOas5/SHMGxpKJcNNyvH/8/DGB4GOdlhRuz3ng/gqEoRM3F7swrDihem
 eXOlQETCn6QnA2uxFSIwrpTiAWfQHbbr97vsz1boBXQ0Rh0Wshk+eymQb8YeXLZXlG7R
 1DpGX73qgRRuWG/Y0n8tJMVP2SXrqm48yVPpyKphTETiyhpPsDPMkmNfyHSimY0QGLZp
 50RR7ZeucUIuydE8cPj7rX44tIzkeG9Y15tMAHBeb+TegduwQ+se/6iEYcJxCRQg1QYg
 K6PJ44fIBj02qWGdZsGYKEXNfTd+QC1y+I17c++8xZGEe2fJ/A4I37fxwo5oWYeuZFMf
 fTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681944257; x=1684536257;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=68AGYlQ6GL8Id5Bj4tL7yDrVLE8ybeIun+9u5kU+miQ=;
 b=EcpCF3t4J7iAxmCYJOeMdX1psmIK+KJQJeU/eQbcXDuLI1xRMTnxmwdJKasEIh2w1C
 A/8bv7sAJsjIRZK2PdWzZKLHulWZfNXzTOOBfloPXGfEn+FoPqNzlxPSHclWrKS7eMwP
 vbBEVjzXmdVHPTxrKDhUG3YSVUyS19osR/l1GdpJK0QQGNkoGMENkZPy4EaVJ5dXxZFQ
 wncsYvscVrlWFJMlekTjklusqLjo0zYVkBEy4hscCLBTvy0WNxI5AKHPR8/AJTSxl4OZ
 gMRqkd4HkeNtntSSwJQNm6zO6j26gIzDwrnYH4agIdjekSGSxOruakHXFFeiwLT0LBz8
 4r1g==
X-Gm-Message-State: AAQBX9cRU9h74f3sBS+EhLLiJUhmw5nDyLHf9MgtTD/TxbYVAnbYyyTR
 c3PEOc3BKFPNNI8VKCAXWKC1ew==
X-Google-Smtp-Source: AKy350avbp+i25TM39CqKnZY8u0sm8EAdwviMJHLgiIsLvF9GUSyWmmhSvBhulbBO5XNdIRakeTwgg==
X-Received: by 2002:a2e:8049:0:b0:2a7:730d:a7c2 with SMTP id
 p9-20020a2e8049000000b002a7730da7c2mr2477442ljg.46.1681944256801; 
 Wed, 19 Apr 2023 15:44:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a2e82cd000000b002a8aadcf15bsm2688424ljh.120.2023.04.19.15.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 15:44:16 -0700 (PDT)
Message-ID: <dbc1036e-c850-1d68-1161-1a353416b3e2@linaro.org>
Date: Thu, 20 Apr 2023 01:44:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 05/11] drm/msm/dpu: allow using all lm mixer stages
Content-Language: en-GB
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-5-d1bac46db075@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230419-dpu-tweaks-v1-5-d1bac46db075@freebox.fr>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/04/2023 17:41, Arnaud Vrac wrote:
> The max_mixer_blendstages hw catalog property represents the number of
> planes that can be blended by the lm mixer, excluding the base stage, so
> adjust the check for the number of currently assigned planes accordingly.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

