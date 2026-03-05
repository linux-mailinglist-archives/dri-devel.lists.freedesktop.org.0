Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kE/GLIE0qWk73AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 08:45:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D00920CD6A
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 08:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D7510E218;
	Thu,  5 Mar 2026 07:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VjzP46nK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010031.outbound.protection.outlook.com
 [40.93.198.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013E710E218;
 Thu,  5 Mar 2026 07:45:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vI9E7F0O8FBJFXYS8X3/yoVMehFhw3b+BNsxaseSd2BqNsegYAg/Oj0mQ6lVYm0uQ5CwsL5sHeiarftvbRvXZCp5tzqGdRxx+Lt0uGe7mOKxK9ZTFmdpqNmM63G1N3aKnMCjlP67QcEdBQBUxPDUx/ZbGT0xe8QCWDrFUGZDgt60YZCMtJ6jU8e7MD0hBaGekdScwg7C/lkNCNwy4jTU2F/LCjOd25hxlb1In/AxwXvMz6JR4gdUSmRoaBYmnOy8omiIgvotNGNdcj4V1SqSb3nZcwVtKUtL9qGJymlfupEaHeFNfNvUwmEz4ApALv5iTaLzp7lMchdyHliFef29QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bx9ivyzNg/DTOl852yQVGNSYsLhaXwCVSgwNdbeHI3A=;
 b=pqcMphwDKvh6GRhot6dTvnDmEmMxo9qy4Ofx7im1ulD3Je3tyPloQCbEvifpiIDP8+PVhmVts+8g6k0VqbGNM2JPG/YBOCf9HMRb0XDVotpwLHyIwSuvBCni/jdEQ/sF7t7kqNiuvhKKUq6qq88XhD06uWmC2PS4jZob/kbA2ROdYeMuANQp8YSCPzK77IAqS/JWzM1JzNOomy+XTqt2w0PNScehbrSfW5kNiW0epNo0lt3Ykq7UGTsvnuKt0NfCYu1Kis72gLCyfYbIM+BlFNd4QpXg5FmxTwkNRzXwP0NVLlPCwueOujvlybpKrDx/f0yVP8M7mnOPuFkuSpbgvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bx9ivyzNg/DTOl852yQVGNSYsLhaXwCVSgwNdbeHI3A=;
 b=VjzP46nK63PQ3id6JIy34Ik5xQWiuqWmTNnK6BAw9yTvwr/rz/eql0O8Zlaw16AELKvhQPTXzw75bLkJ7BNV1/DuawxedNAULUoxsrjnaS+gAu4DF02AfB3ZRcrPHh1+LjLOZNLbTAsn3u0HyI9OcZKQACaPR6rT8CCTafEoI+HBeTtkBYeKrEcerHISrhPol+WxbtRQ93z6CqlxJnbGjXHOqHw83a1KRz/uI/NX6fmZGqZBTxuf6oZRdNsOeevls7bZx03Bs9CwBVAvFlqn2JYCO+OWb8FBnvnYxZl61uRKmziMyDYeQKhEaQYg45Q5CwVGSoUpqRNMoKw/YK0q4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DM4PR12MB5842.namprd12.prod.outlook.com (2603:10b6:8:65::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 07:44:57 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 07:44:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 16:44:52 +0900
Message-Id: <DGUOJ681GZND.2JV7DA2YA5Z8E@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/5] gpu: nova-core: gsp: add reply/no-reply info to
 `CommandToGsp`
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-3-a6314b708850@nvidia.com>
 <DGTZ9NLS9TPM.2NRF5C9VN2B7C@nvidia.com>
 <DGUGNCEXKDD2.ETWE4H89AL00@nvidia.com>
 <DGUHEUO4O47L.GD24M2B30IKY@nvidia.com>
In-Reply-To: <DGUHEUO4O47L.GD24M2B30IKY@nvidia.com>
X-ClientProxiedBy: TY4P301CA0059.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::12) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DM4PR12MB5842:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cfd9faf-c065-4afc-71f1-08de7a8b187a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: z4RkMGhfz98xkceCxJgqgHMvGXiyZSucyF75aG5dR5y3iURORMVM0mGITs7hNDhn+YJlPdietXtnbdnGjiNYDgHbnYzCjRllf64ueSXQQKyXl+QfNq//mKWJhNzn/X409OQ1X1PvfORWVgAAeStRCGGP+4Bq6AygoRJYubnQ8Ug9fNs6MVClzjffugKnlRMAYvpmDk0xK2EJhALoNeDYlR9tFwSNKkADvM0guG98XT0Od8CKh4eN8iMMjLwGHrdepwsAshB2zHCvfrKvH+4+a2k+aB2jrrxqkUkyqs57MfDYs0uvImF5DXFuOvDU8JdIsZjpR7ePSNpc7jp/9byeHMPKNxdidrd2TMSrIVgLmS76+D50Wlkabvjf6+FN04f+QRWMNll3ALw52HUlk8//5yO2UATOCDpGzewh6v3r9VOXuL0cK8LKbqYEWEZ0uS27e3rNxO/be4bNtQc2CoS/NCjBM/ybM46hWN40m4THSGKXp2CxyrKX0PZXhjsQy5iUG5tu62eWfTeCPwNE+K8G258/njNUNcnxTlypkS3+Flpl+65kRk9dPxeL9YyhSJafo7gNN8YvzTTbLmcNdXgfvnu5gCy6pDn9VYEsrbeG+pFisaG0eomr3R9Lkh3umwLsvxkDM5r2Q4Mc/WnWf8Mgdx24BcPKDNMFC8AYU8e3oLqi4V3MbhDv2JDM18bON3Gl8sKN1EXSF8znvXdC9ez5Jlh7UxbWXDTqkM7cqRaCMMU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXlMYmpiY0VkK1pTcjVidjNhbDhsTzR3dkV4dVV5MWh6b0xkVE8xbXFpRWVr?=
 =?utf-8?B?MSt5bjhaazcxeWhGbmxnMlBTdVNNZG5iTGxET3hVSXVSTnp5RnU5aktlWEh4?=
 =?utf-8?B?OHltb3JYc2pvZGlqM1EzZDdXNGd3UWRNTEdmTENsYzUzMkhoTWdsVjJrMWlj?=
 =?utf-8?B?YmhyRm51ZjdsdVpGemxwNXFBb3VWa0RzZkU4c0FLeWxCRXlHNzNTRnRUUnZp?=
 =?utf-8?B?WDlXSXBZT0llL1BSSWpNTjlsUWdhdEVYelpDeFRGK2V2OHI3b2FUOXpHRDgz?=
 =?utf-8?B?dHZoNWJRTyt2VjFQQTRmVlZ2YktROWh0SVQ0b3hBRFVtdHZ1Z3RHS2FHV0x2?=
 =?utf-8?B?Yk9ENjdPWHg0WWNqZUtDUXRKTUE3aXRoL0hpNVIrd2xLVC83dEFadW9ZYmox?=
 =?utf-8?B?REJSM1BFbTdhODFObHAwTTY4d255TEV1SmovdDBGUmU1NWd0aGljMk9kV3VX?=
 =?utf-8?B?TDA2ZTV4bGF0M2hLVStpd3lza01ub2RmV1g3ZjdYN21xWWxDbXRCRml6Wk40?=
 =?utf-8?B?SlB0bjVsU1FHY3luaCtCYTJYUCtaTnBGWEp4WG5nVHhmSkR2LzBHWk53MERV?=
 =?utf-8?B?QXFnWC9qR0N0QStqRGZ2OGVGMU9OUUlTbjA2YUt3akpBakZzZmMzNmpOTHIz?=
 =?utf-8?B?TFRkcHB3NDRBczQ3M3o4MnRHNlZCeWduUHlzQWRNbWYwYjEyRFF2b0dFR1pN?=
 =?utf-8?B?ZlBlTDZuSTJWMmdzbGtuZWNacTJabmlCaCtNMTlBTFpjNXAvd0NaMlJObCtL?=
 =?utf-8?B?WTM3aXQ2S1hoOVRweWFVR1FqOXh3R1JyUzdJWXZxNnJHNTRFUHFMUjYrZGl3?=
 =?utf-8?B?dW9wYlJWYXFoVDk1bXVTZ0k3SENuWU9OM0ord1hBRElEaHJRazRxNEFwNm5u?=
 =?utf-8?B?c296KzYwVldjWXE0MTRWcTZ6TGJUcHVrek9VNWtHYm9UdjhjekkyMDFDY2xp?=
 =?utf-8?B?UHdCeFptd29FV1V6eWVHTWdwZXFxTWdqVVhtaEhTY01qUnJKVUdZWXNWbWpD?=
 =?utf-8?B?bnAyVjZ3bU5ZUEc0MmFtZVFLSzRKRHFxaGZnNmZ3SmJoMjJIMWRmUldNYkxQ?=
 =?utf-8?B?a3JlQ2szclJMWURDUzE0WlBMQXBvMGxIdnhPczM3c1R5RExDYXZKb0RWclow?=
 =?utf-8?B?NTdROG1uTm5hb1pKYU9Yb0lnL05EUXZvdVMrL3l1SGdmYTEwSkFvR25BNzRh?=
 =?utf-8?B?R3V0MWFwRDRieDhwVzlwUzc3VG90d2dOcVhFV1ZwTFZHRWFQd0xwWEMranZB?=
 =?utf-8?B?bkt5Y2l3N3FYaTROUGFHUGcybEdJTHBnY3NVTmRlN3pDOXEycElnbXVZemtq?=
 =?utf-8?B?a204NGJ5aElvTFVPbVEyR3lwVUNyK3RVOGJ5MmF2eVVwUUtwTTZvZEphWEJq?=
 =?utf-8?B?R08yMkwrbUZHMzArR3hhN0hVdTFWTXI5MHduYkkwVHhrTklKdzBmUktnVlFl?=
 =?utf-8?B?bEhhQ3AxV2IyWjNIZzEzenlCMDBXVVBOS2tpUzd1YU5aUVJKUkg0Tjk3TWtJ?=
 =?utf-8?B?RHlKVENaVUdhM3MveklTdENmOFBKQjBtb01uYWt4Z2RINmpmUjZQM3Z4Vndz?=
 =?utf-8?B?dU42bm11OHpqNUFMdG5HY3hBaHp4clFEV21ERTM3dUk1d1FEQkRWbmF5S1lZ?=
 =?utf-8?B?bWs1aVR0Y0ozSlpnZHFuTWU1aG1jajB3RWdGODBTcDdvWjgwUTJRRFZIK0tI?=
 =?utf-8?B?SmorR2pJS2NpTVp0bjVkTlEya1pnM25YZmdhaVUycVA2SW5sblRwZ1djNnlq?=
 =?utf-8?B?MWc0YVN2MHFSQmpBRmpCeUV1YjZxd05pbk5BVHJwVXlhWDQ3T3cxVDVkVjhi?=
 =?utf-8?B?OWFQdWx0azVSMGZKQVduaVRKdkpkVHcvSkdXK0lnRlFNV1ZyOHg4S2FPYUhw?=
 =?utf-8?B?NGx0Ri9vY240bVNzOHQyOFM3YUpPU1FNUUlPdFhUNjFlZ2o3SEMzdEdIeUFQ?=
 =?utf-8?B?blFTbUlrVmh4a2h0a1Y3TXhOTytOdktNNWVSeitVV0pCWEJtODBKRElwQURy?=
 =?utf-8?B?M1Z2SXM3WlFiMjVUWlFTYzUxdkJjNWV2VmRWWTJFb2NUd01jYUxacWtxQUNT?=
 =?utf-8?B?S0M3Rzl4Y1hqY3VrRExRWS9yQnRnc01vTlhNVWZIWkxjbkNuQ0JZNitHeTZP?=
 =?utf-8?B?bHRsM1ZzTzZRUFFDcDlmSHFDeFd5ejFNd2ZTL2Y5bXk3M3VVVGZoYzZKd0U4?=
 =?utf-8?B?OXRsazREejZ0ZVE4ZDlQMkM0cXRBdkhhNWFvZWZhWjlUbTRJTnNWT2NNbXVk?=
 =?utf-8?B?aUxFNG5LMUtLSmVtaXJaN2Z2YmpPRi9pK2ZZV3RyRjArR25QRGw2L1FCeUcr?=
 =?utf-8?B?SkJ2dHNuV25kd2pqRUkwWmFnejN1R1JvU25VNlE2anQ4MHYvK0l0TEFaK1Bj?=
 =?utf-8?Q?qzJlrgBlSzZb1q1CD40GlEYNA34pTRdsJtcd5Fh+R3SEH?=
