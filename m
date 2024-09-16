Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56B797A410
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 16:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D160A10E393;
	Mon, 16 Sep 2024 14:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIQGagZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1EB10E1A2;
 Mon, 16 Sep 2024 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726496725; x=1758032725;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=j9jBdp1sWC8QMAXAPAj21N9j68/WttpwBrykHcc/NBU=;
 b=CIQGagZENU+PVnTkuP1Cz8U8eyyOK7c3z4zIsq8f8t2t/vGpqp8c/oKL
 7LI5z/50FQwBaOLd6xegAhejIHW3BUJp075Kmy1/1z0mdi3t1EZK0o4Mr
 JRbIIkXpedYEsXrOs3if35lil+pSggLHRQIrW+Ay+FQcxWjtMRHjRXhuA
 az5UAHg7TirAgljcb8E6Vb0EYW68GT90ymIO92c47yBOlNYagOu54MQ8g
 Vktb1JurbW15AjwvIVDOGXSv2OdrcKR8M0AW57jZh/n6GwLDEl7H67flp
 S7irLxawmTNH2IsAi1LGFqITbNIYehq4dWaStb6m38FecVhWO+ybLTT46 w==;
X-CSE-ConnectionGUID: yqrs1ZwqQpaihJ/RApki7g==
X-CSE-MsgGUID: yTdWYd4sRhesta8u8xuEEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36461463"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="36461463"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 07:24:34 -0700
X-CSE-ConnectionGUID: qRbq1creTWy2SUFeCMeSlg==
X-CSE-MsgGUID: zSazIz7jQzmw5e61xDfm2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="69125296"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 07:24:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 07:24:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 07:24:32 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 07:24:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2OEWb6sNrd8LVIW6kSrFtQHHj94hBN8JhrXfCS3bq/uyj5w/Qlqbbrn/41ZAovLWu/bhTlTa0x5GbknuBMX4SeTp5Wnba8W9oB9vBdhKGmquZtWuMQtlU3brG+t8n2QUpjjRq/5Qc5GbS+ChN9tjOFZC9LpTZEKS07Wz5oMC2B3oTiPyUPvNv8m4huvrue8N8W/DVibhJ5alt3XWiAZ/15Ul+36FGzjuTf818TLgiLXKDM40hiyVWL6aT+jUyiTxqQm55JTmAk5SvMwYoHj4v5Aik2X4xzf5XopE58Kr04XNQIW/fXZ+caVlsYM9oGxUNY+mrujABdKTkbnY6nmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScaTj+ytHNZmQ4JaBtg3K6a43HZyVX//vIN0YJvw320=;
 b=Pexwx6LGFi4aj8osyW4FrTU46FVOojgALRC4i9aaIdYBVsOzir5iXwvkSdeu2r/77BCPJcSfc8sai7YZIWHAiOCmUTim57/HRANtTFhGLOeSMn4pXGNZrm01rBB+CL0G6kO1DCLs3GWSCMQr7ccyNKYUo60/VscDmSIowO9bz5QkAw9V4YSTgUWT/f3bbWG6/sr+JcnoDGc8biqKhevVgDx4OnRRsYz7wbmzHXC6bhN1rfmvXoulSxJrPDdrWeZW7zGDxr2Bfz8StY48ws77ZsQe2I8hZHgGQx/GWpLFBBxHKmJAcVU7yd5uq1+/vo/WsuRaqtiajP1uPq+zsV6F3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:91::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 14:24:27 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 14:24:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240906174601.9271-1-vamsikrishna.brahmajosyula@gmail.com>
References: <20240906174601.9271-1-vamsikrishna.brahmajosyula@gmail.com>
Subject: Re: [PATCH] drm/i915/cx0: Use one lane to set power state to ready in
 DP alt mode
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <jani.nikula@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <skhan@linuxfoundation.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>,
 <dri-devel@lists.freedesktop.org>
