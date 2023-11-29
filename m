Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADD07FDBAA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 16:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E4C10E619;
	Wed, 29 Nov 2023 15:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFDC10E61A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 15:38:25 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AT8LshK017229; Wed, 29 Nov 2023 15:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=bVs+dBWkDDw6dzvphnE27lsLX30pTs0yltVV1XtVyUI=; b=pZK
 NOEhQyTH6+eRd7VJWaqM9SxV32jOdV4s+xso0u7bfjgMmUH39LltynMh7/EJxhn3
 p/ldYAszT9d+4mOdCSJy8I6gKKgOEBEdP76vCyaAanzebbj5tXAVPPrQONnKZLzO
 g6AhplgFC18pwja98MkH/Fld1x4QfH3j5BUqdPN85XObEkTcVgKHEBzG0zZaIwvY
 m1QSlyjWee+xfatVeNQ/5QqhcoSBsvHGMA6RMEpWW3KX1DDLsjkqsGsQKswtTiI3
 qJng17+k8tr67dqsZE+h8ZxcBvbGBJ0hREhV/qdirurtkQIySM4supjJCYoMNYAF
 kjvyzGuofwR8mwxhNLg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3unvcq8fgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Nov 2023 15:38:13 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 29 Nov 2023 15:38:12 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 29 Nov 2023 15:38:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mInnIljGHGPAd/cUy9+C5E6qFzdmJyEMpuPw10lH+/r6iDrpCBUFQRVMOUECS1ogPDMrXjT6idIWBQs+LF4TotVBG5/xVzGBfzAPKgfUhVHa4VYTULx5aa//lh3ug/C/5cacBHbGJCpdx592VAbvrpz6tZJwB+NyhctJiEak+ellwU+gjch9TU8kjAZWEWA8HkY49ROBh2oc6hVnZU4NBhhSEXkL7tUx1/YTGMQr5Vgb9LW1laMUcbL0k3zQPLe76y3clE1q4NEFyBszQL6lzZDs2oVBarnG443atVPDzjW913s2caO7pb0EW8pKrP961vkwtI+mOF95tdtzXaWLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVs+dBWkDDw6dzvphnE27lsLX30pTs0yltVV1XtVyUI=;
 b=VxAXO8nc2ITiDzHssbIVW+A4N6aWCaR6G5fRSLV3Yf2X35Spqwm3dTDg0+sboFGJm6lKAcixI4Rn6Xh18RJwYN2JAcDBJEqc9wB/bTekLyyXAYFhui+VecUNs/OvcFpSoELlEuJ/u0jMECe21nFpi3A3zTvHjyrw2UyX++sW6zkba8sjIkL5JCZOxW/8mfydJ7QScbKn3LXxlQPuu/7JvUuivxT+3hCuUMluX5MmalYzyZo+zdNP9YbnVYedy65GwOCFHodKsy7lv38gFAwzye2DMyUH23YxZU5lnfKDVq8uUAtWGdPf6/5QD0F0DSswwTa9Gq5SQs94qHAQKaDhnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVs+dBWkDDw6dzvphnE27lsLX30pTs0yltVV1XtVyUI=;
 b=ge5q6f8ZoXnMyObgSuuuMEoObwG/vQVlNBkRqSxLs9QRMusbL8BIJOpzznOA0F3B8NWFlsD6anq5f++dAmJ0TeGiiNAsYSbfsvQmVvoBWKmjaUM5sa4dOUvO+nvH6ng7aXclebf46TVZKEP3ZwumJ4orDwDyEGQmY1nksyZZV0c=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO6P265MB5951.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 29 Nov
 2023 15:38:10 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 15:38:10 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/5] drm/imagination: Removed unused function to_pvr_vm_gpuva()
