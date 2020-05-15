Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 942BD1D602D
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 11:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBFA6E1CD;
	Sat, 16 May 2020 09:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30042.outbound.protection.outlook.com [40.107.3.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970D56EC42
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 10:12:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyyNwzsMz+lsgtl4sOrUYRRfR36hV4g2No9l1SCzaGOEuKAk2Yf3mNpLOCtvyANmo6vnqdnsnND0LGlqaXSyjcNIIxX0jzM9sVuPufdZ/sZIr0SRae1wiQoN+UYU/6Pyu0TeewhoBu91J2ERwUrL9ZUMk6qFcxsecMi4iu2qUug3X8Mftvl0ljfBX69mr7qdny84Hy0sUS1xAFSPZdFELS7N/RdS7pmYYWjlFrtExd+d1Md97dt8Hv0iwKF54j1bMO6Xd22ecYjw8ACFoy8uVDeRarWbUFrngBzC3rBUq6bfnll5p8uuGrmT61Piz1QcVG1O3i6W2t923P6sA2YSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I40pc1VicfeWEniwoguJyFMnSiKgGvoEs++b0s0A/MM=;
 b=KZyudrj7ev9nn+FHl+fu36M7xTHrn0+nFaewui9M/P6vL84WI3+YPuSzO+8Cvt769dKTMI8DIqGYMAghFw6h4XcIyM1yCjDsRuQKVlihpV17XUUG73aOyX8dbSDI1r4DYH1Xi0+/NuqN2u9YJ+grvs2I/vE6BlSl7OmFuNuAotSEEG4G9q4xtw8EmWd8DTJeBwkyUEQPpRXLfEUgrdLZnM2YFE3Cf2EoQoercueeKQLyK1HjKIGQd6mMB3NAzGh1WjG9D41lwNQhpEmirzP8Ivy1GO+U8xOgvs3XOtNDbKXqXiHenJ8wbeho0Dbj3f2SPMjUIx0XZBgNJuhFuBmBXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I40pc1VicfeWEniwoguJyFMnSiKgGvoEs++b0s0A/MM=;
 b=M+br6CBtUMNjFMlBMkjGwjyzPm1aTUzdgpfH5P3Vglc5z6JMA5oJ6S573aBJNq6iaGhlAZ1+hCrOtbCisOsk9RFeUdrcuynBx4Us5mg7XJlNikV3q7HBxwF74yMmcBYYfT+6A5v3FHqPKjFIlgtPZpu5RjepfGntiSfv66m3TS8=
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB4653.eurprd03.prod.outlook.com (2603:10a6:803:62::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Fri, 15 May
 2020 10:12:20 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4%7]) with mapi id 15.20.3000.022; Fri, 15 May 2020
 10:12:20 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 37/38] drm/xen: remove _unlocked suffix in
 drm_object_put_unlocked
Thread-Topic: [PATCH v2 37/38] drm/xen: remove _unlocked suffix in
 drm_object_put_unlocked
Thread-Index: AQHWKp7fJHyRFY5EuE+2t2Xe2/Zw8aio7WIA
Date: Fri, 15 May 2020 10:12:20 +0000
Message-ID: <f083a3f7-c3e7-6b3a-bbee-2810d8168437@epam.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
 <20200515095118.2743122-38-emil.l.velikov@gmail.com>
