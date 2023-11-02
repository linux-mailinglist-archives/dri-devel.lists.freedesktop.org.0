Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2BD7DED03
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 07:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5E010E816;
	Thu,  2 Nov 2023 06:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961F410E816
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 06:59:35 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c509f2c46cso8501031fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 23:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698908373; x=1699513173; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=i5RLr2E6BGxur/KDe5TRJag8ggHO5qnbcrha9fCnaok=;
 b=MS3GCEpAjbKpGBoB76t4VVObJ9O6POKUN/UzTeZpj0U8TSqqya+gqbpvLTTvjtN4/G
 spy1jvvpK8GzgYAcg/3U0f4ee4SOniJh1+sqX7i9698EfCYd7pN7QbS4RaLJSSGAEPfG
 vpDhQupS2swpPuc4+RMlI4ypa6fr8q/ZR13osdKNCOAI0tcU2Al1fyqpJnWhx5uzUNEG
 6mPfdmhcABhFpMd39iGSLUK2iC5KXnkc4uVZFK9gXtjJaPM5lS++wvQwORDS84Rf5K7w
 j8ybAcqa6hUf7knUnn4ex0R4gPZ63JB29OuNM2gan2tNIaSG5UUZ8KWp821ZwMpjJBmP
 AgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698908373; x=1699513173;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i5RLr2E6BGxur/KDe5TRJag8ggHO5qnbcrha9fCnaok=;
 b=W2L+WA2JRjPj8YRl4FbRAPEwGNgCiFXI2pt1VbAKSgCyjvycLj3boz4Klbu0o7JdaE
 Hspv67srKtTVAq8oizlAuhDuN92qFCWh47mH/o0TPV365uoCJJ3NjoHiyf7GaWL4sD5I
 W5wgiI3n5w5SWbMKysvoUzuoW/g015pIO8kMc3Pi4ilJoY8Td5JY7G0ssXZ9vHRkAnKp
 YhUD6BFyh3ZZNWK3COXZqf7I06J40QD5xZNakk6+Y80R8X0YGsVIfsBsEF17Ae648nb2
 ISsX9bjC+OGzIMqoup/k3xheOww+SpLiqqKSmN5B5cSQRmBBQUGDoZCwW+pfSKv5qfwA
 Qyvw==
X-Gm-Message-State: AOJu0Yx6YXIEMbiC9k/SVblu+BvXTxPRF2IIPkUro/ttJgh6wuXnD47A
 VH7fGkOZ1WVBv4bIY2sjcxWSDmaQF9HtvS50zS7uDa4gKZM=
X-Google-Smtp-Source: AGHT+IGUrhmY3alUwNpHazC6eunWxF03nz8+aSEVBYgu6AGw3snQArPg7JukR9qV0ES+unjok4sEICTff0Qzf6a2/c4=
X-Received: by 2002:a2e:a442:0:b0:2c5:3339:71d6 with SMTP id
 v2-20020a2ea442000000b002c5333971d6mr13062745ljn.19.1698908373307; Wed, 01
 Nov 2023 23:59:33 -0700 (PDT)
MIME-Version: 1.0
From: Trigger Huang <trigger.huang@gmail.com>
Date: Thu, 2 Nov 2023 14:59:21 +0800
Message-ID: <CANH0Q9mzBVr7KTJQmvLsqndpTZ8JU0rDfDQhu10kFsRgfybA4A@mail.gmail.com>
Subject: =?UTF-8?Q?=5Baccel=2Fivpu=5D_Help_=2D=2D_Which_Intel_CPU_processor_can_b?=
 =?UTF-8?Q?e_used_for_iVPU_driver=EF=BC=9F?=
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000018d534060925ee0b"
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000018d534060925ee0b
Content-Type: text/plain; charset="UTF-8"

Hello,

I want to have a try for the iVPU driver but don't know which CPU platform
is suitable. Would you help?

According to the description in linux/drivers/accel/ivpu/Kconfig, it says
that Choose this option if you have a system that has an *14*th generation
Intel CPU
But according to the Intel  I7 *14*700k spec (
https://www.intel.com/content/www/us/en/products/sku/236783/intel-core-i7-processor-14700k-33m-cache-up-to-5-60-ghz/specifications.html),
there is
no description about Versatile Processing Unit.

So which CPU should I choose?

Thanks,
Trigger

--00000000000018d534060925ee0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I want to have a try for the iVP=
U driver but don&#39;t know which CPU platform is suitable. Would you help?=
</div><div><br></div><div>According to the description in=C2=A0linux/driver=
s/accel/ivpu/Kconfig, it says that=C2=A0Choose this option if you have a sy=
stem that has an <b>14</b>th generation Intel CPU</div><div>But according t=
o the Intel=C2=A0 I7 <b>14</b>700k spec (<a href=3D"https://www.intel.com/c=
ontent/www/us/en/products/sku/236783/intel-core-i7-processor-14700k-33m-cac=
he-up-to-5-60-ghz/specifications.html">https://www.intel.com/content/www/us=
/en/products/sku/236783/intel-core-i7-processor-14700k-33m-cache-up-to-5-60=
-ghz/specifications.html</a>), there is=C2=A0</div><div>no description abou=
t=C2=A0Versatile Processing Unit.</div><div><br></div><div>So which CPU sho=
uld I choose?</div><div><br></div><div>Thanks,</div><div>Trigger</div></div=
>

--00000000000018d534060925ee0b--
