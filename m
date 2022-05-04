Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9452551A7F4
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 19:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9893110E1E5;
	Wed,  4 May 2022 17:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2103.outbound.protection.outlook.com [40.107.220.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15B110E1E5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 17:05:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ST6fueZhtkCmmn3DBIHL5c2SCfli9CTA6xcBPB13//Zj39POTj0Iskv6wgpacuL+5/ElyrcvRGij/UV4RuroKnEZqftr6OMf5LNm2oaS7La6mdQQn7R4lb+4E9VaoekexSPU7hP2Ivv6Qb3shllR3ifwrRd42EC0VqTkazitbCqmjNfeFYfJT5y5CHVS0mJaQ0bhaSk1Dr7jz8N010STiJlxlAM5OujRrjg3CdgPs8VAN9RHU+1W3nNJJVWGC2hEIlDD8Vva+DIEBpHumXYhhJsWlkH/ghXwWRHsI7BBbTe9ADEBaqYojLpIxK5KieA2zBSAR58sundiKi6F+IG+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLNmxYwXCQsvlHropPxYeImfD9DWBZpfKrrJ8YPB9ZI=;
 b=Td8hHIjDBc6Qm1r/Ed9oxzjNr8uVPltivF/bqu2wFIW+I92e+pSkg4SbZO5DtSfERaHpkdNfRAsJ5/Vkjwhra9kElvuid+yyEhqYN5ognHpH9pVw07JmkT5aSwGQL81J/hSCYahYG6a8rv2DdvjZ2Hb9n4iA+uUzNQexFjKPCyol5sDsjvSbUS5pfYJYE/5s7fTECYVP5sgXxa2pmUh1NHRbm6bOapyB7srOU9RMSo/5ffDqTEWE4FyyZ+RaFouJi1SfI4QMik9aG5li/AE8VglsecYBhHbbj2YgdVhh4XPC7sIkrSelLidOiE0GUmN8wDJEofyR3O7OKJTlm+16ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLNmxYwXCQsvlHropPxYeImfD9DWBZpfKrrJ8YPB9ZI=;
 b=gd5+b9+6DY2dRxZPf7uDLR+CoJhAyeT4CbGO9maZk+NrjTaVmyRQ+HU6M0gxK8fVk9WdVFWju5TD1S0vsM/iBJSeifkf5V18Y6e18VD/+B29TifSb+pjq7L/DIC2JH7n0huM0DN7k4O79q8muv1L1Wu4LoYe+h4RI2i+QqawxoQ=
Received: from BYAPR21MB1270.namprd21.prod.outlook.com (2603:10b6:a03:105::15)
 by DM4PR21MB3251.namprd21.prod.outlook.com (2603:10b6:8:6b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.8; Wed, 4 May 2022 17:05:06 +0000
Received: from BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::2823:3bd7:8a28:4203]) by BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::2823:3bd7:8a28:4203%9]) with mapi id 15.20.5250.004; Wed, 4 May 2022
 17:05:06 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Saurabh Sengar <ssengar@linux.microsoft.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>
Subject: RE: [PATCH] video: hyperv_fb: Allow resolutions with size > 64 MB for
 Gen1
Thread-Topic: [PATCH] video: hyperv_fb: Allow resolutions with size > 64 MB
 for Gen1
Thread-Index: AQHYX9YSthbGf8K4qEaTeH9fJ7H5Eq0O8UBQ
Date: Wed, 4 May 2022 17:05:05 +0000
Message-ID: <BYAPR21MB12702855D53B456E898ED5E0BFC39@BYAPR21MB1270.namprd21.prod.outlook.com>
References: <1651067273-6635-1-git-send-email-ssengar@linux.microsoft.com>
 <20220428143746.sya775ro5zi3kgm3@liuwe-devbox-debian-v2>
 <DM5PR21MB1749EE7458996FF22AAA9AF8CAC39@DM5PR21MB1749.namprd21.prod.outlook.com>
