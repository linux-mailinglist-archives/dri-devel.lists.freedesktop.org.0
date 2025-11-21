Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB167C7BF80
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 00:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E32510E91C;
	Fri, 21 Nov 2025 23:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="baUEi8/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0119310E91B;
 Fri, 21 Nov 2025 23:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763769148; x=1795305148;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g4MgSemykCoSBDkv4Ulaqhv+NS52rggMHAmb8FDa3vQ=;
 b=baUEi8/A5eCiTxxVDRUhS7fAPpxG2i/CRi6EzFS0QvJBZy2V/HvkBkYF
 WIvh2RdF2hPHYohuis0/ZNDXogahye6xOLgPu4D+lM7lLFk3+BiPJap/c
 s62Oxi7E4PtTCkgUJSUSlXnxpF+X9g9DAEBtMiXUV0Y7OAolKGjs1AFxj
 0J3u4JZno7YmWYO71R2S4ywRktYX6FgMDRGrQtP5qxxwIdbDb+Ea/g31c
 Y362lua2vsCedzVC0TLkIb7272iWil8LIcSaxIj6omWNzLv5CFxP4MryM
 1pBXVSUyYYp4mAzAtALzhKCRrORc1QIjZD9SMBcSWmt7OT8KEd2LsprbZ w==;
X-CSE-ConnectionGUID: H/+XrDxGQYW+w+wjQr/01w==
X-CSE-MsgGUID: NRFsPl3ZQJa+SoQeIuQs6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="88519369"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="88519369"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 15:52:28 -0800
X-CSE-ConnectionGUID: VWHoekOMRYOoEoaCLzdpkw==
X-CSE-MsgGUID: dJeeqaopQu+bpFcT3dxyFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191849235"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 15:52:27 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 15:52:26 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 15:52:26 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 15:52:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QX229Y3EbpRTxJR2kI8j49nMjqoYsACEksyU8whLdMGCMRS6soktqv8aXRpRj2K7XpJswPTWym1OQ8YImLUC4UxYv4+e3YC/TCfCNNxgqEwb/cW4WaLyjFtkHTLPUFgeNYNBsuMxJUeNzgJmGuaecs+tshcHpsXd+lv+/rwWzUtEy63UguX0gFdATN2012Tqk8IPmUi92eRwiMiY3AANIGZZVb1PF26yBL7awEKAnvPG5pcGrPyYFQfBLPWUJpc0cHkvL3KrQIBkpXPkxaipG2QMIlThJUgny/clCrkDX2nDs8nuKRtLse92o0InVmWQv7Yqo4+mhh2NwNjtIWdKbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaNIl+RGciVC/nZKmKhvvsl1v1bQz3hNtriSbxv8Fhw=;
 b=WwG3SYZoeyZIVOir7ElKSvaz4vhAl+D+y9P/dLlba/vANf04e19hsPhfS7O1h4jjt4CV6OcA9rsDsK1Kowfp26DSvqB8js32JYK7pQSpjSPIeKgK+M5lL8IPput/fqGc5vpLdAaOB47wlO6XbnchMYgAD5+m9glV1WoOr9WeGtdWwLECGwbRI0AKK+ZuwJoGzngaVPN3UxCRDfj1LWVyi0TAG/CpwHzSY6vdhSxtuAFOYXx/DOtD1xvnImzX6/0JhzXPv/Nql74vKzhN+tr2PRSrGzJnCGp1znDyAsgrsFURkYDhiUrCfvMT+VlGaInf+rKSUvtbgMF66b/oleyQdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 23:52:19 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 23:52:19 +0000
Date: Fri, 21 Nov 2025 15:52:16 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <umesh.nerlige.ramappa@intel.com>, <christian.koenig@amd.com>,
 <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 5/8] drm/xe: Only toggle scheduling in TDR if GuC is
 running
