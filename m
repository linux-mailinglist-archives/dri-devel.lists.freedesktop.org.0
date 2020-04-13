Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E51191A6D03
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 22:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB39F89D87;
	Mon, 13 Apr 2020 20:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690049.outbound.protection.outlook.com [40.107.69.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8A089D87;
 Mon, 13 Apr 2020 20:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuZVJf5HsoWJLevVnzpIFprjE15GjkDEP1a40nj4OZ2aq+GnBuu496kptw0YUEAopHWcu6d6RwQq3M1rPEcrDJn5XFjJi1DgVtOzsFmRhd5kyxvRWSfTQ7hK2pRu0NCcJ755u3H7kO06ldkFDM0oJsaReixCRnQNXss1dRene/WlP57i3Zw2B6xs+MX4H+3Jmgwmnx9a2bWtCXM3UmlpdyTMnvYDG970VhdZYQRcLQPytsKUx9rB5d39xhCen8NPNg8B2L+k0rL4zWwW0wMWxwcy3nrLUF2VxizYupqexvlBZmnTxz73H1ayiJch34NNp8AF4G4eBJbSBmdkQs12Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HDN964L3IYmQaJjJGdyQvWLrXuHRuqLvwxwrAWYjWo=;
 b=XAna71dLzxRaQ7eUW7fH3ORh8fEh56mBFw+AgvFYHzG9v1xJNQ4SQHGWTGsqKhfAWZucOh4UYX60HuSfQcxB8+cagcGA/MUONuQFmp8F4nrjFEj55oD/jgfftHlO9U32HU1BaaryFpru7kZWGYK5iCCoe9laNKSOdoOAoZb/WN960bUO3udu7gT87eQHi33BsI8OvHwtXOstxfuCb/OE1ZJD+1UvBlVUROW0gQcMxm6cElW30Vvkip+GoTGNwihMW8RgcIoz0uYp/ivK6A+gyH/0GSjB3qQpb+JtJ9pjGCvrJSdySV/lvUZTJ9aaGn4zR7t+GQnZjP2wg+nVz88ufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HDN964L3IYmQaJjJGdyQvWLrXuHRuqLvwxwrAWYjWo=;
 b=RoKjdlSX/85TNGBx54CqcsItI5AELnK0kOzAbqKW/Dv9StLWKe4Zot2yiCO+RLy9ENgdak42TCcJXDjJ0WuXNQPtaYt3F+siKXIb3HM7ErrhHhcQ0DvAz97h4xAelf7q6plaVGjmhXcbT3m9Q4lDFrvRhC64gBndpbr1BoYhHEQ=
Received: from DM6PR12MB3996.namprd12.prod.outlook.com (2603:10b6:5:1c1::31)
 by DM6PR12MB3418.namprd12.prod.outlook.com (2603:10b6:5:116::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.28; Mon, 13 Apr
 2020 20:12:56 +0000
Received: from DM6PR12MB3996.namprd12.prod.outlook.com
 ([fe80::8111:a00b:8293:ba1c]) by DM6PR12MB3996.namprd12.prod.outlook.com
 ([fe80::8111:a00b:8293:ba1c%4]) with mapi id 15.20.2900.028; Mon, 13 Apr 2020
 20:12:56 +0000
From: "Ho, Kenny" <Kenny.Ho@amd.com>
To: Tejun Heo <tj@kernel.org>, Kenny Ho <y2kenny@gmail.com>
Subject: Re: [PATCH v2 00/11] new cgroup controller for gpu/drm subsystem
Thread-Topic: [PATCH v2 00/11] new cgroup controller for gpu/drm subsystem
Thread-Index: AQHV7NdAtJDkPVX4/kS2rnKQbqOvE6hNEXkAgAst7ICAAADPgIAfdNEAgAAAkXw=
Date: Mon, 13 Apr 2020 20:12:56 +0000
Message-ID: <DM6PR12MB399645C60BE2F5E3CC4F852883DD0@DM6PR12MB3996.namprd12.prod.outlook.com>
References: <20200226190152.16131-1-Kenny.Ho@amd.com>
 <CAOWid-eyMGZfOyfEQikwCmPnKxx6MnTm17pBvPeNpgKWi0xN-w@mail.gmail.com>
 <20200324184633.GH162390@mtj.duckdns.org>
 <CAOWid-cS-5YkFBLACotkZZCH0RSjHH94_r3VFH8vEPOubzSpPA@mail.gmail.com>,
 <20200413191136.GI60335@mtj.duckdns.org>
In-Reply-To: <20200413191136.GI60335@mtj.duckdns.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-04-13T20:12:55.333Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Kenny.Ho@amd.com; 
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 72b6710b-de19-49d1-9b6a-08d7dfe70e58
x-ms-traffictypediagnostic: DM6PR12MB3418:|DM6PR12MB3418:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB34188C31D71FCAAB628407F883DD0@DM6PR12MB3418.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3996.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(5660300002)(66946007)(33656002)(66476007)(66556008)(64756008)(66446008)(478600001)(316002)(9686003)(110136005)(52536014)(55016002)(76116006)(54906003)(4326008)(8936002)(71200400001)(2906002)(86362001)(26005)(81156014)(8676002)(186003)(19627405001)(6506007)(7696005)(53546011);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: waoyhu8QydWyMvyZYOOHoE5+D8EWnMo3Qhu09AQoh7uiYaTebc7hG4mryD4DWIciO6evpBRucy5cOl1V+3zcL9hoDpqQAFskJnySj6yxMcScLw6MSpSOs4Qla7i5LeExH8ye6nIKWXPopD2PSyXZA/TQjIz/0wwUpbV82DwtID6d4j7fgol2RpOMq8lrvUdJ91cL6VCyVesgJayZiPkVONsvpfMfJJ26+huD9cdW9yDS8gQCM4ceZltcPUzedgG43r41ltLvSc9Sbancb+rX86DvXF2U8C7ur2RcqajANRo97FbP8mKDfMIGq46ccianG9ciU3s/EjUFt7HQg9f97gKxEnLVp+0m1FQxKNpt/QNrdm4ZqYLjOhTsr065SemdalcJqhqaYx6baY6eQBSUhcOtbiwDlTbQW4oL69VAESFQjXa8D+GRHjn4qUZgFBrX
x-ms-exchange-antispam-messagedata: JbkFTTH3tNPNaHw7CSPyugkZ0K4mnlhd/HG/RMavqqPOourQu0fLRJMuZProoMrm8GYqTJG97NaIaQw16U0nyk56eliIJd0v/TITuArUB/Q063huV7IksOocVx2uiyJZORxH3rpuYzdmHlgo6QuWyw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b6710b-de19-49d1-9b6a-08d7dfe70e58
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 20:12:56.5203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qf4d7SAQRd60TCHZAH07mbMjXuxmCqZXkgw0LzJJ8biyseJyuiPJ3u7tBJfol/op
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3418
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "jsparks@cray.com" <jsparks@cray.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Larry Kaplan <lkaplan@cray.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Greathouse,
 Joseph" <Joseph.Greathouse@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1338284564=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1338284564==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB399645C60BE2F5E3CC4F852883DD0DM6PR12MB3996namp_"

--_000_DM6PR12MB399645C60BE2F5E3CC4F852883DD0DM6PR12MB3996namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Hi Tejun,

Thanks for taking the time to reply.

Perhaps we can even narrow things down to just gpu.weight/gpu.compute.weigh=
t as a start?  In this aspect, is the key objection to the current implemen=
tation of gpu.compute.weight the work-conserving bit?  This work-conserving=
 requirement is probably what I have missed for the last two years (and hen=
ce going in circle.)

If this is the case, can you clarify/confirm the followings?

1) Is resource scheduling goal of cgroup purely for the purpose of throughp=
ut?  (at the expense of other scheduling goals such as latency.)
2) If 1) is true, under what circumstances will the "Allocations" resource =
distribution model (as defined in the cgroup-v2) be acceptable?
3) If 1) is true, are things like cpuset from cgroup v1 no longer acceptabl=
e going forward?

