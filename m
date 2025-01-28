Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89315A20E0A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC65710E0A5;
	Tue, 28 Jan 2025 16:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="tG7+EqD6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D1D10E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 16:08:13 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250128160811euoutp028216f8505213a1570b7b85baff782cca~e5v_bfzvA0639006390euoutp02U
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 16:08:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250128160811euoutp028216f8505213a1570b7b85baff782cca~e5v_bfzvA0639006390euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738080491;
 bh=6c0m7wbLpqSxp9r7NFxt/0mJL6hLBxypbiJD2llazOI=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=tG7+EqD6CRDZEo8W7g/2zqsU0k1VOo8pGjX14UE+PWRHyjv37DvCFosm9MbGEsTHl
 3pQcAcORexP1oe4C4EExs01LeH+oOQfJX3Yqrgmm1o+iO1jlDzGUgcZWz9Wf0+tsaG
 e40eUb8oOky227HX6SXk2cl/PHNAv90adv+cLR7Y=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250128160811eucas1p1e869522ce894d838ab114cc2908333a4~e5v_Jl3Jr0855608556eucas1p1X;
 Tue, 28 Jan 2025 16:08:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 0B.00.20409.BE009976; Tue, 28
 Jan 2025 16:08:11 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250128160811eucas1p26de774f66d397fa447cf181f86a7a464~e5v963Tvg1873918739eucas1p2e;
 Tue, 28 Jan 2025 16:08:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250128160811eusmtrp260fc9f5153df7a7661fa93f82becff2e~e5v96WVcp0739307393eusmtrp2W;
 Tue, 28 Jan 2025 16:08:11 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-ec-679900eb531b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id AD.F5.19920.BE009976; Tue, 28
 Jan 2025 16:08:11 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250128160809eusmtip2a889eb283dfd7a1749ae0401bfafa7d2~e5v8rBAwL0457004570eusmtip2d;
 Tue, 28 Jan 2025 16:08:09 +0000 (GMT)
