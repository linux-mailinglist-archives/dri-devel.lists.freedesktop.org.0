Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E41AB8A30
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 17:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A28C10E8F7;
	Thu, 15 May 2025 15:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apUTeQdG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8530A10E8D7;
 Thu, 15 May 2025 15:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747321460; x=1778857460;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=4ysstF+WjV2RDgOynFr6MoQKBS2riujpY6VKDWlphjo=;
 b=apUTeQdG4qIjLbYx0Xa+qyEI7zHjyl1S0d0tCPJKHpp7UemG05twONRZ
 I21/x4LCRW5YcXBOfFGb4PXDrp8seThcJ76vN7+auDSNvK+tnbvgWECGV
 f6UbCfmvF6AGyAe1EhMZKXtNP1gZ2swkQC5O0xdHCoJhVmiSBtABocoxj
 ddYpJ4fx8o7yH5O2+GoRYAw1bgCIkcUYfVu5MNmFkUmc/arA5jv2Flrqm
 VMZfl64Opc6Zk2q3BY6hyu4kIDlmt8/PBybKnr5qZzKFkG2RtZpcuJorL
 L4Qg0XFoMwiPxu1vmWplUH/lRZ3etKs7D25PEEq2fJUp76E/IeMll93E2 Q==;
X-CSE-ConnectionGUID: 4+4gOAiCRPKI9oAeF5u16A==
X-CSE-MsgGUID: BtVcMI0xTniRiFJcEyhR9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49195641"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="49195641"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 08:04:20 -0700
X-CSE-ConnectionGUID: ltiKPpRDTYu22WNJlh90bQ==
X-CSE-MsgGUID: gdgrd6XSR8KzOkta1To7FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="143619619"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 08:04:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 08:04:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 08:04:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 08:04:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1v6dbqLoNN7pUH0v6XmvVl2D/55AwbEIF+q+Dj9EGkjyFl0+rjD3lZVN0WAVkGOd0SOwQUBFOdgdoV3rDmphkcqoC/lmcOG0HeOjx0nN9JS6hP9tv7B1IBf7TMTHGAzyXpsLcwneip1HhAqxQjYq4J73k7SSdhe0PMvXIXVx3sZpae7636YWUbtOYcZwqrFzwLar5qc4UXLGsiScVAeqgO7MMpm9BuT5FwOQf2RjEZu0m4B0SKgsY8WStfm/onOyBb0LZX8MzNYrZGaP3JopVLC0yjeEr5zPOtPc6C6jfWSS7iazptgohZW0lHCiwoMoWGx8w4bO2JsbQ2GMQqFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ui7GxnVrqvPLdeOKCL7RrBaUZkQmZG++G0XAT2nPXmg=;
 b=GL7lg4g4enwGPWpKblCRSXJSd90FerWENAtM/OrQPLPkcw+h0YChVYTqZFws+i+HOBwvN8wKSNGF4gD8Lhih9GzhnWx7On1d4giJGDd7x/vZXgw6Avq3wImUUpRcqUNHGkS/34+qMA0FAb8Rdl/ADVym+TrjcbKgO3H9kQE2iOe6DmOcp7Gq+u+9NlXIJExyGG88hFR44RcwmLC9RSfgoyNWh3NdnkyTK/eOY73ZoBZfJYvGODQCyfXhviudjtY6rVh3+rGHm6w5PDartTkAWF+moztSte9DcmfifqMJNqY4QyMW7lWOLh8yhPcF6ipQlheV4GhV5w4XoSbffr4COw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS4PPF2AD6B04BA.namprd11.prod.outlook.com (2603:10b6:f:fc02::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 15:04:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Thu, 15 May 2025
 15:04:11 +0000
Date: Thu, 15 May 2025 10:04:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <qil4scyn6ucnt43u5ju64bi7r7n5r36k4pz5rsh2maz7isle6g@lac3jpsjrrvs>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0101.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS4PPF2AD6B04BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 378267a3-e03d-4759-af72-08dd93c1bfaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Gh8rR7i2IB3Rzz7BDBhz6NsQBG7h5NfuM9tR45k6Pme1RX39mWVO62ApCi?=
 =?iso-8859-1?Q?SDEu0hl9pSScxlUx0ClQ7jySegXslUeFCVqESEogCcEhpCVDhM0yORq+zI?=
 =?iso-8859-1?Q?ifoaIWd51F+xUXBLnwQYFOM0L3tLaPu/vV0kuYLtdHtIzQJKpcAvGbFJdh?=
 =?iso-8859-1?Q?NmPGKnDrhF0u+9X95e8bRcIC49lVVe3PbvSs3liLh/3Owus4dMM+RM0DwK?=
 =?iso-8859-1?Q?ghBha++Gk9s24zSDxjoq23FsNzKNI7IPNBu6jKKeDCShKFpDwbLPQfOCZE?=
 =?iso-8859-1?Q?sMXiaQ3GR4KeQPrCFKhpDk3wyVMs0ZlINwZDhlD+Yect67OYRQv+r9Lujf?=
 =?iso-8859-1?Q?wtc8wmb15SqKiz8SogC7vsLbyhcf5HgA2NM8rn2Pd+HsgYtwbOjRLaMJgP?=
 =?iso-8859-1?Q?89Ci2uwGvNqtXP/S082X4RTAa35BBBAGquJxWYbGqEOIJXgQ3ZfKcQk1JL?=
 =?iso-8859-1?Q?KAFx3T78m+gqP7AWYNhalq9EdqYD0toWJ02aMX/PQn7UlIYTAb1mAyveD0?=
 =?iso-8859-1?Q?TXKAWvUbKyGW1iAW5lefwjjCCODrj4151Elz+WMYPlxiiMPa+LwB0nirGG?=
 =?iso-8859-1?Q?qULS4XcOKstjggBubwTMADMTTFCFis5uxT+KN9YFhlcooLlGfOyyNp4XsR?=
 =?iso-8859-1?Q?ZIfJZSl9H6kUkzm53wfPAkepfPNklTsnM6S67ytnlbYg62sj24ShLgieRP?=
 =?iso-8859-1?Q?9XEirGdFDjtt/UcuX1b2lL7SdDXlm0r6aVtdsCbJEELcxz6ib4RUWypSXT?=
 =?iso-8859-1?Q?kaGJ/rPyI8Cke4L39RZ8n1lOMKAsBcjon1STDdaCVS62BFcn3NQ0Q3Jb/I?=
 =?iso-8859-1?Q?FOeNAFJyb/rOSmhq02avTFV8Jgwo6v2jb5Nw54sF8XQAVQAHwPCpWq+Yu5?=
 =?iso-8859-1?Q?0s4CwZpY8wtbf1REgkkQfCyzlirCVti0b5o2ZYyNAE6nEAfvbvysodl4AS?=
 =?iso-8859-1?Q?iQaSgXxk1pc9ZPvV5Ze/A/xl+xs33dpJUE8DHmT3Tr/0J5QetHN5QNKPnq?=
 =?iso-8859-1?Q?T7e50UVUH2rNTbzN7fJevs6wt8qCHHMRSazqEW4965N0fWI5qA7UyZ3pd/?=
 =?iso-8859-1?Q?0RS72pTT1cCZIuKB4Le3uzbEmAJRqj2N8KdJCpHS/u8hdF1q4zJME5Rn0a?=
 =?iso-8859-1?Q?nozjG+9VBorGY1OocdY1oW5lsgvYfmbtu0dCLj417E6RCHgn+gTVcA6fxj?=
 =?iso-8859-1?Q?KbvJIW+COeEWm4naA/Gau46ihWh5wngezR0j2L+ag3/zT8kZs/vK4Siyl9?=
 =?iso-8859-1?Q?5vZ7/2I6CMftuRspLj6p42LfgjwnsiJtRfxVROwMi78qMk9S2w6fTYKrOC?=
 =?iso-8859-1?Q?+62l1smAk1LDWmwDGhjExcMv5uCPFm3dCaoeLbx6pGemQThz7jMjfGxm4m?=
 =?iso-8859-1?Q?hCPpfy6ocY2yLxKBkrHK7jvSiaOebQIlMQXDzsdD4xcg/iIbTDNQM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PmeFdV2JoqCOKaLVNOaIAPiqO7evGbN8aiZJxRlCeGZO92pWlWkaF2CleD?=
 =?iso-8859-1?Q?NHvAAAK89BF7QFcVXvnlnTyaeifT9dYD4giuyPRyr6Yi1H2PbFI689maan?=
 =?iso-8859-1?Q?4Fa0E42RMH8Qn61pm0H+VSV7RPRJnCF2z38muJ13T3I5sR9UPv25Nhnbb3?=
 =?iso-8859-1?Q?nTjF6tDKzV+e/D3bAo5ez07lfZbCsYzE5YKpXiVlTuxnKuIJHehv6hnRCw?=
 =?iso-8859-1?Q?xS8gdRyjNGoAE+p7K7BA+80wBeYt+Qe4kUPcS/Gx+iPL/b2Qbp8V10CXGR?=
 =?iso-8859-1?Q?ATW/IaMd9vlRm5bZV92bpilleMOkBrwzQic6RB2D9xppReDf0IcNsukyJ6?=
 =?iso-8859-1?Q?w9uMg8GxWF2CAcH2CIBU38IS97JS8OSkjyB4bSfHVBBy5QNUtg4x2HR8ay?=
 =?iso-8859-1?Q?eIg5cl+8dPZD8xeCqJ6iFLLCgUQyBpWyEp2+Nih7Gs0tvKm+FdmcNML2NK?=
 =?iso-8859-1?Q?GrCUPI2xkEnFB3CqAEn9pPQGmkST5qUiSPtLscJDN4I96cFVeMF3Uu99zh?=
 =?iso-8859-1?Q?Iolt0G7deo2w2ZXUk8H+nKj+eLRGqthm1gthAz0j0FPRg4cX39tFcJmcxG?=
 =?iso-8859-1?Q?BSMhcyRL+viVHuGWp72aK0ed5mHXJuujlweG9LIODIZQ5NJA8FTib4V4Nd?=
 =?iso-8859-1?Q?kYa2wZweQzsZj2nEtfZFKMTciZbfJ5zWTHhl43v55aclhshfrd/YmBTuEv?=
 =?iso-8859-1?Q?IP7x1+4MDeVF8WX2XElU7LHFhwHbRr3UVxONiAbaIQ9YWNnswTvfgnOVQG?=
 =?iso-8859-1?Q?lAlZH07uQwfumr6oA1g7hnW4QyvCQERJkQP3I9yBAsorqR1zPqMxLEr74d?=
 =?iso-8859-1?Q?HNrwQsOb05RBSDNSV373qFSW6dLJ1Yngyfs44sFTImPm0m1mxof9n5WczS?=
 =?iso-8859-1?Q?GHksCttMtusTvrcI34wDAiq3hA+15Rn3m/8BwRf91maEehVpVyj9qKhNta?=
 =?iso-8859-1?Q?ZM2w8p9eI3daEsFB7+aMFTd6g6ieYrfITUE4rm1fPPiy69LZn5sKtKoaTO?=
 =?iso-8859-1?Q?HWBUuoiVtsTzrgrBPRaBAIBIBmJ0roNb3AI9qUG87hnyo3aJkzBGf6vN4s?=
 =?iso-8859-1?Q?WeILqcrNkNCTz8WOJ7dQa7VuyrfSPFbokEmuvfoaFLOTlq18qIEiWBWw6Y?=
 =?iso-8859-1?Q?pGFx2PjM0k5H27rPw3HCaKbzjYsc3qYNllvILHo3IazT+StQjGxGQYXMLh?=
 =?iso-8859-1?Q?VhfYLD5Amrf0L+iuhreD6VABjjfda0sBR5bh1B1gE3aDmQrtL2TZasq/g3?=
 =?iso-8859-1?Q?+XnSbZmTI0qiB796iFm6cmNY6TcEL2ObJACqlAD1lyWmYsKP0qHYQpjMmU?=
 =?iso-8859-1?Q?tgM/FlzsvDDAMuIP5dVuegoYxpFM21RsfgD6IHE+tNzs+KJXXZX/IMxCcI?=
 =?iso-8859-1?Q?Dh9lwB0beZsZTNAdOhykikyF0tS3qEPArhNZgyylPYUxxoCexx6nK2FV3U?=
 =?iso-8859-1?Q?LamkcZs8T6wXZCD2vguePieGVj2wadoJeIi17SKNKRtvOZtC83rm1/GPyf?=
 =?iso-8859-1?Q?AMXKb8o4CJf6xXz380+mhveuymovszz1g6PWp6eiD9uONNqOq4ptfqlHTZ?=
 =?iso-8859-1?Q?k/DT3zImUo8fCrYPlZU0bu5fHYL614zHU8ulFlKJHAFRLPsOPRzT4Asqs4?=
 =?iso-8859-1?Q?1hfax++VGCL8CqtoJIgArmZ3fzGNZYreorivIe9uFGoig/+MKcK9FZOg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 378267a3-e03d-4759-af72-08dd93c1bfaa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:04:11.1798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjwLWApca2mDZCP+v1rC8mnV9GBPqoFcZgZha3HEvJucMl/xIl4Jc0zriZijU0ZkjsJUU+KGFSGLI9mY1LRxV6xngBIBf+smj91fvMg3cJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2AD6B04BA
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

Hi Dave and Sima.

Here's the drm-xe-fixes for 6.15-rc7.

We had quite a few more changes than usual due to 2 fixes that were
being worked on for a few weeks: 1) engine utilization and 2) mixing cpu
and gpu atomics. Those 2 required some refactors to get them right.

