Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5AF790F06
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 00:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3199A10E24F;
	Sun,  3 Sep 2023 22:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266D010E253
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 22:37:43 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31f2f43d5a0so762435f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 15:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693780661; x=1694385461; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iuInZybgE5C4HgdNIAED9cdqS6tn29myqOzFJ+qiKTc=;
 b=hJuj/K1v6iSGJeiLRDQfLOTn67YzO7E8ISF8uBKRG1mq3zPNybguwmc9T8C026USFX
 s3zixRtzv5PkDAuBQqUDxGiyRhI3g9tVl1zXoUkwFnDqMdB3moIQ5lIjaF7PM4tXnqXN
 DiC54JXPWn6NGl0Z6bZUDl2gxlKGKHj6gDlc/G+NNhUpgr0EU1ZKJzYnBv3isJb63Fw5
 YImO+qtHs5s6fKuvrPkH/H8QzYZe5r6aESnAInSi31m4AUiyDWrg33nRus+TABIiaBPU
 0HIf016PIwzpKjeHYe5eI0jVwkepwUzn2a1kDma8Hsk6n4M3YHVynkLfSREMd+1F6CAS
 FkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693780661; x=1694385461;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iuInZybgE5C4HgdNIAED9cdqS6tn29myqOzFJ+qiKTc=;
 b=TV7x7QxY03a9x+n124uwDrXTDCFtpdoZwLq6EIITdHJVozZQ3kUiSZGlrwZuGbG51P
 6oJwY3eDlAELL79aHHRDn8Sz1aE3GS6QT3xX8/iVqkpXTEkpbODil7+QEEvNduRiwq84
 MIvl4S6SEWH/zYs4MunNaZgckwPlUNoBSJly/ChkpCErHcm+qJ5x1oNXfvojjORYhdOo
 VzufH2O1ia/RiL0dJdJ2KZccZHDYcorMJb71FH1f4eXsFNwnYXfo2LeB4CqtaoeYADSl
 cQNAcVu+LzKQnk7LFi6veDaEwOpRIFmZGnhVf90cRug6iMHaB4GVaXz1CfD376mv7+m7
 kaTA==
X-Gm-Message-State: AOJu0YxwIeS1D0FKJxcI9P5+EZxgG5epn/eGYCR3flF7zfCI3TiJuAAU
 sCc9lKN2y0HwKLN5hmtrulex4g==
X-Google-Smtp-Source: AGHT+IEE16n0PDj07eAurnl3CVbsLgtJrkqgHUlTveydUibtGonutI7dAHGUS2oR1eZ0UqelpiUnPg==
X-Received: by 2002:a5d:424b:0:b0:317:3dff:7189 with SMTP id
 s11-20020a5d424b000000b003173dff7189mr6066598wrr.66.1693780661484; 
 Sun, 03 Sep 2023 15:37:41 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bo9-20020a0564020b2900b0052889d090bfsm4972604edb.79.2023.09.03.15.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 15:37:41 -0700 (PDT)
Message-ID: <642a5b5b-0979-4d9b-a5e3-9432afe062d4@linaro.org>
Date: Mon, 4 Sep 2023 01:37:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/msm/dp: Use drm_dp_read_sink_count() helper
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-3-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230829184735.2841739-3-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 21:47, Stephen Boyd wrote:
> Use the common function drm_dp_read_sink_count() instead of open-coding
> it. This shrinks the kernel text a tiny bit.
> 
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 19 +++++++------------
>   1 file changed, 7 insertions(+), 12 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