In-Reply-To: <20200515095118.2743122-38-emil.l.velikov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 553851d5-d42e-4ac4-899c-08d7f8b8743b
x-ms-traffictypediagnostic: VI1PR03MB4653:
x-microsoft-antispam-prvs: <VI1PR03MB4653CBB10296139B0B2DB49DE7BD0@VI1PR03MB4653.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:127;
x-forefront-prvs: 04041A2886
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q0ICeONdqFQypdTcscTOGokXH01Usrk8FyiXBOog4riCocCBdjcqkDbiuY2iMTCeg35TlEQiC/zQaVJs405xATOxvoPJSMgNMrNBDDB+1Z1oAGNt1dLLscjGvVNh13bZCKCUlKnGptPMt0/dgtOYJSG4gd9UNDV8uFPLcr/PxwEopaV+yySYclL7QV23YaBjYA6m+aAbFpV44Pet+Q00+cljjgUpjSscBHKbzvv1zI5h86mEv+3EvwGO8mzWFGov1muO1cfnA7Vj5wNUjuVg9NUsuVNmgw/71v2pZSUj4S8nN9K4cr+vAdnvhpvmTV2RgTvruy4JLjB3JaMmUgN1BiTWnXkf4HzYYabo2sXkv6VR6GP+wzvQGfvUJhv++9YDQ5n6EGr2K2MfINMMe3PeRxerD3nv1RJDP5K8ySXCB7glpapGdYk+CgdQtPLEkDNb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(31696002)(53546011)(31686004)(54906003)(316002)(6512007)(6486002)(5660300002)(2906002)(110136005)(8936002)(66476007)(4326008)(66946007)(26005)(86362001)(66446008)(2616005)(66556008)(478600001)(6506007)(64756008)(36756003)(71200400001)(8676002)(76116006)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: pThh5lIY50YHjQ/Ot4SGJjOc/XLuUOWCgNDXuvf5Qi1Wt7ovwDzp10clIK5wP7WBPQwzteXjHT0jS9fNDOHZLxIOFEeUmPVSOWS9GTjX2CGs42A8ePB/vIe1Rb6V10jzqYG5f1htzm3iYn4Y9FFW5zs4al1A65CkedR42QJbbpHoBD6VpKDTF8T3rXi+jxfmGa4GOZZF2o8T2I2U13DAl1tP5t8GFcMorhW8qvB6bLIVn1DZBW465fkb/n29gDQsvhv59rzW3J5k6yKlv761u74zdgY5KY7L7sRfWG/jfiQlr5TR4VJFwZNV1zAUw8u8avtcHKtMivMUzzp+rWaMdCuTRQjoxGMiA9PYCnJGZkj8SzR+ZHcx0N/uHN7HK19nvy2Nw/MNB/yMM/1Y1ES1UMV99qtb0+hozVZziG/39RFYuxwUcKa5MTwPPlYItxyh3p9MSTgx+GjG8y9YQFnB1Io2KAtxG7dxmZKCI+pUlxM=
x-ms-exchange-transport-forked: True
Content-ID: <14D9DD945CAA434DAA1A35AE9895F79D@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 553851d5-d42e-4ac4-899c-08d7f8b8743b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2020 10:12:20.2725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tZsm7Eue5CGTispAt6wRsqPM+VCjwjo7CkqlwZIPZv0PTCcIgdpaWsdHcz/W/KWNGVg6U/syILp1o63FpwhFlB49HT/+lCXeyqc+n+GVba3VunUiZgCp/0x2q60s2yXH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4653
X-Mailman-Approved-At: Sat, 16 May 2020 09:58:59 +0000
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/15/20 12:51 PM, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
>
> Spelling out _unlocked for each and every driver is a annoying.
> Especially if we consider how many drivers, do not know (or need to)
> about the horror stories involving struct_mutex.
>
> Just drop the suffix. It makes the API cleaner.
>
> Done via the following script:
>
> __from=drm_gem_object_put_unlocked
> __to=drm_gem_object_put
> for __file in $(git grep --name-only $__from); do
>    sed -i  "s/$__from/$__to/g" $__file;
> done
>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>   drivers/gpu/drm/xen/xen_drm_front.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
> index 1fd458e877ca..3e660fb111b3 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -419,7 +419,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
>   		goto fail_handle;
>   
>   	/* Drop reference from allocate - handle holds it now */
> -	drm_gem_object_put_unlocked(obj);
> +	drm_gem_object_put(obj);
>   	return 0;
>   
>   fail_handle:
> @@ -427,7 +427,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
>   				   xen_drm_front_dbuf_to_cookie(obj));
>   fail_backend:
>   	/* drop reference from allocate */
> -	drm_gem_object_put_unlocked(obj);
> +	drm_gem_object_put(obj);
>   fail:
>   	DRM_ERROR("Failed to create dumb buffer: %d\n", ret);
>   	return ret;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
