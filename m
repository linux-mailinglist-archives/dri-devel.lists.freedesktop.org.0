Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1307727BEB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 11:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E0210E40F;
	Thu,  8 Jun 2023 09:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BDA10E40F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 09:52:40 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-516a0546230so561741a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 02:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686217957; x=1688809957;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t5znM0Sg3qBPgK9r8lu4Yq3qyvTtElPPD1tqhDg87gc=;
 b=j076dw8fP3wXOv9e2WqEpY2QF6SYNUbvo0gkiOWPZUiOkR1i/ulZgw17MjkbeC4Aud
 TfXVP9l6U9lyejmaL7Vh6cfct69KOealR5fXpZXiVo/6ecrSOGzn1E85Dz5MmkwNS1w/
 eUmDqxUwffEvCcOeGO0IFa+nMH1KRdeAORXLTfpE/DbZY29Go2Z0IiWbFTRA+5kW+tml
 BvoW84h+bbzuLcBn3ug65kfEP+5yA8wvlYPjiigLwJUNwTufnkW7VVPQhfc4LFmeKLQI
 KUjZIjgrQJ0YN2ewvd3/1AShNnG2JYr6o1H219NpulZLaNCctjh0pjTCoUb+5PSKDXf0
 zYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686217957; x=1688809957;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t5znM0Sg3qBPgK9r8lu4Yq3qyvTtElPPD1tqhDg87gc=;
 b=T0Dp+Ixh68+wrNIYzwcRXylknm+DYZQP9+phOvJ1vG1tAEJKnZbMrpsn6Hj9lOIZD6
 mLNBpw7ulm2+C9LwarwgeFbCU/MHZmiNihn+TEn3o1DblbzncOVcUNuPC+LIrc1lJDml
 Hh+VEUXuy8Fd9HqQ9hDtji5DZMbvVpx9jyz+QBZ81DbHWEER/NQz04xwkR5eQCdRqZhx
 16LtoEXs3tyAvXrFaN49QD/caLKXqJyMF/ng0FuQXqocwQC7Eo0Ln3IPSORlM+M/340m
 KC7V1sTmu9qCFNkriPbx5VHXcllXZI3+VTU71Xo2FR9CD07Ntg9xmt8PZ1zgqtCfbWgk
 r29Q==
X-Gm-Message-State: AC+VfDyYFzbkG1yzuWMEUiSqGTlrywT2U3sHKLTNV2L0fE7Adn+4kDtZ
 spoH6L+XI3Vt681erbJ7PXY=
X-Google-Smtp-Source: ACHHUZ5kfjub+ODMLrmnC7fqYqQvwSWogzCc70iAF1ZGg4x76S0iHFl43/CsnTN+lnSqEFz78H92Vg==
X-Received: by 2002:a17:906:6a0b:b0:970:1b2d:45bf with SMTP id
 qw11-20020a1709066a0b00b009701b2d45bfmr10195784ejc.61.1686217956868; 
 Thu, 08 Jun 2023 02:52:36 -0700 (PDT)
Received: from [192.168.50.244] (83.8.122.24.ipv4.supernova.orange.pl.
 [83.8.122.24]) by smtp.gmail.com with ESMTPSA id
 d13-20020a170906370d00b00977d0f1c5bcsm465087ejc.69.2023.06.08.02.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jun 2023 02:52:36 -0700 (PDT)
Message-ID: <f8b532eb-5233-f7a1-9e36-7f762208e903@gmail.com>
Date: Thu, 8 Jun 2023 11:52:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] drm/panel: s6d7aa0: remove the unneeded variable in
 s6d7aa0_lock
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Wang Jianzheng <wangjianzheng@vivo.com>
References: <20230608033446.18412-1-wangjianzheng@vivo.com>
 <ZIGhBvFlHwVmKJG4@ashyti-mobl2.lan>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <ZIGhBvFlHwVmKJG4@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, opensource.kernel@vivo.com,
 Sam Ravnborg <sam@ravnborg.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2023 11:36, Andi Shyti wrote:
> Hi Jianzheng,
> 
> On Thu, Jun 08, 2023 at 11:34:46AM +0800, Wang Jianzheng wrote:
>> Remove unneeded variable and directly return 0.
>>
>> Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>
>> ---
>>  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
>> index 102e1fc7ee38..fec0d014fd0e 100644
>> --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
>> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
>> @@ -66,7 +66,6 @@ static void s6d7aa0_reset(struct s6d7aa0 *ctx)
>>  static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
> 
> actually this function can completely made void.

It can't be made void, as the mipi_dsi_dcs_write_seq() macro calls
return with an int[1].

Best regards
Artur

[1] https://github.com/torvalds/linux/blob/v6.4-rc5/include/drm/drm_mipi_dsi.h#L319-L337

