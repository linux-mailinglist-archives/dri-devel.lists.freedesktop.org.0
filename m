Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FA45B1FE6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 16:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A479310EB02;
	Thu,  8 Sep 2022 14:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04EFA10EB05;
 Thu,  8 Sep 2022 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662645610; x=1694181610;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=aS72ZCjKgg9+gI2MnX5wbUYGTVg2i3zC4nXM8SrggwM=;
 b=VRdTpHzyVIhMDbDCn+bSV5uPgreFJyY1EoxJnesOy3PZCVWDZOx4PBpF
 OG1G3MpC3MQJ9gTpQIXv6WeaKp4va7KvnmSqd6m4+B62dFOPbAt79ZXfr
 R+5FlnBZsBwaxPBlba5On/1gWT7q1lqEGNO52LyISJUZwr1ng1wcdiZP9
 RjVg/iAkBJsF2Lf1qoZkKepDakF7k/llI7clGgzdN+SpWBKE4CkgqGAz3
 dvmESTKrOYn7RqcCIykMan94Hxy9CFKn79x0yKf6bekP9u76OsJZKfwbS
 41FH61vv92Ip8Wt/7HgJYvsE4rmHbCdl2TdxV+rBmgoWn+RM5isKq0M5t A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="294757024"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="294757024"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 07:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="592174757"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 08 Sep 2022 07:00:03 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 07:00:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 07:00:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 07:00:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hl6HkTVFyeMyFreIP526fVnw6YY16hl4rXAvSoQoyOVGLlyGR7TrkS3bxqnWZgvpT9KJBbL/5lcER7Ol1py5bmPwhGHFTymosjIOLnMqFX/ZPoIDSN4xkH02pjg/aFJlqfJ+HZat66tRdTIfS0yD6MbpnjPycG+OZnMLAGUg/HPf9JxOaEIm5QlBh+ayjNlPVl2Vi3lcYUyQ2sPpIbTNvmkj+7SeGSiGpD+cP3D1Kr/cXdSMIeeR5WU4ni3matd7xoXU5wRQ2tdt5cn1IkuqdPKbieefWZp/zBedCDnc/PBlOlL+Q7ovIWSMREKwm4MscJMziFAiDTy6ilVMQgyy6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=De1S6yZQHXbMRnuBpKV7Mczo1EJ1oMhPnD9u7nnMdx8=;
 b=Rfl8G5w4Km39hhl2BOmF36OTLe54DhNHe53wf+zrjlJ1rnaFyBzfQrRa8VFU33Yl7VnOrWlb73gkFuBTXWA7H5LrZt1seBgVKQHh140QNsBF3GQ9n3JLifs4DPtkZI2SB66BQf0ZpxUzx4WWeHoHnRsJ1JWSZMX0B+qT6R1LJMUW0Dp6SA8qqqWiLr9sjWUxfuE7ZjbuC1aDCKefdcCTuaBq6vGs75aF3yg9aSisBBAXPsUMcJp0HVKcZ7Pkudi7m81QJNBtwa3cADmcn1yzGutYwqfAfsDL9yd4hrfn0ubnpiL6CTO5XUS/yWTp07WV7lbmE/345Pe9wtchwbMIhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Thu, 8 Sep
 2022 14:00:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4%9]) with mapi id 15.20.5588.016; Thu, 8 Sep 2022
 14:00:00 +0000
