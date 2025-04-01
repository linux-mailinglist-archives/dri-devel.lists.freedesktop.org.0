Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F60AA778FA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 12:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651D510E574;
	Tue,  1 Apr 2025 10:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6amGFA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121EE10E559;
 Tue,  1 Apr 2025 10:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743503933; x=1775039933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ImpaCoxS1XHgsLPXqLCTYirOQ6KrL9jqL0IkbxcJaco=;
 b=c6amGFA+EhZpGUH5b8p9eOmjG1QqJExoUTH/faaaLwKprj0thhrsex9H
 4TfIuSR0U32dkbdgJ4xOPOt28VCwpw8OUugf45315FZzw0klZ3mx7yzaz
 Pb7UmgoFhHp7fBsCfO9e9XoyxIVc4+3E6ztsXvu4n3ovHlu/hoseNTy+r
 Gv7aX+zDaLO00X4XqxYoAkRVZ+cTwAEREU8gbgVKRO+B3QwrT6h0GiJxC
 HPYhsnLVDwOHCryLPFOJwNCcS5uQYf3r1zcpa/LwrqK8XfB5mGHtJLfm9
 9GJTYHpM2lAdjGzFBfi8iWEDhcyFsG2cWEJUo5wBvRcN4jeTQ+QMWPJ+A g==;
