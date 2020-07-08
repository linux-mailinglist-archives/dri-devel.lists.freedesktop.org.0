Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A402189E5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 16:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E2B6E1B9;
	Wed,  8 Jul 2020 14:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289C86E0FE;
 Wed,  8 Jul 2020 14:15:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JU1ICW1wrPPUkKEugGvx7D2vHv6OgYCbMHtT+Yb+W9vDuV31t27ltnmlOheMvU7PANkjVfhgKTTFF3fmhx6xoGnWt/pfn6Giy/GeMN+YYGKWybL+xrLBDlArgf0nZgf9Y8YUOkc/4LLAZafn8poMyYBt0CV61yjeARTm0PJZaJF2ThdVrFTfNhTM7CArgDxkY59f68pk7BTJPyGdB/t7YpjN++ZvW4uWFhyryxWuZXW1NlZdl2zkC7T0w+f0L9bpdJtxXnUVWyXBzwF+IBOJi2E7CIdAPgGcQzF994K9Wsiyx+TG4s/RyK+82gJU/zoPEjY2rKXZEBcp3NIWZEQQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVDqfgz7qexdySD1c8h0k5gnxzIgEWBZQmrqwTR4UEI=;
 b=AT25ZL9wvMlEi5OasTe0+43Bn2M0oUe54LjY0jWWPMEZWohWAQZf9mcmRyoUcA6DJ8sJo375x0fm0ac/zGesK5we6xfLcXLSZm3Z3nL7VNU4w8g8rWqAegaZNsUGfkFRbpjS3LYQE8XrP+atGeXq1Lqw+NtOd5ZB3SNX7lqeojq1Xtx9iZJTOFSM1C5hyfVCQKtLGb60IR9Gu72fLm72KI+dzqb70jbEOt4MRHxkppzgnGoJkVAiRq6QDeZ3t8pxNH41WI9rDAJIa0VZ/W6hcbOapAXuiZXMExYhwYLpCh6rzjgr3JssLupr+fdAS9exLLuGXGrUsP0l4nKPauBEWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVDqfgz7qexdySD1c8h0k5gnxzIgEWBZQmrqwTR4UEI=;
 b=PfnjRdMsKF4H9tpHuGB/gLThXD+gACR87MG/izh0JgLoj8JYwu0TWlU1358UMN+ZGO9EOkjv2YoAsB+xXv3ZDgKorSQLM0pALqIpiPlhs1UrV7NcXNmZXcB1yfI26jMl6wcYYkhOlGWN6i9yABMn/ktqsedDCYcjkzd4NaBYx+k=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Wed, 8 Jul
 2020 14:15:34 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::c8b3:24f3:c561:97d9]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::c8b3:24f3:c561:97d9%6]) with mapi id 15.20.3174.022; Wed, 8 Jul 2020
 14:15:34 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Aaron Ma <aaron.ma@canonical.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mapengyu@gmail.com" <mapengyu@gmail.com>
Subject: Re: [PATCH] drm/amd/display: add dmcub check on RENOIR
Thread-Topic: [PATCH] drm/amd/display: add dmcub check on RENOIR
Thread-Index: AQHWVQAgnaNk9h6zXkulu0L1fGPYvKj9umEI
Date: Wed, 8 Jul 2020 14:15:33 +0000
Message-ID: <MN2PR12MB448842FC1EBC1B8662C3624BF7670@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <20200708081622.3109902-1-aaron.ma@canonical.com>
In-Reply-To: <20200708081622.3109902-1-aaron.ma@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=True;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-07-08T14:15:33.247Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=AMD
 Public; MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged; 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [172.58.187.241]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 22bd0231-f53f-44d9-5c98-08d823496110
x-ms-traffictypediagnostic: MN2PR12MB4174:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB417417D344F3751C5D4FFC10F7670@MN2PR12MB4174.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ssaEno97akpoAdoBogwjp7wWrD+4oa57a1DTGAAOyT7DUmYkG+WEavYeEU0UhF2Iif/XLS79PBmQk3j1YbTEuhxKvJ2Q+pO8n4gTM4dL3uek2oWACOBkFK51Eez0zbF2wBv5Mrm/ANMoVPcIZ/h3dzAP2NoLVWz1vKIEXleK7Vg73BIjd3+PP4jOW9PaQL+XsTDdlHNBqnfowbb4tHmiYc8VHPbklEvECB5SifzNwYo51tayMD2TFUSgiYIxx4c+dhq453gSmvXUwaZCUtuYvUFMiaoOXHKLzU3YotQkVpUssogCD0WbFX/wVDCRVmlGfMil9QAQnXuAKuKjwY8i6Si3SoCjBJqhvwmyIJpUnBBcmPFGNTHvsI9/EV3BSi1T6ISXuYMZA0jh7d7GDXOtdjpXt4ml3bG9w3CF7Hcu9ANFXF7i9olqKYRpC7X+cwnV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(478600001)(186003)(8676002)(6506007)(53546011)(26005)(71200400001)(83380400001)(76116006)(66446008)(66476007)(66946007)(64756008)(66556008)(52536014)(5660300002)(166002)(86362001)(2906002)(966005)(9686003)(55016002)(45080400002)(33656002)(7696005)(8936002)(19627405001)(316002)(110136005)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: nmrC4/vY5X+ZSt952AQCgB1H0rjLAOiRJuZ2XTG/3tkmJHf3U+vvxLlc1M6x2Zgvzatetys8r3BpSa+EiXIXPj5fTNFDkcVNPjgaup2+vPWDioTAUqiKru+tIuXLWmAtCRfKsSLgm/A59aT9C0JHDte5DUcX2xKQzkBS29XKpnP3mO1a+JmKBTul8w8JvpUq2Z5Pl7UsIoD1C8royLTngAGgOkWKZDhAr1oOgXhRrrQ7lLNaBJ7UMBMEjxdr2sx1AN/Ul0/u0xJzEB9tcsUoEz+LpwHkyCiaPZ0+7KLyMlk2ptBpzkODs2zv8LCZs/KqHzvI3zzWM6fY/Y9wpXBk/phBt/s7SeAfxHqXUiI1xBGjb/NwKTiIObKFfOVBnkee1QTfLP6V3ANOBKiFg3ZTwQII5KgvTtTUHMbE6vToTNsnWXHzxyqzv5jQ9rEMRnoFn0oDXlJVJ0IbLF50YGz+LIsueuqcmc51XjvA5oJs1wJbD6FOLWn4iqyk/ITQ03jF
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bd0231-f53f-44d9-5c98-08d823496110
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 14:15:33.9100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6hL1WO+u3Uv724Tia7zta/fIsyISKpcz5CMdwR6S7Llw1tJR0fAiTuPgW0OCSubEwhTxkCcdXQ87+ytnWeoGlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174
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
Content-Type: multipart/mixed; boundary="===============1263731186=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1263731186==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB448842FC1EBC1B8662C3624BF7670MN2PR12MB4488namp_"

