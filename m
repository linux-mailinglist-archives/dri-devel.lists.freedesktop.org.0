Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10F3B5A049
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 20:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB2C10E3B9;
	Tue, 16 Sep 2025 18:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INDaa6QG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C7A10E004;
 Tue, 16 Sep 2025 18:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758046335; x=1789582335;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XGa2liq5Y6l+f0+c9orBO/MBO8U6UoGGvA46SAiZMTY=;
 b=INDaa6QGpYcD+hpTfe3iTKNTDKIP10eeR1Q17YXkkpzrzn3AwPlvrwG6
 YjK4tCAzRlTB31sSdYh3CaIK8Z0bSeYm5dVjs+LeaX7kaBm4Yr1H4XphW
 kdw+n2CEZvAUScIJC5Pgg9x8jEqx/ybuwr/vL3uLR9Qi85rTGXbV+dalK
 /AHta+dDjRPSgwd0UQea3uWctMXThkQ4lkGVvrjjQeUZNeElYbIkTmQo3
 vRJdqptjcUwFFs2FDFjTFvCiqx6lzaimG1frB8sZ5R5mAjaj1KIcN3Jk5
 SIXTXXnPT/ppcMHVDc3NsdoDyQsmuWXQf8YFU1DeHmjwHMkhxsAFwS3UA g==;
X-CSE-ConnectionGUID: MnKNGEiyQ962LOlPJat7rA==
X-CSE-MsgGUID: mlbamGB1RVe80FDLu+pclg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="85778733"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="85778733"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 11:11:08 -0700
X-CSE-ConnectionGUID: 7Dcm5UJ5Q36rSuR5M8HQmg==
X-CSE-MsgGUID: EnNfFuSqQwKcanMG4XGt/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="179014304"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 11:11:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 11:11:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 11:11:07 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 11:11:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEOjkPKdURG0o+MkKAW3OChkw7V0B46AghmH4KPxZKYjlYRLGW3jyQ6Xi+axclquH3tjYv89A2OBI2uAh8mXkayEN4OXXAaGZQrZrtC8DXcymhRILT/ond6RMhCycoJYUC1hmvcw14qFSsnp/nNrEc9G8ohMYgmQ1MMIF6FoP93A6NcXFStYdM8sC/Vex+RtIm9y4FwJaYwH90ticnjmiBVblgT9oPemYu4j852c44T7jCFMIzeoxZ+wQbxD1DavR/Wb3Lp1X8RrjJziL/eEdZa0pycAW3sYQcuZlkbb7jKVH3ymBkuNBAY2WCGX+0wuv1RsqiQS9wespUTb/m4f/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2VfjTHQRYe3K5a0jZ54azN1QrPxNIpmhgwBm9PReeg=;
 b=UlzIPN/YfJhEDYUp0mRhfH3BJuCTFFGn6HruUqIFDG8QhoLL+IQoLf5MEd/66YFBGjUaI9X+KvK61Tx3uH0TErQRvxClePYfxTtm9ErD9s17WlOUNW0i5kheTjvXRELTMg5d9EVMmEAVrF79KORwltSZEUrDzBeM5IxEBVwKuSAClUjESEx6p+x/jvC/8tzRbg7SgTkbiRFlGMQrsyGg+dFspjC8FZzsmmYsvj5ZjjrTgTltZP51epl+l4oZI0iSRYA3LWhgzuqdkvMnDFkHybOA+uK7jL9x3qOzNgTQRuVs7HA1W/08F4l548N4y8ECr1vwV/p1reES5CVtm/6MTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 18:11:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 18:11:05 +0000
Date: Tue, 16 Sep 2025 13:11:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Christian
 =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "=?utf-8?Q?Micha=C5=82?=
 Winiarski" <michal.winiarski@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>, David Airlie
 <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Michael J . Ruhl" <mjruhl@habana.ai>, LKML <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 00/11] PCI: Resizable BAR improvements
Message-ID: <fl6tx5ztvttg7txmz2ps7oyd745wg3lwcp3h7esmvnyg26n44y@owo2ojiu2mov>
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
 <wqukxnxni2dbpdhri3cbvlrzsefgdanesgskzmxi5sauvsirsl@xor663jw2cdw>
 <fafda2a3-fc63-ce97-d22b-803f771a4d19@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fafda2a3-fc63-ce97-d22b-803f771a4d19@linux.intel.com>
