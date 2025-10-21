Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5211BF9199
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BCC10E668;
	Tue, 21 Oct 2025 22:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dp4bl0A6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D380510E66E;
 Tue, 21 Oct 2025 22:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086670; x=1792622670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cRTpLDZ1eVS4zp52aU6AfETpHhMBbg5zvTDZkvqkxHY=;
 b=dp4bl0A6NWOfOoHCz90l/H0mhOdqeYqMbw5sbnvWgWk2O9YB1tV09jXP
 UYmeb/lJL2xRzi6CJK6+nQk+JqdvxLycmss/cuz7JkCuRk6wOIm3vtCgO
 bKlPb6ecIDhdQx9v27N9MPgleruPXMe60CjumOtCUhs5Q0TSCIhS6rJCk
 Rr16deIXokqFKhD6lan9IMF9/Qoy4/444qdwhh0NtfqWiXITeJB3tvRPo
 3hCz8dn5SP89ZubL4Ir/oh/svnUgB3tueAl8WuAIRJSsuaok8P/FDagTo
 F3/8kJShoH1ulcwQFg+dnFYt/+tSc4Mq7HOFKi8FyMnkRwMSinJtRcFQy w==;
X-CSE-ConnectionGUID: 0tkS7oVvTiOP5xam4KPSjg==
X-CSE-MsgGUID: 47Fcc2H1S4qx2qc/UYDkrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62926762"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="62926762"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:44:30 -0700
X-CSE-ConnectionGUID: DToq8d4yT62QA38gkLaw4w==
X-CSE-MsgGUID: E3wg9mJ9Rby2oRm3lXMIcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="214345872"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:44:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:44:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:44:29 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:44:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=He5NAgA7WfsK0jwOr5sqGIg6hFyxqE8fwpsPOmmAPC3Lgjpch5EJ5KaxxBo4GLOB5HHHRYQLPX37p1rTtClS6W6We81V+DMr66W2oShdLt1apZ0W6WguDFusrbapNtao7X5/jivdZgGrp/yKwbGHgH5wK5hgi1+PEnJEBuHvYN6LVJthTJAiN0mfbQ+lh5HX1V2QQGrf1uAbbQSBg69z7Q70WVmQoWaJZsPsjoFKpNxRpxq1meI+7Xt4e6FpuXSyhJTi/KoJL0SF8EjQpFbfJGpGNDt2QYRnSPZnY8121zIJR2ReGfrxX66mE8XKepyBLT2ESb4DmjjWufqe2RLISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdwjkZxdyWSsYJ0eIFMPMthEffuog9/jcSviTtFT+5Y=;
 b=B2sd6+3eaCURUoj/VchPTv7iaHXH6uhyvsej0lWslJ5gAEuQRpGdUNBVD2A38GTa6vBjcS/HE1rOd4i9tUHkH2PS/KnaG6mBkvtQYRZ+vZG66fcEQCwlmLthG7+97cFtAL4+p9DcUDiaNCmruCFY5oE6VefZ4P8s2Y9BCUf4oo/J4TOODqriFigZg+mFE5Ep6HfAnpkG4clR330JzGCyNXYJMOmH9JOxy5T9Vd4Iti3WK16zVJb+cpovPKfu3GFjco6D/+N1M9CKY+w3Glm8fs4PUPMaCd+NQb2iFRNqo2MFMASl98PXdS8uBLnrm+BaNTGvAH4+wENoUc8qtcJvnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF28037229.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 22:44:26 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:44:26 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 23/26] drm/xe/pf: Add wait helper for VF FLR
