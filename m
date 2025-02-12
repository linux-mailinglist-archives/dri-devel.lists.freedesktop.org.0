Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76279A32B9B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 17:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9299A10E179;
	Wed, 12 Feb 2025 16:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhVAcyRn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9C110E179;
 Wed, 12 Feb 2025 16:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739377881; x=1770913881;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cHxhS6iujsHr+GgqMy+i/qz2CsZ8KzCUkfF/Y9ZIEg4=;
 b=BhVAcyRnhU9xg6K7agDhhybQErNH61c70e0OUfe4Ze34fQ2hoCdG1iHn
 PtvU2G9AdFql4aj9xNrsdWjuaWE/YbkKPBjp2IZkG+m9IWnZ+8y4uIXF7
 dWO7ftSBSzRJFpyrwgjaXpcdBqcxbgw1l2gJUYSf6SyUtHcwDywr5FoFe
 /uOHGLTMI+MKyRrB/uEmkzLuzm3VzJwg0VCg0L+FSYb9EfIoZ8KEiUxrT
 YXIEV2s4GIU4+3L4xLwrrE2gr/JClzK2tD3WvEvN/W3SlXWPOUdGp+t0t
 F8sTOVkh5E42IZNc/xG8uD55YOL8G3eQpyvRhxNkkIAbzdjHOmeclsBZD Q==;
