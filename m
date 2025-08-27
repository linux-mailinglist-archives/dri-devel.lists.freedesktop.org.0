Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2ABB386C1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDF610E142;
	Wed, 27 Aug 2025 15:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="Me+8jIto";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazolkn19011026.outbound.protection.outlook.com [52.103.66.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C025910E142;
 Wed, 27 Aug 2025 15:36:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoSKthn86njEubhEzi7PHcyx+Uopr4kX3DJ1uPhDua1xIZhyqAknOuCkNorCkDEzXqRNYLB7kHngQJUOJf6NhQMchPRkt9Koz6q28y1cICzDhhHEiRkMSpP1oOaIDqw73J9fzPzR+xn+LeMDvwcbCkEoZJGU37b+pa6g1Ym3JVnR8Km5GSKZVs3Qupaz/mp0CpRMYq5zvoERLLsK5SYW+99l0g/jGxKt27iCKKRZ49mjwrdugJ0SgR0/Aq4Lwlf4G8NK/xst80adpt856fX7iz4N2AjPxyLGHwYU6KBu/NlcZYvIktNVvgYcjiHpiiBQ0hvx+rs3FTjl/wm7VoLieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3fsyEZKkLGfrVPnMaeQF0bJHqh6N9MzS2x2sTzEqVo=;
 b=nQpzHm78Ia4uHDPsAA7EjJqJKytoiTSUeztCLTth8FYXo4lVZiphhaux+kEz8yjjypzg6uv4LN0s3T9C4IWZvaZffXmC8ztI+ZMGreuZIRw4xK4/kwrIvMbr/O39vDrS7r8/o+oNExEu6nOpT9EVJ8ii1dIBQ7selVcvnX6AmhlPMqMKH4qGc1Pe0uS7Sy3PV0KbV0F0YMi3+ASgADN6nHpnQd8oAWLl0PwNfzXOksJSwODOUEW0AEJc/ObBNDKYhLK5BTbXnr2BBoChlG39hmIdkKoRCxJjWGwqWIoMVth4bqRfb2rdRWZpSXzaczIcEkZR/GWsI7lcrZDiet/7dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3fsyEZKkLGfrVPnMaeQF0bJHqh6N9MzS2x2sTzEqVo=;
 b=Me+8jItoL97Ix4D6EgljyDoQ3xXjzp59S5oJGVlvK/L/2O9o/IOQNtrAFQSiOS+v5VltWdLw6tluyxDbJcH088VFkRNjsBEVd+ftL0t8t/a4FMCBtly2PkdLezJHun3oJuVn1IcOXNZ12LGLQYRK+E5WH6UAa83StjC3QRGrGArbTkzlOCJ95QAo51rMc2JRTt+2hnUpEHPxHQiaITBBuAUM3YKMMc/hxOSiwOzM/5ijxLUYB1rL0AihQmNooR8VU/0zmXey7Vlgleiu6Cg6w8C4AEF0hqaPB90x0K83yOOgt2eZL0h6GhBjfRNt1Ogdq3ppusKYC2gKjnSolwbWGQ==
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10) by OSCPR01MB15399.jpnprd01.prod.outlook.com
 (2603:1096:604:3ad::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.23; Wed, 27 Aug
 2025 15:36:48 +0000
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f]) by TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f%7]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 15:36:48 +0000
Message-ID: <TY4PR01MB14432AF536089C12B8D201BBA9838A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Date: Wed, 27 Aug 2025 23:36:27 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, Marius Vlad <marius.vlad@collabora.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 contact@rafaelrc.com, lijo.lazar@amd.com, jesse.zhang@amd.com,
 tim.huang@amd.com, dark_sylinc@yahoo.com.ar, mario.limonciello@amd.com,
 alex.hung@amd.com, aurabindo.pillai@amd.com, sunil.khatri@amd.com,
 chiahsuan.chung@amd.com, mwen@igalia.com, Roman.Li@amd.com,
 Wayne.Lin@amd.com, dominik.kaszewski@amd.com, alvin.lee2@amd.com,
 Aric.Cyr@amd.com, Austin.Zheng@amd.com, Sung.Lee@amd.com,
 PeiChen.Huang@amd.com, dillon.varone@amd.com, Richard.Chiang@amd.com,
 ryanseto@amd.com, linux@treblig.org, haoping.liu@amd.com,
 Relja.Vojvodic@amd.com, Yihan.Zhu@amd.com, Samson.Tam@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] Add "pixel_encoding" to switch between RGB & YUV
 color modes
To: Daniel Stone <daniel@fooishbar.org>, Maxime Ripard <mripard@kernel.org>
References: <TY4PR01MB14432B688209B2AA416A95228983EA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <aK1hPoCmLziaPPOd@xpredator>
 <TY4PR01MB1443219A9870877AF120FE63B9839A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <20250827-imperial-mongrel-of-dignity-712fab@houat>
 <CAPj87rPhK+E2FP62fnNxFySDOkqqKxo_oa94i7DR3_6a1j1o1A@mail.gmail.com>
 <20250827-enchanted-merciful-badger-d51816@houat>
 <CAPj87rMDj-3ohEtXQYy25Rp0zNtZxQxS4Rmd-akgx9kkvB4Ysw@mail.gmail.com>
