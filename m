Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA67C5AF1CE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F5710E077;
	Tue,  6 Sep 2022 17:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C76F10E077;
 Tue,  6 Sep 2022 17:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662484123; x=1694020123;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vCkZoMPaKGbevDHRD9n72V6orcQ+PjvcbWNv2zWAALo=;
 b=Zx8tn01ArPnjEHwZxf4I1+zBrG6L9hi6AbI3twrvGuriD9PEt7g/7low
 Pp04yDKPnwaA0GB+y9TAfXdvHV8FGmlck399G1kSfuJWywPXDA+49Y7YL
 Sjr2up2r/pyO23DHPWcHm14TNbr+Ea0Fih+RMcjKWMYkyXdomos78IKnM
 3zkEbp+tmHEqHPXGXNQ10eSane/P0DWlUC4eal/Xtqi2yZ7KI3av4jt6P
 olL1zmVKzsC73Ke8d0F/pCTC3mkdtcv2JvR2a5smmk1oDjmkJs4a6Zb6q
 jS7mbqtSBxD14/+o1bBDpNfkrOnYvr6xhkUfYV/LvRtftkCREbmy8w2r6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="358368912"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="358368912"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 10:08:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="616776586"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 06 Sep 2022 10:08:42 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 10:08:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 10:08:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 10:08:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 10:08:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmQKWCdrf1ePNLuIqWnSsWCnFZgz9d9AFeG6mUD83TlBuWo5K9hEc1PVU7yxJIK49L28wY5SQO1QvMig+ZK75zV5qMeR3ubkJItCjC2UKA52KWaqor32p4mt9QCLmKJq7NPBPhTjZlbvxK9MQ+VfVc2MqMnX/hdP8kt30PZd2AXkbJ9OD/61xwNOdbDoXb6NV6Bi77y2f289dBblLp3kqSnmOrBt51wE2gENapah1EyV/iESH8t4wiL2Y70naRGI1qGv7yhLwqVPMgVX+6Py1Bt/Hxlcbnr1lUQukCK73dGKIIVaFTEKc11Tcb544O+ixMGN0BQFZHKujsuHrG108g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyJEuSjFhK3XnvBN6Qp/Cx0W8lVb4xc7DrTR9Aa8l/I=;
 b=eqxu3JN51EzSu065DBiw2ex7v/XgyR5xYyYz8D0HN0jMGklEpeElnWlDIzTuw4QCOfsi1OFLmAI0S8PWP2RL8yGRIWmkNRIW8+Ey73RuEgoppCw20AqRdgNA01PfoB2qAzvhzLK5qf/+VY+SYxAkynLG61HESUmf9OaJ/93nAOTdtWzsq/D3jLLybVaI0Ge5M65d+f2fAC1LHgVT+wn5KLYqdsSHeerdUiZxI2RhPqKlwY+t1WXq9qANZLIY3v4HPZXCHLBvoWNQ+0J9NEMFmQ4SsFOreyN7pzXgsYQuUIVcMkTFgWZmDBjhdhY5QE9D9H0V5zHXmOxxKPE6LQSfbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by BN6PR11MB2050.namprd11.prod.outlook.com (2603:10b6:404:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Tue, 6 Sep
 2022 17:08:40 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Tue, 6 Sep 2022
 17:08:39 +0000
Date: Tue, 6 Sep 2022 10:08:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH v2 01/12] drm/i915: Move locking and unclaimed check into
 mmio_debug_{suspend, resume}
Message-ID: <Yxd+lQRGriwsyJjX@mdroper-desk1.amr.corp.intel.com>
References: <20220902233257.3088492-1-matthew.d.roper@intel.com>
 <20220902233257.3088492-2-matthew.d.roper@intel.com>
 <DM5PR11MB13245A45A7277B9548CADFB5C17E9@DM5PR11MB1324.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM5PR11MB13245A45A7277B9548CADFB5C17E9@DM5PR11MB1324.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed69b0da-4572-40e6-92aa-08da902a71af
