Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961F09620EF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 09:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C3110E4BC;
	Wed, 28 Aug 2024 07:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="iVsgildA";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VsK++v5r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A47610E046;
 Tue, 27 Aug 2024 18:48:46 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RHMnnn028197;
 Tue, 27 Aug 2024 18:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=corp-2023-11-20; bh=igjtcnHDBDTJmrkKonygL4/Il4s5NOrLzA5di2mNv
 jo=; b=iVsgildAp98+hw9yJQSDJST+FPZX4rDUsgGdxEoFa9xiim4Kec4kkSgT2
 BwZrzuw7OEyYCBWtKAEFDHAbYceOpAP8b7C98iOfda4JKaIMx9ry/rMfFsGQdTjF
 nq+/kKCmE5jO66RhDsBKCzx1a/VJlt+ih4pNkTxcWRQJIwqw1WL6kP/pikKmMs/B
 yRHG/zbMZVGuYd6LStsaA2zdkbu3RCTdPhmQVb8RW9pBOlkd0A9r2x8W1T3iIa8W
 wjHSlcTNSS9TCsGId8JK20S/ux8hHHQqEAhJaGcgM2YxxaXV+3jKOfp9WtWjPBQU
 0NEt4oSJSYXicEWWV6Z1UvBdXVSpw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4177npecfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2024 18:48:37 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 47RHpjJ6036544; Tue, 27 Aug 2024 18:48:36 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4189jjugsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2024 18:48:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwjgaSipy/3FoCwCKzzVqhgdm1RN34LEdW9gN0vFCxn+fbgo8vTUTvBAVljaeGj9i4cLjoysOwsiQsff10+VamcpVErdu8eJffgX5xuP2kd6q0gIJJbrOydGp/WC7FqC+YRHosyDqfU7mL0s+VwQuyZsBK4t510ecM38/xeglZxYiVTvte1WmIgl19aiWQ/yaXB+KwC1h0PXQjZvBQwk7xL3UBGu3NzgpS334DES4hynCahq3Aeslgq0hDRbsnfJx2ni3Ohn69tX86omjlnRExWVBZSHBo5palmTMpSO4QFRBebLPfuRZYglYm+ERdlKwrsNXbeBtSfxU6E4cJYBfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igjtcnHDBDTJmrkKonygL4/Il4s5NOrLzA5di2mNvjo=;
 b=EceCMeNtRTpXjbxm3+jZIkPGXxJ2Xhdd11WV7GVsRiTTPwytWhqxwKzLgEEu9ysN6uIOWE+2hjfUY+fvFZU93wanPYGggK2WUc9DW07YC2FfxR5i/n4/zkXsY+pCv4WJR8CbXM0ycB7OfUS2M9hqs0c8m+No0kjSoycNeH4c0nHrbcW1UzpzmUUge7ITeFguqilAvD/xWFvthFjCTyGjGrvyE6bn0Zld+gA2+7wdGM9nlN0YXt5fC95jzrOucXTlPdUE227TdHCIwuxdqmzOkXbO0ageBqh3PpURH1T1xaEP7qaCccMIhxZbMpcQJwxlET8A82Tlnvl6mezWASQhlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igjtcnHDBDTJmrkKonygL4/Il4s5NOrLzA5di2mNvjo=;
 b=VsK++v5rijMJXxJKZwSYh6xUG3PX6O3ffu+sWHzJyuxxQ4Nw7D4PDOponNKgDlwDliqWriSSQnlnOK/O5CB9d215CGqSsvNL+oIQ8H2Y7kwwqHfzadMzxGOCFyNVGK9ca2bhpavoTZJbZJ4UFO047INWCIoUh14/WdL/BHWgEFU=
