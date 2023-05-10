Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E656FE129
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 17:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34A910E4C7;
	Wed, 10 May 2023 15:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD15B10E466
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 08:52:17 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f41d087bd3so28564625e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 01:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683708736; x=1686300736;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+W0u0yW4mt1eIi/4crd+vyLCw2vSkQ6ty0fIhiNv5ZE=;
 b=IEXCK5RaT8/jHtwqWGvJGg3UVFM7d7GsjZYVh1tmATAN547tNCCLl5d7y9Iv5K2Y/l
 +1gjQxx8rphBqAmlO/4ExZLjDahGTYxdV3rJPf9lvXkwesAbnwX4UAF7j8JkS8a20UP3
 3fcAmxsmxIErIAkoRzihqKSEB46YQNDV9ZWSsz0wfN/11Yj6/DpEt8zEOqjjBzhDqNsP
 bzrMQRKOt7Kbio7/28N1u/9Fr6t7PE92sxtQHJWMJ5CASCttJ4DyRhMaEud7GoO27gHv
 T1GnYby7wGMQg7Pp7wNHQnybdSxxW5mPs5k4bjuDtOJhwGVyA3MuRxdtqHFhhMdl3yfq
 saPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683708736; x=1686300736;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+W0u0yW4mt1eIi/4crd+vyLCw2vSkQ6ty0fIhiNv5ZE=;
 b=DK7l5cmzHW4UTzRLYes+zSxZN5YGBj4mrepTIp6PWrO32eaigH0j9XhZY/vUHT4PFZ
 FAbsAfXbi1VbkGrWeCnV9827w4bO0OrXC+FqOr1NE0hMEeyg33v4HA6N3k+51SNfwpVB
 Kz3UKv3LvEi6J7eqhcvdXTC/BAsyjLwPlDq3T5mjRES3t5VyG2C9hyfuB/Ag8SANdGFx
 Dh5YCJHiUenbC5eNQWH8JsSUvsUnapesNlHqD7arj51TRHV0qfJsu2p4LNRs4vV9v3yT
 sSTFQEPNH3PJT0EpjlHBuKbDfYERcFritYm+WugHgPiRcbtqopCkUGYO4zMYWHKCsAyn
 OTew==
X-Gm-Message-State: AC+VfDyGOTLComAovczDxEarPSGv8MBK2cLzPucdbWXRdUleRepCJVeb
 DuQn0oiSiqDmzshM1i6MP08=
X-Google-Smtp-Source: ACHHUZ7ivHBQG4YpZufVS236WKTcLxuvGLQefRgCKFpaeE5Ooo0XYy/L/+l61SuQWpkbjrIqePoofQ==
X-Received: by 2002:a7b:c5d3:0:b0:3f1:6ef6:c9d0 with SMTP id
 n19-20020a7bc5d3000000b003f16ef6c9d0mr11110681wmk.17.1683708735582; 
 Wed, 10 May 2023 01:52:15 -0700 (PDT)
Received: from [192.168.1.131] (cgn-89-1-213-9.nc.de. [89.1.213.9])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a7bce8e000000b003f182a10106sm22166844wmj.8.2023.05.10.01.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 01:52:15 -0700 (PDT)
Message-ID: <4378f2ba-f620-b4e8-f0b3-9d08dcb6e2f3@gmail.com>
Date: Wed, 10 May 2023 10:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1] backlight: lm3630a: turn off both led strings when
 display is blank
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>,
 Maximilian Weigand <mweigand2017@gmail.com>
References: <20230505185752.969476-1-mweigand2017@gmail.com>
 <20230509165232.GA1072872@ravnborg.org>
From: Maximilian Weigand <mweigand2017@gmail.com>
In-Reply-To: <20230509165232.GA1072872@ravnborg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 10 May 2023 15:07:55 +0000
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


>> +	if (backlight_is_blank(bl) || (bl->props.brightness < 0x4))
> You could replace bl->props.brightness with backlight_get_brightness(bl)
> to avoid direct access to the properties.

Thanks. Changed in v2.

>> +		/* turn the string off  */
>>  		ret |= lm3630a_update(pchip, REG_CTRL, LM3630A_LEDA_ENABLE, 0);
>>  	else
>>  		ret |= lm3630a_update(pchip, REG_CTRL,
>> @@ -277,7 +279,9 @@ static int lm3630a_bank_b_update_status(struct backlight_device *bl)
>>  	usleep_range(1000, 2000);
>>  	/* minimum brightness is 0x04 */
>>  	ret = lm3630a_write(pchip, REG_BRT_B, bl->props.brightness);
>> -	if (bl->props.brightness < 0x4)
>> +
>> +	if (backlight_is_blank(bl) || (bl->props.brightness < 0x4))

Thanks. Changed in v2.
