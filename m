Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 244D782DE44
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 18:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D4410E35C;
	Mon, 15 Jan 2024 17:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B9B10E056;
 Mon, 15 Jan 2024 17:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705338856; x=1736874856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=oRt1PE8Mp9dItS8/V5Q0vCBHnyNNC+QhmnH/h42znpI=;
 b=EeFdoObXJcaORhiFPCY7qtjC9+3Z+cvvYFYRfS3YZPW13frWCLwGsQxu
 vUtPAaPz1RavlgphoKWW5qctZW2Kp0jJew8TVaDfqorExX5G/ylZf8wCn
 7VraZLKpy6YOK9avl0rFNHGfW5VzX+G/kXOm6++gguTcGq7dJhfMcrOYJ
 0H0SW4mvUWK0KIHxZ9arOYKsegDCQPth1H717g4qiImQqsC1HcJsnvdkb
 Us46tJb6XGYyBa+gtPMSUEQ/3VcpNKkA0LRnHpWToFLfS+XPuL2NV7StM
 Rq6G8HjknYXrldCQCQP4LYoqGc+cLS6CTDIis1O3Oy5d3LBi9iTVqxsz3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="466039515"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="466039515"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 09:14:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="783856854"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="783856854"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2024 09:14:15 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 09:14:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 09:14:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Jan 2024 09:14:14 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Jan 2024 09:14:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqFoP2Le8kixzr+mTVdKiqBgKlV3y2qVR1T49h0evewggbIJIjFWkyq8RZ9Bygtp8yPDWUTRvInPA0IwMyK+G1JU0KxUoovsFmPJ0GJ0cr/S627ihNkR1f9ZOwOmqvz0ARyCyRBs1GEUR1SznhHllCq2ee02LeRYlECbi0/eN/dr21vYtWe+pz10QK4wdzNOLpzj1NCPG1ZlUmKDRey2HWlWNTgWjMyVMWLNbuiad/4MknNDP+ZUqXkRaGqOFJI1fShe/MjzIYWRnggOVy5EinFKYQ68t46BZwxO8VGhwyFJ/hR2Aazp9WwpYfU1ocRiTuXQ16Gbr9W1jatOmOQ0DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keoyW9JrFE6jvN+v9KL3q2vFjWhsPTlfgMRVkNThUzk=;
 b=cEObNcxI5V21gKlxczafSYwAiCluBZnygptXRvH/4w5NC+y5yxRAyv72HFkAl0PQM3f7rt7Pxto4NIpe10szWs15QixTE4AI+QyLon1hRhmiNlW389t/lGPy/c8OaIy87OAZ4OuTCE3t5HBCCkX1AQNblV/wwhs28BG+fXyUXrYuMlrT2+yt9qu6UOLdJ2QM3wsEGMye68298K3IldSetj+QkAt9IbIMt5wve5i6c46/ticicD8kDecYQ83CidFrUyTg3FFuGqFoRFM4NLAm48lEjWhBCHHBMlXVT0tJXKGsPH4/3vgpbt3dtiPKkVABl/By0eFT9VudAmglQ6soSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.18; Mon, 15 Jan 2024 17:14:11 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 17:14:11 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 2/5] drm/tests: managed: Rename the suite name to match
 other DRM tests
