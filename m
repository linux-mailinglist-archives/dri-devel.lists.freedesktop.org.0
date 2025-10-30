Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B92C1FF21
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 13:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C229610E965;
	Thu, 30 Oct 2025 12:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="T+vuqNIs";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="RyCGHUKl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF6310E963
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 12:12:57 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U6Gpog3747531; Thu, 30 Oct 2025 12:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=VLeq2LfNUjOWeo1ATDgJhOLM2
 llJv9gbL8I4rexNaxc=; b=T+vuqNIsJidK2aYt2caNXikx5ZffINIvowNhMhXWW
 MqJqAE/0a47YjkBiyF6uMoM3wjlXzL/3Yqur4WjF3jrLBZTNTK643qB6A1/PzF+n
 pwmPYtPJjaVWFqSZeNOzQ6JHenyasrAfN3dvFXlQGgwH07ibr77I8kOV+p6glA2s
 kiDEsPejL95Wlj1VOMToEcVsqOm2kOThctkOQGjrweGWE0ytAAgJ/5EYU4zbw9uV
 yLMIXNjVyYWM2XGSOEpH6ghYQKIVemj6HVPij5YjifYoSlEsYdopNej1HAoFnWDn
 5lUqNcIwfg6wPh4azDG6sW5VRU+Snug+f9u5m9EUS2tLQ==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazon11020103.outbound.protection.outlook.com [52.101.196.103])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4a3whxrcb5-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 30 Oct 2025 12:12:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNHpHCUs9CrPrM9H6Vq/O6FFzSykshksBC6vboxKRD4QGFnYNRklZBO6iApGhqYiFT5NPVdLxPvV9P7gjwJ3fR1kVnZlchcIuiWEVPKYhJlwRi6lsxFteMMk2r+B9Pt2Ki/C/KIX5nQH785W2sqSjOMshJo3qY20Mb3rffjjWq9Hky/PPuBrCNE56ucMexmwBbnU1bS+njz+uSe4Ssq1W1a1xCNF1iG+FR7EI0bUsRHyQtkQQNoyWFSKOGsvW1fiM+LU7DMny4fh4rh2a6sk3LzmyJ9ch2FLoijKJzEHwDptolbs2zprqo8F0dg0YTVBzzIXkwoxepQ6DJNSWXtzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLeq2LfNUjOWeo1ATDgJhOLM2llJv9gbL8I4rexNaxc=;
 b=ABiKHZdC5c5tuhbTVKSq62R8jABdRNALksA3nOvYkWQ8kd4ccLpo77EBkKuw5rv6t0aqUKLgZe9sco9EodEWm6rK64UzqcgAgt0q04aQpEIzWJeiJeQ/QpJ+8sVk34yXEohSwSR/T0fYtxpTJJ/Klwd6NxRapYsUORt3jCoXBIsXZFqHbvJhQl8YnvBzYt0ISWp+hNgPFy6485RTQl+l4FQVtk8ZaaAHXBXI9hvOh4QK+3oxlmadR5j3m6GC84jbUs859f6sJMXkzZsSo/vD6U4GeYgDwgi0NXIyjLc7IjFdzceL4NOhvNbaMN3G8FbnAfYNug9R/DzgpLBV8x/4rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLeq2LfNUjOWeo1ATDgJhOLM2llJv9gbL8I4rexNaxc=;
 b=RyCGHUKl05ed3GVntX5xNHHu3aPf08zrkcQ3I8psNRbLM0EqqS5PTOPOZNHj58dkOquYE5wbbyT6rW5xTEmjM64LqN7WHHM0DL+g899f4nICdBQZdQiwD1tFn52jcmiwenCa8BbLnf+vm80PwQsNGDJKdUtVRMpbRHlM8hVAsCo=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO3P265MB2107.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bd::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 12:12:37 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 12:12:37 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Fix reference to
 devm_platform_get_and_ioremap_resource()
Thread-Topic: [PATCH] drm/imagination: Fix reference to
 devm_platform_get_and_ioremap_resource()
