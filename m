Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395FEA76AEF
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 17:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7168E10E41E;
	Mon, 31 Mar 2025 15:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="B56+vkyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazolkn19011039.outbound.protection.outlook.com [52.103.66.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE91E10E435;
 Mon, 31 Mar 2025 15:43:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEdQ16SgJMgDjFUwKWz6CzDKJLDVOuO1Ma/svwlk9ptkHNH2rsBImwhiGotwHuF/ZTMRvdksCo/2IzRP7d3Pl36kpRGmDRP/wSoKJY/LL4r+twpx/OdgFwPdMTojkdhe2MBQJNzVTaqliYk1HwtsF35myWQfh/EkTfjgz1jG4Dlt4sqkjScL9luQZtTZK16djM//12k2IoNMJ2W2qPG9RPLKWsHgs6xlYEt3a7QDhaU+aSmgrRQ+vVAJM5r23rSC2jhVUmHBumycPIULbtEEVy+bXWpm1FAtHGuKW2LhXUGXsMf+be73aU1iyq0/HjHIXiFXPDQDg2USjwCqKP/I6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h189e1Whx9RGVumTvbehG3BxxbQyEr2TiP7ESN31VAY=;
 b=Yym0I3u1es5fkhDHKt4YL8AGuz61TxU+ONbFrrk49wCse/85pZJGk1gzLeHAYxaT9ea6Kk96EJF7yrmNMRIM+Qah9R8WtH2mluNiPnx+FqIAnU1dagEqkgqhgk9KJbA/d9G5JpWz52TUGJiCdR7Fr1ZAbG12qGYmW/4BPbh/qg1ysr+hwCm9mhskC4E31BXXQZl3fRj8XJwAFpins+WV8EWZJo/y7QX2g3OE/lLgAxsg4wh39a9As5uDvixRmmTkKisu9q/wqAH9UKiN3To4Zg6WBzuBPqUhjxMnqal/tZ4FEE4twlkmkBzMGmFIvdMy6OjX3bA6qQUysIy/k0+2jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h189e1Whx9RGVumTvbehG3BxxbQyEr2TiP7ESN31VAY=;
 b=B56+vkyU4UErV5/00nRbs+Ap6kWIoK+kXXlHjptLQIpnELXE70PcaLiqGa5zHCvkJ4Ik+SrEDNOAZiew7uxjRFcZpYDfqQaL7Na/gSrxoFaFLVsA9o7gv12OWo+rJ1AZRoAjP5E2mTiEf2xr/Z9SG7PiwUTjCKn1ZJzK9rO/N6eNj7zzOFdKzuGBdyVakz/keAQQSj1iDja9OBl3wvCyEze6FOxwJEUHyOEevAMjEs4p+0LZxoFWjVynLAT3vd9Z0ecVci0M2nakL+sJGzRa4r+J09o1ZBS9xQj0EXBfMwFaGscwSf5XruMPijYpuEwpgdY5EWlMhZRtNjK8ZXtfuQ==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by TY1PR01MB10626.jpnprd01.prod.outlook.com (2603:1096:400:325::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Mon, 31 Mar
 2025 15:43:26 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%3]) with mapi id 15.20.8583.028; Mon, 31 Mar 2025
 15:43:26 +0000
