Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0EF9E0CB9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 21:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AFC10E85E;
	Mon,  2 Dec 2024 20:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7RxbVwJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A6610E160;
 Mon,  2 Dec 2024 20:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733169791; x=1764705791;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ziatBRu7+8yQYDu9P/lYFdLJQ80U9DZUJLbPDJCsZQc=;
 b=d7RxbVwJ/xltv4NHnTup/ICAIVGctS5uqvguRbDtH1dih7FwQmWWlnYk
 hira/XCOzybd73BXkh70Uiuiys52jE6SWWUyVYNWd0JA/UU/kw0hzAnIX
 ph90TrKf1l7Z9FkOLKTeEbIkslC9//wvA6cXlLe8KmhYb5xTFugiDsPyR
 7vd2/hE3cBjwGJhd5F7IoWlDKEWSp13j41E0ncm86jP5hOqEqHdi/ugDA
 I6ncNIu+fUAR4lRqZZVuGw2wgQunGNP1KKGa8Nzzy68kBS0zcvdZ/uoVK
 kWwfTf5Dzg6u5ZPNyw4gh8l6+12TABKov9hLLcIwfM1T6MkKuuUvnliP2 w==;
X-CSE-ConnectionGUID: Xd3E+naMRNON3pQ9YOKewg==
X-CSE-MsgGUID: 3T+q4VqcTMiyML7jcUGZng==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33276713"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="33276713"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 12:03:10 -0800
X-CSE-ConnectionGUID: mMDjjr4yR0SAMvoTNggx6A==
X-CSE-MsgGUID: spKhmGZHQDKJElogI2filg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="92862134"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 12:03:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 12:03:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 12:03:08 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 12:03:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=be1zcLtrzbidGp02lxFvKJ28rFIcqwMgK0WCVo2ob5aD60NyfXT89Mg8rhARF1+RYLBDcFlzbs/3+2P3ee1zbYmbngm/TjdOFgRwOGirZYOAUJUejoaEOIuSxSxAgCILunbSh9yVLB7WAwIeZNaqw5i2kODyTQHuicO1mKs5FaxsQHxeIZtPWLHEEDdUzWgvYbvpqviTZQ9LbRJJrJye+tMl2dmZ/dp71ixw7bD/W6HUXV7S2O0HjbjT/wWjj4TAJL6zufHPwI4wTUoytpEG7G6ba9sXmCnS+ne7w6BHZDreszGFqFwXhmt0dTLhcROUu5gmPEfmS7ZSJ5JDbK0XwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7s2neFlvowg6XOn3hjFryWE8Oe3NUaaYohRQyf2Tb0=;
 b=JEKNwyfzT/+eYLj794FK/JGuBRpRZh0Fn93ZkzsND3T+hvC9RNxXZKfGdvBiwhL4K3H7Kevz9oFkLdjIiVKXb1uoakv0QGmHIxFBzUiSfsesnhPffZWDsu4/EvbufwhGyVvCkV585ubSxdyXW9sCN7QH7F54GBJfHQs4xab8i/aDN10MehWr2+dsJE+fYfcuJqWQ/CX+Zxt6UbyvxDJEWYHDgchBowkXr1+XoNAdxw+AbGFuBp+xsU/FQKzfsUQcCzJRxfDMHkQ3wG2uCVqKB71yiCVCfU9gdF+x6H03zL8qhm5Wegjl6gaJfhch0GUIbKSxToHu7HQXbZ9TpO7+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 20:03:04 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8207.014; Mon, 2 Dec 2024
 20:03:04 +0000
