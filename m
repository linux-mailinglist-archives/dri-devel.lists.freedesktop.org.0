Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FECD3877A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 21:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11A210E92C;
	Fri, 16 Jan 2026 20:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2ReKfYW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F8E10E92B;
 Fri, 16 Jan 2026 20:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768595214; x=1800131214;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QHNo1oON0AVykyqnySAdggvv0Rgi31iYXr+0pu9R8v4=;
 b=E2ReKfYWochcqlmuiew011XVWHyCvLFmQK62E+A8UUz6zNPP6BVmPgvc
 Gq5YcYpjoNg2VF+u59YMaKoxvhhysCtyQwz5Ghxd+IHwT2O+90gHMj0CX
 U1GNDaK9FFKXNcV6ujYIxYUv10eogrEfnUVz1Ss9pbiRk7y9jl6cSvDXi
 ooqx/bIX6kG8Oyg8L2GXRmmHLn8Qx6unwXBAcCfeGcIZQss1HZlTOdYzV
 +/3KjlzcYvQAtzfk1i1z2OUymPeEZDsl4fQBX4vxWSBb0tpypDUc04cT6
 L23jC8JtwAOn2BJ96dfJ8cvSk6iTD2mzBSTJD2RJU0zV9M5CQtBxtz+Ed w==;
X-CSE-ConnectionGUID: vvA4ZUV6Tbe4t/BpFVIeGw==
X-CSE-MsgGUID: zdv+cGgFRWW7gmQC9r1NBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="72501281"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="72501281"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 12:26:54 -0800
X-CSE-ConnectionGUID: 26dZvuMrTR6STiKLhd8PlA==
X-CSE-MsgGUID: J4mahC57Tb2oMKkirKJ2HA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 12:26:53 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 12:26:52 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 12:26:52 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 12:26:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKJI7BPcnKp/aMtzBy8UpxSKXvyZBlQBy+9t+g7fxGgvuET7IaUuR+j1F9U+vFPYfC7e2p6Gq+ZxIRUc7Y0SY+rw1uqp5R/PdPwtzJZpmLw25a4dRL8mvIsBSV8luMQ0SdxcJobUPBkx8rGkGSY4VM5R/w8AEL+T2E9SvEsxe3BlD6pIJG5liCHoah41DHYIYjKsx5FPBXVFt0W4/8E5QgMkG/Cpxj9h2EenwqztGbCAzpxP9+JEOb5SIPEIg5OmeWgmlc81Je+hsJyPg5vrazVIxiMvTkUnxbZ1HVtOIxeb+Krrgm4GfsZIDW5uKcyIa660YnyuydYiMWfnlYE94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqY/+rJNH/FgnMDKu6pets/YSii/fvnt07KDjQeJuFQ=;
 b=FvB4UdW1fMqXyX9ebIoUbCg3dkNqrAjrqwu3N9VQ1nSIhjWzDvaptejM+WqxQWCJ0fVsRGgLMO17Q5GF9ZNCp669FbBy15Nd0oP54KkJ3XoFAiQqTxbWqp/YGoyz4VPgubjt9VX23DVAWIqMLOcAKrYn2N6qY/RLBMDudeKNctnm3DGL7mUcrqQEwEdAcRBglB/irISg1vFNwKLUdxK3H0bSs+vCZUI/0GFeYNGUUp9Ri7ISeduqZfKxDVbobuFzfUVrMXyboiK5qlN+vJmF2RqfmPrugXysWLndFOSSXrjayVNQDckhXqNTHiKKNBa41VUjrSXwfN1TaVuAETTT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV4PR11MB9465.namprd11.prod.outlook.com (2603:10b6:408:2da::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 20:26:45 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 20:26:45 +0000
Date: Fri, 16 Jan 2026 15:26:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>, Jakub Kicinski
 <kuba@kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <aravind.iddamsetty@linux.intel.com>,
 <anshuman.gupta@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <lukas@wunner.de>, <simona.vetter@ffwll.ch>, <airlied@gmail.com>,
 <pratik.bari@intel.com>, <joshua.santosh.ranjan@intel.com>,
 <ashwin.kumar.kulkarni@intel.com>, <shubham.kumar@intel.com>, Lijo Lazar
 <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, "David S.
 Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, <netdev@vger.kernel.org>, Jeff Hugo
 <jeff.hugo@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] drm/ras: Introduce the DRM RAS infrastructure
 over generic netlink
