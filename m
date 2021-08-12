Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1BC3E9BD1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 03:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12816E219;
	Thu, 12 Aug 2021 01:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAF96E219;
 Thu, 12 Aug 2021 01:09:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCnsPE4uVCqNvCrKLg93jbbrrOekJeazOMtqjkmoKy5hF9hPoUV58flA1WphZgU0KDo8bQ7ziuRIObDVVyVbyOhrPFc2sfA2ygMY8nmoNR/KTR5J0BuZqNDp573AJICh/01N/1mLnIdLfnJ0DfOfjRcsZ9FFs1sV/IPDDdd4EE906A7Sg+Q0wuNlrXG9YdiQU8I6kAwP3leE4CUL4q4H03/82hAbNeuZSVOgBlaTSwagp4W9I4+G53rR4Lori4m1jk2Zk0nTsFH4kvHGPLDDamLgXR1oldiuP+qikVRVvCGZELJGbY1Quv3PfG8EKYFROTAcrPRFOuzDkjA1Hkxhbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qoNvg83lq67O3EEUYehqzV3RHMc6hUti7G6GTDLHEFc=;
 b=j6ejHaQJPr11G0D4t+CgpJ8sKBchpSiYuHx4J3IYezkj6+NnN03mEH98Q26l5gWbh4KsyR6yPjFyt9o2Cim0dwNy7tsH9onODdFBvT8yhm2osBtBR/c8y1meA8EhVXVVcaL9b7mTwKukPfHpoSBwC2OjcCayF6bSQz8KTrPZKvk7klbO3cMLySO1RH7MU8DqKVJDMwldN6Gg3BrxKZQsOW2NrS82913YiRF1bxG3fpOMNiza1b2nzw8lGAEBiBxpZ3qjI4/cGzOUTWiFpOwNANLA+KhsKJapv6sAyl6Kjp818Arx9cNgg76veH3H6ToF75phg0fkOyvVK3TEtdhr7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qoNvg83lq67O3EEUYehqzV3RHMc6hUti7G6GTDLHEFc=;
 b=2sk05Ztazml01cSLs12DieBPmp8agIXgb41eulc7POhY9y0PTN0bFSjlXLKoeJQQlMCgT2yozVLVYhZ3r+vdwcZPwrBdghorA4/QKlkUBIjPcLTFM6m/AaOh/4dDK1/B8L+dSokPkehTCJ/mMYc9i6v9LBP1/jj8vNuQD4bsDU4=
Received: from SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17)
 by SN6PR12MB2848.namprd12.prod.outlook.com (2603:10b6:805:77::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Thu, 12 Aug
 2021 01:09:20 +0000
Received: from SA0PR12MB4399.namprd12.prod.outlook.com
 ([fe80::5905:9b11:c59a:984a]) by SA0PR12MB4399.namprd12.prod.outlook.com
 ([fe80::5905:9b11:c59a:984a%4]) with mapi id 15.20.4415.014; Thu, 12 Aug 2021
 01:09:20 +0000
From: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>
CC: amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Linux PCI <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] Whitelist AMD host bridge device(s) to enable P2P DMA
Thread-Topic: [PATCH] Whitelist AMD host bridge device(s) to enable P2P DMA
Thread-Index: AQHXjuSnWuaMWfMhHEmP//+Rviy3hKtusH+AgAAWvwCAAASPgIAAQzdw
Date: Thu, 12 Aug 2021 01:09:20 +0000
Message-ID: <SA0PR12MB4399DE432D65D70E866E9FB6E3F99@SA0PR12MB4399.namprd12.prod.outlook.com>
References: <20210811191104.21919-1-Ramesh.Errabolu@amd.com>
 <CADnq5_OVA1fB5x6=CGrd_5O-i=P7snmoJaTyauF2RKuWjc8Gog@mail.gmail.com>
 <ba4ee532-d64a-72c5-7aab-2b86a75b8174@amd.com>
 <CADnq5_OmH6ZsL_Q_wO2B7dbaD_JFcaNbYFzd_Nv4kui1npkVPw@mail.gmail.com>