From: Shengyu Qu <wiagn233@outlook.com>
Content-Language: en-US
Autocrypt: addr=wiagn233@outlook.com; keydata=
 xsFNBGK0ObIBEADaNUAWkFrOUODvbPHJ1LsLhn/7yDzaCNWwniDqa4ip1dpBFFazLV3FGBjT
 +9pz25rHIFfsQcNOwJdJqREk9g4LgVfiy0H5hLMg9weF4EwtcbgHbv/q4Ww/W87mQ12nMCvY
 LKOVd/NsMQ3Z7QTO0mhG8VQ1Ntqn6jKQA4o9ERu3F+PFVDJx0HJ92zTBMzMtYsL7k+8ENOF3
 Iq1kmkRqf8FOvMObwwXLrEA/vsQ4bwojSKQIud6/SJv0w2YmqZDIAvDXxK2v22hzJqXaljmO
 BF5fz070O6eoTMhIAJy9ByBipiu3tWLXVtoj6QmFIoblnv0Ou6fJY2YN8Kr21vT1MXxdma1e
 l5WW/qxqrKCSrFzVdtAc7y6QtykC6MwC/P36O876vXfWUxrhHHRlnOxnuM6hz87g1kxu9qdr
 omSrsD0gEmGcUjV7xsNxut1iV+pZDIpveJdd5KJX5QMk3YzQ7ZTyiFD61byJcCZWtpN8pqwB
 +X85sxcr4V76EX85lmuQiwrIcwbvw5YRX1mRj3YZ4tVYCEaT5x+go6+06Zon3PoAjMfS1uo/
 2MxDuvVmdUkTzPvRWERKRATxay28efrE5uNQSaSNBfLKGvvPTlIoeYpRxLk7BN0xi/KZIRpS
 lIf0REc1eg+leq2Hxv7Xk/xGwSi5gGxLa6SzwXV8RRqKnw2u6QARAQABzSFTaGVuZ3l1IFF1
 IDx3aWFnbjIzM0BvdXRsb29rLmNvbT7CwY4EEwEKADgWIQSX5PUVXUNSaGVT2H/jUgzJGSnI
 5wUCYrQ5sgIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRDjUgzJGSnI57GwD/9O6kei
 9M3nbb1PsFlDE1J9H27mlnRWzVJ2S3yJ8G1oJo8NSaRO7vcTsYPBYpEL1poDQC5MEGh6FXSi
 OnyyHrg8StmGLksQE9awuTnlnQgvXDQMVtm87r1abBAavP5ru2R9x/Tk63+W/VT2hPekMfHa
 JwFi1KATSI1AhsF3CVoj0yDulz1u0uZlircKdbeEDj+raMO0LA12YxWaWtL/b9XaoAqV9vor
 aKhx+0DsZS5bWoUvs+715BArPBr4hPqKavsBwOWfzWDTKln2qv8d+glWkmk6dgvZFcV/9JEJ
 Q8B7rOUMX614dqgwi1t71TI0Fbaou3nhAnES1i1it/aomDUCLvRwjGU2oarmUISFgvZoGYdB
 9DfVfY3FWKtfDJ9KLUk9k3BFfBZgeAYoLnFZwa3rMyruCojAGTApZtaaLZH/jzQf7FpIGGhD
 YnvGKXS01nLCHuZSOEvURLnWdgYeOtwKW1IIcnWJtB12Ajz2yVu3w4tIchRT3wekMh2c3A3Z
 DeEjszezhFyXgoRpNYDBzNl6vbqhnopixq5Wh/yAj6Ey0YrIUbW9NOhIVCGkP4GyJg756SGz
 yPny0U4lA+EP7PS3O7tE0I3Q5qzDH1AEH2proNlsvjZeG4OZ9XWerI5EoIxrwZcOP9GgprB4
 TrXUR0ScTy1wTKV1Hn+w3VAv6QKtFM7BTQRitDmyARAA0QGaP4NYsHikM9yct02Z/LTMS23F
 j4LK2mKTBoEwtC2qH3HywXpZ8Ii2RG2tIApKrQFs8yGI4pKqXYq+bE1Kf1+U8IxnG8mqUgI8
 aiQQUKyZdG0wQqT1w14aawu7Wr4ZlLsudNRcMnUlmf0r5DucIvVi7z9sC2izaf/aLJrMotIp
 Hz9zu+UJa8Gi3FbFewnpfrnlqF9KRGoQjq6FKcryGb1DbbC6K8OJyMBNMyhFp6qM/pM4L0tP
 VCa2KnLQf5Q19eZ3JLMprIbqKLpkh2z0VhDU/jNheC5CbOQuOuwAlYwhagPSYDV3cVAa4Ltw
 1MkTxVtyyanAxi+za6yKSKTSGGzdCCxiPsvR9if8a7tKhVykk4q2DDi0dSC6luYDXD2+hIof
 YGk6jvTLqVDd6ioFGBE0CgrAZEoT0mK6JXF3lHjnzuyWyCfuu7fzg6oDTgx3jhMQJ2P45zwJ
 7WyIjw1vZ3JeAb+5+D+N+vPblNrF4zRQzRoxpXRdbGbzsBd5BDJ+wyUVG+K5JNJ34AZIfFoD
 IbtRm3xt2tFrl1TxsqkDbACEWeI9H36VhkI3Cm/hbfp2w2zMK3vQGrhNuHybIS/8tJzdP3Ci
 zcOmgc61pDi/B6O2IXpkQpgz+Cv/ZiecDm1terRLkAeX84u8VcI4wdCkN/Od8ZMJOZ2Ff+DB
 bUslCmkAEQEAAcLBdgQYAQoAIBYhBJfk9RVdQ1JoZVPYf+NSDMkZKcjnBQJitDmyAhsMAAoJ
 EONSDMkZKcjnnIcP/1Px3fsgNqOEwVNH7hm0S2+x/N/t3kz50zpKhczHZ8GWbN3PPt4wkQkd
 bF+c7V4uXToN4a17bxGdUnA9qljxt8l3aEqd4jBqLn2OJriu21FSnrZOpxb1EwWwvnVUwrLx
 CuV0CFQJdBlYp2ds64aV8PcBOhQ62y1OAvYpAX1cx5UMcHsNVeqrWU0mDAOgvqB86JFduq+G
 mvbJwmh3dA8GnI2xquWaHIdkk06T55xjfFdabwEyuRmtKtqxTP/u6BzowkV2A/GLxWf1inH5
 M81QgGRI2sao6To7sUt45FS+y2zhwh62excOcSxcYqKzs/OiYEJjWMv9vYRwaqJGEVhbfGFO
 jeBOYr+ZCCeARh+z4ilo1C2wupQT8VPsFiY9DRYgkAPKlbn9OqJvoD7VhvyelJagSNuRayrr
 mnEaZMsoRdS22fneCVWM0xlGSgPCVD0n9+6unTnVbmF/BZsEg5QufQKqlFSomu1i23lRDPK/
 1aPc2IoxcQPh2fomy8spA5ROzOjLpgqL8ksEtQ75cBoF1K5mcC2Xo1GyDmdQvbIZe+8qwvQ3
 z9EDivvFtEByuZEeC5ixn4n/c9UKwlk+lQeQeN+Bk7l8G9phd4dWxnmWXQ/ONR/aLzG+Fguu
 GNZCPpu5dVQH44AXoFjoi9YVscUnWnv8sErY943hM8MUsMQ5D0P2
