Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB/yItxQn2k7aAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:43:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93F619CDB2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F3A10E373;
	Wed, 25 Feb 2026 19:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MjpxjWzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8EC10E373;
 Wed, 25 Feb 2026 19:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vg3zdzs+YY4nSqIh/JamW8+RWqDDVwE+ohG7WCgkBAHFyh2pVdZWQDAjqf8b2UC2/FPTFHOZ5LbZZo9ktMZuL+/L4ifK6pAdUy9SeU7QRdQxdPFrjgxJLeHq/zw/gYDBFApNyIDsVFYhulEJVfRobCuPj565kCc4rFcbfS7mnWbF2NDvzD+iE0YwXcQfh3gqNyft+q/l51Qke614RtalwWZ+0WpPlbSAWlLE3YFp7tGNM4zUw++XDDEsMzU0CdsnMyuObDwcGE1cFFa8VWZYjuGSF0sL7LoAx6M6X7jtv9XTNjuA/1H/I3BItKYAGyF4l1pxoPcT8p+r/m8GYhXrQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XocdN+d728HZQNk/EyJU/sZFLIxXH3cm8cMWPL7PuB0=;
 b=kbPSxwBKVwUhFvhN4Z64U5NCaepYznEyPKDwmtiIONtx51p0+Xk6dyne++QgVhWFkubYGnSDLkfB9mmoms9wKbx4Qzc7B9MBeI2gTAIvHFGNtQ6gj5msJjbbFgptwE4oYi2PY1goBQsjZxph9k6K0+vdlHRBpKFWoVNs2V/xLX7OObj8Z1Zt24N3BqTgt9NDo/Yettw5cJrgBFBuP5CsdjmZiwnMh7DK5fiBX8ny9KL3T1HGzRgLgghpeds5FcRdKb8BV5ILJjjDaIVCAhiu7bpVf6P5ryRZlDjySkrecK6xcvsQk/cU05wluly1sHJBsAa11wlZeGrBiduculJurA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XocdN+d728HZQNk/EyJU/sZFLIxXH3cm8cMWPL7PuB0=;
 b=MjpxjWzHiiiQ9sFkpvMm/ZWmCOj9Ka1f78TwJXVdL6/4NrRef0c0+feLmnxgEUhwiVb+j4YjzW8OqHmKBm/OOSWrmSpmD2aJEinygg78StV4topbro2UtFz+PxovDWQBmoHox8W5mi97Kut1ZoBVYd+H5RP7sDmHKp/31tMqPgHmE5DFJInYGDwKEFtangr01pZXwynv3c9vaHFT6fSdgxYh9zFhPKczlwmTiukH2DUZ2Uh59emQMvaqWAZZ+0WeGx33r4pKvCEJJgSu4G4HItbtVApSYUe6E2xkDngXix5w5u27omqNDjdEjf/vt6Qw1n27Y3W4tzAliISf/Qym5g==
Received: from BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::12)
 by DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Wed, 25 Feb 2026 19:43:06 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::79) by BY1P220CA0025.outlook.office365.com
 (2603:10b6:a03:5c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 19:43:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 19:43:05 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 11:42:55 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Feb 2026 11:42:54 -0800
Received: from inno-dell (10.127.8.10) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 11:42:49 -0800
Date: Wed, 25 Feb 2026 21:42:47 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Eliot Courtney <ecourtney@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, Gary Guo
 <gary@garyguo.net>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/4] gpu: nova-core: gsp: fix stale doc comments on
 command queue methods
Message-ID: <20260225214247.2636d85a@inno-dell>
In-Reply-To: <20260225-cmdq-locking-v1-1-bbf6b4156706@nvidia.com>
References: <20260225-cmdq-locking-v1-0-bbf6b4156706@nvidia.com>
 <20260225-cmdq-locking-v1-1-bbf6b4156706@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|DM4PR12MB6373:EE_
