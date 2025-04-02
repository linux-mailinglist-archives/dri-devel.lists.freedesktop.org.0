Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B68AA790C8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C8810E7DA;
	Wed,  2 Apr 2025 14:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1IcAlwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828E010E7DD;
 Wed,  2 Apr 2025 14:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743603126; x=1775139126;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=4g1mXxS1UnrkeyGG03/I6qOwewcYytI6aBo/gt50ano=;
 b=W1IcAlwSt3VmdoWWuVSPC9/PBDxf5XKoLXFmgtm3n4v1S4EOI/vjM076
 QiDPnYoIFJEnc+mIe1u1er+Y0KmPLsUsVyl3Igz+LmK8aH3afhtGBrIvq
 e/mF/xyTXXqpJLENMSc0osr/wPsDoVfvmfJgG2X4vYAjKfvNeGJ3A+9W1
 QHIq0M72QfCwpDkZkcvqiiTXqHNJT8Zk7X72xnHoX48MIGc6X3tyRa/AJ
 qP2yzCnZnRhYzayh6N4OwTmhK/R7W0UJMaTLPoUbgFzkmXXB0QrVl/8Rx
 4++UoPPVmL8GVjeOYWdiGm/4jNfQ0o9tgvRMlT1ahr4VKxr47Dx/2fjzU Q==;
X-CSE-ConnectionGUID: nilzlyMaSvK/Atw6ayaAuA==
X-CSE-MsgGUID: HAlTk+ZBQrir24QEApf/Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44677129"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44677129"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 07:12:04 -0700
X-CSE-ConnectionGUID: XCy/7D3bTPmDKdAC/KLNPg==
X-CSE-MsgGUID: 8mn3qrd6Sw+MmhENbZS0sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="127620411"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2025 07:12:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 2 Apr 2025 07:12:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 07:12:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 07:12:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jc7lz6WkwJYNDBsvd2e2uOO593Ya/2IUXy2O4ZXEXArUgd459tmkNmByQhCLWfx8EDaqIAvwSDwqNT/IVPEDpmyyQYroRva3uUBGstLgddjpLsBkfPeh15mMKm0KYqQOfApwrr759uycjvuudChAvs3VrJ+a6zeXq5A3xyImVPpL5E+F+VvT0v7lcwfEmFXSmxltKYgjMTRNUoFbKX7kQkjHSH9jb32CegKrdaafXyC6IfSNm6HNqEGpGRkJuC5o2VJrJ6/KqpVzsjCT0kYj4E06Xhz5drIV8RN6rKJg3MH4LhsjA6UR6sYRDjyo0WC6atefy+n6uwNKjslrb2wTfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjY325o6EIxc0M4imdLhGWOR8hLsO4zfRLH7PKZQjAY=;
 b=Emq2jyVZVc15nmesrYMmhSF3aQfQ29r9w1k0deyehRizcN8fQ7At7S6f6dpnxClNK+tMRYSlLW9J0tLVbxcvLDXMWD2RUAFL8sizEugsTSCf1MKbmaWDe1M1Tj4+E+pRhH7fxBvyLNwujqq02c9+KnSJTJrdvgtzgIeUtEjns31r4pqlz71RY8i21bjwLItvQs4DzXty8/SL38G23eUOj1XUDVwgiSDjg6XOowddONPjo3PZ/ubXitSd7wm3UwvV4YZf4hfiCNG400NLd2VHafYZHm92UHvtxdP5tnE0s44BHzXIMOFfDgyKAbB8hEDNzFiP3lc489iM56X0h4MQjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Wed, 2 Apr
 2025 14:11:32 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 14:11:32 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v7 0/6] PCI: VF resizable BAR
