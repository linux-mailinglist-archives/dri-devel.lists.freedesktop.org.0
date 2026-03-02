Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE8yLgjRpWm1GwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 19:03:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9571DE307
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 19:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022F710E571;
	Mon,  2 Mar 2026 18:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N3A2cIYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AC610E571;
 Mon,  2 Mar 2026 18:03:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDHUBOKiXvE8NhXK/BFTU4//ACEDl3qSfWBuhlFdsnLi4/nKD41tXwdPhVSSdobRRj/NEmrXQS69vo3ZGyQ9JF2zaqxtcPz548u8vhG0rnpEi8ZLp4jv/OmKe3WV9EiZ7SqjgADb93wAZ18/P29bgocGS0o+r8nXf3QDvklZLQ6Cgaurz8D4d3+H7mVy9GzYjg6ad595IGjZyDdElvSa4JIyTFuKcJCnk5o7J9Ldm30rMkTQMUx5UapCZYOncsUpuxJ8vHrXKPFBm65ULqOSLh0IjJcRwDvxb7CjH98GGWL64osn6ikukCICuemEbys7g/+EQy+nE24bnalAHJK+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A57p3MUVaLhWtEF//GJa7sO6cB4kd4/lFmh0MyBBNlQ=;
 b=oUcSVk++8+v/EN0lboG1YJVRbSrGnb7RkxNOj8pVafuOnzWqRSiTc+rOI9Mx4RYdcgS/Dubi78okbefksJ8UON18sEd2f9dwGHV/6GzPGBSveFVTsRlwXWpcFt7L2VCNpZZ1Se1yM0KoRV42/R7m38IRGjuzhKm0r8HbunvQDSRfDRC4UwEAWMkhwtj73d+bY1me4Q/UbigpYjAnQK1W1qVus7MqNzERCYzdIdbp36Hr4ZGAtsenFsTgxnTX4BIT4M+4HBbLPnrXzrTut8mRs9nujXiQ9MHnG4MLeBtbaeVE7O50CImRa+Os04qGlWfnZXAvw4kfR8y/Y0dT4ri3Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A57p3MUVaLhWtEF//GJa7sO6cB4kd4/lFmh0MyBBNlQ=;
 b=N3A2cIYZRoCaBuBooO/VA4jvB0qabdtnwm171RyJvNU4XS8aSvSyYJKv5Mbz5eUuUn1QQHUJptS4wRY3Qs0bi9OFlatsdey+UEo0e7lvGZMDuHqq9+n2KTnFj9lstXua65UNuUBd99bm2aDD2m1/03jktqZ1rjbJVOogs/WG4PKiy8SxXvgNekq68jIp/mI6bW+I2inucDGEhmBVQDdphrDDZ+LX9F4FlnZKolH9dk1OXpDfv4iX9Jg1oUAW/XOrTIXUUBAT03Dp7iOuR2+b/9dyjupfd5mu0GdLaUgC0jzaprxda49ewf6OyyTA5B0QQDBdIn4dzagdQBKOtPYAUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.21; Mon, 2 Mar 2026 18:03:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 18:03:39 +0000
