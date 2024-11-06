Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3579BE40D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 11:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5307210E6A7;
	Wed,  6 Nov 2024 10:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="LHo75MQy";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="VQ2rs8cX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B056B10E6A7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 10:18:09 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A66U8Gr027924;
 Wed, 6 Nov 2024 10:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=WcablOc1RcUAmfLTM2cDySKL1
 r7tHR3rcQ/LUvDCbAQ=; b=LHo75MQy3/nYrccUveET6cb4tyVdMGbnkBP3THEQ3
 cdAg90iC+sv3Iypzruz4f+FRAejZ49oy/EjOn16lXU6GyColfzoY6E50ai7oPKSM
 9NEYNTelHoJJvUiG2bURqCA6rjF4YsmXWMNM4EJXWY7fhfj6BRPRnW3I7n6N5Q2U
 fLvf21CXW7ZTIVBFi3T1dhERzoBHIzyEza+cji74ZYnqMs9cEoDbIJJTRY65n1K0
 D01/wza0dGwNo5WLxswZQ/mpLIQmvb7pbOckpR1fflazrtIO9/ZtEC9pfGAbGOT9
 QwxSNFqSt17//0W70bOviv/mFcEu4RqoDSv/392JhDw7Q==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazlp17011029.outbound.protection.outlook.com [40.93.67.29])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 42qw83rat3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2024 10:17:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhPw3XJpJquDHYWdS3F6zBggCdFbdA8duVUcsoEmJd02JHffH+NYEKq5FbV+HtGtq1ENYbeyiN1lIAfMCEnQPOrKECzreO3SrsfLZ//O5WvxE8JrzMJJR+gPfhV2rZJuvmEglBulNWbictQO18D1CK+voMIADBXhk4FaBn82FXexu4D1AG8HHLxvm13xtdnEl3t3EPcnRVnHJvvJjJ+9/dE5xa0zi7b82xH9Cq72ReVhUxLa5lcdWIPhhQQPM1deoQGVUNm7yWF/pgzx+EY+nPtwPZZ7iMUkohktDoyyyn+HmBIVR7fhnr/8BaSlXbbjzhRLrhOh/NB7mDIvzNCqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcablOc1RcUAmfLTM2cDySKL1r7tHR3rcQ/LUvDCbAQ=;
 b=iTk3KBMNFozNV7MchD846KhjKKSta2Q7g4yxmXbr/vGGi8HN+H4+REm8kQwfpLUvNCZutDuQoFk1f1sBejz1yEkeUpATONKKB9KwgExrTnzhSC+UUb2ER8IC6OnEK3CKR4EnLNvRdkGoKwsZLdnu2StL3oI2Ufm/B/ABqWJEDh14rUFnhLTG1oF9ifjawTidvTFGa89Boo64myHJzwWD4FvfEj2qtgrtbmdSE+uoEcX+c1logz1VmyKBzbokJJqnAmKD5UKMn7dkaFAtzVw2U89z2i3NYxQgAO9AXmclLV5deD74a6lZTVlUcDSm9cyNdlXSMPQC1/dN1OcU88L8Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcablOc1RcUAmfLTM2cDySKL1r7tHR3rcQ/LUvDCbAQ=;
 b=VQ2rs8cXHXPUjO6u/sw8RobbVYq0gGlyPNMp7F0JgiyhDJLj6SPnrR2Y4ySofKSxwOfWv7XjH9KimhKoMwf02B/t9TpEiBS4F/CBBA0zkrXf9bTxrkXSDU36iCGk2TwwLMo1cCltQXKjif3zx5GwZo9OT/xNY/7C53B8qLjIUbo=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB7201.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:32e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.18; Wed, 6 Nov 2024 10:17:53 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 10:17:53 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Conor Dooley <conor@kernel.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Randolph Sapp <rs@ti.com>, Darren
 Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 02/21] dt-bindings: gpu: img: Further constrain clocks
Thread-Topic: [PATCH 02/21] dt-bindings: gpu: img: Further constrain clocks
Thread-Index: AQHbL5uNV3N/t0EWI0ekjIydQAS/mLKo/nwAgAEMkwA=
Date: Wed, 6 Nov 2024 10:17:53 +0000
Message-ID: <5b26e693-d37f-41ee-b119-32ef648de6f4@imgtec.com>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-2-4ed30e865892@imgtec.com>
 <20241105-blooper-unflawed-6181022944d9@spud>
