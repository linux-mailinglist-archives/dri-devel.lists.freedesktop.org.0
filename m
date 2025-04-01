Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D181A778F7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 12:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CBC10E559;
	Tue,  1 Apr 2025 10:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G90iP6U3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5B310E2B8;
 Tue,  1 Apr 2025 10:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743503933; x=1775039933;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=IhHLKkljWvXpe4mG4h6P1zg/+RNqwuu0OhbpUWOh8d0=;
 b=G90iP6U3wBbIhKp2k+wGUiw2dNBaTPr/mevA0dhwwJjyMKf8P4UMS6EN
 9VqDwwdYfajTH89TuKOzkek7iU7vp+NNAkwEgdB7aSnvQjhC0LtxtGTuv
 Ea4ZrhlYBfvYroaamTWFAzMSS6gtZFnrwfhciXxZFiMYOFFuHwAJRNdsI
 l8TT6vZ+hswSUSaprBLbrNzHTyF7PuqRTgZZtoppZOG2rWTNXzwr6Kt9M
 fZKAegcp8PbJJJ7jsNbAtcn1yg0ezGdi/IfXgkC/Rt2P6+edJvBpilUvm
 iNd+lbr++tStDLemA1O711wkkJ2ufEOzB1XyB02Sw46SQqJdKwGdI6rCS w==;
X-CSE-ConnectionGUID: 6AvoWBkPSpK2KxSANMMLFg==
X-CSE-MsgGUID: yRB9IpKvQdCGmbUgaShY9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55480504"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="55480504"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 03:38:52 -0700
X-CSE-ConnectionGUID: 40WAyQKSSJec89hk+xGewg==
X-CSE-MsgGUID: uZNt2S6RRgOaJZL4O5TcpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131073069"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2025 03:38:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 03:38:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 03:38:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 03:38:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhtEHwZx622+WwW4YcJ27cnUK+Bx5GrH/wF263PzaQ37xtWu5vZPpbc5ZVHT64Tea+RR7IHOYOhH2hzrz0dQ8QSywZuDWdK3N/Q1J+h98rM8NOp+zzo2NKYUdTpyrmsXSjKgc9/g1dd8PaYNeP2/0ovzQ3F7OgyGYWIe0KI+4uPhWHmNWXOLPx2kSKRUPT5X8IFs25fSGfN7vgKwdaqsHN59dI6NKrhQnN/P6xnoLNxpqCIPMWroNjIt0FKulKruTSqYfnloCF2N7imFxJQ1KKb9D2GVqxjvt1/07jWY41mTHSsy/UrT4U9XSRNbiV9924Di8I5ipKfI0nWkj3ZnKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpQRElOA2L9FcUHdgtc0V1AIWM8BKyO3fSiDXxc5w1k=;
 b=I9xeVT3rvt70cLms+oraKf3Z7tS2nPaEj0eQNu4w11jCKrJCTSUBZ3eGn0JZSWzue7dfFwJN2YIyeJZNl3NWIjj1BA254O0vjYqiZkyxAEFw8KXpp6f5iFWlRIh4bkA5ART5NDQIRnJe1YuZvI8wnWWflRDYV6XmikFN/cCWeL+jMxLE2hF7x1n7CW6kA6YcNh73IOFhm2KRWcktgMjFzTfEVQsHAdhSehzzy2WrQLsRgU0z1+2IdkXljnNRl0pNglT6OVMhSp0FQIiw8LWykPttvOkIYF9Y16qL1hQQdD0d/myP3KoJafV55mK0O/8xjRlrMQ745FDwmhwpH3ngWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DM6PR11MB4674.namprd11.prod.outlook.com (2603:10b6:5:2a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 10:38:46 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 10:38:46 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/2] drm/dp_mst: Fix GUID DPCD write to non-root MST branch
 devices
