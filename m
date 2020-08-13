Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794FF245CF4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6486E417;
	Mon, 17 Aug 2020 07:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D3F6E9BF;
 Thu, 13 Aug 2020 11:20:19 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07DBAhIo032308; Thu, 13 Aug 2020 11:19:48 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 32vyhf16ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:19:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ytoj84cGx07WDOAYCzIkNgAt5bJioV7W5YtrVQQAS/+DhksIreP6wUY2d7IxNw3e1dabLKO/joyhyWebgFQqE7U8FYMt8ZYhPnCqjE5ZIzWeJKfvh6OOtWmbCaoocBhxVDJghXveZhwrRLWUgpYJoUeJivPrrUx1cDSfoZ1X4Jed6KVCVnEtCywv0EJXptrjjIlxNbLZDgnkBtcViT9MIz5xfnuKWrBu18bowc9xWX03oicTJdWZ/BnK5NGg1irxdBljvs2qWsyrCW6lxrzabvSp8t9NDmP8axaAZebkUB8HE2VdtkyqacdQWdZWmR0DlAoyL5JuHkuQCowNN55twA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc8o5Gg9pCw3D3wzThNao2OARb2LAoDAO0TM8iReMrs=;
 b=FA7ZbC6kciQiDieES6zzXHbSBfxZUGb12XnTnuuuSTbWoHlcbY/pT+hwappdevHvqexWw/Bz8Q3o54YGu+tjl6vRVDeK78eNIKpH5yzt/n7WIoLrFXY4aV0JyWHJkdIoz2BQUJsh3tZzWwZ6bc5eQ+LCtWLgiIAm3lqIfD+rBIgFimrNgU9NILIddLJaOJBvfokjHR1rH9cCNDsdKqUQUYGUg4ozdb6KGT2+pO9RFz+mujUN/Rw1GEbte2Iy5nbG5oAd2Rp4R307KczLAP1co92UuESu2fqk5bXsxRQesZhQvPXAEpxgYTIwo/PJxqc4eIXw8dhpotVco9zVWZbrpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc8o5Gg9pCw3D3wzThNao2OARb2LAoDAO0TM8iReMrs=;
 b=w0RBY+eABwbLn3WzOKHTQ+/6O47gVx9rhalSLNXWETvTcqRI0v/DAlgzUBuGpVyIziCE00oFTPjIM/iudEjyjQVk+XvLxQ8tI2UJ5bJ0CSCE5TLL7VWkb4nKcKqCVaUImcwC5/+COKOhReKDCguIyo1dXrlnKyPnLBzbzwEGVBF74jfS8ALEQu9QqmcwTjtmInyu8pDWb/LtEDVmpxcJlsOJI60844+BquPe/P2FPh9BUJGiy1dA6ylKrn30TvBeZ+1hIcjNPxuHT4KWjo5Nk4+ACUgIdU5r3kpetdSHTZvtESHa48wY8dYQLaaop8HgjQTTD4jLAVU3rXpLMWUvLg==
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR03MB4294.eurprd03.prod.outlook.com (2603:10a6:20b:4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Thu, 13 Aug
 2020 11:19:44 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::1c2:462c:58b8:7ee9]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::1c2:462c:58b8:7ee9%7]) with mapi id 15.20.3283.018; Thu, 13 Aug 2020
 11:19:44 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
 "christian.gmeiner@gmail.com" <christian.gmeiner@gmail.com>,
 "inki.dae@samsung.com" <inki.dae@samsung.com>, "jy0922.shim@samsung.com"
 <jy0922.shim@samsung.com>,
 "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "kgene@kernel.org"
 <kgene@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>,
 "patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "robdclark@gmail.com"
 <robdclark@gmail.com>, "sean@poorly.run" <sean@poorly.run>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, "tomi.valkeinen@ti.com"
 <tomi.valkeinen@ti.com>, "eric@anholt.net" <eric@anholt.net>,
 "hjc@rock-chips.com" <hjc@rock-chips.com>, "heiko@sntech.de"
 <heiko@sntech.de>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "rodrigosiqueiramelo@gmail.com" <rodrigosiqueiramelo@gmail.com>,
 "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>, "hyun.kwon@xilinx.com"
 <hyun.kwon@xilinx.com>, "laurent.pinchart@ideasonboard.com"
 <laurent.pinchart@ideasonboard.com>, "michal.simek@xilinx.com"
 <michal.simek@xilinx.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "evan.quan@amd.com" <evan.quan@amd.com>,
 "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>, "tianci.yin@amd.com"
 <tianci.yin@amd.com>, "marek.olsak@amd.com" <marek.olsak@amd.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>, "andrey.grodzovsky@amd.com"
 <andrey.grodzovsky@amd.com>, "Felix.Kuehling@amd.com"
 <Felix.Kuehling@amd.com>, "xinhui.pan@amd.com" <xinhui.pan@amd.com>,
 "aaron.liu@amd.com" <aaron.liu@amd.com>, "nirmoy.das@amd.com"
 <nirmoy.das@amd.com>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>,
 "matthew.auld@intel.com" <matthew.auld@intel.com>,
 "abdiel.janulgue@linux.intel.com" <abdiel.janulgue@linux.intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "andi.shyti@intel.com" <andi.shyti@intel.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "miaoqinglang@huawei.com" <miaoqinglang@huawei.com>,
 "emil.velikov@collabora.com" <emil.velikov@collabora.com>
