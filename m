Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48772E239D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Dec 2020 03:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9388B89D58;
	Thu, 24 Dec 2020 02:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDD889D02;
 Thu, 24 Dec 2020 02:20:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXX6TdwJLEO7yXJ+4GOPseWqoJhEGOkCp8NGSE7Rdz7+EtgYBOZle+HnokA8w9nyZk+8/nIxaKmTNSb7/hs+vUZCnH+crFW5bagpr4iJN35E5ZF+MOnROW//4ZfqZUpqn6XOa+FBftSzvrZaH0RbJvBB1vyRHu/V6kbVv7kxiUQ6FuM1FYzK/fcwKi48Urxo1JPEueYAl+KPky+myypHE6DbHcAnBt1CZ3lrNAy4NibwqxiwiyyrI0rvLWb/IqL1W4Noe3EuHZb6A3tbTT00jmG0sEoV3EDQH2Nr4KcdgbfDebYsp4uhn+xlPhZcftEFnEd0512p3Vz1smecgDCsmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDBacsgTp6tZ7qtLhdaHQMrWybO4xX1BzkbEwqFMH6M=;
 b=FKIyOhuq8LbdfbvpYT57e+ijfhffq+K1WLQkaZU8f6KxM48fGNJQK0gaRZEdT71vghZwt9AWXDpQ09agP6LBqyV6qs0JeXhGbTxG7howG8Kdr7mygDyzZlk0eUyPb/zsf9fvVhePHy9bE3k89RYkqEwUf5/5xKc9r0as6C7a3DyIFAprAn8wZdu1nnUzLleiOXhXPWdUgJ0a5IxpJg87RDjjGZ/6a7tZgqA6Yb2b3XQO6K8bNd/Y73HhI/hzPQdAjnqhiYFYsShwGnZm0pMLQ0rUNckC9kf46Mq0O2Jhq04tUd/gdrQJ2zpY90TwEp/8Us6w+x1tFj+jm/R500q7QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDBacsgTp6tZ7qtLhdaHQMrWybO4xX1BzkbEwqFMH6M=;
 b=X2mg6uxJ2oruJosi6osc9q9q/3exTliEKFVOApN8G1gja5ZReD+DUe9TwQfLZM7T23TxMCABubgRO0xFn6L02shQJSbBI50bIyFIw/1GHIOxHucG2+d5Ku+aCsDONIW0oyH1TcQWA7k3mRIF8LXzAtcmwemGjZjEjtp+biOK+Ms=
Received: from CY4PR12MB1287.namprd12.prod.outlook.com (2603:10b6:903:40::8)
 by CY4PR1201MB0040.namprd12.prod.outlook.com (2603:10b6:910:1b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Thu, 24 Dec
 2020 02:20:08 +0000
Received: from CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::bc0f:dd2:ef80:de2]) by CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::bc0f:dd2:ef80:de2%12]) with mapi id 15.20.3676.033; Thu, 24 Dec 2020
 02:20:08 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Chenyang Li <lichenyang@loongson.cn>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu:Fixed the wrong macro definition in
 amdgpu_trace.h
Thread-Topic: [PATCH] drm/amdgpu:Fixed the wrong macro definition in
 amdgpu_trace.h
Thread-Index: AQHW2Po2g9HrUdT/OkGoQXnRvVK/tqoFhHAA
Date: Thu, 24 Dec 2020 02:20:08 +0000
Message-ID: <CY4PR12MB12876422B7A4B93E4D9177DFF1DD0@CY4PR12MB1287.namprd12.prod.outlook.com>
References: <20201223011926.15924-1-lichenyang@loongson.cn>
In-Reply-To: <20201223011926.15924-1-lichenyang@loongson.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-12-24T02:19:39Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=b9ca3e02-d507-444f-ae1b-0000c1cd4d7a;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-12-24T02:20:05Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 96109746-5da2-41cc-a45f-00002e415244
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
dlp-product: dlpe-windows
dlp-version: 11.5.0.60
dlp-reaction: no-action
authentication-results: loongson.cn; dkim=none (message not signed)
 header.d=none;loongson.cn; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3a22792c-31fb-4410-a42c-08d8a7b26f3a
