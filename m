Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B1A174F8D
	for <lists+dri-devel@lfdr.de>; Sun,  1 Mar 2020 21:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03D56E512;
	Sun,  1 Mar 2020 20:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FFE6E50E;
 Sun,  1 Mar 2020 20:30:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbaUebOgKjDWvuFwVVQSFOnUcNN64/YRuzP0+vryQHxTXXSyDjbPBxcn3BbWwx3ClYcffEbmxyp362CwQasjxD+TuK10BOE7kSHK11ZXu5dHWtSC+njAZIe8HDmgpbWt+JH7+gGTJodNn7kFgxckxhcGcQofonT55ep4E8cfJT8pL2wM7nEssejoQ76buAES5ASSlyLzujLsSwCvt6vTlXuLwyVOqVEHsLmbnbiikzfuAL3NDLWYVj3uW0p1B3bzLY1DJQxxXhhIxZfPTguvpf0gehI2/NId4s0ih+1yvjAByeROlXbn5nsHuYHkMH9lcZmIbqR4SNqXX8MPHsKZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwcW4sOl4oXKFrtBIrJkr9jv0R7H3GGPQSqdIwDnKeA=;
 b=DPmM0MC05fz4L7XPZIZmE/yZ9G03ERQxZ4GwYYqAuBfGstMi+udTicxfyFmyfNc/FEMrDxwY6kkFlsxix3FESvXzL+qA5vSzHxLcbLKsVkdh6CykXRiLw3n5w4N7LQvOC+EbA4Dy9AWF/tXbTeeY8PtVNJYovSyMeV0oUXhACPviM3YEbDUgZKhOG3eOx9jWiovM2o3saj6g55hRiFJRijqm23Aqy4NFIK4Q+CMQe4rPQtFW0FXlPHYF4ZdckMECt7eEpYwMOUMLeV7HfwykoZKOpEE/lIHcBlIfQvZFZTaHvH1lxZdirdshk6Z+EyUhgNWq6GO3x+AIsnvAQ1mTPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwcW4sOl4oXKFrtBIrJkr9jv0R7H3GGPQSqdIwDnKeA=;
 b=c4m1u7AtdDHvTfwkcjf30MEo6yoadliTsX1oYorAobqtN+nOXdlAC1aQv1cyVq+HBk2FVKhTZZ1dK6OdwYNdn5iRSruVoZkxyR6xK0EPfhPVWgTN3QYY401Yk7JxILmlo9FAJZ5GQG7rdnMWfYRHteXGi/t/Nocti21MiVKAxE4=
Received: from DM6PR12MB3097.namprd12.prod.outlook.com (2603:10b6:5:11d::25)
 by DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Sun, 1 Mar
 2020 20:30:08 +0000
Received: from DM6PR12MB3097.namprd12.prod.outlook.com
 ([fe80::c90d:ccf4:5717:9b46]) by DM6PR12MB3097.namprd12.prod.outlook.com
 ([fe80::c90d:ccf4:5717:9b46%5]) with mapi id 15.20.2772.019; Sun, 1 Mar 2020
 20:30:08 +0000
From: "Bridgman, John" <John.Bridgman@amd.com>
To: Jason Ekstrand <jason@jlekstrand.net>, Jacob Lifshay
 <programmerjake@gmail.com>, Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [Intel-gfx] [Mesa-dev] gitlab.fd.o financial situation and impact
 on services
Thread-Topic: [Intel-gfx] [Mesa-dev] gitlab.fd.o financial situation and
 impact on services
Thread-Index: AQHV8AahoZ9tljiROEiDQxFa1oB9xqg0L61O
Date: Sun, 1 Mar 2020 20:30:07 +0000
Message-ID: <DM6PR12MB3097EF3558FFD11BF7975BD6E8E60@DM6PR12MB3097.namprd12.prod.outlook.com>
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <b398161ff7d0268454413058dc6c194cf93f5990.camel@collabora.com>
 <ece8ebe3-40ec-2457-02da-4fef19cbe8f6@intel.com>
 <6d2ec570f957b4504fb70e0b1f0632712a99dc0c.camel@collabora.com>
 <CAPj87rO7BuKQj2Kei3T7RdkFq5=TiuShBvtrPU2sn0iqMfXSTg@mail.gmail.com>
 <59f4ea1f13a9a9d37f7801b93061b4ae7dd595e2.camel@gmail.com>
 <d0ef47e45c83b342494e6781b808b4831a008836.camel@ndufresne.ca>
 <9b0b31b8-7610-d5c5-790a-617178cc8c1e@daenzer.net>
 <93d7158b1ab49e51d14d991d5bdb2dba38ad6025.camel@ndufresne.ca>
 <CAC2bXD5OzDYtAcWAhpM_7Wwkbp2hpRszejjA7d0rqoypVdyDvA@mail.gmail.com>,
 <17097bfa848.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <17097bfa848.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-03-01T20:30:06.295Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=John.Bridgman@amd.com; 
