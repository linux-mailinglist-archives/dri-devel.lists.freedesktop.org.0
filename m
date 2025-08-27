Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0EFB37917
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 06:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9CD10E6F2;
	Wed, 27 Aug 2025 04:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HXzDrS96";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91B510E6F2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:28:29 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-afcb72d51dcso875208266b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 21:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756268908; x=1756873708; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8PzH67qVhc1HJfhL/IUyEczDHRosqco9gYe1CLUj17w=;
 b=HXzDrS96dBAFhl9jFDRiinn8twbg4WD9lNLAIhL5J9l9t+4m/y0LxvAq5oSR5Iikxc
 rtO11wZUp7tl0v+wm/ufdvTQJD3+0oLj45KOUjbwRgiTN26fwI+kOqCTEkCbi2yjUwTK
 /waxf4W6WC/4MZ/z6JOf5+n8AmF0LM5DPfAlhK3aoeIoNr2coMVgCtq5Ico7KTh6PBla
 coj+W3ZeGPiukOf3pG9y07ikGNK5wJREjak5MwwlovRX1TbN3WZolDUIXuN/rNoaFIrR
 SI6lC0joxRvy2kxLU7CxtsBWQxavxELK8RDo6n5CXb6HGyJtjc8jf60+83w1+Y4ltplC
 PT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756268908; x=1756873708;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8PzH67qVhc1HJfhL/IUyEczDHRosqco9gYe1CLUj17w=;
 b=vaku9X3RBk0R6dFanvfmuYX7Pklyhp5IOk2l2UbtUPHP99NUezVKIAZWZzoySIcx4p
 Qc7m8RlOKij+zJPq2olYWaNh9ieHceIzSKAZtyfN1rSi+HCxt6+L8GGFijOWCl7eqg7V
 25V6KWoKTHDlaHIqVqUGGh2tYvoOVJDTCUJWLG2nWqPuthAvcoCujv//srpT1mF3oH5v
 OaVSTxgSFdVVK/WOmss31nBMJplitTr62YKgsCKTuXdbfUhhlWkol0VJbHBgL+H2nBzh
 gVsZj2ZwhP3C1w0u9er928TCwzhT15RoFEfdFUF3uOxm6Iy6a+ZZe5vufo1AKblm47Ib
 Y80g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGJ+jR82ahCJRkPmZ0Xh963n16xI80SyMHXcVLmIeUFvW/6WCUGCurGRe/++zXpoXE/ljVYOwtzE8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPCwGgL/7+bYVePrTFQwt3msRGsTM7GEmfENmi+4RTGmTV1+Q3
 U0CNg6aUIoqUXNcLPocpR3nJILVm1r5brF+k0NpwwaXxx4nkcaReu39K
X-Gm-Gg: ASbGncs5KOyAtpAFkpCr/S9JCD2mzRQDAowoc168uBrH37OQJz8XVXXNSnp+mDvH2iP
 sQwY50I65dpq+TKebDgQnr7q+/L9Zoo6JvxF/nfECuQeyR5atDMdsHx6u73Hehwe2CkFDBZPOYi
 ytl6zLdJxItM+QvzS3c5aSxU/KGYYyG8PwGH9kFnEqPjzjUSJtCfFNpfR3eLFFa4r/i/UHek2GD
 mfm57299SAtjOKGKsJmR+ux161UcinsaA9a6D5y3iBXy54MJDoXRIHaPtYRpvRFs+t67EPDDnvD
 xRNCdXu2rp3g0+hRu3A9GZZLYOT+8eNp6rgGykJ/ijgj0K+4zzCAqgHZ/fKl1Q50EpLTGfUccLU
 cVCCYpSshpH9iXs5kbV66LC+0IGyBurD7rw0=
X-Google-Smtp-Source: AGHT+IExRye3++0RibNpkbuBt9GdpOdlAkhvl85P7LOJTrQQyRm+u65q2iKB4iA790zlmhnpjTVnfg==
X-Received: by 2002:a17:907:3f29:b0:af9:a4de:f092 with SMTP id
 a640c23a62f3a-afe294c768emr1670874966b.55.1756268907959; 
 Tue, 26 Aug 2025 21:28:27 -0700 (PDT)
Received: from [127.0.0.1] ([5.248.55.4]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afec096c7a0sm88309266b.43.2025.08.26.21.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 21:28:27 -0700 (PDT)
Date: Wed, 27 Aug 2025 07:28:26 +0300
From: Svyatoslav <clamor95@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
CC: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_02/19=5D_dt-bindings=3A_cloc?=
 =?US-ASCII?Q?k=3A_tegra20=3A_Add_IDs_for_CSI_PAD_clocks?=
User-Agent: K-9 Mail for Android
In-Reply-To: <2451218.NG923GbCHz@senjougahara>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-3-clamor95@gmail.com> <2451218.NG923GbCHz@senjougahara>
Message-ID: <268A6593-1FAC-4A4D-925A-801FB6FEE9F6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80=2E 07:19:39 GM=
T+03:00, Mikko Perttunen <mperttunen@nvidia=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=
:
>On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
>> Tegra30 has CSI PAD clock enable bits embedded into PLLD/PLLD2 register=
s=2E
>> Add ids for these clocks=2E
>>=20
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  include/dt-bindings/clock/tegra30-car=2Eh | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/include/dt-bindings/clock/tegra30-car=2Eh
>> b/include/dt-bindings/clock/tegra30-car=2Eh index f193663e6f28=2E=2E14b=
83e90a0fc
>> 100644
>> --- a/include/dt-bindings/clock/tegra30-car=2Eh
>> +++ b/include/dt-bindings/clock/tegra30-car=2Eh
>> @@ -271,6 +271,8 @@
>>  #define TEGRA30_CLK_AUDIO3_MUX 306
>>  #define TEGRA30_CLK_AUDIO4_MUX 307
>>  #define TEGRA30_CLK_SPDIF_MUX 308
>> -#define TEGRA30_CLK_CLK_MAX 309
>> +#define TEGRA30_CLK_CSIA_PAD 309
>> +#define TEGRA30_CLK_CSIB_PAD 310
>> +#define TEGRA30_CLK_CLK_MAX 311
>>=20
>>  #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
>
>The commit message refers to tegra20, but contents are tegra30=2E
>

My, bad, it should be tegra30

>Regarding the CLK_MAX define, I agree that it would be better to get rid =
of=20
>it=2E Perhaps you can check if it would be reasonable to calculate it=20
>dynamically in the driver, but a define and sanity check in the driver wo=
uld=20
>work too, I think=2E
>

It is not unreasonable, but moving this elsewhere may cause issues with ad=
ding new clocks=2E Addind new clocks would require updating not only header=
 but also a place where max clocks are moved to and ai am not sure how can =
I dinamically calculate amount of clocks in the driver without updating bot=
h header and driver with each new clock added=2E Maybe you can propose a me=
thod?

>Cheers,
>Mikko
>
>
