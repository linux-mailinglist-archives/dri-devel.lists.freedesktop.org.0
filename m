Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5630EC2242F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5748510EA51;
	Thu, 30 Oct 2025 20:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmc24vIa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FCB10EA49;
 Thu, 30 Oct 2025 20:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856383; x=1793392383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tNDT+7OE+ntSE522KRdSE2g/UX4j15w4egmqieXBzyY=;
 b=lmc24vIaW6I4WRApgGyKAIzRpX8OaFV5mT9dAvOA/FZ52GckeLCnQIrl
 qGl4eq/PNyVmAqTEYon0GX/xU9HQ3ZqGaQD3x+nWoMwc8i1KVv6bK7+Mp
 Ff5AXinF3m+lscLUdGcpzElEGk+05all4Q4k2EajYWUTUrkVSRAoF36Bm
 ovirEroJugzC853o18wSwUd64MDI8kyp072224PyyiklN9pkzYuBTn8/Y
 fmvnMfvgSoKKF2aW2FNK8U+s5vpOYX8iFGkYwt51PnbzJHZtilpRffHty
 hpPGkn9FXgd/r2IvGCwvx4i1vaBHbwIX6oAcNbj4txEu80y7lZ+SDCTK0 w==;
X-CSE-ConnectionGUID: /kkjBWDpRryydnmI5qxLyA==
X-CSE-MsgGUID: MtVpxhV9TqO64QrJ0BM4Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74611386"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="74611386"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:02 -0700
X-CSE-ConnectionGUID: kubHIRM2TEagANFOLOWF/g==
X-CSE-MsgGUID: lun99omTQTivDUBBBRR2og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185262611"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:32:56 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fsao9XGvpD1j0lzsU1/kXMCbKiVFR2A23Co5JGE2zdgrsA6/yZ99CgO6wyEgA11b/t7gjus4DwVnTtrq8Znq1cuVfoGVt+RlfuknF85mSo2RabqVbooaAf6rvhCKGIzJrqRc4OltzWJpqNv9nwhgk8a8DUdhp2JwipWQYnKptMrgmb1+t4O7yQ5Jh0hHjHo5WPJEh+iQli8l0uJq215h/uN+BbkBYCHTk6MRcj9qlvbdPrjxVejM9/hv9g5juHjFsA3RfqAMM1k5g7U6tfTKEeGK8Qin1j+in7ecVqFxv5Y7+lDI9ukc8qdXpqNthEzIdAxBssLKXz6MrJTAPVhoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0QGiSd9eldOov2F0iovHDb2mlyFaTWLcM2ttDfjUZc=;
 b=Xi4TfE+bhFgNoxcgkPk/oB00E0TMy4RQb1FUC+CXkYo8Ms5oEWsIEZDlV+6GeEXnlAC7VjUcud3GQYpbG8N1aERCbX5hs1jouO/7zAQx/BXszToTCUBjXVzrjjmFoZWSnR8oo+FB54qhbvzHNo6ka8wzGVKwQ3xkVpeYJTMtHRhEjPAYOY0OP4HjjROhsSFb3KCjGbYRY4SZQcSda2joQLSDUBU1+kgHsosQzxMNBixgnqugecNxQsuQjMmUMUpSfJosBbwQsQCV8Lqj+j1hSbE5y+umlplZN34oIN13QVUmugATX91TbLxuriM7fpZUZ6AsKRaBDY6kGmUTTIgX1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:32:54 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:32:54 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v3 11/28] drm/xe: Allow the caller to pass guc_buf_cache size
