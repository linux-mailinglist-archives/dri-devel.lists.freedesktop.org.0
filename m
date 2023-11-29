Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F067FE2D4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 23:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9578F10E695;
	Wed, 29 Nov 2023 22:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB6510E507;
 Wed, 29 Nov 2023 22:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701296105; x=1732832105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QycBI7Kt9PgTyJxaiH/+LWXtKXKuLCo9OVwQRLqdWtI=;
 b=PKq7QXCWAoXehzRdI4/izRM1GKNszSTSRgeEnztSXJkaaAwSqXWDq8mq
 rbU+DVX5H5FPkcotvu+Li2X0kSgbHcjtuQwV7etKK1LBk0LZ9NLhfYXAd
 ve8Pi1hnQPrCfMWxiEG10jtSirBtgHVnvfO1fqzmyzf932w3yypBLLVrV
 gMwO0y9iMArRKnCOqky6cBXJO3xKux6WyPXbvPjzF6P8CLtzr2Qe3+K23
 lqYZ5uDsPlE/FC5BJPDLovirQOmKJX1nr1rnnkMpopjkeLu1OP2E0YsiW
 TdhjjxfgqpPNkkGvYcpyd6vR6+WPc/RcRORnxHfgG8QtlWUpUCoPJ65zn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11935320"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="11935320"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:14:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="912984151"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="912984151"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:14:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:14:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:14:48 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:14:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVptYmUGJp5F3k0ylP+qIo/rE+U1KK+MjvDjGGgENiYFXEX2M8G+GT12rJ5+wFQzfVr6flN6GAT3sTmOOxM1tbASBRc+0+LNsRIOsy89T+/tg709c1f+zCzeUZ9x7FpqBH1GgxI0boggeluJwrJlDj53qWTTEaSEt9dNBOl61O09fFn8Jaqbkg2cvn7AkY17IRPCjss9iEAGsNk2uisnV/DEhkhtThel7oqjlNgR/PMwkoSDGRbUYBCzGHKcqjbvMWnI9tu26QkKlL+931zmvA3fUno0dbFnuMEKHCTiJXtCIJPzXqY6sUbfid2af22ns7eHI5WpwoWC+50UWhTlkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmFrd6XZVfmcX6t5o754wGjAQjnYdG1Cx10L3HP9BJc=;
 b=GeBqhSc2Q/Udmk7YaIAddHCxzY1XZReQJxVLmCKpLXFr9UiYMuZ5nt+CI5FMTYzZC6V6U6u3yr9OJQsRTTefUDPaCoEjX2fB5Kmvr4N+boYHt8QfdGT9ZRnquTQAHvBqMJVp4v5N3SHyFmwwL917AQ+PsBSisczGw1BoWwDRqgcQG4f0D+ZOldnuZB6WBl8b9VhTYPiNqOBnurhqdrIrLSEsAOuzMs2Y0+AWejEznM9QA1qEDh3NDFuD2SZhxaNHPRoTAgAMHcdkOlXEwohFE2C98o1LWivcsNBz0LIDtn+RCf3U5xz1dE+88OXB5a66EKxJZ4QRLvOnDO9mkolTEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CYYPR11MB8432.namprd11.prod.outlook.com (2603:10b6:930:be::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 22:14:45 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:14:45 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] drm/managed: Add drmm_release_action
