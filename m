Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMLuKE4Qe2nqAwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:46:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56571ACED8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACB710E7FE;
	Thu, 29 Jan 2026 07:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q4qIq74r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010041.outbound.protection.outlook.com
 [52.101.193.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC8510E803;
 Thu, 29 Jan 2026 07:46:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVf+qiNGqVqji1Nwv8l92OzHohOSkmtDFbuMLuqJ/pWR/hIPzt1CHDbzNosIsfFkseoCMFa7F3rMS/dwHoqdzKmWN4Eh96ygrIlJkdw2oQX+D/wR1KbEy4ao0JmE6GjZR8ZoIEKoGNE/78r2xbvCBuJznqAcvQLOYHc0RCbLFBnuRSOA1vspvRSeK5qorLuYK58PrS8TDq14irdnpGBT6SobnZuRdwl9aykNf4epvTXj8ci/TvodjPrd38shDi2qY9FflV2GbezlNG4iKwaM+3cXo5UzlaJ17uSA8XyYJJz+X3GXs2CVbXZQ2DtAsJvJVaxoR4yXYv/54aLDmuA8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkYLE1GCV4fhy/ZBsygC9VidZlpmhfG27JGnERN8Ics=;
 b=GcROp+4Mn4uUVqCbUFxXLfgGiurmoaOdKJG9YlA8ZSeOAuPYd56BLdzXHa7t2790tAmKUlQt95wAsZcAg+1fCbgC0W6u8e90x/d9rrNdPlcjTMHxW9J4JmMmZHBJsBZuZzzyadCWQJpZ6ACJB3Go0UImStjD6pihBi5hA489pTzBSoMoetW/6pz5H7j/ufLDzhnI3tD8OnoHw6GAxcmYauNALnO05xsp+0mv+fCLnpXH5prG+DiEZEoPwufWQzsRsx0z+b30zAwkovCDNOhhAt/l1gg/C8PuD6XlIvJI2prvViiGqAgL2qGrmMu83on+c07fhyFMaeb9A2LywkQdAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkYLE1GCV4fhy/ZBsygC9VidZlpmhfG27JGnERN8Ics=;
 b=q4qIq74rG9fG6ENY/yawZMfmPueh0I2KvOQMO6H8uqQLK3KJBpqOHhlpoOOpayEsEy9NIclH6hYL1vvfctByxwpLFGgT4yIdzcgOEgQKw3aZD4jxl58yhRzdZ35CfyvyhZmMewxz1t6UD1uzW98Ue+p5x0Qp7TRyos7UaB8U4Pl4t9PKQ8VwVe4ntDSb4w2k+wa2UaIrlS1shDaLjfyzYG3gZWdu3aZbQBXj8VIqd5hbEmUyM6y8Cj3BSv+xa7Ehw+DDQJi38f37oCxdVktYC6zAAotw0T1e1mPbeIILNVsHXdAu9XHms5BUMchkLdQ+Ei0BWvPw0aJ0ZvPQfbL/ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH3PR12MB9124.namprd12.prod.outlook.com (2603:10b6:610:1a7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 07:46:08 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 07:46:08 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 29 Jan 2026 16:45:03 +0900
Subject: [PATCH v3 5/5] gpu: nova-core: gsp: fix improper indexing in
 driver_read_area
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-nova-core-cmdq1-v3-5-2ede85493a27@nvidia.com>
References: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
In-Reply-To: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH3PR12MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d9e1b3f-ce02-4d2f-b2d1-08de5f0a76de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2JNbXFvQ3Ava2VnOVM2bVcxcnArNk5FVDh2S2xMK2dXaEMza0pGNXBjWTRz?=
 =?utf-8?B?TGNXQjh3TW15S2lXSDFCWkJTdWo3MER6ZG1HUmdCQWZCbUk0QlJZclFtRDQ5?=
 =?utf-8?B?Tkw3cENFblJvN1YwVDhheEU2UlVVYkQreDhmM3lvQnFzTHlKNlo3UGVodXE4?=
 =?utf-8?B?VVViNG1pZ29KVUd2TnNBY2JNOXUvQ1QyYVB1Q09XeUdyVGRBRmlFS1o0S3pT?=
 =?utf-8?B?ZjRnck1sRm9Zam5LdWx4c2p3eXpHeUdxZThVRTdxYnBONUptanVzT3FNcmxM?=
 =?utf-8?B?ZHY4YkNjMGZCcUVwbUFIU3FJTWdEeTNVcEdaNm5lSHN2TkY4MXM4Z0VWb1Vu?=
 =?utf-8?B?ZFRINlhGNE9iQSt0KzFTSjJIdUdNcXhtSlVlUXFTZ1RZQ29NU2JVajNzSkdF?=
 =?utf-8?B?YzVKbURKS3h3TW1FbnVsbHBVN01rL0VjSmpnbE9BS1YyeHIzd0dZanp4UlV2?=
 =?utf-8?B?L3FndHh3a1YrcWE2TDc2SGRnVXF1cGt6SkhoVmNnZzNvbFBjVGV4NnZYdVdP?=
 =?utf-8?B?ZGJxc0w1dDg5ZTR3enpGSFNGSWZKNHQ4cHcramhmTFY3eW1YQ3RPRkx4L3g4?=
 =?utf-8?B?UElZdmpxa3c1enZZMktiR1Q5RDc5Z3RkeUpsMEVzbmJzWjZ3dTZERkh4ZTVu?=
 =?utf-8?B?ZjlnK0UvVGtYYld2eW51L0xaVjhBb0FhMlZPa0srZEZ5VWwwWXp2bkVISHZm?=
 =?utf-8?B?L1BwdkpoODdtTXlEVktRcXhWZ0o0elpVRUI5SmhUVTlQY2xOV0pwbysyUmlZ?=
 =?utf-8?B?MU11SWwvVHBScEJBeGJ2bFg0MUpqTWkvMXZtQ0QwNzg2alRHQ1d0UnZieGdj?=
 =?utf-8?B?aEdNM3ovQzA3ZFJGZk84NTZZN0Q2UXRibHN6UDZxRlZqZFBVZ24zSFJUUEpO?=
 =?utf-8?B?SkhUM3kvUVRlRGlKZmtjTkpLYVVjdXVVUm05UGt4bWZsUWZESWY3N3Q3bjFv?=
 =?utf-8?B?N1J4QkRub1BINjRvOFljK0gwelZTcG1vRVhPSkk3RitGQlpmYVAzYmlhNDBW?=
 =?utf-8?B?YWxmSStzeUZ2NGxjakFOUUw5SmdlaVlYK21DRUhXVUdKMUc4TkhEM21GMWhR?=
 =?utf-8?B?U3VUWnEzTlpYZXpmRXhQM1IxQ3pPVUpLRDNFY0ZqZHBlYklCVm1WZFFhY3cy?=
 =?utf-8?B?UVJmVVEwV2IxZGVraFNHSGN0c0dZbXJKTGs5RllUdndoYUpJeHoyRlhncGR3?=
 =?utf-8?B?VjNHOXBaemNlTWx0ZWNwS0htYWx3SnZFSTFHVEhXU0Y3Z21YcmJDZjJpVDFv?=
 =?utf-8?B?ZkVHL2R3U0o2eWVpaktJODFINnFaMkhCS3FzWFllck5TUm93QzAxbks4TmZs?=
 =?utf-8?B?bVE2NzVUMVA4YkFRakx5bzZSYi9DKzBBQk5pMlVpN21IWDBIQndXTGVxMEtV?=
 =?utf-8?B?QTQwOVUwTG5GcU00anlLNEtSMlNUdzViYUZyeUJ6UTcwbUwrNDNYSk9mWjln?=
 =?utf-8?B?R21HTkhybk1wanpRczdDTUp5Szl6UGdnTTY3VDNjKzI5VU1WM2pLd3FFNVVG?=
 =?utf-8?B?RVlmeUdrdnZiUlJLRXVDSjRqU0d0aitWNUdZcDUrUjdDQjliVjV5bENhajhz?=
 =?utf-8?B?ZXNjQW5vRHJUakhGd0dxbGMva2tUbEZYcG9lYzdyNnBEWjhRTkFFL0MvVUxy?=
 =?utf-8?B?WC9tNnVkWG12TUtVN3IzOVE4Tkt5eERCZTBUVjVnRDlnLzcvRlk1NCs4emlG?=
 =?utf-8?B?dlBhalF2aDBzSlVOc3QwTmxubHVzQXBtNmIzMUYwSGpOcjZsd0lJbmJTOG9I?=
 =?utf-8?B?cDdBM3JvWnRJcjZzZmtmREFXd1JxaStWTnB2cWZFOXA0SEZSaGNGS3dBSGFo?=
 =?utf-8?B?OGJyaThWMlFxaTVMWXlwbEgwUzczUGVnTnYrSk1KUjVyNmt3WG1JRFFKUGEy?=
 =?utf-8?B?OE91TmFrUkJWdUs3R2kyY1c3QS9obXJpYWlHRXJaV25lRlZGVHhWWFJaQjJn?=
 =?utf-8?B?TVFvcEtzZXVGNnArRm4xTGRZa1FEMWgwUktSS3dhayttOC9pdGJOZnhxbVFR?=
 =?utf-8?B?ZkllN2pwdlBFVk13SUM0bUo0eHBwamVIbmJmcG9oYmE1T3lOWW1UalBxTW1Q?=
 =?utf-8?B?cTVqcEZFUmhjWGowTTNwWENvNHFpRlY4aEE4QStQa1B1MnB5c3YvVHJIR0FG?=
 =?utf-8?Q?ZYUk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWNLZVhTSEdNekc5UTF4RkcvbThDY2I2dTRBdG5TSmdJb3VRVkNZa2hTeVBq?=
 =?utf-8?B?amFEQVRPWlQ4SytyQ3RxdE1mQVkrWWVGVElOcFZhZENhZ0tTOC92enhPeDF3?=
 =?utf-8?B?cFJkVFc4NUNyekRBZ1A0ZHY1TTVOdS9laWZEUTFPZzlXQndtYkd1VWgzNTYv?=
 =?utf-8?B?N1U0K3l0MkpmcERkZDZrMlpwYytvbU0remlaQTZvQ2VpN1ZlYnVxd2lkQ29Y?=
 =?utf-8?B?U2RTSWltOUFrbnNzZHJtMmZFNEJqTXY0VTduQnliZUFQbmdnNERWS1J0MUQw?=
 =?utf-8?B?MDlhSEtPVkdsU241MDhRWUdTWFhVL29obHpaUHgyVFVFZDNWWXZObFpSMmdk?=
 =?utf-8?B?MHRLSENkL1hWK0xvS3k3YTFiNU9jSmU1ZFZtWWRLU2JCM3BEQStqQ0E1bGVW?=
 =?utf-8?B?TDlpa2taQkhsbktwcXlJUmFkaXFXbzN5Q2YzZGJUZ1VQaXVJL0dXZ3BZNnNn?=
 =?utf-8?B?SEZodlVXNVBVV2gxWFJjbllPbEtscFNlVXZpRjRkOWFKQWJBamR4REtsL0NE?=
 =?utf-8?B?UmpwalJUd0RsaUg5R3B4L0IvaWlUQllGdERjSDBvZlVSRzZTcE5STlYxaFp2?=
 =?utf-8?B?eEsza29PZGpHOSs1aUppTkFYbk9SM2Exc1NZVnp6Q1o4aFFTckUyc3pmK0hM?=
 =?utf-8?B?NWQyUXNnS0xBUFRvaTdJczlNSUdyVGhCempDZUIxSEZNS3FKQXVLRDVUd0E0?=
 =?utf-8?B?Q2RwbmxSNDlZeXRicm1oV1Z5UnZ1ZlJpNDAzQTIrT1BMNWNNSFBtbnhnYXZh?=
 =?utf-8?B?STBTS2oxVmt1UUo1MEw1OXNqeDlkTDVWM0dISkdjNU9EVWNBZS9QWjJlR1pO?=
 =?utf-8?B?VWxXcUR6OG5qK04wYUJhbFRkOWVDMGdMM2NYejd0d3ViazdkSGpwV2M1T2ZQ?=
 =?utf-8?B?RFJzQnd3bjFCYVZFS1FpbEhTZEI4TXdPWHpWNWdmbTN4MkNpNXdLUGtldEdO?=
 =?utf-8?B?MUlHUTVKYWZTTWwxZGk0L1FXUitBeUtCc1g5MDhJZmVweTN5N2pVRHpxWjdO?=
 =?utf-8?B?ZktiNGlvWmNxT3ZHTnZDclEya2YzbW9mT2RpZkIzMzlGU2NXNElvOW8zaDA3?=
 =?utf-8?B?VWE3ck0vOUNiRTlhbGVQUkUyakZpLzlBc09nUmlVeGpwYUczQkYyM2JKVi81?=
 =?utf-8?B?MnRPMjRidW9lYm5MbFBlZFFtc0wzOHIxVFVLMzF3RFpNVmg5ZFF2aE5BVktk?=
 =?utf-8?B?RGsweEI0clFvVGcrYWRWdjNIUy9TTlFSbTYzMFFuTG56ZkREMDViZkgrejVT?=
 =?utf-8?B?dTl0YlFtVVpEdWNDRVVBYmUyeVNub2hoVUU5TnFWSEJpbHRmYkVuNllqdmRH?=
 =?utf-8?B?aXUxd3hDWTNrdVFHNzVnS041a3FBWTFadGhZaDhTSnRyTUJhSnYxRFhDZmJy?=
 =?utf-8?B?L3hwaWI5QTlrVGZZZnZDemExTzNvbXZWVW4vZjRwdEFwSFBMYkordy9WVWt6?=
 =?utf-8?B?eWNSMmVWZzJhRW9yeE1EWkRqcEhINjlMQmtqT05oNWtvRE5kUm50cmtjRkFM?=
 =?utf-8?B?T2x2UWtmaVVabmxvZng2M0Z0TDFJcWRTR3IxQmpWVGdXQlp2eUp0S2VnazJx?=
 =?utf-8?B?emhoZUpFRURVakc1c3NPdllGbm4yaTJjVkJVSmdsd0dJYkthSEQrNDAyUHdS?=
 =?utf-8?B?dEhQc2tYNFVSUnRYQllMMS90RUp1aW96NDJJUm11aTFrUWhNaE16UjVvUmRx?=
 =?utf-8?B?eHRxUm1JenZja0JBMFBodzl4UllsdHNTdVRXN0Q0VmJ4Y1QwT2p4dHhpd1VM?=
 =?utf-8?B?cEl2U0ZUVVBsbXV2SmNsdHdRaUJ4U1NmMFdMVTFzckpLTk1OY3VucmR5U1I3?=
 =?utf-8?B?OEZGTnFOZ3lTVng5alFwcmlZcVVwZEg3bnBiMGIwY1Z6V0JienNPcjl1REFw?=
 =?utf-8?B?SjFlM2JyVkJNejJteU1ZbkN4cE5pTFQ3MjZPbWI4UndDbExEQ252YjFIUEhG?=
 =?utf-8?B?ZmZqZ1JwUE5FbzFKMnJXa0dlQUVBQ1FQM2tYdjY3ZFVFNWNraXVyUGkvVVNM?=
 =?utf-8?B?bEJSQjRRY01ZQ2dkZTZjb2dFRDAySmVYcGZjWmY4dFg3eGI3NzlpMzZtcFBa?=
 =?utf-8?B?NnJ3bE55ZGZ1WE9XVUFUczZuSUl5WFpWY2h4V3VhNC8vRXpWenVRVWRKYkFJ?=
 =?utf-8?B?c25lUitUYlBMdDJNbXBWdVlRa2xnNkdEYWc5WTVsQ2tKVUxuemxDNXA1MHBE?=
 =?utf-8?B?anpYYzB3YWRtZDk3OWlpVE5zRjNiZDV2eHY1djB4cFFBcVBDNVIrRXpTWjNr?=
 =?utf-8?B?QzNBYitMTTV2RmdVK3IyV2V3VjFUU1ZzOHplMXRCSkd2QkV6TDJUUzcxVkV5?=
 =?utf-8?B?ZWRmMWMyeThIaWhxdk1GVlY3b3E0VmdNcTJ1NGcwbHlDVHVtWjdGYmRKU3Q5?=
 =?utf-8?Q?xzQXAvs51sjF/4F1xqmMoYHM5VQ1KSdhvRYQdXQZRpsGV?=
X-MS-Exchange-AntiSpam-MessageData-1: 70LjjO+i+0HBKw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9e1b3f-ce02-4d2f-b2d1-08de5f0a76de
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 07:46:08.4408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfg9EihUo07uROS7xtJMViaC3tUlIkd4er5rqxpJuiZVwiuuMoH8OawL+dNrksn6v+E4yGlOlEQZ48hOGeYI+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9124
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	URIBL_MULTI_FAIL(0.00)[gabe.freedesktop.org:server fail,Nvidia.com:server fail,nvidia.com:server fail];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 56571ACED8
X-Rspamd-Action: no action

The current code indexes into `after_rx` using `tx` which is an index
for the whole buffer, not the split buffer `after_rx`.

Also add more rigorous no-panic proofs.

Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 333bf0125d74..16895f5281b7 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use core::{
-    cmp,
     mem,
     sync::atomic::{
         fence,
@@ -265,13 +264,19 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         // - We will only access the driver-owned part of the shared memory.
         // - Per the safety statement of the function, no concurrent access will be performed.
         let gsp_mem = &unsafe { self.0.as_slice(0, 1) }.unwrap()[0];
-        // PANIC: per the invariant of `cpu_read_ptr`, `rx` is `< MSGQ_NUM_PAGES`.
-        let (before_rx, after_rx) = gsp_mem.gspq.msgq.data.split_at(rx);
-
-        match tx.cmp(&rx) {
-            cmp::Ordering::Equal => (&[], &[]),
-            cmp::Ordering::Greater => (&after_rx[..tx], &[]),
-            cmp::Ordering::Less => (after_rx, &before_rx[..tx]),
+        let data = &gsp_mem.gspq.msgq.data;
+
+        // The area starting at `rx` and ending at `tx - 1` modulo MSGQ_NUM_PAGES, inclusive,
+        // belongs to the driver for reading.
+        // PANIC:
+        // - per the invariant of `cpu_read_ptr`, `rx < MSGQ_NUM_PAGES`
+        // - per the invariant of `gsp_write_ptr`, `tx < MSGQ_NUM_PAGES`
+        if rx <= tx {
+            // The area is contiguous.
+            (&data[rx..tx], &[])
+        } else {
+            // The area is discontiguous.
+            (&data[rx..], &data[..tx])
         }
     }
 

-- 
2.52.0

