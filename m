Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD37377B5C0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 11:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C92B10E17F;
	Mon, 14 Aug 2023 09:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E22F10E041;
 Mon, 14 Aug 2023 09:50:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvJUvhnSYK26yb5afSHqybxzBkTH1Pz588BldfsuhasfAbq7Vh1NZEop+ILdf5l2JkIPTzm0MWtkfI4C44olj/IkgH1xafp3GU0TTkKjAsuNOljkdyI3SNCxnEVoMxwH6ReaD+pjq39mLygl/BXk0u6S+e1Cdm42C7bSt0cg8fhSagiHV179Ed0GS4Ww4rPW2xO13Ghv7udn4Nq2hIw/m0lfm3ULkSlpsLD8CWnMDFf/Ml3X/afB5E3nAUgMCbyGFU2xkGzzV7zrgMSYRyDHVr9zHC6E7K9ETahC2r7dXEuaGH7jhSFIjgayN15+MaaMuel6V0d7o43ZygSj41j0jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WU9Iq9oOj9Z6HxJXElnfoBtw7dFhXz/6qc+NlY+5Gl4=;
 b=jTtoqXzxxs7GspRtiFJDibbm6O/skKIyEC3Wd6yRsPtl5bXYbKU44SXXQGqK/Hc3UR4h9aiFotaesj4yIofZc940BPrLQhABLCpnvd3UZfrW8nXSbi4Ce2bKmNKLTruszaBZC2plBAmvh2CkeZspKKQGGDZo6n3fJt1afLNWwpwPyIXCaroKx87ygAuc8LdyjHA6bV5ReMB0rNVdxZbjC7/x0rAmNiMALJ9ZwK7pKT5BkljK8RAj82xYg0pyvgeHrLGvUegzlC8A3sP/oLTKy+mAB66NrWHhVfGsqo4qXRtJkV9ulMTAddc3AhfD2TxX5Li1vH6l5o6EriemZjnscg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU9Iq9oOj9Z6HxJXElnfoBtw7dFhXz/6qc+NlY+5Gl4=;
 b=kbCwIXXdXSLbJwAlE0LfD4FM4AmhNAUTlz2ub48gCW59Q7g3AczuA2vZ1e5z4ICc9HTRLDvKqwL4YvZyTXeOMkVYIF42XbE//ldsf4K9uyoBeGNWXuI3naGU3yjEdIpqYwhk/9ZB7GYH+I/qpsTd5v/55TUi3rlPDQ5vmFRoWNg=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 MN0PR12MB5980.namprd12.prod.outlook.com (2603:10b6:208:37f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 09:50:54 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f%5]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 09:50:49 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Andrew Lunn <andrew@lunn.ch>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>
Subject: RE: [PATCH V7 4/9] wifi: mac80211: Add support for ACPI WBRF
Thread-Topic: [PATCH V7 4/9] wifi: mac80211: Add support for ACPI WBRF
Thread-Index: AQHZuh/Adomejh8HzEmC1hUCKrjgYa/IrJMAgABIA4CAAV6KwIAAjHmAgAAE9YCAAA8ggIAewIdg
Date: Mon, 14 Aug 2023 09:50:49 +0000
Message-ID: <DM6PR12MB26196A508D4B3523E38C0761E417A@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230719090020.2716892-1-evan.quan@amd.com>
 <20230719090020.2716892-5-evan.quan@amd.com>
 <9b1f45f9-02a3-4c03-b9d5-cc3b9ab3a058@lunn.ch>
 <7d059aed-fac0-cdcd-63d5-58185bb345db@amd.com>
 <DM6PR12MB26196A993B3BA93392AA0FEDE403A@DM6PR12MB2619.namprd12.prod.outlook.com>
 <d4cfbbae-9cd0-4767-8c80-ec09d1dbaf9c@lunn.ch>
 <6aa9061b-1702-b8f2-9cb8-982895b9def4@amd.com>
 <5e92b45a-d99b-4a8a-9987-46c75a5fcb3c@lunn.ch>
