Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FEBCA5A46
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 23:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8AD10E9EB;
	Thu,  4 Dec 2025 22:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fl9EeC3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A323310E9E4;
 Thu,  4 Dec 2025 22:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764888411; x=1796424411;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8lUI8SSQJytzgeU6hFTQZP2iWwRUVr+nHwII1pkk0Xg=;
 b=fl9EeC3W91d68DEdQcrdKhLgN7/J9/xYJqXYs58jqkJtKqWU8kxw5UKr
 VHe7uR+2KzF+D8hzx369oG5OTwPwGxoVq1gPciFa95pKTXZMOMoVk4v39
 WyxwX5MhPmuBeJ6ZPCr2k1dxN9lz59STaLZMxpkK4NPypdjKmJC3chBO8
 0udtoB/Vaqb9QIiDVvVR6Wx2dAf2ny6NVFu4eEBX3oZ3VwK8k+OBePeMA
 3omBgjIvIpyAKPK0sr1uq+eGWIkEJkVe1aZ+gqqE6f1KoKCb0hrRCKfB+
 GTQLo0SvTKiwU9Ax/cgyuy39Up0zajmOmaW+2wN6mIbHyOOzllBAsSuU1 A==;
X-CSE-ConnectionGUID: XJ4sRt8WTQOlWZytAVjBzA==
X-CSE-MsgGUID: DvjedrLiTXmbrR4KqZTCdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70540198"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="70540198"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 14:46:51 -0800
X-CSE-ConnectionGUID: EABR9RocTHKdcOi1v18mGw==
X-CSE-MsgGUID: jhDE6rgeTgy0F12gThTNjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="195221940"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 14:46:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 14:46:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 14:46:49 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 14:46:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgrPH6sUcOCs3F2OZtByUhNxhtZ7PqY6qot/HyA8A5Nl61c2N4mIIPftq4Zxvb399sgUCcF1pcKnEebZGNOZtrW2b9CBqlV2goVRd/lm3esEx9Z4dfvw0Omrcp5EKDi1oqb8bZ0ZMCr3m23MkciqScUlP0vJsf2ZzTGiCjkMEoGYKMsWk8ktJvro5wzXtR7i+Z0gVgGCYRsHHCB4YDFSKvvRFqEbee+AuT5r9X9+XJlWGYh/HcJjq8a2dzvhgrYL5rFxpJpGlar/92Rarr0+ISje92vwmw1EMf47Sn5lMPS5v5jpeFUihYsMFYNRqG3IDKPBU9KCfi2i2AUfU9ssJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSnpjT3i93tLZ45xfM5wl86U5Fk9GxmdvzemkxqwbqE=;
 b=Spn9BNQh2Nztno4kgZiHGt4pK3o2Uz3GfGEbX0K12CqMJaIGVFF+sCOffuH9DPwzDvvzsA3yXgwr+DmOYZzr4NpQwWiiU2mrrobdS2D/WYKNXTyf4ywwaxQUY1Y7lt9e1cCflarYQRybRB1m6rAV2BowgydwgdUgUiJz1LyEIIM074jjdo1x/dalA/xOCpBynJg778ElK6NEsIP/zn6uTfJ38TWamyzgZWNV9NleCFWqbBdJ7OV+LVhRZquRHIKWs0NPvDxjD2g0AeGPCe7+Um9V6xRLu58R4NzqkfrUUaGtxKYM2+AsvrEQppNGY3+XXNrNhaBQD+d2Fa1+Y4tyTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 22:46:46 +0000
Received: from CY8PR11MB6865.namprd11.prod.outlook.com
 ([fe80::cd06:13ea:18c5:978c]) by CY8PR11MB6865.namprd11.prod.outlook.com
 ([fe80::cd06:13ea:18c5:978c%4]) with mapi id 15.20.9298.010; Thu, 4 Dec 2025
 22:46:46 +0000
Date: Thu, 4 Dec 2025 14:46:45 -0800
From: <ivan.briano@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <matthew.brost@intel.com>, <jianxun.zhang@intel.com>,
 <shuicheng.lin@intel.com>, <dri-devel@lists.freedesktop.org>,
 <Michal.Wajdeczko@intel.com>, <michal.mrozek@intel.com>,
 <raag.jadav@intel.com>, <matthew.auld@intel.com>,
 <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v29 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Message-ID: <36vd7o3rydwtxevfbqvnv7ky4kmdlcizxfpa5e4vwfembzrrlg@22gldtmyltdo>
