Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC654B2DCD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA1F10EB0A;
	Fri, 11 Feb 2022 19:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41F010EB0A;
 Fri, 11 Feb 2022 19:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRjEfTJ+tWHSgS17ppVB/MR6QWNvYJoCX4gs19ZDrioRbHlCgHnj8u/vHM12za4Ni3/jA3sGHQ4oQW6CMxoRu4NqF/1DNRkGNxsDqFqE65HBMuqjO3WJZuFVALc4KBAUVwTxRZv4k4KkUlj4QiTjLNX9WxJ05po0iSPLi9WbcU9TpXWjMthQguEmmqEvvuqV6l0o8YnG+OdGRgfIoNJWEvFF0MmomzWKoLYqPi3WqiGtdCZVstvh2tLjnolgs1f6NVr2gk7Tka2G/MVi8zBCUSnQho3OWlKjDuOC0H4MeXsGhPkgURHYRsH0BGzvniFZpaKPu+ygUzpYMIPj/fKxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfH6vbe3dKkRLxJkYPwVJ0B/v09u5ZfrefLqdxBLN6Y=;
 b=lo3HHBUNB+sMRbQGaBTC+OfDCOexxHQkdf8jQRDVgjjHF4qc4b9QQN6mdNa0VOUxbhwksNUUAdX4qii1Qb5Q8GJGl4zp8bv/w3n51pCaL/GX3ZevrN5FfFML5ClNKrUWqh09yen0ExlTbWCcO45Mk7feGDs9FpBSbAELDOOxsRXzw2+t2hADSt6ubyQlRYwdTh7Bdr5n1TJJMbetMj3UMcwdhkIhrY2+xBiz6WmjUmQRfwd1Sqb9GsxozELyxgZ/N9EsCLEftjJVbD2sQbo4vpnruIUCA5Oo1s9qFthUftSfoXo6ny033/tSuFdM1v42/mRdkf5GZ3D19zE8p4bixg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfH6vbe3dKkRLxJkYPwVJ0B/v09u5ZfrefLqdxBLN6Y=;
 b=hMgnPenDRFdedDL0BIvNOuM+VCCKAINnKFLdVEwXxbQF81Myn5T7urh6rZYLxfN3kiyQjGI/reaU00TCHavm8xKoEUQRQHD1S75uYQ+P7I5d8mooHMDoGaNp54ghVmt8OW7Pr17BOCVFohMUwTR3LpN01nKlFenIAms6mo4AI7g=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by MN2PR12MB2910.namprd12.prod.outlook.com (2603:10b6:208:af::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Fri, 11 Feb
 2022 19:37:37 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%4]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 19:37:37 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: RE: [PATCH v2 3/9] PCI: drop `is_thunderbolt` attribute
Thread-Topic: [PATCH v2 3/9] PCI: drop `is_thunderbolt` attribute
Thread-Index: AQHYHs+rqrcOwCEkLEGfPlnD8b3/PqyOJU2AgACaUSA=
Date: Fri, 11 Feb 2022 19:37:37 +0000
Message-ID: <BL1PR12MB515776D8AA3AA375D914B395E2309@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220210224329.2793-1-mario.limonciello@amd.com>
 <20220210224329.2793-4-mario.limonciello@amd.com> <YgY5N1eVWmi0Xyuw@lahna>
