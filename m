Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DBF5B514A
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 23:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC4E10E53A;
	Sun, 11 Sep 2022 21:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5F910E531;
 Sun, 11 Sep 2022 21:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662931050; x=1694467050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Eni6pit1misnqHqlJtjektfnPpxUovniHQMbrNEZkCI=;
 b=N9BxYJGCDHslRznkl9fgaPH/9TsMfsmAprW0Hoe/Fp9RhJDptA0VTJPM
 B1E+UhvSkUXI+bsph7tRM4+3HFW50s1WRjbwDW2vPuCDooMQxjfNKrQA6
 psDMT6chGkRJ8PQMsp/xxJKihsOBH+LiqXG6C2hgF3/Oi8NUcScIHTJhI
 YhOPRlR4VBg3HnO33QL90GhtglT87lArNZ3HQKmBgd9tI8aOFWe/yBYlT
 uztqqjarrirUkEPi763dh+GRlFo2SIOBe8EXhYM8NFeOc1/cGnctbZ7Ym
 NE0XlkBDlPNtRIY2lSlR4azuI7S+QBkncfU1cgld5u9EwyqB8yvTwswY9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="277487733"
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="277487733"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2022 14:17:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="791356689"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 11 Sep 2022 14:17:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 11 Sep 2022 14:17:30 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 11 Sep 2022 14:17:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 11 Sep 2022 14:17:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 11 Sep 2022 14:17:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exgtPUFVWCBaRTKnXWxN3Z0W7nCfMxdlxnYATJ/5H/2zNr1p/U0qn04P2GZ61tuo5HbHp3DyV7jczwhaMT83GQoxCEZ0o3yTPvqgxEWnzBc7Ay87jVHIAGqNh+XnojUMNun53xRqwj3y3+aYf/8NsTdvFGMFnXeVd+z624BOVnmS35jjiO3ysrvTv3Y4h0vvYb4TpeLTU3Q2mgKfByh2FfhdE0eMcbDFuuvt8u9lqaTaD5mWITdGlz6NZum/BY9USmlfsJGROLwWrtTuaMyVw4kRTIIGCtU0OiRTZqEfMecM3PXIS2p2d3mhvTfC+tIon1uUZEwocHt2/a2w+so9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BURZsTUp8t4+hgi3/wRuiapcI4tA1G2tUY+fOYCxK7w=;
 b=fvASL/vE52tLMvfVGpi41mAO8Ly4w5BrNAo1lW8FW2FG1U8T7p2uYmkqWQPCWM7LLR8IXcNlvXYizafFD55Kg2ZMQiPRXnY+khwchFJKeA7Su9uD5UtbrF7TD3lTlCvJHN8sSvsDcYgtU9gAmtWmXDC787amtpqyeVbG6E5myQ3vj7LPzp1KyPIFrjUaozgGx9JF6HFRLHhK1BAUu9LFG8clKgSoREoib6qKMvIwnNvsHH4QFx7F3fBdl0GxzQze0lZlwlVVU3KLDaGdvkjEjGxTNxNXXCb3WG9Au9kl6eUnecj3OdEw53tsTUqyuS8h2yfr0B7uVbzyAP8s5CGULg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB6065.namprd11.prod.outlook.com (2603:10b6:8:60::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.20; Sun, 11 Sep 2022 21:17:23 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424%5]) with mapi id 15.20.5612.022; Sun, 11 Sep 2022
 21:17:23 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 3/3] drm: Introduce skip_legacy_minors modparam