Message-ID: <aWqe_ulADqRZBQj_@intel.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
 <20251205083934.3602030-7-riana.tauro@intel.com>
 <aTiWNkGmwFsxY-iO@intel.com>
 <b986eb03-0887-4eb2-a7a7-50ef63e51096@oss.qualcomm.com>
 <aWFruAO06O93ADjU@intel.com>
 <19fd4d44-b7d6-4bc2-9255-3d5159ec1435@intel.com>
 <919c0b7e-83d7-45e8-ae96-d9fb7a10995c@oss.qualcomm.com>
 <3297a59b-a788-43aa-945d-e89592c9ba8d@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3297a59b-a788-43aa-945d-e89592c9ba8d@intel.com>
X-ClientProxiedBy: SJ0PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:a03:331::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV4PR11MB9465:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4e48a8-1df3-4b07-7967-08de553d9123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?N9el2AuowSOeEyPjij3kZf00YNGYyOxZlmuT1XwV7Xjf46jhyxtO7I+82u?=
 =?iso-8859-1?Q?CHr0n/qpz3aywWCFt14NbwyR1zanzvHRNvHYGkX3LYcnPm7ptYzbxWpIfn?=
 =?iso-8859-1?Q?m6BruddAi14VBfkxcardqcKkZsIUnn6sR/YggHP5wEoxGOFw/mLkdJ7TjX?=
 =?iso-8859-1?Q?VNEfdh+jFHcDMwEsIA5yL5XqpsUWw/Vq98EgqTgTMIBSdpf7FSNgwf9pwX?=
 =?iso-8859-1?Q?RfPyLkmSNvzI5pqE4k44ZfLDnHflh1d0Q3XZy2V4UygFM4RBUFrEdfwB4s?=
 =?iso-8859-1?Q?1VTMapi97P3m5ZGpJpz8MI6Pi/xV8jP8pFNfbhWG826rQQlMge9om88Ro9?=
 =?iso-8859-1?Q?pBplxsBGazO2Re2l557eAOQYxxHcUq+Q+D7Rd1eYlE651KS1dqZB17GxER?=
 =?iso-8859-1?Q?9uo7q2ba7GM9Uj2a0ZoNbdRf7Oa9KnB3QxHb/b0SgX0DwJAEc8pJWuPakO?=
 =?iso-8859-1?Q?bPqi4izVLNOSfUzgQP+uu3mqKA3k418Gdngu7nN/th9KLiTjeN6AwxEqk9?=
 =?iso-8859-1?Q?Yf8vehndgUp9nc0BWJmyCL9iFS843G50AlPHLzLEMYLeXDrZvG5/B+6/gV?=
 =?iso-8859-1?Q?LP6IndnOpyKH7IIbQc6KUR37HKjhja/jky3l6V3X+YoLmhPwhziuAN1zVu?=
 =?iso-8859-1?Q?bUTaVnkxmcx/vHImP1LncHP+mbNCs69lD9Et7M6Ul8RhH9KImqaUXyg+rg?=
 =?iso-8859-1?Q?H4XSCRBPxaxWqw7TK5/d7jHIqI2rd6dj6LPhNpLxp82d26ac6FgWw0rwmi?=
 =?iso-8859-1?Q?8yMF+PONE51vNlco8J7Zd+2W+S5L3iS1NZg9oC03vm0wrYH3vPSG32dPlf?=
 =?iso-8859-1?Q?o45Aj80VHyZr0hCR9H+MauCISn/KRZblbina25E1cwMZWH7PQ3g/p2FP+Y?=
 =?iso-8859-1?Q?fQ7wDs5L1Xy1MN9EnqSDYvoyhrHW+qFEL3u7E/sdwT/Qw/1mHGCD1YuGnh?=
 =?iso-8859-1?Q?4rsveWL9TqqX26h56jv996pmVDzCUiBXPxGzz8Lx9grIiBfRvPQK8TT3KU?=
 =?iso-8859-1?Q?uhLcoKvR4MXX1Cu0fBG63cgyXs1JNL1LM5VTNKG/TdW9aA7ltOD/bhKdIV?=
 =?iso-8859-1?Q?XbV8C1y4JnEi4v52UdtqGWYS1bbTF9xLTaKcPn2TsMexQbArp/lSjV2KdS?=
 =?iso-8859-1?Q?Wde3N0ZeJT0BzjBKnwDxZuBQJfs9akrDOT7yPZwGe/vAOXFHjCET2QcoJF?=
 =?iso-8859-1?Q?HmMNpjG0ZV1RQddyi99bb2gEpwd2Ew3JO6vUV5SdGv9BbmDSBtAXKoIBO0?=
 =?iso-8859-1?Q?zv8k4BN9kAMSoKKTup9mr9R1EtHhiRSYse58l73qdsO1YX9T/7SzYzpM26?=
 =?iso-8859-1?Q?RGbYxIIodiAWbox49A0jSZMFUt2z6XmdlVvmS/af0w4n3TX1b3yiCq7ELh?=
 =?iso-8859-1?Q?MxqoH6joxqJ3A7vEZA0VGwFHCBdewqDRSzE+qIdxVPPXrqHlbj23g40enC?=
 =?iso-8859-1?Q?XgOtMzX97lpRzYJ5QNazJ81F+XqjIgaIOT2z4gaA8gNXMw7fPJCYJLz/IX?=
 =?iso-8859-1?Q?A41HTt95hg6cNHqxOGqMBw4+JIEoXJeBCFBkN+7NFMY+e+GHF0T2ykkJ6z?=
 =?iso-8859-1?Q?H8j81MAledc8lfae+7ieHoOI2n9ugZD3xAzYO/l3m4Nc4VWUsfPCKBSaOO?=
 =?iso-8859-1?Q?cwvU6/reSPgFo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8SFnfBYF2gobvTrAMA0TmcJu36vOBn5knhz5EP2sH6ES9ZBHFKGQ0fulSI?=
 =?iso-8859-1?Q?cY4Y0Y9LUQUc1ZTqqt14pE1eF7k8lEC8Uqxf9bhNbDNowMr/+V2NIJ390X?=
 =?iso-8859-1?Q?7epSYH9fLQ13fwDbkBI1ge/Dc4sjErrGD8SQLeBF1VS5VnpOAIwCdNSMte?=
 =?iso-8859-1?Q?wG4fteB0dJpT5KtaUNjzMQmhIVmyk52gN2hfH8E1w+8104rnF0gKaLE+Vo?=
 =?iso-8859-1?Q?eK4AGzPhPwQKPnAP6M4Zg2YDZmFayM+REL2oJJPVweo8UqRRfRA8WJNpbi?=
 =?iso-8859-1?Q?x/7AflAgg+vBEcCX5/iMyg/BTXB5p2iOFW88On1r3Rb3RtgBJarvyCaCtG?=
 =?iso-8859-1?Q?uAgMv3xGFsyE0pBLBrBdNqmO4luxrjZw53H4KHx3/834jHXkb/hpv5vtKt?=
 =?iso-8859-1?Q?bSKQJkmD7W05KfGgbGdNOkA2k+8lJ6URrWixftd4OBaV6Pzdixmu+kyI7+?=
 =?iso-8859-1?Q?dnQ2rvn8LG2uIDd9j83Vjf6ngQ5UYr1N4Z/dBn+bSO2D3fF0CNGTroN3j/?=
 =?iso-8859-1?Q?6dxq3IyC229mJEeem6Rf79vUPeiRd+6lhiKE5lVfg/qdhU1OFUHSS9Y64b?=
 =?iso-8859-1?Q?9hMy7e5iCA55D04HkOG760f/oteJGjfm/rsdtI9sqO1lgeA8r0Gt9VaDlD?=
 =?iso-8859-1?Q?iMlKk2LFpNZSk4jPGvfwrvvc/DridPDtfo9r+3DtYiDg0+2fzGnmnV2LzM?=
 =?iso-8859-1?Q?L8yusjZrroFV6pMHq26hXGMYVsbAB4v+I1/2HN6q+55eMYWsmx4DnaFEKU?=
 =?iso-8859-1?Q?065/IzdeLlbmBGqphPPlgDbYTo5rGj4oN4Sr2HqJENjEzB9EXGELmK/RPt?=
 =?iso-8859-1?Q?pydab2/zGymMLhBZy8TXAP7IHZ1C9k5yUXEc7U77fTzRG8dXH/yObu2DRk?=
 =?iso-8859-1?Q?gxGMZBRl+D5BCg1JVJonyJdCCCksHC4Y5IDyAmgtaBBMvQk69icBrexSSu?=
 =?iso-8859-1?Q?6LvL9iSriIBQiUI5S2zeOOzO8oVHtthgYOPGVhHoF2t1l/XcsJn4jop4xu?=
 =?iso-8859-1?Q?/XUJMDO5S7xUfRaxF71tXNsiteXeEBQ7ovrmcacV6aboVXd+4FspqJYCMO?=
 =?iso-8859-1?Q?NcrP2jWWsApEJ3nEEwW0cpV/iDCX1H3EWeQYWDWPvmQFLH7z+9oo7hbGDc?=
 =?iso-8859-1?Q?S8aWT0hwBMO/PmlEV5ajot0cHHrgOur2RA93IZxH4SUmX9Qu3baGBgtkh+?=
 =?iso-8859-1?Q?vg6uT9gH9uBRat8v4jMo4CTzpvWl+pathb4L973S4CkrDMvxeftCOGa6KH?=
 =?iso-8859-1?Q?8PnM5aSqxGfaKrxOn/hF1IGwgjzvIR1pIfj0jiEXU54mmN6iztK+3zYemB?=
 =?iso-8859-1?Q?CFTjbYPiv1WlRmnPXl3wSEecjsbhYGek1OTDgXjha9O7ufIiifYWGncH0E?=
 =?iso-8859-1?Q?59Svi5SZsvZoc84DkuUiahX+JLh9No0Ljnxl+aRJty6NOCsjOCAQPelBMr?=
 =?iso-8859-1?Q?/I9dSN8oje/ATgZ2lWHTeSxOsfR4o5K0Ybte7OiWaoe7JNMQyymbVoCII2?=
 =?iso-8859-1?Q?sCQsgG00q7s3H0gZQeOPH3ig2PpSGhfcuezBrg6IjSJ/1Mg5T3lT6Wy0st?=
 =?iso-8859-1?Q?fPq2fegrx8DircD+aSykwmeMSbgeEp2gTaXjbvOkwzi4z1HUO/IeAnKEYG?=
 =?iso-8859-1?Q?ypq94ZLNU2S3Ql0ZSu6R/SL3OoSgVc29Dx2gQGaxaxzMUya4EHRsztR5o0?=
 =?iso-8859-1?Q?YN34l9aADMIdL1OFeu/sa3us+q5mbSqnwEuNDAQIM6A4UAWY37VQ1Z7CSe?=
 =?iso-8859-1?Q?DSwD6HXWn9/DZYRVDUyHZDLghQntQKMZGfpUzSyMe9k2P2LDJjLeGvQD85?=
 =?iso-8859-1?Q?2k4NeQZ68w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4e48a8-1df3-4b07-7967-08de553d9123
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 20:26:45.2680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/VebNPxmpyk8L1IjEdTyQHkatUsO8mnYB6JJY+PdaA6SQudQV3wDtym3fXUeEaXHkJMkQrJcThmfpFWBLPOuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9465
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

