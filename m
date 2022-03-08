Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9C74D12FF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 10:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19A510EC7F;
	Tue,  8 Mar 2022 09:03:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8DB10EC7F;
 Tue,  8 Mar 2022 09:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646730217; x=1678266217;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2J6ivfNCKMAMloYEqlF8ICKg8ziOZd+/bE4/W9184gU=;
 b=B4MPgvfkiG1B/yy8+TO64orpDa3Zb+VcIkbgwz//mThKSkpQiDgpDQb2
 CAOpP2hFkDD2bpa1bFs8kgN2aa4/4D54HeyQSYHB/ZtRJg+1HoxUwCXuZ
 duKlZztCz18fpgEyD5lAXEVF6ozlmbl5Ug8EPDxSRbDG2TINp2ZKzXDXX
 Sa0zQ/ZjeTQc2s0NxzMEDt4J4i1uK3fmAnFktdlzaufor2qNPu7RnOWf8
 R6MxWxWTPzMaaHwlpK05YkTqEaNz9K2FkgaNHBPLmrSzJMuqsPC77OvHe
 9kOlADV4OZPk6fp55s1CWpIkSooT/uHOnuNd7VnACWK2HU3CfVupopGhf Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="252206899"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="252206899"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 01:03:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="513033475"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 08 Mar 2022 01:03:35 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 01:03:34 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 8 Mar 2022 01:03:34 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 8 Mar 2022 01:03:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijbmnaRE9hv0XwokC7hCD5f5H1AglE43OHSoxgbHDjuj8Rgxt3TynrErSmIrq3zpQ5M/DewFosBXU0HqSe1ufu4apMATHK1OsQMHbOgQ+Do+zWPjyZO/NBLDlOVTdhgh2R/0sm4QYIii+bt2Ht7cU6vFJ1bgq7PUe9tUCOLQeQkrCsAP92c+td6WWo2FywAPEpJdpUz3bBoV3EXxXS6WDY5oRGxtwICCmxBxL27KdDzn8D5vDkI4IFyjsRX20F/QlBjMkj+zjyKmtg5riqi3QY9lxXuCp7FboBkFdV7yNKH9o8fdv5XikV/Dv+ulfetSZxTd8kToJaUOUGr51luOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a827WOxq1LCTINCtmImKpSEAmRvCOoLNmg2zWTQPIM8=;
 b=lLx5JUk3G0iUn6saUQvHoitjew6Wxs0+frtigkz4Xb232jtzsdIUg+u+9HehttQBPc2lLF8i5UTLVD2hjbVPpNeszmzLUOKRANyaWTN+c4BTWTZfHRcYtKDLv8wms9dH3oiuPF/quUO7p0Q8PVSBtjiHIkHYqd9wurNaQtr6G3U1oXSa+escNYnoZK5zEx1zCFVSADRfDGQIu7+LpzqFT6yAwU5RL4wTg6REbao1ZletoRuxY74HXgTTOLpC/gPeW+NtrKPuz2/KSZC60qA2llxVx/bXPkAcfyCpEIu1e96Et4HX4Eysrr2dSXMLiywpAqYOlarl3z9W/aGPdCatuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by DM5PR11MB1385.namprd11.prod.outlook.com (2603:10b6:3:9::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Tue, 8 Mar 2022 09:03:30 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::8d95:891:b183:49d4]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::8d95:891:b183:49d4%5]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 09:03:30 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: RE: [PATCH v3 4/4] drm/i915: Improve long running OCL w/a for GuC
 submission
Thread-Topic: [PATCH v3 4/4] drm/i915: Improve long running OCL w/a for GuC
 submission
Thread-Index: AQHYL09Ok4sJUdFD1kStLBfh865Ry6y1OBdA
Date: Tue, 8 Mar 2022 09:03:30 +0000
Message-ID: <BN9PR11MB5275076DEB90701ED8C9A733E7099@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <20220303223737.708659-1-John.C.Harrison@Intel.com>
 <20220303223737.708659-5-John.C.Harrison@Intel.com>
