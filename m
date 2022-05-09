Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BCF52043E
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 20:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAF310F40D;
	Mon,  9 May 2022 18:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836F110F40D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 18:12:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kw25bzdYZh96AwhF2xE/6lk+Yy0CsM0l+dMaBCVRtbwjbPJ1uoHAiscuTXi4VzR2KU+8biPHm/dzHdVWzRTpSHgDexuYvBjVwUeHFNvaOKWN0AMYZgG7zXFJ5rAzDdfYV1GVD+0amQZfXMz6iccDGA+WhSTZr1JsvEPPmhO8l9cXJj9lfWZapwbBHeR9SYNscqSQbnxgHsHEN2fSQVoJDY7v/kHgZZR5fu61hYSwUvdxQ51Bn/kxDt0Y9jB2IKFJDNg1WE9c6o/lAmHNf/Awa3eZdOXYZEaFcfYv0TMwm+h/M53YeLV2ddYojeflpEHibvtJjKkBSV9ZyQdyaka/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imoGLAbN87kGIVAg5pkeUHjYqFX1UYT0rWxkuWriUwk=;
 b=EA7xXn07S/ff2G9/nzR7nJ2lTq2YXPeupZNl6myx4JQIIpKBTXOSkBslOTr0tbshod0uuWN1PUq+YV6VjqSnspC4VvJek2LdJ19iIDn23p/ZiBheOf6L0TJqz+Snl3cFFQmleP/lUKaGZSUlenliGHHZVCX2HpApuPSCsSmz/U5f0ZRIQIqDjYZJf5SqVGJ7svb4fDvpK39AY6fEcP59OW67kLsZnVFn40xPok9MLPLmpcdauzm14E9+jB08ghciN4KIt3Z9IQaBInkm9Aup/fFB4ftJTKX6tAdOMEDoyGMUzxG79ovPA8UmNGrMA7kDw/7WV1pX2BM1dsW+L+L8QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imoGLAbN87kGIVAg5pkeUHjYqFX1UYT0rWxkuWriUwk=;
 b=UwRQrACapvIq+pV6YpahLjdCngfrY6BtIEYkPADK7upIH89i3vsW/aRDMRt+HqwqbDwpKbKRCyL1t52FrNFmqQDQx0+U+RFj+05L77w9i6KYBGxlqyUdn1Bd94C7vYbe0Ltw43C8jPDvwa0/hUKqQQ6r+86gsvdH0DTADGXlVIo=