x-originating-ip: [72.139.206.139]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 56a0b550-09d2-43b9-849c-08d7be1f5544
x-ms-traffictypediagnostic: DM6PR12MB4401:
x-microsoft-antispam-prvs: <DM6PR12MB4401256CCC33327AFC92FCA3E8E60@DM6PR12MB4401.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0329B15C8A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(199004)(189003)(53546011)(6506007)(7696005)(8936002)(81166006)(81156014)(8676002)(19627405001)(4326008)(54906003)(110136005)(5660300002)(316002)(2906002)(7416002)(478600001)(55016002)(966005)(66946007)(76116006)(52536014)(66476007)(26005)(86362001)(186003)(9686003)(66446008)(64756008)(71200400001)(66556008)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4401;
 H:DM6PR12MB3097.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rhGYvkKjwviki8vhAl04wUN2AE71EwM8AxZICx6cSEuYRITP2f+cgTTm/pOgs26owPs3lYvw9cX1bWU4YqvsCOc5sgk7sKvrDt+6EBxe/vKmWPsKxagOVMJaBUf0rSLI5Jhtdei4j4fyCNx3lmfz5mXaDkdmvFSVRVy8mxllJNrXR6iP6ykEts261X31aAlrp4Vwk/SHHtuXWSk+k+T+ZObFMyYUZ8hyBwui+mGCnzhDbql5KNeZQu0C8T7dIiiKxAxqMaPCFV3ndwYBKrJlD/Fpt+OChoHC3oatPeUeXGaYQJ4gbaR0JATXi7yz/FOe89E8PnH6DFwxpoBr24KR7iV11gyXvIJUM9hf9R7wXltKgdersCGTCgwdEKDnboTBO9vQXZEFDFfsCXJMzo+is+DAS6uI/bkk5+yDKz3xwUDNRTlaHmh4LpcV0IsOo7ChVD275QOyf873fiClu+WkbHRV6IB22z/zcYJZRlYUr0A=
x-ms-exchange-antispam-messagedata: 1W3yCHwofeIY0WN6i+AiS4iv4obrXClKKvPixscl8DXqVUPmZnyy5udiwcJTccfkgYsTnuqSTh4wB+m6qXp8xs/cM6EXGEaRC9L4qXoXwpENF1FOmdlKMX/UYillXDnna7AQjws/fzllYmO9vKQTFg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a0b550-09d2-43b9-849c-08d7be1f5544
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2020 20:30:07.8132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VYzFy7n9tSXu+j8TryFkk14RENIhwufd9WRizQaud6pXUjCp87TJfr6HyFfKlFVapoVSbkkVXSt7ezlzJl9SZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4401
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
Cc: Erik Faye-Lund <erik.faye-lund@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?iso-8859-1?Q?Michel_D=E4nzer?= <michel@daenzer.net>,
 "X.Org development" <xorg-devel@lists.x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2035231075=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2035231075==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB3097EF3558FFD11BF7975BD6E8E60DM6PR12MB3097namp_"

--_000_DM6PR12MB3097EF3558FFD11BF7975BD6E8E60DM6PR12MB3097namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

The one suggestion I saw that definitely seemed worth looking at was adding=
 download caches if the larger CI systems didn't already have them.

Then again do we know that CI traffic is generating the bulk of the costs ?=
 My guess would have been that individual developers and users would be gen=
erating as much traffic as the CI rigs.

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Jason Ek=
strand <jason@jlekstrand.net>
Sent: March 1, 2020 3:18 PM
To: Jacob Lifshay <programmerjake@gmail.com>; Nicolas Dufresne <nicolas@ndu=
fresne.ca>
Cc: Erik Faye-Lund <erik.faye-lund@collabora.com>; Daniel Vetter <daniel.ve=
tter@ffwll.ch>; Michel D=E4nzer <michel@daenzer.net>; X.Org development <xo=
rg-devel@lists.x.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>; waylan=
d <wayland-devel@lists.freedesktop.org>; X.Org Foundation Board <board@foun=
dation.x.org>; Xorg Members List <members@x.org>; dri-devel <dri-devel@list=
s.freedesktop.org>; Mesa Dev <mesa-dev@lists.freedesktop.org>; intel-gfx <i=
ntel-gfx@lists.freedesktop.org>; Discussion of the development of and with =
GStreamer <gstreamer-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [Mesa-dev] gitlab.fd.o financial situation and imp=
act on services