In-Reply-To: <20220303223737.708659-5-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff978d27-713a-41a1-4c61-08da00e2842e
x-ms-traffictypediagnostic: DM5PR11MB1385:EE_
x-microsoft-antispam-prvs: <DM5PR11MB1385B90D4163CCFBCAE20C2EE7099@DM5PR11MB1385.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uYIN/sYBr4mAUttnub3GEpGmGGd+yG9YTZafDg1PM+AAxaK9SzMgh93g/K9z9MpZoK1lOfmu8pbvY/+yp+8e/puSHHd9J3A4UUnsPxObkaSrl0mAmwvgjQty1wccqfEVAs/ReyqulJY8Qxnn9SYhw3LPP8UeRDXhvKV6BpcbkWxqq7HXaMFRCuMzm7r5CqSidTS2x1WkSwtkxF8LG0v3vBGA/20sWoZBsYNtVNiykceyY7WrwXb+nfQWiIGSEH8tK8LmwGg9RbcqhUNJb3HYUMOP//PB1v1zDeX6Epy5f1U/hT/XgyuSJBiVRcw2KL8HdTLcCvA+W1Pa9jafrpc76WNf2DxG02UGA5PPxuGgPL6a4BJ3n3ONO34A6Fzj4x9HZTmVqB2nVQVSdUMLb6JOK0Uv7ILcKGrNV8z9Q/WomL3WfoZSwYp4EhAJIV0csP73rnAS2Bs+IykexrWhKyop/R+RYa5MGX7p3aWu9ihKtCE6YLqsmCGHq/Pu71qbI/H/5Chz7VdK9h+IWr4fuytEBRWjZ7lwzHvsSPID3oVHAn6UMQHHbJvlJJSNjqPwmOc2ObJOghMlNexj5cc0qrtcWGHbMqicO0VkL+uvlmRsnEgytcW/0GXcRMgU4GEeVT1E51VizG/eB7I8tto8BoRswKFau8fL+PKEpbFWFozuIS0PKdJBN3F2o6ReF/OaM0ZPa+DODUXDVBA7ZlpkAce9tA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66446008)(7696005)(6506007)(33656002)(53546011)(86362001)(52536014)(8936002)(66556008)(5660300002)(508600001)(9686003)(107886003)(2906002)(450100002)(26005)(186003)(4326008)(76116006)(64756008)(66476007)(8676002)(66946007)(38100700002)(110136005)(38070700005)(55016003)(122000001)(82960400001)(71200400001)(316002)(54906003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aCCvaXCAUScmUhve++VyHpBjXCFnId3EEJrrf0EJNa6Rblf3aX/V348UO8No?=
 =?us-ascii?Q?/DziW4scQsSpfEkPbVGSKvKCgxU3kx8DukHXeVc6EN3ryH3KbUU6eMTDJ+GU?=
 =?us-ascii?Q?jatZYUTG45shpdr+i9yL6ECc6B3LvUv2/OxTAZRmTQqUtzbFHok+CarYuDXR?=
 =?us-ascii?Q?RAFh/Oyis8Jq7hDAYDdgdDGpMmLCKTZPZmq+EPzPxKoa8kwvAArUVCl9gyGY?=
 =?us-ascii?Q?Nzz9LMtRWNYDwjRPz/25e9rjg0jscOhjEP0YA6L1KTRpqDZFXex03swNkAIB?=
 =?us-ascii?Q?Gnnmnt2LvI/x80NQPdBcjzzK1ySLitb0yXoI6HU5m38r0erEqkrgSFy5ZMGB?=
 =?us-ascii?Q?v7Kj0mYkMsv4iw347H6vHRgzlPRUl7mo8aVZmFFO8hqLYe0U3lClvs43FvXT?=
 =?us-ascii?Q?NKFlcehhfesB2ULUK5O7JHVPp2vgHnE3ixMuNCtwpvEMv06a400X4UdGd04v?=
 =?us-ascii?Q?Tx65AuwTKJEjPIn3iVSIpo5WuAvHjNbZThMyrPM+Xc5j/Awa45MfLGa5330A?=
 =?us-ascii?Q?IAZkPaR6pcF5q9tT7Ywz3nM1k7Yd985V4TssTq8u3g6iIfokYs3jIXZQFL5c?=
 =?us-ascii?Q?droDEHJb6oultMWU5gLPFMXVE4utWbpLwd/gVB6vZL/BsS694MnSCxDqqCJH?=
 =?us-ascii?Q?Vb4+u8YMIqSIlyQT5KQzL/p/E/7tto1UWpWzG5qrBLdPqK0sERlyKNYqLigr?=
 =?us-ascii?Q?FKU3eVsjHYTsmSFmaYKHJMQoHHPA0MM5xF9vl2fBjYovSgFUdxyyC1LaUX6E?=
 =?us-ascii?Q?WAF/j34J3iVmFwi9uW+1xbP91r9AFXudjXf4D1BxrCr1tTyHBsNqHPnh5BzQ?=
 =?us-ascii?Q?JDjeslBYEe73c0++eG+LG4q5dYB3AbV3e455ST4AyxQ1cQbkNVqYCry5EXVx?=
 =?us-ascii?Q?bvy8/tJO/DWXZlOey+v74yM3KyIik9JYGU3uyKibAggI/ehmqEyKa2mI2mx1?=
 =?us-ascii?Q?BeChRV07tkcU5WbJqnVtNUPwdCFyfan8g5WgJkue9P13pN83525Z2C97pBCB?=
 =?us-ascii?Q?fXPyOqyfQy0CCF5Ih/J9Jv02YJeVPK1LaAfra/DcYV2IKvtiXc3ZxCz52r1H?=
 =?us-ascii?Q?Y00vYkP19MgtFxt2cWJvNVta7BnAdEWrzCAFh5qTJFzSQ0DuzYhOiDJTidjC?=
 =?us-ascii?Q?9wXyPvyesErePiQUgl1h68cUtPbKQiOPCjHoDJXJ7z4vUA+PnOrwFEMmYrgS?=
 =?us-ascii?Q?9hN+Jtwnx8nSVMJz+mygnuV4CjuwT1Ha7rg/G+Q4YyNHbGj3M2CDGPOJo5EO?=
 =?us-ascii?Q?Zh8pJlX1/yHIErD8+ssVweYBE5CrjUt1vOn+moJbwfPxViWGtFSJYUBx9ttm?=
 =?us-ascii?Q?kg0p5fwtPR5lqkllVs/bVAc3atwWlCn1ihPykCEK9dEN0tN7luVwcMT7UGLB?=
 =?us-ascii?Q?rrL/nn/H3kEVjybJCzb6CsBZYAkUQudsiHOdf9qf+hBZTGxhsRTn8fXYBiWF?=
 =?us-ascii?Q?SujFdZPA2r9Y97CP6bwKJ5TScu7/ctp93tkX9hWaCRcBm3TtWrSqQGB3CE/Y?=
 =?us-ascii?Q?eUh8OeFp0gEnUDR/jqitlkakEZZz+jVPBRYGYLaVi8aHkDw5jGuyV79DiTEM?=
 =?us-ascii?Q?sDHorkTpEI08ph6yKo36cV5pD/XnYlyW/cFJc1wHEvTTj+oJ5YTM+f4lV5tR?=
 =?us-ascii?Q?gA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff978d27-713a-41a1-4c61-08da00e2842e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 09:03:30.5645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WhK8AI7OYCKOcUPB4HfECOviU9RV47Epjwt9DqL675iFxSHbOTXUeYg0BtJ3b06MNd6EFU2PH63uR6bcqdn/KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1385
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Michal Mrozek <michal.mrozek@intel.com>

