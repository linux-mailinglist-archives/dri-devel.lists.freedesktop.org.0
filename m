Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A93774C7D7A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 23:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3D910E936;
	Mon, 28 Feb 2022 22:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899AD10E936;
 Mon, 28 Feb 2022 22:37:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmZqLVVbNXfYznnb/fPyyToI+cIgY6fH4AhjmjFaNVerG6ThjyXjfD5TdoxPwWO4gjdK94NKcoa3RyBySnN1Bqs0WXFftL0xDRP1Cyfu6C0zPR4Mc3nVkd62WFmvDBV2U/PkxbcjTcO14P5GtZcjV3B/iMm0jdCSzC8dstnR53OdPMxqICdTFNWxNVx5UYla0NOulFX1ik3UzKeuCKVQXbGIDDAJ0kiJ0+cXtdfuUq1k4vWR7zCMhjpSPSipu71eSNguEQwwSihafFVsDx0JgJihgbuo/ZWhdjsFtcic/7QzX1bnYe1uffpspqHHqyZUc+dSR7ihu6Bbzdl5FhFQxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9FMRDAHF8kco1ckZYrY12RdPPLornV6LMMfVRHHcjQ=;
 b=WdJLJ/9ODPeAJXoREY+sJ/4dRSGSfgbNbZzNl1iAfmh/pw/f1bk0ezm8rdAsA6RxuC3cOI1Oc3h12SdsTIbGT9aBH23BslfbstZBmRVsETzFv5Pft04MHhTgOjYp9wkS0wFSNraFIf+Fvr/QLeMMjmPz/zUvq8kRLuSju+QMDPO+Z4QxizDAPx59v0+jJFKbKilxoVRUwAsxcGlIgdA6Ge+ig3zGaOJGKgDq6Jdk3cWMBevBKqgktFGaQGX5Y9PKr2Ib6SFV7ENmH+AysIX6zNobpHSSJL2Kt/lBZ36KbT3R3I0PPYXuvmwTE+ZWyaBcTGAeNfzbCFxFq32dqJV5eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9FMRDAHF8kco1ckZYrY12RdPPLornV6LMMfVRHHcjQ=;
 b=WTFGvmvXVUJSmwI6+qUVEMwEYgPKU7WgZvT9XfJ4sc7PW/K9kz3VSB+mdRbI0cIUZCfnTn3BMFvEZ5AXFvgze2S/rsk6DM08cqelT/a1sMcYIOtgKItt4Wp7YPVNBrV+gHwL2C8vedaIhu6h7UzKP6rgKh2vUftrMuODOebzUkM=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.24; Mon, 28 Feb 2022 22:37:00 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08%5]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 22:37:00 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>
Subject: RE: [PATCH v5 3/7] PCI: Drop the `is_thunderbolt` attribute from PCI
 core
Thread-Topic: [PATCH v5 3/7] PCI: Drop the `is_thunderbolt` attribute from PCI
 core
Thread-Index: AQHYKcitrtJAPT2QQUmCWjKl2gz6MKykioYAgAQ6SwCAAFbcoIAAcacAgAAFUQCAAABwcA==
Date: Mon, 28 Feb 2022 22:36:59 +0000
Message-ID: <BL1PR12MB5157D5E18AB8206E2085C952E2019@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <BL1PR12MB5157004F38E3FEFF046D9BE4E2019@BL1PR12MB5157.namprd12.prod.outlook.com>
 <20220228221344.GA529289@bhelgaas> <20220228223246.GA11428@wunner.de>
