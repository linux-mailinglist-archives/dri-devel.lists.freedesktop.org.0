Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F6D24F155
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 05:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3956E193;
	Mon, 24 Aug 2020 03:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5693D6E133;
 Mon, 24 Aug 2020 03:00:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEv5reILA8pxVZy3y3/cvKgbC18MGH1xDmwCq/y6qYYqQG45s1hBsfmoHwIIlAhmAbwVtItrIrS1cfmOj0+bFUXvJNIwUMeY/JnzEShOKOcSOSj63MiIcbyuhZnxi6s/PqlrNrQLU9w5I+76pHEn+uStu1l1kC4BSBy7n/XofFIR3T9kDo33DH6L7tgstFUcE4apHj474Fua6LFewwupskYL7GWjTZwa7JDRTo7pyMFcrzk/NpdmvM6y57PFTgxEZRQsmWB/ADjvqyUdnxDDeywKQbqZFrWWHKhfw/JFy5BGKOgmfPltmhM7Rjy/o306rs/2ocwgK+eBNoXqbkYobw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bp/n/rUELe40i3VwidhnXPqSVLx566S1P8511LvH1/U=;
 b=iTMoi/NVNxUaQ1P9IYW9Ugub4mkMEonm0RAWimbINvIgi370DWCJm9jtbwglMCzHhkT+bpL+ypzu7X1Yzv8ijpERMeeKfRWcksqgSvj7gsHbd5dhbXjCHHq1fBGxGesCtR3otdqZ33N0yljQ1VAFV0Qv+QXJa5HHnnL8HQYTr1AFrAB/NuhGQMyrICS7xmS4pMckUhwGbeOS2SjbRXiA9+EnZZjWc7NNobPHFjNQDPLtkfV1k/UfG/sSQp6Li2G5mZlc6DIwgePs4qgGbTtOTa4hHaLOan4E9Z+zSK1LeDh+r+N5oet8rxDHKBg7Q3WWrKu31NjqZbofr04NYCVs5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bp/n/rUELe40i3VwidhnXPqSVLx566S1P8511LvH1/U=;
 b=XPQfLFHhbJeAZqYvRT4zBPw0A/CvZ+X/yzNU1ThibWMcwo6vCp/QEDNJlyLG2fHoKYuq1Ax1JpKtu39xp4QTe8AxVcqHWqXhUqd94ta65rF0uAJgd2/EKpKLpffHqE8yIwbvGBlfywg2bEE+IQQwdoqWmLdXwn22SHESMO6y1VQ=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.25; Mon, 24 Aug 2020 02:59:58 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::bcb1:de80:f60c:8118]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::bcb1:de80:f60c:8118%5]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 02:59:58 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH -next] amdgpu: fix Documentation builds for pm/ file
 movement
Thread-Topic: [PATCH -next] amdgpu: fix Documentation builds for pm/ file
 movement
