Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21761C2B16A
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 11:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C5410E3B0;
	Mon,  3 Nov 2025 10:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Jl1KQFvv";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="ZM+Sshby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578E510E3B0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 10:35:45 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A36eUsw1173874; Mon, 3 Nov 2025 10:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=Nk9wGlHZJE2B9T2/Fr5HllgzT
 4ZSUGLB5d5X4hT4b08=; b=Jl1KQFvvbBfCOjxaguOd4sVX4eX9EDihrBkRSK5eQ
 /u+ycwqDv2vVR+APQsForrvi3Kk+V2uRfq14QahfLPD9VFdKxGZTqFkKTMzf0PXM
 smWoIqelR+R7HB4JWAWBbawCxPS9PxE5hW5cutpBN404uz7xb8CVYoCQyk5CiARp
 XDmKTXcYHDIHMBnv5/oxfuMepyOqWT7gJ54nFuswbtCOBpV7jjiX3Fi7GmBu2XaY
 DJUnTniRzEuzRodx+sr+Zh0NJTnn/x7wWWGDroC5536bZOdllT3ihpyvIllD9iFx
 wZRK3kBGdyzwJwVLJm9qsmLN0rBn6FAVUBicptrW+CBDw==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021143.outbound.protection.outlook.com [52.101.100.143])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4a5b5w9cfc-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 03 Nov 2025 10:35:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFxc7OH8FLJ1QHR42uY+9NwBTs/cCam1X6XlwwIUk0nDXcJOY/yFgKXTXs3YWFSvzBoKKy8Ap/6xdoVhzNxTd/FUjhx/6pCHsovDgoAj3eBwwXUgoHYBCNkVKDThl1Xkd4WGT361mnKbkAdqxFNjxCzwc9UTgEfK04rwOju/hy2q2dEL83ffxqwPhppoBVQYi/HfPMUc5FKvuXp9uJE9L31j0r+6gLBQ7VWSAzeoNY8raAP58GsK+WaxY9Gg2bgM5QmSZjKMwPNs8ijOJRRiCkFka/D1piO6NUUHqXyV19hmmHZXT91LETCACKT9/VgMJ+60Ja8rhfwbjRBcPIqzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nk9wGlHZJE2B9T2/Fr5HllgzT4ZSUGLB5d5X4hT4b08=;
 b=HhcOeq1WKZzU2O6I4SX2kNfxUFntzo83+5xUn7BN7hSjwGj22cButpPiZran8wkqac4ZzKoL7FPxv+cskAe3WXhX2Y6HHAa/LyIfepwcPGIqe5HV93E/5pfcP065uSceQU6SvPPfrlhp0MfPm1Hw8FdYL8hAd0bRqQfYTbLtUmnQEeG7gnmmzG20SEBzDCeqGdU0IYaqfZiVUqtCHc31nznEoCI+jR8QYonAkP7rs6Z8JRRln+FlAgkSYqrSL7mstaJ0J0LMtRFg4p9XQGmDuSPNWvOp7AyKxOJ5c1qbjpOPLv6TyssxN9JH5AQbcwKvp72N+6GQ3pwQ6Lti94R6FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk9wGlHZJE2B9T2/Fr5HllgzT4ZSUGLB5d5X4hT4b08=;
 b=ZM+Sshbyp7S0vmysK41sJ7GsWjackYh25SZAdn4jSFj5npEdZkHZ0xf+jjI8c2vayNTJslJU9wjRvWBypw+PS3El4UtFLdqbSf1c8WBxogYiGkcUqrU0t6bjV0u66kdD3vccH8jJLMI851CkKk3c4Z14wLjz4mYOdsAzS16nAVc=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWXP265MB2406.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:80::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Mon, 3 Nov 2025 10:35:26 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 10:35:26 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Michal Wilczynski
 <m.wilczynski@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/imagination: Optionally depend on POWER_SEQUENCING
