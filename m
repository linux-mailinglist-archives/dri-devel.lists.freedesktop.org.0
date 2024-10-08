Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC9B994330
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 11:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BFC10E048;
	Tue,  8 Oct 2024 09:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="FzEebQQ+";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="iixzR+0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A30810E048
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 09:01:18 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4988CKMI029643;
 Tue, 8 Oct 2024 10:00:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=5azu6aNnneZtEXLYAZiAUP+Ip
 0RZhqcbdgR9DbJ074I=; b=FzEebQQ+s0l+scjnp64PauQPqqNCVf7Bp3fIPrJrc
 S4kdYpikEDUVUD3TqGJCNsjz4NIK5TS4CFWIqTf5mm5es3Wxy7uEcUkWhw7xmo72
 gO2AkgVB66/87rNNEgXa55n/T779KCvSmm5K7y2Xk1wUIEXzCDJ94IX4DRaUTyGh
 nPv2IVqyufOk+164tjxsy7WafnrL93ehBw6vDtudj9sOiAneo5HCmKO41IgkqR8V
 Mh1Ja41gddxw7O0yRt5fCMWP/1lX1ZR87g9DgW60AurKwT2M16IQPBQTQoG+MZyM
 n8G4h2OiZ29PIAoQsW4sLnRw8gcnlo1c/SaRFL8iwZ2SQ==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazlp17012053.outbound.protection.outlook.com [40.93.67.53])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 422uqt23cj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2024 10:00:56 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKWbehElAptN1M0qtqSJRcIQItTeoyhF16zIkmJ33MUZvAu0/KZMDRrfdJf53EqJQQeDniIKoL/4kJa/bPvh0LwULdHa87nxt/bSUnAaxKafp+C5ydsi8VjM3hsAsK2YvtBqoaI/ipKohsxu8XfvJ42l7uCtYHaNorO+1mGqLbv+5QC0oO2ef3L+nOMjH7HVwbe2CvqUIhE94FpVtOi2fHhp89TYB4FpKBpgvE48BGfznxa/zipUni+2AvYymyKgIeGGA+Up8xpRBnwdGjLAvMKHT6QJpPHrCzbNR1ODCa/J4zysFp3+4WqH2hvi9GD7pFV1jC2xjv/j36RTCru+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5azu6aNnneZtEXLYAZiAUP+Ip0RZhqcbdgR9DbJ074I=;
 b=qEYHg+Ze7Ugl2YoHuS0TfdygCqer3W2MJ3gcZ/i1ydmMCCXD6ULJJ+4ESFUCtogaHaJ6LRtWnN7YsEgAQaZqfN9/YRIaCMNyGovJiepk6O5MYcn1cuUhtilPDjxnWFLaocO5R//So6uVOGhUvlsw+7WfR7ai5SZr2RM+bZ7Q3f0qVv7ZxXZGswNqAOEKG34cplOyaD4YrCUXaVQ90pRVwzUeGPLSs+liYf26x3iI6N6sfWTZX4/oHyFQUA57YXBYqWrbX7n0z7E4HaSrhawfHjRoR1j69uRveZ+RxiPcqfT+ojigC9yaxcWlJVUUV86nU/HhNrLiuekJ7m87SIcwOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5azu6aNnneZtEXLYAZiAUP+Ip0RZhqcbdgR9DbJ074I=;
 b=iixzR+0gpSkP0J5pQsNa78br6pbSFHVWlvltF3bKdmUe1QonZwJdT4qinKKtBYwZsIxjQMpCP+mgajORBzmaFgaICC+8LCUJy3R6czSNbwBbAHAxGSw1+hm778L4IGC1tGJ5JbDWchTrz6TNB/LsQHGBMJIjY2H7FFVhkPim4iY=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWXP265MB5273.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:192::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.23; Tue, 8 Oct 2024 09:00:52 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 09:00:52 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@baylibre.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm: Switch back to struct platform_driver::remove()