Date: Thu, 30 Oct 2025 21:31:18 +0100
Message-ID: <20251030203135.337696-12-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0102.eurprd04.prod.outlook.com
 (2603:10a6:803:64::37) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: c5456c80-443d-47d3-976d-08de17f380d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHpnUnA4ajB1VFI4d05wUGpXV1ZDRTNpUmlDazhuS2lJVmRGbXkzNGlQZUd5?=
 =?utf-8?B?VnpEd0hNRERITnMwRU0xelp3TWxaTWxqeE54aDh1bGZySnpta056bDR2QURZ?=
 =?utf-8?B?a09QSld5L1d2Zm9xS2ExWFNZUEZsZU1ESkd2U2NET3JPMXRDaWg0SE9mOFRh?=
 =?utf-8?B?bmcyS05KbW43SGRJbUdkM0J0U002WHdrQXpPaXB0LzRLOGk1ZHhpV2d0T1d4?=
 =?utf-8?B?VVBQV1MzdWFjSzVHRkxSa0lQSE9aMWl4RmtXMzZJQXNvU3hvcFQwVFE5Qkda?=
 =?utf-8?B?OEs0L1EzNFkxTytVandmaG1BSkxkV3MzdFRCNWhrcHJJMlJud2RNUUZBZGg3?=
 =?utf-8?B?MzA3L1dkTmxLR2JPMHZ6RHJKcTZLa3JTVWQ0M3VlZmNJZmF4WHpwc3YxalBB?=
 =?utf-8?B?eitOWHBCaUFLS1R3V3NHZEMyTEJ1YWNMdXZOY0dUZ2ROS2ZMVzF4YWJ4ci92?=
 =?utf-8?B?RDlVS0JxOXhGWDlMTFBLdGNkZ29xU0pmaUxUY0ljblhENEREd29LU2JXaWVl?=
 =?utf-8?B?cUtHa3BjUmdHdGQyaWJGS2JoZ0p0MERaTldyRzFmTzJMSG9YNS9uZDdCcTB3?=
 =?utf-8?B?Z0EvQnFXcW9TOS9OUytGc3FhU2l0MkRFek9yV3BIOSs0RHJwWWwzVkE3UHNQ?=
 =?utf-8?B?L3ptMUZPajZxR0dWdDNESGVxd0tLTFNrWTBBK2ZaWGpkeXFYeEo4MjdYL1ZK?=
 =?utf-8?B?Qi90L2tSbEovN0hnOTBiVk5XZFc4MXJvb3NXUnRNYkt4eVRRMjNkYTQ2VFcz?=
 =?utf-8?B?cXhia0VtN245SzlpODBEblNiMW5VUkI3M1JYNjRES3BKR2p3cE5uMTJIenM5?=
 =?utf-8?B?NS9xQ3MwY2tubmJBaWN0UnpJN1RncnRUclhzNXRCV25ubUM1bEFIajQ3eWpC?=
 =?utf-8?B?U2ZWRzg3em45THR4NFdlK201YWVlaStRYnpTVG1ZenJPSGl4aDBXaW1tTXNO?=
 =?utf-8?B?MnVTSnFucjlueWdiR0gyQVVkV3JrZDdYS0xxNzJRSTJ0Uk5rZloxTHhTVitQ?=
 =?utf-8?B?by81ZDdrcEFpNGFKckE0QXltUm12NDRyTXcraHdITTJUUmdHemFwL1pYWlpx?=
 =?utf-8?B?eHVqR2ZmdGk4elJIMVBud1ZGWWZPSExkK2FhYmhaUnVFcWx1ZHoxaU1xck96?=
 =?utf-8?B?YXlxTW05TDF4cWJlQkRRekJJVEw4OStOSHZId0VPd0lnK21QTldoMGhFazd2?=
 =?utf-8?B?R2ZERVc4VXB1QkJ4d3R6Slg0Z0tIUWs4SVRjQitGc2E2SWY1Z0NsZFZBT1Z2?=
 =?utf-8?B?alFqY3N1cnJic3VScVUyb2gzcVl5QzRLSkp1c01SWWk2ekRhbTREYXhRWmc5?=
 =?utf-8?B?aGJEOGMvWkoxMVdBTVltUXRyT3FMUURCZE9KTzRkdjN0bmlaWDBHT0QxcVox?=
 =?utf-8?B?Q0NhVUJEM29yL0RhZmc5UVVHMFVEOUl6QTVZMW1JbXFVTmptZVlKd3dOSkZ1?=
 =?utf-8?B?NXhxT0lvNWRELzIrR04vd0xxYzJwZURuU0dRekVQRzM4ZGNxbGRzeTVJblda?=
 =?utf-8?B?bUhzYkJ2eDdzQzVNT20zQndQWlpsK3FNWFdwcng3MmsyZHEwakRCNUdpbjEz?=
 =?utf-8?B?RklVVXpHM3ErWlQ5TC9PVGw3MkNMbm4vMFFabVk2dlBPTU5DdkZVMmVYbjds?=
 =?utf-8?B?b01HeUdqVWhzeU1FdDZEdkdRY1FaTmlUcmxucUJLdHNTTllhVllzMEdWb1U0?=
 =?utf-8?B?K0k5ZXhuS0tob3RKeHpndmdDdzhVYXNFa0w5WmhyN0hUS3AyUWZtRlFXWGZV?=
 =?utf-8?B?VFMyWTE5WkZwQ2FLZnNaYWIrMlVyQUYwT3plWThCUUVHNS8zS2J5SEJjVDNT?=
 =?utf-8?B?VE9HaHVhV2FjOHlxVHVnVXc3ZHNBK1NRYWQrLzFVUWM2MGlFRDFOZ1lDczVa?=
 =?utf-8?B?TEJZQ2JMU2U0OGtnREpwNG15c2M0U1FONWhuSGJjeGF3S05hUkpRM0xNUHZq?=
 =?utf-8?B?TkcvSVBNSnhXUjFBdXNJM1ppb0ZpK1BVcDM2d0FRbEpEdVdnTkgrREt6NzBD?=
 =?utf-8?Q?q0MONoy8m4Zm7PChxyg8RbZbI4p4Fc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2NEbFVZZG5HWUVneVZaTzdqcnhjWlZuUU8wUFRwZnU4TjhtWnk3ZURVYnFv?=
 =?utf-8?B?b3Zaam04RlJmNkJyaWo0ODk0SnRSR1oyRGR4YXdza2doWmNWZzlxZ09kSHRx?=
 =?utf-8?B?ZXJGekFodXdMYkYrRm5KKytHWE9Nek5Kc1lYcDhPd0RkVll4SExlOGVGRGtE?=
 =?utf-8?B?QVJkWGhsWWlWbGdrajJIWG1lU21UaGl3cXQ2RDZpYTMwK3loUXl2RDBZZlVM?=
 =?utf-8?B?NDFZa3hLMW1ET1VWRDRFTFh6aS9ja2krTTJ1WDcyQ04vWlhlcFFObE5mRWpY?=
 =?utf-8?B?YWZUK0ozeUdZVmtvMkNIMlA2Vy9ITmcvakc4NjF2aTBNNWIrZTAzaTA0WUJE?=
 =?utf-8?B?OVluZDAxWldMc2I5RHBxWWk5Tk1QbzRkUHl3SG5ZbGFFdVRQSDFHU2JFM3lS?=
 =?utf-8?B?ZTRLSGNURmhYWHBSMDBQZTZyTWs2anl6KzRYZ2QrMTBiaWVXc1hiQnI4My91?=
 =?utf-8?B?SVlieDloSksvd1lYR0NLVVFmT204VzhwV2NQVU5CcjlBTXhESVNvMGNMb0pO?=
 =?utf-8?B?RU9TTUF4QWdnaFQ0STdMM1FEdWN0YUdnWEIydnhTNmxob3d0YzJWREExR1Bu?=
 =?utf-8?B?aFh2RkY5YWxWZ2FwVlFQQ0FUbzNDcE9PZEN5ZGxEQ28zY1JxWStaSXRwSXA5?=
 =?utf-8?B?NFI4Njl1d0xTenJzZUJhL0IwZGFrblhSdU1Db0g5ZzdHcEZvbzNwbE1zaWdP?=
 =?utf-8?B?RnFEOVdUUzlSR3Vibkg3RkZWdHZnREt2andSUEI3MWk2enliN3A1WEdoYVlz?=
 =?utf-8?B?MVFXKzdhdnMwOHFzTzV0L0NicUJackZFb1QwYS9zNWRvQVF1Z1ZVdUl3aWU3?=
 =?utf-8?B?N1JrUk1XTzJBOFVSRmZuaFRWKzgwU2laNnBJZmdJa2FRRlkvaXZiODhsVFNj?=
 =?utf-8?B?Q2JjQnUzSnZnWnMzNXpmT0NkQ2JSRjg5Ty82ZjFBNTdaNVpNcVhhV1JkTFF0?=
 =?utf-8?B?alBDV2tCM3BZdS9tTy8xeWtGM2VUSW9VMmJ6TFBQeVJNN2xVWjYvZnozaHBM?=
 =?utf-8?B?Ukt0THdFMUhNRzVkSjFkVHBySXJwQ3g2TmdlWWpock1nSUI1Q2JIS3h4RzIx?=
 =?utf-8?B?UGh3eW41cis3dHlKR25uYi9OTGtXRnlPZHo5bXNTK1doQlg3WHB5bkE1NGph?=
 =?utf-8?B?ODZvckNBMHZJRTZ3dWJZTVhWeG9hNjRDNGl0aTdwcjdTYmM0bS9iWTRqTmVt?=
 =?utf-8?B?VHBhNG5HSGkwWW1oRE9WTkxjQlY1RkJxSzQwN0VpQzhZWll6MlVQZzMwWFAv?=
 =?utf-8?B?ODVjMzZqYlorT0tRM0xZTlNtOE84NHYvMXZTRUJWb3BIZmdndFZhUmFCd1pB?=
 =?utf-8?B?UCtUTXNpdFZja0ZlQzF6ZXRkR205eEt6b1RlT3ZwNElqYVdXTUNiUXpFSUVy?=
 =?utf-8?B?U0drUWxhTklHYXNWOTdSMlFXNkE0V3hRaG5GdHlFY0pmOEdITTFvWHlVUUov?=
 =?utf-8?B?bTdlT2hzbkpoNXlUaEJOdTl5dEhNT0pwZzgvRVdCZFNkeEltSUNRMUd5NFlB?=
 =?utf-8?B?emdPRms5b3dSRTA3QXVqdjYySzNsTVdSNDA1eUI4bGxWWVVJZ2VlOTZDSXps?=
 =?utf-8?B?VjZFZDEwbVhlS1BqUytmTEFJQzlqdlJ6SWlsT3QvaXl6K2VQblFlSmdLMlhx?=
 =?utf-8?B?clNjRWF1OG1jYWw5ckFVS0Q0SmR3b1laY2liNXpVMnBDZXVubDExNVZaN3F5?=
 =?utf-8?B?dnFXam5Pb1FJSlNzTzJKNGhueTZGWFJCUlg2U0JVSGkxeC9BTS8xM1BYL3Ru?=
 =?utf-8?B?SXFmdFRoblVkZzBHTlN2OHlYcWVBZy90UmdlWGttdHQxdVpqNFJQa1ZBODRo?=
 =?utf-8?B?dy8yUkJNVU42dHdzL0tYdWhxUUxucklaZTltU1pwOHZmQ3NmYjgzNTkxWlMr?=
 =?utf-8?B?L2Q2bG5kU2p3UFNwbkp0RlVBOG9mZmhlNWwxelZKQ2ZVUVBnN3BkV1d3eWZE?=
 =?utf-8?B?dFRzMTlDRU9WTnZSRWg2NHdYQ1haZkpZZ3ZVcTJqd094SjN1YndTSERSbDcr?=
 =?utf-8?B?YTlITXlsaFJ0cE1xdFZnUFYxUEg2L1dOdi9FOHRIOTdWbGhrRGtPdUUvd3hq?=
 =?utf-8?B?RUE1U3I0VXJ4MFdJUDdCRnB1Tm1XRU9kUDYyVmNyMVE5VlRKVTExQ3BBdm96?=
 =?utf-8?B?K280Qzd2c0l4RTFqdjdqZ1VudWt5RERsR05OMFhiUU5ZU3hMekNDWHRlNVhZ?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5456c80-443d-47d3-976d-08de17f380d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:32:54.0754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pMjor6Es5Ty4vl/GgBaA9z8tXYbNKesi59c76NWRbgSNW5Kfb0mzmeuCLGlk2fyOdbwm0SY9/1iX5Twn8vjGM7WhC7awHBblFiMtD2xBOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
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