Date: Wed, 2 Apr 2025 16:11:16 +0200
Message-ID: <20250402141122.2818478-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0108.eurprd09.prod.outlook.com
 (2603:10a6:803:78::31) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: c5cc71d4-38dc-46a1-2262-08dd71f044fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akhQSnA4WjFQZ0ZpMVBWOFhCSENVQndtaGluS3JJelNVS1lua2dMNndMcGdQ?=
 =?utf-8?B?ZUgyY3NSZ0JlVEFzVC8vUGJNVFdmVmVPSS9XT3d6RUpPdjkxcFRlc3Y3TDhu?=
 =?utf-8?B?VUV3d0ZUQ3VkMkl1YUJPRERJZEZNR2t6WjBvQkdTMExHNjhuMWszTWtDeDBD?=
 =?utf-8?B?VmttSHJsNUlqZThHb3VOMTBBTXNHbi9HWm5KTGFQM2R5UjIvZ21QQUloSXJN?=
 =?utf-8?B?cndqbnZyRFlRaU9Xbi9YKzJOZmJRR2h3TEk4d2J2cktyRUY0TWFZYTFHV2h5?=
 =?utf-8?B?Z1JUUEZMRDZONW1QS0NhbThXaXlaTGVqMGdvOGJKUm1HVmR0WXV0MEU0QkUw?=
 =?utf-8?B?OW9DL2pXd2lGR1BlSHRTajlBSTU2UHEyOURZNFhheDRzY2R4azdDTndFWkFB?=
 =?utf-8?B?azFOMllqeHJ4aG1JU2pydnBwNUxVeU9kK3ZVL3hIS2tHV1N5bWdmZ09BQ3FH?=
 =?utf-8?B?bkthWTRLaHpmWm1DK0dJMTJ0YjVVdzhHa3EyR3EzeFN6d2xJc0xmN2dlYlc5?=
 =?utf-8?B?alcyYThxY21EWUVkaUd0bTF3SFBvWFdlWVFwR2M2NlhjODMxYXZQK28reTNY?=
 =?utf-8?B?MlRpQm5DaTNkRUUvS1lNSWlKWFdRZGcyUUo3ZXRPaDNoVWVlK0hjeEZJblZx?=
 =?utf-8?B?azJ1QmJuRG5mT2MxdFBQSEVHZExCa0xQOXpoOGlCclJQZVIxamg4R0FiWnJ6?=
 =?utf-8?B?cGMveVNWWmRYVmZ4TCtZOXJnWnZjRzBueFVKVThKVkYvQk5ONVBBYWNOZmtn?=
 =?utf-8?B?RXRXcnppdFl4OUxQSnhuQXJqYlNoZEFrOEtNd1VkWW9ORGMxTHdqc20vMWV6?=
 =?utf-8?B?QThFbmNlVVl0Nkg0MXBQVzZiZkI1SDdkNzFKR1RPY3FxTGJLUXNGQVdtVGVo?=
 =?utf-8?B?ZUZIUCtDZ3pTOVRBczBZUVFaS29mUURIOEpER0E4WTlRZENNZExzejM3Mktu?=
 =?utf-8?B?ZDNvUy9INUVwd3RXbS9jSG1XY1ZpYWk4TFlmamVjb212Y04vT0IvaXdvY0dF?=
 =?utf-8?B?Q21mY1B1b00vTTVONEd4RDRhWGpGLzM3M2s5d0JMWDBzQVhWRWtJK3RRZjQw?=
 =?utf-8?B?ejJ6UUZKZCtwOFFVRUlUVFdySUxQWTk5UTdXQ250ZFp2MW5VYXhmY3FPMG4v?=
 =?utf-8?B?YXpsRW9oZkNYcThKN05pakFIRDAxQk1TcXRFaFJZYTlvVnZrdWNBY1FmNTZt?=
 =?utf-8?B?Ky9FY09JOHRXejkyd3ZDSjJmNmNYaXJnYy9URkozYlZlbDdBNENyTGVGUkRs?=
 =?utf-8?B?NDRCZldNSktqdndObitBdkJESmFWYWxOZGl3QWoyZWZidUcyZHRBektrUlVo?=
 =?utf-8?B?MFA5Q28rUm9XaWZKWlBqYzg0UFhLdEI3MTFaRlpyLzVyRmhnSXcwYVZrUDJI?=
 =?utf-8?B?di9KNFkreTJSY2M4alA4QWNCTnhJN3BvSk01Tm9WbzJJMDc2dkR4dlUvZW9x?=
 =?utf-8?B?dUpWbGdVdEt6aHZwV0ZmWExLRkNabEcyVUE3YUNiMnIwRU9VTlg0azdrK2w0?=
 =?utf-8?B?VzRFZHB4V0hDbUtOTHdiRVg1OE5odEc3RUg1ODE0T002N2wrQ1NkRXJFK0p5?=
 =?utf-8?B?bXFzM2xFbnhkT0pNL2pld0wvZnhGVzBOSDBoUDh2QWNHOTN3Vm02RU9aZ2Rw?=
 =?utf-8?B?dDdHdmJ6UEF3K3FoZ2RWa0pxSmNwaG55T2ZCTlE2a3JocXpmMHRNOEczSnpK?=
 =?utf-8?B?TXBWZ0poNDdDWjhrakVVbWJZVXlmTGUzbm1nSTU0WnE5aWpteHlaaFhaS0J6?=
 =?utf-8?B?eXJmUnlkODFsNjVQYjltT09sSngyU0FLc0x4WXpXTFhUa0JhMUJaQk9UYUM2?=
 =?utf-8?B?dXFJS0FRUHJIS0FyT1VHRWVpN2VyK0s2b3BUWUpsSTBRR1MvckVKVVVueXU0?=
 =?utf-8?Q?3bFPYSjR6YPYk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXdVczlvaXJOQll4QUlMd09DRHpvaTNTMzgwUjdTWm53ZzF3Z3pGSHU4MUJj?=
 =?utf-8?B?RWFMQUwwL244T3lLbzV6bGpUcm00M21xTGhNNWxSc2ZZbHlSWjI2Q2VLd3BQ?=
 =?utf-8?B?ODM0Q2g4TmVQekxxSzlKMzdseGtDb1RoY1ViQmtSTmIzN29oeXp5QlZvL29Q?=
 =?utf-8?B?NXVTeUw5c3VXbzRDY2U0ZHgrNk1xemZTQTNINVFKbVlFU1BSTnk1Mys5SHpB?=
 =?utf-8?B?RU9CdEIxckVkQUw5bFNoamNyQVJvckRsRXdLaVRWVUJuMVUxS1hkS25NWVln?=
 =?utf-8?B?ajJObXpDeGQvaEo1UDVCVW5uaXN5dDBjaGI1T0t5aXRJK2Jab0NGNFFkOWxX?=
 =?utf-8?B?WnFNeVFXV0d6cVloVDJTemJ0T2FLQTdpRmtHVVNtK0NxaU96NzRZck5Yb1Z2?=
 =?utf-8?B?VlRxbXJxMit2cWlmMXZVZCs5SmxwZFp5WEJDckVXYUlxYkVMb1NmRUpkdzJF?=
 =?utf-8?B?K2E5a3NFb01VZjRHQmpLY2h3QUNuN3gzaVhGeGZEaVpERCtnZnhGQ2tPNC9z?=
 =?utf-8?B?bjNhNjNLMTRvcXY5Tml5MFlZUitUMUpHZVlHenhhaDJNSGZNU3J0N3BLU2FS?=
 =?utf-8?B?eFdQMFpUV3h2OXZxQTllbTVpRjRBSk42cTMxQzJpRHF3Ly9pbVZOZjkrd1hh?=
 =?utf-8?B?Y1grS0MyYVk2VXNsZEM3K2liSnNkN0ZUR3VsaEVOQnRRUDkxQWszL0cyeHFp?=
 =?utf-8?B?YkZ3bHBrMVdrMnQwNUx1S2lMNEg0Q1FPUkNrREh6L0RhNFZocktRM3JXdjFV?=
 =?utf-8?B?MWpka2tsSEtCcEh3dXN3bzhZazIxV0xlcTFDZWVPMDg4UGtVL01VZm93QkZH?=
 =?utf-8?B?bER2SjZCZ2lJZzNnemJYRnpBWEZ1LzRGRGQxQkRtaEhHWWdITXIzWU9CWU14?=
 =?utf-8?B?UFZENnA4WjBITHpJQklGWmlaeVZYYzhRbXV0alpJUjdRcDB0OGcyYnl6Z0F2?=
 =?utf-8?B?bmNBd2FkVXphai9WSDltOFFJU25QM1pYNDJPSVdyT2JIbnN2K1Q2RTgxY00y?=
 =?utf-8?B?Q290TnYzZEQzSmU3QUpySVptVU1sSzltNzcydld4cC9xcUxHcklXZ3hPdzhw?=
 =?utf-8?B?TmJwNlJtbUFTVXdEL2VYbWtkY3FQcFduQXFpUElpVDBIZFM4VXpaS0E2R2k4?=
 =?utf-8?B?ZHo1UVo5R2pycEswM3kyUFU4emowVXFFdk5qR3V2dDFLVTFIeFR1VEFwQVZm?=
 =?utf-8?B?b1BqOHJGeEZWNEdKQW1xbHR3Qi9GRG9rbE9URWRVYUdHalR3TFZIeVhBaG0r?=
 =?utf-8?B?NTZnWDZOWTRVSGkrYVFheENLOFZjbDk1S3MySlFYUlFCQ1JENUNXYm4vQ09S?=
 =?utf-8?B?bXNJNnRpMVJ0Vk9HTjZHZjV6RzdwMFpyaU0rRWhPUk5qdmNxVFFIU2xwNy82?=
 =?utf-8?B?V285eGJYejFrT1p2cWI1OS9RWERpbXBRUS9tN3diaEVxMVZKM2JhZ0liMXZP?=
 =?utf-8?B?UTdDYTBURkhIc213dEJjSGp1MnBzbTQ0Z2JRSllkNTY4d2MxNGNqWDhTTHBU?=
 =?utf-8?B?TXQvS0ZVZW5obEthVWlBMTROQjRUVlN0SUVHWEJTcmpWS2EzL1Y5bk92cVBv?=
 =?utf-8?B?bVNCOGtwZDhXNVJZVVNNOUp2RVhBTjVRaGhkV00rQkMxbFU3VjFGTkh2UjJL?=
 =?utf-8?B?UnF0OEN6MlhyQmE0bDNZQlluSjc0dGsxaENhZEpGaGM4OEVVcEJ4U1JuakFX?=
 =?utf-8?B?bUN1WVpvNkFFR2RSRHBXM2lETk9hbGZLd2hjWWViK25MUmU5WUpHZnhheEtm?=
 =?utf-8?B?VS9FRTh4L0YrM1RFUEtSNkE1L2lEa1R6U1ExRC94K2hPMXJveGV3YVFYNHZL?=
 =?utf-8?B?NmQyNFg1K1FLajJxYjU4R2ppZDFxT2NQcHBZeC9PbVlhSkwzd3NDZ3FxbUhl?=
 =?utf-8?B?MG5WUlk2d3J0aU5DbzNLYkM1UTA3eU1vUmhTR1FiQmVXbHV5eVVGR3lWM0Y0?=
 =?utf-8?B?b2FxRk9qTG1pVlhiSWVLQUlJM3k0Rk1RUGt0TTgxUVVKZmRLcU5DQVNmaVA5?=
 =?utf-8?B?STk0aEJRVXQyQnJqMXRUL0tHKzBBUEllYk4xR2gxUDFpL1VEQXArVmZzSmFQ?=
 =?utf-8?B?TGVoZ0tlZGoralVqc3YyQm0xb1RPWXBBSFp0bys0ajk0S3lmcWZrUHR6Q29S?=
 =?utf-8?B?WUpxcWlnOHl0TmN6U1dCZkE5QWpyRS9UWHJvemtTZUdMb0pzamRrdFlyWk1w?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5cc71d4-38dc-46a1-2262-08dd71f044fa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 14:11:32.2985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwpbR8AZjVoFz3TN1NROj4BphMWcFOFINpqZhzzQVYLGeygVsy09rZdV+qVaa3rIVpjHiQ1B2WtJJvHgg9eLP9rewfZqv75GXGG1tysmoDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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