In-Reply-To: <CAPj87rMDj-3ohEtXQYy25Rp0zNtZxQxS4Rmd-akgx9kkvB4Ysw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lvWSwpTTODAocCQSt9ZGgeKK"
X-ClientProxiedBy: SG2PR01CA0171.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::27) To TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10)
X-Microsoft-Original-Message-ID: <bfd71b60-0d35-4595-8afc-72e4825eaaf4@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB14432:EE_|OSCPR01MB15399:EE_
X-MS-Office365-Filtering-Correlation-Id: edc1c560-9eaa-4220-198f-08dde57f88c8
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799015|19110799012|41001999006|23021999003|15080799012|6092099016|461199028|5072599009|40105399003|440099028|3412199025|26104999006|26115399003|12091999003|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Umw2MWNPc2ZnMzlNUC83N3lyWWZjVmlVSURMd1plbjJrdGxtbDlyRzY0ZjFm?=
 =?utf-8?B?dGR3NDlTN0pDWDlyK1ZQWWRsaUxjRkEwUE1pT3I0K0JYU081dEwvVXNYY21i?=
 =?utf-8?B?b2ZMcTc2Y2h0REp2Y3Z5T3k0NjZmU2R2VkxqS0Zzdk9MVlJtMXE0RGRlcGJk?=
 =?utf-8?B?anZDZ3krVGVNZXV2UjhKdGh5S1U1QzY1NjZTYmRZYWk2cHdtb0cwdHl2VmZy?=
 =?utf-8?B?K3I0a1VCZlVvNHhDVHQrT29OcXErYzlLSm9HZDBOM2R5UFRBTjBJa1FDUklz?=
 =?utf-8?B?RlBHbVNlNXRqNEtybDVlUlphelY4dXEzWElINnQvYXhxU1hxZENMamVqR2Jq?=
 =?utf-8?B?bHp6UWJpOXhJSTZnblBJa01Sa2VkQnFDZGpsNWtNczdYcWtRL0Y2QWhLL0c0?=
 =?utf-8?B?cWd5d2JXaTVTQVMxaWVFeGx2OWxWOFBtODV4N0dUOVA2bUc0YzM3eGZKTFFK?=
 =?utf-8?B?OE8zRUIrTWRtVjNxb282QVZEcUxKc0s3VUVYZjJnbTN2YjY1Znc3TGIrTEJ6?=
 =?utf-8?B?UmtYRlFBSmZMU0sreUhlRnpiVnZ5VCtEQjZUNWpmcjdqYXdQQjkwUnIyVjQ1?=
 =?utf-8?B?UVYvUEdMS3lXUmI2QTVOTHBML0R4UW9aOUlwTkVMWG5CTzZSbkdyY3c0dXZI?=
 =?utf-8?B?cGJqdG5yM0pJek5LaXh2RkN0eC80dWJQU1hCVFk5RDVGdW5SUFRlRE9oZFZQ?=
 =?utf-8?B?VG9NUHNPcFBFN2RLQ1hPb1ZmS1ZoMVdCZ2hLS3JLd0R3MXlIQ09NcXFEUExk?=
 =?utf-8?B?QW9DWWhGT2xWU05HRXdlMFlmQ2ZFU2JJbk1vYWVPSDR6OWhaNzZFSUg3blhW?=
 =?utf-8?B?MENvcHhVQW5DQWt2anRnZXNTS0xpUllRTGkvdXFJUlozTWdNM0d1cVhHTUhW?=
 =?utf-8?B?OWMxbVRkTGRqZU5lYVNCRVVtZUdreUlLeFJsRmZITzlIY1ZZZ25YQjZ1NEY3?=
 =?utf-8?B?L2NuUVVoTitibktUSW1tZFFxUnZmUnRlRlpEQ3ZldlVWbzVBV3lmT0hHU3NB?=
 =?utf-8?B?SmFLVVdNNW90bE1xZ1RQSER2QVROa1VsbWJRZjgxRUFZTFJjV2dJZTJjZVdC?=
 =?utf-8?B?YnhXZFY4cFp6R1J3bjBKaVBleVF2YjV5Tkx6RXFlOXBINzlDRjNOaUtKQ2lt?=
 =?utf-8?B?RU1HbVBTUHJnRU9Qd0VDb1RMamlMRmROR1pLc2FjbzNDOGg0ZmgzOUNMWlpJ?=
 =?utf-8?B?WmNId0oyU1ZxZ1JOTjAzeVd3dTBiZHJlV3MzRUNhTzRrTHRQZ3VkUDVDbElm?=
 =?utf-8?B?UFREWFM0T2t0MWNxalJjYjVieXBJWXFSVnlxa3V6WS9TTDFhTkZlOWZzcXJP?=
 =?utf-8?B?SnZkc2szdGNUVEJkTG82TE50cUxOUys3S0MvMzU5RGtqMXZFZWlMOVh1NTRY?=
 =?utf-8?B?UFhqRjVLREQreFJydS95SCtER1VTVWZLTnRzc2NqdjBGRnJOdzA0RVBzNGtm?=
 =?utf-8?B?YkQxSWt6TFRXWlRiRlZPY3hqVzNROHpEcVF6RnRpbHBuckd4OER5QlU1eS9B?=
 =?utf-8?B?THRwVXgrdlVwMHp5ZWJDRWhVTjVDay9GaVNHc2FjV0gyV2g2SFh6QzJRUHRm?=
 =?utf-8?B?Q1lWdGFDbmcxSGNVNnE2bHlwT3pPM1hOaXdZSzdpSEpMZ01RNzg4Zkhoanla?=
 =?utf-8?B?aUVQWVNjaEVGeS9JVTFtWTZ1aHM1N1BKcVdqcFZHYUtvdEpCZlVMNkQ4WlM5?=
 =?utf-8?B?MU5DYVYwZUVCb0tZLzBKWk9IZjdMeEdwOERlelUwby9MajBvWFNpVDJ6ZW5X?=
 =?utf-8?B?aUxtd0VJL00rd0JHMnRMcW5IOSs2cTA2YWNmNWZ6TU5JendKOFFMa3NJVG1w?=
 =?utf-8?B?T21JYTg0bjlBWUEzRUgwUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0EvRWFJTDBsZ09aOFFTeHVXRk4rV2FDa0lmUm9GZGRSdVN3LzBqVk9VWjFk?=
 =?utf-8?B?Z2F5Y0tlK3VaeXJtRzdEUnVDS2lhZUs4dlZNNFI3dUxnSG5SdXlyS2FEMUE1?=
 =?utf-8?B?K0xlN1FFeE1tSklMaGcxQVg0MXlPWlBINVhhMlFWc0Q4M3IvRnFESlIzNE9Z?=
 =?utf-8?B?TldzeFk0U3NTd1U5OFg4czVvSDlFU1pNUm8xRlJvNndjeWtuRlRsbnBlcExy?=
 =?utf-8?B?aThjdXlsc3hjZmJIOXlvdGZJRERqdGNIejZwbTcyRnhRVUVtUzdYM1VzVEE3?=
 =?utf-8?B?QnVpRGdZZWhFZmtVcHlKSVBmZ0k3WjAvTVdSRVhyYjUxWnJhL0NBWkRsUFdN?=
 =?utf-8?B?K3dkUEFjcmxqdFN5RFNlcklNOEVtQ0wxeGs2OFVaZjdXUGlqUmlTeG5aSWFr?=
 =?utf-8?B?eGxrSXlJTG9qemVQcEF1ZCsva0h6Z0hZMnFBUUJjSzlkY1puZmpJR0IwSWJw?=
 =?utf-8?B?c3Ryanl6Qk45dVVCTnFWWDZCZXR1K0FsLzZqOUpqb2tDd1lDSHJMQTZBajFJ?=
 =?utf-8?B?NEhGSUhuUFE4NXJFWDkvRzlpTTgyMjdYSGhVSGpONkdDaVBlRzNlVXRWQXlm?=
 =?utf-8?B?a0hnS3UydWc3Ymg4VXlSOVNoamFSUzdkQThuc0Z5L0NSR21zL1oyTHZSWGtO?=
 =?utf-8?B?Z0N3Qm1WREdxcHE5VE9LcE51QlVpcmVlS1ZtUndpSnFONWJ4UXI5Z1hvTlNz?=
 =?utf-8?B?bXBFR0xvaXh5NklscktEZU5JRnArVE1QMVFhUkRqWWNMUHRnQjVDVytrb1BV?=
 =?utf-8?B?S0NiRFlYTU93dFNoUFJ4aklSTzhtdTJtY21PaGFLUkYvVk9lSU9NMmhmbzRr?=
 =?utf-8?B?U3poSEdmUlJ5RENZV3VDZThWOWt2ZVpmbm1xUUc5MXkwcGpGYVRxVStMQUxG?=
 =?utf-8?B?K1p6VWhmMTN1eERwWmIzNmVQM3Yya2hwaGk4dlRYWGN2SVpOK0w2dVR3Wkow?=
 =?utf-8?B?M2dIZ3VrZEtua1hkZmdLN05JQ1dLNEV0MExZVUhiaXI3eEVnMkZkWElzRGts?=
 =?utf-8?B?MW5LZzU1NGlxRlNMNXV1MXVBK3ozUlJmSnVOOEh0Nzgwc0xLQXoxTXp5RHRD?=
 =?utf-8?B?c0FBTnFWL1JObTRpODJxN3N4bzc5ekZUMVN2SnVMNkxVdzJ5WXFQUFdQbmdK?=
 =?utf-8?B?ckx0RDlQVWljN1JaS3YrdUFQM05qcU00NFRTdVJaOW8wdm9WSVc4aGIrL3ZQ?=
 =?utf-8?B?MjJGYUtKaWNZeVVtbm1vVU1GMjN0UktUVXRWS3FxRVYveXJ1ZGhGTkYxNUN5?=
 =?utf-8?B?amxzQ1lsVW9MWW9FcGFNR2xpcmhETm5wUWcrbXFzYlhvaEQrZzA0T1ovcEJh?=
 =?utf-8?B?MlFaZkN6V0RHS1dIcmc1VStvKzdWT240cWlqZzlVTUdVSXMzMFZ0bitNbkJI?=
 =?utf-8?B?OGs4MHQyUkltWTFGc3B4ZHV5aEJEaFc5UlIvM0VVcFNocnY4ZU1MRjFUaXE4?=
 =?utf-8?B?WVB6VnpwMFN3ZmNxVDk0bTZYaWRzcjBHbE9xQzA2TDdhOWZjWXhQMUVnV2xy?=
 =?utf-8?B?eDBLWnZ3WFNMYlhqT2pBSFFrK1pzSzJESFJCUmM3WlVMaDZUcHNkVElDYzM4?=
 =?utf-8?B?eVJVWnBleERTUEpmczc2MWJTVk5KSVJNK1F1OTdYQ1owaXhUVTk0UFFSL0h2?=
 =?utf-8?Q?v3JKApLvSqXlvbg0+oP7DSpinMNSP+rrJk2lVWfekOaw=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc1c560-9eaa-4220-198f-08dde57f88c8
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14432.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 15:36:48.4923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15399
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