X-MS-TrafficTypeDiagnostic: BN6PR11MB2050:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ElgBrDUsR2QbTINaUX7VWN1nOSQCjwXSs8WrzhUCa9uNaTDaUIxXPxrwQvr1H41ZmxVmHfo6eUie2ZjnPM3S8htGike/1gGBDlTTZFjBoBSjPqOdPoVFps5LoVnvdH1SLiFigev+QQM9fx24RmSiMYfRI0mZBcffZ7U7d20/Eiocv9uf8zX+eaWtLbnsGuMZWIxG7+7qxpqhWwP0ge4gO9FykcXrhxjBAHXIe7agl1KtNoCcmUZbd6Z7rfH+2pBcaITkGTI0CcbVjLM9H8eLydsv8Mdx+QBvAZhtP5rD/yBove7kUZeiWWVIu6RMHys0pZlMMGLcrqRgVj/FZogcbg24oh40vALV+vjTfkJdWBwlZnFHeONZQzWIR8dHyxR4G5pBKUAGtUXQmKRSKFMXlMMRpT3wiBOxz3zoB8TjDe3XNilU0sjT67cVlVafTPSrMTSW8Az8AL8SyIBMmsIPL5sdgh1FpZRyLSmyAgd8Hrrbqt/663YpFg6PdjF7NtNJRldaB6tKk10HS9/AVvf9VPyYFxgK7WwzILD4baTY5EDt8RE75JKjCbVhb0dy5+W8nketgZnSnbJe0hHnW2K4fXq8V7Jw4scT+0MPfZ1Sg8seA0Wb5ifLyNN019MlARF8x4/VA0zScgQvZ6jaNkp7bM4+wM89vhTXoDlaDv5ZgtjHt8ZJeLlnHmXEYBUYNrYogMoF95HPHxFq5SvSSLaLfeLG9aP25VtPew1/PyKSj9hm5GojO/fFNHn5CfF5Fewl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(346002)(39860400002)(136003)(376002)(6636002)(66556008)(478600001)(316002)(54906003)(450100002)(6486002)(2906002)(66946007)(66476007)(86362001)(38100700002)(82960400001)(8676002)(107886003)(6506007)(26005)(6512007)(4326008)(41300700001)(186003)(5660300002)(83380400001)(15650500001)(6862004)(8936002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JKUEYgn5pE6aM+oTU+tiWjANoDhfWezcVwpk/Lb0CMWCYnvnokNMANgD6/NE?=
 =?us-ascii?Q?S9G4YvkRYYNZKj3ny6i7nH3o+9tALsKOba5fQy4RgN+osQQyNm+xg4CVcWUu?=
 =?us-ascii?Q?Jf4A6XDU4ThnGUPlRN79HW+6z+WQ+9vyhhXvCd5FuyaAwEjt7YQTHb0LBYq4?=
 =?us-ascii?Q?xhb34ib96iQu3DiiZzliOcHj7dWyh9aSkj+U96P9YotoHCHx19APrDwEmbZR?=
 =?us-ascii?Q?0aGdDUezQMHBblLK1FwiT3QhCIgjg2EMV9ueAufVrMOSzKRhyh69MWNsesvn?=
 =?us-ascii?Q?tMcBDnOpxIdQXSsBIIOjeNA0Q7YS77aWDh+zlUQj2FNnM3bzds0pYzbTnxGN?=
 =?us-ascii?Q?OexoXwqwgDF/TY6RGBpzaYpJJcbyjPwg3kBDe7O8ZGyKAXJE+bm1c0/sDml/?=
 =?us-ascii?Q?DPHWKOpoZo2vDTRhaeQfbMfZPD+QSqr797nHm1JcX8QlSrBLiF7m0RVMRd51?=
 =?us-ascii?Q?a5o/LedFtOaYAjllpM4JRDhl8BhHpxUjl9L8LjMHwiDgPTdLQltJ5yC9QwTC?=
 =?us-ascii?Q?Z2+XxMzsCwus2jD+1YsPDo1EGAWzgspULb/4QUOmOUT1uGKXNy+rqUJs7OL2?=
 =?us-ascii?Q?8qo87GekAMvVtUr7a2syK7apq9Eitg+Q74AjiNRS1E2jkxSBY4FD2J0lvTlT?=
 =?us-ascii?Q?wRioU74yxkvbTPRxfEEWFecDLmP6SvsvnVrJPGIyt2iacH0TrexnKKC5PWtg?=
 =?us-ascii?Q?U6v+o5zJ3pgL7tS76XkLYGNDmCXM3jG2vYhrDxanXrR+3yVA+pNyAOqLQm5F?=
 =?us-ascii?Q?j4tzyuWOSERQBHJISkojGe4tLlIAVMMJ2UXeXqy0BGpQnSKkGX4WzGqduein?=
 =?us-ascii?Q?cETo2P9Pvqe272iE9pKJSE3Q2uFLaBsl293NZRMzEqnIJk2KEgdCIg32wG5P?=
 =?us-ascii?Q?sX0pro3BJISc8CmjupMkH2znxuaWvMOVaB3NzPoMWm+W9dE4t/Lf2By8D+nH?=
 =?us-ascii?Q?cWyEF+mcdT7wFWknYMWcld7NUSXArAKAzJEN3UB/aqdVM/16GxAhnZtiUV1j?=
 =?us-ascii?Q?JoiVNrG1QNyNgb9b0x0bUS+GH60awtuzDV5DNIgvRiGSbfsc9tlFQWKzCN3N?=
 =?us-ascii?Q?PXZ14ray8ipcqKzEIqCAxQWHhWB6GE+eqPVATwDAlF0DyP8V2YB7YbtAeJej?=
 =?us-ascii?Q?Z5sc8RdnS49uuE1LA0g+7VhXYqZxLYpB5IO0VyWd60Jxp+VRTzfynFxtFw8u?=
 =?us-ascii?Q?D8yBwzlZnXfjT0hcL/azF29FEInsBw8ox5eV01X1CHmQ/VnUVi501ckfSHfA?=
 =?us-ascii?Q?rjfEJhM5LsAAGkcz/OOiN5dGnXRsn7ITanwk1ORiR6j2/g9QmS8Pp7f9rwHx?=
 =?us-ascii?Q?XeDpGnkP63I6JcZ/EgYV0rhBnvLPg0/EIxYA5s6Cq10ykcIp+cKirqesbYf/?=
 =?us-ascii?Q?fcujEV6XSrF4nrO8R6VXtX5a5QAH4l3IduNGP1lAlHwvuaZXZKW9PsM/DSvV?=
 =?us-ascii?Q?29z7eefbmcN2ECNY74Dlziqg1qB2inrxSZiZytNu4Mc7rJdT+CCR+JqEys2S?=
 =?us-ascii?Q?G5gLJ4sICqaHbYMI36bTa+sBLzxQDFy8inrC7OPQTm8b1AQJRzU7LjjuI3Z+?=
 =?us-ascii?Q?jpHS1p2HCitaz6t8HajFvE72+T6SUpqPWo1EERTbQUz24qsLCRkcbICFI819?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed69b0da-4572-40e6-92aa-08da902a71af
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 17:08:39.8735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CmbMehec97mVMQHwe5O3BSTObcNK9W+Dj7uaQiqFzS/bf/uLQaiVUClcbM0A+sCuxpdNKeVFu0aqJp4m+Hm67HLWVylEI1KbE7YPaeaJLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2050
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sripada,
 Radhakrishna" <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 06:39:14AM -0700, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> >Matt Roper
> >Sent: Friday, September 2, 2022 7:33 PM
> >To: intel-gfx@lists.freedesktop.org
> >Cc: dri-devel@lists.freedesktop.org; Sripada, Radhakrishna
> ><radhakrishna.sripada@intel.com>
> >Subject: [PATCH v2 01/12] drm/i915: Move locking and unclaimed check into
> >mmio_debug_{suspend, resume}
> >
> >Moving the locking for MMIO debug (and the final check for unclaimed
> >accesses when resuming debug after a userspace-initiated forcewake) will
> >make it simpler to completely skip MMIO debug handling on uncores that
> >don't support it in future patches.
> >
> >Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> >---
> > drivers/gpu/drm/i915/intel_uncore.c | 41 +++++++++++++++--------------
> > 1 file changed, 21 insertions(+), 20 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/i915/intel_uncore.c
> >b/drivers/gpu/drm/i915/intel_uncore.c
> >index 9b81b2543ce2..e717ea55484a 100644
> >--- a/drivers/gpu/drm/i915/intel_uncore.c
> >+++ b/drivers/gpu/drm/i915/intel_uncore.c
> >@@ -50,23 +50,33 @@ intel_uncore_mmio_debug_init_early(struct
> >intel_uncore_mmio_debug *mmio_debug)
> > 	mmio_debug->unclaimed_mmio_check = 1;
> > }
> >
> >-static void mmio_debug_suspend(struct intel_uncore_mmio_debug
> >*mmio_debug)
> >+static void mmio_debug_suspend(struct intel_uncore *uncore)
> 
> /bike-shedding...
> 
> It seems like there has been a tend to name functions with the
> 
> _unlocked
> 
> postfix when the lock is being taken within the function.
> 
> Would this be a reasonable name update for these changes?