X-ClientProxiedBy: BY3PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:217::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e169cf-dc28-406a-1d72-08ddf54c66c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JK0cUBX8q/Ji3lV5gCj1gzTi/Npj4f9a57ylCdr11HtQuDNd/1qFt21yC1?=
 =?iso-8859-1?Q?5Gs7ZqxCAbLqjk6tNXE1H2UNXzPaKarlnSPku/iL427LZEdOuPvXaZu7uA?=
 =?iso-8859-1?Q?8NZVqszFrAijk1ekNxpFwWNfxv7ZccijL24cce8rVcxKtX7Qj7JcfaiT+U?=
 =?iso-8859-1?Q?ok+iww6LV8TjxpblumKzlhQXs/iIrLVg7NItpWyrtjLh3MwH40Lg3EA76W?=
 =?iso-8859-1?Q?/hMUhr2Amu0fx4WI4KZ8eg6K+kHg+YvUz/KIZirbS8EziGgLl6CnYuGZKa?=
 =?iso-8859-1?Q?MJKhei4nnARkHjX6EAfDureSw2iyAZyM8YdGcLRuICU8pyt2rlZJdtYLQl?=
 =?iso-8859-1?Q?st5qu3HgFgxMDZ9XHZi8M+zXJYULjBtmSyjsXV5u/SzxMcivmR6mC+RAYE?=
 =?iso-8859-1?Q?XZzvBctXd8TW3TJdkV9d0JA9elIgwcHK84WDeTFFY97sPA3QdX6WgBxGJ+?=
 =?iso-8859-1?Q?aJAhiS5FYVnkYmRFjfN82IX4nwAM75wWnUmQxFY/dj8417uAODRCRu6fct?=
 =?iso-8859-1?Q?GS/rnC0kJjETvxjyGY5Q2l2d25A9ijHgRm5j6t/3JG1Hs5f1UpuRc8ma9G?=
 =?iso-8859-1?Q?7PUNtGY34zR1NQeZOlSxWOgWUgLkSXh9loNIvTNbBMdQz5dZgVBooqGvq3?=
 =?iso-8859-1?Q?N+5MGYQ1b/mHYK01MxSlfVa4C8coWAJsE4ZDSlg+ofFbSrqKVa+SMo42cS?=
 =?iso-8859-1?Q?BCw2wpjAKXEE5yF8bC/eapVAmZPzpASpn+qdrShuego6du3W/Lcjp17gd6?=
 =?iso-8859-1?Q?VAK3s+2FHf3KfyvQ3G7MJI1kokTWIMrEXtHV9gZ3XY+zDLZXfKAZiQen/q?=
 =?iso-8859-1?Q?+bFD4XUMvGRIsjdnp1ptksLDoDlodIAwyJsH1dDGfOb22+xaBxoJvNkghq?=
 =?iso-8859-1?Q?V/tz9P+BjCMje4ZSJRX4Hz95n8jZo6FTCtnrwA5PZOt4eZ9qUjavTEJARb?=
 =?iso-8859-1?Q?gpskN8aSGCKNBVxfhAfjRfpRaVJxlMHTZVAKD1AjqwyRGya1M7Z+HCSKdP?=
 =?iso-8859-1?Q?ySzJRn1EBQ7B4mfPL9mmmi0gEKRjGcGFLgpSU+LYNe+MEFS0ok/qE5D2jt?=
 =?iso-8859-1?Q?bMZ4teUx6NyLPCwEOPdzsIwM6fl5VdX13SrKHxl9rzBQvZ4QvXmxbgeP5N?=
 =?iso-8859-1?Q?TKagW4bhtJ/7fnQPgjhpBepiUPAFCEcP5bf8WcjWWM2fPwr6uW3skeldvv?=
 =?iso-8859-1?Q?HdJaoEaumt9aaloNQUHTbeJ+d4QFw+gPIo7g7GEPvEBvq5JPwmwPXMMUiz?=
 =?iso-8859-1?Q?+sjnOwOSlY8F6PU3UmUfORKd5/KSW4yFGcJdBjZDjilBWu1RWQxrDPV0rL?=
 =?iso-8859-1?Q?skwdtDQ9thEyBbYrACnD0i4Wn6vXLvx0YwbDvH1uHCf+OHgWjOvYzdd/h8?=
 =?iso-8859-1?Q?pjF3q9et7ugYjnHISjnacLVLhr/jMQcTff4EkL2ppkYpMdYGJJgYhGqgZQ?=
 =?iso-8859-1?Q?lLvIxcP2yAQj8SxrIG7lZepHVWtVRMFPCmnYzu2AVA4JFLHNDQqO9TmVmH?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0+5YanCVN5RZwX4mcOxqIYkvAl4GxQe6kIvQBxSa+GeJO6mngsllHMgoDx?=
 =?iso-8859-1?Q?Cc+x0F/FMTBNS1Qn5wFKwoo4cszX4iz5TpSmi6IxEqlotW+X9dsXQ7dam0?=
 =?iso-8859-1?Q?3Kr7I9vQrGAEllJ0fm9xYvG6R/mIAlrAVX6ZPdes4RoaOi4jey1cAvN59v?=
 =?iso-8859-1?Q?6z2V2cPzf6+hP5gpJPollfhCtZE+mGCyRhB4JZJe7Oy6xzDHcuMkhZ52hC?=
 =?iso-8859-1?Q?p9g2VBtdkfgMWnjbBkSPPfKOHqOoz8pHPWeuflVNnHTCJZcDKbGUCCkKwH?=
 =?iso-8859-1?Q?g6c2CIQUwuKnpTboEI8HczyzIG1Ou2e03SDIXg2U7ZnChzrs12/QYdgliC?=
 =?iso-8859-1?Q?CzIPqe58PRYSP+hcRBPENNouZsa78XaOF66zPe0CmtcseBI/JLye5JfF4F?=
 =?iso-8859-1?Q?s0v9nqFNqiQ5RfEEhw6VJK+bSp+tn45OS8+P/Y4NT3Hl5gFykINqm7dXfW?=
 =?iso-8859-1?Q?GPVgBoc+mT6dIE8FzEbv1UEqr8WXxH1oyp/Zs+Ahd93djhUgsSYhEb/FP8?=
 =?iso-8859-1?Q?mk1EvRpS8sDFQSFGlYcQJThUKOuL+APW8pu0GzjOrBdTVvWMRSypyfJ4+6?=
 =?iso-8859-1?Q?uvIl1KC//VlqWdlKKNdhmI0sJ8xz7A+qGCgiUJOOQahQd86MuG0UDbhZkR?=
 =?iso-8859-1?Q?Wel0cIurWIFyG5/L52SV/WQq6KeSdlgCkvsXkhfVbNQPjJGl+b1e35TVpt?=
 =?iso-8859-1?Q?HpSBYtH2uhgsNyVvaDCxjO1cN7yCHcyT/UZrbDek/7w8xlRSTAMyMkKHLu?=
 =?iso-8859-1?Q?I0VKBeUK+P4t13I4w/1BXhuHgtPFTsYLLKa3RCXrVF3cqfNSbBq/DFFe7a?=
 =?iso-8859-1?Q?V5Cimkl4NFyQr898Kv70vth8dvAGlAD3LYo/bfufiI5kNjSRsIOn2lS1wX?=
 =?iso-8859-1?Q?s01dPjoolFP4PJI5xlnEPF6Oj4+6OITJ9q+9BFLGXI/8Vncyyo5/OhOnms?=
 =?iso-8859-1?Q?vlqwc5WrnnClWScEHkOklkAOMx9+82/YRTUUNKt0oxPV71Uhh6fkdHNuk6?=
 =?iso-8859-1?Q?o8l+DKznpn026jSBPQXlL6iZ9XnTTO5ASanB4efd0DmmD33p7j9Co0NAzO?=
 =?iso-8859-1?Q?qqbkQV8utCFk1gE39zf4AwPzlbElvKWl1slMfHH9QtQ/KH8OEFGPbFMJGn?=
 =?iso-8859-1?Q?Fhmm4w59VUvOWZXTDtmMVfqBWbrJtBPMJ6GJPXxpcCyHPfKjQ13bCqN88n?=
 =?iso-8859-1?Q?BgrxLDB9vxol+949OVTf7vtbC3kwcRo7pDC57/yTsHGlY0RGTUQGXMGNxQ?=
 =?iso-8859-1?Q?SVuAqPNQSSbolV+8PW32ecSytMOpS48vSz8wzoUAVxWPsVRgIPo6GI2yRm?=
 =?iso-8859-1?Q?hLDpmZqWBsjbgdNeFZVYBwpTTjXNy+VEPnS+izMErcs2ibhZxs75lTGiYr?=
 =?iso-8859-1?Q?VSIH91vtxX6cXnB358kdRG+OPGYXXrGdUP4E4iBYrmEF+ayVbJGnUFP+8X?=
 =?iso-8859-1?Q?3QK5mxwnI38Y/FkUAXrEVjX1ytBAWCAxqpqs4V5lmiUE8aJUpYcvyUFoVa?=
 =?iso-8859-1?Q?pSOJrO/rS7sBq52JuoOX6XT0ZYp6ZeLAj3hsrodN2Q+CbzBhdYXefa/hU5?=
 =?iso-8859-1?Q?KZjfOXme1VJ6J9tG8YuGvkiL1WvXiuMWoS5i88Gst1vr3kdQyQS5t2S7P+?=
 =?iso-8859-1?Q?34qy2wfHQximtzR61zIpVkONmzmAoPTZ9AfUhCZdW7HFa4PTtyCfdKTw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e169cf-dc28-406a-1d72-08ddf54c66c4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 18:11:04.9835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJoPfVAcBMtlV/D/i5ITeUm2ctJZXAFCGlO5B7G634aX2KwZWgOAJvi7r/9aSky0NsHjK0UHnJe0TZm+Qt4umtvI6c41jAdT7mD+uIe5444=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
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

