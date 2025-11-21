Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31397C7BF77
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 00:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CD510E91A;
	Fri, 21 Nov 2025 23:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8E9Ql8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2CB10E0AC;
 Fri, 21 Nov 2025 23:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763769094; x=1795305094;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k5/uMU56ggaUGnNfaDZpHArX2aDbHI3cPw08DWk8Zmw=;
 b=V8E9Ql8otKtzxLcf6AzcugbasfahX6pb8RoTNw5ew9KkUTnW1bKAdxoC
 eOOmwBFi5zfbryzIoRCNJpAP2Yg2jgNG8Sn6JruL67fMNcH4ntmrp61U/
 +4bKm99kGdSywaNBxPZD4xwZGY49eSY7ZFmNdlM9evpOwqWGiI56p7DS6
 SQZPn1UKHWrvSVEZFkdX4y8NPYMuEcao04NkDAng1JTVSprQUqw8qyO8a
 x+rZIQX2xdS1k3fvujkdX9J+SWueytUWv3PLS2/5ayBZ/jy9eVWs0sA4g
 hqzGHEY9I6452lTgia5Gwl8qBXOD/konyk64miLls9nXhm/7QZZttw3vU Q==;
X-CSE-ConnectionGUID: j3MBGuwFQzmwoAhJIz53Ew==
X-CSE-MsgGUID: dF8ztPYLTiyakeMnDznwRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="76195850"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="76195850"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 15:51:34 -0800
X-CSE-ConnectionGUID: caNNYircSF6VHEDW3qGZaQ==
X-CSE-MsgGUID: 4FZFMJ71R22SKGCgtbqBMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191697597"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 15:51:32 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 15:51:31 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 15:51:31 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.47)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 15:51:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXru/xZf/hDVCeyyTUf6nY366UytCxifYVyzRlAAnh1J07Bb1QOh3wafSmBu1O8AsgatgaB8XBPU379WRZ+coHxe9BWgS6SG/c/BxCV4W9eVORDdzHMc53qfvmP4KCSAx/uLuASxL0EBBvE6ZfeqZ5JV3JlatEKrWcZZ/fnM1c5kHSn8m+RemBWmC7FEsUmuMVsvU130hU5uPQ5fhnCJVEQRxUp7BfMgAimeNMG73re6/wTiYba26E6GecuC0SCbollE46H2FtK13sPOQG4P/S+sYFO/J4P+cSZo7r2kvx6qH7ZIu0etZ6Ci2yzeKgVgqTO4kU8TjCFZ9HuSEhGwYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8slU4XRY/MN/Y5FKOJKrKHEtKOzF7t0KPvC17n2NDuc=;
 b=voA+OfLaFIzGmI48kDlToZhapIR/XD130y6wsG5juWqpOctMss+TSXdtybfM9EzMwNy85R6cwzBEvp9PZszyEd+KLJ6ve3qc2UFqKdX5cAAEEu/wPhIwByHGyPdfNkhPRjLdcf7PHNrPL9Bp+Blw0mPobVmHhQzf8eekodkl1H5HVXttB9+a0xXhBQ5KaKeoRogykGOBV+iLbhzGelf2cKD3qr/Ok3fLt/DerwG9S5GMxrfIUTBRrD++4lVrlV0fvbHCDXxWbURbR8QpDN2iXA6JlJg+5P7u+yLrObvo/bJsajSfWL9bBsmJBAUBrj/W/O6W+WXddalS3aKoayIqFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 23:51:24 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 23:51:24 +0000
Date: Fri, 21 Nov 2025 15:51:21 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <umesh.nerlige.ramappa@intel.com>, <christian.koenig@amd.com>,
 <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 6/8] drm/xe: Do not deregister queues in TDR
