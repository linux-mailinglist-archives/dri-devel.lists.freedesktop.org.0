Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05BBC7D59E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 19:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0110D10E063;
	Sat, 22 Nov 2025 18:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGTwR6oe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488AA10E04F;
 Sat, 22 Nov 2025 18:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763836728; x=1795372728;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pFde7Y2x7rAtLvIrJRNG+0scAgXwBZqSYBWpj3mJrn0=;
 b=RGTwR6oec642KzV13E9sEnqmjVTiE/D1OSMZKnujBlPXGBhtGayRxGM9
 OdEXKu8iZeFZd0Nmn7AN8AGUd711VWDNDFL31x2xtlDd2o+L2opaSsWNc
 do9Fc8NlTMPal2UrVizGgu9RLme2bkZAZBtqd7b6ujTZ8SIdK2G/+h3ts
 W9SlVX+COkaDkVfi0N56ItR2/EAqjuoW44n4ZRMpEL5MeZh0WHkTjcCd1
 1nLY0G8G1AONjTcoayuj48BDn1C3M2NVVEuK4Ak/SfS9JgiSMe3edJ3JV
 X2+D+h+YXY7rTWe1pMr9dldfW+bYFcvRTiTNsKcno13gyTXw7g3vpbeRv Q==;
X-CSE-ConnectionGUID: nT4Ui8XVTOOvEVgZjk7KQA==
X-CSE-MsgGUID: SV7fMRcyTYCiMZt5/XW0pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="64904075"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="64904075"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:38:48 -0800
X-CSE-ConnectionGUID: nKgo0sqnQsmnR1YQ9SGnUQ==
X-CSE-MsgGUID: 5ZRjK/0OROukaE5XNntvfA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:38:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 10:38:47 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 10:38:47 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 10:38:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owWkCJkT06XnWSvXuyDiqtPVxnDwhvblWiQEvBzEYJ6YbnVT6kDWNHL2aQZ3b24kVxTpUSFGC36h6FGHIBplXQv6/muO0v8DyQaqFvJqgeLit5cfP6VaPii5WfuxMIyTAcMdjE13W4ZepktWGRUujuPPSoG9NFgowtLOIGZQXLtaAlVY6VcE8yWeMckOZ5MLtX05f93OPc2HicJWQbHh8FNGTHQ7mO88A6HWAWnKCRLQT6eMaz+rsq33rRtw4jhv5z4Rk4ml7pxMwsNT0Q54jXBHatN5yTOU3PtkjYiPltqYDkrybTxTfSwq0lgFZk3DtdubwcvJc8S6DDbQFhdIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/FpeC7SzFw1LotDjbBdaO6Q47FRgz8TbHzfoskdCcQ=;
 b=M4zsw15NLgAfhm8ahEoigPfihrShndYLDSy0ieJcqyO728ObSE6bHBJFceXyxnnWl63QWtaHLLTfStxe4FQHe5o4Kd7rjWrQ1ptKauOOxKDpTDrg/VXyobF0WVGUFhjQMs8XUHxiJifaMMHSmbjGGulCcuooYYAksYjapBpnfTdlw7taUbpoKbjLTTbbqsWbelkZAOjiBp6rD0daj3fm4tNIRsaVu6R9C2fWDSXeVMFiB0wqYi+oUtZk387gPDewo1UOwlSJdqxher/rjLFkaFS9QnCTgWC9zekGhjvQV41o38ugLm0Qd9kjAqyr08J2aWdAbutlD2/8eS7FWWwOBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB6762.namprd11.prod.outlook.com (2603:10b6:303:20c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Sat, 22 Nov
 2025 18:38:44 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 18:38:44 +0000
Message-ID: <582e26ce-4579-4c90-9fab-40f705e89cc9@intel.com>
Date: Sat, 22 Nov 2025 19:38:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 25/28] drm/xe/pci: Introduce a helper to allow VF
 access to PF xe_device
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
 <20251111010439.347045-26-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251111010439.347045-26-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6d37b2-57e5-4442-0b3c-08de29f65d78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anh3ZzNGQ095R0w4NmhwOHBEbGRMbWZjVXhsUVNGWnZtYk9CcEN1QkpRdlM2?=
 =?utf-8?B?OG1JemVCZWIzeVV1UGhqbTFvZnJvQXYzQmpIa3JFQUMwNVlobTFodHlZQlE4?=
 =?utf-8?B?N0FZeEZnRVpvOGpaNjMrOHM4N3Q2ZndiM0pKaHBXNEhyZTdXTkpURXAyVVZB?=
 =?utf-8?B?R2p6R0wxU242NUVVYXROb1hBWHVzR3JOK3ZLbllxRUFTUHRxNm5ZbysxVzBs?=
 =?utf-8?B?UFI0cWRDZytGdnNjWUh4STl1OU13MEUwRkJla1JPS24wM1ZBaDRWZUM3TUdM?=
 =?utf-8?B?QXB3bnBmdjFSbE8rWjFMMWVQSWxvb0JKYVVxWVN5UkZZS0xBRk45bkswYUJ2?=
 =?utf-8?B?Y1ZYZm9WMU41aWVKdXJMOHpzSnNaYWZTU3BkSjFDbHd6d3FuRm9heCtjMlda?=
 =?utf-8?B?dkJqWkY1RVViRFU2WUc2WFZuVk9NdTh6d3ZVb1E4SjZRc21RbFkzT3NYN3JD?=
 =?utf-8?B?OGFtRURWQ2g0eFlNK3ZrTnBWYnowZTY2eEV3Z3gxNEFtVFgxdzJYNjhUam12?=
 =?utf-8?B?TTVLSEllVktWQVVmSWIvT3g2anhQMnhQM3BzR0VSMGJieEFma1I1U2l6VjBn?=
 =?utf-8?B?RlBHK0tERDV6Ni9vRTFGMUpSVTRlNFFuMHpVUmxTU0ppZVNMWTBCMHd0WjBn?=
 =?utf-8?B?aWdKeVJHbVBZL0VoY3FWSDN4dFZsTGZJalZJdWVqRlUzQzBEd0YwY0dRWE9I?=
 =?utf-8?B?L1ZUTmVWUEMrMXBjb3piVXhhVEs1a01XaDdQVEVHS0FRdVA3NzJEZm55ajlu?=
 =?utf-8?B?ZVZSZWpQZy9WdnBPYmxZWFRFSUtzdVZkWjhVZkFONTNSTmVGaVJLcGtmWkdp?=
 =?utf-8?B?Sk1ZUXYrMEx2QUJjRWlQcXRQekh4TEkrQVUrYXlVYkErMFlkU21PaVIzVnJh?=
 =?utf-8?B?WWNiVUtGaGdqekxBZmt6V0l2bXljV0IwTys4Z1RmbHM1emhoQ3lpT3VMYzNh?=
 =?utf-8?B?SjMxQ2YxNjMrMzd3a0QzV1liUWZicHRydnVIMko5Z2Z3ODFHaTdjWXIra0pH?=
 =?utf-8?B?YlMwRmNtN3VpYnVJb2psUVRUSEFnMzVOUGNWUXFhSzB5TG11eTBTQTNvRVVS?=
 =?utf-8?B?czZmbzlQQmJPd2Y4Wjd1VDNBbDhaSUxjVFBlbmtKRGpNbldTYVY1YU1QNHYv?=
 =?utf-8?B?ZjhrclViMmhZc0MwRy9pbzVzaXFQYlhWVjRrbGFCVllsWnNKTzJzdEpXMkZo?=
 =?utf-8?B?R0swcXhhaTdhaUg0QVFtMVNCUmVueTN0d2RtQXRQQUpBUEVkdmU2M1ViMENV?=
 =?utf-8?B?UVU0aERzQkI3ZGVWOVNuV3VjcXVkeWVzK25lTDErbjRHUVJFbGJxa3ZkT0tH?=
 =?utf-8?B?bjF5dVBqaDU1Ym50VDhoM0ZFT0ZWaXRxb29WbjVQVExIeG94UTJES21NbXFC?=
 =?utf-8?B?aHNNNDk3N05QTGFtMU1ESW5GazMxWkZ6ZTZYVXdGY3IvaFlQUnlCUmZ0ZjRs?=
 =?utf-8?B?YTJvVWgzcXVjRUYwSTVSd0tlWUo1N09Jcm5VN25BTnZHcDVOM0Y4T2lGejg2?=
 =?utf-8?B?YUEzbnN6TmFMTi9QaE5Gc2VkRHVKYy94U0RxTlM1Q2wrR3lwVjZmNUtmSDhn?=
 =?utf-8?B?TUxPL2tCL1ZPYU9JZGdVa01KUEU2UjJHRXdTckxjbE8ycUR5MXhWcTVydjFG?=
 =?utf-8?B?cGFGMU5PbjgzbFRqeWVGQjZXYXVTQ0ZlVFkxeGJMcVRkVDFsVVhpRnpDQzFi?=
 =?utf-8?B?WmR6T2o2VmdmVmZOTXFHSU0yRWw1VXB0cDZFT2lxVkt5QlltNkp4NmlhMVNC?=
 =?utf-8?B?NGMxVjFDRjhtN3dCWjhiSjhwRFFOY1N2czVJWkorUjFtZmRLbGcxby8vdWMr?=
 =?utf-8?B?dVpuL00rUHZZY2RCQ3JhUE9jbTVQL25OVG1SQk9HVHNKbXJRd1VMR2U0dFRO?=
 =?utf-8?B?elRpMnFGbXVOUVpRSG1lblpVZ0RhZ1ZYMjNXb0ZxdmtjZjNidVRFZEhpcG56?=
 =?utf-8?B?OFQ0UFBJWmd3U2pMbTVwa0pZcXVrOE81RThQRnBmRitxTktidEVXdGFzVjgv?=
 =?utf-8?Q?MyyJZHrEod4Ya7HZuy3fVQuykrn7f8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODVGR3pRQ01TdVFqYXNSOFdTMm92M0dHUXZURFhoZlVEU2I3cDdzUjE2SkZt?=
 =?utf-8?B?TllBL1hIU3FsQ2JBa1VuT1JvRGVRL1Z2RFFOa3dJZXVhd1BtRHI0NDBtZFRu?=
 =?utf-8?B?aTNXaWtqdE12NWdLamtOanBIL2FpSit2aC9URENUK0dXdTdXMG96WUw3ek1i?=
 =?utf-8?B?azFkVnhiemZOZGNzeEFXWnlXSHNaRGV3aHo3U0hBMHFiQUFnY1U5ZW9qU1lY?=
 =?utf-8?B?cjZZWFJtS2RhOGtHT3NlcTlPc1JzNUV2RlNFeGJEeG9YREJ2cEYySEhXWDQ4?=
 =?utf-8?B?Y1RFcWt6UmVKZjR4R216eFAvZDd3L1BHQjYvQlEycjh6MGtMMC9nWEdqOUx2?=
 =?utf-8?B?dFVIYit4NVVHOVRnelpBck9CRDdkYktIVG5Ydk9ERVgxS1pjRTdSQTdDR1pq?=
 =?utf-8?B?bXpkYk1jOTg5UUYzOG1rS3VyclRhSWdXM1RhcVB2b0o1dXNHanBTQXJDRnpz?=
 =?utf-8?B?d0VCMk1EWnVxR2t6WlZaY0tFYjE2bCtqK0FBd3NZZjVSc2QxdlNMQlhDNFRJ?=
 =?utf-8?B?VXFsZm9hd2VoT25iRG1PVERoRFlZUHJvTGRXVEhNS05LWkV4NGlhMWcwWndJ?=
 =?utf-8?B?eUFHbk0xcnRud0crTm5lSnBBbE1zSzVUTXJHNVQzL0EzMGtpM3RZVm1nZUFH?=
 =?utf-8?B?UUp2TEpUSWdvNVVXRGRZUHlmYkJOS0hldDhydmRyUVFuUTQ5bEFUYmRLZnd2?=
 =?utf-8?B?ZDY0cG1NYll5aW1uQ2JnZlMzYkFkQ3QwY2VCSmVTdThXUE9URWhjRi83SGc5?=
 =?utf-8?B?WVhIS2tqMXZ5VHhSQUZHektWUzdnTDRSVkc0UXlGS3gvQ0Q2a0ZJSDZWYU9X?=
 =?utf-8?B?bnVVWVJFOWJzRUhpU2hvTHlEVkYvZmNKMGpvQmFvbjFrQkp3OHM3Zk9RM2JV?=
 =?utf-8?B?azVhT0tQRE5BQTB1dFExQ2RRWWdORnRnTW9hdUdUQ1M2KzZMcGxJVUxTZGw0?=
 =?utf-8?B?TU9HbnM1Z2E2S3ppMUx0ekpvdmY4dVRSTTdGc2plcWhKTlZNOHBHMjM1Titv?=
 =?utf-8?B?RGI4alN1OVBuc1Z4WHdRQjdCYlVWQ3B2b1kwUFZUWk9yeXd0eDdESkdYUlFL?=
 =?utf-8?B?djMzMUx5aUVPSVNidGFRSUFjbWZDN0RKRitYR1J2TVQxUDl0UlBVN2hhM2Vu?=
 =?utf-8?B?dXZqelk3UndwUTN5bnBLOUhURENYdmtmVnVVUjNPK0g0VWN2WlAzeG5JakVW?=
 =?utf-8?B?VFpPaVVxNWFBSjRXdkpzM0JpNk1VaEs4MzM3eHp5K0FGdjluc043WG5aL01Q?=
 =?utf-8?B?TEk1ZnZtQ001Vm8wODRKZ0xCT0dXc2ljSENhdzBad0VwRGtIbEZMT3RoNy8r?=
 =?utf-8?B?bEs2NDJCVWFJbU80cDdOT0JzcUN1WnRTSTdOK2hHUXhjUDc2QjJRTVVhbEQ0?=
 =?utf-8?B?UWJyOTB6V21lMUd5Qk56dk5HS09nbHhDTHZlS25yWXlPdU1JWW1WdVZrY3NW?=
 =?utf-8?B?eUdSSDRtY0FyNFRGdG1mZVkxNDBPcEp3c01YMVIwN2dOVDR5SHdWKzQ0NWJW?=
 =?utf-8?B?V1E2N0FtTzZ6YnQxWnRNRkZhaUdaKzVXcWlRKzNJSjNWYWd0YUhCT3dnTkRz?=
 =?utf-8?B?a2xxWUIrR2NBM2pDU0Q0RGtDalNqRmpFWkJNbW9sQm1CWVo1eXFGVG5zdXRR?=
 =?utf-8?B?NGwzWHZXMk5ybkhRVFVEb3h5R0xXNmlYSkpnZVVlNGZoYklaL01POStIbmRN?=
 =?utf-8?B?K1VPNld4a1dzeXlXRi9HcUd2VEZpckxwR1kxYUIvcUlCL2JlZUtRRkhIeGd5?=
 =?utf-8?B?aEhMRmdjcXV3VEtIT2UrYjNhVjFjY1ZBaS9LbS9oZDZQVHJWL3NjSUl2Skpl?=
 =?utf-8?B?M3RiSGNjTjVxOURITy9YUzN1Rys5UnVNYUZHUTlUZnhRWXE3ODJnTHJKKzQ3?=
 =?utf-8?B?TW5hZFkwQnNXN0laa1VRT0FINnBRY3llcG9ZYUpzR0JGZktrWXo1YzFrT0Zp?=
 =?utf-8?B?ci9mQ052aHJISlgzWWxJQjZwNGdhcTNNeGlqRythQW5PMHFBbWRjSVFBbVVV?=
 =?utf-8?B?U3cxMU1WVzZRelEwU29JbldzY3RyMlZvUHpjTmZLdVhIVVVob29hWWdXbzg3?=
 =?utf-8?B?TG5lMVcwU3RZWDFFMGEzQXp0L3RQL1pzVU5Ld2tMemRIWlMraFREZUE3amJq?=
 =?utf-8?B?VGE5SVdTTk9ZTmE4TnVDQm5VRUt1MlBIM1hLR2FaNDhwMVA3dGpDS2xTNTZj?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6d37b2-57e5-4442-0b3c-08de29f65d78
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 18:38:44.1241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuypuBMj+kaRM3Y9LXUrOdWv6Ic/X3kzLWAD4mY4tL/PJ/TggRI4B9IBISJqSuKmfT9A7EBDOe7zTC32638XoT0k5z4Ng02gkhlG8mdp80Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6762
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



