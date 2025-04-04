Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE8FA7C1FF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 19:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C2810E264;
	Fri,  4 Apr 2025 17:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RauIWb/E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D70810E2B5;
 Fri,  4 Apr 2025 17:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743786060; x=1775322060;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FSapAERmu+OItbSZ3b2xhUbjfLa1Rgaa88v1J/KWKbk=;
 b=RauIWb/E6KwQ9CWQ+v8l8O4DODLv1vhLw+Z1KbGlt3Dk10x4L83MPYhR
 fSgQZLr2fVnXn6BZuXSKcwQ9ZudSCey+mzYCR9gA2o0wfM2oBkaTypKOQ
 3n30R7m3YyaBmn4tbBcX375iu4h2V0Vpl2JmL5fnwA05ClZ8Enj7cmlPj
 DXW7uEdFiTIKkWzj9SKf4qhZqmMqQFYwj9rIPVf0qEohT/O9aoBoOE7z/
 V+YpxrGoajKpMbn5ORDHBUDYj506RTF2f/L5AlYNxujp11BSqv+iayq/E
 8AtaHqnqb1Q5g9RShyMx4CeD4Da/R5CQvp3tSG9TboCN2j1EbmSB/nxYA g==;
X-CSE-ConnectionGUID: N67nbt4UQj+g6atf2tX0aw==
X-CSE-MsgGUID: ZkYK4jQ7R5izyRCS1n9b3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="44383500"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="44383500"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 10:01:00 -0700
X-CSE-ConnectionGUID: 0Kvd2PQzTgSt9UgqBz4MWw==
X-CSE-MsgGUID: Zb49JeHMR2ODzp6QLg4Bdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="164566783"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2025 10:01:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 4 Apr 2025 10:00:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 4 Apr 2025 10:00:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 4 Apr 2025 10:00:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zILgKzbYaLw0DRoeFJZVo2AaTfa0N7KxvSyCPSFtCobVwSSnR/gH8shfZ/41WWpTTDVBJuGAXEKSsH7MzjKZTYNuE+oXYC33yR0TAi3COdEanzGGhNI7iauV+y512WcleZjqLPjr8mV8vrChLH89XHiiCfFFkjF8od1D0GvLLtUpr8ezSb2zfzcMkcqytiw+pbpOVayShteIno73SSJXC+QBkl05svIOVm7mEttEi/7emHA0aA2G625ZfqiJZ51OhQ74UvDfuBJJJ7ciVlQBF8wNXZ9HCrev7b/OBSGvz4JGQXS2rmupY2dzl3hGLf430qDSUzhT2G8UCztR2Z49SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4raKdCpPyCYoAt5eT9WQaY7FOARIj4yNNCMxkdpT9Y=;
 b=dm/6ykzaMVMlbwRK4+GVl4xlxpkL/drFiqg+4HSrrce1AvmyykMdYvSDIC0vBELhAnDsXZT/CnKavlavIwpkdkqfq9uCurdn7w+LhQHiH06jYYKcpQAjJkiQT8q5OL563EGlqw2XceLq45Uo8fUDl7EHwUih5WmeTDyW9Vnel90Lj2mEGeAv9NstR9bezmnm99LcGJ0tYTUBxTLydc0rO0DUatFSdXBIlySSuAy0ba4cyw8rJlqfRCOKTN2AEkArnauz9NbG/5rFwXdaQCKJGp3dSzxEUE2JO6eG7viIBVRKqhPcicNbG340cPyONA8fC7AcqfxRiKdAU7oUQ+/T8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7403.namprd11.prod.outlook.com (2603:10b6:208:431::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Fri, 4 Apr
 2025 17:00:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.052; Fri, 4 Apr 2025
 17:00:56 +0000
Date: Fri, 4 Apr 2025 10:02:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 7/7] drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
Message-ID: <Z/AQk2fRiIfNRF1I@lstrano-desk.jf.intel.com>
References: <20250328181028.288312-9-matthew.auld@intel.com>
 <20250328181028.288312-16-matthew.auld@intel.com>
 <Z+78wBNpgGG+D7h9@lstrano-desk.jf.intel.com>
 <bd0476de-fd5b-4ea6-806f-ca49b33b9404@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd0476de-fd5b-4ea6-806f-ca49b33b9404@intel.com>
