Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bX/LM9LOn2k7eAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 05:40:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3261A0DFB
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 05:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6098310E0FF;
	Thu, 26 Feb 2026 04:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jJzEmQTJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010032.outbound.protection.outlook.com [52.101.56.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF58E10E0FF;
 Thu, 26 Feb 2026 04:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ra+d4235ZZ/3zEzlDJC3WevZQQqD94Wbya7SycaooGmCQdOXqBb5KD8RhOZVaji5J2aiPYfhbGiomiccTbV7kuLQ19RFJiqaIRL93c8VNTTMEABQE4Ypf+zYuF8O+LSA4RTP7zY+G2OORe6yEs7BR3oAtxyIHB1NhUnn8pMcT03BKcwqrJAq7G0+lU/Tu1vvkTRiy1hjMrCvN/rFHbz6GHSBttAgQzRafw2E0cqpT8zrI0ZG5F8JvVVpLOmwrjdiuYR/cMJqzTX/WF9o8z6+hA+sez8IDye80JVfEcST3Odp0WhcogFT129fixHg4lQH7bGIRdbINWt3hTbsJX7HGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sg/GMgJi2j1Dha0c2SVwWVH2SSPwIMF3EjT0KCxj5c4=;
 b=If51UyuWCfwkZtUkhRNE7oG/kVearIPPaqxIFb++ywIWrFpLgqEMsmTSgLiswmrLSiO1kvgKNN0eFfh8KlLw+Xk9xwU48nwR4pg2VQaj0HOjYasN1JCjfpejvuRumIgTcgF6NKfDtUF1Y1/vhnxXPEdstBnUZ6UzY9IeREq14S2L/PE84MGPV9+ZNUs3p9lwgu8Wu4xBrntOgJpSrIZrh0aJtPIJYxpO3unTOniFh7aqRz+rWVksz13/EoxrRFqdT6wo5nhSLC2VlAuy7snbVq7s+FvAlmx9Bwe0TSPGVNu/+qVQQ87obayqXYAUyFRw1X7BMoptvbBaXRbFXAv8nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg/GMgJi2j1Dha0c2SVwWVH2SSPwIMF3EjT0KCxj5c4=;
 b=jJzEmQTJ9t4NJVR/MibaRXX4iLxiTrnzHX5ucBVUHJ82IezXoQMtxn68HSWLtN63UP4ambWszKRwxHGcGGmV68SFAII2jaD4xdoqtF8nGMlzlL2oXY6pPHx+HxcPSWitkjeesksp+F7pjiL+XNceEFFI9L9LuYhoTMumBQLta3+PEdkK2SKmZjLIglFvOpGZQCdkWyHQoDlzy9kp9PGTS7Hmx/Qhryq+frZC2AIupFt2fXA6iMpbYlVYeDzWRPLy2rdLG1Zd+iPpPS/tUrvALem9GZSNKXMkYD6hpD4XoJaSGAszLdUK8ZCPfXczDoQrdjDCc8CacW0iBnJA0002Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 04:40:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 04:40:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 13:40:28 +0900
Message-Id: <DGOM862L9PPN.2YFCJYJFZY7D0@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 8/9] gpu: nova-core: gsp: support large RPCs via
 continuation record
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
 <20260219-cmdq-continuation-v2-8-2e8b7615536f@nvidia.com>
