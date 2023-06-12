Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDD772B871
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 09:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02ED210E1A5;
	Mon, 12 Jun 2023 07:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5CB10E1A5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 07:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686553838; x=1718089838;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NX78KoAGcZV03sQFyZkghN4s/Iewg+Ic9njWNM/x+lQ=;
 b=crIsHpefLnjhxYNUc+2ObTsN0X+tFm2wI+TGGqtqfSYn9SFBSICQKgd8
 gNtui+ZFMDP7jq/mEMeEloTw5zNxuH2/ir+UxuRsksJem1wlbzMO271OJ
 uVgfJfE/tpyrsEST78FEeL1UXZrWVvhhNnbn5ZJsLuIj94fAVm5vRGVFB
 F/97Drmyb9/XBL9I4ESU/b+7RX9RkcTWSHd22sVEwwRyqmrdo1mAAMH+c
 sZSmfFWfM5Wi9L3QA/LFSQSXBrNQ9/ZvF1ejKX3urbRGPv9kXUC2O3pAg
 UBIdeMPYiRO4fV0hd5pl7IBt3G02xJwv6oUlg3Y2rsbLqlakj6nKXooHw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="444338654"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="444338654"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 00:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="885311789"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="885311789"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 12 Jun 2023 00:10:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 00:10:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 00:10:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 00:10:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 00:10:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I48wR7FF/pXqE+1ZJP4u3QBmN9cYo11CiffI6PgZTnPlXBQCxdVisHNtQ+e57EOBZ5PbgC5i6fbPzzB4thCVpOiHG/bpfFC7Ao6omyI/LYg6eapG8NQggYlyKNMACFxdVlPpPnZpVbTLqivkD2w1Py8+mGEUoBoPw1L3mcPK16+yLqBC6eQnSFobvPdjVcEdHrN1ecX3z/dHFLVgX8undsOMsFUB1cZtzMJKCAoWjr36xg4KkUXl21FEgStE0otQfbYWNinGvoicNDuRsHY1u/R1A7JpM9H7ZLHR9/btk9snE4GioZFV3x6QfP9g34gEz48wPt9nl+QpeY1Hw+Op7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/Mcbjjr3Ed+krlvUTzCC+F3BCZ40Lw5baXtLyOeHXo=;
 b=U8pkRHUaIxPA/vwYL9bsCbwhj4bW2342vYe9YpgbmT9USUIc12iM0HinHkrhJT9EoZqbUEaJgB7GmIsWN81xzcZxOKrtcdSZa9zKioGxmgyx4a+5oafr1Ns1ZJyfmQBDd3QyTAOMNOcdc4GvHz3sgI13SxuW3nK4wCKFgIy/Yo4tweTaMn2H8txVEg+X5M9dBA7msUYXqBQ5qpgaiSpW1Emsz0cDxcwIMaloMiqFdTHGWUUw0l3Vz/xrfVs396WEbF06rUc00gSsP0j0CsSDWpPk6DSzUTC4MlKjC2dtkwwj/X7Zg6zfnW59qKtpfBFmcCLz5gZ4aCACdZb8iYa2oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DM4PR11MB7277.namprd11.prod.outlook.com (2603:10b6:8:10b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 07:10:32 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::f53b:825:ff13:190a]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::f53b:825:ff13:190a%5]) with mapi id 15.20.6455.043; Mon, 12 Jun 2023
 07:10:31 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Mike Kravetz <mike.kravetz@oracle.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] udmabuf: revert 'Add support for mapping hugepages (v4)'