X-CSE-ConnectionGUID: tC28ihYnSM65gVWvF6bWNQ==
X-CSE-MsgGUID: iHAUNbTkRk+OTbAJWg4QXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50692478"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="50692478"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 08:31:17 -0800
X-CSE-ConnectionGUID: 3bp9UtlNQ8CAGGNtH0B1NA==
X-CSE-MsgGUID: OZawsiS2Sp67OzETJxFreA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="143712118"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 08:31:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 08:31:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 08:31:16 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 08:31:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0vaCOghOQfD7sl63oj2yvWUpZGAv5DSH8zovdjIePsTsk/VS9zA74L1RcnkLLMZtYi6e9GKz7BCJUymXUQ24CxVwcsXG+NZE1Wh5J5nksMTZlV1GIEsILTD8PM/KvHFU7hGjLryBi4uXiZiWNTbgI7XX8QutA/HLDIAT1qwAMCPBmBM9AgVYP+opDg+7cpbMGumK6bjx5nn6PS+u5RLCTM++ludUUJFMfBqiwudgDTYIjwqe/ntTfLJxjl8JPM8lPUFwICkNGvKaqT4YFUks4U1mGdobF9WIeqoO4vCSCSgZbEsDoc9LeB1ZdWcBSwRwMy6OWn5tXWWmt8JEtObbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYqI1puKFNBkdVhRsMy4sbVS8Fujwa7wkQLJFlOS2Vg=;
 b=q9JTgc3k7bvzjURKsOlZUT40hzBaboGjGIl79zhFuuOVe3Sx1nvuc9M3aFqHob65qGbpE4B4J58hIJqGhS+tzhOWZRwHcbz2a+Oj3bZbLyqoNcg3+VxqZyH0MBD5GuYi7eAHYgfTpO7zqiUVA1WDKVjD9o+3np6D7zIl2JnwfItsxyvLyW5uRg9DZUTaP1rxWTQHn88MBhB30RDxG08zsUr7gz39pN5EKboLCOgCiatHaOaES4Sb1rrKpaBf+T2s7nyyYQ27vaa0cgVdURu1DTpJWg0A+vVhnJKm7gm2dB+uGPsIVIRXnIrGevOZo/LUPcl5lGD/9OLhWG4qsDRLhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DS7PR11MB6078.namprd11.prod.outlook.com (2603:10b6:8:86::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Wed, 12 Feb 2025 16:31:10 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 16:31:10 +0000
Date: Wed, 12 Feb 2025 11:31:06 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH V9] drm/xe/uapi: Use hint for guc to set GT frequency
Message-ID: <Z6zMypgRtTKR3-Fg@intel.com>
References: <20250212121814.9947-1-tejas.upadhyay@intel.com>
 <96603cd51996168d49598bcc5e2987976905befe.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96603cd51996168d49598bcc5e2987976905befe.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0303.namprd04.prod.outlook.com
 (2603:10b6:303:82::8) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DS7PR11MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e73b91-2e60-41f3-0730-08dd4b82a8a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Lix1ovGaukCfGD5coZ6MFtl6inTlmjRfGu+sPsr7sL9exXlawmBq2ZsTPC?=
 =?iso-8859-1?Q?qmXsODP6yMuTjwf7dLTtzIORj+0VCSoqqLr6IQa3L6pe1S0NnHywENhAe7?=
 =?iso-8859-1?Q?PjFsLxaECD0Bgjo7FpdJ3Ormh9wu0fJY76qfz+0FIxAcouzZ1t7TaqozM8?=
 =?iso-8859-1?Q?+pVBp8j61Rax2u1vOK3P2eROH/L8Rw9IXJg5ehyZm0nTHC2afYRl9bsKK+?=
 =?iso-8859-1?Q?o018hkEFCAkXnZDkqw5I7VXu3jY5jSNMqyu9sanNC6V/XENuB32aodgQRM?=
 =?iso-8859-1?Q?QVXzLtsxnJKa5Ux9v4JtJ1ar8s5hsevByGsewilrGq6YlmtCn57cNCREf+?=
 =?iso-8859-1?Q?pcHCYKQUW5phahHzaiwdioFF8VB8bMSP0H5AGG5b+IEbKxwRSPGuZMJIee?=
 =?iso-8859-1?Q?Hmv+K3RrkU5xfGHJ+aOQPoU/6F9BhUmjWAWpV4w4VwZSO/Dv8FSmnctAL/?=
 =?iso-8859-1?Q?n9eOgxPGmSCN6uI3eoigXECsDcvJfAFYjHKQ2bf0OexcuKoMp+eF3bB+BD?=
 =?iso-8859-1?Q?lRF+liFdSsy+xIK62NexkiCzNtgdnrfGEMxUrYejaQCt64Z6HuSpUluQi9?=
 =?iso-8859-1?Q?e4Z6Siw4K88mvDBv7lJuvz4fkWWute1bDC7IhmnXWZWbMbk4Q3CO4n11wo?=
 =?iso-8859-1?Q?sJQBnPB6uE/92+13eZksnHYgH9L7XWZSsvbt6wydUZ8CvwqyL6beA5PBhQ?=
 =?iso-8859-1?Q?F2CJZeJoEBnSWbIle7uhvt3O/rR/rKa+S/8LkOG88HOlM0WkjCemcOv2CK?=
 =?iso-8859-1?Q?BuuliX+zkJ1iCUC4Vf9efjfXzrmSypbrWKXwjwsxrpm37Wee9PGbfj+4Qh?=
 =?iso-8859-1?Q?ygRIF/bCqOzp8Qsn1E09o45SONsUC8iaG8DrQ3D3FPM1DA6RwqB9ksBaZC?=
 =?iso-8859-1?Q?pqrYcPAcZz6CTgEB3i05MkXnkWmndOqiWCK6piQ8wGswKxFsGZFUP2cM9B?=
 =?iso-8859-1?Q?kZPBNLG7d+t9A2wLMOl1W62EOPkavVfKPAEsaTQJ28NZrfXHEMxddnaFam?=
 =?iso-8859-1?Q?BaGZkh9L+f3KSNYl0PcmYERg1G+BdCsaKzYaqCEKEGVFTMiDVwJOYHH6/H?=
 =?iso-8859-1?Q?i4wKOSrMYD1mrEC8kek3t9UYZnhiF5MVQYViaE+k6r2HPkAxAxqGvxv2Ue?=
 =?iso-8859-1?Q?d2LMVorfIzD0ZtMqYLcL1KQjqcljw+wKMzFGydyVSclQWvWcj1x9seYaxV?=
 =?iso-8859-1?Q?cKJ7ou/FqFgL1XvI4AtnEmEttunkj5+UMt2rirWpAt8SzofOeRfnAuasV6?=
 =?iso-8859-1?Q?PALBOCn0iQOgc1yfLXZIKiCtpxcDOej//Ndm6uZ22jdwb99fmxN1302JdY?=
 =?iso-8859-1?Q?zWCeDB5Rt8oUDPhRTK8y/VdgdVrRMoiIpITrJkesnelyNY0b5ksACI1qlH?=
 =?iso-8859-1?Q?zHMnQiUpiG1UZyX8ObWEiEbJDSTnPkpg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5AFjbitW+IyYkpbAG7GdySkxtZvyem59L8pCrESn93Zydb2cEp50TNNQdj?=
 =?iso-8859-1?Q?QLoJVk4ylvaY4EHj5w+vpmnAS+URKaqEstXInNlDEJRAwLtl+6s7M16+D5?=
 =?iso-8859-1?Q?FvD/boVMeZnouSz4VQF94N4RQpXn99ipZeIf2SP53ijCjqCJVvdggidxDN?=
 =?iso-8859-1?Q?PAQak2SpD6HbNQpMYo/nURt/tSRGKE2EdjtsT42VY5bs+vs346ik5Jcj2A?=
 =?iso-8859-1?Q?sQdZBjUoE6JGeHUkq/iT4Ksj/sVJ61iJ/HsRTPVce3/d5EgdXIDthQ+SoG?=
 =?iso-8859-1?Q?mH6letbpxUAvpzWUiLXFkAfEWfpKx8Oer0+khaLir5nYJNCTzzlO/55z9y?=
 =?iso-8859-1?Q?JKcRdVU3S7ypsKbf6RzFKRoPvGBcGf52zP/v1WIJ2HxEaM1a9lA2W9Thc8?=
 =?iso-8859-1?Q?EfmkRv18YIJsZGgStMqZ2knEYNygIMecZcFc6mSpyG3U7AJ1V0QZ5T9kWY?=
 =?iso-8859-1?Q?30Qdo5WlzrwC9mkCXV6y1ZfYT/mfYDQAsRER2l8Vo5uWlVjlyT7JRp0Sl/?=
 =?iso-8859-1?Q?j+vBWb6Fgh+BI5sDK6hIGC0NJDQYv0b3IDyhYwZP+cO29SsjTZJu422vgb?=
 =?iso-8859-1?Q?XaIKxZiQNDleJ4tnwySfq6iwWCBejDrVn7xdghYk6O+IheGPgi+N8nwY9l?=
 =?iso-8859-1?Q?nxV8RFrsoFqAHBh1k6h2EfYm9YGbqzJtINORDxrmzw/9xMBejVb86shw6h?=
 =?iso-8859-1?Q?ZwAdwh5SjMgmQzgB7gyRVUYRJUa/hm3ejd/PshVSMxi4OCo8NfhDPsvA8b?=
 =?iso-8859-1?Q?ex5W2qFaI+neJGve7seAzBjKDUx3W3YENtcLo4rVX+qA6oOG27nf5eYaQl?=
 =?iso-8859-1?Q?Eg7hiMD6EYSpxR5gt7qNySNqyeIVFpYmW5sM/noMfT6Paan16PqJR8nZDt?=
 =?iso-8859-1?Q?D1vRU4O4QRHRexN2pivW97bK/1lh9LDHxTeZO9dS1OFdcXlFV/zDHeEBPw?=
 =?iso-8859-1?Q?W1WHaPpZGqtfg8g+v9ZzLJ4pXdHro3w++8Ew6ZPcWofY8kPNDMvsB653Od?=
 =?iso-8859-1?Q?1eV8Chyuve3k7+8uw47XwTNS5vT5qt/32SXYbKquIOkm2+tHlVP99dVcPJ?=
 =?iso-8859-1?Q?srpnWQPsxR090MUXKWogo8iceh+pSGlvtUWKpKCHMmaFYHc4dxahifqQZB?=
 =?iso-8859-1?Q?Hk1X6HTzQhzj25f1DbDv7pV+2CPX8PcT4VazbgX94W9zEBfJp8CoeuqXNx?=
 =?iso-8859-1?Q?KbPt8Uv6+1lFD0PmiKiiHBRXWJnQJrzKmeIMK2z9Id5vCDmgayJjyZvi36?=
 =?iso-8859-1?Q?vA8+S/S9VaCHWHJb6CyLozMdb6oQaLJ4l0ConPoRp+S2yiGDLU+4RwZTki?=
 =?iso-8859-1?Q?NTEcJTDQht0GoTmV1iX5UVk3DLdNYBOuumY0OZ0KIJHcV9VT41lmQ94sCn?=
 =?iso-8859-1?Q?RpPx96UDzgBcd2zoQEG3KCtN4iKwYa3uttSy2bFVuSUhPSoBqJm4FbE2uZ?=
 =?iso-8859-1?Q?eeQLCvVnLNO3DEq/zjjBVVIvhmnGq7YL58yHWwBgUXBmTUux8v+JqnL2Io?=
 =?iso-8859-1?Q?KnBEemK2kEp+E4xk3DxRoytDmLNklDqiXJyzagl3LMiKc6dFmveyf5yV6C?=
 =?iso-8859-1?Q?MRXGjmrgtkltgRH4tmls3qU8x4PRwzbruow8eDMHM3dRD0rh867pBGoxyk?=
 =?iso-8859-1?Q?lC980kAbqPSHQvsyc+0cpTHuAIaF3TcTf6G/4vs7yML6XdvraQVofR7w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e73b91-2e60-41f3-0730-08dd4b82a8a4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 16:31:10.7476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89zTrX/MneCWXN6KTNPJi5V8LVWZLqrFmM+8bWIbZDnYdFmNStU5IMl6WYOWYeedwCRGC4F7izOuFI1CcvL6+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6078
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

