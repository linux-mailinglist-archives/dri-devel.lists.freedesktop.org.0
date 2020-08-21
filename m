Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691F124C94A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 02:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C166EA8C;
	Fri, 21 Aug 2020 00:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760058.outbound.protection.outlook.com [40.107.76.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4866EA85;
 Fri, 21 Aug 2020 00:42:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAVXYt7Nb4ysq3S3hjOdMoPQrfvIbWlzKly5iECDnkKDeEvImQY47kPujpBbv7QAmyYvz3/QlrHr4WJpknYw/ZBg3mNiKJMS6Ll4Qt9LcWSr1zPhP0+MrjyPyMGqgS+GACXq6T5ku4uPWjqj8qBZYvtqcnNzQQOF9X37TmkE3JlIRUfASzhFPKw2g49QQJ/55GOMlqY8QBhgGjHMeBTSg/4xO/bpPXNF13IHJUM/EZwVn3BVkXB6Yl+jH0oT/TUqeaqBvb9M81NvbRneBHUzpWXwhaTneBKCr0k5THjDPfKy3Wo8eL54euv7sqL6abG+Yf4bJFntW6X2CTHqgJFfKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXnBqlMTikO1Mmzej4O3q0TMlNm43vNfrW7jdDJjwTM=;
 b=m7kQ15zsElSyBXReseWbRNih4YJIbaHMkMzVyh/A2IiMxGxdnDYGhCObDHbj2nRUHoepni91qdrrQZaIPnxjpqTyLCWt2Fb72b8etiO4cEaD4110aLK9HOU4IdM8AJbrZVoXBM1E6F5+cKFpS8i8SjieiArqC6OtzFc+VzfsOVIM79Fthcr3WjvcqXy/pTjpEPNklekkIe6iU8c+MyRe79kWxyjft5dWzsznOuADAAr6DBqkxuiknxqRKNv7lrMCV4wXXfGm8RI9tblXVpTTNSa/082c43CeO6WJwLYWEBjxpK5sFCVvHWmSYLWRFzJ9qz8jB3BYz/Dzt/uBQ2RPYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXnBqlMTikO1Mmzej4O3q0TMlNm43vNfrW7jdDJjwTM=;
 b=IoswEnUECz4rGEPxuIESg4Zvfc330ttz2mcV4g93rT79+jUhgJLpVtc3NZAhz6IFjDWDgwTbFBekYAaZfH836wZ2ZsN1cK+mhkMWFIV7qgjXn/yWDutfBUXzPYV09i/5JanshobovTq/7ZlDd4ht7PbSxb5sUwS2HFZy4/8edlk=
Received: from DM5PR12MB2533.namprd12.prod.outlook.com (2603:10b6:4:b0::10) by
 DM6PR12MB4298.namprd12.prod.outlook.com (2603:10b6:5:21e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.26; Fri, 21 Aug 2020 00:42:01 +0000
Received: from DM5PR12MB2533.namprd12.prod.outlook.com
 ([fe80::b184:d0e4:c548:df63]) by DM5PR12MB2533.namprd12.prod.outlook.com
 ([fe80::b184:d0e4:c548:df63%7]) with mapi id 15.20.3305.026; Fri, 21 Aug 2020
 00:42:01 +0000
From: "Li, Dennis" <Dennis.Li@amd.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zuo, Jerry" <Jerry.Zuo@amd.com>
Subject: RE: [PATCH] drm/amd/display: remove unintended executable mode
Thread-Topic: [PATCH] drm/amd/display: remove unintended executable mode
Thread-Index: AQHWdgFN5RxpUMiy2ki/zUpsHmcnuqlBub3A
Date: Fri, 21 Aug 2020 00:42:01 +0000
Message-ID: <DM5PR12MB25339FED33ECA4DABF7830B3ED5B0@DM5PR12MB2533.namprd12.prod.outlook.com>
References: <20200819081808.26796-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200819081808.26796-1-lukas.bulwahn@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-08-21T00:41:55Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=010041bf-f40c-43f4-bec0-fc466a7b714a;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_justification: I confirm the recipients are approved for sharing this
 content
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c0598ecd-29c2-4ba8-9883-08d8456b04aa
x-ms-traffictypediagnostic: DM6PR12MB4298:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB429826441CC8CD515799B930ED5B0@DM6PR12MB4298.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3TEavBBa6SebdvOI7D2znb+0VohAEVlhwGdVDFykq/6QOoOEbZ1Yj4nLehudfbdBa3cNagVhZ4433q/FIJ+ElfXtWF8Qr7x6rz0SHkbe6t7dG5NOx8TfrT3CUGVqd5v3kU+4764NoPIdFFlI41NND75OPFncXsD/NfOe8Mnc/1PMzcV6nxWAxp+vh92sVQ+/COBaWD6MiRfXWbQ4eqnyeVLErVIC7Nn/ihUhSvaOkcxHV7Z3ra7ibaQuqr3hIWbNX/pFscHomhiknj/df3UnrQhBX7Cho/wI3+AZp6jOL7T28eftrctV9xYqouqGSXi3F7YNKJoqQDLZm+PK7wFnig==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2533.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(2906002)(33656002)(478600001)(8676002)(86362001)(4326008)(9686003)(6636002)(110136005)(55016002)(66476007)(8936002)(76116006)(66946007)(7696005)(71200400001)(54906003)(316002)(66446008)(66556008)(64756008)(83380400001)(52536014)(5660300002)(26005)(186003)(53546011)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: FIC7F8tUQblTXKwPVrT0MIrOFkY9z8oeNxZwwCZH0Tmhod7iYN/93RY5yDF3F0nu1Yd8Wl2sHCfT8aixJJdg9ea70FNXhrwJNqkPVg9JfIBRDfwNlD/Iu9MJ9tBPXAJE25ke8Pg1srbhxlfWHHYD6SEZPabvrFLCb6Nz8//hg7YDGQhkbYlb1934yH606D6spoRBB6RkY6xMxV47akVf2bbUsSKBvaatwx5dMGALpWrEnhY40BXP/QesgWa9LHMLSoa6C0DBgk9zv4hjcLmc0PKwUcqi3OV8Pzyquv65Sy7jp3CV/MwPPT6nzJUK2ItRKmy9ab1m5O28/b8ZXCm/JHXAr0eamIDz4cuhUXj63QicZRM56XdAHQIUlpBovOODDGPtLrw3Dejsy9vovJQTEFGtxYQG8+Ojpb9e00JUstBWK3gj0PoFRydNboOrThz0GAE1uc0y+2VxxMQcBQrGfq/l6lHblGfuJ/FrVF1VLUB8RhJR+2lBAx1UbdoMwGbtgx6CcmzKfZF5qIe8B4UjBbwJxoQSIXTwCJUevoS2bIT4OoRP+HdrkbIx8mdtneuofcWmrdpiIlpC3UnKYdq1cEjO7ZBGVvFP1jaHsuprpo4w0dh6x6Pu6t6yB+5pcv7cwbwaarxN8/JJrb7j82/lyA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2533.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0598ecd-29c2-4ba8-9883-08d8456b04aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2020 00:42:01.3902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wLp5NiriZszzbTYW9MEW1ynq+5CYNuIf65tCGu7YDXaLeLMMhLIMnS79tCTA0PPZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>, "Wu, Hersen" <hersenxs.wu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Hi, Lukas,
      Thanks for your fix. This issue was caused by that I modified these files in windows system with Samba. I will take care in the future. 

Best Regards
Dennis Li
-----Original Message-----
From: Lukas Bulwahn <lukas.bulwahn@gmail.com> 
Sent: Wednesday, August 19, 2020 4:18 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Li, Dennis <Dennis.Li@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Chen, Guchun <Guchun.Chen@amd.com>; Wu, Hersen <hersenxs.wu@amd.com>; Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] drm/amd/display: remove unintended executable mode

Besides the intended change, commit 4cc1178e166a ("drm/amdgpu: replace DRM prefix with PCI device info for gfx/mmhub") also set the source files mmhub_v1_0.c and gfx_v9_4.c to be executable, i.e., changed fromold mode
644 to new mode 755.

Commit 241b2ec9317e ("drm/amd/display: Add dcn30 Headers (v2)") added the four header files {dpcs,dcn}_3_0_0_{offset,sh_mask}.h as executable, i.e., mode 755.

Set to the usual modes for source and headers files and clean up those mistakes. No functional change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20200819

Alex, Christian, please pick this minor non-urgent cleanup patch.

Dennis, Jerry, please ack.

Dennis, Jerry, you might want to check your development environment introducing those executable modes on files.

 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c                         | 0
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c                       | 0
 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_0_offset.h   | 0
 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h  | 0  drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_3_0_0_offset.h  | 0  drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_3_0_0_sh_mask.h | 0
 6 files changed, 0 insertions(+), 0 deletions(-)  mode change 100755 => 100644 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c
 mode change 100755 => 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
 mode change 100755 => 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_0_offset.h
 mode change 100755 => 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h
 mode change 100755 => 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_3_0_0_offset.h
 mode change 100755 => 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_3_0_0_sh_mask.h

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c
old mode 100755
new mode 100644
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
old mode 100755
new mode 100644
diff --git a/drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_0_offset.h
old mode 100755
new mode 100644
diff --git a/drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h
old mode 100755
new mode 100644
diff --git a/drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_3_0_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_3_0_0_offset.h
old mode 100755
new mode 100644
diff --git a/drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_3_0_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_3_0_0_sh_mask.h
old mode 100755
new mode 100644
--
2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
