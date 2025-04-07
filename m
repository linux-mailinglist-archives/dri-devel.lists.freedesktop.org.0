Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD66A7EBF8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 21:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABF010E548;
	Mon,  7 Apr 2025 19:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="eSQ9Q41/";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pp2Gs1Fn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8400810E3FB;
 Mon,  7 Apr 2025 19:05:47 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537H0jMA003449;
 Mon, 7 Apr 2025 19:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=B3WCo0q+e1sxnY7xin
 uIe1QGKqyrop7GNjHs0bt+yjA=; b=eSQ9Q41/EE2YxVePb7zs0bwZmcXmHu6Pwh
 lmZC2ef5BSTMDJe5v5YNQi1vChelCphJbZOXqy/u3cIx9aXal1giv4kysqDjSvr5
 R7F+u3DHeQHndX8bPP1ZHG18iBKeWHiv+Oz3/n1CiyD3hpGc5ouHg6uWsOyPQSqe
 dSXmXpem2kwuNzcJWuz3ftMLqe8lEXfWnSBugeSg78nt5fhhomeUTqtdhmp2IBQn
 Le8HojtPNQ/cS0+qr/29wI0FgyPsfaPUNNMoBCYo4iqhH4XX/ownWDwSplXKtn59
 DglxgbBRmhvAR2oPVixk07yDIbKlBW33ED7F0JE5S8Vdp1/PGk/g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tv4sub8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Apr 2025 19:05:27 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 537HUjQm013671; Mon, 7 Apr 2025 19:05:26 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 45ttyeh555-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Apr 2025 19:05:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UITh9u0E1Of7pFV9fjsw39mBpn41swxTTjW72x50MxvOS7fZcX5MW+ZxlUnMDhzPxzmN2h64zgZ8uVMlBKpCA+XCfp4Ouoiqq2uW/WSDUVzWTDHTCQ6OEkPVlxWler3ZcmxfaLPzySLzdnRt6yWm8zGxC6tJCHKRhcqwElYYtSOyNFGjrbBWqfXFweAJMEMmZu4hzqEWYh06sboU+ytOKYdUmtrlB9dp7pc+gbpPI7+rYFEsFH7vH4UDEI3a/ILein5ac3RlrXO3fEYsHLtGiv/KIMw1j9nqkPpDxDrBvEfaHSpFGZd0yAY439ztSngVFyjvTyillEIiPlXn05nu9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3WCo0q+e1sxnY7xinuIe1QGKqyrop7GNjHs0bt+yjA=;
 b=R+JyRHM5TDq75+e1uOVF3u8jjKUtRjAi+vpNsRKuCCkVd6JwHKgGOV8MGiCnW8J3T3AuOu73YLevjk7dhk43DARh6xXFglgsfFrG4o3z0Wh6zYJloDDhapG8wPyv3hmo9mbRVrfTQA1HhS0oRmHoFax+UXmkBHcJ1PJ9l9xO5UsHiYhpqnlP96RS2zidU26rzpqPA3/nUI32NhIg0LDKJtVrW4eVbdZciuvHchpVp5+ADC5tKyGjhREKkHurwWWVcGqV8JpNx2mNSZRU1JGhNoPwBFUIp/DbgwAeeMpQQjhGL2aIsOT6guUgbu6xiWh0sGMYkDgdNFrcgcLJA5hpnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3WCo0q+e1sxnY7xinuIe1QGKqyrop7GNjHs0bt+yjA=;
 b=pp2Gs1Fn39D3+4xa4asCOqKaui2Tt+hQueaq4wbVwxBwm1hTcmcrN42Hs4t31GYnTdcmPeS88Svw6NVyKWQFd+ymjyY6qKvSXhRy4diYl15ApiKZuTm80AjHQuVp3XwZUPIhfBypDgKUuChHxxY1DexGwKN3BqCVp8lsDjR5lsM=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CH3PR10MB7807.namprd10.prod.outlook.com (2603:10b6:610:1bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 19:05:22 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%3]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 19:05:22 +0000
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Carl Vanderlip
 <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>, Takashi
 Sakamoto <o-takashi@sakamocchi.jp>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Dave Airlie <airlied@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Xinliang Liu
 <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, Xinwei
 Kong <kong.kongxinwei@hisilicon.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, John
 Stultz <jstultz@google.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Zack Rusin <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Saurav
 Kashyap <skashyap@marvell.com>, Javed Hasan <jhasan@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Nilesh Javali <njavali@marvell.com>,
 Manish Rangankar <mrangankar@marvell.com>, Alex Williamson
 <alex.williamson@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Lijo Lazar <lijo.lazar@amd.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-scsi@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [RFC] PCI: add CONFIG_MMU dependency
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250407104025.3421624-1-arnd@kernel.org> (Arnd Bergmann's
 message of "Mon, 7 Apr 2025 12:38:14 +0200")
