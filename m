Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F38669F4B39
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 13:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2D110E961;
	Tue, 17 Dec 2024 12:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yclppoex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22E910E965
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 12:48:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7/gbMWchcYAxUmw3o27yQANb5FKuHAnzR7UDnSE5REl8lyn4lRyhQLBmUESLjqrLKP7rpw6j+f1Ahwd0SNssm+HXo6U4oFqSjUpihaJmLJcMism5oo4nigvROJ9d3uJROz5pI9BTv3RIVuoJidrcq/J/uvvNWwIVfIV6VXeB1i/HlqKkLwLjvRHOjssYCo0a8p16zDl0LkVck86WVuGKltSm8de//Wejbnlr+H24Laf27gQCBSXRLUrZYUhnHe/f6paWNVjvezXtJujOVDC2d3pYYzv8IlG+Kw1uqcZQY+eTcyOgGY+z6XITulfu2KAPXWeK3da0s3Z6wd6oYT+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqNWNP003BycMSYVoEMe3I0kboMTYghxxFlobcfn9co=;
 b=PuX78QoiQpW+671hoidTJLhyruiLqjwZDUjEzyoH2/Z2xBmZ9LxEgjAdgjdJSsrFFRRQzYKpRabIBtvsDllOiaL2hWsZ9tL60EBf8oRt70DPpppBYT0MnjwbprmMdcwdENROGYj0ATlqiPMQLdnFTqHZkCJPvzGXRsYSFHV+WRABBCL4+QwtaSFtKLDNq4LSPxvhUSQmv2tUw88jHb/RZtc7Zgu+fmf6gdBxSY/JS5vQIQqh3hjSJtnM+uOulYsH3/3LOva/W4+o6Ot+yzdMQDXOhV5X2Yi0Ia3tqiOc3jUMannhSVBGYU3YaiUBhfvpTmDGkQbYuTpitpXxXVPnGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqNWNP003BycMSYVoEMe3I0kboMTYghxxFlobcfn9co=;
 b=yclppoexhdCc+gq0bgTw6hI44eMn4yRWBH73JjdokwITKhXtxFVFju8cPPXSLgeAGIN/vh+SVHh576BhbirhVfgA46YpLDd+N0tZ0SrpYiO4ZJB1BvdWgcO6l+MLdDZMPMtGDvj0eXwpKUwZxpKtDlBVdBFBMtGPZHwos+ntXcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7139.namprd12.prod.outlook.com (2603:10b6:510:1ef::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 12:48:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 12:48:06 +0000
Content-Type: multipart/alternative;
 boundary="------------255vZAZTU7Fn2quDOZnB1Kfy"
Message-ID: <e8759159-b141-410b-be08-aad54eaed41f@amd.com>
Date: Tue, 17 Dec 2024 13:47:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
To: Wei Lin Guay <wguay@meta.com>
Cc: Keith Busch <kbusch@kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "vivek.kasireddy@intel.com" <vivek.kasireddy@intel.com>,
 Dag Moxnes <dagmoxnes@meta.com>, Nicolaas Viljoen <nviljoen@meta.com>,
 Oded Gabbay <ogabbay@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>
References: <20241216095429.210792-1-wguay@fb.com>
 <89d9071b-0d3e-4fcd-963b-7aa234031a38@amd.com>
 <Z2BbPKvbxm7jvJL9@kbusch-mbp.dhcp.thefacebook.com>
 <0f207bf8-572a-4d32-bd24-602a0bf02d90@amd.com>
 <C369F330-5BAD-4AC6-A13C-EEABD29F2F08@meta.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <C369F330-5BAD-4AC6-A13C-EEABD29F2F08@meta.com>
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: f8fb1834-0413-4557-4dd2-08dd1e990d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UURuQndrUHc1VEIzUm02SmtyNGV5VDUxL3hxZHdvQ1I3MWFseVBJWnpMMUZX?=
 =?utf-8?B?T2dzL1E0ZGVmbWNQQklKRXFubGdsTmQzUkpHWUVEQXc3SEMxU0RsMXdaTysw?=
 =?utf-8?B?ZnMvUU9wRTI3YWNCQlpwU0NQZG9SOVU5dTAxUFpjUzNSZWFZTzNVcVVzWkN5?=
 =?utf-8?B?QmUyVzdnTlJxK0NMN1dscXJqK0taZlhYODJibFhmamxGTjBpb0VZVnErcGRs?=
 =?utf-8?B?V1RleTIvbGJNZy9YcmZaNkxCTHFpVE9sLzcwaFdURUxVZUEwOWkwU25wV25O?=
 =?utf-8?B?ZzZuMzJVQW5tRHorVmhneWxCYjJzTm9hZ04zT1JTbkNjSFJKNjBMbTh6Zldk?=
 =?utf-8?B?ZzBlMXE1NFNBZ1dNc211cWY3T05xZGROWTJJa2ROcHRFMDZNMnNpci84VWQv?=
 =?utf-8?B?c0xNbExZZlB0cjVrOTJyS3U0V2RoYUJ1aUlRUUlzcUJodzhhSHlxMk1qaGxV?=
 =?utf-8?B?aUwwUW9JcGpmYVNuYmpsdWdCdTNGUytFczVzK3U0ejlXUXE2ZG9DUE9YQlF6?=
 =?utf-8?B?OG9DME5pa2t4NmNsUzlXb0dtUWoyUUo0Um9MRGZBTFZaOEVhL01hL3djcnlL?=
 =?utf-8?B?UElqRCtxejk0OGpndW5uZ21DbSswVWtocEpGSEpEbU12V1VKRExwWEZ6OHBS?=
 =?utf-8?B?NUk4M3R0bVNMbzUrR0pPL29BTFEwL3duUDVXTklXTkRzTVM0anBQNFU3R1Bh?=
 =?utf-8?B?YytISFM3bWpFQU10SFdjWUZwblVGQ1Jwb25pZlBXN3RCaHFUeE1WQys5LzhC?=
 =?utf-8?B?ZjFMVzB4NnZCbUg2eUYxMDJMQUthaW8zSFJMRjhLZ2Q0UmhtNE5CSzBsRm4v?=
 =?utf-8?B?UEZkSTMxbExLdVU4VHBSVU5oQlhvaW0xTXkyb3hQeXZzbC83RVZxRmNUN29X?=
 =?utf-8?B?eTl4Y29scXBVdTdmTVFFMlA0M3FOaXB5UWtqUVVLb0oveHFoRmZiQnY2Nnkz?=
 =?utf-8?B?aGhrQ2hxcGRWMDVWVjNkdXNKL1lWaHE0VUVyY0ozVEFTbnRTVHlldGZnR3lE?=
 =?utf-8?B?WWx5eDExcTk0UXhHQmwybEpvdlcyVFVodHJtZnJndWNiRG91YXozc0RNREsx?=
 =?utf-8?B?eVl3cGdRV3ZZR0pKMkxJOStBSjhnVlhOb1VDZkVUVkxWeVlMRGxIV0M0WTlz?=
 =?utf-8?B?YURtdFR2L3FHUW5tTHVUYm1OaEdrNTFwajZZb1FRM2VpYXFQTWc0UzJMZ0JM?=
 =?utf-8?B?Zi8xU2dpMXY3Rzc3b05xVnFyUmxqZkxSeTMvRkkrbm03TVJTdXBiaVhBQzNl?=
 =?utf-8?B?alNuMXdvOUJWakJjN2xGMzlhQlBvTnA3VGIzMVNjcXRCeFNEZXR2VlZFUWxy?=
 =?utf-8?B?K3JnUXRvUUpmRXZPNXNWdU9lQ1BpQy9mbFhUaXJGaDRteng5eWlzMUJVQWdM?=
 =?utf-8?B?NkM2Q0dlTC9zeGZXaCtqM3BXc0lUeXQvYzZDdTRGczlHbFgwUUJJV2dHdXNk?=
 =?utf-8?B?bFIzWkRVRWZ4eEtlQWVRY2I1WUIxc2MzZHRuSm9SMGVyRnVBZUNjV2N2TThF?=
 =?utf-8?B?OWtqV2NkenNrMXpSRUVDQ3NHTndUNklXNFg1bWh3ME9KRm1OM3BDOW9PdVNr?=
 =?utf-8?B?YTZxenh1b2doNEpCWExFbklDVUo2RnVBMHN2Z3lWZGFNZ3BGN0JBbHd3dmg3?=
 =?utf-8?B?RHB6M0VTTDZEWGFWUjgzTXRqRUx4b3VJQWYyNjQ0THg0TmxKZU04ZGR5VlRa?=
 =?utf-8?B?eHdNS254dU9nZUQ2QnF0Q2ExOTFtQnhndkpzMEdHdUpLdHBDM3pSK2lpU3l6?=
 =?utf-8?B?dDczNmljTHYrMlFlZHlQdUZHQy8vT2F4MExYNnhVcUxTcVRaaDY1L0g4RDh6?=
 =?utf-8?B?cUVuQUhQL2FzRmtTUldOekFFZ3RqbWR0NGtGTW1CZzEyazBWL3E1YndlM1Fr?=
 =?utf-8?Q?ezO3TqeY6aXSZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXhEdXUvS3JQL2xtUzZsRGhCMWlra0xHcmhVZHRUTkE1eWlRRUlMenZqLzVn?=
 =?utf-8?B?ZUtpOWUzQWo5NStUUENlYStOVGNiRXNWYW9sUVg5SHAxeHVVSHMyMlVOWnhu?=
 =?utf-8?B?YzRxeHhHbTk3cWFybExQYjBpLzN3RUdrNG9uTFk1ei9FUHpxYndPUGF6NEhH?=
 =?utf-8?B?Z2svNXpsbHZZRG1pSHppZjViUEEwbVBlOW1JTzMwSGtiQnZHcG9ZVEVyekda?=
 =?utf-8?B?bFJJMmhaNXIzMERrVVAyWHExNmNGZjAzOVVlMVovOFU2QVdhZDdyL1NYTDl2?=
 =?utf-8?B?K0ZLcjhvemRkVXpERWY1eGNCNUZXeE9TZTd4Y2VOcGtLZ0NsY2dEcmIwY2x1?=
 =?utf-8?B?WkVjRkdYaC9CUWdhbmF5ZXhOSTVwMW9TcWprSHFhK21qL3hPZHpVSGYxTllv?=
 =?utf-8?B?MTBTa3VMNHJhZ0R0VG92VHM0dkkxRUR6aGcyd01RS2I1WnNxOUlmMkhTUHMz?=
 =?utf-8?B?cVg1V2FCSXFtcmZocVh2T1Z1b1o1STZiSGNXUFdXcFVGVDdFditBU2JURnhu?=
 =?utf-8?B?MGNzY0xGR1YyUHZiSnlTMHZueDJ6QTdwRWFVSWprU1BOQWE3WnRqS2JqUmJx?=
 =?utf-8?B?M1dFQzc2aTgyUkFlVkM1SnB4aWZ5emQvdWYwNlNtVTl3MW54VmFEZXF3NlAr?=
 =?utf-8?B?ajZURDMwVDN3eVI1UW5yOVE2cldvRzRxNzFsaUhOekhXWStoejh2aEljWlIy?=
 =?utf-8?B?b1dpSDJOeFVFMFRDTHNsT21yNEg3M2ZUeEJXUjFVQVBqN1Z3ZWxlMXpqT3Rq?=
 =?utf-8?B?cEtyZVNsanR1VGdaUzc5MWI1NzhXTjh4RTBOWVJNeTQ5R3ZNd09HNCtLY01X?=
 =?utf-8?B?a0RFVUtsZTVBZkxhQ1ZWT2NKSmRodlVJY09NN0g0M1NWYzRseXl0ejlKTThQ?=
 =?utf-8?B?bnhJYkkvNzJGLzBrTTdNZUdTMklvVktxQmU3dFQrcVVtYXVOVzUxQitrNEFj?=
 =?utf-8?B?SW96THFMbTM1UExOdFFwUGQvREdXTzVNWlNlb01VQngrRkl3Zk9leGpsUnhM?=
 =?utf-8?B?Sy9YcUFUUFZLSTdjTTd3QzQ3Z3MvNVJLOGNyR3ZIWHViRTlCOHVpM2RsNFlO?=
 =?utf-8?B?WVdjM3ZWZ0RVbTZxWHZlL0sxWm1nVjQyZVF0K2oyN2dFdTI3Q24rQS9PYVVn?=
 =?utf-8?B?TGw1RExudmp4RFZ3NWZFbVVvN00zOE1yWlJ1WjI1ZUlGYTdmdkE2azhKanNV?=
 =?utf-8?B?TVZ1dkNhZFpTRWdvaDZYVVI2OHJrbWs5cDFiSUpsbTdiTFN0UkFCWVpzNUtQ?=
 =?utf-8?B?Z3E0bGJXUks1VU9vODN2ajgvL1JWMndwa3JWVC8ydWptNWxnQUhJRUprYXd3?=
 =?utf-8?B?akE1WnJiWnlDMkdoM1NPV1Fxak1keG5MQ1lzeXp1Q0doZytaRlNyOTVKcjM1?=
 =?utf-8?B?Y05PRUNqMkpWZWlUS0xqaEJzQ3duclJEVzA3NVhYV0tXSVptaElnMTZaSlkr?=
 =?utf-8?B?YjNqeHVBZDFDQ1dTRHl3M3dDWTJyQnFwVDJNaVB5N2ovWWpVSUhybVB5aTVE?=
 =?utf-8?B?RTdYN0pncWZYSUZ6NVRZSC9VRXVRemJraEVHZ1lwWG9jdHNpN1RQb3cvT1p1?=
 =?utf-8?B?NWplLytBQUowNXA1dUtvTWJHMFpiNUdWV2NTbnRFYlJwUFJKUzB1bnMzTmNo?=
 =?utf-8?B?TzlGNDVmNlpBTW5BT0xwT05ibXFIRWNiWXpsUmhkL0cxRXJ0VGFEYzNQbFBq?=
 =?utf-8?B?WDI4OXlab2hadURsT0VDTmIrbTZOS09SYVlUU1FNWTh6MjMwRzYweTVNUUU2?=
 =?utf-8?B?d0szUkpEeHY5eFF1U1dPYURZdHpGMWNlTlRFZityUVhSUWhKOG5XRXUzSmZP?=
 =?utf-8?B?cVdTN0xXTzdoZEN5Ums2ZEN3ZitPRVdHMy9hd1pmVWJRZFJncHEyM21RcjBS?=
 =?utf-8?B?bGFYTjBCcW40ZUJjaU1Vbzk4MWFranF3cUY4a3A1K2lxR1dpeHNPakVJYTZN?=
 =?utf-8?B?eTJSWnpsdXE4Mjh2eFVwZFdudk43ZTg0TDNSUi9lc0t5NUV4TW5FQnR6dlRI?=
 =?utf-8?B?aHR0Y3JnRldBZTAzVnBvejBSSzl3UUVGK0lyM09ody8wZ0Vqd2U5R294dXdt?=
 =?utf-8?B?TjREWUVjNHlMNFA0M0tPdGhxM0hmUWlQbHFaMVhrODZ0UHBXRmRQOS9odExr?=
 =?utf-8?Q?04XLeedMb+09OQ12raJJVUL+G?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8fb1834-0413-4557-4dd2-08dd1e990d60
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 12:48:06.4096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPC960Aj1KgK0h7oFj2eWgkQcPppgVzcpWHES1pTXFi/WmqKZTfzkiVNnGIy6rOp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7139
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

--------------255vZAZTU7Fn2quDOZnB1Kfy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 17.12.24 um 12:06 schrieb Wei Lin Guay:
> [SNIP]
>> Please send that out once more with me on explicit CC.
> I will resend the patch series. I was experiencing issues with my email client, which inadvertently split the series into two separate emails.

Alternatively I can also copy the code from the list archive and explain 
why that doesn't work:

+void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
+{
+    struct vfio_pci_dma_buf *priv;
+    struct vfio_pci_dma_buf *tmp;
+
+    lockdep_assert_held_write(&vdev->memory_lock);

This makes sure that the caller is holding vdev->memory_lock.

+
+    list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
+        if (!dma_buf_try_get(priv->dmabuf))

This here only works because vfio_pci_dma_buf_release() also grabs 
vdev->memory_lock and so we are protected against concurrent releases.

+            continue;
+        if (priv->revoked != revoked) {
+            dma_resv_lock(priv->dmabuf->resv, NULL);
+            priv->revoked = revoked;
+            dma_buf_move_notify(priv->dmabuf);
+            dma_resv_unlock(priv->dmabuf->resv);
+        }
+        dma_buf_put(priv->dmabuf);

The problem is now that this here might drop the last reference which in 
turn calls vfio_pci_dma_buf_release() which also tries to grab 
vdev->memory_lock and so results in a deadlock.

+    }
+}