Received: from SJ2PR10MB7082.namprd10.prod.outlook.com (2603:10b6:a03:4ca::6)
 by DM6PR10MB4187.namprd10.prod.outlook.com (2603:10b6:5:210::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Tue, 27 Aug
 2024 18:48:34 +0000
Received: from SJ2PR10MB7082.namprd10.prod.outlook.com
 ([fe80::2cd7:990f:c932:1bcb]) by SJ2PR10MB7082.namprd10.prod.outlook.com
 ([fe80::2cd7:990f:c932:1bcb%5]) with mapi id 15.20.7918.012; Tue, 27 Aug 2024
 18:48:34 +0000
From: Sherry Yang <sherry.yang@oracle.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: "robdclark@gmail.com" <robdclark@gmail.com>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>, "sean@poorly.run" <sean@poorly.run>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "ruanjinjie@huawei.com" <ruanjinjie@huawei.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] drm/msm: fix %s null argument error
Thread-Topic: [PATCH 1/1] drm/msm: fix %s null argument error
Thread-Index: AQHa+KGr1HqtUl0SnkCxUhcrM2wIVLI7YgeAgAAQGIA=
Date: Tue, 27 Aug 2024 18:48:34 +0000
Message-ID: <5BB01958-8611-458D-B813-F28CD3BA0A15@oracle.com>
References: <20240827165337.1075904-1-sherry.yang@oracle.com>
 <e8169167-3de3-4fc7-90c4-ac3b9fb60c38@quicinc.com>