Message-ID: <aSD6-cZHs0XixRzu@nvishwa1-desk>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
 <20251119224106.3733883-7-matthew.brost@intel.com>
 <aR9xCKn3MCEOt1Hl@nvishwa1-desk>
 <aSDY5iOgqa23vX6t@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aSDY5iOgqa23vX6t@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 5337782b-22ad-4686-9066-08de2958e0be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kbuqkzwx0wfQGg5o91bUcoXFrAK1TaU9tIaGt+DkpmaEzGeIYe0vu8wVMe0i?=
 =?us-ascii?Q?12dKtjWhkna23rYD0fuCJB2/JVMUMpUlNcFymtpoimrOdO8KuBk6PpYISE7R?=
 =?us-ascii?Q?RKIKTkbGyRSykAZgDzrhlQ6PiKlcjJ3hbhWBjq8+5qykhmWXP3Nv5IIDEyx8?=
 =?us-ascii?Q?VyNd6eVTkp6+0wbqjesQtuGw6TmVWofvk1w7vE4hq2iNeBXKvv9A0vbOIVDw?=
 =?us-ascii?Q?0un/MtZx7FEfKeiJa/1kumhJLp+C1BNvPW1U+mucGDCkSnFS62UaVV65ax/k?=
 =?us-ascii?Q?majzO6kJYWecuQQ7cf0dnTZxcS02fq1xC+mEuJktcVNsXtnI/ew1O5p42PSV?=
 =?us-ascii?Q?xOrvSukqw4YCzBu6p1xIKuMuyTNoTPozIItASkrrHfOUn+cyWxT1Cs19jhkL?=
 =?us-ascii?Q?n/I28smiAh5miq/xACsJfpE+7tUe/1M+qtXJbtx+nJlD/sSnwDgmXTuH6/tZ?=
 =?us-ascii?Q?FWHAY7BZtItXoMmfNece6jab4N31a5YHh1CESmKtIOCvUKNOA5RTRuPK5Gol?=
 =?us-ascii?Q?Y75A5XURnnlMvyOEtwUArIQMPShjwI0ZLk7F5ef/Y7x4kuwNJ+hNx6U4oCnT?=
 =?us-ascii?Q?9MVbRyk71AuO3PeyZg27620h5yaW68x1f76EFtSDROGCpO/8YLjqo5D0vcRY?=
 =?us-ascii?Q?fc2ZQx5p3ZIgrsaRga6KYqjS25sTykNq80xN5AJuZZcF5GQnJYgC3+DNP/vS?=
 =?us-ascii?Q?Mi4tudDeZ4Brj5TuXxst+fGLnywqJhyQybJwFN7L+6h9GdDEkeIvixChvEeC?=
 =?us-ascii?Q?VLMFew2vIWLgS+U0YlxyI6JaInnoUNj0VZbqzRugVPB9ibaxTsPB2uOSIvdD?=
 =?us-ascii?Q?o+hhRnFyXN7Vmj9LVl95FE//fbOiTdADza10AeIycLmZjPH+4FOo+5gRob8l?=
 =?us-ascii?Q?ylR8iYVqjNmFybU60EjvIDTz9FWgsA4CL26WIjBOgRIMTsBj6Lgm2CWFWE2/?=
 =?us-ascii?Q?jjopCgsq1sVnPxDWkFV9kcags/U4j1x5PDd+SoSCk+nJUL/qKJdYlysXGzOB?=
 =?us-ascii?Q?y7yrHKD91/8hIZ6UTMbZ6Zlvq3+xx+BKkl2vrJQ7RVxdUDYMiXicDLujaIgS?=
 =?us-ascii?Q?nQQKnjQW6RHgspXqaiFHGjdfqSnrHsz6A+/Ew8KqzErDYevW7QsmZ6/wWJ7d?=
 =?us-ascii?Q?9XNnXV046cJTmZNpfrfbXobdITXL3ryWxkyt3Kcmcj6uMVbdrDJVv9iev8HZ?=
 =?us-ascii?Q?M82Z+CIqhzb9pE0TNpqFGa6X4gZPOZApp3e8tgpWThRQ0jslA7YwJaq2ZGdc?=
 =?us-ascii?Q?66/mHF/FB0l57nhTfHe9hxYbiVzZSu/da/U4KChSf1Y9rajyoDtfu2z2CJ5O?=
 =?us-ascii?Q?Dw/Z/a3JAOKIDX/1KWfpOAhGn7JOyu8YfLoqO+RS8KRpOexTG1N6ala6+2pc?=
 =?us-ascii?Q?YL01RzxQJAiFHgpMSN9DJrScAU7k2XOVXTDHgNQofLOasDq9d0Ja55aPY9y6?=
 =?us-ascii?Q?saAIaRCvJJxXn9UYLMVLAx0b5W/be6y+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VXzVen4fz0qFyAgRplxKYbbsmWoc/WdZ8glrzpeG3PP8ZRigpLmNElkmiRH1?=
 =?us-ascii?Q?9aEqVxJkVc90Rno2CdzamOeaWVnYRs6belmJXfmsB7wL0fQTGG1/DwV5eM7K?=
 =?us-ascii?Q?CpMZfUs0sJ6dPNUZTDfLFW9BECqyljzFMslsS61bo6DUG+Fo1Zu/B6pmTrcl?=
 =?us-ascii?Q?7LCxeiciUp3sb4CObDuMglCMyb5zZSAiRkv9EfXR3LQDeX4U26LFoforEr9I?=
 =?us-ascii?Q?3atudViV/0mycs9olDY8a3KHEeTRtSmt9z14ZHGmsdyAVqXI7l1Fa1rYeJJg?=
 =?us-ascii?Q?Mi/4g7Dy5XYPcpEVEJj7dOIdNeCQKC14KX15qblXBcxtd7XLDGvNwr0MRn2q?=
 =?us-ascii?Q?TMB+x8Q4RBdsBcuM3PJUSed5c6Z54YOrr2I+BC8uiqiQ0vFXDWcGzFnsh8Wb?=
 =?us-ascii?Q?45anUNZCRiL9Fn3v7gceL7mIUbsJSoq59tfUhRu3jFT+M4HGADnvInj5Rxvm?=
 =?us-ascii?Q?gYXhKRJswkkXWq4949NAFn2PAi888QTXQrw+cKXl5rRTzYRJTniwkgIHCAGl?=
 =?us-ascii?Q?TyAwcp+QBNKWwDfvLhHiuz1P5vdmuhgxyVL51d2KNoeaxUREC+WIX3PHMhKi?=
 =?us-ascii?Q?kEohUyIkPNBKhr9GykJdEEQ5Ztn940USkst+Xwn6uw7PmGkLpdGepYFSz09C?=
 =?us-ascii?Q?fhVA6bSvawVcEMLI21Qeo6lOD7jzN9TPUJir7WCwKIjuonw+xmmTKifMvvvZ?=
 =?us-ascii?Q?v4GzJPVFvyo1jL8lgy7bgfreDaun3xwnaptkc2yb7qVMBbsI8bsPHRlu/Ixa?=
 =?us-ascii?Q?ZENBJ62XMs2UfgDHYiWJlbz3m/DXGeS0uc1ntQokpC9VRP4v8d5QSzN5ZTH7?=
 =?us-ascii?Q?e8Iij/HFH5qNKEXkcoP1abhlx+wLiK+iBxkey9Hf7VpWZEGs2HrB6MfxXTA6?=
 =?us-ascii?Q?ucDMdaoodPxP1ni355mHQEJqJkvBRsx3ZJ/28b4zuQllZ5dQMdle/p4rlI4w?=
 =?us-ascii?Q?ecOnTZq/7VyreH6dPxIBrAwz6IMDX8NZcQFTRcepCe2psHUGwG+A6CIXR3gR?=
 =?us-ascii?Q?BZz7MPtV62TxoJvmHr3L7uY16gzHDhh4ONFvjnBW0ld5nA6kIWwcP6htrqjV?=
 =?us-ascii?Q?3zGa0srrSZqZRp1GxRtF/vMNgAYPTPwi8gCBqAtjGtcjFuQsa7hE5RI2vflQ?=
 =?us-ascii?Q?sSe9SzclI5TFdsJmBCY9ra84MI9yQGoUFtyZqd8LREf5ypbAToGjsZ7d1O5z?=
 =?us-ascii?Q?lBFIVNNdmD+OVpgi/OXU5OWnUY2Lr3i9alycEW8Jwf70YVMiQuzwVBL1jFUZ?=
 =?us-ascii?Q?IsTXYYCQsaCQ/gJ7nm1YI8FBd4PMz52dDeK+i96pB2vbQxbtqfju2oO+AqBs?=
 =?us-ascii?Q?1otI1t6IcYo63f1WlMQ2HC5EKPlTsXua2KuQIk51fW8p7F06YAt4QfGrTEq0?=
 =?us-ascii?Q?y9bLp19zG24Sc8prJ4OlCyZ3XA6i24zwSqrb5ZAg2mP9LFrojrIyn+Sad/R4?=
 =?us-ascii?Q?D/5JF+wvvnxz+hoxNhUKkSX0asQ8TFOVgCBD1fZoBfCXvoz9Pp5f5JwakSoh?=
 =?us-ascii?Q?ySejtNGNygEx2A31m+nego3VbJWbCHNFkRF6WBCe44v9OAP/i6GCAu67jxbZ?=
 =?us-ascii?Q?NY572AT0p+fz8J9zBSsSryO+0XzxfJK8a8CvRS0/0cZYUQYpr/Qi54RkbHrq?=
 =?us-ascii?Q?ZXbl5giqsnjzjZ3LKvhAFjw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5337782b-22ad-4686-9066-08de2958e0be
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 23:51:24.0314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H12Igzi7cs2pNoMDytOJwTzfL5eIT4seBHAgKN9Xy4JwNWnbSDWm9ycc7Y/PgxkEVMe4KD+vNHxPAarTNLkShms+CpKXNwZlILBy8RETQfovWy3+Z3PyTwU3mpkTRYWl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
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

