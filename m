Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425DB4B2DAB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240AD10EB0E;
	Fri, 11 Feb 2022 19:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E2B10EB0C;
 Fri, 11 Feb 2022 19:36:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXM9v0HSJYr/Xttif5kpeonZoSuCxFzAIxoOZwn3ZdPOd3nk2TAWb5fXN+w6lR3uYDKiEN/cnG106xfec6W8918+/Ves4a5eaRt91dXlxe86t78Fqccd90+W9/SHeZbea5TjOApOqUjwZeRPyrfV5n223CKigmpziZ/ruvXTYJpSNVDl6isVCs8pWwVfh6QV3AQ4JGz5ivmkkppceRV5vK4VoLtVteYyLY5rJTh+xhFHQ9eu10rfPAwxj3hV+EJy6YUC9yri1+A6jG2kcKs5m2mJ41iFp9Ijz5jI0kpggpwv6bUUqkCNMnbkSPi1SKSu5GrAMcTJU3PgWnO7SH7EVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAqUNiL7WPuTmbhWnJEe3HFz53/j59z/p/o/gclNFJo=;
 b=TYjdxX3Lv3itf6JOO7ucluByLZ+MEvktykzeyWGiO/b8w41F+eQNd5EtM7ZKAhcyPhi9iUxhg9n9V1m3M+XmsWbtEeiW5xmB5iunqUPXoV9EUEN3p49WKH1a0sLng1dtDDVZMTtELD92rlFt1o/zg2NlYTwAlzORW22vWaIJEt68cBAeUib3bLOeRgpel87dgaKgPocPE0qfPAlp41UOejFqlcBniOvheRvnMWDjeZnFrheXsQuhYNaCP2v3NEURfRRBg5KqSB853TSHSAG2SGG1b1grmSYG6vc2pNjRBGqf2MA6P+aP8uIRaxlKWNR1Bsm3MRkymaCwhwwfD7qPkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAqUNiL7WPuTmbhWnJEe3HFz53/j59z/p/o/gclNFJo=;
 b=Ng8hytR3qLXfHKQdKnP27xOltys+6Y4/K92of47g7GSGzlcJTFjdjGTTjxmFxcCWSbIAFtDBvlfQT4dnYhWY6tMaw/zWl8rduV+GmoX6OScOsj2MA9O1NfDMp8jfyj2QZgDR5DXoE6ZR3bbD87vdwM5fQBJ9uY5W4wQZH5ezzu8=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BYAPR12MB4613.namprd12.prod.outlook.com (2603:10b6:a03:a4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Fri, 11 Feb
 2022 19:36:07 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%4]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 19:36:07 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: RE: [PATCH v2 4/9] PCI: mark USB4 devices as removable
Thread-Topic: [PATCH v2 4/9] PCI: mark USB4 devices as removable
Thread-Index: AQHYHs+qdRVlOmRMTUOZ2+gbsPphtKyOKGsAgACW+UA=
Date: Fri, 11 Feb 2022 19:36:07 +0000
Message-ID: <BL1PR12MB5157E4674F1901076366930DE2309@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220210224329.2793-1-mario.limonciello@amd.com>
 <20220210224329.2793-5-mario.limonciello@amd.com> <YgY71Lw4ZFOtdBVj@lahna>
