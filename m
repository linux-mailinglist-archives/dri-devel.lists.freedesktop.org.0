Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFL5Oj9skGmoZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 13:36:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346F413BE30
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 13:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFF410E066;
	Sat, 14 Feb 2026 12:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="KSP1iRS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazolkn19010001.outbound.protection.outlook.com [52.103.43.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF5F10E066;
 Sat, 14 Feb 2026 12:36:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrmN+IB3vjkP/SxA6UTB5o/NhNjglkIUDwW7IYUskoqt0RmqYQs3qFpx+xoTxCISBl2BERUMAl7OysU7Kmxck/Ci9bJ7z49PjlqUBnUD0uBCcBJAoHEg7eeztfY9oZ6N0S9AzE4hvcv4bxz3gKq9Y9R91tPEOd9PH22R3C4icrTrkhTGG/AVI4Gyu8TzTeNCt3hTA/bcA320MFcoR0R6wvswpMJFCNRA8mEZQUeXWEQJGT4xe1ZK+rSWkzLdYzDNn770jqsER2QXs1Yi6omp3f0CUJpip/4yKrjXOLeU3bAVd+eyjK18u/R+uovE2GvvuwgPeR4205OklgT6uhoXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHzg27QyDntW/o0qzJi6UjzLCNBNuvG/U4aW+TbSn7s=;
 b=y8zMiFND7afL/hH6x//Kt+LLO3vr85kext4cg8810bLiJ84uVZi60O6JgiLQT9wKtCcCYydqthmVd/hB/dL3uW5MNc93doLAMuU0CLB2mu6Y3yvZQHfacCJgTVxlSaemHzSTGFd53JTuERQ9nPFCqaGUjF6j8uDtHRH9k1qukkzsmVAiC0lXOjFKjzXzJ7aIl/3YTlpNvyOZws3+ORA7tBCl7MrlYE42ZflcmRrEVqbHCjALkHWRkgzgJOowzkSoO/703sOUr1taqhchkJvQxnUU77vctrT4wI8PPse6nnqtsl9JfszIbFCO83mboZ/572ZmXBp08fk8J678ByWtQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHzg27QyDntW/o0qzJi6UjzLCNBNuvG/U4aW+TbSn7s=;
 b=KSP1iRS+NeFtv2V2KKWuilg1Tq1fJOgSrgXnGj6ZMp4AQk5eFSY5PIWoC4pZbd+/KMTIcpWsjDclmw+WDbRyjBNLgpS838kMHZF+zrL+twcKjo9bnN6bTIwu78Ynr4Xq57nKdzNeWxSU+6+DcsBZjGWEC16vE+mwc9L+Y9GnzsycNUrh1UxR8fiR1sPhtMJIxqwQc/q1FI3/4ABS895qlT3pYtyjclxFtGozVdiaDJPmcVBEpf09Q3+8x9RjaIQylQH7Zj61jk66u5D9I7eIsq+Fc21syp4qyMsNn+Hrrl9oHxsugWP6z76WfIIlMINmHR7t5zBlGaiCIaf9wekPZA==
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10) by TY4PR01MB14666.jpnprd01.prod.outlook.com
 (2603:1096:405:20c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Sat, 14 Feb
 2026 12:36:06 +0000
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::de2b:6c81:9bd7:99c2]) by TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::de2b:6c81:9bd7:99c2%6]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 12:36:06 +0000
Message-ID: <TY4PR01MB144324B64219CA34DEFE1AB43986EA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Date: Sat, 14 Feb 2026 20:35:57 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Add "pixel_encoding" DRM connector
 property support for amdgpu
To: Mykhailo Kalashnikov <mihal.kalashnikov@gmail.com>
References: <CA+PMN8Hwsb=kNruwNcctX8LgcVqbUkPi52wQJu7ppu9VKamAyA@mail.gmail.com>
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
In-Reply-To: <CA+PMN8Hwsb=kNruwNcctX8LgcVqbUkPi52wQJu7ppu9VKamAyA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ptRKVKcqmZMTmcRxvGK4vkTm"
X-ClientProxiedBy: TY4PR01CA0100.jpnprd01.prod.outlook.com
 (2603:1096:405:378::6) To TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10)
