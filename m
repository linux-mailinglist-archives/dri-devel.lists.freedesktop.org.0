Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAAA7600FB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9884E10E35E;
	Mon, 24 Jul 2023 21:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4B610E360;
 Mon, 24 Jul 2023 21:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690233329; x=1721769329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kUXpil+EcubVXuJnN+4CExkCdaMO2sx5fW3H8oEPG/A=;
 b=HggiBl6W7RI474Eama9ikkHxfBjzMXG5gc6oN337k1czNFXvCwe55Q7K
 pvKgMcrMO9o3pvrOS8DjxPeldGx7rhVEovFt7QYsAi6w9lgR9LQFAN8+d
 9/OiAtETMmIDVbUnootwm0T6xBxhzagBceiKfg0AJPboBNHCAfhCBcVlV
 ace1engj3mHbzPxgPvWojErACVBebNTsiY2GiApEPQCUC02IdCZoszaiJ
 mcigu3tiLCBrQ4gVE3993rBsVZMqXM3QkdJSqLEgF9nY7w6vIW7Cvn0pA
 UKvxPRime1XmTVQ/C8qmo+87LahOum1Clr/Gl3wZWIb7QNNWwhXGSQJhh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347830106"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="347830106"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 14:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="719815891"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="719815891"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 24 Jul 2023 14:15:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 14:15:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 14:15:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 14:15:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5vkG8uxR9l2NCCCrcOo2PLyPQC9NtAL3CKo17athrqfKtUddWTcUqcQzblVUQcAHgFcrCNfnpRvyEjCwgHfHwpvbwPte9aX1+c8V73zYCzWS3KibupQc4pMfE/b2itSIb34e9D8akUpewlSJxS+kRNJg7TrdUkkbHIzBX7zYn8f2Fn+nUYlEWwBqH/4e4+AfB/hVH9k3xLn7Q4dWXZt1ZhgclAxjR7xJ9zXC/PIZUPHCrnOUvzIj8wZThWNaWs3VDZFJIbpquEaJqxc7hMohyEExlZ/9toZpQn044msyMinssrCP3ic5GTwvZXqsc5ib9qI/9cmwLAac18TooQvfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsXm8Qul64IFOWsASHDJgaS6S9yTtKU6nE/rDRuoU5Q=;
 b=ip8eAQvF6CulTgx9rmhTwj1YThwLItRqQ4hIgRQuG7Ut8o3OJTycvqX9uxbuGneGDKDTHE2+dIjn6BBGPlHHpWl7luKN2m6b4TrYjxJuv7j73k5wDYzOHhIfY4Igly47wLoPzN+aaFmVKVV78+uAGJLrwC6Jy9PfdKpEEV88bweSOJvB+AYSsI/0dmxcw00xxzjBQLlW5OkcWTYBj4Hw8HqiF/d4OBN9QRQQQimtrZP4Lnh/bOICbmJxPBTBMOf86csJ1eCDlTPHsMPizgjMdVg/fVLrjtNRcSS1VNP6EnL68HCUY/SByRdcKpqvBsqipE8ljYP30xF1lbO+6PDsQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW5PR11MB5809.namprd11.prod.outlook.com (2603:10b6:303:197::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.32; Mon, 24 Jul 2023 21:15:24 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::1127:c109:d888:f6d1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::1127:c109:d888:f6d1%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 21:15:24 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v6 3/4] drm: Expand max DRM device number to full MINORBITS
