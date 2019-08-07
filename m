Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED928508F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 18:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482F76E732;
	Wed,  7 Aug 2019 16:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800073.outbound.protection.outlook.com [40.107.80.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F3C6E730;
 Wed,  7 Aug 2019 16:03:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXMsWAYyZoGzo44HHlEPHWS7kncMb4RE8LygfexGnstnEXfMw9di851hC9liwOe74qEAU0hr4G2VWy0DbtrRehoV6F3TEaeEVvC1KZ9uNHtptvOXQAashAStYvAwLgm9Ii8oPqTRgeCbj1EEGXzN0sG76hADvuNl/knYHiHhX52qCjPD4zwTn6CfUrmBc57z3qp5IheoNoMVPzcOD1SNW1sS2YbqjR5wGrHoslGf7dGVfsNNVAjGIMiSmUDQGebJpB2U3KPuNOVVLCqdX+Ejo576LvdRqxLfk0a+6QZHF2q9rZypBlnwBS78ag32EqmFEdY/rYm8iMeNTe6eClMcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWSyzDMKPeJfagyowwzkh106KPxTwjRsb4TeuERk7Gk=;
 b=FvTIYwv1DPyGDwF1ZPBmY7FGwnxNPX5Up18WHKZuSV/kfeH0CnCu+uybSFk1Lxp/yV2ymIRG+z8TLTyfbkjdr4cSIEu/u6xVY5f/BGrzBBjcROUPmcyYiHn1vw9on+Sikg/SIc6uNOXzYCzKTjZPlZdI0VNNTaSc/4R/SaYSIOdr+RmBVVToA9OFjJacEYJRFdnr0uuPwfyQ7ec6N85zwgylrFHKYbBkMU0dIX6U/J9dA3B7pmZgHDN/gO6aoFSZAMJ1mPhG6wEngOqhNSwOUC7pyRQdNTveFFVbpGWIYR6bUJxcX/KD4TwXEjAohPpxIHrdf4wJAqVT4QS1mLKbnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3999.namprd12.prod.outlook.com (10.255.239.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Wed, 7 Aug 2019 16:03:09 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e%7]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 16:03:09 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [Regression] "drm/amdgpu: enable gfxoff again on raven series
 (v2)"
Thread-Topic: [Regression] "drm/amdgpu: enable gfxoff again on raven series
 (v2)"
Thread-Index: AQHVTR6vuXV/Jpmg0k2CW5FCQfHn8Kbv2Giq
Date: Wed, 7 Aug 2019 16:03:09 +0000
Message-ID: <MN2PR12MB330979BAFF5BCC758258D54CECD40@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <3EB0E920-31D7-4C91-A360-DBFB4417AC2F@canonical.com>
In-Reply-To: <3EB0E920-31D7-4C91-A360-DBFB4417AC2F@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [116.232.203.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1219f787-8254-4552-e48a-08d71b50be3f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3999; 
x-ms-traffictypediagnostic: MN2PR12MB3999:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3999A6120142217E5D3F6AAEECD40@MN2PR12MB3999.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(189003)(199004)(52536014)(66446008)(64756008)(66556008)(66476007)(25786009)(5660300002)(66946007)(71190400001)(76116006)(606006)(76176011)(99286004)(71200400001)(86362001)(256004)(478600001)(3846002)(6116002)(7736002)(966005)(74316002)(6916009)(91956017)(8936002)(486006)(66066001)(54906003)(55016002)(229853002)(53936002)(316002)(6306002)(54896002)(476003)(446003)(11346002)(4326008)(6246003)(4744005)(33656002)(9686003)(6436002)(6506007)(53546011)(7696005)(236005)(2906002)(68736007)(186003)(26005)(102836004)(81156014)(66574012)(8676002)(81166006)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3999;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nJVASNWiTvTQvXtlB63nE3GXTjV+DCiA/IOTld6YDcoZMcckuLGNDxrnvTQ+PrG4XTgyfOyps8vMUqFJbNx1iaqbegWeNaME8EJ9PbHlCRvx9nmsrlu/KE94tejDojCoaNyl7YYjPlNm6vhNKams0N1Czbzp3IUIvCUHfB4cAeeDbBXk0/vFHU3+TyDBzEFgLYcNQF4UemGmxsatb4jeRbe5tccKg9HWduepQ+v3mWti9QvnzSDhEJHVKuQ50Gxjz+/fA8c4v6LYWcf3E901rdtwDiduWibd7qWp+Bi+xNfJf/bPz4XyRFUgRtGF+v62fLBPM3S+L0kMFGwD4TUOp7w9EMLjjPJQ7OZbkjKICswzzahX7tNrk7N+9lsDMAUigKJzDrp3VZo4Leuj6agEsL5QEOqzgQVE2EaHpX+pB3g=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1219f787-8254-4552-e48a-08d71b50be3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 16:03:09.6817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWSyzDMKPeJfagyowwzkh106KPxTwjRsb4TeuERk7Gk=;
 b=QrFe7s6YxA+IYzGMupADdwrvvcd3vNIVGlH1t8Czta5WqhZfK1iBiVDLKO1JXUpDPzbBQ1hDQmHbbXjSuH6MZ1HvWngdFFqY2M79Io8S/PFUKJjqWGVNJJgYDx6fVZsZ6so/53x5RgKsAtJIiwsD7il8KzZdMWK0ah13KKwH40c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Anthony Wong <anthony.wong@canonical.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1598307324=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1598307324==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB330979BAFF5BCC758258D54CECD40MN2PR12MB3309namp_"

--_000_MN2PR12MB330979BAFF5BCC758258D54CECD40MN2PR12MB3309namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

May I know the all firmware version in your system?

Thanks,
Ray

________________________________
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Sent: Wednesday, August 7, 2019 8:50 PM
To: Huang, Ray
Cc: Deucher, Alexander; Koenig, Christian; Zhou, David(ChunMing); amd-gfx l=
ist; dri-devel@lists.freedesktop.org; LKML; Anthony Wong
Subject: [Regression] "drm/amdgpu: enable gfxoff again on raven series (v2)=
"

Hi,

After commit 005440066f92 ("drm/amdgpu: enable gfxoff again on raven series
(v2)=94), browsers on Raven Ridge systems cause serious corruption like thi=
s:
https://launchpadlibrarian.net/436319772/Screenshot%20from%202019-08-07%200=
4-20-34.png

Firmwares for Raven Ridge is up-to-date.

Kai-Heng

--_000_MN2PR12MB330979BAFF5BCC758258D54CECD40MN2PR12MB3309namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style id=3D"ms-outlook-ios-style" type=3D"text/css">html {
background-color: transparent !important;
}

body {
background-color: transparent !important;
color: #333;
line-height: 150%;
font-family: "-apple-system", "HelveticaNeue";
margin: 0;
}

.ms-outlook-ios-reference-expand {
display: block;
color: #999;
padding: 20px 0px;
text-decoration: none;
}

.ms-outlook-ios-availability-container {
max-width: 500px;
margin: auto;
padding: 12px 15px 15px 15px;
border: 1px solid #C7E0F4;
border-radius: 4px;
}

.ms-outlook-ios-availability-container > .ms-outlook-ios-availability-delet=
e-button {
width: 25px;
height: 25px;
right: -12px;
top: -12px;
background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEsAAA=
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
BzRAPSFNM7HEAAAAASUVORK5CYII=3D");
background-size: 25px 25px;
background-position: center;
}

#ms-outlook-ios-main-container {
margin: 0 0 0 0;
margin-top: 120;
padding: 8;
}

#ms-outlook-ios-content-container {
padding: 0;
padding-top: 12;
padding-bottom: 20;
}

