Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 733F276E2E3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF8F10E5C7;
	Thu,  3 Aug 2023 08:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0200510E5C7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691051078; x=1722587078;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ilpNdIf5mKcZJVXhdpWivk02c8CeIPE2MEHSF778Ro8=;
 b=UO3FZlU9wR463K0q2L5w66rx09FIJxYFIQqzvyreL5AjnZrEqXGJS9FR
 mtPFdrhhm0wZZwhstq7HlIIaEMhQ5XaLRvsiMeLUDJBPlaSGzoazZN11Q
 Ky1G1/LlqE+7CNyD+iFydL1n6ChmJxXhF97ttN3JFPGDvWsAWoVoeSoe3
 1nlECePxPzg8cv1TdjOThnBQ7CHewZCEWLmsJfgb9pm87fnTAgdDE9GK/
 oVCzwYvm4uX+dyiRPjj13yC7jFZzPdQuPy45IfoL2mrf4gfMt/OqL9JzS
 zeJxjwjCdHByeCB7mzfXS6wF+D7lNe5MPj26rQzRYFJBnCF8WeYHCz9dF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="456185020"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="456185020"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 01:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="729488156"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="729488156"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 03 Aug 2023 01:24:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 01:24:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 01:24:10 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 01:24:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNxsvAODuAWT9mcSM1Jlg3YKW3hG/NUGtEnQYxiIOF2S7ToNSczb+P3aEEs7BOD9FCjDUoJ5BlrFSYzJwbx4CmGMXRy+vYod0bgt2zVgO9tKM947j91JozzJWSHBaADGMa/D7+T2HBryNW29JcA5YnwK/hN+nTe38TLMbw50bJZS0Nd11dBECS7edvPSqCsgnO4Yo/jdt8Be3RoLoT45ES3Hz0OGbj/1R+9SqBdZF1UAWq++M/pJ2yi/HT0BEuXx2cvkB8G8CibjvKR2yuDjHKub5qJyEL7TGwO0cZVCX1uJ/brp9Jh4ztHIjRQKV+ahllmkqkYZU7zieelktv6sdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zecacBuYWmcA5cZnO1nAdHlixZ4RMhB4qu9spiq0APA=;
 b=UxhiKnO9lfmCnDOnGicjexujzB5G28l+40ah0WDJrzuPcXPtx4cs/SrvTigBrGcki+ULzGRsYaI1vlxQ45FQYHSJKVC6FKV2QTVXwiV6nsOaE5Ejn00ebAczvG7gCejrwDMhuoh4GHqYIAf2GZnZ79qSs/aXuhfW6JBCIcfCmn9kxA/0vLPbwyg7qqI+Fi9VlHMZiRgMScA508ld1gBy/d59I3hUohbKIp3i+lRABfQugX3yqaXioAzciAtt+brTM2x+YSS4pbovPh/YeMAIYdrJ0jvxX3R5YcTTeM5HJpVgJffFW2IkQ3eK2ggJ1xouM5MHk8o4Bp62+XsBcKcSBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DS7PR11MB6102.namprd11.prod.outlook.com (2603:10b6:8:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 08:24:08 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 08:24:07 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [RFC v1 2/3] udmabuf: Replace pages when there is
 FALLOC_FL_PUNCH_HOLE in memfd
Thread-Topic: [RFC v1 2/3] udmabuf: Replace pages when there is
 FALLOC_FL_PUNCH_HOLE in memfd
Thread-Index: AQHZuVTo+khzFwhEcE6+PnqKvjULIa/XCmUAgADe4AA=
Date: Thu, 3 Aug 2023 08:24:07 +0000
Message-ID: <IA0PR11MB7185DFC97B8234F4F46B42F9F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-3-vivek.kasireddy@intel.com>
 <ZMpOwgUgYLplUc1j@phenom.ffwll.local>
In-Reply-To: <ZMpOwgUgYLplUc1j@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DS7PR11MB6102:EE_
x-ms-office365-filtering-correlation-id: cbb51c4a-e5e8-4d21-9042-08db93fb017a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9G1f19zrcG19xadYo0BlqIB6bt7aGNFvC0T1FNMTNTt3BJmJHi5RcdcnC0XcicZnNkuZzD/uiSZkuzktO6q30g2jYaWNKzr8NnoPQ0HC+eMUudjUHL7HynJs6xhBPWjeLcwnBVKjAmJ5wsDfOQPSIcTMTNOL6MprDBQa65P3lPMJ2fQUIcTlzw0wEaW3zGNB3sAaV8OEebHkmj8m+859UajrgrSsz1OGueUrhjxr/RAg3dJdKcP0ShKjnT/yDZ0ozFZZ1CwwH4DQ27rnxbi7nd9iex9+YPQU/bl+fbAPbEMxoDz8ybAhx7B74mqmMtm2RoiN5alcbqNqvv8yWGzzbYqo0jejMjjo6c8cV5G7J9ZNfJbn1In1s91Fvdt7n//yGTOHauzdXd8B+cK1ibdAqZn0nI29hMPipEm2/PMs2IxrjfynnlGPPq3ro6TsTpeWwAShvvRB0b/Ga4ykSUHyoAbZTaHGK73qM9oePj5rZqd7s8/0s9Fxiu5+GUWXTK/lNkyaiLF1weqcp6Cnqr2Vb+gWxYSoPpnbhucYUn7LE5v8r+YC3oEpXlz0i4Bu0Yn+YuKOtTqhH1puZvbsfQnIUYkZAJSAZclFucbmsncCFds=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(83380400001)(6506007)(26005)(186003)(41300700001)(52536014)(30864003)(2906002)(66946007)(76116006)(4326008)(64756008)(66446008)(66476007)(66556008)(5660300002)(6916009)(316002)(8676002)(8936002)(7696005)(71200400001)(966005)(9686003)(478600001)(54906003)(55016003)(38100700002)(122000001)(82960400001)(33656002)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o/vwoXKEWDBakpI9w+ZEbKp0IW61Dzh5YQqPNfeL5JTlf57uX/zjj08mqSFm?=
 =?us-ascii?Q?TDttTEaNqSacyTXQ9iuHAiU6nIPGigSEj5BEc/TSqOhEHuH55IPfzjFKVg7t?=
 =?us-ascii?Q?7Dc6yfVFD/q5Dscsv8xd4yAaisbyQn5bpj+Ef3EOw7atF47IczrbwimOD1iD?=
 =?us-ascii?Q?P1mL8p8FxgxdRVdaxdDQZyNTOnIscT5BB7wjJDP+GLSY+bpSPXHfPSb1i5j5?=
 =?us-ascii?Q?qhfNtmmEPR7Q6RGsUg578RKxmMzIpXc1jPbiIE3objERClzZsQ4PscSMtvLP?=
 =?us-ascii?Q?DOrOfaMx3QVvoCFrJxoAz7i0HxXEIW3fsztw1LRVwoPOAWP1Sm65kpi4Yd+F?=
 =?us-ascii?Q?POA9boofebG5Tb6IE0ot3W0eqnbT/WnbKu/NIpYYLe/ULC3qQVbYOxoHuo6g?=
 =?us-ascii?Q?NjWT7tufYlaIFY1Cr1hQHiFssp9iYrj9vuJ14dPb08BTEti/NbIazIt7KMUd?=
 =?us-ascii?Q?j8ncIylc/bgf5I2z9DuiFemRCPGNNo3Foe4G91MveOSVYU1bEtgTMycbubP8?=
 =?us-ascii?Q?CJSS0CtoBrc1HfoYer6Q1d/609m1j6ujtxyS03D5Roi0RyujGhkWbmsFOg1I?=
 =?us-ascii?Q?FTixnDZ/VWSARm97qjv43haOeSEyba5NTtU5btUNRgM3HhXGdpDSzTukzR2t?=
 =?us-ascii?Q?sgAsf0QiZfL00a0sSYomlie5kzUzw3vIo5gh75u2KkDF5ME/FhaO7MREcB0F?=
 =?us-ascii?Q?lWeBzTJFuHMzjZxOALcc9k8Y5jZSnc++OMDqmqWDDyZzeQgIWzrYyArjZog8?=
 =?us-ascii?Q?6Y/LqAO6i/AL+CopyS5QjLVi9S4lHQTAfDheqq87Z8xdHjzNOgZQlHNOEHuX?=
 =?us-ascii?Q?YxJZZduxCFr2AJ/cm8jtLZM+T9yKmEUXeqF4iEH9GuzTEz0jWvWcform02rp?=
 =?us-ascii?Q?oQjbeimT1stKkxevgTUjNJym4xfoZ3IqTkMGGcMCObXA/FfsITh9IhB40Khg?=
 =?us-ascii?Q?CVXfdwNGmZHmlz4uIV/kt58unEVWiU4U9IbwJW2c/IMMzh3LASZvi8fx8TS3?=
 =?us-ascii?Q?MN+/RADsdOPslfaM4RPxAzd1ABkVCaIm3qrdros143/zHbt5Nx72E7ytDvW3?=
 =?us-ascii?Q?RnGIednxTB82gH0MSUYpKK+V/rC02ikP6+tXeEegsHYbh5wJDDkMz7t/YTm9?=
 =?us-ascii?Q?oeH+w23LYKM1TGJd78rPLhkPusuHdMFcon7s6/eiZ0GHOBxZTFrr/7llyzpJ?=
 =?us-ascii?Q?P7xwNm94dYCBGS4Q+wJbiKJMh5bTeKq/uew9NXI/iTNxufCuyk8+CHxyJwj4?=
 =?us-ascii?Q?gJyaanxBMPcsxLepDJpOnBCBzpdr1whiNV+YvPTTArDOqfMHo/+VixCE9b7I?=
 =?us-ascii?Q?lLgHwCm0usnB63hr/+lAm0mjOjDlE0kZ9QnVHu8TY/fl07CuhZopD0Xhs9Nw?=
 =?us-ascii?Q?tGo+u2xcL4oldHgjpTfOBEO94EMZ8UelwpOQ5JS1mUzG3MIFTzM+1NKZpILD?=
 =?us-ascii?Q?O/UOkAC5493i9fq3elIFpTRlKG+8sluzcVvZX4OlxksNqHl2oskitvrEno19?=
 =?us-ascii?Q?4maWtEHwU/ewA+obTwU057szrs4SQp7NhsguDTVqfTdKbPqBamWL3A9WXRVv?=
 =?us-ascii?Q?ko9TBPzR6rgZyI8Ikm3UH1f/ysfv3z4qTTm+6rky?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb51c4a-e5e8-4d21-9042-08db93fb017a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 08:24:07.3816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PcNFWqvr8qybbax4Nv7OmHJgMNys25l9H8gR8cZT1HI1UetGvDtN8zpm0eGmCWkbZ4wGJtKOjWnm8KrG7hN8phHazJVQx/9fFGeR0ro2/ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6102
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

>=20
> On Tue, Jul 18, 2023 at 01:28:57AM -0700, Vivek Kasireddy wrote:
> > When a hole is punched in the memfd or when a page is replaced for
> > any reason, the udmabuf driver needs to get notified in order to
> > update its list of pages with the new page. To accomplish this, we
> > first identify the vma ranges where pages associated with a given
> > udmabuf are mapped to and then register a handler for update_mapping
> > mmu notifier for receiving mapping updates.
> >
> > Once we get notified about a new page faulted in at a given offset
> > in the mapping (backed by shmem or hugetlbfs), the list of pages
> > is updated and we also zap the relevant PTEs associated with the
> > vmas that have mmap'd the udmabuf fd.
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
>=20
> I think the long thread made it clear already, so just for the record:
> This wont work. udmabuf is very intentionally about pin_user_page
> semantics, if you change the underlying mapping, you get to keep all the
> pieces.
>=20
> The _only_ way to make this work by implementing the dma_buf move
> notification infrastructure, and most importers can't cope with such
> dynamic dma-buf. And so most likely will not solve your use-case.
Right, we do have to call move_notify() at some point to let the importers
know about the backing memory changes but as you suggest, unfortunately,
most importers don't handle moves. However, I guess I could try implementin=
g
it in i915 and also add a helper in GEM.

>=20
> Everything else races in a fundamental and unfixable way.
I think there might still be some options to address this use-case in a saf=
e
and race-free way particularly given the fact that with udmabuf driver,
the writes and reads do not occur simultaneously. We use DMA fences
in both the Host and Guest to ensure this synchronization.

Thanks,
Vivek

> -Daniel
>=20
> > ---
> >  drivers/dma-buf/udmabuf.c | 172
> ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 172 insertions(+)
> >
> > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > index 10c47bf77fb5..189a36c41906 100644
> > --- a/drivers/dma-buf/udmabuf.c
> > +++ b/drivers/dma-buf/udmabuf.c
> > @@ -4,6 +4,8 @@
> >  #include <linux/dma-buf.h>
> >  #include <linux/dma-resv.h>
> >  #include <linux/highmem.h>
> > +#include <linux/rmap.h>
> > +#include <linux/mmu_notifier.h>
> >  #include <linux/init.h>
> >  #include <linux/kernel.h>
> >  #include <linux/memfd.h>
> > @@ -30,6 +32,23 @@ struct udmabuf {
> >  	struct sg_table *sg;
> >  	struct miscdevice *device;
> >  	pgoff_t *offsets;
> > +	struct udmabuf_vma_range *ranges;
> > +	unsigned int num_ranges;
> > +	struct mmu_notifier notifier;
> > +	struct mutex mn_lock;
> > +	struct list_head mmap_vmas;
> > +};
> > +
> > +struct udmabuf_vma_range {
> > +	struct file *memfd;
> > +	pgoff_t ubufindex;
> > +	unsigned long start;
> > +	unsigned long end;
> > +};
> > +
> > +struct udmabuf_mmap_vma {
> > +	struct list_head vma_link;
> > +	struct vm_area_struct *vma;
> >  };
> >
> >  static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
> > @@ -42,28 +61,54 @@ static vm_fault_t udmabuf_vm_fault(struct
> vm_fault *vmf)
> >  	if (pgoff >=3D ubuf->pagecount)
> >  		return VM_FAULT_SIGBUS;
> >
> > +	mutex_lock(&ubuf->mn_lock);
> >  	pfn =3D page_to_pfn(ubuf->pages[pgoff]);
> >  	if (ubuf->offsets) {
> >  		pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
> >  	}
> > +	mutex_unlock(&ubuf->mn_lock);
> >
> >  	return vmf_insert_pfn(vma, vmf->address, pfn);
> >  }
> >
> > +static void udmabuf_vm_close(struct vm_area_struct *vma)
> > +{
> > +	struct udmabuf *ubuf =3D vma->vm_private_data;
> > +	struct udmabuf_mmap_vma *mmap_vma;
> > +
> > +	list_for_each_entry(mmap_vma, &ubuf->mmap_vmas, vma_link) {
> > +		if (mmap_vma->vma =3D=3D vma) {
> > +			list_del(&mmap_vma->vma_link);
> > +			kfree(mmap_vma);
> > +			break;
> > +		}
> > +	}
> > +}
> > +
> >  static const struct vm_operations_struct udmabuf_vm_ops =3D {
> >  	.fault =3D udmabuf_vm_fault,
> > +	.close =3D udmabuf_vm_close,
> >  };
> >
> >  static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct
> *vma)
> >  {
> >  	struct udmabuf *ubuf =3D buf->priv;
> > +	struct udmabuf_mmap_vma *mmap_vma;
> >
> >  	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) =3D=3D 0)
> >  		return -EINVAL;
> >
> > +	mmap_vma =3D kmalloc(sizeof(*mmap_vma), GFP_KERNEL);
> > +	if (!mmap_vma)
> > +		return -ENOMEM;
> > +
> >  	vma->vm_ops =3D &udmabuf_vm_ops;
> >  	vma->vm_private_data =3D ubuf;
> >  	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND |
> VM_DONTDUMP);
> > +
> > +	mmap_vma->vma =3D vma;
> > +	list_add(&mmap_vma->vma_link, &ubuf->mmap_vmas);
> > +
> >  	return 0;
> >  }
> >
> > @@ -109,6 +154,7 @@ static struct sg_table *get_sg_table(struct device
> *dev, struct dma_buf *buf,
> >  	if (ret < 0)
> >  		goto err_alloc;
> >
> > +	mutex_lock(&ubuf->mn_lock);
> >  	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i) {
> >  		offset =3D ubuf->offsets ? ubuf->offsets[i] : 0;
> >  		sg_set_page(sgl, ubuf->pages[i], PAGE_SIZE, offset);
> > @@ -116,9 +162,12 @@ static struct sg_table *get_sg_table(struct device
> *dev, struct dma_buf *buf,
> >  	ret =3D dma_map_sgtable(dev, sg, direction, 0);
> >  	if (ret < 0)
> >  		goto err_map;
> > +
> > +	mutex_unlock(&ubuf->mn_lock);
> >  	return sg;
> >
> >  err_map:
> > +	mutex_unlock(&ubuf->mn_lock);
> >  	sg_free_table(sg);
> >  err_alloc:
> >  	kfree(sg);
> > @@ -157,6 +206,9 @@ static void release_udmabuf(struct dma_buf *buf)
> >
> >  	for (pg =3D 0; pg < ubuf->pagecount; pg++)
> >  		put_page(ubuf->pages[pg]);
> > +
> > +	mmu_notifier_unregister(&ubuf->notifier, ubuf->notifier.mm);
> > +	kfree(ubuf->ranges);
> >  	kfree(ubuf->offsets);
> >  	kfree(ubuf->pages);
> >  	kfree(ubuf);
> > @@ -208,6 +260,93 @@ static const struct dma_buf_ops udmabuf_ops =3D {
> >  	.end_cpu_access    =3D end_cpu_udmabuf,
> >  };
> >
> > +static void invalidate_mmap_vmas(struct udmabuf *ubuf,
> > +				 struct udmabuf_vma_range *range,
> > +				 unsigned long address, unsigned long size)
> > +{
> > +	struct udmabuf_mmap_vma *vma;
> > +	unsigned long start =3D range->ubufindex << PAGE_SHIFT;
> > +
> > +	start +=3D address - range->start;
> > +	list_for_each_entry(vma, &ubuf->mmap_vmas, vma_link) {
> > +		zap_vma_ptes(vma->vma, vma->vma->vm_start + start,
> size);
> > +	}
> > +}
> > +
> > +static struct udmabuf_vma_range *find_udmabuf_range(struct udmabuf
> *ubuf,
> > +						    unsigned long address)
> > +{
> > +	struct udmabuf_vma_range *range;
> > +	int i;
> > +
> > +	for (i =3D 0; i < ubuf->num_ranges; i++) {
> > +		range =3D &ubuf->ranges[i];
> > +		if (address >=3D range->start && address < range->end)
> > +			return range;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +static void update_udmabuf(struct mmu_notifier *mn, struct mm_struct
> *mm,
> > +			   unsigned long address, unsigned long pfn)
> > +{
> > +	struct udmabuf *ubuf =3D container_of(mn, struct udmabuf, notifier);
> > +	struct udmabuf_vma_range *range =3D find_udmabuf_range(ubuf,
> address);
> > +	struct page *old_page, *new_page;
> > +	pgoff_t pgoff, pgshift =3D PAGE_SHIFT;
> > +	unsigned long size =3D 0;
> > +
> > +	if (!range || !pfn_valid(pfn))
> > +		return;
> > +
> > +	if (is_file_hugepages(range->memfd))
> > +		pgshift =3D huge_page_shift(hstate_file(range->memfd));
> > +
> > +	mutex_lock(&ubuf->mn_lock);
> > +	pgoff =3D range->ubufindex + ((address - range->start) >> pgshift);
> > +	old_page =3D ubuf->pages[pgoff];
> > +	new_page =3D pfn_to_page(pfn);
> > +
> > +	do {
> > +		ubuf->pages[pgoff] =3D new_page;
> > +		get_page(new_page);
> > +		put_page(old_page);
> > +		size +=3D PAGE_SIZE;
> > +	} while (ubuf->pages[++pgoff] =3D=3D old_page);
> > +
> > +	mutex_unlock(&ubuf->mn_lock);
> > +	invalidate_mmap_vmas(ubuf, range, address, size);
> > +}
> > +
> > +static const struct mmu_notifier_ops udmabuf_update_ops =3D {
> > +	.update_mapping =3D update_udmabuf,
> > +};
> > +
> > +static struct vm_area_struct *find_guest_ram_vma(struct udmabuf *ubuf,
> > +						 struct mm_struct
> *vmm_mm)
> > +{
> > +	struct vm_area_struct *vma =3D NULL;
> > +	MA_STATE(mas, &vmm_mm->mm_mt, 0, 0);
> > +	unsigned long addr;
> > +	pgoff_t pg;
> > +
> > +	mas_set(&mas, 0);
> > +	mmap_read_lock(vmm_mm);
> > +	mas_for_each(&mas, vma, ULONG_MAX) {
> > +		for (pg =3D 0; pg < ubuf->pagecount; pg++) {
> > +			addr =3D page_address_in_vma(ubuf->pages[pg], vma);
> > +			if (addr =3D=3D -EFAULT)
> > +				break;
> > +		}
> > +		if (addr !=3D -EFAULT)
> > +			break;
> > +	}
> > +	mmap_read_unlock(vmm_mm);
> > +
> > +	return vma;
> > +}
> > +
> >  #define SEALS_WANTED (F_SEAL_SHRINK)
> >  #define SEALS_DENIED (F_SEAL_WRITE)
> >
> > @@ -218,6 +357,7 @@ static long udmabuf_create(struct miscdevice
> *device,
> >  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> >  	struct file *memfd =3D NULL;
> >  	struct address_space *mapping =3D NULL;
> > +	struct vm_area_struct *guest_ram;
> >  	struct udmabuf *ubuf;
> >  	struct dma_buf *buf;
> >  	pgoff_t pgoff, pgcnt, pgidx, pgbuf =3D 0, pglimit;
> > @@ -252,6 +392,13 @@ static long udmabuf_create(struct miscdevice
> *device,
> >  		goto err;
> >  	}
> >
> > +	ubuf->ranges =3D kmalloc_array(head->count, sizeof(*ubuf->ranges),
> > +				    GFP_KERNEL);
> > +	if (!ubuf->ranges) {
> > +		ret =3D -ENOMEM;
> > +		goto err;
> > +	}
> > +
> >  	pgbuf =3D 0;
> >  	for (i =3D 0; i < head->count; i++) {
> >  		ret =3D -EBADFD;
> > @@ -270,6 +417,8 @@ static long udmabuf_create(struct miscdevice
> *device,
> >  			goto err;
> >  		pgoff =3D list[i].offset >> PAGE_SHIFT;
> >  		pgcnt =3D list[i].size   >> PAGE_SHIFT;
> > +		ubuf->ranges[i].ubufindex =3D pgbuf;
> > +		ubuf->ranges[i].memfd =3D memfd;
> >  		if (is_file_hugepages(memfd)) {
> >  			if (!ubuf->offsets) {
> >  				ubuf->offsets =3D kmalloc_array(ubuf-
> >pagecount,
> > @@ -299,6 +448,7 @@ static long udmabuf_create(struct miscdevice
> *device,
> >  				get_page(hpage);
> >  				ubuf->pages[pgbuf] =3D hpage;
> >  				ubuf->offsets[pgbuf++] =3D chunkoff <<
> PAGE_SHIFT;
> > +
> >  				if (++chunkoff =3D=3D maxchunks) {
> >  					put_page(hpage);
> >  					hpage =3D NULL;
> > @@ -334,6 +484,25 @@ static long udmabuf_create(struct miscdevice
> *device,
> >  		goto err;
> >  	}
> >
> > +	guest_ram =3D find_guest_ram_vma(ubuf, current->mm);
> > +	if (!guest_ram)
> > +		goto err;
> > +
> > +	ubuf->notifier.ops =3D &udmabuf_update_ops;
> > +	ret =3D mmu_notifier_register(&ubuf->notifier, current->mm);
> > +	if (ret)
> > +		goto err;
> > +
> > +	ubuf->num_ranges =3D head->count;
> > +	for (i =3D 0; i < ubuf->num_ranges; i++) {
> > +		page =3D ubuf->pages[ubuf->ranges[i].ubufindex];
> > +		ubuf->ranges[i].start =3D page_address_in_vma(page,
> guest_ram);
> > +		ubuf->ranges[i].end =3D ubuf->ranges[i].start + list[i].size;
> > +	}
> > +
> > +	INIT_LIST_HEAD(&ubuf->mmap_vmas);
> > +	mutex_init(&ubuf->mn_lock);
> > +
> >  	flags =3D 0;
> >  	if (head->flags & UDMABUF_FLAGS_CLOEXEC)
> >  		flags |=3D O_CLOEXEC;
> > @@ -344,6 +513,9 @@ static long udmabuf_create(struct miscdevice
> *device,
> >  		put_page(ubuf->pages[--pgbuf]);
> >  	if (memfd)
> >  		fput(memfd);
> > +	if (ubuf->notifier.mm)
> > +		mmu_notifier_unregister(&ubuf->notifier, ubuf-
> >notifier.mm);
> > +	kfree(ubuf->ranges);
> >  	kfree(ubuf->offsets);
> >  	kfree(ubuf->pages);
> >  	kfree(ubuf);
> > --
> > 2.39.2
> >
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