Thread-Topic: [PATCH] drm: Switch back to struct platform_driver::remove()
Thread-Index: AQHbGV6J8X5TJQ0FP0uxNc4zBF0ihLJ8jmiA
Date: Tue, 8 Oct 2024 09:00:52 +0000
Message-ID: <cdccc8ac-b128-4326-94cf-4396376729e5@imgtec.com>
References: <20241008084552.461361-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20241008084552.461361-2-u.kleine-koenig@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWXP265MB5273:EE_
x-ms-office365-filtering-correlation-id: 986b889d-c934-4e83-4c55-08dce777b635
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eXFRV1lIWExVTmxEUU9ET1hnYkRIZGJYbFFKVWMydTlHZys4aFdsVkQ5blFY?=
 =?utf-8?B?WnpaNHV3Y2duZE5BdC9tV1FmdmovZ2V1N1VoZzZDekFOdndIaUJRRjhXZTI2?=
 =?utf-8?B?dlluVlBJS3BqQ2kvV3lEVFhkdDcwaGM1Um9oc0RSM2cyUzNybTFqK2NhR3lK?=
 =?utf-8?B?YjZkUmIwNTJucHFhNGg4THFPN0JOYlJFcWdBTEltVG1Qak1LaDBxWFZUK29o?=
 =?utf-8?B?aUNyMGRoeFJ6UUNOMVM3dU5lR2E1ay8vamE0eUpydFQveDlQK2h3WUJBekd3?=
 =?utf-8?B?TmFCcWREQlYrRzh4czZZYWVDdmIvYlF0RXJzSDZmVDBXcjFRcGN5UEJ3Tmx5?=
 =?utf-8?B?R1NZeVVjY1pFOHAxdnpRNVExaWJtWjZSYWVneWxWQ0VweDZCRFEwN0VRR3Rq?=
 =?utf-8?B?Nm5IdFhMRVVjZ01PRExyeEhEMDRtSnNuOEsrYUdNd005UDVSZHlCcTQrd0Nu?=
 =?utf-8?B?NFJkYlQ1bkhNbjFjeWdhbjJkTFl2OXNhQzQwNU1zVU1IRitKb3pBdXp3MWxR?=
 =?utf-8?B?NFhnUWdCQ2hRa250OG1meUhmUHFES3B5VXl2YmxzcGRWbnJIbmhUMTNoY2Yz?=
 =?utf-8?B?cFFTMkJFTGtJYXdLL0srcEZ1V3pVQnVYbTZRdHZKeER5eUlEMjZCVGU0WWRa?=
 =?utf-8?B?RUdTejBmRkhxaVNrUlBPdEZPUzk2MXE5c2cvcG5pUnBrNjJmODVRQnV1N0hQ?=
 =?utf-8?B?MTk3cExrQlhGWHpkcWN3djc4UWs1cjlMR3lNTnV6UlFhSDhtUktvbjFMMDFL?=
 =?utf-8?B?QU8yS3pIYURwbEdkaHdWbTR1ZWVSSHdKZmQ5c3lOMFBFRmlxeENRZDNIOFFy?=
 =?utf-8?B?YWtuZTc5QkMvaElFb1A0aDBwcklDYmQ2UEZPT1FDb292dklRSnNqOC9SRWJ2?=
 =?utf-8?B?YytEZ01LVkVWMGN1Z2Zha0k0Q3ZmajhYeTlSMGlBTzJSY0pBNW5yaHl1RU9L?=
 =?utf-8?B?RHIvS2lWL2lIYmwvOHg5RDZrVlRac3ZIVmtQWms2djdjZ3dGMzBJanJxT3hk?=
 =?utf-8?B?WFVTVWRtWGQrM1k4TnhVeis3aXU1WFZwMU9FeDNobWFRcHd1eGN3Q0tXbXJ2?=
 =?utf-8?B?cWxiQjNNWXJNNW4zSzd4VVZoRlpmVGdrQmlaRHAxdEduMGp2Znk2aURYSXFm?=
 =?utf-8?B?bHRXWDVPeERiU3NmNnJIQkpzVm11QXI3SmJjcVo1cURHSVA3RmVhYzdSMjB0?=
 =?utf-8?B?MnQxanlTS3o5ODQ0MUwzYnhhcmhoclpZbmd6R2FzNTA5QWxSdy9Vby9haFVi?=
 =?utf-8?B?cEdpWjRVUFVtNlJWR1daSWtybW0vL1ZSZUwxYmk3ZWVKNmgzTjRxWnRncWJJ?=
 =?utf-8?B?OTBucmhyOHNVdWhPdmhzVlA3dEoxQjAvWWRXZ2ZIcnRKQXFxMEF3anA4L3Zw?=
 =?utf-8?B?UW1iR1VSVS91WG8wZGpwTEtPSFk4eHR3V2Fvb2REMUdEbGQvd1hKdUFSNmVG?=
 =?utf-8?B?RkV3dzRrVnZUWVZUUEdmQ3NDR2lkbHNhOXgwMGd0Z0JIbXhXc0czNVZUUVZa?=
 =?utf-8?B?YlhZL2k3QnFKMnFkV2FlT0FHMHVBbG1ZcVE1OUxMaTQvejV4M2ZISGo1cTZ1?=
 =?utf-8?B?cWdaYnh3MUo3WXNwZFgrdVJJRVVEQ2hlcGs2UXVTQTB2dkxPbUhtdDlWemJq?=
 =?utf-8?B?MkRXcmpiZWF0QXYxUWRmdWUxUFVGbmxlVUZLdDREQlozTTQ2aGhxamF4VUVj?=
 =?utf-8?B?SE4xQS9wbE5PNkkrSVVyOXk2TWl0blpqak9jK2Y0STFPRktEaCtwa2MyaWtr?=
 =?utf-8?B?azBmUmFQb1dSaGtYU2ZaOUdQM0tWY0JwUnk4MDFPT25PcFN0QW91dHpqVXow?=
 =?utf-8?B?U3dsQUloYlV1SCtiNVVLUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFYyOXJOdWRSN1lrVXBuVnlSQ3lGc0pBdmpyUVI5NXBDcVdBaEFnb0FGai9j?=
 =?utf-8?B?eEhhRlJBa2VGZ0k4a29XZ2ljdjJabGZjeWM4bEx0SjlLQnY5YnMvaFQ0ck5r?=
 =?utf-8?B?bTYyc25aSFlxbkhMM2tCYkcxRis4QkdheDRzM3Z5RXpzc3U3b2hUT3lDcWRN?=
 =?utf-8?B?aHJ4UmNRbXRwVElRWklBT2ZhZ0Y1b1NHYlRlNWdKcGpEWlo2c2FRdTB4SXdm?=
 =?utf-8?B?QU43MXplK1IyK2tBZlVKQ2NPWTJWcEx6OEs3b0wrcXZyU2RuUXVjaW9ZbVdu?=
 =?utf-8?B?MnVORXpvRFQyTEc2eGZKTXppTWFKTS9BUEtTOUQ0aGpPaDVCZE1wOUR2TndO?=
 =?utf-8?B?UDF3Q1JTeEVzOTYrVTlKUWFkdGpKZUpsUFNJNEp4ODVxWEsxajdha3JCcVdt?=
 =?utf-8?B?aHBEQ0N3QmlNanNBSm44MGhnclZwZzBwcWFxUC85VEtuNlhIdjFBemxod1dn?=
 =?utf-8?B?djdYWm1XWlFSaHdQMnF4d0wxWStBZlJmMkl4YnRZZUN1d1lnRmtoRlpBa0Nj?=
 =?utf-8?B?VjdVNG54T1lwSTh1YWxBd1lHS3lFa200cDFDbDZ5R3VOYXN2Nk82cU5QMVlC?=
 =?utf-8?B?aGN5UVAxRmJxYlkyRlovOTdwTGV3eFdpTDBIaVRuUVZoZ1dXbHRPak1XZHQr?=
 =?utf-8?B?VklMNkFTeUpGODFiNm1iS1FQR1ozZzRjM29LaDBxb09sS0dqdGxJWGtIU0da?=
 =?utf-8?B?WVVBR1ZTV0poR2lCUkh5N1pjWFRraDFVbkYxNWVmR3JHM3NQdVkzcmsvei9y?=
 =?utf-8?B?S1NhaUFRSzkyam44cmc4Sy8zeHYrejFQc012VENzV3JVcFo3ZzNiMEdBVk5p?=
 =?utf-8?B?blphYkxGcHhlVEZlckIwZ2NhL0IyZXZoN3VWYmhqclJpbmhDOWZVMk5KZjV4?=
 =?utf-8?B?Qmo5RXhuTUVUcUZYdk45ekRSTWFQVlJjMlA3d1FVem8rWHVCYzdQVk9zcjBP?=
 =?utf-8?B?VkV5cHU2eUcwdm5rU3hZdkd3b09iM1RSRC9iZjZMTkpsenYxeDQzOWdoZzZp?=
 =?utf-8?B?WS9XT0hiNVNmU3Rab1Z5MWYzZEJJbk1xMTJjaDgvQnBUQ094elhiazVONEp2?=
 =?utf-8?B?QnUvd29HWjY3ejY1eUhMam1tQ2c5ektlb3lwd3E0Z2p0a0NUZjBWK0xsWGtC?=
 =?utf-8?B?MWc5YkZRYUhzN2o1OW1BV09IYW91Z3RHakViWGl1M2tMOVV4bWVzUVcxQTU0?=
 =?utf-8?B?TnVzQUViV29XUnNUNCtsYVhIcFVrN3NPbXRhd2hkMXBleWN3bXNXVXhZNVR2?=
 =?utf-8?B?bXY0Z3dSYUJ4ckN0RG5taTIxckp1L3lqSHhOWEpRRytPRHNkbGJFdFhuRjNS?=
 =?utf-8?B?V2tvNDIyUnlBYmVJbDBkTkF5R1dYWmVWL3dqZ2FVdlFobFU5R3IwUER6U3FG?=
 =?utf-8?B?K05ldjZWTEhiNU9WQzNCd0RIM0RqNyt6N3gzUkNBKzRnbjlQc3prSGtyeEpI?=
 =?utf-8?B?bDJBZlltdkR2Q2docjNteVptRGxZc2JNV2pDQVozeStieEt4ZXJCL2kwcWl4?=
 =?utf-8?B?UmJwRjJ5NXh5RTJvN0xEcS8rREVsZFpMZzN5WU5yWFZyMGp1ZFZrVldPRTVQ?=
 =?utf-8?B?ejJjb1V2L00waVhyNkdEY04xTC9Bc25pNFhwcGpWcVk1YVNWcTkvQXMvdklS?=
 =?utf-8?B?OFVRQjlGVENqcFVnSldDWG90aG5hbnY1WnQ0aWRjcXMyUnQ1MXZrMk1temJy?=
 =?utf-8?B?cmg1RE4rMk9SVGVkNG5XblRncjNOS000NlNlS3VRY0lXUEtGdXZvZnRRa0Fn?=
 =?utf-8?B?TXlzY2JtUmFIRlFjR1hHYkwxU3FMb1JJWHRIWEppT2JIRkRpb2ZVaE1PSmp0?=
 =?utf-8?B?V0JYNWlvMHg3Sll4b1J4NGtNUjZncThEc2lPVUdndTlod3ZsOGh3bzNYZGxx?=
 =?utf-8?B?bG45TFZyWFQ2M2tIVzhDZ093c1lEWEpmd1AxdjRmYkdHY2R6RnpwUXRIWUpp?=
 =?utf-8?B?cEFjLzRNK1p4dGtWRzRMM0dQb1gxdlNrcVR6Mjl4anRJR0tpSE9BMEM4bXUr?=
 =?utf-8?B?T2s1MU5HeTRDdzNtSUpDMHRrSndvTTN2QktlTG15MmYxbE9NclMvZXBZM01J?=
 =?utf-8?B?NmU5YlN0eUc2bVZadkZpMmcvRkpBSDFGRWZlYXcwdndNeGgweTFnMlJhS3ZI?=
 =?utf-8?B?STBtQXpOSGVaSWhVZVFETWgrejEvNjBqMjUzUGRPZkF6SlZpSHBOSUJCMmN3?=
 =?utf-8?B?Y3c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9nmhhSQKIKxAMw3kieeeaKtq"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 986b889d-c934-4e83-4c55-08dce777b635
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 09:00:52.3619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZgoMwbaJ9VwxpXQnpTZ8CksKk2lXF/BpGeDfLljHtXLXhff2Kn5zGx22KLnhBAPeT3dEt8gSCa2A1q0zfPzEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5273
X-Authority-Analysis: v=2.4 cv=Cata56rl c=1 sm=1 tr=0 ts=6704f4c9 cx=c_pps
 a=ydJsu2O7MsUe9Yn0EaA5IQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=IpJZQVW2AAAA:8 a=r_1tXGB3AAAA:8
 a=mgZGAhXZ-9qmyY36Uk8A:9 a=QEXdDO2ut3YA:10 a=SvUsCyxyieUgjzPH7KIA:9
 a=FfaGCDsud1wA:10 a=IawgGOuG5U0WyFbmm1f5:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: u12u6YP3atExcax5XWvjabPvB2fLbxLl