Message-ID: <aSD7MA19ZRpDlMd_@nvishwa1-desk>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
 <20251119224106.3733883-6-matthew.brost@intel.com>
 <aR9wfT5Fo1cXJOMp@nvishwa1-desk>
 <aSDicfL+Lxktv2sA@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aSDicfL+Lxktv2sA@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:334::22) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: ebaf7fc5-4e92-4984-0762-08de29590207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qBgF+0eRHl9phRPL3OtYt0tkq9ApT5QBJoZlpVaEGl8ZlxEc2I59TSEGAEl+?=
 =?us-ascii?Q?3Cfjhgqdpikdr7LfsbGh3/kAEe2DzH8fKiGyJ6vjUL+oJ6AZaRFcerXvMUO1?=
 =?us-ascii?Q?I/DumU667Ntw7qK5cOQIvxuvdRJlXtNUxUdDbzgSFZBcHYgU03Ye7r13DJME?=
 =?us-ascii?Q?Lz+e9cNlAeWWEZjZtMsEoeOQqZkKt/ZbVQKZ2RrsnL0rG2JDj696giGSu+AA?=
 =?us-ascii?Q?kRc8mivoj337wyIcuEELtOpoTBo8P1txhchJYe2Gfi4pYnZtIRehjzrAIZSL?=
 =?us-ascii?Q?68GIpvaBBFu5jEBk1QxM43gnt8uvktM8Tvw5EB695g6DtLoaA/Q8LWj3ayhP?=
 =?us-ascii?Q?+3lYmaJ9vQfT25I+oHfPcguG8b7PXIFTXkxAPX1b3d5KIpZL3lsVWj249Y7A?=
 =?us-ascii?Q?3URKfH610jbxdFCBr8J/662MQaernWeZcevIVmQhQ7MWYErmKrolGcfU8fnk?=
 =?us-ascii?Q?YVw62WhVtNaWytrnVyj3ZlglVQLZOMYZ3Trhfne8dBW8lwKVseOcUkvzHF2m?=
 =?us-ascii?Q?oV7gI2bxnmYuQtToXOs6RrPsXiCrMniiGgx39ElFeUzqoecvntqyCAOpjigM?=
 =?us-ascii?Q?8iaz78bBPz2rQsVq3WqQ+oi2B/qN2iPdsf0FtWyg9quTe7FJHNiIgf0lHS3O?=
 =?us-ascii?Q?B94YGAr+593+9B8QvCjbuBEL1kgnSQ0uPY7EwVgMgMBFI2JRXSfNumSWkQ+h?=
 =?us-ascii?Q?zV0YroOmYv/p/Km5rBzCAcZQ6D0YOQQVBPbT9mVTwJseyXuagAFZujvoWy4a?=
 =?us-ascii?Q?PtYXlMDIH8YKWrOoswYprDKPyqQS6p/XDEWEw5ehSPfGHWze2uX4uboTKSV+?=
 =?us-ascii?Q?Trg+AqPJv3l0SkIiSmZam4JaAAKtWWLORqTjPDIjPw8W6zUtk6TRSAaa6oSO?=
 =?us-ascii?Q?kHq0XEgkk95PUEjCPFQ/vTt0uVq34I7zquwjaxlPIi3LqPr4uyUziGuv1vDe?=
 =?us-ascii?Q?2N8v/j3l0qrtp7GqF4nEd6WC8L57ztS9cKzeD7KJfV4rXzjEcmGr3010i1KK?=
 =?us-ascii?Q?0RApAgqdb9YO54WB3g+bpC/WFZ25ntt3bUMG4NUNPDrcmoBpQN/To9GJds5S?=
 =?us-ascii?Q?srUwwy3crm1WEmnDh3sPQB04H0Aq8mb8Pd6Q5W20b64FZ8Uhgh9przFtSzk/?=
 =?us-ascii?Q?ZELaMjsoYB5+7QUlbBXHZWEDC7zYw5xjo80HtNyOJ7u6uvr2PymGNkcJxNJU?=
 =?us-ascii?Q?TG0yc/a0G2yqHoNvK+fjU2VR2DrhTeBP/j1fSwd59eMU5YJiPqIPgXCf9Cbm?=
 =?us-ascii?Q?iF/+Ls4+lUwgD4Yz38tCDWEtbiBdxjQuWFqeGyhwYRT8bzs5rcqN2Uf8xS6Z?=
 =?us-ascii?Q?gcgXDKB8vAGuZhCNCcBSNEaNYIjkEMJmAboL6uPr8i8SuOF8zETgrHdgTGqz?=
 =?us-ascii?Q?Dxdo+TWOkBCftBFYFP116cF+g1/JZY3idQHQY2pguHd3Jv2pk0i15Zsbmx3P?=
 =?us-ascii?Q?3/Fro/Mr8Dx9t3lsTvOxE2WDbsvdYkw8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2MmJGRyi34A7xE1rY924+SB/bKdctAwUwlAnPzvbfwDvwUqghrJNubdFhHVR?=
 =?us-ascii?Q?x+k3RkfV/hcwmCL0oLAKwVPs+8oVyPYCU0Mm47nAO2VrYGx0p8msjpZFcgDr?=
 =?us-ascii?Q?IFxLweJhMXgHZcCaisrUUE+5uJeG34G1fxqImvyFZhhT9Gxix7CFZ4gn1cuz?=
 =?us-ascii?Q?EU5ZJWoWBUhg8128etplKBxw+1KEw+rm+YweEbm7Hh7fQQan7falhB9DkK0q?=
 =?us-ascii?Q?q8BJxOXKYjD3iTM5uvFDrDZi8lBjLtIKaU650EWIVa06CSHqTf5IPjltGlIT?=
 =?us-ascii?Q?6ov1lMhFUW5uBT5Hv0/kPc63UTI29DlUV/RvqqwN4rrI/6XjMz3/bre0x5GL?=
 =?us-ascii?Q?T3Qy+al1fn3mtn5VifsL5+Xsmmta1wUQ4S8mHN8WIVuTXfHawXHD0Cz5/3YH?=
 =?us-ascii?Q?UZpyWA/Iho36IXiT+vdOkjDhXGEcE+O3iinQz3C33jVILCf1pCV6H5cdgc+R?=
 =?us-ascii?Q?x67aH90XR1RHS45eegecobsff/VlSczNeEoXg9/IzeJuEQeUV6hCl9FeNR9j?=
 =?us-ascii?Q?RxEtjHAwqD2bEIgMVI4esTTdTf6rt/egH9fJw36obAa4Ass+jr2/5nGszuu9?=
 =?us-ascii?Q?tDUKdcdZZ3jWwrTmRQNy3wEBu1QAZOmiSFzef4ocpzTgNVcqtxrnd4bYWM7P?=
 =?us-ascii?Q?f158yTUu3NrQIUcE0elfGeQknAEn7VKvU7UT6wI0/tcucfKc+CDjPDYRYJ+L?=
 =?us-ascii?Q?9xp8be+p65l3jIl7zF85/g8XG9j25EU7xoz0iHuLBGM2ByET3O00Kam5Xxo7?=
 =?us-ascii?Q?wx6UwePB6h73NNA7ScT6ztj3ME46haSpTSrqC5G1daBTsHtBFir+fJaQtViF?=
 =?us-ascii?Q?+WxHo6O4HJ7dG/XcoozjLKt6eQqLxyMQY4yC0lCQCZJhFWP50zGK9Qd0Z54D?=
 =?us-ascii?Q?Vy381iudOz7cLtl26GWZdxWdiYo+x8ZzQtVaxh21VvVmUh8L6VcCRnQm1AF4?=
 =?us-ascii?Q?RFfJ8fZVtOcxbNgEZc7WTZ+4Dgp+3F4r6Cya0eWvKIdSw6x1SeW4Z4GIZitE?=
 =?us-ascii?Q?BuFXn0DJKvUK76vXeYikkH1lrCKLfKUVJ4HVNREPiUEyHKTHVPPO3db38YsZ?=
 =?us-ascii?Q?oQUdnXb3cvXpT4q3gb+Rs8hJUV2Vv+UppHowp8MgWQ73o0IWbEuBPJnX51aA?=
 =?us-ascii?Q?qZlwlDtDfdC4IFpqb7x4rgbO9vsNaM3hNFWTMKEmYkDPo0F8/b+USw7WOewY?=
 =?us-ascii?Q?6wum4ywUS51avT/fyNhmlmGkZEnhe5xaBPIHZEgeo/FNk4En5ElU21hTIsZd?=
 =?us-ascii?Q?rX5Pebuixqj5YZBxFUm5iya4/Ha+Rd5/syHKBbTX8NOSli4oJnWU7nZOO25d?=
 =?us-ascii?Q?8b50QlzYHNIgo11kdKFlCPwQQZ0yukA46bnFWYQHd/G5Rf6YQzctxX9Rvhgm?=
 =?us-ascii?Q?AvQzTEl8QMncyl0c9Ct33+kO1EBEcM/TjYbObyqV5jJPRIetGeoV/FHPkjeu?=
 =?us-ascii?Q?0sdQVHhk441ehPyy8WrNW+9xvI232/N033cv2RAfd++rPs33ZqRg8YO6U4t2?=
 =?us-ascii?Q?hvkHFOn+wLtPPaP5z7hHA2tGaQ0JTmFOy29Yj8rE6Mp+DZ/nrHA9zNkVEFGp?=
 =?us-ascii?Q?YCDw7OKE8+6DzryPLfiXFkAOTiSL1RqgpMDX+3cSjp4uJdlYxUAVgZd3MhHa?=
 =?us-ascii?Q?n8B9Dlw+9D2vD3Lgk1K1G4M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebaf7fc5-4e92-4984-0762-08de29590207
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 23:52:19.7106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgKQlXc2BNPf7/w/QYtXrVhtj4XnqNM6VXNM32KebWV1gkUf+ioweuelzsArJIDcVmIM87jN9QEFtejdnmUgY0oIZ4eCziNiGIWVpy8K8ViC/D6v09N0B6F12avLMNLe
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