In-Reply-To: <20220228223246.GA11428@wunner.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-02-28T22:36:58Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=bc45983a-9a02-4507-9604-8631fc3779d4;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2022-02-28T22:36:58Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: 1e740a31-80d5-49c9-958c-26a666870d6a
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85e4c359-c769-4c41-e597-08d9fb0ad587
x-ms-traffictypediagnostic: DM5PR12MB1355:EE_
x-microsoft-antispam-prvs: <DM5PR12MB1355D80CCFFE70846BEE8234E2019@DM5PR12MB1355.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o+nIK9q686i5oOtkFXXua6cr5Ea9IngqBF3Ns9aoU9pfASR4ZI+HQGLyedpQUlWbxljWirE+sM4ZCPTfFSc3m2MDGfq8L1CPCE//IpCKYZdEHIoYqv8rm4QC3UmM8SLpmSgoCMG32D8rmOWA2KystN99Ore6sImJhDyK7mU8bo0oELWlWB6wOl9pkqvzCxO36j8RfTDJ8Mf1W5Lgh9GFzwSsN2taxGQRxWZSBdx82rL222CO4RsYDhql92SNIRdE5O6lGeQv4Py4ik+opDc3Ypzg6fLZxaJpij64OKeHx/lGIVp25AlCpP2HdJXOQKzD7qISgOWZzzIS7oeDGfotFLe7DR/ztTAqWZGBlnj0aN1FBtdIpZvzJpb/H6LuZdCJPPU2TkOrxC1XvPu9XaMTYorqJQQcyjWsqlJFRApYCpD0GWGMFwI8Rqu8UFeKY4EmgoXfcWPjQcsDuVJIMOjiMV1v01FY22A6jjzaJAFnyM0qpJtXOsksMUoO7TmKnwQmNAWDY4IsolgUxEkVrRdKl0MbxULoG97zdfn52YEvwZQCVH33IOHTGhOKk9rhGkQLw5CY9DF9Bt+YGqHEUa5HmM3yuxxIQG8xq8yWefKLnV/myP1e+C+X9Jrt8FpFTCw85G9YFRLE3xsGC9om5zo+vdu3ARwECTC+LHgEn1md0os6zwoOUDsj1H2E8X4ErpZJyLh3spksSVPHlQAgrvOvU87HtVJtN86HmVk6cXsNxLo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(110136005)(52536014)(55016003)(38100700002)(66446008)(8676002)(64756008)(66574015)(33656002)(4326008)(186003)(66556008)(66476007)(76116006)(66946007)(83380400001)(316002)(6506007)(9686003)(122000001)(53546011)(7696005)(508600001)(8936002)(54906003)(71200400001)(38070700005)(7416002)(5660300002)(2906002)(81973001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K0eThLeLO/3BXmj2RmYIKh2n8Kt+OrhqQvAcWpRl4FDvbB76fhQu2iDEKMAd?=
 =?us-ascii?Q?xoHvc7rOL1LgOpufchxOt9aztLnnqtL3rUL6i08nPGUxO7ql/01WkXUM4e9k?=
 =?us-ascii?Q?GXFZSHdiR5JuoXgX+mvP5Ihsr01GlwgR9PdeeEQKiEPgkKYDnLtiezDegiqK?=
 =?us-ascii?Q?IZdD4DsEp/JZvTPAE0L0WWJd1VKsBX024lDkPnLDpf1cfXWuuVy0fjvaVPj7?=
 =?us-ascii?Q?GTRz37dRLPwl6yHU7sabMgFjBg8SoG7vedb66dLCNyl0GUhNMHhP6Zi1cg9O?=
 =?us-ascii?Q?qal4U+PuEMTqGTmpORz9+i6qNLHH0HnauRUuQTZx52Tg4bCDY2Yorpb5pslU?=
 =?us-ascii?Q?hWKD/kDiB7EbTj5txn0jvITzeQf5JdjkZe2mRICA9++Cxk+FGkgV0WCgNgjX?=
 =?us-ascii?Q?uOhYpVrQE4cWgA1+4Oa6iMCuCfOvrbY3OJxzsIV+nnJumhUbstsl2JZNBdIW?=
 =?us-ascii?Q?54+mLvuoigXf4FG0RzL1wcXs6QVylSiLpY+HV3FjEPwgpRu5OnxihGwZ1wtn?=
 =?us-ascii?Q?iZDXli1U/PsxyzHzPXHK7f859EWlZLj+ZUNAImr5Y/tZtWVs9R6fBXP6IG+A?=
 =?us-ascii?Q?g9PmheTu+Ic8D+S0+nu0eXbatBWT0DhTsMQNMuBBYd7ARdg0Mp4zBoKyfTXS?=
 =?us-ascii?Q?RsIFVmCoCuU+E0r5yBdqpttHXkGvKgzQvo1hgKhRbI0Mi/SnSmQT6RnrjoWZ?=
 =?us-ascii?Q?Vtv8uQ0bivlazX9FNYDvxFIuMXvpKwByyUNMDh7Pi3PsvpA416qCVF5ETecH?=
 =?us-ascii?Q?88BJ/UwKB1gi9U1ASD4hnfs8GAA6E1epFgT6RXF5YOPQaeVJrynRa4lLyTHf?=
 =?us-ascii?Q?VZZYReTqMM0FzXjTLloivG4HdUxVBlO100V/Zjx3jRf2mQn5CGNhH+ZDOvhl?=
 =?us-ascii?Q?BY3LuhTcO5uPASELcsF4Qzdxvk/gCfcctl/VvpnYAs2rXVdmn8C4EbupQne5?=
 =?us-ascii?Q?+6HvQodrC/Gg+wZV9+NGVaPPTnEA92FWBL+RhU0y478OAh/bhAJPoEoHFDax?=
 =?us-ascii?Q?6uRiQkEmxmuPTPhKGVHSonReWcbSIypmcZwNer7SG/nE8lCIAvbIoFH2wLag?=
 =?us-ascii?Q?UEz8cKtya8tGd0/FAvgrC43gze9KlhuUr6Ie3QOIP3tVhPMa/kV5yL8tjj5N?=
 =?us-ascii?Q?FmZndDT6R5R/YR4lhOQQhAWs1mWL0R+zWbhtINzy/J5kpy2W8yRDXtL+esgz?=
 =?us-ascii?Q?QMHwrOAdsX2dGJAvsiPsheNAlIpQil+7+KRmyTrHo0HV+I6tjiHg9OvyvVYP?=
 =?us-ascii?Q?WktbSCy2LOdwGR49uvOf10c0lUSectSUlc+RZK0txFJDaO4BQQUvDr3WlL40?=
 =?us-ascii?Q?Qhy3nCaiMuKBcFJIGeCXE+sQaU93hrgW0oNNIkSXmpCxUwdtGijejtlOU2iR?=
 =?us-ascii?Q?uXlFyhPo4J0m3qlsQ+12qcW69qRcqpnXttNMoHV2B6wZ5e8Br1HBUyVA3PCf?=
 =?us-ascii?Q?onWn7LN5H3teaR9WhiNQ248kixb9sWZPXmGS0nqBcZd7Rh0akEowzZZUW7bv?=
 =?us-ascii?Q?YglJsRhMNLb9SPDSkywHJbPcJcw6iPwL43r90e84i7Stkm34H2v8qpv/FCCX?=
 =?us-ascii?Q?OckXdWldliRG848mgRSTvE6xrlXRaJ2AipnqmelkKHXI50xZVFmY2Ju3/4kI?=
 =?us-ascii?Q?RnJCyWtLBhxL5ZDLJmnmv79n1JN4PudJrrDxVcEgb7jrR3WVbBB3u49EavdM?=
 =?us-ascii?Q?whACJPm6YeeibUZjOiOktia2kyY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e4c359-c769-4c41-e597-08d9fb0ad587
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 22:36:59.9240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JuxKIlAhvf3XBuXhf8u0oxKdOUmcMlZv7iGbBPNGit9+EcsBwYZyfNj05CGorOfbCbWwodMWHx7xAygkDSzOAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1355
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
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>, "open
 list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:X86 PLATFORM
 DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

