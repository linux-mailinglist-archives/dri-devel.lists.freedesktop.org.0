Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FDF5A0186
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 20:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A048C1266;
	Wed, 24 Aug 2022 18:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB619AF42A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 23:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660777715; x=1692313715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4dBbHORUIDAzW27or2yZeAAFJcQv15mU0vub2lDevaw=;
 b=HMF6D4x38ZNBiQLe8ahKBrsb0GLEImsuTafE+Ci6F048Gp+F9BJZKWvP
 n8p9VFKRkcq1pLZ4SASdzoAIn5UvyN6PzZH0JYOqcyT7fJe1lfazA3JX3
 5g4cr9VO8fEcm9cRWpbZxJ6P3YHIAw3RKQWrtcQApoPrLDF5/KkeD4IH+
 nzvs27nPN/xX2vaS4u1HqiVR7YgsXirvO3src7MNH00w4Hs8VgbcM+bOy
 GL9SQMKrvrf+AD4pV3ewXKFDp3SAS+/mtASLsMdg+aJvUg5Q95vxeJJC/
 c3JLElCDzt2GYku8hTWDro2liLthiHHirKm0bzbHMxo6Y0CRNd3AxvJzc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="293897387"
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="293897387"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 16:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="640640884"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 17 Aug 2022 16:08:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 16:08:33 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 16:08:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 17 Aug 2022 16:08:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 17 Aug 2022 16:08:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nf2RzeTT8h0gSZW0Hf55cgpvcVnXC6lpgSSX0qE7qGHWK9EHK33RV893DcHrJSHMt77cZSgUGPf4TjJENc2VGdDLtBzNeSz/gTTVKdZj2JRxGTCje7x42PMpgzXz5cSj6plbsVYZrtufXWXV56Q+dLKE/LKJSl0y+CWHiL7NP2p92R6MF0jJp9x7JKVtq2GCQWWpZlXbgay/H9mhIWIIzmaOGIXv9yECsJL59eg0hoYLJbrIfcuJfqTixmHbsKQJWo8e+dW79JmFo4W1tUpT3HCBEAweFWSeGyNp0NeX1AkxuJPt/VN02rVMiqUD+wPUWRWAOfNp9XeubmJm7kDkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mc6hN/s5TyNE+n2b4bOMB0W4fgtMdjMzfA9CwOwdNp8=;
 b=HwdrUQ3sYvFg7CQ5kIbq1CR26szVkp9fOQm21UDAKEWPQDZ+Zrw/IR4kJ6MPJJugFwuOh/BfOxE93Vt9BVsWXtcRj6MYq02k530bBp08pQU5oAb7OBHh4e6krAYwd0elqi6B+id95O8KVoRz+VLXGrKCkTFPC7FM4sS0QtBL+8qBIG8gdOHfCkYNOmzz4bCwtkd6OR/WeIEzB082lrL9Nk7AgpWi3FaWCIldTUKzocKvSyppTO8FfoNSgP3Xf7zz3nmDSoQcy3do7Zd9wkuDUJfg3Me9jlCbO75424G+oVVkVtA3az9Kas/6VbfYFTW0htuTNZMtzzp0JYX5L4tlGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN2PR11MB4190.namprd11.prod.outlook.com (2603:10b6:208:13e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 17 Aug
 2022 23:08:31 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 23:08:31 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm: Expand max DRM device number to full MINORBITS
Date: Thu, 18 Aug 2022 01:05:59 +0200
Message-ID: <20220817230600.272790-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817230600.272790-1-michal.winiarski@intel.com>
References: <20220817230600.272790-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53b285fb-a841-472c-7393-08da80a566f7
X-MS-TrafficTypeDiagnostic: MN2PR11MB4190:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s3O7pnhrBc+gqTxODMufAAFEDKq3mh/L5CSZDybmxzxQbAEhVT91Im/dnbkxOCc0vgxFJtuLqYaH3XD+32U3xAMjN7uM+HOSGnsY54/HrK+w5ZYS/XbBZ5io3CScOa6hfxYZuFVVwvFjBfHc/YU0r9/kOGw6n6X7+PaBI+TSg8ncdUP75xt4fnCmDpfFTZa/UMMm6VBPJBoPN0jzOnisagoyLv2dpSQKAoX5YhHn3DkBtgUclCoNbMKZuj2SGRC/JNh+BVgLWuCn/eHjQqLgQt7YOUy54QmZYP2gXEd+euLM1WeWg33iVbNjHwuMlg3vM7ZPyRPjDx5PvWPtHh/SFYxQtxwD+tHZtU9yt1RT9DGA7brLuvGAsjoZ40pCsEyl/R76DyS/cwsAFil7b4oObiGOLTpCzkqqpN5JULL0H8CBk3/jwmo+h37g14nIHdzUd7t5Ozuf+F50or/kX3OPHhmTx3hdeqp8adEREHIwNuhYalLbI//Z3jybWBvG09pJnrBY7eiv8uC10gvZUUuV/bQC9EWN33mRQmf0l5AGL2SB063cXoyo+ONzHdpsbNVuK8iFoYNaaPQqMtQIOAVN/JoC2sOHCfqP8TOFq8NQjCWZOtP5Xiy4O+tko3KJLHQo1/hTrEqzK9sqp5AbH7kfa+givwr9isEVBtgC57vS0z+N0bsVsC2hLFFN4cR9qZfnYNtFwz24hTbpiBGfECFYpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(396003)(366004)(346002)(376002)(86362001)(82960400001)(38100700002)(316002)(54906003)(6916009)(2906002)(66476007)(66556008)(66946007)(4326008)(8676002)(8936002)(5660300002)(2616005)(1076003)(186003)(83380400001)(478600001)(6486002)(41300700001)(6666004)(6512007)(6506007)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHpUYlJTZHI0Vys3b3FBa1B3R2FrTU9aUW9ZZFlkNGZCK3Y0YXdYbEljN2Jh?=
 =?utf-8?B?TDYzdmVqMkp3cm1hc1VhUGFwVW90WC9yTjlBMkFRR2ZSL0tUbjdGMDFqTDlH?=
 =?utf-8?B?WG9KNlhQUEhtU2lIcDRaVzE3L2lKYlRFL0NnUTFoTjA3eWIxS0hJSVdIRWZ2?=
 =?utf-8?B?eVZwNFJsY0cvTVlwQnd4M1RROGlyL0pocTVja2xwTEF2eVdZcWZhQlhMZXE4?=
 =?utf-8?B?KzdJRXliNEpEdXh3djBKSFowUVZRa3dYRm9TbVVIaGxKK1JxeWphU0ZxZ2M0?=
 =?utf-8?B?TFBTREdXVnJETmcxUkx1K0oxeHQyajE5dWdJTGxCMXJ4dVFJaVlZSVdvaTM2?=
 =?utf-8?B?N1NFQy9YdVYvWWR4WFZXVGl6SzJiUjBxY1hiYTJYVDJsYldQRFhnbFNZdlUz?=
 =?utf-8?B?OUpZY1BZRjdNeGVxVDR2YlhDM211b1R6WnNDOC9uWWhzd1lMeldiazdVRWhZ?=
 =?utf-8?B?ZVVLcUNkc1YvNWtLUEdRZkpLdkViY0tSRHUvZlpCWjI0Sjh2eUhRRGhPWktM?=
 =?utf-8?B?RzlqWERjRHlQdndZUVZUUEVDUUtkL0hDK25lQ1FvY285ekh1dVhLNXRBTE9v?=
 =?utf-8?B?VUtsY2g5a1oyd3VoNkRSZmZTN0U1cUo0NFVRV1lQOFhxeHdOSThONW9ISUk1?=
 =?utf-8?B?cmE3WDNEN1l4L1VadWwwVXlLWEczZHNpYlpsMVhHbElDTnhhbGtaVXYrSEFD?=
 =?utf-8?B?aTJoWXdWNWk5WWpiSWZNZmoxdExIZFFYZGZ6bDFUOE5ZVFFkS0o1bzA1UU5I?=
 =?utf-8?B?YmZwd1ZEV05uYndFeWljdE5HbzAxTDF3b3BPdlordW9PcVFnOThMOEF4dU5y?=
 =?utf-8?B?clk1NmhDUTlHYllwN3dyWnJEd3BVdDJkRk1LazFCS0IyZ3F2Qm1pWVJ2Q0Fy?=
 =?utf-8?B?QWNuamswa2MzMmlNb241NHJmTUpHL0U1N1RMYUxkejJRSlF0S2ZRNFhyVFdH?=
 =?utf-8?B?eFh0K0o0WXNYbzh0bGEvMmg2cTd6elp6YWROUEpCeHhsMERwcHA0QVZCL0M5?=
 =?utf-8?B?NGtUbE5odlN0QjRld3hjQWRUNHBWMmsyckpWVGY3ek4wbzVheUJmVEFQYnpR?=
 =?utf-8?B?NGkxK1RoUkRKQ0c5R3NHV3luOUJSWXFadzFiRzBSZ0IyeVhOWVFXNzJNcHpa?=
 =?utf-8?B?by9ubnBEQURtaDRnZ0w2SmVTZU1rdlp2cjVKdHFvTDgrRU9kTTVyanc4NVhk?=
 =?utf-8?B?ZnBXVXVhd3JEaHVweXd6VHRRN1hVT3ZnSStBR0lwcVR5T1lwbHlzK1lBRGxm?=
 =?utf-8?B?QU5qOUN4aE5YK0JpbTVTYjhLY3JYL2xTRHluaWZuamJzbWlkL3lvdGxsR2hM?=
 =?utf-8?B?MTh2M3Y4TnBFdUcxbTNvVmVhTUQ0QXJkMDA0TkVZdGoxUmZmZEh4Ty83VXZW?=
 =?utf-8?B?bnU0TGJ6cnFKZzBrQ0J5aEJCdThyN0gwR2h2RStBbWd2aUUvWXZidjdDSFVZ?=
 =?utf-8?B?UjBhRmJzWFlBSHlvZG1qaHdRYVphbEdwUW9JRnVsV1dNdi9yd0Jlc3ZmMjhI?=
 =?utf-8?B?OEh0Rmp5S2V1d0ZWdnM3dVlCL29qejZoQ0w2dVdVTWdMelJVbkVQWE5wS3Ny?=
 =?utf-8?B?T0JDSkozQUtibnpSZHp3Z2I2NXJZZlRKUUdPMmNSUzJNQW9BZWtESHRYMU1E?=
 =?utf-8?B?b1M1azZBL1VmcXFXazk4VE9ISUNmY0UvWStUclVWRytzbk5BRElTSlNiZ3Ey?=
 =?utf-8?B?TE50UzBHSkhKT2lrY05HY1BIejZvcFdicE9tL2o3UXI0WEVJWU1HLzdRMjJQ?=
 =?utf-8?B?UkFpM3dwbk5jblBnakNQSTBGRktPcjI4SVdUQkFmWGN3NlYvcnVvS2lCU1NK?=
 =?utf-8?B?STZ3NEY2eDFXUGlJbzBsK1BIdHdubzlIVVFPZGlia1A1cVF2Tmd3QnRJQVVk?=
 =?utf-8?B?aFZ1YXROOWpSV3kxeTk5bE4yTEJWQnRMajBYY211QUhFdU1va0QyakxqZzRS?=
 =?utf-8?B?SStLUC8zNml0YVVyRlR0Y0J6TjdwaStYVy9PdnVKbGI3QzFiSml5ZDA5cXFY?=
 =?utf-8?B?bUFjMmtNQnJFcTBiVXZXaG4wYmI1VjZad0JKeWo4T0JsRm02SjM2MitiMERt?=
 =?utf-8?B?eWgzL215UFdFM3lPMGZKd1ZmYjNiS0Nnbm9CcjE2c0ZwTFBUaXllZm53RTRw?=
 =?utf-8?B?dzNRK21rOCtYeTYvUy9DM25rUmFhakhpWG1RWFF1NUhkeGZ0dDl4SHNIUU8x?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b285fb-a841-472c-7393-08da80a566f7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 23:08:31.2736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GG9X3rTd2MFT0lnnfGtju9Dke8nVj0R1C49hwObzyxXmgFCxs0bHYQ82GPFJXgNynRHC2zfCmvPULuBvMB0Hh7XejecMbwgOqIo5GC4eRoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4190
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
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even after getting rid of control nodes, we've only bumped max DRM
device number from 64 to 128.
That's not good enough for modern world where we have multi-GPU servers,
SR-IOV virtual functions and virtual devices used for testing.
Let's utilize full minor range for DRM devices.
To avoid regressing the existing userspace, we're still maintaining the
0-127 for primary, 128-255 for render. This numbering scheme is
continued for minors > 256 (256-383 for primary, 384-511 for render, and
so on).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index d81783f43452..0dab1ef8a98d 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -113,7 +113,7 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
 	unsigned long flags;
-	int r;
+	int r, start, end;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
 	if (!minor)
@@ -122,15 +122,19 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	minor->type = type;
 	minor->dev = dev;
 
-	idr_preload(GFP_KERNEL);
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	r = idr_alloc(&drm_minors_idr,
-		      NULL,
-		      128 * type,
-		      128 * (type + 1),
-		      GFP_NOWAIT);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
-	idr_preload_end();
+	start = 128 * type;
+	end = 128 * (type + 1);
+
+	do {
+		idr_preload(GFP_KERNEL);
+		spin_lock_irqsave(&drm_minor_lock, flags);
+		r = idr_alloc(&drm_minors_idr, NULL, start, end, GFP_NOWAIT);
+		spin_unlock_irqrestore(&drm_minor_lock, flags);
+		idr_preload_end();
+
+		start += 256;
+		end += 256;
+	} while ((r == -ENOSPC) && end <= (1 << MINORBITS));
 
 	if (r < 0)
 		return r;
-- 
2.37.2

