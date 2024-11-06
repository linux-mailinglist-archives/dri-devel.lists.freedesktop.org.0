Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87B59BE40B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 11:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AD210E6A0;
	Wed,  6 Nov 2024 10:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="N7ATFDxG";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Q2p0r9tk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2193310E6A0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 10:18:04 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A66g64v020584;
 Wed, 6 Nov 2024 10:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=p/16yCUpECC0/zNhq3zXuNroQ
 FOJmk+OuNR01ArqWJs=; b=N7ATFDxGsj9bY/+YDEyCz6YYI/d4fJJaH4zfb+Bi6
 THeA4Wf2bziYlFqtdtMVSyozoL7yYAR2ZQuCIwWtp1VgV1NFM7E++wBQ4JPGFrGO
 QWiPPiAicjhDrdU7oqs7Ld6sSsqAS1BZI6orf+7b1BQTkZJGFlEQ9iZqXdxu2lOp
 UPCQipXvE0CmQCEyi1rNuAH7tksfbT9tkJYiNZ7Dj4SI2S6FzN+ZJK+7pymJuRZb
 MF/Y2CHSfSd3efV46iOfw04yU//LAAYBj6BnoV4A89LWvj5EpJvzZIr4AIfxKJyD
 byRt+GYNn4azx/QunZCLhuEduPSeRhb3MIkBnUXAqZ0tQ==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazlp17011030.outbound.protection.outlook.com [40.93.68.30])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42qw838c3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2024 10:17:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFCfR1O5ar17u2qc/VpsqmYkWiUH6i0Xmpt7Oadm5gj175c0DfVwL+oByy+EHnSzdeckmXXILjJs6CGwcJi7qCjBGcNxuD07xd6Z66un4+PmkdaLXMy/QKAXgMfVMq6iiZKlN6ea+XmYU37hGKnstfEMX6PrCWQkUGM9kKheMoh8EdU27FnZQHyjixcLNnAd5Dp/4XRvjXfI6mPBklJ15zPAGEZ6hSXfWStdwiU5rrkyWoG06WHSIV/k2P4Ddiz0G6lYLF4zfwVtxdVezAOlWaiisgpm9uC1pneI/W+TvHRZ5Xeon0vjd6vsLq2+U7uwp0iuKXoV8bxOp+ZMFi6HFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/16yCUpECC0/zNhq3zXuNroQFOJmk+OuNR01ArqWJs=;
 b=qOjskjHsqg9Z3zYeYAd3sKtNGH9QktmxnKsOOtMnqWzphrbWSr0Tk/DksRjGmh3MTv6LS/+YYd78Qpx7DuRY+RQtQ76KvtOBKX15xTHhZIL5LkpcxWfUG0rH8yt02nJ4aW6X/LSJbli8pEn8XUgqNBe9JbdvEavn4qPehf44bnTR772U97bOe4xHywsZqpXAI/N9oBbB3clr/dzCYxxIXP+ZVMpmQeH7czIzbAhe0AOl01l1FSDpTfTFMqdtnydOIduE8BEN9lfhY+4QorsyHeWatEuo+jBNHv80jYxj/HdtqzzvXsOLPp//w65O54zah1ekJ8WZpzaOEYT4Pv52KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/16yCUpECC0/zNhq3zXuNroQFOJmk+OuNR01ArqWJs=;
 b=Q2p0r9tk6TFmeB4hVISYeXTD6Oz5P0h2yhKc4P9R7bHVZw9X6NluYK1b6E+3RwE+XUo9I7oJv6rA+PV+56i3oAMlpYhqet6TvHuxxXvIbobc/4oM5v7Duu5ooHx9wMjp9gbE/mUsZMMLsalkr0Eat/YjlP2HdLk/Xy+HC5n4rrk=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB7201.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:32e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.18; Wed, 6 Nov 2024 10:17:48 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 10:17:48 +0000
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
Subject: Re: [PATCH 01/21] dt-bindings: gpu: img: More explicit compatible
 strings
Thread-Topic: [PATCH 01/21] dt-bindings: gpu: img: More explicit compatible
 strings
Thread-Index: AQHbL5uNFhb+0wsyO0qSNR7DzguaGrKo/X8AgAENioA=
Date: Wed, 6 Nov 2024 10:17:47 +0000
Message-ID: <d70a01d3-24d5-4e31-92ab-7f6626452852@imgtec.com>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-1-4ed30e865892@imgtec.com>
 <20241105-matron-gangway-64e78576ec47@spud>
