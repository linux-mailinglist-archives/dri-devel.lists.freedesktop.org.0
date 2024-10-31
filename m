Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097519B74D5
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 07:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C91C10E28F;
	Thu, 31 Oct 2024 06:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHM3AS+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E3610E002;
 Thu, 31 Oct 2024 06:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730357956; x=1761893956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PSD9vl9d93GdFut0m0W/YJntilBFk/wbxgiML19JNNY=;
 b=GHM3AS+weLLF2+ddNNCey7mkJRg5phektbSA4p4d2PToCaC1xhEISp0s
 sfZ0w4N7MCl4+hpAnlBtXfA4ahPNW4k0H2AsW9EP8Uzp9rEinYXtMeko9
 vEH5Er2fmvfgQXFjJJ6waOc/awz0hbKjXtyaHdZ7x7harFL0LreOFzz+S
 jZblqhXDfZpCIu7tovBhyKCHKy8DzlMiPj818jb9QunFRi8RA0bIBwnVD
 b9PposVXkTPac4qyWASfQbsH1i55j6H+Q4yyHb025h/QOszoXbtg32QjN
 8rwHpgaHlRtcip0a4nW237BecwQKH9JnjRhUHXWPRLx+dqHV32Rt4IDzo Q==;
X-CSE-ConnectionGUID: D+aeT+epRGWISHpNYYhKtQ==
X-CSE-MsgGUID: kTW+UnZVSkGygB5xh4VBAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40627500"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40627500"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 23:59:15 -0700
X-CSE-ConnectionGUID: EetWkfN5RHaz4WllncAMig==
X-CSE-MsgGUID: ycI26HgGQEiBtk4kGGsfXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="87329254"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 23:59:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 23:59:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 23:59:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 23:59:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCCiKeAkduoYe6crZURRTWoeKrW9foufseLCorCyUrg/yHnIDq/mMz2JURgjafMNPh28JlHiCCiXNAWQHCDrdpPvBJj6VsTMZ9322zti7KZ7+uf8Apx/uuYDRsP5nM/nqfwV3tAyrWI9xGxvJgn6lDauhcaipGsilE5uUouukp+p1torQut97Bpd4r1LVB2CrFZkCMKYpX87IqkaMZNtsE8cL9pAUgKfN9twsuZjVKHOiBthiv2FKju2ksXrvmkFiHdNUOegXEo5Q84FadVoNCmtxvfNaz3PKFwmJb50QxFJCOBE7vgcnTptUC8+qu+DUVYbIhgocFGVfmRdsz+EdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gBU9f90CROgh6UFXHoqk+HHeJ65E+LpPXqoqpWUtT8=;
 b=dtIorC2MRsn6MGslFa67Z6UX7q79krQHDgwujVLgu1S0yE/654Okfl/zt1kaNBnDK8e/SB4wo2OAAjZntoeXjW9YXst3E4PpwaSHEI8Tl0gnA3GUkejT4Ced3u3+NEAoKcwnuyt47lwGNUk1aAP5PTM6e1ZPYI2q891BaomahWBH4CFJpzRBfE4C4cs4rc6e8EhI8mKYtIrN/xZo5S9T/9wXDnoqiU82MyMXUJfmVhasXEP2fDHt2k9zjagE7dtUkAV5is4MaR0BYTNW8G6zyBT4JNV1xcsHtoLXByFlNYCWA2Kvl8gYumzbAvYbqI6PnEFJH1U1bFM8cZmQUpR+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 06:59:11 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.8093.025; Thu, 31 Oct 2024
 06:59:10 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>
Subject: RE: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
 of same device
Thread-Topic: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
 of same device
Thread-Index: AQHbI3yK84LIcNeUG0KOOkjZ4cDCubKS47QAgAKA/4CAANFWAIAAv9iggAi7Q4CAACrZAIAADU0AgABVwVA=
Date: Thu, 31 Oct 2024 06:59:10 +0000
Message-ID: <IA0PR11MB7185FF6DB5CE5964B8ABCB7AF8552@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <7e146e2f-5d7c-4f28-b801-360795b4cae7@deltatee.com>
 <20241030220738.GA1221922@bhelgaas>