On Mon, Sep 15, 2025 at 08:24:06PM +0300, Ilpo Järvinen wrote:
>On Mon, 15 Sep 2025, Lucas De Marchi wrote:
>
>> On Mon, Sep 15, 2025 at 12:13:47PM +0300, Ilpo Järvinen wrote:
>> > pci.c has been used as catch everything that doesn't fits elsewhere
>> > within PCI core and thus resizable BAR code has been placed there as
>> > well. Move Resizable BAR related code to a newly introduced rebar.c to
>> > reduce size of pci.c. After move, there are no pci_rebar_*() calls from
>> > pci.c indicating this is indeed well-defined subset of PCI core.
>> >
>> > Endpoint drivers perform Resizable BAR related operations which could
>> > well be performed by PCI core to simplify driver-side code. This
>> > series adds a few new API functions to that effect and converts the
>> > drivers to use the new APIs (in separate patches).
>> >
>> > While at it, also convert BAR sizes bitmask to u64 as PCIe spec already
>> > specifies more sizes than what will fit u32 to make the API typing more
>> > future-proof. The extra sizes beyond 128TB are not added at this point.
>> >
>> > These are based on pci/main plus a simple "adapter" patch to add the
>> > include for xe_vram_types.h that was added by a commit in drm-tip.
>> > Hopefully that is enough to avoid the within context conflict with
>> > BAR_SIZE_SHIFT removal to let the xe CI tests to be run for this
>> > series.
>> >
>> > There are two minor conflicts with the work in pci/resource but I'm
>> > hesitant to base this on top of it as this is otherwise entirely
>> > independent (and would likely prevent GPU CI tests as well). If we end
>> > up having to pull the bridge window select changes, there should be no
>> > reason why this does have to become collateral damage (so my
>> > suggestion, if this is good to go in this cycle, to take this into a
>> > separate branch than pci/resource and deal with those small conflicts
>> > while merging into pci/next).
>> >
>> > I've tested sysfs resize, i915, and xe BAR resizing functionality. In
>> > the case of xe, I did small hack patch as its resize is anyway broken
>> > as is because BAR0 pins the bridge window so resizing BAR2 fails. My
>> > hack caused other problems further down the road (likely because BAR0
>> > is in use by the driver so releasing it messed assumptions xe driver
>> > has) but the BAR resize itself was working which was all I was
>>
>> is the hack you mention here to release all BARs before attempting the
>> resize?
>
>Yes, the patch added release of BAR0 prior to resize. The existing xe code
>in _resize_bar() already releases BAR2.
>
>During resize, if the first loop in pbus_reassign_bridge_resources()
>(called from pci_resize_resource()) finds the bridge window closest to the
>endpoint still has a child, it results in having empty saved list because
>all upstream bridge windows will then have a child as well.
>
>Empty saved list is checked after the loop and
>pbus_reassign_bridge_resources() returns -ENOENT without even trying to
>assign the resources. The error is returned even if the actual bridge
>window size is large enough to fit the resized resource.
>
>The logic in pci_resize_resource() and pbus_reassign_bridge_resources()
>need some other improvements besides that problem, but I likely won't
>have time to look at that until completing the fitting algorithm changes.
>I'd actually want to add pci_release_and_resize_resource() which would
>take care of releasing all the resources of the device (obviously driver
>must have its hands off all those BARs when it calls that function). With
>the current pci_resize_resource() API, handling the restore of BARs in
>case of failure is not as robust as I'd like to make it.
>
>> > interested to know. I'm not planning to pursue fixing the pinning
>> > problem within xe driver because the core changes to consider maximum
>> > size of the resizable BARs should take care of the main problem by
>> > different means.
>>
>> I'd actually like to pursue that myself as that could be propagated to
>> stable since we do have some resize errors in xe with BMG that I wasn't
>> understanding. It's likely due to xe_mmio_probe_early() taking a hold of
>> BAR0 and not expecting it to be moved. We could either remap if we have
>> have to resize or just move the resize logic early on.
>
>Great. If you have any questions when it comes to the PCI core side code,
>please let me know.