Message-ID: <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Date: Mon, 31 Mar 2025 23:43:18 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
From: Shengyu Qu <wiagn233@outlook.com>
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
In-Reply-To: <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6E6OeLExvSEkt10vLDnE7twL"
X-ClientProxiedBy: TYCP286CA0016.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::6) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID: <222b8143-2bb6-4d5b-8454-12f0da0305ab@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|TY1PR01MB10626:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d84628d-bd2e-4134-e1cd-08dd706ac6aa
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799006|15080799006|6092099012|7092599003|12121999004|461199028|5072599009|19110799003|20055399003|3412199025|440099028|41001999003|26115399003|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXZBMEZseXRMQTQxaUR0cHg3OEZWWWF3bUxUM0VSRkgrVVhQdXAyQThHdTBT?=
 =?utf-8?B?d0NWZ3YrbkhheGMwZlY0YnNjbWFxRVFiRVVUOHVXTFFpanB0eUQvMHRGTWJF?=
 =?utf-8?B?aDNGL1RmOUhKeU9KYzFoeGppa3FYeWpKeEJpWlFrUjFQZEFYWklCZHNHd0Fz?=
 =?utf-8?B?cU1EbXlxQmQxN1lrdXcyUGw3aklmajBIbUlXZFpZUWpvTGZURUt2UnRueHlT?=
 =?utf-8?B?OGhkVDBRUm9aNUM5Z2NEcEIvUE1CQURGR081K09XNmRZSXlsMTNDZmt4WUdr?=
 =?utf-8?B?QysxR0o1M1NTa3BvTGsvd2diMU54Wm9RUm9SSzBZS2x6OTRPdmZZWk5kSXJk?=
 =?utf-8?B?NHJTS1draDFjeXhkdXFiU0trcWYwOHp2TTE4VUsrQ3Q5c0VBUlo3Zm45OVZ6?=
 =?utf-8?B?YzdmL3ZINEFNL2YxOGw4am5US1FBRW9Ec0Z0SmJSTW05b3VJSFQ3TGJMdjJJ?=
 =?utf-8?B?S0dDeG9qZG85eVVQVkJKQTBQSkFOL01nbzNHNFZpNGxUWCtlQUFPQmFxTkVR?=
 =?utf-8?B?T3FXMExFZEN0ZmhBNmFuT0Nzcnpwa21qK0hpdytrd2VFaCtTdktHU0NrVEZi?=
 =?utf-8?B?NlBWZjZQY0hZc3ZISGlKUnNuc2lOdFRjUFRtVFVrN3MrQlgzUko2cXBXYXhS?=
 =?utf-8?B?eWVNcmZLVXNVc0JvbGZWODFFSktqbTM1NE5FYXlvQ0llRmM5NWVVY01HckIr?=
 =?utf-8?B?eU1GOENkME9ETnRFRFJvMThTaGdib0tPQnFBM1hyOHZ5TW5Teldhc2Ric0xX?=
 =?utf-8?B?eFRwRWRKdGUyMDVOR0YxbXVHSVVhRlkwNmNzT1FIZmR3bVMvbjdEQkd1Nmxz?=
 =?utf-8?B?VXA4QUtCYjZvZG5WRmhVN1dyVTdhekZRdWtSVWhNVVZYbytvRUZhaC9vcHZB?=
 =?utf-8?B?L29MZm9GVFh1TGlnWnR3UU9uNjgvTFovUEFUWFZyYWtRVDZldUpHSm1IYlBh?=
 =?utf-8?B?dDlLamtVRjgvaUVsNWRaVjNNRWJWbGVBd3F4cElHN2xiMytHeTgxYTQ0WFRV?=
 =?utf-8?B?MU9TODIzaS80QjBGQXpJL2gxeGwvWjlnMUtadXRqK1UvMmdvaG1ISE5QR2Rp?=
 =?utf-8?B?MHFvNFRORDRaUGs1b0J6ckNtbGo4VzFmK2VGRjFNMTc2Uno0WHcxMlZKZ0NY?=
 =?utf-8?B?SmtkemovR0ZiZ1FsOU1ydFAxaE9pZE5lRC9ncUVoMjA2aHhxcU9BbmR2VXBr?=
 =?utf-8?B?cGNVNFp2WEdkQVd6TVhwM3hlMnA3SW5HeWdXeWZIM1lSMEtva2JDR0VBaVhN?=
 =?utf-8?B?MmUzcHpVNjhyT2FwRWFlQTlnQ3QyWExVdDI3V3R0WlllbWpZajNzRFd0Ymtr?=
 =?utf-8?B?c29RdWtTWjZMY1hHTVk0OGFHY3hjaW9JU3FuemZ5RTJId0JUWWRlNHBtaktE?=
 =?utf-8?B?c2lJWU42ZUM1U1JIWEJRNThWRnozeUZ1Y1JWejc4RkZpM2ZzcUU4VTRWbzVZ?=
 =?utf-8?B?N2hacDdJaG1jS1BIbjNXVDlxZmVpdDRhNWJ2b0NNQzZSdURtOXBCRmVzSTVZ?=
 =?utf-8?B?a1FEaWtBRjdFYlg5ZVBVSWFqc2NNWW93WitoUDgzQVZ2NFU5bkMwUGF1N1lS?=
 =?utf-8?B?ZVVQNVJtcHRYWmdXNHlKT1VxUXg1ZGkvV1llU0dhbDhDdTNRNEJFbGFDQWRQ?=
 =?utf-8?B?T1BTRzFZNkZWaDRVQThxcUFtSkZJNXB2UHhyREk2ZGNtUFFpQ3ZtUjB0V3Ro?=
 =?utf-8?B?cXY1VHRhOHJPYnZMbEY1YVRnRVhYU2VNSXZYMjFHbWhZc3c5aFRsQnRwOUMy?=
 =?utf-8?Q?6sHfwCGkLMDC/+eSF7GvHNRvSYlUOSES9Qo9PQF?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHc0cE1tQ2ZPUXNJaHcva2tNRW1Pcm9FbkxJMy9pU1hvNlZEVVcwMXF6UGtU?=
 =?utf-8?B?UUdxVUZqOXVCNnFxczRBK3RIY0Zhc1hoT1U5MExTK0hBejAyMkV3NlB0RjdY?=
 =?utf-8?B?UnlORGVLOVZncEdzL0VSM0ZnRVgxd0hKckwwMmJmcTFMWEhVZHg3OXZUY0hl?=
 =?utf-8?B?ZUtnWmVZOU95OTgxYkw1NWZOVHpwR0hzczZwVUhIVWdMSjJQZWwrK3RCa3ds?=
 =?utf-8?B?QVFVbDV0aCsvclo3SFFLaUg5dTR5SlN1ZGo3NDhkcVZJbTVWRmtYT0xBM2Vq?=
 =?utf-8?B?bG9mMktVRHRiQTZWSGZ4T253QmRUeDY2SWprbDVLaHoraklQWTlGRTVuWVlX?=
 =?utf-8?B?eFRHNTM2dFNNUUdVRGZQam9ma3pOcE9UOWkrM0lENjFsWGJNUGN0KzJLbmtx?=
 =?utf-8?B?aVdZR0FYZFVOM1BlTUNiMWMwaUhGZmNtRVNrZXYxRG5PdnlhQmpVdURjV0w3?=
 =?utf-8?B?dzhDU2RueHdweVFldTNZVHVuck5oVUVTT2hMTW1xdHFZR2k2UWxwdU4yckdp?=
 =?utf-8?B?bTVjdzVNQTZGaWVicDlhRXh4V2o3VjN0cTdlbEpUT1hHckErTFZnZitsZ2dr?=
 =?utf-8?B?M0hIZGtaU1F4eDNQUkdRNTdPWHE2MGNoUGVQcjhEWkprYVpkUW56UDN3ZWxR?=
 =?utf-8?B?VHBTTEw0QjhsZm00eHQ0VWFIN204bjV1dERZQmpQR3UzN3IwR1ljN01oYXhZ?=
 =?utf-8?B?UWRYV0l0Q0VZbDBGZ3l3NlZnYS9pUFVQcVh4OVVUWWF1T0E5Yk4xeG5Vajg4?=
 =?utf-8?B?cVZ1c1VlVnViOG1Kek56a25ycGJCcCtWOG9NZ3NjQTVXbW5JZjhsdEN5aUNk?=
 =?utf-8?B?aEdldEJFWFlEdkxtUldmVnhOK3VxSkoycDk0Mm1SbWxuWWdKV0xQY0Q4Z3M2?=
 =?utf-8?B?bDNUK0psdmhGVXZRYTU0cXBrUEZlcFljbU5kVEJycTdBY1RFbUpJMjQ5d3FS?=
 =?utf-8?B?SHB6dyttTTNZeXRqcDF5QmdhczV5QmdNWGJWcXlzYWJQT1lzODUwNnUrdFhN?=
 =?utf-8?B?ZGFuZE9wQmJuWFRQRnZRUkczbXVTR29FNStac0tzVVg5ejN6L3hkMnk2eVR5?=
 =?utf-8?B?TFpIRHBuOGZKazBXaXhuMzVwSXlBOTNJblYwdjg4WUt6TzdjUUFmOVQveUlG?=
 =?utf-8?B?NSsxMy9tYkkvamJ2NDhhQ1g4VGxxU29jMEVCaTJkOW5JcnlOUHVjQVB5WE9W?=
 =?utf-8?B?bDJaMnlwTVM3RlNUcE5ocFIzeC9PRDVWUGlCdnFmVmUxQi80RDFGenp0NlR4?=
 =?utf-8?B?VXdQci94TzhXYzh5YkI3dW1GcGR0ODRQQkNUU1pqOWs3UWdLZVVXRDdlZFlD?=
 =?utf-8?B?aXZFQ1FOc3BpT1dGeTlyQWI2Z2pyUE5pbTRoSEc5MEFlcS92ZVQ3TjFtdjZT?=
 =?utf-8?B?NmtkU1RUMFI4V0hacmQ2cFg2M0lXMVFSZDFUY3IyK2FwMklkRmlCRFFJR2FQ?=
 =?utf-8?B?T1NDZzEzb2RNaWpEa3NzeGFjSHVOTzUyM2JKQUVGTzMwdGpZVEJpdHFtYjV3?=
 =?utf-8?B?cVlndldVemNudlY3MXdxOVl1dmltcWdENlhNZDM0dDluTnRWQzhuNjd0Z2sx?=
 =?utf-8?B?dUsySHM3SkdGWkdmM3Y4S2EyaFM3eHltenNLNUZBWG5nU3htQ1FJN1I3dzlw?=
 =?utf-8?B?TmcwZG51cVhYWkpXWTI3eDNYNmE1cEpxQmhhNDNPSkZCVVNhMUhnV1VtZndD?=
 =?utf-8?B?RGRvQVNWTzB1WnA5SUhQQnRoRjQvVFExdHhYNVpnd0lsVW5zeGUzYUhBUEFI?=
 =?utf-8?Q?quhS+q5ndKvvC1qhe4=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d84628d-bd2e-4134-e1cd-08dd706ac6aa
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 15:43:26.2435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10626
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

