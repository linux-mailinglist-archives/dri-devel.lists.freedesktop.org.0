Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC89A7A827
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 18:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B2910E28D;
	Thu,  3 Apr 2025 16:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WxUULicy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4467B10E28D;
 Thu,  3 Apr 2025 16:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743698756; x=1775234756;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t4h8Z+i1hLsAoPCLNShl1FuvI1V/bhJShRO9uug0Eg8=;
 b=WxUULicyuc9pHfJGrzPpXdD3iOCC+bseUALK04cMCWstVfl0ENaeb2UL
 uuRMMKZQW/Y8XRDNI1gxDtbBdF6gXEnPjNds0hT9hj40SRd5R6Zwz3waJ
 XHdfbrvAuRq2yp3t5qShBeWpGQyW04tFFgOzxBdYKi0ywRGUSxJ5hC2Hb
 EdRercTfsQzgZKeKOIRurtqp7K7DwFkKaNtb1Kg2oFwU1pytNPj/mQZEc
 fTTF0xglZFPKchh2yXTUTSx8Hy04Glp/KEm4nr7fTyw4bFHIOwi68lGzv
 VkT3JNTJNM50xJCqHLe9tVeZdlt1tjOlKtXV+1Rr+Kn73Hi5fOek7cKZ0 w==;