I moved the resize to happen before anything else in xe. However when
testing I noticed a scenario failing without involving the driver.
With and without this series I still have the same pass/failure
scenarios:

Tests executed with a BMG. Just after boot, BAR2 is 16GB.

1) If I resize it via sysfs to 8GB and then load the driver, it resizes
it back. Resize from sysfs works too. No change in behavior.

2) If I do "remove the bridge via sysfs and rescan the bus"[1], it fails to
resize (either automatically, on rescan, via sysfs, or loading the xe
driver). It just stays at 256M. The only thing that brings it back is a
reboot. /proc/iomem shows this:

4000000000-7fffffffff : PCI Bus 0000:00
   4000000000-44007fffff : PCI Bus 0000:01
     4000000000-4017ffffff : PCI Bus 0000:02
       4000000000-400fffffff : PCI Bus 0000:03    <<<< BMG
         4000000000-400fffffff : 0000:03:00.0
       4010000000-40100fffff : PCI Bus 0000:04
     4018000000-40187fffff : 0000:01:00.0


And dmesg shows this for the rescan:

[ 1673.189737] pci 0000:01:00.0: [8086:e2ff] type 01 class 0x060400 PCIe Switch Upstream Port
[ 1673.189794] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x007fffff 64bit pref]
[ 1673.189808] pci 0000:01:00.0: PCI bridge to [bus 00]
[ 1673.189824] pci 0000:01:00.0:   bridge window [io  0x0000-0x0fff]
[ 1673.189834] pci 0000:01:00.0:   bridge window [mem 0x00000000-0x000fffff]
[ 1673.189856] pci 0000:01:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[ 1673.189878] pci 0000:01:00.0: Max Payload Size set to 256 (was 128, max 256)
[ 1673.190164] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[ 1673.193531] pci 0000:01:00.0: Adding to iommu group 16
[ 1673.196997] pcieport 0000:00:01.0: ASPM: current common clock configuration is inconsistent, reconfiguring
[ 1673.197061] pci 0000:01:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[ 1673.197421] pci 0000:02:01.0: [8086:e2f0] type 01 class 0x060400 PCIe Switch Downstream Port
[ 1673.197452] pci 0000:02:01.0: PCI bridge to [bus 00]
[ 1673.197463] pci 0000:02:01.0:   bridge window [io  0x0000-0x0fff]
[ 1673.197468] pci 0000:02:01.0:   bridge window [mem 0x00000000-0x000fffff]
[ 1673.197482] pci 0000:02:01.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[ 1673.197497] pci 0000:02:01.0: Max Payload Size set to 256 (was 128, max 256)
[ 1673.197503] pci 0000:02:01.0: enabling Extended Tags
[ 1673.197660] pci 0000:02:01.0: PME# supported from D0 D3hot D3cold
[ 1673.198411] pci 0000:02:01.0: Adding to iommu group 17
[ 1673.200258] pci 0000:02:02.0: [8086:e2f1] type 01 class 0x060400 PCIe Switch Downstream Port
[ 1673.200289] pci 0000:02:02.0: PCI bridge to [bus 00]
[ 1673.200299] pci 0000:02:02.0:   bridge window [io  0x0000-0x0fff]
[ 1673.200304] pci 0000:02:02.0:   bridge window [mem 0x00000000-0x000fffff]
[ 1673.200317] pci 0000:02:02.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[ 1673.200333] pci 0000:02:02.0: Max Payload Size set to 256 (was 128, max 256)
[ 1673.200337] pci 0000:02:02.0: enabling Extended Tags
[ 1673.200470] pci 0000:02:02.0: PME# supported from D0 D3hot D3cold
[ 1673.201059] pci 0000:02:02.0: Adding to iommu group 18
[ 1673.202761] pci 0000:01:00.0: PCI bridge to [bus 02-04]
[ 1673.202774] pci 0000:02:01.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[ 1673.202782] pci 0000:02:02.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[ 1673.203024] pci 0000:03:00.0: [8086:e221] type 00 class 0x030000 PCIe Endpoint
[ 1673.203060] pci 0000:03:00.0: BAR 0 [mem 0x00000000-0x00ffffff 64bit]
[ 1673.203064] pci 0000:03:00.0: BAR 2 [mem 0x00000000-0x0fffffff 64bit pref]
[ 1673.203069] pci 0000:03:00.0: ROM [mem 0x00000000-0x001fffff pref]
[ 1673.203077] pci 0000:03:00.0: Max Payload Size set to 256 (was 128, max 256)
[ 1673.203209] pci 0000:03:00.0: PME# supported from D0 D3hot
[ 1673.203770] pci 0000:03:00.0: Adding to iommu group 19
[ 1673.205451] pci 0000:03:00.0: vgaarb: setting as boot VGA device
[ 1673.205454] pci 0000:03:00.0: vgaarb: bridge control possible
[ 1673.205455] pci 0000:03:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[ 1673.205534] pci 0000:02:01.0: PCI bridge to [bus 03-04]
[ 1673.205543] pci_bus 0000:03: busn_res: [bus 03-04] end is updated to 03
[ 1673.205787] pci 0000:04:00.0: [8086:e2f7] type 00 class 0x040300 PCIe Endpoint
[ 1673.205848] pci 0000:04:00.0: BAR 0 [mem 0x00000000-0x00003fff 64bit]
[ 1673.205867] pci 0000:04:00.0: Max Payload Size set to 256 (was 128, max 256)
[ 1673.205872] pci 0000:04:00.0: enabling Extended Tags
[ 1673.206012] pci 0000:04:00.0: PME# supported from D3hot D3cold
[ 1673.206528] pci 0000:04:00.0: Adding to iommu group 20
[ 1673.208271] pci 0000:02:02.0: PCI bridge to [bus 04]
[ 1673.208284] pci_bus 0000:04: busn_res: [bus 04] end is updated to 04
[ 1673.208291] pci_bus 0000:02: busn_res: [bus 02-04] end is updated to 04
[ 1673.232003] pcieport 0000:00:01.0: Assigned bridge window [mem 0x83000000-0x840fffff] to [bus 01-04] cannot fit 0x2000000 required for 0000:02:01.0 bridging to [bus 03]
[ 1673.232009] pci 0000:02:01.0: bridge window [mem 0x00000000-0x000fffff] to [bus 03] requires relaxed alignment rules
[ 1673.232016] pci 0000:02:01.0: bridge window [mem 0x01000000-0x01ffffff] to [bus 03] add_size 200000 add_align 1000000
[ 1673.232020] pcieport 0000:00:01.0: Assigned bridge window [mem 0x83000000-0x840fffff] to [bus 01-04] cannot fit 0x1800000 required for 0000:01:00.0 bridging to [bus 02-04]
[ 1673.232025] pci 0000:01:00.0: bridge window [mem 0x00000000-0x000fffff] to [bus 02-04] requires relaxed alignment rules
[ 1673.232027] pcieport 0000:00:01.0: Assigned bridge window [mem 0x83000000-0x840fffff] to [bus 01-04] cannot fit 0x2000000 required for 0000:01:00.0 bridging to [bus 02-04]
[ 1673.232031] pci 0000:01:00.0: bridge window [mem 0x00000000-0x000fffff] to [bus 02-04] requires relaxed alignment rules
[ 1673.232036] pci 0000:01:00.0: bridge window [mem 0x01000000-0x020fffff] to [bus 02-04] add_size 200000 add_align 1000000
[ 1673.232077] pci 0000:01:00.0: bridge window [mem 0x4000000000-0x4017ffffff 64bit pref]: assigned
[ 1673.232080] pci 0000:01:00.0: bridge window [mem size 0x01300000]: can't assign; no space
[ 1673.232082] pci 0000:01:00.0: bridge window [mem size 0x01300000]: failed to assign
[ 1673.232090] pci 0000:01:00.0: BAR 0 [mem 0x4018000000-0x40187fffff 64bit pref]: assigned
[ 1673.232103] pci 0000:01:00.0: bridge window [io  0x8000-0x9fff]: assigned
[ 1673.232129] pci 0000:01:00.0: bridge window [mem 0x83000000-0x840fffff]: assigned
[ 1673.232131] pci 0000:01:00.0: bridge window [mem 0x83000000-0x840fffff]: failed to expand by 0x200000
[ 1673.232136] pci 0000:01:00.0: bridge window [mem 0x83000000-0x840fffff]: failed to add optional 200000
[ 1673.232192] pci 0000:02:01.0: bridge window [mem 0x4000000000-0x400fffffff 64bit pref]: assigned
[ 1673.232196] pci 0000:02:01.0: bridge window [mem 0x83000000-0x83ffffff]: assigned
[ 1673.232200] pci 0000:02:02.0: bridge window [mem 0x84000000-0x840fffff]: assigned
[ 1673.232202] pci 0000:02:02.0: bridge window [mem 0x4010000000-0x40100fffff 64bit pref]: assigned
[ 1673.232204] pci 0000:02:01.0: bridge window [io  0x8000-0x8fff]: assigned
[ 1673.232206] pci 0000:02:02.0: bridge window [io  0x9000-0x9fff]: assigned
[ 1673.232241] pci 0000:03:00.0: BAR 2 [mem 0x4000000000-0x400fffffff 64bit pref]: assigned
[ 1673.232250] pci 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: assigned
[ 1673.232259] pci 0000:03:00.0: ROM [mem size 0x00200000 pref]: can't assign; no space
[ 1673.232261] pci 0000:03:00.0: ROM [mem size 0x00200000 pref]: failed to assign
[ 1673.232272] pci 0000:03:00.0: BAR 2 [mem 0x4000000000-0x400fffffff 64bit pref]: assigned
[ 1673.232280] pci 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: assigned
[ 1673.232289] pci 0000:03:00.0: ROM [mem size 0x00200000 pref]: can't assign; no space
[ 1673.232291] pci 0000:03:00.0: ROM [mem size 0x00200000 pref]: failed to assign
[ 1673.232302] pci 0000:02:01.0: PCI bridge to [bus 03]
[ 1673.232304] pci 0000:02:01.0:   bridge window [io  0x8000-0x8fff]
[ 1673.232309] pci 0000:02:01.0:   bridge window [mem 0x83000000-0x83ffffff]
[ 1673.232313] pci 0000:02:01.0:   bridge window [mem 0x4000000000-0x400fffffff 64bit pref]
[ 1673.232321] pci 0000:04:00.0: BAR 0 [mem 0x84000000-0x84003fff 64bit]: assigned
[ 1673.232336] pci 0000:02:02.0: PCI bridge to [bus 04]
[ 1673.232339] pci 0000:02:02.0:   bridge window [io  0x9000-0x9fff]
[ 1673.232345] pci 0000:02:02.0:   bridge window [mem 0x84000000-0x840fffff]
[ 1673.232349] pci 0000:02:02.0:   bridge window [mem 0x4010000000-0x40100fffff 64bit pref]
[ 1673.232356] pci 0000:01:00.0: PCI bridge to [bus 02-04]
[ 1673.232359] pci 0000:01:00.0:   bridge window [io  0x8000-0x9fff]
[ 1673.232363] pci 0000:01:00.0:   bridge window [mem 0x83000000-0x840fffff]
[ 1673.232366] pci 0000:01:00.0:   bridge window [mem 0x4000000000-0x4017ffffff 64bit pref]
[ 1673.232471] pcieport 0000:01:00.0: enabling device (0000 -> 0003)
[ 1673.233508] pcieport 0000:02:01.0: enabling device (0000 -> 0003)
[ 1673.233692] pcieport 0000:02:02.0: enabling device (0000 -> 0003)

