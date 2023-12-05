Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A118043F3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 02:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D79A10E457;
	Tue,  5 Dec 2023 01:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5C710E45B;
 Tue,  5 Dec 2023 01:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701739366; x=1733275366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QycBI7Kt9PgTyJxaiH/+LWXtKXKuLCo9OVwQRLqdWtI=;
 b=gSp6JM2rsgP7JkjG/9Zz4pfsxBaNRI7wjJ+rjwaA8plHTxQm7P3u6uXi
 N3+bSHqdRoPmJw6YkxgkL+Gwwytvqpd/5FQH4NO2b7d42eZW1VaIBzBKJ
 0+6traldpRtdEfBwRLlryHrWoFF/Q4lT161iHVCJraswzVYumWFeBLl+2
 KGvXVhOeXArgJTSlDuLws052aRMbl7FJhnyG+vZpD4pYcGneuVjmeFfDa
 7brz/rwF739eVQbVManm2QkIUmZnKx5/fVkS7US912gD2SoQEWwPaqQCD
 SanUrYjuNKwgRsmkKNMEEsLLy1kS9yJLVbsFlamb2CkMuPVBAZhimv72F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="393558948"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="393558948"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:22:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="12157625"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:22:45 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:22:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 4 Dec 2023 17:22:44 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:22:44 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:22:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7nja0BmgCNTAti3zneL+cpjtBNKMXX15raGYyVQSMHjiy53RAJ5gzBRVCT8aGJDj0skEm536fFXbl9SqBVcVfDWwKtAPneAg+I7Onr6Kl0DIQCoNjZnzeoqiHrmztfHabeJSSfbVchn5ibj4KmPE2N3+qoX0m7WvxgvcR84IfWav/UA4t+MKvyKc8qGqXNsJwrRtO7M27dUM51uVfA+n7c6ANmv/yp8x0cetm6Mvtv4G4DT2O2IDiJ+fwF0XxsdvOr62BJDk518uITS92/1DMaSiVxlPk2MiUwa3sGKvNsYES0cMoxLt00CchJq4PXI/ntxwra4cx31WUtaS7RdtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmFrd6XZVfmcX6t5o754wGjAQjnYdG1Cx10L3HP9BJc=;
 b=Q4EUpqX6kWRLGuvt3/KUYwyGKQvU0YLyHf6vhlm6XVXnKDn0x6U2UbWkxKrPbR69jjFb+QhTqvAPq11DVcQ/15j5lYd6HMM87Vw4LvazkSGP36DkLhBTsPYyiBpx9xSpGVaJaMu2O9A7LW6V8kTS5FR6wqohcs3RWumJ6BDRvV+6oEcUEegq4XWYTKDWe2tJ68Ra4QV25yyfkzQtcMMu0TS7kR2xFCnVl4keOtNWRbLYBqJTPud3xlDKayGxmtqEGJxCyPrUSuNZZZUuILYX5qpn1Tctr9vjyAf18x9F0Dh4OXEADFU/mEMKFG979O+dg0GHBKC/LD2j+/WMTOgpHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB7618.namprd11.prod.outlook.com (2603:10b6:a03:4cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Tue, 5 Dec
 2023 01:22:42 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:22:42 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] drm/managed: Add drmm_release_action
