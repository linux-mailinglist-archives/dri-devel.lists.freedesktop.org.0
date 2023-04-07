Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFCA6DAB0A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 11:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C9610E0DF;
	Fri,  7 Apr 2023 09:46:02 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C621A10E0DF;
 Fri,  7 Apr 2023 09:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680860760; x=1712396760;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tfLFCr+K3DhqKC0Y30XUHwdFvUfXhYa46RvNTIv4YgE=;
 b=SlnHZnuhoi/mFdiY8xNJ+h07Yemnz4yqgeHLLY/AYWwR9iyIRof2FssB
 p9n+15cSrkjQLt5oJx3HChsWO4T51Jc3jEYDmxBXBHtd21H5WIx/RI+MQ
 zNfmJ5U3aGnBo7AxcZKLtS6bM2ci6BafPNX+rRqtqQPfiTFt1FhuCw2Qp
 pkvhBWd+cDWb5d/F/hKV5Lv09srms3o3OkOuDoFfLGK+/Z4ugbNPfkAY5
 Nn+75xBDtpwSbecyEqsqqaFuwedIyUmEFC5GeDpeioyDXdLN9qn8pf2a8
 B6Xbu7hFAg2aZ4uagdlIQGcQRcsTlxZ9wMTe5gtrF9kSLglQbrN0yrqjs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="408088826"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="408088826"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 02:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="933546709"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="933546709"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 07 Apr 2023 02:45:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 02:45:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 02:45:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 02:45:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 02:45:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I88/rAbaH09iTfF2PoxRSJbsfJlCJo3yWXdSldM2JF46EYqCFIYoheBu17zGTUHzJCx3pQQ+S+zwmdqzUDg7e3WMhoQsrAikByYZMcXlp963gSR0ylBndA/OC7vETVmgS+aVf8LEQyWu1M44GDrLZR8yMwfnQbCMfgux2ZovHD6NzDUYT5lF+LcPixYckH6GPcu36NjTVV90K83DxcRZ1sLK80Zl6vf4QGjr3ONV6KIZWVFWp8ih0OOcS/FOsc4wVkpdhFMsNiKOHmhCh14AWTCK1/LHRban57AAhPi9HeJPUKGg1LlWUS+p5sCTVI65sTOzfgVgY9zm9EAM3szwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IuLN+jGRqGmQmnRLzQHFYwQkWMXbIFyDV9dbW0gmHs=;
 b=Qu7su9xRPUfUsIeTetKGNWpx48/5c1MMTyV4rE+eDZ07p/J2hiRcytA8Jgz/ycDvuJP/VpsQjhmWe950j/aDNNN9kVk5DxBmsFdDOr2d0udFdnFLUYCOdJaQyMK4WLnMl6XuubVhE0h07C37LIykYHV9NjntY5vp6V+8SQLlqUEUUe9/4rUsegapWJIffSSzYFzGHnp6sJJInstNocvgQ24s/+KR0KHPQ2PLgOgt0JKPdbsr2pI0h8/FOQ1Q9NK6qkWNkN23y642ers/AVcsjXX6LQTkAzTFwmyGRUUIq++m9PZbzJPolySEEGEH8d3qO/BvLkI+L/nrpsp4GJ5/Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Fri, 7 Apr
 2023 09:45:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.031; Fri, 7 Apr 2023
 09:45:56 +0000
Date: Fri, 7 Apr 2023 05:45:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [CI] drm/i915/mtl: Define GuC firmware version for MTL
Message-ID: <ZC/mUClubdajvFlf@intel.com>
References: <20230331225216.4188274-1-John.C.Harrison@Intel.com>
 <20230407003758.lbpvzisom3rw5erx@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230407003758.lbpvzisom3rw5erx@ldmartin-desk2.lan>