I don't think we need to worry so much about the cost of CI that we need to=
 micro-optimize to to get the minimal number of CI runs. We especially shou=
ldn't if it begins to impact coffee quality, people's ability to merge patc=
hes in a timely manner, or visibility into what went wrong when CI fails. I=
've seen a number of suggestions which will do one or both of those things =
including:

 - Batching merge requests
 - Not running CI on the master branch
 - Shutting off CI
 - Preventing CI on other non-MR branches
 - Disabling CI on WIP MRs
 - I'm sure there are more...

I think there are things we can do to make CI runs more efficient with some=
 sort of end-point caching and we can probably find some truly wasteful CI =
to remove. Most of the things in the list above, I've seen presented by peo=
ple who are only lightly involved the project to my knowledge (no offense t=
o anyone intended).  Developers depend on the CI system for their day-to-da=
y work and hampering it will only show down development, reduce code qualit=
y, and ultimately hurt our customers and community. If we're so desperate a=
s to be considering painful solutions which will have a negative impact on =
development, we're better off trying to find more money.

--Jason


On March 1, 2020 13:51:32 Jacob Lifshay <programmerjake@gmail.com> wrote:

One idea for Marge-bot (don't know if you already do this):
Rust-lang has their bot (bors) automatically group together a few merge req=
uests into a single merge commit, which it then tests, then, then the tests=
 pass, it merges. This could help reduce CI runs to once a day (or some oth=
er rate). If the tests fail, then it could automatically deduce which one f=
ailed, by recursive subdivision or similar. There's also a mechanism to adj=
ust priority and grouping behavior when the defaults aren't sufficient.

Jacob
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org<mailto:Intel-gfx%40lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/intel-gfx<https://nam11.safe=
links.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.freedesktop.org%2Fm=
ailman%2Flistinfo%2Fintel-gfx&data=3D02%7C01%7Cjohn.bridgman%40amd.com%7C96=
fa507073f24b02f4b808d7be1daf8a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7=
C637186907338419170&sdata=3DeT%2FUHbHaS1bZdvQOPjJ6wm0pqZSj2YE8k54%2FZHurRgA=
%3D&reserved=3D0>



--_000_DM6PR12MB3097EF3558FFD11BF7975BD6E8E60DM6PR12MB3097namp_
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
The one suggestion I saw that definitely seemed worth looking at was adding=
 download caches if the larger CI systems didn't already have them.
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Then again do we know that CI traffic is generating the bulk of the costs ?=
 My guess would have been that individual developers and users would be gen=
erating as much traffic as the CI rigs.
<br>
</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Jason Ekstrand &lt;jason@jl=
ekstrand.net&gt;<br>
<b>Sent:</b> March 1, 2020 3:18 PM<br>
<b>To:</b> Jacob Lifshay &lt;programmerjake@gmail.com&gt;; Nicolas Dufresne=
 &lt;nicolas@ndufresne.ca&gt;<br>
<b>Cc:</b> Erik Faye-Lund &lt;erik.faye-lund@collabora.com&gt;; Daniel Vett=
er &lt;daniel.vetter@ffwll.ch&gt;; Michel D=E4nzer &lt;michel@daenzer.net&g=
t;; X.Org development &lt;xorg-devel@lists.x.org&gt;; amd-gfx list &lt;amd-=
gfx@lists.freedesktop.org&gt;; wayland &lt;wayland-devel@lists.freedesktop.=
org&gt;;
 X.Org Foundation Board &lt;board@foundation.x.org&gt;; Xorg Members List &=
lt;members@x.org&gt;; dri-devel &lt;dri-devel@lists.freedesktop.org&gt;; Me=
sa Dev &lt;mesa-dev@lists.freedesktop.org&gt;; intel-gfx &lt;intel-gfx@list=
s.freedesktop.org&gt;; Discussion of the development of and with
 GStreamer &lt;gstreamer-devel@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [Intel-gfx] [Mesa-dev] gitlab.fd.o financial situation =
and impact on services</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"auto">
<div dir=3D"auto">I don't think we need to worry so much about the cost of =
CI that we need to micro-optimize to to get the minimal number of CI runs. =
We especially shouldn't if it begins to impact coffee quality, people's abi=
lity to merge patches in a timely
 manner, or visibility into what went wrong when CI fails. I've seen a numb=
er of suggestions which will do one or both of those things including:</div=
>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">&nbsp;- Batching merge requests</div>
<div dir=3D"auto">&nbsp;- Not running CI on the master branch</div>
<div dir=3D"auto">&nbsp;- Shutting off CI</div>
<div dir=3D"auto">&nbsp;- Preventing CI on other non-MR branches</div>
<div dir=3D"auto">&nbsp;- Disabling CI on WIP MRs</div>
<div dir=3D"auto">&nbsp;- I'm sure there are more...</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">I think there are things we can do to make CI runs more e=
fficient with some sort of end-point caching and we can probably find some =
truly wasteful CI to remove. Most of the things in the list above, I've see=
n presented by people who are only
 lightly involved the project to my knowledge (no offense to anyone intende=
d).&nbsp; Developers depend on the CI system for their day-to-day work and =
hampering it will only show down development, reduce code quality, and ulti=
mately hurt our customers and community.
 If we're so desperate as to be considering painful solutions which will ha=
ve a negative impact on development, we're better off trying to find more m=
oney.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">--Jason</div>
<div dir=3D"auto"><br>
</div>
<div id=3D"x_aqm-original" style=3D"color:black">
<div class=3D"x_aqm-original-body">
<div style=3D"color:black">
<p style=3D"color:black; font-size:10pt; font-family:sans-serif; margin:8pt=
 0">On March 1, 2020 13:51:32 Jacob Lifshay &lt;programmerjake@gmail.com&gt=
; wrote:</p>
<blockquote type=3D"cite" class=3D"x_gmail_quote" style=3D"margin:0 0 0 0.7=
5ex; border-left:1px solid #808080; padding-left:0.75ex">
<div dir=3D"auto">One idea for Marge-bot (don't know if you already do this=
):
<div dir=3D"auto">Rust-lang has their bot (bors) automatically group togeth=
er a few merge requests into a single merge commit, which it then tests, th=
en, then the tests pass, it merges. This could help reduce CI runs to once =
a day (or some other rate). If the
 tests fail, then it could automatically deduce which one failed, by recurs=
ive subdivision or similar. There's also a mechanism to adjust priority and=
 grouping behavior when the defaults aren't sufficient.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Jacob</div>
</div>
<div>_______________________________________________</div>
<div>Intel-gfx mailing list</div>
<div><a class=3D"x_aqm-autolink x_aqm-autowrap" href=3D"mailto:Intel-gfx%40=
lists.freedesktop.org">Intel-gfx@lists.freedesktop.org</a></div>
<div><a class=3D"x_aqm-autolink x_aqm-autowrap" href=3D"https://nam11.safel=
inks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.freedesktop.org%2Fma=
ilman%2Flistinfo%2Fintel-gfx&amp;data=3D02%7C01%7Cjohn.bridgman%40amd.com%7=
C96fa507073f24b02f4b808d7be1daf8a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C=
0%7C637186907338419170&amp;sdata=3DeT%2FUHbHaS1bZdvQOPjJ6wm0pqZSj2YE8k54%2F=
ZHurRgA%3D&amp;reserved=3D0" originalsrc=3D"https://lists.freedesktop.org/m=
ailman/listinfo/intel-gfx" shash=3D"ktF1cEQ0POHqVykcchKCtEugYe4EbGyHOPmY/qj=
0sk5Ennmjm7g2mePEyf/qXfXQvSZMPJVrCTC/gNnWszjsskSxZAeCeaW7i6Yy&#43;hdYU3IAic=
UGztA&#43;RAQ6yhvgltrWmHah3Uh8ypc1YQrVADhiKZ9UC38Pk6z0FMxiz/7FWnw=3D">https=
://lists.freedesktop.org/mailman/listinfo/intel-gfx</a></div>
<div><br>
</div>
</blockquote>
</div>
</div>
</div>
<div dir=3D"auto"><br>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DM6PR12MB3097EF3558FFD11BF7975BD6E8E60DM6PR12MB3097namp_--

--===============2035231075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2035231075==--