Date: Mon, 15 Jan 2024 18:13:48 +0100
Message-ID: <20240115171351.504264-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115171351.504264-1-michal.winiarski@intel.com>
References: <20240115171351.504264-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3d3a27-e6c2-46ff-a17c-08dc15ed6464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zp6L5Bd3tOUf+VQNmVr/W9pLigNlLddLsjbJYW1txl4gbBeMJd9NQUadR9lmvfh6tV1EAIekTVRDVFmTclI+7sJUQ1PvoHYF/AobAEBqwMv2Fg+FetOW8rnYS4xAxYoHVDAGLhefVTLVOZYfK8SYqeJwS7MdEPpl2MzQ2SdeTqLUrXlBd40oX2EUE85p4IAnrf9Kyax6kBeVX1vY0yvchNua6BYZZ9fCKvfye0nM0r/wEBNlcQG7Hn1rGVQac9fVbv5ffmVcO2J8TaACtCqrNR7WY4iE/wRfFgStEpIqnbkcie5DZ+STqt21FKMg91ytKkufE20OFAIvIogj26sEOH9YAFUj10xAWB08JaSP9ONptOWNverr8PJV8ySAZixn9NOa0tKtJgE5AvEFMSuCa6w277Q9B/1CUQx/grWMBtQ7d5BM1U/3kGxPRXoWLev4k+DsxF9O9ssnbyJxW+nfmlDPnWkXfRGXkn+Yk8bhC+kOeGeoN8Slcm0ao4GBf2p86vSoA4RvuZsAlr14K+CnqqvWImWh2T5MWE5zMwep/SVLxKLyyeqO7opkcANw2GGI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(366004)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66946007)(6506007)(1076003)(6666004)(2616005)(478600001)(82960400001)(66476007)(86362001)(316002)(6486002)(83380400001)(66556008)(26005)(54906003)(5660300002)(8676002)(36756003)(6512007)(41300700001)(7416002)(4744005)(38100700002)(4326008)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUhBVmFWaGMzS2ZibjlkUXhkRmxKbFVBa1RqbkpIWVlMRm51Ym4yQy9GWmNH?=
 =?utf-8?B?NDRQVnJIZ0lQMHVhNVdVVGhBRFRqc3AxR3dEaFNFdHFuY2h3Z1RrN3I0TllC?=
 =?utf-8?B?NTB3VWliZ1h6L2lUVjRTWnJYaytqdko0VTBjZ3VhRnRFcXU2RkQ3cXVpeFJN?=
 =?utf-8?B?N21TUWhWc09SRTVwaS9BeU96VHM1Nmc1YUJ2a21WcDZON0ZLOWZyeTVydTFV?=
 =?utf-8?B?V0d4aWMrMlQzMXZ4UDBZVFJuU3ZzUytLellQalg3RXYwU0RZMzkyekt6Qlll?=
 =?utf-8?B?cWVLNmRJVjRhcnZQd1ZGL0tHVTVMTWFnZit6QmZpRytKL3cxeVcwbzdlRU5C?=
 =?utf-8?B?SXFwYmtjS1pndDdtZHFCaGVCRi83NGJmNWh6Nmh0WjNCNzg4K3dYaTNwWkVs?=
 =?utf-8?B?Qy9xc1BuMWJrYkxzUE1LaWVqNHUzcTdEajU5VE4zWDhrNHVtVTMwZjNTdjJC?=
 =?utf-8?B?UUpOQmxINnFmNFZaNHVmUzl1U2NuTzhpZG9idk1iQkhLN0FKenRYV1BtWnVv?=
 =?utf-8?B?OXNmajFYWkVqUDMvNW1zeW1CY0tQUEF5d1lIUS9XOUpuclRsS1pKNVFwOSs1?=
 =?utf-8?B?STdZWHQvWFZpSXhJZ2xxbGM2U1QzWkRidjF4d2N3RGRZRHVoaHFTZ0Z1VjFP?=
 =?utf-8?B?eHhjS0ZUQjhFV3FDTC9rb1Q2clZEVlJPUXJUVTN5VVR5TkRoa29JdmNocUJJ?=
 =?utf-8?B?M2pxRkZyUXhPNERidFVyOUx3SC9xeHVYTFFnMUkrVWprUU85RlNHd0N3akhp?=
 =?utf-8?B?bkt3OEtKeFZoTUNhbzFEZ3VOb2kyZEI5MGxVbUNIZjlVRlFJRXVZWWxzYVJv?=
 =?utf-8?B?YlZGNmN1YjJXSEwrWUlFVk5ZMFFTaEYyeTQxR0ZQS1JtSzVMS0tVajhCeTky?=
 =?utf-8?B?b0c2VS94ZllLaE5ZMHdiOTFpZUUvZSs2V1ppcG5IaE16UVFpZEdyU0M1WkZW?=
 =?utf-8?B?K0h2c3hEOEljeGRpVFlpSXdzeXhxQTBTMDkrcWpNRVJ6aEc4TUlkSStNVE41?=
 =?utf-8?B?Zy80ckFhcEFIamNDdW45LzZHTHdHcEdzT0lIOS94b1dwUWpobCtUamdMd3dL?=
 =?utf-8?B?bkZWY3hrRzcxSHNGQVJva250ZTcrSFZIbDZ3ejJSbDVIbENPUUtUN3E2TFBI?=
 =?utf-8?B?WjVIMnEvK3RiZFpuQjVGQUVZcUJVSDJqaFllelpsUXJGdTNhcjdGb0ZwQXc0?=
 =?utf-8?B?RnRKSjdYN3lBUHpmN1BKdWk3c05lbmQ1Q3FiL2lIZXdVOEwxbjBhbDFSZmRt?=
 =?utf-8?B?UUQ3SGdSaUJIazZld3VKL1lwOUIrS2JRZ3RDS3ltL09CV0dIUTZkMEMvZTI2?=
 =?utf-8?B?Sk5ZR2c4bXppNnR2eFRHV2poanFWZkRoTENwUnhrbTcvUUZQS2EveUQ5Yk9q?=
 =?utf-8?B?VUo4emU5RHY4RzVuNGlNWWZzUXFKYUFEYUVpR3FwYnpJSjhQUHJYRnU0UG4v?=
 =?utf-8?B?bnNMbHFGRFo3US9Ucm1CS1VCVXhURUVLSXozU0hVbFZlZVdvQm1ZWk9mWW5E?=
 =?utf-8?B?MnNTbmNjL250MXlFTnNDbUhCR2Y2SHo5QWo0OVpST2hWSHFwam9nMk9NcllX?=
 =?utf-8?B?SWpveUxkdHk0VEhoMDJqaDA5WGFxcVd6Wi9tQ2g2bDZFa1MwbDEyYnVFRE9T?=
 =?utf-8?B?Y0dza09xeXZpNloxa0dTeUhadlFzQVN0V1I1bDRBdXU5OFpQQnVnU3FWdm9r?=
 =?utf-8?B?NlJHcnJUUVE4MTRYOWkwSUJHQ1Bnb3dEOG5TN0g4SVEyc3BmUWUyNmxZOThO?=
 =?utf-8?B?WXU2WElud1FWRGpWYWhYU3liN2szSFJlN1lIZ2hwL1p3aXRZcGZPL285QnBM?=
 =?utf-8?B?dHgzMW83cm5QOEIrellYY2kydjdTdWROc2E3NXZSKy9YcE44aGtnMHBpN3Rx?=
 =?utf-8?B?Z0preDdYcW95WG1mbVVXNU5BTk1QcGc1TnR5bGsxeDFHem1LOHUyOGpFZWFK?=
 =?utf-8?B?cW53LzdkOUJGQ2VrSFhBb3NhMVRpakJrendSaGtMbC9JUmZvdW9vZSs0K1Rn?=
 =?utf-8?B?b2lIdm95U0VoeUEzejM5Y1h1QkQrTjYzRSs2SmdFLzlEWFhMalNiSWFhaE05?=
 =?utf-8?B?ck5tRWF4eEJRNnZHWk1uZDgrMHRLSjh2Zm5SSWdJTDNvL0l2UVJWbGlOWUZC?=
 =?utf-8?B?eU52TUpYM2p3cGxzMU55SysrN2xQMHhNYXBwWXdYUWs3Ris2VXFXdzdiUS9p?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3d3a27-e6c2-46ff-a17c-08dc15ed6464
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 17:14:11.6526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYbyH+pmwZhIZ81/qde4Kq+3vvh5Bimfb93UvLZw/2INDGzWPGMk/+MVbyvXb/kPmXroz0voPU6+CeQdnTNNecpEJ/f5HXCmDiZU/VTME+g=
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

DRM tests use "_" rather than "-" as word separator. Rename the test
suite to match other tests.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_managed_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
index 1652dca11d30c..f85dada4de0a9 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -61,7 +61,7 @@ static struct kunit_case drm_managed_tests[] = {
 };
 
 static struct kunit_suite drm_managed_test_suite = {
-	.name = "drm-test-managed",
+	.name = "drm_managed",
 	.test_cases = drm_managed_tests
 };
 
-- 
2.43.0