Other than that, fixes are very simple.

Summary:

drm-xe-fixes-2025-05-15-1:
Core Changes:
- Add timeslicing and allocation restriction for SVM

Driver Changes:
- Fix shrinker debugfs name
- Add HW workaround to Xe2
- Fix SVM when mixing GPU and CPU atomics
- Fix per client engine utilization due to active contexts
   not saving timestamp with lite restore enabled.

Thanks,
Lucas De Marchi

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

   Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-05-15-1

for you to fetch changes up to 617d824c5323b8474b3665ae6c410c98b839e0b0:

   drm/xe: Add WA BB to capture active context utilization (2025-05-14 09:03:29 -0700)

----------------------------------------------------------------
Core Changes:
- Add timeslicing and allocation restriction for SVM

Driver Changes:
- Fix shrinker debugfs name
- Add HW workaround to Xe2
- Fix SVM when mixing GPU and CPU atomics
- Fix per client engine utilization due to active contexts
   not saving timestamp with lite restore enabled.

----------------------------------------------------------------
Aradhya Bhatia (1):
       drm/xe/xe2hpg: Add Wa_22021007897

Himal Prasad Ghimiray (1):
       drm/gpusvm: Introduce devmem_only flag for allocation

Matthew Brost (3):
       drm/xe: Strict migration policy for atomic SVM faults
       drm/gpusvm: Add timeslicing support to GPU SVM
       drm/xe: Timeslice GPU on atomic SVM fault