Hi,

Another revision after the feedback from Ilpo.
Few tweaks here and there, the biggest change is the removal of the
loop in pci_iov_vf_bar_get_sizes().

v6 can be found here:
https://lore.kernel.org/linux-pci/20250320110854.3866284-1-michal.winiarski@intel.com/

For regular BAR, drivers can use pci_resize_resource to resize it to the
desired size provided that it is supported by the hardware, which the
driver can query using pci_rebar_get_possible_sizes.
This series expands the API to work with IOV BAR as well.
It also adds the additional API for drivers to change the VF BAR size
without resizing the entire underlying reservation (within the original
resource boundary).

Thanks,
-Michał

v6 -> v7:
- Eliminate the loop in pci_iov_vf_bar_get_sizes() (Ilpo)
- Use helper variable for indexes (Ilpo)
- Kerneldoc formatting (Ilpo)
- Refer to latest PCI spec (Ilpo)
- Commit message wording (Ilpo)

v5 -> v6:
- Rebased on latest pci/next
- Cache the VF resizable BAR capability position to avoid multiple
  lookups (Ilpo)
- Use pci_resource_n helper (Ilpo)

v4 -> v5:
- Rename pci_resource_to/from_iov helpers and add WARN if called without
  CONFIG_PCI_IOV (Ilpo)
