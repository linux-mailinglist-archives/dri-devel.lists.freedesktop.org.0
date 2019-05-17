Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E9C21826
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 14:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC988984E;
	Fri, 17 May 2019 12:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750077.outbound.protection.outlook.com [40.107.75.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47D28984E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 12:28:44 +0000 (UTC)
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3919.namprd12.prod.outlook.com (10.255.238.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 12:28:42 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::385d:9453:a16d:3964]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::385d:9453:a16d:3964%6]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 12:28:42 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 =?iso-8859-1?Q?Michel_D=E4nzer?= <michel@daenzer.net>, "Zhou,
 David(ChunMing)" <David1.Zhou@amd.com>
Subject: Re:[PATCH libdrm] enable syncobj test depending on capability
Thread-Topic: Re:[PATCH libdrm] enable syncobj test depending on capability
Thread-Index: AQHVDJWJ87hH3Em/M0edhXiy18FEOKZvFDcAgAAmYgCAAARc4g==
Date: Fri, 17 May 2019 12:28:42 +0000
Message-ID: <iuca3rriuy61ilmprn7wjpxafclwjn-par0kv-n5se1uvs8pejoxgl1d1tv9e7-suc50po1nq5dp8g58yk4yiap-pn8vbp-u5q05h-bqtpqfswj30t-5msp9f-xh7906-cs7026x7ja36kggkcls4qiau.1558096119187@email.android.com>
References: <20190516104642.21450-1-david1.zhou@amd.com>
 <278437b6-c5f0-209b-443b-573b4143f944@amd.com>
 <-yw2q6u7xkjpo-i83eg9msudz1wgjn7w-b101h0-sfv5ag1noxjz2wg54r-iuw7ml-f519uls55cqypexnfa-et96uc-nx96jg5fu1d3-wn1hxg-td9bpo5n1nbv-wmnwfr84y609mm8lnpxqaf92-n4k5l3.1558004611599@email.android.com>
 <144963b9-d1e5-2afb-c02e-58dd6ba19a3e@amd.com>
 <f80c8b88-1dad-26ae-4de2-ec5e3fac289d@daenzer.net>,
 <dd6450e5-a622-94bb-9bef-bed7dd901af8@amd.com>
