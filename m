Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7D577E2D5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 15:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D8C10E0D5;
	Wed, 16 Aug 2023 13:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AB310E0C1;
 Wed, 16 Aug 2023 13:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvAd4NZ+AQEfiza4VzPDPzCOiMctt8BIZngHA6BVWsjCtrEOKJ34tIm1vozyJg5/h5iMwdOTfolk0oBT3tTKHGcokzdQkoziawKnVaSJpSEw4sKWt25bYlE9JxqQskzUtxTypZwlRoJATmIMpsoHP0wSP16yfJFpApv9zzXS2v30EbC3u8kCTZv8CuulqfA63jZeN+yjs9++ZSYjKK7oYn2iDXm8TATOnGHbTs9ZUFCFfvr+eMFHwo4ymVX1aZzuMTfJfD5cZJ4NGatStq78WxnyoDcH9EByEcHjLsWcw/OoU61FdNbwNbwhc41GBdZHrWuT7ZPnLJsSHbxX5tU3tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOQfOc4Yxfr7it5mZvy4N4esSHvp0aTLX6/pW7iBxyA=;
 b=OCXOCcQ561xlWn/ttkMFf2jn8x3dEWrEREfA0ahkrSZxOuJHUNjpQYy221BpArKGScgnU/hVi+eO8UKJmsTPRuM7Gx9UjGBtZezLjHyV39iBTF31TzyoOntlVw7C9uhEQL6zAs6Q8I3VjAlRY+F5qPivK0cSEZLIq7oRaLtXfbZnCdwXgPDCvCx7UnVf5MLjUCQpjODe/GYdCCM/TBVfaRQiERnRibv4pNEoldMvuSU1ps1pEdEeRTMgRgO12kwRo3R2F3nEqB2zR5/SkJpLAAb8nLYiZ/YYrpPApBdV5DlC+WiN8Eqs2zjJS6pSObXjwd6BLlHkdf5cbk4phL9HiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOQfOc4Yxfr7it5mZvy4N4esSHvp0aTLX6/pW7iBxyA=;
 b=UoJJR5sRBhJ8tM2MRZBUoCq6qUCmN1KhzE4YTJYspJ9AFxX/GtsbtxLxA1ZGz5/Xru0wm4UZoxEqKVTe9sQ/K2qC0DtsJRig5uyc+hXJIm7NzLhxzdFZg0V0fekDhwkNClJS6Y6e5zOdq3vNynJ1cXTA/hiQkDity6VsNd3EAVY=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by DS7PR12MB6005.namprd12.prod.outlook.com (2603:10b6:8:7c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Wed, 16 Aug
 2023 13:40:41 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::bcfa:7757:68bd:f905]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::bcfa:7757:68bd:f905%5]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 13:40:41 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] Documentation/gpu: Update amdgpu documentation