--------------lvWSwpTTODAocCQSt9ZGgeKK
Content-Type: multipart/mixed; boundary="------------9zz056fjRbGLfwLbtHriDhXR";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: Daniel Stone <daniel@fooishbar.org>, Maxime Ripard <mripard@kernel.org>
Cc: wiagn233@outlook.com, Marius Vlad <marius.vlad@collabora.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 contact@rafaelrc.com, lijo.lazar@amd.com, jesse.zhang@amd.com,
 tim.huang@amd.com, dark_sylinc@yahoo.com.ar, mario.limonciello@amd.com,
 alex.hung@amd.com, aurabindo.pillai@amd.com, sunil.khatri@amd.com,
 chiahsuan.chung@amd.com, mwen@igalia.com, Roman.Li@amd.com,
 Wayne.Lin@amd.com, dominik.kaszewski@amd.com, alvin.lee2@amd.com,
 Aric.Cyr@amd.com, Austin.Zheng@amd.com, Sung.Lee@amd.com,
 PeiChen.Huang@amd.com, dillon.varone@amd.com, Richard.Chiang@amd.com,
 ryanseto@amd.com, linux@treblig.org, haoping.liu@amd.com,
 Relja.Vojvodic@amd.com, Yihan.Zhu@amd.com, Samson.Tam@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org
