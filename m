Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKL/A8e4rmlIIQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 13:10:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA70238831
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 13:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C466910E035;
	Mon,  9 Mar 2026 12:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="wWBNT/w0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022137.outbound.protection.outlook.com [52.101.101.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBEF10E035;
 Mon,  9 Mar 2026 12:10:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8BGNRuZte+MUU4e8AJRrZ0vb9z3LId62mhgh+2xMcSUri2dNL7QPx3iCOj1YLaPeLYTlgIIZO+vEudPouz/2ftyylqKq4OkIb+rCMQj3s9SLDwwoYkbzyTWpEJvD9i9nfo4Ymq4a/8KFy0+tugICP7g4FI0O2yvV+JNKb2TEKeYDIZ6yaFtGIv0Faa1/q3uhHy+SnrnNu4n/ylTaSiC+MfhRyu2OTi8SPZoSvCWNLfwUw00ZUNXRzXF4PSoXBJDFjzo0+eDXXZLiGv7USA1jjjhBSAneI8aD1EXrGaCR9EXHwB3/qnpfojkqtLkgPR5NyEFo6UbSW/ZxAxoCN2anQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aykGupV8B0tXDpoZp+HKChd9qRRLdRpnGt+Dg82SPlI=;
 b=APjmKB4Yv4Z4XY7r7KW62Dgr3D7yp/pNP/A+ACo16KVpWBhlxaQubUSh/VX8FqzKXF1mcW5Ttq6pXvfFUGyB6niEtvPwZ77GekgOzBuBNuWCTWLWUzPinhfKZH9G36d7U13QOsAzoFMkI6pBC2y+ZbYrVH+EMgxazX1oip3PidqO9Ap/QCQ5/VVdDOoXhNwfZQtd+TuU2/CvvpCkK7nMJomSfNwK4JkMurZ2PURVHVUDxgXSqua5sl0tHIk/pTmTZtw5f/vAGc5sZk7EH/DSHZi8B69xBKa1Zcume9iIeAONAZG2rxUJJYZVVzt+Mo8BxayMPyK2WEFdzjih3Q9rzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aykGupV8B0tXDpoZp+HKChd9qRRLdRpnGt+Dg82SPlI=;
 b=wWBNT/w0iqmPS48FP+0XyOQNxUF3QdHjZh738XVJpoVL6GHIMklucLvYTVAIh44a+gkgrXErjexAduiL6pOdIyLsVLVOhgSVf+98LjfkNcDrgPOqgKSfz5AbuzqEcCxtxe14T+s3r0p4vDvvM8z8Gqw01kddq0R+kfm3QO3fcUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6910.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1fa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 12:10:37 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 12:10:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 12:10:36 +0000
