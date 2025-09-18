Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15080B84E1C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 15:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6151F10E8BB;
	Thu, 18 Sep 2025 13:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sva5s7jO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DFB10E8B8;
 Thu, 18 Sep 2025 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758202876; x=1789738876;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Aa9DyO78/A663fyE4Sz9EvYuZA9+lvgfFXFqxd7MR8I=;
 b=Sva5s7jO83ID03k/Ce7WNde5Y99QUMiVPwhFe6e7b0MBOKFhLR1o+G/B
 79RcVB3nXeen1k2tR2YPNlYfePdtEVTcsY6nsKRcKvsQ78MeiVOvJtUB6
 mypW52DkexBiWQ4+fjIaZ+SMO3OpEx/S1ubuG7no2VjohZjbjna1rziHK
 hB7OvpCzWWqExwaSArAdqsUvQw4KaJO4z0i7DRvBIUC6N/F6g38QOVEZH
 jAAwHMEKm7VH1i7UXyhru+R+EBO9hMQVvuuCw696opIahYIlHSqBF6O/z
 z8rozFxvS/ql0JS8rP/WLLO7DQVlfvs4jT0nZi0P3HF4ou6ESvPD3xsTP A==;
X-CSE-ConnectionGUID: l+XH8IUQSgeGd7JVBPch3A==
X-CSE-MsgGUID: AMf++hDCSi26Wj0C+1PjmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60464220"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="60464220"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 06:41:16 -0700
X-CSE-ConnectionGUID: WM2Ntxu0Szum/gEDtvtQYQ==
X-CSE-MsgGUID: MMYFxCBlS7GZ86hC58hggA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="175945698"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 06:41:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 06:41:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 06:41:15 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 06:41:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpHQsRf3WWL9PX6NqTUBuSfzdbiJ2KZxpntEIDChS475gj7/nOfQTIEXD3Eyi3BqQ9R4W8akG23EGeAVU7CDbpIOumejSlfQRgYLGG8O8Q4YrGUTf1NV/gzzIg3H3XDvCtwc+2p+q4yRnJl+5H4yvg+l7aiSHBL/jbysNAXCn4rnkZRCfH1H0AwsIZVU0vbobxlYukbesSmu+nhtylwHR7MeMqCQAdMX5Bok6qXla4DikCTI6CHh2VhiSrv/3NkKBBPNYa+eViB+ig5GvkZv4j01HLPCCQjs0IM9QGVL9pAVSq83LcU9o6Y8kT9EVQVBoLSQO2uB9it3TJdFIK514w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaQJUqTXJE20GlC2WMDfTWKCcnW3pA2tT5msvzdcA2k=;
 b=t5EG/nDAFf0EKFg2RQuTobUBblOU0uMZhgjz6nSM60KvXu+WZWrUVzRYcS72ct6RS4tTdK0p6B8u1Ox50A8kXwPPXas0232CZ5pmAxD2b5xOD2NMetMr9I1F6pfk1Padpks2DMZ45lAlKu9LEGBZEHTOSO92GiMI1XH6aBZ6pFfPO9O5bEJ9R1oWgJphMox/NK6a7qxMjvnydqcULHt5/8Zw5FcX1Vd6nP6YK/KlrW/HjKZiUwglJAY1V2InJkSuc3EocAXpV05fsilAeA8J0BkFIjoDugMCywkkBtdcUWrakzE195KkeIdUb20x9FnWKth17S93RZbOC4nuLgYtRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB4930.namprd11.prod.outlook.com (2603:10b6:303:9b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 13:41:07 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 13:41:07 +0000
Date: Thu, 18 Sep 2025 09:41:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <aMwL7vxFP1L94IML@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BY5PR20CA0021.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB4930:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e265553-40ef-4ebb-17bf-08ddf6b90537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RuoUP9CDvooO++fwXH+XRF9DUpmyv6GZpWLF6QiW3of1Sw622NBp7oJ8sRIP?=
 =?us-ascii?Q?Ea7mz/BLX8l71XlpaW0BAODU7ZkEGSefXrgzr75BKvV1Nedach8nh4ceoGEY?=
 =?us-ascii?Q?czBQqJCVJKf8IazK3ioDdp3if9wQdfq5BLEbzpxiS6o+0v4734ENIAKTTI6V?=
 =?us-ascii?Q?ypXmaVi1hRbPnfa7/+ac86goi24hfRkxQtalj+yDT5BwXFU5jgPeTSz+JFBZ?=
 =?us-ascii?Q?5NXfn0Ine9MxD7jMTc+FzlAeCTr9VNtY1WA9QCplsmeHwoWInq+1kJvMWr+/?=
 =?us-ascii?Q?5O2swzmZ7Ca3lCod/t+uZqVzU3AWNiEHDi/9vuqxSATE57O2JUydj56++qH/?=
 =?us-ascii?Q?UFxpb67KDDLNfgZA2DK4cj4YKQxFVg5u1TeHewjkh/x9B7v9kx7AwL6gRcFd?=
 =?us-ascii?Q?F6N715uSKE60A60zgboayPbTjrDtEqyen4dQQ6srIdtYbXS+dY1iNV3BWfyp?=
 =?us-ascii?Q?SUQn5Q1Z43fIjr2NGegVjiwpPIFEHHjrrRTrATeIVU5e8ZjNqqm26z/6JOL8?=
 =?us-ascii?Q?8ljaxKsH9K7vfxJtAo7OoWDgEJqLy+Fgly55byO0Van6MK+5/xX737IrxlJi?=
 =?us-ascii?Q?Ao2vgLEW322ujCMjSP5n8RfXB6Nvvv6G4224eBeau8OPbEN08cw4sKXHLtKf?=
 =?us-ascii?Q?U6Hxz5P89AOG2kKuTKlu3SxcGCSxtBf1nCD9LvEJXUjCiQmkzIjlNWWTUPwH?=
 =?us-ascii?Q?1i9Z8eh/DhuH9Y8jao6e2/h8MJgDVNf0Yfq1XWDCK5sTsv4KjKUo4z1UwKal?=
 =?us-ascii?Q?28/7b7Z1dHyRyVaDzWjpZmaRwkrESvV3Ziq7jLCw0hIANKstqpRPCq+sxwGV?=
 =?us-ascii?Q?3wCJk32K0jIZVHNmc0FCVFajCmLO3GfXrCB/VffANgocOCxrnsaCa6xuuLWC?=
 =?us-ascii?Q?5dw8EAkfXrsM7YfoshbaJsyUzmXX5nCZ+w4RrvYr0WCnwhf41l+gD5Yu86D7?=
 =?us-ascii?Q?ASlCRMzp42qVKJNsG60eKUzhfRqOhDQkjubDsIA6bjispi4zD6Edm0ym+nH6?=
 =?us-ascii?Q?vq4XRWN3xNootRW0RUIDYvvvv/zadh+nekAOGFkvoHOOJitufNctIpMP1/V1?=
 =?us-ascii?Q?pZFHlodlpZGF6zbS2LWJjcnXsvVXJG3UcPtgVaUm5J9Q9jcK86RIgo6SkXuY?=
 =?us-ascii?Q?H+NUqYBF1lEdP+szyUdrr7DINMO9Gk2pvEG5rww4j0Sdd339UGMnenDYBAOu?=
 =?us-ascii?Q?TAe0um7uYgFzUbDOAvo37PRVA4VqBpJ4QUes4DYOABCfuDy6EcoY3eJEDG93?=
 =?us-ascii?Q?fP+/5oDm4A5KfZ3xbPXdC2ZlG0tu1S/OTOOZNFcE2wRXQlX+xcp60OKR6TJh?=
 =?us-ascii?Q?MCvvYLkuhqvP0wPhSzaCh2Tr2lweZlgBo6cDnrTmYY9OE4i056qxmZYvfNVE?=
 =?us-ascii?Q?Uu8uJ+k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SiHtn/QUeUyAz0Ah7yItmAAMt71moohq6TqK7jn4uOEjCmKjIiQShQ9GFZrT?=
 =?us-ascii?Q?JWQhFpWGkR00mxSXdt0D7DVFS1skEj5RMSpRwyK/rgdAhVyFVapbOFJUsEVV?=
 =?us-ascii?Q?GmjApIhtleMVkKVoYnuovBofdGxyfSM6BrLMPB7scBn/pfANOCZQHLVStvZj?=
 =?us-ascii?Q?tEEjncEDcuUvFnnLMDasLyiKurTBQoBCyIvOOV6tMxfFjk8rWCd5Qb/6puYJ?=
 =?us-ascii?Q?WcdqnawC+5dyp5UECadwSlnQIIFXngK4+KDVGyRMngMPwa6KaKB9VAK5ittv?=
 =?us-ascii?Q?OljbznmPA6ldM+4CmkyruuASx0LrEnGAt8sCSRmNO1vhdF7JOzsRkIvieX2l?=
 =?us-ascii?Q?HqI/BDaVP4WUKN2LbDMYpruG5icjNqHOff7/RErsS1bZzizrtDMUX7llho4K?=
 =?us-ascii?Q?itTWOyc0vw6ZsS2Hw+rhq63E8t4XwG90/iZ8AhLa72hQ2M5oFzIpdWWzajlq?=
 =?us-ascii?Q?N9MImLrbOJ93HN8jFEcjuWwuHg19lhm2M1p5fYe9Ek0I8PMkqoomkBHWrp0o?=
 =?us-ascii?Q?NEktlp3L6R2ImpyNEQr6ZvC3Flc51yjcexeni3g9r+zGlhg9Z9OPf2bU3HZa?=
 =?us-ascii?Q?vhMvL7K3VBMRjG91ZrnkcxuDoMABzs5GQ3Z2Xn2+WNQMpIFDHRP6pvmaLXZy?=
 =?us-ascii?Q?GXrx078DGmMkRbaCYNvgQMxE/KhaYe5VkzKEZKzOVXD85INirrwqWhr3bKtq?=
 =?us-ascii?Q?KB0vymBQ1xU8iF8Th2LHEDyLpLpjVLtyFGHrtpEf1FBtRioqVVRJi+mPeAcK?=
 =?us-ascii?Q?cgkAaS2kDUzfbL5dwISV78A2qTwoOo/TD7/2DEJbo4nI0+Q4t4YBFMBiqHPU?=
 =?us-ascii?Q?TOq3Zg83UX2qdobWw842mn6/9v7Aea0zpFghGtv1nUMDbG8CJR6PffiFs7uD?=
 =?us-ascii?Q?kzM44/IRhfum7Y6reGVYd4ZEFdxgFV+00eUwhWWsNnbCDzt6OjavxIqucoDG?=
 =?us-ascii?Q?xWV7fHPbRBR5I36ZIlRCio38eFb7ZbPTUODf0znPVxgteZDtXeYLddHECBQe?=
 =?us-ascii?Q?TKv2arsMQG3vSIYXsEGLdVohL9FhxNVD/vN/IMtRV6tB87m/IfPPvn1l0xPb?=
 =?us-ascii?Q?lxJg+mJ9ix6Wf23CuWaXCH29R/ACYEVpPcq5z7Yp5ExC7edvo0wCS+Qv/PhH?=
 =?us-ascii?Q?iRllZAuoN2i/YMyEb/ghUNSCMlHtQ8Xgj9YOzwnnkJ2V9A3L5GrVrlI1w4c8?=
 =?us-ascii?Q?7FzE0ZFFNOSMfdarFHhR3wNyzKMnu8K4aEJl1MTmtRAwFudzsHPPYPq6YRwM?=
 =?us-ascii?Q?+Vch3xLGZxcotp0nfP5KJz3Exc7q7Oz62U0gGAk6Ib2haFIT5NJWht+XdV2j?=
 =?us-ascii?Q?g4qjCgfV4+PJldJpEQ8m6FeZQDvsawuJ5m5d3hFeRPH6clHDuzTaDQik0HfR?=
 =?us-ascii?Q?ZGDJDmLdshHvaDhoE7jkLScePGEj5bRk74Fb3u1k88/eHerY5ff5Jqe/g3Qj?=
 =?us-ascii?Q?Cx7GbsR4lQNLJnTBICTesFe6hXxf3CKN+SyvUX7pxGCc4Z7nlUYQLzmJzAV7?=
 =?us-ascii?Q?bHIYsCtnjTugqGb0x2ui3JHYyzmj1S6t5MMaH+u+YyWrnoHRl2mVVpKhDhIV?=
 =?us-ascii?Q?UGjwNwrIOdRvmdhJrlaatGkUhnmJxyxQUHjpOYgR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e265553-40ef-4ebb-17bf-08ddf6b90537
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 13:41:07.6541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhLmch6xjNAOe3vhYXe7xD81l9ON8KIiSJ1yiR9l7ZFk87qT8ffLMunOfKc2GLObBNV8ZeSBlYsbpySA12DKlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4930
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

Hi Dave and Sima,

Here goes our drm-xe-fixes.
It has more fixes than normal for this time of the cycle,
but nothing very critical.

Perhaps the most critical one is the RCS/CCS yield policy
which prevents starvation in the CCS engine on BMG. A
patch that was slightly modified to add a missing include
that was preventing it to build after cherry-pick.

Thanks,
Rodrigo.

drm-xe-fixes-2025-09-18:
- Release kobject for the failure path (Shuicheng)
- SRIOV PF: Drop rounddown_pow_of_two fair (Michal)
- Remove type casting on hwmon (Mallesh)
- Defer free of NVM auxiliary container to device release (Nitin)
- Fix a NULL vs IS_ERR (Dan)
- Add cleanup action in xe_device_sysfs_init (Zongyao)
- Fix error handling if PXP fails to start (Daniele)
- Set GuC RCS/CCS yield policy (Daniele)
The following changes since commit f83ec76bf285bea5727f478a68b894f5543ca76e:

  Linux 6.17-rc6 (2025-09-14 14:21:14 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-09-18

for you to fetch changes up to 26caeae9fb482ec443753b4e3307e5122b60b850:

  drm/xe/guc: Set RCS/CCS yield policy (2025-09-17 20:23:47 -0400)

----------------------------------------------------------------
- Release kobject for the failure path (Shuicheng)
- SRIOV PF: Drop rounddown_pow_of_two fair (Michal)
- Remove type casting on hwmon (Mallesh)
- Defer free of NVM auxiliary container to device release (Nitin)
- Fix a NULL vs IS_ERR (Dan)
- Add cleanup action in xe_device_sysfs_init (Zongyao)
- Fix error handling if PXP fails to start (Daniele)
- Set GuC RCS/CCS yield policy (Daniele)

----------------------------------------------------------------
Dan Carpenter (1):
      drm/xe: Fix a NULL vs IS_ERR() in xe_vm_add_compute_exec_queue()

Daniele Ceraolo Spurio (2):
      drm/xe: Fix error handling if PXP fails to start
      drm/xe/guc: Set RCS/CCS yield policy

Mallesh Koujalagi (1):
      drm/xe/hwmon: Remove type casting

Michal Wajdeczko (1):
      drm/xe/pf: Drop rounddown_pow_of_two fair LMEM limitation

Nitin Gote (1):
      drm/xe: defer free of NVM auxiliary container to device release callback

Shuicheng Lin (1):
      drm/xe/tile: Release kobject for the failure path

Zongyao Bai (1):
      drm/xe/sysfs: Add cleanup action in xe_device_sysfs_init

 drivers/gpu/drm/xe/abi/guc_actions_abi.h     |   1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h        |  25 ++++++
 drivers/gpu/drm/xe/xe_device_sysfs.c         |   8 +-
 drivers/gpu/drm/xe/xe_exec_queue.c           |  22 +++--
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   8 +-
 drivers/gpu/drm/xe/xe_execlist.c             |  25 ++++--
 drivers/gpu/drm/xe/xe_execlist_types.h       |   2 +-
 drivers/gpu/drm/xe/xe_gt.c                   |   3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c   |   1 -
 drivers/gpu/drm/xe/xe_guc.c                  |   6 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 120 ++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_submit.h           |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c                |  35 ++++----
 drivers/gpu/drm/xe/xe_nvm.c                  |   5 +-
 drivers/gpu/drm/xe/xe_tile_sysfs.c           |  12 +--
 drivers/gpu/drm/xe/xe_vm.c                   |   4 +-
 17 files changed, 209 insertions(+), 74 deletions(-)
