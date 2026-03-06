Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGVOFIkkqmkPMAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 01:49:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F1B219FB1
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 01:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1949010EC74;
	Fri,  6 Mar 2026 00:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KsouVD+Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011048.outbound.protection.outlook.com
 [40.93.194.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC9010EC74;
 Fri,  6 Mar 2026 00:49:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGIx75chm9MGivBJnX2WrDZj9TK5vySF0vM/oS7u9gQHH6OJegHaXauQqv45VirZCoyApn2i4zAWI9puFNdIdn+VQjn2tX8rmPMzuo7nFWmWRp5azZS3WmH56YoxbqsXBapZoKHQju+i2olcfHdAiHmp06tiOuOztikPFXOThZq3B6zStwQ7CI+paMp31v8PE8jZiI44rfMEU4pDfMxSDpaDZJ+pIynYsE79A6r52m7aEAdjUPRGJzSBjOwf0NhUk2aO2i0NKy1iZsAH1jtiQ6v9pfOlvKfTLRz0lKfFoRoqzIu+1sLYQthvYk8qDk+AUYFRzcvbJFi8MtaREe5vrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ludElEuuFb9qiUbFuYhyTkdGnUlNV09MD0YnURF9OPI=;
 b=ACg1Tcm99xOZdnDdc6aeCxHiE1lslJ9CZo2KP1VzlIZzhS1lLZ/4iN3rlcoyzm0DXtgXjuHSt3tU/WwtgGO2YF5T8AmsXI/Dn7KZszsW0D5VLE9wgpu95vpruTi53xjXPXJVJiDKYspS3z1h22apt72sFwoWvZCHE8SKsjhbcGlqkmNO15N9DtjRERtSd4JzK81tr/1Sl9ryfTXRtOpvS3KdWkcb/fKiH4rmmyRo3pAh/158D4xUufXhIY6rIVIUhTy+KZh69pxlqAJ8GlghZ+4Md8NvTs4dVF+1fqU00g9LoErgsvJ4U2USZeDBaivRBKSALvzz3ig6ByMDeYdP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ludElEuuFb9qiUbFuYhyTkdGnUlNV09MD0YnURF9OPI=;
 b=KsouVD+ZdOA+eHaAroj5OO/M22gSCS7r+jFNjZzxXHhY+CuIOh4uLSIsu9i1bgr6JGSKunYLg48JFc1WSPuG/lRoo2qi7WGj+kGWK599sS2N2QXwIwNkWGpnULEq+gPvz4fXKE3bpzHvIRRtI2b9+7oMMTVXASpi97nuDUQrJoLTsYvjlSweoJ7P0kqrFVbTo158IOO23zvJf7vHeuToO0tBc6RA5qRaTQ18MIz+sjCIrTOuKPZz8xDWxOir60BfKLBlzJJbl1IToReR3TJSq/yenl+32O9ByY0Pwk8BcNB8it2LH7yJMTPs5rNtEtGdOTOueSiQWRsrscnhyvarNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB6803.namprd12.prod.outlook.com (2603:10b6:303:20e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 00:48:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 00:48:50 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 09:48:45 +0900
Message-Id: <DGVAB40GKAYG.3MX3IZQO1816A@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Zhi Wang" <zhiw@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
Content-Transfer-Encoding: quoted-printable
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
 <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
 <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>
 <DGUT14ILG35P.1UMNRKU93JUM1@kernel.org>
In-Reply-To: <DGUT14ILG35P.1UMNRKU93JUM1@kernel.org>
X-ClientProxiedBy: TYCPR01CA0093.jpnprd01.prod.outlook.com
 (2603:1096:405:3::33) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c89f1e1-793a-4df4-77d6-08de7b1a2175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|7416014; 
X-Microsoft-Antispam-Message-Info: CdN7iKB6jOouDK3bYF91zCAfbvcZoUinV9KN7+/kmlLiSpOOxicAe3LnyILrgvQoaKdfdjHU2TSJoFEES3GHQNdalixjRTwonXdTxo4HhNgaZ7/aAJCVDALwdOM6ff99jkKqIGh9NvARg4FW7c4NTu65IL0FD8oQqOY5JprjhSHNsmk07/NuTPQzEwnggx1rTSA5cV4OJMAt+3gDCC4iB7jHrrKpfZIiEN7m4qSFzLpWckDPsSL/tFxQgfLDoTkK9+85oz7KeXbNTDEDKSiK6q0qYRrolEuujE6rlPm1PsvkbMipe/QuT/a4dv2w90qaFqVkAlZkBOqwWDcRprBIOlDJsn0CHnyG7O1uLPqYzNm4TRVhZBpoMVcwkvAuNFDAA+aXdBT1aNX88IFfH5T1qSswS0goNkBmlO2IvgQdBAxn/LT7+jjyEUdxJsSI5kLjlK88ydereeusjajD9oqG0e+uFZkL4xwTsmgLLr+Yb1N+pI3HbsAqhsbHCfrYQwBU1MAtnEv98L1sE/07ZEoaLL6eC9MT5wUGPXFDxD1XZqUbYimtZAVf9QKkBeYyJa4Y7/Dqtf4Le+UM0HdgTV497bRa3ErtgGTQz0Mk4Q1GCfE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UldNNVRqZ0UwL3M5R2RQTjJhd3dqK0k2cVFmeHN6M2lDckhOdnJOL0hkVzFN?=
 =?utf-8?B?Vlc0VnkvWURoZ3NBRFY4U3JzSTBySlRHZXVXNnMyeFF2dk1XME9PMk5LMCtE?=
 =?utf-8?B?SzJoQXlhcmdEMFF1eUVZcURMNTlOS2sxaHJxNUU5b2hJZzBDakpQNi9rYlZL?=
 =?utf-8?B?YWgxU2QyS3FJUWNsYUUvY2VWYkRCQ1BIVU9LUlI5QTA2OXB4MERScnhyQWxD?=
 =?utf-8?B?R1lxc1FSckp1Zk94MGo4TW42ZURuQmtpSUJ4K3lYZ1RzOXh0WFVkcERua2Nu?=
 =?utf-8?B?SkwzWGVjUy9hZG92bFExUUhtWFlkSDlMWFQxVjQ3UStQbE1vSStJNWlRaEF2?=
 =?utf-8?B?ciszRzA3b2l4VDIxRG1uTTFCbVNMWUYrQlFQbSsrRThMV2FRRnA2b0pjSEJ3?=
 =?utf-8?B?QzBkUndhMjhTMGZhNFdIVkIxR0VOd1B3MldJME5JTWJSemJxRmVnOWZHQlR6?=
 =?utf-8?B?L2FyQ2VvcWVqY0h4U2VYb1B2ZlVwMTlZYzB2d21URFd4UEFNM09uc3h0RFpX?=
 =?utf-8?B?SFdxaEJEaUFOTmFRUlB0NlZVd1FtVjFoRjh1WHZybDFDVEsxK0QwQnpZMUVl?=
 =?utf-8?B?UEcxdzV0QWpReGxtUmRZMkpaZlk2Q2c3QVVGdTZDdFZ4MU9CQ28wWXRhK0lt?=
 =?utf-8?B?bjdwVXJkM3hrdHltbE1KeTFmQWlXSElzOEUwOGwzSm81MTFLQmx1bnJ6bzNl?=
 =?utf-8?B?SlN1UXFHTVcyRUFhSXRCQzF4R2IybEptZ2NwaVpEOFIrSy9lZE5RbC90K1Ay?=
 =?utf-8?B?Z1Z4WHMvYTV2NThqYW9IV0V1bG9mc0VUekpWQnJJVEhOQXlQdjRvS3hQbVAv?=
 =?utf-8?B?MHJ3cU94L08ydGc1NElkYjNWYkNWT2N5ZUhqM2dEUHg4V05wczBKc1ByYkxE?=
 =?utf-8?B?d3FGTEZZTTJmNis0Z2xiRHdyK3JidnEzdkJsMlEzMldiSzJWOUpJcWxDNXhM?=
 =?utf-8?B?SWNIV0JHOWJyQXVmKytGY3M5L1RsNjFrUUoxUFBxL21PQTJpa3F6WFE3V1Yv?=
 =?utf-8?B?WGJFK21pVkRwVzZWcFErdXJVSkcyeU1kM0luK0F0MHl3eVhZS3VhWUg2b2J0?=
 =?utf-8?B?Qm5pbW15OXVXMUpjOW4vZnl6VUtmU3R0RmZjVEJWTlltWFFJdFZPWENCM2tW?=
 =?utf-8?B?Q3I1TmtzNGVWaDFyRXJJWFBpRXBaaEozMWFlZWhKRXA0Ym1obHVBNUh2eGpB?=
 =?utf-8?B?Y1hxOU53TSt5Q3J0OHVHdlcrUGpMam44RkpJbUZFczRpWFBHbmJhVXFyR24v?=
 =?utf-8?B?WlpqUS8weEcrQnBGc0VZR21sS0I5NHl1ZGtlaDBnaTRTUmdVQXpzVjVHc0Np?=
 =?utf-8?B?cGtXTXRUZHR2cWNpWWllRENzRFMyeGorZmd2Ris1dG1tZEdvd3MxejFaMHFl?=
 =?utf-8?B?QUFYMGltN1hyNktRbHA4RXoxNEs5bENuK0pnNWVTWWhTanBTdTRJR1Q5YXBs?=
 =?utf-8?B?Y0tmTWFLUFMvNHk1VER6OVI1R04wUFdqN3B3WFBXMU5USWhIS1RzTUllYnB6?=
 =?utf-8?B?M1Zkclh0RHQ5R0JORFl1UGo5dUUvS25CWnhJTnZNZERsMjI0c3hiQ0s5ZDJ3?=
 =?utf-8?B?YnI4dHZTS1d3ZzVJbSt5aFFUdzMxK2MzQWNLek1qRDM2MGdhMzNleHFMRjQ5?=
 =?utf-8?B?QjdvUWl5dmRVcUhqbHhHN1kyNCtPcmNSZWhWWmFERk00cUEyTUhzZnNhR0dQ?=
 =?utf-8?B?L1Q2S3RuSm40cXRsbXoreHYvOEtmUlArcWR6U1J2WUlHRDhZNGR5Yzl5M0d3?=
 =?utf-8?B?aWxHclhvMUxNdkF3RHdMRHZBMWROQmpJdDR4dTBPL0FQQURib1huQnNtUUJF?=
 =?utf-8?B?TWFrSkxOWUFFYlB0Z1l2WmlhZTQ2a3gvWFh5QUUvV2svL0ZOdjVTc1UxMisv?=
 =?utf-8?B?cnBuT2VrbEFhT1J2ZWtKZCt3QkFIK2dGN3VrK3FrdnVCU3c1Ris5ZHZObTMx?=
 =?utf-8?B?WTdVUzZTL3JySWoxRFNZajFWc201cWZOUkF4OTVkdllGbXRCR0cxMEZRdFZR?=
 =?utf-8?B?TVhodTc0UGhRSk5WU1BmZ0NNWFNpT0gyWlNyMEhXNUVQL2hXNi9lU1RYWEJT?=
 =?utf-8?B?R0gzZnlMQmlWaTA0YkkxRVFOYkZMVktzVDZVekFDeTl4bFpXSE54ZlRxRUFo?=
 =?utf-8?B?OVdBUW90MStUQWl3enVYYnRJMVVPUXdpYUlCUVo4WWNSMlZxUlpiWmJLRi9O?=
 =?utf-8?B?M1Y5a3duOUdEeEVCaGR6cEZYU3h4MG9oZnBzbmlJREFYMDdhakYrYTRSY2FM?=
 =?utf-8?B?bGZtODZCRkg1UjFTYWdWdURPeGEwVjVaK0twdUQrZmlLSHh5bzlEbGJiNm9x?=
 =?utf-8?B?eEc3SlFaY2JSTWJQNWo3Y210MzlQV1JLRWZ1QWlZb0dyWlFEN0o5MkcvSSs3?=
 =?utf-8?Q?dBQj+CdJgtrQDOAV1WYQvCZlSoFFUhNcVxQo4qe9YsaXu?=
X-MS-Exchange-AntiSpam-MessageData-1: 9na3xbtPHQAmGA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c89f1e1-793a-4df4-77d6-08de7b1a2175
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 00:48:49.9740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eU6rFSrT3IlS2rDivtckFmnkpQlC72gQaPS9mkkHkGravRtLW3YQT1lW6TkDrVFzsvtBc8AQJppYbo0wThw2Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6803
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
X-Rspamd-Queue-Id: 75F1B219FB1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[nvidia.com,google.com,gmail.com,ffwll.ch,kernel.org,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Action: no action

On Thu Mar 5, 2026 at 8:16 PM JST, Danilo Krummrich wrote:
> @Alex: It also seems that this is based on broken code, i.e. I noticed ho=
w the
> DMA read is done in this case in e.g. gsp_read_ptr().
>
> 	fn cpu_read_ptr(&self) -> u32 {
> 	    let gsp_mem =3D self.0.start_ptr();
> =09
> 	    // SAFETY:
> 	    //  - The ['CoherentAllocation'] contains at least one object.
> 	    //  - By the invariants of CoherentAllocation the pointer is valid.
> 	    (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
> 	}
>
> Why isn't this using dma_read!()? I think creating this reference is UB.

We can't - technically we would have to have the `dma_read` in `cmdq.rs`
so it can access the `CoherentAllocation` (and do an unwrap in the
process):

    dma_read!(self.0, 0, .gspq.rx.0.readPtr).unwrap()

... but that cannot be done as `MsgqRxHeader` is part of the bindings
(i.e. in `fw.rs`) and thus its internal fields are not visible to
`cmdq.rs`, as per our policy of making the bindigns opaque.

This can probably be done better with I/O projections, but for now we
have to do the read_volatile by ourselves. What makes this reference UB
btw?