I think foo_unlocked() naming is usually used when there's also a
separate foo() that can be called if/when locks are already held (or
sometimes it's foo() and foo_locked() if the situation is the other way
around).  In this case we still only have one version of the function,
and it's only called from a single place in the code
(intel_uncore_forcewake_user_get) so I don't think the special naming is
necessary.  It might actually add confusion here since there's a
different lock (the general uncore lock) that is still held by the
caller.  It's just the mmio_debug-specific lock that's been moved into
the mmio-debug specific function here.


Matt

> 
> M
> 
> > {
> >-	lockdep_assert_held(&mmio_debug->lock);
> >+	spin_lock(&uncore->debug->lock);
> >
> > 	/* Save and disable mmio debugging for the user bypass */
> >-	if (!mmio_debug->suspend_count++) {
> >-		mmio_debug->saved_mmio_check = mmio_debug-
> >>unclaimed_mmio_check;
> >-		mmio_debug->unclaimed_mmio_check = 0;
> >+	if (!uncore->debug->suspend_count++) {
> >+		uncore->debug->saved_mmio_check = uncore->debug-
> >>unclaimed_mmio_check;
> >+		uncore->debug->unclaimed_mmio_check = 0;
> > 	}
> >+
> >+	spin_unlock(&uncore->debug->lock);
> > }
> >
> >-static void mmio_debug_resume(struct intel_uncore_mmio_debug
> >*mmio_debug)
> >+static bool check_for_unclaimed_mmio(struct intel_uncore *uncore);
> >+
> >+static void mmio_debug_resume(struct intel_uncore *uncore)
> > {
> >-	lockdep_assert_held(&mmio_debug->lock);
> >+	spin_lock(&uncore->debug->lock);
> >+
> >+	if (!--uncore->debug->suspend_count)
> >+		uncore->debug->unclaimed_mmio_check = uncore->debug-
> >>saved_mmio_check;
> >
> >-	if (!--mmio_debug->suspend_count)
> >-		mmio_debug->unclaimed_mmio_check = mmio_debug-
> >>saved_mmio_check;
> >+	if (check_for_unclaimed_mmio(uncore))
> >+		drm_info(&uncore->i915->drm,
> >+			 "Invalid mmio detected during user access\n");
> >+
> >+	spin_unlock(&uncore->debug->lock);
> > }
> >
> > static const char * const forcewake_domain_names[] = {
> >@@ -677,9 +687,7 @@ void intel_uncore_forcewake_user_get(struct
> >intel_uncore *uncore)
> > 	spin_lock_irq(&uncore->lock);
> > 	if (!uncore->user_forcewake_count++) {
> > 		intel_uncore_forcewake_get__locked(uncore,
> >FORCEWAKE_ALL);
> >-		spin_lock(&uncore->debug->lock);
> >-		mmio_debug_suspend(uncore->debug);
> >-		spin_unlock(&uncore->debug->lock);
> >+		mmio_debug_suspend(uncore);
> > 	}
> > 	spin_unlock_irq(&uncore->lock);
> > }
> >@@ -695,14 +703,7 @@ void intel_uncore_forcewake_user_put(struct
> >intel_uncore *uncore)
> > {
> > 	spin_lock_irq(&uncore->lock);
> > 	if (!--uncore->user_forcewake_count) {
> >-		spin_lock(&uncore->debug->lock);
> >-		mmio_debug_resume(uncore->debug);
> >-
> >-		if (check_for_unclaimed_mmio(uncore))
> >-			drm_info(&uncore->i915->drm,
> >-				 "Invalid mmio detected during user
> >access\n");
> >-		spin_unlock(&uncore->debug->lock);
> >-
> >+		mmio_debug_resume(uncore);
> > 		intel_uncore_forcewake_put__locked(uncore,
> >FORCEWAKE_ALL);
> > 	}
> > 	spin_unlock_irq(&uncore->lock);
> >--
> >2.37.2
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