To be clear, while some have framed this (time sharing vs spatial sharing) =
as a partisan issue, it is in fact a technical one.  I have implemented the=
 gpu cgroup support this way because we have a class of users that value lo=
w latency/low jitter/predictability/synchronicity.  For example, they would=
 like 4 tasks to share a GPU and they would like the tasks to start and fin=
ish at the same time.

What is the rationale behind picking the Weight model over Allocations as t=
he first acceptable implementation?  Can't we have both work-conserving and=
 non-work-conserving ways of distributing GPU resources?  If we can, why no=
t allow non-work-conserving implementation first, especially when we have u=
sers asking for such functionality?

Regards,
Kenny


________________________________
From: Tejun Heo <htejun@gmail.com> on behalf of Tejun Heo <tj@kernel.org>
Sent: Monday, April 13, 2020 3:11 PM
To: Kenny Ho <y2kenny@gmail.com>
Cc: Ho, Kenny <Kenny.Ho@amd.com>; cgroups@vger.kernel.org <cgroups@vger.ker=
nel.org>; dri-devel <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-gf=
x@lists.freedesktop.org>; Deucher, Alexander <Alexander.Deucher@amd.com>; K=
oenig, Christian <Christian.Koenig@amd.com>; Kuehling, Felix <Felix.Kuehlin=
g@amd.com>; Greathouse, Joseph <Joseph.Greathouse@amd.com>; jsparks@cray.co=
m <jsparks@cray.com>
Subject: Re: [PATCH v2 00/11] new cgroup controller for gpu/drm subsystem