X-MS-Exchange-AntiSpam-MessageData-1: NpNmFd11IC7D3g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfd9faf-c065-4afc-71f1-08de7a8b187a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 07:44:56.4145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFzg/nQDzinyV5LP3DCNrTUW+JmCD+L0/cyhu/kSHASbJGHtk61rfYr7L1bex1+MOrD3J7qhpdVSBMNTJqQq+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5842
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
X-Rspamd-Queue-Id: 1D00920CD6A
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Action: no action

On Thu Mar 5, 2026 at 11:10 AM JST, Alexandre Courbot wrote:
> On Thu Mar 5, 2026 at 10:34 AM JST, Eliot Courtney wrote:
>> On Wed Mar 4, 2026 at 8:56 PM JST, Alexandre Courbot wrote:
>>>> +    /// Sends `command` to the GSP and waits for the reply.
>>>> +    ///
>>>> +    /// # Errors
>>>> +    ///
>>>> +    /// - `ETIMEDOUT` if space does not become available to send the =
command, or if the reply is
>>>> +    ///   not received within the timeout.
>>>> +    /// - `EIO` if the variable payload requested by the command has =
not been entirely
>>>> +    ///   written to by its [`CommandToGsp::init_variable_payload`] m=
ethod.
>>>> +    ///
>>>> +    /// Error codes returned by the command and reply initializers ar=
e propagated as-is.
>>>> +    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) =
-> Result<M::Reply>
>>>> +    where
>>>> +        M: CommandToGsp,
>>>> +        M::Reply: MessageFromGsp,
>>>> +        Error: From<M::InitError>,
>>>> +        Error: From<<M::Reply as MessageFromGsp>::InitError>,
>>>> +    {
>>>> +        self.send_command_internal(bar, command)?;
>>>> +
>>>> +        loop {
>>>> +            match self.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT)=
 {
>>>> +                Ok(reply) =3D> break Ok(reply),
>>>> +                Err(ERANGE) =3D> continue,
>>>> +                Err(e) =3D> break Err(e),
>>>> +            }
>>>> +        }
>>>
>>> There is an opportunity for factorize some more code here.
>>>
>>> Notice how the other callers of `receive_msg` (`wait_gsp_init_done` and
>>> `GspSequencer::run`) both use the same kind of loop, down to the same
>>> error handling. We could move that loop logic here and do it in a singl=
e
>>> place.
>>>
>>> In the future, we will probably want to add handlers for
>>> unexpected messages from the GSP and it will be easier if we receive al=
l
>>> messages from a single place.
>>>
>>> This can be a separate patch from this one, but I think it makes sense
>>> to have that in this series.
>>>
>>> I expect the last patch to change a bit as a consequence of that - mayb=
e
>>> we will need a `receive_msg_loop` or something in `CmdqInner`.
>>
>> I agree we should migrate all callers and make Cmdq responsible for
>> draining / handling spontaneous messages from the GSP, but I was
>> planning on doing it in a separate patch series until now. I can put it
>> into this one though if you want though no worries.
>
> If it ends up being convulated, let's do that afterwards but since it
> looks like a quick and easy win I thought it would make sense to have it
> here. Your call though.

Another consideration is that if the GSP has some issue, it could cause
this receive loop to run forever. I'm not sure if that practically can
happen or if we want to guard against it, but personally I think we
should and taking care of:

1. Some loop level timeout
2. Future considerations for how to handle spontaneous messages /
   draining
3. Migrating the callers

Seems large enough to do as a follow up series to me. But LMK if you
feel otherwise. Thanks!
