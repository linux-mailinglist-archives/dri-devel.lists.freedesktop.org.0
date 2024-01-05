Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77FA825192
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 11:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6B810E5A2;
	Fri,  5 Jan 2024 10:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0675810E597;
 Fri,  5 Jan 2024 10:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704449621; x=1735985621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yRMxCdjoqIkD75SEuJzObVSQ7nqozqsXnQwiAAoCr5k=;
 b=gu0gTVYDADCL03lhtYyDYLIXWXM4TwL1aPBxLmJBVN1r53lHApgwIJcF
 Bwo5YwTA/pAv7c7LBloIPr+Tgb0JMCvbzphMLvn6Mz8VWpwdQF1vpGhVG
 QcuukhqTTAI896f86KKVf3lEzlL7G593W43kmo4RcJncQT+yYC0Si9cCz
 2M/G9lZbqRWf24FIa+y0XCd0MvP1DXvXPebiUarqiwtbOCl9UWPhGFtZz
 x7aXBf/dGS8CmxBH5Zy0d5kEYYXXc50HJAthoEvk7sEKMRT7sR2uVmQxh
 nt6EV0CKAde4iUiy+dC8qBVJ83QKQWyyTWj1BGL1rVMUiR8yTO4dkrzwN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="376967342"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="376967342"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 02:13:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="904113836"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="904113836"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 02:13:39 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 02:13:38 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvOPT4fPPq4IvgtnJAWCPlhBTBnSh8obh5loCp0z24UTCb+5/zc/ICv62MTmNt0Glr3pYLKVjDTv9rGCiIFTTrQ/iw8Lq+GlhyB/QXFpwgFWhX0MGtJHZf9nudYwdJ61yX3LBPv9DYtgr/i/5S4+/CkmZ34P2Z/BDu5Jketb3/b4Pz4SlW+4JTOHu0z5xU+E/w1Z47h86lJfHLwJwLP37kSNlYRuUCGzyWrUUPG9kViuScfwlEJuOoZ0gBu3gKa6kBjrTVyv9Q7TmtENgK0WPUYkC3MzkGxPcsNCgxTb37VbujhRZqheVEqQoaAhqLwSmAD4FHm3H+zsSoUVCDNYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkhLHh0crXwXx0APrqjN+/BQ8dQyd7xvanE/ap6H1sA=;
 b=R0YFAOPmoB8HM1dirpre1UbtWA91sWhFsIaEyFP13O2mVQJTtfY7Pp0Hp8ekNS7JCKxrIPgOMjeErk8NUul/BiEv+FQNVJu5neFSn7YTYliB/CGGO5PlUPpPkl0ZKwFcs9R9eFZ/c/9/CZrO5dGd4ygGykZ1rRH4B6SC8ICKqojXtX6B1GEr93AtvKQtO2ElzSxT3ymeWkkJpsnMyDLAP/1BFQrUqzsP7l4sz4rnspQeCSW/qJwZVkcWU52A36eiTF/RXcKzMpSe0Gs5foofWiOEwM6U75MZEuy1IGiw5ci/51p9k516E2NeIvtx0NAidveHflbq5jj6hReX0fOwnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.14; Fri, 5 Jan 2024 10:13:35 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 10:13:35 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/6] drm/managed: Add drmm_release_action