In-Reply-To: <20241105-matron-gangway-64e78576ec47@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB7201:EE_
x-ms-office365-filtering-correlation-id: 34d1e7e6-c39b-4bd7-c354-08dcfe4c4355
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UGY5MlUyNEJubGp2UVZhQ1M0UC9PZWJFYnVuaXBEdTV0WFlpU2xubnNHcjhC?=
 =?utf-8?B?V1hOTlRtZWVvaFpicDI2cTJ4STIzdCt2VkpSQ3N6dHVXWURuNjRsVzNKckh1?=
 =?utf-8?B?emxjUVh2NUxOVXhPemhtT2JKejlJcC9heTcxaWZySlZRM0lrcGV2cUs0VDhM?=
 =?utf-8?B?SFJPbG1RZ0lhazh0aGFENW00T0tNMVVFWUR6N0JMZXpwRDlBSVcxb1B1QnpW?=
 =?utf-8?B?bGMxR1lxcFlJTE5UYzNCejMwcWFaRmFXd0xlU2NUR1NoT0llbTVFcVVMYVBO?=
 =?utf-8?B?WGw3cjNSZmlpN3JkNEkxSWpKR29lcnNVV1NmZ3BvditHV2RjbXhhZi9SR2dl?=
 =?utf-8?B?S3BZSmdTN1FmSTFsdXpBeFJmcngrSVVkcWRwYjh2dU1wc1phbEw2YUNBQ2hV?=
 =?utf-8?B?bEtmcmltMjNVdVJhWkY1N2Y4NmdhSExWWHBCNTJsOHE3ZWRadVB5c3ZkWXd4?=
 =?utf-8?B?Y2NUNHk5VE9LS2o1ZTJHbldTaXdCZ1hSQkhXRThSa0lvZGtvTEx2RSs5M29D?=
 =?utf-8?B?SENnMk9kRDA0MnUySHRPOGRld1BvYTRTOE9QaGpFTmVoWjhZRVdLdHFMK04y?=
 =?utf-8?B?VkozUHlja1dhVTNFblRiSStSMzMxVzdVSE5iZGR6eno5SlVVclBMUnJWdnJx?=
 =?utf-8?B?SmJ5VzRsUU12OXNpclh0bDdNTWcvVlBiLzltOU5MT3NTVXd1cXd6dGtjNHJ4?=
 =?utf-8?B?a3FXYVZlSkk0ZFlrcTVhc2QzVStHTzNhRm9DcnRmNWJqWWkwZkJTR1FNcUxq?=
 =?utf-8?B?UWxncC9ZemVrV0pNOC9POStCY3Z0dHhlcnlRR1Z5ZDROMnlEcXQyNnJRSTJw?=
 =?utf-8?B?amE2S1FWVFBJNWs0bWJkdnYrS3lRN1NGQ2ZIekRJeHRYK2s3NXJVdk0ycVZ5?=
 =?utf-8?B?dDQ2aWhrOUxxZmNQa0N0NkpZRTBxY2h5aWFDbVFnTGp0b1BrbGhtb3VPWnN2?=
 =?utf-8?B?MEluMzZMRzFUVzM0MUhLRGs4bkFOcFcySTV6L1ZSMnNhMytJYXVZQzdxTDBL?=
 =?utf-8?B?alBhdnB2c0EwYnU4YWRuYm12NXo2Z0RwWklVQ0lzNkUrd2RrcVg0YnZrTHFB?=
 =?utf-8?B?TzBtYVBUSXBhS2VoaEN1UndsY3JDWnZ3c2xYd2d4UklFV2Y1UTkyMzlHbGpo?=
 =?utf-8?B?RFc3VU9hbVhhbS9qOFI1MGlpRW82TWJVVDJBc0pOQnoxS0VOd3V6RDdRSjk3?=
 =?utf-8?B?eGkzT1g3L21DNXpaSkJHVHhCMktLYnlJcUJBV0tCdVBDYW9wbUZCa3FERitX?=
 =?utf-8?B?T01uM3R0ZmpaSlpuemhYWTV0algzbDRGWC82NTNkZFdRdDduS0tYZlhiVzc1?=
 =?utf-8?B?ZVp2MURoS21xRk9PL0hwY05wb3lCbGtiWkExM3lITDZSSFNDcmVEeVEwTWY3?=
 =?utf-8?B?SzArMWlWMXJUNkg3QjUzWGErTWJ2OHl5eCt4NUh4dHBRQkFCKzlRVndsM01i?=
 =?utf-8?B?Q1ZTa1NkZkZpbmhPY2wvZStiOFZ3cVRrdHdsVUVJL3ZKVjUvQmFTb2s1S0dJ?=
 =?utf-8?B?VDlrQW1oRGJtYjlvSUtOK1I0QnViNnEyNzQ2a294WFBFdnFnNGhoNzFuVUow?=
 =?utf-8?B?amFKb3hRRXpvb1JlTGpjZU9BM2lxMHN4M0txanFGSkRqc2VVL1NqckMvMXFP?=
 =?utf-8?B?dzcrSFZMN09GVG9YbFFzTk5vS2xlSjRZVkdWdlMrNnY0cG1QMURUYlVvRjJh?=
 =?utf-8?B?SjBWTlJ5L0pPT0ppWEhjZXRJV2hRUVJ6U1BrejU4YXdkLzF1WWxFYWRFVmFM?=
 =?utf-8?B?clFXRmJwQW5ob3A2K2lKOFppNUJybEtIRGNRWVFsWXB2TG5tRHIwL05JNXJs?=
 =?utf-8?B?cUxjakNBeGdkQ2VrQTlMb1JCZHlXUDJGVTlvN0JiSFVrbFJRVkhmMXI0TWpt?=
 =?utf-8?Q?WKqH4WGaC7pMg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0pNc2FzTzVwSFRrem5EZ09FRTlyUFFsWVcxOFNSMG9ZVTBPOExxaE5lbzh2?=
 =?utf-8?B?TzBoYlhGaDVMNG9OOXkxNWhPUUNocGw2cEFpS1dYektqOEp0akgxOVFlQkFM?=
 =?utf-8?B?WG13TTc4UXFRbzhocG5YeG5UZjd3WXRwV2tWSk9xWDY1cWx0QnRPUDZNei8x?=
 =?utf-8?B?YUZ6TGY4Tk40K2laZ2NWMnBnalFBVStuQUF5Y2dlT1dMYzZxTDA4RFBzNzBV?=
 =?utf-8?B?TGNydDBnNFhVb3EzWFUrTzNsa0s3V3ZaWHFJZmZTOGswRUh3U3VBMlJUMzEr?=
 =?utf-8?B?N0VlNTY0UFBQUTI4bHFhQ2JDTERGRjJBdTExeHduaHFjb0QxNi9mQ2ZxaVNS?=
 =?utf-8?B?UytlNU5lMWNVVU5GYm1HT0pZRWJRbDV5L2RpOFpMUnJ5TDN0YkcxcUduQ0VH?=
 =?utf-8?B?NElodkx5blZZZC9FazRzbk1jMFRWQWVTYWtteFBpRWx0Yk9Pc2tnak9PZHVu?=
 =?utf-8?B?Qk9oeUR5SE5qTStSQUZqaUp2ekdHNld5U2MwdTFkM0VEODlFazdPbENBUURC?=
 =?utf-8?B?SlFMOVlRWVdqV2RNT1YydFFWdEdGeEh4cE1Yc2w4M2xRcnVNdjE4WkpTNE9H?=
 =?utf-8?B?WEl1TC9vRkRhaE5GVW12eFR6d2NoTHlNR2RibjVOWE9Sckl2UmxpUkkza1Y1?=
 =?utf-8?B?VCtuWFVLSkQrUzJKaUY5TERPNXpEY0Y1V2xnOWRIWlhtc3BHdVVuVi9TMTBR?=
 =?utf-8?B?U0lnaW5aZlVVc2tOalpSSEdITCt6am84dGw4dENjNDN2YS9KU3dpZ3BxWEo5?=
 =?utf-8?B?eEExWFpVeXJkaXJkbVFaU2k5S1pJc00xeDhGdGV4T21IMWtoeE1qeVl1RlY5?=
 =?utf-8?B?UDZaZEFiSFNCSW5Zcm4zNjRoUGhPaTAzWktmeEdQanREOHEwTkJRQktjTzFE?=
 =?utf-8?B?di9XMndQS3g0Vkwxd1ZoYkZjTEd6anNmM0dPY3UwMDdYVHNTY3FnNXRRZjc0?=
 =?utf-8?B?ZDZibXl3cjlwYkhaU0g1ME5LQ2toWUJNQXRSRmdKekVQdUpzVjllamNua3lK?=
 =?utf-8?B?WEN4R2M5TnlKeUxmNlFvV2tTWEFTR0k0NlYxdFYvVTIxTzJNYWtsNmNQSmpI?=
 =?utf-8?B?ZnFWNjc3M0ZGTGNKcGRsRFZuait4ZlBLTCtnTHQwWE53dHk2MGRLS2M1QmF0?=
 =?utf-8?B?Zno1OHNaeDZhUHU2MzRNdnU4T2t6bXZuVnc0NEEzWXE5SGlMMlZXMm1VeTUw?=
 =?utf-8?B?VTFJcTdXNEdlVjFuZDVkTU0wSEZWVWQwZElzc2xWTzVYZ242VWZzYXpaL0l0?=
 =?utf-8?B?dTNSUVRCVVBnV3FKTWU4UExxWEg3bnoySm9GeXo5amJ4cVdwWFIvYW1SNE5j?=
 =?utf-8?B?aDZmbDJucWF0QktzYTR3TVp6ZzVtTmQ4anlyU2tLOVgwNmRoL1p5NTg2VUdl?=
 =?utf-8?B?RmJoT2lSYnZiZlkrOGJUTWR0YXdLdDk3SElIem83M2NWekpRU0NwVk1TZHo4?=
 =?utf-8?B?U3lBS2xqU1Juem55dVpXelNMVDlXMTAvS0tIOVZmdVVOKzRycGxpcmpHYW1Q?=
 =?utf-8?B?K3VscS9KTjFnUWpsazlUZjlxWitBVER0QUNPcnlIb1ZZeWwxRUpMSkwxY1Bk?=
 =?utf-8?B?eXVXRzVDZW1jdVdQdDNrNkJpVTVLRmRTZE1TeTZ6ck9abklENUdoRVVpM1F5?=
 =?utf-8?B?UnBONnpSVzIzYXVwR3dkSHovN2FkU3R0SDlhS25qSFR1N1diZ01qL3NpU01R?=
 =?utf-8?B?Q0FOcHJQNmhkTm1mcVhodzh0dldjUFlyenErbFpoUjFPTE8yUGk2Nk9xOHIz?=
 =?utf-8?B?R3Jqd1AvWkRhVXpaNUt5eTVNTDVRMDB2RzNZYVZUVmxodENQRXQ3U1ZseFZx?=
 =?utf-8?B?YWJ3Szl4Nmh4dDhTM3RmajcxUUdKdUtjN0RtZy9tVlpGbTBlWFZsRmNYN0tY?=
 =?utf-8?B?L2hQdTZ2M0pQQVoveDhkQWo1NW9TS2FwTVhSU2E4QkhKemwzdWM4d2NkZ3FB?=
 =?utf-8?B?cmJudTViMmhFMk1PelpBdnFOZk1vS3NOV0xtRlNDTWNRSzVWeGxqZ3FzbSs0?=
 =?utf-8?B?b1hNWlNCUzZJdkxRRlpiMkVPRVJrbTFCQVUxV3pLQkY5UWVOY3hRK1FqOUpJ?=
 =?utf-8?B?bkFOT0Q5WHFLMkhJZDdRbEpydlpiWFk1bFQ3Sjd6K0xxNk80d05EQjh2YVJV?=
 =?utf-8?B?Z0lSUHNZSnE5UENWRWRjYlgyVFd1dnFZSEd3TC9PTFIyTm1vWkduOEszQWlS?=
 =?utf-8?B?S0E9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DxKi3q0VNGXM1fgt0o4E6FTl"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d1e7e6-c39b-4bd7-c354-08dcfe4c4355
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 10:17:47.9983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gojE0ZsNKywvoG+1rfK2V+S87sTWkSeiA+lim8CqNZZImI1o8s+l7RiWKpwI7G28vo86Bn/3CNYjzaMLAbCOxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB7201
X-Proofpoint-GUID: ojUEXsqiRRvlVTXAnjWNRisapCXBupB2
X-Proofpoint-ORIG-GUID: ojUEXsqiRRvlVTXAnjWNRisapCXBupB2
X-Authority-Analysis: v=2.4 cv=dMT0m/Zb c=1 sm=1 tr=0 ts=672b4251 cx=c_pps
 a=h72tj/vcfevIRsfYUpnJeg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=FLbK4t2FqedJJwl0eOoA:9
 a=QEXdDO2ut3YA:10 a=9MHUKu0yIs8Oqg6oQ2IA:9 a=FfaGCDsud1wA:10
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

