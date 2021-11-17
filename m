Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9B84549DE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 16:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621B46E237;
	Wed, 17 Nov 2021 15:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413206E237;
 Wed, 17 Nov 2021 15:26:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLR8pCkj/+Fqr4mSzlGuV3M2ORNm0aFWGB77BLjcX7utle7bWv4kG+fNxrpw8CQtPA1xgcy+4VxYv9roGEf+jZvhcjQgZxSA3r5bnXuFk4p4jQsE1GC+Dsp04KsPXrDtK1Rwh4KP65ph68V7FlWuae3UKRoCAl0COh1UPmtz3VIWmpXeY8mqVph5n0e+fzopElkimWZoa8hQ1utKkQTXYIMhD+BQEFNAoVWdahiOBiedDKHHP9CsufgqVZ7OXLJO3Cc9Zirrk13lL4q8muULCm8ZYb34YxN1PjN1yM+qqoNB0Hmqk0/3m1rN+H1yvYZuZ4TeubTRPO1j/cLJH47zOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiXL5g8E/dnU0NMNTMsahc4FjLFryVT9V52nlQoQlOY=;
 b=UXlt91G/d6BwQAHJK0dho7e/cpUplwpTysFLHF4h4WWyZQ8/kuHa3ocIJLXufADJ4uYMwYmjiokc8l5EtTKawPkb5v0jeT9jmrVypILm3nbF/9+Q6iUZinVYFciht+ZqabPP2WJUd6ePWhGF+rTF+CjPL8Pmvksdvtel3mL6hiLJLg78Js/AWYaYD/cWTUg9G3n3r9t5/ds0Xy7ubGcQ6J9tTkc1xkN5SmaUazMI+39hs2k/xjMsj4pZBufJNP9VMxrlEx5fcR747fJthL4gvGsjTxU0dX8nDm35OWLFRqTC12+bGd+YHEIQu5vutKduynlmEl4hHDZvsJpkobseuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiXL5g8E/dnU0NMNTMsahc4FjLFryVT9V52nlQoQlOY=;
 b=C6k7YPfOgnDlM1vtOEysXVa+Eml/xBd1cIENdC2Y177m/iLc5mWy6zLQnj0OeTcxNJZDqIMBrdlCupPoY3ezfzWZIwu6zVARXuMFULC3cdHVc+/omTUlK/UMoSpXPxA41PTMbVQx+FwQbUznS+Xue8HzGCJwLD/odz+jUXKQbeg=
