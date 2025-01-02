Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0018B9FF62C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 06:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B994E10E2EF;
	Thu,  2 Jan 2025 05:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqCirh2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8EC10E27C;
 Thu,  2 Jan 2025 05:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735794783; x=1767330783;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d/twjYxUmox7KeEIjk/vWslTnhYNMG9SfmxkfAAuRvw=;
 b=HqCirh2eAfkoNqeYnS+SAYxs/Eqszxk7fB6f5o97m41gsA9PGfbhRin5
 vs2FEsv3rcKYk5+LKVfJFxZ+ONB83DbhmNJq8zKHE46m+IFuXiKD5ajHc
 PH6CK7mlPPYykMWvkt65NQNQ/lcLhy7+JXZzSkAtNfIH4utdrgxGlSdEl
 jNQu3HM2ub0t2eZ3DmWU0i1SY2fRqNd8CszPEfdIovk1/GW9v1BMhOK9D
 amt/hIpgvgkKBS8P77zMdb3Ph5hzSYoVsmjHveO4TAVx6PcI6b2tTt87u
 ks1HLU3sb48wdgaKCFltv31Qzz0NzncLvD4aQOd1CzDsMcFhmdACKWYHc g==;
X-CSE-ConnectionGUID: 9UURhmvRS424rQYNRT8HWQ==
X-CSE-MsgGUID: RJkDS5LVR+uFodnqQWNheA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="58489045"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; d="scan'208";a="58489045"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 21:13:02 -0800
X-CSE-ConnectionGUID: rjPN8LDPQWuXkcSu0HS31w==
X-CSE-MsgGUID: biAJCNICT3GZD6mmiBhPWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; d="scan'208";a="101258308"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jan 2025 21:13:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 1 Jan 2025 21:13:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 1 Jan 2025 21:13:01 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 1 Jan 2025 21:13:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbslWPEuAd6+tsy/xfzNqKd26oed9DcvqtCh96poGNesGVGZ/varaz0aOnN01k/43K4d+SHxUmzwdAQtyq9lLE2qFXpnED/v72mGLJUuY1mAYNIKOpY04E74kUEXhxwC+HJWhwYp/AwGRQHpoarjXXYdMMSUseb2ZYG+WsAuTaDE2KSDjd3eUYnrxmlcg/GNkK/7FSnTgs6wuUfxWDTcvK9OPU8EbUTJ1P8cLXVoHwyI/lKbeXcw0hTnrsOkR8OAnSWy1KMpBOE4YCj3lZoY7MunwkJEvndBYsWHWv2aDmDPRPNtWhx6tTtbY59xlGLraTUPy8yPSRMrFiexnx663A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJALpdjHoyfWa5al3e6a5q9vNXI8aBGSMjWQvJSoK0I=;
 b=NR98JBbcF3DOf+rSIj12OdSjDscQHY6NwHrhsBa3/+g0tsX73XzOEN7xh8h8Rx1QY+3/V0PTXvQIjYKwpsVvetAkufzM0CPLyfsfo1c6Xeb1udXo2dw373RRC7UHfu/cyoCmmmEc6aALa1xNoLg/kwi5EVVtaGcJ7IrdEP+43pYuD8tVo40od06/LSHPhes+j2BTohEpv4rRkEZWAfeEogIEk1TO9q3pLZCfcePMleZakeI/A+AmiIAkBKR5v9prjDI+tWH5NR/gLZyx8YhUJreiIXsa2BjIKiLW54iQVQ7sLzvrky4+9TZtLWWkiT1Ov8FOahb6IDOVFIy7VFVovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MW3PR11MB4714.namprd11.prod.outlook.com (2603:10b6:303:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 05:12:54 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%3]) with mapi id 15.20.8293.000; Thu, 2 Jan 2025
 05:12:54 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>
Subject: RE: [PATCH V6] drm/xe/mmap: Add mmap support for PCI memory barrier
Thread-Topic: [PATCH V6] drm/xe/mmap: Add mmap support for PCI memory barrier
Thread-Index: AQHbUUuZ8TeAJuuNh0iXrSY1tJJzTLMCzU2AgAA5o1A=
Date: Thu, 2 Jan 2025 05:12:54 +0000
Message-ID: <SJ1PR11MB62047DC6DA6444AF684FC53E81142@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241218125628.2270030-1-tejas.upadhyay@intel.com>
 <Z3XvobR95Pnw5c+w@lstrano-desk.jf.intel.com>
