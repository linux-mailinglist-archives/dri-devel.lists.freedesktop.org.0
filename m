Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA32582DE41
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 18:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F88310E33B;
	Mon, 15 Jan 2024 17:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D1110E056;
 Mon, 15 Jan 2024 17:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705338849; x=1736874849;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=t8NVzezXEbmg7wIMg8R5+mnfAmMY1RnFLPhvkEjjk6Y=;
 b=F4NoVj4jWuqF/SSlLOhY7hn+H3Bn+TH1F8SL8jTZkKrtd/buDyz4+ZPz
 +bc3ehWy5KJSUo39h3UsFBzAaIA6B+XXgf/CE2XWhwAfFMJfnUPXHmlPE
 hvuipwEl50mo3n9LRWnr/fpK9MFC2DRE47YO3tg+0MH22vOTrpxumdRcJ
 jMnbvUwn1vXNaFknB8X0dRdkwTnL9NshhX+nEKtTkKN7SfEKzfnkbrLni
 9pRvVyr2UDjxu3nGrCLE/qjDINDAhmGCAIKSjFvDNzGaouKzO4GeWc7ES
 8Hheui5mC6s52dG26sxiEpmu/sEeRkolYUsU6kRLjkbDr27qDOEWq/7Xf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="13015282"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="13015282"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 09:14:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="787149022"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="787149022"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2024 09:14:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 09:14:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Jan 2024 09:14:06 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Jan 2024 09:14:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWfyOM6dfDRG+FcHWnVppsGyoBna8g36Aq43ekznx0FiC6KLZRsGm+iZUyRs5f/kNXsWeOwu2lfvAgouLhVnTpPt8YE52jSMd7pCeu+jHKODrwQIQEKV6zKvNNEyJHFZSSwO5QPW3jj5DbkPGgq6Klz2zLReKNjQFXui/i3d23enDsHXD+PNrMXqGn1kTMiOfISirDAB1ft/b7bDKXXRjeZanvEzLqIXOqJlawbEiqTl1yFyxSETiwDI7U8Vn90Ob4PhxXI9iumD/eqnwxzAaYuagC/+izLMB0NnIdSMRH9RNUq8D2rl93p5ivXF3kcfyQKJIEr8lOHdx1dPF89EYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBRE+53xFDYdRZrjT4BDUujQowcPyN62VTee5YhXS4Y=;
 b=WF9Me6jejWTG9v0l6L8Shh/wPixIooabrUyWOJrr5y9oAMiKwJTt0LdWyWQwpg3jHskakgLOnlRbHmHDAGYBx7JPkTB6kBjKqr9T6npTtzYWXCbQ2VtB5giRaf5SUrUBvwvshAZ2W1SRw7Fw26wptKNojuJfXA1w8HZaqAHqERMQm1URAS2nJRrz1T4d9ENPW1g75uiqT+P223GUIU+DmsdBQazClMrf5ucKvtxXLqzlOpwMhUEGv2FIMs6/4njwrRFRZnGJZnTeghZee9B870F5RM623GOOzQKMlRS9FNsGZ6YfVUaWFH9RG9+t7cNSdZth9X3rZpnp0F4m4jJkUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.18; Mon, 15 Jan 2024 17:14:04 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 17:14:04 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/5] drm/managed: Add drmm_release_action
