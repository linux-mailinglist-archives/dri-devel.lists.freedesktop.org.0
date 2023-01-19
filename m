Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E62672FB7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 04:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D754010E89D;
	Thu, 19 Jan 2023 03:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A60810E89C;
 Thu, 19 Jan 2023 03:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674100171; x=1705636171;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/mkIt2vhwfN2VSKn9ms6FSvLYMlJwY4GFbr58qPL7XM=;
 b=fJUvNgJYK57I86AExh5sRcF7iXJR0byQUoOAxaiIn4YmfiSlZKFNv5qL
 AMHNa+RP2H4nqPijzLfooRi92/CVb3iuJvnjMvCsB73bHVWeBWLpA8sxz
 RsCSqB5TeUvR7m5sAVukkoWR5k5ykPsee8+xB9eggiz3LqkW3129CXjoD
 epftbieo4mMdPa9wLHtN4CEZDLbyIoWQG1huKDVYxQAF2/w6qWc1/4atf
 jo+j4Mrj35/kCMvqrdfzj0Johoddq6FwbrPOyNOornC85xxztdfIqC4Qs
 Mmoy6hToeKafWsBNDpbwXdYBhdFESE5BOXRpLpXVSWs4xMuTp3doYC0Bb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411423952"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="411423952"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 19:49:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="768029390"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="768029390"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2023 19:49:29 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 19:49:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 19:49:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 19:49:28 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 19:49:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0dlYIM+PFqjnCPATj440PmpSByf0bLppm9lu66U561KXHkga9f9t1F7RZ1BzBfghlH5F73WS/HpNbrDmzdmSYwToGJlbyfn1vAs7jmc+BBogiGMjn8wo2cn49Cd0sos0hiYbeMUXvB5g6MbK13ciruB1BoQrlZGaIaydNUUo9extVmTpAIlqZXWjRyg2zpkHWDuXUcsgArWGBOQWvQ0r6Z++/5/PcJ2mImIc47QxBLwvfHAqABc0IHNs6tRmCpM3OcW/sn+bygXy3YuQ0nwd6hu4a5KZ42HO+ShvPrKOMTemghT7fsZJF6hR1Uri7T8NaN3TAc6gJ/7Lat42FZRRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mkIt2vhwfN2VSKn9ms6FSvLYMlJwY4GFbr58qPL7XM=;
 b=geE9Ht+rSsw6IK3jOWgbQ94+Hi8ExdaVpw18K1Mi/+uNR6Qx3rWO4YtGc3HujVJswMCN4XMI2/2yj05rUrtBcJGzCZHcu5a/mX+W+CqzOJ45ulCVAKvoqiM1AQqNy0Z3kwC/jWLdji/50c/npGQ30HeSmy8MDyL41DGLZT0s1CUuljktuCIYlu3aHLBXV5fFXB82uMUIFOo5Tv3yPmhTFZ8YqGO4LTaoSAFzKL8A9okc2fkRPFoHia66yTzp/CkvRPMgUybNyk34uLsfFVnMtMd1p3ybzIJSmCC/NqHmWEEG5vvh71q/brvteXi1z6YRz9YJZq2qMyu4JODgz5Mcag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 03:49:17 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%9]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 03:49:17 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: RE: [PATCH v2 06/10] iommu/intel: Add a gfp parameter to
 alloc_pgtable_page()
Thread-Topic: [PATCH v2 06/10] iommu/intel: Add a gfp parameter to
 alloc_pgtable_page()
Thread-Index: AQHZK2brx6V0vKPMHE+RijLSopzesK6lGx3g
Date: Thu, 19 Jan 2023 03:49:17 +0000
Message-ID: <BN9PR11MB527606E038CE8506ECAFBBCC8CC49@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
 <6-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
