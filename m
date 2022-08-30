Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9495A6E9B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 22:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DB010E128;
	Tue, 30 Aug 2022 20:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E4610E128
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 20:42:26 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id j14so6808693lfu.4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 13:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=cYIt8T5qTTPMHnPLf3xQ+OALuVf5JTfc65U2LdgUBRw=;
 b=u12h2y5bEzDK0Z7f56rEwzaTFo5dMxORpwCNdjTOvecDv5/T3+4AThU1ci+IcjwQQJ
 Zng+Ii9ZUZglYG8VQN4ZrxV8w7ZtWUy/Yz+KQqHEm/B63vwtNGPaR+AYLFZFbDjLXJNe
 kRkkFAeg8VgZKFONW7AYee4/1rlLY7a7bu7psGDgB/o7yYRC3P/WB36OpOatqYvHdl/U
 E1GCJ2q7/rHqZiQEeaDWR3h/Jw0zmaO3RtEZ8C3taZ/LBRSmqUTYZfrUxD51mrnSgSyp
 YwUQ3lUTUvUGJ2ZXPALH4QAnwbjKoBx0THf0GAgAsbDQVvgX33vVDsdu1cSoJbEblAWR
 u+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=cYIt8T5qTTPMHnPLf3xQ+OALuVf5JTfc65U2LdgUBRw=;
 b=8FMqJz+VdFTdJNyOROKYEZy2G1hZBLu4CGF0zyI9W8uti7WFJKtq48e6ZbJ0DkvvD9
 jRyzVnlyVlnzetUykuOzFiN0vdgk76j8Je+7ijAKALFDhjRvvcuRRPRaz4XN9FoC4Pwp
 ZP/aElElSaq8SjW+olvLHjBBi5JwTcW47Qpm7vKINuMzNqfIvgXru6JdIjbVRYDc3Rg2
 SN8MSYRCmkUIW564jlZrmw96YkVfncze2MoOhWdTm1jEFfqDrV/6kDqXY6l7bZfAhngO
 mjOtICiiQ6lpqAQO+xul8RVCZlglGMR/+XTv19vwBoVvOnkPl4G4B6RcVWu4n0qZlS9b
 zk8Q==
X-Gm-Message-State: ACgBeo0KJn2delL0AomSsyCByvWua9o77TlLtZr1t4yxW8PGmsirEyes
 MooDlneY3AfchnTPJ/WlV7pB9w==
X-Google-Smtp-Source: AA6agR5kINkZTpU9ZCvAgVHkM73uJ9XuvJxMdXlcD3IzA7JJZGJdFWJiTcv47RB/1xYcEd6sZkrb9Q==
X-Received: by 2002:a05:6512:1510:b0:492:df5b:ff76 with SMTP id
 bq16-20020a056512151000b00492df5bff76mr7958543lfb.178.1661892144495; 
 Tue, 30 Aug 2022 13:42:24 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a056512075900b00492dc1bb346sm1712622lfs.260.2022.08.30.13.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 13:42:23 -0700 (PDT)
Message-ID: <d43b3936-dbc0-dbca-96de-449cec1fc024@linaro.org>
Date: Tue, 30 Aug 2022 23:42:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/msm/dsi: Remove use of device_node in
 dsi_host_parse_dt()
Content-Language: en-GB
To: Nathan Chancellor <nathan@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220829165450.217628-1-nathan@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220829165450.217628-1-nathan@kernel.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Tom Rix <trix@redhat.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2022 19:54, Nathan Chancellor wrote:
> Clang warns:
> 
>    drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: error: variable 'device_node' is uninitialized when used here [-Werror,-Wuninitialized]
>            of_node_put(device_node);
>                        ^~~~~~~~~~~
>    drivers/gpu/drm/msm/dsi/dsi_host.c:1870:44: note: initialize the variable 'device_node' to silence this warning
>            struct device_node *endpoint, *device_node;
>                                                      ^
>                                                      = NULL
>    1 error generated.
> 
> device_node's assignment was removed but not all of its uses. Remove the
> call to of_node_put() and the variable declaration to clean up the
> warning.
> 
> Fixes: 5f8cdece42ff ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1700
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