Date: Mon, 15 Jan 2024 18:13:46 +0100
Message-ID: <20240115171351.504264-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR02CA0066.eurprd02.prod.outlook.com
 (2603:10a6:802:14::37) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cfe30f6-ab05-4714-6059-08dc15ed6041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cHkR4ik2JaTgrkdVP0wprVN5uBdBL+YUULGGqopcRsKMthgOrhoNNvBwfGrxSbWX3nZicXZYHbZLr9aD0/c78u4ktKsW0XVVrqRsGZin0ihVNRgt4XVBib+MPN1as5Qal3cWaufXVBVl9TmXYQoXSBjbPr98F9HB8XjeIoz1HfOvUxUU7Q40262ZYBoiOLmbmAYTicSlq/I0bfnVND8/iA0aOqT7W4f80PhZducRVH0sr/8r+8uLaZ61N6T4ee4IbvqPjoQ6NrUPnnh7uB5jU4VcDLS471FSWGNm7JehfhVoYDaVRlgN9y82MElNaJvOgymzghetwVXE9zx4yuBpHwq/Ag8UqG759KknkH4fAeX33Yod7JWZC1S6iBvC4owy3z0afKsRwvPdXKXky/5KD8HSv+L00rCjOWzYHKgwCMYL6ydMCZWQjPGc+V/bIKjZBWmOwvN22hFamMYEXbsHYtSlH0MX6aLLG5GDIMU85YE/8VZePX0EPrJmjCNjxq+wMFkHHpd8kvo8mZgyttj5Qkgm0LwduLs0b/D594hL0tg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(366004)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66946007)(6506007)(1076003)(6666004)(2616005)(478600001)(82960400001)(66476007)(86362001)(316002)(6486002)(83380400001)(66556008)(26005)(54906003)(5660300002)(8676002)(36756003)(6512007)(41300700001)(7416002)(38100700002)(4326008)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVRTbmk3UUs0Q0JWcFlzVTdOVUxYa1E4eWFJNDJmRUxmS1VodWJ2a2ZjS2JI?=
 =?utf-8?B?RGU0MXVPUnpmVzMreVkvU2w2SEdOSjE1NVlLNjdVSGRwbFA5L2s0Sm5RODdl?=
 =?utf-8?B?RkQ3YmlLR29idmJ3UHozUTBiR0ZhL1JBbW5EU05kOU05TE8yajg0Mzc2VnRv?=
 =?utf-8?B?MWE0MWtXbHVxTklSU3RyYmRPMUkxS3pDZ2ZmNm1COW1xdkFxQVV4amk1UEJ3?=
 =?utf-8?B?azZ5ak52RW5DZFFkNUhaQkYrYkZyL25kalVuMkxPR2FyQmk3NTdSdDA0ZkdZ?=
 =?utf-8?B?QklKNGdQVW0ySVlMSDBNdnZ4bTMzVkNmdmNXM2hpeGlTbU5WcnZJSllXV012?=
 =?utf-8?B?TVNZdUtDaFVIanJqajRXTUpVbnJSWEhwTk5xOFZuSWNEUXVBbVdMTVdpZUNy?=
 =?utf-8?B?eTkwWTRzZ2ZhZXFYdnloUnZTMHZKMDZFYUlSTmFqUlZwUldMTjhGMTBHbjR5?=
 =?utf-8?B?aXVlZTNDNGJ0Y0s4UzQ3OTZNQTJtd1FoeStETEwzZUQzcm0wMHlmRnh4TktG?=
 =?utf-8?B?Tms0YjFSKzZ0MG1KdGFKOGR6TEN3TGhPTEgraTJyQ1k4ZldCSE1ieFNlZEdJ?=
 =?utf-8?B?TDZESE1WdVc1c0lVbHNUbCt3T3pzVkx1QTdPdVgwWGVoZk13clp6VnhyY003?=
 =?utf-8?B?bUpsemZuSnV5QWhIRHNSU1I1UXJuWFB0dkpsMVhPR1k2Smc2dmg3WDF2d1M4?=
 =?utf-8?B?NzlDODVwVUwwMjZwQjZGVVY2djQreDFwc0RWOTZwSy9MVjZWZVlZZWd2UjZ5?=
 =?utf-8?B?YWR2a3ErUjJrUVlVekd1b0lMendHWXQ5MHBhT2lYWWQ4ckRMRTNkOTZ2MzJR?=
 =?utf-8?B?OGlnSmtENUhjNTNmYkRJMWkvZVZoTVdXbFJySDBQYmFoU05XOEM5dmxRZHNp?=
 =?utf-8?B?Y1ExWHRIVGd6WUo1L1UzbE9NR3oyeFV6emhvTi9YRURRQnhsc3lsaEJ2ZmNQ?=
 =?utf-8?B?QStRaXNaNjNRYXNLcmhiZGlMcDhDUjI3blRMbFM5RTc1c1ZHaStNbWxjeGJq?=
 =?utf-8?B?Z2gwcUQ1QUJPMUJJOE1xRzlPL2hWaHRCdEFhNUxLU2VZQVBkMzNxdDBZVkdV?=
 =?utf-8?B?bkVaV1dHcXJwZFdHdVppMngwM3VWSkZ4Mm1FaWIvczVnaUl1MkZmZUtyZWtt?=
 =?utf-8?B?Wi9qUVIvRUtVQnN3RXdaZGlmYjdFcmF0Uk11YkJzWlNxTlhLWFNhaS9DUm5S?=
 =?utf-8?B?NW1peTlocWtXVUtORVdubEdTa0Exa3RMTU1sNytuRUVDczZpdGx5aWh3Z1l1?=
 =?utf-8?B?QllIWWNpalU4aVFPdlM0SlFBbzNwa1F0YUpSUVdHNXpuUFNJNWZ2QnA4L0dG?=
 =?utf-8?B?N3FkOTJ0dzZmOG1PQXYzY1dmL1BwcklxZDNtY3lzRld1blRKM014WUNYNzRp?=
 =?utf-8?B?d3ZKcGlDZ2NYQ0xONTJCaFJOdzJnVUwxYkhWZWM1U0VpbVYwNjlqOHNkbTlX?=
 =?utf-8?B?clV5MkVsU1VrNU5DRUJWYVpsZjIxTTRuYnVsK3MreTdUbURjamYyMU9TemRJ?=
 =?utf-8?B?SldnbkE1U3MvajFRVlM4RS9ENkJlMDFvY1NnNytUc1dKVHJnempIbjVkQ0FT?=
 =?utf-8?B?cFN0ZlRQTHcwazZaMHpUSm5KNVI2U1B2QVArbGNYemQ4QnJOUjZxWDVvaDdY?=
 =?utf-8?B?L1I2YkYrMWZsRHhzWEJBVEJ2T21pcEwvVlE2NWYybzI1d2p1a1JtNGhTUVAr?=
 =?utf-8?B?bmdhU2QxNEtSQjYzZEx5UURjM040M2l6S0hJa1VaSTl1bkFxdFpoVTFFUmpL?=
 =?utf-8?B?TGlYanNURExiOE9XeHcvYjd1dWVSN3FhZmFiY2lrRVE5U3grRHVRSFpvYVhi?=
 =?utf-8?B?MVlrRGhpenJjU2VNTGFDaFNiZkR2L1BOL25OdGJvMVpFZ3EydG9ZVTYrZmVF?=
 =?utf-8?B?ajUrYjRpK0Jub003bXBsV3ZpMnlKQmwydVJlNDVlZXA4bVVTRHUrRWZQTUp6?=
 =?utf-8?B?ZEN5dHpGcURCWmpndzZYMXRWYll6R0lZRFJndTRiTjMxVDBnN0dGYW1ndHla?=
 =?utf-8?B?YytSWi91UUdseTM2NHI3cEQ0OTRiTE1oWWpzR0U0WUhuY3E4K2xSQ3J0YmRU?=
 =?utf-8?B?RDB3bkptNGRsK2czdXpNQ2d5VkM2ajU3QjRaSGN3dHRBN3Qra3F6ZTZhUUlx?=
 =?utf-8?B?RnhvRkdiLzRIWEJWMW13RUR1Ym9jWUhWNTRzZEt3eUdsaldQQXBZblgvZ043?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cfe30f6-ab05-4714-6059-08dc15ed6041
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 17:14:04.7254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZx0nvJ0dnSp1aQz+oElZIUpOv2em2UI4k4r/d9VvUoxQ8L4Gc7ygr3nvUMrhH2uJu6Zt+PdfGO0Podg0KRuMWUcGxm64VdJTphtx5atstk=
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