In-Reply-To: <20241105-blooper-unflawed-6181022944d9@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB7201:EE_
x-ms-office365-filtering-correlation-id: 92ae8b1b-4d07-4230-c44e-08dcfe4c4663
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?YXVDdTcxbDVGU0RCaTR4UXI2Y2EraG83dk5McGZMUlpYWG01S29xSUE1T0NR?=
 =?utf-8?B?S1R5b1VIcjdOZzVSZ1BGNFBPUHlhc2dvS1V4bUFBKytPN3F1WFZVRTJTaVBn?=
 =?utf-8?B?MXBJc2x4N1hkcGtKK1RXQUhvdDRWWldqWFNlUWZsUUJadVJkdkQ5djdPNlFl?=
 =?utf-8?B?SUJLaUpvSjNJTnIvbGdEV2cvNjB1clRvVStpMDNzM0w3cVlKWGMxRGVaZlRj?=
 =?utf-8?B?S1VRRThNSXUrckVKbmUzbmx4UTdwOWFWOTVRckQ5M1ovUWN0aXBXQlExNll1?=
 =?utf-8?B?RVA2SFc0M3I3cDd4eWgxT3F4SlhSVTVyNUE5S01SWFpMRnRrREExN0x0YS81?=
 =?utf-8?B?V2s3UW9OQ095a3hjSXlMYmFzSGd3Q25ndVNVMzc2OU90a0E5MnBIK0ZOdFdF?=
 =?utf-8?B?amtOYmNZRjdEUDJsNmlJVER3MHJ2RWZPK245TmtOeXh4RW4rV1lKbngzV3NO?=
 =?utf-8?B?T0V4RG9LQzcyd25pRGtzWFhtZlBEU1Q0YkZVYkFReXF0VmFvTW9FUGUxRndG?=
 =?utf-8?B?VEZhb2dsbUdCSFMzSTlRQ3dlR2l2OERCb3pJcGliUnRBOFVseWoyNkloemsv?=
 =?utf-8?B?QUI0N3haeEloUmNEOW5BOU1IRnBac1dTdTBZOHlOVUVMaHl2NWdsdHN4dDhG?=
 =?utf-8?B?TnFrY0FMWFJpSEptN2JaUWlHWnpNYi9ER3hQQTkyZHp2NUhPaEZmQnNkQ2ta?=
 =?utf-8?B?SE40eVd6SzhZYnltcG1wZDZSbVBmV0Z1L2F4TmpvNWtrK0hMWG1MV1F0N2No?=
 =?utf-8?B?WGJha1FRRnROY0wydVJoSUJ5SGh2T21FRHdrcStTSWhFSGZWcmVmNTBITGM5?=
 =?utf-8?B?eWd0bncrWmQrdUtOalVVcTlyeW41cnYraGlQWG9nUzhXSTRsU3VtUC9yb09s?=
 =?utf-8?B?clJKcGR1RnJOdGdhWkpjeCtnalhNV2JvS2J4WTRXU1F4Y2NHZGk3TmxyT1Zt?=
 =?utf-8?B?aTBuWjBLVStVTzJqT0dMam5uSloxdjJYdUh3K01WL1I2UTBiQU92K3lsdklR?=
 =?utf-8?B?WlkrVU40bTJ3REFsb3MxNTBtM0QrYmtzeDhTQXFVYmxCQUY1VmFEeWZoT1hU?=
 =?utf-8?B?OXVtWFE1RkRpRitjek5hZk5yYlgrNDJUNFFRdXh5aThUMEE0dUFWd2hGdGdx?=
 =?utf-8?B?MmEwN2lpZE12Ui9DZ0ROOHhpbFl1eE9pZEVtZkdkMXIyN2NTOHZYeFd5YlZ5?=
 =?utf-8?B?TTFWV0orWjREcWRaY2lveTZUWGFmSzE1eTIvZGFzMjREcldrMjcvU2o4cVJE?=
 =?utf-8?B?eXpHUWd2d2t3VUFHbUpuYjdLUTZLem5pRWlsMU5hQkNLWVMzbzd5dXgzc1RX?=
 =?utf-8?B?aHR1T21QT2FhZll3eG1vbHVTWjBJamllVE5YVVcvQXVVVldBWkxjMXZqVFBZ?=
 =?utf-8?B?M2p1bGZlNmo4VHJKWEt6QzFSNnU3T1d4VnVyeE5SZVF3QjY1Nk9aUG8vWkJ2?=
 =?utf-8?B?bE1rckpmRFpSd1duQXhTcHYyQVZ2NVM0VUZCbytETERpY2VjMWRxc3F0dUlr?=
 =?utf-8?B?NWxEOXZDaVM1SENlMGNRblZnTVkzdHhubE9XYjJkS3NBQVc2MzBOYzlacTFr?=
 =?utf-8?B?UjhxemdCcjFJTnFxQ1pjaVZJUkJCNW9RT2hzcUtHbkZNM3dwaFJiZ3FEZ0po?=
 =?utf-8?B?R2tmM2ZTWUJ3VkIwZ3NMdTFhVDFYM1VjTTNwQ0xzL2g4cHlzaFo0TVYyU3JJ?=
 =?utf-8?B?dzhXemhLY0s1STVWK1FPa3lsTVNKVVVEdWgyVzVrSmFYQ0JvOWFHMUthckll?=
 =?utf-8?B?N2lIUldza0JSNzZQeWJuZ3o1OXdyZGYraW5PTE92YUFvMW9YM1pQRmR3K1Jw?=
 =?utf-8?B?djZtYWYvTHIyQ1JSa0RrV1pnSjY5YXVTSmVYNGU4ZG16QmVPUnNyTjNvQ1Iv?=
 =?utf-8?Q?9qt2ZSCdbrm1r?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3czbkhKOVNXZUR1K1ZFVm96SWtFaE1kUVZVSnFUR29CKzExUEc5N2FyU3Fu?=
 =?utf-8?B?SzR1WklHU1N2cjBCSzVyVzRLNm0zam85Nk8vSlU0S09UdG04YWhZYkFwcGEx?=
 =?utf-8?B?SE9udmxZM3dlQVZFeTI0c3EvRGlYL1FrTHg2aS9vL0tVdnNUSytQUjZtM0ZF?=
 =?utf-8?B?Y09CL1c0OGw1VTlkUk4rNVdFUVJIclkySHFLb0d0WHV5RWlnN2dqaThURm54?=
 =?utf-8?B?QzdpQzdjUHJoU2F3akd1OTNVaEN5eU1SRmQ2T1hZR3lhWDd1M2xkRlJOY0p2?=
 =?utf-8?B?WjJtSGd3cUV4SWtTQUFhM2YvRUNnSFhuUFBuc0phK21WTGpXMnJueW9nS1Bs?=
 =?utf-8?B?c01RdGVzb0I3d0FmZ2VDMW43d2E2ak5FTEpORk1YM2hmRVQybGtNUHBUNXNy?=
 =?utf-8?B?QklQQkVEWnhieE9GbXhrSWRHd0lDZ05HZUFKRzF0cWRUN3h3MGpYc0NXTGp0?=
 =?utf-8?B?Z2pyRGZKcnpHS0Z0T21WRk84U3BINTNxQjF5eEt1Q1hicjgvRmp4SW5Rb1Zs?=
 =?utf-8?B?RGFXMFlEWnhHVS84MTJ6S2R5VkllQWNTT3dWSnBpZG4waUFhc2lrMmtvNjE5?=
 =?utf-8?B?SS9BVlZ5Y3hZUXg1SUNTandjRXN1S3RoY0g4QWhROEFFUERBVi9NUWtCZ3Z6?=
 =?utf-8?B?ZE94NFVSOFlWaFJOa1NSaWE1clJsQmZObldGV05TTXJvWXd5eExYSU1FK21W?=
 =?utf-8?B?VzhkTEZQVlByUUlGeXdHdWVuejF6V1pGL1hMNWZBYnZiWUlZbGlXcnQ5Mkds?=
 =?utf-8?B?VmZQRzcybm9qMnZPUlFRbXdsT1ZsSUFPdUpPbWFHNnE1QW10WnRzYVQ1OEdm?=
 =?utf-8?B?Nnd3ZDdCanlNR2NOZHF4bkNkM3ZrK2hoVHdIamlSNUxHVmhFZjJ1SXpHOTVB?=
 =?utf-8?B?a3VUbnNHVzR2WTdTdUcrNStjb0NRbTd6eWw5VnRVQ2Z3cVlSZWhuMDRoSGRn?=
 =?utf-8?B?bVNQTEFOOU0rMjV0Yy9EWVVIUjRLQ3VHUEsrdWhDSmFTTS84USs4dUhjZUw4?=
 =?utf-8?B?TWNMdmlKVXo4M2JHUWI3a3VUY1ZJL0RvNmUrQjhDQkVpQjhwU1JpbWNucU1Y?=
 =?utf-8?B?SnVPQVVsYkpSK1R1RUJnMWxiN1p2YU1zLzA2VHVrQnFOUEt1Znl1QUdrQWNG?=
 =?utf-8?B?YWhNbzBSUVBWaEpnUk1iR0FjREpkRE5vaGNQclNHbVUzdHFXQkx0Sm4yVkVI?=
 =?utf-8?B?T2tIemNIaTA4YVFBUTM3OWt1bHZLYkVMMGk3blcxM3J3SWFNZlNNOE5SK3Vo?=
 =?utf-8?B?VlhZaUNlM1o3VGN5eDlkN1BGaWd6ajFVOGI1RVA1bTdWYzBDZ2x6MmhSUXJy?=
 =?utf-8?B?d3VFYVdPUlFTcXFzZDYwWk5VOFJhOFNHRjhvTkpoVDUrL2t2cVBSVkhRenov?=
 =?utf-8?B?QzZ3NWhyMEp1RStVdmVuc0w5S1k1ckx3K2d4VWY3UlR1RlFRbjBhRTF3ZExT?=
 =?utf-8?B?YlJ0ZnNJcDRvQlVFVTliTWZ6bEJvRGtsMm9NVlMwNmFxYUg1R0E5cVlScTIx?=
 =?utf-8?B?SEdmeEJXWkp1d0tqOXlLS25GQkFtd0w3Mm5NNTBUbEhQSXEvUm9TL2NnV0x1?=
 =?utf-8?B?UFMrTGZUcW1oQkIrUXhWNHphbEQrWFArM2k2WXNHWDBYQXV3T1p6YjRiRFBO?=
 =?utf-8?B?b2tPOUROVTdmTXJWekNIWGlrcm93d29DQjV5YjVGR3pJSlNTSXJzb2tCZm94?=
 =?utf-8?B?YkFoNkZOTjd4MGNGcDBnVkxwUy9HbkM2S2k1S0NhZmJpdnFyUThHUmk0K05V?=
 =?utf-8?B?azVkY1VlUGJvUXFGTitaYjBER0gvcEdpV25xTE54UUVJMS9aUkZtaW9uZE1Q?=
 =?utf-8?B?TVJhbFBxbDgweERDakw4QWM5SXhZRnB1SjZDb3JOL2M4RU5hejhmZitnU0Ry?=
 =?utf-8?B?c3puMld6OWwwaXh2T1BRSkJqbzdNUWE3cTdGZFExUDkyK2pMTTg2aVJOSE9D?=
 =?utf-8?B?Rmlka0VqV3ozUklGMXhLOExEWTdSeHYrSk93TjBBS2ZUMURQajQ0alNTcGNz?=
 =?utf-8?B?dGpjdjRsRHRFMUdsNVpLdkloTnpQZkhRZlcvY3NDQmFRM3Q3UmlETEl4QVN5?=
 =?utf-8?B?eHllNTN4SW9VOWxsclNXdTZNOGZNUVdSSi9lR05uRGVXZTJTRnF5bVpMeDN5?=
 =?utf-8?B?c0Z1b2xFWEREa1RjOFUxK1pHM0V2eVd2T29BQm9HVllMdmx2UDUyY1laZGNP?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PdT0jnRZu6p1tBPN7gVGBnCD"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ae8b1b-4d07-4230-c44e-08dcfe4c4663
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 10:17:53.1364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IUTrZxEpNTxkRxw7Q8QuQqJrbBH+xXUpVl6FSimL1kwA2VtCNjniWDsR19SmwtiWWQ4kgdKX9gxeHIOfDdTgXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB7201
X-Authority-Analysis: v=2.4 cv=CYNa56rl c=1 sm=1 tr=0 ts=672b4254 cx=c_pps
 a=mRJfeTHGti1YOx0CH8CfHg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=HYukrc80r60HqOvVoF0A:9
 a=QEXdDO2ut3YA:10 a=yreiej6YfYjpFZPuasAA:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: 4MmeBuV0gf3r0lFaaGBCDQDE0Do4hB7-