Received: from BN6PR1201MB0084.namprd12.prod.outlook.com
 (2603:10b6:405:57::22) by BN6PR12MB1572.namprd12.prod.outlook.com
 (2603:10b6:405:3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 15:26:32 +0000
Received: from BN6PR1201MB0084.namprd12.prod.outlook.com
 ([fe80::dc6f:56bf:4457:147e]) by BN6PR1201MB0084.namprd12.prod.outlook.com
 ([fe80::dc6f:56bf:4457:147e%11]) with mapi id 15.20.4713.021; Wed, 17 Nov
 2021 15:26:32 +0000
From: "Li, Roman" <Roman.Li@amd.com>
To: =?iso-8859-2?Q?Samuel_=C8avoj?= <samuel@cavoj.net>, Alex Deucher
 <alexdeucher@gmail.com>
Subject: RE: Backlight control broken on UM325 (OLED) on 5.15 (bisected)
Thread-Topic: Backlight control broken on UM325 (OLED) on 5.15 (bisected)
Thread-Index: AQHX2UaHHsZGf5KGEEOG36FZtNGT5qwEvJcAgAFtzYCAAbGs0A==
Date: Wed, 17 Nov 2021 15:26:32 +0000
Message-ID: <BN6PR1201MB00849879DB7D939C0B29AB43899A9@BN6PR1201MB0084.namprd12.prod.outlook.com>
References: <20211114105657.b57pjojiv72iopg5@fastboi.localdomain>
 <CADnq5_NF++xE6Jj32Wy2ZGALo4pOGt3yTCoj5HU37tKO3Ce=Fg@mail.gmail.com>
 <20211116133259.svayrqaiivaubkjp@fastboi.localdomain>
In-Reply-To: <20211116133259.svayrqaiivaubkjp@fastboi.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=cc46b2f5-f39a-4f82-a211-32d576c94146;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-11-17T15:26:01Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1834f167-90f1-431c-f6b1-08d9a9dea286
x-ms-traffictypediagnostic: BN6PR12MB1572:
x-microsoft-antispam-prvs: <BN6PR12MB1572B1C86A2F5A8281DFDEB5899A9@BN6PR12MB1572.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YaHBeBx1cpLSrR5n4yCIxAT9nRXq+myqz74Y0PPvj0ElZ8nnjXK/lG4yHACpCEx5YalQjW2s09mzpW+Gs7+MJQo31ubV1gxUnwtE10LLbzqmG2Q8f5ueGERTsG1WtuukUaFXgQmeweHQV/QtDcrIrrTxa3i7JqD4IynCaReBhGj+dgVlQIteItSXjlUgkRc0K+v9Wn7+g6BDDCEpZADc0ozqV8aCsWEc54BzpyDVPwMeuAaXeKEuxASgK9intCsjMjpkMrlZNV4S7iY61TZT38iF+2KkY/G+iUZtWAzm3QPc33FW265w/gY09iWq6nvpavzjSXl8RlME+Q59quhtcm4uBWJQDXj6aZXHNb4ljgD5+t9yhnhFREUervjYZFLq8QX4TVrk0ikZJeCIvPW/IGuGenENjDnLH1spgIV+RG+gcqviqsypKHEbGIJtyDJTIvdxx02MFz/cefWFQ8rvowNwZ0gFuV7z9Ns1uPcqdlh1+UV4SQS6xuDvdLOq1zb/OIXmzCqfplxGACG+pLOFJrEbjFcFlzk4gZ/gF15zuZzSyvBDn0OmPPTCkwbzaucPD3h5rdirDPQxn7PLUoD+aQ9G4gK+k/RP2D+KowuEH3YjrUGOTu9oPTHRyDUkfz3I86Ykl6XcXDj9R52EOelUgNASTBdsRVhEk4qXNF15cpbKrpOG4/eJQpPA3/oodOpbb30dghoeO+Z5UCVxuFhv3AAk6otvS5cT9HoNxW37G8D8K5jh61f3ogp9pNs7EZGIziPxtaW0WFNmhWj2a+7Brftstr9OTcCkm+zXnr2qRUk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1201MB0084.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52536014)(122000001)(8676002)(6506007)(53546011)(64756008)(4326008)(8936002)(186003)(66476007)(76116006)(66946007)(66556008)(66446008)(54906003)(7696005)(9686003)(110136005)(33656002)(45080400002)(71200400001)(2906002)(55016002)(5660300002)(38070700005)(966005)(86362001)(508600001)(83380400001)(26005)(316002)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?ejibYSxA6G3gaTY0rHMRi9xhW0S03P61HvSLzO0/7VNZI61myI6kT2qoWk?=
 =?iso-8859-2?Q?QBJmZp2nVqmAYxhxY/J7X5xHCppCQ8Ey9OGIufBVT2vSdy/lety8oQS+Xk?=
 =?iso-8859-2?Q?owpOdhT6j587PMzd1cqlo5mySHyBY54YNhdeW4mNnKA0GEa+i9q6oioOLs?=
 =?iso-8859-2?Q?U2tHLR9GW52cece4mNd/MrjFl2C35lw5Nk9EzfigHJCoHkLFMC93EYSjSX?=
 =?iso-8859-2?Q?NIG2ZxHUtgEqg2bFeWfD4hNyml0CaHfMmUopHxhVkBIRLSTf8m3OAChghq?=
 =?iso-8859-2?Q?Q+tw/SJOP5R1y9OJAqWw44zsx5XgHDNBhzw1Hum8qUioUWG7H+WE864298?=
 =?iso-8859-2?Q?/QLolwe66+8eIdL9AunqBxYtMyjB643JaPTgt9qUO/umYgrbzS28M6eP6N?=
 =?iso-8859-2?Q?MF3hYIXK1c0B3xcoYFC/IAjxQY+d3+n43s5elIPdzDtY4oBV3fWLcNbP4p?=
 =?iso-8859-2?Q?9UWOmTjWhI3mixt7wRVg+C3anWXbcA4q+NoT8qmwe3X8W8B/rq9I6OzzK2?=
 =?iso-8859-2?Q?KWDRHJejRXUsvnJLvladPIrnlzuendR/G42lOc1TY62kYS+mMAhXo+yol3?=
 =?iso-8859-2?Q?BgiWDoC2A0JDvXki6LCdU8R68j9AlbaAhrA68iWnJUGiyQ7D9qUu/Yb1AH?=
 =?iso-8859-2?Q?o/nK3JIyEM1Qx/9jl6kmx4atF7GtKJpT8U+ORsO7POG7ZAzJpNdHOk3dRe?=
 =?iso-8859-2?Q?p6TNzYZJphjsju/6qQVoVyoLABCp5y3ky1Fgp3Oo+ZzD+xsqsIZFLkr1c1?=
 =?iso-8859-2?Q?qJ8i2m/kmvlnAsHgWyv+lCY64a4TiwNstePr8VzoF8hO14NE+16jWZWwHe?=
 =?iso-8859-2?Q?4RrKteD9ApnW8ByZd9WKEAL6La5kxljrTZ4iYS1QbS+a+ZaTB18yAG+9bb?=
 =?iso-8859-2?Q?Figupck9g/RaeyXEQPARN88zUMEHFniUNIR5x/M2KWLMuXfFh4X8TghK/b?=
 =?iso-8859-2?Q?5LGJBA5NFtSFOaGaVJ1ZRYLp+8e45bHPO9UAFBVJuvq2KRKVDj2bYl6p+O?=
 =?iso-8859-2?Q?T0mIlC0niSTepupFTTZO6RoxvuroB9LSQxfCgrEFIoHffej7NrGntgZRXU?=
 =?iso-8859-2?Q?aqZ4jsd6RuICXwbMVuUsTOY06H5Fp3EfiNPIdbt+OUKj15cqyPc0BcLCvQ?=
 =?iso-8859-2?Q?WLatfeEP98ly/ub1qw/FvUmPAqmKjH56Yf9VZHCrR4d++DTCV7shePIJei?=
 =?iso-8859-2?Q?2UGdFPjkJu4KGr8HJvZPIGkE0Q5jlzxwIwdWWITmqO7ViEHIVlaDSsnRVq?=
 =?iso-8859-2?Q?igCG4HQad9VxM6ScDbLOSfKeCIPcb+48Gtn5z8+wD95c4GvykqEyWWuKvY?=
 =?iso-8859-2?Q?PpyvaI4KkAm2aXpgW3vOjJ5H+uKmCmaK9zei+au/OmM48nXwSnMOxyawGh?=
 =?iso-8859-2?Q?zCo/fvSL75PV10lS0+MYjfFR7jL8fNhED2BX7xxtS76DzktRlKHjBStmRJ?=
 =?iso-8859-2?Q?f4WGtW4YNVnljl/QURRyG9xM8zY8HJ61hZauS65EjNAZS16Aupc0nxUCGS?=
 =?iso-8859-2?Q?quoLm5y0M6uG3BPwYdh1U55pC1UTRNzwGLhPqG0YsFBJdLAPMPh5xfkHka?=
 =?iso-8859-2?Q?LvyioY2TqFDLzFwLde1ZdCSHxer1c+DKgbct7wQDflfSil0qtMQv0GO/z7?=
 =?iso-8859-2?Q?ttakH3VqxDZVg=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0084.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1834f167-90f1-431c-f6b1-08d9a9dea286
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 15:26:32.1944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IroyfeLjiMxwtqKLdaoNq6DGl2FRc9UOuFp63hlN1lwU5TUTbInU4b2VgiW5AlbP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1572
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Hi Samuel,