Date: Fri, 5 Jan 2024 11:13:19 +0100
Message-ID: <20240105101324.26811-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105101324.26811-1-michal.winiarski@intel.com>
References: <20240105101324.26811-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0902CA0047.eurprd09.prod.outlook.com
 (2603:10a6:802:1::36) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV3PR11MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd326fb-7d65-4026-4d0a-08dc0dd6f982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a+7VUiaacYQS8/rz5N7EEP79Gn2D+/7DBCs1yiXbwA4vxpDinexuBLOWvrU3xJF+F5lLz3EIbRaMCGGC3HsY+7aDerU9UIQEYFLl/jySdagkww/akcK4t3t3yAWf7qc+G8jSHhp2Woeoc9CufZ3YITSd22N1yulcNGf2ygidhy0L4YMYWqIZl8v27+tbFXjXw6Xi3xcmrpN/o9q8EWcTnb0dxBFUtpUplCkO0Z4pHLFxsehc38fw9ASCnIglOACWSXgtHlAlKQBFxIJduKdWaQUYabtSovQHObA2t4X+yiorwhp4glBmReVIY70IbxY33CTg56vmxoq3xJ4Xqxqp68ouBnbcQJivMJ1anriJ1QQyhqpH4LN4D1+pQ9YgrQAAAWtlwsC8uO1IG9kZmb2+HTflxbDKFTCtf4G4tKyWa+mL8065HhmTz/7Xzg10ChuyIglkT7f6ZUKG2qD5wvoHr0YidTaoHgCK+iTuLMYKceeG9W01/em6cqOYaI7LPfAolVzbV1GSa0JvknXA3WinA+Onem/7t3rKoOAjKCFPH07/M7Ufo/MSiv1GW1bZ/DXW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(6512007)(6666004)(66476007)(478600001)(66556008)(66946007)(8676002)(8936002)(316002)(54906003)(2906002)(6486002)(26005)(1076003)(83380400001)(2616005)(41300700001)(5660300002)(7416002)(4326008)(36756003)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2RzeDErdStZR1RiTnAzMzJrL0dsS2VwSUJDUVpuUE85RVQxTDVQUThLU2ND?=
 =?utf-8?B?dGUxNWtZbzF0enY1MHdIanhodkswU0FGUUsvTzV0WkVnSlR6TjhybWU3WjUw?=
 =?utf-8?B?MTl0bzI1NExQZW94MnZyTlk4K1laZDUwQVpIS1BoanU5SjJPVnM5N2lrdjUx?=
 =?utf-8?B?TmNWc0JvaU9iVktUOVdRN3l4UTVBc3pKc2c4VlkvMFkvcHhZNVczTjNLT0pJ?=
 =?utf-8?B?b3draDNySmhRVHB6aUhWQ3Zaa2htNzZiQTNsOS9aWm1nTUgzSWovbklrZlpP?=
 =?utf-8?B?RGo2K3FjcERwbHRVNHN5dGFEMlpoSi9rZmZvUTNQOEV2RHEvcUdGSE8rLzcy?=
 =?utf-8?B?azEyMncrVXhtY0w1MGlDZ3JRbWx1MHlMZkdNYVdsRTVzNXlQTEtOaFoyaFg4?=
 =?utf-8?B?Yk9tYTZXREVMOFNDTElDZkdHazhIUVp4WjJmT3JiaittOVlzRWlncGVUR2cx?=
 =?utf-8?B?cHYzcHluMVAxMHBiQWR6clc3SVhHQTNWMXNXaWh4MVg1MEtJRkN2RUpWUWRM?=
 =?utf-8?B?dk85YVBpR2duZWVjaEZ2dzBHbHpDVElTSTQ2Z0I1MEU1eUdwVjNSRG5peXZ1?=
 =?utf-8?B?dnlqc0xZaW5TTTQwbHI4cmFibk85b3NNb2pIRUs5cXFxeHBwZ0NPb1h1Q2Jj?=
 =?utf-8?B?MjQ1cXg3SGU0bjZWb3hCSjFPb29HbndaR0huQVFnYzdJa0pTeDFNc0RDSnBt?=
 =?utf-8?B?cVRIWnZhdFRPMjJBRnhyaDVmRVFzcW9ZTnNSSmNGMDl0eElKNUJvQjFPQVpl?=
 =?utf-8?B?blNUN2ZOZVhFSkpNMGhac0lwWlcyT0wxVktWY05XT01aUVNYUksxZm5CQmRl?=
 =?utf-8?B?OVA4QWduTUpOa0VReGxrQXNUSU9OV2NXOFVxRmJTNHRuUDBiQ2tFd3laZ3dl?=
 =?utf-8?B?eHg4TkRtMGFPSXBEWHdic1QrZ0pLK1NSYkJvT05XWklqdHpoTnd4UWNPQ2ds?=
 =?utf-8?B?Q0U4NFJielRrb283NzVSSDFHTjAwbVl6TldWN0xZQTFBOUQyb0dtUVY0ZHZq?=
 =?utf-8?B?anM0dHZxb1VtVEU3dzFFa2R1eHk1N0w1bFJRRjdneEcwUHpsZUF5QUZtRmZJ?=
 =?utf-8?B?N2RSSWhCelVTd1cvNTB2OWpFNXNjVnVJZ1VkeVZxWU1JM21tTFJIdHgxeHZn?=
 =?utf-8?B?VmpUY3BOVlgwN2FGTlV4ejJoSXlSeWMwR2pxV0NaVDZuU2JQWVl6ajRDb05u?=
 =?utf-8?B?Zm1DbGpKSy9lODVrSVNzT0NwUG9qd2FsdSs3WCt5OGtjd0tNMTVjSHZNb0Vi?=
 =?utf-8?B?aTFDWWR4NU9DRzJWSmJNRnVMSlBCaDhhK1VoOHhUYVBRK2pFOXY2Sm1LQXJU?=
 =?utf-8?B?MngvcVlveDZDTzR3Z24xaFFrRzZzbFB6VVdIdDY3WUhvNVQrSVpXT002VHp5?=
 =?utf-8?B?Njc1anZnL2haZ1dqZ0VITW82WmoxWVphbDVWa05NVE5tbUlhdnFnY3lFOEdQ?=
 =?utf-8?B?MU42Mkp4OGVkRjdicVVJSDBiQlVjUUdBSnNlVzlPMk5lL2J2V2JteUpDWHk3?=
 =?utf-8?B?a2xhMUJVM3FhNmNTNE9HZEhaN3l1VVNJY24ybWp6ZnVLeWV1aDAxajM3MUdu?=
 =?utf-8?B?TWxudlliMHo5NWZVZ0NPNkExZUVFOUZGZ20yb05PZDZrL0xHTWtjVUZ5V2x1?=
 =?utf-8?B?dTc2dnBqQ3hhNkJ3TGdzemRPZTdVTkYwa1BFc3REbDRCNXB6YktZUXFyNWhS?=
 =?utf-8?B?MXdwTG5IVGxuNUUvRzJCOFFyN0tUWG9CWDg0UENXdjNrbHB0RkxJNU03Rmhp?=
 =?utf-8?B?ZGdyMWlFYkxkZW0zalY1VjZNTmY5VldtWXVvb3I1d0NnaFF3VkhabTM2ZDRI?=
 =?utf-8?B?WTBBQ0Y0d2M5M2tlWHdWRXhNMjdLdlh0MGJiOGE3MFVRNWhMelY1NnFSb1Yy?=
 =?utf-8?B?ZTB2ZHFSUDFEV3VOcjU5L0xWQWdKQ3FNQUpEZmpqUlJrbDdlc2s4YytweER1?=
 =?utf-8?B?TXg2ZzZIWmorQ0NXTHBLeExKZUkvbjZ3Q0ZMK1Z5ZHdqTWxkeGx4M041RFVK?=
 =?utf-8?B?bzVsbXVseDhFb2xEVllCYkVtYmhqUWRxY3RXNWNZRm1WNGYxUmZDZEZuV2ZG?=
 =?utf-8?B?TEtqSlJPTUlkbmc1NUpVRTlXcDJUNG9JTjRrVk1sY2J4L0hiVEd4UDNDT1Jr?=
 =?utf-8?B?SFFoUFdCUTdTWlY2R1owaDZrOHdwUG04NFRIcTJkVTRobjk1U253QXBsZjFD?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd326fb-7d65-4026-4d0a-08dc0dd6f982
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 10:13:34.8979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRt69f/Lv302zLnuNenu2hiZ2//4pg6QrNB7QT2gaO2sJSQeYv5MJVO6U+MLxWWBJNnkjljdX7DQl9cEY3IsEM2VwPBDOar0VDl/LAG6/Cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8483
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar to devres equivalent, it allows to call the "release" action
directly and remove the resource from the managed resources list.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_managed.c | 39 +++++++++++++++++++++++++++++++++++
 include/drm/drm_managed.h     |  4 ++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index bcd111404b128..7646f67bda4e4 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -176,6 +176,45 @@ int __drmm_add_action_or_reset(struct drm_device *dev,
 }
 EXPORT_SYMBOL(__drmm_add_action_or_reset);
 
