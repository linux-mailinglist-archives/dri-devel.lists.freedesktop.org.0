Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FB79664FC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 17:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7052110E0BE;
	Fri, 30 Aug 2024 15:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="fbs0tE9o";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="m+xc8Vrv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F15410E0BE
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 15:06:18 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UCpeOd025514;
 Fri, 30 Aug 2024 16:06:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=zqjGe6azUDp/oDJEhF+InAf/n
 TZ+rnGt0DmhaALEuMo=; b=fbs0tE9odmplhUD4flGb9WYnTWMKwCUl/nhUWasl1
 WdmNOKZP5Ydy2HCqSZAhz3YgbcaZl8bNQEy3yP/fyTdUa3ROZivi9fwzuHCNV5BD
 Bm5+34y06LxXqhWoA/2dP3FQ41qYcRpdq/mCdlG8LQ/cPVPAois8eXmdcbWfEFdW
 60FqEku64WnE2aW/oSA73pzM6n4mav5xYfjS/N1EzE2g8zB3NtbkzD8hXUhV5lAH
 SnIW9Tn8qeQm+qSR2S8n15jMyvwubcEzabdmTTsB+l91lB+r9FQaNwJt6FGWj4pS
 zTRAUAZESUHx4QMa1Tsz03truHKjMbRWeLGHqyJibj8vQ==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4175ss4qgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 30 Aug 2024 16:06:03 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 30 Aug 2024 16:06:03 +0100
Received: from CWXP265CU008.outbound.protection.outlook.com (40.93.68.3) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Fri, 30 Aug 2024 16:06:03 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGAYvhJjbsVyl1DGLiw/ddwwb+DvcozsOyaz/g/MmBBj3Azc/r0Y/lAB8yahn0iv77WxRcGLeIo9eV4DaiBjOMWMxKGtvsOePQqCmS+036QIgIV7+443DDv18NSQO5iPyJeyN1WHtUJelwjShpAmo9Y97jMyKXTFhMKjKHcE2DFpFFbMp0t4GHSuXxP9H2FpqeZBe7fOH1x027cjWtWnzIHN4ZAFOrWHBOC1m/cT1+89qWmM0kI0S5KZvizcOZDqYDfI10REUxgh49asPEZchr6J4QEckH+hvfmaCRB+InQj7RNjlsFqqVQpZJMhPJK6BdGTKlfxOX0fNdxXi2SyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqjGe6azUDp/oDJEhF+InAf/nTZ+rnGt0DmhaALEuMo=;
 b=k7Qa1fcwus3nySZmeq7ygdiLVAizrf84CJSwWNBqkf/4swUTEKrh2Zs6ElscoNbA052u++pJbn0ahxCJv/N4AH3uzxIPldz17ey2buWxzacsIwOUqjrzlUpXUPEBJBgxidP6A/BSL7lvTLRQN4qXSugSPNFDxGvCxlOFZ+u5ouGSXuFJ2+9Ree1oauVv5VUz3X6RXmFnJkdCPxT5DmX7kwkExkPgPJeIwHh0uANqGUHKPt83uym7F+czJshVMpMviPM511qOgBZHOJJaWdXzUrtp6AcfA4mZvYm29PX2LHJpA8ld7dYty4YjOL8bTBFnRaaPxv+xEfVctNJBa1A58A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqjGe6azUDp/oDJEhF+InAf/nTZ+rnGt0DmhaALEuMo=;
 b=m+xc8VrvYPDdBPe3ztWyIvxs3opviMdYeJNJR4rLb4Jm3ZzzdFLpQYzi+V0Vkzu2t1AF2L5dJV74JOeVBPxgLvqgPSiHpbjFrn2BqkiHO1WJumjeC1NGGlT+dfDJN9TBYgjW4P2OFNkb1NoxCJtMVRbqefnBYek8wMCeWV4TBmQ=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO7P265MB7800.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:413::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.20; Fri, 30 Aug 2024 15:06:01 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 15:06:01 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Frank Binns
 <Frank.Binns@imgtec.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND] drm/imagination: Use pvr_vm_context_get()