> -----Original Message-----
> From: Lukas Wunner <lukas@wunner.de>
> Sent: Monday, February 28, 2022 16:33
> To: Bjorn Helgaas <helgaas@kernel.org>
> Cc: Limonciello, Mario <Mario.Limonciello@amd.com>; Mika Westerberg
> <mika.westerberg@linux.intel.com>; Michael Jamet
> <michael.jamet@intel.com>; open list:PCI SUBSYSTEM <linux-
> pci@vger.kernel.org>; open list:THUNDERBOLT DRIVER <linux-
> usb@vger.kernel.org>; Yehezkel Bernat <YehezkelShB@gmail.com>; open
> list:DRM DRIVERS <dri-devel@lists.freedesktop.org>; open list:X86
> PLATFORM DRIVERS <platform-driver-x86@vger.kernel.org>; Andreas
> Noever <andreas.noever@gmail.com>; open list:RADEON and AMDGPU
> DRM DRIVERS <amd-gfx@lists.freedesktop.org>; open list:DRM DRIVER FOR
> NVIDIA GEFORCE/QUADRO GPUS <nouveau@lists.freedesktop.org>; Bjorn
> Helgaas <bhelgaas@google.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Subject: Re: [PATCH v5 3/7] PCI: Drop the `is_thunderbolt` attribute from=
 PCI
> core
>=20
> On Mon, Feb 28, 2022 at 04:13:44PM -0600, Bjorn Helgaas wrote:
> > On Mon, Feb 28, 2022 at 03:33:13PM +0000, Limonciello, Mario wrote:
> > > > On Fri, Feb 25, 2022 at 11:42:24AM -0600, Bjorn Helgaas wrote:
> > > > > That would just leave the "PCI_VSEC_ID_INTEL_TBT implies external=
-
> > > > facing"
> > > > > assumption above.  Not having a Thunderbolt spec, I have no idea
> how
> > > > > you deal with that.
> > > >
> > > > You can download the spec here:
> [...]
> > > > Inside the archive there is also the DVSEC spec with name "USB4 DVS=
EC
> > > > Version 1.0.pdf".
> > >
> > > The spec has Host_Router_indication (bits 18-19) as meaning external
> facing.
> > > I'll respin the patch 3 for using that.
> >
> > Thanks, please include the spec citation when you do.  And probably
> > the URL, because it's not at all obvious how the casual reader would
> > get from "is_thunderbolt" to a recent add-on to the USB4 spec.
>=20
> PCI_VSEC_ID_INTEL_TBT is not mentioned at all in the USB4 spec,
> hence there's no connection between "is_thunderbolt" and the USB4 spec.
>=20
> It's a proprietary VSEC used by Intel and the only way to recognize
> pre-USB4 Thunderbolt devices that I know of.  Its ID is also
> different from the DVSEC IDs given in the above-mentioned spec.
>=20
> Thanks,

The USB4 DVSEC spec makes comments about DVSEC_ID of 0x8086 and also
DVSEC VENDOR_ID of 0x8086.  Is that not also present on the Intel TBT3 cont=
rollers?

My interpretation of this (and Mika's comment) was that rather than looking=
 at the Intel VSEC
we should look at the USB4 DVSEC to detect the Intel TBT3 controllers.