+/**
+ * drmm_release_action - release a managed action from a &drm_device
+ * @dev: DRM device
+ * @action: function which would be called when @dev is released
+ * @data: opaque pointer, passed to @action
+ *
+ * This function calls the @action previously added by drmm_add_action()
+ * immediately.
+ * The @action is removed from the list of cleanup actions for @dev,
+ * which means that it won't be called in the final drm_dev_put().
+ */
+void drmm_release_action(struct drm_device *dev,
+			 drmres_release_t action,
+			 void *data)
+{
+	struct drmres *dr_match = NULL, *dr;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->managed.lock, flags);
+	list_for_each_entry_reverse(dr, &dev->managed.resources, node.entry) {
+		if (dr->node.release == action) {
+			if (!data || (data && *(void **)dr->data == data)) {
+				dr_match = dr;
+				del_dr(dev, dr_match);
+				break;
+			}
+		}
+	}
+	spin_unlock_irqrestore(&dev->managed.lock, flags);
+
+	if (WARN_ON(!dr_match))
+		return;
+
+	action(dev, data);
+
+	free_dr(dr_match);
+}
+EXPORT_SYMBOL(drmm_release_action);
+
 /**
  * drmm_kmalloc - &drm_device managed kmalloc()
  * @dev: DRM device
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index ad08f834af408..f547b09ca0239 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -45,6 +45,10 @@ int __must_check __drmm_add_action_or_reset(struct drm_device *dev,
 					    drmres_release_t action,
 					    void *data, const char *name);
 
+void drmm_release_action(struct drm_device *dev,
+			 drmres_release_t action,
+			 void *data);
+
 void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
 
 /**
-- 
2.43.0

