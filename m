Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B88D2FBBFA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 17:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C146E422;
	Tue, 19 Jan 2021 16:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30D66E422;
 Tue, 19 Jan 2021 16:08:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htAftEFOuUfoSu4G3i5+RoDQVntuAsEJM7vK6rp2z8ZlKzzQo6gwxTo+IYgXqrFueEj8RJFb6TwBUMDKo8LFpb/BwIIKOF5WdW52IG7ntU7pNKO5mnnYc/iiO7HYxDXY4uJqGLra8gY+x+n/GFVXmTEheHKFBARRP/7/Z63la3AUQGbAwA2gNOlao4RYxS4SSXyLKjC+3LFkt82Cc0X+e940+3AuY04WTAribSPM0ZWVBZ6221jLexnyAAHGMzblFv1GXmGl+mzVi4XbvGenJ5etagdpzwPFtf0uUVSA9rzLpUEpAYVieydyip4riEexse+Y0XhDYKAdG3z5oQ9vog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxB6ghpZX9iqb/+iUeJF+fQG4z1tHQte/Uc4TW1t7tM=;
 b=c7vDS+xIHB44dE2MpLp6FTyhKM07sJM7UkDG/AQhmx+b+PeEppZFN3tem7B9XaycH5e96ZtT5WDXEK0tam4IYp9opBKZwBubC6i5Ll5H0lNulX4suPmnl6aYa1oMGaPOzgIaMfEbjeuIAyUkPZUoTKJE5vrErvmCMxkYXqAkd2H7XXXOtBncRn6knZ0qJ1Zqiuv+Dt4dKxNhAFAelzgbyPg5TPf0OyH0vmaIXThwDT5q8R03JYJjQH7aVVxfZM1zGfJaR2P5cnE9MQFiDI668HgSmhLUsELbF8UQ3LN3f1ESChj+sNRfbLfxlcVtt9hD3l6KEB1uKp5iXnz6NcY3cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxB6ghpZX9iqb/+iUeJF+fQG4z1tHQte/Uc4TW1t7tM=;
 b=ejMZnzVQMJzFU03oJfgBhLHkDUPRCADiDZ0pzOgOH+/n2lWgI+VxlSTGpbGHlG06WH2POXAmSoOBirT8wO7eH+CEy2jnb1YhlYzxLdUD++/sb3LzJehfI6Z8HjagYgufR2cEqCx6eqsL1jdQe5ZNCV6E1/e68sVC+r8ChSHLuNk=