Message-Id: <DGY8OSWDD5XN.2S6NSBDDDJX4@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 09/12] gpu: nova-core: firmware: fix and explain v2
 header offsets computations
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <20260306-turing_prep-v11-9-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-9-8f0042c5d026@nvidia.com>
X-ClientProxiedBy: LO4P265CA0144.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: f931b2c8-4df1-4642-391c-08de7dd4df5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: RLUWmsjDu15MnWVHpvP/j/Otut5U4X5L4u5w2IFWRQ8VZINcU2uNUGlOOYa2cCfiUFC3Vwrk/vttya2avmh1aOBv399kap99o9Z697UPzGaLUvsyB7TJGwyud4mIdOeWOUMeUreDkZ8lXPzGpUs9hS6kUjmq7ohbbbtV9htAVUpcqKJdr5le/HMJakUmRbWcu7kQJkYpecmoWKmQ9U4cHu7fzrsAUY/6Gel+FXriKJ4DAOJf9PWlPK0tT0+51cyH5+wbeRQ9dMUmVYEHNQDcuZhEWMdGSLctAQQTuB0TvUZcqx4DzxjBIFATCgO+kwKqQSM8AFIjKzGcAORfx84b8kmZ33IkwA8i0IuBTVOkJKoTldLL+0j0acsKiMaLOgP4qkhorTDqb2Nbhzz0N30xEGSo2El7KVQzoF94r7jELzhVgFs7TxP1t649BxHQcr+sPmfnMoaTO7H0pckJ2xxwI4ZhuulH0d9Ti9xMkpqtGiAzbIJKSDvvM5pu/ATydunwUOY3KcD9k7Q7NH3r2n0uR17bOPYFOkwo+lDIQAPrsoQca6N9Xknkxl/APgtGasGMeclgrC8Dm9g3R/7yH95ALs72/sz+HHOiqm7ceWy8KAjdriWhW0iEWYfHnKLaJ9sHusPVZzZ0e/ZJlyYFNCfirG0s3I+XsMfc/3d0NB0aEmugZwdQRK/QaSCtB+PI+dc+QeTufsCQFQ13PcPNvC59YRb8141UDRibgI7vIINe0Xs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1NFRG5oZGI5VlZ5RVZZMU1SbWlieDdwaVU2a0ZmYjg1bmxWWmFrVldlL3B1?=
 =?utf-8?B?YnRpdVlRNHgrU0pNVkY3TkQ1UUx2bFJIWll3dDg4eEpVK3ZBVk91VkZ3d044?=
 =?utf-8?B?ckpFdGt0WTBuK3JiK2xVUGdaT2I5UXMwNUJWSTB2TnAxUWlRS2czUXZqMGFR?=
 =?utf-8?B?YWwwY1plM082RnRIL0RIVUp1TmlnMGN6M2U0QTROdTJlWjFuZlZPSHFBcjJ4?=
 =?utf-8?B?a1NEamlPYlZDekpOUkxpa3NnNjlMVUFLM2NQc3VZQ0hKVHJ2SEd0RlFNSWU4?=
 =?utf-8?B?OCtOb3ZUNDMzMGhzb2x2QmRlVTN3UHV1aWpZSkZlSXFBYlBTd01QbUN3bSs5?=
 =?utf-8?B?YXpPckN5NWo5eVVLQ2pFS3ZDMExFL1RZRTV1eklIKzZ1VllnelVmNmo1K0pw?=
 =?utf-8?B?SEhpYWJlYnY4VDRpM3VJdHVoMzBUcTdhUDBjTGU5eDBIWWI1dW45TDkyUDhT?=
 =?utf-8?B?cW0zcnA1a0hVSXRUdjNHV0ViTm1jRW1vdHpGUStMUkxBcXM4UnZkby93aFMx?=
 =?utf-8?B?ekY2QTlxYzNUUzRITmpmN3NoZXgzb2o5TXpnS3EwUTNCVnpwV2NhRjg4VENQ?=
 =?utf-8?B?Mk5wakRoNW1UYUY0dTdxWDNjRkRGaTAyMTZ2NzExSEp3NDlKMXc1ajdaaUty?=
 =?utf-8?B?azRUanZJUDlnTHdySmNKQndpS3pNMXZCbW9RK1laWnJIcVM3bDRjSFArdktD?=
 =?utf-8?B?RHNuYWdMVzU2emZIV2lVTGdhcUl1Uk10VGxYMXlwVmg1dDM1YVBMYWl2cWNk?=
 =?utf-8?B?VFBwNEljZW9zSWowZ0J5Snk5WmI2V21OMWtMelJsbnRRZVBHOXVLWVpleVE3?=
 =?utf-8?B?OXdkT3ZnT05EUk1DYWQyclJoR1JvVDI0UEVGSGs4cGExMEJaS2R5R1J2bUxv?=
 =?utf-8?B?OWJSUEloTGVOQnNMdUVtMEp6OTZVODVydE9CSUFTYWt2amkxaFF4YUo3YW9S?=
 =?utf-8?B?NXhPSWl2Y1J6cnBUTHFaM3hBTVJSekZHTC9Mbi83R1FLZkhCRGgwQXJnY1ds?=
 =?utf-8?B?YWdTQTliL1o1UlEzeHNvV2EzT0VZWXdhUktobTF0c1hkZllVQ3NReVEzRi9t?=
 =?utf-8?B?dkZxMUZNZi8yazR0azQvbjl1bTQ3V2RQZTBJSnRkUlBlUWNPZWh4QnNJU1NH?=
 =?utf-8?B?endOb055WVNFRUM5TysyUXAxbXJXbmJRVVhCY3dXTTc2THp2V0Vqa0F4MElF?=
 =?utf-8?B?TTFkN2VmMmIrTFZZWWZMVzJGQkZUbXo3WWw4Mmc2djIxbFZ4dEZONXU3b0hP?=
 =?utf-8?B?a0dKTzNlUi9WU21ORDlRZkVld0JkK3dDL0t6emtSVVVDUmFMeWtraXl2eUhs?=
 =?utf-8?B?bWt0WTVSZzYwSnJRZnZPNUpjaSs3ano0RjRBR1FxRTJPSUk0cUN3aENkSTFw?=
 =?utf-8?B?NWVXbllFQ2lqak1CK2ZWZURMS0FJNXl4ZWM5SmlaR0YyVktWMFpSQ2VEMnBB?=
 =?utf-8?B?TTNGWC90cVltRnBTVWNrMlQwQ0dueU1uSzFzMUUyVE5JdmxENEc5MXlVNjIv?=
 =?utf-8?B?a2N1c2JIdFhHazN3TkVKcEdNZFdqWGhWSWJKdkZLVHdqZFlWSjk3OXl4Z1lu?=
 =?utf-8?B?cXV2dHhuUUJQbWNBbFRMZ1l2U0pNSHhia2h1ODdTUTJLRXJ1ZG5JMjl1UWRr?=
 =?utf-8?B?bkNUVGhUNVpRQ0JUQ1pIUFB1alVhRUdRRmE2UGN2QU9valFYZ0ZSVHdTRFdF?=
 =?utf-8?B?RFFXOEpvQlk2eWJKYVFubURGU3dlekVFdEFmRnVPdHhBczVlRGlXR1Z2aXRs?=
 =?utf-8?B?a1RjeGF1MzFGbGhnVEdpZzdNYVY3d0dOUzJsUzhGOW5PMzk4c3F3RURack5j?=
 =?utf-8?B?bFRKRWlPZVpXTU91T0swWXpOTUJLa1Z2S3NZMS9PNnVMdER1WTJtNFFKWDZp?=
 =?utf-8?B?ZGhEMzVJVEt2aTJKUWgyalR6azdRQ2R1aTd6RXcvUTdWNVFORUJ1a21BdEpm?=
 =?utf-8?B?bG5UVjAzYjArY2VHdHkzNXZpYmptclE1RUQ5ZzRNY096MjViV2FMbzNGNWNp?=
 =?utf-8?B?VTN3Uk1JYXdYMXFyRTRwNnRBRlIwbHVJdFdZNS9IV0JvVVN5UWpFYjlmNTJ6?=
 =?utf-8?B?TkQwbENSczF2T3VySFEydlZJZ1RXUW1HN1dHRTYrd3VseEd6TDE1K2oydFF1?=
 =?utf-8?B?SHdvakhhUXlBRTRNVUdORWEwMlN4YzRFL1N5SFB1WFMxVFplL0ZjcDV5blpp?=
 =?utf-8?B?aEhYTEM2K1N1dnJodGRQWkFuSjFsdEVsSm1IUGlha29wbVN3V3FtamYrcTZY?=
 =?utf-8?B?cGl5dzJjUmFCYTlnWWpsVDNvREFtbzdTWG41U0xoaFo5dzlnSC9EWUhsR1Ir?=
 =?utf-8?B?eVlEaWpKT2tEK1ZSVE1SRHFKNHZyajBTa0gzd3UxcHdzK096cGhlQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f931b2c8-4df1-4642-391c-08de7dd4df5e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 12:10:36.8565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Yha6JaPlvLig7G7cBZRaUn7jSQtp4jJOY8K0OrZ3FLi34IHxr7nLfm5msXLE/DvK88dejzX0ObgR10lM/aDog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6910
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
X-Rspamd-Queue-Id: 5CA70238831
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.940];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Fri Mar 6, 2026 at 4:52 AM GMT, Alexandre Courbot wrote:
> There are no offsets in `FalconUCodeDescV2` to give the non-secure and
> secure IMEM sections start offsets relative to the beginning of the
> firmware object.
>
> The start offsets for both sections were set to `0`, but that is
> obviously incorrect since two different sections cannot start at the
> same offset. Since these offsets were not used by the bootloader, this
> doesn't prevent proper function but is incorrect nonetheless.
>
> Fix this by computing the start of the secure IMEM section relatively to
> the start of the firmware object and setting it properly. Also add and
> improve comments to explain how the values are obtained.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index c2b24906fb7e..5e56c09cc2df 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -63,7 +63,8 @@ pub(crate) struct FalconUCodeDescV2 {
>      pub(crate) interface_offset: u32,
>      /// Base address at which to load the code segment into 'IMEM'.
>      pub(crate) imem_phys_base: u32,
> -    /// Size in bytes of the code to copy into 'IMEM'.
> +    /// Size in bytes of the code to copy into 'IMEM' (includes both sec=
ure and non-secure
> +    /// segments).
>      pub(crate) imem_load_size: u32,
>      /// Virtual 'IMEM' address (i.e. 'tag') at which the code should sta=
rt.
>      pub(crate) imem_virt_base: u32,
> @@ -205,18 +206,25 @@ fn signature_versions(&self) -> u16 {
>      }
> =20
>      fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
> +        // `imem_sec_base` is the *virtual* start address of the secure =
IMEM segment, so subtract
> +        // `imem_virt_base` to get its physical offset.
> +        let imem_sec_start =3D self.imem_sec_base.saturating_sub(self.im=
em_virt_base);

Why is saturating sub used here? I didn't see any explaination on why the
saturating semantics is preferred over checked ones.

Best,
Gary

> +
>          FalconDmaLoadTarget {
> -            src_start: 0,
> -            dst_start: self.imem_sec_base,
> +            src_start: imem_sec_start,
> +            dst_start: self.imem_phys_base.saturating_add(imem_sec_start=
),
>              len: self.imem_sec_size,
>          }
>      }
> =20
>      fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
>          Some(FalconDmaLoadTarget {
> +            // Non-secure code always starts at offset 0.
>              src_start: 0,
>              dst_start: self.imem_phys_base,
> -            len: self.imem_load_size.checked_sub(self.imem_sec_size)?,
> +            // `imem_load_size` includes the size of the secure segment,=
 so subtract it to
> +            // get the correct amount of data to copy.
> +            len: self.imem_load_size.saturating_sub(self.imem_sec_size),
>          })
>      }
> =20