Date: Mon, 24 Jul 2023 23:14:27 +0200
Message-ID: <20230724211428.3831636-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724211428.3831636-1-michal.winiarski@intel.com>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW5PR11MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: f78ade33-7299-44fe-f1c3-08db8c8b18ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iRa+9irpUpOX/LmxBviGnEDfzDmiAhALFjmHBZ16RdY5EC4giqdt6ByjdsPk1J2F0VeGfJLcLljfzijTf15dCyuT/0J635javhLQ6y7vFhe/1GR/ZMzj/Vz9rmvp/gUKriqclpdEb6jPQ6tRQ+qCE4FAHOcdDnHICwF3y3GIEt5ojxIFKmuKEYOwvvzCiiCJI92jBUWlwVyzmI4gkuLE1UJPc3MGwirVHlzxjgbWJblQHRBTHUpUhZAefGt+/IgcbuvMrr+hIHVSalU3iwaZRSaj3PM3HjuGCw8YnqzAEieWpgnRR2MfDv2iziZLdhSGxSemrpdIsRHfdPOf4W0dMc8D66edAWVPSUqEAIBpYliOSXXUmrZHtFj2QVy1vbbYIYkJsZzqLziHix7d+181rWPAxKGFPEoep7zf2F5BQhPSUgYjUg4L6KGgiM96IkmSwpMnr+o/FJhDNgtjlcVzycn9y77SJqFEcwg3vg6bw77iPLV1hB9KjP2vpmSsOm8lQBlHIxm3yvwVU4/aE5jlVKBpxyFhn6HcPuRCHheYWwaAfq43dlC9Dj8jRbdcDU68
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199021)(83380400001)(38100700002)(36756003)(82960400001)(86362001)(54906003)(2906002)(186003)(6506007)(1076003)(26005)(6512007)(6486002)(8936002)(5660300002)(8676002)(7416002)(478600001)(316002)(41300700001)(66476007)(66946007)(66556008)(4326008)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clpUejNwdWdFUTYrZWY0TWxqME9JdmozL0s1T3pNM1dxenQxOVF2MlR6dEF4?=
 =?utf-8?B?VHdiRWlsOHZhU1kxU3BXYnhwM0ZFSzVVSmdUMURaK2hCRy9RTk1iWllMRGpU?=
 =?utf-8?B?ZjlFc01EemdwL2poRXoxZWpVZ3dWMVJub3dBQkhIR1Y4OW9iTGtpNDRNZEhw?=
 =?utf-8?B?aDh2SXdObUR1a3BiUTVpVk9hTnFUU3U1TlFGYkJGdS96RFBwVVR4UzRUdnlB?=
 =?utf-8?B?Wm5tbmcxb2puSGNjQUxCdDRZS3hxNFkvQmdTNEk4dkxKWlhlU1VCUWE5TnF3?=
 =?utf-8?B?Wi9TR3hmRXh5ajdxY0RIWDhtVktoOE9obDFtN0liQlZJVjErQjBSbithSzd3?=
 =?utf-8?B?ZGhjTzJlTVdxcWxjT091ejQ2SUpnMWZLZkRBVEU5Qkg4SldUb0UrQndJOG1a?=
 =?utf-8?B?Wkl1eldwaEl1ZkMwV3VvSmtlSEUwV2J0VXdmUnI2RCs2ZjJnVldkVTRCaHRp?=
 =?utf-8?B?TEpoRE84YUZuZDIzbGt0all3TllGSjhDb3hWNkp2RTRGVmw1SUM5dXd6TlMr?=
 =?utf-8?B?dHkwTXRFRXNVbG85Rk9JRTVHRldwbTZxTTIwVDhGQ1B1SVZzcHQ4YlJucU0w?=
 =?utf-8?B?N3ZNWGE1a1luY0JXS0M2cGorRSs3S3BkZkJNOVhKSlN4YzhwZTdDU0huK3dM?=
 =?utf-8?B?RTJXbHhSbDlzY0FOWVBxSFUvaU5jYStuRGhJWjZoOFRMUFZBRVBRN0RseHds?=
 =?utf-8?B?cjFQck8wNjZJZEE3MGxTaDh2MGY4cGZoSExzY3RST1ZhK1RCcjlWQS9CczUw?=
 =?utf-8?B?NWNQQ2NONkVDSU4yNW5ua0FVcHNHUTBuOVUybkxPNUkwaFNFWkpwM3QrSWY2?=
 =?utf-8?B?d29ralJrbWg5ZzlkRnFpMUVUcExXY2tZY0lpRTRLeHAzL0ZkdzVwUUJ5WW9a?=
 =?utf-8?B?Mk9IUU5ib252amxzNDVKU2toNi9SQ0ZJaW9nV1JqT3J0MVBTekdrQXBwQ05j?=
 =?utf-8?B?TWlheFhTb2F3a1QyWW9tdnk1VExGRUF5OVNrbW5HazZ6MVFsU055NTVoSXd4?=
 =?utf-8?B?emp0RlltRG1hb2xseDl2NGRmVFhHRnFLRWt0N2M3NmhFNEI0MmlDQUxFWktQ?=
 =?utf-8?B?YUU5SFhkMGM0TUg0NlZ3SEh2ZVNTclJURDZoU2kxWXo1YzFqdWxCNGpId3Jx?=
 =?utf-8?B?Zm5tNGdWN3owZTdDNHd2S3crOGRHWXM1YmsyNm42UEZLU2c1Z0VVRGg2TG5R?=
 =?utf-8?B?bVlkK0lnSnBuVGx5S09RN1M5OEFMa3hlb1VaWXNUdTNOUWN4MGJ3cFloR092?=
 =?utf-8?B?eHY0ZmVIQjdmM3J4VS95RWNUQ2RTUG1ZVHdRNjJkcjZIbVIvZXAwaU00eWgz?=
 =?utf-8?B?MXZSQlBGZm5aVjhPcmN6QUFmVEhWbzBKS0ZqVCs1WExRRithRi84TWVlWldW?=
 =?utf-8?B?T05WOWpZK1E3OEZ4QUIxNXFMRk4ydFNXQXRqVGtMSXJiUk04dDVnRUN1V2Jp?=
 =?utf-8?B?aUtsRisrMFdVV0c3aDdCTDNXMWtOYm93ZUpiOWNFbElyNm40WTFaYTlJaHRu?=
 =?utf-8?B?SzVkZEtKNzhqT3BVK0dMcmUzQm1PbTBaQU5sYXNpK2NGa0FkZ0NQdnh0UkZx?=
 =?utf-8?B?S2ZCZ1ZRNnhjRWZlL1NyKzk4aFg0UnVWRm5GT3MwQjVabWZYRjZ4UmErdG9u?=
 =?utf-8?B?dzhSSjIvYXhkd0dtZWJhRHJqN29XQlRXSGFScGE3M3lpOU52RXhSUWliNUxm?=
 =?utf-8?B?VWJFdWhESlduLzNWZG16UHo3bklhU1UrWHRiNU1ERFZibXF3Wm94eDB3ZG14?=
 =?utf-8?B?UHVSQ1VPVVVueTNBTUIvZk1aMmFoTWVFZXYrVW9odFhURW8rWm9xNGNwbHho?=
 =?utf-8?B?Y2NTb1JydHBnb0tKSU44V0F5OUh0ZEFjaGZFcGZjVS8wNEFvUjlNVGZqY0Np?=
 =?utf-8?B?OXF0THdybDV0QTcxaVZNeTIzNTVISnhaekZ3OWFvM3F2UjdUVk8wMGFEaEty?=
 =?utf-8?B?dXZxR2NaR0RDVEI1eXJLVnhnQjU4S2tMcTVFZXh0VEhHSmkwdnFFVHVrTi9Y?=
 =?utf-8?B?SjFHTjh4WWt2clBOTTVaR2pJZGNmNytjODJJVHZYQTNIU1hHQUJCbnYydm85?=
 =?utf-8?B?Vm5xRnM5OGNRaFhWbFd2dDVDaUxQdW1vbURURmw1QjRrRnB1RlN5RDFFdzZD?=
 =?utf-8?B?L3d4NUdTZmFoM3h1dlFPZUNxWTdlbXpRbEJodEpXVENuYldtczM5OXczUnFQ?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f78ade33-7299-44fe-f1c3-08db8c8b18ca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 21:15:24.8348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCui1SnYORZj/kKIzR6zWfUC9rQJc9o+2IS1269RfITFmxYuoFcmqISGkwlpCui5JWdbNTzhEotWVVyUECTqYkXrF3PLWPLMv0/LKSyBT9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5809
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 James Zhu <James.Zhu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Having a limit of 64 DRM devices is not good enough for modern world
where we have multi-GPU servers, SR-IOV virtual functions and virtual
devices used for testing.
Let's utilize full minor range for DRM devices.
To avoid regressing the existing userspace, we're still maintaining the
numbering scheme where 0-63 is used for primary, 64-127 is reserved
(formerly for control) and 128-191 is used for render.
For minors >= 192, we're allocating minors dynamically on a first-come,
first-served basis.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 34b60196c443..c2c6e80e6b31 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -121,10 +121,19 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 	xa_erase(drm_minor_get_xa(minor->type), minor->index);
 }
 
