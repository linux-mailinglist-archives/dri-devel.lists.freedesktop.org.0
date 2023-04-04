Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAD36D6F43
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 23:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D4110E7C3;
	Tue,  4 Apr 2023 21:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E0910E7C3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 21:49:42 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id h11so37163904lfu.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 14:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680644981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c9m8JcZMmWZ1S9B7I0X4OWYztsfYf55/KOOKuskJIlc=;
 b=Z4DI99E4RIjphWZMJHkO8FxQhtyyrv0FLzs52XFk/NCyBuzC3aIkbbB18/VZ0bMg+N
 74ywJTvuCPUi6M/CzGnDfV8nLhYpMZXX+4JqujjyExMaaqlqr+hoyPRnRYh34/kPmBPt
 qo7mDyk/bRvemXBO4wox7UZNCGcn5b9B1XMuC2Ho90ezrTaZ5Xq2cRuWJDzPpfVnOuyU
 mNA45YViz2w99XSWPszDS47rphCs9hsHke2IG/t1JHsHrOIHZgGWVZw+iS9YfXR1btIA
 pi0/DSsCWXAqeJaJmNqR+sIe04N3oI/H/pRpnLRtmF4JG/CxxMUGISAeoUgCEgOBWQJJ
 TLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680644981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c9m8JcZMmWZ1S9B7I0X4OWYztsfYf55/KOOKuskJIlc=;
 b=PHpgLvQR6sd2ykxJxhz8iBBllHUC6yq38ymDwaFrvUFSII6ABaX8DV8zUNyUUywD57
 65thq3W8UpSvRZkHksbnEytzNMy0vHwSUXdwA/5hZtq/j/dz7fhdZSf0PTWzeETXtRVH
 XWojT1JNEDqZUUhKOQ1iakQsqSob8Pq+pm4GCnGo8Jj1WfmbpfinU+QxAs9Sp9e1eDB0
 eSVhZFL7EnXCGuglQ85Zyg47KUr7xaGb05V09wFgO2INEaNaNTTUwAMnxR2uOZfw7YDN
 oXopBcrUjbt+tc5fcndoWpTV+W90gS11ddXDVgXVDBk5PT88CVCLCSCbO3sdG0Iv8qpb
 vxfg==
X-Gm-Message-State: AAQBX9c9jqkM2ZXKwsN3LIUSIprs9WHI5KKgxSUgKsJClJFAvJq8B+Hw
 9PN+Pa3ZHBmamMDIDod2JcL9Qg==
X-Google-Smtp-Source: AKy350Zf+ul31Abg44Eo9e+Yy1lnbFlwfl8KiguNoPQHOntwSsbASgV+RlHuOW80PHwf7RqxDqt39g==
X-Received: by 2002:a19:a40c:0:b0:4eb:50ba:cb06 with SMTP id
 q12-20020a19a40c000000b004eb50bacb06mr291289lfc.49.1680644981217; 
 Tue, 04 Apr 2023 14:49:41 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a197614000000b004db9dbe09c6sm2501436lff.89.2023.04.04.14.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 14:49:40 -0700 (PDT)
Message-ID: <55828eac-32a7-1c6c-25de-2e031ac12f49@linaro.org>
Date: Wed, 5 Apr 2023 00:49:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/msm/mdp5: set varaiable msm8x76_config
 storage-class-specifier to static
Content-Language: en-GB
To: Tom Rix <trix@redhat.com>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, vladimir.lypak@gmail.com
References: <20230404185329.1925964-1-trix@redhat.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230404185329.1925964-1-trix@redhat.com>
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

On 04/04/2023 21:53, Tom Rix wrote:
> smatch reports
> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:658:26: warning: symbol
>    'msm8x76_config' was not declared. Should it be static?
> 
> This variable is only used in one file so should be static.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

