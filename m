Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D98C724AD20
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 05:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59926E890;
	Thu, 20 Aug 2020 02:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9036E890;
 Thu, 20 Aug 2020 02:59:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGlpWlUGhr5uVo54/ZHZQVMx/daRcKiZkDD6su6RJXVSGBZPi0jFsrznvTSVWCny4Ma3KyPDjaTl8LpXASoP1qNNXB9PNMxexeekSCr8ptBhOH556a1AkqW9LPB4RobdMDpEO46ZrX6bYUN3kYx06Dg9d1aZHpykGuqX/tPvtLadl00xgxoXAwVTLenpeTJcGV8b3UogwQk83CGpQsIPaac5I4Bqf/00v+HnsCpaxFYRD1Qs51wSfDVc8KQ6WqgLIArbBe3Q0IBMxbCo5UBDUnNQavAtnchrK9KCokpsHmcr5NPx2XGtW1ngDupwJENYDgDj8CnBGOA2iTpd2PD3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTWYB5AU39T+AQexcHBb6OAjgXaKbh80lkRMaYWS0a8=;
 b=jzzPUc3UAoMQR5QV8GhmpkcLFpD4SY+dF2M+yD/kZkvvZsAo6dX/f08PjbOYKh3zp2Qz91VzdKggryRnFX8aqEZm2Tsw/tDpI7gYRn2EB2NKj/k0s7hUVP7p9Xd4BQ+/0CJN1p7/8cs7J/6vLe4cLc5Eft9eI4BZ49FlsIHd71I4UG5+eRgFrq4ua3UwRObgeN2Orvip2Ltvy/qqCkbErO8q3gcvh0RjvbJPZM8HLbg6sCwSewPx0FpgahR328NFYd9+34dXXjxHYj1zCumTyKyuqlt48PijGjH36WbaYhG10Ithgyr9+SWsqSVHhb+D/eUdKT18w0gnfIZk0FnLdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTWYB5AU39T+AQexcHBb6OAjgXaKbh80lkRMaYWS0a8=;
 b=coWwyHF6O3hAn64BwFb54Ds8b8upMardZO/xyZT+KADr5uFDHQh/E8P6NVE2AMAwXuSPHVNgmsHKhuTKz8wCEE6s0a9B1PU/u+aMU+oEduZecUaxgnWdVgUGZWEluM502Hfrh/kqn0BBCU/Ph95Wn+E0BvsjOKrCCA0MwUilGu0=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM5PR12MB1356.namprd12.prod.outlook.com (2603:10b6:3:74::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.19; Thu, 20 Aug 2020 02:59:56 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::fcd0:74a:b9d0:6b66]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::fcd0:74a:b9d0:6b66%2]) with mapi id 15.20.3283.026; Thu, 20 Aug 2020
 02:59:56 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Wang Hai <wanghai38@huawei.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH -next] drm/amd/powerplay: remove duplicate include
Thread-Topic: [PATCH -next] drm/amd/powerplay: remove duplicate include
Thread-Index: AQHWdhz6t3RSCj4X8E+n6Pti7n7aUalAT6IQ
Date: Thu, 20 Aug 2020 02:59:56 +0000
Message-ID: <DM6PR12MB26191A1647B5AADB390CDE77E45A0@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20200819113409.10137-1-wanghai38@huawei.com>
In-Reply-To: <20200819113409.10137-1-wanghai38@huawei.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=936cf408-d795-4856-ae9c-dc635f54881d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-08-20T02:59:34Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 018f8301-41ec-47e8-3cd3-08d844b51e7a
x-ms-traffictypediagnostic: DM5PR12MB1356:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1356D9966B4B54CA9FE5F613E45A0@DM5PR12MB1356.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gKF1HsZ6E09K09pxDtp5nkLTGi54FbLU9F310sKoFjWUB0xbjyoNPtG+j7su/UnvQr0YSGgqi0Iiii60XGNfNjmdeOY671RORbtAsuTil1xmgWaGuA7/4ACUXVtdpf2zNLibEhso4T0EnmOmbLV1Hn3XpceWAp2robyFkqdm8ZidiUX04IOVlwMaI0hs3VT7YapdSaXCOxIWFRGxVTsNkNcfwLBXf7LkYEfZrz6SexX04A73M6l5m+LAWZrzS8d0Yuk2iaJrt/n+ipIFenbbVFtrV1yvlyeJhWpx0NCx3n3mybHJmzye8gBgQzSqv6eIe7+WRviWBrOPWz0KKbquXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(8676002)(110136005)(66556008)(76116006)(26005)(5660300002)(66946007)(6506007)(53546011)(8936002)(33656002)(71200400001)(4326008)(7696005)(316002)(86362001)(54906003)(2906002)(66476007)(66446008)(478600001)(83380400001)(64756008)(9686003)(55016002)(52536014)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Xa343Dc+BL7Fc4xt0NhqBMMqpIlGXABXP/tZ2Pd1yrgm1/+F0eZyML69X7nSo9tXB69IaIAuGhEsdCDmUEQbiAtLWwdyy0L44opSMo3UsrJsuGndfIqu2wwEBCD+v0rXIS6AQB0GfXg7iGhrcWdGZA0OKsIrsS1C/YMoschdtwCBFEX8FOo7H1MPleRDKRLvFldYvockBhWrJ1OQWL9DgJW6UrqzKeDUp/fOPbn/JLc9rnWJomtHUaZS+mbxsHytdAvSjy+1txJpLJ+hWPUMnrSkPdIAzm8zVp7Nn9XV4JS8wxECt/gFgQpkQ136Kkav/SUI0cdjbcuPbO0QfdonNn6mHYPFWSPPzRPTKjrYsvxWKunAx/iWASSlS3GrIk5r4W7xfEZaWiAY3ucOxzn5u5M9hVjMqXf9N4X4g73AWRkV25vBGdeGq6xZv3/6T6Wb2wA0XqixC6ahBl18vy7F7okQZ0HHJVlQJW0uuFnRuQQoZFcmudfE6c/b7l0abyyv+fvoBH2ibMUFMXtMzASgZyAciwTzFnhOlOL/YhsbBuIXahsUVPaZ39maV8sIJvi4SHtO/s30jjQwc2t+AvqSpz558ABh+r27tn6bSU/Ui1RpGrEaHEM64UnaSOAU8uWmdYCxLVyVrpXqJWJbJi7u1A==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 018f8301-41ec-47e8-3cd3-08d844b51e7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2020 02:59:56.2672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qdbe8hCX8nSPGFGk6a8JaPtDrt+JcW0Lqw4H6j1tUZTugzUY3bz5tDyFv/XQyFsP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1356
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Reviewed-by: Evan Quan <evan.quan@amd.com>

-----Original Message-----
From: Wang Hai <wanghai38@huawei.com>
Sent: Wednesday, August 19, 2020 7:34 PM
To: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; airlied@linux.ie; daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
Subject: [PATCH -next] drm/amd/powerplay: remove duplicate include

Remove asic_reg/nbio/nbio_6_1_offset.h which is included more than once

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/vega12_inc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_inc.h b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_inc.h
index e6d9e84059e1..0d08c57d3bca 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_inc.h
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_inc.h
@@ -34,7 +34,6 @@
 #include "asic_reg/gc/gc_9_2_1_offset.h"
 #include "asic_reg/gc/gc_9_2_1_sh_mask.h"

-#include "asic_reg/nbio/nbio_6_1_offset.h"
 #include "asic_reg/nbio/nbio_6_1_offset.h"
 #include "asic_reg/nbio/nbio_6_1_sh_mask.h"

--
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