In-Reply-To: <20241030220738.GA1221922@bhelgaas>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH7PR11MB7718:EE_
x-ms-office365-filtering-correlation-id: eabef332-bd17-4992-d561-08dcf97985a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?t5svdsnfY8k77OzbnM25FNb70A6+Y7su1yRlf3xMY4jHmfEvwwO96E5eM24h?=
 =?us-ascii?Q?W3cLILvqw4Yq994w6BHhbLQn+r/bKGlbrqvgt77LzP8Fux/N0yf5bYmUBCdJ?=
 =?us-ascii?Q?wo7tvvt0hpsg+qv3T33sk1KrAcRv4MGZisCH6P8c8y2oeSrGyGjsfmTo9RwE?=
 =?us-ascii?Q?fVcqZePJJUyX0xP+bE2T7C89tToAGtuLfpV30K//zipbYk+79BMe3ROUhewO?=
 =?us-ascii?Q?/rgui/lqe+xaof8ZTQtLrkAIwgqVycXW92oX3k3nT0TrUfWLQvF0Dp26nKdO?=
 =?us-ascii?Q?tlrBY3sz2pQ9GfzSEPfQWF1Y9OPJIJ0GV4c/0zKEfCchzhBS9CyJaL51MUc/?=
 =?us-ascii?Q?DoKihsP7voH2+o9Oey5bHLyEAJfm3Z+eRFcqPv2NuGbHiGkxBshBnJ4A4mE2?=
 =?us-ascii?Q?rcXeOGxU+N1jUN9KZdTF94zX2dmX7DOhx3UurtQV9cLeRu+xTUSZf3vV/8nC?=
 =?us-ascii?Q?+3SpN47i6SJMJpGjaU5dyfzoapi8axxBp2SjWhD2okzb/KQEPhG5v2SCDKAE?=
 =?us-ascii?Q?jOLyR/f2yNNgJZP5RDmZ1RKp9popLXsTHaCtGQptZ2kIMjkQEvmCgz/6JdxL?=
 =?us-ascii?Q?wwnX7nYC0+8FvCdN3b6IyckaVr4wq0JcPsVz83fTtlLcZXceiN96IiLpuQvs?=
 =?us-ascii?Q?ngfK7x0EuCGaJM4m//o27ITgY7rSF6uXYAT0c3HPHE1ukGoq2XseUVMeGx1F?=
 =?us-ascii?Q?xjSpg+WqRDi9HdIxPKYmxiPAnxCwRKP6McX713ATbbLQFPRZyuxZuur7Pv3f?=
 =?us-ascii?Q?wYHKkYGfbSPjhEHcQDYkHfj66dBg+HVnfvWBXaJGadcWXvYPmQ6fa6InkhFS?=
 =?us-ascii?Q?TzH/vJDVPkWmtyq1LSef2XdgFl33nxzcBs7St6rhilx78D8Ookxli7uB7CRy?=
 =?us-ascii?Q?HQEaejTHVG0gZkmcKc37YB1EFptA39hfxH3cjSCzY9QQR5tuhOfTAIq4aH8M?=
 =?us-ascii?Q?tQ6eabF6M9Ls7osOxUAX4qfYOwXE0mlXJSyl8DTHs7PdwzuKHAuumlV8Wi9m?=
 =?us-ascii?Q?6a9OIPvncytaIYktDmqA+eHeYsNFGC09omoI9O+Q++9foberIPVrm2hb5Ome?=
 =?us-ascii?Q?0OfSWcIg1oMdi6YmgoE5c6k3Rdyn5CpJmmQn+8V/k8H6wiiKvrVNRlzpUcc6?=
 =?us-ascii?Q?CD50vNzN/oA/UqGngj336MI/s63mHWwGCk8c6HkA32ULURoH0wPWJionEsaE?=
 =?us-ascii?Q?ZiYHuJonVrB2v8hSWHNSZ+oDnT7xkOhgSVPmB2QOLDm7VZwUEKoF1f0dQ97j?=
 =?us-ascii?Q?brkn9RDzpi4Z95mg82stxuyXetoKDVSoz/b71+bnBBE/mB0tQ9dJYtFOq8Mt?=
 =?us-ascii?Q?AHqY4mX8tnyjw+cNRluKBMVIFD3jouEoPOqFzZHAJcbxAKng+drrzqZlagln?=
 =?us-ascii?Q?n3OLQVo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K5DS945HI1wpPdB/wQRKsYMEQqt4MEYorH7mGw4EFf1q1yAuxwWnfJzVdhdR?=
 =?us-ascii?Q?7nz0CfFsZWCWGm1a25bzOwAgCbVJzDLpwLSuez9rqCwn36A0bN0QUcgqOgYs?=
 =?us-ascii?Q?ZBow+jfh7bYJ0LwHLKh1qu1e0sW5mbTaNZQTc0HFIvQI5EfIulC0nd+U//TW?=
 =?us-ascii?Q?gZGlCaj1OgCYshq77FaAbxpAhHJsvFPJx0neIm1/LlgTpd6Kk3YVAPtnF3MN?=
 =?us-ascii?Q?BlQzres7XDHVYVs3gWyC7ScvDwJtJUU8lbI2qYNVrq6Yv5QOCiawJ/jz5IV2?=
 =?us-ascii?Q?MbdKeAm3Uy73nxwtbS7RHkSmOyNpKeIaAjd2IrywIP0f11SgfbkayP5/PZL8?=
 =?us-ascii?Q?j+nmrxmsOlA+UZZOydtwuychzcWDM8fuZDbsYsOutti0jc4m3/bkpdx5SMHl?=
 =?us-ascii?Q?GBRaYF12w+R5a5sxds0Koo6SmusOJHgaYVSsjd8nyg7Y4srGWEfhHt7KjUA/?=
 =?us-ascii?Q?/tW4UyeneN6CPkoRekAKPxWm0CcvRLoUwrzm6LOxoFldHzVaYtdwSsO++V5j?=
 =?us-ascii?Q?VDs6Xi/mMjluFTu5ddH47A2N0TgxB5UpZYR2/c7Ye+pql7zhVvz6wBMP+FCS?=
 =?us-ascii?Q?sTBArLPE/HDLFX9cSfMYwCz7vCRUZtS8Ukanq/53+iFZ2QuW5EfRy8VI91Gy?=
 =?us-ascii?Q?dbLsE504sqNehMzxN1oIN1hSh6CxNPF99x0etFmbnxu6mOLP4GH4R2qTAYoc?=
 =?us-ascii?Q?ZACqhCrTVXFmGCUeZDG9lN57vQKX35BiWC0U6j8306sOgwxsnlFZX/WVyKoi?=
 =?us-ascii?Q?io69LLQIhz0/WkIVYc9yBpq9FmFnh51uyzPz+WUsOdl/IOeysuAqA8S1dMt8?=
 =?us-ascii?Q?FnwV1Zpsg8XyfEQpCRiAKG2jAbtMP/BZHC+C/Xx4Zem+u+/jQfwsjuj9GdPz?=
 =?us-ascii?Q?jfB4vXJRh6Ny4uGqnl0P8sUMpTyB9dK/77OaAliniuxQlwRH2G6YpgMLTF7j?=
 =?us-ascii?Q?sILEL/ShxLOB3gnJdld39l6QB0URN6vE5nJ8SWgQnLGt7VkvUBzJhwZmQgk2?=
 =?us-ascii?Q?DVQthaZQRgMAE5/Id9W2a6pzLYZ3+n3s6dc+nItMjdj9ZruRUzhaOm7vVVc6?=
 =?us-ascii?Q?1Dzb7rvunxp929J9jguAdjRI5OirdlnY/IKdmilu6eFSO63XyD8/4SZesYuK?=
 =?us-ascii?Q?nLy2cc96AIZ22BSPGaeaKZSA9m3ajYncDMClH5APpU8jHA6c4ETLmPZg6POd?=
 =?us-ascii?Q?IwBd5aBexcgdRi4LNjGqiU4oY4/uDkHX15AXfEZWNSuRt7z6QPaq4AkusLn2?=
 =?us-ascii?Q?nIqkIbO5jxPzxpjPpZGgfgAQm7w7qqalEQqNQKwCfRXpCIacxRqdhdEXwUrp?=
 =?us-ascii?Q?VE6pe5Ngak47T6ZpiGjiCEwWBJ2xHgaeszMHq/FUtaCGlGkVHysPQzzBQcSq?=
 =?us-ascii?Q?9nyv12Z6gf4q7jBPlnZVkaGAFATY/JBh/5ViLdJxIDtXP9/nNEaSaDOSVPfy?=
 =?us-ascii?Q?1+tgSsSZNt+7ByJ8oRle5YM1SeK1VPd4ziqmW8ycViZE0CkaTRs4BEqBmRTz?=
 =?us-ascii?Q?pkb7W+zHKnCAS+S0xj5ba+TSUjYe4P6TPPcYN2Ky9uQfKFTtf0+j5Fgg25ME?=
 =?us-ascii?Q?mfTObmQw3Gcz4oluErJvMQjxENiVskNu7yuASCMo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eabef332-bd17-4992-d561-08dcf97985a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 06:59:10.8023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /oZp5sRozXfcYtQ+oEAtkvXG9toc2yvBPHv69ARCEP3rI1IJVHlJp9q7XQtdBR9B+Lj7YfImaZCnrqFAFOYVBi2q79AnN6JcCnpsfyauE88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
