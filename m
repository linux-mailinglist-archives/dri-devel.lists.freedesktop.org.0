Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C41C9F072
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 13:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E4F10E14C;
	Wed,  3 Dec 2025 12:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tQ6wwCCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010051.outbound.protection.outlook.com [52.101.61.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E04510E14C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 12:58:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoSx4Cqnr03bs35NpvtTUhwzkrwzpZKQtBUBrdVpN+Ozxs7pDy7oRIn6AQ4/VQDKjBEpdVUUlB2cweTven9wIYIMq33PawVLH2+YthW2c4v5YsK1b7KAAWVsG6XCFynAhFS6FrMlHsndUgGKCK/A5gnZa1b+9yDfkVKNyTw8QUnunxV3qzO26BLbr0eIUVroz7WntvXLigucevfnJQpkq5YJF7Mv9gOk/l56ss6ZqmucK0cVSdPuRVyKV4VEzU2kapNS3Vlmez1O6Mi1/iaNsTeacd0Z4r/zWoyn9jbc9b3qJsE5OVrUna9L8c/My9Rx5zdY4/0DPb3+nNzBBTyIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNi7zHfAuV7abxq2z8ZJ8PbnYAwfo/E1z3v6S3/NjQs=;
 b=Cy6DSM5W4ZwB5qdRvrswvKJKl/+tnK5lXPuQZBkXUAt7Vt2YDZW5baWCQv88GcTeSpJln8T4hbjRMvq1pfUQg98Z/9YQBLZ8EFpX3qfIU/vFaKoUmmW2ogHCtNpGjBrjLm6orcMhrgxTbfrqHIwzFEL9tdqPLstNXHErpxeZbQPGmPqLoCE+MlwKu4D0y4JkHHIbeArRl/vhBV8Sgfh5H5Wjc5KKKVOOcgWYCerQOTtbVPwsmimcWmjjQfya2fkmkK+NkhWyrDLslSpxYdbkf9TB0oz0C53DJs5JcJrvpW7D2XnIkHb/VY+N+wYtNycsUQ2rE0AnklDISkyraplfNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNi7zHfAuV7abxq2z8ZJ8PbnYAwfo/E1z3v6S3/NjQs=;
 b=tQ6wwCCnsE0VTNdcKq+6MksS6nIdH+996Jo4KWzyzEAT1RdaYRGndS9j3jtOs89m//WNGGMOCtrfxB3pKOerqwoqQ/8WufP6LAUQ3KXjCFsYdfucrUEsU9XsCUVBb+IPOnMxn0aT/rFbNEtEwfJKXp8FP5fLNP/mr0iMUp1DxrE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7121.namprd12.prod.outlook.com (2603:10b6:930:62::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 12:57:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 12:57:35 +0000
Message-ID: <2c660e05-526f-4885-b7d7-4e843655fb3d@amd.com>
Date: Wed, 3 Dec 2025 13:57:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Some small TTM cleanups
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
 <fdbab4cb-5011-451b-bec9-f246f3949c76@igalia.com>
 <989105d9-fd72-4a9b-9517-be37d24d2603@igalia.com>
 <f5ea0445-c5b0-44cd-879b-9f1426640d2e@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <f5ea0445-c5b0-44cd-879b-9f1426640d2e@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0424.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: f12fcb7a-c931-4035-8f61-08de326b8769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVBiR0o5YjVOT1B4RWxTWFFMRUhmRTluRCtvemRQM2xySWY2WTU0VmhoaGZv?=
 =?utf-8?B?STNyWW5OczhxVUlCT0Z0QnZzTGtXdno4SFBtM01CYjlZWDZMVHB0VVUxK2tG?=
 =?utf-8?B?SkdTRXlzb01aWVorV3FaOTJHdjNrWXV5bm55NkNzMWFoSDVQYnp6VVJvd0Jr?=
 =?utf-8?B?UUJNN3o5dlM5UkNwNHF3KzBieXpBb29ab1ArVGJaOEQ1K2hnbFBOdHJ5UFhO?=
 =?utf-8?B?WUdiWWVoVzhXSjVVc01jWHNiYlFvM2djNGZ2MmpCRlFvdm5ZVUZ3Q0VGMmc5?=
 =?utf-8?B?eWtENk9oUEZSYytnMXN5Ym1qdEFGMjB4NW5oMkxHVUk2eVliWXNCYVBQYmFn?=
 =?utf-8?B?VUtFNDMzOGtScHEwVWdBZmtVdmJDdUNYUVJHdDBrWVd6REJobEVwQmUybm16?=
 =?utf-8?B?VjgycVErYVNrOHpnUUg3WTZsYU5IV3NGSmJPekVYcy82NDFsVmxpU2cyNktQ?=
 =?utf-8?B?bGtBZXhIYUV1REpZNlhsMGxmUDlLaFpNWDBVYUtERlJuRmd2OUR4dnluTjdp?=
 =?utf-8?B?c3JSMWJuL3FXVmowSzJseE1MUndTS0VtVTJDc01RelROQXkzU3kyRG1yallM?=
 =?utf-8?B?U1YrVjlKRGR4eVZkQ1VUZmUwaE9ZOU52R1czSWN1aVpzdGFGckNNb21BR3RE?=
 =?utf-8?B?Z1p2QnBiaWNQZEhIK25seHBacWdGMEpjaVNodEJsWTFLUEkvOFo3UGMwRjVl?=
 =?utf-8?B?UFNiR3d2aytrNEVyKzRrRFFIK29rSC9SUmR2OXJYYmlNc09zZ0JYKzBIRS9p?=
 =?utf-8?B?TXZBR1B2RHN0Ylh2Nlp0QmNNODRnVWFUZWMxaWFNRWxQam9nSHl4QU9VaUdu?=
 =?utf-8?B?S3R1OWJPbWVxTnlqMlNLaTR6NFhlSnVqVURXOHQ4NnBBd3R5Z3N6d0VvTmk0?=
 =?utf-8?B?MU1QUzBDOExHUWx0RExUUEx1UnFNK2ZsLy9qMlVwNGZBUGh4UkdpbzI5WWoy?=
 =?utf-8?B?VjNxMS92U1RCSFpFMVYxWkZFM0NDZjBBTDZiVUNLZ0toSjU4a01YVjVIWGw3?=
 =?utf-8?B?Ujl3ek40cG1wM253LzhrcTlBYlcvaWxWTy9kYTdjRlZFUzN3RXFGaEJmZVNW?=
 =?utf-8?B?aEc0alJTVmpQOG9sMm4yODZPOWVxRVIxOVNLS3JDc1BadnhkNlRKL1FTQ0ZQ?=
 =?utf-8?B?QTgxRXJHUzduUTN6WDh5WXhOVU5zZVQzTVhoZXMzenJYWmFiS3dxNTkxRzJY?=
 =?utf-8?B?L0ZRQUxXZkVFemdacDNpTXJRUjhSaG1DMGFjd3JpejcweHV2bHMyMmtldHk3?=
 =?utf-8?B?OG1YbzBkRG92QkRHWEFEMXN2MCtMR1B1MGJzMk9hcWhTbndMRHBYWXZvQURL?=
 =?utf-8?B?bEo5aUdPSGRpOFNvMURsVlF0djR2RWhxRlF2aGNWVHpaMTNLK3NydzFwQ08w?=
 =?utf-8?B?UVhWeXZnTzQxLy9ISXNGaFBtT3RsREo5ZHZwWDBuN252NWtQQUtFbHcvbGQ4?=
 =?utf-8?B?cUZwSGJQajdaRERmUGgvWUYwc21Kbkp1QjlhV2tWVmppYUFGdEZjN0JsMnRW?=
 =?utf-8?B?TWlaVmdxMHArZmR2VWpGbVNDZW1NYjhSWW9WKzd4QzlCTElxeWlwYXBqNTRp?=
 =?utf-8?B?VFdtUjdtYkZvdDVOZ0NmSGsyV3d0NjdrTVczTVppNnV4ZS94Rm1tU0NEb21q?=
 =?utf-8?B?QWFyN2l2NTNqVEN4ek0vZ3BNYnpPVGVqaUhJK2hRN25NUUxkK01sMDh4N1Qy?=
 =?utf-8?B?K2pxK293RHU5d1lIT3lMMmhEMlo3YkZxc2N3UmNhRVNSRy9qRWtjcDBuREkr?=
 =?utf-8?B?TjBSOWx1ZU01NTZRaVRZamwyc1FUYXRkUk1neDl5RDUzWU5Nc3ZWK25sMDZw?=
 =?utf-8?B?UWU2MDhGNU5pb01ta2kyNjZVclh6bVU4OTI2K3NNbmc4TGFKRm5Od2FuL29V?=
 =?utf-8?B?Q2x5dVhoblV2WFRKN1lmMmNQREd6Zzl5VWNxd3lRU1M0a3c5ZlMyUC9FbFJE?=
 =?utf-8?Q?SdRKHdMO922BWC0Qlj+uUSEKEZh2IkZv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmdDY3grOEtPV1YzYithRGJUaWo1dWFJRXJ5OGhKL050K1FmaDg2d1NQcnZN?=
 =?utf-8?B?N2U2UDlOcitVaVIrMzJ6MUpsaWNHUEM1VzIzWlVpWGF5amJ3UUlHZnZkQVFl?=
 =?utf-8?B?RHVjVWNKTUJ3LzRaS2VHcmdIZHZVZXZwTEpVbDB0UlNFb3Bodm1oRHd3TGp0?=
 =?utf-8?B?dzVsNmR4c0Z4SUU3SDNjL1ZaWjJZYU16UWdkTWVkYjNDYWVhb1hPZFV5VHJM?=
 =?utf-8?B?YlNHRHZWclpvZjVSS1RTc2MzY3lwQk9EQ1lGSWEzUW9lUXdKZm80ZCtxWStY?=
 =?utf-8?B?VTdQVTc5RXczQ0dudlN6VC9HQUE0VjVpaGNiREJyRDZyTGV0Vis1Tm1CamlP?=
 =?utf-8?B?UFdvOUw1cGpJanA4YkJ0dzRIQWxOd0pSckgwV3VwN1VRQ0pzUU1Ld0pmT2JM?=
 =?utf-8?B?UGZCR2ROM08zUmV1bk9jRFBScjJjYXIzVDh4M1Q4bE9RczdaRjg3MzBDemlz?=
 =?utf-8?B?Tkd0d1RZVUVvUzU4MDhTTmtmTlpXNmVNaXd3Y29TZWNBNXpzVUpSdkgvVll6?=
 =?utf-8?B?djZLUW5NaHdvc3JodmdGQmtGSFlCTFlybVpVRmFSMGsvZkNWT1V2Y0UrSytB?=
 =?utf-8?B?MjBrZ05pTWRNcXRmcTFGa0NjWVZ6U0RpNUVYTlY3RkM5T0QzOFg3cDlGd0kz?=
 =?utf-8?B?M0pLb1gzVnYzcVE0WW1sNXNXMkJjUnFvS1p5S2I0bTRSTzJwZW5vUjlzSFRs?=
 =?utf-8?B?cEREMHBqQnhJVXQzekVzU1Radnc1QkhERWxsVU9NNDJsOVBuWTJEYU5oNTRq?=
 =?utf-8?B?RFhVNGtxdzUvY1N6WFJEUlhneGZzcjFKY3FydzVnVmkrTkxkV1psdktOTjN5?=
 =?utf-8?B?eDVyMFFYVXFpRk1nN0VPQi92T3pmTlIxbUdKS3FFb1hMR1FQVVZvUUpCZndI?=
 =?utf-8?B?b0xnaXVSWFp2WklNWC9xS216bXFqc2o3RHZia0ZDYW4rUGNqQ281clVVOGNT?=
 =?utf-8?B?eEo1eWx4NEEzcDQ0SFhaMTZEaGdqaGRCSTdjR2I2bHVRTm4rNTJmdm5Rdll3?=
 =?utf-8?B?OHRWOWdBQlRDZHdtM1ZuTTdXY1Vkalp2OFF0eWpvOUlieGRZNGFoUUQwcUpx?=
 =?utf-8?B?dTE5MGxjWTQyOWdja0pPU1U2WllwRERBakJueS9XREJrNG9TMjRCRWhFTjAy?=
 =?utf-8?B?VnMyNjVTK2lObWFXT0JIYURjdGgvUkU1dm80UkgyY2pya3QzelRXc1MvdndW?=
 =?utf-8?B?ejltbU95aUIrditUNlBoNXUxMzliTXhSVHlWK1VJVzc4bGlBRnpGd0QxK2I2?=
 =?utf-8?B?V0R0Y2xVVjNWQ2h6R1JDRkU3UGJ2cVg1Nld0d0F1OHR5aUJpY3FZem0zMzZt?=
 =?utf-8?B?YmYyTHYwZFQwSVIwT0VHdkIvY2l5ZGc4VHE5RFcyWXR3VjBUS0ladmNvMEo3?=
 =?utf-8?B?RlJiMlgwaldGZ0M0Nm1MeFJJc1lVc0VGUkllVUYyaFBESUNuUDV3QnBIZ0xh?=
 =?utf-8?B?UDdNRmJzSVFxZXdIdFg4a1EzaVdmSis4TzVEMnU3ZUtBUWpHcTNHTXh5Lzh3?=
 =?utf-8?B?dEdIbVVmMWlYYmpzVWhPSWJhcTMwalBvcHhnaHZjcmRUNmNYSllua1VGTWh4?=
 =?utf-8?B?Zyt0aitXQll6dlJ1UjFjL2EzTkVrejVQK1NudllVSmNPVEN5Z012RnpWYWtK?=
 =?utf-8?B?OERsRlNWOXRaMXlvS1RaMXF1M2hNR0NSdktGd3RsOGtneVA3eHZRcTZvalFF?=
 =?utf-8?B?cFdTZnpHSEdyRGQybXVBS2tKR3BJMk9OVHFGRWs3TndzVzAxOGswQjVvaW42?=
 =?utf-8?B?TjZDOXJaTVRwdnVqMHk3dlNFUVdzd3dKTmkxODRqYUg5RTdXeEZDdDh4Zzcy?=
 =?utf-8?B?d3JnMDBjektpM3NScFl4d2NXYVBNMWxoUjloV05ZbWIyZEZsamJTYTBpbXVX?=
 =?utf-8?B?UFVaMzU1K0ZBRk16WDRjMHB4TCt2b1d4Y3IvQS9KQnQ5dk5KM29PY2hKT2hB?=
 =?utf-8?B?MXJBUzdSOXZwdVdoZEhqNTJycGF1Rm5Xd0RkZ2dhTmpmQWtudlpKMnlLc29K?=
 =?utf-8?B?LzdNM045OHBFMVA0Z1JnOEtLT1Jwa3ZiN0k4NmJ4eTlXdndVamUra2F4cWY3?=
 =?utf-8?B?N25XK1dUcnRyQU5DY09EeHdXcHZyWkVsQ053WkR6MHR0MHJUbUYxNE9qUHNJ?=
 =?utf-8?Q?n9rs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f12fcb7a-c931-4035-8f61-08de326b8769
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 12:57:34.9720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOhV5+HjcpLBxNTsbFFyA7BKXqTAzC45dR8TKOpNNSpIwzLUU2T2AksRvqiDMtgS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7121
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

Sorry, I'm mostly on sick leave at the moment (cold/flu).

I couldn't find the original patches, neither in my inbox nor using google.

Could you send them out once more?

Thanks in advance,
Christian.

On 12/3/25 12:34, Tvrtko Ursulin wrote:
> 
> 
> 3rd ping, and apologies, for some reason I thought Thomas you were listed as maintainer for TTM.
> 
> Correcting the To: list to Christian and Huang.
> 
> Again, asking for acks to merge this trivial series.
> 
> Regards,
> 
> Tvrtko
> 
> On 21/11/2025 10:02, Tvrtko Ursulin wrote:
>>
>> A gentle ping. Two really trivial cleanups are ready to merge just need maintainer acks.
>>
>> On 05/11/2025 15:33, Tvrtko Ursulin wrote:
>>>
>>> + Christian & Thomas
>>>
>>> On 19/09/2025 14:15, Tvrtko Ursulin wrote:
>>>> Some small cleanups, nothing intentionally functional. It is mostly about
>>>> applying some consistency to when to use a local variable to cache something,
>>>> when not, and making the code use the ones already there.
>>>>
>>>> Tvrtko Ursulin (4):
>>>>    drm/ttm: Make ttm_bo_init_validate safe against ttm_operation_ctx
>>>>      re-ordering
>>>>    drm/ttm: Resource cannot be NULL in ttm_resource_intersects
>>>>    drm/ttm: Tidy ttm_operation_ctx initialization
>>>>    drm/ttm: Tidy usage of local variables a little bit
>>>
>>> I got acks for trivial cleanups patch 1 & 3 from this series. Are you okay if I push the two to drm-misc-next?
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>   drivers/gpu/drm/ttm/ttm_bo.c       | 64 +++++++++++++++---------------
>>>>   drivers/gpu/drm/ttm/ttm_bo_util.c  | 57 ++++++++++++--------------
>>>>   drivers/gpu/drm/ttm/ttm_bo_vm.c    | 12 +++---
>>>>   drivers/gpu/drm/ttm/ttm_device.c   |  5 +--
>>>>   drivers/gpu/drm/ttm/ttm_pool.c     | 26 ++++++------
>>>>   drivers/gpu/drm/ttm/ttm_resource.c | 14 ++-----
>>>>   drivers/gpu/drm/ttm/ttm_tt.c       |  2 +-
>>>>   7 files changed, 83 insertions(+), 97 deletions(-)
>>>>
>>>
>>
> 