X-CSE-ConnectionGUID: hXd5gZg8REqlmx2i/cfyTg==
X-CSE-MsgGUID: PY5C8OBXTZen37L7E2FCIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="48913137"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="48913137"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 09:45:54 -0700
X-CSE-ConnectionGUID: bB9+g2bcQ/u0RxoQX2LavQ==
X-CSE-MsgGUID: NdjTzbRrSsyhSEXi0Mn7rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="132043289"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 09:45:55 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 3 Apr 2025 09:45:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 3 Apr 2025 09:45:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 09:45:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhQYm3cj0yWmT58w+l/uYNZ7kIiE6/AE2MKsH4IGR2z7+TXBQ3SeWfJg9BTbqFDiwnDzyJzlOyUAj1TjSEzCKHnurRtvJjonvcwAH7uLniVFNA6TzxFMzn0Dk9jTZGW+8eExozrhArBCHLbUAqOH34WFuSDQRCgPmmlR0VaANqbq6nr8GZlEicwkrsWUQZDVqqE3rXMmjPZSjNNxpLrjo86SmfnRE5tLYpBFxVvyfb0daHqMLX/9sPdYTHFmgppieIZ+ruwjhATCtCE90FldEpDivR2eIecBeKA4Nv9F2+ARuYL21qPmr3uEfLrilZAL9quDmqP4zT/wLFNXg04P0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blPrhwu2Fq99PbzCux0a/c3OyCJhmxD3bIru4OWlUj4=;
 b=STxjegtWmD6w8YU8H0V1DXq/Z8HOE/1GB4jJ6JUgjd0MuBVRCmS2zlNRB/WQ3VC4tJgHLgP/MCnx80xYLt1dUrNHBWZ5nNrRVdn6Ua7L2nsp2OgSLJ9adsLvujq7RBEfDe0wKInUrMWlEgHgLkokwMMlhsfPgzhQDKJ5ICICSV+Jp8Narm/C1Xi+WTgZSCAhCxLgjfr0C2QdT5UDQWDEeZAvaQSnvsgpW9T0BhIxz4X+uTSpbAXIaOOwWPrVLPEAOFenz5a43608/fxToGUeunhDosX3vgZN5zmNtUnDo8iuay4cHadB9YN3iNKWnbtwIzNO5A3by/KyMSPfIY/K1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15)
 by PH8PR11MB7069.namprd11.prod.outlook.com (2603:10b6:510:217::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 16:45:35 +0000
Received: from CY8PR11MB6865.namprd11.prod.outlook.com
 ([fe80::3918:9807:8667:3b73]) by CY8PR11MB6865.namprd11.prod.outlook.com
 ([fe80::3918:9807:8667:3b73%4]) with mapi id 15.20.8534.048; Thu, 3 Apr 2025
 16:45:35 +0000
Date: Thu, 3 Apr 2025 09:45:33 -0700
From: <ivan.briano@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Zhang, Jianxun"
 <jianxun.zhang@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>
Subject: Re: [PATCH v16 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Message-ID: <idjt3qjfdvutxogngwjldus46xn2vbbr6juitybuwpmf47vthx@fv7ncchxb6c3>
References: <20250401222657.78545-1-jonathan.cavitt@intel.com>
 <20250401222657.78545-4-jonathan.cavitt@intel.com>
 <4wixf3hmhcu43ikzs6omjez5wo3tzkaiox2vz7gbi7qe3uru7p@xexdfeqdptdu>
 <CH0PR11MB54447DCA3471E094766A32A1E5AE2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54447DCA3471E094766A32A1E5AE2@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4P223CA0003.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::8) To CY8PR11MB6865.namprd11.prod.outlook.com
 (2603:10b6:930:5f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6865:EE_|PH8PR11MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb9649e-96df-44bf-d93d-08dd72cef47f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iM+lcepKhRVB/pz2dEPf5EL9v+Rfij82TapVNpmzHgDc/6xJf0qJ+9Hdw+Ko?=
 =?us-ascii?Q?+D3jPG4Q6AalNdTQnRiuMH7sCvUkVSd0EECBUt4PO7RnDUvux4ohZFuOjgo2?=
 =?us-ascii?Q?EbZe8YU2KZxbgXXVUPouhS57Qcj7f+dHzT25rUnjo2Lc6/GC2bOjI9o7WPFe?=
 =?us-ascii?Q?JRo116PfD37UvT8jlpbv/VS2F7Lt4nzeRWn0Pc3tZ7qAWKhmX9V9yFy7cgTP?=
 =?us-ascii?Q?7Yi792MkgnlARFu4YKKUzWwzGCCZFLSNELpWki8KD9IYhTH8c/W5LKxB8MUl?=
 =?us-ascii?Q?4a6ZiR96e4A9RwCyIzIQWaHXmdo4GI0vb420MLE4pjgdI8l/xfmb//ivrBsW?=
 =?us-ascii?Q?gkWCnn+UNuepMezv6HVA9s+pDUuKMif90Wz9QmeTripRzRqoBuXLzVuTaogW?=
 =?us-ascii?Q?yep3F9iIWDv/ao/2UgmqjkaE/jB6O0rQbAc0rC7s4pZje/SeCS6TBnPkLvm0?=
 =?us-ascii?Q?dGewPeV5YilSvCaYJvTd/fo88P2sr7B4dIVJxoMjWfHXBaIf32/GuCTAxbOJ?=
 =?us-ascii?Q?lbbVl6nbjMACQviLoj6k2aly6u+a4vHj2bTJcz4+jiERzoIPBiSTJzlUDXlp?=
 =?us-ascii?Q?G43JOmnUHx+d7iM8fJGcbVl/+U6CvGTXmuOadh5imD9ylAiM5F53lrhzEWDh?=
 =?us-ascii?Q?FGHYhQu2DP1VDpjdvcNbn0+xRpJiBAJoKO6bRb+Q+gSugj9mPMIeWeE5QG25?=
 =?us-ascii?Q?wQ07dh1svM/DfkyxDgokPHIaIFcJprha4O2iAVov49vXQ5cai88Zm7bsKi2b?=
 =?us-ascii?Q?GjZUzX8VkzPfUGbpShmm2KCBwOTn30VWyR31Kwq8P4Vq4zojOdqHF24oCt2l?=
 =?us-ascii?Q?hjsee2+jst2ijMKSsOKAk6bjygReWGv1pNixbLlCJ0JWwZjx9Ob7g6o9yi6y?=
 =?us-ascii?Q?oAAyZEdZ7ahUO4vGDjBS7kB3u4hvjJLj1NcKW+pgwPy+hBqRWZC1sS/mTLz0?=
 =?us-ascii?Q?Crb0qsiGW2tU13Vz4yvcjnVo5PLimvQSwQKaEu2hBRfKsFBJyb3+ILyebdkd?=
 =?us-ascii?Q?QDGqNdirTbk7MVZU62XyD1MzGw9YtA87nqxW9gnSDK0a7XHord4Zqkj4m5sW?=
 =?us-ascii?Q?vWO2DBVYCkIDFcjOsAdUtvW16NHkqkY73KquKkqMpthRQvTjN9zlYpI0DD6w?=
 =?us-ascii?Q?dYxcSn9bDFUNXZ4TfWQp+GHvUHv7IdvJg1rvK8tZEnNf+aGMPeJYbAKUQO+b?=
 =?us-ascii?Q?dfwORYNZmkDOxF+/Yz5j7y4pbJ4Tqoeo6Tooxnq7lRowzw8u3txusZpSNGeQ?=
 =?us-ascii?Q?AMSru8nxdIFF5BkV+1Jb+/W1qT9poDpLsO/PuVJUBXWybJ/lfSKblgXSfaYu?=
 =?us-ascii?Q?fPSA0RoQabul9QG3AaJ1Me1yydu7naFHpDtFYSUoFogY5lDA/Q3g1gx00yuy?=
 =?us-ascii?Q?JO8cJCEOjteXgJ5rfwniPxZQRjvd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yo3zBl3T33M6NyB6TtfDWD6H28sYoyMvaQaQJGNUyrJgOWx3NroEd+Se7Oek?=
 =?us-ascii?Q?1oCN21uM3o/ozRKcn9OUHDXDH5rfxGHaj5gwcdGcJP1GnkDKVbYzNU0NrVKD?=
 =?us-ascii?Q?wxzjltonSj4ltzvsJrJaTgmMjXkrb/nN8CD/fpH9ywoY4kzTc+2jkAw3MVTn?=
 =?us-ascii?Q?IDoILmN+/6RyhBQg46yPeoRbPVRVYqt/9PQ7hJdy05wWMk3Ynr+pVDTGkjz3?=
 =?us-ascii?Q?mpgC+B5witGBkukRm4IGM+L1xFHQZFnWvhwRhpiJeiEjzrZq45C9CqWwcYtC?=
 =?us-ascii?Q?CLBfCfbKMN7cwn3F88bR+gCKtG3FyD2CP7YLpgWkDtMpT9QI8nxfAth8YFK/?=
 =?us-ascii?Q?a0yWwADW65LREi0ycqs44TLgktjKdIFgIVsLNyYPJ2Z3XUlLSsPGwgVYcmuO?=
 =?us-ascii?Q?pmkCZoFzxKj9wGWGENqVC1EU6PSGw0Z26uPoF1vrhg8A6Amf5ernzYs0TEKC?=
 =?us-ascii?Q?+c0rugWB3MdlA+19WRtf2EOujwfCraW2ZxIKICYqDqqHlR0KZJXm3VzKmNJY?=
 =?us-ascii?Q?iZr0Uz9BmDDEw3fCh26gUkiiC0Yh5E3kTu0cYg/G17Y/Vetu+Ok0NHqjdIS0?=
 =?us-ascii?Q?POC4/qfkXc+PZOkVnsGNc+svX/kZj4iv3UQTYq2f/j1dBfm7hz5dkv2gYf0/?=
 =?us-ascii?Q?1PhiFNtWrTTvA4M7guI8AZHAmnzrZv6IzbxOvsNBGfFiZDmlp0LyrRy/3M1X?=
 =?us-ascii?Q?mZL8QHr0R3rjnaTyBFllmNWS2UkPLjQsZ7NB5VHECZA2o7PD1Btj5LMApXo+?=
 =?us-ascii?Q?QCMJ/qM47KMcpzEO9gOnrw+rtuDdpCcBe56/PngHb3nxnVQi6yk02GSXoKhV?=
 =?us-ascii?Q?XifDcRhAV++1Cqw5Oee5K6LKpKnZXcmx1FXtnL4PDorxmosAkIitujM4zxKn?=
 =?us-ascii?Q?Unam4Gi7+OZ7qvi2aiDturabCVLAi4OtnITsxVgY+6qg03eymiL9rSkiA5E+?=
 =?us-ascii?Q?Qrs5roK/1odgBf5eaTuJ5g9Q179ODqOdoeW2goW9LR02wwBapcpOeFNFr/GE?=
 =?us-ascii?Q?KNvn1EIxcD5Ov5xT6/eNy0WZ01chOz0J6fuSru+GgQsE+30Rg3a0a1ztgasE?=
 =?us-ascii?Q?BGliIe+WkQsBGqhbZQC5w68CNIH3S/3EnGA3a1j4extJK4MTG2M0o1EOJjP7?=
 =?us-ascii?Q?oKWm/3MpOGyYL7J1eapr5VAbFBJGOeP8zSnllfaW+BesUKFpMDkbc3mUY4ok?=
 =?us-ascii?Q?RcHTU+5uvC4RhfUFIdE+opDaGYgo8C3tF5gsqwBE6IZANHmJ4tQagNVTuUhW?=
 =?us-ascii?Q?leamWrUVulkFou7gwajseVbPR8TDYUhZHjuKNGaO+Q0t/LML98kVXx50JK/4?=
 =?us-ascii?Q?EzWdT5dib8iSL351y2s7ldvgwChByhkf+dTl8wJJOd/7QhxDBd9O7qShWW9m?=
 =?us-ascii?Q?j9f4rstO6jEBAo1054uF72XckEYbekmV5A6fppHYh2BGKTEmLrPZLo8n1gMK?=
 =?us-ascii?Q?q/dW30lO9QZZsRsxI9CE7lGa4jjGZiK/1cbRzpypVXZSaygSCp7kjFffMabW?=
 =?us-ascii?Q?CCmZBJMhwkbEkBkli4fq9RD8ontvZAFXA69R39BKB0/xKS45UdhDpA3Pa96f?=
 =?us-ascii?Q?9B0KNqohyPwWzf8iSzOiC07ujo8sBG0SwEFsDFo2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb9649e-96df-44bf-d93d-08dd72cef47f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 16:45:34.8940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/uWs/s+zwVuFnFUfi2C5gSstzJKFxMXvx/nUzm/sk4RiBC+KIDLxRhOeHd4lDutkPK29tMZylEu7CxurZZ2zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7069
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

On Thu, Apr 03, 2025 at 09:24:47AM -0700, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Briano, Ivan <ivan.briano@intel.com> 
> Sent: Wednesday, April 2, 2025 4:22 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal.mrozek@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Harrison, John C <john.c.harrison@intel.com>
> Subject: Re: [PATCH v16 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
> > 
> > On Tue, Apr 01, 2025 at 10:26:54PM +0000, Jonathan Cavitt wrote:
> > > +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_FAULTS */
> > > +struct xe_vm_fault {
> > > +	/** @address: Address of the fault */
> > > +	__u64 address;
> > > +	/** @address_precision: Precision of faulted address */
> > > +	__u32 address_precision;
> > > +	/** @access_type: Type of address access that resulted in fault */
> > > +	__u8 access_type;
> > > +	/** @fault_type: Type of fault reported */
> > > +	__u8 fault_type;
> > > +	/** @fault_level: fault level of the fault */
> > > +	__u8 fault_level;
> > > +	/** @pad: MBZ */
> > > +	__u8 pad;
> > > +	/** @reserved: MBZ */
> > > +	__u64 reserved[4];
> > > +};
> > 
> > Are the possible values here documented somewhere or should be just
> > follow bspec for them?
> 
> I think bspec is currently being used for access_type, fault_type, and fault_level.
> However, I can add the possible values to the kernel docs if you feel that is
> pertinent.
> 

It's more of a question of API stability. If the HW changes how it
reports this, do we get different values in different platforms, or do
we want to fix them here?