Received: from CH0PR12MB5139.namprd12.prod.outlook.com (2603:10b6:610:be::9)
 by BN6PR1201MB0225.namprd12.prod.outlook.com (2603:10b6:405:5a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Mon, 9 May
 2022 18:12:51 +0000
Received: from CH0PR12MB5139.namprd12.prod.outlook.com
 ([fe80::6dcc:2447:382c:32dc]) by CH0PR12MB5139.namprd12.prod.outlook.com
 ([fe80::6dcc:2447:382c:32dc%4]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 18:12:51 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Bjorn Helgaas <helgaas@kernel.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>
Subject: RE: RX 5500 XT: PCIe link speed stuck at Gen1 2.5GT/s by default
Thread-Topic: RX 5500 XT: PCIe link speed stuck at Gen1 2.5GT/s by default
Thread-Index: AQHYRCuLD4GDHkkZuEu1G7yXuGjx4q0XFc6A
Date: Mon, 9 May 2022 18:12:51 +0000
Message-ID: <CH0PR12MB51395CB7FB16EFC2B200D263F7C69@CH0PR12MB5139.namprd12.prod.outlook.com>
References: <20220330114436.GA1683263@bhelgaas>
In-Reply-To: <20220330114436.GA1683263@bhelgaas>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-05-09T18:03:28Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=6bac09f8-9412-420e-86eb-b3f94d3fd9e6;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-05-09T18:12:49Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 0739b452-1bb2-4714-bae4-f05a67f62fd0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba26e0d8-bb83-4124-5504-08da31e787e1
x-ms-traffictypediagnostic: BN6PR1201MB0225:EE_
x-microsoft-antispam-prvs: <BN6PR1201MB02253B3182BA81AD6E7A114BF7C69@BN6PR1201MB0225.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ggm6WZYl6DbX9x6lmP2Z2Ks+gy9mHQ959Jm3kM9dNUwQD+fohlmvG3FlFEhdBHTAFYnUUAMOd8D8vQ6OZDXKXeLYuQZd+bv9M/1qXWY8STntyxKnMIvaqFmyCghpmIbyeEguOrk7HhamzLK/lsvWaEh1l6NIWxtMCsGVnFTf4rr+M47HozqJYe3PS6zyYzcoCAcCmuMByFN8Jw7Irt1Kba1fZav+f3uqs4FrzIBKl7p4aaMeG7lI6L8KiPH+4qQ8lGWNBk3g/WwnqIRXSx15QI0pik4EadfHnM901zg42oEKdSg2TgTCsFuE1uFhZtH5+ycSXOjmGS4t2/00cQSqiDcykEWgfS8Q1dwrtpmOUulUvKE6+AAcYRivfQSjdeOmh8aashBcTs/dpk5C9KAvU5mDaNNseRQxJu9pvq3HmxxztJHXoiYtjQg8c84HgkOPhr9c61nXH7EHOfU6hQ0lcH/hJgpduvLtVfhAbPz2K/ysmKpvHS7jtwv9sJ8TlKAR2B+ENh6Z3NrOcvo8lxmtqyUGJq/lnM3x1CJQpUKQHiWsVbZU0A3009/oMWkOa+ycPYuF3P+xdPENd1QqytrdjWzVF0MlWgcSGn2JQ0rCedrT46ywVgnzIcnqlfrK2NVj2vn8a6Y/RCgfZLeJWibg9RuvuzgLqN6dWHHhUBqeHmnPET3yusF45g0FTxYRZDNMYJnc2Q5AoIax+QJmhBRx1no0HX6kM6AaXMuB7/KC7bXo86RtburnatrYv/XP3sltJpVbK72hYDsI0R/stblNRvuLkd40YWDaxQqT6SlS6DI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5139.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(26005)(110136005)(86362001)(5660300002)(9686003)(45080400002)(966005)(508600001)(316002)(54906003)(52536014)(55016003)(8936002)(2906002)(186003)(122000001)(7696005)(4326008)(33656002)(76116006)(66446008)(64756008)(6506007)(66556008)(66946007)(38070700005)(53546011)(8676002)(83380400001)(66476007)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r2yRyqfOvOQsG3uETvdSDIO8Jy076FD5Nhx1LaJR5M+It/D9R6H8QELpG13Z?=
 =?us-ascii?Q?UzvNcBR3cvNu1c6oxHDQ+pMo2fxiLON13KxyH57YA51XETVSrfJW4+16I0++?=
 =?us-ascii?Q?ijpL32iHm1WeDsMuWq7sVMJfPdK/4dzjcEHTxQtRJIIhVvzf3zV8qpQUt5XR?=
 =?us-ascii?Q?hwKQ+ANCT5lfwm+higa/oPSx7Tj/G3otA9S51JS7Ooza7IWwoSkfL5hqYfU7?=
 =?us-ascii?Q?XsoOWO3vWOGjkJxYCLQYCgOVh5cJupeL6PCrAE7WlZqz3Imt2N5q6zzNQ7R+?=
 =?us-ascii?Q?Khn+L48VSKjufcjsTBZbb8nbiDf2lc+zyZKpW0XRucV07wZRPQ7PB2k2LKLa?=
 =?us-ascii?Q?Yrg1INbAiFM6x+LdsbuO62AWApET/nCi312kItedu//ZlvXFw9X13H+YKSOd?=
 =?us-ascii?Q?DoZju+wEuww6PGe6CC71oDhfGhNioka2M5MgbtW9OpYwsCeXb+lelKrz7gtM?=
 =?us-ascii?Q?nO9RzAKVKW9fG7nAlI959FZoXSqYqCioIvXHkYsVKV/+QGBrXboVXjC9KDBW?=
 =?us-ascii?Q?EYWv2Dm4PaDSu9OqeG9kM2gytb3b1vUTcNZCm+Cu1aHNcZJzEJOIg5oUTzHj?=
 =?us-ascii?Q?CLEwL5FpHIf+2snBDbJ2fty+sVuxVQABbWZk7dNi9NUA33BSP5BFeUJVJ0bA?=
 =?us-ascii?Q?Oy8ZyamcNOcnOF8FsmOOtlurb02IPuSEtNmUr/g656e+IrHkgLlKZu/gQKZm?=
 =?us-ascii?Q?5BwjJuFNM+MF8LUp5zd9rTljoGGIpZTaHsrE2XLo30gIdGNQZH9c1ujlSosj?=
 =?us-ascii?Q?JBl86R+nAa2i4dDVEXCfx5YNljAY1K7id1Hx68hP1px996PI46rIxrv3gznE?=
 =?us-ascii?Q?eMl35aJ7AwoLJ0B1iad/I67ozByedLUQVQ9QaDZGevbJUJfFc99TqAVvyDtz?=
 =?us-ascii?Q?n4Kj/5u9ABhnfd132ZiCd6Tulpf91Ghzy4JW8GKh/hDAdaG0jcZKstTWH13F?=
 =?us-ascii?Q?OxbigyXUKooHmfub1B/lgrL8Y56JrLKQ7wkcHWa74Yc0nEeJnpcPKRm5KkU1?=
 =?us-ascii?Q?ulAKLOyw2EwI5qvrJVAnb7i1QBE/kqoj7cKtOM2VIAcdBbQytsg3S+0FXw5R?=
 =?us-ascii?Q?c46mmsTL2nFVVT5F8hQvz3Z67TifcKvNprbdWjG7BZKjLKGGSUS3aL+G6QwS?=
 =?us-ascii?Q?BSvHbTqqUhcRhOO/43Tq03fbbSlxSesnZ2/IgZhCghHhcwIfpSxYHrdwkatV?=
 =?us-ascii?Q?0pdNfT057M1aG369KJOW/2q3O+UJImoMnBI3/vRGcCMj+udT/PDp73g7zG0j?=
 =?us-ascii?Q?6W6F8kFXhykFQT465YAoLsPDUGr/qdtGa5sUSHjc/RiIInKR/Ci9B8iwsQew?=
 =?us-ascii?Q?nZ15Q23RBzFDNBSp8Nz12Igyd4MUm56XwFNKk9+NDaKTx6f2IABqLWRYr5mQ?=
 =?us-ascii?Q?xsfIJ7zMfX6NhL0VRrM1RgnugJgWUPhp4aoLIXYacL5H1uBjWvEcy8P5qt/l?=
 =?us-ascii?Q?iUpUyQ2eE61L+OEYgsmvOo+JmGUScfEc9jxkf9RJP5b9ZVqoKFhtEPMgxX+Z?=
 =?us-ascii?Q?eyE8ETl09Ty1lu3/lDpjOqVu4KjjiZRmNck+F7aZurREfGPUMuql1SYiRkjO?=
 =?us-ascii?Q?FNp1qKmcbGjRpCYdiYKaAFMHyvF4yCt5w4zCtlajH3DY3hXpRJyjmVbfM97+?=
 =?us-ascii?Q?c4oPOgAOH1kGwoRHyZD6j5EVbN8Kgv6W6YDRahKP1j9s23LaU+t3bkaatjKQ?=
 =?us-ascii?Q?BBF17sCzuOx9ctRCiDVnijqL/KUxxHeAwAezW589atRPBsET66ABLj5yYr8Y?=
 =?us-ascii?Q?/G0Q8AfzgQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5139.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba26e0d8-bb83-4124-5504-08da31e787e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 18:12:51.2619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5iR16iJP5zP7DN1BL0dqJ6ZNUPjAhYEN6WiDX9LQ+69SJ1TaWty42dyQCTuMt1JcjWP/riK8pYY5HzVHPgH21A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0225
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
Cc: Robert Hancock <robert.hancock@calian.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: Bjorn Helgaas <helgaas@kernel.org>
> Sent: Wednesday, March 30, 2022 7:45 AM
> To: linux-pci@vger.kernel.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Robert Hancock
> <robert.hancock@calian.com>; dri-devel@lists.freedesktop.org
> Subject: RX 5500 XT: PCIe link speed stuck at Gen1 2.5GT/s by default
>=20
> See
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla=
b.f
> reedesktop.org%2Fdrm%2Famd%2F-
> %2Fissues%2F1447&amp;data=3D04%7C01%7Calexander.deucher%40amd.com
> %7C01b4e1eed4ac4c97ab0408da1242abe9%7C3dd8961fe4884e608e11a82
> d994e183d%7C0%7C0%7C637842374822556101%7CUnknown%7CTWFpbGZ
> sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn
> 0%3D%7C3000&amp;sdata=3DelFgBq%2FoCfqIO98aaGeS3d1omBdJj%2BSH6HO
> 13oNaBWM%3D&amp;reserved=3D0
>=20
> This report was against DRM, but I'm mentioning it here because we've bee=
n
> talking about some link speed init issues lately, and AFAICT the gitlab r=
eports
> don't show up anywhere in lore.
>=20

Just noticed this.  The GPU driver calls pcie_bandwidth_available() to get =
the speed and link widths of the link to root port.  The driver then limits=
 the link speed and number of lanes to the max available on the link.  Ther=
e's no reason to run the link faster than the slowest link in the chain.  F=
or the most part this works fine because I think the PCIe spec envisions th=
at the links will negotiate the fastest link available when the system come=
s up.  But it seems that some platforms don't always do this.  Maybe pcie_b=
andwidth_available() should return the max bandwidth based on the caps of t=
he links rather than the current status.  That said, I'm not sure how you w=
ould differentiate between the platforms that came up in a slow link t save=
 power vs platforms that came up in a slow link because there was some prob=
lem negotiating a faster link or who, if anyone would be responsible for ma=
king sure the links are upgraded when needed.

Alex

> Robert Hancock reported:
>=20
> > I'm using a RX 5500 XT card on an Asus PRIME H270-PRO motherboard,
> > Intel i5-7500 CPU, with kernel 5.10.9 under Fedora 33. I noticed that
> > in Linux, "lspci -vv" always showed the GPU PCIe link running at
> > 2.5GT/s link speed and never seemed to change regardless of the
> > application being run, while in Windows, GPU-Z shows the link running
> > at the max supported 8GT/s speed when under graphical load.
> >
> > It seems like the driver thinks that 2.5GT/s is the max allowable
> > speed, based on the pp_dpm_pcie file:
> >
> >   > cd
> /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:0
> 3:00.0/
> >   > cat pp_dpm_pcie
> >   0: 2.5GT/s, x8 81Mhz *
> >   1: 2.5GT/s, x8 619Mhz *
> >
> > I'm assuming that something is going wrong with the PCIe link speed
> > detection in the driver. Using the "amdgpu.pcie_gen_cap=3D0x70007"
> > kernel command line option seems to result in the driver detecting the
> > proper 8GT/s maximum speed.
> >
> > lspci -vv output from booting without overriding the speed is
> > attached.