Date: Mon, 16 Sep 2024 11:24:20 -0300
Message-ID: <172649666078.2630.10319073128429169176@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::26) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CO1PR11MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: 55248bc3-544d-4082-d1c8-08dcd65b44dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXBEVzAzQmlaakFwWEtaT1QzZU1iWng3UG8vZEMwL08rVmg2MWtaTG82Skth?=
 =?utf-8?B?SWR3eEw3aTd4NUdXNVZPQ1k2bU5LUTVSZjBESlAzeXB1cXZGSjh2WmR4RFA3?=
 =?utf-8?B?SjBvaGYwZFllYkJZZURwSEJYdWp3TzVLYXY1aEJhVDAvMjJ0UmtWNkYwcUQ0?=
 =?utf-8?B?OVY1WUc5Q3V2a0RZc09USE54YWtldGRrTGZHeHNXVzRoRnRXMGd3UU5yREhW?=
 =?utf-8?B?d0hwTml1ZGF6SXRsVEM0c0JHTDF2L1p3MWN0WFBoTmkxRUpOMkVZTnZLRUt6?=
 =?utf-8?B?Wk1VL1QvbVZQWXlMb2wrT1RqL2NMR1FwRi9sZXRRR1gyWlZqQUw4d3JJNWZp?=
 =?utf-8?B?ZmM5NWxxMmZhV0RjclFSTWZNS1dqdFN3NGJuenFjRTJrTEVFc3lMYTdIVS9m?=
 =?utf-8?B?WW8vNzRod3ZNR0N5VnlsSEROd2w5RkwzMnN2OUQyeXc0WXcvQ0tTSTNYMVZl?=
 =?utf-8?B?SWR5Wkd2ZHMwZWZOSVBVMUNjTXUxUDhjVUVlb243TTB0VnVVTHhNVk9qSTc3?=
 =?utf-8?B?WEVDM0hqUnJUajZMUUZQbWYya0VMTmJwZkpFRXNCM3V3cmdNOUV2bGxFL09F?=
 =?utf-8?B?SDNkODZCUmlRZTFkbGQxT2NuK2FRR1VrdFRmSXcrcU9aL3BWbEJzbVI4SG90?=
 =?utf-8?B?MkRIZm9jZDhnb3pDZzE2UVg2Q2EyT3E0K0ZpKy83Y1J1YVRabWZpejhKZUVC?=
 =?utf-8?B?bVJwY1FRdWN2dlVMdUJueE5DeThiSUZCWVoyY004K080MG5mM29XZDVnbzdQ?=
 =?utf-8?B?bXNrUEp2dkdkeURXR1owUXd5ODJyUFBDZ1lzNFlFYUdHQ3VJK0Vxa1MwcVQ4?=
 =?utf-8?B?eUt5ckFNU0JUU1NSR1NqbklJWE9KQ3RjZG1yWnF1MHVCNW02Q0cwL05nODla?=
 =?utf-8?B?VDV6ZFJGZlIvL1Nqd2pmVHRwVEQwMU1NSVBWM0QvSUUydFdQd01DS2ZIVnRs?=
 =?utf-8?B?L3pla012RTU4NVUyUFNBbTlBMkVNN3hydzY5bm95ZUpTWE5yNUMzakZsSmFr?=
 =?utf-8?B?c2JhckdISUpQb2o3MURya3VWTEVNY1Y1NEZJc01qMjhUSTJYMXY5cTFVcklQ?=
 =?utf-8?B?YThIczJVZSt4V1VRZ091ZzdzeVQ4UWVXdzdETlhNQ09ZdnZSbGYvSUxJRXh2?=
 =?utf-8?B?U0lBYXJUQ1V5cDB3ODRZVm9xdmJ0bWdTSzVOaTlTMnYrdnc4TzIxR05hSWlT?=
 =?utf-8?B?R0tiTUhZQ2R0a1lDUWYzN3lQMGNPVmtKa2JydWl4NlJqajlYK3h0OHM5ZTF6?=
 =?utf-8?B?ZHdBMU5wN1VuK0RIY0cxRXNVTWx4NkhyNVpQOVoxVFcwUWpMWVI3M0FGUjZh?=
 =?utf-8?B?cGpGT1pMQlhwZjI4dFhqV0ZFWU80UmxaRkhGdXVTUzVhZU1GSEo5VlRXQXlm?=
 =?utf-8?B?QXMzeUNlZGNCQm9sL2lGMjVhYUR4S0IzVU14ZHZBQnI4YWpLdnd2Uk1TQjhz?=
 =?utf-8?B?MTROME1zcmk3QllxWEJWSmRxc0VTMDB0S1pDaks3dS9MTTlWMGVkdTF1dnlQ?=
 =?utf-8?B?UTcyMlVUZDBxVzN5K1YraDUvdjM1M3lXNmJYTVRxVm5EMVBrbEgwaW1wVVdu?=
 =?utf-8?B?TStKZGg0QkdRdHBtWEJvVWd4Vkl0Z3ltTUdDcGxiSEFwa2U1Nk1DTWdScDVP?=
 =?utf-8?B?QjBjSFdiZURBYjNTY1NicHV2VGVJQjhPd2lxUTVzV0VuckxEYUhTSnRzQmlC?=
 =?utf-8?B?Rk94S2lWWkpXMFJJNm8vLy9PY2RDeFJVa1MwYUlHVEpWczB1U1pxaURBNFk1?=
 =?utf-8?Q?87mmsyApARIEdfJGKs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTI4d1hXMlZubzMyWU5WMWs3VXFmTGc5WDRZWE1qQlVoTlF3cXJrMVEvQWoy?=
 =?utf-8?B?VnpCSHJvWXpRcWh6K3pMcFVaSE1zZmU3K21QRk9sWFBSNmJnaTRkbk52a3pz?=
 =?utf-8?B?ZER3eU5TMytSRGp2ZEtFUUdHZHNKSllZQnJUUHFyZE5iT2Z0MmwzV3BrbHVW?=
 =?utf-8?B?SnlLZGlkQWU2TWJWbFl1WUZ1ekorSVhTZHVyV3hoR3N6VXVwb211RWRVMXpu?=
 =?utf-8?B?NFhkYTgyVm9NWmVXazV6bUo2b2lvWUxBSHhpNE93aHpRNmpJY2VWbGU0RUN4?=
 =?utf-8?B?NHVZTW82KzNLSVNGYzUxT3dCanRKdE0vSktmbnZvZWpjQ3psc0tRNTlQdW5r?=
 =?utf-8?B?Njg3TXBwRndWeUlWbTVOVi9INkIwSW1qVnRHMDM1NWM1aTRRMDA2TjdNZzdu?=
 =?utf-8?B?MFduc0l0TU5GUm1CZkVSckViakdKTHRUc0xhL3Y5cUozbHJLUEZvUmJzRmVj?=
 =?utf-8?B?ejg4b2l0c1RTbUF4cytoSmF4Qy82bUo3OFdCeFRJNmZlRkFQMDVvYU1iRml1?=
 =?utf-8?B?MkdDU24wWWpJWTFSd0VjT2RqTkZ6aVJUOWdLMStXd25MU241cVVSMUwzYm9B?=
 =?utf-8?B?cjhhb3l4STFrRFRoM244c1BCL3Q0NkY3ZDQ3QXk5NWxQU3hjVVZPK0pSYlR4?=
 =?utf-8?B?aWk4bGpZdk1IdS9vQWFNT3FCRGlaMHh2YTBha203bXZ3bHBoUGFSTVNUMHp5?=
 =?utf-8?B?OWZoNTdDU0dGdjVwbjdrcWNyb0x4dlZZMkFROW1UbHpraklRZXBkOWw5aUNQ?=
 =?utf-8?B?cTJPM0pvam5FQzlSRUFFV2ZGK3R6SFVYbnNrZ2FvZk1rVm9CZ242czFkVFkw?=
 =?utf-8?B?czZONTdrckFNS0E2OWhnSzlpVmpZaFN3RHNGWVc5eEZnRzV4N0JlYUhEcnp0?=
 =?utf-8?B?OGsrTWZXb2dqOSs0VU5tV3VFeEx1SUh6R3FSWlZZT1JkMjRWR3J4Z3A1VFFP?=
 =?utf-8?B?b2pDaXBMRnV5c1JBSUVDOG8yWktSQWdiWUVjQ2NFS1gxUjFMc1ZKSmttcjZ3?=
 =?utf-8?B?eVRieWJnYzdnSExDSGo0alNzMEVMcVN0WjRqN0hBUVREdS9kQ1N3UkQ5UElj?=
 =?utf-8?B?Mk41b2VRQ1ZYZzR4Y2tCNkxzVVh5SGtIc2V0UFhPOGxCTkZwNFR4Qy9iK2ti?=
 =?utf-8?B?SGlhK0dZWDJWdlJBQXZTSkkwcXh4bDhBSTNYVUgrYVE4MFhRaXQyS1lpWmww?=
 =?utf-8?B?VmxmTzJvRG1HSEMzYS9Ua0tGZUdOT0xoMHU5OUhlOGtHU0phbHVldHdnQ0RS?=
 =?utf-8?B?ckcxL244VDc4ZHFpWDlmcHBXQi9Kc0NrNlo3SVVwRnJOc29RYmtLV3dkZFBM?=
 =?utf-8?B?RE51WkdxaFVwb1QybEd3emZpOVprSWU5ZUw0c0dUK2ZSdVF1RnkxdUk3ejZX?=
 =?utf-8?B?Tmt4TVk5VVBkUkVVbTNnaVlPMU12SWgvbDJOR3psQ0ZVRHlMVkFJTWNOM1ZD?=
 =?utf-8?B?RFVWNkMyd1lzbDlBT0ovRVVyaHNwbTVvRGlCMzhmVThQd2xFeGNab0duVUMv?=
 =?utf-8?B?Y0tKUWZDbG9vV09OZ1gzZ2NuYU43ZTY5bDcvemNMNFJnN3VVeGRXSlVHcnNC?=
 =?utf-8?B?L25lSzFjb3ZQQWRvbzFFamRzTFBmam00MDBDVWd5WldTb3dVQnVXd0NLOTd3?=
 =?utf-8?B?YUlEckZ4SEJQZWFUdHNIMXQ0Rk9nck9IR1ZrRHlHajVQdExTWkt6aWpydGs1?=
 =?utf-8?B?MWw4dklmTGJIYmJPaWNFRjhQelkyMkY4TStpTlhhWUFmUnQ4YXh1UlYvaGNl?=
 =?utf-8?B?TG8xZnp5cUlvci9pcG1VbXR3MFNiNi81RllRNXRsbVVDcDdla2F2R0JjRy9k?=
 =?utf-8?B?eDRiV082V1JMWkx4c29scVMyVno5K0RCOWdwQmhsYmw4SEF6SmZMZk5UNnZl?=
 =?utf-8?B?ckd5S3l0SVl2OWlIYjBHckdVamZPVjkza093U3BIVkVXbGNHNGZOd3QvZ1lm?=
 =?utf-8?B?ZU8rbm91dk0vS1g5eHB1ak5VQXRyNFRqRjJYU1FCMnF0OHhrazRwdlBPTnlJ?=
 =?utf-8?B?NUtUOTY2akhXdEtZSzladGFmenVVN2VRcUs1b253YVQxZW5hOWxvSnIzeHI4?=
 =?utf-8?B?akI3bjg0MDh0ejNkRDd2dnUycUpkakdUdWF0eGFZYWFpNGJ6amV4bFFBR3gy?=
 =?utf-8?B?TnFJRk9UZkJ2TGVrSGVEWTAyT0FGaUd6ei9kajlvU3pJYkJoUHo2KzdHeldp?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55248bc3-544d-4082-d1c8-08dcd65b44dd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 14:24:26.7668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suHDykoNzZ1xaFZa4aUtVwoX41L4wnSoljRCcggSPW4dQuiH6V+/wu/nVZi0iCGW64rE36ULFAc2SI2/04E+Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
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

