Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD02B80DE04
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 23:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0F910E51D;
	Mon, 11 Dec 2023 22:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D8310E50F;
 Mon, 11 Dec 2023 22:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702332593; x=1733868593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QycBI7Kt9PgTyJxaiH/+LWXtKXKuLCo9OVwQRLqdWtI=;
 b=ZsQB41Uv2TMUZA0G58La+butxODjhJbp78bpPrYbZ8tabTmvyB2vOotk
 BcAiTvpoPI843QP1Yb57sD1G7o4IsfY6cKhq2KG8RhEZXzm3/gWMT0tnl
 MVMI4XCSf8KUuhReusynyyZvFQYpdwENGx66PISyoxJKZZv4jTdYzgIB6
 yhGDG+VCkgeqHF8s4f3kpHJU9qL5jsqSpHQm2lLS835wy0U3JwfoX+F0H
 W8q5im1uZZbOGb3y5EdBnDHdMckd2+95kgUDyQ5/5iA/MIest39fzhTOf
 D07P1LLZFUjeHn6gU1F145v4mys2+K8rvlet1aJLYjeQO6x84cZQtM2m/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="425842295"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="425842295"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 14:09:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="14682970"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 14:09:53 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 14:09:52 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 14:09:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 14:09:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 14:09:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMek1QLLsm2FQ7nL/nAUwBNNcjnslX383Y5FkKKRaejNxNTAxpwNzXXZcFWklpotsM3vKpPNrQdMgZ3xHhVrPeZ3Q1LpjGmvg/u/ibi2QUEF6ovREUpsGZ+YGhLfVsFQnXtNR8GcCSOiJMdborP86bgkAMLZ5Q+wUbnoh3HdStIo9j93dR120DnY/1jgCPG0/0ChPBW94ljV37A0gskSYKxORlOSJL3QWvUGEP5cSgouZRwSssPeqn8vwjq2NV9WkYv7HJ5jTc6Imsvvl4z26GMZLFqu16OSh4akSWZ3DNdDZkL9iuhiPp5wpVzLtBlnLcvjPIRu9Rn3vCRo0EVwmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmFrd6XZVfmcX6t5o754wGjAQjnYdG1Cx10L3HP9BJc=;
 b=dhY5U+ttrKvMTGmRiDcyqgREAKaZdQB+4QdWSCPR8XUJuLDKfAGXDNqXVOy0x40djuHXAhNVE0i80jnsPcfoisol4WlT9K/7twL3QXlf/9H7vim2lieo8eZjgfM7foXxsZFZw+IlkZEVfbblK7F7ySm2sXHiAv42jXdaF2uw4kdsX4FMSeeOyXaZNlCuXmqsB2LbTdjyLi2uoTpT6gpajRnRCw/kLpO8CYaWT5lDEJUlwj6DNmGqMPZX4juWltQCP3FbmLmFCRZ/BC4bwlwJvZHtD3jcGi9v2hckiXG4hBQxnP/Y3OJThdVPEN4r2FULrjbW6cRKNhnKdKunYC80rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB8134.namprd11.prod.outlook.com (2603:10b6:8:15a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 22:09:49 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 22:09:49 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/3] drm/managed: Add drmm_release_action