X-Proofpoint-GUID: u12u6YP3atExcax5XWvjabPvB2fLbxLl
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

--------------9nmhhSQKIKxAMw3kieeeaKtq
Content-Type: multipart/mixed; boundary="------------kGoMOTTsyma9siJh0HB02Zkn";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Message-ID: <cdccc8ac-b128-4326-94cf-4396376729e5@imgtec.com>
Subject: Re: [PATCH] drm: Switch back to struct platform_driver::remove()
References: <20241008084552.461361-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20241008084552.461361-2-u.kleine-koenig@baylibre.com>

--------------kGoMOTTsyma9siJh0HB02Zkn
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/10/2024 09:45, Uwe Kleine-K=C3=B6nig wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>=20
> Convert all platform drivers below drivers/gpu/drm/ to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As=

> .remove() and .remove_new() have the same prototypes, conversion is don=
e
> by just changing the structure member name in the driver initializer.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>=20
> given the simplicity of the individual changes I do this all in a singl=
e
> patch. I you don't agree, please tell and I will happily split it.
>=20
> It's based on Friday's next, feel free to drop changes that result in a=

> conflict when you come around to apply this. I'll care for the fallout
> at a later time then. (Having said that, if you use b4 am -3 and git am=

> -3, there should be hardly any conflict.)
>=20
> Note I didn't Cc: all the individual driver maintainers to not trigger
> sending limits and spam filters.
>=20
> Best regards
> Uwe
>=20
> [snip]
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/im=
agination/pvr_drv.c
> index 684a9b9a2247..6a27318ecb82 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -1482,7 +1482,7 @@ static const struct dev_pm_ops pvr_pm_ops =3D {
> =20
>  static struct platform_driver pvr_driver =3D {
>  	.probe =3D pvr_probe,
> -	.remove_new =3D pvr_remove,
> +	.remove =3D pvr_remove,
>  	.driver =3D {
>  		.name =3D PVR_DRIVER_NAME,
>  		.pm =3D &pvr_pm_ops,

I don't know if you need and/or want individual RBs from individual
driver maintainers, but just in case:

Reviewed-By: Matt Coster <matt.coster@imgtec.com> [imagination]

> [snip]
>=20
> base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------kGoMOTTsyma9siJh0HB02Zkn--

--------------9nmhhSQKIKxAMw3kieeeaKtq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZwT0wwUDAAAAAAAKCRB5vBnz2d5qsKfm
AP0Sz0/AllmmiMsb7OeYJIQ9VB+PM2GARqbKrx8IYysNrgD/QPL26h+U6eXLpiFAFK0E46nkxlGh
cXQt1fbzB9ni2Ak=
=M3cQ
-----END PGP SIGNATURE-----

--------------9nmhhSQKIKxAMw3kieeeaKtq--