On Fri, Nov 21, 2025 at 02:06:41PM -0800, Matthew Brost wrote:
>On Thu, Nov 20, 2025 at 11:48:13AM -0800, Niranjana Vishwanathapura wrote:
>> On Wed, Nov 19, 2025 at 02:41:03PM -0800, Matthew Brost wrote:
>> > If the firmware is not running during TDR (e.g., when the driver is
>> > unloading), there's no need to toggle scheduling in the GuC. In such
>> > cases, skip this step.
>> >
>> > v4:
>> > - Bail on wait UC not running (Niranjana)
>> >
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
>> > 1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > index 3ee35d4873bc..648c9ea06749 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > @@ -1277,7 +1277,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > 		if (exec_queue_reset(q))
>> > 			err = -EIO;
>> >
>> > -		if (!exec_queue_destroyed(q)) {
>> > +		if (!exec_queue_destroyed(q) && xe_uc_fw_is_running(&guc->fw)) {
>> > 			/*
>> > 			 * Wait for any pending G2H to flush out before
>> > 			 * modifying state
>> > @@ -1312,6 +1312,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > 		 */
>> > 		smp_rmb();
>> > 		ret = wait_event_timeout(guc->ct.wq,
>> > +					 !xe_uc_fw_is_running(&guc->fw) ||
>> > 					 !exec_queue_pending_disable(q) ||
>> > 					 xe_guc_read_stopped(guc) ||
>> > 					 vf_recovery(guc), HZ * 5);
>>
>> What if the wait exits because of '!xe_uc_fw_is_running(&guc->fw)'?
>> It is not clear where the control goes in that case based on all the
>> 'if' checks that follows this wait. Should there be a specific check
>> for '!!xe_uc_fw_is_running(&guc->fw)' following the wait here?
>>
>
>Return will be zero and we should tear down the queue. Also I believe
>this is covering case where the driver is unbinding and schedule disable
>CT blew up a warning. I think the logic works as is or at least I don't
>see a problem.
>

Ok, sounds good.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>Matt
>
>> Niranjana
>>
>> > --
>> > 2.34.1
>> >
