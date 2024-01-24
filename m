Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A8383B566
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 00:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE68510EAA7;
	Wed, 24 Jan 2024 23:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3861A10EAA7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 23:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706137549; x=1737673549;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7jINl0NlSVpOhfgNa6RkaA2snFtv7PMT1hnkHhlusoA=;
 b=AMF9B20vgkSlPgkqzTH2bBJI2WJYbVVYmTYqvK34uMHwSgdNycPUr3MU
 sNtSnzvXU+VJhBZTXofWWp1d8S9C/dYh8afH8WqXNHE+oxy331+GNvkq0
 ec1slx8QQQYQwYS1hDEZUQsdfK8bEXBv3sEFFfk1SCyvhHypB+Ux9HGAc
 rxHqg2P59b2iX3+XxW+FgkpWipL7qedSzG+aTmP9YK3Qjnz1sr89HZGeN
 934KadWQOQoFwmlSm+GHgcMl06Z0pNoTkoN0OejyJ9ExxLr/wGCIwLV+q
 PXvIJyRBMM5fdLJdNG0kGp3x0MeRe05YTkGeY9wlq0gCKm4OEEOy8q2yl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="399151707"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="399151707"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 15:05:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="856872413"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="856872413"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 15:05:48 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 15:05:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 15:05:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 15:05:47 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 15:05:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9rXs22HYhLl63kekwyAxDQrhMPVpntgmlAsjwTpS0JCG1k74/CVDCHoup5wHS+aUNYfCbj+UDGm+EDV30UGBcL1xmTbTzNLGWHz/XaoKcZEtuhQLCIEEka8CyofNk9Ok8PbMIXvZ48ZGsddm/Zbyw8hiamxUaJ11aSxZSY+z1Srv9e9d6mvrfY+fOysjXxR0Vs2I5DrabiJuAcclO6T+qEVh1cuf7JljZGCvlIhO306anATNhsC/UY5fW9Up+8U5r7fAJExltmEI+/feGi7HciGtAG6Gg/47cwarjDkeaxui6ouY26Qc0SE6GBnHrewkA1s2uc91hrxt4fxB0Qm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLQdpzlcn/dSXYDMJ8PlJ/nENW51mf9d6Id0Cb9GJ7o=;
 b=PJ94u+scDExhLpY4qKHkPtZxmps57sRIk49ma0WZiueT5QYWeWwhGRXlR9atr/hyIr2zLF1Ln1cr6yq/Oa+o+iINTDnHpMgPkXtkiVe2vSmYXaNBAKkyj+tJ9b6SDgRD5VbECi5BGV3mA0rljC24er7l78w+MFTYnkSo3RbUIVC/T9Pw3rgvcfnXkaodIEyzV7i/aH5VQ+Zf/iNGzvsZhDXBK2fFg5LeIm1JUNxXFtpZVQfP7TUEcZqTyYoyxFMFH962XRlPudpTDI/LksByG0M5AJmLal8q+RrgOBNQBOAdA0UxET5pCfemCSmhW2c7hZDqcg5SFwpIb24YIgYSag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH7PR11MB7643.namprd11.prod.outlook.com (2603:10b6:510:27c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 23:05:43 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::cbc8:6370:5df2:b2df]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::cbc8:6370:5df2:b2df%4]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 23:05:43 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Andrew Davis <afd@ti.com>, Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, Paul Cercueil <paul@crapouillou.net>
Subject: RE: [PATCH 2/3] udmabuf: Sync buffer mappings for attached devices
Thread-Topic: [PATCH 2/3] udmabuf: Sync buffer mappings for attached devices
Thread-Index: AQHaTklVj+JfGoUYak+H25iUh1Y+RrDpk0Jg
Date: Wed, 24 Jan 2024 23:05:43 +0000
Message-ID: <IA0PR11MB7185DDD7A972ED546B4CEA10F87B2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240123221227.868341-1-afd@ti.com>
 <20240123221227.868341-2-afd@ti.com>
