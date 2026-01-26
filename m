Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBhPHn0fd2ntcQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:02:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8330853A6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A38B10E3B6;
	Mon, 26 Jan 2026 08:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zrv1rhxe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA7910E3B6;
 Mon, 26 Jan 2026 08:02:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exhEp0ePBEkh8EPSeXU8a1Gee6yRYNrOI0ZYujKPKn2W6/dG63DaxIlO+a5qRWZGkyu7xvMA3k+g9rgmENCPPqZreg0ITGw7IqJyB11D2lXaaot2zDrj+t7ICA7qxu3UxpjLtqCJVmxNra8NP4Ye5hfl19bitZKfmltVJhSOh2G5/Z/QD0D73T5XXRkQUOB2kbilA9p2qU8gF+hwFq5MWQiurA8N/oVN9tNjxe2C6nG64oHVv1lkskyqNGbT06hDshVUWRzBQUYW6mLBSkJpoSpJI6ML8iZ4+9peoqdfAEJ4UH2GP6W4jfv6ojj5/2/eP3ZOq70ZERVHgmXvi7wYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5q9Ccxgpdo0Juhdt7t1oUktC72zh5N4eTzTVyV7Cwic=;
 b=tpoHG9EaDN5/wDIh30lTAnyLKzvnfzAhhJwmiqO6SOBvcrNVRA9kR+1x6iHtpcBj1sg8W5dy2aEw87AjLpeSraFlnMeaeCCx9RcTx64WiBvUs8Yo3/LZfWRkiQGn/xZQgdlh9r8WXcKJeLSuzo2Mk4w+c9QdSuOAJVtgQNOejiDN4Pm3o84bHFYojyEvPdh4KqU7vrk2B2TIg7Fp2eppGDI4O66sQxq4zysqx4xqc660VmdrS9lc1vYwgrOM71BHG7qDTvUs0tw8l0d4naeb0B5dydu510PFE3ynStDolA+MD3hGjhASYCNaTSdk7EghO/MC4Dv/cllRp+5gREv4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5q9Ccxgpdo0Juhdt7t1oUktC72zh5N4eTzTVyV7Cwic=;
 b=Zrv1rhxeodIoJstqTowaIfF1+IolZmnEjjAl0B8BX/Iyxi/X6gFhOIX5NFNMcZd8NqR6oc4YezWu4srUIIEHla119sbyc4Eym4nvAPm9Ebt/Ov5hLuqlNrrU87RraWmyKuPxMbYhQGF+tl9lMC7wxzQiHFcjx5uMx0IsFZ3/t+x1zku3dK3W/+TNHfe7Q1bmGjCO57jQIGrLEzShv1Jn3wMQXzMWorr4SgG4AjAU9WTL2H4DCK6wA3kXqr5XnMGj4hTwlTEwdNpye5rQgKMo35Iwkd9uzF9Xpxjo7ab8kzaDQDD+vTKRP2HSu2HuptV154oL5pidrOqA+R52GZWr0w==