In-Reply-To: <CADnq5_OmH6ZsL_Q_wO2B7dbaD_JFcaNbYFzd_Nv4kui1npkVPw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22675c86-d427-4123-29b9-08d95d2dd0d3
x-ms-traffictypediagnostic: SN6PR12MB2848:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB28487FBE5C8DC8223748E4C8E3F99@SN6PR12MB2848.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tJ4UbRKdzs4iBL144Scizseb3YIq+NXl9hNLUrprZmb0JAfbrCV4PEHCSwo46dGEo+S0rtxpKxtx3+Q2oJKACoUFHVbxwf9uNvWIsEaF8O834TVBdYADXJwestE/Yr5DLZzQrfi2lRI/B+2R6gr6wOJrM5KAazHhrUZxdnoQyJojx7/q+evDnd43aWW2K7tCGjXJ0SJkCw87nSzisYmVC57fchvXjkETArBkIta1s6Xzgt0W6Vtt2ZHUd6RoETbkqSNZAfhVPl83hGckZMjTMsNmd/7uqv63p8V5BwcYdQROI5jK6NZ7CUeezzxZ8CWZZ3TitSa7BmtSfbYWnSU6mViX55QCbVQqpbUX4g7QOiJIHnaJoEmNtqZRvR5Dd0UZqOXsZ+AmROdUUgtVEzfb+gyA/Ja7T+EE/UHy6WEy4h+msNXsTtbPeX24AYqkfN277psslfttcAjVpU/YyLzo/fhUiQ9BQDdBAQ2ikFy5vG6uXnP6BBKI+77FrZlc+HunFXsZJ0lmMvlcZl7Dtrf++OFdu/xkJyTwhm61AdMQLVQC03nGcndOgBFdtdHPeuizcEK68ivc4b9YCH8uBRZ1+uIgOh/3oQttmxavPuIXvz1TcRh2Ux/VXUGpf8OHT7EiqGe+PSZBnHVu0naYxEMSWAlcm6kSYEc4XJCihCozeLIiHuYvieH/SdUGG38vX9/iQSy6fOzBNcTkUALxY1OueiIEchCEIUezcbVJBHVHR0sWFQOBU0s7TnOlOYEt9hP46/gK+UGhpCGT8S0Z/z0BqX0GLVGEXqzDgeF9ZRg6ZFA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4399.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(38070700005)(9686003)(6506007)(8676002)(4326008)(6636002)(55016002)(45080400002)(71200400001)(122000001)(54906003)(966005)(316002)(38100700002)(110136005)(26005)(53546011)(8936002)(33656002)(478600001)(7696005)(66476007)(64756008)(66446008)(186003)(5660300002)(83380400001)(66574015)(86362001)(52536014)(2906002)(66556008)(66946007)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?XXapuVccSSC2/OHYJUaGSz7RI0nzExWkmxvyVKSNdYu70qW21rCuUG111K?=
 =?iso-8859-1?Q?cnrNgf7no+t8jatD7c5IQ1tetzaC8rPHQM/5bJGRq1Zw5rEhw1ZZX+UgnT?=
 =?iso-8859-1?Q?O0CNnQYymElSpIEdQTrvvQHqYRodekYS75tKuhV62TOu/muMgD5zJM+63e?=
 =?iso-8859-1?Q?d7Rp57QO6pshj3zG6uJauu9qs3CdK8ooazn0hSCuC/UkB+BN9LxQJcz6D6?=
 =?iso-8859-1?Q?FZPYm8yS0Sr291FSBCdNc75PvWiTapSalQZrvxUP2MqCO5ANG9oLbhjENM?=
 =?iso-8859-1?Q?fx0IbXJOpS8VfZGnmGoPTQj9Gz6MfIYSizXQ9YhXv70+kzELRLD3gjm0/V?=
 =?iso-8859-1?Q?A9yuUrsbmNC6EMDt1kQksuGr4LkG15IVhXjLniHdeV9TO02Xh9EvzB72Rh?=
 =?iso-8859-1?Q?ObtnzkViHXelmxaiSvfaVxetHQpsz0g46GQSchE7uQp+EviPP7GOg/YHS7?=
 =?iso-8859-1?Q?3FV3AVgamH3tPpHzfA9XeqIqLo+QzgT89PUqW9bCTzLTLasbqHqJsLL4n0?=
 =?iso-8859-1?Q?s31qgE3ls3dDp38HC6gkjl8ReWdsbtOnttN9nCoX92kRGtPc0pNVwd7/jL?=
 =?iso-8859-1?Q?HfDhMc+wPvPbNpf/MWRHtGd1MtY6rPVcvG67CCezDDlLCTIsqq724kJzVR?=
 =?iso-8859-1?Q?Vuj9cK6zD++6Yz94wkQygSnbF9NdYeHQTYy7+PVD5qhcGcBGtsi6/Kb+VC?=
 =?iso-8859-1?Q?B0mh/4qBw+3qKL7ump5wS2HLg00tSfC0E4SzKuGZmCQJHNW1xIihcmggG3?=
 =?iso-8859-1?Q?HQ8YqmfYhNzpy+6A9EILCH3B96nFFkK95as5ayX4dhQWPqq9D6xmpf1cXj?=
 =?iso-8859-1?Q?xCiS4ae4XvU4ktdgQXItKvHfxkhVTBYR5YpidIsr0318sOOHhrAzP+24+P?=
 =?iso-8859-1?Q?Qcodlxup+SArMvYtSbsInKgYOK1f1xcnjIs6WbuerMhAWTUx8SAC9Y4/gR?=
 =?iso-8859-1?Q?3xK1d4Vnp4u4MTkD2kZ6Awn023JVOr76KgbgS1xR4AD5f1W631naDm32Z4?=
 =?iso-8859-1?Q?lxGeZvkyLIHvOURo99nWh0fi08dsrvzooO1vcSax1uA0QnINUfAp6KxsFw?=
 =?iso-8859-1?Q?alxFhfan+brnjfqGVrdQ6qkSUiy/kfKyIWk6+EfBOEBlj8j/Um78MwYKvI?=
 =?iso-8859-1?Q?m/C9LowwGQLv46zzxhjei7nwaPlkx6nJfETNqZK3gaaT1wRr/M+GItKiET?=
 =?iso-8859-1?Q?1vEQpmiSvw77MUksqrgMN7KJzi1gJbn+EN1WZqQdwk/TqO0NSmVgGhTozf?=
 =?iso-8859-1?Q?NB5PM0B76hlmeF9UY9celkGllEOnydQSFlz2ERQwvfyJ2op1PoVmPTX0BV?=
 =?iso-8859-1?Q?ibWUEmKg84JaZCXQ/AVpMhx7iYCACu6I9TeAYy7jIwqA8X0BKSjHqlt3To?=
 =?iso-8859-1?Q?IYCoG7CJvy?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22675c86-d427-4123-29b9-08d95d2dd0d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2021 01:09:20.7519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F17PEOjhrz3PjKnNCljbrbsEJ7oVEnBGsYRQWuihX3e5AWKaKbv9er7rcHrpGhTMhSOjcsdjGTLzkAveH17lCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2848
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I will investigate it further. I am using DKMS-5.11 branch. The codebase I =
am using to build has the right definition i.e. allow P2PDMA for Zen CPU's.