Thread-Topic: [PATCH] Documentation/gpu: Update amdgpu documentation
Thread-Index: AQHZz/WgIsE05G/et0mmwgz++XwXQK/s7oDS
Date: Wed, 16 Aug 2023 13:40:41 +0000
Message-ID: <BL1PR12MB51441C9445438AFC6F37A6E5F715A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20230816035603.690383-1-lijo.lazar@amd.com>
In-Reply-To: <20230816035603.690383-1-lijo.lazar@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-16T13:40:40.724Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|DS7PR12MB6005:EE_
x-ms-office365-filtering-correlation-id: f23be301-7ff6-4de6-96de-08db9e5e6236
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9FLjPQ657IkJhk9IHaDBqTD+JIDy2tBIzxRqYfWCQ8q84mSkCgR19qV9BmPUqVsHrZwP8kgnuT57v/o/nDVxqVw4fQQKkzW43cwZZimw6zKT9d+vHR6mssMommyBhTgIeQIbzUR0eNLlvLGsFOt9dxfREI1domlJ8pSCAEFz+Bz0uJ3ge90nwIDhlCtSQdHUPx2ongWqra4Sd5bkF/JANavebv+80j4hNntlv4FzCOZFfRrIGvhDSDc9bzdLlVBTmCnTyzTMwJGxsVgdNkOAFIOA6WyXkD6VRjlLElU0TRcqBOTcFJtRJzpmTzqkSM2GHDcr3eWOJBbBpb0ZpZt9excYlh9/MSCgU11qlQqzu666+YnNTzqIjmlz3BtVo8BNq67fy/pD1Vx6DTqQ3MgzMIEvjEfQp3pAZi3xWcyRujpzEqVEUW8DaG9QRCVTepEqZmYV1RdKy3KLGB0SNqzHBn+cl/6qgASXGphcSUwBgGQtzbt6uHfqShzACe5vp7zJTDyY//BcWv6v3Eu1srmodjOGDzwInHhv2hLb64ZWQDw1kR2/eC0K+QCE9l4N8eL/j0/732gc3oI9BOmEkYb6sC9XkAlIgCoptm+8zz+BM6tHRW3i7pIwWr45hPIlJwoQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(54906003)(76116006)(66946007)(64756008)(110136005)(66476007)(66556008)(66446008)(122000001)(19627405001)(41300700001)(52536014)(5660300002)(38070700005)(38100700002)(8676002)(4326008)(8936002)(2906002)(15650500001)(83380400001)(26005)(55016003)(478600001)(86362001)(9686003)(53546011)(33656002)(7696005)(6506007)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IoHkWa6V/VOVohVjBGLTOlKgVrmpHSkKg7p19xNMIlcBvx9qFixpZ/ra0zUg?=
 =?us-ascii?Q?7DFvMGDF5/nx9BHw+XrQYnjXDB1+EqlIFdDG3HL43GQ44gb+qAeYDBSex8tm?=
 =?us-ascii?Q?1w6xwxXXKMfWel8NsibDgUTEfO0SdSy4z+pp2+RhAFsFGZ5+9Ydz+GATBSwL?=
 =?us-ascii?Q?Eb/bZpwRAIKUCPRR9btUvnwR1DOy0GsAl6E/K3BRXBYFY82q0cdNek8Vt582?=
 =?us-ascii?Q?MST7zv3t6ohY6xCAVa4NtHtm5emTX4k9l3KZ35+Ntrvjmmj/wzQNyi6sKtuL?=
 =?us-ascii?Q?xAi3PlRnwJS1NOQtgsOpt+b9EaNyGeHVS/10YDN3Z2440NTDkDszo6SgxsuB?=
 =?us-ascii?Q?cBkZ+DtOS59hUAJJS9kiVAzASZ+WxlpB/R3V3UZCmkFTd12ujJoYQTyb4oH4?=
 =?us-ascii?Q?jNoaNECPZpw0uD0dfHnWJJAfyhVDx5mT9kRrA5au+W3V47aLxQTwZqqZ9gtD?=
 =?us-ascii?Q?+M/KEEXw7Sgizbs6SnPrChNYzxdUZyCZFjahY9sJTQFWFxQZQRJRK8AzEjVT?=
 =?us-ascii?Q?3S7tN+OVkOqRUyDyeE8+7tI0drD5rOwcefhhWBtxYCfPeeT9oF3CBYFkTwBz?=
 =?us-ascii?Q?+eqmXRI57Upr7f9G3ARiPE9mFvfB/NKRiWdbyNfOJCZrOXZuQX31zfUfWwNK?=
 =?us-ascii?Q?XVAAPl3bc0qbz3GSZKSseiUOapwNg7pPJVzllwzssvP+z5Iy51YBEiWCs2DF?=
 =?us-ascii?Q?iU+CQa0Jf3Lhxn6kB3TkbJB+RdZUOlvxrA3PEBfYsOHFEXE0I/CnSuyyBJkp?=
 =?us-ascii?Q?Yrm9nyq2Wu6gjBZ9aq0gdbvL2mVJe7M02osG7SSbqtQKj/A50JSd03in7wpU?=
 =?us-ascii?Q?d5Uo8PDN5aOVhn/qCKyi2Z3xm9ikb75CIlp4HhEqZUs/xQHjYQB+OTd/+b7h?=
 =?us-ascii?Q?D9nsVdb4H1rJz2qTuZJuSBXwFR8SIz92srLJDE7AjwaNSuvUK2gOotHOD8B1?=
 =?us-ascii?Q?ZUHtVgMI151TLlA8HRkZmBEMqDWWu4p1yP1KTGiQKR3WtUXHzjw0304M+DSG?=
 =?us-ascii?Q?o8BpPxfcB87tkMAhcebZs6w0C53ybij0eHPAbJoc2V60VdwnpXC+aHk/I5Lf?=
 =?us-ascii?Q?UCWNwymhOZi6SrXWoKsuCkRERodeCLoIJWpdzskj0YLW97ZV4MnteWUdzO8s?=
 =?us-ascii?Q?narBCsjxMnDaJ8Kh2NzrmnqE4AuAfTNy6Ynom1aRF5uOZm9FtzUFD/8D46Im?=
 =?us-ascii?Q?wWfS1A8RrRnC7LC9nMniuVHHATgaFFe3f1XI5g1U6rwnnf3beHKHWn6G0Kfw?=
 =?us-ascii?Q?xylXhHfKYyK2Ze1IxmtsISNhbf3YNRD5atnvZ6yl5JRGVwS/vZcnL4rwmsyl?=
 =?us-ascii?Q?9rQOIvHg4voS6111CK7HbvMpn52uZEKVWscsp7S/x1LP8cIORTcTO8G5IYfm?=
 =?us-ascii?Q?cmfy8CE/7b73WCldKBs7+wYLw4jsGNVoEiAYajRGitE8eW1yvCx0/IRSBrrs?=
 =?us-ascii?Q?p3SA0VuZpiuqTl2IphtyagLfqgPyDwN3PzfFKVnX4/s8YUtIqsvC2LTmIhAI?=
 =?us-ascii?Q?yyiN7KqhYTqr9i/wC6FLfJB7huH5kpAWxRTMw9XOI+7mhOgToPxwTfLC2jrG?=
 =?us-ascii?Q?l0gpRq+fT7/GZq0auBE=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB51441C9445438AFC6F37A6E5F715ABL1PR12MB5144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f23be301-7ff6-4de6-96de-08db9e5e6236
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 13:40:41.4688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zo+aRkiSjw90Ll5s6SBwOlWTlbGe4TIPmjtfTQjOsYttJPtf7yBQV71zgGRkUXkcag/nehuF61ivt1yAkuoMPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6005
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
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BL1PR12MB51441C9445438AFC6F37A6E5F715ABL1PR12MB5144namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: Lazar, Lijo <Lijo.Lazar@amd.com>
Sent: Tuesday, August 15, 2023 11:56 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Zhang, Hawking <Hawking.Zhang@amd.com>; Deucher, Alexander <Alexander.D=
eucher@amd.com>; sfr@canb.auug.org.au <sfr@canb.auug.org.au>; airlied@redha=
t.com <airlied@redhat.com>; dri-devel@lists.freedesktop.org <dri-devel@list=
s.freedesktop.org>
Subject: [PATCH] Documentation/gpu: Update amdgpu documentation

