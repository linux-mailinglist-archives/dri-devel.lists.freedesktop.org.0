Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EEA4C70AF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 16:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18D210E623;
	Mon, 28 Feb 2022 15:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2061.outbound.protection.outlook.com [40.107.95.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6356710E623;
 Mon, 28 Feb 2022 15:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USD9wi/WFcUYSEUp0KblDzaCTPr03JnqPvki+Wk2b7m4SrTD9sMu+CGikuUFuqUd5HPgwXLHH8dzTWXi45+DfjfNSSqzuL8v/RRP/bfgrI7PJkraWbRH69jH9cYpNNkGxDVYUXzGw2WYrohH05x1/730ZcAK1cnXpRX87HEgwd93KMedtT9w9GM8VMDznoUj91UzRcRZdZiya5YMah1vwvKVk1WvCqzA+iZDnzXxZODzVfVWPSJF5p4n+IpOfG1MXz8s6hxuFOM7m2Vbf7k9mKes28CnIl1Mw+d6as6GCAInCZqXNaPjEAKr/7GnwS7cy2xf5DUc3DeeCH7FjIyvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyesUUymhIcpujg1rL+xaiySC7O/7wNFkfY1eyQrUf0=;
 b=JvTGtp4CKE5lstfRoeBCUXdGruJj3wTtp5MbmdCK1L/R5bMTK6uRDXAtZ+vjfd1J8gNY91YoMusvpyaB1/gj5RsUpxvXssMej0YWJN6T6eoRoOutZ+zeJ5SweqxPLWennTYYqVjUWm8HdxVPEGpnvQm+BT5vq/rVz0UyT4lkf/bmofo1Hcspy/xLUVECIr2kudNke/ZmjWqc/t8YG4DaO0iaBG/jFXtKv1Si0/ABB9YCrLrrQlnhyrErLNXRZ+FNOSghUGj7FoRPS0ZyEEzyhq6HAf3JlAtYbXpQchulIzeqq00eoMpP2BGxus6y8QS2sS2bCNFIozBhTiB0Dlgkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyesUUymhIcpujg1rL+xaiySC7O/7wNFkfY1eyQrUf0=;
 b=A9bmLQz5j+Q54ED1SPkOe5oVa7E7OdQTtHljgR4hrl3FsG3IF3Cq7mar0rw4LOwzpwk8T2EFehE8/2QMrjvn28HMOjdiYoaZEbau5c/kz/iFfDFPOmGa4esHIJEbla9E5LsyxvVxe2XZpEXfoBIZOdvhqbCq7suJ8SHaW15vo9k=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BN6PR12MB1394.namprd12.prod.outlook.com (2603:10b6:404:1e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 15:33:13 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08%5]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 15:33:13 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Bjorn Helgaas
 <helgaas@kernel.org>
Subject: RE: [PATCH v5 3/7] PCI: Drop the `is_thunderbolt` attribute from PCI
 core
Thread-Topic: [PATCH v5 3/7] PCI: Drop the `is_thunderbolt` attribute from PCI
 core
Thread-Index: AQHYKcitrtJAPT2QQUmCWjKl2gz6MKykioYAgAQ6SwCAAFbcoA==
Date: Mon, 28 Feb 2022 15:33:13 +0000
Message-ID: <BL1PR12MB5157004F38E3FEFF046D9BE4E2019@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220224215116.7138-4-mario.limonciello@amd.com>
 <20220225174224.GA366735@bhelgaas> <Yhyg5OVL2hCkB+om@lahna>
In-Reply-To: <Yhyg5OVL2hCkB+om@lahna>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-02-28T15:33:11Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=98cb09c8-f615-4dd2-a3dd-5283e2c666b6;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2022-02-28T15:33:11Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: c6e06339-9e83-41c7-ad39-17583e63bb2c
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 301f27d5-b8d0-4da8-6c61-08d9facfa225
x-ms-traffictypediagnostic: BN6PR12MB1394:EE_
x-microsoft-antispam-prvs: <BN6PR12MB1394C3D6302DE7B5149FBCD4E2019@BN6PR12MB1394.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MtSf/7w63tOTzIJ0CDap3wgqqaVLhpTNwsxNW+MFuUUubb5W8zij4/IpaHnVOFNDRu/kigpO0FbSCXvViqFZ18H5YRJZJSNPeJ0Lq4we4vmOGmyuvOqBw+9FOb6GJQQEamEQTrbVaVCCS/afMPCLpcz4sCVQqcu2FoeU+AjQHKnIpF58JvfXIy6KyM9aLiZ6lQ9Sr0nC8LdfsbKOBYUv8jyXYeEnMbGhKSCo0Yr3BwWL6R9F3D6Ps3sQOdIYYwH7xO32sDIVvLtWoJ65QVWCHKq0AM09uvSw1JRYTQM4SHUoTHs5XdyM5mneyAQr6isV3Hj2mEu3r0v527xgP37ym7qamQlghorUdZx8X+b+WmGWVxR/q7tGQhsU1eKisbr8jmDsw0i9iUQjwlRU9rnnEJ9Q5NqdwiAteGJESnAxqHzJB7To/mscTqli6SdNiszqGT9kiJNdKcjlc8Eg72E8i8lsuhwcQS6JTb8yF6jcWnwPDka5Sun/JFhBtdL1j3ZWqgX/JTmPBsc0fBAl+XRNtJt1lw61FpDd4Vmkl8oPBK41Fmd6hCnjkf1mvdIA7ka0ypJIgIP+LeOR7hJmN4RwMSnnIt+9wuinYffS5O+P3mLUaS+okza7VcUtjYLsodLHo7vn17Jlb1nM768EUax8JWiFE/ni4pft5bgI7P83J83A238rTK+D5wLVEcdOlzQXXjbOascc8nQKd9g7Vj1GGEwHDJyenbbdII0zwPsTuEk83xl9Ml3w9qGP2N7ttDcJg9NX2+2F6ZiEFfaHSjosjirDJKpa3vPzEGvhFCMCO+718aEJ/1I+cxLRys7OUKqz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(52536014)(33656002)(508600001)(55016003)(186003)(4744005)(5660300002)(8936002)(4326008)(66946007)(66476007)(76116006)(66556008)(8676002)(66446008)(122000001)(38070700005)(2906002)(86362001)(38100700002)(316002)(64756008)(66574015)(54906003)(110136005)(45080400002)(966005)(6506007)(83380400001)(71200400001)(9686003)(7696005)(81973001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P90WYdMfvc4wqNhSnMoUZ8lb2ZToKIPRox0e5ENEPRzQtrnLsxeQIwn0Mx07?=
 =?us-ascii?Q?G/eYMA8i0dQ4sDAqBmaKBT+ulsNzegKBxo8V/Qs88oEyIAWYjEeIL8raw2I1?=
 =?us-ascii?Q?BzOeEcZSJsnY+kDpi5LRR+DVIOhKT3oV7zOWPNeJHBIL9YDJYAjlvNRCtFZ7?=
 =?us-ascii?Q?RVCr5hhYso5zKIC4UJJQsNZ0u/jqCMoQTwi/LlG2k1JVJDO1lASBwJiUmj/S?=
 =?us-ascii?Q?ZA9JqrQFcjheE873KdGLSzQw5yknqARoSTNT5kWd7KBhanXy5cQg3Ke6ZnFH?=
 =?us-ascii?Q?meKGs5uoyJJ7Hl/KOpcwmXeNgh40HGfZdKx8Bz8j99Vu5eFsCVrsiYdJaUo8?=
 =?us-ascii?Q?LGCZ3mONiUeqxBHo3kEInvhXKgCItpP5Ftlt4Y4/qKeq+sf37yqWjvSX2Plg?=
 =?us-ascii?Q?2g7Oak/l++wpUGRvW2RMukdFN4CjQsQmiz9RoBPKGxcxj5WmzE6MtsMHiW2W?=
 =?us-ascii?Q?OCfCZskW8DwLUr4v9IBpsBH5eoEef38Rw3VBvkmwA1l/sp1dpNFp2+4R+wYL?=
 =?us-ascii?Q?qAeKl3X/hFmSJHkxBthwTVV7hGYgaB73AwYoNoEXQuEIS6vzHztlVHPUqVvj?=
 =?us-ascii?Q?Irswrk65ATSEP4GeOrwSg8TLZofLX46ZZnb4ynNy3/ruMey9oewNGPeSPSvv?=
 =?us-ascii?Q?uMCqP/tG15uGroUIuNZ6D/gu44TGPnN7W2VAJTKTGw5h6NYJyBfuh4VFcZY3?=
 =?us-ascii?Q?UE4op6vvEji563RDfI/zBQwXGlDIztKLR2xPOLIRylDLV4/u1z5QKpbPt/Uu?=
 =?us-ascii?Q?Ta+qeN/wjr6HaJKpmbpXmQOjJ1cI89/so4ecBk7p+zvIqcUK6i8XhOACxCle?=
 =?us-ascii?Q?caPwgvjXqolJ+Hvj00mSUZGlVFmFZmtXG8QzGf/mQiUt6QOtAx12/41TcQq2?=
 =?us-ascii?Q?iMGhX4JapeiZMgc0TXhcKkTexoC8dBCLn8GBN4Oa8k2R4WSFA1yim5FT9fL+?=
 =?us-ascii?Q?lFMI+zLmVrBKEAgAoMxTWA/oP6Xvwpy6wcFtO2v4/3thHL70rV1KqLx7S39q?=
 =?us-ascii?Q?pjfiDmilpgd589cguyJ6FIZqSy396gSxvnVslmMu1GRSmFAkWjYFk8cBH5sY?=
 =?us-ascii?Q?577VFEZChnKx8T2DYMu+r+tnCzfz83y/sBF1O54v9prRNbY+YfFt1qZcSiFP?=
 =?us-ascii?Q?dPWly6X16SIV5TCMhHbkSRjyALoWsHeTWsN/EwQcpHP7pnlVKbrBdoSuV5J+?=
 =?us-ascii?Q?R96jAThsWOhCDFBkZKZddvafDACbUshw+p2A/unkSb7qUJeqK6jMaUNtKtIx?=
 =?us-ascii?Q?TXnN0s8e48W6MxzIohZ+ezZGuKRmLRlAz+2IYt0Qf35v44mHK1nDHFLsjEZN?=
 =?us-ascii?Q?QSkmQKlnAXHqg2MMmCgVseFrOKvSMs9eR7DFfBABAicIMQC+MChof7OnmvzJ?=
 =?us-ascii?Q?8l8cpkVUZAXhKo243FeoYsa2XANJodUrr0/8NTEYGpIG7WuizLN+IqMf49+9?=
 =?us-ascii?Q?4z8AcPaD6TPnSepq/bAs6gsaSOiF+4U0iGaTOxzPi5EMBNkbeAv0mCc176x5?=
 =?us-ascii?Q?y2/yA89uevg/7vnADcETO67kOEt2/0LAFTkkVAM6WTmJ4h1cYXwCqi5QTRxs?=
 =?us-ascii?Q?E5jx9zmG79u1BbtlV9WA/x6sm+p0YvGrZjE/fIRzpA/z/n3pEJuyRMs3PcYf?=
 =?us-ascii?Q?1M99U7uP7gSBJVFhnwzpYu5eX7BdLZG6BB4Br9jMYVG5pOQF/Fb2PChhlxAD?=
 =?us-ascii?Q?p/YMnCE0oH+TDLeQoT8Y84TPDeE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301f27d5-b8d0-4da8-6c61-08d9facfa225
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 15:33:13.4390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /SyL04C6DQakKA86OiUghGFRB2riEkpzJypF8k+FXpJVZJ2VAatn3obSymzRCGlcRXaqTZx01pJtetiKbtqNyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1394
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

[AMD Official Use Only]

>=20
> On Fri, Feb 25, 2022 at 11:42:24AM -0600, Bjorn Helgaas wrote:
> > That would just leave the "PCI_VSEC_ID_INTEL_TBT implies external-
> facing"
> > assumption above.  Not having a Thunderbolt spec, I have no idea how
> > you deal with that.
>=20
> You can download the spec here:
>=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww
> w.usb.org%2Fsites%2Fdefault%2Ffiles%2FUSB4%2520Specification%2520202
> 11116.zip&amp;data=3D04%7C01%7Cmario.limonciello%40amd.com%7Ca26e64
> 7a4acf4e7681d308d9faa358fd%7C3dd8961fe4884e608e11a82d994e183d%7C0
> %7C0%7C637816402472428689%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC
> 4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&
> amp;sdata=3DHSDqx%2BHzSnczTZxaBij8sgqvJSS8ajtjCzZd2CPSbR4%3D&amp;re
> served=3D0
>=20
> Inside the archive there is also the DVSEC spec with name "USB4 DVSEC
> Version 1.0.pdf".

The spec has Host_Router_indication (bits 18-19) as meaning external facing=
.
I'll respin the patch 3 for using that.