Date: Mon, 11 Dec 2023 23:09:37 +0100
Message-ID: <20231211220939.215024-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211220939.215024-1-michal.winiarski@intel.com>
References: <20231211220939.215024-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::25) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: e6877d91-4969-49c2-c793-08dbfa95e452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QsKub+TJLD1kDng8cKLsmUsitTyoVtHYHc1ruuT414D35W1hNpfqNg6oppEu6FVoF4tAMdXp8k+iG+VqvncgPL6Wk72I6acl5+0b69zT9lxn+YP1rZqAMwANhMVGOKVEkhqjxn2Udjpwi3N71XqRrGnuXLQ6F1sMoXyr62INf0hrvRKurrw/ioeRQL+ywC+YPvm9FFiC7zrFtgmE8rro/IJ18W+Jb6iwEuD1l8AxosnszXB8IDaTQParuKnw9GfUNj9ug0Y8PH42NFh6jwuFArH5Ig+zB32SHnQ3yAcoz8JvpopfNNTsn8rfH7/5ruQJi4tdxbJdX+ustjEkvphBGp19mscD4dAfXtrJNWsXIokimRchmVPbNJ50CSGgm2U7BRuDBvPvANCNw35nRluVx8t+PFL/HSyBcD5Fj+FqmWgXOCNrPIudPgIKduYawIizy90u7ueqVEyuB1YK/cuExpLvIznFypa1/vtfIyEwwg9upNqfl0bmzbbY8cDsemz3t1t8m5ncWINIDDWSNL6DksEMKfMB+nadVCkP1TM38c5V1ALLyTCsmz/mTtR+UK/8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(396003)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(1076003)(26005)(83380400001)(2616005)(82960400001)(86362001)(36756003)(38100700002)(5660300002)(316002)(8936002)(8676002)(4326008)(2906002)(7416002)(6666004)(6512007)(6506007)(66476007)(54906003)(66946007)(66556008)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R082L2pyeUxEeXN5VkpJMm1LdE84am51c0RaUGZCd0t5bXZ4NmZZMnZIcjdh?=
 =?utf-8?B?UkxuVm9tZkNwVjhqMm1TeUpTbVFuN0sraTZrMTFLc1RyMU0vK0MrTmFVYTRO?=
 =?utf-8?B?QXZzbzR2SEhYWHEwaHcycStLbTBPTWpGNThCVGJaSUtUYW9vNnp1V3RLNndl?=
 =?utf-8?B?RWg4c0RjdEVPZzM2YldOSit5d2NVQ0ZMNWRYSGMrbVAwbTlFdVIzeG9tTDRM?=
 =?utf-8?B?aFRmcE9VRmlOQU44M3RpRlVjeEtybnAreFlPdmpJd1cvQmM2S0ZQcmErbHRL?=
 =?utf-8?B?U3QreTAxWWRkcXhLVStKQmlkekgvTFkxbjRnUXFseFBQbCsyM3hMUFdpRnBS?=
 =?utf-8?B?eWJuRXJvTjc2NVNTNWxKWWdRMTk5eDM0SFNSYm5mdXRhV0ZySk53RkVsbEhq?=
 =?utf-8?B?bndXUkFadDNNM2Jkb3hURmJ3OWNWL3g0RDJTUi9pQVBtNUFQdXhHU3krZmVz?=
 =?utf-8?B?Tm80MHZieFpTNmpVd09RbzFMaWdVL2JDOFpXaklEaE9Tdy9SaTFDN0NOMWdH?=
 =?utf-8?B?bUlrSG5aQ3BTVkM2NFByWXRpOTVNSlh0a2FXcEY4bkdyYjRuOElFTEZFZHAz?=
 =?utf-8?B?RDlIdDhtcnhSaDNYY0o1cW1sbU0xVjRhaGpLZEZSSkFHeDZMampwWkNSVHFo?=
 =?utf-8?B?ZWxGcktTOTlVVEZHTXJtMnJhaHE2R2ZaWlgxZEM5R1huNFJ1ZFFLN2xLUmxm?=
 =?utf-8?B?NndTN3VwWG4zR1haNFJpenhQMmppcVZMSC9mNHVKNnkvMTBoT05kUGhhWHYw?=
 =?utf-8?B?OU1tNk1MSzV2c0RxQ0tHc2IvdU5IdWQyU05hVXFDOXVMV1JkQldqb3dCRWUw?=
 =?utf-8?B?c0d4SmFxQTNLVit5ZTFXYlRaODVhbnJ6K2RMNmFma2ZJM1hNS2JzMkFZRXJk?=
 =?utf-8?B?SURLRDNUeFppeXlYR2JTSGFwK1BNdm1zWVgwK05TZ1gxUytzNnlHM2tEVEZJ?=
 =?utf-8?B?cnBjdythYnVPR2Y2R0ZNNWpqdlRXU0JpSXNPNXpaWkkzRklWY1FYMmhQMlVj?=
 =?utf-8?B?OFhHR1dPVDJvRHJNWHFYSC9lTEs5U0V1S2lHSkxXcDZmT0RGSXd0dlE4WGZh?=
 =?utf-8?B?NGd6clRzQjJVQXFCMTZoWFFSRk1FSmxNN2V2SmoxTVB4Yys0MSs3NHczWUo1?=
 =?utf-8?B?UU1BN0Vid0pTU1JrMVc3cjJTV05kcWhRVkZOMmVKbjJiZ3F6MHdlUzV5dklB?=
 =?utf-8?B?ZjByK3BndDJFVWsrVWhIZ0VXYTNXWjZ5VDhJWGlCSnJUUFgxSkJjaHpLWXp4?=
 =?utf-8?B?eGc4a1RkQ1QvTjJaenpaVnNGZWEwZktsSnBzSG9FbGJtN1dFZ0VLUHl0MEdO?=
 =?utf-8?B?SzBTSEpPOHV1QUNtdTlWV0VDS1N1aUdJTTFSbEUreGtEb0R6STIxek5kMVQv?=
 =?utf-8?B?M2p3STVOOVVBR1M1VlFxUHE2eDg0VnBPanpIUlB3S0JXRFlKMEErQVo4RHNB?=
 =?utf-8?B?a0dyR0dBQzBtdXpMcmpVMkRkK0dHR2hIaFpKa0pudHViUCtod3VCekRsRUVT?=
 =?utf-8?B?TDVKT2RWNXFrYW85aUxSWXBoMC91ZlNLYlhYMHdvQTBEdUhLT3dKQXYzSERK?=
 =?utf-8?B?NUJqbW96RnNkYkxnR3pWZU9zNnpzNlRSM0FGOTJCR21GVG01ZnZBVUg2T3N3?=
 =?utf-8?B?Q0UrUWFQak4yZkx2TUNzTE1FRjJoVHVhcWJ0TjZlazM3YlVLLzd3STJhdjl4?=
 =?utf-8?B?THFzYXNmN3VYWnpEY2VCTG5RTTdGSmwydXlLemsweEFGQzU0Wm5OYWR3U2Js?=
 =?utf-8?B?VGc4QWxuSkQ4Q2M0Qzc2TGlGSWtZbjB4Z3c2MXdaaW4wM2lSTEhrcDNwZ2pt?=
 =?utf-8?B?ajRKajFBNUU1Q1Zubmljd2F6RjV2UmFTaWs1NXkvVzMvRzAySTNiWEF0dENJ?=
 =?utf-8?B?b0xKV2kxL1BaU01UZnp6UWRhVFYzSm14aVJ3cDZtZlQrQVc5WmhvRGRwdG1m?=
 =?utf-8?B?TXRKYmo2UWdHQlMzTVZzQ1hhWlNzMm9KY3ZlaUppLzRDanRaM3NCME40eVNH?=
 =?utf-8?B?OGpTK0o4VENVdm9scjZGY2I0Y1kvdlhsbGJWdlB2QUhuVnFXMDJWMGpGaVM0?=
 =?utf-8?B?YkpLT1lpc001Vkpvdk5XNDNncVBiRzExcSt1UWkvdmJBQ0NweWRkRTIyci9C?=
 =?utf-8?B?M1cwcUUxbUVXazZvRnhoNWdoOXhQNjNXSlNpRlFDQXdMMGJkaFcxZFBxK0x0?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6877d91-4969-49c2-c793-08dbfa95e452
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 22:09:49.2268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqOBUzTJewHEXVoqxNmQRkd9JhE7GGK1IN+Cf0kPCrGeRO+UY0LEBz/2xCAR3UB82wD9PylCBsf7N1QOxi6i5LhaJp7HtQvBjBEGA1yFFVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8134
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