+/*
+ * DRM used to support 64 devices, for backwards compatibility we need to maintain the
+ * minor allocation scheme where minors 0-63 are primary nodes, 64-127 are control nodes,
+ * and 128-191 are render nodes.
+ * After reaching the limit, we're allocating minors dynamically - first-come, first-serve.
+ * Accel nodes are using a distinct major, so the minors are allocated in continuous 0-MAX
+ * range.
+ */
 #define DRM_MINOR_LIMIT(t) ({ \
 	typeof(t) _t = (t); \
 	_t == DRM_MINOR_ACCEL ? XA_LIMIT(0, ACCEL_MAX_MINORS) : XA_LIMIT(64 * _t, 64 * _t + 63); \
 })
+#define DRM_EXTENDED_MINOR_LIMIT XA_LIMIT(192, (1 << MINORBITS) - 1)
 
 static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 {
@@ -140,6 +149,9 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 
 	r = xa_alloc(drm_minor_get_xa(type), &minor->index,
 		     NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
+	if (r == -EBUSY && (type == DRM_MINOR_PRIMARY || type == DRM_MINOR_RENDER))
+		r = xa_alloc(&drm_minors_xa, &minor->index,
+			     NULL, DRM_EXTENDED_MINOR_LIMIT, GFP_KERNEL);
 	if (r < 0)
 		return r;
 
-- 
2.41.0