-----Original Message-----
From: Harrison, John C <john.c.harrison@intel.com>=20
Sent: Thursday, March 3, 2022 11:38 PM
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org; Harrison, John C <john.c.harrison@inte=
l.com>; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Mrozek, =
Michal <michal.mrozek@intel.com>
Subject: [PATCH v3 4/4] drm/i915: Improve long running OCL w/a for GuC subm=
ission

From: John Harrison <John.C.Harrison@Intel.com>

A workaround was added to the driver to allow OpenCL workloads to run 'fore=
ver' by disabling pre-emption on the RCS engine for Gen12.
It is not totally unbound as the heartbeat will kick in eventually and caus=
e a reset of the hung engine.

However, this does not work well in GuC submission mode. In GuC mode, the p=
re-emption timeout is how GuC detects hung contexts and triggers a per engi=
ne reset. Thus, disabling the timeout means also losing all per engine rese=
t ability. A full GT reset will still occur when the heartbeat finally expi=
res, but that is a much more destructive and undesirable mechanism.

The purpose of the workaround is actually to give OpenCL tasks longer to re=
ach a pre-emption point after a pre-emption request has been issued. This i=
s necessary because Gen12 does not support mid-thread pre-emption and OpenC=
L can have long running threads.

So, rather than disabling the timeout completely, just set it to a 'long' v=
alue.