Thread-Topic: [PATCH RESEND] drm/imagination: Use pvr_vm_context_get()
Thread-Index: AQHa+u4gZ2H0mIcdFk+0LcWjG55H4w==
Date: Fri, 30 Aug 2024 15:06:01 +0000
Message-ID: <8616641d-6005-4b25-bc0a-0b53985a0e08@imgtec.com>
References: <72fa30a5-ddbf-4957-ad5c-5c941747be5c@imgtec.com>
In-Reply-To: <72fa30a5-ddbf-4957-ad5c-5c941747be5c@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO7P265MB7800:EE_
x-ms-office365-filtering-correlation-id: 58e46240-37e6-40b1-0a50-08dcc90542e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d3BZSTB4NXNwSm5XazBPZVRBVCtQSXNmVngwazgwU0hkUVpUejNKR0RxbHlq?=
 =?utf-8?B?R2Z2QThnMlkrZEtPOWRIMTNqR3FRZis1TVQ0enpBYVcyblJVbmFZSThtalJS?=
 =?utf-8?B?Z0Rlb0VxY09BY0xPKzNsUEJRN096R0loS0RFVVlYblBxbTZIOEhuV2RWRHBq?=
 =?utf-8?B?b2pyZHIzRm1HNmVNQVh1MmlaOVZpT281ejZpcm1JSlg3a0h0TkNDbkJyaVJF?=
 =?utf-8?B?WSttKzVhTU53clE4V21jckdzSm05V1lFVjF5L0djVC91ak4yWGowVTFiN0hk?=
 =?utf-8?B?Z3dxUE1nVDMvWXBIZ2Nvc2N4RG5JM1NmOVZNWFp6Rk5ZY056cjhXTXYwejdp?=
 =?utf-8?B?OGlTSXhJaTBPUnVKUDdjWGYyVGtzd0JXUWp0WVVMSTFUVmV5N0pUZnQ5TlRn?=
 =?utf-8?B?MUU5Yld2Ky9HNkFzRzRXZnFmemVMQW9HUWxJMm9vSkluU0ZCWFJiY0J5Zmpz?=
 =?utf-8?B?VVgvdTBHMjgrVHdqKzk0MmQzZk9rNGdKdHRhV2FhVHFNeWw2MEZDcEgrT2xV?=
 =?utf-8?B?TTdmK3FDMWhvZmhUSmJiWUR0SVpOdjR6elVXTkk5K3ZpNkwwZ2kvOGJkRnBr?=
 =?utf-8?B?RkdDWTJqcFo5ejBQSnhMWXZwL2NHVEFTY3RUUUsxUTI1QU5VY2RZYnh2NC9X?=
 =?utf-8?B?OU8wWkRIWVM4WURxblZ5NWY5RFRTaUV5N0tNQWc2VHg1cDg3d0kyQm9tTHNn?=
 =?utf-8?B?UFNnUnVIa3VDVk1GYk1tc09PNVR2STkvL011anBEcmJmNGFiaWM2ZjR4c2xy?=
 =?utf-8?B?OWJKWFZRK2YxUEpJNHpFdzh6Qy95SGhoaUFSV3FsVWlQT0dtaHYvZm5vSFp2?=
 =?utf-8?B?SFMwT0lFclB3Y0Y3UDdEQTBlOGZhMzd1R25OSXB6M0FiQXI5aUFaTXNsMity?=
 =?utf-8?B?TXJ5VmRqdTVKeTdGR0tQaDRiNHRROEdMR1JmYUF0ZlE3bkJRK0RRdDFTYWZm?=
 =?utf-8?B?MkVaZGNDNnpIYjhCendFWWt4eWgvNURSdUJXQmE2OWI0SGNNYTYwTzNKaVgv?=
 =?utf-8?B?cmV5b1RxZ3Nrd2gyUENhWVNoc09UM2VrRzgzakwxWDlyUXRzdUpQWDYwakYy?=
 =?utf-8?B?RGhnTmRJN0ZncUFURkk5dlhoVHprZTF2SExaNG1aY2Zmb1VzaHAyYmk3aXZt?=
 =?utf-8?B?NWlXUFpOMlpmeWNGS2dvT2JnaTZxbE9CakQva2RJWDcwZGpRWHB2emY3bm10?=
 =?utf-8?B?NGhzQkMwR1IxRzYwK1ZTSlBwMDJlOUhLbXB5NE04OFZ1aHMxc2VVamNTT2x1?=
 =?utf-8?B?VzU1RnozRGdzWCtKYlpKSGxpeWxEQlNwanFsYzBYeldVSU5PVGlFSU5PbFdY?=
 =?utf-8?B?a3RYeVFTV1JOc3NHV1NGMUNHZFZjcENuVHJlbmoyWHd1TVdYR0Z1VHAvempW?=
 =?utf-8?B?cnl5TXNPVHNrQlNnb0JRek9HSFpqVGtsSDhCZlFWQ29BaVgzTFhSTzFlK3Qz?=
 =?utf-8?B?dldKNnd2b2dIRFdSSGRIcjdHZ0l5eUFsMGxGMit4aGR0bUdIbk9TM2VvWkFy?=
 =?utf-8?B?MERrV2dOTG0rNUxsY0ZTUXg5WUZFeTVXMEdhWEJyVDFMK2JTUFVhcCtMTGZt?=
 =?utf-8?B?WXhaU3d3Uko3QVAxU0pMKzA3cVdhaVJFVFRDalFtaE02UEZmZ0FDV3ZEcUNr?=
 =?utf-8?B?V2g0TUdMd3BIVS9CcjRpd29PQ3NGQUc2Z1lacGlRdmoyZ0gxc1NnbW5RYmRN?=
 =?utf-8?B?RVM5K2tFa0h6MU1GRGVNbThGWXBrS29ON1Y2ejNsbWpBd0pha1FEZ2doTC9s?=
 =?utf-8?B?YnFCYVVoV0FrdkQxTXgvSzM5NmNiZkEzZG5FaUNQTVpEY0FCV2tXbUNNQXpq?=
 =?utf-8?B?K043YU8rODNCYUtRY01ZT2tUZ1pRMy9Ya3EvU2ZzOXZhY0J6NzcwcThKSGk1?=
 =?utf-8?B?YnJBVXFzN3FIMnlWaml1aC9UOEVpcDdDWGplZHV0VEw2SUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1pETk8zeDZ0OEt5cHZyUEZ3Mm80VklDNHExWW5wdmtoOFFPMHNwZjk2bFFE?=
 =?utf-8?B?ZDAyR2NkR3VHTjEvUlp3TzNpRTFOV2YybDdQQ2E0ZUZsUkJobXRMckJzZCtW?=
 =?utf-8?B?ZHJnRFNrVVFQM2lld3JyYk5jNDFydTFkMGpxN1lrY2M1N01qYkV4bVo5R0FZ?=
 =?utf-8?B?YnhyTHJzSkV1dE9KakNhaEVOQ3p5VkJmeUUvNnNUeWxGU2N4bTNRdnFYY2hS?=
 =?utf-8?B?RjhMdUlIL0ZaalpSc3JEVUFNUWhKbGVPZmdjb05XNmgwTVRWamRzM3NtcUds?=
 =?utf-8?B?OUF5REV5QjlCUHJSbWRaRXZJZi9JTTRFdGdmQi9IOVRjN1A1eitzZEdtVWRM?=
 =?utf-8?B?TUlqRnZhNjVKUCtOdXl5SnJNbGRjSy94THlVRHluM0lOcXIvem9UaElxTGx4?=
 =?utf-8?B?Rm53cWN0Y1Zub1FzaWVsODZuZ3l6YUlsYloxblFIOE1oV1ZrZXFWKzhoSGdj?=
 =?utf-8?B?a1dmSzhwdzV4TDlpRERGdTVOMVIzdjZJRjR0REdmTmZkYkFkS0xGcGxzMWh5?=
 =?utf-8?B?d3BUMk5kR3lrREcza3BKUG02b2ttK0tYYmt4QVBNQ1h3TDV5cUFqbXRyTDZy?=
 =?utf-8?B?bXdMWFdGU2NHWkx3ZGNxS1VRTW4xNUVyM2pJdzhVb0Y2TDJxVlZ1Q0ZpOWpP?=
 =?utf-8?B?QXE2bzdnR0JWbVl2SjdyMkNkQkExNUhkK0hLcUpEb0gxRzJQZnhmRWMzUlVY?=
 =?utf-8?B?ZUovd2dlSmtrbTR4dVZoa1czTytoY2V4V1cyM29qa05XK1ZyTXowTWIxbWhX?=
 =?utf-8?B?ZGdRVUpoeXJtdHVnYW1jRXV3bWNoeXlEVzJQV1R4ejVkT1Q4RzByR0ZDQi9K?=
 =?utf-8?B?SktBejJNejRXUEhsRWhaTGJMcmptUWwwckRDTGdRMkZlenRqSy8yL3Jmd0xI?=
 =?utf-8?B?ZnlzS1IxR2pwZDdISVdyYmlvWUgvN1V4UXYzL0dhOEh5bjcvamNxWWRZempn?=
 =?utf-8?B?VnkydTRwY1ExZzNsZ3BPb1B2OHMxMWRSeWNhRVI5bEg5YUxFQlUzdUJkNWwx?=
 =?utf-8?B?bDBoMi9mTk1UcEJFTzd0emNnc21ySlR6YXlmRlhBR1Z3MVdPVmVFNllVMzJ5?=
 =?utf-8?B?S0U5VytoRjBkcGZDMXMyb1dlT2lVb1hTK2doNFR6MWhqTWxOQ0xPdWVQbTZY?=
 =?utf-8?B?K0s4UW5VejVsYldSK3gvNm5Ob3pyVWdtcFBya2RTNTFxSUlZZzE0YU1DL1g0?=
 =?utf-8?B?V1NINTNvd2lmY2tNS2dOWnJWanVtbSs1U1pKd2tOYnNVSDVieTVUUGxCV3Ba?=
 =?utf-8?B?K2dHL1ZEc09VZUNFNllYeUVETEJqcjlyc1dVYkMrbmx6K2lDc29NZHlYQmVC?=
 =?utf-8?B?N1h6eEhIS2JmMU5XZktsZ1JVVjV6VjFmMTE0cHJDUzJVdjRWWVZZRW1JYU90?=
 =?utf-8?B?NjQ2eGF3VFM5NEFkUThGSmdJcWZWNXdTbDFrUmZVWFhzWmpjY0JxZXZ6SWRa?=
 =?utf-8?B?Yjdubmd0eGE4Slplc0Jma0pBYUhsbzBTZldzYUs1UDBOTEpjRGZpUEdUS09S?=
 =?utf-8?B?elUyS253YzRkZitYcFhOSVl3OHYwRlhoMlRtejJJRlNDdzlXWGhzUlE0RXZK?=
 =?utf-8?B?ejh5b090VmVhN0tIWERwQUNpYmtlUjVKeEllbkJ2c012Z1UwSlVHbVMvRXVL?=
 =?utf-8?B?NU9DZWMwNWFBeVgvNHhNM2RrNC9HSXF3SkhUd2s2c0FlL3RhMUNFcXZWMGdr?=
 =?utf-8?B?N3ovWFgwT2hZWlRRRWlUbXJGVWpzSXhyRmZxaGFoVTNqcTNuVXI1Ti9KZHBh?=
 =?utf-8?B?RjlVRFBjMzg2TVkyN3dHNU16Wno4OC9LaGxsQThWM2hJUTM1TWpTcVBjaWhI?=
 =?utf-8?B?NDVuYUkzS2hDQ0RDWU8zTVc2U1pXem00aDRLa0U2Zjd4d0dEcFIxVlZpZXZZ?=
 =?utf-8?B?NkVKQWdwZUFJVjl2dWlIUlJRcEl5dmhDRXJ1RWdoSDZ2anNJNGVJWXdHS254?=
 =?utf-8?B?S2ZuNGhIcCs4Q29DVEYyRm5TbjVKYU55bHZyQ01tUWNhOUhpc0ttekZHNm5t?=
 =?utf-8?B?MDUzS2VERlEzVlhTd1Byb3d4TGNVU3g2N1BNS01KaTFBMnlnd0t3OWZIV0VJ?=
 =?utf-8?B?MXNhM3BIR0JWRmlhdFZkR0RZcmdZRWlxRGtwZllqMnhiRmUyelgzOVV1QWgv?=
 =?utf-8?B?YkNwRENxZVhzY1RpM0hKc3NpdzNjV1JUb00vVTVMbXNySC85a00wT2d3YWk3?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tLuNc50pe17mvadOgVKCc06G"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e46240-37e6-40b1-0a50-08dcc90542e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 15:06:01.3762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yh90MRASMWlSgXrMfL5fyBtlxVv0ZrmWB/V+M7EeMQNavJ1hhVURXdobP7zPpOG4vYRgehrxzJzvfMLN8r5RRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7800
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=MeE+uI/f c=1 sm=1 tr=0 ts=66d1dfdd cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=1YwCQWLIvWRl5UmCe10A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=lWDfc6OkCw0CPreCeiEA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 0fPqxUqWGGLjWkvvPSQQ_7lwe2nrK-2-
X-Proofpoint-ORIG-GUID: 0fPqxUqWGGLjWkvvPSQQ_7lwe2nrK-2-
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

