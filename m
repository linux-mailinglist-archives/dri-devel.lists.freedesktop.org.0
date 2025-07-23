Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F448B0EEB8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 11:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A5310E149;
	Wed, 23 Jul 2025 09:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="iG+3WP+a";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="WNkC47qg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E5110E139
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 09:46:14 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id
 56N72iTI3363460; Wed, 23 Jul 2025 10:45:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=hWQurCFOwswlVtH95m4vdbuua
 gjCjMt/pwEVDGQ+Oi0=; b=iG+3WP+aBlUfz18JvxjiL4L6e3NstpMClkaBhqla3
 9u+vIjd2VcU2804vmFHQVYhkrAbTP7L+ivQG+HE1keRhAZwOIfTZHWtiOjw7vC+1
 qR6zOG8EV+QDWB8o0laN//0rICmXTIGz6t8mzom/isMICBZdLjXU1T+zfdzwprA1
 CZWCbc8Js5ixZNCROmq/tV6TTG7g0IaLBQXZNPKl3yxjuhU+PeDECkd7oV48pP7R
 7JpQtMyhe2esYMV1f6OH+tPDrzOaxxxoLFoFZGP6gRrsAFOHebB0PW6dyedj/VVc
 dwyARH9jm1zKR+QibhEg4lYLf2YOMTjyJBg2+aaj2klXA==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021140.outbound.protection.outlook.com [52.101.100.140])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 482jw50gkj-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 10:45:45 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELGaRqo715k5jgBE/eJJyWgUyy4NKwWSISEmagcZgXVt48wBwHI6aulTP2Ie+bZmsHjv3pUK7QAkowTKBTQSIj8SiGy1mw91eToPX7EnshjyZsb4iTV3WYkWom7slTCXB0MhODuxuUOgPM5A+1onhbEv11yuHFpsh1TmWdWhv+Q811wzk6FuCdFs45k76PC9463Y6egM+wTJn9zBcqspeBLDeRli+hkCogFcpUbSAAfXwp+aG0oGJQ0FN7jrX26MK7sv0RDlC6iT+SzV7eekZXfgg88bZTwwMP3wqjuSwQnvL9oPbjhkRmQnIaLCaYPnYaxVI1xvtxtSk1ydArsT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWQurCFOwswlVtH95m4vdbuuagjCjMt/pwEVDGQ+Oi0=;
 b=JQYOztTYsH1GepaJ/sSgtwdADGTzDHeOjtd2JownyBvBDg+K0xYOjeZhAH6Jr0axtvkr7IlW+cvMKpDGHWIUhYuWr3LzMg89x0BUT+1l3OxN0CByxNgwYz4GGBrW6h6C7cTB7EhXmJkYn6o5JTMZvZMzS5K3jyT0gQQc82+7b+94nTY/30CGfMle1NMqMeN1A/6WZhJWH8zcsGhRG/jRx8zgW0Ff7DeYpH8mxw3Z4NgjNSKuIdpPYF8/NiIcbcbfJinGEsZV4tA4P58WXe0fUcR9fMbGdCe8boCLLYWtCG9UEWDc41d8ImVFds29ok+7s7JB7CbtllTLmNCyN0uP6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWQurCFOwswlVtH95m4vdbuuagjCjMt/pwEVDGQ+Oi0=;
 b=WNkC47qgMs4UwqH7fPCGzxt+Pqlfppvi8ZsUp/2cXg2MFnYT7vGygu63CZY/WZ+67z+vFmS5Gb9Ujf0iyOp83I5qTLuq7QlDT2n73wxwD0XFZHjdZSi7cQclyC56XK892DevykWFu5+7EVyrYyYyAPNzPTnixZ0mMyZh74o3KHE=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB2777.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13e::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Wed, 23 Jul 2025 09:45:43 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 09:45:43 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
CC: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
Thread-Topic: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
Thread-Index: AQHb5d9F1EaSROGCxkS8VT4CcJNvq7Q/oV0A
Date: Wed, 23 Jul 2025 09:45:42 +0000
Message-ID: <f25c1e7f-bef2-47b1-8fa8-14c9c51087a8@imgtec.com>
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114436eucas1p1ab8455b32937a472f5f656086e38f428@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>
 <9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
 <d154d2d0-3d59-4176-a8fb-3cb754cf2734@samsung.com>
 <e1a3d854-93bc-4771-9b8e-1639ca57b687@kernel.org>
 <d12fd4fb-0adb-40c4-8a0a-c685cd6327b3@samsung.com>
 <27068fd3-92b5-402b-9f3c-fd786db56668@kernel.org>