X-ClientProxiedBy: MW4P223CA0023.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e1d664a-e204-44d0-f1f6-08dd739a43fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6S+B8r2sLQX0/yDQc0m9CuVpupYCA2t5Q8pXzmPVXxurFFq027jOgeK/hN?=
 =?iso-8859-1?Q?7gk/Tj2/FsHdbMIC6WyKwRJLRyzT5wE7K+HWmrVo7HJrYQvPUQyxZ7Oj7h?=
 =?iso-8859-1?Q?XIQTHAAOpSge+p/9pUYUD4szHH84WG5WhrpXdvJu3lc4HbcaWzxnLFvPlJ?=
 =?iso-8859-1?Q?y0QEVz66FlNT+4tKW3scmVw8zP3psoXFaLIW2QZ/PgMnHxLvO29sl9C+09?=
 =?iso-8859-1?Q?hWgAimzwby6iCqlFsay7PRLvd/n75mgVXvdUM4jekyns550CvaGKKlRT2f?=
 =?iso-8859-1?Q?OiE0nDkn8DAxgCOceMyp+AX0ORcGtCKhUDV8cvh71LW+s+G5O0lFCRiT68?=
 =?iso-8859-1?Q?FRseaZHDKOk0O2ATht3x/l1HYIxO9BJC1Ei1gbVr1PtrVxINPHAVXnJNTn?=
 =?iso-8859-1?Q?rsS7YyUVCBIRdkzOR7+1xQfsMY7z188Sym/ANhjpr0+2lroABQa2kN/AO4?=
 =?iso-8859-1?Q?PdvghR2B6chMS/JS3gtLFlBIDlc3eQCqka+1Cy6xA3SweDR0CiTDvSyyuC?=
 =?iso-8859-1?Q?NA6qnD8b2GMGjhuy34L0dTuDAQv5uXxb20ecmuGCNuuINvoFlA3CGqn1Dg?=
 =?iso-8859-1?Q?3S9bWHnZvLZznG9ambyhtK/oz/XuTl6C7Ts8QEaOpWx0+QFw7XTBj479n2?=
 =?iso-8859-1?Q?eTgzewJHNYxaFrQRjuVv1dRm8OK/IUg9Ht12lG6ZxCy4Dy53LadrJkBqYo?=
 =?iso-8859-1?Q?zlvNtBOWZwKDYDvI2O5ec7vbDwIM2WywvyxQtmOi5Sdanq+hirgII4B68w?=
 =?iso-8859-1?Q?ktn9dRjYzXf2J49zzW9dp/7P/NMyZyByJRFr/tFojQYkc7JNaMfRTt/SYd?=
 =?iso-8859-1?Q?zUVlNT3RlHsGKlDw8iRLpzKJPwwSlUfb2Hnmea8ieJBvyJocUvRk9kvYl/?=
 =?iso-8859-1?Q?I0VC2rVUMypDmbCd2aRhzZH8KMveibdhoutrOk7fy+G/aKJtECFPppRcGS?=
 =?iso-8859-1?Q?JetVnQdXKUxsGy57KF+NdnBzHvOBVv1T4ErD1MJ6v0/VL8QmVRD+lyh2xX?=
 =?iso-8859-1?Q?Lc8txwmZbLg4S+YirPQafUB3NXQms6KqD+NpWhRgu0CU3NB5ZsdV+kZkQd?=
 =?iso-8859-1?Q?1aR6YxqlnQSoyetiEA2YCmTJZU4bAKwwhPEULAUGYvEILUJOMvzctFvDER?=
 =?iso-8859-1?Q?5nBMMnbC4aYplbGGAxrHkrPzDyejg+7oDpTu7bk6x9a7PnPJ7hK1Evc5Ki?=
 =?iso-8859-1?Q?191Jby28kX8W5li5IDTR+//kWTC2FmcOL5aQbXTwFMIzKJfU9gq/vcc+EZ?=
 =?iso-8859-1?Q?AR2UHLLgYNfnFPf0jWjuB64aJjJw16lexJ3WbfpUb8rD9hgObVAXcfcgFN?=
 =?iso-8859-1?Q?82iXldbfDI9gPqBmqyR6pB3IEwX2MlS29zFlmAWTd9xfyKDmd4x/5U1zO8?=
 =?iso-8859-1?Q?hBDI62eEUn9xO9FQ02NCUd3Y80QuvZQA+ASLbLxURmXrHi6WVuKa1NvPx4?=
 =?iso-8859-1?Q?p4BvqOl5c+OghXIG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZjdZvQSR9E/nCdDjBQ34LpLqizmrLxgf2mFQmk1NtWTOcEo3anZnD2Oszx?=
 =?iso-8859-1?Q?30Ww9EqG3vNHOmp3ZO2SYlBtTBn3B9lcFK1JfR7nr4tNI6noo6POrkBMo/?=
 =?iso-8859-1?Q?gQddzr2l45DsG+FsoICgrmPSOQCj0cEolr5+1KlEPyn7niiUod24GMubD3?=
 =?iso-8859-1?Q?0hzdTSA0Z/j3Zmd6TTJBIKnJ7IOuFSjBB383Qgt8GGZbNgn/SnlOOnkguM?=
 =?iso-8859-1?Q?x7JEfH+ZLH7kQYh6dsJn+/f3/rLuAxj7iCmoU5JD3Ofzjwp07jamhqA1iG?=
 =?iso-8859-1?Q?nfZbCf1ydKN6nqDB177N2FQ3D0L6Bmy6QHkiydP9vz3xUKyN0OdKVdM+Sr?=
 =?iso-8859-1?Q?6LUsq+6EyKyeMnn/869Mgh4ELnKm+2470R6Ux7bjYRifV3vM7DiRESoDXN?=
 =?iso-8859-1?Q?3cd9Fc7wWczw5YT485a5FiPicKxxMAu9Fbmw5ZFlXIhtOAGwAjWd2bJS1Y?=
 =?iso-8859-1?Q?VwnQtUBPqJV8KQC5BJfaDcGBTCx9SUnrwhHzeQm78wJ9Wg3GY85C/LoU86?=
 =?iso-8859-1?Q?55Rk9aEnWFtRN4i3QtBpI254Qf0PAx9Q/2+Ex3iLg+89CRsYKINp8R/w4m?=
 =?iso-8859-1?Q?z8UG3GgXcNTiP0pz6jDlZvPWkn/uiO6p/PnMIxmLcjn95BFHq4L+V4L+lg?=
 =?iso-8859-1?Q?ZOWjceZeKGVDgzHO43jBlF60q5ClWBAIxnrx5NDuuJUivTWKHUJAalNy69?=
 =?iso-8859-1?Q?8B396U32epm/oN0BaIIM4nd05l4AUrNmjm7XrsV0H0zCBsIYMEG6Vr0Bon?=
 =?iso-8859-1?Q?/GDt5snGN/kBDGk2VjFIahxXHlGzIQf2QZUYEQFr3h1HdPWVwTEZobDDNs?=
 =?iso-8859-1?Q?sM2Nggz/vZRbBSuCiiNHtIePKA47a3VE+VnYgosS0PkyLFgEkqyRrmo2d6?=
 =?iso-8859-1?Q?Lk30in13NHIKr66/dMF2ryE3hl2emmHXpVyovRP8QdYzrEqFUWH0Trdpjj?=
 =?iso-8859-1?Q?bRIvN6HMMIgS7UOTAetVzOGJBvYViVToSOGypzjLUHg5Iv5HHk3H+KtUCy?=
 =?iso-8859-1?Q?beaS3lbUO+hfXK4mFRWTeLpSbaETf7ThNsydxpViJz5Z9BR8A4hxf8rEKo?=
 =?iso-8859-1?Q?8L7dxGatxTEUol1b7PKuNu0n/z29S0Uv5OBo7eDDsKBne/Iyg7u43hL38o?=
 =?iso-8859-1?Q?kWk0X6Wl3lnU3/OhxnlS2RXpQKKhPyQv6bH0peOpwxd+zDFnW7prJnXuXc?=
 =?iso-8859-1?Q?hy0jmav4JRxoQwIJgY5Y7Ia3vQEZYmjaI2ar2dfeM+7bzLugteBWVtWNlS?=
 =?iso-8859-1?Q?TFQt67Hf0pJDhd6kS0TgESNx4soRqXyqVePVnPXH0WwnV6nfX9IvY8U4Xe?=
 =?iso-8859-1?Q?Vw1jiZQ5VisJY8Ael99YquuhXmzgmGKs1Y4zKQR7Fd/Cn1+2Fl/a+z/Yhn?=
 =?iso-8859-1?Q?fzV9Nvsxv6mWIeGJAHhAOfcGByhl30R/d12uax0lcLoec11TIKlbP4HI7D?=
 =?iso-8859-1?Q?l0Y2HDz6kYl1mwL+xk6SlarG4Q+g+a3zQn20m2QmNAFeqnk/uX9LQMljtw?=
 =?iso-8859-1?Q?U6aBPT2okyy1z6aJNmOm9HF47gLuMDVBjKrT38ywNmCajg0Zfe9swd8i8d?=
 =?iso-8859-1?Q?wgHQ93xHMV67weSQTYBH1Zn67dSigMH6YYrc8mAamdWGyhRNVhLfzx8AFF?=
 =?iso-8859-1?Q?zRTYlHdHh3ObxTyCc3uJeOkB44BgtHaeZLx7bEAfZXH2zVUZCyuabNpg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1d664a-e204-44d0-f1f6-08dd739a43fa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 17:00:56.1195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOtKyRjAIxqG+W4aEvPXtmqVyFP0+9jzsaS7tNVAXff+Uw1HuvlEdyvG8lv1XiOoD20HAm9txIBzKUW9IILYDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7403
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