Thread-Index: AQHcSNqcrMZiDMvXHkKJXb+ZmiFD57Tam0CA
Date: Thu, 30 Oct 2025 12:12:37 +0000
Message-ID: <46427040-fd79-410e-b4eb-3197f2a60dfd@imgtec.com>
References: <2266514318480d17f52c7e5e67578dae6827914e.1761745586.git.geert+renesas@glider.be>
In-Reply-To: <2266514318480d17f52c7e5e67578dae6827914e.1761745586.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO3P265MB2107:EE_
x-ms-office365-filtering-correlation-id: 217af510-09b2-476d-c337-08de17ad9dd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|4053099003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?YmxoaW1IZ2VVbitkTWluaFYzb2ZTR3hmMkd3dGZXdDd1aHNFNUJaTmYzN3dQ?=
 =?utf-8?B?bTVkZktwMkx6V21CQkUzMld0WjhkaU5QaGx5OW1vdzRzLy9QN0Y0L3dDdms2?=
 =?utf-8?B?V0xJSXpVcWVFb0tRMG9OTkY4RzVIVDk5UUZMYzE3UzErckpFbGg0bnQ0cGlC?=
 =?utf-8?B?Sk1PMVEwc3JrR1EwYXdVbU9WRENDeTA1MlRGb1lya1dOWEF0MUlCQzNoN2ls?=
 =?utf-8?B?cER1a2RqSzhWRUdibk1Yek90SFIvQ2hDYnBQUUhVaG5EYVNrL2lxdlVJRlpC?=
 =?utf-8?B?TWJJWkNwVDVod3FuNEtZdFBhL3RIZEp1aTZ1NmVPSm5Bc0lGY3VjQU1NWVZr?=
 =?utf-8?B?VVYwd2czQXZ6bzMwbkM2WGV5WUxpalhjQ0xPNkhjMDJwcjA5YjI1Rm1URll6?=
 =?utf-8?B?ZFkyLzQxVThVT25XS2djR0k3cVU0dngxdFZDZzZWdDU4VHE0dzNEWGswclZY?=
 =?utf-8?B?TW5ycXVUUCtRTE91RStMcGtKNWpoQUcvc25tR2FwWFVxU2l4bjc2Qmg1ZTBB?=
 =?utf-8?B?a2c5TmoyU0FsZk1pcGo5MjNtaThPS2ljaG1hNzRzY0lBZnlUWlk1TWsrRXlC?=
 =?utf-8?B?SENLeE51UjVxMlRPQ3VxNmdXZG5Lekp5M0pjdWs2QVVIZWgyaS9wcjgwNzBS?=
 =?utf-8?B?aHZ5YUhycjZhNmluT2JaVzliMWpBNGJaMWdCa09HeWhoRWlZcnI5Mmh5MjlD?=
 =?utf-8?B?aTFYSmtPRUswRjM0U2JLWTFmSHZaWVBxTHJmY2U2cnZndENsRk1pNVRrY29S?=
 =?utf-8?B?VHhXTnNZRGZHRldodThwSlBsUzJSa1dSTVpXUlhLSmpVenN6djlHQXF5Smgy?=
 =?utf-8?B?YXFrbHdhNWN1TVBMa2NvM3gzOUNYZmpxd3FkZi9oOHJZRzNSQ2tXYzN3UHpp?=
 =?utf-8?B?RXRROThTZnRyRDZQYysxaXlOb0lpNFpYSGY1TjVXdms1ajBNQ1RnLzNGOWlT?=
 =?utf-8?B?ZGZ1amlEWlNiSG9TbS8xcHhBYTZxNUp0OTdRaTVVS1huZk1JSG5IQmV4UkpZ?=
 =?utf-8?B?aU1MM3RVOGpyblM4S0JHSjhrZXY4Q0dkaS9RTjlZUWNOeE4wQmZvSXpYaVd2?=
 =?utf-8?B?eXdWNFE3TUkwNi9TS1lGT25XWmNGbk9rM2U3VjkreThvZDBEWTQ2Mk1KQ0hl?=
 =?utf-8?B?ZmYvYlNXSFA4OGJTTzlQZFNJc1oxT25HZEc0ZmRlSFA3OUZOZHFFVFdYWVlR?=
 =?utf-8?B?WUxDbmVkKzBOR1ZHL2IvWnAranFtcVZwMTdTcFJLeWZoQWxyT05VbUppT1g2?=
 =?utf-8?B?NXJUUG9wVDJ4UFZ1R1FCbENxaEptTWw2Skx1TmVBbUJRaHdGdTR5ZUl5Q3U4?=
 =?utf-8?B?NnhUT2hLYXVGL3Q4bUdHOVgvNWxBMy96MllycVdqUjFXQ2lCa1lrNUMrVHJQ?=
 =?utf-8?B?aERlV3NKTVJZdk9pd2tOTklvRitGOTdidUM0MTBOS2xlNWhiMVhDbFN2UHl0?=
 =?utf-8?B?eWI1SzgvVm9MTVBrZjR1c2hjMkNtN1NicVJrNUFNUlFMZFVsTmtLMDl2ZnJL?=
 =?utf-8?B?ekVMNWRRVWFnNitTMTUxWXNSZVdvVTVTeFpJSGZyaytpS3VCTmhoSWZraFk3?=
 =?utf-8?B?VFBjMEVkQTVMVUx5M3hGSDhDckNPQkdyS0wvc0E3MnVPaStTcFZRdEFoemFW?=
 =?utf-8?B?TDVrUGt1OWEwcFJyR2FpTCtrWWJSS2hHRlQrRHdWam5aUHplRjlDdkl5L2Ir?=
 =?utf-8?B?aXl5VDQrWmhDZmk1T3JEYlNHMmhYRnhsdkwzZEJrV1FYVXJvZHNpY0s0emJu?=
 =?utf-8?B?S2UwWXMwbEhRQXgvRTQrSUVva1lwclMzTFhrN0w2Z21KK2U5TGl2NFR4OGJw?=
 =?utf-8?B?KytRaHQzeXVFbHEvY3lqa25WNnI5L0xXR1hsQWlHSFNhYmhhM3BqeG12aGNs?=
 =?utf-8?B?dkNYbmZ5bnluUUdZVm5Dd0NxOWdmR3RRSGp2RFR3L1JFUjVxZ1VDdEZXQi9j?=
 =?utf-8?B?bXY1YWdKbGFvVW9kVVI4SzdFS2FmMkZHQTJiWU1lK3A3a1BNTW1NeE4xZitr?=
 =?utf-8?B?OFpsN2RzWllnK21sa09tcC9iNGJZVzZrZTVrTkFnYW9lN0dKSlk1cUdCNGpC?=
 =?utf-8?Q?HfWULw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(4053099003)(38070700021); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWVWUHBveTQ3c3IwZVI1WmEzbE5WUGlVUXFDcjFsWTg4T01POGw4VjdhWmhn?=
 =?utf-8?B?cGs3NnJNZEZXRGJIbUZxelREdGQxdEVoTGdKcmhpU2tHaDNxQWcxbVdGWHpK?=
 =?utf-8?B?RHUvVjZRaWdLblpIc3kxc1ZXVFowckZBNE5acmM4SjRxWFlZWCtxUlJ6T1hX?=
 =?utf-8?B?Y0Mzb2QyeHhkMEhrb3prS0cxNmRzdHJxNDlpWmVOWTVDUU95UHF0bXhnTmN6?=
 =?utf-8?B?UW9aUGN3dk9Bbkhwb25mYlNEQ051UzBYYUJWZnV5ZStDL1pobUZUZzJiRWFp?=
 =?utf-8?B?MTdZYWJuMktLenBMS0U3VnRLVTRuMHg4Z1hENkdEOWFUM0hHajhLZHlYcVps?=
 =?utf-8?B?REs5Qks0V0VmeHhsd281VlNES3NUUnBWQXB6QWM3cU9MWWFGU3RNMjB4V2kr?=
 =?utf-8?B?NVRReEtiMGhvbmpaaTV4ZkkyM1NzRlhWRzRtVTJuWlpjWlNzL29YU3QxWms5?=
 =?utf-8?B?WjJQc21KdU5vT1cxQ1huTzljN3V0ZXJZU0R0Wk9YdnFBRDB3NnBWbkJaR1Q3?=
 =?utf-8?B?Snp6UmNrWVJYZTNwSDNLMlNtMGNmK2lnMU1YNVRCTU9SWlh1UWVKRENyNzRN?=
 =?utf-8?B?anVQSUpoUm8xSWhROEdSOTN5RG1FKzJ4eTM4NmFlVGRYYmdxZEZYRXE5TThk?=
 =?utf-8?B?Y1hKbnl4dG5BUnpnWXVVQ0ZvQlNFMDlmMlI1NkF0OUoyaHd6Y0lYVjd5Uklt?=
 =?utf-8?B?bW1iSEJBbndJcWtFTjIrRXdUNmU5bWNOOEFOQm1mK0xoQlA5Mmo0ZEVvWVB6?=
 =?utf-8?B?bjAzSFMyVHlQWHhheG00VEtkRGpWNmRWcWZjdWRybGVpamJwYUtxU04rdncx?=
 =?utf-8?B?a3ZpZ3BvTW5YKzNYZC9BckRVRXowYjZ4ckczdWhmbFJ5OERNc2NQTkphUmdV?=
 =?utf-8?B?dHFyVWZpakZocGV0dWRlbUI4VjZVc0dKeEFyYVRYNHZoRm9sWm1jTGVobHlu?=
 =?utf-8?B?REM2YnJKbUZCblhvU2JVRjk5aWVpUmIwdkFyV3ZSVGhiQ2l5dTNXQVZHM2pR?=
 =?utf-8?B?OGdqMGYrR3ZWSlg2R0hvNXJCdTE5TUZHZFIySzZjVjNMOTgzVnpYcGoxemFY?=
 =?utf-8?B?VXlqMGFhVGQxc3hXQm1PQ0xlRGpxVlJiUFhNZGZvd3FxQWxwb1piYWlNZFlt?=
 =?utf-8?B?Q2ptNkU5eDFtQVJLNnQvVG9FdGQ3OVZTT2UyVGlzTmdTV2lIY3hpU1oyNFg3?=
 =?utf-8?B?OEpXcXpJRnhqTkE5LzdPZ1hSeGUrWHorNjZyaFBhaUdtR25sbmJ2RnhxUXVk?=
 =?utf-8?B?dldERzdxMlpENU1qandvMkp4SEVDTUR0ek50Y2F5eW5oc2RLSGthQlB5Skhi?=
 =?utf-8?B?c0h4ZERFYThCNnYxOWl1WnI1V2piZjQzNkVOYlZsSWRKbDRmWXMyRm5DRGp5?=
 =?utf-8?B?elV1SW5BSTlJek01dVpFUWdQdjZQOHZDVlkyNHlYc3prYUlRZUF5ZmFJWUdC?=
 =?utf-8?B?T1oyN1VyS0ZjNWhFYkhteDQ2RzNSaWYyVVlHUEdHeHZxWXROMWwrRWVUdGZ4?=
 =?utf-8?B?VlFreG9hcHJOUkZxNGxSUTg3dEhJaVdyc3haTHp5VjhNTUFUNDBqYVM4MWx6?=
 =?utf-8?B?STBDRnR4WmxZUUMzSlVPbmtJSkhDU05ieUtoSUFYOVN1ZHIxYkg3WU16aDFH?=
 =?utf-8?B?Z05PSFVzVmVtdGk2UFhyc1VCajA2Z2JydEJrQndNNkZLYUZENWk2UGlQNzNh?=
 =?utf-8?B?Mnl4RDN0cVlTVWs3TmdKSzNva0VSbHU5blNUWkg0ZHRrL1AxVC9BUFMyNWFX?=
 =?utf-8?B?eFJyWW5QU1J6YmU1ZEpmT3c3UGE5NkgyM3oydmZQWU9ObkZ1Zld6ZThLRndZ?=
 =?utf-8?B?cnVCUWlzdFBydkJ0R3ZsUUtkalljYURkVEZzL0hEMFBlaTllOWROYkQ3SFN2?=
 =?utf-8?B?cCs4UnhoSGRqcGZ4VDFVb0FKTzhzakZHZjA2Y0R3OFo4T242Y3hackw4VWF0?=
 =?utf-8?B?anJFaklvVyt0aS9WY2hqV0puV2ZrRzQ4M3AwSTJRUGxGcEQzUlJDR0kxdmdN?=
 =?utf-8?B?c1A0bzlFMXJsMFZsNEVBdFdjSlJsVm4vZmR2QkFEOUQwUFZMTUlsNStVNTBn?=
 =?utf-8?B?UW1RKzJoMkJZdWZPTDNYZmRMazhtQVBHd3VpS3BPL3FXZS9FOFJEUTM4Um9P?=
 =?utf-8?B?NFhBOUR5Q1pMYUQzazFqNmYzYUt2TWNUSUxyMVJIS3F1M2dzM1hjck9mc2Fr?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dsyRA508FsUGix7PyRmTeZ6v"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 217af510-09b2-476d-c337-08de17ad9dd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 12:12:37.7657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AgASvedbWs8y4c0iqsGZksIrLEtMVm22aP+GjpPehuHxUO+qNTrcbTgFyH1QvTML9OemTfxnWAheEKLl6g73cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2107