Regards,
Ramesh

-----Original Message-----
From: Alex Deucher <alexdeucher@gmail.com>=20
Sent: Wednesday, August 11, 2021 4:07 PM
To: Kuehling, Felix <Felix.Kuehling@amd.com>
Cc: Errabolu, Ramesh <Ramesh.Errabolu@amd.com>; amd-gfx list <amd-gfx@lists=
.freedesktop.org>; Maling list - DRI developers <dri-devel@lists.freedeskto=
p.org>; Bjorn Helgaas <bhelgaas@google.com>; Linux PCI <linux-pci@vger.kern=
el.org>; LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Whitelist AMD host bridge device(s) to enable P2P DMA

[CAUTION: External Email]

On Wed, Aug 11, 2021 at 4:50 PM Felix Kuehling <felix.kuehling@amd.com> wro=
te:
>
>
> Am 2021-08-11 um 3:29 p.m. schrieb Alex Deucher:
> > On Wed, Aug 11, 2021 at 3:11 PM Ramesh Errabolu <Ramesh.Errabolu@amd.co=
m> wrote:
> >> Current implementation will disallow P2P DMA if the participating=20
> >> devices belong to different root complexes. Implementation allows=20
> >> this default behavior to be overridden for whitelisted devices. The=20
> >> patch adds an AMD host bridge to be whitelisted
> > Why do we need this?  cpu_supports_p2pdma() should return true for=20
> > all AMD Zen CPUs.
>
> This is part of our on-going work to get P2P support upstream. We want=20
> to use pci_p2pdma_distance_many to determine whether P2P is possible=20
> between a pair of devices. This whitelist is used in this function.=20
> This will affect the P2P links reported in the topology and it will be=20
> double-checked in the BO mapping function to ensure a peer mapping is leg=
al.
>
> I think this change is a bit free of context at the moment, as we're=20
> still working on a few other loose ends for P2P support in our=20
> internal branch. I'm hoping we'll have a bigger patch series for=20
> upstreamable KFD P2P support ready in a few weeks. I also think we'll=20
> probably want to add a few more PCI IDs for other supported AMD root comp=
lexes.

