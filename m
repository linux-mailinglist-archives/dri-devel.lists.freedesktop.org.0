Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A54758D48
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 07:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8A510E00E;
	Wed, 19 Jul 2023 05:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BCF10E00E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 05:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689745378; x=1721281378;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZM9MI4S50spfA7s889WpTpo/R3p6NppxKYJODvfDjac=;
 b=apdyfNjXtOD5C/WSTMdt/OLkjnt7MVDD5UA8f9/7BuaE5z2WVM4TTvy4
 QfybVEHdbuP3BhqKM6rcUjCj/V+yuxzStplKnOjREtzx5QafqDaiU3Uh1
 nlhSuNNriaqVtizTyrOVdd2J3HPzuMp3wPs8jcYWAu/RzSDxKh1BsjDGX
 5xuTVXXFNrY6OSbCXOX/ZPCssCmBUMjl9w5hsw68iUc31caOFa7+FZwKe
 s+IzQG1dbQVFPGiYszD9tZaOzM+6s5M/3i2XUs2pRONvNYeA4R5vIKZGH
 pwoJ/W3rAuKOSVdOnAtxfCZPsxnDotlt0fNrrX4AftUq45JJorlURRHxo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="432559758"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="432559758"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 22:42:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="847936123"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="847936123"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 18 Jul 2023 22:42:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 22:42:56 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 22:42:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 22:42:56 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 22:42:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHq6QyioxQzV6g82NXnmx4mJQV94hcYtNFsSoaqIFegNP4Wojd79lp592UbFKF7NjWRHLR7aaBmV/p6T0qXldev8q6laAI4sG/vwDIpNbNhTGWKDkcg1DOFpKG5SNKqVdtefXKT3XpQdVDZ3NvK5Ol6p2C9PLQSv1rkEMg1Jh5vBKO5344h6qlwJhw4IZbJYsILqui7P9RlxUSH1lg/Ehz3+Z638h6KlnkNl6FVb1RcfFNE2nyWr57wGPS3Azg0frZu8a6XXpfr7m0C+gTWFFSVaqhDi3glmjduhx8IlBO6RWHjpjvE8c16xc61hzkvGjQpjg0E2EcZQVKt5yoPyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKbtoy0VLPTu89dT1ehm80CaLGdIXWdxv6Le4l5UKA4=;
 b=PQdj5P41jd5vpDkFCBdOeYVwmR/k6EyVShdUWSlRu9zzuQ0SMJHHjvB57oKs+cEAFtB/5Z7/vPD3oDBf3xIZQeBb7g/c8RirsoFiv0zeDMVQbZhetACirFybA6Z5Gsfq4f5TnIaJ3jyclGKCnO5KRecjD8lBG5AtzjJ/kgptpPhWexM8tbuNw+8I447F8TNjYCcLo6gLdwCZd59YiH1T1n/dA/vH5ie000kgAKQcMM69SmKTiKDEZoy4NcMVEoJwC/Vz7uZaA8nTS72AB+YNfZvxD/8QYaAf8UFt2Gnw/lqvIR3aUM3VdOnziZg1YX8+ScOwTMHnsuFhrRFOV9I0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH3PR11MB7348.namprd11.prod.outlook.com (2603:10b6:610:14d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 05:42:54 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::468a:4b39:392b:d9a9%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 05:42:54 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: RE: [PATCH v2 2/2] udmabuf: Add back support for mapping hugetlb
 pages (v2)
Thread-Topic: [PATCH v2 2/2] udmabuf: Add back support for mapping hugetlb
 pages (v2)
Thread-Index: AQHZuVRyhjIT81N2zEaE/1qQy7w7oq/AMPUAgAAconA=
Date: Wed, 19 Jul 2023 05:42:54 +0000
Message-ID: <IA0PR11MB7185E6C4F0B9F4666A7C5CF7F839A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230718082605.1570740-1-vivek.kasireddy@intel.com>
 <20230718082605.1570740-3-vivek.kasireddy@intel.com>
 <20230718234436.GB10413@monkey>
In-Reply-To: <20230718234436.GB10413@monkey>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH3PR11MB7348:EE_
x-ms-office365-filtering-correlation-id: da56a7f9-6e29-444b-33c3-08db881affb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dZp4bqTjBnsiuFVebHBbVP++0x3hrHscw0ZZWW9zewUyNg71gk/JFqfYzfMHqs3ew41sCW9oYA0KxYH0R2anIQBVIXlM+Mjc4pmbKzzPnaCXIYRTnWLo53jUnrbEvjlM2DX23vwDFzmvsgVRVvUnL7cIzFKCOLJj7MLgN+ag2KkQPB5AW9s2uwr0U2lF7R1xWKpj4AL0JIHgKrXry3Ql6oGXIL+a0UYEM9SUkBongrGG4Q7TT7X8LY6TezZnpGnm5080NUOiyUbMVWeTaxAbrzm3DR/xcePYeSfPmpP7sAbxbh3/S3aXZ9rWR/v13SByYYg0UmPh3MWAGlqQ9gO+sM8jOTheyC1rbbq7by18Mns84Vu6Fxm85MJCjdQb5rFZNNg1hko70GrXNfXcUsPZx8DChxUh9y107TiCTjzJkq2l2Y5pDyJOhq+W4ey6lGR+dOti5ij6ssAdAmOj82lqEMwE5bRzpX0Obl0iFx54L/vs1ZvGUaTZZwQ7nV4QSXZgiZe06SXdpAuQ/F7iXhLFHEP/v/Vsc6ggxdLpl/bjU2ZvzibY8K75TOEQccuzCxOnfxlchAinOPqB8pbmSAuwIgQZ4+jz1Sp6LawC9uSG0XOGx4WEU/Hn3ODUPtfsO0FI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199021)(8676002)(52536014)(8936002)(41300700001)(5660300002)(86362001)(38100700002)(316002)(4326008)(6916009)(83380400001)(82960400001)(9686003)(122000001)(66446008)(33656002)(66476007)(64756008)(66946007)(66556008)(76116006)(2906002)(38070700005)(478600001)(186003)(54906003)(55016003)(107886003)(7696005)(6506007)(53546011)(26005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?chHiSnjB3GGtT9tLyK2LtgXCl6QGoonYtry5zumaVrMfHaDskV1UQwGwt33u?=
 =?us-ascii?Q?ayQoHpmAG1mrqTPBQcWaxw4wJ3hWViFQf1y1lHYfo0USo0Yl33DFrDcAju/P?=
 =?us-ascii?Q?Gsn2t325PFozH6/1K+v4j4ww+S//si3ihjbK0sOUErF35ERDdOqSgOmbW+uW?=
 =?us-ascii?Q?drgfJUYwycPNP1cX6yY4MLKWAlSJLEKr9BpgqbH//z2MxmQLcLB2qKvmvDPB?=
 =?us-ascii?Q?sVR5Das97zfSnfQ6e+kayU8GvZb6WX975rlowzN460GckNlkjdk8iOJr2j+t?=
 =?us-ascii?Q?o9AAwJAIM4fBB7MN8/gCvfpDrifWV6KFigFHWyS6NVReUndGDBEwP9j8TkzW?=
 =?us-ascii?Q?E95c148KYEJXu6s8lIM5YHYOUQ8eaVN6TwWePw7Z/cx7oWBc9zxfdwuRHTnI?=
 =?us-ascii?Q?eNxtqcNcycSeFPv6PYfTtT7wiIjjNUKFqD7Cnwyjjz1n/D092dajr0kukQe3?=
 =?us-ascii?Q?9AoOZqwH6kRu/rCz2/f3cEHc2KEhXYw7bwyKjIDH6QG5sIA5ckW0dERwIgwr?=
 =?us-ascii?Q?/JSfiN1uUiXJC9n0v/bzxInUDH+TqNCf3QNkeV/M1hBFTFL01ZJysyWxJToL?=
 =?us-ascii?Q?Tdz3LnbCj8vWg6OktAA68FkAH2X+W6dbWR439bZvO+AcOJYC0cawF9uk9w1g?=
 =?us-ascii?Q?4noadb/XHtbg8U2rr7Cn/xMrG0DT0bt+m9lguAZszVmRMEZCNFb0mIklc5lw?=
 =?us-ascii?Q?UF/GyRQHD4ikBRNDKyncCmBNUHgNf6JOA51xbfuQQbb4WqvNU8HTzv0Cclrz?=
 =?us-ascii?Q?/XpGLNO4sLHc37aIGTkrAB1ChULC+K9Mt+KRpKQpzV7IzMAnvEhI/2BYJAmq?=
 =?us-ascii?Q?RNKcLyP7vbBYSShBnBjgpiCVJMwi1nmI+dQt7U/sQo+ovm0e4k/ZXjzWzni4?=
 =?us-ascii?Q?K23BP2nherueIJ9V+K2mrh1P+QwkgZenq7E7Ag6qhjNhPV+YbipGWZNFwBBs?=
 =?us-ascii?Q?eL+WJ1kQMVTAKArj4LoK9kloKufL6fcmemWGKEDNK8isjDlkPk9sT8cKf/1P?=
 =?us-ascii?Q?MpN8o43xwqjNjab6m9oiuNCTZQIrvpOIIttXG95n5a7HGYMyXstMhZ7MNS3B?=
 =?us-ascii?Q?Ww+m6ZipI3LIdP/AFOCQRFQ2f3SGe/yk1RAl1KjJb93SE2Kerehv6z7WHOzF?=
 =?us-ascii?Q?12sdvQg7Bm2ypbTNLNVyd/myaWHfPnXXLEK8Cik03G3ytOrwhggNhJvj2LOW?=
 =?us-ascii?Q?DwwYtBL7NY+OAO6Xq0D09UwgO2LxGuKM+slpLowBhIw2/KTAFX6yBxmQ565c?=
 =?us-ascii?Q?pDjQuK27WDI8t1dPRjd+BDIq7/sWWb0HEUIB7zntoeimEkR6OpwewE7lxkwg?=
 =?us-ascii?Q?mcUi91Fgd6VYFhUX0trFEZafBmNGa2IZVNMDxipYzv9HI1UXOSVduBU60BGh?=
 =?us-ascii?Q?NdMNAH14OhXN6sPnvlJ1ZNWkxTlH1nZsfC+l8eQCbtFPHwuwYL/YHBMIHG6c?=
 =?us-ascii?Q?twhp/+BmnMJsS4hvNcGC1CZcsbaSbFJzIegn1fQ+BQvN43c4v3k+2P0l5A4j?=
 =?us-ascii?Q?zyg2EXUf3BWP7nrm2UYt6LiSF1fVT0QXbOY/UpA7PqTv/Evo5z67vYI7mnmN?=
 =?us-ascii?Q?HnvKV6CU1RZ76ps/outgwPcDnao5EVyHZ3UhPjCp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da56a7f9-6e29-444b-33c3-08db881affb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 05:42:54.3676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1otbdujhdiMaV1Ha6jNFgHjM1Le8TfZEJfX7YEClB4HBhNFfezSqI9cDKOTLaM0PxlCTJqWpTHBXMPFLI1HbJu93KRDd9ktfcsW8pHxkGBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7348
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mike,

>=20
> On 07/18/23 01:26, Vivek Kasireddy wrote:
> > A user or admin can configure a VMM (Qemu) Guest's memory to be
> > backed by hugetlb pages for various reasons. However, a Guest OS
> > would still allocate (and pin) buffers that are backed by regular
> > 4k sized pages. In order to map these buffers and create dma-bufs
> > for them on the Host, we first need to find the hugetlb pages where
> > the buffer allocations are located and then determine the offsets
> > of individual chunks (within those pages) and use this information
> > to eventually populate a scatterlist.
> >
> > Testcase: default_hugepagesz=3D2M hugepagesz=3D2M hugepages=3D2500
> options
> > were passed to the Host kernel and Qemu was launched with these
> > relevant options: qemu-system-x86_64 -m 4096m....
> > -device virtio-gpu-pci,max_outputs=3D1,blob=3Dtrue,xres=3D1920,yres=3D1=
080
> > -display gtk,gl=3Don
> > -object memory-backend-memfd,hugetlb=3Don,id=3Dmem1,size=3D4096M
> > -machine memory-backend=3Dmem1
> >
> > Replacing -display gtk,gl=3Don with -display gtk,gl=3Doff above would
> > exercise the mmap handler.
> >
> > v2: Updated get_sg_table() to manually populate the scatterlist for
> >     both huge page and non-huge-page cases.
> >
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Mike Kravetz <mike.kravetz@oracle.com>
> > Cc: Hugh Dickins <hughd@google.com>
> > Cc: Peter Xu <peterx@redhat.com>
> > Cc: Jason Gunthorpe <jgg@nvidia.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Dongwon Kim <dongwon.kim@intel.com>
> > Cc: Junxiao Chang <junxiao.chang@intel.com>
> > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > ---
> >  drivers/dma-buf/udmabuf.c | 84 +++++++++++++++++++++++++++++++++--
> ----
> >  1 file changed, 71 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > index 820c993c8659..10c47bf77fb5 100644
> > --- a/drivers/dma-buf/udmabuf.c
> > +++ b/drivers/dma-buf/udmabuf.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/miscdevice.h>
> >  #include <linux/module.h>
> >  #include <linux/shmem_fs.h>
> > +#include <linux/hugetlb.h>
> >  #include <linux/slab.h>
> >  #include <linux/udmabuf.h>
> >  #include <linux/vmalloc.h>
> > @@ -28,6 +29,7 @@ struct udmabuf {
> >  	struct page **pages;
> >  	struct sg_table *sg;
> >  	struct miscdevice *device;
> > +	pgoff_t *offsets;
> >  };
> >
> >  static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
> > @@ -41,6 +43,10 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault
> *vmf)
> >  		return VM_FAULT_SIGBUS;
> >
> >  	pfn =3D page_to_pfn(ubuf->pages[pgoff]);
> > +	if (ubuf->offsets) {
> > +		pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
> > +	}
> > +
> >  	return vmf_insert_pfn(vma, vmf->address, pfn);
> >  }
> >
> > @@ -90,23 +96,31 @@ static struct sg_table *get_sg_table(struct device
> *dev, struct dma_buf *buf,
> >  {
> >  	struct udmabuf *ubuf =3D buf->priv;
> >  	struct sg_table *sg;
> > +	struct scatterlist *sgl;
> > +	pgoff_t offset;
> > +	unsigned long i =3D 0;
> >  	int ret;
> >
> >  	sg =3D kzalloc(sizeof(*sg), GFP_KERNEL);
> >  	if (!sg)
> >  		return ERR_PTR(-ENOMEM);
> > -	ret =3D sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->pagecount,
> > -					0, ubuf->pagecount << PAGE_SHIFT,
> > -					GFP_KERNEL);
> > +
> > +	ret =3D sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
> >  	if (ret < 0)
> > -		goto err;
> > +		goto err_alloc;
> > +
> > +	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i) {
> > +		offset =3D ubuf->offsets ? ubuf->offsets[i] : 0;
> > +		sg_set_page(sgl, ubuf->pages[i], PAGE_SIZE, offset);
> > +	}
> >  	ret =3D dma_map_sgtable(dev, sg, direction, 0);
> >  	if (ret < 0)
> > -		goto err;
> > +		goto err_map;
> >  	return sg;
> >
> > -err:
> > +err_map:
> >  	sg_free_table(sg);
> > +err_alloc:
> >  	kfree(sg);
> >  	return ERR_PTR(ret);
> >  }
> > @@ -143,6 +157,7 @@ static void release_udmabuf(struct dma_buf *buf)
> >
> >  	for (pg =3D 0; pg < ubuf->pagecount; pg++)
> >  		put_page(ubuf->pages[pg]);
> > +	kfree(ubuf->offsets);
> >  	kfree(ubuf->pages);
> >  	kfree(ubuf);
> >  }
> > @@ -206,7 +221,9 @@ static long udmabuf_create(struct miscdevice
> *device,
> >  	struct udmabuf *ubuf;
> >  	struct dma_buf *buf;
> >  	pgoff_t pgoff, pgcnt, pgidx, pgbuf =3D 0, pglimit;
> > -	struct page *page;
> > +	struct page *page, *hpage =3D NULL;
> > +	pgoff_t hpoff, chunkoff, maxchunks;
> > +	struct hstate *hpstate;
> >  	int seals, ret =3D -EINVAL;
> >  	u32 i, flags;
> >
> > @@ -242,7 +259,7 @@ static long udmabuf_create(struct miscdevice
> *device,
> >  		if (!memfd)
> >  			goto err;
> >  		mapping =3D memfd->f_mapping;
> > -		if (!shmem_mapping(mapping))
> > +		if (!shmem_mapping(mapping) &&
> !is_file_hugepages(memfd))
> >  			goto err;
> >  		seals =3D memfd_fcntl(memfd, F_GET_SEALS, 0);
> >  		if (seals =3D=3D -EINVAL)
> > @@ -253,16 +270,56 @@ static long udmabuf_create(struct miscdevice
> *device,
> >  			goto err;
> >  		pgoff =3D list[i].offset >> PAGE_SHIFT;
> >  		pgcnt =3D list[i].size   >> PAGE_SHIFT;
> > +		if (is_file_hugepages(memfd)) {
> > +			if (!ubuf->offsets) {
> > +				ubuf->offsets =3D kmalloc_array(ubuf-
> >pagecount,
> > +							      sizeof(*ubuf-
> >offsets),
> > +							      GFP_KERNEL);
> > +				if (!ubuf->offsets) {
> > +					ret =3D -ENOMEM;
> > +					goto err;
> > +				}
> > +			}
> > +			hpstate =3D hstate_file(memfd);
> > +			hpoff =3D list[i].offset >> huge_page_shift(hpstate);
> > +			chunkoff =3D (list[i].offset &
> > +				    ~huge_page_mask(hpstate)) >>
> PAGE_SHIFT;
> > +			maxchunks =3D huge_page_size(hpstate) >>
> PAGE_SHIFT;
> > +		}
> >  		for (pgidx =3D 0; pgidx < pgcnt; pgidx++) {
> > -			page =3D shmem_read_mapping_page(mapping, pgoff
> + pgidx);
> > -			if (IS_ERR(page)) {
> > -				ret =3D PTR_ERR(page);
> > -				goto err;
> > +			if (is_file_hugepages(memfd)) {
> > +				if (!hpage) {
> > +					hpage =3D
> find_get_page_flags(mapping, hpoff,
> > +
> FGP_ACCESSED);
> > +					if (!hpage) {
> > +						ret =3D -EINVAL;
> > +						goto err;
> > +					}
> > +				}
> > +				get_page(hpage);
>=20
> Is the intention to increase the ref count of the hugetlb page once for
> each 'sub-page' added?  Or, am I reading that incorrectly?
Yes, that's the intention; I figured it makes sense to do it that way.

>=20
> > +				ubuf->pages[pgbuf] =3D hpage;
>=20
> Ah!, answering my own question.  Since the 'head page' is added to the
> array the ref count of the head page will decremented in
> release_udmabuf.
Yes, that's right.

>=20
> > +				ubuf->offsets[pgbuf++] =3D chunkoff <<
> PAGE_SHIFT;
> > +				if (++chunkoff =3D=3D maxchunks) {
> > +					put_page(hpage);
> > +					hpage =3D NULL;
> > +					chunkoff =3D 0;
> > +					hpoff++;
> > +				}
> > +			} else {
> > +				page =3D
> shmem_read_mapping_page(mapping, pgoff + pgidx);
>=20
> It may not matter to your users, but the semantics for hugetlb and shmem
> pages is different.  hugetlb requires the pages exist in the page cache
> while shmem will create/add pages to the cache if necessary.
Ok; got it.

>=20
> > +				if (IS_ERR(page)) {
> > +					ret =3D PTR_ERR(page);
> > +					goto err;
> > +				}
> > +				ubuf->pages[pgbuf++] =3D page;
> >  			}
> > -			ubuf->pages[pgbuf++] =3D page;
> >  		}
> >  		fput(memfd);
> >  		memfd =3D NULL;
> > +		if (hpage) {
> > +			put_page(hpage);
> > +			hpage =3D NULL;
> > +		}
> >  	}
> >
> >  	exp_info.ops  =3D &udmabuf_ops;
> > @@ -287,6 +344,7 @@ static long udmabuf_create(struct miscdevice
> *device,
> >  		put_page(ubuf->pages[--pgbuf]);
> >  	if (memfd)
> >  		fput(memfd);
> > +	kfree(ubuf->offsets);
> >  	kfree(ubuf->pages);
> >  	kfree(ubuf);
> >  	return ret;
> > --
> > 2.39.2
> >
>=20
> Nothing else stands out,
>=20
> Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
Thank you for the quick review!

>=20
> I see there is a RFC for the coherency issue with hole punch.
Yes.

Thanks,
Vivek

> --
> Mike Kravetz