Thread-Index: AQHWeZ2/gKc8SM9oYEuNNVO303NlTKlGkcVw
Date: Mon, 24 Aug 2020 02:59:58 +0000
Message-ID: <DM6PR12MB261924212A1791B949B43903E4560@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <88d43daf-f29b-0fbe-cf58-930e8caca0e7@infradead.org>
In-Reply-To: <88d43daf-f29b-0fbe-cf58-930e8caca0e7@infradead.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=9849b35e-e708-485c-86c9-380acc7d4970;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-08-24T02:58:55Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cfc1c739-094a-4a22-7732-08d847d9c977
x-ms-traffictypediagnostic: DM5PR12MB2504:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB250412619511C1C58DDA2CB4E4560@DM5PR12MB2504.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AggqE5jCggN+HIPHA4hZZfvyEHbs43TXLu+ea91YmGQ7G0N9+x9j1eVvmxpkSKg3s8LuM7bCLq0QZf0YWa6N7YPtMcrALFLVnFaMNqsgpLaVCJIsqC+WQRqSXaqhB9m5ZDjExUp45xP4oYVsU5dXyWYLV3cyCjFYerePMga7Y25Dg72jKXB/BP73fKNJ6KvgbTTU4q7+Knx2VGNFvN3gxxJU7WpZTGk2nF44NbB6gzRLcjyAmBRR0UBfF3iU4T1XTH/lDp3fDxapnGauQz6SeN01mged3uC0QdI3AadcVMLlqKJLvvB3mlKR2XRGivSm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(26005)(53546011)(6506007)(186003)(76116006)(71200400001)(66556008)(7696005)(64756008)(6636002)(66946007)(2906002)(5660300002)(55016002)(9686003)(66446008)(66476007)(52536014)(110136005)(83380400001)(8936002)(86362001)(4326008)(8676002)(316002)(33656002)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: IDHAwuuUBBRB4M2YJhfCwLg+N/x5ffj+7bNFxNnfn/W/x/sgySXsH6Htl4H5jtY9h6MZgnVMlk92WiO/a+t21bowPEIkZyNcBRNB+C/A+q1xt9AF1bw209mNObqWmSrBxAb0LrOl290x0otdoTnbGiGRvBEHHPmX3UOszxMvKibrGKai8id3U2D5CPH/YfEZaOxgXWfsQxJAXj8d/6tZd2W/PTPKPd0WbsIcE1rtaDywUGqxE7m7uh/2h5pnk0oeOimLyZK070PbVUjEafc9yLfXgqd9IvkaGngxfY2OtrzNqCTw4rZuWFb9MaiJgkm+tEBttdwZ8sobO2/dSDKx8LDVxNF2fFqcp7NIxi/l9kROdRPX1bDurbkFstlKQXLB1K4tqOPB4sWuNibpOv237ojtV9E5GWj9iePPpyHbUtdVliQu/0vXzdcP6pdhHINM2BpSXoo5crNCPd2FqP40EfJKMYi+eFb843hK8lbujDfFop7lcbdYgZgHJ/GTZSwLigQCx3OaaIn+VqMI3iMAEsoAzIXmUHvymBUNxRDnITEPNY+/91LwBXRy6oCG+bUzezVppeww6sIlFlCZY1bfvi1W1gldnbAGX94d3+jDuOdRJpNWhUZEC+33pWpNQw/YBeB9rmD7dweh1E5HdKm1yg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc1c739-094a-4a22-7732-08d847d9c977
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 02:59:58.5280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O6k+0tTPACRWMlu3YsDEiOTVBY/KTo5yn3qoWO0RAmJGdCSjDxZ4BUADQpcGFlWK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2504
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Thanks for fixing this. The patch is reviewed-by: Evan Quan <evan.quan@amd.com>

BR
Evan
-----Original Message-----
From: Randy Dunlap <rdunlap@infradead.org>
Sent: Monday, August 24, 2020 6:36 AM
To: dri-devel <dri-devel@lists.freedesktop.org>; LKML <linux-kernel@vger.kernel.org>; amd-gfx@lists.freedesktop.org; Deucher, Alexander <Alexander.Deucher@amd.com>
Cc: Quan, Evan <Evan.Quan@amd.com>; Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH -next] amdgpu: fix Documentation builds for pm/ file movement

From: Randy Dunlap <rdunlap@infradead.org>

Fix Documentation errors for amdgpu.rst due to file rename (moved to another subdirectory).

Error: Cannot open file ../drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -function hwmon ../drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c' failed with return code 1

Fixes: e098bc9612c2 ("drm/amd/pm: optimize the power related source code layout")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Evan Quan <evan.quan@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
---
 Documentation/gpu/amdgpu.rst |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

--- linux-next-20200821.orig/Documentation/gpu/amdgpu.rst
+++ linux-next-20200821/Documentation/gpu/amdgpu.rst
@@ -153,7 +153,7 @@ This section covers hwmon and power/ther  HWMON Interfaces
 ----------------

-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: hwmon

 GPU sysfs Power State Interfaces
@@ -164,52 +164,52 @@ GPU power controls are exposed via sysfs  power_dpm_state  ~~~~~~~~~~~~~~~

-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: power_dpm_state

 power_dpm_force_performance_level
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: power_dpm_force_performance_level

 pp_table
 ~~~~~~~~

-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: pp_table

 pp_od_clk_voltage
 ~~~~~~~~~~~~~~~~~

-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: pp_od_clk_voltage

 pp_dpm_*
 ~~~~~~~~

-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: pp_dpm_sclk pp_dpm_mclk pp_dpm_socclk pp_dpm_fclk pp_dpm_dcefclk pp_dpm_pcie

 pp_power_profile_mode
 ~~~~~~~~~~~~~~~~~~~~~

-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: pp_power_profile_mode

 *_busy_percent
 ~~~~~~~~~~~~~~

-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: gpu_busy_percent

-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: mem_busy_percent

 gpu_metrics
 ~~~~~~~~~~~~~~~~~~~~~

-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: gpu_metrics

 GPU Product Information
@@ -239,7 +239,7 @@ serial_number
 unique_id
 ---------

-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: unique_id

 GPU Memory Usage Information
@@ -289,7 +289,7 @@ PCIe Accounting Information  pcie_bw
 -------

-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: pcie_bw

 pcie_replay_count

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
