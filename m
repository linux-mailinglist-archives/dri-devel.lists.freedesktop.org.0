Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31881E1C43
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1210B6E111;
	Tue, 26 May 2020 07:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AC689CF4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 10:04:10 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id e2so19859499eje.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=Bjt/zSvbXa/zu/1DqeLV5lkZpCwQXQz9zkdRE2Kh4GU=;
 b=PRa845S1NN0YeDKOqeAHa3kqlCwnoooouV1cZ+G6BBnG96nUPAm/ebcjOSOr5qDpTT
 soZ+8TO5xdR5n8tORoXobEbN3nKld1ngJYT0qhbzE83/zyZldV3MtSyqK80hNwsONMht
 hAOnNBBfl8qGqnlLyO8WT7Ju660Ju2UPk+y+hTNwg5MfBzE2wo974r6ecaNCDYDXaROz
 L7FjW+aKtnJyoAGsURp4NLLpGIvroOB1a0jv+JKCjL8QbiKGeqKfyMN3Qdwc+xuXHz5r
 N3PhvKT1/staJFIvMRiGyIRXQOKXLoIl9NjbipTsT72cnT6n7IxeQgn8ZhFAdWMzK2a3
 U7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=Bjt/zSvbXa/zu/1DqeLV5lkZpCwQXQz9zkdRE2Kh4GU=;
 b=YHFP6sDFqNqh0OTyj1mfbBxOZ9ID2PgdUj5e9u6gsh+l+mmpNz+3geVDZlyYaT5O8Z
 avTH4vJe6doQg9q/cKerUP5DoZbM/0E3IvFMufWweqwCPvl6Q3igo0oCBp/8NEWamcVu
 Dfh/L7Lef6SECIwYi4Xoc3Uqtcg7/N19BNjgTf49cPc3o1FGi1oBGTLOCsymh+j2B8FG
 Nzn/C5IiXJaw0gPrjMU5We40z3iKrachqco5ntRwZy1p/wtGaUxiKLYrQfmANfZkTEW3
 JgGKKiFoJy2bsTYuEAgrI5hikZz4wtss6YCumiA3S4D6gnj7xok5tUbB68R5s1CqwiGy
 ZvZg==
X-Gm-Message-State: AOAM530o1P+qm3iy1OsI5BUioZcGA9LLsw5P1xVnN9vVJ9SMrtevSvgs
 CzyN/mruzAo/+RNkUFScAyPnUg==
X-Google-Smtp-Source: ABdhPJyr7VQDLjiXcu1rBWC+AkC7vUK0rv8TotJBxTILv3QquVzKAVS1v4aq0BBifjQxKXY7BLeYqQ==
X-Received: by 2002:a17:906:e0c7:: with SMTP id
 gl7mr17760988ejb.306.1590401048997; 
 Mon, 25 May 2020 03:04:08 -0700 (PDT)
Received: from [74.125.143.109] ([149.199.62.129])
 by smtp.gmail.com with ESMTPSA id g21sm15433704edw.9.2020.05.25.03.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2020 03:04:07 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michal Simek <michal.simek@xilinx.com>, Takashi Iwai <tiwai@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <87imikufes.fsf@mpe.ellerman.id.au>
 <12db51d6-d848-118e-5ec1-a4172bd47aa4@xilinx.com>
 <87y2rftrx7.fsf@mpe.ellerman.id.au> <s5hk12z4hj5.wl-tiwai@suse.de>
 <02e7f790-b105-de67-799c-0fe065e58320@xilinx.com>
From: Michal Simek <monstr@monstr.eu>
Autocrypt: addr=monstr@monstr.eu; keydata=
 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
 0Z1MQlmNcq2bhOMzTxuXX2NDzUZs4aqEyZQ=
Message-ID: <c22540fb-1c54-b718-9045-3ee645c30322@monstr.eu>
Date: Mon, 25 May 2020 12:03:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <02e7f790-b105-de67-799c-0fe065e58320@xilinx.com>
X-Mailman-Approved-At: Tue, 26 May 2020 07:26:30 +0000
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sasha Levin <sashal@kernel.org>, sfr@canb.auug.org.au,
 Jonathan Corbet <corbet@lwn.net>, maz@kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Allison Randal <allison@lohutok.net>,
 Matt Porter <mporter@kernel.crashing.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Wei Hu <weh@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Content-Type: multipart/mixed; boundary="===============0853765292=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0853765292==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="d5ehDgV0ucjEpZ4HrapLBQRqHy1IvdMvB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--d5ehDgV0ucjEpZ4HrapLBQRqHy1IvdMvB
