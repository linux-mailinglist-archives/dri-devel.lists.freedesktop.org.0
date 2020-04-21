Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2DE1B3831
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644CC6E9BA;
	Wed, 22 Apr 2020 06:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108EF89A86
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 11:34:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HT8rlgSniTOLPbn6PLuOc5HBNs4tPLo2opmh3ypPqT96N3vDwxfzOFBeuzYC3sQJ5LFvtdFSoWk6B+/+v3YKRga7UTmJZGX2aGr9SDuvV2YqmUvkAjT9YKWeaqj0Y5FzeveRywsKx4iITeXLrQNWDkDOk+67nIFv4eYdaGHW3OHzIeG+G5JGoSccL2aOy6ZyzyuZ8nQv0EFODnWHzI+5KrvT7+rg427ihSnawyiUWuxIrj9LJZX69vSPRwle5VMqBmTZPvRZHVov4JkDeWT32C0nWTrsmVHP629yFqfwNcz6JhUx6XDvd0J+OY/ucwi4HaughIjCDZJcS9RkpH5svA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErhIsr6nFzZAhpsCBTew5GcZqhDzEM9a0zUDFOef73c=;
 b=UTgyvoZnG3UxsPfu1vzMXzfvvxLfUOkFSWxS+iU829724sitvfNjTU2N9cTNVCFuqJZJRJvimS3LjAj6P/sdBbTzaGJldpVweomxBsK7yD5Gj58tI1s44cfUvUAXn2dBR710b4Z88JDHtHn+lX3lKO2IQ794Q4reJJif8UCP5cGKNjhhSoWkXO4EKSexpwj7cHHZQNvPgi8MxZy8gCbNF/7Gq4JXpPPFZfPG1n0z9jUgfqi8FWhv1NBxnbfPzSIuT+fAUrJj2iXCFam0H9CUVZcswS3OU4gJnd2qJIER3HA+yNht0OgHfzh8Q8K9Y9P/K2IGGyPBOJyKk25MKvQFoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErhIsr6nFzZAhpsCBTew5GcZqhDzEM9a0zUDFOef73c=;
 b=Ls0yTPY/Q4dhlgwQiq6BAF0fOPPLZZ5+uNbjXpM1sWm+kbdmNE5gKDEMidhHMW3xWag1wISKjm5ABUli5P9fXTDoRTxofrzk5EUbRhvPZgSnhVL8eP6jjE+IhK3Xmh+X9QPk0qzJms0pzlAboE33aSxWpJxlERwdNmq6DtfwaI0=
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB4672.eurprd03.prod.outlook.com (2603:10a6:803:5e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Tue, 21 Apr
 2020 11:34:53 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::4144:ba6b:18cd:af5c]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::4144:ba6b:18cd:af5c%7]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 11:34:53 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] drm/xen-front: Add support for Xen PV display
 frontend
Thread-Topic: [bug report] drm/xen-front: Add support for Xen PV display
 frontend
