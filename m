Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B3C133929
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 03:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915626E84B;
	Wed,  8 Jan 2020 02:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590056E84B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 02:36:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/oR3f/Jy6+0eT0ljsoelI/J7+PjjPZnvFWYKTeyfUuGxW5LZ60cf3eBRA/5mhcYfvnJ8yzrO/rwDWmgbEvQ7hf1FY2K7G6Wcfyv1YgJOQC0dRIOmm/9+mh6wjs4L5HNtG0+fWyygHkjWD08A1iwrsV/BcWXiBC83qlw38ydD+KAuICP92QmJG6k8+OnYLnGf3ECIfwxkD8hyeSEGf4PkPE2iQ9v9Zr71T6TTnX97GMvvSwEncPfHUiZXsh+raXKLUrH+9HEggTWnnuKWC8ZoNEdscmGDZBV6O4BLaEq5Jl/Y5YhZHMVCLK1p1NJxh0xyOaJ+lkV5ZVniLuXEbJhPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUH5iwiPaX/v8wnl/BJqHwRlobRjzAH31Mo4GI7iKQ8=;
 b=Qf49l1YL0M+ZFtZ+eQrxJw6Noby2zImQ5eo/ycZ0tvTs7muuim8mloyKsQVo3iL1bQUb+jxKFFcXD2J+rfBGxw/iM38J/Vn9ZYZHbkb/749lr+LZVlanBoMLbZTXW+87xQ4KB7KZiAzYeFpHWlOykP8mLherka5jsQx2ywvbMneBgjbI+WhVqkt4M/wxmAdMrsUmKvtDL/1DLmJNIN+zUhNQvOYIzJzY8ciGr/OFbJ9Lp9K5KOnFRgyDu9D1Zi2ubFCcw7Xa4At4nC06LPuzf05f2Muzwt9nYOivdEmDYT3vx+zZPSRGnSb1DmHA61x74FKTtaLqKiPZMCY8uLAM4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUH5iwiPaX/v8wnl/BJqHwRlobRjzAH31Mo4GI7iKQ8=;
 b=2bFYBPtaWzNv2BCPJHrfkWTZDJoU78boSTBDvGy1Q1vSvmGDMrMo/Ts4/cMvhuWdeyMfFgFBZL8S2ie9MJmkk43tTmRsRX310VfK0mwpzbO7enPmFVQfSmObQbGapPknlasyARg0TUJD9dNd+HcTdDHB8mEndZraNnTywMyZeFc=
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3136.namprd12.prod.outlook.com (20.178.244.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15; Wed, 8 Jan 2020 02:36:19 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::90a0:8353:690c:1751]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::90a0:8353:690c:1751%7]) with mapi id 15.20.2602.016; Wed, 8 Jan 2020
 02:36:19 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: kbuild test robot <lkp@intel.com>, "Cui, Flora" <Flora.Cui@amd.com>
Subject: Re: [radeon-alex:amd-19.50 1794/2680] cc1: fatal error:
 dkms/config/config.h: No such file or directory
Thread-Topic: [radeon-alex:amd-19.50 1794/2680] cc1: fatal error:
 dkms/config/config.h: No such file or directory
