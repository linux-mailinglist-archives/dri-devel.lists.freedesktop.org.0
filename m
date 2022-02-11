Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D96914B20C5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 09:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354A910EA26;
	Fri, 11 Feb 2022 08:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7884710EA27
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 08:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644569700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WAVrdasKBTmSKo6xAnwq3AFAS48lB2tsIo4HhkkN4rE=;
 b=d5Rl/rvYu174IcQ/yFA8kORot3DGkMvom9aqjLeEdKnKOLWztlCbDq7sRii6DzqDJhob12
 wmNb6B3Zaxs3tsaCd5wbOAS2rG6DyYSyque1by+0aVRS8vvwN3h9Nx3e3quMxMhGvo57zZ
 3ro0ORX2mmQHb9d4FsJQx8cngVAMfgU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-XeYDozg2Pa2kQSrvsDD0Bw-1; Fri, 11 Feb 2022 03:54:58 -0500
X-MC-Unique: XeYDozg2Pa2kQSrvsDD0Bw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r187-20020a1c44c4000000b0037bb51b549aso2096124wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 00:54:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=WAVrdasKBTmSKo6xAnwq3AFAS48lB2tsIo4HhkkN4rE=;
 b=f8p2bBk6sUsLiqwTibTsmeb9FayVZ2MkRlWqZ82Q26Rjr1dI7W0eVWqgz59MBXUmty
 DMFqJYMCRft1Gt0zbbt3F0HVtMAI4IqvIr4u9u+sflB17D+BFgL3A3azdKW/1X+AO7g4
 CFCQXnqnvnThoB5WnahGtaoVw7oQf5nFO1qjcj5OChEovr/gVLzGxnifGeBAXxLgLpim
 2kKtTEY+IuALz4xzv4vjJvNJrUSQtsNKrjWtqbhlz/Yoc7io9oVKexJoBLD8HKkg69ti
 2EZelrQebzRw7P9KarHAMnlgOrtrNm1PjmugCCD/fQ3KmytwZV6h7xJ8SqhxQ+tJJF68
 xZUA==
X-Gm-Message-State: AOAM531kqqvbGqWzXO7aNA8OUJ1o+URi0SQr8x1gKbU4C6XNV+aziMGR
 oEAHPDY9knypQ6VDRWmLAHxH2rlK0farHSwugjtUTTMZBsFcQSPKBOjDxGzYSd97T1Wvd0gnXmg
 3AzbVC8twyeTM5wArcZV2g6X8sWlS
X-Received: by 2002:a5d:6382:: with SMTP id p2mr510792wru.548.1644569697672;
 Fri, 11 Feb 2022 00:54:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7iG18nW2Fpgx5sq0P74kkf/bt73zc9m6iHNReHupDFVdcYSZKzYxuRDWV0Zwtdy4ny1OKIg==
X-Received: by 2002:a5d:6382:: with SMTP id p2mr510770wru.548.1644569697477;
 Fri, 11 Feb 2022 00:54:57 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id p2sm3454359wmc.33.2022.02.11.00.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 00:54:56 -0800 (PST)
Message-ID: <fb8d6519-2db0-3b94-61ca-2081a6b2e3a4@redhat.com>
Date: Fri, 11 Feb 2022 09:54:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/7] drm: Add driver for Solomon SSD130X OLED displays
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-4-javierm@redhat.com>
 <YgPZ3W0e7N7JQ1dT@smile.fi.intel.com>
 <e29eaccc-863a-21d4-e669-0b708604d723@redhat.com>
 <YgPnE0yj0Y0OJxq6@smile.fi.intel.com>
 <406152d8-13e4-de8a-9542-bf1d96dbab0a@redhat.com>
In-Reply-To: <406152d8-13e4-de8a-9542-bf1d96dbab0a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/22 17:26, Javier Martinez Canillas wrote:
> On 2/9/22 17:08, Andy Shevchenko wrote:
> 
> [snip]
> 
>>> Agreed, as mentioned I'll give it a try to sending all the data as a
>>> bulk write with regmap.
>>
>> Ah, it might be that it should be noinc bulk op. Need to be checked anyway.
>>
> 
> Yeah, I'll give it a try for v4. Let's see how it goes.
> 

I tried to do bulk writes for the command, but the problem is that the
command stream has to be as follow (i.e: SSD130X_SET_COL_RANGE command):

SSD130X_COMMAND
SSD130X_SET_COL_RANGE
SSD130X_COMMAND
col_start
SSD130X_COMMAND
col_end

That is, a SSD130X_COMMAND has to be writtn for each command and command
option. This means that you need to either construct a command stream in
the ssd130x_write_cmd() function or pass multiple SSD130X_COMMAND as
variadic arguments.

Both cases lead to a less elegant implementation than just having a count
parameter in ssd130x_write_cmd() and doing multiple writes as it is done
in the current implementation.

After all, these are only for commands that are done once to setup the
device. The SSD130X_DATA writes that are to update the display pixels are
already done in bulk, which are more important to do it efficiently.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

