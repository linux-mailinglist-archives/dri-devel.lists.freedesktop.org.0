Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGSEGg1KnmnXUQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 02:02:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FD118E7B6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 02:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2CF10E2D4;
	Wed, 25 Feb 2026 01:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="K0DCuFvL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012040.outbound.protection.outlook.com [52.101.48.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C0410E2D4;
 Wed, 25 Feb 2026 01:02:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOvpwHfglAvOOGzgnPXC1TCIw4U0iPLejTpItUlzoGDGNCNYVN7ZjgzckBZxDrSqPSo3POqX41soqlVX8PUWnakBdgTViXnbc9IxIHKPq0v+TF/56rObMphoqvI0aZwgb57jBNjVrISs6PfbiY1tx7JyIq9nAukD05RTHY/eMcsESUGVuASdZ5C9Jrt2/8wLoni8CC4jhkIyRLb1trKSIcEn/F8Za0y2c5H21eN9Qk9GfJgvApfdWLsvOTB6lyA8MJpM4UlXwGajtrzJvwzS2/bRseYqCsEiz1B54mTQJU1ZCR+1I3GfbN/efEeL0vB6BOEDwlUn8DvEBAmkY+9tXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3M98YjcA5yy7Ch17x0DuO9fWueSdxi8TzGmv/Xi03A=;
 b=f1zY1Ne68xzkeDAjP7BouDj02/DwG35En2zyCrJyu75VY7bN7F1Yii7Se2JA1l3EzPTvjfvXVu0Sjo2O4qVUNkcMnLmIj6Y5j8w7+bf3WLjeuqr9eHMcbNQs17Lnl6uUGnRj3io03Jtd0XG3zb8vB8kuUQj+NGaxt6XANIEduv6Pob5d9icrBOuSLxlgsaorhmfak7wyVot8O2aw9f06LCSEWMK8T0SRSnHGzVs6Ka2kTEuQuJiyrCcpBR/pElx9gB231qmfKX9hIoUg1Pi6dQLMg94nLxzrBsGnAIRS00YXswQq1ZqHNwLRsfeS4OwyDZnywoRj7tVQ3BtC+H3oQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3M98YjcA5yy7Ch17x0DuO9fWueSdxi8TzGmv/Xi03A=;
 b=K0DCuFvLToBovIIn2m+ZDUsyQ178DjT+RkCWc6Fz10CepLoi4FCHvXdBCragW7a8kBMDZ9F+K7dC8mMTPGqmu1MqiJFdtNAdavi+5kV6xn055SofN5SQ8+PFcxhbuoMUAkhcA63FLjO0YxHDuUNak9ICyu8C1tTsDdKocnSS8hVVQ7lN1hHqI01NOYy4zheQiJsApPxTc/AOj9cglBV+uFXNKNzBXT9nxIf+SxYBDDJaUAj98WuWFPbhQ6W+uwk57jD2Daaii6He8VqN3LY3k3PVgcIrRYalR8lbztALqsUr9qHn2xnZGB4MEL66ZPfXo9Z4X71fHqrfXF4QOojtiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 01:01:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 01:01:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 10:01:51 +0900
Message-Id: <DGNMY8GOS51G.2TP953C2KXU7L@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Gary
 Guo" <gary@garyguo.net>
Subject: Re: [PATCH v3 0/8] gpu: nova-core: miscellaneous improvements
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
 <DGH7DVJRH25E.2C9F743QLF6IA@kernel.org>
 <DGIKP80A3B3F.FVME95TBM5JD@nvidia.com>