In-Reply-To: <Z3XvobR95Pnw5c+w@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MW3PR11MB4714:EE_
x-ms-office365-filtering-correlation-id: 486f5b49-3ce3-44c1-a9e7-08dd2aec1cf8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?IUEDAB6Dn4fFtKVuNqSg0Xk1n9eZ2Ly+IcVyF/PeNgm490EEaIXcIkFY24J5?=
 =?us-ascii?Q?61bzH8vzkCOF5shEKKaMa4oKuYJHTMG/NeIh22j57iqYIRH9Sy47EcLGgDCZ?=
 =?us-ascii?Q?d+nWWtOKbK/RnaACRrg6AH3yoH0Y2qIU8Rw3AWYb6N0lbb1X0px4/qANzTN9?=
 =?us-ascii?Q?FANMQYJPAAXg060Ba6HPT1Xdkqa0ohYARrTIUILu5f+pFAzxZHX2SSpAaNvk?=
 =?us-ascii?Q?F5cokSRD1uWtVEvKOYyYYQO1OJfebKp08IaHh1ge6eE+p+DZdTJ9hkFuPmUg?=
 =?us-ascii?Q?85gFG0xquPb7uEBaCRhfILmUmQEZFeDI2VmxU5Dx2qAk8W/8mrRk6IkIAbx+?=
 =?us-ascii?Q?6flntAVFa5q7tlBHRS0dR61F9LD5Yv+lBqcRQ3W7SNtYYy43MN0vf8v4G4Wh?=
 =?us-ascii?Q?Z0o/IJ+gzW5v+BF68mjg0jDLGGmFCJeug1PjWIBey4rDaiybCoYoijMm1m1B?=
 =?us-ascii?Q?SSBZzHtBdNJOwj5VdQDp/F0Dc7y2cI/mymj87gZx5TH2MrBt78yYVpf0oS8D?=
 =?us-ascii?Q?OFyC2/YWeFUlxbqmtRgzC5p5NfbL5qfStExtMjHwHSdeC4lGYdO8KCZGQ1fx?=
 =?us-ascii?Q?Oa3b5/rIArUoQHWzzGa12mKPBTmBsXR+676vE7qcyYb7wEsAkQ1i9i+iu1Ho?=
 =?us-ascii?Q?JqsNtWR+PBLDnzX9UnvUf/jumgrEftIFrntCqqbi3AvH4wxfc/oJdFbqUI7x?=
 =?us-ascii?Q?XDucOYk/USm+Xu5WLOIkCRFsFz+ld/PimC6sH2WDcqQnakmg4yjxYJe4oJ+t?=
 =?us-ascii?Q?zLXewoJLpgTMgrWvEl3vlBmITNqfb/iDO+2X/kOZWqulhhv2OGB5C5f3V8I+?=
 =?us-ascii?Q?ZGdwHJ+Ya/FpyzlYBOsblktBj52b13RXippWuaP5+ghDAqiIlb95Hjdh3u5X?=
 =?us-ascii?Q?V/8UIsZ2AYCjicodO8xNrMJbJ3eqZ+mZ0EVOXqxPMnDFnOin8s6CWr0TAqOy?=
 =?us-ascii?Q?OSmrhuPfJ+9PGCnUz1yOUf0mJg99m5+M/kQ331B84EAyzqFhN36TmObRQd+K?=
 =?us-ascii?Q?BajYY+m4geS2wnX3KRrIwi3iWEe1cBHrxbfSzYBkpMB5ov3dwmEvLCiYehXX?=
 =?us-ascii?Q?+ONhLFgoywxh3kh8R0ZA6t2P4ZjJP5w7duiKZ4Qjb783aVCBtBKB3Ly/JEYc?=
 =?us-ascii?Q?YIotw4kUMKWJtZ6ITtfz7myhuZ3Wn5rdfPMuKkRQxmt1vjiR3nahXfIgNaeP?=
 =?us-ascii?Q?MQUecZlDUKlV6oj9uVcIky5KwXofs/1swJ1sgdWZWBd6ycsR5XwsqXz741K0?=
 =?us-ascii?Q?tJ1jvlSBxVnbb74jrFlmr7cD6dx7FAxWGq4z0DJaONe5GxRVIBex1eWqRwBl?=
 =?us-ascii?Q?AyIF4dNHJIiPsn8L3Vl0ST0WX2jrzB/IEMkNUhRNmxy6t94FOyZlMXgZt00V?=
 =?us-ascii?Q?JWGvRvuGO82hj3V/jLyLopU3MEu2IoLxR8LAfRf8PIap95QSpg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZNB9KtMRRSIa0X6UzqrpTFsYUgFXlWGAF/4QIHTCizp7HFQveid65+nZwae0?=
 =?us-ascii?Q?T9NoN2Y9Xb5N8Gjo6gA1vnMPzaPCGlyOpc+bq2jlDCntK+dN2MgD7bLZmqCU?=
 =?us-ascii?Q?sraaLz7+o9e+bPj5IL7rY4sDTwqKfRENxMYIGQWP4wxlM7OpMJ6VtEl3rvp5?=
 =?us-ascii?Q?C6iuQpfR7ISI3cObC8e4SdWF4fHyxAgdPZ6ZdxbcmB/EAa8AbhHF66OVaNSP?=
 =?us-ascii?Q?XdQmS13Ixtawb33ar5bbe53fX2G5I5YcIX5Ts52NoNymlkzz1raDVyWzPZwd?=
 =?us-ascii?Q?JYOc+/k1pVeKLLpRZMPaBuNhPMqVUQPtHyzrgKOxbQ9CKSedhD/n+ZI/lMQE?=
 =?us-ascii?Q?qmmZ97U6gYhqXah0rstwlS6jfyjY3T0Au9Plo0ZewZu6KmysKsWMdz/gZeyg?=
 =?us-ascii?Q?+XB6DuxGMe5dVUa765WF+vL+Qty/3JurGmtGkhtYKfEWXaCR+cNNfpnQnzbH?=
 =?us-ascii?Q?IjjfR4F+BbMS58KIpsnLpFo9Oak6mmi9OI64XULPJbSE2dMhvxipU4d0jf7Y?=
 =?us-ascii?Q?l0EZJhbYcKPtMv7rKWYPFC2H7xjIzrIwQbg5dt1trvn8TfHfHor6hxWpOVUi?=
 =?us-ascii?Q?7TnjsWu4ia0VAH8omu3eA80eBTeC+ZumlSLwci8745OtRgNiSONGP+LiKZC9?=
 =?us-ascii?Q?zeaQtS63G7biGT36HQ3JZDlTcg5uDTyNBr9u2g9kkkuvva/REQjyofYVzNZ/?=
 =?us-ascii?Q?8wmyeDsDmIAgeDJcH3jC2GUgZAeSZ8k1kjmjmZfTQP5TOhqCr7WnDwCHdpcY?=
 =?us-ascii?Q?QetGzdXqZujjorB0Y+YhGpNwyMxK0rSj+WJB30dUeJTUPUAZTm/kjW69e1tD?=
 =?us-ascii?Q?hwDGTujRW0/98L6Iqs3Sk7UmuoVMVPpIIXzA3KZa03szZkMYHzbH/qfgWXda?=
 =?us-ascii?Q?VfxL64/UrHG7PD5ZMA0ERtgnT6X9LqTaDxL+6JkLaDJMeP5+PIWG4PC4jVfL?=
 =?us-ascii?Q?LdmtkBi0PViIezns2PVr1b/zuFquA5DwfP4+wosCAH87I9cbf3V7tKVQ8tkb?=
 =?us-ascii?Q?sE7Kjef3G0i92Sxx7FeGvR5Nd8k3HtfZ5gYEbouh9tyLxxlzIwmYG0jblexP?=
 =?us-ascii?Q?mQolJYi230v7SnWsrZoxUnDTacR8Dc1uugDqpS2MCmH/iQY4fg8LFT2ZihMK?=
 =?us-ascii?Q?HySsSCF+WY5WHjsrdNVtwnzw6aw02Cj+8C7BdqLeRR/oTuby7dxxvnlviP8+?=
 =?us-ascii?Q?nK21FxW6cn3a2ilEASCWoKh1JLckCH1v2G7pgDMP3QKOlNPUO86DwwtNnnV2?=
 =?us-ascii?Q?an/fpNxbIaFgXChrGOCat6iclVf9Zqe74sk7kQiVdBvnJUEd0DjKcoJRuHDY?=
 =?us-ascii?Q?YWYqI254dSRNB+D8f5l8cmsStHZvB+uc7p/2X/hie6O+LC/l9Xdd6iR6TqDU?=
 =?us-ascii?Q?BJSEEvui+L0VzE9RoLtObn/IrbimIAB4Ho/5JsTi+QdjzCRZno5zexYBNpqD?=
 =?us-ascii?Q?akvbnjJY4un6/Ldh4roJXZ1vzsB+P+i92LlOyUcfUJnI4NGvjFGeDPfJR55d?=
 =?us-ascii?Q?TJB9FOcPDW2giIMnsyIuxOGx08vMkkH2WhVnuo7WkcmTrR4pwCl4QH9VGT8E?=
 =?us-ascii?Q?e38iVAwTdKp2PpCVXtFofFEAjWIP8xW4vt/dJcyB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 486f5b49-3ce3-44c1-a9e7-08dd2aec1cf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 05:12:54.3105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VmJUMHQfa3wrp9twEtWpRzk7f6QPOosNs36897AejHFeLPAp+eJ0pz7zo00Km3bIXjXPABvzA1Twbas+8LKzfsLbzmTrJdLgvKiBZdV2nZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4714
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



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Thursday, January 2, 2025 7:15 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> christian.koenig@amd.com; Auld, Matthew <matthew.auld@intel.com>;
> Mrozek, Michal <michal.mrozek@intel.com>
> Subject: Re: [PATCH V6] drm/xe/mmap: Add mmap support for PCI memory
> barrier
>=20
> On Wed, Dec 18, 2024 at 06:26:28PM +0530, Tejas Upadhyay wrote:
> > In order to avoid having userspace to use MI_MEM_FENCE, we are adding
> > a mechanism for userspace to generate a PCI memory barrier with low
> > overhead (avoiding IOCTL call as well as writing to VRAM will adds
> > some overhead).
> >
> > This is implemented by memory-mapping a page as uncached that is
> > backed by MMIO on the dGPU and thus allowing userspace to do memory
> > write to the page without invoking an IOCTL.
> > We are selecting the MMIO so that it is not accessible from the PCI
> > bus so that the MMIO writes themselves are ignored, but the PCI memory
> > barrier will still take action as the MMIO filtering will happen after
> > the memory barrier effect.
> >
> > When we detect special defined offset in mmap(), We are mapping 4K
> > page which contains the last of page of doorbell MMIO range to
> > userspace for same purpose.
> >
> > For user to query special offset we are adding special flag in
> > mmap_offset ioctl which needs to be passed as follows, struct
> > drm_xe_gem_mmap_offset mmo =3D {
> >         .handle =3D 0, /* this must be 0 */
> >         .flags =3D DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> > };
> > igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo); map =3D
> mmap(NULL,
> > size, PROT_WRITE, MAP_SHARED, fd, mmo);
> >
> > Note: Test coverage for this is added by IGT
> >       https://patchwork.freedesktop.org/series/140368/  here.
> >       UMD implementing test, once PR is ready will attach with
> >       this patch.
> >
> > V6(MAuld)
> >   - Move physical mmap to fault handler
> >   - Modify kernel-doc and attach UMD PR when ready
> > V5(MAuld)
> >   - Return invalid early in case of non 4K PAGE_SIZE
> >   - Format kernel-doc and add note for 4K PAGE_SIZE HW limit
> > V4(MAuld)
> >   - Add kernel-doc for uapi change
> >   - Restrict page size to 4K
> > V3(MAuld)
> >   - Remove offset defination from UAPI to be able to change later
> >   - Edit commit message for special flag addition
> > V2(MAuld)
> >   - Add fault handler with dummy page to handle unplug device
> >   - Add Build check for special offset to be below normal start page
> >   - Test d3hot, mapping seems to be valid in d3hot as well
> >   - Add more info to commit message
> >
> > Test-with: 20241118113606.1490397-1-tejas.upadhyay@intel.com
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Michal Mrozek <michal.mrozek@intel.com>
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>=20
> Do we need a query to see if the Xe driver has this uAPI?