Can you please try: https://patchwork.freedesktop.org/patch/463485/ ?

Thanks,
Roman

> -----Original Message-----
> From: Samuel =C8avoj <samuel@cavoj.net>
> Sent: Tuesday, November 16, 2021 8:33 AM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Li, Sun peng (Leo)
> <Sunpeng.Li@amd.com>; Li, Roman <Roman.Li@amd.com>; Maling list - DRI
> developers <dri-devel@lists.freedesktop.org>; LKML <linux-
> kernel@vger.kernel.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>
> Subject: Re: Backlight control broken on UM325 (OLED) on 5.15 (bisected)
>
> Hi Alex,
>
> thank you for your response.
>
> On 15.11.2021 10:43, Alex Deucher wrote:
> > [...]
> >
> > That patch adds support for systems with multiple backlights.  Do you
> > have multiple backlight devices now?  If so, does the other one work?
>
> No, there is still only one backlight device -- amdgpu_bl0.
> >
> > Can you also try this patch?
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > index 4811b0faafd9..67163c9d49e6 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > @@ -854,8 +854,8 @@ int amdgpu_acpi_init(struct amdgpu_device *adev)
> >                 if (amdgpu_device_has_dc_support(adev)) {  #if
> > defined(CONFIG_DRM_AMD_DC)
> >                         struct amdgpu_display_manager *dm =3D &adev->dm=
;
> > -                       if (dm->backlight_dev[0])
> > -                               atif->bd =3D dm->backlight_dev[0];
> > +                       if (dm->backlight_dev[1])
> > +                               atif->bd =3D dm->backlight_dev[1];
> >  #endif
> >                 } else {
> >                         struct drm_encoder *tmp;
> >
>
> There is no difference in behaviour after applying the patch.
>
> Samuel
>
> >
> > Alex
> >
> > >
> > > Regards,
> > > Samuel =C8avoj
> > >
> > > [0]:
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
w
> > >
> w.reddit.com%2Fr%2FAMDLaptops%2Fcomments%2Fqst0fm%2Fafter_updating
> _t
> > >
> o_linux_515_my_brightness%2F&amp;data=3D04%7C01%7CRoman.Li%40amd.co
> m%7
> > >
> Ce1c766a2f7014cdb664308d9a9059cc6%7C3dd8961fe4884e608e11a82d994e1
> 83d
> > >
> %7C0%7C0%7C637726663861883494%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> MC4wLj
> > >
> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;s
> dat
> > >
> a=3DhfsaEzng9%2FjAI2F%2BKg87Tv2Mu%2FfPurCQELr62%2B%2FVF%2BQ%3D&a
> mp;res
> > > erved=3D0