Thread-Index: AQHVxZ0EmhFxEmBLA0ynCdiYAzveS6fgDP9N
Date: Wed, 8 Jan 2020 02:36:19 +0000
Message-ID: <MN2PR12MB3296709A03D6B1414B0A13C3A23E0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <202001080436.qzcoeKg9%lkp@intel.com>
In-Reply-To: <202001080436.qzcoeKg9%lkp@intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-01-08T02:36:18.911Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a667002c-08f1-425b-484c-08d793e38b29
x-ms-traffictypediagnostic: MN2PR12MB3136:|MN2PR12MB3136:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3136ACD985C30C6B758A8E2DA23E0@MN2PR12MB3136.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:113;
x-forefront-prvs: 02760F0D1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(199004)(189003)(81156014)(6506007)(26005)(8676002)(53546011)(186003)(5660300002)(7696005)(71200400001)(4326008)(966005)(45080400002)(478600001)(52536014)(86362001)(33656002)(9686003)(2906002)(8936002)(19627405001)(316002)(55016002)(66556008)(91956017)(76116006)(6636002)(110136005)(54906003)(66476007)(66446008)(81166006)(64756008)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3136;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /evmllcO+2RsbI7XiffkvJHrKUnWYtX/4lce/xYduO9jwuASGqfcdT8oIL/WDa4S4R180qSBVLrfxwMdJTOhTtjC7jmY0PAPKH6odc0QWoj5V2lsnITfKly4bq5qIDY9Y1epH8OSokrMavRa7VelcPLdKh7oAoDoyzCzO/OjBkFFry865EsIC+z7bma0i+qwWGbginR50h537XqNDTnCHLR3tKquaF/Fi/rB6NZ/iFHeXBk4gUn+KLD7fEHgvKAYdTqFItZ5DTaDkNx6chTMzSydPyf3LBNrqwwBt1it1E6ydlI6fSMEc/kbWy0PS1cB0Tr+snsh9CizmTRbCbvGtVFBwlDuvlHE+qtEqOLNs+ZbhF0W8NMMkdfzcI4tQONiS4znOnytCBYaJqXuuQ1mcQK2weQJqdX8OgDNFBf+TMkSmACv6cRzRRGKWuztDDM5GGMqBtzE+01m/qHb1h82MrLwi6Dr7ScRjFA9eh+mjjBRfF7VMoenGPo5dVybmeWVebJXgDX8ffRpP1QYmQa43Q==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a667002c-08f1-425b-484c-08d793e38b29
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2020 02:36:19.5863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n7XZvFT5mx9VKiCrIQqgm1TQ1hQM2o6G5iFdlATeUuH7B035sS+7PegkxQ6+LvqB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3136
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>, "Gui, 
 Jack" <Jack.Gui@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Zhang,
 Yifan1" <Yifan1.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1239605887=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1239605887==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296709A03D6B1414B0A13C3A23E0MN2PR12MB3296namp_"

--_000_MN2PR12MB3296709A03D6B1414B0A13C3A23E0MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Hi,

the fixed patch has been merged into 19.50 branch yesterday.

commit 673383cfa8707eb024669f510837694081da65c5
Author: Flora Cui <flora.cui@amd.com>
Date:   Thu Nov 28 15:20:06 2019 +0800

    drm/amdkcl: fix intree build issue for config.h

    fix "make O=3D$(output_dir) modules M=3Ddrivers/gpu/drm/amd/amdgpu"

    Signed-off-by: Flora Cui <flora.cui@amd.com>
    Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin

________________________________
From: kbuild test robot <lkp@intel.com>
Sent: Wednesday, January 8, 2020 4:56 AM
To: Cui, Flora <Flora.Cui@amd.com>
Cc: kbuild-all@lists.01.org <kbuild-all@lists.01.org>; dri-devel@lists.free=
desktop.org <dri-devel@lists.freedesktop.org>; Gui, Jack <Jack.Gui@amd.com>=
; Xu, Feifei <Feifei.Xu@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; =
Zhang, Yifan1 <Yifan1.Zhang@amd.com>
Subject: [radeon-alex:amd-19.50 1794/2680] cc1: fatal error: dkms/config/co=
nfig.h: No such file or directory

Hi Flora,

FYI, the error/warning still remains.

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-19.50
head:   f981f76437edab0861f3721c27f1c3cec5903dcc
commit: 4d49aa8a40ceecfd8a6b2d4e1b86396fbeedbb01 [1794/2680] drm/amdkcl/aut=
oconf: generate config.h for in-tree build
config: x86_64-randconfig-h003-20200107 (attached as .config)
compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
reproduce:
        git checkout 4d49aa8a40ceecfd8a6b2d4e1b86396fbeedbb01
        # save the attached .config to linux build tree
        make ARCH=3Dx86_64

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> cc1: fatal error: dkms/config/config.h: No such file or directory
   compilation terminated.

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.0=
1.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=3D02%7C01%7C=
kevin1.wang%40amd.com%7C46d0b1e6805140d3728708d793b4188a%7C3dd8961fe4884e60=
8e11a82d994e183d%7C0%7C0%7C637140274251196664&amp;sdata=3DGrdbjBlNqVM%2BqpO=
%2FYypvMrQ6Q8zcuso%2BIyFOhT9BQ14%3D&amp;reserved=3D0 Intel Corporation