--------------6E6OeLExvSEkt10vLDnE7twL
Content-Type: multipart/mixed; boundary="------------fqlaQiPqody2Yi8pLVYMcQyI";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wiagn233@outlook.com, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Message-ID: <222b8143-2bb6-4d5b-8454-12f0da0305ab@outlook.com>
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
In-Reply-To: <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>

--------------fqlaQiPqody2Yi8pLVYMcQyI
Content-Type: multipart/mixed; boundary="------------hL0ru9DxoSyLtUunql0DBQE4"

--------------hL0ru9DxoSyLtUunql0DBQE4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNClRoYW5rcyBmb3IgcmVwbHkuIFNvIGN1cnJlbnRseSB3ZSBoYXZlIHRvIGFwcGx5
IGNvbG9yIGNvbnZlcnNpb24gb24gdGhlIA0KYmFja2dyb3VuZCBwbGFuZSBvZiB0aGUgY3Vy
c29yIHRvIGRvIHNvbWUgY29sb3Igc3BhY2UgY29udmVyc2lvbi4gV2hhdCANCndvdWxkIGhh
cHBlbiBpZiBjdXJzb3IgYW5kIGJhY2tncm91bmQgcGxhbmUgbmVlZHMgZGlmZmVyZW50IGNv
bnZlcnNpb24gDQpjb25maWc/IE9yIHdlIGp1c3QgZ2l2ZSB0aGUgY3Vyc29yIGEgZGVkaWNh
dGVkIHBsYW5lPw0KDQpCZXN0IHJlZ2FyZHMsDQpTaGVuZ3l1DQoNCuWcqCAyMDI1LzMvMzEg
MjI6MjgsIEFsZXggSHVuZyDlhpnpgZM6DQo+IA0KPiANCj4gT24gMy8zMC8yNSAwNjo1OSwg
U2hlbmd5dSBRdSB3cm90ZToNCj4+IEhpLA0KPj4NCj4+IERvIHdlIHJlYWxseSBuZWVkIHRv
IGRpc2FibGUgY3Vyc29yIHBsYW5lIGNvbG9yIHBpcGVsaW5lIHN1cHBvcnQ/IEkgDQo+PiBk
b24ndCB0aGluayB3ZSBuZWVkIHRvIGRpc2FibGUgdGhhdCBpZiBpdCBpcyBzdXBwb3J0ZWQs
IHNpbmNlIHRoZXJlIA0KPj4gbWlnaHQgYmUgc29tZSB1c2VyLWRlZmluZWQgY29sb3JlZCBj
dXJzb3IgaWNvbi4NCj4gDQo+IFRoaXMgcGF0Y2ggYXBwbGllcyB0byBBTUQgaGFyZHdhcmUg
b25seTogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vIA0KPiBsaW51eC92Ni4xMy9zb3Vy
Y2UvRG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1L2Rpc3BsYXkvbXBvLW92ZXJ2aWV3LnJzdCNM
MTAxDQo+IA0KPj4NCj4+IEJlc3QgcmVnYXJkcywNCj4+IFNoZW5neXUNCj4+DQo+PiBGb3Ig
c29tZSB1bmtub3duIHJlYXNvbiwgc2VlbXMgbXkgbWFpbCBpcyBub3Qgc2hvd24gaW4gdGhl
IG1haWwgbGlzdCANCj4+IGFyY2hpdmUsIHNvIEkgcmVzZW50IGl0Lg0KPj4NCj4+IOWcqCAy
MDI1LzMvMjcgNzo0NywgQWxleCBIdW5nIOWGmemBkzoNCj4+PiBjdXJzb3IgcGxhbmUgZG9l
cyBub3QgbmVlZCB0byBoYXZlIGNvbG9yIHBpcGVsaW5lLg0KPj4+DQo+Pj4gU2lnbmVkLW9m
Zi1ieTogQWxleCBIdW5nIDxhbGV4Lmh1bmdAYW1kLmNvbT4NCj4+PiAtLS0NCj4+PiB2NzoN
Cj4+PiDCoCAtIEFkZCBhIGNvbW1pdCBtZXNzYWdlcw0KPj4+DQo+Pj4gwqAgZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcGxhbmUuYyB8IDMgKysr
DQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtX3BsYW5lLmMgDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbV9wbGFuZS5jDQo+Pj4gaW5kZXggOTYzMmI4YjczZTdlLi5iNWI5YjBi
NWRhNjMgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1fcGxhbmUuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BsYW5lLmMNCj4+PiBAQCAtMTc5Miw2
ICsxNzkyLDkgQEAgZG1fcGxhbmVfaW5pdF9jb2xvcm9wcyhzdHJ1Y3QgZHJtX3BsYW5lICpw
bGFuZSkNCj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fcHJvcF9lbnVtX2xpc3QgcGlwZWxp
bmVzW01BWF9DT0xPUl9QSVBFTElORVNdOw0KPj4+IMKgwqDCoMKgwqAgaW50IGxlbiA9IDA7
DQo+Pj4gK8KgwqDCoCBpZiAocGxhbmUtPnR5cGUgPT0gRFJNX1BMQU5FX1RZUEVfQ1VSU09S
KQ0KPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+PiArDQo+Pj4gwqDCoMKgwqDC
oCAvKiBDcmVhdGUgQ09MT1JfUElQRUxJTkUgcHJvcGVydHkgYW5kIGF0dGFjaCAqLw0KPj4+
IMKgwqDCoMKgwqAgZHJtX3BsYW5lX2NyZWF0ZV9jb2xvcl9waXBlbGluZV9wcm9wZXJ0eShw
bGFuZSwgcGlwZWxpbmVzLCBsZW4pOw0KPj4NCj4gDQoNCg==
--------------hL0ru9DxoSyLtUunql0DBQE4
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBGK0ObIBEADaNUAWkFrOUODvbPHJ1LsLhn/7yDzaCNWwniDqa4ip1dpBFFaz
LV3FGBjT+9pz25rHIFfsQcNOwJdJqREk9g4LgVfiy0H5hLMg9weF4EwtcbgHbv/q
4Ww/W87mQ12nMCvYLKOVd/NsMQ3Z7QTO0mhG8VQ1Ntqn6jKQA4o9ERu3F+PFVDJx
0HJ92zTBMzMtYsL7k+8ENOF3Iq1kmkRqf8FOvMObwwXLrEA/vsQ4bwojSKQIud6/
SJv0w2YmqZDIAvDXxK2v22hzJqXaljmOBF5fz070O6eoTMhIAJy9ByBipiu3tWLX
Vtoj6QmFIoblnv0Ou6fJY2YN8Kr21vT1MXxdma1el5WW/qxqrKCSrFzVdtAc7y6Q
tykC6MwC/P36O876vXfWUxrhHHRlnOxnuM6hz87g1kxu9qdromSrsD0gEmGcUjV7
xsNxut1iV+pZDIpveJdd5KJX5QMk3YzQ7ZTyiFD61byJcCZWtpN8pqwB+X85sxcr
4V76EX85lmuQiwrIcwbvw5YRX1mRj3YZ4tVYCEaT5x+go6+06Zon3PoAjMfS1uo/
2MxDuvVmdUkTzPvRWERKRATxay28efrE5uNQSaSNBfLKGvvPTlIoeYpRxLk7BN0x
i/KZIRpSlIf0REc1eg+leq2Hxv7Xk/xGwSi5gGxLa6SzwXV8RRqKnw2u6QARAQAB
zSFTaGVuZ3l1IFF1IDx3aWFnbjIzM0BvdXRsb29rLmNvbT7CwY4EEwEKADgWIQSX
5PUVXUNSaGVT2H/jUgzJGSnI5wUCYrQ5sgIbAwULCQgHAgYVCgkICwIEFgIDAQIe
AQIXgAAKCRDjUgzJGSnI57GwD/9O6kei9M3nbb1PsFlDE1J9H27mlnRWzVJ2S3yJ
8G1oJo8NSaRO7vcTsYPBYpEL1poDQC5MEGh6FXSiOnyyHrg8StmGLksQE9awuTnl
nQgvXDQMVtm87r1abBAavP5ru2R9x/Tk63+W/VT2hPekMfHaJwFi1KATSI1AhsF3
CVoj0yDulz1u0uZlircKdbeEDj+raMO0LA12YxWaWtL/b9XaoAqV9voraKhx+0Ds
ZS5bWoUvs+715BArPBr4hPqKavsBwOWfzWDTKln2qv8d+glWkmk6dgvZFcV/9JEJ
Q8B7rOUMX614dqgwi1t71TI0Fbaou3nhAnES1i1it/aomDUCLvRwjGU2oarmUISF
gvZoGYdB9DfVfY3FWKtfDJ9KLUk9k3BFfBZgeAYoLnFZwa3rMyruCojAGTApZtaa
LZH/jzQf7FpIGGhDYnvGKXS01nLCHuZSOEvURLnWdgYeOtwKW1IIcnWJtB12Ajz2
yVu3w4tIchRT3wekMh2c3A3ZDeEjszezhFyXgoRpNYDBzNl6vbqhnopixq5Wh/yA
j6Ey0YrIUbW9NOhIVCGkP4GyJg756SGzyPny0U4lA+EP7PS3O7tE0I3Q5qzDH1AE
H2proNlsvjZeG4OZ9XWerI5EoIxrwZcOP9GgprB4TrXUR0ScTy1wTKV1Hn+w3VAv
6QKtFM7BTQRitDnpARAAsPFINiaOAxfatzRTme/1cG+kpSqY9znQYxkz8EWY1eAO
Qs2xKl65JUyhTRPQkW8cqDVzdVF16wW+1RyoMrtK5xj6jm9K7VAAc/sDL2LkoSjj
3FpoOp/RMfVBiLGATCdNSEDFPO6nGVJn8aOXmH54sgZzhgfqW1X9Y4ToWViF5VXZ
sWGzHPsXoVvlRyPfAYi9eL11hZqQVhXPOQTuAG4ow8z7ZGYT7wfZo9oXvs/11DQ/
pxt7aO8QGCNCsWnMOecPBy9+Tbr/huxLVFl+boaTv3QwdATHFtObOi+q3m6RAADB
VQSiACVCsqb02HADfhO8n0AM75fJjbXFTLBR06+eME0h0dF8d9hu9gHe3ZHqsvB4
X5E9UP+Vf8c1M9aoJrULVoAOo50gmCEhjlzI5xYczBtw1bhOXCP0Wj5cmx3wbKq7
UKMXjDKF9ag907d078BaIzhMOChN6s9c03KM6ix0nLpBGzYZXC0VL+yqKkiHJzee
mBJ4YzLvf8rCGxbg8kKPQ2ongQVpcE4rr6uS/kCoB7BpVSaHraAHA6IwpGccOlU+
0v9rBghE1QzIlhkzcxwzxlb7rTZsedxSPQLVdPaRG9rkz3Qw3mWYYs2w7dJahgIm
p1z/v9qdTWYdHzKRyafluFlz0PoUcVuGz6PwFzDxGV5Gqqg6zHLEx68KxKwoyecA
EQEAAcLDrAQYAQoAIBYhBJfk9RVdQ1JoZVPYf+NSDMkZKcjnBQJitDnpAhsCAkAJ
EONSDMkZKcjnwXQgBBkBCgAdFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmK0OekA
CgkQX75KBAfJsRlTUBAAjQoMom0dfgWNNIXpvQgiGRh6slnyZ/QH4j2CGNTgfNC1
CV4SVC7U/A3lFDoDGbcsISb7uKyLnjrn1c3rguT9JXzuIbQZotgE0LvG09odGMXD
S92CmBaKnvhYlSO0cUdRtgvnw3nMgl1Kz7a8vvjYl3S1XhXQ8bpgrh2Sn36oqhaS
//Mgy52qHN2lRz09lr9Ig1NSXkjguSyj1hTc5wOWV+rsX4is0nOBNaov76/tbcF6
sIsHyHPSGzZ4jefZs318ineuBnrtVE9sH9XWc1QHLF1gzOKKwssddXlYe2Sj5plX
vZqcHHYfrOLe+v1gxW21HumUosTsCDUVJ9egr1DQcaQiiOUV5qQi4/GfqFAacken
NbHcNLpOxaOE3IwbL0F7aZHsKsl18suDXAqb3ljyAm4fEZr2ceEnE7n1x9BZizJL
YbkYB/k6gxxxbyjcoR6F1niEE+6Hs9vKGNmvNQikPpv05IDXgOr6pgWWCdZCiup3
N72xS3OCZNkkVQjaSL6/hN/IcR8+Xtp+nbYH4Agm9hBAPN045l/P9nVmSQOJ3TC+
wGgo8N16qzW061YD/faB/g/u7RcSfi5SwISIyrNXnyhBZTrFx+0KsjtdwVGJXYRS
/tio6zRaBl/bO3+e8SGqsHU3f6JH+HgTWJINfj3I/wDIBAL0XGoDAE8tqQBpsTBd
mA//WestyKDwfpZEqz9wBNX4QUS/zh+1GiweKcgqXhi4RuV/MXTPXcET1/pGnX5S
h9hdBj6lIseTtbSVDBHQm/1qUPYFAG+grdWZ7YrPIXfKTUCBlE/pKcJ6Yi1RIW3o
OQ1+OfYaPDfqOnq2Ed+HFM+KNFhWtU1TRUBikU1n88lMcRlFHFtkAuZgsDwj2b+v
c71uXNA3YkcFHGBhq7rJQu3B1l2zvM0P0ds0HAo58iJ4qqMkA07EJStaATOokDAC
4Xo+n7DHu81pQPP9BTY9u1G+m4mlpivWqIVk5Gbb+2w9yCmkEWqv5QYPtjpgxq0h
zURLeU+BDvOUKjCS5480NvxWwOthPqYls0WgoSVVMtDpeklSRxmrHJ6k+H1gV9Ja
WcfQO/l0IQrQm1+xE8xz87oHl18gIVbpXmlfss6EnPfmhdst/FqxXM0sxV+QD3oF
mf/CcRG4SSqjsKkpQviDMG5TwN52mWwoirk2MYlNGLNwknWXhRb0l7r4SyZNfOWp
0EI0EvO+CfKZL03drnmMaeOoXXtKwmWgCpYTa6dxtTTVKbeUKYy2p+jYZqUONl3y
CwuL9UIOwE+LxhtED4ZjIWxoD5/uOBGLofP/eNZpMmmC9H18rupdh6ChGYi3q6/L
6oHNPDbwJUFv9UJys+MwOV1Lzq8ULCxRfYntnhug1iZHYdTOwU0EYrQ6CAEQALWU
YW4bgH3p7jUtpD8rUoaHTJ+G3z9ZUjYvz+r0llcpurPm0DyG7kWHzbzGTCkdYTxf
dxEaUggMfWxLC7Vyd8PadoBTlJJ++7MP9eL9IzyaJEG034N3TtDym/v/PataFbjs
hi4YF1tT/2RnSK3neeotr7FX8+zZrz5EgE69Wz06HGIKanRn9fhUKfKQzetGl0NE
Se62aTkxsf+Qb4Hq2i1wm6ct4m2iRfdhw1OUDNQHgbOy6V8mxXPg2fsJLVC3inpg
BdhA5xWrkAnxouujB1xs9g4Mu+5WnUqc/jr6S0zKbm81Xohl8JDbGvxbOpb9fmq2
NnVLR4771NJC3/2qzU/pjgjA/HNmjmqYFEIToTNlNjsEYGydcujlSsjdFDe+pA6S
kqUrEHpaVf031JOCzEzgfqyH3gMBtDXyrGAs8Vdnb1/ROMIALqbK8nh2IYnRblME
J3D6nJDlYMVwsDgOhhrTFREBUdLJ7lZ+LpS4ACctKyV22Eo/L2nOFeu1+pdgivMb
4L2VIJtgvzKFfV3I6MUMzSDMkhQzQZjPq7Uzlu0cZ9ZpSO7HuUzigJZ6vnE7iwLv
i/yyjUUqHnSmLFFE4xxpnsMlDZXBxx0HIzEt48M2dmvfmD+SqSiQrE/3qgWaIjwC
+lfYggYjPtNgSntkfOsCvDqnob8b0dpqRcFT5Px/ABEBAAHCwXYEGAEKACAWIQSX
5PUVXUNSaGVT2H/jUgzJGSnI5wUCYrQ6CAIbIAAKCRDjUgzJGSnI5/3nEACdQ2vO
zmUJ2LoFq7z0Dn7HVfUX8slzja7LBl3vCw/2Oq5s2VbvgZuPRfUxdEMXPlTqyab/
VVbHzqhSYtMMpDsMhEnVZ4DawFvWVs3yL5BA0qU5Wsb82zRGO6Qab29cRaEjK6Lt
a6N9vfVyn7ZQNvUWB4sB9RyAtSTyQVrEuLZWoWfQLRqOaecFaBCsTeg/0q4ywnBY
kCZR9ciEnLGVRZt6oE7qNoNLsyTNKNWNge0/Jiv67Jt4VByZWwqz5f65GBAJYUlC
qWsCoZXUYTnqlFAnI533ZhYEx/x7UzCJREAPgpP0/DOfmaf54QqTwsdKU7g3VE0a
N7Vhy/ja4sCvgLmTUftKXr7k2Dsg+gldB54P95VPOot4DdehlcTVkI1HUNabPSJ2
kIS8bIHr0JrIMzqqOhlIh0CHcbwLXBu6V7+x0YcbGQPuvIfJYsYjHhNVt9Dx9Z8Z
+YDfxJJXY3ORfcQbtf700l/XRs3q9c2WRZ+CfJWw+kfpHjmq6BfEPUtXGJ0G4d7w
ErIZszYIviEpi7UdWuM48WNgJSjb/o5HaSLY6LeXXsMVXlOceYtbF1idw7eMTchU
rNj2bNSLj0qJZstNIVWXRYhpq/ELjJjqOmGoEnVb668sPNdpObwLJA+QDAvRBq7t
WPHvRXXbC5TEqFVd89bPHQNQyvecpEnSBbVWU87BTQRitDmyARAA0QGaP4NYsHik
M9yct02Z/LTMS23Fj4LK2mKTBoEwtC2qH3HywXpZ8Ii2RG2tIApKrQFs8yGI4pKq
XYq+bE1Kf1+U8IxnG8mqUgI8aiQQUKyZdG0wQqT1w14aawu7Wr4ZlLsudNRcMnUl
mf0r5DucIvVi7z9sC2izaf/aLJrMotIpHz9zu+UJa8Gi3FbFewnpfrnlqF9KRGoQ
jq6FKcryGb1DbbC6K8OJyMBNMyhFp6qM/pM4L0tPVCa2KnLQf5Q19eZ3JLMprIbq
KLpkh2z0VhDU/jNheC5CbOQuOuwAlYwhagPSYDV3cVAa4Ltw1MkTxVtyyanAxi+z
a6yKSKTSGGzdCCxiPsvR9if8a7tKhVykk4q2DDi0dSC6luYDXD2+hIofYGk6jvTL
qVDd6ioFGBE0CgrAZEoT0mK6JXF3lHjnzuyWyCfuu7fzg6oDTgx3jhMQJ2P45zwJ
7WyIjw1vZ3JeAb+5+D+N+vPblNrF4zRQzRoxpXRdbGbzsBd5BDJ+wyUVG+K5JNJ3
4AZIfFoDIbtRm3xt2tFrl1TxsqkDbACEWeI9H36VhkI3Cm/hbfp2w2zMK3vQGrhN
uHybIS/8tJzdP3CizcOmgc61pDi/B6O2IXpkQpgz+Cv/ZiecDm1terRLkAeX84u8
VcI4wdCkN/Od8ZMJOZ2Ff+DBbUslCmkAEQEAAcLBdgQYAQoAIBYhBJfk9RVdQ1Jo
ZVPYf+NSDMkZKcjnBQJitDmyAhsMAAoJEONSDMkZKcjnnIcP/1Px3fsgNqOEwVNH
7hm0S2+x/N/t3kz50zpKhczHZ8GWbN3PPt4wkQkdbF+c7V4uXToN4a17bxGdUnA9
qljxt8l3aEqd4jBqLn2OJriu21FSnrZOpxb1EwWwvnVUwrLxCuV0CFQJdBlYp2ds
64aV8PcBOhQ62y1OAvYpAX1cx5UMcHsNVeqrWU0mDAOgvqB86JFduq+GmvbJwmh3
dA8GnI2xquWaHIdkk06T55xjfFdabwEyuRmtKtqxTP/u6BzowkV2A/GLxWf1inH5
M81QgGRI2sao6To7sUt45FS+y2zhwh62excOcSxcYqKzs/OiYEJjWMv9vYRwaqJG
EVhbfGFOjeBOYr+ZCCeARh+z4ilo1C2wupQT8VPsFiY9DRYgkAPKlbn9OqJvoD7V
hvyelJagSNuRayrrmnEaZMsoRdS22fneCVWM0xlGSgPCVD0n9+6unTnVbmF/BZsE
g5QufQKqlFSomu1i23lRDPK/1aPc2IoxcQPh2fomy8spA5ROzOjLpgqL8ksEtQ75
cBoF1K5mcC2Xo1GyDmdQvbIZe+8qwvQ3z9EDivvFtEByuZEeC5ixn4n/c9UKwlk+
lQeQeN+Bk7l8G9phd4dWxnmWXQ/ONR/aLzG+FguuGNZCPpu5dVQH44AXoFjoi9YV
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------hL0ru9DxoSyLtUunql0DBQE4--