Received: from BN6PR12MB1939.namprd12.prod.outlook.com (2603:10b6:404:107::12)
 by BN6PR1201MB0083.namprd12.prod.outlook.com (2603:10b6:405:54::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Tue, 19 Jan
 2021 16:08:55 +0000
Received: from BN6PR12MB1939.namprd12.prod.outlook.com
 ([fe80::584b:493b:4126:e042]) by BN6PR12MB1939.namprd12.prod.outlook.com
 ([fe80::584b:493b:4126:e042%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 16:08:55 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 1/3] drm/amd/display: Add module parameter for freesync
 video mode
Thread-Topic: [PATCH v3 1/3] drm/amd/display: Add module parameter for
 freesync video mode
Thread-Index: AQHW4t3Am/FXYHcVBUunOo4xmFRk4qom5aqAgAajTYCAAS1MAIAATReAgAAxWEc=
Date: Tue, 19 Jan 2021 16:08:54 +0000
Message-ID: <BN6PR12MB1939001BFDF87A88748163498BA30@BN6PR12MB1939.namprd12.prod.outlook.com>
References: <20210104210800.789944-1-aurabindo.pillai@amd.com>
 <20210104210800.789944-2-aurabindo.pillai@amd.com>
 <20210114111445.1d2bbf62@eldfell>
 <b38e46b7707ba9a899384baedc7efe4e70c439bf.camel@amd.com>
 <20210119103510.01f55ee4@eldfell>,
 <CAKMK7uGKqA7mMorSBtV255pPxA=adPEP0Bcwot8OMmBVCKV_uQ@mail.gmail.com>
In-Reply-To: <CAKMK7uGKqA7mMorSBtV255pPxA=adPEP0Bcwot8OMmBVCKV_uQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-01-19T16:08:54.233Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6c76b943-cdc6-4f34-8d9c-08d8bc94854d
x-ms-traffictypediagnostic: BN6PR1201MB0083:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1201MB0083D7ABAB0D9A9D8D3AE5E38BA30@BN6PR1201MB0083.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F07MeMEWnQ8VjI2kKJJr7n80OfOB1aVBA8Pe3cSRaxhbLBDhhOKy2AfZUhewYEsh1a8Ns8zKIjze9DDXKj+/zuca4RGnpriZu9GEt1Wu8N7rLy847/TwpPfPBFveh+sUClL48BpzzB4/ODc/9jH16wuyV3+M9bkzywTC3aob3svp4moKCWxQ9PTPvIAqYMXvXPctrpLgYFN290TdOoK5rSlq6bhyEHZ6vZqLSa7h6/NrsJiBgMXiEpto0Z0GCC1i3udw/pdzmcmt7kpxmGOc3aunpjkwMRJDgoox+ZSWbE+0l9tOm0bKXmhM3cSFCKgzJvEG6QAhIUUDOvr0Wqrt5SMNhAUV4zBlmXrCS7Dz5K3INUIwIuQbAwPCKf+CenAdjPScaowaBMp1aCs4+ZA0l0EjDAinh9wCf8n6G7vBs95yhEexs5gzPwwr8Gwn7LC/sTrq8CfDeE6CbcB9MyZgJFEBnqVX7n3EUPOadIbb0wbQNCyBXXok3PYKDYFu+LNVtWxcZtgSejGmB2aKiDHmnMnny+NGNqO7SSsPilOfAM2zaxyYhT6m5efhcuX24NPPiZFPme/0Uuqj6VqzXmFoXKh6VSmLs47uKbNqGTjadEu53s74f4ktq/EtukI16ZKOjo8PSk7csrqBCtzZc9gQLw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR12MB1939.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(54906003)(6506007)(53546011)(316002)(8936002)(2906002)(66574015)(55016002)(966005)(86362001)(6916009)(8676002)(186003)(478600001)(9686003)(83380400001)(45080400002)(4326008)(7696005)(166002)(83080400002)(76116006)(66446008)(66946007)(66476007)(71200400001)(64756008)(26005)(5660300002)(33656002)(52536014)(19627405001)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?92CaubuPc6ECaHhz9eFpKsmxtdZ5JGyG+ucfdq+TtjZFsdc2Jn3Nh6XT0S?=
 =?iso-8859-1?Q?oYaVOp7JIGJpm97KNuNwVbvQ567XCYTRdoi+3urLwzqP9Hdr4fqYfVI8lk?=
 =?iso-8859-1?Q?EK/frrOsUfn4qXIWY36G9nUW6hXrcMwIVWkA4APEOs4iIlhPvzrZuMetPG?=
 =?iso-8859-1?Q?3RanGPIKxGDAUffrOAAHeBFvR6HyPljSX7UJZ3iFGbnW9AaZ9Z4uIIQf71?=
 =?iso-8859-1?Q?XBflhVG6hBfuxQ6ZzswgR5ZSPcGfiHba3WrwT7V691IB5yNmLphjgQ4CFK?=
 =?iso-8859-1?Q?+dOkzVH1GrHgpqSw2xvp18+FqGHIJFmBpE87u13kRKi3XrCXXFwl+VtHhI?=
 =?iso-8859-1?Q?PPJwbcNuCxICkhOaebWxNjvBpIWNiAkTijHs1ozicCetQ0f3D7C6yUQ0iY?=
 =?iso-8859-1?Q?VPAofuHgIqk8iEMhjkJ9oIenTrvFnOoryRLY6Vrsfvhg5KSksVI7Yf2p8k?=
 =?iso-8859-1?Q?a9JeIJopP1uDacRGCCkDeE1+TjOczoRJGpqP/TLtgGskw9+0HayRujQFoN?=
 =?iso-8859-1?Q?AogsEZdnqaxTJjvsKKEdQKvgswborFVwDfb/iakonGOz/1qCb1VwqZZSwd?=
 =?iso-8859-1?Q?hO8ijVRypiQyBUbk9ahl/pcWCI/aWXiXFZ3js6iiUenygV7xyP2rQKfu0V?=
 =?iso-8859-1?Q?ZEe7lbvdUdBuadys/MlnHVwQ03AKX6jkFp4nuKaygF9SrCMz0lUQBCz7MX?=
 =?iso-8859-1?Q?dv6O5W2BtyAH8s9A7fSd2iPX44z+3UmQ1Uq/2O7YyVrKhy0sokj27zpt/J?=
 =?iso-8859-1?Q?lIIjSr8E4L1VDJdJhTFHtMQi/iTwZFAgh9yv25uTcHBFasQlQDT7WLIioo?=
 =?iso-8859-1?Q?cicFBC5kq7nKPfyl0ylU4OwuttsBMru48lAiUmcmNqd/r9ff29f9n3mhHr?=
 =?iso-8859-1?Q?uj+sUz76oAu/7MJdaggsI8G4uJmdvVj2ien6WFpzMu3Ag3DOYbvQqyEEKV?=
 =?iso-8859-1?Q?0ayLNblczarrn/L05XRI/JbhIGUz8U0MdmZwXEHvsSi6GGJxvx5uUfWs5V?=
 =?iso-8859-1?Q?yFxap/ROK1PNWA2QY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR12MB1939.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c76b943-cdc6-4f34-8d9c-08d8bc94854d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2021 16:08:54.9729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BjQzZz+sFNOR6T0whewxM01lEcd8fNd+fPKz94ZeZOZYzPBiGXsnYIARYvhSugtqXvZBiWFkjwEY/hnIO2pmAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0083
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
Cc: "Wang, Chao-kai
 \(Stylon\)" <Stylon.Wang@amd.com>, "Thai, Thong" <Thong.Thai@amd.com>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Lin, Wayne" <Wayne.Lin@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============1378423056=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1378423056==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1939001BFDF87A88748163498BA30BN6PR12MB1939namp_"

--_000_BN6PR12MB1939001BFDF87A88748163498BA30BN6PR12MB1939namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Hi Daniel,

Could you please be more specific about the _unsafe API options you mention=
ed ?

--

Thanks & Regards,
Aurabindo Pillai
________________________________
From: Daniel Vetter <daniel@ffwll.ch>
Sent: Tuesday, January 19, 2021 8:11 AM
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; amd-gfx list <amd-gfx@lis=
ts.freedesktop.org>; dri-devel <dri-devel@lists.freedesktop.org>; Kazlauska=
s, Nicholas <Nicholas.Kazlauskas@amd.com>; Wang, Chao-kai (Stylon) <Stylon.=
Wang@amd.com>; Thai, Thong <Thong.Thai@amd.com>; Sharma, Shashank <Shashank=
.Sharma@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>; Deucher, Alexander <Alexa=
nder.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
Subject: Re: [PATCH v3 1/3] drm/amd/display: Add module parameter for frees=
ync video mode

On Tue, Jan 19, 2021 at 9:35 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Mon, 18 Jan 2021 09:36:47 -0500
> Aurabindo Pillai <aurabindo.pillai@amd.com> wrote:
>
> > On Thu, 2021-01-14 at 11:14 +0200, Pekka Paalanen wrote:
> > >
> > > Hi,
> > >
> > > please document somewhere that ends up in git history (commit
> > > message,
> > > code comments, description of the parameter would be the best but
> > > maybe
> > > there isn't enough space?) what Christian K=F6nig explained in
> > >
> > >
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ists.freedesktop.org%2Farchives%2Fdri-devel%2F2020-December%2F291254.html&a=
mp;data=3D04%7C01%7Caurabindo.pillai%40amd.com%7C56ba07934c5c48e7ad7b08d8bc=
7bb4a9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466586800649481%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;sdata=3DGM0ZEM9JeFM5os13E1zlVy8Bn3D8Kxmo%2FajSG02WsG=
I%3D&amp;reserved=3D0
> > >
> > > that this is a stop-gap feature intended to be removed as soon as
> > > possible (when a better solution comes up, which could be years).
> > >
> > > So far I have not seen a single mention of this intention in your
> > > patch
> > > submissions, and I think it is very important to make known.
> >
> > Hi,
> >
> > Thanks for the headsup, I shall add the relevant info in the next
> > verison.
> >
> > >
> > > I also did not see an explanation of why this instead of
> > > manufacturing
> > > these video modes in userspace (an idea mentioned by Christian in the
> > > referenced email). I think that too should be part of a commit
> > > message.
> >
> > This is an opt-in feature, which shall be superseded by a better
> > solution. We also add a set of common modes for scaling similarly.
> > Userspace can still add whatever mode they want. So I dont see a reason
> > why this cant be in the kernel.
>
> Hi,
>
> sorry, I think that kind of thinking is backwards. There needs to be a
> reason to put something in the kernel, and if there is no reason, then
> it remains in userspace. So what's the reason to put this in the kernel?
>
> One example reason why this should not be in the kernel is that the set
> of video modes to manufacture is a kind of policy, which modes to add
> and which not. Userspace knows what modes it needs, and establishing
> the modes in the kernel instead is second-guessing what the userspace
> would want. So if userspace needs to manufacture modes in userspace
> anyway as some modes might be missed by the kernel, then why bother in
> the kernel to begin with? Why should the kernel play catch-up with what
> modes userspace wants when we already have everything userspace needs
> to make its own modes, even to add them to the kernel mode list?
>
> Does manufacturing these extra video modes to achieve fast timing
> changes require AMD hardware-specific knowledge, as opposed to the
> general VRR approach of simply adjusting the front porch?
>
> Something like this should also be documented in a commit message. Or
> if you insist that "no reason to not put this in the kernel" is reason
> enough, then write that down, because it does not seem obvious to me or
> others that this feature needs to be in the kernel.

One reason might be debugging, if a feature is known to cause issues.
But imo in that case the knob should be using the _unsafe variants so
it taints the kernel, since otherwise we get stuck in this very cozy
place where kernel maintainers don't have to care much for bugs
"because it's off by default", but also not really care about
polishing the feature "since users can just enable it if they want
it". Just a slightly different flavour of what you're explaining above
already.
-Daniel

> Thanks,
> pq



--
Daniel Vetter
Software Engineer, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffw=
ll.ch%2F&amp;data=3D04%7C01%7Caurabindo.pillai%40amd.com%7C56ba07934c5c48e7=
ad7b08d8bc7bb4a9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6374665868006=
49481%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I=
k1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D2isCpwa3V92TnO4njhe9cQjdWVdsV1GQMo=
7WP7buVZI%3D&amp;reserved=3D0

--_000_BN6PR12MB1939001BFDF87A88748163498BA30BN6PR12MB1939namp_
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
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hi Daniel,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Could you please be more specific about the _unsafe API options you mention=
ed ?<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks &amp; Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Aurabindo Pillai<br>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Daniel Vetter &lt;dan=
iel@ffwll.ch&gt;<br>
<b>Sent:</b> Tuesday, January 19, 2021 8:11 AM<br>
<b>To:</b> Pekka Paalanen &lt;ppaalanen@gmail.com&gt;<br>
<b>Cc:</b> Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;; amd-gfx list=
 &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel &lt;dri-devel@lists.freed=
esktop.org&gt;; Kazlauskas, Nicholas &lt;Nicholas.Kazlauskas@amd.com&gt;; W=
ang, Chao-kai (Stylon) &lt;Stylon.Wang@amd.com&gt;; Thai, Thong
 &lt;Thong.Thai@amd.com&gt;; Sharma, Shashank &lt;Shashank.Sharma@amd.com&g=
t;; Lin, Wayne &lt;Wayne.Lin@amd.com&gt;; Deucher, Alexander &lt;Alexander.=
Deucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH v3 1/3] drm/amd/display: Add module parameter fo=
r freesync video mode</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, Jan 19, 2021 at 9:35 AM Pekka Paalanen &lt=
;ppaalanen@gmail.com&gt; wrote:<br>
&gt;<br>
&gt; On Mon, 18 Jan 2021 09:36:47 -0500<br>
&gt; Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Thu, 2021-01-14 at 11:14 +0200, Pekka Paalanen wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; please document somewhere that ends up in git history (commi=
t<br>
&gt; &gt; &gt; message,<br>
&gt; &gt; &gt; code comments, description of the parameter would be the bes=
t but<br>
&gt; &gt; &gt; maybe<br>
&gt; &gt; &gt; there isn't enough space?) what Christian K=F6nig explained =
in<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?u=
rl=3Dhttps%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2020-Dece=
mber%2F291254.html&amp;amp;data=3D04%7C01%7Caurabindo.pillai%40amd.com%7C56=
ba07934c5c48e7ad7b08d8bc7bb4a9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7=
C637466586800649481%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DGM0ZEM9JeFM5os13=
E1zlVy8Bn3D8Kxmo%2FajSG02WsGI%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Farchives%2Fdri-devel%2F2020-December%2F291254.html&amp;amp=
;data=3D04%7C01%7Caurabindo.pillai%40amd.com%7C56ba07934c5c48e7ad7b08d8bc7b=
b4a9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466586800649481%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C1000&amp;amp;sdata=3DGM0ZEM9JeFM5os13E1zlVy8Bn3D8Kxmo%2FajSG02W=
sGI%3D&amp;amp;reserved=3D0</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; that this is a stop-gap feature intended to be removed as so=
on as<br>
&gt; &gt; &gt; possible (when a better solution comes up, which could be ye=
ars).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; So far I have not seen a single mention of this intention in=
 your<br>
&gt; &gt; &gt; patch<br>
&gt; &gt; &gt; submissions, and I think it is very important to make known.=
<br>
&gt; &gt;<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; Thanks for the headsup, I shall add the relevant info in the next=
<br>
&gt; &gt; verison.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I also did not see an explanation of why this instead of<br>
&gt; &gt; &gt; manufacturing<br>
&gt; &gt; &gt; these video modes in userspace (an idea mentioned by Christi=
an in the<br>
&gt; &gt; &gt; referenced email). I think that too should be part of a comm=
it<br>
&gt; &gt; &gt; message.<br>
&gt; &gt;<br>
&gt; &gt; This is an opt-in feature, which shall be superseded by a better<=
br>
&gt; &gt; solution. We also add a set of common modes for scaling similarly=
.<br>
&gt; &gt; Userspace can still add whatever mode they want. So I dont see a =
reason<br>
&gt; &gt; why this cant be in the kernel.<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; sorry, I think that kind of thinking is backwards. There needs to be a=
<br>
&gt; reason to put something in the kernel, and if there is no reason, then=
<br>
&gt; it remains in userspace. So what's the reason to put this in the kerne=
l?<br>
&gt;<br>
&gt; One example reason why this should not be in the kernel is that the se=
t<br>
&gt; of video modes to manufacture is a kind of policy, which modes to add<=
br>
&gt; and which not. Userspace knows what modes it needs, and establishing<b=
r>
&gt; the modes in the kernel instead is second-guessing what the userspace<=
br>
&gt; would want. So if userspace needs to manufacture modes in userspace<br=
>
&gt; anyway as some modes might be missed by the kernel, then why bother in=
<br>
&gt; the kernel to begin with? Why should the kernel play catch-up with wha=
t<br>
&gt; modes userspace wants when we already have everything userspace needs<=
br>
&gt; to make its own modes, even to add them to the kernel mode list?<br>
&gt;<br>
&gt; Does manufacturing these extra video modes to achieve fast timing<br>
&gt; changes require AMD hardware-specific knowledge, as opposed to the<br>
&gt; general VRR approach of simply adjusting the front porch?<br>
&gt;<br>
&gt; Something like this should also be documented in a commit message. Or<=
br>
&gt; if you insist that &quot;no reason to not put this in the kernel&quot;=
 is reason<br>
&gt; enough, then write that down, because it does not seem obvious to me o=
r<br>
&gt; others that this feature needs to be in the kernel.<br>
<br>
One reason might be debugging, if a feature is known to cause issues.<br>
But imo in that case the knob should be using the _unsafe variants so<br>
it taints the kernel, since otherwise we get stuck in this very cozy<br>
place where kernel maintainers don't have to care much for bugs<br>
&quot;because it's off by default&quot;, but also not really care about<br>
polishing the feature &quot;since users can just enable it if they want<br>
it&quot;. Just a slightly different flavour of what you're explaining above=
<br>
already.<br>
-Daniel<br>
<br>
&gt; Thanks,<br>
&gt; pq<br>
<br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F=
%2Fblog.ffwll.ch%2F&amp;amp;data=3D04%7C01%7Caurabindo.pillai%40amd.com%7C5=
6ba07934c5c48e7ad7b08d8bc7bb4a9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%=
7C637466586800649481%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D2isCpwa3V92TnO4=
njhe9cQjdWVdsV1GQMo7WP7buVZI%3D&amp;amp;reserved=3D0">https://nam11.safelin=
ks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffwll.ch%2F&amp;amp;data=
=3D04%7C01%7Caurabindo.pillai%40amd.com%7C56ba07934c5c48e7ad7b08d8bc7bb4a9%=
7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466586800649481%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&amp;amp;sdata=3D2isCpwa3V92TnO4njhe9cQjdWVdsV1GQMo7WP7buVZI%3D&=
amp;amp;reserved=3D0</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BN6PR12MB1939001BFDF87A88748163498BA30BN6PR12MB1939namp_--

--===============1378423056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1378423056==--
