Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C40A77F50
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2BD10E331;
	Tue,  1 Apr 2025 15:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="QVOhlyjY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazolkn19010012.outbound.protection.outlook.com [52.103.43.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAA210E331;
 Tue,  1 Apr 2025 15:46:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9Ddk1ryof0yC8wJaPsdDImdqEBt4IKP++uisFfx2s9jt4OXaCineFu0oeqzR+EsDD6/qmCZvSCHJ9pitUBqUO2NT48yRkYe8kdHDdG3dw4nkhVWK/NfL5audor7ldT3BvJ+GBZnvTLwYEOFCtzKh3N4nSImWCsELxlqPaznnKXeNYax42eTBNnMy9iavHSWKXe1N9CFaeBwI5XWSzvIIzSEcVrAm4AkYZP+OpgeuxlaxgjG3gZPUruUG1I1EJ7ChCGXQNDD7Qe/Wm53nyeFyx/xZ3+uu++yA6Q5h9Ncd8pe8nzti6rBXYE/GM/I90QfHhm3Oc8TJbkEagvj4fXSdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC5ZfHocGI8u2bzS/KblGFFx2EJA4XXED8jN0J9vPQs=;
 b=jVYj81H6QB8V8B7WjcwkEFrG2iQMZ7V+3aInd1XOxnz8ruIEgffrX8ceBDToR9E7Z4Ef/pQOs7xbQaciCRVdeDwaFM+a07hB4v/tf/NLbe/Qv+8xxg6ycQTlEOd5i2uW0+59vLrO7IIiQPfc7k9nXMHQi8Bt/iocJVakuOuX9EVDCl8sjPTjBuGknKO/oiM9rpGU/xAqCpEcMjbIZiecRlG8U8q9BV1y2N0VyL/mJ3sQ3cgNBGgppN4YjzB3GqKqyPFDCivibGTprqfcuY0Uv6DoF77OMy10tnqhUSDA9Dt7nSJxRrRQhhiyRsEb0/OD6cgnDLhq0rhqOefw6PqI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HC5ZfHocGI8u2bzS/KblGFFx2EJA4XXED8jN0J9vPQs=;
 b=QVOhlyjYU4jzQyto74JTD8D0OHM4Joe4Gpo+XxbHfUPaU3jZpSBiwMhDZSTF2E/GxNB7+YF+gnLldqoghjCKl9gpSarGG5fvjzf9MqZNfJq3+GJ+OnIuKduFi2WI+Mr01l/ng7jnPtB8vVFLVl0lQtvPbxjGo9FlaDzcWIS1Gb0uwXsEDkoqGtnolLo/H/pCgjasCC3K+bHH8cxGP10IIncnLaydXvkpwSaxG4u67sAgjgQcqctzowkz9IL1+lMUp7h7AfOIFR86UzqPzIBrrrAYlLLkMjsPSHJ7KL/Iq/NB7xknDGSFMoEZKUFJm/jR/P3tiXYQk+WyTwj87xdm5Q==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by OS0PR01MB5363.jpnprd01.prod.outlook.com (2603:1096:604:95::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.37; Tue, 1 Apr
 2025 15:46:02 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%3]) with mapi id 15.20.8583.028; Tue, 1 Apr 2025
 15:46:02 +0000
Message-ID: <TYCPR01MB84373F182FECD129EEB3FF3898AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Date: Tue, 1 Apr 2025 23:45:50 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
 <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
 <63d2a14e-759f-44b6-99b4-de42b8d6b1e0@mailbox.org>
 <TYCPR01MB8437C142C860FA03F06B5E6998AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <fd0440ba-1a34-4cad-9e89-701dec7673b4@mailbox.org>
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
In-Reply-To: <fd0440ba-1a34-4cad-9e89-701dec7673b4@mailbox.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bd16JyiLfY9FUxGt0q4DJG1n"
X-ClientProxiedBy: SG2PR02CA0131.apcprd02.prod.outlook.com
 (2603:1096:4:188::6) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID: <e5627b0e-e726-4f10-9786-74b3376d298c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|OS0PR01MB5363:EE_