--------------tLuNc50pe17mvadOgVKCc06G
Content-Type: multipart/mixed; boundary="------------QIwK99b7eejFHUvfC5oZj43Z";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <8616641d-6005-4b25-bc0a-0b53985a0e08@imgtec.com>
Subject: [PATCH RESEND] drm/imagination: Use pvr_vm_context_get()
References: <72fa30a5-ddbf-4957-ad5c-5c941747be5c@imgtec.com>
In-Reply-To: <72fa30a5-ddbf-4957-ad5c-5c941747be5c@imgtec.com>

--------------QIwK99b7eejFHUvfC5oZj43Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I missed this open-coded kref_get() while trying to debug a refcount
bug, so let's use the helper function here to avoid that waste of time
again in the future.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
---
 drivers/gpu/drm/imagination/pvr_vm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagi=
nation/pvr_vm.c
index e59517ba039e..ffd466509d0b 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -636,9 +636,7 @@ pvr_vm_context_lookup(struct pvr_file *pvr_file, u32 =
handle)
=20
 	xa_lock(&pvr_file->vm_ctx_handles);
 	vm_ctx =3D xa_load(&pvr_file->vm_ctx_handles, handle);
-	if (vm_ctx)
-		kref_get(&vm_ctx->ref_count);
-
+	pvr_vm_context_get(vm_ctx);
 	xa_unlock(&pvr_file->vm_ctx_handles);
=20
 	return vm_ctx;
--=20
2.46.0



--------------QIwK99b7eejFHUvfC5oZj43Z--

--------------tLuNc50pe17mvadOgVKCc06G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZtHf2QUDAAAAAAAKCRB5vBnz2d5qsK+6
AQDgzk1/4XFuAbZKZ8a7ahdFfMxZLLtPzC3SPe/WJZXKkgD8DneRfyHKjCK62o/89PGZ50c9jP9I
zv2IsQHZnPr/PAo=
=bD84
-----END PGP SIGNATURE-----

--------------tLuNc50pe17mvadOgVKCc06G--