X-OriginatorOrg: intel.com
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

Hi Bjorn,

> Subject: Re: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for
> functions of same device
>=20
> On Wed, Oct 30, 2024 at 03:20:02PM -0600, Logan Gunthorpe wrote:
> > On 2024-10-30 12:46, Bjorn Helgaas wrote:
> > > On Fri, Oct 25, 2024 at 06:57:37AM +0000, Kasireddy, Vivek wrote:
> > > In the PCIe world, I don't think a TLP can "loop back" to another
> > > function on the same device.
> >
> > I'm not sure if the spec says anything that specifically denies this.
>=20
> I'm not a hardware guy and I don't know if there's a direct statement
> about it, but if a Downstream Port supports ACS, it must support ACS
> P2P Request Redirect (PCIe r6.0, sec 6.12.1.1), which specifically
> applies to peer-to-peer TLPs.
>=20
> If peer-to-peer TLPs appear on the link, the Downstream Port will see
> them and act on them, e.g., either route them upstream (if P2P Request
> Redirect is enabled) or back downstream.  I don't think the VF could
> act on them directly via a loopback path because that would lead to
> duplicate writes and duplicate Completions for reads.
>=20
> > But it seems to me that it would be possible for a multifunction device
> > to handle a transfer to a neighbouring function internally and not
> > actually involve the PCIe fabric. This seems like something we'd want t=
o
> > support if and when such a device were to be created.
>=20
> If peer-to-peer transactions are handled internally, an SR-IOV device
> other than an RCiEP is required to support ACS with P2P Egress Control
> (sec 7.7.11) and P2P Request Redirect (sec 7.7.11.2).
As Logan suggests, my use-case does not involve using the PCIe fabric to
accomplish the DMA access between PF and VF. Instead, the PF's (GPU) driver
handles VF's BAR addresses (associated with the buffer) by translating them
into a different (internal and local) address space before facilitating acc=
ess.

To articulate further, in my use-case, there is a driver A (that is bound t=
o VF)
that needs to share a buffer with driver B (associated with the PF). Howeve=
r,
driver A would like to know if B can access its buffer or not, so it calls
pci_p2pdma_distance(A, B, ...) to check, as both PF and VF are PCI devices.
But given that pci_p2pdma_distance_many() uses ACS as the main criterion
(in addition to the bridge whitelist and a specific CPU type), it determine=
s
that the access is invalid (as ACS redirect is set).

IIUC, it appears that pci_p2pdma_distance_many() is not the right tool to
use to check for access validity in my use-case, as it assumes the provider
and client would always use PCIe fabric for DMA. I think it either needs
to be augmented to handle various situations or a new helper is needed.
What is your recommended solution for this issue?

Thanks,
Vivek

>=20
> Bjorn