--_000_MN2PR12MB448842FC1EBC1B8662C3624BF7670MN2PR12MB4488namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Public Use]

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: Aaron Ma <aaron.ma@canonical.com>
Sent: Wednesday, July 8, 2020 4:16 AM
To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.L=
i@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christi=
an <Christian.Koenig@amd.com>; airlied@linux.ie <airlied@linux.ie>; daniel@=
ffwll.ch <daniel@ffwll.ch>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.fr=
eedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedeskto=
p.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; mapeng=
yu@gmail.com <mapengyu@gmail.com>; aaron.ma@canonical.com <aaron.ma@canonic=
al.com>
Subject: [PATCH] drm/amd/display: add dmcub check on RENOIR

RENOIR loads dmub fw not dmcu, check dmcu only will prevent loading iram,
it breaks backlight control.

Bug: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbu=
gzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D208277&amp;data=3D02%7C01%7Calexand=
er.deucher%40amd.com%7Cf922a1848f1f4cc4934f08d823174036%7C3dd8961fe4884e608=
e11a82d994e183d%7C0%7C0%7C637297930080282163&amp;sdata=3DlimstWv5pwvdqDRpKo=
KpCZcutV4pmqhdqR7CFEimR2Q%3D&amp;reserved=3D0
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 10ac8076d4f2..db5e0bb0d935 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1358,7 +1358,7 @@ static int dm_late_init(void *handle)
         struct dmcu *dmcu =3D NULL;
         bool ret;

-       if (!adev->dm.fw_dmcu)
+       if (!adev->dm.fw_dmcu && !adev->dm.dmub_fw)
                 return detect_mst_link_for_all_connectors(adev->ddev);

         dmcu =3D adev->dm.dc->res_pool->dmcu;
--
2.25.1


--_000_MN2PR12MB448842FC1EBC1B8662C3624BF7670MN2PR12MB4488namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#317100;margin:15pt;" al=
ign=3D"Left">
[AMD Public Use]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Aaron Ma &lt;aaron.ma=
@canonical.com&gt;<br>
<b>Sent:</b> Wednesday, July 8, 2020 4:16 AM<br>
<b>To:</b> Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Li, Sun peng (Le=
o) &lt;Sunpeng.Li@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd=
.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; airlied@linux=
.ie &lt;airlied@linux.ie&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch&gt;;
 amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; dri-d=
evel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; linux-k=
ernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;; mapengyu@gmail.=
com &lt;mapengyu@gmail.com&gt;; aaron.ma@canonical.com &lt;aaron.ma@canonic=
al.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/display: add dmcub check on RENOIR</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">RENOIR loads dmub fw not dmcu, check dmcu only wil=
l prevent loading iram,<br>
it breaks backlight control.<br>
<br>
Bug: <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D208277&amp;amp;data=3D02=
%7C01%7Calexander.deucher%40amd.com%7Cf922a1848f1f4cc4934f08d823174036%7C3d=
d8961fe4884e608e11a82d994e183d%7C0%7C0%7C637297930080282163&amp;amp;sdata=
=3DlimstWv5pwvdqDRpKoKpCZcutV4pmqhdqR7CFEimR2Q%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.kernel.org%2Fshow_bug.cgi%3Fid%3D208277&amp;amp;data=3D02%7C01%7Calexande=
r.deucher%40amd.com%7Cf922a1848f1f4cc4934f08d823174036%7C3dd8961fe4884e608e=
11a82d994e183d%7C0%7C0%7C637297930080282163&amp;amp;sdata=3DlimstWv5pwvdqDR=
pKoKpCZcutV4pmqhdqR7CFEimR2Q%3D&amp;amp;reserved=3D0</a><br>
Signed-off-by: Aaron Ma &lt;aaron.ma@canonical.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
index 10ac8076d4f2..db5e0bb0d935 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
@@ -1358,7 &#43;1358,7 @@ static int dm_late_init(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dmcu *dmcu =3D NULL=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ret;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!adev-&gt;dm.fw_dmcu)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!adev-&gt;dm.fw_dmcu &amp;&am=
p; !adev-&gt;dm.dmub_fw)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return detect_mst_link_for_all_connectors(adev-&gt;dd=
ev);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dmcu =3D adev-&gt;dm.dc-&g=
t;res_pool-&gt;dmcu;<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB448842FC1EBC1B8662C3624BF7670MN2PR12MB4488namp_--

--===============1263731186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1263731186==--