Thomas Hellström (1):
       drm/xe: Fix the gem shrinker name

Umesh Nerlige Ramappa (3):
       drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value
       drm/xe: Save the gt pointer in lrc and drop the tile
       drm/xe: Add WA BB to capture active context utilization

  drivers/gpu/drm/drm_gpusvm.c                     |  37 ++++-
  drivers/gpu/drm/xe/instructions/xe_mi_commands.h |   4 +
  drivers/gpu/drm/xe/regs/xe_engine_regs.h         |   5 +
  drivers/gpu/drm/xe/regs/xe_gt_regs.h             |   1 +
  drivers/gpu/drm/xe/regs/xe_lrc_layout.h          |   2 +
  drivers/gpu/drm/xe/xe_device_types.h             |   2 +
  drivers/gpu/drm/xe/xe_exec_queue.c               |   2 +-
  drivers/gpu/drm/xe/xe_guc_submit.c               |   2 +-
  drivers/gpu/drm/xe/xe_lrc.c                      | 199 +++++++++++++++++++++--
  drivers/gpu/drm/xe/xe_lrc.h                      |   5 +-
  drivers/gpu/drm/xe/xe_lrc_types.h                |   9 +-
  drivers/gpu/drm/xe/xe_module.c                   |   3 -
  drivers/gpu/drm/xe/xe_module.h                   |   1 -
  drivers/gpu/drm/xe/xe_pci.c                      |   2 +
  drivers/gpu/drm/xe/xe_pci_types.h                |   1 +
  drivers/gpu/drm/xe/xe_pt.c                       |  14 +-
  drivers/gpu/drm/xe/xe_ring_ops.c                 |   7 +-
  drivers/gpu/drm/xe/xe_shrinker.c                 |   2 +-
  drivers/gpu/drm/xe/xe_svm.c                      | 116 ++++++++++---
  drivers/gpu/drm/xe/xe_svm.h                      |   5 -
  drivers/gpu/drm/xe/xe_trace_lrc.h                |   8 +-
  drivers/gpu/drm/xe/xe_wa.c                       |   4 +
  include/drm/drm_gpusvm.h                         |  47 ++++--
  23 files changed, 391 insertions(+), 87 deletions(-)