This pattern was suggested multiple times and I had to rejected it every 
time because the whole idea is just fundamentally broken.

It's really astonishing how people always come up with the same broken 
pattern.

Regards,
Christian.

>
>> Apart from that I have to reject the adding of dma_buf_try_get(), that is clearly not something we should do.
>
> Understood. It appears that Vivek has confirmed that his v2 has resolved the issue. I will follow up with him to determine if he plans to resume his patch, and if so, I will apply my last patch on top of his updated patch series
>
> Thanks,
> Wei Lin
>> Thanks,
>> Christian.
>

--------------255vZAZTU7Fn2quDOZnB1Kfy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 17.12.24 um 12:06 schrieb Wei Lin Guay:<br>
    <blockquote type="cite" cite="mid:C369F330-5BAD-4AC6-A13C-EEABD29F2F08@meta.com">[SNIP]<span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap=""></pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Please send that out once more with me on explicit CC.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I will resend the patch series. I was experiencing issues with my email client, which inadvertently split the series into two separate emails.</pre>
    </blockquote>
    <br>
    Alternatively I can also copy the code from the list archive and
    explain why that doesn't work:<br>
    <br>
    +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool
    revoked)<br>
    +{<br>
    +&nbsp;&nbsp;&nbsp; struct vfio_pci_dma_buf *priv;<br>
    +&nbsp;&nbsp;&nbsp; struct vfio_pci_dma_buf *tmp;<br>
    +<br>
    +&nbsp;&nbsp;&nbsp; lockdep_assert_held_write(&amp;vdev-&gt;memory_lock);<br>
    <br>
    This makes sure that the caller is holding vdev-&gt;memory_lock.<br>
    <br>
    +<br>
    +&nbsp;&nbsp;&nbsp; list_for_each_entry_safe(priv, tmp, &amp;vdev-&gt;dmabufs,
    dmabufs_elm) {<br>
    +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if (!dma_buf_try_get(priv-&gt;dmabuf))<br>
    <br>
    This here only works because vfio_pci_dma_buf_release() also grabs
    vdev-&gt;memory_lock and so we are protected against concurrent
    releases.<br>
    <br>
    +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; continue;<br>
    +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if (priv-&gt;revoked != revoked) {<br>
    +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; dma_resv_lock(priv-&gt;dmabuf-&gt;resv, NULL);<br>
    +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; priv-&gt;revoked = revoked;<br>
    +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; dma_buf_move_notify(priv-&gt;dmabuf);<br>
    +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; dma_resv_unlock(priv-&gt;dmabuf-&gt;resv);<br>
    +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }<br>
    +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; dma_buf_put(priv-&gt;dmabuf);<br>
    <br>
    The problem is now that this here might drop the last reference
    which in turn calls vfio_pci_dma_buf_release() which also tries to
    grab vdev-&gt;memory_lock and so results in a deadlock.<br>
    <br>
    +&nbsp;&nbsp;&nbsp; }<br>
    +}<br>
    <br>
    This pattern was suggested multiple times and I had to rejected it
    every time because the whole idea is just fundamentally broken.<br>
    <br>
    It's really astonishing how people always come up with the same
    broken pattern.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:C369F330-5BAD-4AC6-A13C-EEABD29F2F08@meta.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Apart from that I have to reject the adding of dma_buf_try_get(), that is clearly not something we should do.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

Understood. It appears that Vivek has confirmed that his v2 has resolved the issue. I will follow up with him to determine if he plans to resume his patch, and if so, I will apply my last patch on top of his updated patch series 

Thanks,
Wei Lin
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Thanks,
Christian.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------255vZAZTU7Fn2quDOZnB1Kfy--