X-MS-Office365-Filtering-Correlation-Id: dc45cdcd-61f1-4be2-6267-08dd71344e25
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799006|5072599009|19110799003|7092599003|15080799006|12121999004|461199028|6092099012|20055399003|4302099013|3412199025|440099028|26115399003|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmtuUU1GZ2c3K1Q5ZlVrMmVHSHZBK2xncEY1ZmxTRk0zb2VmdEF1aDUwaUFt?=
 =?utf-8?B?b0w2NUdieGxya2UwTE1jYzAvdGJuMUJaN0xlTElHdmZReHVkY2RhcDAzRDhX?=
 =?utf-8?B?YkRUTWZKNCtRdjd4aWg5eGl2cTJtRVlZODR3YnY2aUZGM0FGTEtXVEpVZVRC?=
 =?utf-8?B?RFJqdFB6N2ZpQ29ONW9QRWpRU1pMdmxlY1VqREtoNU1HcDdWV253T3BpT3dt?=
 =?utf-8?B?NzZGZk9nWnNQKzI4TFQvRjNCQkZDRnRrWGovVlBzN1h4U05ROHhEREtiN0Zp?=
 =?utf-8?B?WWtKbUNyaGpEVmlpbXl6QzN5T2hBbzhsRU12enVNYnI1S1ZlTWxnU2NqNjNu?=
 =?utf-8?B?Z2hBWGhtTUtKaGxtTzFFaHpQUkFWRHlTSG5Yd3h6MHllck1RbGRBcEd1WUlQ?=
 =?utf-8?B?SUloZ00xbkQ1SndVc0FOTFBUSzBDT2dIYkFRUktlUEs1N1dNYWhDQ05tYnYz?=
 =?utf-8?B?VjFwTUo5aStSaG9qWHpiOGlyV2U0bUhuZndFM1B1RmF6cWdXbWpGYzROR0p1?=
 =?utf-8?B?RGZvQ2FVRmpneDVUYktieGdEd0FjMEM1ZmdNZTFRQW40eFkrclRnOTM2UElT?=
 =?utf-8?B?L1lGbXN3Wkhld3R2SU5kVkZWNmFHQnM0SVRKSXl3S3VlQk5zd0lhR1RxUHhI?=
 =?utf-8?B?dG5GZEV0WW00dTc5YUd3RENFakpHZWlvamFlYjJGNnZVK0xEQTQzK0tjVkU5?=
 =?utf-8?B?dUNqVFl2cThpbU9LTTFubUl0M0FseWRQSlJiaGVBazJjcXUxTUZ2cGI0d1U0?=
 =?utf-8?B?cC80K01naXRTdTdzQzB0dVRTQUxpdjZxM3I0cTZMZDJVaDl1UGQrTmI2MTU3?=
 =?utf-8?B?MU8vZkJxaUNoMm16c1YxZWx1eXlTMDZ4RmxEdGlNRG9TOVBOc2tkVnVEdWZB?=
 =?utf-8?B?VHo5d24xeHdCM0dqZlJ2NHFQVzd4MzRlYXBtbkZPd1QrQ0tXQ3hrdjhySkNK?=
 =?utf-8?B?NGU0VU8rR3hmc3N5MWpjbDNwQzhnWE9MVzYvSnpvUVZ0VmpvZjBLOExyL0ZJ?=
 =?utf-8?B?S0VQa1p2akZuZy9VVnZmK1RLbEorelNZTjJ6bGNBNUVkNVNZb3JnanhwZVlj?=
 =?utf-8?B?eTZkT2pxUW45eHN3Z0tES0tJQjJRVWZmZUxqeU1aRS94Y2tqSm56d1pDSW1P?=
 =?utf-8?B?ZU8xQWZKbDVmN0hBSFQveTh2ZW9YS0IzVnYvaHBvSHVhNnUybnkydGoyMDQ4?=
 =?utf-8?B?V0VQSDJaekd1LzBrN01lMS8za1Y1N2d6RHlGT2UrWU9lWnJPR0w0Q2JHVUZP?=
 =?utf-8?B?Ly92T1ZwQm1aTzdtMWVKMWdPKys3UWlhTWxHMTlPZkM1YmhOY0lUbHp1WHVu?=
 =?utf-8?B?bEpLVHpZeTIwQndyZlFQSVJHQWdodEVhV2ZVZjgrTzdOQzdFakFMV2dJUFE2?=
 =?utf-8?B?YmNJbGFzeU5yemNvOEZmbmUzaWtxWFIxS05SQWxlQVcyZGZrSXlNU1ZJQWVQ?=
 =?utf-8?B?clBFSEFBTzk1QW5pMzVSTjBQNTBJYVd4aDE2MW92YVBIVXBPUURvTjkrcWVn?=
 =?utf-8?B?K01RcmFUaVpBNElXMUpNMEdUbUZrSlUycVdmWmUxejBIcHBxU0FFdnM4dmhs?=
 =?utf-8?B?Q3pSbGw1eFZkSjViZDRHaHFYUGJBSjIrdGR5S3NxQU1NVXFiOTBGTnVBUlRo?=
 =?utf-8?B?V1RsU1o1OHR1Zm5oVThwWkJBVjVXWUg0d2FtWnlQTTIzdmlXWU44c0psQnE4?=
 =?utf-8?B?QnM1b0NmNWk5WEpvOTRLY2ozNGJNTHZ5Tk1VV3BhUFVBRzRIY3NwSXp0WjBJ?=
 =?utf-8?B?dlhoY2w1TlVUbGx2anBFaWR1RzA1c3lYV2hTTGlubW8rSGE3MzZXQUtUL2tt?=
 =?utf-8?Q?+A3CeMPUba2qI6ZYt4Uio+qqUtmSgvQUgoGhQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d01TV1M0SzdDTnhiUWtGbDBBcThMaWlWRlMwY1ZRckZ3d3dwYkVqTFc1cHl6?=
 =?utf-8?B?U1pyVTdyNmpsNldmZkZmNTE3bFV1cHFzSzgzdHpxRzAvaThFUVVoOExDU0N4?=
 =?utf-8?B?YjBCaSs1V1Q0R0dLZEZxS2ZUTkc5dEN6S0gyOGZJR2F4VktFVnpwU1NybzlK?=
 =?utf-8?B?NUdUL3ZmOEdZaFlmV0NVaXppUE12YWRrWGdhTjlhZ1gzcVhGd09rcXppcmRO?=
 =?utf-8?B?elBHYmYzSjJMVUkxTlY0MEIwQnpMZFRUa3hVVmVNQ2tiZFdGT09zd3YyR3Zl?=
 =?utf-8?B?dHNBZ2doSGp0SmR6UjJrY3RnRGllaVJMcm00OUQxNWpXaXQ0WUxsYnpJczNp?=
 =?utf-8?B?Q2ZaaDJBZXI5TFJrKzUwby9WNUV0RFV2VzZ1KzZmSkFqWjFwL0hQM2lNY3Z4?=
 =?utf-8?B?a2dxdXd5dFluTUtqQm9DbFhpRkpidzJ6Q3dGekNIT2hoUkw3cTMwYnlxYjZi?=
 =?utf-8?B?K0RlSWpEN2p6TU5TUXR5ZDFENzdpd20xS0diS3krSGI3MlRCdFV0c0ZKMTF2?=
 =?utf-8?B?alNyekgxcURsdzBVd3J6bHRXSi8rYndSQkNacHQ4ejRXRU1GSUhYd3Z6UUhM?=
 =?utf-8?B?K2FEQ0w0UllVaHJwVVRpSmtCc2ZGV2tHUCt6OVE5a3VmUzMrU25lQ0dYdXBG?=
 =?utf-8?B?djk1Y3pJV01jNVR3aTRYTkZoVm5RemhiNFI5cS9VdVUwcG4ra24xUktsRTRJ?=
 =?utf-8?B?a2ZEZVNoNnFtdEdYcktWM3dmdGJpb01tT1dGVysrTHA3ZWlhdmdtekp4Nzls?=
 =?utf-8?B?ZVpPNmNydFpJa3JZR0kwZEdsR3VOanl4d1F3RWtMMk80SUZOQkd4TURxaHY3?=
 =?utf-8?B?WFpDSndpbnB2YWVxODlnSERIUDRFWGhBY3Q3aC9qenhHWGlPM2hibkRqSzdo?=
 =?utf-8?B?ZjJNWXpNcHJwbWJHeTFTdVNCZXhnSGMrb1NpQ1FZTXZzSndENkdoK1VvaEt6?=
 =?utf-8?B?ZVNsSEp5QmFEZ2RIelVkZG9XMWlFYkhZbnJzcG9RcUVYOUR5L0t1SW5Sb3ZB?=
 =?utf-8?B?WFNOYlc5aHlpMjRnS2V4a2pRWkdJTUFQZTBKMlNVTlVzSHJLT3NDYlNaWkpo?=
 =?utf-8?B?bnBiTk1LWHhCS2k1LzE4bmowVnpBSHRXTmx6SCtQSjRvVEZXcFNjOHl0bEF3?=
 =?utf-8?B?Ny80TThyV2FBT2JROFhSTXJCVUhNaEZ2RGE1WkdhRDh0SjFYWGY2RlhaNEdI?=
 =?utf-8?B?YWMydHlLWFd4U2pqS0xIVHNISUc5SjBxWCtsWFZPQzdRY0RQM25sQksxdjRt?=
 =?utf-8?B?dDZ1cUtZYkJ4SGZ2U09NQnhPMlJqWHovdm5NNUZONmNXb0phR29CTFI1R1JR?=
 =?utf-8?B?SWtteGhOT2NxZjUwbzRwTDUzRnFUSGZhVW43clZ0UkNCOEE5NkcvOEkwYUhm?=
 =?utf-8?B?WkZURE00RGlLbURjWnlZRzgwWGQ2V0VyUjJZU3ZTQ0U4UzVQVFFpNFpuYlZD?=
 =?utf-8?B?RXQ3Qjl5NEphOVpmZHgyS2IzSTBZUm4wdkJHcWN3RzI3MUdjYlJYNE96RURj?=
 =?utf-8?B?Z0pRc1kyUnRxWHViLzRiL2gvcXZHVzNWK0F4ZFExdmlZblR5VjVUS2NmMFpE?=
 =?utf-8?B?WXNDRFZJaHJnVm5IUHk3VkdXSHdoOWRDZWZESEE4V0R0WjZpNjhlcGVUVEs5?=
 =?utf-8?B?OHNUTDc1d1NnUnpwd3JvaWduY3RVeStNemtEdTA1RUxvdnZ4YUIrMDBFc2xo?=
 =?utf-8?B?TGxYTEgyT2xVeGxvMm1zc29OYjl6eXZicUVSU3lKMjJGWWtwN01DUjlzNlQ2?=
 =?utf-8?Q?hOQKplU1FejKB+7ODo=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc45cdcd-61f1-4be2-6267-08dd71344e25
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:46:02.3836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5363
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

