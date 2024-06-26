Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327F9919AAA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 00:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADE410E311;
	Wed, 26 Jun 2024 22:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="daEpLeOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D948E10E311;
 Wed, 26 Jun 2024 22:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719441152; x=1750977152;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=vL25vdo8CeeZkEIqAx35siCplx7FCKV1mIsjXTL4WI4=;
 b=daEpLeOwBaXXYFoXiC86Bee3NK0rotW5BEG/gwwBwHvGOSB0+bo4WXI8
 CYPpVzpgXjGz5Mg3upPAHHl1oeXvGkTubuB8uH7qcoSU7pG4/u6ky4LXY
 XWaG6IJchQ+2H2Le+TfoDr6N2ezGvVNMn3LDrjdSVds0zEIbY2wE9iBkZ
 ABSBSI2a129ipbeuB101+SoE1rTaZt9pgjKQCCSPtublNKH8u4FgU/VMq
 zShUJexiXX7eOLuReawsVGiEVpiNcuSk65MwF2s+P5w930ljb8H5k5aZE
 stkcka9dYDRAH/7C4C75Sz2Y0VQ5X9s4qvKtQP4JSzc4RpPObTSW1bXb1 A==;
X-CSE-ConnectionGUID: RiSqUvTYRkyGnQ/NQj8LiQ==
X-CSE-MsgGUID: tcfyXvzmTsC26jLxv4e4gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20426919"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="20426919"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 15:32:31 -0700
X-CSE-ConnectionGUID: rKViZZjJTmqW7ZOzOcLujg==
X-CSE-MsgGUID: 2YGorOInQ6uNlKM7HbDs+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="48529635"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 15:32:31 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 15:32:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 15:32:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 15:32:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtgRSGBotDkZdsEffn2siJLXTrLikjxPwRLO7Pz3I6YGdkolYGONcFXhvy75A1sJmHHjrzRzuI+MrP8O78BjMQ1QXMBDR5+b9aX856+nNJ7B17Z2wDmoKrsS0nNZyRM8GyredpoJqfxbWLW0mh2byNZB+QUaOudlQnOsG4peQLj3jPjG4hsxWshbI+CtDfgrBak9XiwxlqOlbdjSuRIcBvK18NqJCKW+ZnokijfnevTNFrWsgBVdTnjqsBpJUnNe36YfYOcxkGorTs7a8r5bdjxXbbhnhgcjY6/IG2fzr+WXmhuNfqPHtKarsuLtrz6ka9p8zXS3P3GvkUXY446hHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9SedtGpLjoTlm5ZJ8wOjDF5DTQRwABMtIrP9ZlT9lU=;
 b=NDni1wn4iNR71i35AWTcuKW0cOt3OLDSp9uv2TuEhPe0Ls+wr606/nM8mp1uVc9bxseAWhEgaLdBEC01gak7GM/mbsrPM7+MhlJbNY7JrIltV+4Roe043yXTVUzrtirBYnsG9+a0qeQGxW7XL0YvYbQLMATnrbN+MKQAoufk2he6lIE5Xo15Q/PGuVBLgeCHV9HGrpUMK6oAYyUh/I7XB0Y38rIHVyrbdEbDPS4gOiVHjJ+9iZlveMysueBn0Du91BAE0aUGk+zSYanoQbdMlY1fpvK6APH2E8H2pl1x89ubOvQbh4P5CM5WsjMvqFNkcYLhEGiocElnflVd3Tp4ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB5904.namprd11.prod.outlook.com (2603:10b6:510:14e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 22:32:27 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 22:32:27 +0000
Date: Wed, 26 Jun 2024 18:32:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next
Message-ID: <ZnyW9RdC_aWSla_q@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB5904:EE_
X-MS-Office365-Filtering-Correlation-Id: 8892c6d3-bf98-4115-8de8-08dc962fdbc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?MzTUsmCEbKi0Ihd4ULevIJhGg2C79kiGWm32eLgr2O3Fuwx2VlPtbnwCvX?=
 =?iso-8859-1?Q?SFAr5PDALyt8J99ZmA18zvwlm3fuPsdb+4WKOZG/aUhPgcPXw/iUxGMnkq?=
 =?iso-8859-1?Q?9wpkCkK4+9xsDBlH9Tv4aUurQ9SBFFPW1cwBjgKydNsLpBgpldSLDlWG33?=
 =?iso-8859-1?Q?g3zr7Cr9xoN0oh0M5RVf3yOijHR8l2j6/lWhvWXGOldSvlBIaHgUjQ3NGT?=
 =?iso-8859-1?Q?zO4ZjWXjJhIjCAem3DlXnV+T4fPDPw6rJoRKYZsq9cZWxFJdvpo4fecFo1?=
 =?iso-8859-1?Q?oX9aIkTaVJ5CapWkSm81ZH/sU3fqqPW6Zk9FVh3toIVv93X9yiJabJljWr?=
 =?iso-8859-1?Q?Cc6qRf5cRnU+UhHc58j9cS0HeswtAz7ZJnysw6riblI6vdgb0uK9Xu6bl6?=
 =?iso-8859-1?Q?gWUlBfqcclmI26YxSKpKJgxnj0F5GgwEzNUeIbw+ceZ2puzng6hmpz5z7d?=
 =?iso-8859-1?Q?Zx7DVcUFBfIqRzqcDWWzCEMbHl92LDo7hQODkv6KtG7zFAWq4PBAFdNwI5?=
 =?iso-8859-1?Q?djbpeuzYWZeVlC+Z1UrPHzmtSlO7f4TPhvv/ouFf5o1dsy3+uzt/xh1+26?=
 =?iso-8859-1?Q?4yDYUF01e2WMsXiekh9QW4hB+IrHFt96UELCh4pcZMLvDoYFFnH8uppoB/?=
 =?iso-8859-1?Q?w3vbVbYkHIRrYtNtiweGqiv5ucGFT6VEGADcYsrQeSCM/CwL1XhAlydVeF?=
 =?iso-8859-1?Q?ALTqEWc1EMKArPEwiZkLcV4ji3j2pKgxPC1bUab97cqZlQWN5lXv+xjhbz?=
 =?iso-8859-1?Q?LRyDkIu6banore2ExZYgZTAzus0UZMlGq9laZjrFTReSqJj9hF5PNmg6g7?=
 =?iso-8859-1?Q?E3mEfexKgrMUxywUdJxoGcasKML8uJ8rrK70Ee8jL3BZkDhbX4Nzo2nWf8?=
 =?iso-8859-1?Q?XHZRrhv8QDsACr9DyaAaPuybSRECUwkZqa4hbfETqh6SDQZj1XTXu76KZ5?=
 =?iso-8859-1?Q?cHhDh0+LA+bxJ7vgPQeFbSnfgDHawcvgBOfT+md8ycRqtgANgGml14kCVg?=
 =?iso-8859-1?Q?/InyhHIweutMnYJTjd3I3kOAw/tSu9n6tnYTReWRMUhrncFLcp0sS21jia?=
 =?iso-8859-1?Q?jdN+tcIsIYQwyIIQFCUOntU+7i1yoxKr2tNRXTD6IPZsQxCmXDuyQQ5f1+?=
 =?iso-8859-1?Q?u1GbpJLjvdRP2G4CPyl+uY3jEb7h6o26iZ4ckMdp0OdzN0UhqTSlnAhZW9?=
 =?iso-8859-1?Q?te+uHgrrAmwFmNDhHvJBmA79hYvgJc72JpZ3KnrzubkCcyLQByIe9B3HUS?=
 =?iso-8859-1?Q?s5RG5biPJhlsUtOef8jOlMBPr1Kp92dKXtbmjQifeRryHCcUGO90a8rjFB?=
 =?iso-8859-1?Q?iNMGUxqb4UOMhaZzlqjxXPLXaOrPTt3UxNhwc25706QsNgw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gRWT+qNaOSXIJTK4W78Ch/7kV7w7J5GIfkKoka/qE41+OTJFOnwnXGmvIs?=
 =?iso-8859-1?Q?01aa9/VGXJnWhve6l/6Y7PBxL3FCT9xZS9qR+Rapu22dxem+mUVbWL18oM?=
 =?iso-8859-1?Q?9xAarfj2AJqm1R30zGz+sY9pV5vCOL9sX1NPkyTmcOzMtGUvFm0Yps5fgd?=
 =?iso-8859-1?Q?XIZjpPHfd23M4japLqR7QQQHo8hy2SRMypa6VnUr8+P2HtzbqjRPuZXp5C?=
 =?iso-8859-1?Q?djRHUYUlrG7oGVgWL+1pQ4NU8FJ0u/wzsPXtRB+KiUCF4I8zEfMgcmrR06?=
 =?iso-8859-1?Q?/kBWgLK03oGC5JnfBuIdm6U7C7Ta9GPDoJLapZDOX7OedcalijijkFby6r?=
 =?iso-8859-1?Q?P+kEpfmbczVjipxrsudxsPWyuVhBZB1/qnSgGI9zm6uXfJvf1cW/GB05jX?=
 =?iso-8859-1?Q?aPO9ivPzFNpsC9+Ao4W+bICHTUMFOmm4dFmRyJDD4Pl7mGPT00FJfSR4lZ?=
 =?iso-8859-1?Q?sZiwa+coFNLoDu6/PDFLCbgX5cDvXID1XnurZAk1CmDdCPCSFH9QZYHkxV?=
 =?iso-8859-1?Q?qLtjpe+Yu+HKJ1eJLv3UFQeYxaTaROuLTN1RNIFz/sMKpDOiUacxUH2Gvg?=
 =?iso-8859-1?Q?HjRzUZef/IRb68LRJchOGN+O+dLYW0B481mRHASugLjGnZvLfPg09TswS7?=
 =?iso-8859-1?Q?iTWT1X/eVo72juQufSHMxsToZZh92ExslhgMfcucP3Ypd2kJIBzbM+xZh1?=
 =?iso-8859-1?Q?kg1mt6XUjtefahSBvwEm2IC2WF9eTE5XpqtKWleiZXa2iL13BV1458tHjB?=
 =?iso-8859-1?Q?blZcXFvFEwWM5y9MTiVkrq+YC0AV2lgblwL6WZ2u0Ve+87qeJLimMb5T/Y?=
 =?iso-8859-1?Q?2So58FuTXrHJ3QkCgihid51H41lUpkviRkrYyK+W6SfQb73OxWJHN5/0Om?=
 =?iso-8859-1?Q?K30qYHkHt238p7Sar6QlvUBe/Hrl4ulp7phCzsZiDeIrhxN8cM6Q+IXakt?=
 =?iso-8859-1?Q?nn3czsKn2sKyledkKIYMRBG9nF021sCZLbdY6lXd5yo6MFyVZDnTMolenj?=
 =?iso-8859-1?Q?wRJ23ICGWKo2RHIIjvDXic+BG5mD/wZvrpDPmdZIeL3LCGykbS1ELd4b/L?=
 =?iso-8859-1?Q?Zi5HT6zbzvVnVCZ2v1FRtB8aJ5o6yPPjzAUEZki2lE/KJQzipC8kEMoHxN?=
 =?iso-8859-1?Q?YW80biZhwT9rgFV0WSAyCMLUwCdSoW9Hdz/n4/ZzhkkZlYNZRhSdyoH2hB?=
 =?iso-8859-1?Q?emvLkRvhHV+kno9eqjnvilGYCA/fu0niTU3qGlpphcz7vf1JOrjRGwdkk3?=
 =?iso-8859-1?Q?oF3q5I4BDXL9LpzQMemJGIoFcBwacPhvHeULksF/nX5Va7ZssG8134whPC?=
 =?iso-8859-1?Q?01VvKqTYEFFoENncUAMcHJR8hIkUgi8beCmytrtLlBYd7eF9fZ687fk+gS?=
 =?iso-8859-1?Q?CSq9yKrK4mjDaxXzYEneY2/Gj1DpJT1lPthm5bk1eoOmaJ3iHeLOiTMbnL?=
 =?iso-8859-1?Q?mXBz3EBSlzCj9QaeP9lB2T8pEhnOdpc5dnFd0IKPLHIqR+T6dvjQcKVe2d?=
 =?iso-8859-1?Q?2VjAqbIp6M+wQj8vK4VKvoLaQ0POoy/6BV/Axk224HxAwjru2W4pZPdl3w?=
 =?iso-8859-1?Q?RLHP41N8AIOyDg53CmquugnmyqDyPwvZJSexTGVh9hVaLFmQ4GadqpCb2m?=
 =?iso-8859-1?Q?1qRXXliUVH/5EyXGZx7jRM6iTqSo2Xj+wZMJI5gbpw+ylMeax6lCZWTA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8892c6d3-bf98-4115-8de8-08dc962fdbc9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 22:32:27.7004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LS6lL9bLKZ5PkOYmBZnYvNJ3ON1eNShFxjxr87CY33q8vJPYU+SwqK6g/aCEa3RzpwqanMRNtdjRwWXPcABK7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5904
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

Here goes our likely last pull-request towards 6.11.
If some last minute thing shows up a small one might come
next Tuesday.

Thanks,
Rodrigo.

drm-xe-next-2024-06-26:

UAPI Changes:
- New uapi adding OA functionality to Xe (Ashutosh)

Cross-subsystem Changes:
- devcoredump: Add dev_coredumpm_timeout (Jose)

Driver Changes:
- More SRIOV preparation, including GuC communication improvements (Michal)
- Kconfig update: do not select ACPI_BUTTON (Jani)
- Rework GPU page fault handling (Brost)
- Forcewake clean-up and fixes (Himal, Michal)
- Drop EXEC_QUEUE_FLAG_BANNED (Brost)
- Xe/Xe2 Workarounds fixes and additions (Tejas, Akshata, Sai, Vinay)
- Xe devcoredump changes (Jose)
- Tracing cleanup and add mmio tracing (RK)
- Add BMG PCI IDs (Roper)
- Scheduler fixes and improvements (Brost)
- Some overal driver clean-up around headers and print macros (Michal)
- Rename xe_exec_queue::compute to xe_exec_queue::lr (Francois)
- Improve RTP rules to allow easier 'OR' conditions in WA declaration (Lucas)
- Use ttm_uncached for BO with NEEDS_UC flag (Michal)
- Other OA related work and fixes (Ashutosh, Michal, Jose)
- Simplify locking in new_vma (Brost)
- Remove xe_irq_shutdown (Ilia)
The following changes since commit 541b1b0a8fc235bca355921eb7f3f59a8efa3e9a:

  agp: add missing MODULE_DESCRIPTION() macros (2024-06-24 16:20:58 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2024-06-26

for you to fetch changes up to 406d058dc323ae152d380ac90153eb56a75850c1:

  drm/xe/oa/uapi: Allow preemption to be disabled on the stream exec queue (2024-06-26 18:25:46 -0400)

----------------------------------------------------------------
UAPI Changes:
- New uapi adding OA functionality to Xe (Ashutosh)

Cross-subsystem Changes:
- devcoredump: Add dev_coredumpm_timeout (Jose)

Driver Changes:
- More SRIOV preparation, including GuC communication improvements (Michal)
- Kconfig update: do not select ACPI_BUTTON (Jani)
- Rework GPU page fault handling (Brost)
- Forcewake clean-up and fixes (Himal, Michal)
- Drop EXEC_QUEUE_FLAG_BANNED (Brost)
- Xe/Xe2 Workarounds fixes and additions (Tejas, Akshata, Sai, Vinay)
- Xe devcoredump changes (Jose)
- Tracing cleanup and add mmio tracing (RK)
- Add BMG PCI IDs (Roper)
- Scheduler fixes and improvements (Brost)
- Some overal driver clean-up around headers and print macros (Michal)
- Rename xe_exec_queue::compute to xe_exec_queue::lr (Francois)
- Improve RTP rules to allow easier 'OR' conditions in WA declaration (Lucas)
- Use ttm_uncached for BO with NEEDS_UC flag (Michal)
- Other OA related work and fixes (Ashutosh, Michal, Jose)
- Simplify locking in new_vma (Brost)
- Remove xe_irq_shutdown (Ilia)

----------------------------------------------------------------
Akshata Jahagirdar (1):
      drm/xe/xe2lpg: Add Wa_14021490052

Ashutosh Dixit (21):
      drm/xe/perf/uapi: "Perf" layer to support multiple perf counter stream types
      drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
      drm/xe/oa/uapi: Add OA data formats
      drm/xe/oa/uapi: Initialize OA units
      drm/xe/oa/uapi: Add/remove OA config perf ops
      drm/xe/oa/uapi: Define and parse OA stream properties
      drm/xe/oa: OA stream initialization (OAG)
      drm/xe/oa/uapi: Expose OA stream fd
      drm/xe/oa/uapi: Read file_operation
      drm/xe/oa: Add OAR support
      drm/xe/oa: Add OAC support
      drm/xe/oa/uapi: Query OA unit properties
      drm/xe/oa/uapi: OA buffer mmap
      drm/xe/oa: Add MMIO trigger support
      drm/xe/oa: Override GuC RC with OA on PVC
      drm/xe/oa: Changes to OA_TAKEN
      drm/xe/oa: Enable Xe2+ overrun mode
      drm/xe/oa: Remove WARN_ON's for unsupported configurations
      drm/xe/oa: Fix kernel doc in xe_drm.h
      drm/xe/oa: Allow stream enable/disable functions to return error
      drm/xe/oa/uapi: Allow preemption to be disabled on the stream exec queue

Francois Dugast (2):
      drm/xe/sched_job: Promote xe_sched_job_add_deps()
      drm/xe/exec_queue: Rename xe_exec_queue::compute to xe_exec_queue::lr

Himal Prasad Ghimiray (3):
      drm/xe: Cleanup force wake registers bit definitions
      drm/xe: Ensure caller uses sole domain for xe_force_wake_assert_held
      drm/xe: Check valid domain is passed in xe_force_wake_ref

Ilia Levi (1):
      drm/xe/irq: remove xe_irq_shutdown

Jani Nikula (1):
      drm/xe: do not select ACPI_BUTTON

José Roberto de Souza (3):
      devcoredump: Add dev_coredumpm_timeout()
      drm/xe: Increase devcoredump timeout
      drm/xe/oa: Call xe_oa_emit_oa_config() with new config when updating config

Lucas De Marchi (5):
      drm/xe/rtp: Allow to match 0 sr entries
      drm/xe/rtp: Expand max rules/actions per entry
      drm/xe/rtp: Allow to OR rules
      drm/xe/rtp: Add match on any GT
      drm/xe/xe2: Add proper check for media in Wa_14020756599

Matt Roper (1):
      drm/xe/bmg: Add PCI IDs

Matthew Brost (15):
      drm/xe: Rework GPU page fault handling
      drm/xe: Drop EXEC_QUEUE_FLAG_BANNED
      drm/xe: Add LRC ctx timestamp support functions
      drm/xe: Add MI_COPY_MEM_MEM GPU instruction definitions
      drm/xe: Emit ctx timestamp copy in ring ops
      drm/xe: Add ctx timestamp to LRC snapshot
      drm/xe: Add xe_gt_clock_interval_to_ms helper
      drm/xe: Improve unexpected state error messages
      drm/xe: Assert runnable state in handle_sched_done
      drm/xe: Add GuC state asserts to deregister_exec_queue
      drm/xe: Add pending disable assert to handle_sched_done
      drm/xe: Add killed, banned, or wedged as stick bit during GuC reset
      drm/xe: Sample ctx timestamp to determine if jobs have timed out
      drm/xe: Invert runnable_state / pending enable check and assert
      drm/xe: Simplify locking in new_vma

Michal Wajdeczko (38):
      drm/xe/guc: Split g2h worker function
      drm/xe/guc: Allow CTB G2H processing without G2H IRQ
      drm/xe/pf: Assert LMEM provisioning is done only on DGFX
      drm/xe/guc: Move H2G SETUP_PC_GUCRC definition to SLPC ABI
      drm/xe/guc: Add pc_to_ct() helper
      drm/xe/guc: Prefer GT oriented messages in xe_guc_pc
      drm/xe/guc: Drop unused legacy GuC message ABI definitions
      drm/xe/guc: Add kernel-doc for HXG Fast Request
      drm/xe: Prefer GT oriented messages in xe_force_wake.c
      drm/xe: Kill fw_to_gt() helper
      drm/xe: Include additional info on failed force-wake operation
      drm/xe: Combine common force-wake code into helpers
      drm/xe/vf: Ignore force-wake requests if VF
      drm/xe/vf: Use correct check for being a VF driver
      drm/xe: Drop duplicated declaration
      drm/xe: Use fixed CCS mode when running in SR-IOV mode
      drm/xe/uc: Fix and start using xe_uc_fw_sanitize()
      drm/xe: Allow const pointer when checking SR-IOV mode
      drm/xe/vf: Don't touch GuC irq registers if using memory irqs
      drm/xe: Use ttm_uncached for BO with NEEDS_UC flag
      drm/xe/guc: Move ARAT interrupts enabling to the upload step
      drm/xe/oa: Fix potential NPD when OA is not initialized
      drm/xe/vf: Disable features that do not apply to VFs
      drm/xe/vf: Don't run any save-restore RTP actions if VF
      drm/xe/vf: Don't apply tile workarounds if VF
      drm/xe/vf: Don't change hwe IRQ masks if using memory IRQs
      drm/xe/vf: Don't initialize OA if VF
      drm/xe/vf: Don't support gtidle if VF
      drm/xe/vf: Don't use register based TLB invalidation if VF
      drm/xe/vf: Skip engine ring enabling if VF
      drm/xe/vf: Custom HuC initialization if VF
      drm/xe/huc: Use GT oriented error messages in xe_huc.c
      drm/xe/vf: Skip attempt to start GuC PC if VF
      drm/xe/guc: Demote the H2G retry log message to debug
      drm/xe/guc: Add more GuC error codes to ABI
      drm/xe/guc: Print GuC error codes as hex value
      drm/xe/pf: Trigger explicit FLR while disabling VFs
      drm/xe/pf: Disable VFs on remove

Radhakrishna Sripada (6):
      drm/xe/trace: Extract bo, vm, vma traces
      drm/xe/trace: Extract guc related traces
      drm/xe/trace: Print device_id in xe_trace_bo events
      drm/xe/trace: Print device_id in xe_trace_guc events
      drm/xe/trace: Print device_id in xe_trace events
      drm/xe: Add reg read/write trace

Rodrigo Vivi (2):
      Merge drm/drm-next into drm-xe-next
      Merge drm/drm-next into drm-xe-next

Sai Teja Pottumuttu (1):
      drm/xe/xelpgp: Extend Wa_14019877138 to graphics 12.74

Tejas Upadhyay (1):
      drm/xe/xe2lpm: Fixup Wa_14020756599

Vinay Belgaumkar (2):
      drm/xe/lnl: Apply Wa_22019338487
      drm/xe/guc: Request max GT freq during resume

 drivers/base/devcoredump.c                       |   23 +-
 drivers/gpu/drm/xe/Kconfig                       |    1 -
 drivers/gpu/drm/xe/Makefile                      |    7 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h         |    6 -
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h    |   22 +
 drivers/gpu/drm/xe/abi/guc_errors_abi.h          |   31 +
 drivers/gpu/drm/xe/abi/guc_messages_abi.h        |   41 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c           |    4 +-
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h |    5 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h         |    2 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h             |   11 +-
 drivers/gpu/drm/xe/regs/xe_oa_regs.h             |  100 +
 drivers/gpu/drm/xe/tests/xe_rtp_test.c           |   64 +-
 drivers/gpu/drm/xe/xe_bo.c                       |   11 +-
 drivers/gpu/drm/xe/xe_devcoredump.c              |    8 +-
 drivers/gpu/drm/xe/xe_device.c                   |   45 +-
 drivers/gpu/drm/xe/xe_device_types.h             |    4 +
 drivers/gpu/drm/xe/xe_exec.c                     |    8 +-
 drivers/gpu/drm/xe/xe_exec_queue.c               |    8 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h         |   26 +-
 drivers/gpu/drm/xe/xe_force_wake.c               |  102 +-
 drivers/gpu/drm/xe/xe_force_wake.h               |   13 +-
 drivers/gpu/drm/xe/xe_ggtt.c                     |   42 +-
 drivers/gpu/drm/xe/xe_ggtt.h                     |    1 -
 drivers/gpu/drm/xe/xe_ggtt_types.h               |   12 +-
 drivers/gpu/drm/xe/xe_gsc.c                      |    5 +
 drivers/gpu/drm/xe/xe_gt.c                       |   24 +
 drivers/gpu/drm/xe/xe_gt.h                       |    1 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c              |    9 +-
 drivers/gpu/drm/xe/xe_gt_clock.c                 |   20 +
 drivers/gpu/drm/xe/xe_gt_clock.h                 |    1 +
 drivers/gpu/drm/xe/xe_gt_idle.c                  |   16 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c             |  144 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c       |   15 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c      |   21 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h      |    1 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c      |   31 +-
 drivers/gpu/drm/xe/xe_gt_types.h                 |    4 +
 drivers/gpu/drm/xe/xe_guc.c                      |   33 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                   |   72 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h             |    2 +
 drivers/gpu/drm/xe/xe_guc_pc.c                   |  204 +-
 drivers/gpu/drm/xe/xe_guc_pc.h                   |    5 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h             |    4 +
 drivers/gpu/drm/xe/xe_guc_submit.c               |  346 ++-
 drivers/gpu/drm/xe/xe_huc.c                      |   30 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                |    4 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h          |    2 +
 drivers/gpu/drm/xe/xe_irq.c                      |    8 +-
 drivers/gpu/drm/xe/xe_irq.h                      |    1 -
 drivers/gpu/drm/xe/xe_lrc.c                      |   89 +-
 drivers/gpu/drm/xe/xe_lrc.h                      |    6 +
 drivers/gpu/drm/xe/xe_migrate.c                  |   28 +-
 drivers/gpu/drm/xe/xe_mmio.c                     |   23 +-
 drivers/gpu/drm/xe/xe_module.c                   |    5 +
 drivers/gpu/drm/xe/xe_oa.c                       | 2510 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h                       |   27 +
 drivers/gpu/drm/xe/xe_oa_types.h                 |  242 +++
 drivers/gpu/drm/xe/xe_pci.c                      |    8 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c                |   14 +
 drivers/gpu/drm/xe/xe_perf.c                     |   92 +
 drivers/gpu/drm/xe/xe_perf.h                     |   20 +
 drivers/gpu/drm/xe/xe_preempt_fence.c            |    2 +-
 drivers/gpu/drm/xe/xe_pt.c                       |    8 +-
 drivers/gpu/drm/xe/xe_query.c                    |   77 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c            |   24 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                 |   21 +
 drivers/gpu/drm/xe/xe_rtp.c                      |   45 +-
 drivers/gpu/drm/xe/xe_rtp.h                      |   69 +-
 drivers/gpu/drm/xe/xe_rtp_helpers.h              |    2 +
 drivers/gpu/drm/xe/xe_rtp_types.h                |    3 +
 drivers/gpu/drm/xe/xe_sched_job.c                |    6 +
 drivers/gpu/drm/xe/xe_sched_job.h                |    3 +
 drivers/gpu/drm/xe/xe_sriov.h                    |    6 +-
 drivers/gpu/drm/xe/xe_trace.h                    |  380 +---
 drivers/gpu/drm/xe/xe_trace_bo.c                 |    9 +
 drivers/gpu/drm/xe/xe_trace_bo.h                 |  247 +++
 drivers/gpu/drm/xe/xe_trace_guc.c                |    9 +
 drivers/gpu/drm/xe/xe_trace_guc.h                |  110 +
 drivers/gpu/drm/xe/xe_uc_fw.h                    |    2 +-
 drivers/gpu/drm/xe/xe_vm.c                       |  101 +-
 drivers/gpu/drm/xe/xe_wa.c                       |   25 +-
 drivers/gpu/drm/xe/xe_wa.h                       |    2 -
 drivers/gpu/drm/xe/xe_wa_oob.rules               |    1 +
 include/drm/intel/xe_pciids.h                    |    7 +
 include/linux/devcoredump.h                      |   53 +-
 include/uapi/drm/xe_drm.h                        |  308 +++
 87 files changed, 5355 insertions(+), 829 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.h