7957ec80ef97 ("drm/amdgpu: Add FRU sysfs nodes only if needed") moved
the documentation for some of the sysfs nodes to amdgpu_fru_eeprom.c.
Update the documentation accordingly.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
---
 Documentation/gpu/amdgpu/driver-misc.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu/a=
mdgpu/driver-misc.rst
index be131e963d87..26334e54447b 100644
--- a/Documentation/gpu/amdgpu/driver-misc.rst
+++ b/Documentation/gpu/amdgpu/driver-misc.rst
@@ -11,19 +11,19 @@ via sysfs
 product_name
 ------------

-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
    :doc: product_name

 product_number
 --------------

-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
    :doc: product_name

 serial_number
 -------------

-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
    :doc: serial_number

 unique_id
--
2.25.1


--_000_BL1PR12MB51441C9445438AFC6F37A6E5F715ABL1PR12MB5144namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Lazar, Lijo &lt;Lijo.=
Lazar@amd.com&gt;<br>
<b>Sent:</b> Tuesday, August 15, 2023 11:56 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Deucher, Alexander=
 &lt;Alexander.Deucher@amd.com&gt;; sfr@canb.auug.org.au &lt;sfr@canb.auug.=
org.au&gt;; airlied@redhat.com &lt;airlied@redhat.com&gt;; dri-devel@lists.=
freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Subject:</b> [PATCH] Documentation/gpu: Update amdgpu documentation</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">7957ec80ef97 (&quot;drm/amdgpu: Add FRU sysfs node=
s only if needed&quot;) moved<br>
the documentation for some of the sysfs nodes to amdgpu_fru_eeprom.c.<br>
Update the documentation accordingly.<br>
<br>
Signed-off-by: Lijo Lazar &lt;lijo.lazar@amd.com&gt;<br>
---<br>
&nbsp;Documentation/gpu/amdgpu/driver-misc.rst | 6 +++---<br>
&nbsp;1 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu/a=
mdgpu/driver-misc.rst<br>
index be131e963d87..26334e54447b 100644<br>
--- a/Documentation/gpu/amdgpu/driver-misc.rst<br>
+++ b/Documentation/gpu/amdgpu/driver-misc.rst<br>
@@ -11,19 +11,19 @@ via sysfs<br>
&nbsp;product_name<br>
&nbsp;------------<br>
&nbsp;<br>
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c<br>
&nbsp;&nbsp;&nbsp; :doc: product_name<br>
&nbsp;<br>
&nbsp;product_number<br>
&nbsp;--------------<br>
&nbsp;<br>
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c<br>
&nbsp;&nbsp;&nbsp; :doc: product_name<br>
&nbsp;<br>
&nbsp;serial_number<br>
&nbsp;-------------<br>
&nbsp;<br>
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c<br>
&nbsp;&nbsp;&nbsp; :doc: serial_number<br>
&nbsp;<br>
&nbsp;unique_id<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BL1PR12MB51441C9445438AFC6F37A6E5F715ABL1PR12MB5144namp_--