On Fri, Jan 16, 2026 at 11:26:36AM +0530, Riana Tauro wrote:
> 
> 
> On 1/16/2026 5:09 AM, Zack McKevitt wrote:
> > 
> > 
> > On 1/13/2026 1:20 AM, Riana Tauro wrote:
> > > > > > > diff --git
> > > > > > > a/Documentation/netlink/specs/drm_ras.yaml b/
> > > > > > > Documentation/netlink/specs/drm_ras.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..be0e379c5bc9
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/netlink/specs/drm_ras.yaml
> > > > > > > @@ -0,0 +1,130 @@
> > > > > > > +# SPDX-License-Identifier: ((GPL-2.0 WITH
> > > > > > > Linux-syscall-note) OR BSD-3-Clause)
> > > > > > > +---
> > > > > > > +name: drm-ras
> > > > > > > +protocol: genetlink
> > > > > > > +uapi-header: drm/drm_ras.h
> > > > > > > +
> > > > > > > +doc: >-
> > > > > > > +  DRM RAS (Reliability, Availability,
> > > > > > > Serviceability) over Generic Netlink.
> > > > > > > +  Provides a standardized mechanism for DRM drivers
> > > > > > > to register "nodes"
> > > > > > > +  representing hardware/software components capable
> > > > > > > of reporting error counters.
> > > > > > > +  Userspace tools can query the list of nodes or
> > > > > > > individual error counters
> > > > > > > +  via the Generic Netlink interface.
> > > > > > > +
> > > > > > > +definitions:
> > > > > > > +  -
> > > > > > > +    type: enum
> > > > > > > +    name: node-type
> > > > > > > +    value-start: 1
> > > > > > > +    entries: [error-counter]
> > > > > > > +    doc: >-
> > > > > > > +         Type of the node. Currently, only error-counter nodes are
> > > > > > > +         supported, which expose reliability
> > > > > > > counters for a hardware/software
> > > > > > > +         component.
> > > > > > > +
> > > > > > > +attribute-sets:
> > > > > > > +  -
> > > > > > > +    name: node-attrs
> > > > > > > +    attributes:
> > > > > > > +      -
> > > > > > > +        name: node-id
> > > > > > > +        type: u32
> > > > > > > +        doc: >-
> > > > > > > +             Unique identifier for the node.
> > > > > > > +             Assigned dynamically by the DRM RAS
> > > > > > > core upon registration.
> > > > > > > +      -
> > > > > > > +        name: device-name
> > > > > > > +        type: string
> > > > > > > +        doc: >-
> > > > > > > +             Device name chosen by the driver at registration.
> > > > > > > +             Can be a PCI BDF, UUID, or module name if unique.
> > > > > > > +      -
> > > > > > > +        name: node-name
> > > > > > > +        type: string
> > > > > > > +        doc: >-
> > > > > > > +             Node name chosen by the driver at registration.
> > > > > > > +             Can be an IP block name, or any name
> > > > > > > that identifies the
> > > > > > > +             RAS node inside the device.
> > > > > > > +      -
> > > > > > > +        name: node-type
> > > > > > > +        type: u32
> > > > > > > +        doc: Type of this node, identifying its function.
> > > > > > > +        enum: node-type
> > > > > > > +  -
> > > > > > > +    name: error-counter-attrs
> > > > > > > +    attributes:
> > > > > > > +      -
> > > > > > > +        name: node-id
> > > > > > > +        type: u32
> > > > > > > +        doc:  Node ID targeted by this error counter operation.
> > > > > > > +      -
> > > > > > > +        name: error-id
> > > > > > > +        type: u32
> > > > > > > +        doc: Unique identifier for a specific error
> > > > > > > counter within an node.
> > > > > > > +      -
> > > > > > > +        name: error-name
> > > > > > > +        type: string
> > > > > > > +        doc: Name of the error.
> > > > > > > +      -
> > > > > > > +        name: error-value
> > > > > > > +        type: u32
> > > > > > > +        doc: Current value of the requested error counter.
> > > > > > > +
> > > > > > > +operations:
> > > > > > > +  list:
> > > > > > > +    -
> > > > > > > +      name: list-nodes
> > > > > > > +      doc: >-
> > > > > > > +           Retrieve the full list of currently
> > > > > > > registered DRM RAS nodes.
> > > > > > > +           Each node includes its dynamically
> > > > > > > assigned ID, name, and type.
> > > > > > > +           **Important:** User space must call this
> > > > > > > operation first to obtain
> > > > > > > +           the node IDs. These IDs are required for all subsequent
> > > > > > > +           operations on nodes, such as querying error counters.
> > > > > 
> > > > > I am curious about security implications of this design.
> > > > 
> > > > hmm... very good point you are raising here.
> > > > 
> > > > This current design relies entirely in the CAP_NET_ADMIN.
> > > > No driver would have the flexibility to choose anything differently.
> > > > Please notice that the flag admin-perm is hardcoded in this yaml file.
> > > > 
> > > > > If the complete
> > > > > list of RAS nodes is visible for any process on the system
> > > > > (and one wants to
> > > > > avoid requiring CAP_NET_ADMIN), there should be some way to enforce
> > > > > permission checks when performing these operations if desired.
> > > > 
> > > > Right now, there's no way that the driver would choose not avoid
> > > > requiring
> > > > CAP_NET_ADMIN...
> > > > 
> > > > Only way would be the admin to give the cap_net_admin to the tool with:
> > > > 
> > > > $ sudo setcap cap_net_admin+ep /bin/drm_ras_tool
> > > > 
> > > > but not ideal and not granular anyway...
> > > > 
> > > > > 
> > > > > For example, this might be implemented in the driver's definition of
> > > > > callback functions like query_error_counter; some drivers
> > > > > may want to ensure
> > > > > that the process can in fact open the file descriptor
> > > > > corresponding to the
> > > > > queried device before serving a netlink request. Is it
> > > > > enough for a driver
> > > > > to simply return -EPERM in this case? Any driver that doesnt
> > > > > wish to protect
> > > > > its RAS nodes need not implement checks in their callbacks.
> > > > 
> > > > Fair enough. If we want to give the option to the drivers, then we need:
> > > > 
> > > > 1. to first remove all the admin-perm flags below and leave the
> > > > driver to
> > > > pick up their policy on when to return something or -EPERM.
> > > > 2. Document this security responsibility and list a few possibilities.
> > > > 3. In our Xe case here I believe the easiest option is to use
> > > > something like:
> > > > 
> > > > struct scm_creds *creds = NETLINK_CREDS(cb->skb);
> > > > if (!gid_eq(creds->gid, GLOBAL_ROOT_GID))
> > > >      return -EPERM
> > > 
> > > The driver currently does not have access to the callback or the
> > > skbuffer. Sending these details as param to driver won't be right as
> > > drm_ras needs to handle all the netlink buffers.
> > > 
> > > How about using pre_doit & start calls? If driver has a pre callback
> > > , it's the responsibility of the driver to check permissions/any-pre
> > > conditions, else the CAP_NET_ADMIN permission will be checked.
> > > 
> > > @Zack / @Rodrigo thoughts?
> > > @Zack Will this work for your usecase?
> > > 
> > > yaml
> > > +    dump:
> > > +        pre: drm-ras-nl-pre-list-nodes
> > > 
> > > 
> > > drm_ras.c :
> > > 
> > > +       if (node->pre_list_nodes)
> > > +                return node->pre_list_nodes(node);
> > > +
> > > +        return check_permissions(cb->skb);  //Checks creds
> > > 
> > > Thanks
> > > Riana
> > > 
> > 
> > I agree that a pre_doit is probably the best solution for this.
> > 
> > Not entirely sure what a driver specific implementation would look like
> > yet, but I think that as long as the driver callback has a way to access
> > the 'current' task_struct pointer corresponding to the user process then
> > this approach seems like the best option from the netlink side.
> > 
> > Since this is mostly a concern for our specific use case, perhaps we can
> > incorporate this functionality in our change down the road when we
> > expand the interface for telemetry?