Message-ID: <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
Date: Tue, 28 Jan 2025 17:08:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, DRI mailing list
 <dri-devel@lists.freedesktop.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djPc7qvGWamG6xZJ2rR2zSdyWLqwyds
 Fq+nfWCzmHj+J5vFla/v2SyaF69ns7i8aw6bxdwvU5kdODw2repk87hzbQ+bx7yTgR77565h
 97jffZzJ4/MmuQC2KC6blNSczLLUIn27BK6MT3cesBY8kKv4uuI8YwPje4kuRg4OCQETifn/
 fLoYuTiEBFYwSuyauJINwvnCKLHoWBMjhPOZUWJ15w/mLkZOsI7208+hqpYzSqzdfB/K+cgo
 MffPExaQKl4BO4lXE7awgdgsAqoSp75vZYOIC0qcnAlRIyogL3H/1gx2EFtYwFtiRet8RhBb
 RMBcYt2kRWBDmQVWM0k86r/BBJJgFhCXuPVkPpjNJmAo0fW2C2wop4CRxNIdb6Bq5CWat85m
 BmmWEHjDIdH29hAbxN0uEsunLWWHsIUlXh3fAmXLSPzfCTIUpKGdUWLB7/tQzgRGiYbntxgh
 qqwl7pz7xQYKM2YBTYn1u/Qhwo4SV7ZPY4EEJZ/EjbeCEEfwSUzaNp0ZIswr0dEmBFGtJjHr
 +Dq4tQcvXGKewKg0CylcZiF5cxaSd2Yh7F3AyLKKUTy1tDg3PbXYKC+1XK84Mbe4NC9dLzk/
 dxMjMDGd/nf8yw7G5a8+6h1iZOJgPMQowcGsJMIbe25GuhBvSmJlVWpRfnxRaU5q8SFGaQ4W
 JXHeRftb04UE0hNLUrNTUwtSi2CyTBycUg1MW7tn6HWanjv6q0qkxmj1nRmlT3stQl8Yfl01
 s1/v1KfepNtbrKYpSrLuSHcNDW7z/PWjcLmz8JaGV2/zVkw6LPbqrvWvPUWmdiyG1vd33S1W
 Frh1cNJxceNAW0ZmtiKd0LNL7U9eubr1wYOWLW/9edU0dCcryW+b4fXb7cCjnat1KmVz5Kcs
 mRO7Viuy2F+kzkpgp9iPFLU1DjP6X55dtbD0rhiPu8OtxMrQXE+pRbz9Trt/pl/uWuzXvbss
 8cjpOt+ih8d1L/NN0FaeyDhhSdP6M2p//3iGf8m4GfW36bvW/QaLG8cu3Gua1Gl1+dmpU1ed
 /D3bHXdVSzJ8lhE5ZLhghtwZBccNyU2cuxgilFiKMxINtZiLihMBJeMK47sDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRmVeSWpSXmKPExsVy+t/xe7qvGWamG6y5ymbR2zSdyWLqwyds
 Fq+nfWCzmHj+J5vFla/v2SyaF69ns7i8aw6bxdwvU5kdODw2repk87hzbQ+bx7yTgR77565h
 97jffZzJ4/MmuQC2KD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSc
 zLLUIn27BL2MT3cesBY8kKv4uuI8YwPje4kuRk4OCQETifbTz9m6GLk4hASWMkpcuHGNESIh
 I3FyWgMrhC0s8edaF1TRe0aJ15962UESvAJ2Eq8mbGEDsVkEVCVOfd/KBhEXlDg58wkLiC0q
 IC9x/9YMsHphAW+JFa3zwRaICJhLrJu0CGwos8BqJokfvRvYITbcZJZ48OgeWAezgLjErSfz
 mUBsNgFDia63XWAbOAWMJJbueMMEUWMm0bW1ixHClpdo3jqbeQKj0Cwkh8xCMmoWkpZZSFoW
 MLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIzFbcd+bt7BOO/VR71DjEwcjIcYJTiYlUR4
 Y8/NSBfiTUmsrEotyo8vKs1JLT7EaAoMjYnMUqLJ+cBkkFcSb2hmYGpoYmZpYGppZqwkzut2
 +XyakEB6YklqdmpqQWoRTB8TB6dUA1N131Y9Oe80ORMh6/furEvWWit7710hN0vs+/NgpZ3M
 1ic33LSW8t81aat+3MGWc4aBZanGdkFVsmtYnDiVt1T3+L3labgfv9zI0lP4mPnsCzvdZbcE
 X5/0LM0jJ4WVr+GOhOb14PsOrbc2/V3U+C5/PuOCv/Wbvi7dozdzvvZR76mfkxbtbNy2bon/
 XbYHEX+mf4v/pvvhewWbvHHyjP8bla3Xa0ixKXSsMHNh/GxxmDVuUaz01dVKVscF0wPF9u03
 DbSIvs+TP2lenWLbraMlMydfE4lTNdm49ldA+8MJu19Mjco+vd7ggiP/Ly0lYZmTO08Zc0zM
 EL90+KeSPlty+8FHAX261v/K5UO+9SuxFGckGmoxFxUnAgBChiBmTgMAAA==
X-CMS-MailID: 20250128160811eucas1p26de774f66d397fa447cf181f86a7a464
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109
References: <20250116124303.3941583-1-andriy.shevchenko@linux.intel.com>
 <CGME20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109@eucas1p1.samsung.com>
 <a193bcb5-1b35-48ba-801b-925ab2f92d6f@samsung.com>
 <Z4pktkZ1ihfkZjHm@smile.fi.intel.com> <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
 <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
 <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
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

Hi Andy,