In-Reply-To: <20240123221227.868341-2-afd@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH7PR11MB7643:EE_
x-ms-office365-filtering-correlation-id: 1cf2527c-609e-47cc-7cad-08dc1d30fde9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 33uEoGOvkkoQ7FGPoHKOCLFHXZbzX40Daxi1SckoFVW1xOTOSEn0scEERs/FkNKv0rnVX8UqcE+ZxLgkfXo5C/KH+5BupkwuaiXvE9Tme045+AkPTSbhHBaHEzY0wG6f1vzzKAaFvGkyaBIkAXyKgPUTRmVciCGmn0RElpcDGKeDFqNzHt8wkQbsYzi3cFJV2Jk5X8bd6PG30OzAizU2fWrBtXlhCcvoOOXjbwctaC1uljzWbWZ4vHvp3fZyJSNROH+pZZdjl/XYMoH7pXwcueJL2b3t8ZJvfp8/tbOdKJpCYTVDf4okm+rB79pjpJxNmqj7YS8yzdqQPeTMc6Cx6uL/scdTJPQkYAHgWFacRKiFUzbGSX+Xa5hUsfZeJR7HCvYrOZj8M1nswsdTkg3FmB2Fy98KLw/8A0HbU10B3z7bG+OZ3ACR604oXxBVnNIO6ZYffB5pCtiMuMLmerdbr6KzyNUrCQRfnnyE7yMxCtK0GejDSOGigv6vj1gvuwES50F1HeuXfTxvJTpBuaXbJ0RlXitgEaVebzqaREFawdl7zblFPS9FHIO8TgrZb9/HMTKG2JgjFdG0SysN/PMahCMMZvB+x5HMPF2+xmPikOj2FCCn1v68/3Wabu6+yyo4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(7696005)(6506007)(2906002)(5660300002)(71200400001)(41300700001)(478600001)(55016003)(8676002)(83380400001)(4326008)(8936002)(52536014)(26005)(54906003)(316002)(66946007)(64756008)(66446008)(76116006)(66556008)(66476007)(110136005)(33656002)(82960400001)(122000001)(38100700002)(86362001)(9686003)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?yZIOI4YWUTZGIYYF94gWtPyk0dGF5c5IGnKWYUuS7kgbhYf02+B8nxdJQt?=
 =?iso-8859-1?Q?NsyMR78dOhEAcsbSWkLZg/8stoGMD5xjDhCjhum49CDek/H49E1haLn6oM?=
 =?iso-8859-1?Q?y3831YgW1MDUyXthtWRKEG+rOQJYjJV57vQghXYoZbo7KVou1Ek778LCHD?=
 =?iso-8859-1?Q?2NDYEXzLDcqy0lV170mHDrlxum2h+6NIRAiuScw9XkQPxJ6uNjjdT7rSbt?=
 =?iso-8859-1?Q?53XEt5f3sZ7AIHKYvFjjftJ/VlLRRlQd09jyY62D2AFWelXo/5VFN79RUZ?=
 =?iso-8859-1?Q?m8Bx0knUVkHoGvUcyVWsZHpncUTglNgw2if9+m3hZbXcicSeY2WYIQ2niv?=
 =?iso-8859-1?Q?b0JPJF3ZJkEnT/FVOPoUnBIBbE3jgGmRuNf5Fd8T41vFWNvXCsyz3s7/Pb?=
 =?iso-8859-1?Q?zAftk7/Scadt+G31s73xuuaxCN5oh61nehvAZKphc2WJYOJRRAxr1JmU58?=
 =?iso-8859-1?Q?Sbnxm07MBR8/SDojSHHsCOfXO0W8wfgux9Tsd0kssGSGsX/L1+8/7uExPu?=
 =?iso-8859-1?Q?0jS0rXk1f1NCg09A4zEv5JIxeNI4rPdaC3AH4tiswZhi3sLzIz+mFZjnn/?=
 =?iso-8859-1?Q?vBxfPBQgzaaFb6CuiM+sq9aneIvuZIs3XjFV3c3QXdijbk/OCIeS+VW/7I?=
 =?iso-8859-1?Q?xaI2XGeK7OzYhnKVXNRWcsCF3kYOYUrRawTqdTTcT5Sc8MUj7FzX79V41Z?=
 =?iso-8859-1?Q?5eH/DInReCmTczHjAu0XWqeQuvPDznub1F0MqG+W3r0utBoUtOD2ccB/vP?=
 =?iso-8859-1?Q?8aWmQDNNLQ7YvJ9qaG56jiiIflO0OFG6c8UCc8IIGLzbqyfVU3t6FCSDon?=
 =?iso-8859-1?Q?3IrAEHbe9j1kiZbtp+WZEUAAsxQtkFTSF16gW2L6gHe+jzNVosHTznRLHW?=
 =?iso-8859-1?Q?ErRgFHwDh68sskZ/uHxXXMnbIse8AhnDn4igVhOcScXSe/asKXTo7PlAqJ?=
 =?iso-8859-1?Q?ELeV2gUYyFKSgDiQHH30kpasetGwGQ3K7nwdDEqQE/6ETdghjdYU5ekj3F?=
 =?iso-8859-1?Q?HCbsTCeYCwakWIgcqLTW0Lq1cjH05aMoAkdl6gSgIKqwlstc3VxRU8AEut?=
 =?iso-8859-1?Q?yHyqlyv2kW8WAnOhwW1EYo2robUXqYzhao6H3p8T/IW0E+auAOYXp2wUin?=
 =?iso-8859-1?Q?OF5Ce/U9kGowW2gqAfepp09eWrMQr++cAjg/t1E1c8PnretI+QqnkJKazE?=
 =?iso-8859-1?Q?YnSpmgss7T616z1JViGw4ca2pa8UYLchvF8ILGkeGbAe0OmhIIK++fZbL3?=
 =?iso-8859-1?Q?9iw8GD4VEcB41oZMwUt8xqFVYiUdv25y0HWWqhfNQEdZJm4GHsvsIVk1LB?=
 =?iso-8859-1?Q?fYkjNPWFzgLFYg8PIzScZduKGYNQQdikNJH1dmPZLbQHWRz/uy0aACp0Pm?=
 =?iso-8859-1?Q?W3lvn+WYK8xfYHMtwbqUfpxPfnlCa/7TrKSC9Rbj2wrWgqd+9P+t0GS6I9?=
 =?iso-8859-1?Q?4XP0hcn6QKgILnG7MY2G/lS/smwVH5PVaqK9mXS/HcvsNJJMibSvvbmysG?=
 =?iso-8859-1?Q?c5VyknR2gSeDZtaFTjm4d2Xyt+lXgDcmCgPU41r68eWK1IO5Muw0R7Fox2?=
 =?iso-8859-1?Q?kPZvHsobW5XDD1xSmNTSzXYsI4nKJe0E2EQ7TLau0NP77sE9MppeRDz6nN?=
 =?iso-8859-1?Q?TulITecNaJYhksFjLkNmyYEvoqzFpuGeFq?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf2527c-609e-47cc-7cad-08dc1d30fde9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 23:05:43.4816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WPK9l0dy5cQHjtd79AmMFbE8KqlgU8s9KKywNy0gh2XrLMoTCuKUsFLtrOVsnLsw2BPB3MjMdqwns+fkAsMSlvkq/KAzZ053cE6FK+3DADc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7643
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrew,