On Wed, Feb 12, 2025 at 03:38:06PM +0000, Teres Alexis, Alan Previn wrote:
> On Wed, 2025-02-12 at 17:48 +0530, Tejas Upadhyay wrote:
> > Allow user to provide a low latency hint. When set, KMD sends a hint
> > to GuC which results in special handling for that process. SLPC will
> > ramp the GT frequency aggressively every time it switches to this
> > process.
> > 
> > We need to enable the use of SLPC Compute strategy during init, but
> > it will apply only to processes that set this bit during process
> > creation.
> > 
> > Improvement with this approach as below:
> > 
> > Before,
> > 
> > :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
> > Platform: Intel(R) OpenCL Graphics
> >   Device: Intel(R) Graphics [0xe20b]
> >     Driver version  : 24.52.0 (Linux x64)
> >     Compute units   : 160
> >     Clock frequency : 2850 MHz
> >     Kernel launch latency : 283.16 us
> > 
> > After,
> > 
> > :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
> > Platform: Intel(R) OpenCL Graphics
> >   Device: Intel(R) Graphics [0xe20b]
> >     Driver version  : 24.52.0 (Linux x64)
> >     Compute units   : 160
> >     Clock frequency : 2850 MHz
> > 
> >     Kernel launch latency : 63.38 us
> > 
> > UMD Compute PR : https://github.com/intel/compute-runtime/pull/794
> > UMD Mesa PR :  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33214
> > 
> might be a silly question: looking at the UMD patches, am i reading it wrong but it looks like the UMDs are just going
> to always enable low latency hint (as long as hw/kernel supports it)?

This flag makes a lot of sense for Compute, so they might always enabled that indeed.
For Mesa side they always enable, when user has selected certain config. But the default
there is to never use it.

> I mean if that is the system level direction, then
> why require a method for user-space to request, just always enable in kernel?

We have considered the option of always setting the flag when LR VM is in use,
that would cover compute. But the i915 experience shows that it is bad to do
implicit choices like that. Let's make it an explicit opt-in.

And that can be used for Mesa for instance if user is interested in some specific
cases that are bursty and latency sensitive, like using Mesa Vulkan for compute stuff ;)

> or is UMD supposed to expose an extention
> or something for the system integrator supposed to selectively modify app code?

Yes, I'd love to have that. One of my long term goals is to convince the high
level APIs that we need extensions. That nobody better than the apps to hint
the low level kernel, firmware and hardware about their power, performance
and latency needs. So we could stop the heuristics and guessing games
underneath!

Thanks,
Rodrigo.

> 
> ...alan
