Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8266AA69C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 16:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9796089105;
	Thu,  5 Sep 2019 14:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740072.outbound.protection.outlook.com [40.107.74.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815BD890DB;
 Thu,  5 Sep 2019 14:59:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvAoFw6rYpsqxZyEMIC2aIyETGOYYcxNV81r2Ga/Gyx+yjcOagQ7Yyc8//7Bqyidezh/05AdihXZ1QUUeubOZv7yWCtOFcERw+JNEwgdZ0tppg1GFhVm43oMXB3R05WxpBXeDq7f4gyPAKgc0fWMspvKvpPb85PVdN9ckjxaoLwhhwu3tcjOMQAJACzHchcllM0nnwEqxlyj80g8d5torasBIzMa8eQfiOVh5KDohBX9O+jCKCxuctq/idinjndT5KJN3i5fZ2b9XZlhnxgVizRc8mFh73hx+dWJbnXk9DQOUFa9AKydI1RfxfPk7LxYp70EkVqG8VPKB6QufJ35mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mozSrYgszcZBaQXP39uOY5VrFJieKy8wc5iKVRI52cY=;
 b=W5Z2VbC92ykLLTqPfD1QBeRaeF/tephmpOR31w+do1hCkWrhNokNWTtIla8WPp/pQdc5okVwJDjt74cGrNjd696Na61CQxiGxeNDM8zCkj7gNsPhS74CSloqOgKOjzwbq8uAbJBzGmXK7ALINWFJZh+7rLi7EB/NvVKl+2Z+RiEOliI+Aqz9+SANTwv6V7QewLk7YUqUWCRMvZ6Ok4jXUxBYJe6XPTpelVe9lQpOcIT/BSrSzKFHr4OSCx0cvX5ra/dpex9xLu0Es+fkP9to9uEElLjFIw3UgUVcvJ48ijpgFTUx3PpIrH9EuzxG0xFwk+lho7c+5uBJOXtUb/yanQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (20.179.80.76) by
 MN2PR12MB4047.namprd12.prod.outlook.com (52.135.51.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Thu, 5 Sep 2019 14:59:53 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::646d:2496:3b2:1d02]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::646d:2496:3b2:1d02%4]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 14:59:53 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/drm_connector: add additional aspect ratio values
Thread-Topic: [PATCH] drm/drm_connector: add additional aspect ratio values
Thread-Index: AQHVWTQFLCn4IG3160aA/P5G2T3Y5qcJEmaAgAYOWCE=
Date: Thu, 5 Sep 2019 14:59:53 +0000
Message-ID: <MN2PR12MB2941AFD5BE06C7B10E01B3C1FCA00@MN2PR12MB2941.namprd12.prod.outlook.com>
References: <20190822215002.17836-1-waynelin@amd.com>,
 <20190823184141.GW5942@intel.com>