Date: Mon, 2 Dec 2024 15:02:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: <linux-kernel@vger.kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vm_doc: fix more doc typos
Message-ID: <Z04ScOZKhLIGI_MU@intel.com>
References: <20241128035901.375399-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241128035901.375399-1-rdunlap@infradead.org>
X-ClientProxiedBy: MW4PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:303:b4::20) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: ab39a34b-468c-44d2-0cf7-08dd130c54b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6nYrJ/e4wVvv3X2BLFrdIkoYZk73QaQQeEZsdjksJpKoSnI2nra8KNcVli?=
 =?iso-8859-1?Q?X4XObUc+LtjwSeYWf9lmWJ8EWzzA5McrDnxUtYNdEc3YUdh2fvhmcXGAVY?=
 =?iso-8859-1?Q?fphFTEvpYfaSEj2LJMFi5VGVAL9rswix2JQI1Nv+i+9aXsR6yhn3SluP+k?=
 =?iso-8859-1?Q?h6TVjUUj6w4fp61lLXXgtYUcCzCVLVwgjsLP/A20+6aye95HjS4HVT7EJf?=
 =?iso-8859-1?Q?6TcxZ+co9KdFy5oyYs1HyCNP8KesRdnhPrqkHxdqtqtFeMRzauZeTCM15P?=
 =?iso-8859-1?Q?sMeBE2FvrDSa+5+8aERdc1DxTX0LsvOVY4wLZzjdPXLL3DSRsPR/v2d1c5?=
 =?iso-8859-1?Q?suCT9xJKMX4Yc4DBWeEBex3iwTOWeswYnCNLiZ3KIPWztPct3GjQGAVV7r?=
 =?iso-8859-1?Q?Fe/203S2XLeW+OahEimUXk0Ins5zbxIw2YxgFHp8KDkBO5vCP0ajqmIkev?=
 =?iso-8859-1?Q?w68mpUpclzuq50+onxD2JjHXr3ILDwtQqkZ9+fBQwGXn47g2Htvmf4e+Tz?=
 =?iso-8859-1?Q?crOQpn3yXibSnKTGLaeyfQtVPUUQYAGM/EaTcaEmTwMQebxcnb3qOyoBWl?=
 =?iso-8859-1?Q?czBEaljzD2z1Tn7OdnR59gGHuf2+vL4Ue4aq9T0cSwUabWum+mDrBm4SJk?=
 =?iso-8859-1?Q?qA6UJsfjkabqyZKsc02E4mGgpZFXKpd4GXKh19QJE3BBnsB1vC4K3c3eqo?=
 =?iso-8859-1?Q?vFhUmae6CH1Tfg1exxBZ9Ur6aUUS8EiGWlZgBzvVfFiH/Gz0m+w4qUbV8I?=
 =?iso-8859-1?Q?QVP7l0P2o99342IT0dt4xJ1QINVnxyjHEkDsos1/f4wJcCxFNDgIoGSFV/?=
 =?iso-8859-1?Q?Z31BDeNzQ8wkJMMuBY6zHMDgicu2yauiXj0OoDB1AMwPbqhED8eWevkO7a?=
 =?iso-8859-1?Q?LbUbxqrwun+CXlOB7kaRZt7yEIDcmSUYYjXcrHLkJxNxgKjx9cdWcvSRen?=
 =?iso-8859-1?Q?6PPClJpDRbEWi4hONi67/BQyeE7Zt/GN9rc4S9qJQEqRxCJyY1i2WLq5qD?=
 =?iso-8859-1?Q?BFkIVvfb/7YBF//wI1OMLHPs0eMb3VW1FglnsdWiH+KiweEWOZ3GMgZJTD?=
 =?iso-8859-1?Q?EkrPWZ8JXKxoZUirkdtp2WTE1LT8vlR4nlsUhAqzmTRXrsDsv6G5dP17/m?=
 =?iso-8859-1?Q?tZU/kt8/2o6MLMtSxr8R+PZ/YPcQ/MAJx/eWicXApX+BPYdjHa3TKUQhYJ?=
 =?iso-8859-1?Q?INPrYz17umT//luGDdbRgEvSL4f4/qPVcJLkokdJZwkFAkddVMd0gncmBQ?=
 =?iso-8859-1?Q?QbE2fzMBPXRr8ohOXhYwegxYwDIx9OaOHng/nExmr/AQ7izzIDTszjMtDW?=
 =?iso-8859-1?Q?qLrbdcIEAZVCOfB+xE3uA2bIpumSZ+pqkI02wnLhCKyPTok=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OpwaIljRpYPpXezINvZ9jjOZmGBxTst32MIX3tcsLEhcFrN2SubOvcyyf+?=
 =?iso-8859-1?Q?GZbsBMpfCJQr1dbPzqXuzm6saLb8tFHfQdtn6bUmA/Sz2YJWeWjDVpWEU3?=
 =?iso-8859-1?Q?myZ1DyAcltu9nDhcROTxst47SnPLIIaSJ0gq8RplkQwRNExBsUrwJHOWhB?=
 =?iso-8859-1?Q?BQMBKxrmvYmNwFstAPpruoN7SABfGa2brpVzwqAnr7YpxQmhCGdUlPaeot?=
 =?iso-8859-1?Q?krYozc/macKKTC15ID8dWSzJx7ERysNesFORv3xcJXa9Y4sImZzB6j1cPj?=
 =?iso-8859-1?Q?0YvL1JSKkAoll4NtOghvJvKG0Oe0bImQY3s0pRW8ZfW1/lN8XqqRjnmrOK?=
 =?iso-8859-1?Q?oAl9egrKV+cUnT9Cp/wLunBT36HcADhFy8nVkcWTDH0VABLrdwpsQMrzTY?=
 =?iso-8859-1?Q?erUaPzJ9prm/T9Z5WXoAVkEb4/7rmV39GOjzSKTM4Ve1Gs5gWl3rzorhJb?=
 =?iso-8859-1?Q?X7t0P8YVHZboXIMT5UMsNRXlSm4l3ocBz4bgGX+0Fch/vFuXejc+2KoviH?=
 =?iso-8859-1?Q?aw9goCNuI+ChgDllpFHrt9m2TFcco6sDC0RTdxGWLA4CnT9J6PFVgHMU3o?=
 =?iso-8859-1?Q?5dKL9xZ4fFhDvRJvEXlIN+Fl7dSSrIQOJAI4S1qlJ/TZXPDBa8Ya9mAzlY?=
 =?iso-8859-1?Q?HB5ZG1xGzh2/KRR752sugZmQBtyncV/d3nKQUpp6SJndjC6EWNmeH4ZEBA?=
 =?iso-8859-1?Q?wEKvE9pI8bL7MvLN6cxn69yIthzikqmDcmK4GAFkbocQuZRPB40BmD6+CU?=
 =?iso-8859-1?Q?1DQ+XPaz0LFeQgVn7rgLpVMDcFCh9udYPHfIj+ZMGKE4LW8V77fVPUUiFw?=
 =?iso-8859-1?Q?kKTEOOhCwGhRzlC7ahm8UDy9PwGTtXQfhMTj8nlE6F1n6OqXq7prxzn3aX?=
 =?iso-8859-1?Q?Cqwbhvm7/O2PiinrKMThxYPq4NCxI4r2YWO5QfaIz8hpVgQO2cKVEZpnLQ?=
 =?iso-8859-1?Q?7urx9q9MjHYoZjBLU6Ucb//r2ON/YkGwYBChvpUcXOMgMSnXH6GMAPhQ6n?=
 =?iso-8859-1?Q?LE0sHCxYAUHGSAgabWEsiQf5GGoJCqo9sEDrG1oTiypqbknEUJi9dJ7WQM?=
 =?iso-8859-1?Q?FmDGOj6r8DGiM2o0ez0YksqGIrlgQMplGqszs5Wd73zhgT2/Tch1PC8J/V?=
 =?iso-8859-1?Q?ws2oiaK99/2xZJqVXN0vlk9BhY6y5JqwJZyfcQTrkYGLynIr9ju9rDDW9d?=
 =?iso-8859-1?Q?YoXBtZL2VHf4j+t4jg6tJ6pnEeXEt/sstWtSLNQw25ob6k0TuJcUYziGVn?=
 =?iso-8859-1?Q?XqaOJ37htPCBpdcIj16YRWn4Dpg9dgvgQBNVhZUk35QdE37uvU+2ACYN3U?=
 =?iso-8859-1?Q?3W/927qtOVa5stfccAP8hAmJ9oqioKUJxYxNO3pqXPCUwiKOc/l468Sagx?=
 =?iso-8859-1?Q?n0NQvaZfPLYHW4b0Mgybb8JUGl5ePhKCFvTpmcF/J3q3NJiMueFm0s+9vr?=
 =?iso-8859-1?Q?9uzUgDMrC96i0XVQlistAjureqbdCXAcwdyaPTCRmDsbUiCpgiyelNXkYj?=
 =?iso-8859-1?Q?/0U+5FrRnppEZOgF5cuEe04aRVuN3N+p038uBp+Zfpfd4uy6NEiH3IAMn4?=
 =?iso-8859-1?Q?ILCx/QXPcmZ4+dEPtiq/vf6X6ptBnEWUJx/1HjADSA/lP89JEOT7t6f/qC?=
 =?iso-8859-1?Q?Omu+5LoBNZ8/tRglGS2I/7E33eM4/n1700oWjzMZTdJA2NPCA1Edjl5A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab39a34b-468c-44d2-0cf7-08dd130c54b5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 20:03:04.4507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVWuGKhqyMz6gIpgi2EgNWAxGRF3L8O2lGuOSDreLnThZNsLnZwriobnq/twVk4sofzyQ8VkiV2EGGzYz7RHJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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