Message-ID: <bfd71b60-0d35-4595-8afc-72e4825eaaf4@outlook.com>
Subject: Re: [PATCH v2 0/2] Add "pixel_encoding" to switch between RGB & YUV
 color modes
References: <TY4PR01MB14432B688209B2AA416A95228983EA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <aK1hPoCmLziaPPOd@xpredator>
 <TY4PR01MB1443219A9870877AF120FE63B9839A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <20250827-imperial-mongrel-of-dignity-712fab@houat>
 <CAPj87rPhK+E2FP62fnNxFySDOkqqKxo_oa94i7DR3_6a1j1o1A@mail.gmail.com>
 <20250827-enchanted-merciful-badger-d51816@houat>
 <CAPj87rMDj-3ohEtXQYy25Rp0zNtZxQxS4Rmd-akgx9kkvB4Ysw@mail.gmail.com>
In-Reply-To: <CAPj87rMDj-3ohEtXQYy25Rp0zNtZxQxS4Rmd-akgx9kkvB4Ysw@mail.gmail.com>
Autocrypt-Gossip: addr=marius.vlad@collabora.com; keydata=
 xsFNBFvpOusBEADgqsJk9DRskC/t+kJDJ9OGiU6y1oEXQHVlkkE7DIPPall0BPOOXgHkBkvE
 /GtOYy9CdXDqWUXZ0NTFPKJUCVQGWS0TD9st7lpF8MQBuvfVfkW18jKiOo5zdmmwdBb3XA1l
 P2rYSlPTm3wiyhmxLZMhgzNFvRYLp++4xStfpN8RpKlnnAa1xJJH76YS45MZog40XfZ60SVr
 uN/EHn9xKf99dZQephxN7W4eq4azpoG0vefcqiZZguvjk8T0AzTbVXFyA0kqNMjunMNF59UY
 gS4RXMt9473G4MM8b5QG9OHfDpTesVYmBDHpBrZRsxEtfRjex6z45+vFp9awRulZshtTx2M4
 Noy8uEm6AkVUUvRSL8Jf3NU+HTbR6pYP0hKIon2bo1ekW7/ooUtuuTf3ffii8zyocwFrL5MH
 CJGp9HLGWIozU/nh37VErE+fBZ68O35Yh33IhEey9lTOPVrb2jZVZmOgzxnSl1XCim3bZQfh
 pwBu+GQiVT8HEabE54JklIfLxyGyK6CPP9tWb2SX6s6WkiRwa1tQMYMJfXz0mJh1B3IzsAqA
 YPo3UnKpNsUJ05DWNc3UAESymflH0+3xlpboZPvvHCghJIeeQSOyOzSoiBBLwKCIXMjxXpCV
 Hl4fz4R2F0rn5QN/7aZ0ptziNcFCJseVQ3GElYOLyPEDu7coiQARAQABzSdNYXJpdXMgVmxh
 ZCA8bWFyaXVzLnZsYWRAY29sbGFib3JhLmNvbT7CwY4EEwEKADgWIQRwMod6PrHq4+Tcnfv2
 NBLmCUfW7wUCW+k66wIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD2NBLmCUfW77Th
 D/9rRDFptzb4Age6Y0AiEhd7A+Ksfxs49sMVP69KOHTh+4hhU7xfMi3BXhHL81ylCD1lVlZo
 jbaoJEsdO8NBJ0s7pfFXbW01dQAlulRuqDXS4A9gXlIq2XO0ZbfiOD1wVQy99qDWrWeGAfse
 eBGfzsXMq3R2NvQzEPeTZk3DVHhsZXVcOV9SLZkprqduXGkd6JMD5pANUi0R5FSmZ1O434qh
 NMErMZ97RjibGTx7rtyuHGAoYZmrUp7e0nU1hEJBMX47NMWPuXCQBRH+Fg3LyhiSbB6l6QO5
 D6dcdYP0ytQekfNPW5lUl383dlAx3OJB5puFGFX9tYpulQ3neFxdurnt1NsZ+Er1SZgQwrs8
 i4EJ73OoXT4zLBq3aPtrYMI7UnQBUnnwenDY7mNxzhn0UexO/MuE33+rrJ9GpKWfeW3AHT24
 /BhduOUVsTuFUx1fAMhrEpnzHcPGY074fXOdkvMYXUeeADGXSHjhLavm5pwpfHRuO60oSkY+
 XATeNAW7bp1+2s4zXltpOUqYzGAosgpoYl1zQb73LQWUh7RIfgzogVza6XHjlN3Uz5pw9wbP
 Vl462Lr2yL2xGWBy7/y0Qdj7S04lIz09I6WY1qpC+Z5/1Ok8xRe1XW0IIu19An1LqjOAp8Mt
 qAvyzkKJQZh/CWoCjgmEW22GKTihri23T16tuM7BTQRb6TrrARAA3QHpiTkZ10WBg5V0W87u
 i+nGXIVyZ5zVBPl8a7Ao/JrlnLOIQtntIoQja4TIeisoBORa7phRoJH7t/n9UiO7P25rSzlN
 49BfSo4wMxjUthf/3aWrxt3QLWLz8s3YkF21IStK8qGi0HTVTRcSLHyDaFj1E+ri853A4DHO
 nvkmAyCK+HebXV/2WD0FVp+VJqPvR6o/2cgxxbUByR9qLHPTSsOV8pS6LirUmXxIrcW/RB2E
 O4/6ryqnTVb+sbXnalMGPVYBNHebmYG5/+uXj0eSSRy8XRWaC6k56Uger5gMsEQuy0M9xEWz
 1sQXZBKVi7CBgaVUNFcrT+ol53DldE7WnSO38Lk9ZIxEf9X5sPHfk9d8WhvGP09VHsGTA8OI
 SmGEvOj1mKNcpX9ZfJYsnJna3/09x1ymQPdPfCwmQGUqnBJjYZgO/PbQIdUTrYL8RFvJYB4t
 dn3MmolPBzNHQamxWQg7fdLgYs1McZVrGRfvApd2tLZsBFnnLAjrE0HnXQMC7gfl40oQqEU/
 iHAqeZ51rNJcBTtzk3VoTD1fVjzc094pm2pnWVRUg7kS1JkYfwUOC/4+e+CwgNH5uj9v0eA2
 tDQWg2Y6bXy4xwEx5L3fkzDFmdvS0tekraKSvnD2tWQmOziPswIx/OzKFT/dcheIn14ZPQFW
 v3bMxZtrgGMKGU0AEQEAAcLBdgQYAQoAIBYhBHAyh3o+serj5Nyd+/Y0EuYJR9bvBQJb6Trr
 AhsMAAoJEPY0EuYJR9bvlhkP/RXeBQ6RATDTZkD4SLZfxa9ivPIf9LrTH6+kuVjLEsZ9wlj3
 8TGx/T5BuqShUGD0sQ2+5idjsjkxgHl7GoffRN20kR1o97FEnVOKZUKrC7FxRZ/YbQHnF3c0
 OgZmiQe86m6BDnZEPpXpgM5lxEgXqkBWtKSyO+ZhKkLAqnqJdAvcOlnbVORXg+5eTSGCDQTv
 rIWHHah73ja7EmOQac87WrrXntyeY8g55/mz4S2rnppoVva1oQPkXuSTCM0Bt5OBTWDLqeeA
 c9yn4M50rGeNYUvp35yG1RkTLLn0SPkJrL63yRdPsCqB8nwlH1uXqqoW2Kx9mpRotFgxbShK
 CIaFsDly4h+pCV6SIC5wyM7nDW2IAkAO7+1/m1wFSXlXuC0UjvLS+nfAi0PCeeyWEbGscM0a
 5ROOttQ6wfy4cBRdTbtqmQLTkwqF+DRuqa4Iw+li9qbJlXXAR9jwTQqN8VxOUxJ1BrkRwt1S
 vfG7hSVU46q0jt/yY7/ickICSC3QbPWR93R0TDoMPEEnf3hfI3eAms3wxBolmNKJTvR6qKCX
 W95yf3zX1wygBCkoNU8HbjXc4JcjMD2UA3t44qjKEv4x9TwkjMTO87VvHNMNoskdMX8XxAVf
 hcT/yV4ozdrbJ20LUAuYYPFkhrHHUVuAEbV4d5qucW34g8M+LgCsSscq48t6

