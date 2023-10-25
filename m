Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8072D7D6766
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D3210E62C;
	Wed, 25 Oct 2023 09:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343C310E62C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 09:47:11 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c5056059e0so82867331fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698227229; x=1698832029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BpOpmDLtAqArpJSPKcIM3DaKWUTQYNNNS011ZdujvEw=;
 b=v24BB1CDWYfD5MbycEPZ7ljgDIQmoh7MShjRwO4HML9ahn6x8/vsBklrf+Z3v7dIPZ
 +pEq/bimkK4v1NK6sAez0kMsTTJ9aeaLNZmKbAGWAsNt9Sa43g+zvVVZQYvaZ5yL40yL
 T47YrlTlD84OWcBo17mvEpeVxgrBVEZy2IOs59+2LQvK/rhNcD7XgeYFb9mV/q/jq6Ic
 d/DilFVJWkAWfy0dRK1Ch0eFXWBx4Uo/hjphAfjhKNVS6lcRhMA2Dlz7n7aN6HDa2anG
 2tmxmio5H92Lfs3QBEkzzGTHPVQrk8MarpgT5zFt/GgtcjDoksmxet3BlLv1sD4lbsBJ
 HoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698227229; x=1698832029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BpOpmDLtAqArpJSPKcIM3DaKWUTQYNNNS011ZdujvEw=;
 b=NG0PT14nQiRmOMCBazuxpM76W2aQn0fFnYrSVMA+TOH2gmTVD3OocwQAb7JQjZ1N2Y
 xIh6YYqQqGz9h0Bv07jWqWFqx2R9h4TwPWFhnzWBpoRjns9SZU5yRfQABrh0UDPJQqob
 r8CkiNMk1adkNOQ9AZ0BB0zr99Jf1XWByltTTafYmGUfxzeq8FwK3ArP4ERMNUuydj8t
 hwOQJ5IRKGQO7i78dJAjOZPv+KlMcP5TS9daNlP5ppZG+xipI0CZK640HMNUfPX9HRyN
 66hitEhO7idIYwvcw4Xjtkuyt9aM8UrWEDo2wIql+118xFfTCPNo4dHAN/oUyfi1MgKQ
 cA8g==
X-Gm-Message-State: AOJu0Yw7E6l38JWKC++o2osAaNpHLrvPNJmFzlbuG7FP84/VlFctqNBm
 Lv4s4oGRTQBi/6W2JMhruuZdpg==
X-Google-Smtp-Source: AGHT+IFfoE5O1nQZ7hXWildQtNSnhIVdJ5jytEwleTyUMk9tayjcCN7BpnQ4sQx8gdWyCztiGvDZsA==
X-Received: by 2002:a05:651c:155:b0:2c5:2423:e225 with SMTP id
 c21-20020a05651c015500b002c52423e225mr10223859ljd.6.1698227229257; 
 Wed, 25 Oct 2023 02:47:09 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a2e3612000000b002c503c2dc97sm2287970lja.64.2023.10.25.02.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 02:47:08 -0700 (PDT)
Message-ID: <2142be46-53e7-4e8d-956d-c82d1abb21a2@linaro.org>
Date: Wed, 25 Oct 2023 12:47:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: remove unnecessary NULL check
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@linaro.org>, Rob Clark <robdclark@gmail.com>
References: <ZSj+6/J6YsoSpLak@kadam>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ZSj+6/J6YsoSpLak@kadam>
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
Cc: freedreno@lists.freedesktop.org, Su Hui <suhui@nfschina.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/10/2023 11:25, Dan Carpenter wrote:
> This NULL check was required when it was added, but we shuffled the code
> around and now it's not.  The inconsistent NULL checking triggers a
> Smatch warning:
> 
>      drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
>      variable dereferenced before check 'mdp5_kms' (see line 782)
> 
> Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the _probe function"
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: Added a Fixes tag.  It's not really a bug fix and so adding the
> fixes tag is slightly unfair but it should prevent this patch from
> accidentally getting backported before the refactoring and causing an
> issue.
> 
> Btw, fixes tags are often unfair like this.  People look at fixes tags
> and think, "the fix introduced a bug" but actually it's really common
> that the fix was just not complete.  But from a backporting perspective
> it makes sense to tie them together.
> 
> Plus everyone introduces bugs.  If you're not introducing bugs, then
> you're probably not writing a lot of code.
> 
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