Date: Sun, 11 Sep 2022 23:14:43 +0200
Message-ID: <20220911211443.581481-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220911211443.581481-1-michal.winiarski@intel.com>
References: <20220911211443.581481-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a2f41a-644d-4cb3-4a88-08da943b04a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ufxRGNyPea//rp/OTtiLb2TfdPosKT8gGX7yeSKabRKJD9V/ishLR12w1sBck2FqpWefKddwbHEzDYrty7HN4beOUd38gMkae3HlTIlxICnawSJHnfVSB6MpoWsOzqWjTGbjs7xQKRDBLBuKH2k2vqMfHA2EDtelks+myVtn2zalDQNDrRuDwhFIbFVODqvuGDHEBXVA4VLtWZsbOMXfiilGNeOy7wg35jWE4Dr2f9slfsf02J6/9yc5o8DKjuYe/o+6weqy/rP5Z0SyFqPfXq9kKtC6FPtgtogAfKWTrTSWZn8MkxXY2XxJlGh1IUaX2u6dCoygX6546Os5vKPfKyxLej1tLwJ7q1ttC6IIBs/sAhrDCkmx/Zgw0F2B+tlG69Pp4X/7bEr/Lq+DXCD9gx5bO5TILxDorU2boa3hiQNM6O1OKAfj+Zq+2+bsPDJwyG8QRwJhtva+9YX4Pxxc+6yhLoChemwAxl3ywgscZ2GgtNuXcVpuwQfaouAl6yhCIsAAd4wNTgxoItOm6JSdzOOqjQmlUdXsdp0mUwMwUJW/b3iUcw8ibc/+smt4JOYyelOUSDQ5yVYijCaPTUuomfCp2alDsEgKMJdG3UGk3yb7uYRQ6PzOircekW21P34uxXu8Fp4nwz8dH26OXe3fzKfeMyOh+xtSqa60Iep1o6IbvGHLjEzpTRisabhA9qNrprN95qyovBQVmf30cqzYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(396003)(136003)(376002)(39860400002)(186003)(6512007)(26005)(41300700001)(6506007)(83380400001)(6486002)(1076003)(478600001)(2616005)(6666004)(316002)(4326008)(8936002)(8676002)(7416002)(2906002)(82960400001)(5660300002)(38100700002)(86362001)(66556008)(66476007)(54906003)(66946007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFZuakEyZG9NN0VhdlhVdjFQWURrd2UzbWVzdGFRQWJtVDMxK3JwQ3BTVGdI?=
 =?utf-8?B?WDFWanJJVFp2L3VLNFFRRWxlV2ZER3RtY0dTMGdsc0dGS2paR0FjSkZ0YUFC?=
 =?utf-8?B?djV1Mlp1VnV0L1IySC9PYlpKbFN6VHlJZ1ZtUjVVU2VJQW5MeUEwdU5iTEpu?=
 =?utf-8?B?WmRZT0s1aC82MlkydmRoMktrMGN5UkRabEk2cDVqcTFRYmhxZlVhSUp5bzla?=
 =?utf-8?B?OVZqSlprcXk4dnJTZmpBNGFLaTBJK3Z0OEhrODc0aWZFUTU5T3p2bVNKR29J?=
 =?utf-8?B?YmdWcjZFZDlkM1VsNXVRL3ZiQndxUzZIYW1uckJMcXlWd1NhMVM4cUpPSm04?=
 =?utf-8?B?ZEpLdFk4TXdDL1VLVkZQZjRFWXNrTTFQZ0NGS0Izd1pyT1pRcGQ0OUNCS1pi?=
 =?utf-8?B?czd5dm55aXJtMkR2c2c4WG16TmxjeXN1U3llaWV0SEhoYy9hSkFkNXgrOUxG?=
 =?utf-8?B?RmljOWxZclhUS1BlZ0Z0SythSm9wK0I5eUdBYTVPdG1FcFplaGdzOEUrRlNY?=
 =?utf-8?B?VVdFMHAwc25ScGhiTHRqdmg1bjNva29hVjlyUnlDRFd4WC9qTVZzVlIxRmJC?=
 =?utf-8?B?Tlk0aHNTZDR3UC9vbEJGaGpUMWQ0M2FFc2xUbHQ2NmN1bmswTXZ2ZnhsekVi?=
 =?utf-8?B?b1NaNXo3Sk40RUhRVzZQUXJrdjhiS1N1RnRJdUpHWkJaZ1RJV3ZsQ3F0UVhL?=
 =?utf-8?B?OWNlb296cDU2UzM2b0R1Rnd2U0h3QXdiRVh6WlZaTUVCNUVEUk9IVC9kQTlr?=
 =?utf-8?B?b1Y5NHFYMmtGUVc2Rk93anhRZldzWHgvMjdwV2pCODY2YlpLcDRxdzBkVUtr?=
 =?utf-8?B?RGFZUnJ5bDdQYy91eXBKVnNTVjRFaWlWNkVvWXZQSnJ2R0tucm1zTFV3TnNR?=
 =?utf-8?B?SytkeXdFNXg3VkhUZC9kaitaYVZKTWpWcUhoVU1KOTl0ZWhCS0NZSXJzNDQy?=
 =?utf-8?B?SmV4aGNjbXY3a1BqRlU3MFg2N3UwTEdCWVZJQ2tybG95bkUxM1N6bVN0aVpv?=
 =?utf-8?B?WDBFT2FsN0NSOEVHMWtvY2dVeW8wR0NMTklPcmdXWjJMVFF3dXVQclY4OUxu?=
 =?utf-8?B?ZktMZ0orSDZ3Tkt0VTRCckRTNUlpNFgyaGgvYktiM3h1WFN6VExBRlBRNlJl?=
 =?utf-8?B?ZHFQNXNSUUlUNkMxakVZanlrUS9UNkFFNnRXVkJsMWQvbEY5L2F5Nk9WWTc3?=
 =?utf-8?B?QWZndVptWVFicE56UVl1enc3bCtsMmRTb3JoVk90M0N1Tk42b21BWEl2SFBh?=
 =?utf-8?B?cnZ2SHBYM3BxUkV2M0VlYSt0dnNkRW5RZkZGOWpCelJJTVN2N1FCaitUekRn?=
 =?utf-8?B?SjNKYWwrSklDN0dUT1Nsa3pwRFIrdEswbEFORW9KNUJLblFTZ2VTV3Y2dEl0?=
 =?utf-8?B?a2RZdlIxQVVBakNNbWFjeU14ZHZPc25yNjhXSWt0RURIWElkZkh6YlRRZVdk?=
 =?utf-8?B?L2NzZzRieVVDUjNROXg3bUVKRWJKNktvaFNDbS91RmRBeXZjZmRYTFpCMmUy?=
 =?utf-8?B?TjlKQ1lGdXRYKzNINjVIUHRGYy84ZG4razVMRkNkRXZkQ1l5RTNrY3NwcStQ?=
 =?utf-8?B?bldXMy9rTnA5dmE0R0gyaitlY21nWnc3cVl3eS9xL2UzWVM3SDRWSk4yYlRo?=
 =?utf-8?B?SmEyY2hwcGlkUGI3MjlMK2NyRDU1OHFEeDVNYWtBSlpseE1seVZFdkkzb2xI?=
 =?utf-8?B?RGhhZGFpMkozMkhmRStydWZuc2E4Wm0zakE2TnZoVkxtRUpRNWhwSjE0SGsy?=
 =?utf-8?B?eXdITElHMHVtMHIzKzBIQ2I3ZlEya1ZGTHNUVGM1NmxkUVI2aXRDQ0d6Wll6?=
 =?utf-8?B?T01pRFAyOHM5WDhSNGxybXVhTjJXNlEyUS9SNFZFVWRsMmNpd0xoRDhFT1R4?=
 =?utf-8?B?Wi9hTEVYeUJ0NGxlTndEQS91WE0yQmpXWllPOStMMjdxdjZhN09ibGthSGNW?=
 =?utf-8?B?N2hQblRRck84R2R6WC8ydHFDRkluQUZBaTlxOXM2UGs4RGxRdlJRQUNXZmV4?=
 =?utf-8?B?WHJGOFhGVzBBZTl2S0tRODVYdENHYzlYTS9lTFBpWm93RnBxMEhWVTZKYm9i?=
 =?utf-8?B?bkVka1J0UncvUGhsODRVWk5jdTJQbk1lbkVyc2tLeG9mU1dwSlQwbThDWk03?=
 =?utf-8?B?TzY5YjYvTk1oNGpPWHdLWHY0Ty90ZkdueEo0aHBaTlRNVEpTRHdkMVpTeGF5?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a2f41a-644d-4cb3-4a88-08da943b04a9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2022 21:17:22.9468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOXhJsMdUogiZMFfGmOlcPou/Nen73LTq+OSbEpGcWyP7Mgl9a2J/VUa3K6yPt0zGkWU6XcLjtrMt/x9Ral/DRrW76k7VTjbebrB4mXUPYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6065
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
 David Airlie <airlied@linux.ie>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While there is support for >64 DRM devices on kernel side, existing
