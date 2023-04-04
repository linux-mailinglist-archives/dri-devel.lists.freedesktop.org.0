Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B286D6F2B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 23:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D320010E21C;
	Tue,  4 Apr 2023 21:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE4410E21C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 21:43:47 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bi9so44088988lfb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 14:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680644625;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xKUgiJ3loiwk0e4aXihhVUgl3OPblBbKPcoqYQAlaG4=;
 b=DBHwp8UvxZF5RelW+ds8zN4JFO23lMT0BxnL78ZuYts4f7FubSjbyxggA9JGa+O3it
 WlMmk9jo0yCA09J2uyijC6X7ExkvsO8YwTggcwpjTVczPwZnoSZDbLJlUqvjX2rYl/I7
 +HKmeIbXz1wyVdP6iDb2NtMY4Ot3NtlhZgNnM246eRsu3EHtoYaQeCQUmp9ERhCS6WxN
 Fjj4K976WevfG1zpbTC+/BdmzK4o6lMY1+F+V92NOWdXLx/aBNhxb3vGKyF6csDDRQCi
 PWgE0CURuvnvY1Vz9a9YxBt9rnMESeqAefaQzvEdLYFGJAvWK+TdApKX4S75R8xyHOMp
 uuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680644625;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xKUgiJ3loiwk0e4aXihhVUgl3OPblBbKPcoqYQAlaG4=;
 b=vojrA9/D2A4BaHttutZaNdNXcrno10bOyQ8j9bcGZbUKNaa3+zgRFIXs/np5QD4yW8
 wRy3pGe9+nK9NKNwKxjhpLvu6U5ibrtnyZxIn/EeYmYxE/Z8aeenzu5TGzy822IR7n2O
 Jj6zGlF2odU0QVnYuFVNtmhJf3HikGOQShPmZWNcrm5EpQyYERLfiZATGyXD2z8wOL8w
 j2ZCDWSEjqURFKSV6+661GIyZn0uN4Ai/aEIe39aQc185xI4Wc01y31hCrkFbRVTpqMd
 hN2aSyefUHmuKrVphWLya4/43izrt6R/UvRkmgvZpWAEMkOeneVzLHrOzqzdSiyqy4il
 occA==
X-Gm-Message-State: AAQBX9eUqsrUro6CiudJYY8x5/VQDrqGXNRwnnGu7LouzxEcDXoxF84I
 ij5D02pGIllEqmoG6giFfIiU9O7smVS449YDYJOi6w==
X-Google-Smtp-Source: AKy350Ycdl0Cl3uRa1nCTKWiPW/L0+xiN8st0AuHISzk9T3nMsHBMckmQGPp2Ur+xJLIxY991Vb/Bw==
X-Received: by 2002:ac2:519c:0:b0:4eb:c4e:bd87 with SMTP id
 u28-20020ac2519c000000b004eb0c4ebd87mr912474lfi.58.1680644625716; 
 Tue, 04 Apr 2023 14:43:45 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a19a411000000b004d3d43c7569sm2499581lfc.3.2023.04.04.14.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 14:43:45 -0700 (PDT)
Message-ID: <4a7bcbec-e9e2-2178-420a-56dcf8fb88dc@linaro.org>
Date: Wed, 5 Apr 2023 00:43:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/8] drm/msm: Remove struct msm_fbdev
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230403124538.8497-1-tzimmermann@suse.de>
 <20230403124538.8497-5-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230403124538.8497-5-tzimmermann@suse.de>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/04/2023 15:45, Thomas Zimmermann wrote:
> Remove struct msm_fbdev, which is an empty wrapper around struct
> drm_fb_helper. Use the latter directly. No functional changes.
> 
> v2:
> 	* kfree fbdev helper instance on init errors (Dmitri)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/msm/msm_fbdev.c | 20 ++++----------------
>   1 file changed, 4 insertions(+), 16 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

