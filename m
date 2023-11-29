Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E42D7FDBA5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 16:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3777C10E616;
	Wed, 29 Nov 2023 15:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1529010E617
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 15:38:14 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3ATDvbVk010204; Wed, 29 Nov 2023 15:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=xWhQqJAxtDgCZkmBiYlckwIemxO7Ohg+FX+tyBb/9bE=; b=cyl
 qrq8v3AzHmdDottBu+KjmzX5G43lG/pW2uIt1E8zcXMpJHuSlbxbFpoIQlwWaG9L
 lGzopwxSJlvjorSCiNe8yIXBG2ontrT/T71Ify3jjFGaRAS3gdzb+IAblpvn5cuU
 hewL8LvW5rAP5Ob676JsHbEqm09cpRuL80OYw7b3Drv/jwUcPPR50M5Q0MiqyIwn
 ePrteqquI/U5g6AioQDZ0SbT7xdzDn3quEvBg0g/MkGlfMvcEp1Iq7s6B56EvAp4
 WBwMMKR4BPXQyhr82TTW1ZLidWbUo5DX8W/ijDD9ZG9yrDJHvPeaxtZyaSR4RXyi
 Elz6ud1h3e+niLfo+0Q==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3unvk1rdhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Nov 2023 15:37:57 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 29 Nov 2023 15:37:57 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 29 Nov 2023 15:37:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8tNkQBxsdolSEY8o87gB8JdrCK/BXvguvIbsWKnQItUOqWZiY+6pnxuZt45sB1hB+teDUpN1sFaHfyEuWzeSiSfJBE64Cnghguc7P0ttmW/WOAupK/ccf0wpK8k6e/AcehkPWXe3crGcNe63awM1zq6t9SYhY1/LyLQOALgG76ihVkYLcq5yWYmvgFMmLi9/HRz4qa3u1HLAmgDonTP6ct89+n0ZL3/8f2tBmCAF5DCi+mNHNWMNfQb5aldReEMpBx7rE8FjRLiJ/YpAoLuyNtOV5ZwvG+m8B0UZ8W6qjvjUK4lYAQKsn+xvIV34iMQthe3jRlCON9Cux1c1i3HYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWhQqJAxtDgCZkmBiYlckwIemxO7Ohg+FX+tyBb/9bE=;
 b=PSZHu8IUXzEHAZgkCZlOT9NobiA/93QTbntXZ+fUEWgLqZKKype3zu6yuEMXlBoxcXr0QEXNfXAHr36mYW2b4T87x++KKIudTt6OBOLox57xwwXL/20bGQI24jC7FHnDpzFvzYNgIpgwC0gARoBOjCWoQ9cq6i1VIoi1ssIHS23y3nUnAdPKLwIddOebhptw9Gma2sKoJOuMmOZLmSHVjY79D038+s4JIM4uS4PDBrObQttyl8qcFp+mV+5+c1khe3IZrYfs2jJ5J0NAGH3XwKiD94nMm8PQnLtg6JGopxOlJ5XYpoOhhPs3JpT75XICn6w7g6argXOpJoiQ+uARTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWhQqJAxtDgCZkmBiYlckwIemxO7Ohg+FX+tyBb/9bE=;
 b=gmqQoIKNZ5XfAAKQeDuMZeOCisfABf0o7dCb6sLdRl3jsSWy6HplEQAnyXR1fMPDnwNloa6lfH9t9CKVucwaqfZA/AT+3zR4XfWFbJsYBmKw4O8PeVOVvFt8P+9lFGv/idnpADslJDUrGk7jOhFthU8qoJjuUynp0UFlAaEhnGc=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO6P265MB5951.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 29 Nov
 2023 15:37:55 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 15:37:55 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/5] drm/imagination: Fixed missing header in pvr_fw_meta