Subject: Re: [PATCH 18/20] drm/xen: Introduce GEM object functions
Thread-Topic: [PATCH 18/20] drm/xen: Introduce GEM object functions
Thread-Index: AQHWcUzwRlAvqlodBUmjrM9igZrPiqk15K+A
Date: Thu, 13 Aug 2020 11:19:44 +0000
Message-ID: <1fe5f918-2445-d2e6-a501-881e70929404@epam.com>
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-19-tzimmermann@suse.de>
In-Reply-To: <20200813083644.31711-19-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98c2df7f-79af-4148-ee6b-08d83f7ac817
x-ms-traffictypediagnostic: AM6PR03MB4294:
x-microsoft-antispam-prvs: <AM6PR03MB42948483A47DA7E7FF20A061E7430@AM6PR03MB4294.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9OuhwFxQyiR1r6WZCNoxvlXl+F4BeIHs0Lj7XIYCOMfjlBUvc5wx2AH3cjVee20NCw2z2cPzZ66ecnTR62GJzmNWY8h8LSmhhC/EsaiBe0DBD2OfrRcKJAT4hamZv2xqu3XMDY6/N716vxoQ8fp7BqbbQbIDCLa6KvKOARS0o2KWYxXwggf2rh3Z4TMmiBtUgvIk8eryhP305FHCtCAkHlKgq8qasIbIPBMwIY3hW23rQo+9HVzXRQQYsnqfTqyMMVE2X6wNsxG5m6ioY6ZblXGROvXJZlZX1Zm5fQD2yiFyx/T9McHKZt6C1RvPJcolYPLatWRukLV4k9PA/9VbSZwEpt3OcTTDIS93rscyCcpYbHBB+xFV1WyOX/f4hJur
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR03MB6325.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(4326008)(76116006)(7406005)(316002)(7416002)(6512007)(54906003)(7366002)(66946007)(110136005)(478600001)(6506007)(53546011)(64756008)(86362001)(66476007)(2906002)(8676002)(66446008)(66556008)(71200400001)(8936002)(6486002)(31696002)(26005)(5660300002)(1191002)(186003)(31686004)(83380400001)(36756003)(2616005)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: RE/ytRISihDqVWLNAbZa6AMa6DykADf3L3prJiKeO9tLqyEL6pS7z6d7YS/5xwHDeDnKCuUMAUmNfHTLmpHstKw4/sCkLIAw55CLJasWUweCRGjRetUQX23J26TgBD/3q2hA+QG2a44++Ls8adHHKalvWZWDn281MI14G54ooFjzYTb1CoYbryKGXOxahysDtcfCSiaMSrC6WABHJkkf6gYfccHAzJMIiaMW9sYyJRML3v9o4BkX9/DtM5QFLa2ZCOQeqKWhPY9jcLPYo8K/HC7vabBlWXoXJmrw4avg7Gdr9wagIg3ESoB/dKSGWQOT3cM+HB5sLxxHaiuv16rgMNbqMTNhYQvuGVWu6Yg+sJOvNxDbEStBRe/tuvuBnI7ozGt+r2+JNK5UywIbuXtD12UAOe+aM5uJxsOoXGefBlaXFbgRH9WdPmrjtIS2HphZvjKFIPRlY9RScte8D1bScGUcLYqflfIw+LQ0S8AGQ9LoOQM8dKyWpHwc7GO+AbyLxT1ZmLLBeJ+I5PMqJc0k95MxFi4ueOcymKFCKNtfckT5jweqr2mtlrsTaEmc5dzsPQVDY42C+4nZspiabPTq7k3I0wzwW9xn6wWhbuLhoh+xI97P9riZFZygqwzUUj254yzRx2ZF3X1qCi5s/u/zlA==
x-ms-exchange-transport-forked: True
Content-ID: <73B83228210C8B4092A3A2E420A1C72C@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c2df7f-79af-4148-ee6b-08d83f7ac817
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 11:19:44.5649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uf3Ju+H72OtC//NmTqgcZeFyfKALyi2YcwCTi756Jif6gg6QmkKzaeMSl8qoWK868gGdtmA2N9qB0vAvmyjlq1MS3Eh0vEaiNq869roKrHvQDdr2jkXV8UZTYjjxWvux
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4294
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_10:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130085
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 8/13/20 11:36 AM, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in xen. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/xen/xen_drm_front.c     | 12 +-----------
>   drivers/gpu/drm/xen/xen_drm_front.h     |  2 ++
>   drivers/gpu/drm/xen/xen_drm_front_gem.c | 15 +++++++++++++++
>   3 files changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
> index 3e660fb111b3..bd9af1875af1 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -433,7 +433,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
>   	return ret;
>   }
>   
> -static void xen_drm_drv_free_object_unlocked(struct drm_gem_object *obj)
> +void xen_drm_drv_free_object_unlocked(struct drm_gem_object *obj)

