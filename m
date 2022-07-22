Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B5057E075
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 13:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3E694110;
	Fri, 22 Jul 2022 11:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4372D94110
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 11:05:02 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id j70so5239379oih.10
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 04:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ClcvuyoVSKPNIGPC6XYZgGXhO5C2e/zHEXJEcPjU7bs=;
 b=HlbFIggBd1enoF0DBBJXL25iYInfB8KMOgRSOH0Gm/0Rnz/tw3zcqpPOaVNvCo8dbi
 PMBfY8aZfcU8Opx4xl7RRmXkJY2X4ARJnb7rpmW7Q4n+joakPxlqp0QDoSlHgbgk/BFE
 DIBwHFIawJ4pXB6oknmtXtXa7zUdC2/n6RZCL/wKNzQj5UeOV58unRrdzWPKcKl7Zet/
 XiPt/FqWvisQxBNGpdiBKjjyTxE0DRKd/fvm1v36PCjK48TQ2RlYJtmcvJHh1FysUzOg
 bstiUMl2kzKm9MTcMzOhx9TSs4vVQlBAGqboNRugdoK0CuvQow1/npjvp4Y4PsuSc64y
 qBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ClcvuyoVSKPNIGPC6XYZgGXhO5C2e/zHEXJEcPjU7bs=;
 b=ToLBo2VsVOw2R8rdYkdip0zABJpfbaKLvofwPrN8x6j/QGSuE9n4hob4A1tm0629e6
 RmyqEha2V7uMSt1fO99+Wo3/dIbcgJW9eEaDcPGJbzlXXexEC9Ln41g81gs3xRovuIdz
 1NaFUsNOCcmIwJlKSVeMeYaqws6WkCQ96+o7pRPahpdrujTor8T0Wx6Hka9OKd6/wlNc
 0zKyOwQ4/RuSAOPI12MOt/yqlBj7LoA+a0MFOd5yQZDQWiXmVTGJCXeyxSs4fqUS7H4a
 rCycEjqEWGq12HxhDIzZT1KFqOTx0IbgQZtfRNCQXu0Z1lxk1BTtmqEZ8gHZ477pbPAR
 Mq9g==
X-Gm-Message-State: AJIora8d0W6ravL4ujZxyfeMPuHI/eorqOUz4qW4Ch6JjKdvrHiivYZq
 SYX9LrV86rsDPTBw+jtEQICayQ==
X-Google-Smtp-Source: AGRyM1sOPgZ02x9KlIIK2eI9XwQtYb3a0w3MvEex17vJsjkcLOrRvD2nqiMuPMVayW1gZY+Usy1kiw==
X-Received: by 2002:a05:6808:201c:b0:33a:a038:ea8b with SMTP id
 q28-20020a056808201c00b0033aa038ea8bmr1184432oiw.98.1658487902053; 
 Fri, 22 Jul 2022 04:05:02 -0700 (PDT)
Received: from [192.168.1.195] ([187.36.234.139])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a056870421500b001019fb71e4bsm2105289oac.17.2022.07.22.04.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 04:05:01 -0700 (PDT)
Message-ID: <b1ae4f77-4e24-24c9-fd87-abcd612a3533@usp.br>
Date: Fri, 22 Jul 2022 08:04:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 9/9] drm: selftest: convert drm_mm selftest to KUnit
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20220708203052.236290-1-maira.canal@usp.br>
 <20220708203052.236290-10-maira.canal@usp.br>
 <CAM0jSHNG8Ozs+NpvwMK6zvbRm3Ve=Wa1_H7jS0uQ8FeAWgvyoA@mail.gmail.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>
In-Reply-To: <CAM0jSHNG8Ozs+NpvwMK6zvbRm3Ve=Wa1_H7jS0uQ8FeAWgvyoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Arthur Grillo <arthur.grillo@usp.br>, siqueirajordao@riseup.net,
 David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kselftest@vger.kernel.org, n@nfraprado.net,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 magalilemes00@gmail.com, Javier Martinez Canillas <javierm@redhat.com>,
 kunit-dev@googlegroups.com, mwen@igalia.com, David Gow <davidgow@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 tales.aparecida@gmail.com, kernel list <linux-kernel@vger.kernel.org>,
 leandro.ribeiro@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/22/22 07:35, Matthew Auld wrote:
> On Fri, 8 Jul 2022 at 21:32, Maíra Canal <maira.canal@usp.br> wrote:
>>
>> From: Arthur Grillo <arthur.grillo@usp.br>
>>
>> Considering the current adoption of the KUnit framework, convert the
>> DRM mm selftest to the KUnit API.
> 
> Is there a plan to convert the corresponding selftest IGT that was
> responsible for running this (also drm_buddy) to somehow work with
> kunit? Previously these IGTs were always triggered as part of
> intel-gfx CI, but it looks like they are no longer run[1].
> 
> [1] https://gitlab.freedesktop.org/drm/intel/-/issues/6433

Hi Matthew,

Isabella sent a while ago a patch to IGT adding KUnit compatibility to
IGT [1], but there wasn't any feedback on the patch. I believe that soon
she will resend the series in order to make all KUnit DRM tests run on IGT.

Any feedback on the patch is welcomed so that we can fix this issue as
soon as possible.

[1] https://patchwork.freedesktop.org/patch/489985/

Best Regards,
- Maíra Canal