--------------bd16JyiLfY9FUxGt0q4DJG1n
Content-Type: multipart/mixed; boundary="------------qjOtNp7g7Duaa5j6dTqwrXke";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wiagn233@outlook.com, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
Message-ID: <e5627b0e-e726-4f10-9786-74b3376d298c@outlook.com>
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
 <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
 <63d2a14e-759f-44b6-99b4-de42b8d6b1e0@mailbox.org>
 <TYCPR01MB8437C142C860FA03F06B5E6998AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <fd0440ba-1a34-4cad-9e89-701dec7673b4@mailbox.org>
In-Reply-To: <fd0440ba-1a34-4cad-9e89-701dec7673b4@mailbox.org>

--------------qjOtNp7g7Duaa5j6dTqwrXke
Content-Type: multipart/mixed; boundary="------------6Q8m91zMn83NazS2mK0gNNCu"

--------------6Q8m91zMn83NazS2mK0gNNCu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCuWcqCAyMDI1LzQvMSAyMjoxMSwgTWljaGVsIETDpG56ZXIg5YaZ6YGTOg0KPiBPbiAy
MDI1LTA0LTAxIDE0OjMyLCBTaGVuZ3l1IFF1IHdyb3RlOg0KPj4g5ZyoIDIwMjUvNC8xIDE3
OjU2LCBNaWNoZWwgRMOkbnplciDlhpnpgZM6DQo+Pj4gT24gMjAyNS0wMy0zMSAxOTo0Miwg
QWxleCBIdW5nIHdyb3RlOg0KPj4+PiBPbiAzLzMxLzI1IDExOjA0LCBTaGVuZ3l1IFF1IHdy
b3RlOg0KPj4+Pj4gT3Igd2UgY2FuIGFkZCBzb21lIGtpbmQgb2YgImxpbmtlZCB3aXRoIiBp
bmZvIHRvIHBsYW5lJ3MgQ09MT1JfUElQRUxJTkUgcHJvcGVydHksIHRvIGxldCB1c2Vyc3Bh
Y2Uga25vdyB0aGF0IGN1cnNvciBwbGFuZSBhbmQgYmFja2dyb3VuZCBwbGFuZSBzaGFyZSB0
aGUgc2FtZSBjb2xvcm9wIGNvbmZpZy4gU28gdGhhdCB1c2Vyc3BhY2UgY291bGQgZG8gZXh0
cmEgY29udmVyc2lvbiBvbiBjdXJzb3IgaW1hZ2UgZGF0YSB0byBhdm9pZCBkaXNwbGF5IHdy
b25nIGN1cnNvciBjb2xvci4NCj4+Pj4NCj4+Pj4gVGhhdCdzIG92ZXItY29tcGxpY2F0ZSBh
bmQgbWFrZXMgbGl0dGxlIHNlbnNlIGZvciBib3RoIGRldmljZSBkcml2ZXJzIGFuZCB1c2Vy
c3BhY2UgYXBwbGljYXRpb25zLg0KPj4+Pg0KPj4+PiBJZiBhbnkgcGxhbmVzIHNoYXJlIHNh
bWUgY29sb3JvcCBjb25maWcsIGEgZGV2aWNlIGRyaXZlciBleHBvc2VzIHRoZSBzYW1lIGNv
bG9yIHBpcGVsaW5lIHdpdGggdGhlIHNhbWUgY29sb3JvcHMuDQo+Pj4+DQo+Pj4+IElmIGEg
cGxhbmUgZG9lcyBub3Qgc3VwcG9ydCBjb2xvciBwaXBlbGluZSBvciBhIGRyaXZlciBkb2Vz
bid0IHdhbnQgdG8gc3VwcG9ydCBpdCwgdGhlcmUgaXMgbm8gY29sb3IgcGlwZWxpbmUgYW5k
IG5vIGNvbG9yIG9iamVjdHMuDQo+Pj4NCj4+PiBJIHN1c3BlY3QgdXNpbmcgdGhlIGN1cnNv
ciBwbGFuZSBpcyBnZW5lcmFsbHkgaGlnaGVyIHByaW9yaXR5IGZvciBXYXlsYW5kIGNvbXBv
c2l0b3JzIHRoYW4gdXNpbmcgb3ZlcmxheSBwbGFuZXMsIGJlY2F1c2UgdGhlIGZvcm1lciBp
cyBjcml0aWNhbCBmb3IgYSByZXNwb25zaXZlIHVzZXIgZXhwZXJpZW5jZS4NCj4+Pg0KPj4+
IFRoaXMgcmVxdWlyZXMgdGhhdCB0aGUgYW1kZ3B1IERDIGRyaXZlciBiYWNrcyB0aGUgY3Vy
c29yIHBsYW5lIHdpdGggYSBkZWRpY2F0ZWQgSFcgcGxhbmUgdGhvdWdoIChhcyBpdCdzIGFs
cmVhZHkgZG9pbmcgaW4gc29tZSBjYXNlcyksIHRvIGVpdGhlciBmdWxseSBzdXBwb3J0IGNv
bG9yIHBpcGVsaW5lcyBmb3IgdGhlIGN1cnNvciBwbGFuZSwgb3IgYXQgbGVhc3QgcHJvdmlk
ZSBwcm9wZXIgIm5vIGNvbG9yIHBpcGVsaW5lIiBiZWhhdmlvdXIgZm9yIGl0LiBMZXR0aW5n
IHRoZSBlZmZlY3RpdmUgYmVoYXZpb3VyIGJlIGRldGVybWluZWQgYnkgdGhlIG90aGVyIHBs
YW5lcyB3aGljaCBoYXBwZW4gdG8gYmUgYmVoaW5kIHRoZSBjdXJzb3IgcGxhbmUgaXNuJ3Qg
dXNhYmxlIGZvciBXYXlsYW5kIGNvbXBvc2l0b3JzLg0KPj4gQ3VycmVudCBiZWhhdmlvciBp
cyBqdXN0IGRpc2FibGUgY29sb3JvcCBmb3IgYm90aCBiYWNrZ3JvdW5kIHBsYW5lIGFuZCBj
dXJzb3IgcGxhbmUuDQo+IA0KPiBBcmUgeW91IHNheWluZyB0aGUgY29sb3IgcGlwZWxpbmUg
aXMgaW1wbGljaXRseSBkaXNhYmxlZCBmb3IgYW55IEtNUyBwbGFuZXMgd2hpY2ggaGFwcGVu
IHRvIGJlIG92ZXJsYXBwZWQgYnkgdGhlIGN1cnNvciBwbGFuZT8NCkFjY29yZGluZyB0byB0
aGlzIG1haWwsIEkgdGhpbmsgc28odW5sZXNzIEkgbWlzdG9vayBhYm91dCB0aGUgbWVhbmlu
ZyANCmFnYWluKToNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2Ft
ZC1nZngvMjAyNS1BcHJpbC8xMjIyNTcuaHRtbA0KDQo+IA0KPiBUaGF0IHNvdW5kcyBsaWtl
IGEgbm8gZ28uDQo+IA0KPiANCj4+IEknbSBub3Qgc3VyZSBob3cgbXVjaCBwbGFuZXMgZG9l
cyB0aGUgaGFyZHdhcmUgc3VwcG9ydCwgYnV0IGlmIHRoZXJlIGFyZSB0b28gbGVzcyBwbGFu
ZXMgdG8gdXNlLCBtYXliZSB3ZSBzdGlsbCBuZWVkIHRvIG1ha2UgdXNlIG9mIHRoZSBjdXJz
b3IgYmFja2dyb3VuZCBwbGFuZSBpbiB0aGUgY29tcG9zaXRvci4NCj4gDQo+IElmIHRoZSBI
VyBoYXMgdG9vIGZldyBwbGFuZXMgdG8gYWxsb3cgYm90aCB0aGUgY3Vyc29yICYgb3Zlcmxh
eSBwbGFuZXMgdG8gd29yayBjb3JyZWN0bHkgKHJlZ2FyZGxlc3Mgb2YgdGhlaXIgZGltZW5z
aW9ucyksIHRoZSBkcml2ZXIgc2hvdWxkIG5vdCBhbGxvdyBlbmFibGluZyBib3RoIGtpbmRz
IG9mIHBsYW5lcyBhdCB0aGUgc2FtZSB0aW1lLg0KPiANCj4gDQoNCg==
--------------6Q8m91zMn83NazS2mK0gNNCu
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------6Q8m91zMn83NazS2mK0gNNCu--