References: <20251202184636.96142-7-jonathan.cavitt@intel.com>
 <20251202184636.96142-10-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251202184636.96142-10-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::34) To CY8PR11MB6865.namprd11.prod.outlook.com
 (2603:10b6:930:5f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6865:EE_|PH8PR11MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: def53c8b-abdb-495d-0e26-08de338700f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Blhmyz55GjU2vwIVqsdWZUrPSS2lux22KAKG/0WrQo0bpwA3O/NjpI/aOsuH?=
 =?us-ascii?Q?4rWBEP9Rpy8sz44qyZPQCMUUA0OgI5x3V/AdVJ59irJ6slLWU9U+ihQIgDSc?=
 =?us-ascii?Q?T0nKwWVK6oOSNppmdmhrdRxxSmcl7Wyk5Hp94icjfdklCoIXT2nBxN85CWrK?=
 =?us-ascii?Q?BfrTomC4hbdSVR+xpUX2xhO6Fo6e2n9lxW3m95BpbHhrWYElTjUCmn/zJFPl?=
 =?us-ascii?Q?nxInWBBjvVgmnZO5j3f+ODRtylSGvHvP/1IkRAzHluJnlfX4R6o4T0J7DHtc?=
 =?us-ascii?Q?Rx0eU8jcBd+KgRdbpLKTEVZf+NxM+kM3TVchfuRjnWU9rOvjqos00SyRpC5J?=
 =?us-ascii?Q?m2EmyD/S+O4nVuQlnXmJ3gE02mcuHekE06rGn10z21Vki0GR4jLo77ILOZMu?=
 =?us-ascii?Q?5Ovx1aN1od3QE1FlEKsrTWwPE4ES2TAM4rQ1Ar9f3be2WsOuhHl3F1paVPfc?=
 =?us-ascii?Q?AJ1RXe8XAKwgQ7Eb9+zkqnH4rph/FpTjAkHVB1Z7wHuetBDTUzmoDs26nhsm?=
 =?us-ascii?Q?I5E1GmDigSwISl6njOneqsnGLHD5y3UyN3YMf53n1akI/eZpMahtZ+XO6ONy?=
 =?us-ascii?Q?bNe4kCEGDY1SZ3EjT9/y7RgSiMS40banl+BCB9wytPbrARO2o1fui16EsJfk?=
 =?us-ascii?Q?XoKCbdRhaMBBxcoEgoKvEbZ5oOVah6RZTtBNYneQ+6Fsr0IbP2B9ypNX6umV?=
 =?us-ascii?Q?SNU2/NPNXyxH4vRYzIPnxnUrnu2CgiZl93FLOpyFcF6+45fXp57W/c20Q4Fo?=
 =?us-ascii?Q?9cigeiDXC9qA85LbPbLJGESGXRjci/BCx/tQm5eVklrDel/He/eGkiJZ9dZ6?=
 =?us-ascii?Q?0KQFd0RnSlLgqBB+gwpCeQYBw0PmLOsBetqnUb3jSE15K8E23JY8lc7V6fJE?=
 =?us-ascii?Q?0tdHpiJRYGuPkW5WmEV4fFOVFiLMwq1co3k2OV3BqWoi34Hs/ro+wbXTp4Uk?=
 =?us-ascii?Q?ZPxQeaWY5kInA7VrR/JQfNa7lczOowvaDb7dg6qa4+TNrib7Qj8EJKdVuNEv?=
 =?us-ascii?Q?KnaD+fyD8rd6ofyZoI9T6mswIcdNzXkJGIKpSI5yHp2groZSBPuZEBXjhi8Z?=
 =?us-ascii?Q?Q9HhLM0YQ9CNiQxuqHpu59yeTOd1Cho/cioMZeIowdY7pGpbgcpXIu0X5Idl?=
 =?us-ascii?Q?6U39+m2nFPjVcV4aiiNWhTkodp4aiWlwlcbFIhIUPeGUglB8X9nBsgF8/9rX?=
 =?us-ascii?Q?YaYF0YOHnHtCIfd5PvOKRK44VvppMGIvr117sV6U8+QO+HlDPr3hmcUPqku6?=
 =?us-ascii?Q?4mnLJriJYkJB2gx1O2/bWDnEiN1dFdLi0MPpdhCGQ3Z4UfY+y7B4K/BuaCGz?=
 =?us-ascii?Q?HymyjhlkyA6fGYHtvX8F9j64JnvmNlS/JyjX7iwFNVLHchwYO7iXRrWkQZd5?=
 =?us-ascii?Q?x4bmY37Yb5LHHzUQDgxhKkWeXEKg1+oaiP+ZHWchi3+Im5iM5vzAJgOzjEgE?=
 =?us-ascii?Q?ShX3dHJB8oid5cjd6D4g7bjuPEBJDIUp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vs5MFSWPG9Fa81YYO3szTPkDaKfrhvhL2ADfZ2tAFnqu1S6zZUaRlu44Ca3H?=
 =?us-ascii?Q?LG7juu7ou/Kl8iSZUa1JkUDmM4HU5ENnI98J+X2faYbq5+MOeRY0eyGQPIHJ?=
 =?us-ascii?Q?PQj6LundY6Ua++Re6nSJPDDkNJDFOJrgXC0B63khfR/0jOec3ae2euHSsjb3?=
 =?us-ascii?Q?0fPBDYR7cFbao6aDsi7TrPUV805l9u76AK07Ds7AxyAuSKP8WXJSG1v8hzgS?=
 =?us-ascii?Q?l3P8mW5LzsxyKcDqLT5PHET1Kt/l3a9QEpMP/hSryFSFX0SG3Pv/qd5NmpSs?=
 =?us-ascii?Q?gmM9vjnwG6EmsOLUILs1V71/R6jc7JALJ5Y8JLc6joVLCWlHomG1KL1SlOGc?=
 =?us-ascii?Q?nBLVWwQNvgJ/PstZybeesQVtAtX4vurLTN8b8tLZH7FQ0FolxO3t8ihMkUJL?=
 =?us-ascii?Q?rgr04e9l7Bt8ZXAcyN+4h2c11kiBCQJKbjgz7sCuwsOVrct0iWuzsifmbNcw?=
 =?us-ascii?Q?E03FisEtiG+VV6UE89yRFTGegpZ4Ae20pT7cls6xy0lzIeyoUirTfodb8uSy?=
 =?us-ascii?Q?3I2u0A8IpznHUGcIDxsPVrVTpWZj+w4Egx9FdfZJR3I5HSzcttZJYG805k6Y?=
 =?us-ascii?Q?HxBSVMSbkOcGyBFEsYJpeMIWxIsSXfwVJQKUaH20LgyRTOjyunlPoeHNzUNY?=
 =?us-ascii?Q?6uDDlGQjOApyXgKdrdRxd5rirgCc2x0BVmH/aMEbPuL//gMdHdxesQeMGr9J?=
 =?us-ascii?Q?BpULwKaCP4dNBe2lCn0BCWNdiD5hk0M3ahc5teC/qazydbOvpc20nYpDbmEQ?=
 =?us-ascii?Q?dZ+FcwAbWLijaA56iQJWp/4iKUyntQ3KBJkwjfiDi08R7J9A7aPuN2tL2Flw?=
 =?us-ascii?Q?kjhnqnsVZdCN4IJHh4uEyuucZ+Gb9CHnL/azmy8OqCbdKi6UhHIDoQutgpM+?=
 =?us-ascii?Q?q24xcHaQuSrHT3mlwYQxp2gWf8Zz1eyz0VKESTYHFGgfBW2B0Xumz2w2EV3H?=
 =?us-ascii?Q?dIH2OlcMLxn7f7ii59TJf21GwdyqTmGoomJxma82cu4/VHWTDDBY2whLIbvt?=
 =?us-ascii?Q?AYNyyLOW5sCCVhOtkJH11pnWVOYbuEFt/Ba9hJo+z2vFsgZMoHCwnALTdnI2?=
 =?us-ascii?Q?DKagUy75AP6fTD15neTV5KD0IvNaeWMNrhkMxa2e3lAAXIo7z1q7xbB2gOvF?=
 =?us-ascii?Q?KhM5RIvJjHc0tNcd8dYX3vIPd4P3z18WjFdyyer58/ZTHR59GdB6EIgu6JQP?=
 =?us-ascii?Q?Rxq/hLM01D/1BK7IWZl9hCEs0Tv7zOu637zeEH+MwKyQCIUdQWV6qr31ddZ9?=
 =?us-ascii?Q?yyP/njw93kBKBCoIBKU4KUSlBHka5rZBN5XhrHvNwS64EZU0OF1RDW/CE2KU?=
 =?us-ascii?Q?lbv94VgoU0/Qmww6XNRurtMkATsspuGQNjOfrsZftUk+kr+k5UFkWGLbm5Qr?=
 =?us-ascii?Q?75lVCUnhmsOCDibiNQ+rySR2IfHqaTRD7PKawhpoyJcqIVAyrvXs0k87ApqA?=
 =?us-ascii?Q?KPHjydr8pJRiA1uzUaKxaJTXSrBrju0QUlzryGkuM2CKPFbvsY36lYSlOuw+?=
 =?us-ascii?Q?ouo4LVEHPUxL5b+xm1r+8S/hSa9StGjPP2OeVPIwlcluyLP4hvbUYK1GrQDW?=
 =?us-ascii?Q?kRuTKJT95AeitjjQlPoz11INSMQRD/g4DvULWVuF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: def53c8b-abdb-495d-0e26-08de338700f4
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 22:46:46.4387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: abqroxRjCqmHGvqoezLKG0nRXYN/iulr+X+0yM/DqsvJ/8X5WN1WUfY0rgsEEQghseaJRWPiJgFjSiIpIv0bvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
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

On Tue, Dec 02, 2025 at 06:46:40PM +0000, Jonathan Cavitt wrote:
> Add initial declarations for the drm_xe_vm_get_property ioctl.
> 
> v2:
> - Expand kernel docs for drm_xe_vm_get_property (Jianxun)
> 
> v3:
> - Remove address type external definitions (Jianxun)
> - Add fault type to xe_drm_fault struct (Jianxun)
> 
> v4:
> - Remove engine class and instance (Ivan)
> 
> v5:
> - Add declares for fault type, access type, and fault level (Matt Brost,
>   Ivan)
> 
> v6:
> - Fix inconsistent use of whitespace in defines
> 
> v7:
> - Rebase and refactor (jcavitt)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Acked-by: Ivan Briano <ivan.briano@intel.com>
