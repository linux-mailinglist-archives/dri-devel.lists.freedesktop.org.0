Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FF7BEEB47
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 20:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBD310E224;
	Sun, 19 Oct 2025 18:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UH553tGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4FD10E159;
 Sun, 19 Oct 2025 18:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760898428; x=1792434428;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=LcQjMjLNo6ki3fnGsSLTxuiP42e8t7pteg2/nH3YjpY=;
 b=UH553tGJ+MNiqxZPAJxfhaIzUEklBY7u9m9Yb/ipLdjGq93SZUH6rXSG
 8VK4IY1RmeIW809FXNLl+2QiT+SYkh91oj6+KvH7OzL1toCljJNzhnl+n
 13SfgLT7O2a72kxrh7kxG8eq1sssTMoCPgh6GnXurpckTQT3F2CcnTgAj
 uG9rnFLU7yej82J1qDiudPaS0my27G44NgDyk9bMvI78aOTHdrDD8L7an
 AWLXcf8fPD1h5dLoARtIPpY9nUeYJiWVTqqCnnp0JhwTcjzjTIfPLVQEj
 iYnoiXUs4PFEcvZrU7PlfZqUyYbp2rREszqKORmUpptQMofaJolCAkVXg g==;
X-CSE-ConnectionGUID: 02zd3+crSvO7ThLrcd9VwQ==
X-CSE-MsgGUID: aGugyvZhQvGCV2JlK2f6cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="73637134"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; d="scan'208";a="73637134"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 11:27:07 -0700
X-CSE-ConnectionGUID: n49ZzVx+Qemj9JQMdHVPSg==
X-CSE-MsgGUID: cSsQgSfQSZG05BAebhNBXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; d="scan'208";a="187583303"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 11:27:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 19 Oct 2025 11:27:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 19 Oct 2025 11:27:04 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 19 Oct 2025 11:27:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiRz8+AE0WeaAL+pQ30nNrSmID7FqmkzznOLb/sw/QBRWzHFS8tq9lm2tNcHA3pBL/S8GiVQgi56I2L5negUrT2ZVHzZ+CyRhX/Iytese7CIFclJjNZG7eAD1bftVjeMiXr35usy2WPNeZOxO9G8mWim8hMKHkoZJmqj8LX1vY5SxFzIzIoOnLVii9MzoXx+NRDzxTT8Rd2zFOePv0cz/8GEI8Xuq9WSDuqp8gXvyAWvv1LA2PT4uDrJGyKGiTeGzEacMr3QSGwHvw+suj29P9DCAvFOsnqFRisSrAGCbHl/URoDjxcU90PdKIVBMvuq5NL3XfSg0bUnDD5KOpSuGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKEs0jIWDrBVhkWUUALwEDJM0ZoYmG1LpTJ1UIDvII4=;
 b=gVR5q2bqGQ0PdAfbfToXUWFLwvkRssQzoMzjgr8Iq4Xek0BzWQfAh7+wPzqh3M8RHehX0MrSsO0vz4qIL8d3P4dXPYwkMgUhHWe/FQyYXAG/GpXaMkxjzkQmeuyF09ezdEdzCHEOysbXTX4gWgjmLu+XZU+qYb6hl2GrEFXypn7RrcPw776UaM2cO4FJftv9bxPX+RmmtnEbgx1VaSOFa8bng0zGNZjMZTRZ7VOpx7WEeIHb57aeM8ZxonFZ/fWJ1GnTM334bq9uskMHk1w9jczoGBg5sAFwNt+33IlOqBIzT63V/WZnrOtTsEiWpXiI7njRsZLdy0+ZPP3+GkddqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MN0PR11MB6033.namprd11.prod.outlook.com (2603:10b6:208:374::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Sun, 19 Oct
 2025 18:27:01 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9228.015; Sun, 19 Oct 2025
 18:27:01 +0000
Date: Sun, 19 Oct 2025 21:26:55 +0300
From: Imre Deak <imre.deak@intel.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, Simona Vetter <simona@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>, <tursulin@ursulin.net>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <jani.nikula@linux.intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, <alok.a.tiwarilinux@gmail.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [bug-report] i915 DMC assert crash on HDMI hotplug
Message-ID: <aPUtb50BDUOgSg8N@ideak-desk>
References: <33db45cc-c007-4a72-9303-7690d6818e73@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <33db45cc-c007-4a72-9303-7690d6818e73@oracle.com>
X-ClientProxiedBy: DUZPR01CA0219.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::16) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MN0PR11MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: fcae181f-5205-47f0-f883-08de0f3d18b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|7416014|366016; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oZaLApPXjcJswTPW1dOjj96Cn7cuGcvbgU4qmwgByyjT4ORr2iM8RRCTH5Qm?=
 =?us-ascii?Q?NaCEG2kdEWzNyLty6tzJBHp+bKWE00KyPu7qKCS8s/Vm2QCNuZjiLkpr/B+r?=
 =?us-ascii?Q?APzB9wog45VJAdOBPa7kuGvzsMgiorQoUl8TA2gZe5XZYbZlugrsteHXewtS?=
 =?us-ascii?Q?+db+WaT/BLrWuyhZregkYUvmTIIp+6q2E+SEQ2l71uV2IV8S1XUlCG2Bpuis?=
 =?us-ascii?Q?7YfW3cb3KvCRYD0I5aEA4YJNbJtwdqH1hTmadAPeKJUC4KTKzQihdjJATCVs?=
 =?us-ascii?Q?nq/1GDn1fvvfKg3OfeGsxirgkBJNL2tcVg931AZwxK1rz2SZCMc4jz4rh8T2?=
 =?us-ascii?Q?e0GKxKk7bKRsG1uwqWV5p+Min56AOxpP8V3xTmjNg4fbCvutbdsYqEXHYF11?=
 =?us-ascii?Q?PEHjQXxfk3U7gy5HaH+n1Q1JP5Vrqs/OlFBC34cgE4mN3lLi916UDr3hqosd?=
 =?us-ascii?Q?h1mQGcfh1jyKl8FRiysQs6ViiE3TPY+UsxFyL4kOg2Yma6PbBLCPiHQABioy?=
 =?us-ascii?Q?z2nJ6VEcV8nTU70cnaTDyTBY/IHed3db4IgMOhEsHzpsjDDXzfreyhFFpJMP?=
 =?us-ascii?Q?hvX2JGnLaK4qMO5/2aHx6SYeyS7Ay0NGibYcC0bvno4b2FErfONPpwlULz5F?=
 =?us-ascii?Q?Sgi4SVJp5wXYBuLYWBiNrAh1bN0FOFpX1wCyn5Cg3vP4yZUSw0ip71FVYBoC?=
 =?us-ascii?Q?FcJ76/jTBvTPq5l+Ent7cY+UAFn0xh/OypYPq0ZnwMBV5ammB9oBP+4p+kP9?=
 =?us-ascii?Q?LrAbgUETCD+2t9wDcBLNaar9SSlQTJjXYGxXD0g0uxNBBiDW/lJc0yxKQqL+?=
 =?us-ascii?Q?z15gpwMNOyXgPcM7el7TXFDGXnjSb9IDBHiU4jzjLTbFpWIkwUeNDvKsfnL/?=
 =?us-ascii?Q?PD9ixQvOAjchr6HfnmDi63PxfKALlA3El8jnQVmatS2LZfT6cdhVybjVf/xK?=
 =?us-ascii?Q?wMy9nPA0TEEwEzYUA2tN8Bq8LfhzdICjXaYaMSjki8eOMRH3zi0F86I/7rw3?=
 =?us-ascii?Q?LClEwHnwYPFmlHqgeUC5eQHE4WwknTTmQqI82gTKrNunUcazJbZiQ3yjlbb9?=
 =?us-ascii?Q?tXtPSjGqF0gt+TqLvIMPQxXdlIEmNhqtM+7Z4JfhhNisvJnd0y4VWqaik9dS?=
 =?us-ascii?Q?UJ4+Vy0YSgu89fxY4rs05r+k07+4+mONiI8rBLUODMSlBvT0XZ1kwLaM12bj?=
 =?us-ascii?Q?75wa7w9cNv/8AxPdPTWd/uzzV6JdnQ3e72WLnmVGfYFYgiqYzECgye2uIk97?=
 =?us-ascii?Q?4g/eg6qwo7E8MzURdVuZ8LNlGeABJbyJLx2ONC+fvlLLpDWw3d0klt+TRcXn?=
 =?us-ascii?Q?i5SGAOdgu8JaC3vqqG7ta8S7jsum04BtBVGFd4mypoTBUzA60NXptu36Bza+?=
 =?us-ascii?Q?DK1ks2jlXU2Bk2llsAFihTjH13ppsWrcG0S3FXW2IFQtPlS8+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(7416014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?axU3wnPZlhs7Ci5iKa4Vhql9iG5EGUvN4dpvhh7oJyDmOGmJMiVvzeyBTKQC?=
 =?us-ascii?Q?bs8gxcfE4yNuUxIDGl53aDaJcfsOB8jfH11dlSOYZui08y3d82S6bL5hjCBt?=
 =?us-ascii?Q?BS8piTXb2JTb06aoyeVL9f1pILn1z6Ll0hBE/kkUlB+IUHTCNO/zb7TeAmSI?=
 =?us-ascii?Q?uigrx4WUJ2i42r7zMDZviKka5H+myNrGBTjeTlHQijkRb5WlR8SjyQMObW/A?=
 =?us-ascii?Q?QIhdTSiAgPXZIU0R0oOv5Wwc8ZQjFyBa+d8pi7ZcSYOHXzI8HnjCYi/Jh0yJ?=
 =?us-ascii?Q?TtZqPw6GAy50Hj08vhhVixsNJJJ5tFCAa0JlH25ikf9FjcWpqfBXueNp6PWM?=
 =?us-ascii?Q?/No9JCqrRCuCPkisI1ykUasiROWHvhUpWn3AlzbNeKYKJb5WwPdO/PQKCZp4?=
 =?us-ascii?Q?zZid+r1gXIg3ZySdSoWveANeJwXakHSlAblfYS4j3gbJliBesPtIcTBLdKf1?=
 =?us-ascii?Q?qME+MJaBNqjDFSkTpcKlgsp/6OGgaBXDMegF5aBlMqUprveNWXSoim68Nc8R?=
 =?us-ascii?Q?HlliuY2QuMCsDfJlw0cj0MJlYBlrfIKkKPZFrN26vWpVwlk4bTn1CIICS+zr?=
 =?us-ascii?Q?Fb9NfZO9dsI+qI+iuGZ9s2wgBxuK9KFwExniccYxqYyZDXyteKNK/njxfY6x?=
 =?us-ascii?Q?iqvUApKFmKJprBKC8njth9X5jNLZ4sXbnjPdY3ivXxHmgAjwHUVRhOSD2XQa?=
 =?us-ascii?Q?Nnd787I/nEFThpkK47xN9zVWEarz8qo/41TCq6ocEO5jZ6fklburM5ze1kSQ?=
 =?us-ascii?Q?3Ne6HEDS0Pvhv8b/YWhZa0E1dR4QzBpMHpP+V9UU4agyJoaEwKhkovUf5RA/?=
 =?us-ascii?Q?HJ7pFFs2vcZN26C9fh235mw7wyBNCRPrSU47y4CUlAk0Zu1XpkpDd+urTu0l?=
 =?us-ascii?Q?C6Bcx7ag/m8xJafKa7EJjqzl2T6uEOBi7ttc+t3pcdvUfJXJfYS0MPC4/ZyA?=
 =?us-ascii?Q?9yRXMePMZADJ+2P1JdsUaEY3gFFA3ofWqDH2a0LO0yfZ1O7Ykui7uau4/KGK?=
 =?us-ascii?Q?ZPnlkfF4EHL72YptGmpLH977ntgxtJvnNxEhyG2l4KRS+3EknoPE0Q31o7NT?=
 =?us-ascii?Q?ypKv0RBLjFa1frVVf/u2nRbS1eRx2xyEsiVoilwHq+Tc9KzIRUlxyBLr/fPY?=
 =?us-ascii?Q?U8Gs00rlvR7E6cPZY2OHRZKDI+1hzNF/+cI6iNE7k9yYQU5e46vhqVhPNKV8?=
 =?us-ascii?Q?bNeTKqfUBrv45oOs0xQOTSC/JYxWuCKNeTDCtqTCfKB/lpZagjQmPpdmn5zu?=
 =?us-ascii?Q?rXgHw3UusA4mkNlJmRPYFEdaOCCLdl3oMRv57oeLO+q6UE0Gy4qyNngpXI+E?=
 =?us-ascii?Q?x+Qm8rzqPd94ejmCLijLFhznCx75IDXN+PxoC0dN2ls0aY7Yhpm+0pzczieW?=
 =?us-ascii?Q?I3zttmkze5608NkNy2VFI8JK9fYZ5aPnM/x6OD7EzSl93CN9OIKb551WRSFA?=
 =?us-ascii?Q?TvxkB9/d+cEeH9gCweZCyedLKzAVhdkW7RZsNrgArw7M7mn9vbDocghGazOH?=
 =?us-ascii?Q?SPUsc7ikn43qk2YaV5WP7QXQFo/ZpeN/FQR4+/qGtVIiQ9KWg84KNnF35/wE?=
 =?us-ascii?Q?il1r4wGCwHRfDpjXGr/wuSWGD48+I6fZyhzgvzcF7UkW3sZigCDxNXDHnMMM?=
 =?us-ascii?Q?QTQWF2EMl+QwdP16Ck5i5lMEODOXwwENcJYZucBLnBcy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcae181f-5205-47f0-f883-08de0f3d18b7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2025 18:27:01.7739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5s5DlUR7jgoXGsT219KijGYzQwnj1y2bGHRzcWjPxDxJIVRsyi7bMV7RUoGHLxP2dcJ++rr3pzMMS8n5SVPrgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6033
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 19, 2025 at 07:51:08PM +0530, ALOK TIWARI wrote:
> Hi,
> 
> On a Lenovo 12TECTO1WW HW (BIOS M5HKT1DA), the i915 DRM driver triggers a
> DMC firmware assertion
> when connecting or disconnecting an HDMI display. The GPU firmware (DMC)
> registers show incorrect
> values, causing assert_dmc_loaded() to warn in intel_dmc.c.
> 
> This occurs on kernel 6.18-rc1 and appears related to DMC power and hotplug
> handling.
> 
> Kernel: 6.18.0-rc1

This looks like
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15153

Could you attach a dmesg log to the above ticket booting with the
drm.debug=0xe kernel parameter and reproducing the problem?

> 
> ---
> 
> [  130.665424] audit: type=1326 audit(1760882657.655:78): auid=1001 uid=1001
> gid=1001 ses=3 subj=snap.snapd-desktop-integration.snapd-desktop-integration
> pid=2408 comm="snapd-desktop-i"
> exe="/snap/snapd-desktop-integration/315/usr/bin/snapd-desktop-integration"
> sig=0 arch=c000003e syscall=203 compat=0 ip=0x7e4ba6bc4531 code=0x50000
> [  131.287051] nvme nvme0: using unchecked data buffer
> intel_dmcintel_dmc[  218.492264] ------------[ cut here ]------------
> [  218.492268] i915 0000:00:02.0: [drm] DMC 0 mmio[5]/0x8f03c incorrect
> (expected 0x30100, current 0x0)
> [  218.492292] WARNING: CPU: 6 PID: 409 at
> drivers/gpu/drm/i915/display/intel_dmc.c:645 assert_dmc_loaded+0x2c1/0x420
> [i915]
> [  218.492455] Modules linked in: rfcomm ccm cmac algif_hash algif_skcipher
> af_alg xe snd_hda_codec_intelhdmi drm_gpuvm drm_gpusvm_helper
> snd_hda_codec_alc269 gpu_sched snd_hda_scodec_component drm_ttm_helper
> snd_hda_codec_realtek_lib drm_exec snd_hda_codec_generic drm_suballoc_helper
> intel_uncore_frequency intel_uncore_frequency_common i915 snd_hda_intel
> snd_sof_pci_intel_tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic
> soundwire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common
> snd_soc_hdac_hda snd_sof_intel_hda_mlink snd_sof_intel_hda
> snd_hda_codec_hdmi soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof
> iwlmvm snd_sof_utils snd_soc_acpi_intel_match bnep
> snd_soc_acpi_intel_sdca_quirks soundwire_generic_allocation snd_soc_acpi
> soundwire_bus x86_pkg_temp_thermal snd_soc_sdca intel_powerclamp mac80211
> crc8 snd_soc_avs snd_soc_hda_codec snd_hda_ext_core snd_hda_codec coretemp
> kvm_intel snd_hda_core snd_intel_dspcfg snd_intel_sdw_acpi snd_hwdep
> snd_soc_core kvm libarc4 snd_compress iwlwifi ac97_bus
> [  218.492496]  snd_pcm_dmaengine snd_pcm snd_seq_midi snd_seq_midi_event
> snd_rawmidi binfmt_misc snd_seq cmdlinepart processor_thermal_device_pci
> btusb processor_thermal_device spi_nor snd_seq_device btmtk
> processor_thermal_wt_hint drm_buddy platform_temperature_control snd_timer
> btrtl irqbypass ttm processor_thermal_soc_slider polyval_clmulni
> nls_iso8859_1 ghash_clmulni_intel platform_profile btbcm aesni_intel
> mei_hdcp think_lmi processor_thermal_rfim btintel mei_pxp rapl snd
> intel_rapl_msr processor_thermal_rapl cfg80211 bluetooth
> firmware_attributes_class input_leds drm_display_helper intel_cstate mtd
> mei_me joydev wmi_bmof intel_rapl_common soundcore cec ecdh_generic
> processor_thermal_wt_req ecc mei rc_core processor_thermal_power_floor
> intel_pmc_core i2c_algo_bit processor_thermal_mbox pmt_telemetry
> pmt_discovery pmt_class intel_pmc_ssram_telemetry int3400_thermal
> int3403_thermal intel_vsec acpi_thermal_rel int340x_thermal_zone acpi_pad
> acpi_tad mac_hid sch_fq_codel msr parport_pc ppdev lp parport efi_pstore
> [  218.492543]  autofs4 btrfs blake2b_generic raid10 raid456
> async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq
> raid1 raid0 hid_generic usbhid nvme i2c_i801 e1000e nvme_core hid i2c_mux
> nvme_keyring i2c_smbus ahci spi_intel_pci nvme_auth spi_intel libahci hkdf
> video wmi
> [  218.492563] CPU: 6 UID: 0 PID: 409 Comm: kworker/u32:8 Not tainted
> 6.18.0-rc1 #3 PREEMPT(voluntary)
> [  218.492566] Hardware name: LENOVO 12TECTO1WW/3355, BIOS M5HKT1DA
> 06/17/2025
> [  218.492568] Workqueue: events_unbound intel_display_power_put_async_work
> [i915]
> [  218.492706] RIP: 0010:assert_dmc_loaded+0x2c1/0x420 [i915]
> [  218.492840] Code: 55 a8 e8 52 2d 9c cf 44 8b 45 cc 8b 4d bc 45 89 e9 48
> 89 c6 8b 45 c8 48 8b 55 a8 48 c7 c7 28 7e db c1 50 41 56 e8 9f 19 e4 ce <0f>
> 0b 58 5a e9 92 fe ff ff 48 8b 17 eb c6 48 8b 3b 48 85 ff 74 04
> [  218.492842] RSP: 0018:ffffd04682ff7c48 EFLAGS: 00010246
> [  218.492844] RAX: 0000000000000000 RBX: ffff8ef885a22000 RCX:
> 0000000000000000
> [  218.492845] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
> 0000000000000000
> [  218.492846] RBP: ffffd04682ff7cb0 R08: 0000000000000000 R09:
> 0000000000000000
> [  218.492847] R10: 0000000000000000 R11: 0000000000000000 R12:
> 0000000000000000
> [  218.492848] R13: 000000000008f03c R14: 0000000000030100 R15:
> 0000000000000005
> [  218.492850] FS:  0000000000000000(0000) GS:ffff8efc32794000(0000)
> knlGS:0000000000000000
> [  218.492851] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  218.492852] CR2: 000075deec01b098 CR3: 00000001fba40006 CR4:
> 0000000000f72ef0
> [  218.492854] PKRU: 55555554
> [  218.492855] Call Trace:
> [  218.492856]  <TASK>
> [  218.492860]  assert_main_dmc_loaded+0x10/0x20 [i915]
> [  218.492990]  skl_enable_dc6+0xad/0x230 [i915]
> [  218.493113]  gen9_dc_off_power_well_disable+0xb8/0xd0 [i915]
> [  218.493244]  intel_power_well_disable+0x67/0x80 [i915]
> [  218.493394]  intel_power_well_put+0x4b/0xc0 [i915]
> [  218.493523]  __intel_display_power_put_domain+0xc7/0x1d0 [i915]
> [  218.493649]  release_async_put_domains+0x5b/0x90 [i915]
> [  218.493774]  intel_display_power_put_async_work+0x6b/0x170 [i915]
> [  218.493896]  process_one_work+0x1a1/0x3f0
> [  218.493901]  worker_thread+0x2ba/0x3d0
> [  218.493904]  kthread+0x107/0x220
> [  218.493906]  ? __pfx_worker_thread+0x10/0x10
> [  218.493908]  ? __pfx_kthread+0x10/0x10
> [  218.493910]  ret_from_fork+0x202/0x230
> [  218.493912]  ? __pfx_kthread+0x10/0x10
> [  218.493914]  ret_from_fork_asm+0x1a/0x30
> [  218.493918]  </TASK>
> [  218.493919] ---[ end trace 0000000000000000 ]---
> [  218.493921] ------------[ cut here ]------------
> [  218.493921] i915 0000:00:02.0: [drm] DMC 0 mmio[6]/0x8f00c incorrect
> (expected 0x40b8408c, current 0x0)
> [  218.493937] WARNING: CPU: 6 PID: 409 at
> drivers/gpu/drm/i915/display/intel_dmc.c:645 assert_dmc_loaded+0x2c1/0x420
> [i915]
> [  218.494063] Modules linked in: rfcomm ccm cmac algif_hash algif_skcipher
> af_alg xe snd_hda_codec_intelhdmi drm_gpuvm drm_gpusvm_helper
> snd_hda_codec_alc269 gpu_sched snd_hda_scodec_component drm_ttm_helper
> snd_hda_codec_realtek_lib drm_exec snd_hda_codec_generic drm_suballoc_helper
> intel_uncore_frequency intel_uncore_frequency_common i915 snd_hda_intel
> snd_sof_pci_intel_tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic
> soundwire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common
> snd_soc_hdac_hda snd_sof_intel_hda_mlink snd_sof_intel_hda
> snd_hda_codec_hdmi soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof
> iwlmvm snd_sof_utils snd_soc_acpi_intel_match bnep
> snd_soc_acpi_intel_sdca_quirks soundwire_generic_allocation snd_soc_acpi
> soundwire_bus x86_pkg_temp_thermal snd_soc_sdca intel_powerclamp mac80211
> crc8 snd_soc_avs snd_soc_hda_codec snd_hda_ext_core snd_hda_codec coretemp
> kvm_intel snd_hda_core snd_intel_dspcfg snd_intel_sdw_acpi snd_hwdep
> snd_soc_core kvm libarc4 snd_compress iwlwifi ac97_bus
> [  218.494101]  snd_pcm_dmaengine snd_pcm snd_seq_midi snd_seq_midi_event
> snd_rawmidi binfmt_misc snd_seq cmdlinepart processor_thermal_device_pci
> btusb processor_thermal_device spi_nor snd_seq_device btmtk
> processor_thermal_wt_hint drm_buddy platform_temperature_control snd_timer
> btrtl irqbypass ttm processor_thermal_soc_slider polyval_clmulni
> nls_iso8859_1 ghash_clmulni_intel platform_profile btbcm aesni_intel
> mei_hdcp think_lmi processor_thermal_rfim btintel mei_pxp rapl snd
> intel_rapl_msr processor_thermal_rapl cfg80211 bluetooth
> firmware_attributes_class input_leds drm_display_helper intel_cstate mtd
> mei_me joydev wmi_bmof intel_rapl_common soundcore cec ecdh_generic
> processor_thermal_wt_req ecc mei rc_core processor_thermal_power_floor
> intel_pmc_core i2c_algo_bit processor_thermal_mbox pmt_telemetry
> pmt_discovery pmt_class intel_pmc_ssram_telemetry int3400_thermal
> int3403_thermal intel_vsec acpi_thermal_rel int340x_thermal_zone acpi_pad
> acpi_tad mac_hid sch_fq_codel msr parport_pc ppdev lp parport efi_pstore
> [  218.494145]  autofs4 btrfs blake2b_generic raid10 raid456
> async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq
> raid1 raid0 hid_generic usbhid nvme i2c_i801 e1000e nvme_core hid i2c_mux
> nvme_keyring i2c_smbus ahci spi_intel_pci nvme_auth spi_intel libahci hkdf
> video wmi
> [  218.494165] CPU: 6 UID: 0 PID: 409 Comm: kworker/u32:8 Tainted: G    W
> 6.18.0-rc1 #3 PREEMPT(voluntary)
> [  218.494168] Tainted: [W]=WARN
> [  218.494169] Hardware name: LENOVO 12TECTO1WW/3355, BIOS M5HKT1DA
> 06/17/2025
> [  218.494170] Workqueue: events_unbound intel_display_power_put_async_work
> [i915]
> [  218.494309] RIP: 0010:assert_dmc_loaded+0x2c1/0x420 [i915]
> [  218.494435] Code: 55 a8 e8 52 2d 9c cf 44 8b 45 cc 8b 4d bc 45 89 e9 48
> 89 c6 8b 45 c8 48 8b 55 a8 48 c7 c7 28 7e db c1 50 41 56 e8 9f 19 e4 ce <0f>
> 0b 58 5a e9 92 fe ff ff 48 8b 17 eb c6 48 8b 3b 48 85 ff 74 04
> [  218.494437] RSP: 0018:ffffd04682ff7c48 EFLAGS: 00010246
> [  218.494439] RAX: 0000000000000000 RBX: ffff8ef885a22000 RCX:
> 0000000000000000
> [  218.494440] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
> 0000000000000000
> [  218.494441] RBP: ffffd04682ff7cb0 R08: 0000000000000000 R09:
> 0000000000000000
> [  218.494442] R10: 0000000000000000 R11: 0000000000000000 R12:
> 0000000000000000
> [  218.494443] R13: 000000000008f00c R14: 0000000040b8408c R15:
> 0000000000000006
> [  218.494444] FS:  0000000000000000(0000) GS:ffff8efc32794000(0000)
> knlGS:0000000000000000
> [  218.494446] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  218.494447] CR2: 000075deec01b098 CR3: 00000001fba40006 CR4:
> 0000000000f72ef0
> [  218.494448] PKRU: 55555554
> [  218.494449] Call Trace:
> [  218.494450]  <TASK>
> [  218.494452]  assert_main_dmc_loaded+0x10/0x20 [i915]
> [  218.494572]  skl_enable_dc6+0xad/0x230 [i915]
> [  218.494667]  gen9_dc_off_power_well_disable+0xb8/0xd0 [i915]
> [  218.494757]  intel_power_well_disable+0x67/0x80 [i915]
> [  218.494845]  intel_power_well_put+0x4b/0xc0 [i915]
> [  218.494930]  __intel_display_power_put_domain+0xc7/0x1d0 [i915]
> [  218.495015]  release_async_put_domains+0x5b/0x90 [i915]
> [  218.495099]  intel_display_power_put_async_work+0x6b/0x170 [i915]
> [  218.495181]  process_one_work+0x1a1/0x3f0
> [  218.495184]  worker_thread+0x2ba/0x3d0
> [  218.495185]  kthread+0x107/0x220
> [  218.495187]  ? __pfx_worker_thread+0x10/0x10
> [  218.495189]  ? __pfx_kthread+0x10/0x10
> [  218.495190]  ret_from_fork+0x202/0x230
> [  218.495191]  ? __pfx_kthread+0x10/0x10
> [  218.495192]  ret_from_fork_asm+0x1a/0x30
> [  218.495195]  </TASK>
> [  218.495195] ---[ end trace 0000000000000000 ]---
> 
> 
> Thanks,
> Alok