Date: Tue, 1 Apr 2025 13:38:45 +0300
Message-ID: <20250401103846.686408-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0067.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::9) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DM6PR11MB4674:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b79218-8b09-44da-86f5-08dd71096182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oydw0c6xmORZeD/fDsvgi4m1vG1srJsaFsfUzYTgXnF672PDObzyCRykkoAa?=
 =?us-ascii?Q?ndf9EekHCrk+hyVDW+Ch4OnI/2GfM/4lSgMygktajctMxMPr5zQV0NdxbaLD?=
 =?us-ascii?Q?pfsSUiy0CWhCqGKB0+RFUmtCreimDIB+bvb8J1FxHRcd5foYG+s8U/Ca+5eU?=
 =?us-ascii?Q?0sMvmlDmdn+F6MF08t4oHfSztGIYF0I2grY3eGAj+dDhqv1GOIgxP466Zweq?=
 =?us-ascii?Q?c7LFdT/AInJmW2EfMNiD5kR+FMtNC4oN/FaxaBhLpfwpwtyo87uqPwpwPqjJ?=
 =?us-ascii?Q?fsPr+b7++q//+7C5eHjzdOu/uqxp4TUBno8uYV9o5fyG8CBy8HqqHtVasz6y?=
 =?us-ascii?Q?gqXkBspzBjR5teJl/4DmEHHHZWsZ+jOQacGhZwsaAsOudyuzsCUfSkvYvPPr?=
 =?us-ascii?Q?wmX78jro1+59QxscFhKPOZ14BVoxdeDyI6zKQ8AI8Lt/DHGaEi2nOWrBJGo8?=
 =?us-ascii?Q?8ikxP2gDHkhx5WJV7iypgmqPtEjRFT/PHam5wdhywL8k6+7g6NBx59lHQV+P?=
 =?us-ascii?Q?GWtIf7SfxdHYjjnan7ONr8TdEpyBvsPrOTGvWeG21zqGDa7f40vsLmbJhoGE?=
 =?us-ascii?Q?FMu4bW7W2lyeTNDLBqf+GyfYjsDnsu2+GGPK31TSgqG1pTIOzytqEpVAGxUW?=
 =?us-ascii?Q?rVYtcMTppLTaIdu1FNZU837Uv35kI0RDlcqC6YxrCJjjDqamMdLujEddHCy0?=
 =?us-ascii?Q?s8FfqZ46YSxcnKsaVa2WW0cpVrq3CPg05Rtm+RBIzDymyJQecWl/sO85ChAT?=
 =?us-ascii?Q?jk3kzzlMvD9/jXhl3NEqCJPmotSziW4hDeoSN+Bny+E0rbTkBfm4Oz+x0667?=
 =?us-ascii?Q?XAggYRFzbXgVYce73A04O7N7vr0MEVKOJtGBPaXner4o/OgveO/ZUey4HSTV?=
 =?us-ascii?Q?WxzfqHUg3Oi2895anDZV6XSr2WT+OTmzDjOYsL84A6VvMhNPjylx1EIhdlbB?=
 =?us-ascii?Q?tKNPGkwsbfl/8Hz233dyD2ZFCMVLlEwALMFiW0qGVyAdnp3HiYYB/6W5Iaza?=
 =?us-ascii?Q?9tKdHEPdJPDTzCm8uqYTKDzNSDLwtF1JoePEnvSXwJrnCvxZOLiPNosSuRI1?=
 =?us-ascii?Q?qqtW2FPn5UlBhw6WOWuzVW+1w/vFOElDLo/GZGKH7dgKVbn6q2UkNi5O1fq9?=
 =?us-ascii?Q?TwkXcSwa5CrIFuEVKEyds27MM3AxtB4FEosQiB/Vipu2myfgVoBjxuFu6IhS?=
 =?us-ascii?Q?OJbw+OalfZzy/yDBfKEZA3Pq8R+SrGbwQUAU9TwrxBs1Q+nyADlC95xiDJUE?=
 =?us-ascii?Q?9a6UlrT69p3K1drh1HRi6MUtkNkK0QYmiY9B7/lie/K+GPGi7AAEqxn9IhzR?=
 =?us-ascii?Q?iICKvcvU3mkuXGDqXY9WK/EbDSpAQwzaZ3Yp7fIXG6/ZbI8MMzG6Gxw2luoL?=
 =?us-ascii?Q?yfUesmG+usKmXECri/nMphd49/YK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tF3lft6FX5mEiUxB26Ws2iJ/ZPf7cmLwY8w1F26xQ30akcU/mtF6PbWQsmtd?=
 =?us-ascii?Q?g+Oeump3nxtP2SnA5f8oFtPagDTWhLUEqWamaX15af57gGBd4Sq4F9gl2k7y?=
 =?us-ascii?Q?bo/467MZI3tgyub5uYVwxjv83mAQwTDFceVZtyUmlq8Ji4K8vtnD2WXbWZjX?=
 =?us-ascii?Q?zKIWGFzyKVDiosmtm/j9cY2D2uf6y3vl/UmjImT2RyvDT2e/UyT6QeWyzBRx?=
 =?us-ascii?Q?0cOqRjMgJJ64YmteJ/ICJfcfHpP4fTDrtIn9BvvJj9rwmMyd2YgWH9kxUDIl?=
 =?us-ascii?Q?1sklSoFNSc9RcMeRcOx7y5I5UMYy3B+Akrpvs95QBe23nZ+O0sY5TCLGxsoM?=
 =?us-ascii?Q?sPIzYZ5oPjVxpjVjRE3rBuvj0/zxYFyFQJZMP3bLCc29I0tt61vqYTQev0Oi?=
 =?us-ascii?Q?jjerdTsbxuQeJSllGe++UlooSjK863NwQT4/Vo0WtR9WUG6f7Yf4Lbmg5MA+?=
 =?us-ascii?Q?wuiO1vwoouk+nB7QpHz4gJ0yL3KYbNaYtw0qzTspZd+rfwLdqYVA2ZM95nfp?=
 =?us-ascii?Q?E9Q7Y18jn6HH696OGiLHRRkJJsKLaV2lfEZtCouh2bIKNQ1ktpdS9d/MJeZH?=
 =?us-ascii?Q?BiBpK65ZPXQhAoezH6rsAva7Z9Y1yrn1UCFP39+rWSWDPgYRQMe2szEpL4Oz?=
 =?us-ascii?Q?tpl0m1ccZrzjSetsoLXYEWKiUbYhs2CmyVGwZ0cPbjhbbwY5j09ZM0EW+vHZ?=
 =?us-ascii?Q?IvtsF/TOQROXlN0vrJMaFmo7IjWIKjJRA+TrmCeVUCY2cYClrgXo6GLj5NHg?=
 =?us-ascii?Q?vZgc0o2QJQTe2Hp6k9gnXJVLs64yXOe6AAWDwOei8j2I0VZdukgTZcr3WQxE?=
 =?us-ascii?Q?F74EXeXQ875paskg36vLrgf8ELQAg5O/dqtO/lOQkPKbpPHjgKJjIiu/cPea?=
 =?us-ascii?Q?WXCvPhnN2KsIy9zzr8d5uiIuP5KVNGAlrv/atKi/RLWd+1n5NnubP3g5SYao?=
 =?us-ascii?Q?/l6fkQN/lncFjf2ptugvQTNI9ppGw4wU4cpi4OrebLXLqogNCCHCNk4uxMLy?=
 =?us-ascii?Q?ZFlyBZHKB4vZqfAjrRHWMKe1q4xcKCaXJ6JXv5rWPVnsSG4yapkug1iNkP9r?=
 =?us-ascii?Q?7piHt92/A+m5Y0URKfTsqAnQ98lcfq6mt700J2n8KuIkLfu1pkWIc9/N9mNW?=
 =?us-ascii?Q?UwZ6Jq+byzydLP7QKCnF6HNKIBLlB0gZ6IOQ7JS8NfxidMcEonBe8XTI+9eN?=
 =?us-ascii?Q?CQ7Do7Pnx3HddlBqb1+hZPpeEhuG3g66ip+8QYV7jmflwS7Mq1jtKeSWUfHH?=
 =?us-ascii?Q?6WDK6NYb/xDobTVhjW1umiVJxBlXmI2lVtYRjKgwNRdQJDxrUVB9E4Cs/O28?=
 =?us-ascii?Q?5mG91L+V65OlQAwq2YbjfSFY6JUnf3/DnydXTouXn3oAflDgXJKWLp3J7MVX?=
 =?us-ascii?Q?FR2PPZTOI8lIVW/JVanBEt1wx7RGfyJ9iuBlAfl5WfC9YXw+c9CMH75yUcL3?=
 =?us-ascii?Q?FuUVnkM3lwoal4KYvXnF2WKz+189fUPZLr/AaKCDpdx9qmmk2Q03hUvcRF1S?=
 =?us-ascii?Q?C6X4eGI3YJribqjEhV16HDrIA0kUp57hHX7p66edbDAyHeHnUnxHJYKFUhfC?=
 =?us-ascii?Q?MrXkEIGcqNJTJowbBX5nwHoim6ZsFf/nwd79ThQe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b79218-8b09-44da-86f5-08dd71096182
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 10:38:46.2751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s01Vr80XU6l6mff++J7kGvmYTz1sNwG918oWUsh1Wt7aJE81QzT/cl+lHyoovixE3qM+PxKPZGounKySV5/9PQ==
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

The return value on success of drm_dp_send_dpcd_write() called for
non-root MST branch devices from drm_dp_check_mstb_guid() is the number
of bytes transferred. Atm this return value (in case of a complete read)
will be regarded incorrectly as an error by the caller of
drm_dp_check_mstb_guid(). Fix this by converting the return value for a
complete read to the expected success code (0) and for a partial read to
a failure code (-EPROTO).

Fixes: 2554da0de3e8 ("drm/display: dp-mst-topology: use new DCPD access helpers")
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index de3fc6090c906..619f461e02f76 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2200,6 +2200,8 @@ static int drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, guid_t *guid)
 			ret = drm_dp_send_dpcd_write(mstb->mgr,
 						     mstb->port_parent,
 						     DP_GUID, sizeof(buf), buf);
+			if (ret >= 0)
+				ret = ret == sizeof(buf) ? 0 : -EPROTO;
 		} else {
 			ret = drm_dp_dpcd_write_data(mstb->mgr->aux,
 						     DP_GUID, buf, sizeof(buf));
-- 
2.44.2