Date: Thu, 8 Sep 2022 09:59:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Yxn1WpmUJnJpqq23@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0192.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b0d66eb-cc50-4a1e-d66f-08da91a26b6a
X-MS-TrafficTypeDiagnostic: MW3PR11MB4649:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RmH93u0hlXzzZUXdp4vm+kHambcFKd+kTAD0zzocHCK6qZzhf19wFu/wQhEXXw3oKKCMXPNZlvUi448OwHg93dHlhofdUP81dHf7T4bpAYm9Qt+62DsnXTAX63t7At/OvLykcTsnuT0BWPDugi8whH/L7SHFM0voEsiVmYjkm2udKR13w6p78etiFVLN2RNze20DxT1/MPJMUVuJHsfOs/ueHCise5Jjdzn7KjISFPbjsilZD/EJH9aGhpx59FMwwT0hT77mWknviLVzhbf7EG+HPl/QdZ3dGWFEdGMca8dj6jSfAFB+Jg12TuqRTWEmJapklAM58ZlaAKkXh8jME+g+C90g4Rotmouo4JhvYzVl1hloRFxLSv60YtA8kbiHU2D0qXEJNBRNvL6ja7/6amGpT9OKVuYH3VJuNaPg6ATRgWRSgR9xWCXbC3P0E1gvbbjaFFqFTas8ReSHBtztmecN+tGLCAtlfUXRRlRlt/pOOTm04YJeK3MH1+6cFE5RhSvkB5JHv9Red6liQyRiJYWElkY5+0KyHUMEW6ca7RY50yDnmoWR8IjkxFsZNCNxKOEhT3vssiErwsuTl3JDQcM89t7ZdMEo51k/NmEIItlwhToCy4bYbb7UO3+liDb5R3VVO/y3JOTAA90ul1hhhCv4B4fcyE4h8mhLUURsEB6NX9psiSOq5h+AHdEGj7EhnJAELhF16EOcfkjcnGuf3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(346002)(136003)(376002)(396003)(54906003)(66946007)(66556008)(66476007)(8676002)(4326008)(478600001)(6486002)(316002)(86362001)(41300700001)(6666004)(8936002)(83380400001)(110136005)(36756003)(7416002)(5660300002)(44832011)(26005)(6512007)(6506007)(82960400001)(38100700002)(186003)(2616005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QkqrC+up0fSk3pu5DIcJFbHWpWoIZtBR/KBMbcSrmgga78DYb/mJxbveE7?=
 =?iso-8859-1?Q?87N/aqpj70ydDsjgLMFUQ8QggX/15CM1Zzc7XbmAk1bfsy3UOky2SWvmZM?=
 =?iso-8859-1?Q?QOkAj+1v+U/TSXzZr3Qahx1TYshvlloytS/QnmFUqNpXiRwBrb3jV+/Ydi?=
 =?iso-8859-1?Q?8HZjldSyqp+cNCmRK1ct+BixUyz6i7RHx9gB4Fjh7AOv3Y+aCqj1FAMF7p?=
 =?iso-8859-1?Q?AfgUliNe++p/f+LZG0GMi0dVu1U+dqTN5ZM5rfJgdD3GH7kRaOiofR/Hrj?=
 =?iso-8859-1?Q?Q6OnudOYbgZHMDWuhCpZhTk3Euef6LDB4TYqJQNlHn76e0JZsegLTTWJy6?=
 =?iso-8859-1?Q?eG1+eOQaslON/W8HVz5NPxo2ZZXZ1khTRyl8L10sStGtFuLS0VaUvfQgR/?=
 =?iso-8859-1?Q?Jl7xV9NUSoCUcHIW8meQMRYLdR+5zoM+9cwrig606YXp4jfBBE0Kq6Dum3?=
 =?iso-8859-1?Q?GXXmzhVnwiWMNiWfTMcs9MAHc/qnuLbRLe1RBI+eWUEiHS/+lIJaW8JKqK?=
 =?iso-8859-1?Q?/wvKZTx6LnJZTsTgYR81ItPGGrhBZATCYoIsda2qKFM4tfBhAvrO5WjfXR?=
 =?iso-8859-1?Q?Ae1tEwSOJduT+DP/+K+MMk0YMI3zoNsqOwwaqzWAvXT4qpFWaV9KzJI+sG?=
 =?iso-8859-1?Q?xgr+lAjnLRSD3arlUTGrTZVZip9CcUTf5+iDf3/pBpdFw6ufNBIa7KCQKQ?=
 =?iso-8859-1?Q?bclYPNorWILen9tSy/YkagOk3SHhN7FOp3eRcD71uJYlvaFxeXeeK3tezw?=
 =?iso-8859-1?Q?MEqcG6RQMiFOwCGICGbQl3v5bKNhO6SEv6uX+AJuZS2uCLaEcfEAAgXC3z?=
 =?iso-8859-1?Q?37r557fTwNPYqMoip+qY6d3rlpHf+2EocK4s/mqe4fnc0CABTZpfpOpZRu?=
 =?iso-8859-1?Q?NX/Z2rvI3vUOkE4llbW+bk+Bnjab52sZxCR0Ym1+Gfj29PQXECSnaZJfvS?=
 =?iso-8859-1?Q?ySk6mewqvSUkcjdblaBqy6zg1aGKHki5rZwfeJG/4DL34HN63pOZ4bkbLV?=
 =?iso-8859-1?Q?41GqSsU8AHB2NF4FIJN/EZhWA0AYHPehxsXQ59o9r4mdgNZarGq/eiW6YC?=
 =?iso-8859-1?Q?hvZ2eZGBmPVF/BuahcPUjCnix4K1sgAWiaB1gihfwoABwYFKBJKesWW4sg?=
 =?iso-8859-1?Q?oIH4dBV4E1skcjqTwFHGJ0Cxpd/2dB7KNPbTRDZY/SCu3g4YXvmKQi7Y8H?=
 =?iso-8859-1?Q?7L+R5CU76i7JdnWXZMlzIUnRdIC4MgeM7KYk2PAl96pcPZEREK1wXwStwN?=
 =?iso-8859-1?Q?ok2swQ/QMWD60oAu6BZJsjPCJQmUEDsXq9pfrAZ0C4E4O0Vsvp04JfwUEc?=
 =?iso-8859-1?Q?32qPU8OLrnySiA4OTJB1qWvanrCuJUpLCqvDvSq9F64QmVKiG4znmBfjwP?=
 =?iso-8859-1?Q?Rn3oovlzvUoflTFM0SEh5x0Gcnr+iiK75pQdrBjJN+zaA2pi58B8Zslez0?=
 =?iso-8859-1?Q?KpsFUJ7+rWUpS/7HyX8F1UtKkCP8j2A+QosaH7IeU2rmBpAORrNp4Bufbz?=
 =?iso-8859-1?Q?A0YZM5PZARJfP6DRio7MyERa7047nk5ca9DcgJ/2x/bLSZ21q3UqjOGSqz?=
 =?iso-8859-1?Q?TcjlnKaGPR642Bz8nWx/UIBIFXjzdoT4BCOk6SnEaFiRY7RDl2YcT885Oq?=
 =?iso-8859-1?Q?+L7yhKHOqgB7mQbRXk5X9jcwr1Drp+PhRrQMAd7+/sZU4O64jEgYGTDw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0d66eb-cc50-4a1e-d66f-08da91a26b6a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 14:00:00.1270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAPbqZywXW9ZAJrxJ1FN8/8dr/MZEuAstpKcRzEvsm5qlzgYA5fvNNe5K3aoyc1QQg+OGtQdjUz/lpA3VTHtnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
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
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

A few fixes, but most targeting stable.

Here goes drm-intel-fixes-2022-09-08:
- Fix MIPI sequence block copy from BIOS' table. (Ville)
- Fix PCODE min freq setup when GuC's SLPC is in use. (Rodrigo)
- Implement Workaround for eDP. (Ville)
- Fix has_flat_ccs selection for DG1. (Matt)

Thanks,
Rodrigo.

The following changes since commit 7e18e42e4b280c85b76967a9106a13ca61c16179:

  Linux 6.0-rc4 (2022-09-04 13:10:01 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-09-08

for you to fetch changes up to 151e0e0fdb4d6365305598af3b9072d44e896ef0:

  drm/i915: consider HAS_FLAT_CCS() in needs_ccs_pages (2022-09-06 14:51:49 -0400)

----------------------------------------------------------------
- Fix MIPI sequence block copy from BIOS' table. (Ville)
- Fix PCODE min freq setup when GuC's SLPC is in use. (Rodrigo)
- Implement Workaround for eDP. (Ville)
- Fix has_flat_ccs selection for DG1. (Matt)

----------------------------------------------------------------
Matthew Auld (1):
      drm/i915: consider HAS_FLAT_CCS() in needs_ccs_pages

Rodrigo Vivi (1):
      drm/i915/slpc: Let's fix the PCODE min freq table setup for SLPC

Ville Syrjälä (2):
      drm/i915/bios: Copy the whole MIPI sequence block
      drm/i915: Implement WaEdpLinkRateDataReload

 drivers/gpu/drm/i915/display/intel_bios.c          |  7 +++
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 22 ++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  3 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  2 +-
 drivers/gpu/drm/i915/gt/intel_llc.c                | 19 ++++----
 drivers/gpu/drm/i915/gt/intel_rps.c                | 50 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_rps.h                |  2 +
 7 files changed, 94 insertions(+), 11 deletions(-)