Organization: Oracle Corporation
Message-ID: <yq14iyzsshv.fsf@ca-mkp.ca.oracle.com>
References: <20250407104025.3421624-1-arnd@kernel.org>
Date: Mon, 07 Apr 2025 15:05:20 -0400
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0424.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::9) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CH3PR10MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: d8924944-39ce-4ae5-8c0e-08dd7607256a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eBONaVh8QtxCQ1WlqX7mmGus6c8vZ2U6wWoatXIuyNr29pZJUVcbItvoiZZv?=
 =?us-ascii?Q?oJpmUY0Fa3Dea3IxP+nFpOsxnoZdMLBr5DOW9qQduHpKE6en9YemKsRnZnjc?=
 =?us-ascii?Q?AIgVxbx//7w9/vkMzeQtnVkDb1k0yOqGIsG+5+jSvkTTObPFvZC4p78dlyq0?=
 =?us-ascii?Q?avOBhBZLliVfBqMwBnSZRUQUWi0ZjBT9Abjqo/7b3nIyg3FQRT8LMLE5co9F?=
 =?us-ascii?Q?5wWPfa29wb1huBknUDtj1/iRtQRq8FVjMZBghVHUwQnbnPAKzxZL5GRgPnVs?=
 =?us-ascii?Q?dLQYz8fZ+Vf0qik3YXn7rAL6kHOgh3bVxHKH6nR4PvCI8yzHDDYmEsgTcjRl?=
 =?us-ascii?Q?qTtlyD+4xZwuYH7+rSCqCVzezNccELN2dtSziA3g69//VWdVcM4hDHpG2Sx6?=
 =?us-ascii?Q?jNkT1n5l7nIfZ0W++3WCvLVjAzNZLZDhUOJyGET5i9nQkBo4/UVlJF12m+WO?=
 =?us-ascii?Q?1ZJ0z0VVQnUVoG5QEBF4CvlwwylaPQfVR2zCLwatk/opms6tdvWmxj45L0yg?=
 =?us-ascii?Q?IpXFyYSafWWtTkC9zw9cvwjZMLSjElSGChy8I/mdO7PTwwftfCafRUFu7vLm?=
 =?us-ascii?Q?JwIBqbgJRFxfKh2elP81s4wcu8vb7nenbj4L0dR5aODfzeWFc+AJSQEpQl0/?=
 =?us-ascii?Q?Hlc7BehJlm7a3qTdxpuS9hY6Mjb0Ug0IpZ+MtU/H3ZQBYOv/RCEiAlwS1kbD?=
 =?us-ascii?Q?pLJK6AAveObSYKWwKVMIGuS5FzvC12vWgamWxNfStkpFDBAaVV+SlRyXFaF/?=
 =?us-ascii?Q?cOUWQg1PQzkkr34uHjAfkTrq4uLR//KsytOIRP6t543gUX1kAatGjJwdPyUq?=
 =?us-ascii?Q?AAfZmxd2oZXa79dhPPv1CuVGtg8z7qi1/ds22dJjgKCHyr5xAt+tqzOCmKoq?=
 =?us-ascii?Q?zjmKh65q4fK9rzqVAF5BY+WqtlHWBVwhabW7lLGTWAiReHxPCJB4Nk3o6XKr?=
 =?us-ascii?Q?l3kCMP7gUvzGImXFoQ+n79IEZPMq6mtHfcV7ebn6k0B9ariQbkU47vjD1XeA?=
 =?us-ascii?Q?jtlZQiROa+0ECtxBg84bXmhqKMa22VUcSDuDktDA1sTgUGZvyfeVW6HWKVqU?=
 =?us-ascii?Q?4nraP7ZDKtD1PSveuEeMc7s3SZYvWlS6fdGVDYbqpnpgCBTIzBjpvV50f0iI?=
 =?us-ascii?Q?k6y8CNHcWT0WSb2GfW+cHrZfnmIpX3MXmza+D78oBzYszOa+J7Ezg8oRdWzL?=
 =?us-ascii?Q?04IgXV/SDBCR1qg1GjaTexT2hfBuRIN2bUZKcOcQ1pOoj7Aaigz+Iy6R60R9?=
 =?us-ascii?Q?jcHfyLOtlgUqoA0h+4j4sPCtyiXbs+FRPiHWOlMk3dtheSKh9uYyrLbrg2Xo?=
 =?us-ascii?Q?0Qj48/Jt7td4N7UGVAqrzKo/i92NQngw8GBwKmDDKbreNCsgrQT8mKc35xqp?=
 =?us-ascii?Q?rG70DeaQ4alikFDIvxMO6DDoQCSz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR10MB5338.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j+SyJhzzhA7/YOkWe9T094AU9tKsT76juiZbzA5IzFCaZDwMEOo+iwl4/bfe?=
 =?us-ascii?Q?Tb6NIuJIZ2Jq3y0sggWA6de01FJabiBkZNg0rkpHx+EllqTR1viZ4nP2mo9H?=
 =?us-ascii?Q?+UXMMpTSkzdDDtlDFIWKwkiCsGiY8+AbY/q3r/936ycSgbkloFFkZRGbrsCl?=
 =?us-ascii?Q?Pjp80+djDPcHdrSxQGnlWJ8XIM6M0IwQ1OMiP9yUWAoL2/WOr/1Z90FQi//B?=
 =?us-ascii?Q?VJHWLvtrWcS2UfnhXv12g6cD3XkCp3DIlU6BDvOLd/caH/Fq4bEUvjcUNdSz?=
 =?us-ascii?Q?jOwhETwIehX5yCI3kTRm18v/yW7uMVnoQGACC/l9yUXoxPrAOk7ybu6BrS/J?=
 =?us-ascii?Q?5CKsJ//LIYKz5mPuDGCUqjXnJCnQbdES+iiV9qy7mXxO8aUAD2MAAUwfoM1l?=
 =?us-ascii?Q?iEvGHknofN9iFgytE7A4ZohgLiN640tfJxGgnOE/oyJUTz12lZKtettVo5YY?=
 =?us-ascii?Q?t458VoKDwPp62FDioVR+dPcovBT+LF92MfcbP24MUx6CCjaGO409b2lc3CPO?=
 =?us-ascii?Q?qSzJcR5NBf4gMAk+TvNSMsw8eaTSmJ6QWvDsaGil47gMZlKWsXAlwXBlU0OZ?=
 =?us-ascii?Q?z7foTq+ikLWhMU+l0G356AHtaL3KJWYLzCL3ohhAkKw6I8O0qd8UI4qyRLuE?=
 =?us-ascii?Q?eV9XzBvDFeHWBMKlnrY/3cDlyjTlqpTj5dFVOXISZWcD5wO2IhEZ4mUZrVK+?=
 =?us-ascii?Q?etxUJ2AxZqL0+O8lxgygrdVcTfkCC6lMJgv3WYId30OmTI1seioFfOsuouu1?=
 =?us-ascii?Q?M9+Xh4EVWc4nAPjzAAEUTbZwg63IKQZ3djCSSxDijb7ajSdHLSz9roVy60Bc?=
 =?us-ascii?Q?iujPRWl4mGk6kLWi4ZImqOHx7UmHe0L1yIzVGXuJpYTin0PNUa3ODmhUt3pC?=
 =?us-ascii?Q?VK9S5pO3kQYOJACphXAAjJYm25ZeF5uBht5FnJFBjL/Te34OUK6wAMU/DAxn?=
 =?us-ascii?Q?ORzL5Fy5Ca/flsCUQ/c0XZq28cI6orWcQpAIQMFC/6sFbVOhcdOqU6dzKxL/?=
 =?us-ascii?Q?eR82ezYw5V9pzPJQWJWQj4lLmS2umF5317Ib8orsYP7G+MuRaooCU74NWuuE?=
 =?us-ascii?Q?Bq/MX6qCZqyBj0wAnjOgtwnOg979Xv8mefygcXB7wGZUwWp6HFKeoGId5E3l?=
 =?us-ascii?Q?GsT1PTo4iDmBvNdA/vSV06uA4u0KSihfltaNnlY5/cuqXeLD4qCwHkjPPOIH?=
 =?us-ascii?Q?CKOzofJboWX0yUF+A6XU5LfWF3YiU/QhlTnQrWoX4xoeBUOQwAL5dQSdgp38?=
 =?us-ascii?Q?3J8v/ISPl3MYmC16D9A1FQ7C9G8rfEDSFTpKRXo+2DG3T8HR0Ys3Z6lRgfxw?=
 =?us-ascii?Q?T2Ai9Fqu1ppBg33zrBF2HKynG7Yju2Z1EKyuO/dkEsNtiVe7u4Ai6OQEVM7x?=
 =?us-ascii?Q?/dus6YqKY1joXibJWpiNNifrTHQwinFK4QkULK14nDylKZcLwuQRNUc0ItI8?=
 =?us-ascii?Q?9D4CYYClFmZcOiqNzakSPaDBnp7K4EsHip6xO3YY3vuu1zcLla6XSqCBeQ04?=
 =?us-ascii?Q?T5jXfVZQB1VLqsGHHz0e7OifhRvxxee5cpR5tO4AoJeDKE5jHDYKJqt1+AZx?=
 =?us-ascii?Q?1lWy7tTJ/BRVuU7EoqobKf1z62LixbgH/H4G/lnOFKutVxG5yCr8O2G1QnN4?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: yuenlQ07brVYh9e4uU4+HSRUBZ4n8g9qUM5U4dPcIOwwHs1JYxywFVTUQA91/sRkazedm7CJ7BWlVFwxKuKPumkT1aOco4Cn9pVh8TmQTRXWdnJE2OEivMvKcrv6/A0ilob80NHBfc+19kqsGOJLXy/4ztBVgL6UVpGiizNvwuEESXMqxMtWGl9L4ZV/icim/e/VfDQNNeDfbDOf9isCFf9p30+Inq09uuXJct61OEQWi/7SUavVZrRY9130zd+DhYC9adqezpPQAnzrMlo6Cbi2/ZzVIE4D1VXSF3Tvd8oCG5B772MJv070TsEI9X2UZ+xQvmgHM79uoaRABDNy4PDpspEzrgwb/DlyDMN18uRXMMaWsRoiim4Uh+PG/fT8X/mu7Fnd6ZOO8wNtmY/7Xm9k1e2mfKg6VkRfbxSxkxzViPOMt5dsy9kny9zkUSV00+N1nQD1Yfzp8l730mYKXxjwpsAq/wQBRZMOJ+ehW3QYCGsiGQfx/6D//REhOX7Lj61fD/MVsK4Px0DFXU3eEPkuV4uCc9wLiY+mYPy/hI/+9Y3x1cKamExYcmDbHEMxav3pIgHNtGoqd+9aopEGpiWZxT/qykA8MAgQx2Ucq8A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8924944-39ce-4ae5-8c0e-08dd7607256a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:05:22.3393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHgFJF0FYh/n1VlOHFQiGCmtc8DTBf47dd6sKV+T0rYOeOT89Wh9AAt/5AfcNjOBvjk2UdN6XHzym0KrldwCAj8P6Oec62DLqNzlvjULd+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7807
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_05,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504070133
X-Proofpoint-ORIG-GUID: O6n7nSyyLh3aHfwOADshPdULIWtE9VdI
X-Proofpoint-GUID: O6n7nSyyLh3aHfwOADshPdULIWtE9VdI
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


Arnd,

> It turns out that there are no platforms that have PCI but don't have
> an MMU, so adding a Kconfig dependency on CONFIG_PCI simplifies build
> testing kernels for those platforms a lot, and avoids a lot of
> inadvertent build regressions.
>
> Add a dependency for CONFIG_PCI and remove all the ones for PCI
> specific device drivers that are currently marked not having it.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com> # SCSI

-- 
Martin K. Petersen