Hello, Kenny.

On Tue, Mar 24, 2020 at 02:49:27PM -0400, Kenny Ho wrote:
> Can you elaborate more on what are the missing pieces?

Sorry about the long delay, but I think we've been going in circles for qui=
te
a while now. Let's try to make it really simple as the first step. How abou=
t
something like the following?

* gpu.weight (should it be gpu.compute.weight? idk) - A single number
  per-device weight similar to io.weight, which distributes computation
  resources in work-conserving way.

* gpu.memory.high - A single number per-device on-device memory limit.

The above two, if works well, should already be plenty useful. And my guess=
 is
that getting the above working well will be plenty challenging already even
though it's already excluding work-conserving memory distribution. So, let'=
s
please do that as the first step and see what more would be needed from the=
re.

Thanks.

--
tejun

--_000_DM6PR12MB399645C60BE2F5E3CC4F852883DD0DM6PR12MB3996namp_
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
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hi Tejun,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Thanks for taking the time to reply.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Perhaps we can even narrow things down to just gpu.weight/gpu.compute.weigh=
t as a start?&nbsp; In this aspect, is the key objection to the current imp=
lementation of gpu.compute.weight the work-conserving bit?&nbsp; This work-=
conserving requirement is probably what I
 have missed for the last two years (and hence going in circle.)</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
If this is the case, can you clarify/confirm the followings?</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
1) Is resource scheduling goal of cgroup purely for the purpose of throughp=
ut?&nbsp; (at the expense of other scheduling goals such as latency.)</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
2) If 1) is true, under what circumstances will the &quot;Allocations&quot;=
 resource distribution model (as defined in the cgroup-v2) be acceptable?</=
div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
3) If 1) is true, are things like cpuset from cgroup v1 no longer acceptabl=
e going forward?</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
To be clear, while some have framed this (time sharing vs spatial sharing) =
as a partisan issue, it is in fact a technical one.&nbsp; I have implemente=
d the gpu cgroup support this way because we have a class of users that val=
ue low latency/low jitter/predictability/synchronicity.&nbsp;
 For example, they would like 4 tasks to share a GPU and they would like th=
e tasks to start and finish at the same time.<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
What is the rationale behind picking the Weight model over Allocations as t=
he first acceptable implementation?&nbsp; Can't we have both work-conservin=
g and non-work-conserving ways of distributing GPU resources?&nbsp; If we c=
an, why not allow non-work-conserving implementation
 first, especially when we have users asking for such functionality?</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Kenny<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size: 11pt;" data=
-ogsc=3D"" face=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Teju=
n Heo &lt;htejun@gmail.com&gt; on behalf of Tejun Heo &lt;tj@kernel.org&gt;=
<br>
<b>Sent:</b> Monday, April 13, 2020 3:11 PM<br>
<b>To:</b> Kenny Ho &lt;y2kenny@gmail.com&gt;<br>
<b>Cc:</b> Ho, Kenny &lt;Kenny.Ho@amd.com&gt;; cgroups@vger.kernel.org &lt;=
cgroups@vger.kernel.org&gt;; dri-devel &lt;dri-devel@lists.freedesktop.org&=
gt;; amd-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;; Deucher, Alexander=
 &lt;Alexander.Deucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@=
amd.com&gt;;
 Kuehling, Felix &lt;Felix.Kuehling@amd.com&gt;; Greathouse, Joseph &lt;Jos=
eph.Greathouse@amd.com&gt;; jsparks@cray.com &lt;jsparks@cray.com&gt;<br>
<b>Subject:</b> Re: [PATCH v2 00/11] new cgroup controller for gpu/drm subs=
ystem</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hello, Kenny.<br>
<br>
On Tue, Mar 24, 2020 at 02:49:27PM -0400, Kenny Ho wrote:<br>
&gt; Can you elaborate more on what are the missing pieces?<br>
<br>
Sorry about the long delay, but I think we've been going in circles for qui=
te<br>
a while now. Let's try to make it really simple as the first step. How abou=
t<br>
something like the following?<br>
<br>
* gpu.weight (should it be gpu.compute.weight? idk) - A single number<br>
&nbsp; per-device weight similar to io.weight, which distributes computatio=
n<br>
&nbsp; resources in work-conserving way.<br>
<br>
* gpu.memory.high - A single number per-device on-device memory limit.<br>
<br>
The above two, if works well, should already be plenty useful. And my guess=
 is<br>
that getting the above working well will be plenty challenging already even=
<br>
though it's already excluding work-conserving memory distribution. So, let'=
s<br>
please do that as the first step and see what more would be needed from the=
re.<br>
<br>
Thanks.<br>
<br>
-- <br>
tejun<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM6PR12MB399645C60BE2F5E3CC4F852883DD0DM6PR12MB3996namp_--

--===============1338284564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1338284564==--
