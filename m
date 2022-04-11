Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F8B4FB130
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 02:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C9210E36D;
	Mon, 11 Apr 2022 00:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E96910E370
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 00:55:23 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id c15so18220290ljr.9
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 17:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OGafDg3DxeHztujL+sSHxizX/gbRwwn9uMxQuC04w7k=;
 b=hsIdT/GmWbO+U9EX4aKGvbGV8JS8jvtcjwggO/EJFEm3VcYSmGVdL5lYZOa1rJgiL/
 plK7KaELvjRgYwi4v/WIkiB0eHJXUIdk5L67hRcklZuAhhTYuZQf6POsJg7/K+sKKEb0
 5SAttD+FHIJwJXpLYsOKDKEzPhQli9WIBnCPnpWd9zcJnxThatcsy15uXc35UMqsCbJ3
 CIXXREMdLa8l/EYJDbqTKgelf3GSUkXTBfVPYnTeJsjJnPsCaTe0+Au5CaARYjsOAYfj
 MX7o8hNSx31P0f9j0a6SRlsjbmToThwVzNkR5lkBN+R2SPqTtNVD7aNaPupdK2llJKjJ
 8CPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OGafDg3DxeHztujL+sSHxizX/gbRwwn9uMxQuC04w7k=;
 b=3K5JegRStTjoMW3JjIlcrM8USuTcwF/fXXm3Bqa2+eNghaWXxJxBTPiD4G6K3osOyn
 36cgnnN31VIAFzWOUKdCV5Yuw3f8O8RHgD1gzLPXj9dJQUsK+eY6D72UTz+x9ufHvAl+
 zDqDBYfDKdpobnu10VhINxte2NvuioCOFhX+3RHeb1u6pgNGlRiPR8vOcsy/UyWTmRB7
 kIloishukSn1C0Tdtgw19Vxh/6kn43k5IgAwQFMaZFJ0EnG1jc90sLzJvFEaWhMHYrad
 EDINeyW3/MisVDIW1B+GrQ6kTYFGk8TH22C0MZT4G4su5RjpFmmmOePbYlaUM3xp99I2
 DHDw==
X-Gm-Message-State: AOAM532ftQpAVxk1VqqsEw7/nvBCGVl3IlvAI5P/3UngxweF7OQmj9SI
 w5EDAcn4OL3iehTfXQzkxgpwqy3H0J5R5A==
X-Google-Smtp-Source: ABdhPJyO8+aniDjnYx0zU3hsNKlVq026qfQlqZSsrhX6p6/U0Zl56YhNUcNT+MVRGEnOdhKodQiglg==
X-Received: by 2002:a05:651c:548:b0:24b:5e49:7714 with SMTP id
 q8-20020a05651c054800b0024b5e497714mr3939851ljp.223.1649638521243; 
 Sun, 10 Apr 2022 17:55:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a056512118f00b0044a835fd17esm3161424lfr.162.2022.04.10.17.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 17:55:20 -0700 (PDT)
Message-ID: <a263814b-3377-f64e-6ed3-13a9c9a1cda0@linaro.org>
Date: Mon, 11 Apr 2022 03:55:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/msm/dsi: Use connector directly in
 msm_dsi_manager_connector_init()
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
References: <20220318000731.2823718-1-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220318000731.2823718-1-swboyd@chromium.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <seanpaul@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/03/2022 03:07, Stephen Boyd wrote:
> The member 'msm_dsi->connector' isn't assigned until
> msm_dsi_manager_connector_init() returns (see msm_dsi_modeset_init() and
> how it assigns the return value). Therefore this pointer is going to be
> NULL here. Let's use 'connector' which is what was intended.
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Fixes: 6d5e78406991 ("drm/msm/dsi: Move dsi panel init into modeset init path")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
