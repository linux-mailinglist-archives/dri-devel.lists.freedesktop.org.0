Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2808569DA0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 10:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4151E14A44C;
	Thu,  7 Jul 2022 08:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A33A14A443;
 Thu,  7 Jul 2022 08:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657183353; x=1688719353;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0/fqLmI7qJTokHP14KeCe0rfUeYYD68w6VO7Am9TbdM=;
 b=kEfdgN3mUme1UuZCqdLCzp3yqFtGBNRvPr26AvhcD7Mw0zX+K6g9KKxs
 hAa1oLZzbXi5IGC0+MWf1lHTsni43BR/vSh0gIOLMddvjSNeUJIhsvf5c
 zD7F3Jy/S14L+emQz6SMAYelPBaNOUI+JwQnF4+08J0/Hx3snrxc0NC7m
 +oSNN2NBN/O8u4lkcYEdw11NtB4qfvQJnbS9/IuIA2JiXGMXP+eyTt4Gp
 ms2LCcfghZc/h5h+BVoqJHJg5oW772o8H6Gc6K+LRP1Or9C0jlyo+B3sC
 HRWGSS91MsLRYxaJ8KzBnviidkM7T8N7DBw9ereGy5yi3nO13SfbJcfCV g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="263754661"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="263754661"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 01:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="597954229"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga007.fm.intel.com with ESMTP; 07 Jul 2022 01:42:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Jul 2022 01:42:30 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Jul 2022 01:42:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 7 Jul 2022 01:42:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 7 Jul 2022 01:42:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgjMFCjPAdnkzHplep5OJjIwcJVtsYuRh16mdBRwbczm9JadBwkmnWt1MSkpNkfNV7OpUdX38k4h9sFUpw859zlIycVcEimhm0MyRv9c70poM474E6AQLD7ZUOZccWZOst7ykNkf5TN5v0dRLlcXvFEMjDpthQWsVq1z7CWZg3dENbzT5SAMZcdVfOKXH/twXqOrraryOuuFEgc0n35sHkoLbfPnj9AlOqyDzzBwYBaGxLYPer2a16TL9lr8OlD+6br5zdFChVTeU6lzx3XPCmAa29kg++qqeu/nz5gUJ4Y/9EQ6BTZ3owGzDwqEO+Pp1Ga3E/qt+rCqw/PomlvJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FjMsp5Pcakqnbew0Z0H3HdHj3S2H7AgFuo/fxGr9gc=;
 b=iCjfmXPlObCsMcV8Nq11BkTNQX1a+dJrO0RkPHfbwx74aKrU4chpwjoYeDlbMEvmCWzf2KEb0IkFFuutBkONGv1HEQ2AXZvyLHG5aN9ZdjE3lmEKAOp0+cCczxpMKN1VLfdCXtvxn37ECvaKOWdiyw+tNlC08LtREaFcV4ARwoAQ1uSy01bA2ruM2tflBRQ21vC4t8E8/v1ZcL4C3YDJJ4WZo3b7Twqqy9lGlBuC1Bpj2ltIatnEZAZyrpWaX9iiExHopAWDgWaVw9Hxxl9bMZiL6P0laLM9hxHejUUo7GydXYFPnt7rAfIPe9CuJCULkCRbN3H5mGSJqxbPB2sa4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN6PR11MB2654.namprd11.prod.outlook.com (2603:10b6:805:54::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Thu, 7 Jul
 2022 08:42:28 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 08:42:28 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "kwankhede@nvidia.com"
 <kwankhede@nvidia.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "gor@linux.ibm.com"
 <gor@linux.ibm.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "svens@linux.ibm.com" <svens@linux.ibm.com>, "zhenyuw@linux.intel.com"
 <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "farman@linux.ibm.com"
 <farman@linux.ibm.com>, "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "vneethv@linux.ibm.com"
 <vneethv@linux.ibm.com>, "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>, "akrowiak@linux.ibm.com"
 <akrowiak@linux.ibm.com>, "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "hch@infradead.org" <hch@infradead.org>
Subject: RE: [RFT][PATCH v2 1/9] vfio: Make vfio_unpin_pages() return void
Thread-Topic: [RFT][PATCH v2 1/9] vfio: Make vfio_unpin_pages() return void
Thread-Index: AQHYkQGZdvHyN+uRrkKQFdPKxVWBWq1ylc3w
Date: Thu, 7 Jul 2022 08:42:28 +0000
Message-ID: <BN9PR11MB527643D01DFF0AFCED1614488C839@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-2-nicolinc@nvidia.com>
In-Reply-To: <20220706062759.24946-2-nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9ffb10b-cfbb-46d7-e396-08da5ff49fd8
x-ms-traffictypediagnostic: SN6PR11MB2654:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9msCuaf3DB+OEHMxJ4IGBDWpW3UUrMR1Q4VitYy8YHf6BK48bKBv8XHGCVJfDNMtgJvMEd6q0tgORX/JhrAq6FKP05ASymiIYZxzApraldXy7koJNbBXPQZlT1jz2DFv7/fbvUDXPZmJYu1N6l1XgQ7oo1J701SqF9J/3XKcjv1PQN884WBDxSgB+2HNU37FTjx2wLAMTUPkPShZvfuF2gTld3D5p1USvZHwKcbqycoAR79oIJo3+AjH/EcJptJ6Z6bcQ+ylSGJzyobvz75J9SXHDAmUh/UNpMobSlwx1TTLCItFcPwkn05wL0FA0p3FRQzRiFY9rq8vGN/qJB/cXnGtl8iXERxCTmyxkQyMZ8S/Id8n5YEjeuiYwwiwkqSU3e+VEFeC28CP0BshFF+NmSaiXLfVtWeurZRVs50Qqmjo91J9RjGU+KvcuN7rjZDpVRdeZU17oWkQqWoQiYQ2Pa0J8rY9FumAjdbC3sItcNScRJXHSG+1OQFHQE/QiEgBOpodrkCDOS4PkgZIKaVYvqOkstLcT5b3SfY9W00VWLGTaPhdtl95zOQzAOz7zsHCCfoh+wgE93AwFQH2lmtgzHc9+RoF6AMmh85lMkkzPF35vNz09kTaNfJ5FbozFyY6M1XObOGbwAKcjD9J/bzhYmbnA8lACBIaxSRDXnc7Pex2M97WhScEx4QpFns6cE/OZuSdj2qEj54MNbusZef6MP/5aXHS67Gc+9FK8GhePia/ltXLOfShEDJtrvHZs8yTenWlIudlNXcRYkE65DlspncwjqZ54ghONlScqqRLnlPjFzGhD2HFKAdvClFZ7tcNTpvkWQDJdxTpG9ed1h6e2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(376002)(39860400002)(366004)(136003)(9686003)(6506007)(82960400001)(26005)(478600001)(7696005)(71200400001)(186003)(38070700005)(38100700002)(33656002)(122000001)(55016003)(2906002)(8676002)(76116006)(66446008)(54906003)(921005)(52536014)(86362001)(8936002)(7416002)(5660300002)(41300700001)(316002)(110136005)(4326008)(66946007)(4744005)(66556008)(66476007)(64756008)(7406005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ifi9pI2UPNeDVW2a5CRmSvnQFTtss3PdaL80N/CqSRW/9+WR8cMlL5mJPwWp?=
 =?us-ascii?Q?vtAuZ/6DHIGsppZSinZizQttf9k5yDrx6FcNw9cUxp2ouJjmnUKp65QcVBFg?=
 =?us-ascii?Q?OZOg8J5f9MTode8oQnEAnTyUNeGIo64fesz9cxh+EbVlfXdnsy/1CaPvipRs?=
 =?us-ascii?Q?sX1Yq3gpVKylCfGf7USTcibyXhrFQkkh8/moncCJieFW4K1NFkr68tav8DRW?=
 =?us-ascii?Q?Pat8z+E3GFEu3OQoQEfMGGG/rR619EuBBK8UV31MLuLM6ouETvmfJ6D388WS?=
 =?us-ascii?Q?1SqDuq99ov1fhayvXsqyehv62zcDGwjENP7YGj1bRVLiEn99pXI+gs3cIIW5?=
 =?us-ascii?Q?ruecI4/28TjKsK75seTXEZw+2/XLgbMuqqVe7LI6icED/F5HhJJMdb6Za1aO?=
 =?us-ascii?Q?77DKYtXHTaOxR5mdZ3Izv9cWyD3MW9nTWIiOm0fN7yEg8hvsq2blJ2xcvSmI?=
 =?us-ascii?Q?IkhEB4thZ0OukSQAaWD1JaN1SusR8fAOaMG4gZkhRm3kcyUpBpliMBwN6vmk?=
 =?us-ascii?Q?qArjFQBgtRvJwUdWvIHPLP+MImqS7PXkqNTsX5b+iCgeyZGHm8KbDQxQ/Nn2?=
 =?us-ascii?Q?CsVjTuBk1X4N8k9MMJhqwMWnVCCf+SeTl8up2RzDh/Tkx9/UNtqYVvGcNEg0?=
 =?us-ascii?Q?dak1U6oBIKTMRDFOY3BI2qt9WQme0e/zff64/b9TpHqid8jLccnRJzszXpvR?=
 =?us-ascii?Q?LotZz8VOP4I2MCBZ/m0ljbu9gbCgAVK4hm8TwJcUaLTCfa1zFbAiS/LxwJAf?=
 =?us-ascii?Q?JSNJk3LhI4ZdLJ/2oV/GjI1/h6IHas1mlB9NDBpI3EhqKsav2M0bflP1q58f?=
 =?us-ascii?Q?L8rioKt+rdy0xpagAQcl5BZLukotUjg81nKCiWafYg5ENUZhsvNROmWY1JkF?=
 =?us-ascii?Q?mOkmpGDqUZFQzEQwG/A/JMGyvJU75QnzytVqNimH3ga0YwRMBCP77VxshnMd?=
 =?us-ascii?Q?J6WSnpQr53VuX0jmnd3GR2VylfPVyxzZhisBiJavzVpLuYDXqUVoEY20rjkl?=
 =?us-ascii?Q?Gyh3hni0Ej2q/Ng4Y8WEZ5gPTlZKC9PSQX08gv3FqZv3Ece4f8z+DqAyPejE?=
 =?us-ascii?Q?1XJz/HJeMR//Q8AGRWFtLLMu04ceSt5uEL6+/Gcem1KzsGWZUvDIMkmCByws?=
 =?us-ascii?Q?kv/fzUwqm7H51ui4j4mXjzIpglqgry3FFX5VE3S69FeiDe+Kpya7PdE1pNnW?=
 =?us-ascii?Q?pdilU5MpHPv0yMijEAnsFQkC251HFEq5gDOVTf93nBeF9HLoETKTDwI6FcNs?=
 =?us-ascii?Q?gdu7+RAjhExlQUg5glAFYLOiPo1sLRaIKrzCxBdQtfwK1xrjXlukq3or4dK4?=
 =?us-ascii?Q?K0lZt8UzmnOhOpUVX8A022tcva7jW09fzjoOqM3AtZRN3G3jIf/itXSEN0/f?=
 =?us-ascii?Q?04D/f8oCpQcJET3fKBoBAjs3Do57nyepTFn5iXQj2rb9AzHu6dbAB8TEDCeZ?=
 =?us-ascii?Q?NIoA5drWi327m/bJf5Fwvj1HSsPo8VrKjH05BdtpeCGSxrTiGiQx8adFOg/4?=
 =?us-ascii?Q?OercA1I+xICib35M5YXoPfkOETpysLJZGHMhbLuadxz5uLT5YcYDCVMDAaI3?=
 =?us-ascii?Q?bOdHJUJbnQz66CqZakUnZ7xV7kWPwpYF+feI6+w5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ffb10b-cfbb-46d7-e396-08da5ff49fd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 08:42:28.4328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QNgmliOFzpcd2fL/IpMuPCEs3ph5n3ns3ECRYbGFeWgs/9gvpD026Da0K64Fiz+MF9RP8qXLfrynUSUSXrELWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2654
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jchrist@linux.ibm.com" <jchrist@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Wednesday, July 6, 2022 2:28 PM
>=20
> There's only one caller that checks its return value with a WARN_ON_ONCE,
> while all other callers do not check return value at all. So simplify the
> API to return void by embedding similar WARN_ON_ONCEs.

While this change keeps the similar effect as before it leads to different
policy for same type of errors between pin and unpin paths:

e.g.

vfio_unpin_pages():
	if (WARN_ON_ONCE(!user_pfn || !npage || !vfio_assert_device_open(device)))
		return;

vfio_pin_pages():
	if (!user_pfn || !phys_pfn || !npage ||
	    !vfio_assert_device_open(device))
		return -EINVAL;

It sounds a bit weird when reading related code...
