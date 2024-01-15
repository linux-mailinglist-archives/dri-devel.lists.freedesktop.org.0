Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3BC82DE40
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 18:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA4B10E33D;
	Mon, 15 Jan 2024 17:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EAC10E333;
 Mon, 15 Jan 2024 17:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705338852; x=1736874852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yRMxCdjoqIkD75SEuJzObVSQ7nqozqsXnQwiAAoCr5k=;
 b=ZW27j3xPR2nF9Zk+UByt/CfyMLWgNP8SHrpIhEq1/t5RUgCW0nrZwfRO
 EP2L91NVxfqcWv8U3o8r/P6YSLUgC/wIqljVQZ3v5uucq/gxTBzglhmYe
 icQPw9O7GqOPfyKGV58lGZOpwo79dcYEZ1mJjZreXl3Lgb13GKQTGjeu5
 CZDAf1WclROimHNHpCHr1qH56DENqKEAd44Z13X9VqwtxM9jKrEFoutFk
 SgfTzTeuWhVKhcDBi8qwaXG+g5n+5L7nDvnwAxFi9cd9eD2mDscAzbI67
 f99ki1BbeRrniyhNNdI3zfyPitAwa1CebbYGUZ0EPUx1oQ+yviA7ICQNw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="399336721"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="399336721"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 09:14:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="18189248"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2024 09:14:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 09:14:11 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 09:14:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Jan 2024 09:14:10 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Jan 2024 09:14:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxrAG7DgHuM0I+Mf+Kh++Ukeqni1bgCvagY6DpnKiQMy2RvNEdZxEoHcTrexExAoBIBbhVevfyEoe+sz/FMwxxx4hYXYa2X4iz0XWId9oINBuRNIsZ1JP0IOVXpD6+8CITYAKpmvh+KpmQUEHuDIdfynVYN+5pDt6/Lc48rL6Hqn38Bo6JNPZEJv/Yhd2ZO+6NzAn2tgkZhUqERr7vPjRPE3+bYdZXFOYKG2CDx+BQIRkRhroBDiHlGZQ/pEzkg7QWpsFNCZ/ji9sDPBsE4Uodxv9HmCbkCNZR1mHCa2kauBsN648RbagJjKZOnBquAVmeuwKs4kNDo/AlyZ9J0GCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkhLHh0crXwXx0APrqjN+/BQ8dQyd7xvanE/ap6H1sA=;
 b=QCfyQjbv8bUDNugwO17lYHTfZSlp7D97+rQMa2oPkyqZtANCdhOUJpjzcPWtfxG2JN6ISjymFtPZK74+4LAUVaeX0EFSgf3Y1jP7eOPjkVfMGfSH02gBmQCJdh56SlksgNXiGAjbZfuBepacm993kqLrdMUFMlfCw0uOoyMmd6OL7kEg1khV3rwLVWxYA9w2OfVvPxScmUDJsiEpkXN/JeayptEvFSyLzkdYhVqvA31aUGlGRDfrkXQ1MwiAyuDphmvIyWw3bf8qwuc1BpZiuzpyRW5kip639op06d9R45Cc1VPAtWtSeW5DTOttSH9zfQrcWBZhxH3tPHniXlLM/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.18; Mon, 15 Jan 2024 17:14:08 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 17:14:08 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/5] drm/managed: Add drmm_release_action