--_000_MN2PR12MB3296709A03D6B1414B0A13C3A23E0MN2PR12MB3296namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
the fixed patch has been merged into 19.50 branch yesterday.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<i><br>
</i></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><i>commit 673383cfa8707eb024669f510837694081da65c5<br>
</i></span>
<div><i>Author: Flora Cui &lt;flora.cui@amd.com&gt;<br>
</i></div>
<div><i>Date: &nbsp; Thu Nov 28 15:20:06 2019 &#43;0800<br>
</i></div>
<div><i><br>
</i></div>
<div><i>&nbsp; &nbsp; drm/amdkcl: fix intree build issue for config.h<br>
</i></div>
<div><i>&nbsp; &nbsp; <br>
</i></div>
<div><i>&nbsp; &nbsp; fix &quot;make O=3D$(output_dir) modules M=3Ddrivers/=
gpu/drm/amd/amdgpu&quot;<br>
</i></div>
<div><i>&nbsp; &nbsp; <br>
</i></div>
<div><i>&nbsp; &nbsp; Signed-off-by: Flora Cui &lt;flora.cui@amd.com&gt;<br=
>
</i></div>
<div><i>&nbsp; &nbsp; Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</=
i></div>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Kevin</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> kbuild test robot &lt=
;lkp@intel.com&gt;<br>
<b>Sent:</b> Wednesday, January 8, 2020 4:56 AM<br>
<b>To:</b> Cui, Flora &lt;Flora.Cui@amd.com&gt;<br>
<b>Cc:</b> kbuild-all@lists.01.org &lt;kbuild-all@lists.01.org&gt;; dri-dev=
el@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; Gui, Jack=
 &lt;Jack.Gui@amd.com&gt;; Xu, Feifei &lt;Feifei.Xu@amd.com&gt;; Wang, Kevi=
n(Yang) &lt;Kevin1.Wang@amd.com&gt;; Zhang, Yifan1 &lt;Yifan1.Zhang@amd.com=
&gt;<br>
<b>Subject:</b> [radeon-alex:amd-19.50 1794/2680] cc1: fatal error: dkms/co=
nfig/config.h: No such file or directory</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hi Flora,<br>
<br>
FYI, the error/warning still remains.<br>
<br>
tree:&nbsp;&nbsp; git://people.freedesktop.org/~agd5f/linux.git amd-19.50<b=
r>
head:&nbsp;&nbsp; f981f76437edab0861f3721c27f1c3cec5903dcc<br>
commit: 4d49aa8a40ceecfd8a6b2d4e1b86396fbeedbb01 [1794/2680] drm/amdkcl/aut=
oconf: generate config.h for in-tree build<br>
config: x86_64-randconfig-h003-20200107 (attached as .config)<br>
compiler: gcc-7 (Debian 7.5.0-3) 7.5.0<br>
reproduce:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git checkout 4d49aa8a40ceecfd8a6=
b2d4e1b86396fbeedbb01<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # save the attached .config to l=
inux build tree<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; make ARCH=3Dx86_64 <br>
<br>
If you fix the issue, kindly add following tag<br>
Reported-by: kbuild test robot &lt;lkp@intel.com&gt;<br>
<br>
All errors (new ones prefixed by &gt;&gt;):<br>
<br>
&gt;&gt; cc1: fatal error: dkms/config/config.h: No such file or directory<=
br>
&nbsp;&nbsp; compilation terminated.<br>
<br>
---<br>
0-DAY kernel test infrastructure&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Open Source Technolog=
y Center<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;amp;da=
ta=3D02%7C01%7Ckevin1.wang%40amd.com%7C46d0b1e6805140d3728708d793b4188a%7C3=
dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637140274251196664&amp;amp;sdata=
=3DGrdbjBlNqVM%2BqpO%2FYypvMrQ6Q8zcuso%2BIyFOhT9BQ14%3D&amp;amp;reserved=3D=
0">https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist=
s.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;amp;data=3D02%=
7C01%7Ckevin1.wang%40amd.com%7C46d0b1e6805140d3728708d793b4188a%7C3dd8961fe=
4884e608e11a82d994e183d%7C0%7C0%7C637140274251196664&amp;amp;sdata=3DGrdbjB=
lNqVM%2BqpO%2FYypvMrQ6Q8zcuso%2BIyFOhT9BQ14%3D&amp;amp;reserved=3D0</a>
 Intel Corporation<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB3296709A03D6B1414B0A13C3A23E0MN2PR12MB3296namp_--

--===============1239605887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1239605887==--