In-Reply-To: <DGIKP80A3B3F.FVME95TBM5JD@nvidia.com>
X-ClientProxiedBy: TY4P301CA0087.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5efa8a-f5a4-46f7-9451-08de740977af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0hBaXMxellmdnYzTk1MaHdmY0MvK24vOGYxbjJKOUFZRTdHdDdlcEliclZQ?=
 =?utf-8?B?dyt6cGU4a2pnUnBhTERWa28wNXJnKzM1N0U4eGdNbGlUd2xqbk9HbGhETXg4?=
 =?utf-8?B?dWJqMk5RY3BWVmM5TnVBK2FaOTczMzQ4cUZJQkxDb01RclFOdjBzQWNYaVdZ?=
 =?utf-8?B?TEh4anBVbHN0d0RiSTlPUy82NjZJR3NnbkJxV05sb3VpMmRBZUo5WUFieUg4?=
 =?utf-8?B?a1hHd3d3dzVkK25TM2RVL2ltVDYweGt6bzNSK3EzWjZmTjlaUlBiRmJGYndr?=
 =?utf-8?B?d0ZwbXRNRTJoKyt1Q2Vrd1AwZUVndGtWdlZlYVZuZXgzTjZsNmd1VUhTWU9J?=
 =?utf-8?B?dlQyVjRHakk0VkxYelJFRFhscmZDMkYwalNHVU41ZEF3SlQ5RmRaZFlJclZG?=
 =?utf-8?B?aXNmUmM2TXBqcGZBbEkxeTdvSU1sa1k5clBYV0tQR2pxYUJaWEp0cnN6OU5I?=
 =?utf-8?B?aHlnZVNoTzV3ZWJNZlpteGJkcVFuS2FlV1ZaUHFOSnhYUkpNTGxqT1UzRHov?=
 =?utf-8?B?N1YzRitxcHNIRlhEVTJGR3hBOVE5VzI0bmRQM0IxQzVyTTB0S096dllibWxV?=
 =?utf-8?B?QW9uT2RKWEttSmhXNFg1UXVGaDlCUlFORVE4cGppMFJnMWVWQThsY3RKQzJR?=
 =?utf-8?B?Q0VxMHZLOTJyNis1U0M3NGt1WjN2OXlhT0hKWG8wdmlYOUhMU05lV0czb3cy?=
 =?utf-8?B?TkV6TjcxZzgzTXR0MWt5MXNlYXFXOGsvVk9jWFJYN3VMckRQMURuYU9TTWRp?=
 =?utf-8?B?emF4Z1Z4S1JLY1EybnZtV1RMUitLbkZ6Nk5aMEVHblpIUnkxdXE2a2p2TzhU?=
 =?utf-8?B?cXFSbTBnellSVHNGOEN4aVdyaitsRTgySHNRQTY3bENMbEtDckhRbEVrQStS?=
 =?utf-8?B?QXZzazJQNWNTUkYvT0tQeU9oc1lDU0lKS3FBaEJ0UWI3NDQrc2plYm11NDNa?=
 =?utf-8?B?VXBIMTBNWjNpa25waTgvNWFQZ2ZkL1N4VThtWk1JcE9oZHNndUZXZURxNVdx?=
 =?utf-8?B?RjlyelBCNVRCWXQ3T0gwd01PNzN4cjlnclJWWHR2L0tSb255MHJsK0tWaFZS?=
 =?utf-8?B?VXdNOUl6akxySlBoemZVbEdMeXd0cEZ5RUZsSE5xY24rRXc1OHZPZzFvUzVj?=
 =?utf-8?B?bDc5TVk1RE9LZlk4d3NjZnNwQVNmWkV2RUlHU1YyL1p0ODErSm9sbTU1bUhP?=
 =?utf-8?B?S1E1ditHR3JFVEFtQWpyU1hJdG82dFhqWnorYUxIMWRDaHhuZGFWZnQrMGxx?=
 =?utf-8?B?eHc2ZnZkdUsxU0gvS2ZXY1NkdWwzaWMvZ0ttUHBvcWw2aEs3Qit1dGl2S3FU?=
 =?utf-8?B?bTl3OHBBYmZKS05MS0R2eE9uRWFxaHhWWXpiQkJuV3FQSG15UEZacWJDZmo3?=
 =?utf-8?B?WDdmTTEwTlc5WXFkUWpzR3hIalRJSER0Q1FGQ3M0ODJaNlhrM2R5REdoc2tt?=
 =?utf-8?B?YUc3YW81eTcrS2x3K2o3UWxQVUNzV3huT2M1elprTnZXdWY4NlVmRXhlV0VQ?=
 =?utf-8?B?ZWxvRzhHbmVZSHIyd2pxVGRZRHgyZFNWRG5GN2tSaTdqemhwYURYeVp5V1NN?=
 =?utf-8?B?WThVL3FReWoxMXdhaWw1cUxjREJ2R2NCeXNkRVVvejFwQ1lKdFRRY1VhbUdK?=
 =?utf-8?B?Zlk1UVEweElIcTNuM0tkODQ3ZHpBTGhYaFhURkpEZk52K2tJRzZBN0xVTFUr?=
 =?utf-8?B?akpuZDhDaVV5akVWQ1loVUZGYVIvRkdyWXNXeGN3eEVrZUk0N3V0R3NXUlhK?=
 =?utf-8?B?OWJhYlpVT1JiMFdFcFYrMkVQV0NRS05zbTl4UzRKYXRNamMzNndIdy9laUlr?=
 =?utf-8?B?SzQyZDlUNE9sQWVSN1pSMGtkOVhTYTJMdUhjSXVVK2F0cDVzK1FGOERYV0Fv?=
 =?utf-8?B?V2JzWUNxdFFEcHdGUlVNL05DSXoxNEo3bVRaT0t4VW1qaGZmOTVwRWhmOTFQ?=
 =?utf-8?B?MlY3VjROZTcyY3lHNWhONXE3Sm1CZWdzL1lOTXg4UkYyRE40M1k3eHp2Uk5x?=
 =?utf-8?B?RWVINGY0eE5GSVdHN0daMmpwNnNsdjh4c3hVOTRXNUs4NkVtdXRpZHRtcTNr?=
 =?utf-8?B?VEVydU1QcGozeHhYNThaaXJoTkRuQnNzYklqTjVkc0ZmOTc3U0Q4WnNyQXVm?=
 =?utf-8?Q?9bQg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW9NQ1dtK2RGb2RJNkRucEN2Y3ZseENOSkVJME1ibjE0RnpWYUxNZkZHVlVT?=
 =?utf-8?B?WVhGeWxJRVFQZGhNRzl6Y3RoZVFubzJjRTl3V3N6WWVUdm05eHF5bmRSakhG?=
 =?utf-8?B?WHA0VEVkQ3BEaVhYbXNES0hQQi9SQi91dzZ4RGdZODZia21jVlhFb0V5Q25D?=
 =?utf-8?B?T3dabjRNaXZMbDgxRjZCczdPU2Y2anJNQ3pGVWo0WTlMeStKSE1IcDBvbEdW?=
 =?utf-8?B?QXAxa2FjeVBveTJHZjlSdGIvQnVLbEhOeVVaQVZCakhVU2p0SWYwWlpUR1RI?=
 =?utf-8?B?NEpkbkxwQmNjcUdqWkRyVVk2RG5PUHFIQ2hmOG9qdERnQkVHN0kwNUY2VHh5?=
 =?utf-8?B?S3BiVlF3RzFlOVBKTXRMNjh3ODlORUNtT2ZCbnVJZ2VqL2RDTHAxL3cvY1FC?=
 =?utf-8?B?RGpETU5ObjVWdEZjUTA4c2FNei9KWVVPTEhRMkNpRkl0ejZGWWNLcGFDZVBY?=
 =?utf-8?B?QVkwakcrNHVVYU96U1l3WUxCQzJUZlNEN1RLTnhrbk15bld5cUxiaW9YTURP?=
 =?utf-8?B?SmVuZ2xuZGdtSnBmOTVIYWVNM1pSeFlWVEd4T2wrSnlXZWJDbWxoWDU4TFB0?=
 =?utf-8?B?SlRqUjFxMXF0ZGRTcTlmRUdCWGZPVFNKTS9oczBUNlRsTXdFd1ltdk1Yb09S?=
 =?utf-8?B?NU5hQm01ZmtwV2dCcjNNdWpTWFArVjVITmN5MzVlWStOalUwK2IyamNwczlt?=
 =?utf-8?B?S1M2cTBBb0dNK1hkanczOGNlc3pmYXNaYVRuOWN3RFQrVjV5VTM2MXdRRStN?=
 =?utf-8?B?Z29kWnN0L016c0dzbEpUMDZRMUhQZ0pKeGdwc1I3VDhTUGFaSHBxTmZFai9I?=
 =?utf-8?B?dTk0OFRUb3pqYWU2QlY3Y21yRG45bGVhU2U3SHVDSmQyNXZoNHN3enVyVWta?=
 =?utf-8?B?bm4yZ1ZjeUM5bUpBZ0NKYkpHMzJvY1hKNXhqcFhqeW1aRWVPaFFpWDJtWnk2?=
 =?utf-8?B?bE5MenU0SVh3VStvdkVFQ1VtRTBTMGpSNmJjNXFYazNMNTFGZG5tMi93RG9B?=
 =?utf-8?B?WVVxY0RMVmdNQ093OUJwSEN6TmMwdWZlSStLOHpEM3A1RXcwRFhXL3hoOG1D?=
 =?utf-8?B?Mzcvc1dRU1lYcWZDaUZ2WTNvQXZSeCtpQ0dpa0JzVlNwbWlSRG5vazlzY01W?=
 =?utf-8?B?dEdMYlpGRnJYSTkrdWNKdjhwck9Kd2s0c1hHUEwvamdCOFo4SkdrTzE1WkQv?=
 =?utf-8?B?azd2MW5YQTY1ZTEwOFlkVHF2OS9VZWxha3lSQlIxS3NmOVlqQWhRbllXR0Ji?=
 =?utf-8?B?NHcraHRmSmZpQjRkWi81bFR6Y0x6NTFYTklhdTdCYTREcWNGY3ZNTElKbEsy?=
 =?utf-8?B?Y3c1M1RiZk9kdTExUTBDamFxRzEvRWFyeUkzK2p2UWMzUXd3akd3YTRka2dz?=
 =?utf-8?B?cUVsM0ozZ0pnTDlXR1crS24wdzJsQmxRYTNqYXZSd3RJcFNqYUU4OXhla3Ry?=
 =?utf-8?B?M1ZmMkpZNElMT2tYSlJCYjF0aVFMdW8wQU1hMzByRFhlWmF3TjQzeVg5UnVP?=
 =?utf-8?B?NDdBN2dWelVaTERLeFJWMzlKQzhtUVNwSEppZ0V0bkozMFE2Zk53K0kzb1lt?=
 =?utf-8?B?Zi9LZnpJcFZHRUtjYlI4Sis1TmxwcUJXWHJVZkhudnptS2o5N1BBcFB6c3dH?=
 =?utf-8?B?NkdCeVBaU2M2UlVJVHJUU01jejdRMzE0UjcwUUpCdW9GVWhJcEFSWG8xU3lN?=
 =?utf-8?B?S0RRTHRCb1N3M21ZcWF0RXNURjBVdnRpMm43dzJmSEU3TkNSTUtQbThVbmRN?=
 =?utf-8?B?b2tlZHd6ZFVKUzI3V1JGUHk1ckd0QTU1dFJha1NBRnRUL0RTV2wwQmkzbDBL?=
 =?utf-8?B?bHBUVmtuM0JQT256TlRUdFFtTzg0SEtXZmdBQ0RsNTdmakdnMHRKRGt6MVBD?=
 =?utf-8?B?d2JRdmo3aVlDQkxXMFRtRDR5eDA3Uk9lZXhpeG42UWw4Q0w4b0VXY3JRYTBP?=
 =?utf-8?B?N0N4Zzdmdjhhc2NFS1hNeU1XaEVSbnFTSE1NTXJHeDA0QzhDSnlNRjVXeks0?=
 =?utf-8?B?NjRtV0dVNk1OSUlwRVNCdEc3UXFmd1d6cm5qOVdGS0c0UGROUlE0Wk5UQmt3?=
 =?utf-8?B?YktFeFo0NVhFTlVrd0YzOHdXN0FldXlGUkVvV1JxNFJnMVd2ME9IT3ZRNGRE?=
 =?utf-8?B?MWs0dEJrMkN1dlRlT1hvV0hmbHhvVlplNmk0NDM2QW9rajJ4T1BLZTBpR3Fh?=
 =?utf-8?B?cUdiNmlyeWhLV3l3cGxRWFZvQUx1NXBibTVJMTlBSDRhbG5reUdTc2gyWW9M?=
 =?utf-8?B?UVk0amVPWG9IMFFUSExhZS9vQmlXNWc5a2wyaDB3Yi9ZUXZ1bW1oM0d0dVJ4?=
 =?utf-8?B?bEJOdExsYmlSV0hWMXNhOG1ON1FVOTlWY014dlVYU05ENXlZSTE0UzU5cDU3?=
 =?utf-8?Q?GC4/KTwDRLRXrLgnHInDF/CYbj7tT9AcqGH6tj8TZv8ty?=