In-Reply-To: <DM5PR21MB1749EE7458996FF22AAA9AF8CAC39@DM5PR21MB1749.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=ea6efad5-303e-4efd-b054-9cb15ed3afe4;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-05-04T16:37:53Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2e70ddb-0167-4787-c85d-08da2df03cb2
x-ms-traffictypediagnostic: DM4PR21MB3251:EE_
x-microsoft-antispam-prvs: <DM4PR21MB32515ADED9D03597360A7818BFC39@DM4PR21MB3251.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DoSvGW+NkpNziCU7zuY++5AYq9Afmg2vIxLfZP4hdwFFJMkF7qywB0tsdlyQM2+ZqHHq7AxZ40G7NxIJgVn6/O6PSdJzoBK6lO/eO307eKrjKS16mxax0Gqk43rOnGcMGCSQqMofoSq+PDGVYCAZEE72u3rGjLI2cddeSzXKjc63QnfT4+EAO00QHBtYO1E2F622guRc5IyG4/Gdq9rDAv31GyIe8UgvmZNDQCHabb1ehVnOpnl7rmKF/uoZMSHYvZU+0WgSGFuWNkQmBKaBj/iKGPI+f2y05ppbm90Z503g/FhfE4yClZu3sTiNaO7JvGI7HWoG7OyWJUYXIkikkxlDcRHvhVjzsF6fYEkcC+8DxCgUKFWwpNSXfsMzzDWDU/pyV7Mozwu9gIYrwQwEAs0ZH7fUsjJG9/NB2ayx4cKJuC838m2RwIQtgIx/lsdEB3JOowGoVvk5Ae/LK0nBsEUO4DtfbCP1K1eZI73udPSD1OqVrDomHKNgWX07igc8jdAutPuLLX3oQvEXeahD+Jev7BE0BU794orvSBIoNZt/wVKLER8QrLJINV7BF6X3fDz4KFmhbU0v9milwPvpZP6Z+VTOFvf3xOMkqmssN0X1t8m1xp1dy1m/nqs/deM/sCu5L9MqKDOSIn/rgYiMrFvSHYlCetnTjFzTMTh2XiRroVsq2L5H2wxlqSrCf6V6iXe+482D0jAdLcjWUbaVpqBUlMDlN3H7/axXfqt35MnBgohVM0ElU9aA7dvas0UE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR21MB1270.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(186003)(8990500004)(4326008)(6506007)(9686003)(26005)(122000001)(82960400001)(7696005)(82950400001)(33656002)(86362001)(38100700002)(38070700005)(10290500003)(83380400001)(52536014)(6636002)(316002)(55016003)(8676002)(71200400001)(110136005)(508600001)(76116006)(66446008)(5660300002)(8936002)(66946007)(66556008)(2906002)(66476007)(64756008)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Friqw9BRoxnLb7sL+CJqVexSUEy04Cb9R2PGIVB1Mid1tQrh5N4gGwpez9wh?=
 =?us-ascii?Q?0sOKEvd6iyajNarAJXR3liOFuUNt0SQTcKlARmxFghWzJMIZddt3/FM7aKmd?=
 =?us-ascii?Q?7bNIDhw3sr6HAgUpF2iDMItYDQ4pc4rcUMY+Fk7LI3CMigFmn+71QPjXzrlC?=
 =?us-ascii?Q?1bxaxepc15IMG1fKIbP3raVUpPFBmYgPDM2cv78VHZ5cNi59koSduOTNLSiM?=
 =?us-ascii?Q?msp7DgAgcq0At36+HrpVLOYONY6myGAl51akKS1rjkftPAOso4xqnEWCT8RL?=
 =?us-ascii?Q?Jf1ZbZ3EWxxofAfs3Suk0OtsJe86nrX0fyrS4fWZ+x5gtlsifPe1O6uByhLX?=
 =?us-ascii?Q?n+u9KV0+PZUP9gy+WN32/rjQm0hAnA2lKOsR06Zyhztwn4OqE5lexOzXAbqk?=
 =?us-ascii?Q?6QDd1OcTsAWhl1yMcx/Z8QJNKo+AM0fd1MaoBk4TxoQuLUfhMpr298xHHiO8?=
 =?us-ascii?Q?hjS4iQeR9Y5hK57GpaIS9/bH9Ahzi0L62MRZnVjzgMKUHM3IbzWt1yupDrio?=
 =?us-ascii?Q?jTeKzFawSu+Fpy6CwOwJRFTuN/D+/D0W16sJkRxxVAaKIkVAK+xFskZCDytG?=
 =?us-ascii?Q?6EZ1D5kijDXQdo4pRmq7UtUI3T2evpgxwZlgwWwjPjJUjBoJ8PPZVIONcRah?=
 =?us-ascii?Q?4iNXeuobq2VRd1wkfuxYo8283hPAoHfZ5G6EwZ11erglaAibpnHV8xWSBJ0c?=
 =?us-ascii?Q?PCzq3110kWri8oE4OHb9kS1Cvi2AZJg9nVMJ7bNl4wpEtkk6Y3uMSjftpXjl?=
 =?us-ascii?Q?VpdEU11y9tEM9NU0wOhZuP0wT3ZTwvaPQ0BKA3qngPEwj6sxpNE+T+bNCYrB?=
 =?us-ascii?Q?6j1Dy0cFaYXRosZlRQcwzHlUMB4ireXFNJC9plp5f7JPDwjChJask70yr/t7?=
 =?us-ascii?Q?mOpgRP0eXG0MRXD8G+FrssEplEdT4zFxK8Sw+2huF+pRzt0R0KLTJjnc7pMS?=
 =?us-ascii?Q?DIj+uk7Au5XWqKiIK56sp4JKnVQ4uxHnEDZaoopMO+ZTdO/5xlltBIb5e5Bj?=
 =?us-ascii?Q?2zqki0h8gaBq1ff+/l0tXn4xntaRYoLxKCUiHSJQft28sFB+fKtKKzvwtwEb?=
 =?us-ascii?Q?m6nq0xCsa56L0P2shbHiQjgp5gnWygRs+7ldmBXDpqozUbZdvFsMxgcAtazC?=
 =?us-ascii?Q?MeBaF2er30GOouKw1z/OVv27DBiGkuWRb19e44hQYXFcOWUsCcDnkl2LYPlM?=
 =?us-ascii?Q?1P94SMkxml4N7a3slXIZBBl0CoyYC0R9pTZCNgHNXchYNKJhsomuRmNfb4cn?=
 =?us-ascii?Q?WTRXaJ3mpj52PfyBSs3X3RA9zC32ruCgyusKrN2yJiC31kMaM/qW/DvQDMVt?=
 =?us-ascii?Q?Ptp6PhzIpOYLeEVPhHimIOqaMkwxqcCKcmgOAiAiS+Z7yz4ObUNm9/7uPfp2?=
 =?us-ascii?Q?0ktD8XNheBVENWg6M6OxiVrAqXw6l4CYmHRuxpkepVBBDfWY6YQaxLnIs/Ts?=
 =?us-ascii?Q?fF9NzL6JM55aTW2J2//RBBhZUAoXUg1Amj8qIbYvcSGlt0hScE6W59z9bzHv?=
 =?us-ascii?Q?vpmmMOeMdsZCqcZQC5Q9vPECBqIkQK+SgbAhFJ1WCvdAYMB9GPEc1wUDg7Ft?=
 =?us-ascii?Q?Ax+JbRUdXZWgYCCFiPzUf7JZj5m5NFmY92gkJsS/WrR0hut1n54aLHkibiyB?=
 =?us-ascii?Q?p2BO6veOyQO5pD68uc/oAZrsfqsEM4yrVQzzKJ3mPL55QWoi31URpxDykhHC?=
 =?us-ascii?Q?eDGzDF7Hr0Ifp93E2dDt8juUZQr9hcAxG16dVGGYELftsb9OzlCBcJFlT+IR?=
 =?us-ascii?Q?6RL++jNXcw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR21MB1270.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e70ddb-0167-4787-c85d-08da2df03cb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 17:05:05.9447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NCW+ReBKTfhpiVHCtEYxCBLKZE2qKzLdwEyutQqt22LbpfMvn6BhTgdxka7+jUFpf1mx2ZOPAJHDjQ0Et7LvDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR21MB3251
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, "deller@gmx.de" <deller@gmx.de>,
 Saurabh Singh Sengar <ssengar@microsoft.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Haiyang Zhang <haiyangz@microsoft.com>