X-Microsoft-Original-Message-ID: <22db476e-191a-444d-9836-56e4f7b19317@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB14432:EE_|TY4PR01MB14666:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f01647-181e-442d-f9bd-08de6bc59d93
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|5072599009|12121999013|23021999003|15080799012|6092099016|19110799012|8060799015|461199028|8022599003|20055399003|1602099012|3412199025|440099028|4302099013|26104999006|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUpiYS9nbEdWOG9SbGVpc0xOczlWQWxrT3A2VnN4WU9YVGsrU2dXVjlYQVRG?=
 =?utf-8?B?R1BXTWNVeEVDdm56TzBGakM4czRuTkI4WmhpdDQxa3NscmN2OFA1dzhubnRJ?=
 =?utf-8?B?VkZrV1ZSZDVUWmNCSGh3YUs5UXR4dW5EVG9IZWhIUjZRVXVnWWJKZzFYeXZi?=
 =?utf-8?B?aHp3ZzkxeVYxNmpsUTNEZmUranRzN2NSVm1UODBzNlFQUmduQXI2b1pIaEdt?=
 =?utf-8?B?YUd4RC9samZmVVlnLytaa1UwUFhQMVZaL1cwczlneit0L3U1d2ErVERCNXBW?=
 =?utf-8?B?a2tJbzFkV3ZEZ2F4SU85QS9vclJ2Y20xZ0ZaWStwSUpqNHd4N3JxYjlxMml6?=
 =?utf-8?B?aWZxUE5aTHYxNHJPczBlZlVDT2g5VDRtNFFjR0swbzcrczZlTjI0cUsycEQ1?=
 =?utf-8?B?TDN6UTR2SmZrR1J2UkJrdkIwQS9SMURaa3FNSjl3RVNtRVJ0Mk16ZERoZnRn?=
 =?utf-8?B?dkxZQUxkTXBLM2tMQnZSM295cEhOZjZyNVhaS0QwL1hXN2pDWnYvQ3o2QW9k?=
 =?utf-8?B?MHV3dDZCbGRKTXByeWFwUnFPLzNZalM1Tlh3UWkxdG1YVnRYaWpmWWFZTFNS?=
 =?utf-8?B?SDhsR3VheWJxWVVzM09KemJvbU5XSzhxUWhlUDFYLytQN0djazNRUjFleEhr?=
 =?utf-8?B?eWIySEltd2ZoZk9IV3hNaWxTWFBzVjZibG1EcHZKSWlLWUllakw3K3FTL2Zr?=
 =?utf-8?B?dnNyZWJONXlWWlNsVGtBQUN2LzRTOUxuQVMzSGluczlWRHpCWmNCS1VSaDRQ?=
 =?utf-8?B?NVVQYXBQM09NQTFxMmt5NkpHMEdiK1p5NDNIcmZSZmMrK201cVBaeWE1UEc3?=
 =?utf-8?B?dTNtdnBpZmhXQkYyL2dBTis0cXZEVW1xSC9EajRham1PeDcvTXlXS3FBUFB5?=
 =?utf-8?B?SmF4RXI1MDNXTVkxY0ltT0lXUWZIUFJqTUlWMUVPOEI4SlQ1Mnl1TzV0NVJG?=
 =?utf-8?B?R1R4dGc2UkVjSmtrZTRNQ1NoL3V3SndsZnR0VWNWUFV1cUwwV01rVVl4elpl?=
 =?utf-8?B?RXdwS1RlTTl5eE94SzdvWGdKUUQ5TU5RY2hHS1Z3ZHlhSGo0aUFadmRuUUhx?=
 =?utf-8?B?bDc4Z2ZxdlNqOEFZUkYwOVg0Q2RCZGtJcDd3TmhmNUN0UDlyNkJ6N1pvNldj?=
 =?utf-8?B?TEhjMUprR2dGYzNLVmJkaUtHYjdEdkNtdUVLOEpxU1BETXhmMnJZRGE0YXVl?=
 =?utf-8?B?RUpiTTdnZURUUXNkdjBSS2YvSWFwL3h4SXVWR1JiTjFwNmdNRzNmanQwTmJu?=
 =?utf-8?B?YnJwd1Zua3A4OFhENENUWTlvMkIxWnlkcVE5Ui9ZZGpwWXZXRmhvbFZsZmxj?=
 =?utf-8?B?TGlQNUJUZlYyMGZNS2I0L2JZYlJpY21QMjFBc2ZoWS9IdmxZTkNXdkRuQTNq?=
 =?utf-8?B?R0lRdTBRS1RXQXFrOWFmdUIxNzcwRnhaQWVJeGVvcWVncjFuU2Mrdmd4Tmky?=
 =?utf-8?B?d0xmWVNaWVNUVldIYy84ZnFzeTBDZTBrZ1Z2N3BISjkzWmV1Znc3WGYzYVJa?=
 =?utf-8?B?MnNCUTRHSmxWa0FvYzVEUUxEL2pkZ0F3OHRqREpjYXQ4OHUyN1hWanVpQkxQ?=
 =?utf-8?B?NVNQbElCYjFwZGxQN1p4UE5taGQ3eW03UlZCcjRYMjlCVDhhR1hFdENXNmtx?=
 =?utf-8?B?Uy85bGhhS3BjODVwc3kyME5KTm0rMHFtMjBVYkM2ZTFuelhRNzFFdHVMVFVl?=
 =?utf-8?B?ck9OT09NazIyMkhYQTAvQXF0S2ZWdXB2VlNNUSttZCt3L3BZQzJ0alhpdjR5?=
 =?utf-8?B?eWRDREZmaWRoOUhBOUlyVXhZaWpFQmowTUR1RGxyMHN0Wk96Z21CNTI1OXV0?=
 =?utf-8?B?ZmtZaVlxQTRvZHM3ZFVhR29oNlhyaTc3M0RIZ2ZEbjhEUkIvdURIb0xncm94?=
 =?utf-8?B?QkpteVR0cHdqZTNYOGlTbXlSZDVvQURNeGZRRS9IN3Q4cEE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3lkc1BBM0ZkaU8za240aUwzMFYxNldvV1RuYnlweHpGeWg4Wm9SazFDK2FY?=
 =?utf-8?B?czdvSWM3SmxTR0lveUs0citZaitLTmZLblNIZnVWc2d5TnNhYUFuclNrZE5V?=
 =?utf-8?B?SUxEbG1oNllyb1NLa1N1SzhldlFSdmZsbnhDL3JEdjgvRVVHY3ozNk1lTFZa?=
 =?utf-8?B?VVN1d1RiQUZYaGpuVFlqMHdVYmhUM0tMdmE1S1JrQ0ZBaFBDcHM4SjV3dEo3?=
 =?utf-8?B?NCtZNWJYZktWekUxUFdUL1g0MGxicjZ6OU5rNVFEZGFtc3JUbFVheXh2cTIy?=
 =?utf-8?B?aHRUK0dHYkordzlsc3NWNGVzQVE5MGFFcHByNFhzT2h4QXFTUmROOU04OGtB?=
 =?utf-8?B?eDUxRnE1cmNOaG1OMnFMUUpmeUtkM1ordWJhZ0xUSWI5UENodTVkM2N5Z1ZR?=
 =?utf-8?B?U2RZQkNQamUxbEg5cXVTTkNTNW9HVmpGR0huWkRiUmNnRm5ISnlwZTlwbXhl?=
 =?utf-8?B?Zm80WCtKZm9Gc2pjcnltKzhtbEIwQWVGamVGbW1YOUM0c1F0cUtTbEVCUGtp?=
 =?utf-8?B?UlVKRzcyYTZlekU5dmtacVJRL2tJUXRUeGlORk90L2E5SHVIMkd4aUFNOVcy?=
 =?utf-8?B?Rm96RDFoQklISGliditjS2ZZMDFsUGxVeWFiKy83ckllOHY2eC9kOUFjcDhH?=
 =?utf-8?B?QkwveWdUaWJ2MVYyckpsU2xTM3VQN2luWUJnSy9BR0EvWDEwVWoyTm9PL1Jm?=
 =?utf-8?B?Tmo0aXA0cWFjeHNsZS9VWWdxbEtxbDBsb3lvRDlWaXhETE9oY0I4MFh6SGY3?=
 =?utf-8?B?dkNMOHMzOXdNWHZra0ZkeHg1S2EvMkxpajhMQ0JCWWdnZWVYOGpVd2tDME9O?=
 =?utf-8?B?aHJuWjFaOGZBa1ZpdGZ5RUo2YXpyd3RaMFBtcGpTaUJlcGhGblZUbWJVb3hP?=
 =?utf-8?B?b2E4bFNhV1kzSDBDbnNnN05kRzR6bjlDNzd1aXFkRUVUZWdzUFpsQlhNMSs5?=
 =?utf-8?B?Z25zV1hBc2g0NjdKWnNWUUJybzlWM2ROUUViME9mZ2FZN09GWEgvZ2JPNGh0?=
 =?utf-8?B?cnFwV0VRNEsxcVdqbFRzWCtXVXd2QkxGVGFJb3dzaDFrb241V0RHSGNNbmhE?=
 =?utf-8?B?UkF6NiswWXN0SHFzRVNFcWxzeVF5S3V4STV0SnI5QmJGNUhTSHIvV2t1TktF?=
 =?utf-8?B?V01PU0tPaHRhTTdJcVBTVFhIZzVRVGVyaXRUcVEybXVVc3kwOTZWUW9RWjNL?=
 =?utf-8?B?Zk10b0xnbnc1SjFVVjBhc0NSSnBEc29FWi91enZxLzF2dTBFcitmNVhPUW5p?=
 =?utf-8?B?b1dtQ0REeUdlcW1jRDhqaDV2S1BJaFU5Rmw0L2FVa3dJUGFCTXdUdmpmcHNq?=
 =?utf-8?B?endWQWRoemVKWUErWlVTWGNLSGFUN0oxVUFNcFFmOURNQVBZTXAvRjdCQlhL?=
 =?utf-8?B?K1I2Y05SdXdqU2hVREQwb2NTWmJrR254WEV0VEhQM011TnhpeEExRythcW1V?=
 =?utf-8?B?V1M4bnNiSFQrc1JWR1l2aURoQUJiYU5jMjduc2NiREg5ajVpeEpOc2RwTWhr?=
 =?utf-8?B?L1FEUElUM1JiWmJTMkJib2wxVTRLMDdGZmtGZU9oZjFTcVp5bWVZRk1mZGs3?=
 =?utf-8?B?OTV0cktHWFJ4UGEyQ2hFY0FRblVxQnlYWkxDZWxCcjNOWnZKYWt1RDRvc3hO?=
 =?utf-8?B?cVhHcjRJZFMrV3ozR0hGT2RIL09kUTZ4YkRWd1F0WmR6VGlGblJFb1NjNnVZ?=
 =?utf-8?B?MjNaNDdadzE3dWZ5M2dsOVptTCtibXlBY2JHS0VydlIvUE5DUGlGWlpIb0pD?=
 =?utf-8?B?b2I2K1pBLzFrNjNhN1ZscCtvNDdLOUlTMjIwa2JkempvUEZXL25rbXdtcTZD?=
 =?utf-8?B?VkxEdHMveEMzYzlYdFhOL1Fxa2VnVlFGRVVmaDVzVzV3NjhHWWRCdDhxTERt?=
 =?utf-8?B?VWUrMjE3UGJuOVpwQ3JrRHpMUERuSjdIWWNzdGRlSFJjNzNxQlpheUgzZTcv?=
 =?utf-8?Q?i9/N4fabVEnazEMPJw9KXVt61yMXTSGP?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f01647-181e-442d-f9bd-08de6bc59d93
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14432.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 12:36:06.1294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14666
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.21 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[outlook.com,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wiagn233@outlook.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FREEMAIL_FROM(0.00)[outlook.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,TY4PR01MB14432.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 346F413BE30
X-Rspamd-Action: no action

--------------ptRKVKcqmZMTmcRxvGK4vkTm
Content-Type: multipart/mixed; boundary="------------9rByEd14St0MnSpwrZxFn41g";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: Mykhailo Kalashnikov <mihal.kalashnikov@gmail.com>
Cc: wiagn233@outlook.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Message-ID: <22db476e-191a-444d-9836-56e4f7b19317@outlook.com>
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Add "pixel_encoding" DRM connector
 property support for amdgpu
References: <CA+PMN8Hwsb=kNruwNcctX8LgcVqbUkPi52wQJu7ppu9VKamAyA@mail.gmail.com>
In-Reply-To: <CA+PMN8Hwsb=kNruwNcctX8LgcVqbUkPi52wQJu7ppu9VKamAyA@mail.gmail.com>

--------------9rByEd14St0MnSpwrZxFn41g
Content-Type: multipart/mixed; boundary="------------4licdFL0kgazJKkArVOgnXJu"

--------------4licdFL0kgazJKkArVOgnXJu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTXlraGFpbG8sDQoNCk5pY29sYXMgaGFzIHRvb2sgb3ZlciB0aGlzIHNlcmllcywgY2hl
Y2sgdGhpczoNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1y
b2NrY2hpcC9jb3Zlci8yMDI2MDEyMS1jb2xvci1mb3JtYXQtdjctMC1lZjc5MGRhZTc4MGNA
Y29sbGFib3JhLmNvbS8NCg0KQmVzdCByZWdhcmRzLA0KU2hlbmd5dQ0KDQrlnKggMjAyNi8y
LzE0IDE4OjU2LCBNeWtoYWlsbyBLYWxhc2huaWtvdiDlhpnpgZM6DQo+IEhpIFNoZW5neXUs
DQo+IA0KPiBJJ3ZlIGJlZW4gdGVzdGluZyB5b3VyIHBpeGVsX2VuY29kaW5nIHBhdGNoIHNl
cmllcyAodjIpIG9uIGtlcm5lbCA2LjE4LjUNCj4gd2l0aCBhbiBBTUQgUlggOTA3MCBYVCAo
Z2Z4MTIwMS9OYXZpIDQ4KSBhbmQgZm91bmQgdHdvIGJ1Z3Mgd2hlcmUNCj4gUElYRUxfRU5D
T0RJTkdfWUNCQ1I0MjIgaGFuZGxpbmcgaXMgbWlzc2luZy4NCj4gDQo+IEJvdGggZ2V0X2Nv
bm5lY3Rvcl9zdGF0ZV9waXhlbF9lbmNvZGluZygpIGFuZCBkY19waXhlbF9lbmNvZGluZ190
b19kcm1fcHJvcCgpDQo+IGhhbmRsZSBSR0IsIFlDQkNSNDQ0LCBhbmQgWUNCQ1I0MjAgYnV0
IGFyZSBtaXNzaW5nIHRoZSBZQ0JDUjQyMiBjYXNlLg0KPiBUaGlzIGNhdXNlcyBZQ2JDciA0
OjI6MiB0byBuZXZlciBiZSBhcHBsaWVkIOKAlCB0aGUgc3dpdGNoIGZhbGxzIHRocm91Z2gg
dG8NCj4gZGVmYXVsdCwgZ2V0X2Nvbm5lY3Rvcl9zdGF0ZV9waXhlbF9lbmNvZGluZygpIHJl
dHVybnMgZmFsc2UsIGFuZCBhdXRvLXNlbGVjdA0KPiBwaWNrcyBSR0IgaW5zdGVhZC4NCj4g
DQo+IEZpeCAxOiBnZXRfY29ubmVjdG9yX3N0YXRlX3BpeGVsX2VuY29kaW5nKCkgbWlzc2lu
ZyBZQ0JDUjQyMg0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgICBjYXNlIFBJWEVMX0VOQ09ESU5HX1lD
QkNSNDQ0Og0KPiAgICByZXQgPSAoaW5mby0+Y29sb3JfZm9ybWF0cyAmIERSTV9DT0xPUl9G
T1JNQVRfWUNCQ1I0NDQpOw0KPiAgICBicmVhazsNCj4gKyBjYXNlIFBJWEVMX0VOQ09ESU5H
X1lDQkNSNDIyOg0KPiArIHJldCA9IChpbmZvLT5jb2xvcl9mb3JtYXRzICYgRFJNX0NPTE9S
X0ZPUk1BVF9ZQ0JDUjQyMik7DQo+ICsgYnJlYWs7DQo+ICAgIGNhc2UgUElYRUxfRU5DT0RJ
TkdfWUNCQ1I0MjA6DQo+ICAgIHJldCA9IGRybV9tb2RlX2lzXzQyMChpbmZvLCBtb2RlX2lu
KTsNCj4gICAgYnJlYWs7DQo+IA0KPiBGaXggMjogZGNfcGl4ZWxfZW5jb2RpbmdfdG9fZHJt
X3Byb3AoKSBtaXNzaW5nIFlDQkNSNDIyDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgICBjYXNlIFBJWEVMX0VO
Q09ESU5HX1lDQkNSNDQ0Og0KPiAgICBwcm9wdmFsID0gRFJNX0NPTE9SX0ZPUk1BVF9ZQ0JD
UjQ0NDsNCj4gICAgYnJlYWs7DQo+ICsgY2FzZSBQSVhFTF9FTkNPRElOR19ZQ0JDUjQyMjoN
Cj4gKyBwcm9wdmFsID0gRFJNX0NPTE9SX0ZPUk1BVF9ZQ0JDUjQyMjsNCj4gKyBicmVhazsN
Cj4gICAgY2FzZSBQSVhFTF9FTkNPRElOR19ZQ0JDUjQyMDoNCj4gICAgcHJvcHZhbCA9IERS
TV9DT0xPUl9GT1JNQVRfWUNCQ1I0MjA7DQo+ICAgIGJyZWFrOw0KPiANCj4gQm90aCBhcmUg
aW4gZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYy4N
Cj4gDQo+IFRlc3RlZCB3aXRoIGFtZGdwdS5waXhlbF9lbmNvZGluZz1EUC0yOnljYmNyNDIy
IG9uIHRoZSBmb2xsb3dpbmcgc2V0dXA6DQo+IA0KPiAgICBHUFU6ICAgICBBTUQgUlggOTA3
MCBYVCAoZ2Z4MTIwMSAvIE5hdmkgNDgpDQo+ICAgIEtlcm5lbDogIDYuMTguNQ0KPiAgICBL
Vk06ICAgICBURVNtYXJ0IEhLRDQwMi1NMjQgKERQIDEuNCBpbiwgSERNSSAyLjEgb3V0KQ0K
PiAgICBNb25pdG9yOiBEZWxsIEFXMzIyNVFGIChIRE1JIDIuMSkNCj4gICAgTGluazogICAg
R1BVIERQIDEuNCAtPiBLVk0gLT4gSERNSSAyLjEgLT4gTW9uaXRvcg0KPiANCj4gV2l0aG91
dCB0aGVzZSBmaXhlcywgdGhlIG1vZHVsZSBwYXJhbWV0ZXIgaXMgYWNjZXB0ZWQgYnV0IGln
bm9yZWQg4oCUIGRpc3BsYXkNCj4gc3RheXMgaW4gUkdCLiBXaXRoIGJvdGggZml4ZXMsIFlD
YkNyIDQ6MjoyIGlzIGNvcnJlY3RseSBhcHBsaWVkIGFuZA0KPiBjb25maXJtZWQgdmlhIG1v
ZGV0ZXN0IChwaXhlbCBlbmNvZGluZyBwcm9wZXJ0eSB2YWx1ZTogNCkuDQo+IA0KPiBUaGFu
a3MgZm9yIHRoZSBwYXRjaCBzZXJpZXMg4oCUIGl0IGZpbGxzIGFuIGltcG9ydGFudCBnYXAg
Zm9yIHVzZXJzIHdpdGgNCj4gRFAtdG8tSERNSSBLVk0gc2V0dXBzIHdobyBuZWVkIG5vbi1S
R0IgcGl4ZWwgZW5jb2RpbmcuDQo+IA0KPiBSZWdhcmRzLA0KPiBNeWtoYWlsbyBLYWxhc2hu
aWtvdg0KDQo=
--------------4licdFL0kgazJKkArVOgnXJu
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------4licdFL0kgazJKkArVOgnXJu--

--------------9rByEd14St0MnSpwrZxFn41g--

--------------ptRKVKcqmZMTmcRxvGK4vkTm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmmQbC4FAwAAAAAACgkQX75KBAfJsRkN
6xAAiru0HUWPU6GxUmJHiDnRaqbADIgc3z1MsFYO0FdVJ43Y6oBjQydBlar9y4inmDJrlKmgqZr9
rAPTvwrKeUVZUANkCA1kdAJeig0rLk/lH4Ey14/nsZgrZb2310Ju+EYdaxxiKN1NAaFe4Oa6zKT4
tnfzCk0kejygc6b64lRoEzdHJhCZlvY4d1tXxqXWp1NpW/PwZFKzL/qZi44YnOHhVaBTPXZ9IgpM
A/g7CXcJeyM/jss0Vz0GEhdoFCc6je6He7D/sTYHg8X0+Vh2EC3pVWVSb62xA/hUcEdwJmrdb0fg
K7ysvqG54zAmh1ucOdZUun9xQ3VyioeuBvm8WEO+PKDO6F47e7a88JIp4PWcyvT6qj68cq8mz1F5
bsx2sJtRuIxxAfKPsVOyDKbyv4jshShfvaQBwBIX64nMu/nddO0nhEQT+3w1p4x96WleGu5suMN7
8ZQA4a6mhueX1C0d7allr7HFWcWcGjviLHPJdXrUHPzyNPKHNORWxZxznvH0q9BOyNhOsGXkpq7L
NYQW7Q+WZ7e2PptJKgCD0nxfj9r2IIOSsmyR2X21xv5sQVlOe7/+oLDe/jq9yP/CNMFY3SIc+0/N
eXadQUfL37SFWE1x91tF4xjBoRQRqj5GyYtjUvGL8UYNDRgJL+GfCdGyYcim9l1L7nlFMkG6K0Cj
En0=
=ksZX
-----END PGP SIGNATURE-----

--------------ptRKVKcqmZMTmcRxvGK4vkTm--