Content-Type: multipart/mixed; boundary="el69VWqfFcYspe9mmcT3SW6ggaGOab0w6";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
To: Michal Simek <michal.simek@xilinx.com>, Takashi Iwai <tiwai@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, git@xilinx.com, sfr@canb.auug.org.au,
 maz@kernel.org, Alexios Zavras <alexios.zavras@intel.com>,
 Alistair Popple <alistair@popple.id.au>, Allison Randal
 <allison@lohutok.net>, Andrew Donnellan <ajd@linux.ibm.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 "David S. Miller" <davem@davemloft.net>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Dmitry Vyukov <dvyukov@google.com>, Enrico Weigelt <info@metux.net>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Jonathan Corbet <corbet@lwn.net>, Kate Stewart
 <kstewart@linuxfoundation.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Matt Porter <mporter@kernel.crashing.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Paul Mackerras
 <paulus@samba.org>, Richard Fontana <rfontana@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, Sasha Levin <sashal@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wei Hu <weh@microsoft.com>, YueHaibing <yuehaibing@huawei.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Message-ID: <c22540fb-1c54-b718-9045-3ee645c30322@monstr.eu>
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <87imikufes.fsf@mpe.ellerman.id.au>
 <12db51d6-d848-118e-5ec1-a4172bd47aa4@xilinx.com>
 <87y2rftrx7.fsf@mpe.ellerman.id.au> <s5hk12z4hj5.wl-tiwai@suse.de>
 <02e7f790-b105-de67-799c-0fe065e58320@xilinx.com>
In-Reply-To: <02e7f790-b105-de67-799c-0fe065e58320@xilinx.com>

--el69VWqfFcYspe9mmcT3SW6ggaGOab0w6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On 01. 04. 20 13:30, Michal Simek wrote:
> On 01. 04. 20 12:38, Takashi Iwai wrote:
>> On Wed, 01 Apr 2020 12:35:16 +0200,
>> Michael Ellerman wrote:
>>>
>>> Michal Simek <michal.simek@xilinx.com> writes:
>>>> On 01. 04. 20 4:07, Michael Ellerman wrote:
>>>>> Michal Simek <michal.simek@xilinx.com> writes:
>>>>>> Hi,
>>>>>>
>>>>>> recently we wanted to update xilinx intc driver and we found that =
function
>>>>>> which we wanted to remove is still wired by ancient Xilinx PowerPC=

>>>>>> platforms. Here is the thread about it.
>>>>>> https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbab=
fa2e8@xilinx.com/
>>>>>>
>>>>>> I have been talking about it internally and there is no interest i=
n these
>>>>>> platforms and it is also orphan for quite a long time. None is rea=
lly
>>>>>> running/testing these platforms regularly that's why I think it ma=
kes sense
>>>>>> to remove them also with drivers which are specific to this platfo=
rm.
>>>>>>
>>>>>> U-Boot support was removed in 2017 without anybody complain about =
it
>>>>>> https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c06=
9821bbba10273a0a8ed
>>>>>>
>>>>>> Based on current ppc/next.
>>>>>>
>>>>>> If anyone has any objection about it, please let me know.
>>>>>
>>>>> Thanks for taking the time to find all this code and remove it.
>>>>>
>>>>> I'm not going to take this series for v5.7, it was posted too close=
 to
>>>>> the merge window, and doing so wouldn't give people much time to ob=
ject,
>>>>> especially given people are distracted at the moment.
>>>>>
>>>>> I'm happy to take it for v5.8, assuming there's no major objections=
=2E
>>>>
>>>> Sure. Just to let you know Christophe Leroy included this patch in h=
is
>>>> series about ppc405 removal. It should be the same.
>>>>
>>>> If you don't want to take that alsa patch I can send it separately a=
nd
>>>> this patch can be taken from his series. I don't really mind but ple=
ase
>>>> let me know what way you prefer.
>>>
>>> It's better to keep it all together, so I'm happy take the alsa patch=
 as
>>> well, it's already been acked.
>>
>> Sure, please go ahead.
>=20
>=20
> g8.

Can you please take this series? I know that there is v5 from Christophe
which has this 1/2 as 1/13. But I need this alsa patch too and I would
like to close this because it is around for almost 2 months and none
raised a concern about removing just these Xilinx platforms.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs



--el69VWqfFcYspe9mmcT3SW6ggaGOab0w6--

--d5ehDgV0ucjEpZ4HrapLBQRqHy1IvdMvB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQbPNTMvXmYlBPRwx7KSWXLKUoMIQUCXsuYAAAKCRDKSWXLKUoM
IcbUAJwITUY181qEg4Mi7BRwVMsvUpJUyACeOKkODc6Yf0+BNw4WlPCdG0HcOyI=
=V/1K
-----END PGP SIGNATURE-----

--d5ehDgV0ucjEpZ4HrapLBQRqHy1IvdMvB--

--===============0853765292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0853765292==--