Currently, I have though of using below to check driver support for this UA=
PI,
+static bool is_pci_membarrier_supported(int fd)
+{
+       struct drm_xe_gem_mmap_offset mmo =3D {
+               .handle =3D 0,
+               .flags =3D DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
+       };
+
+       return (igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo) =3D=3D 0)=
;
+}

IGT already using this. Please let me know if it makes sense.

Tejas
>=20
> Matt
>=20
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c     |  16 ++++-
> >  drivers/gpu/drm/xe/xe_bo.h     |   2 +
> >  drivers/gpu/drm/xe/xe_device.c | 103
> ++++++++++++++++++++++++++++++++-
> >  include/uapi/drm/xe_drm.h      |  29 +++++++++-
> >  4 files changed, 147 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index e6c896ad5602..86f2c00a0afd 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -2263,9 +2263,23 @@ int xe_gem_mmap_offset_ioctl(struct
> drm_device *dev, void *data,
> >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> >  		return -EINVAL;
> >
> > -	if (XE_IOCTL_DBG(xe, args->flags))
> > +	if (XE_IOCTL_DBG(xe, args->flags &
> > +			 ~DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER))
> >  		return -EINVAL;
> >
> > +	if (args->flags & DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER) {
> > +		if (XE_IOCTL_DBG(xe, args->handle))
> > +			return -EINVAL;
> > +
> > +		if (XE_IOCTL_DBG(xe, PAGE_SIZE > SZ_4K))
> > +			return -EINVAL;
> > +
> > +		BUILD_BUG_ON(((XE_PCI_BARRIER_MMAP_OFFSET >>
> XE_PTE_SHIFT) +
> > +			      SZ_4K) >=3D DRM_FILE_PAGE_OFFSET_START);
> > +		args->offset =3D XE_PCI_BARRIER_MMAP_OFFSET;
> > +		return 0;
> > +	}
> > +
> >  	gem_obj =3D drm_gem_object_lookup(file, args->handle);
> >  	if (XE_IOCTL_DBG(xe, !gem_obj))
> >  		return -ENOENT;
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index d9386ab03140..04995c5ced32 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -75,6 +75,8 @@
> >
> >  #define XE_BO_PROPS_INVALID	(-1)
> >
> > +#define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
> > +
> >  struct sg_table;
> >
> >  struct xe_bo *xe_bo_alloc(void);
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c index 7f021ec5f8e7..bacfeec9dc0b
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -232,12 +232,113 @@ static long xe_drm_compat_ioctl(struct file
> > *file, unsigned int cmd, unsigned lo  #define xe_drm_compat_ioctl NULL
> > #endif
> >
> > +static void barrier_open(struct vm_area_struct *vma) {
> > +	drm_dev_get(vma->vm_private_data);
> > +}
> > +
> > +static void barrier_close(struct vm_area_struct *vma) {
> > +	drm_dev_put(vma->vm_private_data);
> > +}
> > +
> > +static void barrier_release_dummy_page(struct drm_device *dev, void
> > +*res) {
> > +	struct page *dummy_page =3D (struct page *)res;
> > +
> > +	__free_page(dummy_page);
> > +}
> > +
> > +static vm_fault_t barrier_fault(struct vm_fault *vmf) {
> > +	struct drm_device *dev =3D vmf->vma->vm_private_data;
> > +	struct vm_area_struct *vma =3D vmf->vma;
> > +	vm_fault_t ret =3D VM_FAULT_NOPAGE;
> > +	pgprot_t prot;
> > +	int idx;
> > +
> > +	prot =3D vm_get_page_prot(vma->vm_flags);
> > +
> > +	if (drm_dev_enter(dev, &idx)) {
> > +		unsigned long pfn;
> > +
> > +#define LAST_DB_PAGE_OFFSET 0x7ff001
> > +		pfn =3D PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0)
> +
> > +				LAST_DB_PAGE_OFFSET);
> > +		ret =3D vmf_insert_pfn_prot(vma, vma->vm_start, pfn,
> > +					  pgprot_noncached(prot));
> > +		drm_dev_exit(idx);
> > +	} else {
> > +		struct page *page;
> > +
> > +		/* Allocate new dummy page to map all the VA range in this
> VMA to it*/
> > +		page =3D alloc_page(GFP_KERNEL | __GFP_ZERO);
> > +		if (!page)
> > +			return VM_FAULT_OOM;
> > +
> > +		/* Set the page to be freed using drmm release action */
> > +		if (drmm_add_action_or_reset(dev,
> barrier_release_dummy_page, page))
> > +			return VM_FAULT_OOM;
> > +
> > +		ret =3D vmf_insert_pfn_prot(vma, vma->vm_start,
> page_to_pfn(page),
> > +					  prot);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct vm_operations_struct vm_ops_barrier =3D {
> > +	.open =3D barrier_open,
> > +	.close =3D barrier_close,
> > +	.fault =3D barrier_fault,
> > +};
> > +
> > +static int xe_pci_barrier_mmap(struct file *filp,
> > +			       struct vm_area_struct *vma) {
> > +	struct drm_file *priv =3D filp->private_data;
> > +	struct drm_device *dev =3D priv->minor->dev;
> > +
> > +	if (vma->vm_end - vma->vm_start > SZ_4K)
> > +		return -EINVAL;
> > +
> > +	if (is_cow_mapping(vma->vm_flags))
> > +		return -EINVAL;
> > +
> > +	if (vma->vm_flags & (VM_READ | VM_EXEC))
> > +		return -EINVAL;
> > +
> > +	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
> > +	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND |
> VM_DONTDUMP | VM_IO);
> > +	vma->vm_ops =3D &vm_ops_barrier;
> > +	vma->vm_private_data =3D dev;
> > +	drm_dev_get(vma->vm_private_data);
> > +
> > +	return 0;
> > +}
> > +
> > +static int xe_mmap(struct file *filp, struct vm_area_struct *vma) {
> > +	struct drm_file *priv =3D filp->private_data;
> > +	struct drm_device *dev =3D priv->minor->dev;
> > +
> > +	if (drm_dev_is_unplugged(dev))
> > +		return -ENODEV;
> > +
> > +	switch (vma->vm_pgoff) {
> > +	case XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT:
> > +		return xe_pci_barrier_mmap(filp, vma);
> > +	}
> > +
> > +	return drm_gem_mmap(filp, vma);
> > +}
> > +
> >  static const struct file_operations xe_driver_fops =3D {
> >  	.owner =3D THIS_MODULE,
> >  	.open =3D drm_open,
> >  	.release =3D drm_release_noglobal,
> >  	.unlocked_ioctl =3D xe_drm_ioctl,
> > -	.mmap =3D drm_gem_mmap,
> > +	.mmap =3D xe_mmap,
> >  	.poll =3D drm_poll,
> >  	.read =3D drm_read,
> >  	.compat_ioctl =3D xe_drm_compat_ioctl, diff --git
> > a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> > f62689ca861a..cac607a30f6d 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -811,6 +811,32 @@ struct drm_xe_gem_create {
> >
> >  /**
> >   * struct drm_xe_gem_mmap_offset - Input of
> > &DRM_IOCTL_XE_GEM_MMAP_OFFSET
> > + *
> > + * The @flags can be:
> > + *  - %DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER - For user to query
> > + special offset
> > + *  for use in mmap ioctl. Writing to the returned mmap address will
> > + generate a
> > + *  PCI memory barrier with low overhead (avoiding IOCTL call as well
> > + as writing
> > + *  to VRAM which would also add overhead), acting like an
> > + MI_MEM_FENCE
> > + *  instruction.
> > + *
> > + *  Note: The mmap size can be at most 4K, due to HW limitations. As
> > + a result
> > + *  this interface is only supported on CPU architectures that
> > + support 4K page
> > + *  size. The mmap_offset ioctl will detect this and gracefully
> > + return an
> > + *  error, where userspace is expected to have a different fallback
> > + method for
> > + *  triggering a barrier.
> > + *
> > + *  Roughly the usage would be as follows:
> > + *
> > + *  .. code-block:: C
> > + *
> > + *  struct drm_xe_gem_mmap_offset mmo =3D {
> > + *	.handle =3D 0, // must be set to 0
> > + *	.flags =3D DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> > + *  };
> > + *
> > + *  err =3D ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> > + *  map =3D mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> > + *  map[i] =3D 0xdeadbeaf; // issue barrier
> >   */
> >  struct drm_xe_gem_mmap_offset {
> >  	/** @extensions: Pointer to the first extension struct, if any */ @@
> > -819,7 +845,8 @@ struct drm_xe_gem_mmap_offset {
> >  	/** @handle: Handle for the object being mapped. */
> >  	__u32 handle;
> >
> > -	/** @flags: Must be zero */
> > +#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER     (1 << 0)
> > +	/** @flags: Flags */
> >  	__u32 flags;
> >
> >  	/** @offset: The fake offset to use for subsequent mmap call */
> > --
> > 2.34.1
> >
