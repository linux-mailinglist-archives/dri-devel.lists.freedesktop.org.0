Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841D16DAE30
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 15:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AB910E033;
	Fri,  7 Apr 2023 13:47:30 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDCA10E033;
 Fri,  7 Apr 2023 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680875248; x=1712411248;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=09DVNyZIEYCYFdYbHdT2IkE88Kg4XLeGPfRwNkWbnzI=;
 b=oFVZj2ji5tc6aZHYahZaUKkwxd/PpMiHjtZFJ+BzqXAhA1VX7bIwnkl/
 ctDguzaJ0GvZ3Za6yF8ayuRxHIPIld4Njc4aY8hNcUK0TB80yraLA53kR
 5Zj7CCExmHmbfZj0/AndhBQL8Xsu1p4vdD8z/lrxU1nFyQaUWZzFX0Jhv
 CULXDz7qCj8rjrrW5fctLY8BV0b/jJ8xh+heu1vtimrNmbNv6bARQAsNG
 pgNHNYAIV3cHeklks+0vMrzVAz1xXOdyZ7x5UVOk41IBWUx8B2sm+K5qa
 EGdyhm4SKW58TmI3aVyJCMAI5HS+ChL6lfub6xse8HiZTbXm0w1MGGD+d A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="345636764"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; d="scan'208";a="345636764"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 06:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="687519566"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; d="scan'208";a="687519566"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 07 Apr 2023 06:47:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 06:47:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 06:47:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 06:47:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVZIlyFZXWjWB9nH0uPL4X1LLE76QdMUNae3bZZGu60pjqM7UpCuMucx/2glOtpxYDgSDvPmM6JKEDNLi7ySeJfzfnj+jd5jDLK50MbKtxOlxY+3x4EHDvdSXrjBoZJ3SGv9ZNNMspW3R7W564HTebw4NHtaVATgTWYAg//WjD3czfcWBdMy96S3ha9O21FhRODxyKvVis4Kn24koA4j7ikPUV43Nhz43mLCMOkdD1lTc10hfIcgjjHkfHyCVODEMEIiHA6lkErLeF8b/l4kZlqt2GTdmjV+s3Bp7n8afwDFUu6dDCfZxpJ0n9pDXJVY4sdic4Fh4srQgSmlpcrq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/iUIz1claKdbLz3NU7PhI2h7XYYf1S8eHttWd+wPCc=;
 b=dP2k7kxDwPUJabJVH7Qo1fBBli3B4JAdpCFGdPRlXp0YSkOdPDAmTtbgX3sFfFzRPTnfeh6cZQFgbOdFwzKNtKtbgN/Zy2WokCiLw7vWsE3ils17yJZXhrFf9mh6ZoJLvGrpTRgWhWe17olxOF1PX/u/vvocWujcmJ3PpguWbvbVshkslSGIVr5+3fIwI1pCU1Svd0+SIEXQ/nSx10BmuUdEzvXOF3jBy+1ESP1SJC/wHL9h9LBOYu2lCBJino0oqO6cO08hsFA1Cl/TSYG1e0vbq13R+Xyl88IlQJXYqFy0cLC7mD+MDYbBSQxHJla+uTWrKimiLaa6KaPlpWkLgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6315.namprd11.prod.outlook.com (2603:10b6:208:3b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Fri, 7 Apr
 2023 13:47:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Fri, 7 Apr 2023
 13:47:24 +0000
Date: Fri, 7 Apr 2023 06:47:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [CI] drm/i915/mtl: Define GuC firmware version for MTL
Message-ID: <20230407134721.tg75qg3jwpqgbms5@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230331225216.4188274-1-John.C.Harrison@Intel.com>
 <20230407003758.lbpvzisom3rw5erx@ldmartin-desk2.lan>
 <ZC/mUClubdajvFlf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZC/mUClubdajvFlf@intel.com>
X-ClientProxiedBy: BYAPR11CA0069.namprd11.prod.outlook.com
 (2603:10b6:a03:80::46) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e094108-591a-4bbf-9e12-08db376e9de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OdqMnO4KpcJNQgryd78B5cWkHPlJnofvByv9Aeoe9w2tagouRyc7SyKJBTO2xH6i89JYKlS9StfWN/dUo2qdgFv5dWyBC27dQjE4Rv3uhdppcwowqMWaBC331giBYzwCdnAxTseaYvh9CAvp4x/hVaICSThkKu/p+euDlO4z+UJey4yuvs60sBQa9nZv/ku19qN59jCPAEaJJ7WVmytz3iJ5rR/d5vB9brAB3TXFqmNdxg6N7Ew1ON3dE17yWjt6b8Cz9ZgO11i6cIg3Bxx54JwmjEniYlOL15P8RGU1FFsvkXpgJamaetaLWWkqxsglUG6+AfRMsgsI3dppdqo9ak47FW8I8CJ4Zlv0drStOEZ3gNO+Ln3cteRpmnd0FP/Br7+rhuy56Uf+hwVqYqH+zho3eAVJAo7iGBtiZUrVfNVocrcZAQqtBkZ7FVilsIMes6OiyIe/AXpLxbAmnZihjCVXzJseXr9d46eUZF92cOr2RuPrnNhumKTzDqMdKScWqdiXs/0s7EmkTa5Rz2+5awtzkUeiTkXvSywae9FMVcmtKRx+7+7zQgwbe1YUVJ5f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199021)(4326008)(186003)(966005)(6486002)(6666004)(83380400001)(86362001)(478600001)(54906003)(6636002)(82960400001)(66556008)(66476007)(66946007)(41300700001)(316002)(1076003)(2906002)(8936002)(8676002)(6862004)(36756003)(5660300002)(38100700002)(6506007)(9686003)(6512007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/+mq5kGFCntS8lDRFopdFZrjg1Ov1W4MAykftl4cKM625NcZBDwLRRuE9HyF?=
 =?us-ascii?Q?sEvQOvMefCZ+bhEQNe2Xq11PibMz4ldpCHFTRJXPnqzV8G8J4gK57WQlZ2vY?=
 =?us-ascii?Q?0NJPdTwkCE9vI93fvbNLvdLn6P7acsdEWiB3PlEo4vZGU6oUXFm5zYsskD4v?=
 =?us-ascii?Q?W+PnO0KzF0p3tWfsDx1LLbH96DckdmgHdoS1FhZbX5LMJAiEYxBEpkOxXZJH?=
 =?us-ascii?Q?3Xl1XQt42as0V8N2pJJO/3jZI/hIP/sXOvQsr7qUPbgPVlRT7DVx8iuMYRWY?=
 =?us-ascii?Q?JRJTidLJYQ8+YhUg4fb7R79cCkIaCqO644qo4gGZo4OO0tmS68etbIPMtsM8?=
 =?us-ascii?Q?QEBL5fdqtzPKVayRHjD1NcnBO62WvDY9Rs/meKMkcVu1/7i/KVqhl02Cd+Gq?=
 =?us-ascii?Q?p92hRtVVmN4XkMyzYhfRhlI4CHIBKRxl9YHPprz0vWYStFrwF3c+09GkZw81?=
 =?us-ascii?Q?rvkTO90Bed6ycwjZp+RZeTF8No29kUkjEDXjebc7WknK1J9CoPNOUlJrw6lE?=
 =?us-ascii?Q?aXPmO2JLyCLvYW3vReFvQs9+GjzMSCYZ2D3/F+UTCG2oIgvMh2b7XT7mthwq?=
 =?us-ascii?Q?hjOQLIXslTul0VNSMWklpLUUJBFxELucOt4vfjbk5A7nEmIn8Ri4nC9HbAlF?=
 =?us-ascii?Q?uU6Qv/PjX7JGjLqDXPQjif16RHS4CfeJRNNXRuVhUk0vnDb2l5FM1quRWIGw?=
 =?us-ascii?Q?BikklHQySduqkyoI+BEdZAFWgIIaSOQOTWkqUuqmb+ZomhmGzvnxHfn88VNQ?=
 =?us-ascii?Q?u+LolHt0qJgpBjXFqW1ZIkUNGVGATeguf0bhnm283MfswcWk1tnfgi1eaNnV?=
 =?us-ascii?Q?Nm6/rnSe5M3K8OcNPI2H8UBbMWm4jI0NrgSdaRVXcqYJ6SKpxYDnb4vhOeri?=
 =?us-ascii?Q?Y75hpDCdnqbwmgJ9eI/OrsrYeyjVkCLYfnpOen4puBXA/ApwnoyiGcQVbqP8?=
 =?us-ascii?Q?HzUoXjE2WYA6qxA0p2RJQLQaTF3DhT+C/CJ2Dp+QoB5OLn9lNxC24hwEI1oi?=
 =?us-ascii?Q?UnrJIAnAfA5zTv7esMosbVaMbuij2KQQdPSZNJAVDyKNQgqq2iBRiGe0vha2?=
 =?us-ascii?Q?ahy7KmfwaWFSpW87m3HCLrF5tYMwRtSfj+zAKKKbpx+GqJFyp/ZsKh9mTJ2R?=
 =?us-ascii?Q?fIz/awiG0euOwfduEgaMsOX4dXWRPffh7Z/NCgZ5u9jma+E9ct8cDd4/GxbV?=
 =?us-ascii?Q?u1emh1N3KzTIuwlu0HIALn/8iQ5xW6qOXUekRi/EDctstkqxz4OjibqYPr2n?=
 =?us-ascii?Q?FzefHxGaBC70rcxGmdzDNdMWOK76y0HRN60aADptflcQW8RS615fpEP4Ip1P?=
 =?us-ascii?Q?3W9Cgmw70s8Cx/298/+Bq6rkPRXgG9F8BG5OkpSKz329VZy5tgcKdT87xplw?=
 =?us-ascii?Q?nFFuqoc9hWoDXj+pAibggxsIruEOR+1Vb9JW+eKe1NJ4pVzy3/8NqtHa2J9G?=
 =?us-ascii?Q?MnuzDNjHMgG5XHcp/bEgsx6yU/Mv/S3EOTZY5TQshSXHwj1m7k4l29YHnvXV?=
 =?us-ascii?Q?4WsC6x6J3k086W9ZUZk6Or0iki9wV9fGH8dZJFiO/xCBuJN3dnJNYFvP9o9R?=
 =?us-ascii?Q?ZClmJ+iMpbdnoJ6eG6pJkQMqfLvdB0LKt6EJT5pOJTU3NzOdXMjUr0QgUbJ1?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e094108-591a-4bbf-9e12-08db376e9de1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 13:47:23.9642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnsSYx6rDnrZEqiDvtZqYPPuP4zteS4F2L6MfubV0kQe4PNDIIVTY9Un0ja7JPuhtm1M/f5RSqawhIUbgqmguxJTd8OS95dKb8e9re1R49E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6315
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-GFX@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@lists.freedesktop.org, John.C.Harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 07, 2023 at 05:45:52AM -0400, Rodrigo Vivi wrote:
>On Thu, Apr 06, 2023 at 05:37:58PM -0700, Lucas De Marchi wrote:
>> On Fri, Mar 31, 2023 at 03:52:16PM -0700, John.C.Harrison@Intel.com wrote:
>> > From: John Harrison <John.C.Harrison@Intel.com>
>> >
>> > First release of GuC for Meteorlake.
>> >
>> > NB: As this is still pre-release and likely to change, use explicit
>> > versioning for now. The official, full release will use reduced
>> > version naming.
>> >
>> > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>
>> Applied to topic/core-for-CI with acks by Rodrigo and Tvrtko.
>> Reference issue: https://gitlab.freedesktop.org/drm/intel/-/issues/8343
>>
>> Going forward we should plan to have these kind of patches in
>> drm-intel-gt-next itself rather than using the CI branch. The CI branch
>> is not the proper place.
>>
>> To be clear, since MTL is under force probe and not normally enabled,
>> it's ok to bump the major version without retaining compabibility with
>> the previous version, as per
>> https://docs.kernel.org/driver-api/firmware/firmware-usage-guidelines.html
>>
>>
>> I think the main blocker right now to use drm-intel-gt-next would be
>> because MODULE_FIRMWARE() is unaware of force_probe. Then distros
>> would start getting a warning when creating their initrd that they may
>> have missed a firmware. But that firmware itself is not present in the
>> upstream linux-firmware repo.  We can think about a way to hide the fw
>> def for *new* firmware (not the legacy ones) that are using the mmp
>> version.
>
>Maybe we should simply move to the final version path sooner than later?
>
>Even if that means more updates in the blobs at linux-firmware.git, that
>would allow the OSVs to have this final patch sooner in their trees.

it doesn't help much OSVs:  the firmware being used here is the full
version, not the major-only version.  And if we commit this firmware
with the major-only version, there is a chance the distro will update
the kernel without updating the firmware and we will have the wrong
firmware there, one that is not supposed to be used.

Also, if we commit all the "temporary" versions in the linux-firmware.git
repo, we may start to blow up its size. I'm not sure this is a best
practice for HW that is not available to the general public.

Options I see for future:

1)
	a) keep these temporary fw in our drm-firmware repo;
	b) hide the fw def under a kconfig

2)
	a) accept this kind o changes in the CI branch

3)
	a) commit to linux-firmware.git, knowing this is not a version
	that will be generally used
	b) commit to kernel in the usual way

Any other?

Note that this also impacts xe. Right now xe is not merged upstream,
so this is just ignored: there we have already the firmware version
for MTL and for PVC in the kernel.  Eventually we will need a similar
mechanism though, so better we agree upfront what that is.

Lucas De Marchi

>
>>
>> For now, let's keep this as is and use the CI branch to assess the
>> driver health with GuC.
>>
>>
>> thanks
>> Lucas De Marchi
>>
>> > ---
>> > drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 +
>> > 1 file changed, 1 insertion(+)
>> >
>> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> > index 264c952f777bb..1ac6f9f340e31 100644
>> > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> > @@ -79,6 +79,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>> >  * security fixes, etc. to be enabled.
>> >  */
>> > #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
>> > +	fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 6, 5)) \
>> > 	fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \
>> > 	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5)) \
>> > 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
>> > --
>> > 2.39.1
>> >