X-CSE-ConnectionGUID: xhMA+aTkS2mMAFL6XKdybQ==
X-CSE-MsgGUID: 323NX9oYQWyFiFi2bMX57g==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55480509"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="55480509"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 03:38:53 -0700
X-CSE-ConnectionGUID: WG0KvvECQCWahdWS1rzidQ==
X-CSE-MsgGUID: FDiMK0Q7QSOnAo0q4BvGdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131073072"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2025 03:38:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 03:38:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 03:38:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 03:38:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrB4xuiJ9EOUFTEKhIm0eweAPdvqXzEeUPmM/FFTMfy2Rx+kg6+4x+1YTA91xWcYgj4UyvxhQB/wGvImnpeYxk81E7nL36ZQoIQkyJDaS4zosW7Kx5T1aDEjesofuMIgp95IXAMLcVQA2FISrjIImiKA5zS/UKKcmfHsmmUIW6yT/fxFQxalTaD2fJQ+pnr05l92hZioq7xV6i/5MEhYWG25agoz9crxfh8zj2UGMq6I1bZdzMLxqf7EZVDrtz0eKuR37zkOaGsrjqnbGjcnxpjByESviycQVh0T9ss+Nr6ALop9Wdhw1e4n32EcqWCA/OJ7oULDRQNDJKbpIvw/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JStKV0IZo/VfJIA1yShmDBAuVgpirxiih6EAMGwkhg=;
 b=qfVvfxDw7vTe8Zf9DP9yxA2tR7Eu9lxym2T2bVAjR9bwkKw+Sk4yvu9JBhT8WntHB+dSEjl66iKWCjS2CbaCvxwfQd6KF4QJyUfUaGjmpnMZOfOBlenVbay9rGaURJZbrb4JEV1TrMEjpl7m3tX0h0mIyIxzyXmRnIsucAN9C5LVuhJlnB82PyIDHVrVFiIrcOaQXyFmCRXKnEx9NuSWNDAhUmuSzcyp9fKOooMtZeKRGdqLYUyiv9RFZDUEmVxOfGDbQC02Y+CvHFDTqk6+9Uladk0LDy9v7jJOU2MP86jKo/Ihy4dobm6JexrY4nE9oEsXN5j/q5Bq/Kz7A0U2Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DM6PR11MB4674.namprd11.prod.outlook.com (2603:10b6:5:2a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 10:38:48 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 10:38:48 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Lyude Paul <lyude@redhat.com>
Subject: [PATCH 2/2] drm/dp_mst: Use drm_dp_dpcd_write_data() to write GUID
 for non-root MST branch devices
Date: Tue, 1 Apr 2025 13:38:46 +0300
Message-ID: <20250401103846.686408-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20250401103846.686408-1-imre.deak@intel.com>
References: <20250401103846.686408-1-imre.deak@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0067.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::9) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DM6PR11MB4674:EE_
X-MS-Office365-Filtering-Correlation-Id: 68121cdf-64d3-4155-0f93-08dd71096290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bUI39Q+mosC5ZPwZ13BsHFrq088BZRkmzE94jLx6ee6izlnC1JN5cv+CvLpo?=
 =?us-ascii?Q?wGbGSCGF+MjtMqGOss6aMCaDxbd+CWSCwh/lTZwwiFxMPz9f19P8lwXMDDlK?=
 =?us-ascii?Q?Awq5C98dgSz+e9j87ThoxKvrdvTiAkWBdL+VKrd4+WszhHVu7OfRiWqOW54H?=
 =?us-ascii?Q?CxdpwkibMmaEOkAvrhd0HgR+5jEGm+mmbe4x/E3g5rFvsvofeIbWWQQ0IScP?=
 =?us-ascii?Q?TeRN0yqkcpfMKbExRQR9JNwD1kFea8KOCNBZekRVxSFC/Chn9ErQdHQzLlYX?=
 =?us-ascii?Q?teEgO3MHzfi+Kje1586ujXJl4MdbVDvsKnRk4u7v8PPb84Tu1qdhkEFNsnY7?=
 =?us-ascii?Q?YiHgubwW2GD1oXd4YmeN0Gkp3XNG8s3LkEyG/9N5GjjNkpHswg1GawsmkYhw?=
 =?us-ascii?Q?J92LKa9j4AllfT3vYNH4ZcgO+FBxAMGTS0yVPp8HbccnW0sumapR0dpXYgnN?=
 =?us-ascii?Q?dlkzGMM94RnUY0CeEMtkXWSJ3XlGmQR3Ua6g5bZNmDbdcONDw4tVO+HhdJWF?=
 =?us-ascii?Q?CdLkLNmZ6zm3yomQJQKuKwCnQCUnO4OJWlRuUcgzEnwB920MzVzhsDWHpoDk?=
 =?us-ascii?Q?5YhnNVwMsKqHRzl4bjPTEmBm3YjUHniAaVq1lwu4ZCtpfrU3bL1ZFVrFtgBr?=
 =?us-ascii?Q?dlHfLYhJR48tDe6NdVP+FsGhmdCTow7XxsnvCWWQUzKdiBFV3M1JSl+ceZi5?=
 =?us-ascii?Q?H5+bLpssGlVg1SHUxdO/fbFuSdZCK4wZWOX+/c3QjwsmXpdNubDVYVlqzBVk?=
 =?us-ascii?Q?Dd7Yx3PoE9TQj7i78ogpbooAEvVQlKs09ExkpUYvnQ0QrrWiG0a6NOm8uRYI?=
 =?us-ascii?Q?Bb81G9knX23mLWOIvoBIpy1i5uEY2zlbD4BRTnzCuhKJHHw5cl/RxpI/Ha37?=
 =?us-ascii?Q?mWZ8b0HhmjEmcWHYXYtG4GmYht04r7v8TDXjX5Q3lPN1erfH5ZaKqrhrRXmS?=
 =?us-ascii?Q?I6U8Uv4m6MZWF7GWTLH36mveIuGhzc0eHDcSgD32niEjmGiEZBL5lAaOlGp+?=
 =?us-ascii?Q?8xpPd7IFHeY9c1MmgL4Y96Jd+nAYM4xr++puVvPFklq3lPYbgovkQpMrgo7x?=
 =?us-ascii?Q?d4EstZaNL0zV72yCPRH+sooDcO6hGxHTOWbQV2deJ5DzbCEwMzbJQOQ66CHj?=
 =?us-ascii?Q?u777TESrEIXsjMqP9f/l21/QDC1+OqVOPilXcnAxA2Fi/Hyr8vuaYgqGt4oX?=
 =?us-ascii?Q?dO/J2LQbOeH/IqFAqVo+cjBlOFCW0f7fe6Ly+dHO06gUYmeHVkBweuAHTp7O?=
 =?us-ascii?Q?DYlogIUNwi/8vK+Cw30K8Eh8Q2zyV/tJL8Pr1AqMEVXFavg9qikQN7zsLaWZ?=
 =?us-ascii?Q?pwordWBtmbgqvmj2tnoYy5SYdq15lHSwTADUYjNlOprX6ZRimm/BE4Phe1QQ?=
 =?us-ascii?Q?DBB0bYc2xMDH85VOrOQH8Ht8mS6I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XU3MaZ07c3dqEJbwGxW6Z40TpQIYx6/8MyJoM82ZCxSK03qVVnr16bllQAWM?=
 =?us-ascii?Q?5HqLfoyTy2ARYTwazlr/t/4PEUNCEDOC5+RezeCXL4z+/U5mKJ3jq+ipmM36?=
 =?us-ascii?Q?vhtVXP0AFc0FaveZ31UkZPjhQJnZAfVn2dgA6CFcOhGoaGAeg/9yN7E/2Zar?=
 =?us-ascii?Q?dbfb5cxSfq+5ODa2cb60Owvbw2ubPh/dXPbNA7HqmzuCwQ+xJPgU1SKS0fla?=
 =?us-ascii?Q?UbxIpmXe9aMJxFcms/uNk1m6nQRaI3yCu7vrXWtnYXxvtB3+k6wSgqHRAmT0?=
 =?us-ascii?Q?FusRrtYXQK6eOacajKG5Eo5wM0rior/f9yW0u4/5Nf+uJOffx9WI3coES6zY?=
 =?us-ascii?Q?k5+DhWU5OsOloH6xopRB+tfK4K78qt884+9hiiLKXUbF0pPvmoh6as2BbMP8?=
 =?us-ascii?Q?wEA2yEhYkH2BlEUMH3LU1jGg1+vmmwIVHVcKoW9FisijuPTBgEyoxUYUCR25?=
 =?us-ascii?Q?psbB8mzOeXSFxZLys57m8jjAKt92wlBuGuwQNRPffZvpUSRkEeNzAI0EGA61?=
 =?us-ascii?Q?fj998p+FTatvkal9i8c1eqhT2YCMIw5itlftaex7wfYUqOkTJySdZYvwj3TL?=
 =?us-ascii?Q?xLjsgziYcSx0+M2JJdHTvIhn+bWI6sy2GfAEUSkrtstFO9OSXdRK/Z2e/ZoD?=
 =?us-ascii?Q?MR+KaaMNoqDdySX3AzWLwyQObSrfVUC9alCpqcuzSOo85r8/ssFV7VSp6Egn?=
 =?us-ascii?Q?jT98ohEUkJ5vXQeNEScKKXoGkYe+YwnwaXLjH6sWfcAck0IHqCAlA/bI2n7/?=
 =?us-ascii?Q?y8UmJNAJW8KkuyWTwJy7EtBPqAU9b+doF7ozu/SC/Rub6vtkFyp8F3mW8GRC?=
 =?us-ascii?Q?QU34ksIhc+WADpt7xC4eYa8YBwwRVNZ+1EOV4MFvQr2esud667KLqWYNhPeA?=
 =?us-ascii?Q?zoqnQvY6wmiNGlDWhcYgU0Fn6yShvHAao3nyiwqcCpCndkAx/iFCul6/RCyR?=
 =?us-ascii?Q?pG0UkiXd1egiSqmGANfMvSF1yLOUdmZpbh0Hq6DMvvbWbF83Ewa3fZ/+zvik?=
 =?us-ascii?Q?y7QxGMwdmICvmLctIBYI3RrchrBmSYAlzXfxInDv3AL4ewIHG+hMb8mnnxuH?=
 =?us-ascii?Q?/quPQQSKOPa8W08Jc+Sn/CaR5myPcP4JqyPEf5VkSFA/upnsv8L943ElpfGw?=
 =?us-ascii?Q?rtC6kaI88nCaPE6ZSGNFvBejWB3WECAR0/edktLC3CjDJzqWtAU8AuKl+Hun?=
 =?us-ascii?Q?2uk/oYnOA4+R9RVMpLdtkFcxpMknhXHH5ABhMUT9yXXgyGKJem3SSLF5hVAx?=
 =?us-ascii?Q?8TA2Wlb73Lp8UAP4aE94IS5jTpl7kHs98EpZciKs4gmAAaq/qJC2eY6yNffz?=
 =?us-ascii?Q?g/MSwdqe+GnT3Xhgah2tNEQ/w3fDrJitXb0Qbi/I6nRVgvhG7E0nRwSyZOAS?=
 =?us-ascii?Q?Oi51o3JacdxMUsLJDNo/gxfiO2NAWOyQ9mHMk3IYgtz3VRb/J9tYbjT1AyU+?=
 =?us-ascii?Q?mvbeR0XQFaAj7WT2HbBBvtZUN/QyrPmCY3JPwKQDVO9Tg/yTEyb1oZL7ovx5?=
 =?us-ascii?Q?cSeQ25f7DlW7zItmZpkU9c02rUskCSHvUbghT2hHDg6AF6z23JOYBMkppViq?=
 =?us-ascii?Q?kCv5D6GQQoZTG7e74hcZqTxgoPMHjpH7Faj09vQh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68121cdf-64d3-4155-0f93-08dd71096290
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 10:38:48.1768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPoKsOtSPXYQv8TGfY6/xwhoGN+IxzJ8Zc2OjyY8fPp4UvqvOBTnJOs/GOSsUD9kJnGdbl8nlCuYGKuUgEv6WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4674
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_dp_dpcd_write_data() can be used to write the GUID for a non-root
MST branch device, similarly to writing the GUID to a root MST branch
device, do so.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 619f461e02f76..a89f38fd3218b 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2192,20 +2192,17 @@ static int drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, guid_t *guid)
 	guid_copy(&mstb->guid, guid);
 
 	if (!drm_dp_validate_guid(mstb->mgr, &mstb->guid)) {
+		struct drm_dp_aux *aux;
 		u8 buf[UUID_SIZE];
 
 		export_guid(buf, &mstb->guid);
 
-		if (mstb->port_parent) {
-			ret = drm_dp_send_dpcd_write(mstb->mgr,
-						     mstb->port_parent,
-						     DP_GUID, sizeof(buf), buf);
-			if (ret >= 0)
-				ret = ret == sizeof(buf) ? 0 : -EPROTO;
-		} else {
-			ret = drm_dp_dpcd_write_data(mstb->mgr->aux,
-						     DP_GUID, buf, sizeof(buf));
-		}
+		if (mstb->port_parent)
+			aux = &mstb->port_parent->aux;
+		else
+			aux = mstb->mgr->aux;
+
+		ret = drm_dp_dpcd_write_data(aux, DP_GUID, buf, sizeof(buf));
 	}
 
 	return ret;
-- 
2.44.2