In-Reply-To: <dd6450e5-a622-94bb-9bef-bed7dd901af8@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.86.234.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73f12d9d-3cf6-4b06-9e22-08d6dac332fd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3919; 
x-ms-traffictypediagnostic: MN2PR12MB3919:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3919202E03AC23274C270EEFB40B0@MN2PR12MB3919.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(396003)(376002)(346002)(366004)(13464003)(189003)(199004)(53936002)(186003)(26005)(6512007)(9686003)(76116006)(14444005)(54896002)(236005)(256004)(86362001)(486006)(66066001)(476003)(66946007)(73956011)(66446008)(64756008)(66556008)(66476007)(446003)(91956017)(6306002)(11346002)(606006)(68736007)(7736002)(53546011)(6506007)(76176011)(478600001)(2906002)(102836004)(72206003)(3846002)(316002)(6116002)(966005)(99286004)(110136005)(6436002)(4744005)(25786009)(14454004)(8936002)(5660300002)(6486002)(66574012)(71190400001)(71200400001)(81166006)(81156014)(4326008)(8676002)(87826002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3919;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WZj2I2UEIyx0ISi5Z17I7hL/1/sxYUgOb56VfbjCJ1wgOHi82MJL0JV3SGtwOh963tLCsf2NbwyLbuhvFzXYoJgSSRl5sd8yStfUh9qkXuqmS6bpgNV0IMxRKbYvw6t2QYt90UpEtxs1uuGI3/bp0Agp6FoH8lswIcglzl3WskRk6QiGXBdMz0f3EKIRv+NWgjPrIOxNloiK9oJIuvhX/J69Ymt8+EAgSXUsnEdJ8X9pBd8VbT6LVQzhqZlAxLOecnNSZ+jVwWKbWk/nHA5lmDt02uVyZ7YD/3ixnjFMsqwFHdK9FCvxh7lMN4nm7XSPEUgr2dcpRqFrvqFPdB9iQGN6worwnASU+VKh92SjGvXvPADq+DzEWAZs5jHYie7kxpUagQ2eonfVSxrlTq6Fi9mzB3uxp0dvMrgPJq2vW1s=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f12d9d-3cf6-4b06-9e22-08d6dac332fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 12:28:42.6664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3919
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpiDIbOw6ReGALTM+wG5QUlViht9k2yumdIn9zkgFVQ=;
 b=BXRZf43CcMLztuMlm7BT2h5SiEyJV5687rOrpX9f+/UczFrlCoYvJ71PJU2Z2M8zyMVkp5eqYLTfOyTDjzyYAfGwykk8roLrOAaF1ri076gFq3zlzvx5e/KGlI88UB4XQHeHzooMCUEvO1lZaIVC4DnMYJiuaPKTYfAy+K5L0jk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0400848931=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0400848931==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_iuca3rriuy61ilmprn7wjpxafclwjnpar0kvn5se1uvs8pejoxgl1d1_"

--_000_iuca3rriuy61ilmprn7wjpxafclwjnpar0kvn5se1uvs8pejoxgl1d1_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Can you guy do that? Otherwise if kernel driver doesn't set that cap, test =
could fail.

Thanks,
-David

-------- Original Message --------
Subject: Re: [PATCH libdrm] enable syncobj test depending on capability
From: "Koenig, Christian"
To: Michel D=E4nzer ,"Zhou, David(ChunMing)" ,"Zhou, David(ChunMing)"
CC: dri-devel@lists.freedesktop.org

Am 17.05.19 um 11:55 schrieb Michel D=E4nzer:
> [CAUTION: External Email]
>
> On 2019-05-17 11:47 a.m., zhoucm1 wrote:
>> ping, Could you help check in patch to gitlab? My connection to gitlab
>> still has problem.
> Please follow the process documented in include/drm/README for
> include/drm/drm.h .

Yeah, the header should be updated separately to what is currently in
drm-next (or drm-misc-next).

And then we can update the fix on top of that,
Christian.

>
>
> --
> Earthling Michel D=E4nzer               |              https://www.amd.co=
m
> Libre software enthusiast             |             Mesa and X developer


--_000_iuca3rriuy61ilmprn7wjpxafclwjnpar0kvn5se1uvs8pejoxgl1d1_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>Can you guy do that? Otherwise if kernel driver doesn't set that cap, =
test could fail.<br>
<br>
Thanks,<br>
-David<br>
<br>
-------- Original Message --------<br>
Subject: Re: [PATCH libdrm] enable syncobj test depending on capability<br>
From: &quot;Koenig, Christian&quot; <br>
To: Michel D=E4nzer ,&quot;Zhou, David(ChunMing)&quot; ,&quot;Zhou, David(C=
hunMing)&quot; <br>
CC: dri-devel@lists.freedesktop.org<br>
<br>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Am 17.05.19 um 11:55 schrieb Michel D=E4nzer:<br>
&gt; [CAUTION: External Email]<br>
&gt;<br>
&gt; On 2019-05-17 11:47 a.m., zhoucm1 wrote:<br>
&gt;&gt; ping, Could you help check in patch to gitlab? My connection to gi=
tlab<br>
&gt;&gt; still has problem.<br>
&gt; Please follow the process documented in include/drm/README for<br>
&gt; include/drm/drm.h .<br>
<br>
Yeah, the header should be updated separately to what is currently in <br>
drm-next (or drm-misc-next).<br>
<br>
And then we can update the fix on top of that,<br>
Christian.<br>
<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Earthling Michel D=E4nzer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://www.amd.com=
">
https://www.amd.com</a><br>
&gt; Libre software enthusiast&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; Mesa and X developer<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_iuca3rriuy61ilmprn7wjpxafclwjnpar0kvn5se1uvs8pejoxgl1d1_--

--===============0400848931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0400848931==--