Date: Mon, 15 Jan 2024 18:13:47 +0100
Message-ID: <20240115171351.504264-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115171351.504264-1-michal.winiarski@intel.com>
References: <20240115171351.504264-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0070.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: ca5f2ebb-04d2-4f8a-cb22-08dc15ed6294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pPkwDmBr21Q4b9G+OnCaQRJeje0rgn0WaWkhE0B1NBnrvG4wl0pgOTkhkrjmAc/WnikfaL4xXbpYroVOy4opZIpYxFgzaSOQEZnbTZ5bOfOUgl0OLCWZVhPmxHf4GSxmKG/TStKcmS8J9uX/ra4587grosIPQrrj114OOXnWE+4R5Coe9Anq4LtLBAjBGmQP7dZ4AdF8KOXyTznsdryAxQ6I4PcO6yDjijP6ghlw+dEAiJFjsivjt2nLUV1ibEZH7Nt5uSoa6KPp3BN/CSRj90JLz7VZAs0p5mZYy/ScUUAANO+uJdDCVPE2ZBvfkgMcatqHr8/WSRAPecqg+JfZVxOTvK1wFTfKS4G0EFrYVa2PRbICcgUl8dGad+5ZkzbDNsPqwUwZBCnGya35zpNdWlSJq6rgGOoZ4FYPFETOIy+YokGGi23HQKhYoGe9VYLpjewQ9U0BGEDhUB6Q8rh70vhToLxyYsXPEKbKS7cyf8eelvJS2F+7561lmCTbHTXKaFLH7opFMZIkTDXzrcdrU6gzbjJi7T0PCaZ8NXshkNmdvBIraYaWjhha2t7yl1wD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(366004)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66946007)(6506007)(1076003)(6666004)(2616005)(478600001)(82960400001)(66476007)(86362001)(316002)(6486002)(83380400001)(66556008)(26005)(54906003)(5660300002)(8676002)(36756003)(6512007)(41300700001)(7416002)(38100700002)(4326008)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajRualpoUEw1bDF3NnJ2cTlOVWJrSGpneWFnUHlrU3lFS001SHMzSTJRS21w?=
 =?utf-8?B?Uk12MTV0MURRYkYzbVFEenQ4RUpiZVNxTUVZeUxBZ2ZnVTZNWC9rR0ZqNEFD?=
 =?utf-8?B?MG1Ga21PTzFjVUlKeTZ5UGJvMUFKUWEvQ2JrUDJhKzJCYUNZZ1gzMWRTQWtR?=
 =?utf-8?B?Z01DU0NQZ1FvWHMyKzBQM0U1eUl1NlBadVFyeVU5SkdMYU1rQ3hMNDN3YmF6?=
 =?utf-8?B?QXZ2R1ZIMk01aU1SNVArL1hxNGlOdWVXVHNucG1icFNQd3liekdudVV4K2Fw?=
 =?utf-8?B?cHRvZ2ZyTDhielZIeEhVSitOZm9zZ0VnMlpJd2JJVjl4cW5YKzg4dDZ4MytI?=
 =?utf-8?B?MlJQelZUaVVSS2NNenYxUVEyMjBOMDBGWGNEamxSQzRnbzkrQ3E4SEcxbWdh?=
 =?utf-8?B?WDU2WXcvK0xVWEFpdlJYY045RGFZRWhwaGNmOVdyUTVZb0RtSVR3UFB4K1Ux?=
 =?utf-8?B?SHAyM3U1M2ZQK0ZzcUM3NVFsSWN0OXAwaWk4UVFOcU80WmRLblNVNmxJVFVW?=
 =?utf-8?B?RGVlSlNUV3kveCtpUkhuU1c2emJQYmRGY3FwcG9DRlM4ME5oOUgzdGtyZnVx?=
 =?utf-8?B?TEVmblNNQVdyeU1VNmR0SzZPa0MvaEhobkZiUTF2NlAzQXlwU1FaVUNvdUU0?=
 =?utf-8?B?dzlDUkt2c1B2SEVVWVFOaURxWUtNV3pUVk8wdTNUdEZPRmRLZnNva1JlVks1?=
 =?utf-8?B?ekJXT1BlK0h5N1FmVjd4MTcvRlRVNXZGdEl4RHFySFhDREhqRVIwT1IxK3dr?=
 =?utf-8?B?cXRtV0svdUlBQTJTUC8xZDlmTGdKa21PaFd5UzhPTUp4blNOOUEwMmd0QmJT?=
 =?utf-8?B?cXFpMXc0bW5lMEYzSzQyOHdFdlp6N2V3YlNtTXhYSFZrVXZHZ1ByOWdjVVl3?=
 =?utf-8?B?Y3drbXpJTmhDSWNQRit2NDJGWDNzTFZEOE9IT3BOS29YL1NjdmVJYzZwSWpY?=
 =?utf-8?B?TzA2bEF1OHE2R1hGbXdLUU0ybEljSVZzRVFEem1kUHZqSnhMeFRrbDFjd3dX?=
 =?utf-8?B?WDhLOVFFZm1BKzl6MVQraitma04vZnJXczJ6MjdCSWNwTTFxUkZRQnN6Umtt?=
 =?utf-8?B?Q3NiV3AzY0hwazFZZzhpRm5hUmVWQVFES3NNOFZoaTBZa1d4a1RuY3ZQZFpj?=
 =?utf-8?B?cW0vV21VSEFxNWV3QjdoTFlkcVNudU1sLzRMcXg2bVBDWmlDVkpSZmtPTU9R?=
 =?utf-8?B?Nms2Rm9zejJXU09ybkNUa2RSbXN2cTBpK29zMy8zZ2pDZkJ0WmpRQmZYQi8y?=
 =?utf-8?B?T1lnWVRyQ2ZvTnRLR1JDWGxPUTlXN0lMQXN5OHM4WkhPRnB6NHdMN0pLVFp1?=
 =?utf-8?B?ZitjZzFyUmorQjNYdlNhazZlNGorWHZjNURTd0dZQXJZNi9ydERrTkZxS0lK?=
 =?utf-8?B?WlpuektWMkZZclVwc3JQRStZUFA5aWJWMkliei8rdU92R0xZTC9VVHZ3ZkEy?=
 =?utf-8?B?T0xhTW1uK1hneXJLZThZQU5MaXlpVmJMSUVXS3FyN0RnM2FjcWJTUEVpeVA1?=
 =?utf-8?B?R1BSclZ3ak1EaG9odzhFdVZBWkhyV2NQUEhCNzJWUEdmWHIweng5bXY3dzZp?=
 =?utf-8?B?UFNEWkFpMnVuUEVLLzhONEFHQXdyaVh4c2VGaEYvbjFxcDNYYmo1ZHVsZFRr?=
 =?utf-8?B?K0JSYStpR09IaEwvVTlvRStGSmVVOFVOZVBUR3ozenV3SWRDWGROU1NOYVRz?=
 =?utf-8?B?RGo0ZEowYVoreDhac2oxTnF5QmlKNFRnTWp4YldVY1hCNzloelRLQ1o1T1pQ?=
 =?utf-8?B?L0FTMVF6T0NTMkl0M0wra05zcVc5Y0IxbFU3TDV1cEZ1TDBGdkdkRkpUQk5o?=
 =?utf-8?B?c3VaeHBOSkltSTROaUwxdXNXZ052S0htT2MwYjZGaEI3R2pwc3ZDMHJRTDZR?=
 =?utf-8?B?VjJJNzVXcU43eTR3VVZEcUUvV2xNSE5QVTk3N0JVRHN3RG5xZkxJNEMrQkRU?=
 =?utf-8?B?bm5iMjhGTXp2alcxbUllMzBHZlJ2NVlHRTVVdm5sV2YwZHY0UVFveXdhUEdw?=
 =?utf-8?B?c0FSVWNsU21ZNGJCUmx2QS8yRnlFOEtSVXBIUnhuRXJ0Rk5NbzNOS3JqQlpk?=
 =?utf-8?B?YUdIbHdqVVQ1YTFvU1gxOXJocUtrZDQzd0ZDZ1lyZWROcmhpQzM3R2hqMDBi?=
 =?utf-8?B?RzdHZkc0SGlvbStZcjAySDBRL05IT0FydWdJNi9nTWIySXV5Z2h0dFVTb0R4?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5f2ebb-04d2-4f8a-cb22-08dc15ed6294
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 17:14:08.6374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1gwLzPAeeLR3bv7MZfbkFuBpVoQ6mA/yDA4C9hO2tgqA1c8Pz+x5V27y4XxhPNy6L9IXUbRDgFcs0M2NiCBf18HN6OVdrCF+qE4pYl7mf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
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

