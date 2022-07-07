Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE3569DF2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 10:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EC014A58D;
	Thu,  7 Jul 2022 08:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6CE14A58B;
 Thu,  7 Jul 2022 08:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657183626; x=1688719626;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5kh9SWuYxUY3c0IXKQSvhzZCzCs3AEzFYrWvUSNYRfM=;
 b=YIH6nR/L4deBG1QZJviWHihNpcZBLHHXmWamHvNpCDGmLs4hdaLPBA57
 zxL8z7Qi+pEoeqRQS3TCG8UmkSzGJQFWva5EhicerDAGCIAB5jZ+6K80y
 Wagc9bejLBA/QiVd3030IISiuPKRIhay0VvfaFJASVVGSP3Q8HicAISxn
 6nO0Bgux3z6oFH7nqkq3Wz3vwk64CeQc6gcFMhH9XAdOXHRAaa2Kp3JFy
 N3XEt+qE0izMnqIfI18Vms2qLcvaEOw7LubmhqUaze50lfbOosXrqE97B
 VFAozAtRymjct3E0bqmBs6pQDSP+k+oeEDdwuyx9QocfvZ+nFhokYHkSO g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="282722727"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="282722727"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 01:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="568431306"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 07 Jul 2022 01:47:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Jul 2022 01:47:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Jul 2022 01:47:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 7 Jul 2022 01:47:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 7 Jul 2022 01:47:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqXXk5ZaBXMnms81Y22ZvfVwaImDeTfjr4i0szadUnN41FZMrQHMCZpKVUr+Fyz1tahKDErO6jtMXH7U3m0MGLBBD4/Swh/L0DaQyhm3Zc/REPXVIDvoRw8uSsd3EVxY9u4KPGmcPGVab4TIXVzhvgwywZqlYXNgMjdUwR0yNMHCs0Sb6fNw04rYHSITU7J3u+HYRXfp1UALIoOhyFadRzgJu+SL2gnJdGv/Rr3Q+eg/zVOQMVRhAdAoJs1CONtQ35Gu0vD8rRAYQCwNEmxD4Hckla65x62UeD0WZLRwxxmxT1bScodK57MJUAJlWxFtR9IyJNVRS/cqwj6m5vXQFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kh9SWuYxUY3c0IXKQSvhzZCzCs3AEzFYrWvUSNYRfM=;
 b=NkhA0t5/eH25x/yAOyF1wC2gLewV+4z11x3zggzRdOiJu4zbUgrMmjjfs8LFl/GHmWoifN8w1CcMpWySGOf2yfQikWiPRW9KBQ3MM0T2qgOmPP7RsH7lIGAhF+8ebi0x7kdrtvbMuVblZyuupOg5ioIOCWBas59Ql2KqTHxz4Sb20AU+Tp7KuyfWNmSfiVI3vYKYPkKlrUo2tkMJSs/UMbFkfNtDLC/pWf1mt5k0m5sl8gXZyVh7kyZUDqtN3O5qUJTnos5v5dCSEEmMgjkJy6iEcwphuEEEutYiAIlvI3dTxbovuy0Izn08Qj6WT5kuuzh8dGpPIOuoKH4wdlUjAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MW5PR11MB5907.namprd11.prod.outlook.com (2603:10b6:303:1a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 7 Jul
 2022 08:47:02 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 08:47:02 +0000
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
Subject: RE: [RFT][PATCH v2 7/9] vfio: Rename user_iova of vfio_dma_rw()
Thread-Topic: [RFT][PATCH v2 7/9] vfio: Rename user_iova of vfio_dma_rw()
Thread-Index: AQHYkQGhOjTo6Vmq1kyrtfklqMNngq1ymh5A
Date: Thu, 7 Jul 2022 08:47:02 +0000
Message-ID: <BN9PR11MB527686606603B31A5C1BC3548C839@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-8-nicolinc@nvidia.com>
In-Reply-To: <20220706062759.24946-8-nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5904e143-d884-4ca2-2d22-08da5ff54323
x-ms-traffictypediagnostic: MW5PR11MB5907:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: so3Vqx1uzokzJdZQYaT3otvpQ1AEl04/hPYtmlYzc2i9xZsTu2eQcEkrCOkBkEQ3qzZWxPfTv3b3WGH8IfDeQp5EMjiyPyC1hkFsYR/jXoT5UCyoWU7K/ph1AIj02TGwnZO2pqFg7VJuLum9chcjvIGfJy0sdYg5BSaVMdc1WA/f69+Z7MuKBT/dPcnXrW5udDmciTU5C/ZZ9xy+F9DQUDJZ/umr2eHRA2CohE5aYb6JgMUI38eVdfMvzqxvKamkiEYZjIDwOptvhQnqODx/FmVcirWY4TxdQ77HQrQaC2s37gFuVHY2fBgGbz5mLJ4o04Morrbjivaq2W+T1Xr6Qj+N/QUz8eU0whAI2x61Ic2cVfUJxgTehzk2rzif0mFLGxjnGE+s7WL0sC2suJ0MT8/XIqGvWha3YjfblgzwStIygLd/MPa+zX/hPGSW589hG3MDHW525hltH5eaLd6Qjg8fQJ/HdO3s/1HwF88+2WQNaPT/dxul3I58ebIEJWwr3iIxMhXvs8gU1pvJJaJmyGGnhlwWsHHCyeWV1Eb+ANYYOigyq3crBieGavslK8lX9a4izl2tiGs7Jo/5sdcqsKwOHOQJ4CbuOJuhkz837ZmpGAcT88W6BbGbzFQlNvSwoiGWpfeg+SmrC60e146TeVugTkbUfth7qFEf/1rj2aUkoVY0e+Yf6i85EkT5kXdnJGrbZPeFD6FnaY4zW2VpmgvaN2sdwganiAo5T5lgWAVPfsfkYVkSifPXYE2kJem7yobDWiYXpx0gh0iTCmdITQ8jroPNj/sUkwVu1HAgJVlhMdFfmpVWjlpjAi729ICQaw+gKX/lwElliJiRJmGxuA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(396003)(346002)(366004)(136003)(8676002)(186003)(8936002)(66446008)(64756008)(9686003)(76116006)(4326008)(26005)(122000001)(6506007)(66946007)(558084003)(82960400001)(41300700001)(7696005)(38100700002)(316002)(33656002)(66556008)(52536014)(66476007)(38070700005)(7406005)(55016003)(54906003)(5660300002)(83380400001)(86362001)(110136005)(478600001)(921005)(2906002)(71200400001)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?202FIxKWIdqPHoqFYrTOB+liVvFDEVytNP7lG7g/SJ8fzumDUqxta5ONV+1T?=
 =?us-ascii?Q?wQOut4PRzo+FdJLGftLsooHPXXwNkw/ojSz+HfEgXIr5oSH3uEl9Z8e0XHCw?=
 =?us-ascii?Q?jwoNgmRYR+UDoV9/O0Sh1po0AbsDYXfcwRAwhWHy5WT2W4s81gRAiHaSb5j6?=
 =?us-ascii?Q?HcZOwXDwyBrRCa595oPbaLGh9ezJujVx+6JrD7wHMdpz555oHYFMV0Z2E46j?=
 =?us-ascii?Q?K3UR2gxpu6KMw4f/KfIQDgZ718xy75MiwBznt8e7ADS8n+OW06Cm5NL3TpFb?=
 =?us-ascii?Q?weqhBvZbx+msmDkTbt7pq9851RzbuafsIhlJQ+0uDhNHpga1qQPlokmAcPeR?=
 =?us-ascii?Q?m9Yuvj21jO3LfRtYW2+qc7znzML/KZXrVhQkVjH4fjzHzKQqmApRWU2DwOy1?=
 =?us-ascii?Q?Z/b4MHKSIeOtYxSX+DCbats0XzFIaKxWlTj56YkRiV6AifWzpK6aE0tbAcvM?=
 =?us-ascii?Q?Xcm96iVLfMZmj0Gu6p85SAy1P+eqnfWS8vxsicCZBnz9Unsaobx/m9EAeL5y?=
 =?us-ascii?Q?IFRds5OdhUs5YKSD8MYT/4/CXpKUusHhXqZ+gMn6EAqHmPc/8h1+bcGhEdbq?=
 =?us-ascii?Q?cFImFDIzazyHPVEkE+obCy9nlcerOxpxhN8HUqnAmUlKQ9ZoF/oOy9I1vD3f?=
 =?us-ascii?Q?HDVV14pGv9zJ8GqO9CmN/x8ESk7MRHzLTjUmPRWvCgOnbvl+RkA/8VDPOYxA?=
 =?us-ascii?Q?eoKE9R9uQV3EYNAfYtHRJWrFn+SoiRNdkKapycdvWXmPkR+DUm/AsRudpFJN?=
 =?us-ascii?Q?MSKH3p+ab55Y0qigB1xr7f1gdEfCrlEy4Vgn2ZKF81qGYqTv6NnW6DhGzFqy?=
 =?us-ascii?Q?MKkNPTOyXlduAqWel2B5So11zXEL2LW+gOgggBMaxsg0P+2IDBhnVS+sAfpq?=
 =?us-ascii?Q?Tkb9MXqRKXh8X6F+fqH6KSflwDgTlyOexCVyVcDe92TK6qUdvB4BzUFSR7Q5?=
 =?us-ascii?Q?xtyEyGnW87HsPmZdfGRQvksJnzeISYa7xEZ7wst+yc1hitsFeEa2mBOjrws8?=
 =?us-ascii?Q?jHKoHGfqZgfEi3el6yIr1ZoZUbxdodepD7F1hU1cBiiCR1ory37OozklZrUp?=
 =?us-ascii?Q?SSImfIUODXYVr28v0NMjW7uONp6Dj7nwsU0Hz5zHAsvOWoev5BjyPqBmFU74?=
 =?us-ascii?Q?SQ4BnNAunthwquCbSCiuCmiOh15D3EIWI61TN5yVRUOZKAyfAxh3BsGlROTM?=
 =?us-ascii?Q?O+aKVVMA+Nxrohu8EeEzVjfPcd+XXjnt4hq9lIVzlKeyaZ/ZHFLuGHS/xt5G?=
 =?us-ascii?Q?gOV1Cimu3T+zxTGPQcQqeRmwMUW8LyJbUMhPKsyPACOB8pzQJ0bUA3y4T26z?=
 =?us-ascii?Q?pi//p/+nVt9sl7tz6IFNtmK+kP2+qBOjL7VKKr0im9LLjKV751Nl6sPx45c8?=
 =?us-ascii?Q?lJTzbR8+YGubVdV3u2AI1j+rVzMLhLYf8uZgphsaNrao9OKx4aKKI4b5qVvT?=
 =?us-ascii?Q?nVrQpqUpozZ5N39ww2S+b0ji8eAHaSih2zLN4loabE1r2quo2dkU1qG5AEC3?=
 =?us-ascii?Q?LZhY9wL+tXLjb2XoO22+JUIFsZe11keAOC9SmlZNIQVDLgf3zqhDtP5sf4E+?=
 =?us-ascii?Q?L7swUN8dbXt8SloWjUrk66HFTFl1Z3e06f3RqS4I?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5904e143-d884-4ca2-2d22-08da5ff54323
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 08:47:02.3881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ht8iD5Q/i5EN/M9lvQHDemOSfmX9eiT+b4BD4wMP5xQ7g5Jo2I09hhhIv9jzHsHwdC3CShFyoua4eO2mRI4+NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5907
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
> Following the updated vfio_pin/unpin_pages(), use the simpler "iova".
>=20
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