--------------9zz056fjRbGLfwLbtHriDhXR
Content-Type: multipart/mixed; boundary="------------azzicC1UrL21VqwRSKXbcl3k"

--------------azzicC1UrL21VqwRSKXbcl3k
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNClNvdW5kcyBPSyB0byBtZSB0b28uDQoNCkNoZWVycywNClNoZW5neXUNCg0K5Zyo
IDIwMjUvOC8yNyAxOTozNiwgRGFuaWVsIFN0b25lIOWGmemBkzoNCj4gSGV5LA0KPiANCj4g
T24gV2VkLCAyNyBBdWcgMjAyNSBhdCAxMjoyMSwgTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBr
ZXJuZWwub3JnPiB3cm90ZToNCj4+IE9uIFdlZCwgQXVnIDI3LCAyMDI1IGF0IDExOjM5OjI1
QU0gKzAxMDAsIERhbmllbCBTdG9uZSB3cm90ZToNCj4+PiBUaGVyZSBhcmUgb3RoZXIgcmVh
c29ucyB0byBoYXZlIHVBUEkgdGhvdWdoIC4uLg0KPj4+DQo+Pj4gT25lIGlzIGJlY2F1c2Ug
eW91IHJlYWxseSBjYXJlIGFib3V0IHRoZSBjb2xvdXIgcHJvcGVydGllcywgYW5kIHlvdSdk
DQo+Pj4gcmF0aGVyIGhhdmUgYmV0dGVyIGZpZGVsaXR5IHRoYW4gYW55dGhpbmcgZWxzZSwg
ZXZlbiBpZiBpdCBtZWFucyBzb21lDQo+Pj4gbW9kZXMgYXJlIHVudXNhYmxlLg0KPj4+DQo+
Pj4gQW5vdGhlciBpcyBmb3Igc2l0dWF0aW9ucyB3aGljaCBzdGF0aWMgcXVpcmtzIGNhbid0
IGhhbmRsZS4gSWYgeW91DQo+Pj4gd2FudCB0byBrZWVwIGhlYWRyb29tIG9uIHRoZSBsaW5r
IChlaXRoZXIgdG8gZnJlZSB1cCBiYW5kd2lkdGggZm9yDQo+Pj4gb3RoZXIgdXNlcyksIG9y
IHlvdSBhY2NpZGVudGFsbHkgYm91Z2h0IGEgc3VwZXItbG9uZyBjYWJsZSBzbyBoYXZlIGEN
Cj4+PiBmbGFreSBsaW5rLCB5b3UgbWlnaHQgd2VsbCB3YW50IHRvIGZvcmNlIGl0IHRvIHVz
ZSBsb3dlciBmaWRlbGl0eSBzbw0KPj4+IHlvdSBjYW4gbmVnb3RpYXRlIGEgbG93ZXIgbGlu
ayByYXRlLg0KPj4+DQo+Pj4gSSdtIGFsbCBmb3IganVzdCBkdHJ0IGF1dG9tYXRpY2FsbHks
IGJ1dCB0aGVyZSBhcmUgZGVmaW5pdGVseSByZWFzb25zDQo+Pj4gdG8gZXhwb3NlIGl0IHRv
IHVzZXJzcGFjZSByZWdhcmRsZXNzLg0KPj4NCj4+IE9oLCB5ZWFoLCBkZWZpbml0ZWx5Lg0K
Pj4NCj4+IEJ1dCBicmluZ2luZyB0aGUgYmlnIGd1bnMgYW5kIHRoZSByZXF1aXJlbWVudHMg
d2UgaGF2ZSBmb3IgdGhvc2UgdG8NCj4+IGFkZHJlc3MgdGhlIHBvaW50IGluaXRpYWxseSBk
aXNjdXNzZWQgYnkgdGhlIGdpdGxhYiBpc3N1ZXMgc2VlbXMgbGlrZQ0KPj4gYml0aW5nIG9m
ZiBtb3JlIHRoYW4gdGhleSBjYW4gY2hldy4NCj4+DQo+PiBFdmVuIG1vcmUgc28gc2luY2Ug
d2hhdGV2ZXIgdWFwaSB3ZSBjb21lIHVwIHdpdGggd291bGQgc3RpbGwgZGVwZW5kIG9uDQo+
PiB0aGUgRURJRHMsIGFuZCB0aGV5IHdvdWxkIHN0aWxsIGJlIGJyb2tlbiBmb3IgdGhlc2Ug
bW9uaXRvcnMuDQo+IA0KPiBTb3VuZHMgbGlrZSB3ZSdyZSBhZ3JlZWluZyB3aXRoIGVhY2gg
b3RoZXIgdGhlbi4NCj4gDQo+IFNoZW5neXUncyAnSSB3YW50IHRoZXNlIGJyb2tlbiBwYW5l
bHMgdG8gd29yaycgdXNlY2FzZSBpcyBwcm9iYWJseQ0KPiBiZXN0IHNlcnZlZCB3aXRoIGFu
IEVESUQgcXVpcmssIHllYWguDQo+IA0KPiBUaGUgcmVhc29uIE1hcml1cyBpcyB3b3JraW5n
IG9uIGl0IGlzIHRoZSByZWFzb25zIEkgc2FpZCBhYm92ZSB0aG91Z2gNCj4gLSBzb21lIGZv
ciB1c2VzIHdoZXJlIHdlJ2QgcmF0aGVyIGNsZWFybHkgZmFpbCBvdXQgYW5kIHB1c2ggYW4g
ZXJyb3INCj4gdG8gdXNlcnNwYWNlIHRoYW4gY29udGludWUgd2l0aCB2aXN1YWxseS1kZWdy
YWRlZCBvdXRwdXQsIGFuZCBzb21lIGZvcg0KPiB1c2VzIHdoZXJlIHBlb3BsZSBoYXZlIGJv
dWdodCBhIHRvby1sb25nIGNhYmxlIChvciBib3VnaHQgYSB0b28tc2hvcnQNCj4gb25lIHdo
aWNoIGlzIG5vdyBhdCB0ZW5zaW9uIHRocm91Z2ggYSAxODDCsCBiZW5kKSBzbyB3ZSB3YW50
IHRvIGZvcmNlDQo+IHRoZSBsb3dlc3QgbGluayByYXRlIHBvc3NpYmxlLCB3aXRob3V0IGRy
b3BwaW5nIHRvIGEgcmlkaWN1bG91c2x5IGxvdw0KPiByZXNvbHV0aW9uLg0KPiANCj4gU28g
SSBkb24ndCB0aGluayB0aGVzZSBhcmUgaW4gdGVuc2lvbiwgYW5kIE1hcml1cyBzaG91bGQg
cHJvY2VlZCB3aXRoDQo+IGhpcyB3b3JrIChjb21wbGV0ZSB3aXRoIHRoZSBwcm9wZXIgdXNl
cnNwYWNlIHRvIGJhY2sgaXQgdXApLCBhbmQNCj4gU2hlbmd5dSBzaG91bGQgcHJvY2VlZCB3
aXRoIG5ldyBpbi1rZXJuZWwgcXVpcmtzLCB3aGljaCB3aWxsIGJlDQo+IGVmZmVjdGl2ZSB3
aGVuIHRoZSBwcm9wZXJ0aWVzIGFyZSBzZXQgdG8gYXV0bywgYnV0IGhhcmQgb3ZlcnJpZGRl
biBieQ0KPiB1c2Vyc3BhY2UgaWYgaXQgZGVjaWRlcyBvdGhlcndpc2UuDQo+IA0KPiBIb3cg
ZG9lcyB0aGF0IHNvdW5kPw0KPiANCj4gQ2hlZXJzLA0KPiBEYW5pZWwNCg0K
--------------azzicC1UrL21VqwRSKXbcl3k
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------azzicC1UrL21VqwRSKXbcl3k--