On 21.01.2025 14:29, Andy Shevchenko wrote:
> On Tue, Jan 21, 2025 at 08:33:09AM +0100, Marek Szyprowski wrote:
>> On 17.01.2025 18:28, Andy Shevchenko wrote:
>>> On Fri, Jan 17, 2025 at 05:05:42PM +0100, Marek Szyprowski wrote:
>>>
>>> Does it fail in the same way?
>> Yes, the hw revision is reported as zero in this case: LT9611 revision:
>> 0x00.00.00
> Hmm... This is very interesting! It means that the page selector is a bit
> magical there. Dmitry, can you chime in and perhaps shed some light on this?
>
>>>> Does it mean that there is really a bug in the driver?
>>> Without looking at the datasheet it's hard to say. At least what I found so far
>>> is one page of the I²C traffic dump on Windows as an example how to use their
>>> evaluation board and software, but it doesn't unveil the bigger picture. At
>>> least what I think is going on here is that the programming is not so easy as
>>> just paging. Something is more complicated there.
>>>
>>> But at least (and as Mark said) the most of the regmap based drivers got
>>> the ranges wrong (so, at least there is one bug in the driver).
>> I can do more experiments if this helps. Do you need a dump of all
>> regmap accesses or i2c traffic from this driver?
> It would be helpful! Traces from the failed and non-failed cases
> till the firmware revision and chip ID reading would be enough to
> start with.

I'm sorry for the delay, I was a bit busy with other stuff.

Here are logs (all values are in hex):

next-20250128 (probe broken):
root@target:~# dmesg | grep regmap
[   14.817604] regmap_write reg 80ee <- 1
[   14.823036] regmap_read reg 8100 -> 0
[   14.827631] regmap_read reg 8101 -> 0
[   14.832130] regmap_read reg 8102 -> 0
[   14.841477] regmap_write reg 80ee <- 0
[   14.901796] regmap_write reg 80ee <- 1
[   14.909895] regmap_read reg b021 -> 0
[   14.927409] regmap_write reg 80ee <- 0

next-20250128 + 1fd60ed1700c reverted (probe okay):
root@target:~# dmesg | grep regmap
[   13.565920] regmap_write reg 80ee <- 1
[   13.567509] regmap_read reg 8100 -> 17
[   13.568219] regmap_read reg 8101 -> 4
[   13.568909] regmap_read reg 8102 -> 93
[   13.568927] regmap_write reg 80ee <- 0
[   13.625844] regmap_write reg 80ee <- 1
[   13.630963] regmap_read reg b021 -> 40
[   13.645522] regmap_write reg 80ee <- 0
[   13.880192] regmap_write reg 80ee <- 1
[   13.884921] regmap_read reg b023 -> 0
[   13.892159] regmap_write reg 80ee <- 0
[   13.954508] regmap_write reg 80ee <- 1
[   13.959441] regmap_read reg b023 -> 0
[   13.963269] regmap_write reg 80ee <- 0
[   14.029818] regmap_write reg 80ee <- 1
[   14.034644] regmap_read reg b023 -> 0
[   14.038491] regmap_write reg 80ee <- 0
[   16.278387] regmap_write reg 80ee <- 1
[   16.283902] regmap_read reg b023 -> 0
[   16.287944] regmap_write reg 80ee <- 0
[   16.347570] regmap_write reg 80ee <- 1
[   16.355894] regmap_read reg b023 -> 0
[   16.359748] regmap_write reg 80ee <- 0
[   16.452472] regmap_write reg 80ee <- 1
[   16.454387] regmap_write reg d00d <- 4
[   16.456228] regmap_write reg d00e <- 65
[   16.462096] regmap_write reg d00f <- 4
[   16.462971] regmap_write reg d010 <- 38
[   16.463741] regmap_write reg d011 <- 8
[   16.464741] regmap_write reg d012 <- 98
[   16.465250] regmap_write reg d013 <- 7
[   16.465764] regmap_write reg d014 <- 80
[   16.466481] regmap_write reg d015 <- 5
[   16.467156] regmap_update_bits reg d016 <- 0/f
[   16.467817] regmap_write reg d017 <- 2c
[   16.468325] regmap_update_bits reg d018 <- 0/f
[   16.469101] regmap_write reg d019 <- 4
[   16.469749] regmap_update_bits reg d01a <- 0/f
[   16.470509] regmap_write reg d01b <- 58
[   16.471041] regmap_write reg 80ee <- 0


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