X-Proofpoint-ORIG-GUID: onevt2JP_kzyi0M8eWBbPDiIxqSauySc
X-Authority-Analysis: v=2.4 cv=C5zkCAP+ c=1 sm=1 tr=0 ts=69035639 cx=c_pps
 a=goIM1Sk5nqDoqfqAvNsECA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8
 a=O8q01JijZ9Fpd_zQvg4A:9 a=QEXdDO2ut3YA:10 a=3aYz4DS6wtfHXel0r-EA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: onevt2JP_kzyi0M8eWBbPDiIxqSauySc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5OSBTYWx0ZWRfX/b7e/D3eYoCD
 qCwaSABiE/T2pBjrGpSGfAxUL8qCcsDU0lV/495+h+b33jElam4+PPEvONVsC6gSW1WJnqpTfQ2
 gzEAwP4diQtlO2tFDGBG1caznUzuPOjPHsJkLfAUCXQb4ZfXKrvJkiQS0XByPxmgU19XsLTNYvJ
 ym4NKwleEXgHCUt2P5dveErw+ynjPsoDnidXi2GEbVI1YyBE5aj5ciDCxHtv1Fv+zNPx8VyzaK/
 rSj3LGP75kCvtNZ5he/te45sTXf5uvSjgm5Zs6rzlN8opB/3164JCiYMu0n3IOKsyO3DazhOWm5
 2CU7Fuz6dupB++2VDUhIyjqg8avjVWFe91Vcbyy7DeHcn5ZQqOqEJCh/hM5whjxFJSWjXyPzRVT
 KqGNRDdfLg/1fUZlOi71Ub9QYZr4fQ==
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

