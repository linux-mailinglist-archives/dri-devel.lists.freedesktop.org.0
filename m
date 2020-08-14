Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C5A244FB2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 23:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0CF6E2A8;
	Fri, 14 Aug 2020 21:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2056E2A8;
 Fri, 14 Aug 2020 21:59:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bElEX/E+V+SEsvLo3I8H2GIZSB4jhU8so8P7V1adwsUtDZR0UgFmXXh0POEGLda/yb5szfwfig26eHSOTuAPRFSFPi0EW689bs2+l985Cj7OG//inRO6ZdwL3X7TrwjKpYl1BfkmsyNvd85eC7i0OpwIPWmIhaiwt+UK8tmMxNfsrSochoUaabYg2zOFep/lUIc7FTg+wsOrFo6YPXaNVqyS+/iU5vHAfQItHdcWH5f1rUeIxUFvjZak18G2Z+y17BPeoawgBxRJhj7TNIRBdcyNVULkzMHk5IS1apcvl4jwZ6aBr61fPFq44EGjjJHD+2h/X2niZw+UXBBhFmq+tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imeRbCW5vM3WBPNHz0wA4MGXkFHmNwdn4JmNQu8HuR0=;
 b=mxAJpu5scDDLNcWnQUD2qVRDz0SbPH5bdZQVzB65CPX9KfOMX8GF/dCQb6NHU0q4dE5oza6Ip6IyjV3T5mNdpI3gWopcqc9VUJVkeaIplkVuTscla5A44TfgXGhuWsFsuUU3WayN7cS0/xmINJYH+SM8MPrSO1l8fQMHM4X4AWV0XFDuuP+DBEM+KFW747ponVFPoZZSUQa9Uo5AckWyQfrk+tFJdC+kLhH5I6CYJp+rAuC5PoxKZUBBXnaRHOKOOs/5ZVUye4F2HVMketNzWd2Fo2cxZ37E2nbOOprAVM3auBBFbQfEoP9tWQohaPLtGZp8x6adnfYsSoc458eDHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imeRbCW5vM3WBPNHz0wA4MGXkFHmNwdn4JmNQu8HuR0=;
 b=jMOSRxhcQg/AbYmkUpeSn26YupqRY1/gMXdXZzctapoDInotDLuSpu4YkUfz/wOhLzySXm2oiczv3v/vU2Fil+E2i5b7miETYASzM0N5EwMz7/EUwQDM7kp9OlvsmvNL6hZOYXUaN4tCyjbwuhS/vqOAha4ZILI9+d2/hOANBBg=
Received: from MW3PR12MB4554.namprd12.prod.outlook.com (2603:10b6:303:55::21)
 by MWHPR1201MB0253.namprd12.prod.outlook.com (2603:10b6:301:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Fri, 14 Aug
 2020 21:59:24 +0000
Received: from MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::8468:a7f8:d931:ccac]) by MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::8468:a7f8:d931:ccac%5]) with mapi id 15.20.3283.022; Fri, 14 Aug 2020
 21:59:24 +0000
From: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>, "Lipski, Mikita"
 <Mikita.Lipski@amd.com>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/dp_mst: Don't return error code when crtc is null
Thread-Topic: [PATCH] drm/dp_mst: Don't return error code when crtc is null
Thread-Index: AQHWclybDoXzoVuz9kKvcJQdF8P9L6k33fUAgAAQvXeAACXGYg==
Date: Fri, 14 Aug 2020 21:59:24 +0000
Message-ID: <MW3PR12MB455452718EC006F15D6C5963F9400@MW3PR12MB4554.namprd12.prod.outlook.com>
References: <20200814170140.24917-1-Bhawanpreet.Lakha@amd.com>,
 <97348c62b6024e0aa8f8d537e3ec50b4@intel.com>,
 <MW3PR12MB4554A2B48BAB3A196CE9FFB6F9400@MW3PR12MB4554.namprd12.prod.outlook.com>