--------------9zz056fjRbGLfwLbtHriDhXR--

--------------lvWSwpTTODAocCQSt9ZGgeKK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmivJfwFAwAAAAAACgkQX75KBAfJsRmD
5RAArBKk2lft4PfLYhC84ts5xnJqFNRFGvcO9ULYtpI5qfaGCTEGP4/cYzWu/F34EvYMy/k4VxyZ
XUuc+UmEqEQO2KvqNFZRXa3be8RbMUKT8sjS4QmHgEVGLOjapvg3k3jos16MNPB1j+e08Z59PB8X
cuMJigEdTSRB9vGp4DC1W48AVoaFz5KIW5ZxEZlHyjGa1vDZaMibKdpw0slzDHIws2lNhbSAUSjN
FDKazALeBnxj84qnyoB6XGq4CnzmpZSb/dSnB93ttQr/ScrkfM9p0YGtqr6gufTJBuwaeEMpx1t5
2T+JkTfixhD4sEdgRlwDy++KkwfVfwa4ejG432FzFreFKdxnoYqGdYE0vir3I4MYeEIHgeD75HwB
EYJPjt9Gu7cdbst7/VY0K6JeVeauvJErdXbZO3HKOGFRFFZopxHdUYc6JVGrNebI8218y0OFP3Tp
cfUlkM78HAtGywCaupkHLxgE9l9xQuXkKUCBylv8sw3RrhUAx2z/688yOyXGePBB3PdirJl12kBd
4+Bmpl+SuQZXv9CqylUeOkAHmtUpMDJW4SIxa45+Ppr/pxZW2DPpMlzjqVR3nUK/QKqKWnff13f9
jnfIfJpb7FGrRjWXZnrTAXMn6Nc5NBjYb9gQC0n2aOYP4Ywyrqns7vrk7/MWeSAq71qJx3YZMyp3
t5M=
=AG6z
-----END PGP SIGNATURE-----

--------------lvWSwpTTODAocCQSt9ZGgeKK--