Thread-Index: AQHWF8n8HYXBbl5N3kSvZpSjxllEBqiDciuA
Date: Tue, 21 Apr 2020 11:34:53 +0000
Message-ID: <28cc7f7c-fe0a-fd06-d330-73531b818a79@epam.com>
References: <20200421104522.GA86681@mwanda>
In-Reply-To: <20200421104522.GA86681@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7510d33f-d8a7-4207-7ead-08d7e5e802c0
x-ms-traffictypediagnostic: VI1PR03MB4672:
x-microsoft-antispam-prvs: <VI1PR03MB467219CFA5E165EB519A94F9E7D50@VI1PR03MB4672.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(36756003)(186003)(2906002)(76116006)(31696002)(478600001)(6512007)(6916009)(31686004)(6486002)(5660300002)(86362001)(54906003)(4326008)(53546011)(6506007)(66946007)(64756008)(66556008)(2616005)(66476007)(66446008)(81156014)(8936002)(26005)(316002)(8676002)(71200400001);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q/t49k4dydozIpZmJDDMSMx+09QzOYMeb1HIJ5ztefBVFB3AhkFKN9xtvX3cws7hC2E9ggWJGZD683KNHD6Q+0e2dBeDpMz1fsUSfW46RrYCUwvrG9V9p0vNkTTQOz9Js2enxz9WH8pKAg4N1coNQS9oZJD1mvy/T1C1kZnkby0OIMjwyyPpMuu5LkMfwT17hOMV1ctokI0eF31BUFSUm7YDFIsMj6mwfnA17hg70yq6M121XBhvOLlYbQ3lFydeRKkOWPO1zEbCi56P3Jm0eP9dpU+Er4HHwbY69ERHqbsyT5n/BUEOLxyIRvySzg1nKVdby+NroNoL63xvCiSmVvu1+h8itOWpLgjtgAaWT5yva5coD2+58nU/WB7ZK+lxRGgWbZeU5hov3FJHl+4eIFzT/LbslPhkZEVHVsRjoOUSi0dtDaclW2qqofpJs4G3
x-ms-exchange-antispam-messagedata: 6jSJmebMBwMRvLIkc69lHGdGqElXKPrTZQgL59k3o8DLVBX9k5w3Di5OVpVZXJY+5oSdrLpO2ZLKPZ2laEaEJ7K9hfh7o9aVK2DwCnJz3gXQ2GutoDm5UMVQ1tBQMPa7gTLmJ761eeudOes+W+zXSeYdCZfPcgrvNhCpD/LP91RhnbDKUAFd6c4xtTbN9ByOV8WQn7isjshauDsu3fjz6+PFiJlwzZ+lhWTZfe7U5rW9tUjE5rtZmaTzz+0qI+UDgbRkVx4XksYt22zrz64ZAGgvKW+1ni0g9k3IeLiP1Thfj6LPXHuDjtQxJvhtRc+qJbF06cqJ30ORDZWb8awaQ4fbuEe2si3wXEKviSP178jg4IbgNY6Vr8FRTYD4bVrpLjqBC0rES1J0FazchFANk61FEy4Whfxx1kvvitNpelknx2eE5EAjMDlwh01HajQ1za2xdyN7ng5saYta8vgEDQ6TXIDAXhiwSro6Grgz+5SBlz+24fCmtXdMzme0EMYrWyQl/9md+G1DmvqciuQ2n+WE1aZutJPp/QZnvEarDsqUKQPLCmjJxthdKIUr+jighWLQ2NmpyOD8+QzNPuiaX1O9PgkyWbHd5jlu1Sa4AE9yta/kgYnJ3wnOu+J9MmVo+GcZe1EQ7jBIIFLVnCnS1pM5VJefK/1QLYlFAmw/S9WUmOfRJMdnhzJGNlXEHeYSiXY4cFFQgl5v14s4nZebEWigJbbYGNMYmUAZ5lj6xGi8GW2FvVlxtFfwYv5GEgRlOs2d018Lifnq0qZZh4/RRFKfUioWORmRrcl9Pl0U9ls=
x-ms-exchange-transport-forked: True
Content-ID: <6F53AA9BC003B44BAFE1919709B1AB56@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7510d33f-d8a7-4207-7ead-08d7e5e802c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 11:34:53.6328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FiiQ2z03w/fkjEBeEHmh6+i8ShxTJdKoNHDKTGksb6qavfzZrLcjpWkgIKqlERAQhznBnqSxBBUO9ABYG6o1G3aGqXVZ9YzakxDFzHzFexjHTh0YAXf0ynLpZCXWcipe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4672
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/21/20 13:45, Dan Carpenter wrote:
> Hi Kernel Janitors,
Hi
>
> Here is another idea that someone could work on, fixing the
> IS_ERR_OR_NULL() checks in the xen driver.
>
> The patch c575b7eeb89f: "drm/xen-front: Add support for Xen PV
> display frontend" from Apr 3, 2018, leads to the following static
> checker warning:
>
> 	drivers/gpu/drm/xen/xen_drm_front_gem.c:140 xen_drm_front_gem_create()
> 	warn: passing zero to 'ERR_CAST'
>
> drivers/gpu/drm/xen/xen_drm_front_gem.c
>     133  struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *dev,
>     134                                                  size_t size)
>     135  {
>     136          struct xen_gem_object *xen_obj;
>     137
>     138          xen_obj = gem_create(dev, size);
>     139          if (IS_ERR_OR_NULL(xen_obj))
>     140                  return ERR_CAST(xen_obj);
>
> This warning is old and it's actually the result of a bug I had in my
> devel version of Smatch yesterday.  xen_obj can't really be NULL, but
> if it were then the caller would return success which would probably
> create some issues.
>
> When a function returns both error pointers and NULL then NULL is a
> special case of success.  Like say you have:  "p = start_feature();".
> If there is an allocation failure, then the code should return -ENOMEM
> and the whole thing should fail.  But if the feature is optional and
> the user has disabled it in the config then we return NULL and the
> caller has to be able to accept that.  There are a lot of these
> IS_ERR_OR_NULL() checks in the xen driver...
>
> The one here is clearly buggy because returning NULL would lead to a
> run time failure.  All these IS_ERR_OR_NULL() should be checked and
> probably changed to just IS_ERR().
>
> This sort of change is probably change is probably easiest if you build
> the Smatch DB and you can check if Smatch thinks the functions return
> NULL.
>
> ~/smatch/smatch_data/db/smdb.py return_states gem_create | grep INTERNAL
> drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 58 |  (-4095)-(-1) |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |
> drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 62 | 4065035897849303040 |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |
> drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 66 | 4065035897849303040 |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |
> drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 68 | 0,(-4095)-(-1) |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |
>
> Smatch thinks that gem_create() sometimes returns NULL or error pointers
> but that's because of a bug in the unreleased version of Smatch and
> because gem_create() uses IS_ERR_OR_NULL().
>
>     141
>     142          return &xen_obj->base;
>     143  }
>
> regards,
> dan carpenter

Thank you for the report, I will try to find some time to look into this 
and come up with fixes.

Could you please (probably off-list) instruct me or give any pointers to 
how to reproduce

the results of the analyzer shown above?

Thank you,

Oleksandr
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
