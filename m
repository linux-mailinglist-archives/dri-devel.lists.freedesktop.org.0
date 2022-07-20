Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347F957BA85
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0288F79A;
	Wed, 20 Jul 2022 15:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7E28828E;
 Wed, 20 Jul 2022 15:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658331338; x=1689867338;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=21y8sEkBmZ/MnG9bLwAa6TnHdOgljH/rBr8x7Nq2GXE=;
 b=NGI9h0ubg5D0BE2l3TsNb+sFOnWIdbwbAFJvaFeK27wvv48smqdRBJz5
 sukBHKajVA0fOiTYprW49KLSty6CWtPYZAhJb2iZ+M1rnpWtzIyWcdkrl
 +ZelWsPTwltXTWI6AQ3qaBph3KlHBiPvFvQvrkf1Xpb/fpx6tmtMC0HTn
 Sgl4dVHiDpbKdXw7HfXvKjc4U5XzCE8+UocaELX7NA2bFFn9zupXUpH6V
 Egy8HHT0gSxdZ3qj14xV/bCIqhO3wp+IoMNtZrwqo3XdTCm6Lc9rHTsQP
 UOlmwIPwCqbWTVbuOb73RJDJ1v8HqqYL3BiJrJuhvg0ZnBC19EUlK9u4F w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="312507973"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="312507973"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 08:35:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="601995946"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga007.fm.intel.com with ESMTP; 20 Jul 2022 08:35:28 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 20 Jul 2022 08:35:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 20 Jul 2022 08:35:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 20 Jul 2022 08:35:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9xtIaQkjP8Wz9CFiqpcfRlJlecVS5Rqo012YkE516FA1NjzjvlEbQTEfSRK4K/7a1Grvi80CM4HIYxl69mgvg/+c++jKK+zpdG4kDMQZ3hY286EVM8/3Xr1X7Z1OLbnT4tExRWw8+Mpk4+7Q1NYUHf9IdGu+bJzBFjg2on6f43Tkh8U5qOyRFzy5GLE3LPRZnQ+znIbzmqpzbOobCmRkpWDPJs9YBWgqkJ5esFLLqJnVxqRhrUXhRiURY42RUWTSscyMW2q9M4MNuSFZCvV+/8Zcg0QmLnZFDPPhMYnR+EjpD3Il6Cnuz/X+638PnDYr7JXR4+loGof9MfMj2e2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfUi5VrKfm6TXWTw3cc61quQc0X7PbqYPqb7GhIB/qc=;
 b=G8IzyuYYZHhhmMGwowLRL06NmhohnNsZ6bshMuJCFgLVUDZStZ/TBagCcQHBHVLJRut3S/+JTQSZl7mF5bppUvu2TwT2xkiy3JdOvh0cQ36Vquo6NLbXW29fFgt6GtpkQxP05DjLvQ1JWeZIdNgETzFnDdJ7YHyx3gYJPbNIESGdYwiQ6QdS25gncCjZrMZkCF0nQq8NV5nli8XjPdjybGuRdTx+96vZ+ZrdVVS7/zNG4/M3by/0G4OM6ib7oEQ1Qr0YJrdMuj2lDBztqT7rcMFiwKVpKDgwGRWLHc3Yz6C8PT8JoXJRZSXASH0A/rGxplSaXFL5YN6Jh7PsfD0RlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB3898.namprd11.prod.outlook.com (2603:10b6:5:19f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.22; Wed, 20 Jul
 2022 15:35:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%5]) with mapi id 15.20.5458.018; Wed, 20 Jul 2022
 15:35:26 +0000