X-MS-Exchange-AntiSpam-MessageData-1: LodRyuvxCiC3uA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5efa8a-f5a4-46f7-9451-08de740977af
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 01:01:55.0216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXOlc1cs2XRPHbOxy2JTGysoumw+3NKn2PirskU0fryn16LNkPVRUhBel1Vc0KA+1Q9vtWi7JBd5lASGwpU6TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8769
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: B4FD118E7B6
X-Rspamd-Action: no action

On Thu Feb 19, 2026 at 11:12 AM JST, Alexandre Courbot wrote:
> On Tue Feb 17, 2026 at 8:33 PM JST, Danilo Krummrich wrote:
>> On Tue Feb 17, 2026 at 3:45 AM CET, Alexandre Courbot wrote:
>>> A few simple, loosely-related small improvements for nova-core,
>>> including reporting unprocessed data in GSP messages, removal of
>>> unnecessary code in GSP and the sequencer, and leveraging the Zeroable
>>> derive macro and core library's CStr. Probably nothing too
>>> controversial, so I plan on applying it soon after -rc1 gets released.
>>>
>>> This revision is based on master.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>
>> With my comments in patch 7 addressed,
>>
>> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
>
> Thanks! Staging for applying after -rc1 is released, with the comments
> on patch 7 addressed.

Pushed into `drm-rust-next`, with the exception of the last patch which
has been superseeded by [1].

[1] https://patch.msgid.link/20260123175854.176735-7-gary@kernel.org