> Currently this driver creates a SGT table using the CPU as the
> target device, then performs the dma_sync operations against
> that SGT. This is backwards to how DMA-BUFs are supposed to behave.
> This may have worked for the case where these buffers were given
> only back to the same CPU that produced them as in the QEMU case.
> And only then because the original author had the dma_sync
> operations also backwards, syncing for the "device" on begin_cpu.
> This was noticed and "fixed" in this patch[0].
>=20
> That then meant we were sync'ing from the CPU to the CPU using
> a pseudo-device "miscdevice". Which then caused another issue
> due to the miscdevice not having a proper DMA mask (and why should
> it, the CPU is not a DMA device). The fix for that was an even
> more egregious hack[1] that declares the CPU is coherent with
> itself and can access its own memory space..
>=20
> Unwind all this and perform the correct action by doing the dma_sync
> operations for each device currently attached to the backing buffer.
Makes sense.

>=20
> [0] commit 1ffe09590121 ("udmabuf: fix dma-buf cpu access")
> [1] commit 9e9fa6a9198b ("udmabuf: Set the DMA mask for the udmabuf
> device (v2)")
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/dma-buf/udmabuf.c | 41 +++++++++++++++------------------------
>  1 file changed, 16 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 3a23f0a7d112a..ab6764322523c 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -26,8 +26,6 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a
> dmabuf, in megabytes. Default is
>  struct udmabuf {
>  	pgoff_t pagecount;
>  	struct page **pages;
> -	struct sg_table *sg;
> -	struct miscdevice *device;
>  	struct list_head attachments;
>  	struct mutex lock;
>  };
> @@ -169,12 +167,8 @@ static void unmap_udmabuf(struct
> dma_buf_attachment *at,
>  static void release_udmabuf(struct dma_buf *buf)
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
> -	struct device *dev =3D ubuf->device->this_device;
>  	pgoff_t pg;
>=20
> -	if (ubuf->sg)
> -		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
What happens if the last importer maps the dmabuf but erroneously
closes it immediately? Would unmap somehow get called in this case?

Thanks,
Vivek

> -
>  	for (pg =3D 0; pg < ubuf->pagecount; pg++)
>  		put_page(ubuf->pages[pg]);
>  	kfree(ubuf->pages);
> @@ -185,33 +179,31 @@ static int begin_cpu_udmabuf(struct dma_buf
> *buf,
>  			     enum dma_data_direction direction)
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
> -	struct device *dev =3D ubuf->device->this_device;
> -	int ret =3D 0;
> -
> -	if (!ubuf->sg) {
> -		ubuf->sg =3D get_sg_table(dev, buf, direction);
> -		if (IS_ERR(ubuf->sg)) {
> -			ret =3D PTR_ERR(ubuf->sg);
> -			ubuf->sg =3D NULL;
> -		}
> -	} else {
> -		dma_sync_sg_for_cpu(dev, ubuf->sg->sgl, ubuf->sg->nents,
> -				    direction);
> -	}
> +	struct udmabuf_attachment *a;
>=20
> -	return ret;
> +	mutex_lock(&ubuf->lock);
> +
> +	list_for_each_entry(a, &ubuf->attachments, list)
> +		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
> +
> +	mutex_unlock(&ubuf->lock);
> +
> +	return 0;
>  }
>=20
>  static int end_cpu_udmabuf(struct dma_buf *buf,
>  			   enum dma_data_direction direction)
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
> -	struct device *dev =3D ubuf->device->this_device;
> +	struct udmabuf_attachment *a;
>=20
> -	if (!ubuf->sg)
> -		return -EINVAL;
> +	mutex_lock(&ubuf->lock);
> +
> +	list_for_each_entry(a, &ubuf->attachments, list)
> +		dma_sync_sgtable_for_device(a->dev, a->table, direction);
> +
> +	mutex_unlock(&ubuf->lock);
>=20
> -	dma_sync_sg_for_device(dev, ubuf->sg->sgl, ubuf->sg->nents,
> direction);
>  	return 0;
>  }
>=20
> @@ -307,7 +299,6 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	exp_info.priv =3D ubuf;
>  	exp_info.flags =3D O_RDWR;
>=20
> -	ubuf->device =3D device;
>  	buf =3D dma_buf_export(&exp_info);
>  	if (IS_ERR(buf)) {
>  		ret =3D PTR_ERR(buf);
> --
> 2.39.2