Hi, Vamsi.

Thanks for your patch. Please, see my feedback below.

Quoting Vamsi Krishna Brahmajosyula (2024-09-06 14:46:01-03:00)
>In DP alt mode one lane is owned by display and the other by usb
>intel_cx0pll_enable currently performs a power cycle ready on both
>the lanes in all cases.
>
>Address the todo to perfom power state ready only on the display lane
>when DP alt mode is enabled.
>
>Tested on Meteor Lake-P [Intel Arc Graphics] with DP alt mode.
>
>Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gma=
il.com>
>---
> drivers/gpu/drm/i915/display/intel_cx0_phy.c | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/dr=
m/i915/display/intel_cx0_phy.c
>index 4a6c3040ca15..47aa0418379c 100644
>--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
>+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
>@@ -2949,9 +2949,13 @@ static void intel_cx0pll_enable(struct intel_encode=
r *encoder,
>=20
>         /*
>          * 3. Change Phy power state to Ready.
>-         * TODO: For DP alt mode use only one lane.
>+         * For DP alt mode use only one lane.
>          */
>-        intel_cx0_powerdown_change_sequence(encoder, INTEL_CX0_BOTH_LANES=
,
>+        if (intel_tc_port_in_dp_alt_mode(dig_port))

The TODO description is a bit incomplete. Actually, we should do the PHY
power state update for *owned* PHY lanes. Both lanes could still be
owned in DP-Alt mode, depending on the pin assignment. In particular, a
single PHY lane is owned in DP-Alt mode when using pin assignment D.

Thus, I suggest doing an unconditional call to
intel_cx0_powerdown_change_sequence() and use the value returned by
intel_cx0_get_owned_lane_mask() as the argument for lane_mask.

See https://patchwork.freedesktop.org/series/121334/ for some reference.

--
Gustavo Sousa

>+                intel_cx0_powerdown_change_sequence(encoder, maxpclk_lane=
,
>+                                            CX0_P2_STATE_READY);
>+        else
>+                intel_cx0_powerdown_change_sequence(encoder, INTEL_CX0_BO=
TH_LANES,
>                                             CX0_P2_STATE_READY);
>=20
>         /*
>
>base-commit: b831f83e40a24f07c8dcba5be408d93beedc820f
>--=20
>2.46.0
>