On Wed, Nov 27, 2024 at 07:58:59PM -0800, Randy Dunlap wrote:
> Fix all typos in xe_vm_doc.h as reported by codespell.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/xe/xe_vm_doc.h |   22 +++++++++++-----------

Although I want to kill the _doc.h files and this file is likely
outdated, let's at least go ahead with fixing the typos...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> --- linux-next-20241125.orig/drivers/gpu/drm/xe/xe_vm_doc.h
> +++ linux-next-20241125/drivers/gpu/drm/xe/xe_vm_doc.h
> @@ -64,8 +64,8 @@
>   *	update page level 2 PDE[1] to page level 3b phys address (GPU)
>   *
>   *	bind BO2 0x1ff000-0x201000
> - *	update page level 3a PTE[511] to BO2 phys addres (GPU)
> - *	update page level 3b PTE[0] to BO2 phys addres + 0x1000 (GPU)
> + *	update page level 3a PTE[511] to BO2 phys address (GPU)
> + *	update page level 3b PTE[0] to BO2 phys address + 0x1000 (GPU)
>   *
>   * GPU bypass
>   * ~~~~~~~~~~
> @@ -192,7 +192,7 @@
>   *
>   * If a VM is in fault mode (TODO: link to fault mode), new bind operations that
>   * create mappings are by default deferred to the page fault handler (first
> - * use). This behavior can be overriden by setting the flag
> + * use). This behavior can be overridden by setting the flag
>   * DRM_XE_VM_BIND_FLAG_IMMEDIATE which indicates to creating the mapping
>   * immediately.
>   *
> @@ -209,7 +209,7 @@
>   *
>   * Since this a core kernel managed memory the kernel can move this memory
>   * whenever it wants. We register an invalidation MMU notifier to alert XE when
> - * a user poiter is about to move. The invalidation notifier needs to block
> + * a user pointer is about to move. The invalidation notifier needs to block
>   * until all pending users (jobs or compute mode engines) of the userptr are
>   * idle to ensure no faults. This done by waiting on all of VM's dma-resv slots.
>   *
> @@ -252,7 +252,7 @@
>   * Rebind worker
>   * -------------
>   *
> - * The rebind worker is very similar to an exec. It is resposible for rebinding
> + * The rebind worker is very similar to an exec. It is responsible for rebinding
>   * evicted BOs or userptrs, waiting on those operations, installing new preempt
>   * fences, and finally resuming executing of engines in the VM.
>   *
> @@ -317,11 +317,11 @@
>   * are not allowed, only long running workloads and ULLS are enabled on a faulting
>   * VM.
>   *
> - * Defered VM binds
> + * Deferred VM binds
>   * ----------------
>   *
>   * By default, on a faulting VM binds just allocate the VMA and the actual
> - * updating of the page tables is defered to the page fault handler. This
> + * updating of the page tables is deferred to the page fault handler. This
>   * behavior can be overridden by setting the flag DRM_XE_VM_BIND_FLAG_IMMEDIATE in
>   * the VM bind which will then do the bind immediately.
>   *
> @@ -500,18 +500,18 @@
>   * Slot waiting
>   * ------------
>   *
> - * 1. The exection of all jobs from kernel ops shall wait on all slots
> + * 1. The execution of all jobs from kernel ops shall wait on all slots
>   * (DMA_RESV_USAGE_PREEMPT_FENCE) of either an external BO or VM (depends on if
>   * kernel op is operating on external or private BO)
>   *
> - * 2. In non-compute mode, the exection of all jobs from rebinds in execs shall
> + * 2. In non-compute mode, the execution of all jobs from rebinds in execs shall
>   * wait on the DMA_RESV_USAGE_KERNEL slot of either an external BO or VM
>   * (depends on if the rebind is operatiing on an external or private BO)
>   *
> - * 3. In non-compute mode, the exection of all jobs from execs shall wait on the
> + * 3. In non-compute mode, the execution of all jobs from execs shall wait on the
>   * last rebind job
>   *
> - * 4. In compute mode, the exection of all jobs from rebinds in the rebind
> + * 4. In compute mode, the execution of all jobs from rebinds in the rebind
>   * worker shall wait on the DMA_RESV_USAGE_KERNEL slot of either an external BO
>   * or VM (depends on if rebind is operating on external or private BO)
>   *