Date: Wed, 29 Nov 2023 15:37:00 +0000
Message-Id: <20231129153703.162642-2-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231129153703.162642-1-donald.robson@imgtec.com>
References: <20231129153703.162642-1-donald.robson@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0541.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::12) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|LO6P265MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dbb3853-0474-4fc7-1df3-08dbf0f12839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I1hKOX3M8H+lNytIsQIzcmut5+EOMvhkLtkh5JXr65rgwZlXvWl36EnkEQp2c+cCLpYYvut3msq4htHaPa4Kxmdd2iko6JQkc5m0G4TvvdjZMSRCPpuYxAn3gE9Rpv3E931vx6LuCT31u/HSFnrIPRWRYmivh+1AEp9N9HKzVjLfc24lbXSEA6x1I5oASrWQQ0QFiUNJgZvmeZIuBoRuhkOMx3pPj32WzWCEStZG2vEiZsgofwg3W5bwahalfOUXrB5K39UbbSgHyWWQitwp3pgxBC2dl/0hQeQy9/Qoe5ZaO3W7PvqiZjmD5wWI2WoiOImkod0Qhf4F5c1zWMkSK08Z0QK2f/Y+FgC6ctA+SRU91ae8R9y8NGwf7Pe4qslO5SgsXKmISwBsFS3xzjQUBKJD0aP0woJ3/I7R9wA5lBIm9bowEDHtJWnN5kcH1hM7lI46t2LzDv1MUcbSGXtXlDlP0fLOs0KKCO2SOBfQawQAlSKikPjWPdhMZVz+QxblVHtK25xetANP3sYUZbbImztnPHFPU7yMFirT2I0I1iordF0vMdbKcex0erSou5uxyRSO3XCFM+lO2Y8TEq/ZJrKmCZk3FAuYmWub4B3rGic=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(366004)(376002)(396003)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2616005)(1076003)(26005)(8936002)(8676002)(4326008)(7416002)(6486002)(478600001)(44832011)(86362001)(54906003)(966005)(66946007)(66476007)(66556008)(38100700002)(83380400001)(316002)(5660300002)(6506007)(6666004)(6512007)(38350700005)(4744005)(41300700001)(2906002)(36756003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KPmsii2nwE4R5gYx45K5/4U8Mb8DfwhWT/ndR5pyocXHu/qd2A//g+34ZG8H?=
 =?us-ascii?Q?4R7TUZ8V0GoGpSKe57Mk6wgFUhRNjBF0uM1fx6lL3o6cn6CYIaERZjslXmp7?=
 =?us-ascii?Q?7S/rYDaN6mKqG8y/N9Aoh0yPsOE0LBvHnuQKiJ6cZHfPM+z4BI6dJqMCicr0?=
 =?us-ascii?Q?3siIcPwI78MmNv4Hn6zLX2xDDkH7i2SOszkMXN4yQ0muIPOCbPnYAN0RQWxf?=
 =?us-ascii?Q?Zp1VR7nCXiG9oZoeCaPMnrq/U5DDVuJcY0uF3R/YYb0RUnUCZ3yi2DAqAc65?=
 =?us-ascii?Q?uSA+wYVKPlosZ5nPYrzNCf1uNTi+pxdr4+ifLQu5/EMctg95lekzp30RscCU?=
 =?us-ascii?Q?o2qd145a5MQQAGS9r0xxDv5LTzs9VTWqCovjlqiVdi62jEvHaUHtr9JgJnt4?=
 =?us-ascii?Q?WzRyrs2q68GvG5fHJoMoXfgB5Ro/vtOtv+TfSol+vLneGbuD1NeReabc3opK?=
 =?us-ascii?Q?G+ohj1FqbyI5yrchHHsTvEya+MkIRJa4/zmSXuaLccBtTYF2ik/jEYCTXrdl?=
 =?us-ascii?Q?pLv1o3eAQtitPDLJr+9KSG99S7CPWy2yughGQ0Dvc+TYDRHCokgo/+A1QBS1?=
 =?us-ascii?Q?uBDjZ5MRud23MvvUJEthn0lEPuwfahCu2QBwMS1y+qUDqeBuzPnK9nu6h4Kh?=
 =?us-ascii?Q?POL6qbSvS9tJI5wJR5CuS+FSrtAGXX8xBMVgOBMK8uCXSbXjOEIe/WYmhirl?=
 =?us-ascii?Q?zY09qINyQeSdMRw08+7k923rt2JxXomH2porjQU9moepPnFvpZ8iD74f1tYy?=
 =?us-ascii?Q?wHoO/yS1K7Hf32ZSo7DnrvYQ8lO3OuZBgy1A0F72d2rgpWn+r0ChTagXC62k?=
 =?us-ascii?Q?0+AhODr4bw/Sjw9x3amN2TVJdc958ljda3tPvwKK9jY59pRS4tQBmFoeUwdL?=
 =?us-ascii?Q?/8LMKvZif+LQi0Y5R8pBf6+K9+oQA6gxOw5NR8qzsUPPhb4rYqQifwJX2Ivg?=
 =?us-ascii?Q?1ubpzDJPANeWHZgAoQfUx3HoL/x5IQxJfgBnV4gWr/FZJwk4n2n534fvALa5?=
 =?us-ascii?Q?o1v/tQiHFLWnigddIPGwuwzS1mrAzHKk5Fgunba7QgsQUVnh1THsZnZStoIL?=
 =?us-ascii?Q?QAdam6risMv99aG0hkbyT2T3H0r36F3NZDcYJBJ+NixWn7REFWXPpLk9zCgj?=
 =?us-ascii?Q?oOaD8I+PGIT9TEEQP6AfciV6s3r1YUMibNF47rvVpCfxSMJVONnAl4qbuajP?=
 =?us-ascii?Q?3WooVXrr/ltoajnglDGOfqstjgoRq07v7NJorce2J1Ye+iPDfW9xkwGGEhdw?=
 =?us-ascii?Q?gHl7apubtkaZWtV74ONQkZFR+pj8xYj/SaXMJ/wAB/aD/2fludEPLiu6Z6tV?=
 =?us-ascii?Q?UdmGXCT5J9QEbMdGILnpC51YgltNrEaxBBcEdiN7sMXfQBN3rOTapqm96s2N?=
 =?us-ascii?Q?2CDUJ0HOXYGY6U4aTsT998h3xdnTM5+d2ilxxv7XqIMXzq7cBz+/GnF9Y1hR?=
 =?us-ascii?Q?sR560zjQR83TDe3gAJWN2Tj/20/maj+VCEoNOBNGsFrpoh8XI/P0QS8qEw21?=
 =?us-ascii?Q?V1ncfTvKQdzYhJHPZiesM55tTcZ1rXUpplFVvtcfKG3mM05JKXDjBSuFoiuA?=
 =?us-ascii?Q?jzPxsEytKN/JMKTO7u0ebH5PDxnauQydPCjzF11SNYrYYEZEhdT9+iAKPnYd?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbb3853-0474-4fc7-1df3-08dbf0f12839
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 15:37:55.7019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CwixJzy1JD49OP+Ufze71gAhzczm/0kBNfEJc1G4u8jSy34V+vbQVt37O/ikyDOweV0ogCYHPZdKyVZrX/Gl3RnSyliAJmohgU9DN2SnyIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB5951
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: hwRpzJPkCMvpNeYVF2dUZ8g2DRGe6wdI
X-Proofpoint-GUID: hwRpzJPkCMvpNeYVF2dUZ8g2DRGe6wdI
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
Cc: Arnd Bergmann <arnd@arndb.de>, mripard@kernel.org, matt.coster@imgtec.com,
 boris.brezillon@collabora.com, donald.robson@imgtec.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reported-by: Arnd Bergmann <arnd@arndb.de>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311250226.Da2yiSKp-lkp@intel.com/
Fixes: bb52a8dc84f2 ("drm/imagination: Implement firmware infrastructure and META FW support")
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_meta.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index 119934c36184..c39beb70c317 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -4,6 +4,7 @@
 #include "pvr_device.h"
 #include "pvr_fw.h"
 #include "pvr_fw_info.h"
+#include "pvr_fw_meta.h"
 #include "pvr_gem.h"
 #include "pvr_rogue_cr_defs.h"
 #include "pvr_rogue_meta.h"
-- 
2.25.1