Upcoming Intel Xe driver will need to have a more fine-grained control
over DRM managed actions - namely, the ability to release a given
action, triggering it manually at a different point in time than the
final drm_dev_put().
This series adds a drmm_release_action function (which is similar to
devres devm_release_action) and a simple test that uses it.

v1 -> v2:
- Split the test changes (Maxime)
- Simplify priv lifetime management (Maxime)

v2 -> v3:
- Order tests alphabetically (Maxime)
- Add comments explaining the intention behind the tests and the reason
  why DRM device can't be embedded inside test priv (Maxime)
- Bring back priv lifetime management from v1 to avoid use-after-free

v3 -> v4:
- Split test changes into smaller patches (Maxime)
- Remove the waitqueue usage in tests
- Rename the test suite to match other DRM tests

v4 -> v5:
- Simplify the release test (Maxime)
- Rename suite to "drm_managed" (Maxime)
- Drop redundant messages from asserts (Maxime)

Michał Winiarski (5):
  drm/managed: Add drmm_release_action
  drm/tests: managed: Rename the suite name to match other DRM tests
  drm/tests: managed: Add comments about test intent
  drm/tests: managed: Extract device initialization into test init
  drm/tests: managed: Add a simple test for drmm_managed_release

 drivers/gpu/drm/drm_managed.c            | 39 ++++++++++++
 drivers/gpu/drm/tests/drm_managed_test.c | 77 +++++++++++++++++++-----
 include/drm/drm_managed.h                |  4 ++
 3 files changed, 104 insertions(+), 16 deletions(-)

-- 
2.43.0

