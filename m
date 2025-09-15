Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7D9B585D9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 22:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CBF10E55F;
	Mon, 15 Sep 2025 20:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XvaOfMox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008E810E55A;
 Mon, 15 Sep 2025 20:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757967356; x=1789503356;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Mbv9vSKxZrEACyU7Fwqc91jM/w8J8+fGXX7SnBXedmE=;
 b=XvaOfMoxK9+HzUD/pduS9KSRjvOkpfpQFTJiCmaoWZ9gUMsmC2+oosLM
 71MssRedKkt4EydGLIo7fzxKdq5HK6HhUlCf7k79h169cXDsr0pSnD4N9
 s/j/BXE5y9+saK6dHs5abNawg25sjOovPUB9DHlPLk4Lhxb0iMX7puj+/
 o10YTs4+xCtKS1Lp1QmFgIskqtDiG5ocu3e/zgXb2CVnw03eE5G87txAL
 Axy5GYudhtyZ/YS53fFOhZihZeGgQO9oIs+sbejdBzz4XEkqROllkVp/j
 J8SMrYQNQ7fIJ3tNOeALTQtyZVfb03CJdpNuGbV0WiY3VvKLvi7gSo3w+ Q==;
X-CSE-ConnectionGUID: Vm/Ud3gFRZSfYIgLmizI3A==
X-CSE-MsgGUID: bmBgPj62RaSJjgou5os5qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="77844881"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; d="scan'208";a="77844881"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 13:15:55 -0700
X-CSE-ConnectionGUID: hAjXivY0SKa4ubx42pzX6Q==
X-CSE-MsgGUID: VbrzkzvhT7WW/5WD7myAjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; d="scan'208";a="174281280"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 13:15:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 13:15:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 13:15:53 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 13:15:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwMS8Z/VUH5TDVIFC27yzQDqRh5VpaaiVSIl2kTBtQLBSZLCPHwSAOc95mJjmB2j6if8W367jqzqibx1SHhGyHP9qkMDOZ6MGFN5IQhpCuiW9pfYu836ojgNp+99FCaDWsUU/m95h2EwoCDHjvCBSQST9OmAwI521qfOF8BEmnhIJByVSEiDnb2oIjjJDXyydc9G/CE6V5sDbayUWqgK8r8SRbd6sWxw5J8cPUqhtvprXhVyG5tsR29vKVsL3n4kJt4gfGfpZPEM2+P3NAKKe3AVxoR2l9bAb/NMIj9O5miT8aYXDX/gCyf/gRM8nbsn1trsI6SduJP23JMztPj+lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFWMdOomDlof2WN/9snV+UR02tvw8SeBfr6DkEF9sSU=;
 b=kXPXaL/Saoqym2XxrXqJB4DMBaRB6Lww9gJfGYYFCcRmNUqf5zmf7/Rsr9kX8LpDrgIpPoQ1MQKdEdLFeRbFwtOpIZYazqXRsu2LlVXdE0Fp1sYPAhB0Yjp6DAFQ0IDE5a3ZiXrV8Pl+fpr6Ox2d9k12ryZiyhEA/NNMWxeR0iskNX34N2O1caOuZlLWDi+s1DIyV3R9oM0W25d7+LXgwlG51OBef9qOUHWTIqiUtt+0uI9qjpgLUKpf/VLnLwYZLA/uvdUnbrRM2gKsZnzxMEBFoWPbYg73ElyQIxLQr/MqXmapmA65LgPhX4yd/v9wNip5Y2rc2gH1aIvR35dh4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH3PPFE26A71A1E.namprd11.prod.outlook.com (2603:10b6:518:1::d58)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 20:15:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 20:15:49 +0000
Date: Mon, 15 Sep 2025 16:15:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "=?utf-8?Q?Micha=C5=82?=
 Winiarski" <michal.winiarski@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>, David Airlie
 <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tursulin@ursulin.net>, ?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Michael J . Ruhl" <mjruhl@habana.ai>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 07/11] drm/xe/vram: Use PCI rebar helpers in
 resize_vram_bar()