X-ClientProxiedBy: BY3PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: b10e2123-3b64-4e61-8554-08db374ce2b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8chjLyo/CWd36b2hSdtNKTNAG1YLIlf7cPFKviaTMJk2vQe/zwV+tkcAaKwllgKbucq8ruKd0vvI/j/w0+50XTNFVMN6xQqNfEKy+yT/8I0yhWqk3mOG4LN2nwkUU7WRZMd0y4/7om/rS1K+D72vu+S45j7w0TxVzT4/XZ3fQzFJ2nR9h/wPtCykpmyMS0pxTdL0CF6F3xrXJXv9C4pPmKGaLGvQyIAewAHurO+tdJnSNrmnixpQIlYiFbYub0r1vSvciDK5wD3CY1ivjkSv+E/Upb2zKNz35/bNjRat/4lxXvJuPBxfZBHoNdrRMRZZECQX/+9wbZpTTJR5m5Ne9lAaXXwYIYS0NQSdCUFgQGFfS4VV64HZkc3iw2wOdqiKLH5EYPm7out3pWkmFsxNG/rpANMKkqE6QcjkXfI9ZkP0jjKwoN2LXwIOTtAczmFzAprZaB+ne7KoNa2cWW9uHD8ju0/XqqI0qHTo26UdHvG0qmLwAjXAdFprSXZQAOTg7N4EsgO8VZDfgRqqFDTrzGbVaa/1BEtteSA4+qFdUiy1cMb8ZSYPzX9mwIGUwsHe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199021)(2616005)(8676002)(66476007)(37006003)(66556008)(478600001)(82960400001)(41300700001)(316002)(6862004)(38100700002)(8936002)(6636002)(5660300002)(54906003)(4326008)(66946007)(6486002)(6666004)(966005)(186003)(83380400001)(26005)(44832011)(6506007)(6512007)(86362001)(36756003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kQWtapCJ0DZwbPbyq3vggLiw4Kp3AJBZGa1y5SHtYJwip1eya9SxfTDCTZkp?=
 =?us-ascii?Q?SXIa044JAMOrYuoS6uu/kOFDH10O2lPO6Owa0KKE+UKbnGMywHd3v1xwvhrF?=
 =?us-ascii?Q?3gBP0LBQlBO8Q7P4Sh6wFq1gieQIrd98YLDrryogTLUhxuZ/cYcEZFMKfXy5?=
 =?us-ascii?Q?RGXVNGh2VXBaPqWXFP0GNWLGWL2u5viyWezxZY/48NSGqLaWtYASoqRWtEvd?=
 =?us-ascii?Q?Cuf4u1XvfiB7zDGc0JhOrmU9TOYjcZUab15OfbyDebprC9YIviNn4OFpOVWp?=
 =?us-ascii?Q?383P8drdo5ZdYKupuHm6beLWjSxi/a5lyjG5tfyV2JFhBliHUtNf+QrlL1dU?=
 =?us-ascii?Q?90dtjlXvLe8gaROSAMUwoE6AWGpguJEvhY4mL9gn4iB7A7GG2qK9ZLCCmngk?=
 =?us-ascii?Q?rUuDei1L1lVsuCKXRatw3ee2zObg1bnOCTCEYJtLBE5m261h6wJye+1N7iSu?=
 =?us-ascii?Q?XIkmMr9TfLUIt2WHpKPmiCgaLuE5nVbuzzeAn/iX8Wu1fx1bdkGh0TQHYcMv?=
 =?us-ascii?Q?34gD0DPwbqXeRxx2x4IaKBuhRE3iwVWcLpXS3hNtbwhuOw7RZkFsgGxOqHtx?=
 =?us-ascii?Q?N2Kl23R0KzGqqANsjH/SId8ijTgYsy+/384VgtfRTGhFA1BCmTWpn0hG0lpo?=
 =?us-ascii?Q?/Cbm9RhGLOsUm72wIGmwt4htejUd1nKMXASiFjBQktGXiREXyErMFhJzVEpw?=
 =?us-ascii?Q?cJ40OlQ+Q5LTzx2evhf6hCZ/0fPBq/ltavRiiCtHZ3+Z0LBT7ICn86t/+rna?=
 =?us-ascii?Q?xvieHgrKiDKIGySq3KIumwG546B5bDvyWzg1lkEpbvZDpXbJtdS+xg34MHd0?=
 =?us-ascii?Q?/cG+xPhVmYjiy36q+Gk+tagSQwJ/2v9neHy73jRP6ut00jm7Kjkxzh8gTIYc?=
 =?us-ascii?Q?yMdYOGGNJvGV2A8OQJV6fJn3ZN3ecbesMoCtul/U6oaTusgE/S3BkkO6A9+k?=
 =?us-ascii?Q?a8oE5DPFuiAjyu/psYnPWZNMRqFWbgGF0dfharecez54g5F04JcjyGpqHPk0?=
 =?us-ascii?Q?8icpJxQyaVack88vwBYdQH8DglumzMO08zhp5iH75dCDDcdhQkvEtiumvSvw?=
 =?us-ascii?Q?J6AAuHcqxmN1vfP9Uw5uZOr1A2KJrwAoEl9HobA8pRIPAJOS8VMyHs4WlV2K?=
 =?us-ascii?Q?G58VR06AydaaXFQdHaSK66ST0tiDcMA+2SS6o/TpewdbDqQSiLAq1u0LKNRk?=
 =?us-ascii?Q?Xfk0F1gyPkVSd0HjKSeHJhF9sjRoZJK0uOwyY4wD+j+PCD/Uzcpox6kRAs31?=
 =?us-ascii?Q?ncNaZP4Rr/FT3GhkbIz4GhYagHdx63e6Y+05Hb09oK/ztl+dRMg5nhCnCfJa?=
 =?us-ascii?Q?NhATNZ0T6xeJ2fVGuzEX0qkJz8fmJDgEYooH251bDty+/AEWjnyXiiLHvr+I?=
 =?us-ascii?Q?/ZIe/ZVrDwDnhvt8K4EVHgoSS94y6oh5AVnNjBn63HJmGvGdzQBUFDD08anM?=
 =?us-ascii?Q?g5yj/J7A4hD7euesbRvjr6ydH8/AVNbOcdz3pNOPld051F4vOo2NHknvnIsJ?=
 =?us-ascii?Q?e2KSdXbqP2W0Bq9HWWyOS9SqegIY5M2mfvGrT0fHmFzZiBvL+csmLh8GSM2c?=
 =?us-ascii?Q?9d/Inpkd1IJcsmVARWM9x6CN7ubuH22OsbMo9r6D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b10e2123-3b64-4e61-8554-08db374ce2b6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 09:45:56.6593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCVwLDXhH/MOeQpsKxMKVNXsWxT/a22IpNOEszPIOba6XBDt25uC0y90P2MC/Cl6JeAQU0z83kNGhMZ2EgSDEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
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

On Thu, Apr 06, 2023 at 05:37:58PM -0700, Lucas De Marchi wrote:
> On Fri, Mar 31, 2023 at 03:52:16PM -0700, John.C.Harrison@Intel.com wrote:
> > From: John Harrison <John.C.Harrison@Intel.com>
> > 
> > First release of GuC for Meteorlake.
> > 
> > NB: As this is still pre-release and likely to change, use explicit
> > versioning for now. The official, full release will use reduced
> > version naming.
> > 
> > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> 
> Applied to topic/core-for-CI with acks by Rodrigo and Tvrtko.
> Reference issue: https://gitlab.freedesktop.org/drm/intel/-/issues/8343
> 
> Going forward we should plan to have these kind of patches in
> drm-intel-gt-next itself rather than using the CI branch. The CI branch
> is not the proper place.
> 
> To be clear, since MTL is under force probe and not normally enabled,
> it's ok to bump the major version without retaining compabibility with
> the previous version, as per
> https://docs.kernel.org/driver-api/firmware/firmware-usage-guidelines.html
> 
> 
> I think the main blocker right now to use drm-intel-gt-next would be
> because MODULE_FIRMWARE() is unaware of force_probe. Then distros
> would start getting a warning when creating their initrd that they may
> have missed a firmware. But that firmware itself is not present in the
> upstream linux-firmware repo.  We can think about a way to hide the fw
> def for *new* firmware (not the legacy ones) that are using the mmp
> version.

Maybe we should simply move to the final version path sooner than later?

Even if that means more updates in the blobs at linux-firmware.git, that
would allow the OSVs to have this final patch sooner in their trees.

> 
> For now, let's keep this as is and use the CI branch to assess the
> driver health with GuC.
> 
> 
> thanks
> Lucas De Marchi
> 
> > ---
> > drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 +
> > 1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > index 264c952f777bb..1ac6f9f340e31 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > @@ -79,6 +79,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
> >  * security fixes, etc. to be enabled.
> >  */
> > #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
> > +	fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 6, 5)) \
> > 	fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \
> > 	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5)) \
> > 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
> > -- 
> > 2.39.1
> > 
