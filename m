Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B8C9B11E2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 23:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5B210EB80;
	Fri, 25 Oct 2024 21:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7P5NFae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24E510EB94;
 Fri, 25 Oct 2024 21:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729893082; x=1761429082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=S3MtAJFYYvsilqByJKro/df74qguvca7gbT6ls0V49w=;
 b=E7P5NFaeja/ITBfXK0JGRDmaaD5fR6Vu4/X6SXX89totZFCQRGoXu6bx
 LleWiItsAX7MpytBnrUfQFvNerGGrBvPo2xM8vCVajvmyRjslSHJaloZe
 XUeXblXINEhDGi2k/OAHjYR3zDk23m1JXfUh3MPw/yiWTm1yS0mFC05Vy
 Dz5O7TD0df5iMIdf0Bsu709U8cwCZZcxn+TvVpAWZFxxt6EOkTH111kk+
 QYDVJO4Kvx/NTOtQvwsDqX1U+obbve1qeWkZOScfTSfKAh7gkGhH007+1
 XEm70byGsJFfHiy0tgKvMtjDojWViex8NlXrhsCPCq64HjEipCqdexdZW w==;
X-CSE-ConnectionGUID: AymSF77mQ++TWo1yyKcm+g==
X-CSE-MsgGUID: ZanY33JfQ0qPGKbSuQBWlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29683450"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="29683450"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 14:51:22 -0700
X-CSE-ConnectionGUID: oeCL1L6rRQarrTCs/L0zWw==
X-CSE-MsgGUID: L2Ewi+7+Qvyl0kZXkA4b5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="81492907"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 14:51:20 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 14:51:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 14:51:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 14:51:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKbCVaaOFtXjgQR3cKd1JaQzfH44fse3ps3Ppw6Kh+XSTvic/RqzF6ePpl7ZLSOlMJ5Hcqo72wzwlxwSI7n1winl8jQaBdBk59zIRcBXuFDNazUrbvJf80CKRgAeibHxWtG+Om7xq5+oAKBWGR8xrWzy7iGhT3FWkhyeUx0y2efTccc3KGHfqhFAX8n3Z54BDUyz91xQQ2U91BdQSNQDjXitMEKCYda7kgldyKcNuLN9VgXUnNr0AdYXtzSNBHGZqBt5roIInCBTiXRt4Y80kB18sSF2Ih1OiDqxc1h3xVNsds1c0xi8nM0Ciasir2jPsBvJPvvD0DZy5FB/fv3M/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sh9KtT2pJ4ZvygJzlA3ulaFMLixbb90nBzVxCGkLSpY=;
 b=ImTebWVEZNNpAWWnqgFanrqdG9iDf4iHs8Viy5MEe/TB8pyTyGl7Nvskuhk+bR3qxXxjUFlcyvi4QJBiq7jJ9Bt2oiMJWah1X3bwQyFMILx5HdfhL21EEtn1gLV1qX5Z1a08VT+Pipbz3zvGRdbdCfsEFzR4DkS+kkenPxeMVDk3b8+JWvvwvbOxJcpdTrOZPtR/LbHh+ZPrk7WKVvNxsbqji0JwiEafOrUorHQUIEAEwT4z+TQ85eYGH8zsb8XL+fKPzKLnmqa+akKiQrUp5kDomy7iMPSCSsnKeTIVa1+1xwduI3FaNIB/ClhKvnZ++N7WQ9lmRiXF6jLgnewFcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB7745.namprd11.prod.outlook.com (2603:10b6:930:90::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.16; Fri, 25 Oct 2024 21:51:17 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 21:51:17 +0000
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
Subject: [PATCH v4 4/7] PCI: Allow IOV resources to be resized in
 pci_resize_resource()
Date: Fri, 25 Oct 2024 23:50:35 +0200
Message-ID: <20241025215038.3125626-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025215038.3125626-1-michal.winiarski@intel.com>
References: <20241025215038.3125626-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: c697f026-fc7d-4f0d-31f9-08dcf53f27ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkdtSzE1TG44L1dMRW1jNndBamRmN2xlVUNUTGpzSTEvZExUM1FpUTU5akNu?=
 =?utf-8?B?ejBSZVpzcDBNQ2RCZHNRSUpqaDlLL0FiWkRrTDdoZ1h3SVVIUVBQc3hGMDZs?=
 =?utf-8?B?UFBkRzdIMjE3S3M1TzZaZHVwK3ZCUjFPMWthdW15UnViU3A5Mzh6ZFIrTU1l?=
 =?utf-8?B?citvQzJHREh6b25RU3B0aEVqT2R6Z0FXc1JBQWZCTjJLeG92RGFFTVN6QXZx?=
 =?utf-8?B?R1hzS084dEhnMUR5U0d3aUpBQVFsSW01NkZQM1JFNjRUeG9DTExYWWhuRVov?=
 =?utf-8?B?NGJhd2JTV2JrR3FvZUlhYWt4V0EyUzdGQnB0OW1rYlFwOGYzUkdZdTBUSnlU?=
 =?utf-8?B?NXRVQ211YzA3K1pTTm1QdWtuUzhtVWpVYVlJdDBTREFyNUZwUlV3OG9OemYv?=
 =?utf-8?B?WmwzQWdQSWdjcFJqL0VhTnYzM0p6bVFZK3RKTllZOUovWnJpQzFRUXRPM2Uy?=
 =?utf-8?B?ajdOdENJSXA0Z3ViSlROaEt1QWc1VFlTcUlaM3YvTnFzVXhTKzlsRDYwWEZr?=
 =?utf-8?B?TzdDbVlGNFV3OEx5UE4rMEM4RVlHM2pxN25HeEVyMElLMVg2UTlYckFMTCtY?=
 =?utf-8?B?cVVoVHdQSWpnbkt6U3M3Y1pZQlNmYWt1TUt3VnV5YkZiTHE0TnNEUTMzSGpW?=
 =?utf-8?B?L0pFclM2aXRwWjg4NkZXaVVhS3FtSTFGVHR3Z0FCOUs3ZU5pM2ZrZmN4SDhK?=
 =?utf-8?B?OE11Rm51TW1EemFQT2Rhek1PYlgrZG5jUHovNy9mZDg1ZHREUmZiREV1b2pI?=
 =?utf-8?B?NHk3T2ZHSWdHS25xNlFFdnU1ZmpFWGpyNnZJZjNyb0FFekVMWjZidUhYaVlu?=
 =?utf-8?B?V2llakVOYWN4TkRFYnRXMDlLb3FiUWRuN1VrM2cvOHFsU1h2SVEyelJNT3pk?=
 =?utf-8?B?K2lsZ3BiUCtaV0lZek5JelQwVzY2eHpxZlZOdDZVcVJsLzRvM3pxcWorRVVO?=
 =?utf-8?B?ZFptVDdrcjJ4eW1mY2dlTXJldW5FeEZaK2Vnc21PTGxTTVh1R2ZVMzlvQTh3?=
 =?utf-8?B?NjN5S25LTXc3MHZWS2gwaFdPRkdkQzFkSVRUS2l3WVR1MUVlZDlEYXNZU1Vj?=
 =?utf-8?B?dTU4TnlpdjVCMVVLaWwrRmQwWGlLclNzTk5sYmJxWlBxcjNEN0xPTlFGWWpk?=
 =?utf-8?B?bU5zYm53Z1h6dXc5d1h1TzdJMERQbjZyUS9OclhaZFEvbUZVM0FzL0p2b1FW?=
 =?utf-8?B?WnY4RlZzZng0YTEwc0ZHbVBEbWN4V1ZlTFNtWURvQUY0cUpMcjRLUjdVV3NU?=
 =?utf-8?B?azhRTXdObTBtOERkYVZuTFd5Vkd1b2l2dkh3alZtOGREbHRPT2dMazhEZDN1?=
 =?utf-8?B?SWNCWFQ2TWVveU5COHZ1MlNaei9SWDZqeVl0ZVBTRmZHMVpvNGRDN0tkbW45?=
 =?utf-8?B?ZzN6c2lTYVV6T0hFMCs4b3RiWGYxL2pyZHN6bEZ3VTJFV3FkalpBTUhEQTd6?=
 =?utf-8?B?MmFZNys0eDJtOGM1SVdZcmR0eWRWc3Q4b005U0lBbUVLbDY2ZDVWbEMzNkNR?=
 =?utf-8?B?a1VWOVVSUk5XUFBRS2tKN2hzZXFRbkE3WTZlWWJkZzJPcGFEV3BsdFF4a0Uy?=
 =?utf-8?B?TmJYeGI4WVFKM3ZvcU9lTGhzUjNlTDVPL2VkQkN4RDY1SlBXd3lEcTFqV1lk?=
 =?utf-8?B?UHhNcnBFTytpT2E2QUZoTlJtQ0dycHdDMGpqNVRLU1RNMDlLQnFERjRsNlR2?=
 =?utf-8?B?a2M0MWZQeTJqRDY4blZ2ck1GMjRWVjdnUEtVd2VNdEdJV1cyem1laktDa2JG?=
 =?utf-8?Q?6Xojk4oQBnNWBdZh8o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MElhLzJPUllWVnVlcDRsN0pzejhzSTdQWjBDTjhCQnowTmNpelkzOXpTbW9r?=
 =?utf-8?B?ZXVYSmI4M09IUlc5WngrKzg3Q3RJS2hKblpXb0ovckJxZ1BDeVNsQ21URllp?=
 =?utf-8?B?Uyt1KzVuVVlYcEh1cmQ1QWVXNFdoeEhtc043SHN2MjhLNFRXV2RGYmRwak9y?=
 =?utf-8?B?U1hCajFDeGd1ZWdCZ2RMWWQ0V3U1THpsaU1UUlFhU2lkdHg0QktOQUppRk5v?=
 =?utf-8?B?amJKaEg3NXNwdDFCN1M5dTZoVnRZV04xUnhFQmRYaU45WUVvT0E4Y3NENHFr?=
 =?utf-8?B?bHZSOURGYkIzYnVYbHpUWG5EeWg1SU10Q2RSTzMyUUxlcnM1TUp5STBOTFdK?=
 =?utf-8?B?UGhLRWpnSnk4YXFDVUxSQkJkeUc4c2V5eFkzbDI5eEJSZTA4cC9hdTRvRTlw?=
 =?utf-8?B?bnBjZ3NqMFo2U29sZ0JQdzVQU0RNaStBLzN2alJ5aWNhb2N3b0c4YVN4R3V0?=
 =?utf-8?B?bFlpdG9rUVUzRzYxRWJENUFaSnp2ejNxeTcrVG1lOVRTczVQQklWWm9sTzRE?=
 =?utf-8?B?V1UxbThYUHczSklVYkhPc0NqSmJ6RUZLTnIwMFZOYm9PZGQvTkJlU2dMR2JY?=
 =?utf-8?B?WmZieUpSdWVCa3cyU1Vtc3M3am1ROGplZEMxWE0xSFI4UjJjaGhLbEM0UDht?=
 =?utf-8?B?OVNmYWFzcW1CSkI2b0RUUHUycXZ4ZFB1VUpxcFltbE16cEVhNkdzYTZlY2di?=
 =?utf-8?B?TTgyakNPaWkzUGFXQXZqMkREamNRK0pPM2Q2M01hL1NMNHlGbXk0L25SckRt?=
 =?utf-8?B?aHg3MGFzZlBXTnIxbXdKUDNYVW9Bd215bnh0aGgrdkRUR0JVY1ZKWjFuNEFs?=
 =?utf-8?B?VnE2dm9WQzRKVDUwUDRrRnU5UGRGMjdBTTlTSlo0SlFmMFVHQ2RZRS94V2Jz?=
 =?utf-8?B?QS9EUjBZeDRXdjR5WDE0RFR6dGVvekpXUWZEVkduNTlKeklyZ3RmVGJSVjg4?=
 =?utf-8?B?OENBZmp0cU1ZNmRGWHhIVm4weURWY1dNd3JmaGQ1WFczWnlWcUZsMGdxUUxU?=
 =?utf-8?B?M01IRVh6OVdvcjhrWGVXRkdoTEdhM2ovODUxc2NZWkhFeVVSb0puZkhsSkNI?=
 =?utf-8?B?RGRzQXcxZnJiQ3RQZ3FVWTBIaVFmMWZUS21SZUx0VXlXVXJyNzVtZkg5Sk9U?=
 =?utf-8?B?alpZMWRWcGlkNXc0RnVFL2RoMWkyS3crT1FmdnVaSElTQ2F2eUxzRXJ3d0Za?=
 =?utf-8?B?MG1ad01oSldnY28yTnVNeml5bktCZWoxbEkxbUxWcHEreEViMTVCR2kwclQw?=
 =?utf-8?B?ZVNxbExCQWFsUFNlbUtSMDM5eUhZU2h1d09uTzMwYWp6L2RhOGNDOVUrcU94?=
 =?utf-8?B?TW9jMUsycFNrd2M4SDYvUzB2aXdDMmtoYmJBOUQveU5EWFZndFpoRElhYThl?=
 =?utf-8?B?SENaSS9wanFoRXpxNjZLOUVMZXZSQ2JZUnZsOXd5R2FnMTBrS2lHTi90Wmor?=
 =?utf-8?B?SUJvNTB0bUJNUytLcFUra3dYU08vN296M3Qvc1A4TUlOdlhnaEZQYkZZM3pL?=
 =?utf-8?B?dnJ1akJ1c01ZWUZHSzZoNWJobFdMSm80WndDczVCQTdORzVrM2cvVGd1TWxw?=
 =?utf-8?B?dDU1L1hsOHljNTBWN3FjSmRUaDNKS3hZN3ZYaFRCRkpmRDJzVlVpVHBtMElh?=
 =?utf-8?B?WEFKWitIRENRbE0xelpwK01JVG1rL2ZNTFltM1JMNmZKVkx2c0YzS1YyY3hy?=
 =?utf-8?B?NGdsYXpCSUxscm1lelV4QWF5b24rM0txcFhLekJ0eitTOElkTlRDN1NiNk9M?=
 =?utf-8?B?NVRrSlBiaG9OSi9DTEJSWWRNc0hUN1Vya3VoSUJtd053eE4vQm1xK1RQWHF2?=
 =?utf-8?B?MXVRTjY1azZ2ek1adVVKRnJ4V2hGSFJSWkJIbHZSbUkxRmc3cUtWUXBFUzgz?=
 =?utf-8?B?OEtyaVlyUi9ZdFdZVCtVb1ZiVmhNMi9zT1NiM3VHMUpYb2JOM3RqM2llZzNB?=
 =?utf-8?B?SXdsZmtPZllZbERYVWZwalkyckw5bDBLVEp4L0xPc3JMSzQ4c25MZ3pobkMz?=
 =?utf-8?B?Z01BQXpVcU8zT3FlM08zdlUzMHRIRUdzSmRndzQwc3VmMkt3bVZ2Y3VENHFW?=
 =?utf-8?B?Y0d4M2dRdzllbTJoNUEzYTRvVTJsZ2RYTUpHS21jdXNYNTl6d2xrdU5Ga0FX?=
 =?utf-8?B?aGNOWHA0U284OG9ZNS84TzNhQVJrUDdQV2c3WlhTVnZnNmhKNk1RUk9FUVNt?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c697f026-fc7d-4f0d-31f9-08dcf53f27ae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 21:51:17.8524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRcEBI2gJ0QJeOH2lroBrnXszOR13W8lchFKxupVDPJHT8gEtwpJz7h6L5AWt803t48sw4ui5JmXtxWVh876GUAHqUiRpxGqYWbz436kFTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7745
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

Similar to regular resizable BAR, VF BAR can also be resized.

The structures are very similar, which means we can reuse most of the
implementation.

Extend the pci_resize_resource() function to accept IOV resources.

See PCIe r4.0, sec 9.3.7.4.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c       | 21 +++++++++++++++++++++
 drivers/pci/pci.c       | 10 +++++++++-
 drivers/pci/pci.h       | 10 +++++++++-
 drivers/pci/setup-res.c | 36 +++++++++++++++++++++++++++++++-----
 4 files changed, 70 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index eedc1df56c49e..79143c1bc7bb4 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -154,6 +154,27 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 	return dev->sriov->barsz[pci_resource_from_iov(resno)];
 }
 
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+			       resource_size_t size)
+{
+	if (!pci_resource_is_iov(resno)) {
+		pci_warn(dev, "%s is not an IOV resource\n",
+			 pci_resource_name(dev, resno));
+		return;
+	}
+
+	dev->sriov->barsz[pci_resource_from_iov(resno)] = size;
+}
+
+bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
+{
+	u16 cmd;
+
+	pci_read_config_word(dev, dev->sriov->pos + PCI_SRIOV_CTRL, &cmd);
+
+	return cmd & PCI_SRIOV_CTRL_MSE;
+}
+
 static void pci_read_vf_config_common(struct pci_dev *virtfn)
 {
 	struct pci_dev *physfn = virtfn->physfn;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7d85c04fbba2a..905a533807b32 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3720,8 +3720,16 @@ static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
 {
 	unsigned int pos, nbars, i;
 	u32 ctrl;
+	int cap;
 
-	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_REBAR);
+	if (pci_resource_is_iov(bar)) {
+		cap = PCI_EXT_CAP_ID_VF_REBAR;
+		bar = pci_resource_from_iov(bar);
+	} else {
+		cap = PCI_EXT_CAP_ID_REBAR;
+	}
+
+	pos = pci_find_ext_capability(pdev, cap);
 	if (!pos)
 		return -ENOTSUPP;
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 1f8d88f0243b7..4347858007145 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -580,6 +580,9 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
 void pci_restore_iov_state(struct pci_dev *dev);
 int pci_iov_bus_range(struct pci_bus *bus);
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+			       resource_size_t size);
+bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev);
 static inline bool pci_resource_is_iov(int resno)
 {
 	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
@@ -613,6 +616,12 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
 {
 	return 0;
 }
+static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+					     resource_size_t size) { }
+static inline bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
+{
+	return false;
+}
 static inline bool pci_resource_is_iov(int resno)
 {
 	return false;
@@ -621,7 +630,6 @@ static inline int pci_resource_to_iov(int resno)
 {
 	return -ENODEV;
 }
-
 static inline int pci_resource_from_iov(int resno)
 {
 	return -ENODEV;
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index e2cf79253ebda..cec8f684b7c70 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -425,13 +425,40 @@ void pci_release_resource(struct pci_dev *dev, int resno)
 }
 EXPORT_SYMBOL(pci_release_resource);
 
+static bool pci_resize_is_memory_decoding_enabled(struct pci_dev *dev,
+						  int resno)
+{
+	u16 cmd;
+
+	if (pci_resource_is_iov(resno))
+		return pci_iov_is_memory_decoding_enabled(dev);
+
+	pci_read_config_word(dev, PCI_COMMAND, &cmd);
+
+	return cmd & PCI_COMMAND_MEMORY;
+}
+
+static void pci_resize_resource_set_size(struct pci_dev *dev, int resno,
+					 int size)
+{
+	resource_size_t res_size = pci_rebar_size_to_bytes(size);
+	struct resource *res = dev->resource + resno;
+
+	if (!pci_resource_is_iov(resno)) {
+		res->end = res->start + res_size - 1;
+	} else {
+		res->end = res->start +
+			res_size * pci_sriov_get_totalvfs(dev) - 1;
+		pci_iov_resource_set_size(dev, resno, res_size);
+	}
+}
+
 int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 {
 	struct resource *res = dev->resource + resno;
 	struct pci_host_bridge *host;
 	int old, ret;
 	u32 sizes;
-	u16 cmd;
 
 	/* Check if we must preserve the firmware's resource assignment */
 	host = pci_find_host_bridge(dev->bus);
@@ -442,8 +469,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (!(res->flags & IORESOURCE_UNSET))
 		return -EBUSY;
 
-	pci_read_config_word(dev, PCI_COMMAND, &cmd);
-	if (cmd & PCI_COMMAND_MEMORY)
+	if (pci_resize_is_memory_decoding_enabled(dev, resno))
 		return -EBUSY;
 
 	sizes = pci_rebar_get_possible_sizes(dev, resno);
@@ -461,7 +487,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (ret)
 		return ret;
 
-	res->end = res->start + pci_rebar_size_to_bytes(size) - 1;
+	pci_resize_resource_set_size(dev, resno, size);
 
 	/* Check if the new config works by trying to assign everything. */
 	if (dev->bus->self) {
@@ -473,7 +499,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 
 error_resize:
 	pci_rebar_set_size(dev, resno, old);
-	res->end = res->start + pci_rebar_size_to_bytes(old) - 1;
+	pci_resize_resource_set_size(dev, resno, old);
 	return ret;
 }
 EXPORT_SYMBOL(pci_resize_resource);
-- 
2.47.0