On Fri, Apr 04, 2025 at 09:19:34AM +0100, Matthew Auld wrote:
> On 03/04/2025 22:25, Matthew Brost wrote:
> > On Fri, Mar 28, 2025 at 06:10:36PM +0000, Matthew Auld wrote:
> > > We now use the same notifier lock for SVM and userptr, with that we can
> > > combine xe_pt_userptr_pre_commit and xe_pt_svm_pre_commit.
> > > 
> > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_pt.c | 95 +++++++++++++-------------------------
> > >   1 file changed, 33 insertions(+), 62 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index b097c91e2e02..947b82aa19a6 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -1396,7 +1396,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
> > >   	return err;
> > >   }
> > > -static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
> > > +static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
> > >   {
> > >   	struct xe_vm *vm = pt_update->vops->vm;
> > >   	struct xe_vma_ops *vops = pt_update->vops;
> > > @@ -1409,55 +1409,40 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
> > >   	if (err)
> > >   		return err;
> > > -	down_read(&vm->svm.gpusvm.notifier_lock);
> > > +	drm_gpusvm_notifier_lock(&vm->svm.gpusvm);
> > 
> > Also any reason not use xe_svm_notifier_lock / xe_svm_notifier_unlock wrappers?
> 
> Just that those are hidden behind CONFIG_DRM_XE_GPUSVM, so looks possible to
> disable svm, but then I think we should still have working userptr. Should I
> pull xe_svm_notifier_lock out of CONFIG_DRM_XE_GPUSVM?
> 

How would userptr work without GPU SVM if we building it on top of it?

Matt

> > 
> > Matt
> > 
> > >   	list_for_each_entry(op, &vops->list, link) {
> > > -		err = op_check_userptr(vm, op, pt_update_ops);
> > > -		if (err) {
> > > -			up_read(&vm->svm.gpusvm.notifier_lock);
> > > -			break;
> > > +		if (pt_update_ops->needs_svm_lock) {
> > > +#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> > > +			struct xe_svm_range *range = op->map_range.range;
> > > +
> > > +			if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> > > +				continue;
> > > +
> > > +			xe_svm_range_debug(range, "PRE-COMMIT");
> > > +
> > > +			xe_assert(vm->xe,
> > > +				  xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> > > +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> > > +
> > > +			if (!xe_svm_range_pages_valid(range)) {
> > > +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> > > +				drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
> > > +				return -EAGAIN;
> > > +			}
> > > +#endif
> > > +		} else {
> > > +			err = op_check_userptr(vm, op, pt_update_ops);
> > > +			if (err) {
> > > +				drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
> > > +				break;
> > > +			}
> > >   		}
> > >   	}
> > >   	return err;
> > >   }
> > > -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> > > -static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
> > > -{
> > > -	struct xe_vm *vm = pt_update->vops->vm;
> > > -	struct xe_vma_ops *vops = pt_update->vops;
> > > -	struct xe_vma_op *op;
> > > -	int err;
> > > -
> > > -	err = xe_pt_pre_commit(pt_update);
> > > -	if (err)
> > > -		return err;
> > > -
> > > -	xe_svm_notifier_lock(vm);
> > > -
> > > -	list_for_each_entry(op, &vops->list, link) {
> > > -		struct xe_svm_range *range = op->map_range.range;
> > > -
> > > -		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> > > -			continue;
> > > -
> > > -		xe_svm_range_debug(range, "PRE-COMMIT");
> > > -
> > > -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> > > -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> > > -
> > > -		if (!xe_svm_range_pages_valid(range)) {
> > > -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> > > -			xe_svm_notifier_unlock(vm);
> > > -			return -EAGAIN;
> > > -		}
> > > -	}
> > > -
> > > -	return 0;
> > > -}
> > > -#endif
> > > -
> > >   struct invalidation_fence {
> > >   	struct xe_gt_tlb_invalidation_fence base;
> > >   	struct xe_gt *gt;
> > > @@ -2255,22 +2240,12 @@ static const struct xe_migrate_pt_update_ops migrate_ops = {
> > >   	.pre_commit = xe_pt_pre_commit,
> > >   };
> > > -static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
> > > +static const struct xe_migrate_pt_update_ops svm_userptr_migrate_ops = {
> > >   	.populate = xe_vm_populate_pgtable,
> > >   	.clear = xe_migrate_clear_pgtable_callback,
> > > -	.pre_commit = xe_pt_userptr_pre_commit,
> > > +	.pre_commit = xe_pt_svm_userptr_pre_commit,
> > >   };
> > > -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> > > -static const struct xe_migrate_pt_update_ops svm_migrate_ops = {
> > > -	.populate = xe_vm_populate_pgtable,
> > > -	.clear = xe_migrate_clear_pgtable_callback,
> > > -	.pre_commit = xe_pt_svm_pre_commit,
> > > -};
> > > -#else
> > > -static const struct xe_migrate_pt_update_ops svm_migrate_ops;
> > > -#endif
> > > -
> > >   /**
> > >    * xe_pt_update_ops_run() - Run PT update operations
> > >    * @tile: Tile of PT update operations
> > > @@ -2296,10 +2271,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> > >   	struct xe_vma_op *op;
> > >   	int err = 0, i;
> > >   	struct xe_migrate_pt_update update = {
> > > -		.ops = pt_update_ops->needs_svm_lock ?
> > > -			&svm_migrate_ops :
> > > -			pt_update_ops->needs_userptr_lock ?
> > > -			&userptr_migrate_ops :
> > > +		.ops = pt_update_ops->needs_svm_lock || pt_update_ops->needs_userptr_lock ?
> > > +			&svm_userptr_migrate_ops :
> > >   			&migrate_ops,
> > >   		.vops = vops,
> > >   		.tile_id = tile->id,
> > > @@ -2419,10 +2392,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> > >   				  &ifence->base.base, &mfence->base.base);
> > >   	}
> > > -	if (pt_update_ops->needs_svm_lock)
> > > -		xe_svm_notifier_unlock(vm);
> > > -	if (pt_update_ops->needs_userptr_lock)
> > > -		up_read(&vm->svm.gpusvm.notifier_lock);
> > > +	if (pt_update_ops->needs_svm_lock || pt_update_ops->needs_userptr_lock)
> > > +		drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
> > >   	return fence;
> > > -- 
> > > 2.48.1
> > > 
> 