Thread-Topic: [PATCH] udmabuf: revert 'Add support for mapping hugepages (v4)'
Thread-Index: AQHZmkrTMFwnMH2R1EGnnRur83Hw9a+FyCfg
Date: Mon, 12 Jun 2023 07:10:31 +0000
Message-ID: <IA0PR11MB71851B64A5E7062E3BDD8D2FF854A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230608204927.88711-1-mike.kravetz@oracle.com>
In-Reply-To: <20230608204927.88711-1-mike.kravetz@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DM4PR11MB7277:EE_
x-ms-office365-filtering-correlation-id: 618af00f-7693-4ee0-f1be-08db6b141c2f
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UstuGTaWFKFQHUKqK7otf4fRhN4bCTWUBRgpidL9fe84ZGNHbagwZGGDeJJIPWemRYaB2OgqO/UopO+CUaVh5k7sj2cShtWeTPgDM/y6zmT9i/15Vwxac+2Yoz5RBjYj/TtM/K04hAWx0HdQwmJpecspipI3aC6KzTKVTpbEQ0pfp2BgmzZTZD35CBNNva4udWwcnOnnE6F7R5kTDIongZOrOykoFpF1WOSdp80sDv5Y/QSa1+IllA61mjNirHC6ry+7rZRda9v1k89UA7NRJC8sXUT2t+vtQhiiBb7+0IxyQNONW8oFpGmWSbXOQEo7ccF/Rft+mDAcqpxt+Qm5XudW2ksU/uDcDVYpU/ttMb0JBvaDbw7cCaQx6/z4KDpWSs6fMbhA0nSY7vxiB+zQDplW0VAd+KQ8vWqnIAJkOZsK2Uxsps35yPWN6CgMey9rLkgj3t2StSlUQqTPJoxpJvv7B1bjXBAb2FMkVUc+jtjfRCcztzyoxRzpf9sMRIUba7W1vogd7O6/VkjODC3hekfVE9bVeAeGDJ8PUDMp3SuIzTK7olYD24zFrhJXdf6DJmlFHpQm03jis6L0vcLZY+/WWbJ9+e9ibNmzUW1lkLg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(39860400002)(346002)(136003)(396003)(451199021)(38100700002)(55016003)(26005)(52536014)(5660300002)(41300700001)(9686003)(6506007)(186003)(33656002)(7416002)(316002)(66476007)(66946007)(66556008)(966005)(8936002)(71200400001)(64756008)(478600001)(83380400001)(54906003)(76116006)(66446008)(8676002)(110136005)(86362001)(2906002)(38070700005)(122000001)(7696005)(82960400001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i3z6OsjCkbyDO7lnKLdNG9JJUA0LDoXqR+42TmzwNQPni/pCso679nlKpkrC?=
 =?us-ascii?Q?wJTHCBmg+e6cSH5/ngeDIiabzFmumVljTMWhzy03N/HU6VGxX9t6oYlQ0Egq?=
 =?us-ascii?Q?hhGKkxDNDw/jtz36m5pOgu8T7yQl1f5UhzhUkQSrIDYijBkLgvs1TAeJL2hF?=
 =?us-ascii?Q?QVt1UBTX+/el9q/dUE1+0fWriNeGbItruqutL0rqbGOvR5AxLB0lg78yMFXT?=
 =?us-ascii?Q?GDelzFgklSVjGrqSVHsRSJesQYi2bshAdpeIdQgiOriVfdX3vg4uCA3auhVP?=
 =?us-ascii?Q?cit/L7i6MqCwjmzCWgTdmg3gKIJfWmpe5riB23FNzHXUh4slxsRkQyWd3A4A?=
 =?us-ascii?Q?G6z3sjRHfgFjM3sQp94254akmdBbCDn5snkGxbfGSBWSCfS3RNhEf/Nydz6w?=
 =?us-ascii?Q?IcFgzFhIBbR0DXptjlAGGzltWWYHpOiRvvM/DMiJ/zZYlqFelMQBqLP5zJGr?=
 =?us-ascii?Q?pyCVTNPj1uG3c/uLs7vvWCp9HJ7GsGfirTLZ4273Qk41Q32wIqfHFrHmSfzw?=
 =?us-ascii?Q?yRCsFj4WL1p92rDVGS5mOB1Ixv17TyHIIFCT2N3Ptr5xLsmAurci62/t5Ua4?=
 =?us-ascii?Q?HPzbOKBa+QW5liSF512t2YQjsL1zJwvjOBYW1b+dvqqDydECmexFk+L68Azn?=
 =?us-ascii?Q?VNNkjTNXrqmFjVyhMFFORUFFX4+afbTalTCmn5GKq19n4ah8EBjxLeMtYdSP?=
 =?us-ascii?Q?nPTfMCerShiPcIW4ERflAvfd0pQRegIIle+FSAstuNYnRPU2QHWoRXGnE+u/?=
 =?us-ascii?Q?1btNxaE4BdhoVcy5GE29XaHYunZE/8ARM++ZB9UvOUL6qWGpVfN+734x3SV0?=
 =?us-ascii?Q?1IT+x7IHQMWcBOSOvymhqLJMdQl6DhK4gxEpbyz9jHG2/8Cjr5XegbeiYV5u?=
 =?us-ascii?Q?8owv+/ARdjYOteMDZY0PYjkPu5zWf3H2HKAVk/97Wec1eEtJrmse6z3kkF4C?=
 =?us-ascii?Q?t3E3BsYecYtAoyDITy1dewL+0eNNicGrzlcilD5szT3ouiijHiPxipCQ92lR?=
 =?us-ascii?Q?NyE7l3LrStedwDoibWqTqHLJsRdaSIe3QrPH169lwrQ9tdwtME76yVw5ITJF?=
 =?us-ascii?Q?k41ociDXI5NqKSZh6MVKdTAMiq9HRtJE+LZk/whx9/tmmSi7Tu1SPMcqbrJG?=
 =?us-ascii?Q?Rs5/pdDzvVfgc0sn8zCTnWeR/lL80TJNG5CEBb7HIo7+do0jrbcHSE8quVok?=
 =?us-ascii?Q?Q+DloOQWawcrd7H5iOVr+fg2UC+l4v3LNge0Bf3Kpl1jglOFUcDYDXciCxjk?=
 =?us-ascii?Q?jT2MFpOEwJh4leRF2eZ74VIpjnlW896AWYjet3kWgxs+NKbRPJWZuc+M6R0o?=
 =?us-ascii?Q?irbzkqB2EPZKxbeHldvLX9NVroLAtFPAQOvtsJLYXiu4BBPswAboSUEnm2m6?=
 =?us-ascii?Q?8fKCqkmg1VocX+hn3W3jJA9Nsb0+tSXf1DrhjSFB9B5ymfEAvHXbDK8Ltv5A?=
 =?us-ascii?Q?9uL2YhC+Zp4lO1NrldYhfzBgEaDZDr/g2vpfvVeZTZLjgDSmaXbJNBjl4eFm?=
 =?us-ascii?Q?MvhK6omtTLLJIxj7miFoVx8c8XpNmT28MFLQVMlyNZmagLID07/4xzpIxJGm?=
 =?us-ascii?Q?IqwnOaTnsy9GMyRLZ+9cco6r4PiAC4RIUdUve+AA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618af00f-7693-4ee0-f1be-08db6b141c2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 07:10:31.9008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R7yC/b/VYDxDLlJIq2z6W9poTWejau7viooo8BYerOowLzaO10K1492RBvsfNNxufc22JidnXCgHooMRmxDlsI/x1lmBcrODw0dMRrg7WRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7277
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
Cc: "Hocko, Michal" <mhocko@suse.com>,
 "jmarchan@redhat.com" <jmarchan@redhat.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>, David
 Hildenbrand <david@redhat.com>, "Chang, Junxiao" <junxiao.chang@intel.com>,
 "muchun.song@linux.dev" <muchun.song@linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 James Houghton <jthoughton@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mike,

Sorry for the late reply; I just got back from vacation.
If it is unsafe to directly use the subpages of a hugetlb page, then revert=
ing
this patch seems like the only option for addressing this issue immediately=
.
So, this patch is
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

As far as the use-case is concerned, there are two main users of the udmabu=
f
driver: Qemu and CrosVM VMMs. However, it appears Qemu is the only one
that uses hugetlb pages (when hugetlb=3Don is set) as the backing store for
Guest (Linux, Android and Windows) system memory. The main goal is to
share the pages associated with the Guest allocated framebuffer (FB) with
the Host GPU driver and other components in a zero-copy way. To that end,
the guest GPU driver (virtio-gpu) allocates 4k size pages (associated with
the FB) and pins them before sharing the (guest) physical (or dma) addresse=
s
(and lengths) with Qemu. Qemu then translates the addresses into file
offsets and shares these offsets with udmabuf.=20

The udmabuf driver obtains the pages associated with the file offsets and
uses these pages to eventually populate a scatterlist. It also creates a=20
dmabuf fd and acts as the exporter. AFAIK, it should be possible to populat=
e
the scatterlist with physical/dma addresses (of huge pages) instead of usin=
g
subpages but this might limit the capabilities of some (dmabuf) importers.
I'll try to figure out a solution using physical/dma addresses and see if i=
t
works as expected, and will share the patch on linux-mm to request
feedback once it is ready.

Thanks,
Vivek

>=20
> This effectively reverts commit 16c243e99d33 ("udmabuf: Add support
> for mapping hugepages (v4)").  Recently, Junxiao Chang found a BUG
> with page map counting as described here [1].  This issue pointed out
> that the udmabuf driver was making direct use of subpages of hugetlb
> pages.  This is not a good idea, and no other mm code attempts such use.
> In addition to the mapcount issue, this also causes issues with hugetlb
> vmemmap optimization and page poisoning.
>=20
> For now, remove hugetlb support.
>=20
> If udmabuf wants to be used on hugetlb mappings, it should be changed to
> only use complete hugetlb pages.  This will require different alignment
> and size requirements on the UDMABUF_CREATE API.
>=20
> [1] https://lore.kernel.org/linux-mm/20230512072036.1027784-1-
> junxiao.chang@intel.com/
>=20
> Fixes: 16c243e99d33 ("udmabuf: Add support for mapping hugepages (v4)")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>  drivers/dma-buf/udmabuf.c | 47 +++++----------------------------------
>  1 file changed, 6 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 01f2e86f3f7c..12cf6bb2e3ce 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -12,7 +12,6 @@
>  #include <linux/shmem_fs.h>
>  #include <linux/slab.h>
>  #include <linux/udmabuf.h>
> -#include <linux/hugetlb.h>
>  #include <linux/vmalloc.h>
>  #include <linux/iosys-map.h>
>=20
> @@ -207,9 +206,7 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	struct udmabuf *ubuf;
>  	struct dma_buf *buf;
>  	pgoff_t pgoff, pgcnt, pgidx, pgbuf =3D 0, pglimit;
> -	struct page *page, *hpage =3D NULL;
> -	pgoff_t subpgoff, maxsubpgs;
> -	struct hstate *hpstate;
> +	struct page *page;
>  	int seals, ret =3D -EINVAL;
>  	u32 i, flags;
>=20
> @@ -245,7 +242,7 @@ static long udmabuf_create(struct miscdevice
> *device,
>  		if (!memfd)
>  			goto err;
>  		mapping =3D memfd->f_mapping;
> -		if (!shmem_mapping(mapping) &&
> !is_file_hugepages(memfd))
> +		if (!shmem_mapping(mapping))
>  			goto err;
>  		seals =3D memfd_fcntl(memfd, F_GET_SEALS, 0);
>  		if (seals =3D=3D -EINVAL)
> @@ -256,48 +253,16 @@ static long udmabuf_create(struct miscdevice
> *device,
>  			goto err;
>  		pgoff =3D list[i].offset >> PAGE_SHIFT;
>  		pgcnt =3D list[i].size   >> PAGE_SHIFT;
> -		if (is_file_hugepages(memfd)) {
> -			hpstate =3D hstate_file(memfd);
> -			pgoff =3D list[i].offset >> huge_page_shift(hpstate);
> -			subpgoff =3D (list[i].offset &
> -				    ~huge_page_mask(hpstate)) >>
> PAGE_SHIFT;
> -			maxsubpgs =3D huge_page_size(hpstate) >>
> PAGE_SHIFT;
> -		}
>  		for (pgidx =3D 0; pgidx < pgcnt; pgidx++) {
> -			if (is_file_hugepages(memfd)) {
> -				if (!hpage) {
> -					hpage =3D
> find_get_page_flags(mapping, pgoff,
> -
> FGP_ACCESSED);
> -					if (!hpage) {
> -						ret =3D -EINVAL;
> -						goto err;
> -					}
> -				}
> -				page =3D hpage + subpgoff;
> -				get_page(page);
> -				subpgoff++;
> -				if (subpgoff =3D=3D maxsubpgs) {
> -					put_page(hpage);
> -					hpage =3D NULL;
> -					subpgoff =3D 0;
> -					pgoff++;
> -				}
> -			} else {
> -				page =3D
> shmem_read_mapping_page(mapping,
> -							       pgoff + pgidx);
> -				if (IS_ERR(page)) {
> -					ret =3D PTR_ERR(page);
> -					goto err;
> -				}
> +			page =3D shmem_read_mapping_page(mapping, pgoff
> + pgidx);
> +			if (IS_ERR(page)) {
> +				ret =3D PTR_ERR(page);
> +				goto err;
>  			}
>  			ubuf->pages[pgbuf++] =3D page;
>  		}
>  		fput(memfd);
>  		memfd =3D NULL;
> -		if (hpage) {
> -			put_page(hpage);
> -			hpage =3D NULL;
> -		}
>  	}
>=20
>  	exp_info.ops  =3D &udmabuf_ops;
> --
> 2.40.1