.ms-outlook-ios-mention {
color: #333;
background-color: #f1f1f1;
border-radius: 4px;
padding: 0 2px 0 2px;
pointer-events: none;
text-decoration: none;
}

.ms-outlook-ios-mention-external {
color: #ba8f0d;
background-color: #fdf7e7;
}

.ms-outlook-ios-mention-external-clear-design {
color: #ba8f0d;
background-color: #f1f1f1;
}</style><style id=3D"ms-outlook-ios-dark-mode-style" type=3D"text/css">.ms=
-outlook-ios-dark-mode {
color: #E1E1E1 !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-reference-expand {
color: #777777 !important;
}

.ms-outlook-ios-dark-mode a:not([class]) {
color: #0086F0;
}

.ms-outlook-ios-dark-mode font[color=3D"#000000"] {
color: #E1E1E1 !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-availability-container {
border-color: #0086F0 !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-availability-container .ms-outloo=
k-ios-availability-timeslot-container {
background-color: rgba(0, 120, 215, 0.2) !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-availability-container .ms-outloo=
k-ios-availability-border {
border-top: 1px solid #0086F0 !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-availability-container > .ms-outl=
ook-ios-availability-delete-button {
filter: invert(100%) grayscale(100%) brightness(90%) sepia(100%) hue-rotate=
(-180deg) saturate(700%) contrast(0.8);
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-mention {
color: #A8A8AC !important;
background-color: #292929 !important;
}</style>
<meta name=3D"viewport" content=3D"width=3Ddevice-width, user-scalable=3Dno=
, initial-scale=3D1.0, minimum-scale=3D1.0, maximum-scale=3D1.0">
</head>
<body style=3D"-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
<div style=3D"direction: ltr;">
<div style=3D"direction: ltr;">May I know the all firmware version in your =
system?</div>
<div><br>
</div>
<div style=3D"direction: ltr;">Thanks,</div>
<div style=3D"direction: ltr;">Ray&nbsp;</div>
<div><br>
</div>
</div>
<div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"dir=3D&quot;ltr&quot;"><font face=3D"Calib=
ri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Kai=
-Heng Feng &lt;kai.heng.feng@canonical.com&gt;<br>
<b>Sent:</b> Wednesday, August 7, 2019 8:50 PM<br>
<b>To:</b> Huang, Ray<br>
<b>Cc:</b> Deucher, Alexander; Koenig, Christian; Zhou, David(ChunMing); am=
d-gfx list; dri-devel@lists.freedesktop.org; LKML; Anthony Wong<br>
<b>Subject:</b> [Regression] &quot;drm/amdgpu: enable gfxoff again on raven=
 series (v2)&quot;
<div>&nbsp;</div>
</font></div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style><font size=3D"=
2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Hi,<br>
<br>
After commit 005440066f92 (&quot;drm/amdgpu: enable gfxoff again on raven s=
eries&nbsp; <br>
(v2)=94), browsers on Raven Ridge systems cause serious corruption like thi=
s:<br>
<a href=3D"https://launchpadlibrarian.net/436319772/Screenshot%20from%20201=
9-08-07%2004-20-34.png">https://launchpadlibrarian.net/436319772/Screenshot=
%20from%202019-08-07%2004-20-34.png</a><br>
<br>
Firmwares for Raven Ridge is up-to-date.<br>
<br>
Kai-Heng<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB330979BAFF5BCC758258D54CECD40MN2PR12MB3309namp_--

--===============1598307324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1598307324==--
