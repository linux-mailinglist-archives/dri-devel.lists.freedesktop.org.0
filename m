Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C3A7FE942
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 07:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0A310E6B2;
	Thu, 30 Nov 2023 06:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B0610E6B2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 06:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701326475; x=1732862475;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KUzIdPxn4esdezoMz8RoYpiUEe34Y8Jf5EnMcbMPkU4=;
 b=RN/THqFoGVNPf/wzH0c9uiTPZ+HPCkRD/5hXMgLsaZJ92/0git+yU/2e
 rnnvI0nSBSeuaqj0qBq0/My//N6bAHyopSQGpBE/BruDc4PdXIThP1ToK
 ksIz5AZUexPvFsiSHmime3N1lMU8awLh4pnNk1VZSZUxgR5hBpo/rho4Q
 RhQ/6bt3D/MtoxqDhwInwsU4/IhGxiEw2OKz9Bq1pMa8HiPC5J1ey7yah
 QJljJMCWiddJWTXLNwznlgXhUQ6NcFyWR/stXRU5mDREDeSVsUV+fNegf
 8CSSk9JTvOy7C1TrU7fD1QryBZl/HfDKfK0aAWQzBremK5JHPpcwJ9T50 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="397170854"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="397170854"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 22:41:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839705080"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="839705080"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 22:41:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 22:41:13 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 22:41:13 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 22:41:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwiuBmM7DZ2L34/UtcWxaQkMwgn88ahYmSZkFlZmBNbsh1xGbBVfYtXqSoF6mxtRXnWPsi2V61sFr/zObyi6syuVM73Pxo8xL6+9UiNHTRuETayeE6T/e7NHXbcgo6NRMDIXrLk69vltPNICZxXhGjRnpwIoyqM1693kKB44uG8oayuSGDreczWfVG4QMVAjiFa4OncLAEiUljYl1Ot+uQM4rHfT3jgUssHeNoBKzuelQ+SDiwVQCKV5iNwJlV6wKKEncbw9T2tUkgGmu3fzkeZ65BsphvvIlhAiQLRKLuJ7CBlz9HWPw63UYmpoDfCm9g0fWO4gc2KJMkMp838x3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qTkTui+/qB0o9mcC0Lt2WrWNniv8g25gKJvBDHNlgU=;
 b=ajotN4sf1HBPOCHODLJhKgI2IaMkqT2RHL36wO8++IPFtgBn5ltD81NoASw8sJ7ZocwUS+U7lT0b78HNhEwlv4naFq+Hi5U1IT0xpGkYm733aaL2vZXA3Sh9P40vy0aPv0IqSbXeYJo3IQpEvAnk/EgCPNN//Bq/JUrR4dsqclxnRDaGekwJzZM2Bb2v3ujfxtTT4HH3qalnkjPvOVDFH5qRErjhIyz7uvS6RhKSoDuW9nMbY5lnsloEMeu8gAl4YOJtZwNZShXqxyYukVUY4zS9Cm7luWDyHtqks/WTGPcb4uqT2Pc7FiL1yHe1vp3f4sZV5UbT+LPXM8wJLug+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 06:41:11 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b6a:cf27:4d2d:1df4]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b6a:cf27:4d2d:1df4%4]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 06:41:11 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: RE: [PATCH v5 3/5] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages (v5)
Thread-Topic: [PATCH v5 3/5] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages (v5)
Thread-Index: AQHaHdvlPZw62HxLiUyVPBViM70ksLCPemOAgALBB/A=
Date: Thu, 30 Nov 2023 06:41:11 +0000
Message-ID: <IA0PR11MB71857980C94225951F6DD3AAF882A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20231123064443.1035709-1-vivek.kasireddy@intel.com>
 <20231123064443.1035709-4-vivek.kasireddy@intel.com>
 <ZWWvD4B4hurV62gH@infradead.org>
