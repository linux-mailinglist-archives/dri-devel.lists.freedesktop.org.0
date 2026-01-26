Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL39F1ofd2ntcQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:01:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57E785387
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB0710E3B4;
	Mon, 26 Jan 2026 08:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fZppHxII";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012061.outbound.protection.outlook.com
 [40.93.195.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C773B10E3B4;
 Mon, 26 Jan 2026 08:01:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P040wZUGTKiath8iDRKxgQZhB7nmeR4cPu64VPw9s2Bi2esu3z0J08btER2Y3c7v9byDs/hRLi2B4Mk7OHSZAvS8LO8aQCtFc5NQqw3G1/lIn0KvFGCfJmP5aXMymxTEVe4xpxrWlC0Oc9/+CaCGIj1h95muXK3W4zZD2oK5Br3GzHFhn8r2ppDXsyS1NKZAROiQeHC3LIA/VslDNxRxY1oH9RNhV+ok0RCIOpcz8a3wSXfAkSp6deB7egvoAH4Rle2VTQWgNo8LWgQIH4TexV0iZ4KCpbowbRz6tAfqDRpk/JH/NbjnqpKeha5KNrqZVV+iHIQ1/WPsO29O8UOlAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02hEdgefenIji/s22rcGcymB0W68O3PM7mj75fROR78=;
 b=AhN1rXL6N3iKHlyxOneo0kqqG5GgIY5jFJXpS5yIY+PyTS02S0JhM7G6oqWpcDd2gRD7vM+62KMdxXKnFiVa1OdX+gtLWSRId61LQTbsjbr/mY8Kk29OrdqQb1/Gg5RXRUNq8yepDXDqSK6s7iFGvZxzMnRqoQ1MYA3ZkVH/gbN3A5A5396+/lpq+X6vPyoqU/Jr9sj2JIo1PFygavSGow3fEg9joJC/BgSyih+rlltgNhFTTBQdShC+1V17XXIl67qM/mz2R3MuPtktWCTxIgDrQ8uENQmkZThfIsC5S5Cd3b5uOrgLTDC44TPZjpaRoouf9C7f8lc9roKiLJjoXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02hEdgefenIji/s22rcGcymB0W68O3PM7mj75fROR78=;
 b=fZppHxIIH5CX152rIMjG32gpsYottVmZzmlAjliQCtWw3pcjeMxgn05Gc+dQ+uGktSsjrKQkRo+bl86ZwJpQBDP/594Hu6A4rKK0RQV/UW1v6oA3T4fGgBRpaxkwZSADoOIw8OLCVQOFsgg7gjz+m7yozwOBnMLPJk4SeuIYNP/q4Xj1vJlb4PaSEB9l6FkuL1SXBgfhw2Vl88TveYVU0aMJ9B4ntfS8bdJEBVlNQ6HwpEcYd5GjOLgounq4dyUEltZMJ2AJwfx3aauEDvVgHfu7t+tNnJUULjuueml1pB6GFtSMq5QzFhjJ5QeV6s9n1Irmb+wKpSeXFT4Z3tdciA==
Received: from BYAPR02CA0005.namprd02.prod.outlook.com (2603:10b6:a02:ee::18)
 by DS0PR12MB8318.namprd12.prod.outlook.com (2603:10b6:8:f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 08:01:23 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::8) by BYAPR02CA0005.outlook.office365.com
 (2603:10b6:a02:ee::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.15 via Frontend Transport; Mon,
 26 Jan 2026 08:01:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 08:01:22 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 00:01:13 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 26 Jan 2026 00:01:13 -0800
Received: from inno-thin-client (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 26 Jan 2026 00:01:08 -0800
Date: Mon, 26 Jan 2026 10:01:08 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Alistair
 Popple" <apopple@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, "=?UTF-8?B?QmrDtnJu?=
 Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v1 4/5] gpu: nova-core: use checked arithmetic in
 BinFirmware::data
Message-ID: <20260126100108.7f65d262.zhiw@nvidia.com>
In-Reply-To: <20260124231830.3088323-5-joelagnelf@nvidia.com>
References: <20260124231830.3088323-1-joelagnelf@nvidia.com>
 <20260124231830.3088323-5-joelagnelf@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|DS0PR12MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a02f6a-7ad2-4d30-d2a5-08de5cb118d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sbk42pyTRMbmFc9ITSLc0rK0eDAiG5llSvU2Hg1A3FlffT1/A17fFVefSIeT?=
 =?us-ascii?Q?0IIL0Q/E7SqOFiI7DCAZQV9tBAoSr0mdyv992iSiCBYQWkEW2EmHkPUYTHGB?=
 =?us-ascii?Q?Q64+w1eG8uWKNY4sHeTEh2q1qzmXppB0hxRTbohJMplB2jhrQBXdbejOx5vN?=
 =?us-ascii?Q?O6EYIoUAVez778cg1hIqEVie1bp5GQzRqcT4PniVCn4OEmtvACG3OKiiJYZ5?=
 =?us-ascii?Q?B7omAaDoAx+1kSUa28dz0Q6kx+kIv5f6U/js/2pKgeTobdWIAWHnSuB66xia?=
 =?us-ascii?Q?FsauX4pI9UNLHLPxMKyaodq9flHoAyEHx9rzl/07ibj+TcJA+hEWjdFju5jp?=
 =?us-ascii?Q?TPrpwL/2Tvz2ahCLvnCki72SpKUq0Rfhk5FRooA8bHW91L0HUrN6RJgXhK0a?=
 =?us-ascii?Q?mzRgIBH6S932eusAMv1ZFFVKDtqDF1uAHC4fU6KpjUR+zrWffUv+vYXnMc25?=
 =?us-ascii?Q?AHAdGK+cLPJ302a2AW0qJB26ArIDKN3fC7efr91LoL/6DQ6UIOVWV95UoKx7?=
 =?us-ascii?Q?uguS+8nHOV9ZMwTreZVLJWPTVyYFXePLrU+9SzZOm6dpDZwTr+LbhQfD0NaH?=
 =?us-ascii?Q?UBABHr52kPpkF7R63jpEoO/oYoLqwFpwXeQ/OQzDHo7pE+nb+6X2nW1FsdDf?=
 =?us-ascii?Q?GeD/lErE2gP7CYIZ8R5rq+fcmaSpsMJ6D+8laGePePQhg8uaQKVAR6wA6XPj?=
 =?us-ascii?Q?/EXMh28A/YjwmYvzgtC4Y8j739h3hKnpRsmMH44L6nubUdRNTpABn5r8aaGz?=
 =?us-ascii?Q?2o4rPh0KDSSIHjNF8BHZc9e0yJjnMYqNNc2zReli0QMrtgfpHTDSQi7N7Xml?=
 =?us-ascii?Q?fI7o19pap00M6f1MZ685eNxITpIYtdDvzKsFE5wc/HUdqOH2HyNyhEW4+2Ry?=
 =?us-ascii?Q?4291ZzLmY7Qbn2naeJ8URKXSvMngzsWcfr58OWp0Dbihm4PrccdydDujEakb?=
 =?us-ascii?Q?+CpeghNiuuvqtn7c/Qz8IIdAQB+5oq1fJiv4kDrueGRyEKfUtessko8cbevz?=
 =?us-ascii?Q?dkCYqnLo8WoTGESnRRmd2IC8rWRd7XOZrN264SF+x579GXH3arcl4SvjgH/a?=
 =?us-ascii?Q?gfexQgWVqD7i5ca65bglfLODBN5PQt8xMAKS1v9g5TzxL2c/zuqVRUx+5cmk?=
 =?us-ascii?Q?I4zUZ21kSx/8oEFmYMOnJGLwWwIuFXpTJxp2aZzvVZcCZxVh17SGjAsnRSLC?=
 =?us-ascii?Q?RihiZV5KacicY+O9oU2vLx887l+BwCDVNSYrThBocmuPwLKmmaDVkeeTsvx1?=
 =?us-ascii?Q?xdH3QA3tgB9zE8AkOWAANbZD3yqozttAoyetvLiSVSTHx3BL57YkWGWW9B7q?=
 =?us-ascii?Q?v9UPLmVZ5l3D2zNkwPpRe/9PKPHeMhynsHz7xDOIF/3glRhBPnM6NLVvq7RS?=
 =?us-ascii?Q?2s8iou7CvhRhrPYE2LSV4n9WyHvB0ciSviqF0nMQHulyWstoUyHedPdodK8V?=
 =?us-ascii?Q?mBY0bGukPodpGC9aC9eSKNaZ8ysM3mehm/tAIObP3mVC/NIB9Abmyb5SIDWx?=
 =?us-ascii?Q?gOi9P/h0IbG03zhtsKw9vDrVD0Fu6/tc2CneaG1eL7A1Fy2d2UpIuopB2Iie?=
 =?us-ascii?Q?OasQ9v5xbMVIUXG7559Vlhuh5yW6f9bmmEGlZebrEZYlFWjhFXpbn+8z7+xj?=
 =?us-ascii?Q?5HVd6Nez9LH7VHFy+SLZvukknbwGpEBeeAWMR3l0xJBzWFHD95vw4D76ayeE?=
 =?us-ascii?Q?KkXF/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 08:01:22.8601 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a02f6a-7ad2-4d30-d2a5-08de5cb118d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8318
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
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
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
X-Rspamd-Queue-Id: D57E785387
X-Rspamd-Action: no action

On Sat, 24 Jan 2026 18:18:29 -0500
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> Use checked_add() when computing the firmware data end offset in the
> BinFirmware::data() method. The data_offset and data_size fields come
> from the BinHdr structure parsed from the firmware file header.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware.rs
> b/drivers/gpu/nova-core/firmware.rs index 68779540aa28..4f57a270e142
> 100644 --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -394,8 +394,9 @@ fn new(fw: &'a firmware::Firmware) -> Result<Self> {
>      fn data(&self) -> Option<&[u8]> {
>          let fw_start = usize::from_safe_cast(self.hdr.data_offset);
>          let fw_size = usize::from_safe_cast(self.hdr.data_size);
> +        let fw_end = fw_start.checked_add(fw_size)?;
>  
> -        self.fw.get(fw_start..fw_start + fw_size)
> +        self.fw.get(fw_start..fw_end)
>      }
>  }
>  

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