On 11/11/2025 2:04 AM, Michał Winiarski wrote:
> In certain scenarios (such as VF migration), VF driver needs to interact
> with PF driver.
> Add a helper to allow VF driver access to PF xe_device.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci.h |  3 +++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index cd03b4b3ebdbd..5107a21679503 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1224,6 +1224,23 @@ static struct pci_driver xe_pci_driver = {
>  #endif
>  };
>  
> +/**
> + * xe_pci_get_pf() - Get PF &xe_device.

nit: xe_pci_to_pf_device() ?

as "get" is usually used in simple 'getter' functions
while here we perform extra checks

> + * @pdev: the VF &pci_dev device
> + *
> + * Return: pointer to PF &xe_device, NULL otherwise.
> + */
> +struct xe_device *xe_pci_get_pf(struct pci_dev *pdev)
> +{
> +	struct drm_device *drm;
> +
> +	drm = pci_iov_get_pf_drvdata(pdev, &xe_pci_driver);
> +	if (IS_ERR(drm))
> +		return NULL;
> +
> +	return to_xe_device(drm);
> +}
> +
>  int xe_register_pci_driver(void)
>  {
>  	return pci_register_driver(&xe_pci_driver);
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 611c1209b14cc..e97800d5c9dc3 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -6,6 +6,9 @@
>  #ifndef _XE_PCI_H_
>  #define _XE_PCI_H_
>  
> +struct pci_dev;
> +
> +struct xe_device *xe_pci_get_pf(struct pci_dev *pdev);

nit: since this is just a helper, move its declaration below core
functions register/unregister 

>  int xe_register_pci_driver(void);
>  void xe_unregister_pci_driver(void);
>  

just nits, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