X-MS-Office365-Filtering-Correlation-Id: 90faed4f-bbc6-4a6b-794d-08de74a61892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: sj8BVnx2aoF+Y7nx74WDdiIL+OlOzXEws8QvqmZ8IGKwM3kHxFBBDj6H3Fxh4EB2GhZsjAjbzo3WiZuakBUiC+g6LOtUYHoS68mFJWObga7nXSJnz0yRmqwTt/fsvoVepeVzeW/2WrrcWzvkSAfXgsxtbZePc+2fieClg0fb2AwNMbGce4Fow0otrk++rM3pMOr0kfXsxKLXtCTOigmhmoFenHHfeUBPdPwAFMDmwYFQBreQGs16KtaEqvwD/Pn88PPekgV07l2cVv4LZnKMdtLHuC+rJXDytMZvK10I9ooeClfcL2LJXVTC1IX1ik2CkjNon5llypP6PzEvj/mXwTxP/I5W+F75abssuiaBDgGzyyXzLI584KHa06SKURWxY/fM1kyT6DOAcTljhCIN2EY5r13pW4YLzFkNMrY87HhZvXBgfHjnrhulluR+2sVOp51+uZtav3UpHcoCzbrzir16I4nd2kntcu2l6A7wrKGKLCG+tqoMlfJhJq1OyjOiGkEmkZJ54nLNoqcA9HLpa+cJ+V9cWVrEUXX2bof6IcRDt0wp8gZUP23oXnqdExAi0iWSAGI35vKQM0krs3mSs/xylJJAfhnysy4AzI1UapLCi82aFnQrookovbA8HafvGJD7/d3g1vGOXypr/2E4FrCZ0BuaUwYuZmshwJKNsa3wFbzhVmO9VS5+UlAnmzt5eGVgg6ztYaEloRcCPhUvi8qXkTvwYSucLOVBzQESnVMWCItd+OgpuM+U9Ap0aqHgSghuRXu0QJREVaUkqv9kAoX4NqMdjsnzoxPWXEOSJZIc9o3FiIXIXp5Kerh2uX92dUcnqpjBlWI4BW4mtMUqsQ==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IaVzik18MkJQ5NGnJ9TyU10PXSvKV4BLtS3knQ6Y5IPcdYBtfkebZY+hrM2bbupVa+YevKGwBfhKnihsFUVjlOV7GAlMtuKZjUVPRcrprS5l3zlLjoabxRCC1p8ZyYj9Is0+XNtWap25dGwVEoR+AbLHLo2Nk8JHQYSa8RiAfiD2xA+vktBHwdkmRG2Sz+U7gKK9LwVbCs0SRl/mfnGZXDc5Gr+eg/6+Kyoyye3a/Eq+s7r8FgUF/PJ5GK9jA1MwjOXttTNOGAeoDjyDKzs7FQMYIAVG3ADR4HM2TUaOuVB9PxVXhE2vf5cvjky4uFeQIb9aZBwjgCmOgDuAn3HfbvR9lKARixA8ttQ+sDX+sAYA9X/+L5/AVAptbyDhV8eRcRxjNMAV/wJm5RIgHTSmiTPnFnKJbtHkn7E3Qmlq5vvGYly6NmCDkQgJKK1fnoux
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 19:43:05.8661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90faed4f-bbc6-4a6b-794d-08de74a61892
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6373
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhiw@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D93F619CDB2
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 22:41:48 +0900
Eliot Courtney <ecourtney@nvidia.com> wrote:

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> Fix some inaccuracies / old doc comments.
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs
> b/drivers/gpu/nova-core/gsp/cmdq.rs index 436d1ff20705..cfae5b35adec
> 100644 --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -528,6 +528,7 @@ fn notify_gsp(bar: &Bar0) {
>      ///
>      /// # Errors
>      ///
> +    /// - `EMSGSIZE` if the command exceeds the maximum queue
> element size. /// - `ETIMEDOUT` if space does not become available
> within the timeout. /// - `EIO` if the variable payload requested by
> the command has not been entirely ///   written to by its
> [`CommandToGsp::init_variable_payload`] method. @@ -710,22 +711,20 @@
> fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> { 
>      /// Receive a message from the GSP.
>      ///
> -    /// `init` is a closure tasked with processing the message. It
> receives a reference to the
> -    /// message in the message queue, and a [`SBufferIter`] pointing
> to its variable-length
> -    /// payload, if any.
> +    /// The expected message type is specified using the `M` generic
> parameter. If the pending
> +    /// message has a different function code, `ERANGE` is returned
> and the message is consumed. ///
> -    /// The expected message is specified using the `M` generic
> parameter. If the pending message
> -    /// is different, `EAGAIN` is returned and the unexpected
> message is dropped.
> -    ///
> -    /// This design is by no means final, but it is simple and will
> let us go through GSP
> -    /// initialization.
> +    /// The read pointer is always advanced past the message,
> regardless of whether it matched. ///
>      /// # Errors
>      ///
>      /// - `ETIMEDOUT` if `timeout` has elapsed before any message
> becomes available. /// - `EIO` if there was some inconsistency (e.g.
> message shorter than advertised) on the ///   message queue.
> -    /// - `EINVAL` if the function of the message was unrecognized.
> +    /// - `EINVAL` if the function code of the message was not
> recognized.
> +    /// - `ERANGE` if the message had a recognized but non-matching
> function code.
> +    ///
> +    /// Error codes returned by [`MessageFromGsp::read`] are
> propagated as-is. pub(crate) fn receive_msg<M: MessageFromGsp>(&mut
> self, timeout: Delta) -> Result<M> where
>          // This allows all error types, including `Infallible`, to
> be used for `M::InitError`.
> 