An upcoming change will use GuC buffer cache as a place where GuC
migration data will be stored, and the memory requirement for that is
larger than indirect data.
Allow the caller to pass the size based on the intended usecase.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_buf.c | 44 ++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_guc_buf.h |  1 +
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 4d8a4712309f4..3ce4425001303 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -13,6 +13,8 @@
 #include "xe_guc_buf.h"
 #include "xe_sa.h"
 
+#define XE_GUC_BUF_CACHE_DEFAULT_SIZE SZ_8K
+
 static struct xe_guc *cache_to_guc(struct xe_guc_buf_cache *cache)
 {
 	return container_of(cache, struct xe_guc, buf);
@@ -23,21 +25,12 @@ static struct xe_gt *cache_to_gt(struct xe_guc_buf_cache *cache)
 	return guc_to_gt(cache_to_guc(cache));
 }
 
-/**
- * xe_guc_buf_cache_init() - Initialize the GuC Buffer Cache.
- * @cache: the &xe_guc_buf_cache to initialize
- *
- * The Buffer Cache allows to obtain a reusable buffer that can be used to pass
- * indirect H2G data to GuC without a need to create a ad-hoc allocation.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
+static int guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size)
 {
 	struct xe_gt *gt = cache_to_gt(cache);
 	struct xe_sa_manager *sam;
 
-	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), SZ_8K, 0, sizeof(u32));
+	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32));
 	if (IS_ERR(sam))
 		return PTR_ERR(sam);
 	cache->sam = sam;
@@ -48,6 +41,35 @@ int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
 	return 0;
 }
 
+/**
+ * xe_guc_buf_cache_init() - Initialize the GuC Buffer Cache.
+ * @cache: the &xe_guc_buf_cache to initialize
+ *
+ * The Buffer Cache allows to obtain a reusable buffer that can be used to pass
+ * data to GuC or read data from GuC without a need to create a ad-hoc allocation.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
+{
+	return guc_buf_cache_init(cache, XE_GUC_BUF_CACHE_DEFAULT_SIZE);
+}
+
+/**
+ * xe_guc_buf_cache_init_with_size() - Initialize the GuC Buffer Cache.
+ * @cache: the &xe_guc_buf_cache to initialize
+ * @size: size in bytes
+ *
+ * Like xe_guc_buf_cache_init(), except it allows the caller to make the cache
+ * buffer larger, allowing to accommodate larger objects.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_guc_buf_cache_init_with_size(struct xe_guc_buf_cache *cache, u32 size)
+{
+	return guc_buf_cache_init(cache, max(XE_GUC_BUF_CACHE_DEFAULT_SIZE, size));
+}
+
 /**
  * xe_guc_buf_cache_dwords() - Number of dwords the GuC Buffer Cache supports.
  * @cache: the &xe_guc_buf_cache to query
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
index c5e0f1fd24d74..e3cca553fb004 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.h
+++ b/drivers/gpu/drm/xe/xe_guc_buf.h
@@ -12,6 +12,7 @@
 #include "xe_guc_buf_types.h"
 
 int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache);
+int xe_guc_buf_cache_init_with_size(struct xe_guc_buf_cache *cache, u32 size);
 u32 xe_guc_buf_cache_dwords(struct xe_guc_buf_cache *cache);
 struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords);
 struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
-- 
2.50.1