In-Reply-To: <e8169167-3de3-4fc7-90c4-ac3b9fb60c38@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR10MB7082:EE_|DM6PR10MB4187:EE_
x-ms-office365-filtering-correlation-id: 4ce873c8-b74f-40f9-5567-08dcc6c8da9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ODd3dkkyUnMycURMVytDTEJTem83TkZ2UXVwc0lTeUtzbU9DdGtlc2RGMTRz?=
 =?utf-8?B?ODJyaWlLWTliUEdKTDFDTXVCZnBPczV4cTlGUlozeTJxSVE4dlVxQ281elpk?=
 =?utf-8?B?Qm5nVTMyUU83SFZyWCtmZXdiNE9ZZFNYalJ5WWxRU3Z5WXpVRGlxZE9WaDNm?=
 =?utf-8?B?diszOWJ6cUhUdHAvQmpyYWRnZVlCeHJVb2h5em9WNE9zQlRnRjZYOVpDREV1?=
 =?utf-8?B?eWZjd0sxakRXcDJ6SStBOVpubnROZkw1Zjl6QktZekxqUXhpNDQ2WWFxSXg5?=
 =?utf-8?B?a0dRbTl2RDdUT3FXQmNVQzdJZHI4dVdNOEVHS1drRE1VVGtkUThKaEhMWURG?=
 =?utf-8?B?bWppdnRkQ243aFZCdldsbGN2b1FxdUF3YnpaeTNxYjlRaTR4NlVEZ09vSjBT?=
 =?utf-8?B?MENIM0NCTzhoMFAzMFJ6VHJwdmJJL2R2amRENHJDQUtLVEVLSGxWK1l2WGtE?=
 =?utf-8?B?NGJ5WGhpbnlhYWtXSW1qbUVYWXUrNkNPclhuUlZ2TThwRTMyUWxTQlhPWmhn?=
 =?utf-8?B?Nktkb21TK2E0cG9ZYjBNTmpNUXNjL3lMalpVb2swV05VUklOSm9URWRPWFpT?=
 =?utf-8?B?S0dSRWFsSW5GV1R6bDFjV3RRUGhjU1B4MWhTWHBTYWw4c2Zia2Uyb1NIVCt6?=
 =?utf-8?B?eVdPamJzYzZnbXh4STVWZTErZ3FkSFN4QlRJWmh4a01sQkhXUmZ3VkZnRDlI?=
 =?utf-8?B?SzlqbUh0YlJBU2gzS1dVVUJzMlZ4c1NaSGhNclR1bnpBeWZhMEJRQTcydjA5?=
 =?utf-8?B?a1NTenFyZkE1RWR1VHFIMkVTSnU5QUd4UUluOVRBaUZJSzJTYnpwS2pyTjhR?=
 =?utf-8?B?aXc4UHBaMEdXdkpKZUlES2FGc1htck14RnVEV2hRRnhmeVZXbkZJbFV5Y0Jm?=
 =?utf-8?B?WHZKNys3OUpXYWZzZjJmMitydjlic085ajU4ZDhLNzhmVndTZUpKVFM5OVZz?=
 =?utf-8?B?V3lTdDRSKzZ4anNzZUEzVFlYQ1VKZk5ZUzRzeEVlK2lIUVZKSzlkSzE2TGc3?=
 =?utf-8?B?bEhvWDFQQlQ2RXdkb0FjRkd0OGRBL0ZMYWNUNUMvbitSNzJiam0rckVzOSsz?=
 =?utf-8?B?aktyZzlrUkhEZncwbWpNOFh2ekdvazVIZi9yaVc4VHBKcFBBK25ub0N0QVBC?=
 =?utf-8?B?TjFMMUlzcUJnbUp5ZUpoeGRMRlhUYzE3SVczdUExTWNBNXNQc2ptbVlxQVk5?=
 =?utf-8?B?RUVQbXJEcm9nR2s0RDlaQzRKQUxuUHZ1bWFYb2dLVG8xUk9jVEtrbDR2bWI4?=
 =?utf-8?B?TU1NejlVenMrMVBSUE9xbGIrVEdpSHFqa29IcEYycDNKQlFwdUNoZ29aR3N3?=
 =?utf-8?B?SUpZM3E0ZUNZZzNZUUN1clhMamt2cWc2UEliVGZHTG9ONGhpUmZjUnNVZnJP?=
 =?utf-8?B?YkRpY2FKMENmTEgrWSswTEsxU3BOTE1KWVFxc3ZjMTBhYXdGYUtQS1U4WlB3?=
 =?utf-8?B?M0plTWNyRHpmNnkrQW14b2V1Unl2ZHFkdTdzbVoyMWJtT0ZmbWloSldpNmxK?=
 =?utf-8?B?QUR5U0V3R1NNMHZHbURCUzB2UGRBZGE3a2txaWZoZnhwWG90OEtLamhFWGVW?=
 =?utf-8?B?VmdSOTAzazZNQnFpVXNFeUNnVVdtQ3V3UlJYU0d6SjFtS3FqUHdPdEhhN0xY?=
 =?utf-8?B?aS9XUVYwWXRSQmFHaWNRS0xES1V0OVdBNnpWMWtnUytMemprQkVOblRoS21Z?=
 =?utf-8?B?SEs1WXgrZElPZlNDZTRUUElwNm9CTzg4cHMxbm04Q0pEckJDemo5R21kY0xL?=
 =?utf-8?B?dklQOEZoK3cyY1NDZVRncnNERDNTTGFHbkpHYWUxMjJQcXhDaER3RkFoRFlR?=
 =?utf-8?B?MXFHeS9tQm1ERHRwb0VqRkFBeTE1dHhhd3JWZW5DTTlCSFRjcHhNaHMzdU5k?=
 =?utf-8?B?aWV6M2N4R2lVMDh3ZldXV0p4WlBPbUV1VC9TT0p3THFGdXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR10MB7082.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0JvMVpwSzltY21yWXcyVHhlby9jL2hac1hNaW5UaHNVaUpvT1Z6VUJtQzB3?=
 =?utf-8?B?K1ZVdG9uclllekZ2VUVmTU14RnFKbXplWlF2c1YxZllzQks5L1QwaExBZHkv?=
 =?utf-8?B?Zi9PcDZqcGdCUlhBQlQrS1pnYTl4UWJnaGJBZDNWMFErTFNCQnpsWVA0TFBZ?=
 =?utf-8?B?RzJoQmtXQTMzYlo2dWk4ZVhJaC85ZDJ0WVFnbENIZ21Xc2tQRnEvVGdqZzAx?=
 =?utf-8?B?U0pVeTdEMEJEZ3I1NlFIUzhnNExDWmpJZ0VUNUhrRmRtNlFCZFN5M1E0Q3BV?=
 =?utf-8?B?eXRoaDlTcnQveG1KQ05nb0t6ak5jRGFsMWNHZjlyd2t0QlhNRXFFUDZtaHc2?=
 =?utf-8?B?NkdjU1Z0ZXNybzZ4ai92R01pUVVHbzVVS0RiZUdQdmptRjNJWmZERkdqeFpC?=
 =?utf-8?B?MWtiY0d5VGpLU1lVb3JpVm92STNjTGM2bWRObVB6NEo3N2k3MXc1MUxGbmNQ?=
 =?utf-8?B?SzZicDMzWFUwWkpUalNId216RkhpYTV1ZE5JWklZU2hSQ1YzaFc1b1h1L1VG?=
 =?utf-8?B?REJtNlJncjN5ZjNjVUpMM1h3NW50MzlOUEFmbi9JR2VPQ1dncGZFNzg4bWtr?=
 =?utf-8?B?Wk4vSlhOYW56TXBaSkFUZEZvV3BXTk1GWUoxVTY0RS9Xd3Y4aHd1QXZIUWkv?=
 =?utf-8?B?T3FCOTRvR0ZkWnhmV0JqY3IvWVJWZ3dQbmttak5BTlQ0NCtuaERtYnk5V1gr?=
 =?utf-8?B?eVhrNEFsYVpZSU8vcW9WN296V3RSdjRmODZZMlNxTXZmODM0UWFHa3E4TzJN?=
 =?utf-8?B?Qk5TOVpqeHZGc3FIZTErNks0RFR1UkFuWUJkVjlEcjU1dFRLUWhsYUdrdVha?=
 =?utf-8?B?d3AxM2RYWm5VdmZHTEhpam1DVEFHYWJQQloyalpFT3N2dmhoZisrUU5vbkkr?=
 =?utf-8?B?N3VydGFJUWZmcjRPajJEREhWMXVvR3pUZUtZR1VubHFqK0xHVUZTRE1wWEdD?=
 =?utf-8?B?dENlK0Z0UnQ3d1Q4bHpBN0FpMXlpZjZiUmpDOEJZQnFDcmZsaityOE9zWnBo?=
 =?utf-8?B?Z2lwclpadXJUU1RYYTV6cjRscUoyVjdlcWtKNGw4ODU5MldlNG9YWWhSWm5M?=
 =?utf-8?B?QWFaREJlUTlxOGxqdEtnVG11b0c0UXJDSC9Ub05CV0R0YS9UNVdmRkQ2Q3k5?=
 =?utf-8?B?Z1FzWTI2czJ2eDVlNlJHN0JhUEF1UTk2cUlsSG0xRE5PK21rVVhrZmRPNk9p?=
 =?utf-8?B?L3pPcGhSbXlxNnBzdUZaTm00b2N0SXZJb3RWRGtRYTZ6MmwrTnFwd3NhNFRB?=
 =?utf-8?B?QlB6N1FPbG1lSVA5ZFJmOXBFejVIUFdacWc1ZXI5dG1zZVJGVEhaY0M2WHVW?=
 =?utf-8?B?WHBsTXdyYktsU0s3VUYvSjZoWW1oNnhzQU9wb3RRWTYyYTU3dnBrbFRBa2Vo?=
 =?utf-8?B?aVZlNnJwVldKZGk0QWVLdDZuVE1lSU0ycllzd1VTUXoybEg1VnNGU0tCTTFG?=
 =?utf-8?B?OGxJN0lSYlFUSXFxYm9EZktJYm5vNG1HK0FUdE44MDRRRUwyclB1TXh3RURQ?=
 =?utf-8?B?YmozZ1FsL2hmdU9WU2J6YTBDQ1N4OTZiY1Flb3J2ZEZiUWdjTVJUSnNrd2Na?=
 =?utf-8?B?OWdrbzFZZFI5NCtBRzVmTitvVTNJaU13Sm5iL1J2ZWZjQTNkYXQvNFFld1NE?=
 =?utf-8?B?TW9BdHAzVldjRys4OVFrYnFPVjh6NXpiQWU4THdFUW0zM2FqdUMzakVGT3gz?=
 =?utf-8?B?UHNGYUZaK0RqcC9jRWxvRmQ5aWdtbWNyOUUzUDNQQ1RId1BMazFTci9maTlo?=
 =?utf-8?B?QmkxV00yc0hxb3pMRnJZcGVLWFJ0dmtBb1pHNW56RTJSMldOL3Z6Z2ZRZ1Jz?=
 =?utf-8?B?NEtqaGs4K05UZzRpYnFqVGozZ0ptTEFTZnU2YUw2SUVNNEg3VUs3bFFXb1lq?=
 =?utf-8?B?cWs3bCtDSkJkdlZOQ3pGOXRYUmJSOWE4TU5jbGl6aFdYVHU2N1hxV3crWVNZ?=
 =?utf-8?B?WXhNUlp5Lyt6bHY5b3l3bHNNWjZkN2Y1U3BEcGpPZ1FqSTBLQnkxcDBkaTlo?=
 =?utf-8?B?ZVBYVnZtdFdla2xBRVJaOHlOOC9oVjJrZEx2YzR0aSt5cjFERmlxSSt0aFpL?=
 =?utf-8?B?SCt4TEZNTXFBQk9uN1RNdG1JVy8rU3FvQWU1cTdXWlNyMmV3eGRabWtpZjNW?=
 =?utf-8?B?VGwwdUlENDhhVDZJWk9Ob2tmbkJ2SHJoZFkzY3VWaThkanM0ektLRStkU1Bs?=
 =?utf-8?Q?E76GOVU8BJ5MjnGMG782Yy0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BABB4E540793DB4EAD97F7BD6AB94AF2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 5mqQmVvYVipavtKFkXORsfcrxT73hrICmj3LfHphS+Y2Mvv0CqfPykMDYQ6rkbAnLHqKsmcHdcrVCWNqB8kyQ5N//bSqSHcIdCUblP0+jvOXne+bMFdmT0AK4lHT/K8Y+m4x6bJMHUXR8g+9xXnzGrPi7Ku9IW7YcB1RWwApACC7gOmHvkSV9I9iZHZtVa9/TSSOQ6Eud1rjQ9kQz7A1Qw1RqFfWpW23hdrYWtGBHNw2KArQPXYp4Mk79kl1FFokPsBdAyFZhFWYwM8373endqhREGh1ksNYaVjkdMU21+3nvoQ80iIoZVr0Bp9IUVg25MX52gGjm4QGz2P3UWyi8CG5eWjfqOgiFfaDCni6ZyQuafAaRmHMZwL+11mj0h3VJu3Tlf+GJM2ON5w00V4xhfATMQot21qrBPfs60Irt+4GDVNmWXtQZa6fTezlyTAFWssBMEVCioUiOxCaNP75bVsBPpTFOFgox0Q/QuO7sWE96ZNtFeD9EbnJklYO7vXNrUdigvZFNi2V3AdBC4gEULbbjhn/jGAGMoJ30ACVFGyTMh+N5t7SKSkYmLC00aJKz1pjxB7KNaL9Aj8PFefDmkxtEo9LgIoABas++zrw9NQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR10MB7082.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce873c8-b74f-40f9-5567-08dcc6c8da9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 18:48:34.2773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 35XubtmaLj/uJTtKLM7Hao3ZyWpD8qBToMpC4U0ci3T2EkqKw0cLeKGYhTwWJLteCAZX76uGk4sOs2yyxnQcUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4187
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_10,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408270141
X-Proofpoint-GUID: HvZkwRJ6uqSCQhIlr1QH4wXF70vs-NEO
X-Proofpoint-ORIG-GUID: HvZkwRJ6uqSCQhIlr1QH4wXF70vs-NEO
X-Mailman-Approved-At: Wed, 28 Aug 2024 07:24:58 +0000
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