In-Reply-To: <20190823184141.GW5942@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5ab7946-7cf5-4cf3-9f41-08d73211b57e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4047; 
x-ms-traffictypediagnostic: MN2PR12MB4047:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB40477402D7EC74B6EA9DF10AFCBB0@MN2PR12MB4047.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(199004)(189003)(6916009)(6116002)(3846002)(229853002)(53936002)(25786009)(26005)(606006)(71190400001)(7696005)(6436002)(86362001)(74316002)(256004)(446003)(236005)(5660300002)(6306002)(54896002)(7736002)(9686003)(102836004)(11346002)(54906003)(52536014)(99286004)(6246003)(476003)(55016002)(4326008)(186003)(486006)(33656002)(8936002)(66066001)(81166006)(81156014)(8676002)(105004)(76176011)(53546011)(478600001)(66476007)(19627405001)(76116006)(66446008)(66946007)(64756008)(66556008)(966005)(91956017)(2906002)(14454004)(71200400001)(316002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4047;
 H:MN2PR12MB2941.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sKyWhHhZ7ymTNXdLvT1t28XUavdUKPXLEN5Zob8vWMpFRKt44Sd0sNfdKxvoyXDEtEFsMAWcqBI8p1ioSBtYBBXZ1aSnB9bV+TN+VDILj71LkgK170boe+Fp+Fj9KSzvoGaMMlXRduwozhBmd91DSCZcvLpn8dQsaSUiaTWvCvD4jlT4hAycrJGJuFglxkEsnnX9MGGiRV4TZv5D2Gl/JTdkYEpaW2fZqtl2wvhSCNsPUg2qhpPVFtTQ0qLpNSh3RUPNnrbW4yCgxigiamz+c3nGq5AZeuUAzCSbPswJeItU0wU7Y4b5tk52SKaigvv+CZVFVcb4Pd/mo3EadI77nMuSUICco7vkWdlN1/xwbdHEHhS9/egrUUhKPEkcgr0I/lhndztJR3N32ynKlkd3woMIk+Pyw2Gn9N1PUHlGe6U=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ab7946-7cf5-4cf3-9f41-08d73211b57e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 14:59:53.5782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yufX519CoNrz5id4Qh+MArxbXN+psZMuzIqEJM777+gp8MnKjM3nQanBxu0sPlz3deF7aJR3BorU2VkDxgcnSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mozSrYgszcZBaQXP39uOY5VrFJieKy8wc5iKVRI52cY=;
 b=ZOXXiraU3e39LkcAa+rZMhie8FyoGFVWUw1lb3RccqG6ECGlW7wvuD4nH/PBLsVAjZUz2zPWgL4lfejNahEdmb38iov4qtwtQBSW3QIDR9X/EXflPzfptNBZA38IKsA6Nndb1gTRPYbPv07u/iZ+NyjqMsdb+tIfALcpT52QRrs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============2021836460=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2021836460==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB2941AFD5BE06C7B10E01B3C1FCA00MN2PR12MB2941namp_"

--_000_MN2PR12MB2941AFD5BE06C7B10E01B3C1FCA00MN2PR12MB2941namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
Sent: Saturday, August 24, 2019 02:41
To: Lin, Wayne <Wayne.Lin@amd.com>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-=
gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Li, Sun peng (Le=
o) <Sunpeng.Li@amd.com>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
Subject: Re: [PATCH] drm/drm_connector: add additional aspect ratio values

On Thu, Aug 22, 2019 at 05:50:02PM -0400, Wayne Lin wrote:
> For HDMI2.0 CTS item - HF1-35, it verifies if the source generates
> video timing "64:27" video format correctly.
>
> eg: (vic-76) 1920x1080p@60Hz,24bpp
>
> This patch add on "64:27" and "256:135" to drm_aspect_ratio_enum_list.
> Thereafter, one can specify the aspect ratio to "64:27" or "256:135"
> after creating aspect ratio property.
>
> Change-Id: Ifc9df54e8e8f78e70960fcd737a3a57e49c81152
> Signed-off-by: Wayne Lin <waynelin@amd.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 3a0cacb71235..c0629a01d08e 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -772,6 +772,8 @@ static const struct drm_prop_enum_list drm_aspect_rat=
io_enum_list[] =3D {
>        { DRM_MODE_PICTURE_ASPECT_NONE, "Automatic" },
>        { DRM_MODE_PICTURE_ASPECT_4_3, "4:3" },
>        { DRM_MODE_PICTURE_ASPECT_16_9, "16:9" },
> +     { DRM_MODE_PICTURE_ASPECT_64_27, "64:27" },
> +     { DRM_MODE_PICTURE_ASPECT_256_135, "256:135" },

> Not 100% sure we want to expose these via the property because the
> infoframe can't convey these independently from the VIC.

Agree with that it can't be independent from the VIC.
When building up hdmi avi infoframe by using "drm_hdmi_avi_infoframe_from_d=
isplay_mode" in drm_edid,
it will refer to the VIC to set up the aspect ratio if the aspect ratio is =
not specified in mode.
However, if the aspect ratio is specified to a value other than none, curre=
nt logic of code will use the specified value.

The main reason of this patch is for capable indicating the exact VIC wante=
d.
There are some modes defined in CTA-861 with same timing but different aspe=
ct ratio.
eg: VIC 103 & VIC 93
Without these new definitions, we cannot distinguish these different modes =
and might set a wrong VIC in AVI infoframe.

>  };
>
>  static const struct drm_prop_enum_list drm_content_type_enum_list[] =3D =
{
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--
Ville Syrj=E4l=E4
Intel

--_000_MN2PR12MB2941AFD5BE06C7B10E01B3C1FCA00MN2PR12MB2941namp_
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
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Ville Syrj=E4l=E4 &lt=
;ville.syrjala@linux.intel.com&gt;<br>
<b>Sent:</b> Saturday, August 24, 2019 02:41<br>
<b>To:</b> Lin, Wayne &lt;Wayne.Lin@amd.com&gt;<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt=
;; Li, Sun peng (Leo) &lt;Sunpeng.Li@amd.com&gt;; Kazlauskas, Nicholas &lt;=
Nicholas.Kazlauskas@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/drm_connector: add additional aspect ratio =
values</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Thu, Aug 22, 2019 at 05:50:02PM -0400, Wayne Li=
n wrote:<br>
&gt; For HDMI2.0 CTS item - HF1-35, it verifies if the source generates<br>
&gt; video timing &quot;64:27&quot; video format correctly.<br>
&gt; <br>
&gt; eg: (vic-76) 1920x1080p@60Hz,24bpp<br>
&gt; <br>
&gt; This patch add on &quot;64:27&quot; and &quot;256:135&quot; to drm_asp=
ect_ratio_enum_list.<br>
&gt; Thereafter, one can specify the aspect ratio to &quot;64:27&quot; or &=
quot;256:135&quot;<br>
&gt; after creating aspect ratio property.<br>
&gt; <br>
&gt; Change-Id: Ifc9df54e8e8f78e70960fcd737a3a57e49c81152<br>
&gt; Signed-off-by: Wayne Lin &lt;waynelin@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/drm_connector.c | 2 &#43;&#43;<br>
&gt;&nbsp; 1 file changed, 2 insertions(&#43;)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_con=
nector.c<br>
&gt; index 3a0cacb71235..c0629a01d08e 100644<br>
&gt; --- a/drivers/gpu/drm/drm_connector.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/drm_connector.c<br>
&gt; @@ -772,6 &#43;772,8 @@ static const struct drm_prop_enum_list drm_asp=
ect_ratio_enum_list[] =3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { DRM_MODE_PICTURE_ASPECT_NO=
NE, &quot;Automatic&quot; },<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { DRM_MODE_PICTURE_ASPECT_4_=
3, &quot;4:3&quot; },<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { DRM_MODE_PICTURE_ASPECT_16=
_9, &quot;16:9&quot; },<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; { DRM_MODE_PICTURE_ASPECT_64_27, &quot;6=
4:27&quot; },<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; { DRM_MODE_PICTURE_ASPECT_256_135, &quot=
;256:135&quot; },<br>
<br>
&gt; Not 100% sure we want to expose these via the property because the<br>
&gt; infoframe can't convey these independently from the VIC.</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Agree with that it can't be independent from the V=
IC.&nbsp;</div>
<div class=3D"PlainText">When building up hdmi avi infoframe by using &quot=
;drm_hdmi_avi_infoframe_from_display_mode&quot; in drm_edid,&nbsp;</div>
<div class=3D"PlainText">it will refer to the VIC to set up the aspect rati=
o if the aspect ratio is not specified in mode.</div>
<div class=3D"PlainText">However, if the aspect ratio is specified to a val=
ue other than none, current logic of code will use the specified value.&nbs=
p;</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">The main reason of this patch is for capable indic=
ating the exact VIC wanted.&nbsp;</div>
<div class=3D"PlainText">There are some modes defined in CTA-861 with same =
timing but different aspect ratio.</div>
<div class=3D"PlainText">eg: VIC 103 &amp; VIC 93</div>
<div class=3D"PlainText">Without these new definitions, we cannot distingui=
sh these different modes and might set a wrong VIC in AVI infoframe.</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">&gt;&nbsp; };<br>
&gt;&nbsp; <br>
&gt;&nbsp; static const struct drm_prop_enum_list drm_content_type_enum_lis=
t[] =3D {<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; dri-devel@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel">h=
ttps://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
<br>
-- <br>
Ville Syrj=E4l=E4<br>
Intel<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB2941AFD5BE06C7B10E01B3C1FCA00MN2PR12MB2941namp_--

--===============2021836460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2021836460==--