In-Reply-To: <YgY5N1eVWmi0Xyuw@lahna>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-02-11T19:36:12Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=a8c4bf60-0637-402c-98bc-4918107473ad;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-02-11T19:37:35Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 991f3e06-952e-4cc8-96d1-55e85a8acc38
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2754d213-e478-42ed-af33-08d9ed95f55f
x-ms-traffictypediagnostic: MN2PR12MB2910:EE_
x-microsoft-antispam-prvs: <MN2PR12MB29105ED26735536709401A02E2309@MN2PR12MB2910.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HATeOplR9/UVEZB6QhH7+wZOVk+BHl2kxjYvH4ydkmeLOHOgvjJl3+OMU+C5PPTOY4GJni5+VVVPEb+MTjmwwmeDBCc+77wxX/dkOPbL4ozYv7MWPyDJQy4WtZQ8JFaH6y5HNVzg2Tkyx6VGOVjPCXIropBbT6W9jDYvDDCHLFsJU8fBgW274O3gZly6FG3U+/ks71LrM7oKCSiR0ouq7iDPf4hUh8R+n0Eo43NS3lwzmaOadADEOx4l0ceLSjELcTAFRj46My9mt3FXdSrxGfd5r44yTXTzealXcgKYeHxEpZGYimJTgzqv+EBiDlB5HQMyAVHev8f+YdfDBX9XHY6fmu0+fR0t49SVdof4dyBihJkQk5z/KXeMDnFOJ9eUlwPjZOVxj98vfPSHWGrjrtNfLKr6TL+/9zTyr2Xvxv5t94tWsmqUnWsnhMEwQqfZvJ5SnQfV2iYHHTEQkRYYunR9wCSkIjbbFlPCeiBeXtZgVFuz0CShf2NatMiOP/J5W/n7V9D4eOzzkqPUswA0KMy9ryc07Zdoeerhk3nxZREYcsgNiZlI/yuaiUhDwBjBRPNIkCfGp//fINOsoUnNE14fbwT7wRlQHVbtcWIzEdrLt/FlSF6CKCRkaDCYn7uppOCaiK8PzLNJBfYQsqmm13xdkx7BIYCMATAl1i5KCmxBVdPh/nKurYm0kVWbX/jg3quogT65WPcukTSG99LqfQTuTk/RlLqsHQtb+RKAQ5g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(54906003)(6916009)(6506007)(53546011)(316002)(7696005)(9686003)(508600001)(66476007)(38070700005)(55016003)(33656002)(4326008)(5660300002)(66556008)(66946007)(66446008)(64756008)(76116006)(8676002)(8936002)(2906002)(52536014)(7416002)(83380400001)(26005)(186003)(38100700002)(71200400001)(122000001)(81973001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0VmqsmL5RqurP58AzCEQ/4oOOMCuuLqbTKhExemuwTaNpy+ip59ZrGY/ZqtC?=
 =?us-ascii?Q?w8Vln/HoukPXRbQzD7L/3fIN/9Z8gjEmk1Jb4uaXMndt+3nhmfRHZatuY6vJ?=
 =?us-ascii?Q?LMd5Ka/KdsXKb3u565Na/1cp4GaxtS0k3pAEUbmYrvlGVyeCEe9lKfy9+5Qf?=
 =?us-ascii?Q?8YZ5e7zScOQ1QGaaT+wSHuJuT0RtUu3XbjTGNN5W+0j+Eg2WV/JUL1YdrrmS?=
 =?us-ascii?Q?lGrl2QS5Z5esbKyKQ0BOvfIzOwEAHNx7zIMGPdfjCq0OupbMK4XuPqYN8rHL?=
 =?us-ascii?Q?HlC0DXMzSQV1E8itxR8uwT/2fczYzTvqBYKhJAjeVdcMQYk5ZnI8MXreYF2g?=
 =?us-ascii?Q?0Qg5fLQwpZdttCACI1AOmLcShgVFi9WUQvFCmQlueL1E7ma3xBOvqK64NZvQ?=
 =?us-ascii?Q?rLxyTh8lQu/VA5P4frYHlUYnNyYOT5ZZgLvx6xIKjpv9RCfvoiVp0n3V0LTv?=
 =?us-ascii?Q?kcM7Srk30GvlB2rSfdDkVW52TwKBRKNjjHT/SAjDLP2LJ7cRpZdhwwWa3cbi?=
 =?us-ascii?Q?h9m8Dc1g4i5TEfvLGNPiqGEBhxVXcDB8mgc7DbIe0LIA1FujmpJ5TNLleg28?=
 =?us-ascii?Q?VrMile10L3V5LgnBa8EkgW0pNqzd5EnPO8n/oIc2biXNsedXnylHagwCN6PK?=
 =?us-ascii?Q?exhRtC8iMqWs21x2+3gE9UkPf8/Uw4Dq/Tx7tj/9j39jYEnn06HQVUVOXyL/?=
 =?us-ascii?Q?mY3qJrxRLABJ7V1P1bdnIpyicVxfts2vMMn2fwcCbgsTOLHaZwof/ztw8JA2?=
 =?us-ascii?Q?4oZ6elugsBY1mtllR++GNxPTjsna02/sy7gFtp8NuKaQ6bbl1HHdSDmVYn2s?=
 =?us-ascii?Q?0qFSiQadjDCk0NmLD+4thDnyTXbwxR5A+K2IJF3cVRCfI9gwak+C2HIuPekM?=
 =?us-ascii?Q?/Gc1XxSL18HsSM+BMpI0TFLIesdOjsUq9z7O11c2LJUAbbjxSWGBzh1s4ko5?=
 =?us-ascii?Q?fGGdFqCt54rGrxT2216fsytW64td5vSccQ6GJKverR47XVEnl6kSLlELhsT2?=
 =?us-ascii?Q?UV4NC4icejsH9pUUzDyHZcJ7Yq5jIq/+Pa5dtB04h713xXPQDsRn3Zbkp9Gr?=
 =?us-ascii?Q?QWl58uiT5IeWSYnqZlsLmgoatBBU6jBQnKxZRENMH463iKUo3hNXUeTeBH66?=
 =?us-ascii?Q?BUgdKLo/IrvcJbg2OyCd64QzQFr5joklpBa/yH4qtQsGWoCz+Xcf7MWskfQ8?=
 =?us-ascii?Q?rtOgj7/DhdqczfW5lAuMftWOvkRQUEBpOf5HOg9jJtXTaWZj1Nm3BQie6gKe?=
 =?us-ascii?Q?ohyxu2lvwMXje/bn6L0WZBh0KXByhC65+GAAqAEuybK6d8bccb8jaAsbUoow?=
 =?us-ascii?Q?J1FpRTtf4oL/Fh4o8NrPp5eQv6m1eiAIOZ2ogRnpSWLdHVt6kmXM3isJ+1mX?=
 =?us-ascii?Q?KnU7X7uWsySl5gp4595ur38OL58dkl/i4/T/svQUPRVtU7//ELMcJEUgdMrp?=
 =?us-ascii?Q?4d02T2gFeB8H38oIRyoiJfQo7plAsB3Vo04c8/nQT9k53Jobd1cJ9ocOuJZx?=
 =?us-ascii?Q?IiXvZ4cEog1P0OoNBkfEW4KABnz0J6ZIR/f1VxVuVg5sU5dQYVqmh/rKXNBV?=
 =?us-ascii?Q?gGcu8QIDLptNLclhGi3ElG5smrBNoOTDDgijPDslpqwXxz3W9GvPJfYFNY/2?=
 =?us-ascii?Q?in/e08++b7EV9Sno4/Paz2c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2754d213-e478-42ed-af33-08d9ed95f55f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 19:37:37.1297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X34UvYA9nrRyoP8VqHVcHg+k6hvlT2XHsWy7fxuS1JhX0SMeVw0KjYGX9EvOlFcg7Mwj7krVxJJIZ5kUjUuaug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2910
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: Mika Westerberg <mika.westerberg@linux.intel.com>
> Sent: Friday, February 11, 2022 04:24
> To: Limonciello, Mario <Mario.Limonciello@amd.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>; Andreas Noever
> <andreas.noever@gmail.com>; open list:PCI SUBSYSTEM <linux-
> pci@vger.kernel.org>; open list:THUNDERBOLT DRIVER <linux-
> usb@vger.kernel.org>; open list:RADEON and AMDGPU DRM DRIVERS <amd-
> gfx@lists.freedesktop.org>; open list:DRM DRIVERS <dri-
> devel@lists.freedesktop.org>; open list:DRM DRIVER FOR NVIDIA
> GEFORCE/QUADRO GPUS <nouveau@lists.freedesktop.org>; open list:X86
> PLATFORM DRIVERS <platform-driver-x86@vger.kernel.org>; Michael Jamet
> <michael.jamet@intel.com>; Yehezkel Bernat <YehezkelShB@gmail.com>;
> Lukas Wunner <lukas@wunner.de>; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Subject: Re: [PATCH v2 3/9] PCI: drop `is_thunderbolt` attribute
>=20
> Hi Mario,
>=20
> On Thu, Feb 10, 2022 at 04:43:23PM -0600, Mario Limonciello wrote:
> > The `is_thunderbolt` attribute is currently a dumping ground for a
> > variety of things.
> >
> > Instead use the driver core removable attribute to indicate the
> > detail a device is attached to a thunderbolt or USB4 chain.
> >
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > ---
> >  drivers/pci/pci.c                 |  2 +-
> >  drivers/pci/probe.c               | 20 +++++++-------------
> >  drivers/platform/x86/apple-gmux.c |  2 +-
> >  include/linux/pci.h               |  5 ++---
> >  4 files changed, 11 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index 9ecce435fb3f..1264984d5e6d 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -2955,7 +2955,7 @@ bool pci_bridge_d3_possible(struct pci_dev *bridg=
e)
> >  			return true;
> >
> >  		/* Even the oldest 2010 Thunderbolt controller supports D3. */
> > -		if (bridge->is_thunderbolt)
> > +		if (dev_is_removable(&bridge->dev))
>=20
> For this, I'm not entirely sure this is what we want. The purpose of
> this check is to enable port power management of Apple systems with
> Intel Thunderbolt controller and therefore checking for "removable" here
> is kind of misleading IMHO.
>=20
> I wonder if we could instead remove the check completely here and rely
> on the below:
>=20
> 	if (platform_pci_bridge_d3(bridge))
> 		return true;
>=20
> and that would then look like:
>=20
> static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
> {
> 	if (pci_use_mid_pm())
> 		return false;
>=20
> 	if (acpi_pci_bridge_d3(dev))
> 		return true;
>=20
> 	if (device_property_read_bool(&dev->dev, "HotPlugSupportInD3"))
> 		return true;
>=20
> 	return false;
> }
>=20
> and then make a quirk in quirks.c that adds the software node property
> for the Apple systems? Or something along those lines.
>=20
> @Lukas, what do you think?

I took a stab at doing this for V3, but I'm unsure whether ALL of the TBT c=
ontrollers
in pci_ids.h have been used in Apple laptops, so it might be a bit wasteful=
 of a quirk
list.  If there is a known list somewhere that is shorter than that, it may=
 be possible
to pare down.  Lukas, if you can please look closely at patch 3 of v3.