Received: from IA4P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::15)
 by CY3PR12MB9679.namprd12.prod.outlook.com (2603:10b6:930:100::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 08:01:58 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:559:cafe::f6) by IA4P221CA0012.outlook.office365.com
 (2603:10b6:208:559::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 08:01:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 08:01:57 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 00:01:39 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 00:01:39 -0800
Received: from inno-thin-client (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport;
 Mon, 26 Jan 2026 00:01:33 -0800
Date: Mon, 26 Jan 2026 10:01:32 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Paul
 Walmsley" <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Alistair Popple
 <apopple@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, "=?UTF-8?B?QmrDtnJu?=
 Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 5/5] gpu: nova-core: use checked arithmetic in RISC-V
 firmware parsing
Message-ID: <20260126100132.7e566316.zhiw@nvidia.com>
In-Reply-To: <20260124231830.3088323-6-joelagnelf@nvidia.com>
References: <20260124231830.3088323-1-joelagnelf@nvidia.com>
 <20260124231830.3088323-6-joelagnelf@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|CY3PR12MB9679:EE_
X-MS-Office365-Filtering-Correlation-Id: dcedacaa-883f-4516-ceb2-08de5cb12dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xp6B+qQ7yUUCWZef9q2UHGpBWVhOvjAMjz5+44asT2Y275GnAuqUbGSk/7Zl?=
 =?us-ascii?Q?eDeWJdld2zsOCUhywaoE7gj28GZ0+TGREsS8+8fRpN79tGOsJfu5RiH4u0Lb?=
 =?us-ascii?Q?vIDdfpfu6BVyDZgKfSOP/7bEu2FlmM2num40TB5rv8rnQXwkelRrNvvO1bwP?=
 =?us-ascii?Q?WUsjJXz9yu1V5kjetznsasv41WjvKk7FDf2rUW28AhgIJw0ll81GrDYHrrjy?=
 =?us-ascii?Q?vO3oCwsV0okb+kJKUmMnAUOHzTtW2IlTDGcZe+2hWxaKDGgTyB6piibo5FL0?=
 =?us-ascii?Q?0uDfdsitnH+o7TBB5j/korUZOCX5yjWCH4g/w1yxpXVWPSFRrkeKPPweH/kk?=
 =?us-ascii?Q?4+iSVlD0sXTyFBRGHRMyMcuhJqnU0tc+5ROLeaPQuDNVnmaCUC4jZob3UL54?=
 =?us-ascii?Q?AxkOzxd5xd81EK4r2IegV5560ouI7kv5wa4xHx4FobwLfneGR09qjlLoNzGn?=
 =?us-ascii?Q?0LmiPAjpQGvlllVG3KRB1OE3a0r48qfLlIA8sFjKdrLZRrcGdpDK6we2k9FV?=
 =?us-ascii?Q?hkU9niZhNLC/IwV8RhZcdZ61BhjFVA4zdrC+uRfMWIiMN7KWaIGeEqfvIIsX?=
 =?us-ascii?Q?JcisshlGZWS+goSO1dUorRT3xQb3v+yn5T6gX34I10IBWFZ8hgFlMYDFDdDR?=
 =?us-ascii?Q?ImC0X2/BjWMaaHEpj7l4SbRtaYbP8jQ2sbtrRnxZ4dOQeavTQlLSBuSotcTn?=
 =?us-ascii?Q?dNIr4SBNbqi3nR1RcXTCUO0+ah4xSj26yQdSdr2zkHFYbB9fLONC8+wPUERj?=
 =?us-ascii?Q?wc1xZuA3U7mI4aQ+bvkyqi+zuKYlZYSUtgBzKHNJm71UITgBdyUiaCSMqD0I?=
 =?us-ascii?Q?OM5IJ4LXzl6sIB7UDGMmU1GqapecG+zDb2707I88TTB6k9ZQjnfFumsOVVeP?=
 =?us-ascii?Q?FOjyyzA74Hf/7eRqH1kLZj3TgrvD4qlCYgpTIrbf1vWaZA9sKEhpo/tb4MHe?=
 =?us-ascii?Q?x3AkzkE8LU9lhVvSQivq3eWtHBYl8FLGEmzYJXt3GUBN+7ZuqB2bK47lQbYL?=
 =?us-ascii?Q?Ktf32oYazl9jcRDzpQJwPPPdk3c0SeqfhE8htNvL05oF44xA9GSIA/HBCc20?=
 =?us-ascii?Q?R73m53x4SLsnbu6KSTRABSLfSYiFt/SYQNXSocOo0EZtVhNpD6dReUli+4VK?=
 =?us-ascii?Q?kcq4EnT3rHRK2VuvSX+KAdyPSjA5rNddHCL3xwG7TGAbiIfY9gp1NuulhILq?=
 =?us-ascii?Q?zzI18zLTXeLkEtuHY7Gcyk0JSPjjdj82w7npT6bUHbeXbJYePvRf8ojfQafM?=
 =?us-ascii?Q?qzTuLh59XB2yq2LO1zarSv2EKwd9Mapo4cTrIm04+PZow/W7dpDe3Cj0HUnG?=
 =?us-ascii?Q?ff1XC/jFFobIZcFtk2BJrSreLsbBifACxWKLNPmcnyausOOtboPbiOEck6BF?=
 =?us-ascii?Q?fpSSG57QIW2Ps0o/Gd7R59o/+olaBPxNM3ixpbczodsTUjeRv8QY8cGXhaXh?=
 =?us-ascii?Q?44AA620QDfX1ZNAMis1cJ/oehK54khXhCj2LmeaN3RTYMOQTOK23syHUPGi2?=
 =?us-ascii?Q?S9gHd40PCtCsH4M4vygjR2AJNjYLdthVxR10vyAE8FsX2jF3sXgtO+O7W5JF?=
 =?us-ascii?Q?Rs7udI3WOiNpX7lBS2658gsE8oERECsN9p1+bSBUFRASE+Lh4ghOgEjKB2ZG?=
 =?us-ascii?Q?usEhKFZkoNdqqpblLp43d2miw5RkCRcCw6WlhMTApDuUNVCAMQEik2Vq3BKZ?=
 =?us-ascii?Q?B9rcWQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 08:01:57.7818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcedacaa-883f-4516-ceb2-08de5cb12dbe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9679
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch,dabbelt.com,eecs.berkeley.edu,ghiti.fr,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhiw@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D8330853A6
X-Rspamd-Action: no action

On Sat, 24 Jan 2026 18:18:30 -0500
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> Use checked_add() when computing offsets from firmware-provided values
> in the RISC-V firmware parsing code. These values come from the BinHdr
> structure parsed from the firmware file header.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/riscv.rs | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware/riscv.rs
> b/drivers/gpu/nova-core/firmware/riscv.rs index
> 28dfef63657a..97030bdd9991 100644 ---
> a/drivers/gpu/nova-core/firmware/riscv.rs +++
> b/drivers/gpu/nova-core/firmware/riscv.rs @@ -47,10 +47,11 @@ impl
> RmRiscvUCodeDesc { /// Fails if the header pointed at by `bin_fw` is not
> within the bounds of the firmware image. fn new(bin_fw:
> &BinFirmware<'_>) -> Result<Self> { let offset =
> usize::from_safe_cast(bin_fw.hdr.header_offset);
> +        let end = offset.checked_add(size_of::<Self>()).ok_or(EINVAL)?;
>  
>          bin_fw
>              .fw
> -            .get(offset..offset + size_of::<Self>())
> +            .get(offset..end)
>              .and_then(Self::from_bytes_copy)
>              .ok_or(EINVAL)
>      }
> @@ -80,8 +81,9 @@ pub(crate) fn new(dev: &device::Device<device::Bound>,
> fw: &Firmware) -> Result< let ucode = {
>              let start = usize::from_safe_cast(bin_fw.hdr.data_offset);
>              let len = usize::from_safe_cast(bin_fw.hdr.data_size);
> +            let end = start.checked_add(len).ok_or(EINVAL)?;
>  
> -            DmaObject::from_data(dev, fw.data().get(start..start +
> len).ok_or(EINVAL)?)?
> +            DmaObject::from_data(dev,
> fw.data().get(start..end).ok_or(EINVAL)?)? };
>  
>          Ok(Self {

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