--------------dsyRA508FsUGix7PyRmTeZ6v
Content-Type: multipart/mixed; boundary="------------TUUqT5z4zlkhDVX7ARLuXBqk";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <46427040-fd79-410e-b4eb-3197f2a60dfd@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Fix reference to
 devm_platform_get_and_ioremap_resource()
References: <2266514318480d17f52c7e5e67578dae6827914e.1761745586.git.geert+renesas@glider.be>
In-Reply-To: <2266514318480d17f52c7e5e67578dae6827914e.1761745586.git.geert+renesas@glider.be>

--------------TUUqT5z4zlkhDVX7ARLuXBqk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On 29/10/2025 15:00, Geert Uytterhoeven wrote:
> The call to devm_platform_ioremap_resource() was replaced by a call to
> devm_platform_get_and_ioremap_resource(), but the comment referring to
> the function's possible returned error codes was not updated.
>=20
> Fixes: 927f3e0253c11276 ("drm/imagination: Implement MIPS firmware proc=
essor and MMU support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for the fix!

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

I'll apply this to drm-misc-fixes shortly.

Cheers,
Matt

> ---
>  drivers/gpu/drm/imagination/pvr_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm=
/imagination/pvr_device.c
> index 294b6019b4155bb7..78d6b8a0a4506c80 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -48,7 +48,7 @@
>   *
>   * Return:
>   *  * 0 on success, or
> - *  * Any error returned by devm_platform_ioremap_resource().
> + *  * Any error returned by devm_platform_get_and_ioremap_resource().
>   */
>  static int
>  pvr_device_reg_init(struct pvr_device *pvr_dev)

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------TUUqT5z4zlkhDVX7ARLuXBqk--

--------------dsyRA508FsUGix7PyRmTeZ6v
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnoEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaQNWNQUDAAAAAAAKCRB5vBnz2d5qsFV2
APjY+J5hh7v1O+ZPJXM1c0JwFw73FhwRULqT8ONZwKs2AP0Ut/mSmuJFdynKG6tABoF1rPxbjNET
Q7SeiFyuFcs+Bg==
=7xT2
-----END PGP SIGNATURE-----

--------------dsyRA508FsUGix7PyRmTeZ6v--