Thread-Topic: [PATCH] drm/imagination: Optionally depend on POWER_SEQUENCING
Thread-Index: AQHcPQHBNannTrWgpUC00q5RhtPglLTg4R2A
Date: Mon, 3 Nov 2025 10:35:26 +0000
Message-ID: <cd25db46-12cb-4ad1-a1be-02dd4c93c654@imgtec.com>
References: <20251014-pwrseq-dep-v1-1-49aabd9d8fa1@imgtec.com>
In-Reply-To: <20251014-pwrseq-dep-v1-1-49aabd9d8fa1@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWXP265MB2406:EE_
x-ms-office365-filtering-correlation-id: 4c3fd0c4-c904-4368-ce1a-08de1ac4b3ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|4053099003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?amxvN1RkcUEvR2N2aVFLQ0RnYXQ5Y1pGVFJ2TkhMc1VVcXUxQW55b29zeWtS?=
 =?utf-8?B?eittU3JCNTArTnNEcTNDcE41RjFYZWZJWkpMQjVjVXBrQU0vdHl4NjhHNmVR?=
 =?utf-8?B?c0hON2RGWm9IUEptMTZrb0tZNDlpd0dTZEM2TThOaGlyQlVHdS9XMHJsazlw?=
 =?utf-8?B?UG8vVWRjNmlBc2t6bW9SMlZOTlVnR2MrZVgvWVcrUTB2bkx5N1k0Wm1zN0pY?=
 =?utf-8?B?dnNORTh2Z3YzQ2lYWnRiN0dKbDBIVTZ5QXBTalpyYmlwVFVKUy9vamxaRTZa?=
 =?utf-8?B?RkFZUThYRS9rbjUzNUo0UUluSW8xd3k4SmVjMGRKRlB4bVA1OThaSC9sd2FK?=
 =?utf-8?B?QUQycEcvZjU2Q0E2U29kN3Q1UFJwUXBKYUU1a3dsRnRkU2pBKzVhQmZGZDh6?=
 =?utf-8?B?MTNJK3BoVlI3NEpMWGJ1b3hNM3RoOFd0ZTNRNm9VZUwxamVsVy9UUDJDeExM?=
 =?utf-8?B?eUVzRmMvbjZVa2FoT2VyM2x2US9GSG1XdDNtaFg1cDZjN1dnSkpBVVcrY1U5?=
 =?utf-8?B?WnBQS09UMFBhTHlMSUVPaW1tK1R3L1M4MDE1ODJVOVdIZll1S2hDamJyVmJR?=
 =?utf-8?B?OEJlNTUxUnFUbVdkSW4yU0tKTnhjbm41OGVCa05uRWtPLzdiL3hybjY4MmVo?=
 =?utf-8?B?U25sYmFhNkdXVzdCTitzcnlrSkNKZ1p6d2xaQnNQVTFWdjRiUkR4SkhzV3Bs?=
 =?utf-8?B?bnhKVTh1THJNUHpxTFM4MDZ2cW1YZUpLZkdZWTVBbUVCNktGMDNtNmdPOUlU?=
 =?utf-8?B?R0xIVkFyaUxCYVZ5M1BHYjFSTHgrbFNBclM5RzUram80a0RPWGNuTHh5OHl0?=
 =?utf-8?B?Y0g3SXJ3eUJyczNPNEFxRkViT0VxUlgvbjA3bENMK0c0YWlBbFJWZXAwTGpk?=
 =?utf-8?B?cW5neVgzZi9BTjArVFZBbHVtVTIwRHYwOVIzY2JObHlEYklVNEt2dGl4cUhO?=
 =?utf-8?B?R2oyZXpKd3JIY1Z4UzBoZFN6UFFLL21TYjUrRlJDRjl5b0ptZmlvcjlDbVU5?=
 =?utf-8?B?VVc2ZzlETk95V3h5RXdEYm4yNEZEeThUdG1KK3kva3Z6OHlXSTlERTBZbWp3?=
 =?utf-8?B?ZVBIRnNvNG1CTklGS00wYjROakVWK0Jya2dTQngweDh4cHQ5UjBPcDlsbW9O?=
 =?utf-8?B?dWhwN3N5VXFidVUySmVOSjM4NmlIUHhoMi9tSGxCSjcvV0JQc01nSkhwTm5M?=
 =?utf-8?B?cDdFaUtjektyS0xVQWpvYkM1WFc5Slk3cU9SU0xnZmJTM21MTXdIUld2czkz?=
 =?utf-8?B?aXJUTXMwNmM2V3pPMmkzWGZtZEhBL3VSZW5aa3VuSnpXZVlFRzZ5eFlVQnhS?=
 =?utf-8?B?djVqTkl4dk1QclkvSUJPYktNVndQNlFXR3NXN1Y0Y0J1MmJXa0ZjQldsZ01O?=
 =?utf-8?B?NDFRbnczdUJNT0Q4TlRFcS8vVHhyU1haNzNKSENhN05nNTBBa3kwVFh3L1ZN?=
 =?utf-8?B?ZE5FYUJ5aDFWaUNFTmtvZ0JZK3F6d2F3Q1JocnJJbGJkQXJWWTFLaTB2dUhK?=
 =?utf-8?B?OXJBZ3Era2t5clRURGdZQm5XU09sWXZtajVYbnFWV3BWL0RCZEZ2bmpTRWxk?=
 =?utf-8?B?a1dLaEdpb1puWFZJdUdrVXVxRjZsMkpVNUZveWpsaUx6TldSWUkyaW9aOGRR?=
 =?utf-8?B?SHp2bHFXWVR0YWd6VmZzVDE5WGx1NmJkcDdQZVVMTGh0dCsrdU5xMWVrM21V?=
 =?utf-8?B?d3FPYkRuNlhBbVpJRkNlMmxZUHBtRERWRERab3VnMTNpdmhNS0s3Mlg5WHRj?=
 =?utf-8?B?dEY3dUlWQTJIZ1dFSHRHVGd5U2NmSzJrQzJwZVI5S05LV2c2SUdOUlJsMHBa?=
 =?utf-8?B?TXd3cENhRTlxbU9YSGxDSXdWL1RFd3F3VHd4SzloTnlpK05iaHJNc1BiQk5z?=
 =?utf-8?B?WVRRYUs4YUxySGtyWVFjR0pqUmRSOEJTTlBtTCtTcjlqeitEQ0ZnUWVFUmFK?=
 =?utf-8?B?SnRJRmJhOHNzbXhhb0JRQ3FqNThUcmMybDg3aHp0S1JJMUQ3eXJEMmFaT1pZ?=
 =?utf-8?B?VHdVaitJazVjSUhDWnpzSER2YjRsNlRrYkRFZVVaR3dFUXNmM1doRmtMV2xr?=
 =?utf-8?B?Z0t1Q1QyYkVzcFVmeVV2U2FNblY1dG9abTYxdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(4053099003)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bW1hNHV3QmNTby9UVXFuRzJ6MU5Pc0FwQnd3RjZvNXYwbXZqMVVISEhWQ3Ay?=
 =?utf-8?B?eGo1MVR2REt6SXdPMXR0YkI3MWduVTJGcmRNWjZiSmVmNTVuOXBhU2U0eTZa?=
 =?utf-8?B?V2VHVktTZElQaWtWUXZrNDdBd3E1eW0xcUx1T2dPNGhOYUdOQXRGMDlDSUVv?=
 =?utf-8?B?S2x3aFIyK2xXOUZ5aXJENlloa1gwL2NtUHBlR2s2cWdkUTd2MEVKSlloakhp?=
 =?utf-8?B?VUJMaStuZHZJb3dlOEt4QkVwOUd1RmNkcWpIeGdFUjhKeXVpQ2ZCMGY5dFJU?=
 =?utf-8?B?RW1LMC9oNlpvTlZBYW91YVlCYkRzVUMzVXBWT0hQcXhXT2dzbGpDRUhjd2R0?=
 =?utf-8?B?S1NJWGt1UllHdXRKbzMxaTJtbXIrc0JFUmljS2hhS0VMcEhqVTJZdG5PRnc1?=
 =?utf-8?B?cC83dkpkL3RnVmR0Ym1kTDZ1VEp0T2IxNkhURW5JT2pqM1REUktoNHgxVjJz?=
 =?utf-8?B?aHl2UEJuSnUwZlFyb0pwcWpSR256dHlKUndyV3BTQ1BzcEJMUlVDdEJzdkFI?=
 =?utf-8?B?ZzBrTGVnN3BVbnB3Sk94Skw3cFU5aCtUM0JjQzROakxTME9NK2p5NWE0YTFT?=
 =?utf-8?B?dGhKbzNGVXY4S2lmY0xMTU5yTldJVXhKajZSUTdUOTNFMG1xTi9hTzc1NGJG?=
 =?utf-8?B?NG15bUN6YVJwc293cHVES3dhSVh6Ym14UWExa0NsOXI3T2xwK2gzY3dNY1g2?=
 =?utf-8?B?UWZoUXVtN3NNSnJWRGt3cm1ZUjQ3SkVvRDU2MU1tR0p0b3ZCNTZYQzI1WVdQ?=
 =?utf-8?B?eGhRb2JqUS83dE81eHRBOHNUTURnKzJUM3VxNXIvUXhQaEN6bE5qL2IrTzB2?=
 =?utf-8?B?MUphRXh6a2Z6dUs1ZmdWSTZrZUJybERJMmFCYjFwYVFOcVZOcjZmT0lxakto?=
 =?utf-8?B?YXp5Mi9ka01zTEN5M1ZVRWJETEc5MFBVaUV1TFBWdE9FbHJBeWxTRTNLSlZL?=
 =?utf-8?B?NDhBOFdqak1HdDV2amhLaG81NDNHT0NMWGVmOXIybXVPd05hbEM5MTMxRG94?=
 =?utf-8?B?NXMyTy9nbTliN1N6Zi9kYXBlMGo0dnJ2NEVnNHh2Z09jQ0NOdG9PL1pYaTVO?=
 =?utf-8?B?VlhrNFdZRkVmd0tYOWI1NldPRDJiYWVubENKSmFoc2l2QzA5Vlg5eHd4WHFi?=
 =?utf-8?B?VjZJTmkwWDVyUllJd2xscFdLUVpCZUFEUjU3dC9sdVkvd2x1Tm1LLzNacmk0?=
 =?utf-8?B?UWJPTjJ1MUdMQTJTU01rR2RTT1ZVcFM4TUpuM3VJeVdCb25VUlRLb0FGWGZu?=
 =?utf-8?B?Q1I3ZDJxYmpiMHhSZVFzSjNjcFgxTTFaeW16SUl6ZGRzdFl4dGxmbU9uMXdW?=
 =?utf-8?B?U1B0QXVDblYrU0hRYmZVZk00d1VVMVF5RFViUVBzOFFpYXFialVSM0F4VTJo?=
 =?utf-8?B?a2Y4NGw5ejB1by9CZ3pCNXl2OGtUV05GSjZZZ1ViYk1jRFFzbCtHQ2kwTDZx?=
 =?utf-8?B?MHhpOGdoOHRuTjhRU2IxZkdRaFRFanBoc2VCQzFOYUFJVXV0WXJkUUszTkRV?=
 =?utf-8?B?MFJmWXpVWko0d0FZR1lIWmk3Z3daVVZrNE9ZV09sUkw2cWluSWs3NmxBNW1B?=
 =?utf-8?B?V1p5RGU1OXhXME9VNm9uTC92VnByU0xvRE5wUDlQelhVU011andsWXFHVnZy?=
 =?utf-8?B?bVlvbDh6NG9oYlUxejZGMk5JbEt4ZDAyenBFMEFSd2VqSWJDS1FCaDI1WWk5?=
 =?utf-8?B?MGZkeG1MV0Rzazc1Nm9UYzhuU1RRY3pZdW5iRHR0USt2RXY5R25iVjdlWEVN?=
 =?utf-8?B?K2ZnV21TZzhiS3RDYXJqR0JsUE8wdDJ4Z0pKbUtlams3OU51M0lRdzhxS3FW?=
 =?utf-8?B?RnBmZ25pV0NocmRjRTMydkwxU2R1ajg5M0pReFlWRHNRWjFGMFpCMUZSZ05C?=
 =?utf-8?B?OCtCTEFqZ2dDYzlwYUlwS0tMRjYrNEg1M3c1U0FLS1Awdi9KL08wK2R5M3Bo?=
 =?utf-8?B?U3VpWjQ0TlJCQnF5QS9VVkw4K2xONmp1RFhzbFB5aGlqWXN4YitBSWdxaG8v?=
 =?utf-8?B?aUdRVXMzN2RpdkxEcHVUWVMvbmNERmo0VThiWSticDhpdXk4S1Nva0NpY3ZS?=
 =?utf-8?B?c3IvbFFkVy9VK0ZCMm5pVXlmemxUUGdSRytQWTN5QUJSOWplUUZoblAxM1R2?=
 =?utf-8?B?azV5eFNFMENuVWJRNHplOUttSjFsdU93L3g3WTJhUGxHZkpkbmJpcXlwbkw4?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eQas7xnSr9ECb2kq8q9B513t"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3fd0c4-c904-4368-ce1a-08de1ac4b3ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 10:35:26.3446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kQyBz0BMxpEJ8pLMrjcA7Mrjw+w6m/7Vikpd/EBc6cicoP/grvlA3lr4F5rHIM4mV1RRqPKhpZjL41TyePRE6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2406