In-Reply-To: <20260219-cmdq-continuation-v2-8-2e8b7615536f@nvidia.com>
X-ClientProxiedBy: TY4P301CA0027.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6588:EE_
X-MS-Office365-Filtering-Correlation-Id: 0672a904-0bdb-45bf-6e1a-08de74f12c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: NyT68xuadqBtYD8xdZUG6tl2AaOPBBQofZhB+M8oTIUewJb62Z5o/dpZPaW/9+Be2PghEavmclfztfMO66VP1ipEePUG7MBOZZSTTNcQCWSsUTudUhwS94NMR7kCATBscM5ylZic2S8/ngO1mTTxbZkpojoMdlcRiTBxMkBdQFFyXlunn+DQ6F3W+r3y6fMmkZfm8GFvNKhvW6Quk5gb8Vkn+R9FDXXOJIjOs26Fap0sPhMr1ZVx2nL2ugEpGsAA5vbMg4oORcfA56AHc2MxQ1cwUgTFu1959c9bxfteN8G35z9nt4FtYGyDdacAW17BPg4nkHpojPn4/vAyaPks4VAwWCRRIaGNaQF811SnrkEbeDjUZavv0/8XUwuvf7TJFR8WdyPNUuPG+xKBdWZ2RawlAAk2/tw6UdWZ1eIbYnpi3+roTYek9Liy6xO9dWMLVne2TEhVqrXsgKkfBMCypPnJpLt6T+LdGrkxQioZTBeSrMeR+NnYtczoRIoWbe2pP3ZwjL9wGsgmdsU7MFMw4dPfSSsCdk14df63d3Vfo8Fe5/KF+E7aQcjpovTDMJXTDdNjaRCJyD0+r1EYdgHSf2of4ZGgIx9oJ7WTsRzApm7bgterxxJcPS/+nvlVmjF8gBkFD3S/Uotgrxe4uyKiojWFpRZoHBmfEAlLRDacwzphAaSu8DHNtWRS2G8hOQFwrCMGeh7EB8hN/yaO4SlGIafZN77EYEgDyjvdyjHcAiI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnhVVFZwTTJKSWxBVGl4WWNOclZ5aS9EUXIyenJqV09ySlJHOVFNbWx2bU9v?=
 =?utf-8?B?RWNlSEZvc0p0eW0vcytqWGxjQXRmVmpFME40TXJMNlNLejE0T0VxcnBmNVNY?=
 =?utf-8?B?UjBNRTJLQkRnN3E2Z294blNtbjY0bHNRaHVyWXMxNFcvVEpSK2k4ektQUHM3?=
 =?utf-8?B?VE1zN3FYZ2RIMS94WkRrNmRPWi81amRUK0tQTXFLZDBHOFpDSTNHczZjaTl3?=
 =?utf-8?B?L3pqbzBQaDU2YTBZQXpQajVPcjMwRGw4aThnTU1kcHNLWGlXMU1vSlNxbHp1?=
 =?utf-8?B?VENXVmovZUk0THg4N3RpY3lMTHU1LzJLM0ZUQXpKNVV0RmNpMlNvUlZtR2xK?=
 =?utf-8?B?V1hkSUxDcWFBOTJ4N2FGTWxRT0xxdm9iKzd1d3dIRk1GbGF5aGdKZlRzeFVH?=
 =?utf-8?B?aWpSa3JUelp2OHowZWFhbGl4aVNRYndrSHZlWDMzcWFCRWRYRExBQnJYTEdk?=
 =?utf-8?B?alluSW1wOElSYUJvVXY4SEtlVFBRVUx2TGNabXpqNEJ3NXkrdVJtVWxrVDdW?=
 =?utf-8?B?dE5WUjVGcENRM0w3eXhXWFFKOTVRYkllVlVlOXlzWUlOZ2Vja2dNSTBxYUdV?=
 =?utf-8?B?dkJubVFvVGJNMjFTZERyaStoeWF5ME9MRGxoUDNKVEh5UXZTRGFiMm15R3hh?=
 =?utf-8?B?ZHVjMDJicjN6ajg5L0YxTkFjdytwUGhqS3FuejE3Y1ZoUDB4UzFIUTl6V21L?=
 =?utf-8?B?TWpudUN6U2owNHVkaXV0ZEVxM1pCcXdvcmlaOG1FaUtOMEp1emhrK250dnhF?=
 =?utf-8?B?TFBlcGpCRWt2WHZPREw1SlZ3TWtLL0JTWEpndE52NUVCTmxLeW1zQWxKZzRB?=
 =?utf-8?B?TElWenBIUjRDTWc1dUdIakE3dVNxcVF5cDRLS2NBL0VUWmdVK2t2RCtTRVkv?=
 =?utf-8?B?UjVoc1BLQjd3aGJQMHF0WE1Eb2d2UFYrSk9sZDI0OFNRdnhCYnBaTjRWWU16?=
 =?utf-8?B?ZkVGbEdLeE9MbW5KMHlBdUNJU3NyWndrZ05kLzdRNDlGV241VHErU2w2TmdK?=
 =?utf-8?B?OER6MGdHT2FDR1VpS0RIRzlETTJjamVCZnNJUklYd2VleTIvVm83V0VoeW83?=
 =?utf-8?B?aVp3VHFMbVRXVE82MmI0bGhETzVkOXE5dFVPMlFGT0k4R2s5dTdNUTdpYVA0?=
 =?utf-8?B?d01oQjhhSkJibDlNcG5FVG1CL00zcWxUcVhGUFJCR2ZkQ0w1b0J2Z2N2UHZI?=
 =?utf-8?B?cmxsTlhHbFFvcFNsYStwbC9PekpuMnM3RzcvL3NGZmxzSmdpbmhybkMzYkpM?=
 =?utf-8?B?dm8zN21iRWI1YzJBTE1aeEsrM1Z4U1BwK0Zub0VHbm9ieDd6V0ZXNENUbG1x?=
 =?utf-8?B?T0hEZFc1QmdxS25VV2xhdGgyYW9sbTJISzBqZE5mK0ZRYW5TSlQvQ1pnQ3gr?=
 =?utf-8?B?R1dmSVZqRFNJNVAxcTAwL201N0RUb05zTnBsN0M3WEd1MzJFOUtJaW1RQnh5?=
 =?utf-8?B?aUtueFNVSWVjTUFUVlRJZyt6MEZMYjJmM0Zqd0JteWM1b3hLMS90UFc4L2kw?=
 =?utf-8?B?OVlQd2M2ZGYvY0dLVGIrTmxyTWZqK3JMRFdUcmNLUzRXQ1NFZlVEWmNId0JH?=
 =?utf-8?B?NHQxeHByUnZXRlNRWTBrM29vdkh2OHpFYm0vUVJQdC85MGN3RXJxVFBzSzBF?=
 =?utf-8?B?R3I0MzRLZ2tvWVU2U3NIaURmb1JES0RzMHBJU2NRdnd4L1liOGpIMTg3YWlI?=
 =?utf-8?B?VTlCL2hoNEc2NEZZcWQ1VjhmRFFldEJNRzRhbzAxMjdpdTQzT3ZVbHl5OXAw?=
 =?utf-8?B?R1VLY21ZcnBTeDkyT0hsMXhKekV3N1NVbGhSalZYZHFWbDVER2dJNzJTdlR6?=
 =?utf-8?B?Ym5JQUdBczlObTBNdjlJZXJUbVE5N1NLN1lKa2VMWUlyazU5bmpSVENsZlRH?=
 =?utf-8?B?NW1DQ0tOck5taU5TaFIrY2JYSTFUcCt1d1BwNEpERFNzb2N1eGNUblh6ZXpX?=
 =?utf-8?B?eUFiTUpqbnk0ZjlhcEVsL2JQL09WSG96dXNsUWRLOGRRZXp4eUtUNzA1K2Ex?=
 =?utf-8?B?NHJZR2VnMDhWQlZjeTltNE9HVjVSVGo0V3VVY0lSbk5qaG9zb0xHem9OY1Np?=
 =?utf-8?B?Vk5zdDlLSzBNcmJUR3lnOEVVU1NiTnhmTjNXQXU1T0hXWFd1cGJsbG9VaEVu?=
 =?utf-8?B?TE8zTlNUVzZTZWtrVjM1a3NqVlBielJlbFE5empLOUFGMkxuM2ZwaVNFZnZZ?=
 =?utf-8?B?SmRhM3orU0wxRzVaQlBVQlQ0elRkbU9lWCtSZldrdGVUYUtYVWZtcjBBYkNp?=
 =?utf-8?B?VlBXbCs5SFVBb2xiOG9VOEEyQlBBOEhzRVhXaFZ0NUdFR1F5KzFWdTNETUJI?=
 =?utf-8?B?VHJRM2ViK1VGdU5jS0RTWDE4YlFPYTBVQ0ZSZ004UmREQ3F1ajFVeW1BNUNY?=
 =?utf-8?Q?JtQyB3Ribwkfvol0kRIyLNSn9ZuDwV9xhKjMD6LIGL0PO?=