--------------DxKi3q0VNGXM1fgt0o4E6FTl
Content-Type: multipart/mixed; boundary="------------mETOaq0wXcEiqC2mwg8pIs4N";
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
Message-ID: <d70a01d3-24d5-4e31-92ab-7f6626452852@imgtec.com>
Subject: Re: [PATCH 01/21] dt-bindings: gpu: img: More explicit compatible
 strings
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-1-4ed30e865892@imgtec.com>
 <20241105-matron-gangway-64e78576ec47@spud>
In-Reply-To: <20241105-matron-gangway-64e78576ec47@spud>

--------------mETOaq0wXcEiqC2mwg8pIs4N
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/11/2024 18:13, Conor Dooley wrote:
> On Tue, Nov 05, 2024 at 03:58:07PM +0000, Matt Coster wrote:
>> The current compatible strings are not specific enough to constrain th=
e
>> hardware in devicetree. For example, the current "img,img-axe" string
>> refers to the entire family of Series AXE GPUs. The more specific
>> "img,img-axe-1-16m" string refers to the AXE-1-16M GPU which, unlike t=
he
>> rest of its family, only uses a single power domain.
>=20
> That's not true, you could apply the rules using the ti,am62-gpu
> compatible, no?

The intent here is to draw a line between properties inherent to the IP
core and choices made by the silicon vendor at integration time. The
number of power domains is a property of the IP core, whereas the
decision to use one or three clocks (next patch) is a vendor choice.