In-Reply-To: <ZWWvD4B4hurV62gH@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|IA1PR11MB6467:EE_
x-ms-office365-filtering-correlation-id: 5ffd7e34-86ae-42fb-9d3c-08dbf16f57b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sS07vKiHxEqobgIiYIlGrtftIR6c9L89ERQEHu+VVb0npVQgctpfuFNXugTt+2KJLgzHUVqUoXQfqjCvH8/0wcZgt7e3jG4ItJ4ax3mbFT9CpjmXFmUhh82cS+5iVqSxl3aZ+me9csCCYJs1iUPmfF2dK6BTOcaI9ETTmmdgKe36YjEUBhqqwmtX7kZ9JuhOyf8leAI9GwhZRMglvRAy7FJFZmQitFmdA6s+G3Wzz7WRRNZc0wNAOKSPFwsTk0uVzhkgD+jBoqHQaT1OR/3Hri68Cvm72/kvBoDzDdkuLNZ7eIw+ifyjcfAxNF2TimpiFCS8Cj9MWEW6Q1cyVo1nOQHTfI2w/qtpmeQ0PNpaMH+BsIxim1DjVBYC1N4MqQw2T50vH6zHdRKK7U+LIrj6lFNncSQG1C6fbgeRBBSuBkJiYLGsbCnJwJkqkeokLTXHASWhCTbl0lG/b4Os4zqyGo+vodHabr5aSGWS+SLK86AHHGx3jWAisqERGg5aIFWAoSwdOlD9GqB3c3oX6VEZ7gEGeYkM+TfXgC7Hpq5oHxEgUXq38NGG9JWXuL5VeEA2DQ/04JOiR49b80G3Y9aCUdZrljp/N6Q8FCnuHv5o0bXWgxbKhLxpfrV572UuQmdgZoOkiKInUcnWph+hj4Bz2hX96dUs9D7Rp2YqeMOIcoQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(136003)(376002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(83380400001)(6506007)(7696005)(9686003)(122000001)(5660300002)(4326008)(8676002)(52536014)(8936002)(41300700001)(7416002)(2906002)(478600001)(316002)(71200400001)(6916009)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(202311291699003)(86362001)(33656002)(38100700002)(82960400001)(38070700009)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7ZhQa4BjuZNTQMfVgnSf4c1DqjTTdMKQTZajrYR3Slsomb+8qCUwyI98Dzoi?=
 =?us-ascii?Q?YRe4ix2JTh0xf2AhYHwFgJcFK5A20H5noJaTF9I0zND3WfI7bZ9a4ZNwBN3v?=
 =?us-ascii?Q?sSYvWpZEFxlgrvRUbc83FikroppeDOGGmOUt+1aG+hkzss2OYWnZJ9CCDEDJ?=
 =?us-ascii?Q?DlW6adoQ747wwhPg7FTx/Wy3cDTm5NiFCRR5sg3beLWV+4vYq0QuMfV3M7Jl?=
 =?us-ascii?Q?jqyC9KxtfzHoK16LHQ96cALo6C56Pfb5suo7W2ff8f0ksPJN7KHygqKK5WXe?=
 =?us-ascii?Q?9XHNEZoMLtRKQnpEnH7WAX+WhM7RJ+kdt7zAJWARnhGYWnaMIpmJeR4KiLSe?=
 =?us-ascii?Q?io6EHzhO010C/+6J6qSQrlGNZyPSJpgfvBEP41EiDzjNppBP0Bo6mnnmAvh6?=
 =?us-ascii?Q?0tB5HRD1781PeSPNvN31btO95H+NvvWQHESCysJcfp4/68cR0v0RU3O6Q6ao?=
 =?us-ascii?Q?xDt7Kh5uXJjtWVUfdfLF0RlFKHkD1MT38U5n0tY6nfs3HZuRDzU2si3VLzB+?=
 =?us-ascii?Q?flF05RlCpIkwwKq+nZM8KdXDtR+KAQbMgGu0n5mq2G4LtdYcFqunTh77gSUV?=
 =?us-ascii?Q?najqKBTWRgwgvlYNFYKA/CDhJERc70kSnkiOZMry6zhG4PNCpSsyT9hOG0b9?=
 =?us-ascii?Q?zdkufmK8c0Nwa1/ggoO1ED1x6Lio+oEuj6mVWVg7FGO1j3dl7CE2PnZOBPyG?=
 =?us-ascii?Q?mNjc1ddW0HHzNzLelJgSWhl7OFvltCJVwlCgd8iaRyuSR1HuCogu4WPPcBR+?=
 =?us-ascii?Q?O6Avd5HC3IUWzNfTy4bXjvDwYCO9KXK1pIQV6F2ShGqpZVYklRygIrLpBo5v?=
 =?us-ascii?Q?WOJ+gqM9fCTa2SOCN0PoVOxMxduLign/LVSX+tGwjOjWRLrxOQdZdIBkjEH9?=
 =?us-ascii?Q?DInLdq7vaCdOPSDbv7TB3OQV0Af4+sEWuCzHLEkssbiRSKe1ard0FTDS0bGj?=
 =?us-ascii?Q?YSxWuNYPGy24IFqHq0+S8tXz30nusitEaX9angHbof1ztH/fpNhLdielTgRm?=
 =?us-ascii?Q?FbRiFfFbWOnEXOxukmnPp7YDagZpwPRpVngO3Fd2XHjNQTUUYiSaSSespz48?=
 =?us-ascii?Q?pUqxeQ32cn5yGDKE4jikUVNN9LV3GQbevl1FLtmMUeAnPCzIUvx4HgCjMqYm?=
 =?us-ascii?Q?Si0/cAR1AvoZugCXBIXcYFGFStwfxbehtHvhocqVbwb16lbxmKHCGJCadS1j?=
 =?us-ascii?Q?NyhwoxYfN2XnPRBFQ2VwF99mu5X7fFN1bc8QIGy9AQ/v8sqfTFHnYjqJrFa7?=
 =?us-ascii?Q?44ANJV28+Qry+Ei7TQxZGB1tSrmCLjjRtHLTlTdwpvDT5Uf7PvEgMv3Hc/SU?=
 =?us-ascii?Q?/3mIYV1zI0QtNCfW6QqlOVSAgvzh3AT6a+P28/chUeUUnnWNBkeRiUvkUkTb?=
 =?us-ascii?Q?juOHQnCaFazfnalevJ0vc+tgOQX5z7bZEmzW8o2BxkmQ4K8gSqi2ai3RmAE2?=
 =?us-ascii?Q?7vioQnuYfYB/rWv4BH/d3DMBcH0q0HD3pxNktsPrePHD8FVeEcdg1vxWqOlC?=
 =?us-ascii?Q?HSuB1Euvwh0kHbE1pOVREett+GzkW6MRDfA6yG2TN/o9965thjddrNiYmWhK?=
 =?us-ascii?Q?xFtKdM4s3VoD8hLPFcGmEGEOVosJmb1GRQum0wB1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffd7e34-86ae-42fb-9d3c-08dbf16f57b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 06:41:11.7615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozBynFmzqHj5FLUOunHsqwXb6/Mg1HMIfoYs6eOCH7Y08zx2emW2T56cKqz1zLCCKUCH3gTGFjJQQgxaHpGbBAcsSlINICHFgnKKc9uf1kQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6467
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason
 Gunthorpe <jgg@nvidia.com>, "Chang, Junxiao" <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph,

>=20
> > +static struct page *alloc_file_page(struct file *file, pgoff_t idx)
>=20
> alloc_file_pages seems like a weird name for something that assumes
> it is called either on a hugetlbfs or shmemfs file (without any
I see your concern. The word "file" does make it look like this API works
with all kinds of files although it is meant to specifically work with file=
s that
belong to shmemfs or hugetlbfs. Since it is intended to work with memfds
in particular, I'll rename this helper alloc_memfd_page(). I think it also
makes sense to do s/file/memfd in this whole patch. Does this sound ok?

> asserts that this is true).  gup.c also seems like a very odd place
> for such a helper.
I only created this helper to cleanly separate lookup and creation and to
reduce the level of indentation in pin_user_pages_fd(). Anyway, would
mm/memfd.c be a more appropriate location?

>=20
> > + * Attempt to pin pages associated with a file that belongs to either
> shmem
> > + * or hugetlb.
>=20
> Why do we need a special case for hugetlb or shmemfs?
As mentioned above, this API is mainly intended for memfds and FWICS,
memfds are backed by files from either shmemfs or hugetlbfs.

>=20
> > +	if (!file)
> > +	    return -EINVAL;
> > +
> > +	if (!shmem_file(file) && !is_file_hugepages(file))
> > +	    return -EINVAL;
>=20
> Indentation is messed up here.
Ok, will fix it in next version.

>=20
> > +		for (i =3D 0; i < nr_pages; i++) {
> > +			/*
> > + 			 * In most cases, we should be able to find the page
> > +			 * in the page cache. If we cannot find it, we try to
> > +			 * allocate one and add it to the page cache.
> > +			 */
> > +retry:
> > +			folio =3D __filemap_get_folio(file->f_mapping,
> > +						    start + i,
> > +						    FGP_ACCESSED, 0);
>=20
> __filemap_get_folio is a very inefficient way to find a
> contiguous range of folios, I'd suggest to look into something that
> batches instead.
Ok, I will try to explore using filemap_get_folios_contig() or other
related APIs to make the lookup more efficient.

>=20
> > +			page =3D IS_ERR(folio) ? NULL: &folio->page;
> > +			if (!page) {
> > +				page =3D alloc_file_page(file, start + i);
> > +				if (IS_ERR(page)) {
> > +					ret =3D PTR_ERR(page);
> > +					if (ret =3D=3D -EEXIST)
> > +						goto retry;
> > +					goto err;
> > +				}
>=20
> This mix of folios and pages is odd.  Especially as hugetlbfs by
> definitions uses large folios.
Yeah, it does look odd but I ultimately need a list of pages to call
check_and_migrate_movable_pages() and also to populate a scatterlist.

Thanks,
Vivek