Can we please have naming consistent and name it as

xen_drm_front_drv_free_object_unlocked or any other name if this seems to be too long,

but starting with xen_drm_front_ as the rest of exported functions?

With this,

Acked-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Thank you,

Oleksandr

>   {
>   	struct xen_drm_front_drm_info *drm_info = obj->dev->dev_private;
>   	int idx;
> @@ -481,22 +481,12 @@ static const struct file_operations xen_drm_dev_fops = {
>   	.mmap           = xen_drm_front_gem_mmap,
>   };
>   
> -static const struct vm_operations_struct xen_drm_drv_vm_ops = {
> -	.open           = drm_gem_vm_open,
> -	.close          = drm_gem_vm_close,
> -};
> -
>   static struct drm_driver xen_drm_driver = {
>   	.driver_features           = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>   	.release                   = xen_drm_drv_release,
> -	.gem_vm_ops                = &xen_drm_drv_vm_ops,
> -	.gem_free_object_unlocked  = xen_drm_drv_free_object_unlocked,
>   	.prime_handle_to_fd        = drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle        = drm_gem_prime_fd_to_handle,
>   	.gem_prime_import_sg_table = xen_drm_front_gem_import_sg_table,
> -	.gem_prime_get_sg_table    = xen_drm_front_gem_get_sg_table,
> -	.gem_prime_vmap            = xen_drm_front_gem_prime_vmap,
> -	.gem_prime_vunmap          = xen_drm_front_gem_prime_vunmap,
>   	.gem_prime_mmap            = xen_drm_front_gem_prime_mmap,
>   	.dumb_create               = xen_drm_drv_dumb_create,
>   	.fops                      = &xen_drm_dev_fops,
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.h b/drivers/gpu/drm/xen/xen_drm_front.h
> index f92c258350ca..93e60c1db550 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.h
> +++ b/drivers/gpu/drm/xen/xen_drm_front.h
> @@ -160,4 +160,6 @@ int xen_drm_front_page_flip(struct xen_drm_front_info *front_info,
>   void xen_drm_front_on_frame_done(struct xen_drm_front_info *front_info,
>   				 int conn_idx, u64 fb_cookie);
>   
> +void xen_drm_drv_free_object_unlocked(struct drm_gem_object *obj);
> +
>   #endif /* __XEN_DRM_FRONT_H_ */
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> index f0b85e094111..7b315c08bcfc 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> @@ -56,6 +56,19 @@ static void gem_free_pages_array(struct xen_gem_object *xen_obj)
>   	xen_obj->pages = NULL;
>   }
>   
> +static const struct vm_operations_struct xen_drm_drv_vm_ops = {
> +	.open           = drm_gem_vm_open,
> +	.close          = drm_gem_vm_close,
> +};
> +
> +static const struct drm_gem_object_funcs xen_drm_front_gem_object_funcs = {
> +	.free = xen_drm_drv_free_object_unlocked,
> +	.get_sg_table = xen_drm_front_gem_get_sg_table,
> +	.vmap = xen_drm_front_gem_prime_vmap,
> +	.vunmap = xen_drm_front_gem_prime_vunmap,
> +	.vm_ops = &xen_drm_drv_vm_ops,
> +};
> +
>   static struct xen_gem_object *gem_create_obj(struct drm_device *dev,
>   					     size_t size)
>   {
> @@ -66,6 +79,8 @@ static struct xen_gem_object *gem_create_obj(struct drm_device *dev,
>   	if (!xen_obj)
>   		return ERR_PTR(-ENOMEM);
>   
> +	xen_obj->base.funcs = &xen_drm_front_gem_object_funcs;
> +
>   	ret = drm_gem_object_init(dev, &xen_obj->base, size);
>   	if (ret < 0) {
>   		kfree(xen_obj);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