In-Reply-To: <6-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SN7PR11MB6948:EE_
x-ms-office365-filtering-correlation-id: 45bd557c-0391-435d-a9d5-08daf9d023eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xFB6PO+K8J7PggDYZfQG/clJcBeoTc4ltBNvGk+wkIpluaNkq1AuGvWR1gXiOQ1CGNtSRCG3Zc94c9Dx50/beJyQtCTFFcrac0W5CF0O1Q7Gb0oG2MH4vEFDIRJoWTD+O65uiPY0rF5ZOGwYZKpT/I53k/x/QwaAycVw/MJGuKv54lLN6EbuF9Ki2xvDiJhLhjQhzStQyYwdTYC5Mp44G2SrEu8Ug0PNH/64T1XTMZDwzhOzUU+crWs3vAYthRHSJrv7XJY2LF10hrgOzHYfbEZILjMRwAguVyxfMJ1lHvlXSmFAYP7T344ScPCCB7sTMsMibUkXpLKiltbivypW1fNi8s1gyoQqqdMTb+0MsQ8/4ihdtWPK+xiAj4GNFahiMUcZwfJpflsLyeoihVb1v6BqPVHmXv5LM1A4OdGSrmNup+V7mRRAzf0ed7j//nM6PKgxc7lzjMR5I4zp1rzq1NGXZHZ06FBSZYz40UErGmBotlHf8TilAYpC9uQhmNDqJ0cpAeaEa38gPaMSJzgVRFsOxm1RpnluNw6bogiW+oplyZjFBWScRYpMOVH7fUG0A42VjD8OlkBZ0QLEr758Xd3u5x9gX2z0q8XQCQd2nb6159oBfUrryRsMQQpaa/QbnyXFLG/ParnbcUpYTU7E4K2OZAM/9IjKJBCLW8LYwWlLEC+JcwfGiRPXt5Z2N1FIIcqrnL5vlNnhRfupT+X/cA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199015)(6506007)(26005)(186003)(9686003)(7696005)(122000001)(71200400001)(33656002)(478600001)(54906003)(316002)(110136005)(76116006)(66946007)(66556008)(64756008)(66446008)(8676002)(4326008)(66476007)(41300700001)(8936002)(52536014)(55016003)(7416002)(2906002)(5660300002)(38070700005)(38100700002)(82960400001)(86362001)(558084003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3VaevaxyBhAdtXbT518zU2u+cx50zUvid7/xTrcq+K1PjtwygGxHz2JAVjNs?=
 =?us-ascii?Q?amu08L93MDaOqSMJaAaf2+rf1OOSfHTjoptlVgR8rpHF5JM6Fl4GRAm+AEeF?=
 =?us-ascii?Q?wbNwjj8vpGeXvizGBVxfXIqxlZgTa8dQaONknvYNCPP3zOB9VEb5mo8APGQk?=
 =?us-ascii?Q?EmQoIsz8YgtWdbD0dnE0jQKAqRIKjMw3lenHavOkPcU1hMmIBpH8IYftm8eJ?=
 =?us-ascii?Q?KNYjkmPaS1xqZlVAO9TrXUWoesvxe77HKtSk1JHB89bD3UM75ErixNdxSE2m?=
 =?us-ascii?Q?UaZI6Sh1yNusb2TfgW+/Ra8qlxmBqoTK/sz8XOYZhaTo1PEfd4aBOOvQWLp5?=
 =?us-ascii?Q?x7a8GVM/1a9hWiQkddtORZ8+zfp4/j5KtIKjWzXQu86s+uOBdIK6Vb4umA8p?=
 =?us-ascii?Q?GWscKtunImsheQAEyM8sqo9LJqpRgIklOH8ZxHGIdcKguld1YRmNltS/crN/?=
 =?us-ascii?Q?LJgOtwqmtlGt9wKf21JjGSqkHA6IYBMB9CAwKo/NEe7EkTDn9DT6NJDR4xm1?=
 =?us-ascii?Q?7UKuFnywQg9m7zYBpyzi9C45HFrtC3/+47NX7/Lmw1WLpImzg/hOKM863YMU?=
 =?us-ascii?Q?D3GumuTYCpaTC9zO8pU5I0+vV0oyu+0Mb0T9DWl0Kj++zOSj2XriBUxMIxk2?=
 =?us-ascii?Q?JppS4mU07yBIZg7ywbw+Qw7g30DX+UvETK5C5aiuomekRPh3mEn+pmWY8Ezo?=
 =?us-ascii?Q?VqPUtHqYeahLzTeDoL89QZnXDrj1j0jghdWUIYUV/5FdCn3Us/1k6xWh2m8J?=
 =?us-ascii?Q?lUb82jUPMMBj4v9D8p62JyHwKyJ9mgrJqThN+kpYtVNDece4AjA1XAjqgo1k?=
 =?us-ascii?Q?I+KDyW97zmniOhgU0sLFHuMW6EXahBjLbP2vGXycR6PscdbsyzDJLK20MNW0?=
 =?us-ascii?Q?ZuBBp6VVdnrri/Ragbk1JF91XDTknNaterCQveWr/hAh+Zf/SIJgWuRiAKtW?=
 =?us-ascii?Q?1Pe4xuVPGFyYdJQeAjczKQ1blmzBwBh2sRMNmTAWaTx8a8A15rvPsa0RdkrD?=
 =?us-ascii?Q?CATRma0JlCNlBF323uPPcArMV2AdVaZ3ZbGF6OLVVO0IBrzuz4ea6pXSy65C?=
 =?us-ascii?Q?YFrXHClCVzZhyhUtU18DkoR8QLsCNhY2HFPUm/Eqm7I1NPS5M2inENCW413D?=
 =?us-ascii?Q?+SGCY0i6Akxn2m2rsV0aLIEEijppmafbFGv5JqQ7d0Cm/UJySYC9Kb3GkxTf?=
 =?us-ascii?Q?mHraGJvTnDZcVJ+UcF1qAimVpCTjoZnn4x7k3V8ISuKt0POvdDdFV3siWc/u?=
 =?us-ascii?Q?nuDzFpnbV+QKc7zOnhG/kiBNkmwohj/kX8q+a03zcQRbJ53AQuXzpvpsz8/d?=
 =?us-ascii?Q?eE9qWpVGDxYfu0CcKlRSVlOWL+Z9mGoqnm/e4ayIvRp3ircfLHwz2Ob5/Ej8?=
 =?us-ascii?Q?1gllnr9RXH/rHCRjI7JuYdqsmPKq0BKUiqdwGY8VgiwhB/wfVzzcHvEWtm8b?=
 =?us-ascii?Q?S1RqJi1DzRxHLPFbpMUCQgUwzLQbZhT38RAVd7pNhi0hVsGKmrQI6vsV0Kqe?=
 =?us-ascii?Q?fN4bvaBgwAWKsNCQbhHEEF2qGqDQlC4oecdNVIhsqSPr+opMCqAzKPNNCw6v?=
 =?us-ascii?Q?vIU9MZbFQJmptgIL6NmXC/Si/zMHv359VNfyPa1H?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45bd557c-0391-435d-a9d5-08daf9d023eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 03:49:17.6882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TJTGXoGGGuu5g2cJ/fJZE8gD4ZGfPfOJ1Hop2o8R1UJK8ZaCjBuk4slC4mtymIITrtFQkIAY3GZFEFR6EsBekg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
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
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, January 19, 2023 2:01 AM
>=20
> This is eventually called by iommufd through intel_iommu_map_pages() and
> it should not be forced to atomic. Push the GFP_ATOMIC to all callers.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