Date: Tue, 5 Dec 2023 02:22:08 +0100
Message-ID: <20231205012210.1491532-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205012210.1491532-1-michal.winiarski@intel.com>
References: <20231205012210.1491532-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: e817bebe-8eed-4671-5363-08dbf530ad58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6bu8NWCaOVbUsb+fY2BiwyUXmPvzdaTUEEBFzyra2XZI9GpXJFgor9Ri0/94RpgF1PaPrtuH8NLbpcV1lWZ6JhLbvkLDbU3hjTGVlHcyPtyNqlZbntv5aEBSkMusb5y7plI979DI0wkC1dTzytrty1Zb9jfQJAu2DrB9GknL5jdk06nHZ74xEe81NuBTxUtc4DKor/Ho46qyhMPhfFhQWv6h6OYXkkgxAFTTXK5cmc/kV29U3jtUbz5dMoRfkxaplbOcLv5P9wZ8YtHHecSzUIiRsDDh6PYC4v7PmIN/t5GonaEgy0uHB8heJHfoVsS30ipP8i5GkNeMepHDIXcwCVioBTWPelVASCmpKDKY8VqMVSEdKPrz8S/u45yz4D4Bha0s+kL5I4FFtuh+VWCJVVVAjIR4jgCL+usv1AoLivs8rF0fMjdHE6XlCIQc1aI4gHrJfxCQSu0CoZ6Zx3KY2Sm9x6VbzJYQTwUnbuHthIrbIHWfUupFBu3PAobRiXismvNl54WxEeeGxA0YASgOkoaLafiFO4wS89lQTp3ZbmXlkXU+asG9BuB8fBiRXaj9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(7416002)(41300700001)(6512007)(36756003)(1076003)(6506007)(2616005)(82960400001)(6666004)(83380400001)(6486002)(478600001)(26005)(38100700002)(316002)(54906003)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlhmV1lkL1VYQ0FzeWl4K0VCaXJ0YThEZmlsUVA1VlR3YWFQNndibG5XcHBR?=
 =?utf-8?B?Y3lyVVAwQkU1L1JaNnd4Z1J5aUs2eFNjaTFQWklxWEl6Z3pqWDd4enIvR1R4?=
 =?utf-8?B?WjBQTkJtU3NmYm41TytOb3k0RzlyRlNJaEdMaURySnVUYjVLZ0J4UUk1d3oz?=
 =?utf-8?B?WXp4TU0xTGJqenV2SWJyUzdYUmxTUlczNnZESGZCc3B1UFZyc3ZxbG1kNEc4?=
 =?utf-8?B?WjRjZjR2UVFvcXc1SFF2RWkwQndpWWE2d0JuY3FYS09tWmh1SWNXTFd4czk2?=
 =?utf-8?B?QW1pNFRLMkhpdWEyK2QvWnhrMnJuQzEzZjAxQit0bmt5MEJyNDdwZEdKcHFo?=
 =?utf-8?B?WjBCb1hyck16b1JGWWpjVTIrbGp5eEhndHllYXRlZ3hUUXBZV0xkRG9nanUv?=
 =?utf-8?B?UjlEWkNpMHdnUWRCbStyaHE4TmtRYmYrNTZ5MDBhMTVDaWlPVm1PU3VEMUxz?=
 =?utf-8?B?WmhOU0xML1JrV2x2N2Z3UWFrY2JKRHp0czdpdmhSeTV3V0lOdVNpNXIzQ2RN?=
 =?utf-8?B?YXhrSzVOMkFjdkZHdXVoMnArZWs3MjUvRjg2eEdBRWZRb1k0TkQwcFZDeGlJ?=
 =?utf-8?B?clZUeHN4Y2pscFcrWlhvV0dFTG9PKzU3ZmN5cHJsSllSUWZnUE1FZ3Yrdkxz?=
 =?utf-8?B?YUYwN1RnSUpJZ29wc2FzcVdWTWtjc3RXRWpyQkdDK3RXWGtRenBvOVVzRFhn?=
 =?utf-8?B?UUluRS9mWGdXREhDa21ub2N4LzZyYjN6NnFFRTlaY1BjbUs4MWJXNzlVTjZ0?=
 =?utf-8?B?L1poN1dKYllqL1VEWFVsbitkc2ovZnp4cmZNQlhuNlgzd0lsY0xXLzBCWExQ?=
 =?utf-8?B?M2kzbGgrWDc2aFFTdm41OXJZZHJDVmpwM1AvMUplR0xDTW9YbXRYdUF1NDdP?=
 =?utf-8?B?K2Ztc0Y4WStLclZGby9UV1RtQitmOU1vVTRqSkl4TnlNMkVIVGJCVHN2ZkV4?=
 =?utf-8?B?R0FpTnFDRkxnTG9VNTJLTUJaek44dW5YODE4WUNoZW1ES3lNZ1NzUGczNUIz?=
 =?utf-8?B?NTRqYlN1bUxMcHFlZmpKN2Z1SzVhSmlaaGFmVWtqUzZHZUxic090QkdvVE5E?=
 =?utf-8?B?ZU82TVVIYStORXJid3NBZlp6cjg2c3F6bDVPc2ozMUNveHV0RlBYdUlpeFc2?=
 =?utf-8?B?SFNXQUorMjdxUjA5cVNyOGo3cTQ5RXd3UTNQUEdOTEpCZXF1TzlOK1pMeG95?=
 =?utf-8?B?NTI2Q3haWmx3T3Z4NVROQVRvZDI4UFVGL2g2bzJUTUIwWVVGalNMd2JaYXJw?=
 =?utf-8?B?c0U3cTNma0FQWnB0eFYxNEQ5Z3d2Y2Z4ZFRzWTFpQlRLYU5WWEZvWkJjUWJS?=
 =?utf-8?B?SnZrTnB5aEd2cjJBL3VTUEZZUFkvYjd0YWJtclI4ZHpvT3U2QnJBTzVRTzlC?=
 =?utf-8?B?bGZueVNYSEZmYThsODhhRkhLcWZ3RTYxRm8vUVBsaTBDazZwVy9BSXhvd1VM?=
 =?utf-8?B?YkU3eGZHVStnK1crd3VZZ1pRYUVCeFdPa0xnUVY5ZmZOT2xBT2NxNXVSakNH?=
 =?utf-8?B?d0ROa3NjN1BUc3FTckxSSndzd1prcXljNk80VzBsTWFxNUlSWUhvTkNFT3F5?=
 =?utf-8?B?Myt1OS9RNU9jM3JyVlNvc2F0MnpEY1VtOExFZWJVQlRXdnBiV0VWVGZXaGdz?=
 =?utf-8?B?Y2hGamhBWWdSNlhxZC9tSllpU2hpcmFJWE9kbGcyc1JZMk15WXU1V1JrTjR3?=
 =?utf-8?B?Y25uUXBaWFh0Nm9qYy9kbVk3UldZa2lZV1ZETW9MM1o1VnYvaE8vTGFGTzFy?=
 =?utf-8?B?NHFJNDZKUUFLdEtacG9Ma3VkRDZwckVPc2VlYnVPcnJ6ejYzQ1YvZXBwUi96?=
 =?utf-8?B?eld1dmxGdCtYUDJpT0xoK0xjNDMvRHI4ejVkVWNBZ1U4VDU0N1N1cWxGZXVq?=
 =?utf-8?B?eWdpTHVudkEwMCtQTDYxVCtMbDZoNWhxSFBEYXJwYzVXTEpMYUptcEZuZE8r?=
 =?utf-8?B?ZHpYUDdxUGdVSi9XdFV1eTFqTDlQM0lCRmtiVEFsZjdoTjNnYWVWYURKNFJ1?=
 =?utf-8?B?UDVjZ1I4b0Fvdk9scy9rWjBVOXloeE5tcXR3eVV5MWRmcE02WEx6MkpBY01I?=
 =?utf-8?B?S2VIMGpUL2FKVGJINGowdG5IZ1greVI5cWt6azdyVDd2UGNQWFpQSFFYQkhk?=
 =?utf-8?B?Y3dCamYzanRPOSt5RW5waDBlZklUY1c0eFFJbzFmMmMvZ0NSRDZSTGdKMVkr?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e817bebe-8eed-4671-5363-08dbf530ad58
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:22:41.9900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stmUWHLHEIj1LzVZW/RIG/Xc/pQte28+MPBdEtctp5RaHGOelqjQIONDUBo9UrCTwMnNrd5/fKP9pkBUfYKoFoqK5e4FKj0jeJzD7GFa1Lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7618
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