--------------fqlaQiPqody2Yi8pLVYMcQyI--

--------------6E6OeLExvSEkt10vLDnE7twL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmfquBcFAwAAAAAACgkQX75KBAfJsRno
sQ//RSS9mUIqvIrIOeFL+ydywdt8XAnWs7453UzqVy157bpkKixIOSrw6CEOFHUXstJ8RVgbqRqv
d4QJZ2iFgu3iSmAL7WYtZydU/sI7z4gf7vsmnLxzS4pza6xNOVT9uFmmrPZDHYsYgBOa3mMw9j8v
84QF/JeLLE2HZdI2Ra7wHc0MliLjjYmOMzCKhuPYZm982I4D5Jp+zmX4z5cPNIx9XzxOhKubIweH
oKhdqO60dgT0TDe3G0CNp2OJl+N20mtLJJKnv0PN3Uzt32YS4BI6hyRNwLfkAaM1XbeY3yF/mRYo
t7LhboM7zDY91CiVyzR5b2WthUSyiZFl8RySR1CB0QZjBaFh3U5sB93Gkt/yX2y6lO+mnbhirrDN
wx7IXtC/VVZIh2gCUUWw+S9fslmMpIWwhXfPUvAc4x76YbkLmBsUWTnd4XC6MEN+PERoFmiWypju
q/2rP4ruMKHJAs4LksN0eTXOH6og/j/k/Ue0+Nlx1ATVFJsacQfTwBcF3Edmru95ps7ltdE7Y/lk
aMoQF3B+OPrSX9J/qU+kaJMT8F1GMEPvGwY7gSslkXQUBr/6OgayaO1ylnXTqcz2wQBCa9o4y8+Q
zsTSw1t1HYrZZaKv46+HNC44mERq23NHWTHPZgsJpOXFyBO6aH/5pbbWHKB9LinRDF0jBIsgOPAn
ptY=
=C6x1
-----END PGP SIGNATURE-----

--------------6E6OeLExvSEkt10vLDnE7twL--