>> Work is currently underway to add support for volcanic-based Imaginati=
on
>> GPUs; also add a generic top-level "img,img-rogue" compatible string t=
o
>> allow for simpler differentiation in devicetrees.
>=20
> This makes no sense, how does adding another fallback compatible make
> it simpler? I have to assume that this means there will be geothermally=

> powered axes in the future and you want to tell the difference between
> them and those pesky rogue axes that chop the heads off of naughty
> children?

The intent is to add Volcanic bindings in img,powervr-volcanic.yaml, but
the split between Rogue and Volcanic is... a bit weird. The BXS-4-64
we're adding support for here is Rogue but, for example, the BXS-32-1024
is Volcanic. I figured it would be nice to be able to grok from the
devicetree which architecture a core is using without having to refer
back to the bindings.

The primary differentiator from a dt perspective is power topology. In
Rogue, there are few (poorly named) power domains. Volcanic has (a)
better domain names and (b) typically more granularity in domains,
leading to actual dependency trees we need to care about besides the
trivial A->B->... in Rogue.

Cheers,
Matt

>> Make these changes now before introducing more compatible strings to k=
eep
>> the legacy versions to a minimum.
>>
>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
>> ---
>>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml    | 19 ++++++++++=
++++-----
>>  1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.y=
aml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> index 256e252f8087fa0d6081f771a01601d34b66fe19..ef7070daf213277d0190fe=
319e202fdc597337d4 100644
>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> @@ -12,10 +12,19 @@ maintainers:
>> =20
>>  properties:
>>    compatible:
>> -    items:
>> -      - enum:
>> -          - ti,am62-gpu
>> -      - const: img,img-axe # IMG AXE GPU model/revision is fully disc=
overable
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - ti,am62-gpu
>> +          - const: img,img-axe-1-16m
>> +          - const: img,img-rogue
>> +
>> +      # This legacy combination of compatible strings was introduced =
early on before the more
>> +      # specific GPU identifiers were used. Keep it around here for c=
ompatibility, but never use
>> +      # "img,img-axe" in new devicetrees.
>> +      - items:
>> +          - const: ti,am62-gpu
>> +          - const: img,img-axe
>> =20
>>    reg:
>>      maxItems: 1
>> @@ -64,7 +73,7 @@ examples:
>>      #include <dt-bindings/soc/ti,sci_pm_domain.h>
>> =20
>>      gpu@fd00000 {
>> -        compatible =3D "ti,am62-gpu", "img,img-axe";
>> +        compatible =3D "ti,am62-gpu", "img,img-axe-1-16m", "img,img-r=
ogue";
>>          reg =3D <0x0fd00000 0x20000>;
>>          clocks =3D <&k3_clks 187 0>;
>>          clock-names =3D "core";
>>
>> --=20
>> 2.47.0
>>

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------mETOaq0wXcEiqC2mwg8pIs4N--

--------------DxKi3q0VNGXM1fgt0o4E6FTl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZytCSwUDAAAAAAAKCRB5vBnz2d5qsJEz
AQDN6hDvlisURCcCaqbWV+2ZxTvs0VLyt/s7ONTuW0LQQwEAo4rJ8jaoNqdQNSZyfocaecQQNxX7
J6kV8TzbinyeYwo=
=GMRW
-----END PGP SIGNATURE-----

--------------DxKi3q0VNGXM1fgt0o4E6FTl--