Message-ID: <4e27719d-85d3-4bd7-b458-5d6d0a3063ba@nvidia.com>
Date: Mon, 2 Mar 2026 10:03:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>,
 Gary Guo <gary@garyguo.net>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com>
 <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
 <DGSAOTM95PZ4.2JGBBMNRSJSNN@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGSAOTM95PZ4.2JGBBMNRSJSNN@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd3c5bb-31ac-4bc2-eb65-08de78860888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: azGmOWwZ83u1nV1F5uezxWKJHa0RHqYqKbu6ygPYnLAHzQrrqC4X4P2d4Gl/SaGkpOJIjzdYmBxqOEAA25y/P6elPrsWB5mL938xm6X2GwYw/mCuQpMO61Ke+civnsLgkpoOp55Gra3RpH7ulsM9hscl70E/x3hLjw4nNaPntH7ClITEOu2RLy+ZfLQfWMGkY0yHfcv1N36j9qAeLR1cEwIhIy796u9xnElyu+OC7udP9Bsmw0fjO2/Jje/rqDUN9OUhzAklRwvgZgxjZldUDykFRRROXm4idpWLyEGtMhlmVFOjdAGVPLvoW5dvG2jMmrmcRriw8rbG3f34XdwqLJLJBVncgdx74eXTdAsjtjWjjE6rKZhf13RKguMAvsYFDRNVF5Hsd+J5eKzD3ftwoJYqclgbS+46aSGlWfZTDLBmiDNntB/pAwaE/LpG1ZH1aG38THVN8LgmesaxciSMYTWThmEmktCy+alZq1GTkdKQbE3y/UOQEKLcraeauDcPY6Av9tXZzB52CuxruisxFgs44TTr4v3hSOKM27fudQ8KcOrHcuvNEZo7W2pk9wa/G7BakUoZHZgyucg3kMDpEWGdyvmXArYKk1LI4kyDKn7ZEfcqSd2idgd6+k6jyIuOOUFncKWoxT/miG6cX7m1cd+x3bvcScFDoT1utf/M2jqWUBoMp3dE90oG8CiqB2nQOHalVoeOeG8H6CsEf8oyp+/8AB6eW5S/9wOG35wFWjE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmZLVnB2eFVUMGp5ZlF5czdCREVJK0E2MU1EMC9Zc0F0OHB6dXB3Vy95MEpK?=
 =?utf-8?B?UFFQV0JZNk9wMTlxb08rVUt1anJGL1pES0lJRmN3UDd3eVlGdy9MZm1oeVZT?=
 =?utf-8?B?RlROMFVibEVINEFVdW5FcGFZRjhPNjlDTUt0MTNRSS9qbTlleWlFZ1VtYlRQ?=
 =?utf-8?B?WVdYMDlNSlNUTFd6OTN1OUlhTGh5ZUJmNGdvNm51bDVPZTl6R20wOWRzeGZl?=
 =?utf-8?B?UnN3Qml0TUtHdzM3Tk5LY01aSHZCUmxDc01PcFFIWHhtY1VzbXpGa1A1bWtT?=
 =?utf-8?B?dnBmcnFlSVBWdkpQV0MxdTFkbGJyUmVkVWFpNmxxWm1lbnB2MEx6OFpaa1JE?=
 =?utf-8?B?akRUZUhLb2N0NFBJalV3cnpSRmtackVEN1VHazllZXlBa1VTRVZMekhDVDBH?=
 =?utf-8?B?cmVnZDBVd1E2QlYxODdXbFVPRTI4K3Y4N3praForWVBvS09zOWwyV0k4UDBC?=
 =?utf-8?B?QzBoZmVyQTQwNFZFbWsvdXlpeUUzV3hDR2ppUUt6WFVvdXR3a0hIMnFaTStE?=
 =?utf-8?B?eXkxdUdRU1FyOXpNWUh1RktqbHNCa1R0QzNUelpJZEFya0dIY0Yyekp2RWJE?=
 =?utf-8?B?dC9ROXRVdUhrQU5ZYlVVczJjUEpnUm93N2lpNGJsQ0RlVVZIVmhqVkRubGZW?=
 =?utf-8?B?aGRHSk9NMGF2WHlzRGMyczhkeDBqdElLWTVoNjRFRUtwRXBXVSsrc0pIM2pP?=
 =?utf-8?B?am1DTFJzSU01NUYyVS9SeTVocVlGajdyeGxwelk0Yk8xVU9YdE42TVNISEl3?=
 =?utf-8?B?RzdsZ2R5bnJOWHJiUG5WWEFMZDJZaXk0ZVVTL1E5Q0dpZmJiVWNCUGVXS2l6?=
 =?utf-8?B?Y0lneXBtanhoYVo0RThqMHFDK0tpakRWVlhkMlg2RnU1YnlsZ2Mwd2k4bytn?=
 =?utf-8?B?Y3liVzdDRVZxcFB3aEQ4OUtxd3p2a05EZEl6eVZVeFZFM2d0K0N3VkhPUERN?=
 =?utf-8?B?NENueDRqTk5nZ0REbVlHMk1RcUVYZzFKcm8xZkpHMDVzVEtEOUhvV1c0bCtV?=
 =?utf-8?B?YzErd2RJYTF1MFpMYkxwSEdDM2dWT0wreG9OVTlWTWNYNURRUTg4NEdlbGQ3?=
 =?utf-8?B?M0dMd3R6S1RNMVBldE5MeTRzdnJwK1JzWE1vOSs2dzhJcXh2c1lNdmhTR0po?=
 =?utf-8?B?WDdpQk11Y3VydHlQRmowNWdLanhHWklkZGJlYStVV1BSV0tmWGdmT0pSYjJR?=
 =?utf-8?B?YWNlK05xYVJUL3pqNlFzY2NaRWZ6VloyWVorVWgyOW5icWNuOHgycU1zWk02?=
 =?utf-8?B?T3JMR2l3UklrNEtlaGtLalo1MWFIL2xHbzUxWXFUNUdXR3ZrajQvbEZSbkIr?=
 =?utf-8?B?WGwwOHJKZUFHUFNJRm9veHZSV3FpU0F0dnlQR0ljeGJrOGpLWmFNUUxNNVVY?=
 =?utf-8?B?SlIvb2s4aW9USXB6aTFHNldMSWdzSXNHRWcwclJYNzVyOTZvUVBQR0FjL0Jp?=
 =?utf-8?B?OUJZTk43TFgxVjZTNEVCSzJPdVFmYWNLZEFQV0V2TXFtalBMQUVVSnhJaWtE?=
 =?utf-8?B?aitqbUl0OHZDSWtuSm5Sd1V4NzFLTXIwZ3hIN0RaaTdlUmFGSWhLdEk3aG9L?=
 =?utf-8?B?WWlZa2V1ZExqNHZjZVFCVU1uWGdlS3UxT21JZTU2TkFPNjY0U0U2NW40c0pk?=
 =?utf-8?B?R1lRKzJTdFloVkhxUjhrU3BpUUxZaVhzNTROaFRJUXV5aUdBMnY0eEY0TzQ5?=
 =?utf-8?B?bjRiNlV5SzhkaGVXeE1PVkVVMEVRSVQrWk9Od0FVR204aTgwZU1aYnkraEhx?=
 =?utf-8?B?dFExZVZER1BJb0FFVkZBeG02RVNGaXhQZXNLS1ZqRUxFUGxGdW1Kay9lL293?=
 =?utf-8?B?V1VUWGIzQTRINzNCZ1NmcW1HMlhNUXFmeXhnRzFKSVNrT3VRdE56dHZudGFm?=
 =?utf-8?B?WU5WU3IzVU1QMTc4Z3A5Z1hCNitHMmlCV1BDb2ZMTEMwR0QxRTlOd3RHNk10?=
 =?utf-8?B?WEtqV29hd3dyQXZLMDJ0TW0rb2cvMHZVMEdqVjNhZGI4SnBRb3BucFJMRmtW?=
 =?utf-8?B?NU52ZGN2WE5SbG9PZ3lMem92RkJNRzVmVkNqRitJZlVCT00wVWFEU0VMNUM0?=
 =?utf-8?B?YnZYaE8xWHJQMGlTaEVEbHVBM211Um5xNVZnMlpTUVJTQkFIZkt6aGFPNURz?=
 =?utf-8?B?R2FOQUtKQzJUZTByNGpoaUpTeHpvT3dRVWFqOGtnNVBxODNJVkFlV25hdm1X?=
 =?utf-8?B?NVV4TmM0RnlGajllekRqRHBvNEFlaGJuQ2hiZmlQYjRicHZnSUJxbHhiT2Fj?=
 =?utf-8?B?VnpjekNqWHlHNWVJNXZrakFZSUNVelNVc0tQcU1xVWJGVWRpVkNOM2ZhUWQy?=
 =?utf-8?B?Mldjdno3UG5Zd1NGNHEvcytpc1N0MUFrcTIvdmo0QjNjYnU4ajNvN2tSZG9s?=
 =?utf-8?Q?sMnD7Ztg0xPjd9j4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd3c5bb-31ac-4bc2-eb65-08de78860888
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 18:03:39.9049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qVyqlpoFmXLpF+9jXM/FwZukoGIj0ATQdmvKsHDkJgVrFUgzon5i5UOOSpX7UirGz2Z/Kx2QHa8N6bDU1TPyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748
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
X-Rspamd-Queue-Id: 0F9571DE307
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
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[nvidia.com,google.com,gmail.com,ffwll.ch,kernel.org,garyguo.net,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/2/26 4:28 AM, Danilo Krummrich wrote:
> On Sat Feb 28, 2026 at 7:11 AM CET, John Hubbard wrote:
>> The sync/async naming that GSP RM uses is a little bit "off". I
>> spent some time discussing it with them, and the problem is that
>> sync/async is a concept that is somewhat independent of whether
>> a reply is expected. Usually, sync means a blocking wait for a
>> response, which is not necessarily required in all case with
>> GSP RM calls.
>>
>> The naming would be better here if it reflected simply that
>> a response is expected, or not. I don't have great names for
>> that, but "fire and forget" works well for what we have so
>> far called "async". So we could do create a convention in which
>> no annotation means that the API has a response that will come
>> back, and some abbreviated for of "fire and forget" or "one way"
>> added to the function name would mean that no response is
>> expected.
> 
> I think the relevant information for the caller is whether the call is blocking
> or non-blocking; i.e. do we have cases where we want to block, but discard the
> reply, or expect a reply but don't want to wait for it?
> 
> So, unless there is additional complexity I'm not aware of, I feel like
> send_command() and send_command_no_wait() should be sufficient.

That's my favorite so far. It's unencumbered by any assumptions about
behavior, and unambiguous about what it does, and shorter names too.

> 
> (Maybe send_command_wait() if we want to be a bit more explicit.)
> 
> As for the specific commands, we could have traits to control whether blocking
> or non-blocking submissions are allowed for them in the first place, i.e. this
> gives us some control about whether a reply is allowed to be discarded through a
> _no_wait() submission etc.

thanks,
-- 
John Hubbard