X-MS-Exchange-AntiSpam-MessageData-1: mfqlkwANlBZJRQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0672a904-0bdb-45bf-6e1a-08de74f12c84
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 04:40:31.8072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tM1eINSU06ufLUTNc4ezF6cf4np1PUbGACpQseajlHF9ej5i+nw85+WEB2Kk1Z7sl7Qnkqc+R0ilt2s3eAyIKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6588
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 1F3261A0DFB
X-Rspamd-Action: no action

On Thu Feb 19, 2026 at 4:30 PM JST, Eliot Courtney wrote:
<snip>
> @@ -575,6 +579,39 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0,=
 command: M) -> Result
>          Ok(())
>      }
> =20
> +    /// Sends `command` to the GSP.
> +    ///
> +    /// The command may be split into multiple messages if it is large.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `ETIMEDOUT` if space does not become available within the time=
out.
> +    /// - `EIO` if the variable payload requested by the command has not=
 been entirely
> +    ///   written to by its [`CommandToGsp::init_variable_payload`] meth=
od.
> +    ///
> +    /// Error codes returned by the command initializers are propagated =
as-is.
> +    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> =
Result
> +    where
> +        M: CommandToGsp,
> +        Error: From<M::InitError>,
> +    {
> +        let mut state =3D SplitState::new(&command)?;
> +
> +        self.send_single_command(bar, state.command(command))?;

I think it would be nice to send the actual command (and not the
`SplitCommand`) when commands don't need to be split. Split commands are
supposed to be the exception, but the current code makes us use them
unconditionally.

So something like:

    if command_size(&command) <=3D MAX_CMD_SIZE {
          self.send_single_command(bar, command)
      } else {
      // Split and send the parts
      ...
      }

would read better IMHO. You can have a
`SplitCommand::command_needs_splitting` method if you want to avoid
comparing against the const in `send_command`, but honestly I think this
is self-documenting already - you split the command because it is larger
than the maximum supported size of the queue.

It also would have the benefit of simplifying `SplitState` and
`SplitCommand` since they wouldn't have to handle the non-split case at
all. Actually you could just have a method that consumes the command and
returns a tuple with the `SplitCommand` wrapping it, and its
continuation records. That way I suspect you also remove the need to
pass `command` twice.