Date: Wed, 20 Jul 2022 11:35:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YtgguaR5JYK083oZ@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc54f102-d01b-4f53-5aa9-08da6a6577ca
X-MS-TrafficTypeDiagnostic: DM6PR11MB3898:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NRYZgPmxJ7cAFsDtCqXDUNxaja8g5l1f9NdMbnvBy+hYg4pP06rvvllUwKnNR//xflfhjO2mtqLndVt1zTp4Ckzuk30oXmHtfEo0gyMoLKN84SvNJX72YmGyq5ZCDOg9Qqa2rPzFep5dVPLUO0wmDf9g7ke94IHaUd+W7IzZQYUHyEvzDb9YIaXK6V7EriXjFrayKlQfGIoEIOg5biDDD66UqH7rJDYtmO4O4HeoVyP/NF9/2GBK8Z+7roktGErgEzirhJO14nNiiajEwnwyQGINslSDDJTlk1M4tJNDS7J6EUvjS9Sg907fvBYvDFTBOauklLaFjBxe6kP2qg9q6Y1zBqZ7XLUolUOTL/u4EBBQSx92E5ChLD6AxxbOq3jG4T2IRo1iaLHHozd01jRKOFNsezmlj1PZ7rrJXLXVkmSJ0iiXXDf8aP+5H36Kcy2KwxAvsyzhLNFxWvdPVIfD7Hz5S6ZxI45uzNDXkF6wamNTzKm1D96FfC0ZtzrFpvleTzVDmkNNIcvI5XTahtCNN9J+XUZKLz2+RUQCV6pBhpaErySRo9ohkWjHts6qctsiIx9SgtDwq4SIOzWAEqGtcCRQ7Qkm//3czQAWv3dTqhtq4Q25qXJ3ba6GQJfU6FcRRqQyFdnzmkzvHSfZg67SZM5qqby7efZ+pJlqG0qNT3tsYCNJTOk0mM5FRihRjAn+g8Li5kRS4jCWgh/f0LLbygxSl8xbDLYUBpuqyGmBJX5/+YEkPb7XvuYxN3ycRHmD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(366004)(136003)(346002)(39860400002)(83380400001)(6486002)(6512007)(2616005)(38100700002)(86362001)(66556008)(26005)(66476007)(6666004)(4326008)(8676002)(7416002)(41300700001)(5660300002)(8936002)(44832011)(478600001)(316002)(2906002)(54906003)(66946007)(6506007)(82960400001)(36756003)(186003)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ku6zQxCzBE4OKA4GCczi2tLtID/s5iw4beUbmu+QK+NKBXhkE/Awnpuiw8Aw?=
 =?us-ascii?Q?3dZETCIta23qxz1RadqG8NfvFXGBoj50BUpp1g4ebeYkFTWkMFGdYs7GKO4l?=
 =?us-ascii?Q?aW85mxcQoZ0dfeziu4HQiG293xsnIigHmR0++CY2hMPaBsM4B2oNqR4l+JBw?=
 =?us-ascii?Q?UFUsW3RKyrghqLvLNIX4mJDkO1TTfcpsRE/XE8e6LHetBEhklAjV8vpcgUNU?=
 =?us-ascii?Q?kmW1W8HlRzT2MKpDYE/Skkcec6Gx6LZznKv1hofHCWHiMhamRkDRr/BEOvvr?=
 =?us-ascii?Q?jCgJB0bRQsD2/6vieKRRnxTUZZj05Dih30JayTJAhVWM4bvPX40mG9ujZhXD?=
 =?us-ascii?Q?YLNpUTYzdKzJbJfCSuHWvjO5ywafgNpxCd2zbczcmqpuYw+Dx+WEKBAOzxKF?=
 =?us-ascii?Q?x7Cy0H5CXHX8UcUgnMn+jGC9yfoGMdfORcmjt/W8aprwFHlVZoBmIfrp2Ogu?=
 =?us-ascii?Q?RqfJ5/dcjG68DheNQGYQyY926VklCXmqbAhdFEKvKvz+WCqS7AJ4vFHXaRdA?=
 =?us-ascii?Q?6fLtwPvW4njQGXH3nSQLnDDDmvnt/vJm1ZWQa/WNHO2MC5VMzwnoT21zdZMF?=
 =?us-ascii?Q?q1hSWAEEmqP28Rc2EzeZebp2hls3wgcR2JCAyZA7rsgwAyhVxNNNvJXpToxG?=
 =?us-ascii?Q?PnVLf7/8Uk49kRy1Ou1hI7FH64RkGucykL6mdDa1IhT3ciCFsQjgS7s8WFSK?=
 =?us-ascii?Q?M6O9okIh9kAaiIOkBrfxoszPKQckEOIjrfCieb83DCbwC7hcVrCwSikNkKfT?=
 =?us-ascii?Q?GtvMI+ijeumZv6aTg+BOgcMpJAyS5I6bae3rVvFNzx3RofX7yqCEMbpbw3wx?=
 =?us-ascii?Q?iEqTLBMUUWgYWFC5xLRU7IBc/idofzk0afWJPMhSz2Iv3zuOZPd9ZkbUXAZQ?=
 =?us-ascii?Q?yuKCQBFGIkJc7VkGtOEcXF3WNaSFCHYWZGgpwZ7rL9rxzUWhqYIwzPN7Ghnc?=
 =?us-ascii?Q?PSW1Y5E/m8d2ZgPdUo/BRTc1ZHR98pPsZkHKhUIQRe+Fah1b9MCi8/ImGgbN?=
 =?us-ascii?Q?4YxD0DMq7Nc1OBNYWXXeWA1u+bIOVsfsRghDlwLzja2sv0FYTewUI4jDOn9c?=
 =?us-ascii?Q?SAw1XSfn2Ja4HNW51YP9tcflr1S1vMNeRZqIM1ydx1tQTPiDv1ZYcWMECf9C?=
 =?us-ascii?Q?+nUAN23YMHbKGjNnTTpvpu7vO98BM0yaLDUsPz806IbaOiXQKSkUvQLmQZdo?=
 =?us-ascii?Q?QqtuSnd646fMcpfq9d8DEGEMwYp4/QQaWg3CHp3jDQYyLN7UKmub0ov616S2?=
 =?us-ascii?Q?efYEOetHLlrMoRBCCXdv2VFrs55dclpYsC60Ue4YjsQEDd3xEG25k+G4r6Px?=
 =?us-ascii?Q?p47LdLMo3ymddscI8kXVavxosL3AWFe0kh4nMkQoudOwry2iAlrN8skfvmSM?=
 =?us-ascii?Q?6gTtWGdidwj5KxC34Vgub8COgYlNj+tA5aaBqen2YkpMuGKt8KB5rylEwhpp?=
 =?us-ascii?Q?G9bg8tV+7kElqIHh9qMmR7elU3WEfd6W/4wphRsrnx0TVdme6w3x8nL1K4dY?=
 =?us-ascii?Q?HzawD/K0lLrmqq9ApDzwOl/j+pB8kiN6pUIF3VugEkqNP4V21f9pcMAsKg1E?=
 =?us-ascii?Q?gifzCzhQqwwvT9au1New1StBTuLe4Ck0dmdK8C3lGcXs3+xLcMryphnwgysl?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc54f102-d01b-4f53-5aa9-08da6a6577ca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 15:35:26.2368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIqaBhCE38+l0w3RxKhIBXAw9g7Pyeo4tArEvhKIbU5NgsWZjNRCF1zinjCLoCF2W8/no2PDXCd74N6mfnu2+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3898
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

This is basically only the guc regression fix.
The other patch is just a dependency to make the
important patch to apply cleanly without conflict.

drm-intel-fixes-2022-07-20-1:
- Fix the regression caused by the lack of GuC v70.
  Let's accept the fallback to v69.

Thanks,
Rodrigo.

The following changes since commit ff6992735ade75aae3e35d16b17da1008d753d28:

  Linux 5.19-rc7 (2022-07-17 13:30:22 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-07-20-1

for you to fetch changes up to 443148858f26ee0fea6ad1b292d49d884dce92d1:

  drm/i915/guc: support v69 in parallel to v70 (2022-07-19 21:25:03 -0400)

----------------------------------------------------------------
- Fix the regression caused by the lack of GuC v70.
  Let's accept the fallback to v69.

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      drm/i915/guc: support v69 in parallel to v70

Matthew Brost (1):
      drm/i915/guc: Support programming the EU priority in the GuC descriptor

 drivers/gpu/drm/i915/gt/intel_context_types.h      |  11 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  12 +-
 drivers/gpu/drm/i915/gt/intel_lrc.h                |  10 -
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   5 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |  45 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 374 ++++++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  56 ++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |   7 +
 9 files changed, 450 insertions(+), 73 deletions(-)
