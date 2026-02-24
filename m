Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CJjAOZpnWnYPwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:05:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8FA1843A3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7349010E526;
	Tue, 24 Feb 2026 09:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="atVTNsrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011048.outbound.protection.outlook.com [52.101.62.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9096B10E524
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 09:05:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vn2VIAmpVzojhjUER1sS28/jzjwbWBRXKd2aLmmpA0CKY7m4TiYfLoN9awKjK9T+O7hJkTzAAhwVk2VxgicJpSQ3I57fnO0Y9rDXKrlTye2DhwFQ3/YK2W6GPqO40f9hEg+qUZlHVQHpft7wCAq2VMxp43ffDzpeipdmNfbAYR9JvbEwF6mRTfcpNWzwFi1jvXxM+Qvmm+Z/oYaUyhXbTLYtnkkF4hi5nHuYJsNU48BDhgYlgO2qAK7odMhynta55+r60DEK2SojqGp2ti+vpZ01t1OSOHvyAcWiEfmifGRxWjKPKTCOJpmAf5Fu8ZjNKjkOaMlN/GlCW9JYtCZ4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/q2RA13KlAidAJ2HGBW2CEUAubiRDkl6nc+87+TEeOw=;
 b=rM9MMt+eI5nEyd1vQrR3QKpsr4VrcTTHQ9iqBkCpUCgTUGkHurMjqfPXqn1/MKUBcoye7pbm1OynUOtBPxzoJkR6amo8n9GemYUHzalQ2/Yjlx94PJJoRnTfe9ZSIFHfB/iYkmVOicJTsFEpp9wuLZi2knC45GPWAFWGsb0U5DoOg8OhL1K/7vNthRTvS7ir0b3fpTsK3C4Q0R7N/oxV/V5mWMQrs0N5fag3y6kajUtUATc75OklrcdW1CMWih2Z+Vf4DdRPwOwzFblDQ9+5KUK+eD4WkPoYrFE3nvrG+zqZlD9CrgaZTGKM6/kZ0zipmezCtGvNkrgNEiKP2nk15A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q2RA13KlAidAJ2HGBW2CEUAubiRDkl6nc+87+TEeOw=;
 b=atVTNsrO9MC5XOFOjcpk6mbCsEhxb1mtYyqr53AdJckACxxtAuOIUypQ5j9r8rtqWO966+xqdOwucVKHuk1pVKKz7xsjkZf6pwM6UT/ahT/qyGyq6cDEm0UBlv1jNQs0UD/La+9MN4CIJD51Zx2GngXdZwOWMpiuACwMAdC7kQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6622.namprd12.prod.outlook.com (2603:10b6:930:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:05:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 09:05:34 +0000
Message-ID: <d620fb9b-3e52-412c-b687-4b464615430e@amd.com>
Date: Tue, 24 Feb 2026 10:05:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/18] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-11-fe46a9c1a046@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260224-qda-firstpost-v1-11-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0272.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: ff5f4599-7535-4410-b8ec-08de7383de89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHZRSUdWUVZEVmVNZ2lDVUdDbXBHU0FnZGJKSzZHYTVVOExMbHNwQTVML01G?=
 =?utf-8?B?Z0RVZWl5SGJNYjUyL2oxbklYdUlsTjFrZWVZNUZMTkFsWUovUXNwK1pjWGpp?=
 =?utf-8?B?cmZzSEhZV21GSnBqOTUweGY0Si9yTW8rSjRoR0F3b0JXNkFHcndPVlo3dHBm?=
 =?utf-8?B?S0tFM1JVSXZCZ083OEUzcWk3NDlMKzJFamhlblhNYkMyeVVkY1ZWZDQ4RDQ0?=
 =?utf-8?B?eGNrRTZvOURDZmYzVVQyRDlMT1NSZWNrTUlRSXRYRzhIU005VjBrK2FkeFBq?=
 =?utf-8?B?YzFoL3hEck9YNERUVjRTb1hDRGcwL0UwMnNrR2RRMSt4L2M3Y2pGeWJOMXJ6?=
 =?utf-8?B?Zk5GSGphZzdiTEVSLzdWUDN2Ly9Wd1BGWWh4dnVtKzdodUh4ZStJd3FtaFpv?=
 =?utf-8?B?cm1mcUUwajkycXN0VVMxQ0VLSUxsM25RNzV2RUlFR0pXeWIyMUNNaVJCT2l6?=
 =?utf-8?B?MFZWVlBXdEpaNG0yNGZXa1l5SXZUN3VwZGJxZUY1L0NOS0tLSXBxK2RrcTVr?=
 =?utf-8?B?aEh5VWZzK042M2tlQVJGNUpudkd0ZE1sS2Q0YlhDODBmVlkwYTJnL0o0Q3B2?=
 =?utf-8?B?SXN3NjUxSlgyT010UG94UUhaY0xKZDBMT2dDMHJJNEJVb0xQcHVTaXhZOCsx?=
 =?utf-8?B?ZFFLWkZTRGZIRTJFSTRuRmxVSzQyOWFwUGdHd3puZGFldDU2UmZxaWYxMzZ3?=
 =?utf-8?B?VWFObjFUQkxvUnhGVlN0Visxd1dtSWR1SkRSWSt6RG9vdmZRODZ0RUFLelcr?=
 =?utf-8?B?TjZEWUMzU0tlS1ZUSmlPZnFKMUppMDhUbUl6QXY1dml3TkhWMDdGN1pYTG9s?=
 =?utf-8?B?YWxPSXpGNUp4eDVHOHFENlJKS2M5ZEo0K0NPakNBUCtuL3R2RzN5cHVtMEt6?=
 =?utf-8?B?YXRTOVFHNWFPS21MdlBhVjd1amZpblJzZS9WUmtoVXB0OWtNOHhiSmp1TTJP?=
 =?utf-8?B?d0VRa0FKVHJUV081Mk81UWlFclQreHZERnhlWTNiUHI3QjJQVE51bThLTytO?=
 =?utf-8?B?WHhRRll4RjBvdnFnT3BwdGs2OWx2QXdGNWxPM1k5VkVHekQwek5XeFppTllt?=
 =?utf-8?B?eGV3UFRzb2F1aEhDMCtlTEc4WUhLVlNnTDljeTFjMXhRV0ZyZmdlcEJ6a1JZ?=
 =?utf-8?B?K0xVSTBYVm5mUFpaK1huVXFRc09UcUlXenFuVkN4ZDJub1hQMnhxWjhjYU9N?=
 =?utf-8?B?THVaYXpyYi9uSUhQd0NFY0VldkUrcDduWlF2R0JheEtDdWtZcWVBdXZndUFR?=
 =?utf-8?B?L2RQdnM1NUZ4NmZPWFRXUzlMemJ0dzR6N3hCSHY4VnNOa3VPQVltaEROUTRW?=
 =?utf-8?B?NVArOStMbjJSWkFvTlVtSjNPazlXR2YyVGFJMEFlVWpnWXBod0hGYWY2ZHNa?=
 =?utf-8?B?bnJiUmRBcE1sZmdBSlNGS3NXNGJvWGdhWDYyelRTUFQ5anZKNVhKUy9vQUlt?=
 =?utf-8?B?WXJCQ3Q2R3g2MmJyNFhUVWMyT2VDbjR6YVMrN2xwbncwRXlUUklEL0g0UDhu?=
 =?utf-8?B?QXpnT3BkRW1OVG5oT2Y5TjdpeDRlK1hsTkhEc2RzQWxha2t2eTFMbXNOdVl0?=
 =?utf-8?B?OFFlR29nRGY2ODVPYlpUR2t5aXV4N2Rya2w2WXZMY1EzK09yd0Q0QTFVamlG?=
 =?utf-8?B?UVN3OWo1UktWU05ucXhVd3FIUHRVZFdqRVltZnVDd1pKMWFySGtJMHBFYTZZ?=
 =?utf-8?B?OGJWeE9GOXQ4Z01wQVVUQ1BWU2xDd0ZRcHVMRHpxMVhDaDcyMXRwa0ozOXB0?=
 =?utf-8?B?dXVpVG1MWGJNTVlTTnpWNnRZTU81Y2NZL2RNbHpXRENoc0I1VVo5SXpSelc0?=
 =?utf-8?B?UlN3K01lcEk4VFNRQmZDaXdNd0p1OXdpcWxnV1dvS1loaWJob3VoMmxubkky?=
 =?utf-8?B?cGYxMUdmdzdjbm5lNWMwZmNNdTUreC9vMWh6T1NzaXN2ODdYb2s0cnRieDdD?=
 =?utf-8?B?Yll6ZmtFVGhqL0Rqdzg0MVFDY3NHVEh1bUZuZlViUXBWZmJVaUl0TXhoc2Iv?=
 =?utf-8?B?aHN3cWtkL1JrYjlSekRETk9HNjgwc09RaVRuaERXa0VOaXdrZEdxTElYbkNy?=
 =?utf-8?B?dExoQ2FMdlRucUhWR2swNllEYy9menZNUCtRNiswVzdzbGNyRjNFbWx1OUF1?=
 =?utf-8?B?WmhORmFCdyszWUE0cnhFMUtXR2xnYzdDK0pVdkJyWC93bzhCVDJvYWJndExG?=
 =?utf-8?B?MkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFBxSCtkalBHZVR0VjdXV2NvN04rMTJKalltTFh2RmpyYVcvc05qUmk0TnYw?=
 =?utf-8?B?c2dkbWdOZ1ZGbmY0RTVCSnFZeUxXeElwRFd6ZjAwU0xqczNHRHBNaWFQOW4v?=
 =?utf-8?B?aTdWYS9TZlA1YjI1YjVWNGFBYWJ3MlNKQXRnaHluNkNFeWEwU1NtTmtjekl6?=
 =?utf-8?B?L3VoYy9KRTB4d3NldjBzWmFaS0h1V09laG5PdEFnY2RacjRVVDNQSUtSMmtk?=
 =?utf-8?B?bm55SHBsLy9YSlBDYmJXbThwNG0wUnRCMWFxVTlaVlhyV0xJRmp4eEl3Tjgz?=
 =?utf-8?B?KzhoNE1IKzZBSlFHYjlvMnVwUkVHTkh0d1p0c3FEWjNzSXI5bXYyclhHa1NZ?=
 =?utf-8?B?aFUvanVSU245S0JGc01JU1ArcjlDQmNPV21lcHVUbnlDOGx1bHRCNnYvQjcx?=
 =?utf-8?B?Y2lPakNiZ29NMWswU2Q3enl4ajNqK0RRcHpYMElkaTYwR1Yvb2xRakhGdmpz?=
 =?utf-8?B?dzBmZWxESE4weEYxZFlNVzJtUHFXMm1zN25PTEhuSmxodGV0Q2pHbWszT0Nh?=
 =?utf-8?B?OGFNR0EvSHVCZW5yd3o4dU05M1dyb1FwcmNXeXVDRHpKdVdESnp1S0s1d0ph?=
 =?utf-8?B?L296N2xYNmExa2tRRmVNWVROMzQrMVBoampzWWZTQnRhbk82QWh1VE9jV2lq?=
 =?utf-8?B?dkd3cGQ2UXF0R2JxV0FtSW84dVU5VTBKTENTMk5ReGJrM2xzR083Yk00ZkdG?=
 =?utf-8?B?c05nT2lNMloya1Q3V25CVVFjNXZ0QjQ1M2pMRWdGeFlud2Z4MWZvaDI0Z01n?=
 =?utf-8?B?YUdiK2ZESDltUld0bWt3ZmZNYUxxMWUvSHhmcTJseE04QmFrWlN3UE8yZlBl?=
 =?utf-8?B?SmpOMjRpU2NhZFA1S2hNN0RKVnJmNGo4K2o4c3YyRkRjR0hoemRycnUxVmxz?=
 =?utf-8?B?LzVuRllOazJsRDRwelZvL1FWdDRlSE1kbFpScytuQnErZGFheWdCdW9qWXR1?=
 =?utf-8?B?SnJKNVl6ZHRLMzh5NWxHUEl2OTRZQUhHMW45TUphMU5yNFQ4dDZvN3k1bnhW?=
 =?utf-8?B?OHdaaXZIdCtraXpUbklWNlRQWGNsb2pESTk4WEZuUEVLa3VWSXlkNkU5bjV4?=
 =?utf-8?B?eWVYaGoxUi9GOVIrWUZLbjcyRURneFJsRTNmb1F4cWc3cUVjbzl1VDQrM2d0?=
 =?utf-8?B?bUs5VjFHeCswNlZTUG1WSjBOd2tKdkVZdVBpSThxODZab2FoSkpZQ0xEUjR5?=
 =?utf-8?B?SytUelhQbE41TFdZM1lDNUpPeEhLZjVvRmE3cTByL2Nia0JrYnc3MWVHbmVN?=
 =?utf-8?B?NyttdmFXYk1Ebks0NDNzSzVrZzA1NHVoWnJTNHNnOEozTUZQcVFqV1ozTVhU?=
 =?utf-8?B?b3dLQzhPL2Rjc2QwRS8wY3ZybGFXUllsWTBqNk5EeXduYjlHaittdUpBeVBV?=
 =?utf-8?B?WmVJOTRZY3QrelU4UnpXaUxXV3IxUGZpMHZTNHpWU1podUVzL0xiNVBpMlNo?=
 =?utf-8?B?TjA5c3ZkY0IvR1NkYURmaUdQbVFWWUNJaDZnQm5wWE5yVDNWcEFreUphOUpL?=
 =?utf-8?B?dk9YWjduR2txR0lyUGs2RU1yTkZiaGJTYVR0MWlyTDNiRUFVeHp0cURiellm?=
 =?utf-8?B?d0o0WmNXMmhaR2lYZzhoUW9RR2tDRXhJaFRHVVpCazV0TUowSjlCMlA5TFdE?=
 =?utf-8?B?R053MDN4OWswVnpaOE1FaHQzS3FQOU8rdkJsSm5WaHFqMlRCOG0vMWJlakZ6?=
 =?utf-8?B?emE0cnVVSHVUNS9pRHh4cUlXdjc4VGRYSThJUDhWaXVxTDFibnIvdHZGSVNX?=
 =?utf-8?B?UjhESW5FV0d6UGZCSTVyY1docURqdUl6T0lycFJ5aVBXeG40YlZSRXB0UXBV?=
 =?utf-8?B?dHIvM2NPOTk0SE1EY0JkM0hPQjVMT3pzSFJLdWJZT2ZscVBXL1J3TTRYSUU0?=
 =?utf-8?B?K2hZTHpJblo4WFJoS2VYSjdDRWdjcFBSajFSbzU2eno4MEg3Q2FIY0RXSFha?=
 =?utf-8?B?Z3QwTG9sanBCN2haZUp4SVdNclNqbDRhZnRCdXNIVDdUOURGcDFFdTZhTHpD?=
 =?utf-8?B?NXNudUN5K2d0UEZaUVYrd0RlWEhNMytzSWt2Z3krRE9ENmExdG1zdzgzTFF3?=
 =?utf-8?B?bDZDbzArU3pFVWdLOUJwd2Zkc29OWDZnazNoa003NW4yVkpiLytEVWdvbUVH?=
 =?utf-8?B?Ym1IaVdQMmdUaTZPaG15RXNhZDZMNkpDNlhXc0o1cE9GVVN5L1RPREpjTUtM?=
 =?utf-8?B?by8rMUt4aTlhcUtpSFBFcGp0ZDlJVE0vMWloOEdmWnVVbnJqejJyR2g2aEU5?=
 =?utf-8?B?aVRpOTEzNnRrcXNzNGppSURuRzRnUjEzbmtzWmFTRDdCYU1nOGFRc0EwVVhs?=
 =?utf-8?Q?E2kOj/RirDn/aQHBXx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5f4599-7535-4410-b8ec-08de7383de89
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:05:34.6924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8uilSOdKKggi20u92qHcHGkTornXB3iY3Sp9DPschDvv3n3yvAVlQICFGMlaAhrP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6622
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 5A8FA1843A3
X-Rspamd-Action: no action

On 2/23/26 20:09, Ekansh Gupta wrote:
...
> +int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv)
> +{
> +       struct drm_qda_gem_mmap_offset *args = data;
> +       struct drm_gem_object *gem_obj;
> +       int ret;
> +
> +       gem_obj = qda_gem_lookup_object(file_priv, args->handle);
> +       if (IS_ERR(gem_obj))
> +               return PTR_ERR(gem_obj);
> +
> +       ret = drm_gem_create_mmap_offset(gem_obj);
> +       if (ret == 0)
> +               args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
> +
> +       drm_gem_object_put(gem_obj);
> +       return ret;

You should probably use drm_gem_dumb_map_offset() instead of open coding this.

Otherwise you allow mmap() of imported objects which is not allowed at all.

Regards,
Christian.