X-Proofpoint-GUID: 4MmeBuV0gf3r0lFaaGBCDQDE0Do4hB7-
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

--------------PdT0jnRZu6p1tBPN7gVGBnCD
Content-Type: multipart/mixed; boundary="------------oCQaMsTmeLcO4AqPupZgAVmC";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Conor Dooley <conor@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
Message-ID: <5b26e693-d37f-41ee-b119-32ef648de6f4@imgtec.com>
Subject: Re: [PATCH 02/21] dt-bindings: gpu: img: Further constrain clocks
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-2-4ed30e865892@imgtec.com>
 <20241105-blooper-unflawed-6181022944d9@spud>
In-Reply-To: <20241105-blooper-unflawed-6181022944d9@spud>

--------------oCQaMsTmeLcO4AqPupZgAVmC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/11/2024 18:16, Conor Dooley wrote:
> On Tue, Nov 05, 2024 at 03:58:08PM +0000, Matt Coster wrote:
>> All Imagination GPUs use three clocks: core, mem and sys. All reasonab=
ly
>> modern Imagination GPUs also support a single-clock mode where the SoC=

>> only hooks up core and the other two are derived internally. On GPUs w=
hich
>> support this mode, it is the default and most commonly used integratio=
n.
>>
>> Codify this "1 or 3" constraint in our bindings and hang the specifics=
 off