On Fri, Nov 21, 2025 at 01:25:58PM -0800, Matthew Brost wrote:
>On Thu, Nov 20, 2025 at 11:50:32AM -0800, Niranjana Vishwanathapura wrote:
>> On Wed, Nov 19, 2025 at 02:41:04PM -0800, Matthew Brost wrote:
>> > Deregistering queues in the TDR introduces unnecessary complexity,
>> > requiring reference-counting techniques to function correctly,
>> > particularly to prevent use-after-free (UAF) issues while a
>> > deregistration initiated from the TDR is in progress.
>> >
>> > All that's needed in the TDR is to kick the queue off the hardware,
>> > which is achieved by disabling scheduling. Queue deregistration should
>> > be handled in a single, well-defined point in the cleanup path, tied to
>> > the queue's reference count.
>> >
>> > v4:
>> > - Explain why extra ref were needed prior to this patch (Niranjana)
>> >
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_guc_submit.c | 65 +++++-------------------------
>> > 1 file changed, 9 insertions(+), 56 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > index 648c9ea06749..5de300b66767 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > @@ -69,9 +69,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>> > #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
>> > #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
>> > #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
>> > -#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
>> > -#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
>> > -#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
>> > +#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
>> > +#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
>> >
>> > static bool exec_queue_registered(struct xe_exec_queue *q)
>> > {
>> > @@ -218,21 +217,6 @@ static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
>> > 	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
>> > }
>> >
>> > -static bool exec_queue_extra_ref(struct xe_exec_queue *q)
>> > -{
>> > -	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
>> > -}
>> > -
>> > -static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
>> > -{
>> > -	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
>> > -}
>> > -
>> > -static void clear_exec_queue_extra_ref(struct xe_exec_queue *q)
>> > -{
>> > -	atomic_and(~EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
>> > -}
>> > -
>> > static bool exec_queue_pending_resume(struct xe_exec_queue *q)
>> > {
>> > 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
>> > @@ -1190,25 +1174,6 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>> > 		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>> > }
>> >
>> > -static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>> > -{
>> > -	u32 action[] = {
>> > -		XE_GUC_ACTION_DEREGISTER_CONTEXT,
>> > -		q->guc->id,
>> > -	};
>> > -
>> > -	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
>> > -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>> > -	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
>> > -	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>> > -
>> > -	set_exec_queue_destroyed(q);
>> > -	trace_xe_exec_queue_deregister(q);
>> > -
>> > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> > -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
>> > -}
>> > -
>> > static enum drm_gpu_sched_stat
>> > guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > {
>> > @@ -1225,6 +1190,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > 	bool wedged = false, skip_timeout_check;
>> >
>> > 	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
>> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
>>
>> Is it always guaranteed? What if we get here because TDR is triggered
>> by some error notification from the GuC and befor we get here, the
>> exec_queue gets destroyed in the CLEANUP message handler? I am not
>> sure we can we be sure here that it will be race proof.
>>
>
>Jobs hold a reference to the queue. We have a job here, and the CLEANUP
>message (which sets destroyed) is tied to the reference count. So if
>this pops, we have a problem. I use asserts in GuC submission to ensure
>the state machine (which is fairly complicated) works as designed-this
>would be one of those cases.
>

Ok, sounds good.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>Matt
>
>> Niranjana
>>
>> >
>> > 	/*
>> > 	 * TDR has fired before free job worker. Common if exec queue
>> > @@ -1241,8 +1207,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> >
>> > 	/* Must check all state after stopping scheduler */
>> > 	skip_timeout_check = exec_queue_reset(q) ||
>> > -		exec_queue_killed_or_banned_or_wedged(q) ||
>> > -		exec_queue_destroyed(q);
>> > +		exec_queue_killed_or_banned_or_wedged(q);
>> >
>> > 	/*
>> > 	 * If devcoredump not captured and GuC capture for the job is not ready
>> > @@ -1271,13 +1236,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>> >
>> > 	/* Engine state now stable, disable scheduling to check timestamp */
>> > -	if (!wedged && exec_queue_registered(q)) {
>> > +	if (!wedged && (exec_queue_enabled(q) || exec_queue_pending_disable(q))) {
>> > 		int ret;
>> >
>> > 		if (exec_queue_reset(q))
>> > 			err = -EIO;
>> >
>> > -		if (!exec_queue_destroyed(q) && xe_uc_fw_is_running(&guc->fw)) {
>> > +		if (xe_uc_fw_is_running(&guc->fw)) {
>> > 			/*
>> > 			 * Wait for any pending G2H to flush out before
>> > 			 * modifying state
>> > @@ -1327,8 +1292,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > 			xe_devcoredump(q, job,
>> > 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
>> > 				       q->guc->id, ret, xe_guc_read_stopped(guc));
>> > -			set_exec_queue_extra_ref(q);
>> > -			xe_exec_queue_get(q);	/* GT reset owns this */
>> > 			set_exec_queue_banned(q);
>> > 			xe_gt_reset_async(q->gt);
>> > 			xe_sched_tdr_queue_imm(sched);
>> > @@ -1381,13 +1344,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > 		}
>> > 	}
>> >
>> > -	/* Finish cleaning up exec queue via deregister */
>> > 	set_exec_queue_banned(q);
>> > -	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
>> > -		set_exec_queue_extra_ref(q);
>> > -		xe_exec_queue_get(q);
>> > -		__deregister_exec_queue(guc, q);
>> > -	}
>> >
>> > 	/* Mark all outstanding jobs as bad, thus completing them */
>> > 	xe_sched_job_set_error(job, err);
>> > @@ -1933,7 +1890,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>> >
>> > 	/* Clean up lost G2H + reset engine state */
>> > 	if (exec_queue_registered(q)) {
>> > -		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>> > +		if (xe_exec_queue_is_lr(q))
>> > 			xe_exec_queue_put(q);
>> > 		else if (exec_queue_destroyed(q))
>> > 			__guc_exec_queue_destroy(guc, q);
>> > @@ -2067,11 +2024,7 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
>> >
>> > 	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
>> > 		clear_exec_queue_destroyed(q);
>> > -		if (exec_queue_extra_ref(q))
>> > -			xe_exec_queue_put(q);
>> > -		else
>> > -			q->guc->needs_cleanup = true;
>> > -		clear_exec_queue_extra_ref(q);
>> > +		q->guc->needs_cleanup = true;
>> > 		xe_gt_dbg(guc_to_gt(guc), "Replay CLEANUP - guc_id=%d",
>> > 			  q->guc->id);
>> > 	}
>> > @@ -2488,7 +2441,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>> >
>> > 	clear_exec_queue_registered(q);
>> >
>> > -	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>> > +	if (xe_exec_queue_is_lr(q))
>> > 		xe_exec_queue_put(q);
>> > 	else
>> > 		__guc_exec_queue_destroy(guc, q);
>> > --
>> > 2.34.1
>> >