We don't need to keep adding AMD root complexes.  You must be using an olde=
r kernel or something.  All root complexes on all Zen platforms support P2P=
 DMA.  See:

commit dea286bb71baded7d2fb4f090e3b9fd2c1ccac58
Author: Logan Gunthorpe <logang@deltatee.com>
Date:   Wed Jul 29 17:18:44 2020 -0600

    PCI/P2PDMA: Allow P2PDMA on AMD Zen and newer CPUs

    Allow P2PDMA if the CPU vendor is AMD and family is 0x17 (Zen) or great=
er.

    [bhelgaas: commit log, simplify #if/#else/#endif]
    Link: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Flore.kernel.org%2Fr%2F20200729231844.4653-1-logang%40deltatee.com&amp;da=
ta=3D04%7C01%7CRamesh.Errabolu%40amd.com%7C7ffc96d473d4471889f808d95d0bf57b=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637643128220735445%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C1000&amp;sdata=3DvmwJP2VwKPrXwl3ngUfwN%2BJu3JWeMP0ZZMDh29evW%2Bg%3D=
&amp;reserved=3D0
    Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
    Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
    Cc: Christian K=F6nig <christian.koenig@amd.com>
    Cc: Huang Rui <ray.huang@amd.com>

Alex


>
> Regards,
>   Felix
>
>
> >
> > Alex
> >
> >> Signed-off-by: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
> >> ---
> >>  drivers/pci/p2pdma.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c index=20
> >> 196382630363..7003bb9faf23 100644
> >> --- a/drivers/pci/p2pdma.c
> >> +++ b/drivers/pci/p2pdma.c
> >> @@ -305,6 +305,8 @@ static const struct pci_p2pdma_whitelist_entry {
> >>         {PCI_VENDOR_ID_INTEL,   0x2032, 0},
> >>         {PCI_VENDOR_ID_INTEL,   0x2033, 0},
> >>         {PCI_VENDOR_ID_INTEL,   0x2020, 0},
> >> +       /* AMD Host Bridge Devices */
> >> +       {PCI_VENDOR_ID_AMD,     0x1480, 0},
> >>         {}
> >>  };
> >>
> >> --
> >> 2.31.1
> >>