Date: Wed, 22 Oct 2025 00:41:30 +0200
Message-ID: <20251021224133.577765-24-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0290.eurprd07.prod.outlook.com
 (2603:10a6:800:130::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF28037229:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e6f113-0153-4c32-3e79-08de10f36363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlpMRmI0Zi91WVUyUHlKL1JBU0ZEenlFbjg1MzY1YytnMytDdUNlRXpXdTQ0?=
 =?utf-8?B?bWZTaEQxNzRka0NObXNOWFVnUkE5SkUzcjdvRjIvclVkR2pzWFR2Wm9VeFdK?=
 =?utf-8?B?NUh0akJ6YW5oUWZ3ZkszN2kvZGl3VmhUQ2ZML2VlZ0Fzc2gvUHNkTWhqSVZw?=
 =?utf-8?B?YWFoNFNVVG5MMjUrT2xCeUdmd1RZV1BucnQ1UWN3a2dKZ3pIRVUwUlVsbGtF?=
 =?utf-8?B?NkM1dVpGUkpTYXFBbkpGVWhnYUxoRnlrOTZTd3ZjQjBLUW4zcTdycS9HTFNB?=
 =?utf-8?B?SlNkaHY1Y2ZMY0dtWjJCVmNJTkx4WEZBSlZhcE1BMjc4RFhXa3JqN3p0NGhm?=
 =?utf-8?B?d0xHbVNtZDBETHRESW0yd3VwSEl2VVRPeEI5ME9QaTk1Z3J1czNFWVFsSEd5?=
 =?utf-8?B?ckFlYzFTREZyMlRaM01Eb1JSMnlIUFR2STZWbzI1SThmWWJDNDhqcHpvWUVi?=
 =?utf-8?B?dW16djdacFlLMkZueklqYmFZb0gyRVNuajZ1YmFWVUx6VFNJMml5MysvS0NW?=
 =?utf-8?B?R2MwWjVrWVJHSVpQSHFGOEdrNHA4bjVkcFdieC9zdHZZdCsrUFpGTExzeDg3?=
 =?utf-8?B?aFRNYVJieXVIb0RzblhxS01VNXd0dGZxL1Z4QjM2NHZ3UTRBa1pOSDRIaTNj?=
 =?utf-8?B?UXBSL1IxL241L2U3R2kydE5maWF4MGxUQVJZM1VvdGpGc0pZM0xBWmNyOTNy?=
 =?utf-8?B?TFpXTzJtcHN5RzVKNjJzeUJ4b1NZcXIvemlqeGw2aGMzNmk1QzJkVXRRMm13?=
 =?utf-8?B?ZzcvbFZsVjZUQ2x4SmNwN01UWG55enk0ZWJ2RWE4b3dLcmtwWWVTV3F4aUs0?=
 =?utf-8?B?Rlg1S1VxUkJQbmxoZ2xUcTRZV054eW53OW02VFNJOGNZK3FTNm1PK1M4aTBt?=
 =?utf-8?B?bWt6d2FWYmZDVDI3c1dRa1VmRUNXZUMvNThIMVgwb0doN1dXYnZvU3JlYzk5?=
 =?utf-8?B?cm5NNittTVcwNFd4NE4zUkM0ZGpvOXAwM2NMRjFTVmhCRlZOT1NpMmdDelZ0?=
 =?utf-8?B?RnBpdlljVDAydCtCN05UanYyYm1BbnpaeHpFS0N0K3lkRlVnK2phUWVBRXFl?=
 =?utf-8?B?TGRxWlBFQ3E0N0NYR2Rnc0NKakgwck1kVWU3OHd5NUpKTlFFcVBhanNwSkda?=
 =?utf-8?B?UVErUzdCbzhDTCtvQWVSbTFobzVQRFZJcXEwVnR4VzljajEwV01PNk1wQW9n?=
 =?utf-8?B?Z0o1QXlja0FiVjQydWdVZEt0UForMm9IWlBjZ3dQQmc5TVpkK25mNDM5bURq?=
 =?utf-8?B?MWpwTHJLcTZMREEvK3VwWTNvZzhaV2NDSmJOUmxtN1U3L1p0S3hub0R5a1RW?=
 =?utf-8?B?V2QveXV0NElDVkFSQ1AwOFB4N0RHMXZkU29SZ0ltV1R6aytTZVozL2FzczhP?=
 =?utf-8?B?dmxOU2pZaXdxckhnNURFZDFjSTVraExJTlZ5QUhRb0RYVlk4MERHcWJlNjVR?=
 =?utf-8?B?MEs3ODQ5SlhyYnlTcHdWYmV3ZXRCK3J2U2hzd1NEY0wrRHpTdkovOHdYa3NK?=
 =?utf-8?B?eXRTSG1IVzhPTUt6YW1CUk1mZWF0L0xiOW0xNGJTOHlpbStja3JQQUE2K0ha?=
 =?utf-8?B?MmZWYjdGRWYyL3JkMy9ZeEdzSTZ6ekxqZlhlZ3N3bVI5eWRBTC9KMktQdGND?=
 =?utf-8?B?NEMrdkhaM2piM0wzWk5qdGozekVyQzIrbkFOcWlMRFhCbHJlR0ZUUi9sbEd1?=
 =?utf-8?B?SVY5S0ZBSUV1ZjNhcTNab2tKQ3VMeWZUeTFYWjFrMEQwSTFFQTVwRnNsSjlp?=
 =?utf-8?B?YWt2cFd3c3d5bFptdXlJWU02dEE1WFJZd2t1TnFhQUNpMGplckNOelFkdmE0?=
 =?utf-8?B?eU1xRmw3QXpLdkxhbWhrN0pTRkdNTTV2eGVkVkpMa3laa0VaSTV2MXE4MmtT?=
 =?utf-8?B?SUN1MmZBWC9PdDlOUGU4T3ZLKzlNaDdlNlRBV1FJOWJPUkhTR3I3cFpjaFY3?=
 =?utf-8?B?bHE2Q3ZTUko2d2Q2ak1EZEFKckNXT2NSc1JycWFESVc1dzJTaEltS2YvU1BY?=
 =?utf-8?Q?23RaC/yVAcn/sGF2NW+MsRfUgI/FPA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnlTaG9XZjlkeG5JRUlwa2xIN1FLNmJNc0I5SHNqc1N5a2E4VDlld3d6Q20r?=
 =?utf-8?B?TzRtYStKUldmQnlFYlZwZ3BuS3BYNXN5QmlMaytUKzBXcEM0MXNqQlJiNnJw?=
 =?utf-8?B?OXpUaHV1OVlQd0g2VWRYd1M3VmxLSWx1aDljbURSYXlqbVd3K041Z3VLTVZi?=
 =?utf-8?B?NEhNUm5QRk5sbG1oOHcrbG1JUGxZakc4MzZtVjdmUnRxQW5OejEyZmdBV0V5?=
 =?utf-8?B?bWVSZzgrcWZ0OVlKT1htdDlwanBMYUlQT0ZRZGN6cXh4ekwwMnBFU1REMlBV?=
 =?utf-8?B?NlQ4YkVzSVNFUlQyUjYrczErd3lMRERBU05kWlVHOTlSQys5NEZoQWxJR2Y0?=
 =?utf-8?B?cVI5dmJQckVNTzNzM0pGeFZ5U0E4QldCV1U3SU9uMFM2bGlYMWlFZWZVWGxG?=
 =?utf-8?B?MXlLcjFqUWswS2k1VXpGMGk4RnlyZEtGSGR1MEdaeG0zYjZ0TXo1bVJWRDg1?=
 =?utf-8?B?OEV4Vi9EUS9ES1VuK245VEtaamJLMUNFSkxmK2dXdkR3anY5enc4SDJocGxq?=
 =?utf-8?B?dTZHNFZIK25jcFBsUk5BYTFkeFdpL2w2MHg0R0lNMEQ0Ky91YzJWU0dsQU1R?=
 =?utf-8?B?aVpNS2ZJT3ZNcnZvTGRFeTFZWkp5ayt3R2lJdGoreG5QcjdrOEZLcnNleWRH?=
 =?utf-8?B?MjkwWDNTU0hSYlhTaS9hdjBlSHpBN21zTm5jVTczeUQwUStvTFRNZ2t6akJW?=
 =?utf-8?B?a2NMT3ZDbFp3cWp2ckxTRjFyOGI3a1ZGcXJiSHR4U01mQVZQVGltQVlueDhO?=
 =?utf-8?B?SmZXUGJBUW13UHc5M2xjV2ZlOXNPbDR1Y2luTnVPNzFqeWFVNWE5RG81MzdP?=
 =?utf-8?B?ckMrdUR5RjM4UEc2eW9qRkczMW1UN0VweXQ1YVZmV0JTeXJnODhXWXk1L1Iv?=
 =?utf-8?B?dDhiQTg3cmxwbGdweXlJbWNEV0lTUk5JV2Q1Snh5eXJ2dTd5MHVFTmczNzJB?=
 =?utf-8?B?V2Z6cHZIWTJNS0RiM3FpMHVJRnJNcUEySW9PS21qNVUxaTVuMmJYSTI5OG5a?=
 =?utf-8?B?RU50OWVFcGo4bWllcFVwc2wwNTBFTkxNNUFFWlIrRy9sZ2lqTm9UdHJPcFlh?=
 =?utf-8?B?QStHU25paG53SDJoN2dJTUFCeTE5Tks2N1VkUlhCK3NpQk9IVTlKTkl1a3BL?=
 =?utf-8?B?ZzltbGNjdTBDTkFldi9jWjNBVmt1R3pYMjI0VUJQRkN0MGlLYTZ1aGNNSjlh?=
 =?utf-8?B?SmxEbiticnRDMFFQc0JLemsrSktEdFl4NEJISDBzeXV1c3lVdVJWNStuaS9i?=
 =?utf-8?B?YnUwVlpPbStkc0Z3bzlhaVRnUEUvQmRNN2t1OWdISVJldStMY29CY1VhNjVZ?=
 =?utf-8?B?c3YyOTNHelRCa2NYeWhOYmk4Vmg0b08xMUVxWmFFSUFxV296YUF0dlY2SmdQ?=
 =?utf-8?B?ckxhQkhIQlBjVWp1N3c4U2RqcTBOVGZ2TEpxWE11VHY3NmpxMTBZNkdFZklt?=
 =?utf-8?B?NENxdEYzNkdsaFJFeEVYZlMraDRuVTdqekxHNVdiYjQxeGRMQnZzaUhyZ29C?=
 =?utf-8?B?Nm5DazdLM3MxZnVkaHV4MU1QZ2NSN01RV3VIQWRZWEI1eE5JRmJjdkFQM0FQ?=
 =?utf-8?B?OHhYUFMrV1RtL24raWVEQ3I4eWhaV3JWclUrWTFKbDI1Z1VJK1FNYm9IaDRX?=
 =?utf-8?B?cG9paEMxUHZ5WjExdEdnSzM3OXN4Y1BEbXFwQXJMRzhZT0RFWnFPK2pZWmU2?=
 =?utf-8?B?SSsvb29JZzZkVUhoSFk3dDdNSmI1OXVGRDNSZXhtZEhvNFNSaVcwak5JUnpz?=
 =?utf-8?B?WU94Ni83Z2YrTkQ2bThmV0x5eEJ4dUFGRjFxalZ0SHNScXlHTlZvdHRBTU9V?=
 =?utf-8?B?WTRVd1pFSEZ5QUlsNkUyWGRBbzNVWnJ0eHFBa2RSSDZxZTRLOHlWUXorNkNS?=
 =?utf-8?B?M3Z1cnNqM1lwalhDTHM2L1dZNGpxd3NycFkxNzQrYTBqK3hMUkRJaGxwdUl0?=
 =?utf-8?B?VlNMalRkeVNmZHJUUy9xZFZvUzJNL3YrTVJ0L0FldUF6eEdQSVllU1U2dzlN?=
 =?utf-8?B?TFB5K3FwUHBzWFZyRkg0UDlscFRRd0VLSnVobE4zZm9vcUlhQ3g2VFhBdTRh?=
 =?utf-8?B?VVVydXpMeG5qckI0WWpBNWswcU41UDI2bTF2TWdKZHRDeHZTQ2dTNG1UQlFQ?=
 =?utf-8?B?STFkNEcvWjJRTklld0cyVy9mNWhLNzFDdEoybWp5Z21GZVdRQ0FZZWZNOW04?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e6f113-0153-4c32-3e79-08de10f36363
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:44:26.4814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jekuk0J5NFc+vmFF8sbbHHRPqxeWBhbtQqMWv3ywpM+mLkcAcRV0fl4gMA0OPwwWcyDqg/iRqYwtVE7GZJHhJX/CiuappZ0/q3eM0k2NnVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF28037229
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

VF FLR requires additional processing done by PF driver.
The processing is done after FLR is already finished from PCIe
perspective.
In order to avoid a scenario where migration state transitions while
PF processing is still in progress, additional synchronization
point is needed.
Add a helper that will be used as part of VF driver struct
pci_error_handlers .reset_done() callback.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_control.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index aac8ecb861545..bed488476706d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -123,6 +123,30 @@ int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid)
 	return result;
 }
 
+/**
+ * xe_sriov_pf_control_wait_flr() - Wait for a VF reset (FLR) to complete.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_wait_flr(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_control_wait_flr(gt, vfid);
+		result = result ? -EUCLEAN : err;
+	}
+
+	return result;
+}
+
 /**
  * xe_sriov_pf_control_sync_flr() - Synchronize a VF FLR between all GTs.
  * @xe: the &xe_device
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
index 30318c1fba34e..ef9f219b21096 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
@@ -12,6 +12,7 @@ int xe_sriov_pf_control_pause_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_wait_flr(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid);
-- 
2.50.1