In-Reply-To: <MW3PR12MB4554A2B48BAB3A196CE9FFB6F9400@MW3PR12MB4554.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-08-14T21:59:23.527Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [173.32.142.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2213a636-7109-449d-4e49-08d8409d4e6a
x-ms-traffictypediagnostic: MWHPR1201MB0253:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1201MB025334BC7C83BB5CBC43D236F9400@MWHPR1201MB0253.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XU4c5h8IIiCYvlQiCZDHZ7/LDCBCvnwN2sqRn6no5R0BLtw1Q29fVUjMrWpO+9RelhothhoeGA9SDEARuVNEcosChiIEJJj+ydjDaD/4+iHTKSdsKwa8kka4cE9VjpMSIzyaXGq/AW22yvbkWViYgBZ6qtTlEbj3ae8Ir5VJHFt4gWXTklDbugom6Tr2HX9lRPdb1WFp4AlQCt/ftNM47xMgC7iG76GSBxYvRIWUxvoXXm0XgfkYluDrnc0aIZ2K6xU0TTe74AWHn+LzM+mtC74PfdbJcHF3hKQgd+O1d+CxHIfbmvtgnmgOY4R03y13X7Q2wvO6JwF/L8TVHZ1qgRyS2aiMQMyWbqOo6YiSssI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4554.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(64756008)(66946007)(86362001)(66556008)(9686003)(76116006)(83380400001)(53546011)(8676002)(8936002)(19627405001)(26005)(66476007)(6506007)(66446008)(4326008)(6636002)(54906003)(186003)(2940100002)(52536014)(45080400002)(55016002)(7696005)(110136005)(5660300002)(2906002)(71200400001)(33656002)(316002)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 1Q2GUpblMGJUj+IjOwovr3GuYw7bXUaa2S08TVljjTvayMlG7LfHyJmHm2LZqQX6d5gx5e7fUfvVu+Ddj8NPdLULGrMHP7fNecoe0xVUa3XNyUt/5qQK4KMv1sz46ZFNdgauUAmdabUMWBdYv+d5NrbM8mBk5JEAunPC32Ah6tcWKl0miIdFtfMb4l1/SL23/XEcFf2ce7lg5f+ljg+5Gor2V2Gz0z1RunKRV5RbC2i+wCMoqL9HcliU1Y4ZZ68ZTFS3NJI7aJwfwGruf7Xbb318tGUtpRvieG73vuS6qT1/QFmQHMhjA6RLeHCJOk9O04sS0y9YN31A7JluLcDGX2R4r8TGRFueDKKFvPmgDszLVwlDNYIxahHe0QCkpOyx6zMBBqiHyzrrUK5PHr0Q7MkZjJjoqg5gki7x5/VXUkoXYPQJ5zR+oLnxm6X0W/+eeBqp9TOnYExDm66ObtfIhJ7wDVKlGBp2QRAefJln4jw/lRTLHGbG0KAUMm0H0BBmo+Y1r1eh6OF9hVaEbfbam5p15+g6QkMnnji2Z6GdJYdoRPJQF5cBNBzh3w0GOZ9l5p+KNdFoNlCqGhrOERAU2NMpAsGe7AUZmq2b9hkYWfTRlTdjwzcFY65nbfEXpqPeArC6nvh5Bcp+cYxIXE+Azw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4554.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2213a636-7109-449d-4e49-08d8409d4e6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 21:59:24.1213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tcO1YmNyD6ucyWoa4XBMJZdKvICDuZ/txSM6uzk6JrpNKQ6EQoH9P1aU7HHpw6jH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0253
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0641973229=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0641973229==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_MW3PR12MB455452718EC006F15D6C5963F9400MW3PR12MB4554namp_"

--_000_MW3PR12MB455452718EC006F15D6C5963F9400MW3PR12MB4554namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

I took a closer look at this and there seems to be an issue in the function=
.

Crtc being null is a valid case here. The sequence that leads to this is, u=
nplug -> disable crtc/release vcpi slots then hotplug. The issue is that po=
s->port is not guaranteed to be released in drm_dp_atomic_release_vcpi_slot=
s() so list_for_each_entry(pos, &mst_state->vcpis, next) {}  might still it=
erate thought it.

So, when a hotplug is done we still loop through the old port which has por=
t! =3D null, crtc =3D null, and vpci =3D 0. I didn't find anything that I c=
an use to remove the port from the list. So, a potential solution to this w=
ould be to add a check for vpci =3D 0 and skip that port.

Thoughts/Suggestions?

Bhawan



________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Lakha, B=
hawanpreet <Bhawanpreet.Lakha@amd.com>
Sent: August 14, 2020 2:52 PM
To: Ruhl, Michael J <michael.j.ruhl@intel.com>; Lipski, Mikita <Mikita.Lips=
ki@amd.com>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Deucher, A=
lexander <Alexander.Deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/dp_mst: Don't return error code when crtc is null


pos->port->connector?
This is checking the crtc not the connector. The crtc can be null if its di=
sabled.

Since it is happening after a unplug->hotplug, I guess we are missing somet=
hing in the disable sequence and the old connector is still in the list.

Bhawan

>>-----Original Message-----
>>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>>Bhawanpreet Lakha
>>Sent: Friday, August 14, 2020 1:02 PM
>>To: mikita.lipski@amd.com; nicholas.kazlauskas@amd.com;
>>alexander.deucher@amd.com
>>Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>; dri-
>>devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>Subject: [PATCH] drm/dp_mst: Don't return error code when crtc is null
>>
>>[Why]
>>In certain cases the crtc can be NULL and returning -EINVAL causes
>>atomic check to fail when it shouln't. This leads to valid
>>configurations failing because atomic check fails.
>
>So is this a bug fix or an exception case, or an expected possibility?
>
>From my reading of the function comments, it is not clear that pos->port->=
connector
>might be NULL for some reason.

>A better explanation of why this would occur would make this a much more
>useful commit message.
>

>My reading is that you ran into this issue an are masking it with this fix=
.
>
>Rather than this is a real possibility and this is the correct fix.
>
>Mike
>
>>[How]
>>Don't early return if crtc is null
>>
>>Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
>>---
>> drivers/gpu/drm/drm_dp_mst_topology.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
>>b/drivers/gpu/drm/drm_dp_mst_topology.c
>>index 70c4b7afed12..bc90a1485699 100644
>>--- a/drivers/gpu/drm/drm_dp_mst_topology.c
>>+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
>>@@ -5037,8 +5037,8 @@ int drm_dp_mst_add_affected_dsc_crtcs(struct
>>drm_atomic_state *state, struct drm
>>
>>                crtc =3D conn_state->crtc;
>>
>>-              if (WARN_ON(!crtc))
>>-                      return -EINVAL;
>>+              if (!crtc)
>>+                      continue;
>>
>>                if (!drm_dp_mst_dsc_aux_for_port(pos->port))
>>                        continue;
>>--
>>2.17.1
>>
>>_______________________________________________
>>dri-devel mailing list
>>dri-devel@lists.freedesktop.org
>>https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01%7CBhaw=
anpreet.Lakha%40amd.com%7C0f5d55c551644fef3df908d840787b3e%7C3dd8961fe4884e=
608e11a82d994e183d%7C0%7C0%7C637330233520819407&amp;sdata=3D5N%2BBb0Qp3bd5z=
ANfxovb%2BrVLAGnbP1sjyw3EeCHXj2w%3D&amp;reserved=3D0

--_000_MW3PR12MB455452718EC006F15D6C5963F9400MW3PR12MB4554namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0078D7;margin:15pt;" al=
ign=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
I took a closer look at this and there seems to be an issue in the function=
. <br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Crtc being null is a valid case here. The sequence that leads to this is, u=
nplug -&gt; disable crtc/release vcpi slots then hotplug. The issue is that=
 pos-&gt;port is not guaranteed to be released in
<b>drm_dp_atomic_release_vcpi_slots()</b> so <b>list_for_each_entry(pos, &a=
mp;mst_state-&gt;vcpis, next) {}&nbsp;
</b>might still iterate thought it.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
So, when a hotplug is done we still loop through the old port which has por=
t! =3D null, crtc =3D null, and vpci =3D 0. I didn't find anything that I c=
an use to remove the port from the list. So, a potential solution to this w=
ould be to add a<span> check for vpci
 =3D 0 and skip that port.<br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span></span><span></span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thoughts/Suggestions?<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Bhawan<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Lakha, Bhawanpreet &lt;Bhaw=
anpreet.Lakha@amd.com&gt;<br>
<b>Sent:</b> August 14, 2020 2:52 PM<br>
<b>To:</b> Ruhl, Michael J &lt;michael.j.ruhl@intel.com&gt;; Lipski, Mikita=
 &lt;Mikita.Lipski@amd.com&gt;; Kazlauskas, Nicholas &lt;Nicholas.Kazlauska=
s@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt=
;<br>
<b>Subject:</b> Re: [PATCH] drm/dp_mst: Don't return error code when crtc i=
s null</font>
<div dir=3D"ltr">&nbsp;<br>
<div>
<div>
<div><br>
</div>
<div>pos-&gt;port-&gt;connector?</div>
<div>This is checking the crtc not the connector. The crtc can be null if i=
ts disabled.<br>
</div>
<div><br>
</div>
<div>
<div>Since it is happening after a unplug-&gt;hotplug, I guess we are missi=
ng something in the disable sequence and the old connector is still in the =
list.<br>
</div>
</div>
<div><br>
</div>
<div>Bhawan</div>
<div><br>
</div>
<div>&gt;&gt;-----Original Message-----<br>
</div>
<div>&gt;&gt;From: dri-devel &lt;dri-devel-bounces@lists.freedesktop.org&gt=
; On Behalf Of</div>
<div>&gt;&gt;Bhawanpreet Lakha</div>
<div>&gt;&gt;Sent: Friday, August 14, 2020 1:02 PM</div>
<div>&gt;&gt;To: mikita.lipski@amd.com; nicholas.kazlauskas@amd.com;</div>
<div>&gt;&gt;alexander.deucher@amd.com</div>
<div>&gt;&gt;Cc: Bhawanpreet Lakha &lt;Bhawanpreet.Lakha@amd.com&gt;; dri-<=
/div>
<div>&gt;&gt;devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org</di=
v>
<div>&gt;&gt;Subject: [PATCH] drm/dp_mst: Don't return error code when crtc=
 is null</div>
<div>&gt;&gt;</div>
<div>&gt;&gt;[Why]</div>
<div>&gt;&gt;In certain cases the crtc can be NULL and returning -EINVAL ca=
uses</div>
<div>&gt;&gt;atomic check to fail when it shouln't. This leads to valid</di=
v>
<div>&gt;&gt;configurations failing because atomic check fails.</div>
<div>&gt;</div>
<div>&gt;So is this a bug fix or an exception case, or an expected possibil=
ity?</div>
<div>&gt;</div>
<div>&gt;From my reading of the function comments, it is not clear that pos=
-&gt;port-&gt;connector</div>
<div>&gt;might be NULL for some reason.</div>
<br>
<div>&gt;A better explanation of why this would occur would make this a muc=
h more</div>
<div>&gt;useful commit message.</div>
<div>&gt;</div>
<div><br>
</div>
<div>&gt;My reading is that you ran into this issue an are masking it with =
this fix.</div>
<div>&gt;</div>
<div>&gt;Rather than this is a real possibility and this is the correct fix=
.</div>
<div>&gt;</div>
<div>&gt;Mike</div>
<div>&gt;</div>
<div>&gt;&gt;[How]</div>
<div>&gt;&gt;Don't early return if crtc is null</div>
<div>&gt;&gt;</div>
<div>&gt;&gt;Signed-off-by: Bhawanpreet Lakha &lt;Bhawanpreet.Lakha@amd.com=
&gt;</div>
<div>&gt;&gt;---</div>
<div>&gt;&gt; drivers/gpu/drm/drm_dp_mst_topology.c | 4 ++--</div>
<div>&gt;&gt; 1 file changed, 2 insertions(+), 2 deletions(-)</div>
<div>&gt;&gt;</div>
<div>&gt;&gt;diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c</div>
<div>&gt;&gt;b/drivers/gpu/drm/drm_dp_mst_topology.c</div>
<div>&gt;&gt;index 70c4b7afed12..bc90a1485699 100644</div>
<div>&gt;&gt;--- a/drivers/gpu/drm/drm_dp_mst_topology.c</div>
<div>&gt;&gt;+++ b/drivers/gpu/drm/drm_dp_mst_topology.c</div>
<div>&gt;&gt;@@ -5037,8 +5037,8 @@ int drm_dp_mst_add_affected_dsc_crtcs(st=
ruct</div>
<div>&gt;&gt;drm_atomic_state *state, struct drm</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;crtc =
=3D conn_state-&gt;crtc;</div>
<div>&gt;&gt;</div>
<div>&gt;&gt;- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (WARN_ON(=
!crtc))</div>
<div>&gt;&gt;- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;return -EINVAL;</div>
<div>&gt;&gt;+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!crtc)</=
div>
<div>&gt;&gt;+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;continue;</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!d=
rm_dp_mst_dsc_aux_for_port(pos-&gt;port))</div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;continue;</div>
<div>&gt;&gt;--</div>
<div>&gt;&gt;2.17.1</div>
<div>&gt;&gt;</div>
<div>&gt;&gt;_______________________________________________</div>
<div>&gt;&gt;dri-devel mailing list</div>
<div>&gt;&gt;dri-devel@lists.freedesktop.org</div>
<div>&gt;&gt;https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;data=
=3D02%7C01%7CBhawanpreet.Lakha%40amd.com%7C0f5d55c551644fef3df908d840787b3e=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637330233520819407&amp;amp;sd=
ata=3D5N%2BBb0Qp3bd5zANfxovb%2BrVLAGnbP1sjyw3EeCHXj2w%3D&amp;amp;reserved=
=3D0&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;&nbsp; <br>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MW3PR12MB455452718EC006F15D6C5963F9400MW3PR12MB4554namp_--

--===============0641973229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0641973229==--