In-Reply-To: <5e92b45a-d99b-4a8a-9987-46c75a5fcb3c@lunn.ch>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-14T09:50:45Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=6378fc3e-4ddc-4f11-b8aa-eb3220c72b27;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|MN0PR12MB5980:EE_
x-ms-office365-filtering-correlation-id: f3e1c581-b4f3-4a9c-7f7f-08db9cabf0a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: moDxM8INVVeAEuHgytZ1wsEt7RK6weYuT/Kpbz3gPk0JZCRg/d2fyJ73A80hQoID1/UlKAE4FzbyBxzl4paorpC/vn4Nh1TUS1NpyJvJI2UMxM6kvB25prg3tjgeZGlb7X9H5QzgMSb+D+GDnNubL0bgCrVVKCdFkbyrA6uSQcSx7IkBDJt94Jk5dnFXepeg7jpuMcFi25LDPL0r682fxiQUDje6l0IDf7SmUB2HYRbEOf+TzChtxQW6xL6iFpy/0Gl/2IDYwVRS3QH2qX69qYJRBTavtwABQSaDdbu7GsmQX0iuNfZDXhGFHOj43cmPsAkF8kQ2KDfIuW/bJFVpGs/Vm3b9Q6CE6MjJFmgmGLt6amJoNypksHLkyX0rBGzT0HFeE6PuiZlF0I3Qums1d2Tu0K3PGVVG+WpvaWYxLF8x8uG2TnRfUFtq6g3osXpfkqVflAE3Dxd19HPm8u/CwhMI2Dli/lclWjZfxjlRjtVRfvD28K0J8RDivDlbJZMAXl6ibi91a2tSDgVDsSWE6kUUr7EXZ/9f2OWd2+vFwhs2hGB9Kk74JjUp/7mADW9e/H7SERg3DoKhUo515fi47mLeJE/QpNlBYKjNOYBA6scvGm6+NsaNYudyAZcq9Y1K
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(396003)(366004)(136003)(186006)(1800799006)(451199021)(55016003)(478600001)(122000001)(71200400001)(8936002)(8676002)(4326008)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(110136005)(6636002)(316002)(41300700001)(38100700002)(38070700005)(76116006)(83380400001)(9686003)(7696005)(6506007)(53546011)(26005)(86362001)(2906002)(52536014)(5660300002)(7416002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G/OKJnpTqvvCor/d4IZZJeUr7Fa4MRoGCL3uqGqLslM2idByebFaDFTB6kRA?=
 =?us-ascii?Q?Bk+4aiuQHaEJcTXkSJ59ff75LnHrJQ0syoWsJQ7XV9OURBtqNnbrMiRpwO/6?=
 =?us-ascii?Q?f81wCvuWZsiIb5zJ+wyLstsRyP1OzDCNDn01yXQ3CucBhH2nvc8zgIyJOZzC?=
 =?us-ascii?Q?HsdAhPPwIx/EWiIBf2JKNdCgHZLDu63SYdkHpPDgTYcPSLNxVqoFE392X75w?=
 =?us-ascii?Q?++ztgurdedE4wpWJdiYf/Cdlb69Wsy29NIxXnwNkppCsoqH3YfkslvviPrXx?=
 =?us-ascii?Q?AJUGVvJEWe+/Dc6IJ7lXDx4gL1cXiIKaFAoZPVyyZql2zoPuQb8w/OuwvSoz?=
 =?us-ascii?Q?LCIKtHG1zE4wJQdCd+1B91oMrpnRtckIJFsDXynJMpeiv+WNhbBGOf2eNxrw?=
 =?us-ascii?Q?v5KkhSI4ZE/27RYLgbXxRNPFhj+o+/v76uDcTEKHO8i3b1ArMAb8wS2RmoM3?=
 =?us-ascii?Q?ytZ+4uE6kQJWU7/US1WEZ+Odgh828HIASJo+/qckqJUQ/9T/Lr8nP+HJR7VF?=
 =?us-ascii?Q?VD1qIRChlcyYW39LnOG07ayW6Qx1V9wCET/ZRosbGbVzaDBZLoD8pf/AVUCG?=
 =?us-ascii?Q?NNpdvdrcs6m5i6BpnKlRVle1fuJAKbiX/uq5EeKJOkTwLG5a9mTuvTYIrlKO?=
 =?us-ascii?Q?pde3hHrAfiQtRsULRe1aELYH/V5VkJ8O/+glc8pQpwckxOBJ8k1vaC3pC6H9?=
 =?us-ascii?Q?iA19oiZM/6JA8oZjMj8xwG2pEK8os5/gtokrLjcYl2brStUxg+RbBOMxj1+p?=
 =?us-ascii?Q?LQ2M2EvXhMryAaGiJpsNXoiASfFLDlhb4ldQg961587NbDTZ7ueQDuxNSjFt?=
 =?us-ascii?Q?vQvH+GLg/W2qkZHvyE7qBRj9WxLk/I9cqRbDddhj7qsaIlsudHeIXAYajpid?=
 =?us-ascii?Q?jlYLdLaY6Y5W7N8CBIjeSAYXxToxs7cS8rQ8l+RMQ9g8iCRcXDzo24JF9l4A?=
 =?us-ascii?Q?Yzr4Zqm+pyb8KeR43k25m/vBTH+AeLUpSynk2FSTZXuyIT8VhNFsZJiEotQ5?=
 =?us-ascii?Q?uZYfyblIoDKcfKUvX5UoD0AQT85GoUJVZIfwOXyYqTIGQFAiqgsFztI82Gbw?=
 =?us-ascii?Q?NjIZ8I0gmLN6ErfFTVyyTZ8O7llTbbMjw8XthU95rYuCaeTRXjKIRHn468B0?=
 =?us-ascii?Q?XjD10sA4BHZwr7IZ7E3HQl7pH0KRSjuCR/ckvPDRn9qk4TBZTVeijrYtwQ9t?=
 =?us-ascii?Q?g1fa2Xw4iF4i0CQ7jHh25KQ8vztbRfjN6UTdXM2GBwqLS4UMpUx+eYVMvbCt?=
 =?us-ascii?Q?4xOuYiGJDvYh3gmk7LMCJY/4Fug3pPvu1+3VV6BTG4od2vU5y9sFHLAsjyWn?=
 =?us-ascii?Q?5WMcVPTdDmkQNaabTkafGi3+fF35slw5Dcv2/yZkOhYIwfesygyV6slK46gr?=
 =?us-ascii?Q?JT+7rplSVOs0HK8oPIy2mrUElviLRQ4MkfWdofdemshKsCMGoLzY9RIhT66t?=
 =?us-ascii?Q?JW8cBivw1T0UYS7MsD/6aAVYy6lJ8le/VDUDIrPF+sWNdCg2byu8n0YLlnkj?=
 =?us-ascii?Q?D2GAWdUgEJwoBNpvTPMV0xaDRrga38I6csRV/x8zv/ylc0M/06EWS6CmPGFU?=
 =?us-ascii?Q?cNogtYSTP+3Fxeu2nD4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e1c581-b4f3-4a9c-7f7f-08db9cabf0a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 09:50:49.3048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+hKBcfTYv6vjK6jQ0vsoGribX1oYwrkMJatbli6sdQNTKkHeDGROxGlBoG984vb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5980
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
Cc: "jingyuwang_vip@163.com" <jingyuwang_vip@163.com>,
 "bellosilicio@gmail.com" <bellosilicio@gmail.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "trix@redhat.com" <trix@redhat.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "lenb@kernel.org" <lenb@kernel.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Hi Andrew,

I sent out a new V8 series last week.
A kernel parameter `wbrf` was introduced there to decide the policy.
Please help to check whether that makes sense to you.
Please share your insights there.

BR,
Evan
> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Wednesday, July 26, 2023 4:10 AM
> To: Limonciello, Mario <Mario.Limonciello@amd.com>
> Cc: Quan, Evan <Evan.Quan@amd.com>; rafael@kernel.org; lenb@kernel.org;
> Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> airlied@gmail.com; daniel@ffwll.ch; johannes@sipsolutions.net;
> davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> pabeni@redhat.com; mdaenzer@redhat.com;
> maarten.lankhorst@linux.intel.com; tzimmermann@suse.de;
> hdegoede@redhat.com; jingyuwang_vip@163.com; Lazar, Lijo
> <Lijo.Lazar@amd.com>; jim.cromie@gmail.com; bellosilicio@gmail.com;
> andrealmeid@igalia.com; trix@redhat.com; jsg@jsg.id.au; arnd@arndb.de;
> linux-kernel@vger.kernel.org; linux-acpi@vger.kernel.org; amd-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> wireless@vger.kernel.org; netdev@vger.kernel.org
> Subject: Re: [PATCH V7 4/9] wifi: mac80211: Add support for ACPI WBRF
>=20
> > This comes back to the point that was mentioned by Johannes - you need
> > to have deep design understanding of the hardware to know whether or
> > not you will have producers that a consumer need to react to.
>=20
> Yes, this is the policy is keep referring to. I would expect that there i=
s something
> somewhere in ACPI which says for this machine, the policy is Yes/No.
>=20
> It could well be that AMD based machine has a different ACPI extension to
> indicate this policy to what Intel machine has. As far as i understand it=
, you
> have not submitted this yet for formal approval, this is all vendor speci=
fic, so
> Intel could do it completely differently. Hence i would expect a generic =
API to
> tell the core what the policy is, and your glue code can call into ACPI t=
o find out
> that information, and then tell the core.
>=20
> > If all producers indicate their frequency and all consumers react to
> > it you may have activated mitigations that are unnecessary. The
> > hardware designer may have added extra shielding or done the layout
> > such that they're not needed.
>=20
> And the policy will indicate No, nothing needs to be done. The core can t=
hen
> tell produces and consumes not to bother telling the core anything.
>=20
> > So I don't think we're ever going to be in a situation that the
> > generic implementation should be turned on by default.  It's a "develop=
er
> knob".
>=20
> Wrong. You should have a generic core, which your AMD CPU DDR device
> plugs into. The Intel CPU DDR device can plug into, the nvidea GPU can pl=
ug
> into, your Radeon GPU can plug into, the intel ARC can plug into, the gen=
eric
> WiFi core plugs into, etc.
>=20
> > If needed these can then be enabled using the AMD ACPI interface, a DT
> > one if one is developed or maybe even an allow-list of SMBIOS strings.
>=20
> Notice i've not mentioned DT for a while. I just want a generic core, whi=
ch
> AMD, Intel, nvidea, Ampare, Graviton, Qualcomm, Marvell, ..., etc can use=
. We
> should be solving this problem once, for everybody, not adding a solution=
 for
> just one vendor.
>=20
>       Andrew