DQo+IE9uIEF1ZyAyNywgMjAyNCwgYXQgMTA6NTDigK9BTSwgQWJoaW5hdiBLdW1hciA8cXVpY19h
YmhpbmF2a0BxdWljaW5jLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDgvMjcvMjAyNCA5
OjUzIEFNLCBTaGVycnkgWWFuZyB3cm90ZToNCj4+IFRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3Ig
d2FzIHRyaWdnZXJlZCBiZWNhdXNlIG9mIE5VTEwgc3RyaW5nIGFyZ3VtZW50Og0KPj4gQlVJTERT
VERFUlI6IGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfc21wLmM6IEluIGZ1bmN0
aW9uICdtZHA1X3NtcF9kdW1wJzoNCj4+IEJVSUxEU1RERVJSOiBkcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvbWRwNS9tZHA1X3NtcC5jOjM1Mjo1MTogZXJyb3I6ICclcycgZGlyZWN0aXZlIGFyZ3Vt
ZW50IGlzIG51bGwgWy1XZXJyb3I9Zm9ybWF0LW92ZXJmbG93PV0NCj4+IEJVSUxEU1RERVJSOiAg
IDM1MiB8ICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9wcmludGYocCwgIiVzOiVkXHQlZFx0
JXNcbiIsDQo+PiBCVUlMRFNUREVSUjogICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+DQo+PiBCVUlMRFNUREVSUjogZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL21kcDUvbWRwNV9zbXAuYzozNTI6NTE6IGVycm9yOiAnJXMnIGRpcmVjdGl2
ZSBhcmd1bWVudCBpcyBudWxsIFstV2Vycm9yPWZvcm1hdC1vdmVyZmxvdz1dDQo+PiBUaGlzIGhh
cHBlbnMgZnJvbSB0aGUgY29tbWl0IGE2MWRkYjQzOTNhZCAoImRybTogZW5hYmxlIChtb3N0KSBX
PTENCj4+IHdhcm5pbmdzIGJ5IGRlZmF1bHQgYWNyb3NzIHRoZSBzdWJzeXN0ZW0iKS4gVXNpbmcg
IihudWxsKSIgaW5zdGVhZA0KPj4gdG8gZml4IGl0Lg0KPj4gRml4ZXM6IGJjNTI4OWVlZDQ4MSAo
ImRybS9tc20vbWRwNTogYWRkIGRlYnVnZnMgdG8gc2hvdyBzbXAgYmxvY2sgc3RhdHVzIikNCj4+
IFNpZ25lZC1vZmYtYnk6IFNoZXJyeSBZYW5nIDxzaGVycnkueWFuZ0BvcmFjbGUuY29tPg0KPj4g
LS0tDQo+PiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9zbXAuYyB8IDIgKy0N
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+
IEkgYW0gbm90IHN1cmUgaG93IHRoZSBwYXRjaCBnb3QgdGl0bGVkIDEvMSBhbmQgbm90IGp1c3Qg
IlBBVENIIi4gSXQgc2hvdWxkIGJlIGp1c3QgIlBBVENIIg0KDQpNeSBiYWQuIEkgZ2VuZXJhdGVk
IHRoZSBwYXRjaCB3aXRoIHBhcmFtZXRlciDigJwtLW51bWJlcmVk4oCdIGluIOKAnGdpdCBmb3Jt
YXQtcGF0Y2jigJ0sIGl0IHdpbGwgb3V0cHV0IGluIFtQQVRDSCBuL21dIGZvcm1hdCwgZXZlbiB3
aXRoIGEgc2luZ2xlIHBhdGNoLiBXaWxsIGRyb3AgaXQgZm9yIHNpbmdsZSBwYXRjaCBuZXh0IHRp
bWUuDQoNClRoYW5rcywNClNoZXJyeQ0KDQo+IA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9tZHA1L21kcDVfc21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
bWRwNS9tZHA1X3NtcC5jDQo+PiBpbmRleCAzYTdmN2VkZGE5NmIuLjUwMGI3ZGM4OTVkMCAxMDA2
NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfc21wLmMNCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfc21wLmMNCj4+IEBAIC0z
NTEsNyArMzUxLDcgQEAgdm9pZCBtZHA1X3NtcF9kdW1wKHN0cnVjdCBtZHA1X3NtcCAqc21wLCBz
dHJ1Y3QgZHJtX3ByaW50ZXIgKnAsDQo+PiAgICAgZHJtX3ByaW50ZihwLCAiJXM6JWRcdCVkXHQl
c1xuIiwNCj4+ICAgcGlwZTJuYW1lKHBpcGUpLCBqLCBpbnVzZSwNCj4+IC0gcGxhbmUgPyBwbGFu
ZS0+bmFtZSA6IE5VTEwpOw0KPj4gKyBwbGFuZSA/IHBsYW5lLT5uYW1lIDogIihudWxsKSIpOw0K
Pj4gICAgIHRvdGFsICs9IGludXNlOw0KPj4gICB9DQo+IA0KPiBDaGFuZ2UgaXRzZWxmIGxvb2tz
IGZpbmUgdG8gbWUsDQo+IA0KPiANCj4gUmV2aWV3ZWQtYnk6IEFiaGluYXYgS3VtYXIgPHF1aWNf
YWJoaW5hdmtAcXVpY2luYy5jb20+DQoNCg0K