Message-ID: <aMhz7i00wHJ6zmxa@intel.com>
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
 <20250915091358.9203-8-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250915091358.9203-8-ilpo.jarvinen@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::8) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH3PPFE26A71A1E:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d39b29e-b05d-4734-5fd0-08ddf494a960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5qveQn9SHpuosZ4M1/cxDhO2j1M9KtgznUKSxYOq/lqSSqD+v3E8+zff2s?=
 =?iso-8859-1?Q?TaAP17MkDfje4RjFhjdMp+7hhiDv0oTIKrq81cy6psNU7Y+XRV5mdCBqqb?=
 =?iso-8859-1?Q?0xgikVmuY4K/+JW858ItC0HkUAszywoZNW2+hQabA1Wv7xEZJyAJSkJuAt?=
 =?iso-8859-1?Q?i2fKjnB2e5kgLxkltjW6F7O6O5E+nAS93ntAJX1cX3YApKN+6EEj+MffNB?=
 =?iso-8859-1?Q?8ROvOXUlLfjhGk4RPnQLrse38c/nf8C/YQNXM0XDJjC5Hh4wOSOsAtcJkC?=
 =?iso-8859-1?Q?av1JMab/0mqAx82MvBgUYv+lEZYb5Lpo9tOjAgRtNd0czzrSGxlCK8ThV7?=
 =?iso-8859-1?Q?/+A71a719Pdc+u5uMxJ1JK3JNZU+wcjFFMZAvvx1d99sxBUIxxTkInZL9P?=
 =?iso-8859-1?Q?gM/tTeibF1frfyOAomxe7xXjNKIkLBTk+EwMzM3vO45kgGejSEyxgePchE?=
 =?iso-8859-1?Q?GjRoYAgvv6ybYD76y9b96pWkDFXsqVdSDUytdTYEOD5/frGJ8ZvgVKQPjt?=
 =?iso-8859-1?Q?2dddS4iF+B4mfNXTjezyQK63JHda5GUHGAgxORV26Pm2abFPmge2B97f2e?=
 =?iso-8859-1?Q?5cZgRAi5aBkG7YAttuto0oPxVn1iHpyj0pJYpjv+Gm43MiZKPl7R8MBE0h?=
 =?iso-8859-1?Q?eCwBLcnzWHChXBTEpiDlYL//xiwV/rkknA0RDEVO/vJurLHjVrb2XRYsOn?=
 =?iso-8859-1?Q?j4nzkcZislJoHiTlrab8YdlnYKmwjOwCwDqh4lqdjsbjhsE71sxyslOzWD?=
 =?iso-8859-1?Q?BLFoD2eYXoBndKAqnl7VsFvjx2laYzLe7QyYIMdBqK+5VqAjztQL9T1qQG?=
 =?iso-8859-1?Q?XybIXn9vFPWRVMU3EugkHriHKXW4O0skMAyaRVOUEN7CFVng7EBU9OR03h?=
 =?iso-8859-1?Q?CNyEfz/Tl7Y23Vagv28f1Sz5nlMv6pE8J36jNUxssKDIDK/iY69P82bLhe?=
 =?iso-8859-1?Q?bF9E+It3Er7mlZNTfaf6V4agQWO1xvg5RaScXgParSzMqpvf2OAhxacQu5?=
 =?iso-8859-1?Q?8xCljgyZqEANfCxSxnQ+xO/7+KapOJMFs/HMo81z4KXFL5k4MnJzXsW0lS?=
 =?iso-8859-1?Q?nXbhrkzqQe8/dSD0ckPk/H3Gnx36AbrJ2mwk9G85UIkGJ2DSjJ7L4inS6z?=
 =?iso-8859-1?Q?QfEEHjfUxWPq95SCevpFxF+4Edr/oGRBGdVZXy+XAEBPvyG6BfOm/UytqL?=
 =?iso-8859-1?Q?86E9Af7LORwLKY/Wj3jUpr5AsAP+0lLyo3KscbVht6C6yB+Xgm0MMZvL0H?=
 =?iso-8859-1?Q?Z0Gn6BxFRrazANT8b0q1DGTYZV2LzrzubmzEUPUSOz17/yBs0p6gUW0XfJ?=
 =?iso-8859-1?Q?caCF/7EZcjRHuBMeh7qUhxpc7miEberoGGeRksRALqo7IjoivOS/175Ssz?=
 =?iso-8859-1?Q?LSSXKiw9yDNguol8SarqH/mhYod6ayjlCLgAUQlBtEBKGMwcmfIiewWx7D?=
 =?iso-8859-1?Q?QjpWy/nHYD7zQZMAwzz/oTChoF5ekKguPI+RhwVwZ5okxEEyooTJ498/zA?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?n+JMVa/FGRz4fGZkGeEV9F9AcRTdFshY0moawWxggPR2zCfELDEXqHFpb5?=
 =?iso-8859-1?Q?GCU37DJ2qs+CITA/TT9BSqZe0JNGfVbqJV+4o976Ou+WyLeB4Sv0y/KDyW?=
 =?iso-8859-1?Q?t5i2hkdXezYaYlSGg5j0anI1Uy12wzzj2NifdBOT5WnzfYfWUaUtNbYU5O?=
 =?iso-8859-1?Q?ElSxGSx8gQoLTAo3Jw7eagtiBWdot0vPabs3eqXCWgdv1pkRsIiorB4q+2?=
 =?iso-8859-1?Q?qTQ0UIrV5VQQj73es8ymPtlcS+3nQI4Mnsd+Mi56eRjpKseSWmsJuTm6Fo?=
 =?iso-8859-1?Q?E4h8eR3KjZ+XKWS2qn/HWA/nVWJuHmWfNQqhn3pg5AkdxOR7MQNZ2T48SP?=
 =?iso-8859-1?Q?qG5pmBrzSU9clJYmamdI4Li5J5FXUxiZQN2WEodD1OM2orBhNN2llUuJrx?=
 =?iso-8859-1?Q?N4eFMA8TT8tiY+PdNvlQWhkymQAXRIR6njhzxXINWkn5nekD+DzDbvoEx3?=
 =?iso-8859-1?Q?SPVr+7o4EDdrjNIou0xPUxW9VmIpD3fWrROiW2UWjqaVluTjTwjjeMTfoc?=
 =?iso-8859-1?Q?sH7TUsOiKJH0g+kn3WHfRdFmdDYo1bQQZ+7s+9p4s/JbRze1CKu3bGih48?=
 =?iso-8859-1?Q?9bhNvxtDYfCFUsgYT1JLQTrvl/+yiy5byY/IWTHhI0h5x433bG+fac1pjE?=
 =?iso-8859-1?Q?QuvRtUlxLNxMfTAMr54Bh4Hab4+y4gkijnVrYdcci/eAB/EuDJwNmI7WGw?=
 =?iso-8859-1?Q?O3OcdSDRC6pOpIFeoJFx9T1sEq+dALDEwO6gR9pl6irUwa7Wn9XkKRtqTp?=
 =?iso-8859-1?Q?ePNN1qMVBPp7NUQRTdXjaISR96CxHCsNH4H+UaHS+cUSU0pmEZM8gnDT2j?=
 =?iso-8859-1?Q?txbF03yKJ2cIIQqgF1CuCPVdZlR14uDkeVE8jOoS2oq8BHFA/VHEEdxt+7?=
 =?iso-8859-1?Q?9qEF9crkFFJeVvIQq5SLMH+zYlN8JL4q5dss7Wfaqr6PpLlUs7rXaZXQLh?=
 =?iso-8859-1?Q?aryW9JEvhR+ES/2ARRFbOOpY8bSyBQw9KJWwZQiQmjEJKRCnBdoI0/MEZP?=
 =?iso-8859-1?Q?dBhSoAJ8pdEwmfhoMKYamjim43X4JAFpqMqJnPaXXUJt14rFlWESn2j2p2?=
 =?iso-8859-1?Q?Qz+49D9uieDmTggEnDBgmN14KKrHB40o+fXFyQLYfPUtBUUE6uUaoFZpSq?=
 =?iso-8859-1?Q?QCSuzHiHLMhbFu2906506wXsbMOxS2pfRPbb2Okgo4s2x5LelSjVoAwiT8?=
 =?iso-8859-1?Q?/xwRZ8JM3bI68zG3qsdYlbv8Den4fR3qCoNVO2h0Y1CzmhogMmMsxQ49UX?=
 =?iso-8859-1?Q?JFXNyFNvd3rQCvxrr4kgg0RHzatTHfXLoQRsWj0YtE5np7nRVPjwaxBcJw?=
 =?iso-8859-1?Q?5Fb/94FU1w/ueKNwVSCzFj3LUrwj7RBED0wqLg7DAS+WHrsoK7gfYLjxFR?=
 =?iso-8859-1?Q?34s+K/2T/OTCQJjlphREs9vhXMfjLE62TliAVjh2HBAYoXzB5P4pA1cNIC?=
 =?iso-8859-1?Q?dcfhMN43dxXqaQHjTwbQKrL3gW5oVC8xhKY/uyrO+MZ91v573o0RQkLYJ1?=
 =?iso-8859-1?Q?Lplotar8MXdmrCuPdnp61H/EFGzwBMytnpJs41l2qovaDxi97PJd/erHaO?=
 =?iso-8859-1?Q?yThZqngqpiMXe1Ub/tGmmZJhbvGjloZWQLMtOdR9kdk55humdl3usbANAH?=
 =?iso-8859-1?Q?vWrJPgNrBxzVMzkokTzO4LwZDWw0USwQQc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d39b29e-b05d-4734-5fd0-08ddf494a960
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 20:15:49.2784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dffZp+8CkWwkTRBjLvFTHqsEFb/hPbghjtJA80MGgO7Yitq6t27MMFz7KoC7kgO3IGoavN2pCHmYxrMteOmNew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE26A71A1E
X-OriginatorOrg: intel.com
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