> > > ...
> > > -	if (gen2vm) {
> > > -		pot_start =3D 0;
> > > -		pot_end =3D -1;
> > > -	} else {
> > > -		if (!(pci_resource_flags(pdev, 0) & IORESOURCE_MEM) ||
> > > -		    pci_resource_len(pdev, 0) < screen_fb_size) {
> > > -			pr_err("Resource not available or (0x%lx < 0x%lx)\n",
> > > -			       (unsigned long) pci_resource_len(pdev, 0),
> > > -			       (unsigned long) screen_fb_size);
> > > -			goto err1;
> >
> > This restriction has been in place since day 1. Haiyang, you wrote this
> > driver. Can you comment on whether this change here is sensible?
>=20
> When I initially implemented this driver 10 years ago, I believe there
> was smaller limit for the fb... But I think this patch is good for the
> newer MMIO alloc scheme. I hope to see reviews also from
>  @Dexuan Cui @Michael Kelley (LINUX) who are more familiar with
> the PCI/BAR/MMIO area.
>=20
> Thanks,
> - Haiyang

The patch looks good to me but I suggest we check with the Hyper-V
team to figure out how a Gen1 Windows VM supports a higher
resolution that needs a VRAM size of more than 64MB. Just in case we
miss something..

Thanks,
-- Dexuan