X-Authority-Analysis: v=2.4 cv=KrdAGGWN c=1 sm=1 tr=0 ts=69088571 cx=c_pps
 a=ryaCr3KHpNWBLMFLk+OkCQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=QyXUC8HyAAAA:8 a=dkdM1tVOqM7zQlyInTkA:9 a=QEXdDO2ut3YA:10
 a=N7kpFRcB8gLzMI3ZfZYA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: OZfVGGEdwvljljUaolr9k25MKZpD6mZd
X-Proofpoint-ORIG-GUID: OZfVGGEdwvljljUaolr9k25MKZpD6mZd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA5NiBTYWx0ZWRfX7R+v6wQazyJp
 rtMryw5y9lIPHZHLwC4zGKiWR15gur4D5UchhScyG6nYJ1EY7djpD3VYG2V7wtNWT80GoyxcAyT
 EN8QK4SyJ07B9M40/P3tNHbxhBhB4dzBCGa8RmcDr1rHBywLbVrGlJOFp9nO5YsI4OPoahWfPl4
 mn8GF5AiAluAMMbLpiymJ0+IZUVW+ixsNVP3UnsK2hbLXmMTkn2nr3FOFb78rA1dcCLesuamLjL
 Fyy6GY5kRk2vorWwsT7SqXky/uOPujhXZYij4FKAgN4rO5FSFKv9Mb8/RpRQ4E8rcNVnPWHh718
 iAqPxMBwiAXFU6gW+L9skjyVpwiuU/k82b99x8I5ATISUfff7K8T120kWnEvYFGMhPR7i4hg6nk
 o+ZozKTvMF7r5GN7cgNppMsl5RwBgQ==
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