Date: Wed, 29 Nov 2023 23:14:11 +0100
Message-ID: <20231129221412.1180549-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129221412.1180549-1-michal.winiarski@intel.com>
References: <20231129221412.1180549-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0044.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CYYPR11MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a50c92-ea8f-4863-7dab-08dbf1289806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uxMFSmOZIQJYVb+NrQ5AmIpk5hyr81KUOkQL8z020l306l2mZ9f7rboUFztSNWD+Jd02lB3OxGo/84CmvyDtJdHGjwOMgqYbDC53OXZVsFxOFvakVJRUvYTNNCCfyHtzPNw6aR3XZBb5E9qpD/G5I0SfbgSscbF/+PNF+RTYQb0eQNYXYris9oAhZK5EGIHCPWmwSh/8dXxuJX4wvSeUVJKZ0t3nJDZG8WtUmXuwImZ2FTsi8BLhuWGMulyUsr21q5+Buz80CHDYFO5ppftqs7ro6W5PntOSg7s2xD2mClnN+nUzEgt6xGD/tQKBJsP9751EIkk7a4RhsHxH4JK+L/0/vf5jz/1/us3G3V1PXqntFZ06TwMkEtN+hMUtPwNjf9ou3JPqBJa/nHxdJhpMnHdp7rHTOQGINUgzZ6l47UGnlD2FrEt8qZhZM8j2SxLBmGRO6rMa03y2qtl6T3LAz4Okr9wSEo1C8b+3PWvl1Un2AtIllc80MbvExhvfounCdTywjc01RGQpcQjY0b+at/6QHTO/GE2nltgL7qZltyGgfWcOzkDJkRKP8MF4jsJzLM5R6t98AwMWPq7ND00/tXLF1vHdn3bz/bh/M2X2Ek9zXoOTSsjj+VnMcjpCZPAB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(36756003)(6506007)(41300700001)(38100700002)(2906002)(83380400001)(7416002)(82960400001)(5660300002)(26005)(86362001)(1076003)(2616005)(202311291699003)(8936002)(4326008)(8676002)(6666004)(6512007)(6486002)(478600001)(66946007)(54906003)(66556008)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0NYVjlqdHBQcEhHV2ttYVZmNjVNYUhNZUFaQXp0dGxYbThjeXZwQUlXZXBs?=
 =?utf-8?B?NTkrcTd1QUhhWFVpSWJKajFwc0JINktHQkpOS0pjd21QM1BKZjllVGFPMjBB?=
 =?utf-8?B?bE5tSXRKaXQ4UUF2U095SklpZ3lWdnR2UTlpay84M2RMS0tpOWRQUzBsbmtU?=
 =?utf-8?B?cTBrRVg4R1RhTENsQ0l1YmllVkNSZGdVam9oVkxlK053MHhFZWpsMzJWY2ZS?=
 =?utf-8?B?SUtvSWVXTmtYaUFpRzdzY3ZIazQwU3hCOGZWSWs0angzc1JKTFlHWUNZTE1F?=
 =?utf-8?B?T2hDQ2xPeWxVaVMzZEJPN2RINnFVeE9EU3kwN0pnR0YvVml6ODBpcWZjeU1U?=
 =?utf-8?B?T0lyMk8wNWszL2pFZ2M4VG9GR2llTkFEY0hqNzZmR1RRTzBYam1JUGc5VTBI?=
 =?utf-8?B?aThoWUhVNE9tL1RjMXg4NmtaWDhCcnBaYlNSaHpvM1FyK1I5MTh6cjlKSFFN?=
 =?utf-8?B?UVhpdVdNa29zWGdTYUZON2tIOXY1U0RoR0d2S0VrNlZYMk9raTNuZ1dHSmV6?=
 =?utf-8?B?TWhpZW1PbFUrazBLWjIrdmVOREFHSXZPM0ZxZGZRZlE3SThGaE1qcEpyY043?=
 =?utf-8?B?ekZUWGtNdDExZHI1TmM0QmR2cnFnUFhEVk0yQUo3UVFGeVVIN2Y4SEJRdEw2?=
 =?utf-8?B?ZldhbE0wWGdCRDEwTlNlYmtwcUhmdU1wME93N1hqWEhLa0tYWFNuSjVxd1F6?=
 =?utf-8?B?Tk41cnBqOFZiVkgyb3RaN25nTmxLUmV4eEhBOWU1U1dJTmhYcEowTVlYZTNE?=
 =?utf-8?B?c2lxWEpZWUtHRzZCTHdQRld2WGdVdWhMMXVNcTA5bkhqZ3MyTVl1eFhkb1Ay?=
 =?utf-8?B?LzA2N3ZVU3QvTkpKZW4yMER1bVZCeXFxNG1vQ0tETWIxWGtZOHBJcXZUeE0z?=
 =?utf-8?B?T0RBVnQyYWtqVkI4ZDdrRlRVQmhnL0x3QUh5UXRDeWdySDdScUk5OEovSEtB?=
 =?utf-8?B?T1liMG14cStWb2tlYUR3Z0JIL1VzbVlWRTloYWJ5SVh5ajB1aFkvWk5adzc4?=
 =?utf-8?B?ZEV0RkoySUtwS2FqQUR2SXFERlgvZWxIcll0Z25makZOMHFIdFdvb3BQWEFT?=
 =?utf-8?B?THZYQXg3Rm03U2kramRiSUphZG5LWW9YS0ZoYXc0V0Qxc1lsU1dJTHR1L1pp?=
 =?utf-8?B?R21uL2gwZjBWQlZvM2FMU3NxS2JXdUIzMmE3YVRseURxTzQ3MUg0VjBvL2xR?=
 =?utf-8?B?TUc4WnBCSkViTCs0Q3g0Vyt2RmRvMmJ0c3FDWFh4Tjc0U213NmpuNUxQVWRi?=
 =?utf-8?B?Tjh3MlEySFp5MEh2cjNsTmU3VjhTOVUzeEpBMTcwem1HZjlRTDhWRm1sSnBh?=
 =?utf-8?B?Y0llT2JvK0szVGpyVXJFSGRpd2xhNkxlYURmTFVBbXJhc3RWVDc1TzRLRDd2?=
 =?utf-8?B?SnNHd09teW1KNXNQWTNyaituZTJtU0tZdHlkemFRTDE3RDhjenI2MCtYdTRh?=
 =?utf-8?B?Ni9hQUhNVnFwZ3plUUtDTmZSWVB0OU9sVE5YN3pxOHhOSDhEeFEyc0VmdFN0?=
 =?utf-8?B?QnNjanZwcUhJMktHd1hpZXRvbzFDaWxBMkxOK2oyVVdpTktKQmlyRWNqSjZJ?=
 =?utf-8?B?Q1NhdEk2U1cxVUpPV1MyRWlQTzMvZEd3Tmd3UEtJeE5TSXc2M2NLRDdKRWdK?=
 =?utf-8?B?Wldab2hSRktpS3BiWGNweENIY1h1Q1JwVkNyVUJWd3lZZjIwNFBLWGpjK05j?=
 =?utf-8?B?VEQwbUJCSGFqY0hTODZQZzNrcWNYWUVTUTJMTmdXbmtCUU9zd09CM25zMFBC?=
 =?utf-8?B?ZkRBSlliUytuNTFCTjYxMy9GWHEzZ1o1aHBERElzWGxsNDVYME4zQktsa3N5?=
 =?utf-8?B?QU1rMmw2UUFLYUg1ZzhYcEFCZmdWdTBQK09vYk1MMHhONzQyYjdUWTA2WU9z?=
 =?utf-8?B?TkZsamdtaHhoMWVzVENNK3BoQS9LN0E0WVNlUlNnYVRKQUttanFsYTJ3Yllq?=
 =?utf-8?B?TExhaVBTN3E4c2xNZnZqenhtUnY3WVViN0ZNNVBIcmRVMVc3bVpSbGk2UE5v?=
 =?utf-8?B?bERBZHNQOFJaYkhESlFRNHgyNThGZEt4S2UwVTZXQUd0NEJSL250TnpiZHhD?=
 =?utf-8?B?Z3g4a09JN0ZoeGJ1Mk9BMXBWZXdlWTVFQ0ViSm92NjJFVnN0SnczMEhxWmdq?=
 =?utf-8?B?ck9DdW9DK0ZxRmpvSHNHanJkZkptMkYzWmluMjVFTWpOak5PbG5ZN2JLQUVr?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a50c92-ea8f-4863-7dab-08dbf1289806
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:14:45.5696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfvecdOGDugG0VjZp4LfQVMqZrDkvSJ+ZZaihKkDq19M3fpyw564pkkuatWYhJvij74ZKOtWkmYLm1vtLEZW1W/Z5+zJUEASeayKFyzVKmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8432
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

