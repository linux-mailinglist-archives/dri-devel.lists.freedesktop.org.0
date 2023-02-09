Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 625746910A3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 19:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B8910EB65;
	Thu,  9 Feb 2023 18:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6610A10EB64
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 18:48:18 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id qb15so7178605ejc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 10:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cVj4jGFm91gVblHchnk/NhqSD0CN2enSZNgJVhtZLGU=;
 b=xxDmmYA6KFjt551HnWXBy6i1VTczv/C9QUW1HSkyJKrfNPlFF7Jb93xvxUrIlUx3/W
 GvRJ7gU9DhGM4j5CvQkNspc7Z+vqK5K+fdNXerYmE9nC94DEnusVddjZsIyLueJO7PHm
 hdj5W+3h9RT+ZHyYL2mtBtoNrffkzNLIyiZ05A1zL9l165aW7lzEY4+s+kie7F9r6O+k
 kHPgGBXpKSoGxeFtjtMbJ28tRf7wa/+KebVm5+qTVBl+hqeDEsjX/AqStHjl2+ktV6yR
 LNX3b09A1RrpmnDv225qKuf60D3KKWmx7g1+p89UmoZeUZ3gPwit594PCxteWmux0IPb
 NbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cVj4jGFm91gVblHchnk/NhqSD0CN2enSZNgJVhtZLGU=;
 b=JH/A05/YwJO7mszyrzKXEtji1muHWnj3nbhXc2ougeitng6ffvzs7cgcX0Kr4LHvNG
 CbBbgiAoh/6888gVUCguUCCIsV59le8zSmipvqZFuktn8yK7ZQlbG00HKm7tVMqt+lRB
 svAyqWG784Mb4fLaNwvXRJOR3UBsUa4oZwfQl6RoW8En8mNPjAdEewsc675eTjfKPmCv
 mKpr5s+/b97Xpu0iSo7RvLofOT15UEifsVbvOQ6YxBA4sXxS4HhbBU05drq4lv2M4uJw
 w6QucHUOyKQv1o0BhZRFk50RltTn+l5OZrMnpG7/zn6skLTeE88C0EjNMkd8d8Akliuq
 w9xg==
X-Gm-Message-State: AO0yUKWG9u5I5PQ0Xp0PXXv7SYLIufDMN1gLT+Z3/GDiFGkriZgcryTB
 SmIWtpW6b91rkQAMv99MQD34sg==
X-Google-Smtp-Source: AK7set8O1d48Yxy961nQsh5nXpbiT4LjdTRSKH/fLUo9iBfixA94ymRttiGvzRsURqI/gIJQPNUbig==
X-Received: by 2002:a17:906:14d7:b0:86a:316:d107 with SMTP id
 y23-20020a17090614d700b0086a0316d107mr13221691ejc.72.1675968496986; 
 Thu, 09 Feb 2023 10:48:16 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906684b00b008aea5e0938esm1194906ejs.183.2023.02.09.10.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 10:48:16 -0800 (PST)
Message-ID: <85c9e765-6bb5-f195-d0b9-d3b5aa1ffe5a@linaro.org>
Date: Thu, 9 Feb 2023 20:48:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v2 4/4] drm/msm/mdp4: Remove empty prepare_commit()
 function
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
 <20230209184426.4437-5-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230209184426.4437-5-quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/02/2023 20:44, Jessica Zhang wrote:
> Remove empty prepare_commit() function from MDP4 driver.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 5 -----
>   1 file changed, 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