On Mon, Sep 15, 2025 at 12:13:54PM +0300, Ilpo Järvinen wrote:
> PCI core provides pci_rebar_size_supported() and
> pci_rebar_size_to_bytes(), use them in resize_vram_bar() to simplify
> code.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Acked-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/xe/xe_vram.c | 19 +++++++------------

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 0b7417bb0a47..d4fbd7f74255 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -22,8 +22,6 @@
>  #include "xe_vram.h"
>  #include "xe_vram_types.h"
>  
> -#define BAR_SIZE_SHIFT 20
> -
>  static void
>  _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>  {
> @@ -72,25 +70,22 @@ static void resize_vram_bar(struct xe_device *xe)
>  
>  	/* set to a specific size? */
>  	if (force_vram_bar_size) {
> -		u32 bar_size_bit;
> -
> -		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
> +		rebar_size = pci_rebar_bytes_to_size(force_vram_bar_size *
> +						     (resource_size_t)SZ_1M);
>  
> -		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
> -
> -		if (!bar_size_bit) {
> +		if (!pci_rebar_size_supported(pdev, LMEM_BAR, rebar_size)) {
>  			drm_info(&xe->drm,
>  				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
> -				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
> +				 (u64)pci_rebar_size_to_bytes(rebar_size) >> 20,
> +				 bar_size_mask, (u64)current_size >> 20);
>  			return;
>  		}
>  
> -		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
> -
> +		rebar_size = pci_rebar_size_to_bytes(rebar_size);
>  		if (rebar_size == current_size)
>  			return;
>  	} else {
> -		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
> +		rebar_size = pci_rebar_size_to_bytes(__fls(bar_size_mask));
>  
>  		/* only resize if larger than current */
>  		if (rebar_size <= current_size)
> -- 
> 2.39.5
> 