x-ms-traffictypediagnostic: CY4PR1201MB0040:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0040C97B0C057647CEAE9136F1DD0@CY4PR1201MB0040.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pvkxZAIfvnVA1bpwyW3b10Sd+J+kznxl5UvHiPAgIhg/sBeyozIkg1krrXg/0K1RKBzr5CUL1/p99tZg+T1FqTLBN2ZJ9qbSDVzfC1CzOh9zQYRNmPjkmEdVwdLPzFK8yJqChu8VnOvCrRKIl2kzcR8t9VBfmlaYfkOYxXXfUJtNmhRSkOlUBYi0NEwt9m2G1WR6ysYuMT9ny7cbdktpCqZD8/Wm88UKgNARXHAv/YIQBQZeSUGQcAYoIWX+UPUhCEW2T7Pt4v+Px+55duRl58EL+AuNdCEZK/J0LzHYaca/nQikt+mrht1mZyVJErNXfcPHKnrtMgGsOJXBQNe3aU/8BBiax6Q4+c89prAy/c3LUnzgEOzprt/ChfIllopbEeWOgEwVm5iihJu+BXvljSHIUztrdmelayMLvPqC64M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1287.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(55016002)(45080400002)(966005)(83380400001)(6506007)(316002)(53546011)(2906002)(9686003)(64756008)(5660300002)(66446008)(110136005)(7696005)(66556008)(66476007)(52536014)(76116006)(66946007)(71200400001)(478600001)(8676002)(8936002)(33656002)(86362001)(26005)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?eX0dO3sqsGbUnZ/LVyhYl3Q/ih8PAA2jYNUsGsVWm9YeIbgAw223n8NRXqFr?=
 =?us-ascii?Q?yaybQMDWGNzVU/VpupoDrZPycYpf9bPZyERJXpyfxC1tqh1zPu+cmyDFDACn?=
 =?us-ascii?Q?mmPFcf7g3teu8FS3m1Zr/U+WVEPRtQuglwEgm0sxX76UfpnkzjIx7B+d6G87?=
 =?us-ascii?Q?uozq1SuJhBF/edhxNoC+dLWGyqmveGqj5pnpJ0F2QLsnGnJyXbZK5DgiwMCz?=
 =?us-ascii?Q?f6yszuJGrD6JiwTZgSFZ9uYhOLzNtQvwIfc65vMBOdBMRK2SKUGZxyF6DzDF?=
 =?us-ascii?Q?QOgCnlrts4Uy/5XiW4KHaTp+oQXjNCCKrEwF/VAo6c/lTWYXUiykq/4O+yCF?=
 =?us-ascii?Q?sHsupkgct+4R3klLqSWxYi3QlqoLqKFYyY2FAB2eXZj/pA4zBznYfPJUwEt4?=
 =?us-ascii?Q?0XuR3D/hBV4L4ueHBHRPT4qZZ0AIwW+nDYjb719sZX3x18UBtfOE5OdVNBRp?=
 =?us-ascii?Q?R4trdBl62jKuqnQxKlxZDj4Y7XYFMzYq+qQ58q3xaInRHiFn98cOyXbiQc+K?=
 =?us-ascii?Q?t1LqSAErzMxnNeVtuLgw+mkHlyn1VUZK3sVIs5N8jflGdpxlgTm5bI5NECby?=
 =?us-ascii?Q?DAqzgDsRQttgbevPRpumaw5C9cXYcpWnfqtR0iprV031jPc0jYWGnyRCyuIj?=
 =?us-ascii?Q?E3N4NbS+V66KqB6J44bxss66XjKheDSIHT5JfACZT4RQCUu1qYSdLqoalVcq?=
 =?us-ascii?Q?ZjJ0U/VG2CBo3PeePSN5BiyhD1JF0vvHpi/Hh1rn/pG0SZfR+xA10RISSYPk?=
 =?us-ascii?Q?9+0Iwh1tNXHvvQCHSYFr1E71MIFYLAF65HkMNXNEg6xVDwm9Y/0X+GDBVhT9?=
 =?us-ascii?Q?qH7UrBo19dCaOhyGaSEfV3kJZsVG5OzDpjFS2C0Dj7u9KhY6M8JrsaKUVOMQ?=
 =?us-ascii?Q?55P7jXxKACSWd6JoZufMfYFDCSictfLiTHPsSivMdaRTlC3HKKHpFsWsR95l?=
 =?us-ascii?Q?+rR0shueEYvh53SPR32HaqdeAVz5e7raVDF6ire8ZJg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1287.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a22792c-31fb-4410-a42c-08d8a7b26f3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2020 02:20:08.4166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2AV/xTAhJGxdffzfoew029lc+iHrkK7ODUv+X6aLWL5OJ0I32+Y+g4H7jdJDcry7gLBQx6sycrhF+nXHPGlbRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0040
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

Nice catch and the patch is:

Reviewed-by: Guchun Chen <guchun.chen@amd.com>

Regards,
Guchun

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Chenyang Li
Sent: Wednesday, December 23, 2020 9:19 AM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu:Fixed the wrong macro definition in amdgpu_trace.h

In line 24 "_AMDGPU_TRACE_H" is missing an underscore.

Signed-off-by: Chenyang Li <lichenyang@loongson.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index ee9480d14cbc..86cfb3d55477 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -21,7 +21,7 @@
  *
  */
 
-#if !defined(_AMDGPU_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#if !defined(_AMDGPU_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
 #define _AMDGPU_TRACE_H_
 
 #include <linux/stringify.h>
-- 
2.29.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Cguchun.chen%40amd.com%7C8d902bda929a44a4eac508d8a7114368%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637443040220638596%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=%2ByVfo1XiGQKDHkf354Kpi2edjFzsUT3FIlAXAM6O6AE%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
