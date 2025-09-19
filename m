Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8B4B87FBA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 08:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C32410E02C;
	Fri, 19 Sep 2025 06:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBPkaAu3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9754110E02C;
 Fri, 19 Sep 2025 06:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758262970; x=1789798970;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lgyGsg1Fh+BAiurQoj0SocpD/+lpFRrvEsJhAc3mZQM=;
 b=hBPkaAu3wXtG68nItRbE24tuxL7SzQbaAfumHFd2l9BUN0oK8pdpmC1s
 MQiSTjzgyJBhyo2hPUGRFJ1SgzfCK4qCmYLwZSv21+lTdUFH3H0UoxqRT
 yi2dz3QxMjz5OwFpRZdEzLYEMJM5H3ydWCclLPm+LOpFjjmgYiBnFKAFe
 zeaAm2r992oTohz7Q00VmvLzXbmo5tS/3E4HMpCCNuOkKLRgC9NuNXhZs
 ZPYUvhrwvnw19bdwjSa4v6Eg4plq0r66GkPxRuQblTTD1PHDc9wEnh1zu
 RA+Ku/UNoPXtZMEnuO8gqryepPw7KsrGeT/XnHqsUhuE4Rld48LQ0i6+V g==;
X-CSE-ConnectionGUID: EweQTTdAQVSxwXG6ElWbBQ==
X-CSE-MsgGUID: wiscOEoTQcCeU3nzjc4MMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="64245591"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="64245591"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 23:22:49 -0700
X-CSE-ConnectionGUID: IMKDMljsSviRaQt23S2AXg==
X-CSE-MsgGUID: eYu3kJBERVuOgeY770FR9w==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 23:22:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 23:22:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 23:22:47 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 23:22:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2xYmQlpVnt9vfCVhI5qBxxkPNZLIYzQGDDweF+emoIe2ZGF5EbSxfQ0b0qnAlHJ8jU4C8zuE1gZQ8+DHmfO7vIXQvmBO4/xftquQ0mo+bAQin8o+rbCtS4r7d5FCxd9Ln8M6h9T06Zkv1PU77GRJt3NImqXcE5fxCRcubD9a2vNZHo23kPc81Gwpv70MUc9HZki1v/AaXeZHFqQxjRm6f+vdz8amYYpGOrCue4ljlDAycY5TG7tyfwnKNHcZYmXPEeAB6KA8wi2luGuE67HOWa+fJVXw5W0gepVct02lHuGsHd8ISAAn9ThemguKK4N+v9T/XMR6q2rDlZ4fUZy7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgyGsg1Fh+BAiurQoj0SocpD/+lpFRrvEsJhAc3mZQM=;
 b=rpMeyCDd5FUMfICWLzJDDTVvIvewkXCqxwTrOmTrShSKqt180CwUKBrQ2Xy6ZBdzFa+H1WUrP6LHkPDwff+0uIXjxYy8jZE6RXsQQCf57NySaswxHxsgFIh7r7w0PpZwUHlWersPNnU/spqq3A55/Rydn6THKH7DaY5ABe6lLethTSsrSK0WMIfCJyx5aJUkxV4PEr1h/bA8Kuu8Yy2jVSPr787O1basPTftWloumK+MRWJkg6jn5yQYriVAh72GOWwpKemrPo5pf40HZn9MTQ8ik5S9CAN+o/cweHdAyxjnd5VEXtGlZ0SafXSGgVB0wtWBDEcZiILd2aJiyW1JJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DS0PR11MB7768.namprd11.prod.outlook.com (2603:10b6:8:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 06:22:45 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 06:22:45 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: RE: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Topic: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Index: AQHcJhH5Hi/XzGn7NEC5e+4cxcvJFLSWGoCAgAIWItCAAKwBgIAASuAw
Date: Fri, 19 Sep 2025 06:22:45 +0000
Message-ID: <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-2-vivek.kasireddy@intel.com>
 <20250916175709.GA1324871@nvidia.com>
 <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
In-Reply-To: <20250918120431.GL1391379@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DS0PR11MB7768:EE_
x-ms-office365-filtering-correlation-id: f3e40ed7-b298-46dd-a6e9-08ddf744f29a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?zGlGaZJ7FuZI7y3VikrtFjqrz6R9jXI6tc7etzIx/ObRiSMocGjWSW2iYENw?=
 =?us-ascii?Q?Dw9+l9IujsUEIY4IoplP6dZb1uvNJpJwqvVLPdh7280WhTT3jcBbV/9OOvAR?=
 =?us-ascii?Q?jB/EA5xa9yNcccnvVQBWbRWFiJ0dpG86lWcrc9be0mA/6bJoLyiOrWoH83dS?=
 =?us-ascii?Q?ADISzxLXKcJVi1OKmnoSbwdIKFK+d56D/fKaKEEQW8iGTeWUC2Mw+N4VQ7hX?=
 =?us-ascii?Q?7z0P1cspCW3xnzbZQAC6HIKsYfdm6NgZJt2NsTO+QwzA7FSq3ddpIYG2Dehq?=
 =?us-ascii?Q?hEueclZ7/KyLNfw9XR5vklf938U3xbpIHkZxFds/YEk9OI6u0UmHxbLj5jiI?=
 =?us-ascii?Q?T9hV0j7DjxK8P4gPBbtYwU+MqDus4xrptsMlZAQsSDVBXDs5PaVl0cG1mFzs?=
 =?us-ascii?Q?ToQspCp0dAbEwLvsGxQFqrgcBcXTrXQ7xHSkDKyetsybVuIy88bWFwJq+JC6?=
 =?us-ascii?Q?GxfdskMj3GAz5dvKzDa2Eo9VkLXO322BwPQ0nCTBsyaI4zj/ghjD4GFK53a3?=
 =?us-ascii?Q?EixXo50GMe1Xl1pirk6cxH5nt3MRy3m3RgpT4DD8AlxKAmT+wsqv9CpEw2uV?=
 =?us-ascii?Q?7HcZldfn0BKQAJxFNxH+1gWa4kqyDRr+Mljk64n7P4lkp/mMrbNzGz4/QzIs?=
 =?us-ascii?Q?SjBpE8mIT+Drx26Sniz7Hl1gLLoi/bjw4UEFC0A2T4LChKlg2llh3cWUmrf7?=
 =?us-ascii?Q?Ssr88yvLFgV9/QCaOLbaYzoUKnXkIZNEjuVwq/8UcvtFyIuu6j7KFA4grldW?=
 =?us-ascii?Q?7gFcEMR8jSBCG5uvkGyZpFr0f5Ny+vdWBj8GJCT18JiOSKGMa86Wyez7iZ8U?=
 =?us-ascii?Q?+lqmNlR9jHB87YCBTN0AIQMwuJoI3vMSzDFyNQK8gI8LAPkGpXL38dBcc8sD?=
 =?us-ascii?Q?mzLZpV/X+jWjDci3XSFEQ6rqGqzaiR/gJGEaPINjOu8XlJjMSAUi0cyWAEZH?=
 =?us-ascii?Q?sytwMQvw7lyX6pAITfxyaxzRgWwpFycmGlqXaG1/hStHfOYJTShCEvSVLQsr?=
 =?us-ascii?Q?CdxS/KAE8ACg2hojjP87K9WmVbkXLOMGUlrEVqOptIabQCxlWJ7e5vyl1Khl?=
 =?us-ascii?Q?Bz+QkrBoiKZVmZiEeBDI93FlsD0qJI1MYwKdnMKEdT6zAWIuYMWRThE9yHm+?=
 =?us-ascii?Q?Z8A7OCB2DVv5aqHzq4p7OaM5I9PMfFYhQ2WgJF2rzGepINoKlcWkxdB2bBX1?=
 =?us-ascii?Q?FiJZ/pXIwL/2iFMylbbzmcGl/JlD2Y87w2scY5etvjL2n9FstNn1q1EV0DDA?=
 =?us-ascii?Q?0Hf9f5AoYHs80AURzCJwKmFKux1iB2zNVssuObyxxcCdakMVKuywNsB3Yq/x?=
 =?us-ascii?Q?PqqviuDjH8Hqc+oRIUr+3vlh0I/aNkSE2SrndJRDugavAzHEhyeIPVuyTjaX?=
 =?us-ascii?Q?LSF3CdyybU34GRxh/bWwaUFhgw19RjcBOYx4N+sD9KNDaezhN3/DrhpP8tDC?=
 =?us-ascii?Q?iweIHspTdxWAEL3AyMf/SvEF879QeVSDKQyEMXG/rUuI9JwfkRHbfw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q44qdsnTXah39XfFiD25qyjlGKYi5NKt/DcihZHVWew5b1KKFtvvZWiBi7Fw?=
 =?us-ascii?Q?wPwPARiXZhI8hq/8iRsSKnI4mobAjNBEUBb6B6pgNtLKY+Q0nM7GFYFx5iy5?=
 =?us-ascii?Q?919lVBrj/LVJxH+kRknVDZg+5k87L95JmjqizOK73jDYT5uj9xcJocNxJ3PC?=
 =?us-ascii?Q?NlPKQ9h+MVPJs8Z+40Zt80s/MiiQxmMlBRMOYMYfhloCF2bK4gSWABQvzfrz?=
 =?us-ascii?Q?DM8Y/d6eqn4OilNKmGQ9sn/+DzM+SwJ7iNZKxw/IatcWk6MDep7R+QAe+AEq?=
 =?us-ascii?Q?ZG3uSRKrqg6yZDt6pYQgJ+TszzsjfEWs3I8zU6ukWlwgVIkrS94AT/Je8mZ8?=
 =?us-ascii?Q?zLDe+1gbAWen2IYouupq42uZrE4kivNFQW+xRJjaXdBWV/2jsuuRwprNSFVl?=
 =?us-ascii?Q?iw9D153jyN6NIQermde5w1AzPh6c4OjJgRyBjRTqPPeUKc3bOUnu6Y/ctw5r?=
 =?us-ascii?Q?FOs/An+JCtES6XawtWptliUgRjcQF8JjNyZiIxPvNQzHe7HZY5AVb4JJV3rK?=
 =?us-ascii?Q?GCqMvaqhWosWQXOtqp4+qByZwHiqaCsycPHmhRR2meatdS4E4JP65XBkOg1g?=
 =?us-ascii?Q?75jm4qAqQuzPxBdff93urs5msa3VxVtLxbcN8eNO8UvPiWj/LmSAxS7sHOgO?=
 =?us-ascii?Q?xWlbJg1OgTupVG5Pt7f5brj4kN6iuwlJVfFsxcLDpWIthXAzPqhgogtO2Ytm?=
 =?us-ascii?Q?VCIUW/jygSMKCJvFOUHfLWbli94dBxPnGApXA8er0C8oZ+jTASo3x8TBWnWk?=
 =?us-ascii?Q?iLOFQd9UVEUspt+uUUkpseOtqoukIlvd4Cj4TTSQhCNU2h3OtgfvxhWkYXSH?=
 =?us-ascii?Q?z8tNKaDngE4I0KYJjDFQIcVPY81fNMLXL7BJ+lmh8wcLhlQoD3svbpkYpVic?=
 =?us-ascii?Q?zFaZ4mpPxeu+0DJApb676QRL4Djetck1nnQBsyD+2uDD0vdmTtlixC11VsoC?=
 =?us-ascii?Q?kzmltp2WKrGiIsOWan+qa+1R21JLPYH2Ekw4yaTovyuvgbbA3MU9hUSw9P0r?=
 =?us-ascii?Q?sZfNr/e3lG4FoW6fgQMocvr1didUrEdC5tEB1v4OEJTDVLL24v+HEUGa+Rkx?=
 =?us-ascii?Q?i2UG8Z7mino9GloMgHqWaX4h9MEVGASlSviLUiOBOdlpq6ykeVgBWbIvHa7S?=
 =?us-ascii?Q?Q/TndmPRdjc4dLj3v521KK9K6Iwz46LjW8A53hJEag9PoFjo4AVzE4JO9LY0?=
 =?us-ascii?Q?Ywio+Ivc3GLegcOB4PmG2L0HwACrxYpYPwDTMVryotplVBLONg3iVsqewgIB?=
 =?us-ascii?Q?EJAGQCCW8C6gvvnuPXa2BGhUyB9bpMqxQx7LTxahNv8uT4nyOWADp6Myh6oM?=
 =?us-ascii?Q?CDM+9en3JZj8NpW50YGoeyozT+V+RevG/mBtey6svFyv4oNaplti9pvmjgRX?=
 =?us-ascii?Q?tEf1ctKS02CBRWqZudHSqjZvf5/C/YgaLx39SKgR+XtsxgL+wumCzz6+BjDM?=
 =?us-ascii?Q?isYpjJk+yRY9JfMnEFm7MnhVKkoqgnzCBm6w4ESGUJsCq18XVvpal7TSlCI8?=
 =?us-ascii?Q?ESiPa5BSPpjzSgjs3A+SvxtEkPyKifkcyshRpMvkbpSVuNTcyErhoMBTgQO9?=
 =?us-ascii?Q?q13qalZkQmyKLNei0xV+3y6rMgFl99c704mdVyxr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e40ed7-b298-46dd-a6e9-08ddf744f29a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 06:22:45.6426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nPUHDLGi+kcAJCfQwKREj4zdj7XtvkqnfQi1DKTEGhQVEiJSGR48Sc/IYcA8F7bkqFyPd68RcTXncUSi75pVkpirQBcOsoiyn8mSR/AayIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7768
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

Hi Jason,

> Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for devic=
e
> functions of Intel GPUs
>=20
> On Thu, Sep 18, 2025 at 06:16:38AM +0000, Kasireddy, Vivek wrote:
>=20
> > However, assuming that pci_p2pdma_map_type() did not fail, based on
> my
> > experiments, the GPU PF is still unable to access the buffer located in=
 VF's
> > VRAM portion directly because it is represented using PCI BAR addresses=
.
>=20
> In this case messing with ACS is completely wrong. If the intention is
> to convay a some kind of "private" address representing the physical
> VRAM then you need to use a DMABUF mechanism to do that, not deliver a
> P2P address that the other side cannot access.
I think using a PCI BAR Address works just fine in this case because the Xe
driver bound to PF on the Host can easily determine that it belongs to one
of the VFs and translate it into VRAM Address.

>=20
> Christian told me dmabuf has such a private address mechanism, so
> please figure out a way to use it..
Even if such as a mechanism exists, we still need a way to prevent
pci_p2pdma_map_type() from failing when invoked by the exporter (vfio-pci).
Does it make sense to move this quirk into the exporter?

Also, AFAICS, translating BAR Address to VRAM Address can only be
done by the Xe driver bound to PF because it has access to provisioning
data. In other words, vfio-pci would not be able to share any other
address other than the BAR Address because it wouldn't know how to
translate it to VRAM Address.

>=20
> > > Do not open code quirks like this in random places, if this device
> > > supports some weird ACS behavior and does not include it in the ACS
> > > Caps the right place is to supply an ACS quirk in quirks.c so all the
> > > code knows about the device behavior, including the iommu grouping.
> > Ok, I'll move it to quirks.c.
>=20
> No, don't, it is completely wrong to mess with ACS flags for the
> problem you are trying to solve.
But I am not messing with any ACS flags here. I am just adding a quirk to
sidestep the ACS enforcement check given that the PF to VF access does
not involve the PCIe fabric in this case.

>=20
> > On my test system, it looks like the VFs and the PF are put into differ=
ent
> > iommu groups. I am checking with our hardware folks to understand how
> this
> > is expected to work but does it mean that P2P between PF and VF is not
> > supported in my case?
>=20
> A special internal path through VRAM is outside the scope of iommu
> grouping.
The BAR to VRAM Address translation logic is being added to the Xe driver
as part of this patch series, so, nothing else needs to be done except a wa=
y
to enable the exporter(vfio-pci) to share the dmabuf with the PF without
having to rely on the outcome of pci_p2pdma_map_type() in this use-case.

Thanks,
Vivek

>=20
> Jason