Date: Wed, 29 Nov 2023 15:37:03 +0000
Message-Id: <20231129153703.162642-5-donald.robson@imgtec.com>
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
X-MS-Office365-Filtering-Correlation-Id: 782096c6-b04b-4693-d70d-08dbf0f13122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: It4VucG4qDa9WZ4gP2+/vNuseb5PNBGgvR12NcNrMqxEUZQwPSSOw/soZjdtIHYyf71RObSOpyqvsTzbLmfsrrA6lNBC5PJCzGIRemHBdZegyHPb7cjmwQj+KkY0qVJSroV0GAgZMh2lLvqUp3MgdNb+1h1bOnugCAT5Ewsxuy1s9xPlykw45uX9wmycoj85kdNXnH0wru4D5cBr8lzwhLMWLRVe9vwzcGPiE6mrJNsJLLjDSYJ2sDKRRMzZDRLzDAIf+XY9kWuUoFIDPdGuQewsk/BLWy4zKTPuU++K0XRNU4EDeEvcKyebb1jx8qfipPeiCzZIbHdNTGI7aZ5r8NS0uq+lM6vnkToE6Nt3UTn0U7bPiTbTrkdKCoX31cA79GzqquNB2zkHoU5kaQ2fRADA/gZzszMyGg7bjhx8Kpsb8WjYdiUcyECvOAeW5ncTpiXDdK3ml6Mv74VPGRrSgqtfud4XvEuyQV8UXReno2Ppivz99JgdBKmahcg4DYrd8U4lv9dw8nEUQivFGu2/PpZZl6uc937Be3Rh3yB9mTyuRX03QFw8sDJrcmgcCb1jAgg9OGJHjFD5AfnJitj4NM8Qi6v9sm1ThBtm0VxY0PY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(366004)(376002)(396003)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2616005)(1076003)(26005)(8936002)(8676002)(4326008)(6486002)(478600001)(44832011)(86362001)(966005)(66946007)(66476007)(66556008)(38100700002)(83380400001)(316002)(5660300002)(6506007)(6666004)(6512007)(38350700005)(4744005)(41300700001)(2906002)(36756003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2n5YgEscJGUTHDdHvQjDzpwXiGauT1jJ8OVchE3kx/JNmVh0oWWohuDntov/?=
 =?us-ascii?Q?/IOzfJEQIS+2gjoNnzKwcbcpWRnU0HOOthQ2RHlA0QmRt0XKHmAMBEmfqVYO?=
 =?us-ascii?Q?Tv/Y3gldoemJDJUTLv+w72opjctLnO05xgNXBXjERX+ZSQpKLgUELO6fgU2m?=
 =?us-ascii?Q?CeRveAakUnLXKqDj8KDjJ3vYL9f3LtUtYLIGpVNs3ecJcGgOktY8DrtusJ/x?=
 =?us-ascii?Q?WtIXB3xF4SF8ms4eZpXJfCvCRcwj3TBRXZj5pWQYYLPtcJd6Wd+UIThetEuk?=
 =?us-ascii?Q?10yLVBBBu4XFGVnxHxo+fNtuDpWCB10Ob7bxemluZeei6h0RYfkniNO4L8VC?=
 =?us-ascii?Q?qZZNa8nDaaxIUE5WpefYiukjBR1J/cFs0wapN1KGHVNDryguQ8tw2q2+kmA+?=
 =?us-ascii?Q?mizzsynXRlrCxm+fcEffc+GdFzj9D1ZNlKnaXMljuCSlMUxDA7oQFxwCUhGm?=
 =?us-ascii?Q?JWRE1Bo4NFmV7Nh23VGP0OVmVHwjmSX0MNPh7HUdlKKq8GEiyawH1y/E9DRX?=
 =?us-ascii?Q?nWC8WGhbP0Op0hwBEolVbrqREnLh+PyXv/XGahF7YP5bGu9KeTJtZblEC6bM?=
 =?us-ascii?Q?fidhz4eYwL5H9aMX6PGrZa4vfOYjop7FWAoKsI/4GrvOe9BpCdiI8KAzWaqx?=
 =?us-ascii?Q?tOgd4IhP80qQn5+uMTG8yOkQm/g0RPkK1cAk0TULSy16RpJWVygan46VFFlK?=
 =?us-ascii?Q?ub0M7XwfNPrOXQXcSreNCnuhHYEZ0+NPJEddzK7NkXLaw4RzcRkcBRFVFbeM?=
 =?us-ascii?Q?Y0VEslqM3Guh27JPY1ueJclnf4K1R8JbrCFGsVKNnvwFy2sZkN4uVYShQhSA?=
 =?us-ascii?Q?ooYQABfWuY1efOo8AgIlWGmiJd6QBIKweeTlL8++TB7aEwCaCrJYE9RlD5vc?=
 =?us-ascii?Q?v/lFkWAfm/4TyKSAZbHtAZIUiRRN/EuyS/t6Y9QX5vQxrSEBQAM3meQuhGGc?=
 =?us-ascii?Q?Ho1SpOxCeUeUArAGB589724K2U46ltooXiA3gwhS74mBxvQ3ZDY9J6ZfCnRG?=
 =?us-ascii?Q?WHbcjMrEKZAg0mqOdfjkaTqv0IhCdOGVQ9HHv2ub6SnBcQ6J5GqekyvBYItc?=
 =?us-ascii?Q?x6+5HAKBF8B1TZGQmbA+SqrB6Usrru8a6P6ofjMRfZmyJKeJUXJbsdA9prBY?=
 =?us-ascii?Q?RdYZdyX7sSeI0jBqvBIOiuQ58UZrB9Sd7fUrIk2/y+fyr+C85GCGLgw+7Hg+?=
 =?us-ascii?Q?bb7iYe9JbEtqdZr62rhDzRSuODnfdHAmJ8uYgTxmMtuaT259HDHnVheKA8JR?=
 =?us-ascii?Q?UDxA2VhfA68O99FcpqqczicDeTPh/raADaNXuCyHIql9joiuA4LCzQGdcevg?=
 =?us-ascii?Q?di/WMK1CdBIvQEBFMzxHR3pRZvxoLNfS9BijlDNGoB7dE+JpzTvFNu6XxlFe?=
 =?us-ascii?Q?j2wg1gmwlk4JNMtt5XkLYAtF1rzBlEzVUqW8BDoXEjuJ+WMGMA5HofPR70vV?=
 =?us-ascii?Q?mVsNG/dgxbMT/aoXPYQ3uhuk94r3+ASZuuxObFt+nurqDJPFkNj15SQ9+MNe?=
 =?us-ascii?Q?Uq8BDrlLfe7pzZ32F8UcV8fyFfMvCNz9QwOfKYayZFlmAq8dwI/B8su7g1pY?=
 =?us-ascii?Q?DsEvxmQu/1n+rkAUfMb8l4bFhDRYl593Suw+yHYfD15XoDOMK9hdIhFxy8BU?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 782096c6-b04b-4693-d70d-08dbf0f13122
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 15:38:10.6300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUrEywZUKRFp/VWCs8rP/ONklc/JW65dKqVuXAZd6NheDwxWa965LodxDTCQpZBkgn+2L/FoDEqkLjmgVRBXEjf+MFcoFcd3bB4Yo2HbwGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB5951
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: Rdc8Gbobwn9Gx4q29tjHoadzdWgg7Qt7
X-Proofpoint-ORIG-GUID: Rdc8Gbobwn9Gx4q29tjHoadzdWgg7Qt7
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
Cc: mripard@kernel.org, matt.coster@imgtec.com, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311242159.hh8MWiAm-lkp@intel.com/
Fixes: 3c96dd170efe ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 89eb6ee1bbcf..375a03707f4e 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -108,12 +108,6 @@ struct pvr_vm_gpuva {
 	struct drm_gpuva base;
 };
 
-static __always_inline
-struct pvr_vm_gpuva *to_pvr_vm_gpuva(struct drm_gpuva *gpuva)
-{
-	return container_of(gpuva, struct pvr_vm_gpuva, base);
-}
-
 enum pvr_vm_bind_type {
 	PVR_VM_BIND_TYPE_MAP,
 	PVR_VM_BIND_TYPE_UNMAP,
-- 
2.25.1