>> the vendor compatible string to mirror the integration-time choice.
>>
>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
>> ---
>>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 27 +++++++++++++=
++-------
>>  1 file changed, 19 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.y=
aml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> index ef7070daf213277d0190fe319e202fdc597337d4..6924831d3e9dd9b2b052ca=
8f9d7228ff25526532 100644
>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> @@ -30,15 +30,20 @@ properties:
>>      maxItems: 1
>> =20
>>    clocks:
>> -    minItems: 1
>> -    maxItems: 3
>> +    oneOf:
>> +      - minItems: 1
>> +        maxItems: 1
>> +      - minItems: 3
>> +        maxItems: 3
>=20
> Just put the outer constraints here and...
>=20
>>    clock-names:
>> -    items:
>> -      - const: core
>> -      - const: mem
>> -      - const: sys
>> -    minItems: 1
>> +    oneOf:
>> +      - items:
>> +          - const: core
>> +      - items:
>> +          - const: core
>> +          - const: mem
>> +          - const: sys
>> =20
>>    interrupts:
>>      maxItems: 1
>> @@ -56,15 +61,21 @@ required:
>>  additionalProperties: false
>> =20
>>  allOf:
>> +  # Vendor integrations using a single clock domain
>>    - if:
>>        properties:
>>          compatible:
>>            contains:
>> -            const: ti,am62-gpu
>> +            anyOf:
>> +              - const: ti,am62-gpu
>>      then:
>>        properties:
>>          clocks:
>> +          minItems: 1
>>            maxItems: 1
>=20
> ...adjust the constraints in conditional bits. Setting minItems to 1
> should be a nop too. Pretty sure what you already had here was actually=

> already sufficient.
>=20
> Cheers,
> Conor.

Is there an implicit constraint ensuring "clocks" and "clock-names" are
the same size? I wasn't sure if we could rely on that, hence the
slightly odd constraint on "clocks". The only real goal here is to
codify that you can't have one of "mem" or "sys". it's both or nothing.

Cheers,
Matt

>> +        clock-names:
>> +          items:
>> +            - const: core
>> =20
>>  examples:
>>    - |
>>
>> --=20
>> 2.47.0
>>

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------oCQaMsTmeLcO4AqPupZgAVmC--

--------------PdT0jnRZu6p1tBPN7gVGBnCD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZytCUAUDAAAAAAAKCRB5vBnz2d5qsFlP
AP47gPF/fODmEtZ0U479uM2Y1/XXLnCuScGUZfn7RlAr2AD9HDR9VQzkT+UCeuIKOjVLLFo7oITN
EMWjIliHcOv4ogM=
=woYf
-----END PGP SIGNATURE-----

--------------PdT0jnRZu6p1tBPN7gVGBnCD--
