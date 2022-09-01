Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A28E5AA353
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 00:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3629A10E396;
	Thu,  1 Sep 2022 22:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E2510E37B;
 Thu,  1 Sep 2022 22:52:11 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id bn9so574973ljb.6;
 Thu, 01 Sep 2022 15:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc;
 bh=Dhwd+COjDW5ThjQ0eGNlcg2FwWXLsRihwwituLHXIZw=;
 b=Qg20bj9HVOA0O2Dv7pbgLFpIerRd3OpfYftDq4iLQONPRjHm8OE5FicN0K1WL1v+S3
 bISpN5k4Xg9gTk37HMqAreo6nvuLyU3JTBpgQLIjzDvBJIqAXMP5MfRK4NHoGkdf8jpo
 3glN34VMEDD6Gh+Zf1murR+o5lg06tWVopJIiQgpwbgHGnSUZUKhfMxhxUfv/PKpvsCf
 qwtgF3sgpUqP0AbUb+d/a1esSHZ+I5KHKcW+5WE2OKOtNa+X+J/AAtNMS15RdoIDBSEy
 T+m/BQNhtbsQ6WmcJD2FSngsG3cTf0OyGVh/5RtK7l/wyzsThnJPsLTNCVmQ7lejIS6h
 shRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc;
 bh=Dhwd+COjDW5ThjQ0eGNlcg2FwWXLsRihwwituLHXIZw=;
 b=Fd99hL1u+xo4KfogEckDrFppovOpq2htnG7hmysVP0dlV01lJjiWjUYuNGF0QlrtKB
 CLP16JJUEg1jdcI4Kqx0mkk67JFzDp3qwecfs/w8ITXqpxJ112WLKmvUGhMjfSMjX1oU
 q500eDp2jNCZGbZEln3nGh/wa3QEYjCBQmfQu2LrOamr5Xsci27L8qMavSs1OqV0BOe6
 kB+jbIyV7yMIT/mtOxaZ0e5WtwMPXcPlLZSifBzD3nXFco6GLOHdrZHfk8NoRHJv82Bt
 /kEGheXDwjMmKk5/J1iqN2hd4zecE7Txbwr8fyiiju8QqsFto5PmmvmSwoMJElOldUQE
 qOjQ==
X-Gm-Message-State: ACgBeo2IgvLFYuE+Zd+6FGvB4X5oxPh6fTGVFoYrI22c6L8pDDtseE9p
 8+GcWoZay2IpeamjalNsIYE=
X-Google-Smtp-Source: AA6agR5VyqkvxxIZF1flgFAUFyuS1vlvIP1xurquBEUnw5mRA/4PMLSVlwqN/Hy1Kir2419wd9jhSA==
X-Received: by 2002:a2e:bd0e:0:b0:268:c03b:cf56 with SMTP id
 n14-20020a2ebd0e000000b00268c03bcf56mr1277850ljq.393.1662072729392; 
 Thu, 01 Sep 2022 15:52:09 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:9c45:8fa1:8ce7:8852?
 ([2a02:a31a:a240:1700:9c45:8fa1:8ce7:8852])
 by smtp.googlemail.com with ESMTPSA id
 w9-20020a2e1609000000b0025e15fe421bsm29224ljd.17.2022.09.01.15.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 15:52:08 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <768daa58-d1cd-7e9d-4f6e-722f2b0afab9@gmail.com>
Date: Fri, 2 Sep 2022 00:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v2 20/41] drm/modes: Properly generate a drm_display_mode
 from a named mode
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-20-459522d653a7@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-20-459522d653a7@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

> +        if (!named_mode->tv_mode)
> +            continue;

As mentioned in the previous email replying to 19/41, this makes it impossible
to specify DRM_MODE_TV_MODE_NTSC_443 as currently defined in the named mode
successfully.

Best regards,
Mateusz Kwiatkowski