In-Reply-To: <27068fd3-92b5-402b-9f3c-fd786db56668@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB2777:EE_
x-ms-office365-filtering-correlation-id: aae5b3f6-2a7e-40eb-507c-08ddc9cdb0da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cEU1Q3lIWTFRaEY3MjMrdlBHb1pJTDFYeFFFRUFyVHRINXNqcVU5U3BjeTk5?=
 =?utf-8?B?QkpBdHo0V285ektjV2sySWsxNmxOS1VMakptbVQ4TmhDRlk0NGRuOFFnSmZV?=
 =?utf-8?B?ZnBoODFpZEhvWm5ETVhUUzRTV0lmdVYyQlFQR2t1Mkwwbk1UcnBuSjEyWkFY?=
 =?utf-8?B?SmQwYUF6NkZrajVydXdYbUh1RjVHQjVZK1lKL1cyeTlEaklJdFdiY0NuTFBw?=
 =?utf-8?B?OXZsUXZrZG9VQmY4NitxSjJDTzZGekJiVjR3K1Q0VEVBYmtVN0N6VTQ5MnVa?=
 =?utf-8?B?RUR5cUxVMFJWZWNuWlJWMm13a241N2tqdmNVZlJhWnUzVlVqUVgwa1VKZHNQ?=
 =?utf-8?B?S0hrNWNqYnhSVUtjMTl5dHlXaHcvVkVwNFprSmcrM3dyU3grMzNiUEJSdmJx?=
 =?utf-8?B?c0o4Ky9hakFCb2tFakU5N2l4cGdDQzg5T2lDeFJYa1kraTV5bFlTL0lXU3Y0?=
 =?utf-8?B?NElVTkRGU0w2V1RXZ0dIdzl0WmJNNDdoK2lsaVlUci9UdjV3LzdqSDVHK0tw?=
 =?utf-8?B?dXIvMUpEK3N5V0RVWkIzY1lQREVuSHZwVnVIR2NnWjcwSjJsWDRMSHpNQm81?=
 =?utf-8?B?RjVsclFXT2xPZHZ6TCtVV0lnc1hzSmNVVmN3L2VNblp1Q3hja0xPYzZ3b2N4?=
 =?utf-8?B?Mng0aHNsZGljR2N4Q1VkU2tCN21RNUtTSmhpZzhpNm1pK0RZdGlYZktqREE3?=
 =?utf-8?B?SGtMZkFMMWZhR2FMWmlwbGlOYkY0ZExrK2dDMWR3R2lRVzZIV3dTM1Nlbk9j?=
 =?utf-8?B?YWNLRTc2bDg3RjlDK0FDT1lycUtITTBWamNFQlhVYXVSNVpRQm0vRTFDdDhh?=
 =?utf-8?B?RzBXK2NUSWJPU0J5MEoxd05GUldVWHQ2Q29KT21VWUwzN0NXY3lFVkc5Sjlx?=
 =?utf-8?B?Uk5tTGlya0JHNm8vTnV3cTk0TUp5dFkybzkzSVdUa2tTQ0Q0QkZTN0pERXVO?=
 =?utf-8?B?aWVNaE5remxPUHdUN3g0bDd6bko3TXlUOW55SHRKK0Z4eithYzNHUi9QcUI5?=
 =?utf-8?B?TkdRZzVKUlp1Y0ZpVVZ2ajZRUGZHVTlxWDdCRUZ1Uy84OUxKVjV1V3FKMjFQ?=
 =?utf-8?B?eFBCRk56UEp6SytReTBGNWpwVGd0QURxR2k2ajErYjNBK0hvVmhKYnNNY2Ja?=
 =?utf-8?B?VUhsVzdlZVBYSFJ0OWMyQ3BYMG42MUNPTjBmamcwUlc3NkJCL2poK3d1S1hU?=
 =?utf-8?B?WVlOdmQ4SktZdHYyYVFXWktMeVlJQk9kY2hDUEN2RFRnZjVZYUNaSzVxYnNC?=
 =?utf-8?B?bnVWT0V6UXhsOGFnMFJPTGhhQ0h6Z2xKMWpocWFkNjdJMzQ4ZkVWZHNGa2NZ?=
 =?utf-8?B?V1hGdy9DTmVYTG9OM0c5MUl3RCs1ZWtRRmVUcjNGaGdkdkhDOTMwQ0ltcDZj?=
 =?utf-8?B?a3liaVFZQU5VS2ljV2xONHRVd2ZZLzlzb1NZKzV2SkZEWHBaakp5SGRxWmh6?=
 =?utf-8?B?RS8zQlUzLzRnTlhaREU0RldMK3B0N3l4SG9VUlcyU284QjVkaG1TWW4zUnVp?=
 =?utf-8?B?aFZoOEp2NEtGTFpHSWV5VWVlTzJvbmJQQURocGJLSXJnZU9OWmlMRUQxeHJl?=
 =?utf-8?B?SWhTd3FXQXJPcWtrUWFYWkE0S0w5d25UakoyNVVzc1plT0QxYlB1RUFjSVVC?=
 =?utf-8?B?TEFpRk1UZ2NIS1dlUnhBY2VQRzBiOWg3T081enRVMGxOMFBvOE10aGFNbUhD?=
 =?utf-8?B?dWphV0RiSVluM20rMGl2WXlwbEVDZDBsSm1qd1psSGozRGduZm42MlYwNUlW?=
 =?utf-8?B?OHFaOGRFTlMvWStuWng0NXA3cm04NHdWdUVSVTZjb1E1eVRhMEdPZjVNV0VJ?=
 =?utf-8?B?aXpta25kbDU5NkdBcnIvV2FGMlA2dkY5M0V2K0lmSXU3aFkxY0ZFdFhoTUZR?=
 =?utf-8?B?WHZwVkVhMEVzQWdxaTc0K3VPMXQrb0R6TVpYYzlhcTJ5clVodFNjUG5DcDA5?=
 =?utf-8?B?bnZ1dUltTFJVMXFwYXF6TDAzc1hrbkdqN1V0K3N6U0R4RGJ3NlhWNWo3MXhz?=
 =?utf-8?Q?FZOlhLQ+vY2I1xg0NSk++jowNZwqpQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(4053099003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTRSRGp1aW1UOVdRWHJ3VUFOeXBQbkYrSkwzQTdFRlVHTkY3Z3pPc1Baamox?=
 =?utf-8?B?SjFZSHhTUlJSYXR3Yk9lRVBmL1BGMGpyZzlIUHQrZFZNWDFkN1A5UkFqSllD?=
 =?utf-8?B?MDZwVXlMclhJVTR1U2s5WWUrQjh3TDJac25wOC9SSHdXak9tYmt6VzhDOWNw?=
 =?utf-8?B?ZTRZdC9ZY3RydGZ0QXYzSVFXVGNsTkkrbFFqeFpQRjFRaHRsek9LVUhhdXdq?=
 =?utf-8?B?b0R2TVBqdTF4VHcvMWQxWlAzcmY5T2JSZGhiL2FqTTR2TEpFQTVpQlc3ek16?=
 =?utf-8?B?QVBhcVZOekpRelgveHIyNWJRc2dLWlFSZFVVcVFSUk01RlNiNFRBUHZMN3pq?=
 =?utf-8?B?bWoyclE2eDFZNXF3TUlXOTlBbnROeE9paXJwM2p1aHNMUzFHTmhVMEgyUVZj?=
 =?utf-8?B?eFdDcFdaTnpzb2lMK2ZSejU1YkpCZGhaZEpqTE80SzlXT2NRNzBvVTBKbk91?=
 =?utf-8?B?RlJxaEc0SVJWdWx4VWlZMnlmTUdPU1k1K0gzU3lSNmZ3ZERlcW5GZU9BenAz?=
 =?utf-8?B?b1JENTg4TDFyRTRqVklJaDFsY0YxTk9jQ3RZZHRjTHhHVXpLRlRrUlBLeGZy?=
 =?utf-8?B?T1ZMSndxYStJK05qVCtCTmJyMzJybWgzMER0VWpoNXQwdGVkdVRWR3c3NXcy?=
 =?utf-8?B?RmZKemcxMnNTbTJBYkUyMmFKYWpDWTlCL08rdWRqakQ3cDJCVHdncUlCTXRI?=
 =?utf-8?B?eUs3a0pKeUpkaThqbmEycmxpbmxFY1pmbDFTbEc3Vy9sZVM0UjhsdHA0L3FO?=
 =?utf-8?B?WXRqT0hGUmgrUFFvTnBxdlVIZHYzam02MTJNVXFTRGlTbUljcFd0OWFJYW40?=
 =?utf-8?B?b1AzYmx6cDNqdEovK21CT3JkenBTVDMzNGd5cnlBVVlXeVZaRDFhNkM4ZWhn?=
 =?utf-8?B?bldOcVpQa0ZOVExMdjhNai9NeGNGbGpKWVBDN0xLREhaN1pSQWE2LzhNYjFN?=
 =?utf-8?B?WFFnVkswZFBIaThZc1pUZGwraEplUURxVnE2V0duM0IwdjFUdjNOM2MxeWFI?=
 =?utf-8?B?Tnp6VHp0TFVTTWVQMElxTjZHR3FiajFIelZ4Yk04cDJnc2tsTXMwdjJwSVcw?=
 =?utf-8?B?MG1UZVpSV01iZnNyd3NibkpBazJzVWdRcmhSUURqZG41NW9TVEdENm9NMk4v?=
 =?utf-8?B?VGkybjJLVHl2WWUxYmNLZTBsSGpuWWI2OThPRG1ZSTFPeEg4NTlQR0Zxc3RD?=
 =?utf-8?B?M1FvTEN3MUtHN0hZdnJ2QURYVGVSRmZqL2Q2YktodngzY3hjZnhtYzZUZjhK?=
 =?utf-8?B?LzRvSWFPcmQxamZpQXNvVktsM1NrM3NJc2puZHRzdU9yeGhJTDVkQ1NGWUp5?=
 =?utf-8?B?WHFYelV1bTVkRVlSOTIrdHNjYkJIa2RRVklmN1V5QzVkT3R0OG9aL25ObTY5?=
 =?utf-8?B?SUlmT0E3SDJIRWRwQW16djJjREFhSEYxVDgxci9QV0ZOUERMZjFGWWR3MFBX?=
 =?utf-8?B?bVJHODduMmRLRHZCVGpQVzFBK0VTSUQ4czRmSzFjTnoyT0VkNlJYSDBYaHZm?=
 =?utf-8?B?ZnkvSHdxOUlJNnZLZUtJQ3BQcWNxNkJsQ2FBajdjcld5L0ZSOE1UYzV4SGUz?=
 =?utf-8?B?N1lHSEJFK2p6Z1g0V0RZMTgzSmJhQkFqYjFtbmxSbm9ka3BlaDM5M05aRHl3?=
 =?utf-8?B?RW5OTjhvMDNyNk1ZWWxDVUdzb3FFcG9BWnh3SU9hL01DWG5QQml1a1daVmV6?=
 =?utf-8?B?bC9JRWJHdU1ZSi9yVEgxTlg1V0haUTFkc2tlNCtTUWxKakRlTmVnVDJJMXpE?=
 =?utf-8?B?ZHRnU3BlTVpqTWQ2MklXamJ1ZHAvQ0M0TElEVmFxN0YwZDFRYmJyVGRjQUw4?=
 =?utf-8?B?Wkx2RzUwMmM0RXU1RzdIZERhWGhOSzVSU0cwUU9zSEhRUlVVVEdwdHp3aW9P?=
 =?utf-8?B?amhtYmttZkFrd0FvUmR6UHFrTXlpSDd6L3lJYytzZTAzTmRIOTJCcTIvSWFn?=
 =?utf-8?B?L3FXOVRRT0JRcE4yYWRabjlldjRXT3dKTm1ZcmltZDdqRmhteGJJdmRyd0Uw?=
 =?utf-8?B?RXlKbElFdDcwZUQ4YXpJVWYycXAwQzgrQzBYZHptRFFVRHZxNFVhT2NuOGdu?=
 =?utf-8?B?TFp2RDFBTFNmZ3pJWExZYjZBTXhOZ3h2N083MXNkTkxBQlB3RFV2SVBsM2Vz?=
 =?utf-8?B?SW9BTUJVMklFc0RtMHY5a0owaUdsWXVTQXcxOW55S2xOVzFBM1hpU2RSWm5q?=
 =?utf-8?B?RGc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ab9h7gr6ve4yFtxIVhQtdlVL"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aae5b3f6-2a7e-40eb-507c-08ddc9cdb0da
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 09:45:42.9017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7yK0gRB1uZ5BCTc+xLnbMRBF3us0aI6+s26qRpiHGoN6yOC5krpUzJx1cNMXa/6rQFaywbkVflb+bPyEQyn/Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2777
X-Proofpoint-GUID: h-9uEQOGSBk4slIdNxSRki9ak2GrSfcJ
X-Proofpoint-ORIG-GUID: h-9uEQOGSBk4slIdNxSRki9ak2GrSfcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4MiBTYWx0ZWRfX+hkroqj0NAlL
 hJuRuZex5zN07vey9cdzRyVqxtQle54NW7yofFiiwwdx9cz3RWimsdRKnYTNH3CW8q3OsLR+w0O
 +5enawyBQrNme3L0eqQByy7wblG56xlvgIDKLTMe5ZUf6qVvYO0Cn2/hPxnKkYJxzfRqF3v76k6
 K7XXljm0UVetbfWfeRSeUvOsjS+3162rpVgpKWWV+8RCPQ5lR5TZqYwGf6wHBvIiflwi2xYA2w6
 iJNK8HYxpWKh1kmlsY9MhurzjU0zBrMfvUeOKnsga8ELe+7F56pPEDpLmBrYCFMbhqhz6HWbVXI
 EWqIl+suUHTsGVS02Ry4uD/o+wVAUbnKa8Yd513flxj5SYO1oarINIjn95OWoCvVkBMwbAgy/18
 L1xHxo3V
X-Authority-Analysis: v=2.4 cv=dp7bC0g4 c=1 sm=1 tr=0 ts=6880af4a cx=c_pps
 a=k+0uX8idyWF9koV3rWdvhw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=NgoYpvdbvlAA:10 a=KKAkSRfTAAAA:8
 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=BXWD1kwdEsBxI_JLQoEA:9 a=QEXdDO2ut3YA:10
 a=6h5F1V3u8ZvVygUH174A:9 a=FfaGCDsud1wA:10 a=cvBusfyB2V15izCimMoJ:22
 a=t8nPyN_e6usw4ciXM-Pk:22
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

--------------ab9h7gr6ve4yFtxIVhQtdlVL
Content-Type: multipart/mixed; boundary="------------DMA9MUXICW2ytHwYZ0MA8DKa";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <f25c1e7f-bef2-47b1-8fa8-14c9c51087a8@imgtec.com>
Subject: Re: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114436eucas1p1ab8455b32937a472f5f656086e38f428@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>
 <9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
 <d154d2d0-3d59-4176-a8fb-3cb754cf2734@samsung.com>
 <e1a3d854-93bc-4771-9b8e-1639ca57b687@kernel.org>
 <d12fd4fb-0adb-40c4-8a0a-c685cd6327b3@samsung.com>
 <27068fd3-92b5-402b-9f3c-fd786db56668@kernel.org>
In-Reply-To: <27068fd3-92b5-402b-9f3c-fd786db56668@kernel.org>

--------------DMA9MUXICW2ytHwYZ0MA8DKa
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25/06/2025 15:41, Krzysztof Kozlowski wrote:
> On 25/06/2025 16:18, Michal Wilczynski wrote:
>>
>>
>> On 6/25/25 15:55, Krzysztof Kozlowski wrote:
>>> On 25/06/2025 14:45, Michal Wilczynski wrote:
>>>>
>>>>
>>>> On 6/24/25 15:53, Matt Coster wrote:
>>>>> On 23/06/2025 12:42, Michal Wilczynski wrote:
>>>>>> Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 SoC=
's
>>>>>> specific GPU compatible string.
>>>>>>
>>>>>> The thead,th1520-gpu compatible, along with its full chain
>>>>>> img,img-bxm-4-64, and img,img-rogue, is added to the
>>>>>> list of recognized GPU types.
>>>>>>
>>>>>> The power-domains property requirement for img,img-bxm-4-64 is als=
o
>>>>>> ensured by adding it to the relevant allOf condition.
>>>>>>
>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>>>>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 9 =
++++++++-
>>>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rog=
ue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>>>>> index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..9b241a0c1f5941dc58=
a1e23970f6d3773d427c22 100644
>>>>>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml=

>>>>>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml=

>>>>>> @@ -21,6 +21,11 @@ properties:
>>>>>>            # work with newer dts.
>>>>>>            - const: img,img-axe
>>>>>>            - const: img,img-rogue
>>>>>> +      - items:
>>>>>> +          - enum:
>>>>>> +              - thead,th1520-gpu
>>>>>> +          - const: img,img-bxm-4-64
>>>>>> +          - const: img,img-rogue
>>>>>>        - items:
>>>>>>            - enum:
>>>>>>                - ti,j721s2-gpu
>>>>>> @@ -93,7 +98,9 @@ allOf:
>>>>>>        properties:
>>>>>>          compatible:
>>>>>>            contains:
>>>>>> -            const: img,img-axe-1-16m
>>>>>> +            enum:
>>>>>> +              - img,img-axe-1-16m
>>>>>> +              - img,img-bxm-4-64
>>>>>
>>>>> This isn't right =E2=80=93 BXM-4-64 has two power domains like BXS-=
4-64. I don't
>>>>> really know what the right way to handle that in devicetree is give=
n the
>>>>> TH1520 appears to expose only a top-level domain for the entire GPU=
, but
>>>>> there are definitely two separate domains underneath that as far as=
 the
>>>>> GPU is concerned (see the attached snippet from integration guide).=

>>>>>
>>>>> Since power nodes are ref-counted anyway, do we just use the same n=
ode
>>>>> for both domains and let the driver up/down-count it twice?
>>>>
>>>> Hi Matt,
>>>>
>>>> Thanks for the very helpful insight. That's a great point, it seems =
the
>>>> SoC's design presents a tricky case for the bindings.
>>>>
>>>> I see what you mean about potentially using the same power domain no=
de
>>>> twice. My only hesitation is that it might be a bit unclear for some=
one
>>>> reading the devicetree later. Perhaps another option could be to rel=
ax
>>>> the constraint for this compatible?
>>>>
>>>> Krzysztof, we'd be grateful for your thoughts on how to best model t=
his
>>>> situation.
>>>
>>>
>>> It's your hardware, you should tell us, not me. I don't know how many=

>>> power domains you have there, but for sure it is not one AND two doma=
ins
>>> the same time. It is either one or two, because power domains are not=

>>> the same as regulator supplies.
>>
>> Hi Krzysztof, Matt,
>>
>> The img,bxm-4-64 GPU IP itself is designed with two separate power
>> domains. The TH1520 SoC, which integrates this GPU, wires both of thes=
e
>> to a single OS controllable power gate (controlled via mailbox and E90=
2
>> co-processor).
>=20
> This helps... and also sounds a lot like regulator supplies, not power
> domains. :/

Apologies for taking so long to get back to you with this, I wanted to
make sure I had the whole picture from our side before commenting again.

=46rom the GPU side, a "typical" integration of BXM-4-64 would use two
power domains.

Typically, these domains exist in silicon, regardless of whether they
are exposed to the host OS, because the SoC's power controller must have
control over them. As part of normal operation, the GPU firmware (always
in domain "a" on Rogue) will request the power-up/down of the other
domains, including during the initial boot sequence. This all happens
transparently to the OS. The GPU block itself has no power gating at
that level, it relies entirely on the SoC integration.

However, it turns out (unknown to me until very recently) that this
functionality is optional. The integrator can opt to forego the
power-saving functionality afforded by firmware-controlled power gating
and just throw everything into a single domain, which appears to be
what's happened here.

My only remaining issue here, then, is the naming. Since this
integration doesn't use discrete domains, saying it has one domain
called "a" isn't correct*. We should either:

 - Drop the name altogether for this integration (and others like it
   that don't use the low-power functionality, if there are any), or
 - Come up with a new domain name to signal this explicitly (perhaps
   simply "gpu")? Something that's unlikely to clash with the "real"
   names that are going to start appearing in the Volcanic bindings
   (where we finally ditched "a", "b", etc.).

Cheers,
Matt

*Yes, I know that's what we said for the AXE-1-16M, but that tiny GPU is
the exception to the rule; AFAIK it's the only one we've ever produced
that truly has only one power domain.

>=20
>>
>> This means a devicetree for the TH1520 can only ever provide one power=

>> domain for the GPU. However, a generic binding for img,bxm-4-64 should=

>=20
> If this was a supply, you would have two supplies. Anyway internal
> wirings of GPU do not matter in such case and more important what the
> SoC has wired. And it has one power domain.
>=20
>=20
>> account for a future SoC that might implement both power domains.
>>
>> That's why I proposed to relax the constraints on the img,bmx-4-64 GPU=
=2E
>=20
> This should be constrained per each device, so 1 for you and 2 for
> everyone else.
>=20
> Best regards,
> Krzysztof


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------DMA9MUXICW2ytHwYZ0MA8DKa--

--------------ab9h7gr6ve4yFtxIVhQtdlVL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaICvRgUDAAAAAAAKCRB5vBnz2d5qsDR/
AQCVMkVo0DMTS2De7GE/E7OlGBVH9LFEnn7OO9TwShMFUAEAtA/lX9xjcxwhQEnaeVfxNMZTaSSZ
kNOLOVuHGwFZyAA=
=XFar
-----END PGP SIGNATURE-----

--------------ab9h7gr6ve4yFtxIVhQtdlVL--