--------------qjOtNp7g7Duaa5j6dTqwrXke--

--------------bd16JyiLfY9FUxGt0q4DJG1n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmfsCi8FAwAAAAAACgkQX75KBAfJsRk1
qxAAqSW6i16OpQb+QGZP+nT3c4guxIaG10ZQxA8bx/sCu2iB7KaRcK7HLEt6O3BB8PV7K2hVsfcu
guzZ3jbaTEcHoTAnqFy54NSVUzKDDIRzNq5IRrvAdtDfG6iEHzj6IfZARPJkiBDVZ6uhwtidPHgj
7Ff9FDHW3prSvqceqhD5Fh02s3CuCxRqZsDD+yy4w/OgN+SfShEjHyowC9Ij+Lkxkzphr29P+zai
4G04KYs/O+DrAxVBYYCLSSEhGKMt/2s1sabKXPOgWFRvFmEVgIjDjIC/OMgXa92xa9iB7GTlyedO
UARmSHcm4XotctaHHWKXAeKvwQU4JqXJytrkZXZb1WRV/C25Gs33qiYCEWmcvje9GbhLqaHyxdi5
0Je7prqS1QuiKBlV0Iw/FZ8ybgfG2L88xp6ACcIpS4+uQPJWZ1hP0J/vqZqaVtjOHbX4dMvBGAIW
qTig+FmWVgLs2QfMi96Hfp6I/BJ0nY8s4jFLrKfVIzV9ErqH71gAjZjOppjs82Fp1VKSEqjZXwtn
yLBFHEPrh2gh7BcXsuqxmERORezUzzBEvCMMmmolsXBFCYuqFWD+onEvCc6OcAzjpCVI+Q3Qiv9r
P+fUWpG/K/t9FUjtXdR8eOkNDSDgzxVu5ZT3n2MnUvzPGyLJkgtR7mrOIeVhOMe16BK4RvMVWtII
8A8=
=+5OA
-----END PGP SIGNATURE-----

--------------bd16JyiLfY9FUxGt0q4DJG1n--