Yes, as it can be changed transparently, let's do that...

> 
> 
> Yeah using pre_doit we can allow driver to make decisions based on
> the private data or driver specific permissions. However we will need to
> check the CAP_NET_ADMIN when no driver callback is implemented in the
> netlink layer as a default .
> 
> Thank you, you can incorporate the changes when you add telemetry nodes.
> 
> For now, I will retain the admin-perm in flags.

Cool then, when they come with their case we remove it and force in the
pre_doit as well.

ack..

> 
> I will address the rest of the review comments and send out a new revision
> shortly.
> 
> Thank you
> Riana
> 
> 
> > 
> > Let me know what you think.
> > 
> > Zack
> > 
> > > > 
> > > > or something like that?!
> > > > 
> > > > perhaps drivers could implement some form of cookie or pre-
> > > > authorization with
> > > > ioctls or sysfs, and then store in the priv?
> > > > 
> > > > Thoughts?
> > > > Other options?
> > > > 
> > > > > 
> > > > > I dont see any such permissions checks in your driver
> > > > > implementation which
> > > > > is understandable given that it may not be necessary for
> > > > > your use cases.
> > > > > However, this would be a concern for our driver if we were
> > > > > to adopt this
> > > > > interface.
> > > > 
> > > > yeap, this case was entirely with admin-perm, so not needed at all...
> > > > But I see your point and this is really not giving any flexibility to
> > > > other drivers.
> > > > 
> > 
> > > > > > > 
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > Zack
> > > > > 
> > > 
> > 
> 
