Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBz0AACXn2k9cwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 01:42:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717A219F86D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 01:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B830D10E84E;
	Thu, 26 Feb 2026 00:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aXi9vepr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010012.outbound.protection.outlook.com [52.101.61.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6371D10E84E;
 Thu, 26 Feb 2026 00:42:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lS98dG7TMc4eVgUgb9iBG4U2pxc+XJTa7fQA5VPFQkq0ZDDfFz+FLYC3daNLc6tJpQwWhNyXQrj1wrD5zNX5JOCiNSsPMUTTWkjYvQlw5iPc/8FsuLgLDQYRZXsU+CfkR7cGk7zHzF367pA34TVJx6Q71d+tjC0/2hKR4UAA3gA3X8dygVfIVzARYiq08jrffY2coxo63jHuVs5K9bDiBPRpef4veTIdUozbBHGK3L2rfID7MeuwNPOUrWfKWFlRzWWD85GtMjXp8gfPE7jbwOtWPA9/GZsr++qjyqOQVJTgcmsBUtrNua4wgItmy3hxR4yP6Uzw3ifKmxsAfMGUtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhTrZ2BfPwRmoZOdk2UAQjBxFjyjjGfGB3VuEbG9irc=;
 b=pKZPgbOmVHXCJ7Z7H4YM1uZR8N3SWDA+9lpT9RBWr/XLPrGgX2P1ET4iiKRkKz2LL6+tw+evPGyRv/FTtVKfntKaUobdxeO/d7cBkCfZuQZs5qjKr29DueHVu9rHA+C43pv0uRCwWCf/yTTk2zgPFrAmZ840YnhT4CpKChcSsBzhmEnAbQJ/+5hyLvgIbDU9GY0tB77RzjK8Ge0Xlq1la3xQu9ltg89eXPvLF8rCXsaOJJUv4J8Anfbq6zQ4mtiT/lyHahXvWSQcxAwBLEDeRbKd5/e5o4HdDucHpcsZErk27l5R9tBCQqI7xc7f0UHGY8J0eOJEWVwsIHGj6rMrkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhTrZ2BfPwRmoZOdk2UAQjBxFjyjjGfGB3VuEbG9irc=;
 b=aXi9vepr+NcE1ttDBh1Yt8V/NKzrV/PL+8FKreJMyit2CIFqkn76Klt3c2JfJiu2dFOPhY0IjOKxP3RpQ47CLqW2Ithp302rTTyfxjJgjTNqjIgeYGuBpsQtn2YPhJeGfTzYr+o7amOlrurA2sz0kbZ1yJ/GQ/SCawCEl4xCzUgNG8RNzSsnbZU5OPlPWr2273rqIr9PFHoHDDTIaByE0NZJ74DuP9PaGgO8PXOztY6JBtuo52ckSvBbudaX4abpgnah2MdLQc2rJziSomr8gDFblpy6YRhvSNlGOqoLe9PGETAZDD0Y2FqNjSNT4ca9jllgoM6kA8FPwcbRrWi40A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CY8PR12MB7100.namprd12.prod.outlook.com (2603:10b6:930:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Thu, 26 Feb
 2026 00:42:31 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 00:42:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 09:42:28 +0900
Message-Id: <DGOH5XQBYYWZ.3105N2UXEHY4X@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260225-cmdq-locking-v1-0-bbf6b4156706@nvidia.com>
 <20260225-cmdq-locking-v1-2-bbf6b4156706@nvidia.com>
 <20260225214207.078e3186@inno-dell>
In-Reply-To: <20260225214207.078e3186@inno-dell>
X-ClientProxiedBy: TY4P286CA0053.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::18) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CY8PR12MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: b7483568-5791-451d-7a5b-08de74cfecf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 6+PbZBgvQVIJOIs7d7yqBEP8dcM+9urhXhBN4U776YWqC6XBWpQX6KM/VNl4ckJ+i7lmY+6xOKw18KmlZuWkYwX9BwDOZNtF68IK0loyeLEFt8CJmLLbjxYfOU4Bu4cHZX9MrlgnuJQSNZMUi7bLdw7FLvOVk75WcwsDqGI/dSmlsftD7bUObXPUFwKQ+Ld4KrOUwt2wmuIJBUBDHYkchHt6f14h4Q9UJfuIJ7FVAeSHUPbuMMUwAblp2RlFiG9t9qd579GMuW2HT7kRVr2VSRb/3lnOTHCcdviykXkq6DIagq+BVK+2UVMF1vixPR3ceRsLBq5EPHT3zzw8BI/Q48Z5E9lSPo3wLSLJaFOXRsDwUhnWVTZO5nPX1J2kwgcbvQtpQxGsW3SuCzek8X7miapanT0Wi6O+CYfDO9Jvu81xY7nWLlCquvNj2NhPEwYrdmRNRMoiokUFO0saUFI842eB34XUn2/lEnA8uIad0voGttNTvvC+QdbEnxUf98osufen65rgyzD7uxuvrH92+OOX0h/CYLRRAOGrnJfbB5EKq8Qcob6plMjQw4XblEY45Za2IKwxR2aBmLSfL46NCir6UOnPpEQX4G9QE1KRDu62USfLa35iM+Yl38m+teiv89rmHGRqXJq2/92t/7cvA3dqL8ZyXSakJAWpXJCpclcPF+6OovwT4wsQaLuCRq9XaBCsHHpn70W2M7/Tyq4FnysV0ijk2mGBHD5CGE0NBOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2o5L2hLaXZZV1pyeENBMFZtTjZaakdlYWsrZnJaYTlnTnJkcHpBQjZZczlv?=
 =?utf-8?B?bTdPdjNZSVVIS09uYjNyVUlDSno4T1U0N2FuTUdzakV5bnZPbXl5MXZYUHNP?=
 =?utf-8?B?R1RqSGRveXI4T3ZWbEtkS2dZZE4xTHdkSmg0dWxrR2ZaNWJCWWYyUFduMTRN?=
 =?utf-8?B?OVhDaDUwR1Y4TjM0ZnhEK21lTHp0ZHhvSHYrMFNLUDhKR1lxUXRYdm9ZeDhW?=
 =?utf-8?B?S2lxSXRhQk1tRDVTNnNaQ3BaZW1kUmtkd2MxOVVMWFZuYVZSaTA5b3JseFM5?=
 =?utf-8?B?V0ZGQkttNHZ6a05tV3R1ODBhZTFQVkEzS3dKOHJLcCsvdUdaNUMyOEdkOFI0?=
 =?utf-8?B?YXlOWDRaVk10aXgrR25peml5aXpOb3hIQjJ1NWRTYWszaExtK0h6V1RJb0hW?=
 =?utf-8?B?UjZVQjhXcnVkc1Z3ZnR2Y0lpc0tOaDV5NlYxUndsTHE1cFUrckN3Q3RORU82?=
 =?utf-8?B?NW9FZlgySWdoQSthTFNka2k2THYzQXFrdjVYZGlZYkkrYzVGUGVsWUxYcU8x?=
 =?utf-8?B?N2NkU2pPb3dvWEdkeFdVQzdOSmlwNFovejhUVlkrc2RSYnhKM2tjTDM3eitK?=
 =?utf-8?B?ZUdBK25nclYxcmJJY1RQY3E0QTFJdm9XbldlVzFFY0NTbzhMN3V4dnltN3ZE?=
 =?utf-8?B?Qk1JZk9kSDFrajlzTVpVd0RtM21LQlJrNDRmb3FBMlZNUXZJSmF5L1R4UmFM?=
 =?utf-8?B?cW1NR29Bclc2SnJkNDRzamRiSG5aSnhKWVJWeU1Yc1RlbEpmb2pLTzFuOStI?=
 =?utf-8?B?dEc1THBTTUMrQmFhVk1RMnl3b2ptaVpyNjlUUDAvSmZLN24vOXoxMm9DRkg4?=
 =?utf-8?B?YVB0ZWtLR3NlY2pVNzNDZFM2NDUrM2FHRkUxVmp1VUtCS0Y0R3lueUxwclFB?=
 =?utf-8?B?SGVHK3h2dElXYmtwKzRHR2txQWRaZnhPUVF6TjVGZG1tMGxHdG0rNHhDdEw4?=
 =?utf-8?B?amFMbTAyampkd1FNWmUwU2c4RUxwcGZLRjNxUEJRZE9GMFRpU2U0RkhoczMy?=
 =?utf-8?B?dkhoaVQ1Nm9ieVRhK0Vna2NIdHdiNmo3QXBVV21uRXhCUUlmUHJidVpCNUVW?=
 =?utf-8?B?WW1nL0g0UTJwekEzRVp4Q1RpUThnSndPUzUvcnBRamt2am1ZYzdTSmd1YW45?=
 =?utf-8?B?ZGY5clhRbGpUbnE5SXYzd3U0UU5Edks5Sjk2RkRsNGJIMnpKbFBCMklRbllo?=
 =?utf-8?B?cHpBQVhoMEhpSFY5THNnYWsyTnZ6cld4cmRxUnRWTThpYWVzUm94ckVYdzl4?=
 =?utf-8?B?amtybWxxZVp4VHovc0tGcDFaZjg3VnpucitJUis1V3NDQTZqRXBsaHBkTGM3?=
 =?utf-8?B?VTlKb2lyT3NwUmV5U0JpNHhiaDhKbExXZUF3OVdHaVBtSmExUTRhMDZPSXJL?=
 =?utf-8?B?RXFOVzl6WStnN1E2VndEZmM4T04xVTBEMFJNcWhPcjBsUFpvYTZJcmpML2Y4?=
 =?utf-8?B?V0lJOE85ZlQxWG9Bb2twdzR5bzFEVzdnVThRSjJTYTg3cEVLR0Zpek9vc211?=
 =?utf-8?B?RTdERWFBa3JkOGRnc1Z1c01hMElSdmtiR3pKRVVhay9ERURYeGdXbnRPLzVi?=
 =?utf-8?B?dm14ckYyV05DZTU2YVJIQmM3Ymx3ZFlrcjRBN0MwamJJTXZGcVhBamVZMnA2?=
 =?utf-8?B?dzNCUmh0UnJDbXl6MDhxUWxTbFU5YnNsOW12cEduaTFDTm1nNXVpSTVCRGNi?=
 =?utf-8?B?QlNNOHFSZXNxcVNTVy9KbXBkeDErNWRqSGQrSkltNlFBajVnQ2ZtbHYrS0d0?=
 =?utf-8?B?MFU5ZnhYRzh1MkFkdzlNTFcxQmZJMEMzRHFVRW9GS2o3bXdYeFF2VHZRL095?=
 =?utf-8?B?OFQ2YnpzZndyQms4MWRzaGFxT0x0YTVQalJsOEV4dWlzK2NVNmdUb1JNcm1i?=
 =?utf-8?B?a2FaS29LRElobkM3SS9SbTlyTHNSZUpyQWVkaHdVRGk3aXhGSWZjYktCWkU3?=
 =?utf-8?B?MCtDOUVKdjJpR0ZRVWZNVzd4WXJNRkp2MitpU2wwVkkzTDdEYVFmSE4xViti?=
 =?utf-8?B?T013dHdrdkZZNThVelNhMGZMUVQ5TGRXL2p0L1dJREdsVzlkQVQ2dVEzSzJO?=
 =?utf-8?B?RkhFYUdaeVl3WnhZQXI0MG1TYXFuOTJyQmJkd3NXKzhlN3R1ajVuc3lSVWpT?=
 =?utf-8?B?b1h3RU5VdEZwblJkeVN1NTFXbXN6VVhqN2JLcXhGUnQ1VnRrZE96cFExZXBS?=
 =?utf-8?B?UVVseUtKU0FmcXgvWmZlVkd1cWdpVHFtbUhKemVuODB1MnBaVktKNTZFZVRx?=
 =?utf-8?B?QkUwZG8zYzUzdHBFRzFDV2xhS0VEb2R3K2VtNVdzR1oxenNWeTVFdW81N0V2?=
 =?utf-8?B?OVp2SXdCWjNzR3N2ckl2bE9XWWVaMTF2dkMwRjloSUh5QW16UXQvTDI4Z2tL?=
 =?utf-8?Q?bZHSj62xmjYkWdrQpVr+DQ5J+97cei6fTEdWbTJ6iOdDK?=
X-MS-Exchange-AntiSpam-MessageData-1: KCIMr25ik+JBtg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7483568-5791-451d-7a5b-08de74cfecf6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 00:42:31.7348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TsVuE29TFviiiaeJhkpZR5KO8SLB1oyhoBmcI5xUrv3hRVWj76B3k/2ZgvC2fyFAzzOgBMICu4b+AmxRQVuOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7100
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 717A219F86D
X-Rspamd-Action: no action

On Thu Feb 26, 2026 at 4:42 AM JST, Zhi Wang wrote:
> On Wed, 25 Feb 2026 22:41:49 +0900
> Eliot Courtney <ecourtney@nvidia.com> wrote:
>
>> Add sync and async command queue API and the type infrastructure to
>> know what reply is expected from each `CommandToGsp`.
>>=20
>
> snip
>
>> +        loop {
>> +            match self.receive_msg::<M::Reply>(Delta::from_secs(10))
>
> It turns out here the timeout is changed to 10s from 5s which was used
> in other places. Any problem you encountered during the debugging?

No issues, but it /looked/ to me like the particular values didn't
really matter so it would be fine and simpler to have a uniform 10
second timeout for now. Please LMK if you know this is wrong and the
5 second value is important and specifically chosen.

I think it's also fine to include the timeout as a parameter and would
also fit the convention with receive_msg.

Thanks for the review~