v2: Review feedback from Tvrtko - must hard code the 'long' value instead o=
f determining it algorithmically. So make it an extra CONFIG definition. Al=
so, remove the execlist centric comment from the existing pre-emption timeo=
ut CONFIG option given that it applies to more than just execlists.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> (v1)
Acked-by: Michal Mrozek <michal.mrozek@intel.com>
---
 drivers/gpu/drm/i915/Kconfig.profile      | 26 +++++++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_engine_cs.c |  9 ++++++--
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kc=
onfig.profile
index 39328567c200..7cc38d25ee5c 100644
--- a/drivers/gpu/drm/i915/Kconfig.profile
+++ b/drivers/gpu/drm/i915/Kconfig.profile
@@ -57,10 +57,28 @@ config DRM_I915_PREEMPT_TIMEOUT
 	default 640 # milliseconds
 	help
 	  How long to wait (in milliseconds) for a preemption event to occur
-	  when submitting a new context via execlists. If the current context
-	  does not hit an arbitration point and yield to HW before the timer
-	  expires, the HW will be reset to allow the more important context
-	  to execute.
+	  when submitting a new context. If the current context does not hit
+	  an arbitration point and yield to HW before the timer expires, the
+	  HW will be reset to allow the more important context to execute.
+
+	  This is adjustable via
+	  /sys/class/drm/card?/engine/*/preempt_timeout_ms
+
+	  May be 0 to disable the timeout.
+
+	  The compiled in default may get overridden at driver probe time on
+	  certain platforms and certain engines which will be reflected in the
+	  sysfs control.
+
+config DRM_I915_PREEMPT_TIMEOUT_COMPUTE
+	int "Preempt timeout for compute engines (ms, jiffy granularity)"
+	default 7500 # milliseconds
+	help
+	  How long to wait (in milliseconds) for a preemption event to occur
+	  when submitting a new context to a compute capable engine. If the
+	  current context does not hit an arbitration point and yield to HW
+	  before the timer expires, the HW will be reset to allow the more
+	  important context to execute.
=20
 	  This is adjustable via
 	  /sys/class/drm/card?/engine/*/preempt_timeout_ms
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i9=
15/gt/intel_engine_cs.c
index 4185c7338581..cc0954ad836a 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -438,9 +438,14 @@ static int intel_engine_setup(struct intel_gt *gt, enu=
m intel_engine_id id,
 	engine->props.timeslice_duration_ms =3D
 		CONFIG_DRM_I915_TIMESLICE_DURATION;
=20
-	/* Override to uninterruptible for OpenCL workloads. */
+	/*
+	 * Mid-thread pre-emption is not available in Gen12. Unfortunately,
+	 * some OpenCL workloads run quite long threads. That means they get
+	 * reset due to not pre-empting in a timely manner. So, bump the
+	 * pre-emption timeout value to be much higher for compute engines.
+	 */
 	if (GRAPHICS_VER(i915) =3D=3D 12 && (engine->flags & I915_ENGINE_HAS_RCS_=
REG_STATE))
-		engine->props.preempt_timeout_ms =3D 0;
+		engine->props.preempt_timeout_ms =3D=20
+CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE;
=20
 	/* Cap properties according to any system limits */  #define CLAMP_PROP(f=
ield) \
--
2.25.1