# echo 9 > /sys/bus/pci/devices/0000\:03\:00.0/resource2_resize 
-bash: echo: write error: No space left on device


[1] # echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/remove
     # echo 0 > /sys/bus/pci/drivers_autoprobe
     # echo 1 > /sys/bus/pci/rescan


I can share the xe patch so you check if it at least fixes it in your
test scenario.

thanks
Lucas De Marchi

>
>-- 
> i.
>
>> > Some parts of this are to be used by the resizable BAR changes into the
>> > resource fitting/assingment logic but these seem to stand on their own
>> > so sending these out now to reduce the size of the other patch series.
>> >
>> > v2:
>> > - Kerneldoc:
>> >  - Improve formatting of errno returns
>> >  - Open "ctrl" -> "control"
>> >  - Removed mislead "bit" words (when referring to BAR size)
>> >  - Rewrote pci_rebar_get_possible_sizes() kernel doc to not claim the
>> >    returned bitmask is defined in PCIe spec as the capability bits now
>> >    span across two registers in the spec and are not continuous (we
>> >    don't support the second block of bits yet, but this API is expected
>> >    to return the bits without the hole so it will not be matching with
>> >    the spec layout).
>> > - Dropped superfluous zero check from pci_rebar_size_supported()
>> > - Small improvement to changelog of patch 7
>> >
>> > Ilpo Järvinen (11):
>> >  PCI: Move Resizable BAR code into rebar.c
>> >  PCI: Cleanup pci_rebar_bytes_to_size() and move into rebar.c
>> >  PCI: Move pci_rebar_size_to_bytes() and export it
>> >  PCI: Improve Resizable BAR functions kernel doc
>> >  PCI: Add pci_rebar_size_supported() helper
>> >  drm/i915/gt: Use pci_rebar_size_supported()
>> >  drm/xe/vram: Use PCI rebar helpers in resize_vram_bar()
>> >  PCI: Add pci_rebar_get_max_size()
>> >  drm/xe/vram: Use pci_rebar_get_max_size()
>> >  drm/amdgpu: Use pci_rebar_get_max_size()
>> >  PCI: Convert BAR sizes bitmasks to u64
>> >
>> > Documentation/driver-api/pci/pci.rst        |   3 +
>> > drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |   8 +-
>> > drivers/gpu/drm/i915/gt/intel_region_lmem.c |  10 +-
>> > drivers/gpu/drm/xe/xe_vram.c                |  32 +-
>> > drivers/pci/Makefile                        |   2 +-
>> > drivers/pci/iov.c                           |   9 +-
>> > drivers/pci/pci-sysfs.c                     |   2 +-
>> > drivers/pci/pci.c                           | 145 ---------
>> > drivers/pci/pci.h                           |   5 +-
>> > drivers/pci/rebar.c                         | 314 ++++++++++++++++++++
>> > drivers/pci/setup-res.c                     |  78 -----
>> > include/linux/pci.h                         |  15 +-
>> > 12 files changed, 350 insertions(+), 273 deletions(-)
>> > create mode 100644 drivers/pci/rebar.c
>> >
>> >
>> > base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
>> > prerequisite-patch-id: 35bd3cd7a60ff7d887450a7fdde73b055a76ae24
>> > --
>> > 2.39.5
>> >
>>