In-Reply-To: <YgY71Lw4ZFOtdBVj@lahna>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-02-11T19:36:02Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=4d345ad5-24e3-48c2-94b9-ae97cdd03fb6;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-02-11T19:36:05Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: fa55a648-77af-4bfd-babd-f6525493807c
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d40b56c-8d4d-4905-32d1-08d9ed95bfd0
x-ms-traffictypediagnostic: BYAPR12MB4613:EE_
x-microsoft-antispam-prvs: <BYAPR12MB4613D6DB3BBD5B9C4186BF59E2309@BYAPR12MB4613.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RvBG9DaIumTLCnGn3NyAFaEnXeY24/42NMj4n2rvGF7eb/psySWOJ0morsu9Kfr+6afykYpHR1a0kpRWWqCpb77nGYbfo3OA7cSawa9KT8E9RIoRO6N5qlx5QDbojRw12qKOoBjBIr7VwbH5dMt0livixdBi5NYqaQNk+IFaiUnaFbuwK5hXECe+cYLAmHK+cOYH4L8gJcqLeZ8tnhHqbk69xd5dkelgGdmLtouzDez40aPeC88N1gF9gaXiEQOCeds7RjtRRQPcuX6gqWwXwxIomu+qzoUAT6MDggV1b9mUyZ8CMvTxJrLFvgCQVksWcvaogE0Tk44usuRh5lYlBbJTv3PNNRZrpSfNmTgNFqxbryMmw5S1ktGhVSBo8kaDeK4q+bo/ciZiE9Qw8TX4iTRYOxwoNRMUoS59zgCrxpQ80mP+UkVQS6SbcVgOCynUkGIyonTbHHkO5vdHNUIRGU7RXkMd/fSRu5pKAghj62s3GfG2LZrSugqa5ti3JS3A8W+P6ePSgeFcJF6NP0hv4VkAsIr+5zqoKcWMav8MTcwbs4Dy1OxXuVQSB7hwyopl6ibtjV2853KtzFycMPwW8F2z+QUlAmTHRMUttV2NhdqpcyCc2NPzXSqoId+2z+DX6B1O8XwCRSpD5Ao+FlUr7zm3uvU2dNqt4htQbLyh5NMKpkzQUpkku6qbevlsZv8Ttb1NWwicXueVNw2iuaXiHJhbTEWZSV6qhE7ulBUSrXHAkhbk9fEn4Bn7aNbyvM6I1Ig5kmE/9e3R9wC77ruq3cFvTBsUvdNnnfaboZDr1mw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(6916009)(54906003)(66476007)(53546011)(86362001)(508600001)(38070700005)(71200400001)(966005)(38100700002)(2906002)(83380400001)(7416002)(52536014)(55016003)(26005)(186003)(5660300002)(6506007)(4326008)(122000001)(33656002)(9686003)(64756008)(45080400002)(66446008)(8936002)(76116006)(8676002)(7696005)(66556008)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W2R1mzTXgCNnyPJKcEXil/hwfjLduXasdmOgNgenRAiycRZg8u9dCXI4huwd?=
 =?us-ascii?Q?hlDEpeJcCHAN1w8sUdnZtQoG5zuZ60ldH5s5v+tH0ORwKh62IafpRwgYQjNU?=
 =?us-ascii?Q?3uAQ11Buoty5NKiqkBNC4zdORs3H8zpDiN6suazJ5KLAyJbwKMIVjrMc2ZXG?=
 =?us-ascii?Q?zIDeSioKbPbAMqANnnszcDw10SMp2xJVl1MjTbVoWUdbXbJGhgEudqjMrH9K?=
 =?us-ascii?Q?/je/oI9aJ2+kAWzu2l9H/bnn6BHemwxJ/GZx18wAeBpMZXc4s34W9TCNigMt?=
 =?us-ascii?Q?jLkBahBSmy8Mwc/gc22oK4SImNRY+z100Ny9IQcjSTj7O1/WPqFUReZGlekv?=
 =?us-ascii?Q?lB3yu+C3wD3OB6zp/gShhNRy64pRLrxF1ksN2gF7bTZB0UtbJLLs4Lu7XCDG?=
 =?us-ascii?Q?5KrQYVMDPCwr/gA0gr3aVOnTJRmbqvfiwlrovIP7NsShYEBZJU/bfrwhCt67?=
 =?us-ascii?Q?zHZbUpWYiZ24QhEB4+dR0sXSKXzaPrsU576USqcxQRetY8vxqSHOJPTyOyQl?=
 =?us-ascii?Q?QrXi1kfFlqvl1d7ife/PU0F70Vw+CmI1puCvsRszEhL3Fdr7MrAisqWXADSz?=
 =?us-ascii?Q?766uW1U3T49SAoOoi8iifBYRV4JDGFbIuciARhOFkX1Zexh07dhuBrhmZeQK?=
 =?us-ascii?Q?mgG3SlR3m1oGYpifCJKjAI5iPF9OXdBFZ8ei6AtSlj3BUdnf7Fpmi7T0AwDn?=
 =?us-ascii?Q?hOO6ZM4ynuSzMa7lpBliQRKDh3DKNactYGR4/3A0WS0uhYgp4d8Z6r/RfXCm?=
 =?us-ascii?Q?buumVbcBiY6IjT1hrKofywglA0Bz0igY5JKJ60f2VWcDay039Q8SncUoabYc?=
 =?us-ascii?Q?DbIhlKbYxWOC65/yonial4UYlNLJLneYdwzLOgUAS7wFxm3RSxPWTYYTDe6y?=
 =?us-ascii?Q?bEfO5wNYvf7s016Q3WFLR0jvY8tLImSGkILxTTEB+XdR+/uy15ReWFYfUVtS?=
 =?us-ascii?Q?QzhJ2btbliyquQaiQ6/uwZwfFmTqRVd3CT2mi89VNoc7AvteKT36mUUydGIy?=
 =?us-ascii?Q?DluVTMx6A8EHu/j5ndFCYqMxqfK4M2hf7ODFArQgMrmPE60NDx2xEuucuzcA?=
 =?us-ascii?Q?UAsWRgkYhgpMql8RRkBp9nBRDn5P1x34RSXMN6+xaRYnNCXrYfEmH2lppkc4?=
 =?us-ascii?Q?n+lXZKomdhxzk6zz+kVyahLg93q8YjnUeCnUZxyTt+2QFpBG9RF5kZ1FBE10?=
 =?us-ascii?Q?1AM6c/71wSFkPVrlNKbxDh+rlOYCgU7abShAZTyj87GyUfEtrnGAKRFdXWag?=
 =?us-ascii?Q?M0eW4maE1poN2mVSfay8/hk7cGul/Nfd3dQfNvrSLWOaXVaDRy21ToDWe2Of?=
 =?us-ascii?Q?A//qkUc8cc8niwt056zSLowkTdmSjQXAUKp9xpadwVZ+PL6PW6C5gMyUuJmD?=
 =?us-ascii?Q?0pFvpEzR83hUgtmZOT+a102Do0FD1y2ttf6hfAKa5z79oDzd8/FYHU0cT9pz?=
 =?us-ascii?Q?2HwDRKAcUM7RkWcUJeOABbBhsAG/tkeuT83QVL90obeAjT3huyb7vUuEmgeR?=
 =?us-ascii?Q?CEldw1nhwN/Q2CIVRxmOvAwTb9t0XPjCEcwOBjXDBzxMPgzf3ircAwIjjS41?=
 =?us-ascii?Q?k5y3NLCr3Moco9iq52p6yixM/6+mm9mEvFpsYculQh2CgUwIh9j56zUUdlmx?=
 =?us-ascii?Q?/BGSvYry5BxhenRDu5b2SRM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d40b56c-8d4d-4905-32d1-08d9ed95bfd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 19:36:07.2701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lk5XDi4ha5CqtCCpBR1DgEqZQRGep5AZhEA1Ci932WrdlOEDd3bV8WbTyowDXQptdxhh5ed1j2hJKr6mYx8KFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4613
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
> Sent: Friday, February 11, 2022 04:35
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
> Subject: Re: [PATCH v2 4/9] PCI: mark USB4 devices as removable
>=20
> Hi Mario,
>=20
> On Thu, Feb 10, 2022 at 04:43:24PM -0600, Mario Limonciello wrote:
> > USB4 class devices are also removable like Intel Thunderbolt devices.
> >
> > Drivers of downstream devices use this information to declare functiona=
l
> > differences in how the drivers perform by knowing that they are connect=
ed
> > to an upstream TBT/USB4 port.
>=20
> This may not be covering the integrated controllers. For discrete, yes
> but if it is the PCIe root ports that start the PCIe topology (over the
> PCIe tunnels) this does not work.
>=20
> For integrated we have the "usb4-host-interface" ACPI property that
> tells this for each port:
>=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdocs.=
mi
> crosoft.com%2Fen-us%2Fwindows-hardware%2Fdrivers%2Fpci%2Fdsd-for-pcie-
> root-ports%23mapping-native-protocols-pcie-displayport-tunneled-through-
> usb4-to-usb4-host-
> routers&amp;data=3D04%7C01%7Cmario.limonciello%40amd.com%7C64e5b663f
> 97b40f4035a08d9ed4a3162%7C3dd8961fe4884e608e11a82d994e183d%7C0%7
> C0%7C637801725176496963%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sd
> ata=3D7BvPgExVP8Upvi25EEbqH9TacFDZ4zpCEKOfoBJWcxs%3D&amp;reserved=3D0
>=20
> and for discrete there is the PCIe DVSEC that can be used (see the USB4
> spec archive it includes the "USB4 DVSEC Version 1.0.pdf" that has more
> information). I would expect AMD controller (assuming it is discrete)
> implements this too.
>=20
> So I'm proposing that we mark the devices that are below  PCIe ports
> (root, downstream) that fall in the above categories as "removable".
> This is then not dependent on checking the USB4 controller and how it is
> setup in a particular system.

Thanks for all of the great suggestions!  I've incorporated them in v3.