--------------eQas7xnSr9ECb2kq8q9B513t
Content-Type: multipart/mixed; boundary="------------Np8WVorOVpwn6R0cXaAv5er0";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, kernel test robot <lkp@intel.com>
Message-ID: <cd25db46-12cb-4ad1-a1be-02dd4c93c654@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Optionally depend on POWER_SEQUENCING
References: <20251014-pwrseq-dep-v1-1-49aabd9d8fa1@imgtec.com>
In-Reply-To: <20251014-pwrseq-dep-v1-1-49aabd9d8fa1@imgtec.com>

--------------Np8WVorOVpwn6R0cXaAv5er0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14/10/2025 12:57, Matt Coster wrote:
> When the change using pwrseq was added, I nixed the dependency on
> POWER_SEQUENCING since we didn't want it pulled in on platforms where
> it's not needed [1]. I hadn't, however, considered the link-time
> implications of this for configs with POWER_SEQUENCING=3Dm.
>=20
> [1]: https://lore.kernel.org/r/a265a20e-8908-40d8-b4e0-2c8b8f773742@img=
tec.com/
>=20
> Fixes: e38e8391f30b ("drm/imagination: Use pwrseq for TH1520 GPU power =
management")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510111806.CMulNMKW-lkp=
@intel.com/

There's been another automated report of the same bug since this patch
went out, so adding:

Closes: https://lore.kernel.org/oe-kbuild-all/202511011739.SONHjSfR-lkp@i=
ntel.com/

Cheers,
Matt

> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
>  drivers/gpu/drm/imagination/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imag=
ination/Kconfig
> index 3bfa2ac212dc..7e7ffb9c2257 100644
> --- a/drivers/gpu/drm/imagination/Kconfig
> +++ b/drivers/gpu/drm/imagination/Kconfig
> @@ -6,6 +6,7 @@ config DRM_POWERVR
>         depends on ARM64
>         depends on DRM
>         depends on PM
> +       depends on POWER_SEQUENCING || !POWER_SEQUENCING
>         select DRM_EXEC
>         select DRM_GEM_SHMEM_HELPER
>         select DRM_SCHED
>=20
> ---
> base-commit: db74b04edce1bc86b9a5acc724c7ca06f427ab60
> change-id: 20251013-pwrseq-dep-0c158ad8029c
>=20

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------Np8WVorOVpwn6R0cXaAv5er0--

--------------eQas7xnSr9ECb2kq8q9B513t
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaQiFbQUDAAAAAAAKCRB5vBnz2d5qsCJ9
AP9x0hp+dcWIJP1SQ/ApoJ/O+qxPVY5sbBeomsDH5hhARQEA4cZGTm4w5NUMwOzst81JG/UhU/ii
w+T2IzVVsJ57swE=
=FJ6S
-----END PGP SIGNATURE-----

--------------eQas7xnSr9ECb2kq8q9B513t--