userspace may still have some hardcoded assumptions and it's possible
that it will require changes to be able to use more than 64 devices.
Add a modparam to simplify testing and development of >64 devices
support on userspace side by allocating minors from the >=192 range
(without the need of having >64 physical devices connected).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 3718bd6bbef6..368408997fed 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -56,6 +56,11 @@ MODULE_LICENSE("GPL and additional rights");
 
 static DEFINE_XARRAY_ALLOC(drm_minors_xa);
 
+static bool skip_legacy_minors;
+module_param_unsafe(skip_legacy_minors, bool, 0400);
+MODULE_PARM_DESC(skip_legacy_minors,
+		 "Don't allocate minors in 0-192 range. This can be used for testing userspace support for >64 drm devices (default: false)");
+
 /*
  * If the drm core fails to init for whatever reason,
  * we should prevent any drivers from registering with it.
@@ -112,7 +117,7 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
-	int r;
+	int r = -EBUSY;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
 	if (!minor)
@@ -127,7 +132,8 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	 * and 128-191 are render nodes.
 	 * After reaching the limit, we're allocating minors dynamically - first-come, first-serve.
 	 */
-	r = xa_alloc(&drm_minors_xa, &minor->index, NULL, DRM_LEGACY_MINOR_LIMIT(type), GFP_KERNEL);
+	if (!skip_legacy_minors)
+		r = xa_alloc(&drm_minors_xa, &minor->index, NULL, DRM_LEGACY_MINOR_LIMIT(type), GFP_KERNEL);
 	if (r == -EBUSY)
 		r = xa_alloc(&drm_minors_xa, &minor->index, NULL, DRM_MINOR_LIMIT, GFP_KERNEL);
 	if (r < 0)
-- 
2.37.3