- Reword kerneldoc for pci_iov_vf_bar_get_sizes (Bjorn)
- Reword commit message for VF BAR size check, extract the additional
  size check to separate conditional (Bjorn)

v3 -> v4:
- Change the approach to extending the BAR (Christian)
- Tidy the commit messages, use 80 line limit where necessary (Bjorn)
- Add kerneldocs to exported functions (Bjorn)
- Add pci_resource_to_iov() / pci_resource_from_iov() helpers (Ilpo)
- Use FIELD_GET(), tidy whitespace (Ilpo)

v2 -> v3:
- Extract introducing pci_resource_is_iov to separate commit and
  use it elsewhere in PCI subsystem (Christian)
- Extract restoring VF rebar state to separate commit (Christian)
- Reorganize memory decoding check (Christian)
- Don't use dev_WARN (Ilpo)
- Fix build without CONFIG_PCI_IOV (CI)

v1 -> v2:
- Add pci_iov_resource_extend() and usage in Xe driver
- Reduce the number of ifdefs (Christian)
- Drop patch 2/2 from v1 (Christian)
- Add a helper to avoid upsetting static analysis tools (Krzysztof)

Michał Winiarski (6):
  PCI/IOV: Restore VF resizable BAR state after reset
  PCI: Add a helper to convert between VF BAR number and IOV resource
  PCI: Allow IOV resources to be resized in pci_resize_resource()
  PCI/IOV: Check that VF BAR fits within the reservation
  PCI: Allow drivers to control VF BAR size
  drm/xe/pf: Set VF LMEM BAR size

 drivers/gpu/drm/xe/regs/xe_bars.h |   1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c |  22 +++++
 drivers/pci/iov.c                 | 149 +++++++++++++++++++++++++++---
 drivers/pci/pci.c                 |  10 +-
 drivers/pci/pci.h                 |  29 ++++++
 drivers/pci/setup-bus.c           |   3 +-
 drivers/pci/setup-res.c           |  35 ++++++-
 include/linux/pci.h               |   6 ++
 include/uapi/linux/pci_regs.h     |   9 ++
 9 files changed, 246 insertions(+), 18 deletions(-)

-- 
2.49.0

