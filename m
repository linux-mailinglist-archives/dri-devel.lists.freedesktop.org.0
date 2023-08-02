Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5A876C876
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 10:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19A910E51E;
	Wed,  2 Aug 2023 08:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F2810E51E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 08:38:31 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fe389d6f19so4763039e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 01:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690965510; x=1691570310;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uQ+lNL4fO4KPGrAzOlHkF7rrOY5ykF3mAwSuq0Z7KDY=;
 b=jG2a6Y0+LcpsZztlW3jLfV8otpGZE1pKMJwRzNrp8SnY2R6Z0ZENBBc/9oQEqoq2En
 zPMyVR21fD0lT9udPLrQduGfiz7/6BA0/TzkbAAmhOQbn+wQMj7Hj6t76f3EIE48vS46
 N93IJ67ZG1Etk41/Qe8PPBsDyaz5eQM6HFHCjJDu/yoEHD4ou8VSQE/H/sSNtbM9Bqba
 xeOV9jsH6kL5LOpyi2I0Cqd1ScyhXSS6vh8hw8AAQRleBWeTinKT0zxCkrbbo5U/zPBs
 3hpPPJBncaapQo+H0RTLAKlcAilN1YyIRP6e1NZARI1VD9htnp4Z8n9ZCO5b/9OesPTA
 FgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690965510; x=1691570310;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uQ+lNL4fO4KPGrAzOlHkF7rrOY5ykF3mAwSuq0Z7KDY=;
 b=HInibKaarrMTpblu/b4ROIs5itBbEzUxVwQSIhV8wcbbzYfTS3C4aIfq6P5/8rpmm+
 AK+QG0hL2N4Y0mCkMavf9vhJwLLAm4ZIPt6yft+MnXx8lD2poGcfxgkAVBro0qtMm1ut
 EwzgmkLGIlh3JNJF/98Ew2l5uFsvEAkGuZhNF55ck3Q9C9gLqPgdSo3qj4N67yWjntSc
 Y6fIiaD0zq6/nVUYHBHd+zlbEF9aWsg6DImBHYVW1sfzMFhPrcHDe7Z/yamomcBu8v6N
 xMCm71MpqfsxJ7/MJkGGDB0gzEbCPxHKOW/oJmEHwCyyW+MmlG9w0V8V4FZBtd5yEB/w
 +hug==
X-Gm-Message-State: ABy/qLafMtsc/JnwhX4o7TNcegobCSkmp7QmTj/bJSmUreAV6cArXloE
 gzL2a1c8jtpCZEWhYHvn6oY=
X-Google-Smtp-Source: APBJJlEsy3ACQgE6lOUDSPn2tWv/oqAwyKEEpzaXCPVzqCTaqyZrq4EbhQfMCaLBMl5F/rx45fe0rg==
X-Received: by 2002:a2e:2e0c:0:b0:2b7:33a6:f2c0 with SMTP id
 u12-20020a2e2e0c000000b002b733a6f2c0mr4643236lju.4.1690965509637; 
 Wed, 02 Aug 2023 01:38:29 -0700 (PDT)
Received: from [192.168.0.124]
 (ip-37-248-152-247.multi.internet.cyfrowypolsat.pl. [37.248.152.247])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e3e05000000b002b9fec8961bsm457240lja.123.2023.08.02.01.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 01:38:28 -0700 (PDT)
Message-ID: <08258243-863b-62b4-bff6-71e28c3208c3@gmail.com>
Date: Wed, 2 Aug 2023 10:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: samsung-s6d7aa0: Add MODULE_DEVICE_TABLE
Content-Language: en-US
To: Nikita Travkin <nikita@trvn.ru>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230802-gt5-panel-dtable-v1-1-c0a765c175e2@trvn.ru>
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20230802-gt5-panel-dtable-v1-1-c0a765c175e2@trvn.ru>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2.08.2023 08:41, Nikita Travkin wrote:
> The driver can be built as a module, however the lack of the
> MODULE_DEVICE_TABLE macro prevents it from being automatically probed
> from the DT in such case.
> 
> Add the missed macro to make sure the module can load automatically.
> 
> Fixes: 6810bb390282 ("drm/panel: Add Samsung S6D7AA0 panel controller driver")
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 1 +
>   1 file changed, 1 insertion(+)

Acked-by: Artur Weber <aweber.kernel@gmail.com>

Best regards
Artur
