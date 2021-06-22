Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 881BA3B0F71
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 23:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B286E2B8;
	Tue, 22 Jun 2021 21:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8656E02A;
 Tue, 22 Jun 2021 21:33:07 +0000 (UTC)
IronPort-SDR: Bi2jZHRMMbaUSo7ICnl9ZxYHGndy2J9wNuRZsUUxMxxx5mvoXMimMexmyfzK48KlW3oVo+YPI9
 RMAY0MGG5y5w==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="292773199"
X-IronPort-AV: E=Sophos;i="5.83,292,1616482800"; d="scan'208";a="292773199"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 14:33:06 -0700
IronPort-SDR: bx7MBecQQ5hV4xNDBXCvd70PC7lHDMMMuO4SRyrMWlmIF2nzUqTtg5Y7beSNcqFdL/y2+OJSWf
 gkVN5euGSDUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,292,1616482800"; d="scan'208";a="423472321"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 22 Jun 2021 14:33:04 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 22 Jun 2021 14:33:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Tue, 22 Jun 2021 14:33:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Tue, 22 Jun 2021 14:33:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AED9f4AOy4EpHn+DJ58w+WsFdNurp/b83r1caNfn4/9jA+ZMiQZADeDkVDj2BqG6yNz0utoOy24V4JHr4SsQ1uNGgzpLG1h1zObW4P02xA83O7a4dCIfKjBo/zCK2mDNH/ORV9kyvn6VXTemCCovwYb/eG9M9oYf+seVdTJQzsvBLVQEdv5b0/nckFYeropw3vO3vCcuVJm8CdHuFK4xDn2UcExnT2dTR3Y7//YHpm0JcerZRwVmOrHnixqCKeu3Re9RnlOEHdANVChIy4Qu2+Hm/vpcPDyM4TdAXYAGEW3zzni5xPWAvMkkhyKyBiLlYXvYNzhcALm09eQafCohwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1mcNIC1ItPdWIUGK9FdTDjNMlxPBF+vzvmr1Qn4Z7g=;
 b=A4LdXoVoN2luakIQoHyu7iT9WMJMRaHl38cSVIhPK0oiGzGRS48TvOYeZXsiryxIeww7zGYaYO51SLeCjiPa/m3FzC/f5zg0/WxXvN50XzjRrbLT/GL9dKmBDdVcQSliz5EcZkd8ooYEVFAmubuLoe1Z+BGVYnVfXf1kvV7urY9TCZ9JIIVnlvTKVZACuJNyzJHyjJKedtbat3BtHGQ9EW+6uSrktRcpSho6eS5nB8d92pvzksOC2O8ZjdCBwWCDBWMvtqJ0fTPG1DN+QFjOh9TdQqJ6iAZPvBO3IRyOVjkLCcWoEXwf3aen5CBkaOTh705K3ULV4dbuyp1CzsCkTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1mcNIC1ItPdWIUGK9FdTDjNMlxPBF+vzvmr1Qn4Z7g=;
 b=vEOCK36Pw4+gYzXh3K9AncSBYbhevB6VX/g0GT9wxex1+JLuA+ojU9cpB3erktf2/6Hh2vMhtT7fG+mSkG+Qyt3I02G5L+LEtjE5PZjCDA8zYRdKeNRpS/Z5NvhEmJSwH6iEXIllOK94qftYLTSzHRcf+Wc2ADbYF7KyCsYgjhU=
Received: from DM6PR11MB2890.namprd11.prod.outlook.com (2603:10b6:5:63::20) by
 DM5PR11MB1612.namprd11.prod.outlook.com (2603:10b6:4:b::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.22; Tue, 22 Jun 2021 21:33:00 +0000
Received: from DM6PR11MB2890.namprd11.prod.outlook.com
 ([fe80::6d82:e6a7:a1d7:fc91]) by DM6PR11MB2890.namprd11.prod.outlook.com
 ([fe80::6d82:e6a7:a1d7:fc91%7]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 21:33:00 +0000
From: "Mason, Michael W" <michael.w.mason@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915: return DRIVER_NAME for the fence driver name
Thread-Topic: [PATCH] drm/i915: return DRIVER_NAME for the fence driver name
Thread-Index: AQHXYqtXgcyLrHTdiUO2DxxgSF+5QasgkbQA
Date: Tue, 22 Jun 2021 21:32:59 +0000
Message-ID: <DM6PR11MB2890E3A44DD6C065E4496B0FA1099@DM6PR11MB2890.namprd11.prod.outlook.com>
References: <20210616122833.332954-1-matthew.auld@intel.com>
In-Reply-To: <20210616122833.332954-1-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.180.2.116]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7cdbc132-c9da-4e0d-e2ed-08d935c54f09
x-ms-traffictypediagnostic: DM5PR11MB1612:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1612D58EB281416336FC7A7DA1099@DM5PR11MB1612.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GyjGG4UTSFwqzN3eYZLtXZyo6uVKkLKnxLuCLPt3W3tXSJ84vkTJuW/Tpa34A2w6reAScZDBeEusTc4KAsV9ORAdJT5pGf+ltVjlGae/e20BB3T2eqoh/3s3SymFYBnWvo68gKLLs4kDhDb0+g3p0yf6GcHErU7xD6OCvwwjYIxBTz6qQ/R92z1wbjkcA0SEYiN5hJdKHFqwStqbsmUfpwccGE/rs6dM4IJPoQKB3tMERTcFf4Ilztcqa9hIztpm3x0P7oEWsBgK8SqheNydn+Pwuwk7q78x96OFmPKESVlIPiFBtlvjWZ0ZMfH8IyYq6Hrkl8pVsuNkQ7Pkj5pw0lrVspgkqd1CfwDGD88fM08uhTaFTUdtLdyuQZUwtMF2NkAZXkrroyDfm0fwWhJCLtPlA6qYeGNWJXSHNxZBDb6gc/BBEUKmUc1a99Spenmze0VyO3oAsBML5BPgRmUzmNEpO8YAZQwVB7AeOy3XSRfuB+5RUoNwjpm0oqrB7b1RJJjNm67lPknYZH5mUAUm5oax5jbv8XzZBuVRVxym0klCWR+zmRvxjznt9IMf3xHprrpN+3GX9vv+vsLc86m6miyktiqS/ww1M353HlNCIMA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2890.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(136003)(346002)(39860400002)(376002)(38100700002)(9686003)(33656002)(83380400001)(316002)(2906002)(6506007)(55016002)(7696005)(54906003)(86362001)(122000001)(71200400001)(64756008)(8936002)(66446008)(66556008)(52536014)(5660300002)(186003)(66946007)(66476007)(110136005)(478600001)(8676002)(4326008)(53546011)(76116006)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?phomaSzpJ/tjYEW4i+Y2Nd6bqJ36pcx/bJKU2ddGvNSi/4rJJXM2elU29auB?=
 =?us-ascii?Q?gCVTKSYd2WptdUWSj0vDdxTyHaFzSxJkvk1N5FILz5RNm4GLtzmMKDNWf3hE?=
 =?us-ascii?Q?DHBXAgawUzAaPjF+YfZVbKx3zLjG03TeIbxwAjZzryTfbBNjuGoczs3DwC4l?=
 =?us-ascii?Q?YRE1WuIJMasM3lSGmzMP6qN/Z2Otiybl3vFP8D48yTnEYucn/n3kEy3UtO4y?=
 =?us-ascii?Q?cWaxownvMmhmJ2SPN/aGJv4ild49HJ4hrngbn/M3Dp38EFe1pSvYy5q//w0h?=
 =?us-ascii?Q?tNPpdj/J4tu76QJteW2xk+JgT57q/4p5QK4WWu6xRi2QdfyP3OpUr3Y0/Cmc?=
 =?us-ascii?Q?bqytn17veRDFuZsyUrptA6LV8j8q6ngLdBBVK7lR99IR8pMwmU5GKOPlf3vo?=
 =?us-ascii?Q?tbi+jOnrHINNedz60xyp5vsbLTzJ8054vx7cMfTJO4CrAy1mHDQkhrs/9UaI?=
 =?us-ascii?Q?cq7e6ua5RYkD9bOrFyGRlrPDZHbdjUHFDbq93RNRJ8OZu0uDGkrQTgDremkb?=
 =?us-ascii?Q?U0CfS8rSOUEfF7s3aIPxGCstyCwabJjVigE6RX4ZliXxVOwQw7liKRyD4Qb+?=
 =?us-ascii?Q?72z4bvHU+66OXgamjcJdyxTQeuCsnrswsVP1KT+xdkQNzFvZk/E1c3k1692y?=
 =?us-ascii?Q?Q8lytQmGUkOdvpSC31ZIUVqdVMhFlSjEha84b2Tv6Vg8BSvptQrMISscOybP?=
 =?us-ascii?Q?tx3ttb1/nQ+kBdZjrHhgA2u6RyLtYmEssmuvZ6obLThS6uCjpJzISx2f/ngl?=
 =?us-ascii?Q?8aF1gNnzomGqkpjzzoezLjxuI3bJv+4PqEvJaiTI6j+3aYOuhSXL7qqnwktp?=
 =?us-ascii?Q?WsViK2PYeXH7GQGKgQ3dIYBz5y5xon5LDyv5Vlhg+JOmHof44C8KceaYb7fV?=
 =?us-ascii?Q?A1g/nBM5PYUVOsAWz1ImlGILH6JPK34P5K+oVFSXf1fDZo9KzRZPVfuJFgaS?=
 =?us-ascii?Q?YKWXBq9e4FnkF/os0+SSiuYgFJOGVhmepObiLa7W3kxyNSVNynlETZl47oKy?=
 =?us-ascii?Q?K+8UbjRJbowz7zHgg2aBrUkHZyY8g54vZe6wWKalWeQC0hrSTEsI3ad4ubwS?=
 =?us-ascii?Q?HmgQXJCjWmgd9ZJQOA7p0onL0wnQ8i9URiQhtu/Y9Wa5+tF0oUFdAvdHs6xi?=
 =?us-ascii?Q?b9QiCQ5HkRGJoPBOO/0kGlpTG3/8g+o6xt3aqOCG5T5DVEJKI4kOlnGcWhbb?=
 =?us-ascii?Q?WJfuWrOG0gCqzmywnXw7WBZ8tTOomY8atCT4JQ4+YYOlOCbTPZuq45MKioOz?=
 =?us-ascii?Q?OiZpb0p12gob4cSJQxJqkEW97v6KQ9ZL4fbZJ/NuHjvbbY3E2u6xKZg7UESW?=
 =?us-ascii?Q?zu8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2890.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cdbc132-c9da-4e0d-e2ed-08d935c54f09
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2021 21:32:59.8864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qJw2Ga+ZMmhxbJKgrpCxyL54y7Ml/ieSGJOPBVYWoxwu/G7dT2z6x8EKpvLc8qsA0NZjiws28l/4PDNiI0r5RqyGPZgs5+L1P0My7ERjgeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1612
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes the NULL pointer dereference in i915_fence_get_driver_name(),=20
but now it crashes in i915_fence_get_timeline with another NULL pointer
dereference. It attempts to use i915_gem_context.name, which apparently
also hasn't been initialized

static const char *i915_fence_get_timeline_name(struct dma_fence *fence)
{
    const struct i915_gem_context *ctx;

    /*
     * The timeline struct (as part of the ppgtt underneath a context)
     * may be freed when the request is no longer in use by the GPU.
     * We could extend the life of a context to beyond that of all
     * fences, possibly keeping the hw resource around indefinitely,
     * or we just give them a false name. Since
     * dma_fence_ops.get_timeline_name is a debug feature, the occasional
     * lie seems justifiable.
     */
    if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
        return "signaled";

    ctx =3D i915_request_gem_context(to_request(fence));
    if (!ctx)
        return "[" DRIVER_NAME "]";

    return ctx->name;
}

<1>[  414.327761] BUG: kernel NULL pointer dereference, address: 0000000000=
000020
<1>[  414.327766] #PF: supervisor read access in kernel mode
<1>[  414.327768] #PF: error_code(0x0000) - not-present page
<6>[  414.327769] PGD 0 P4D 0
<4>[  414.327772] Oops: 0000 [#1] PREEMPT SMP NOPTI
<4>[  414.327774] CPU: 3 PID: 1866 Comm: chrome Tainted: G     U           =
 5.4.125 #2
<4>[  414.327776] Hardware name: Google Voxel/Voxel, BIOS Google_Voxel.1391=
3.0.0 04/12/2021
<4>[  414.327781] RIP: 0010:i915_fence_get_timeline_name+0x1d/0x37
<4>[  414.327783] Code: 55 48 89 e5 48 c7 c0 ee d1 72 bd 5d c3 0f 1f 44 00 =
00 55 48 89 e5 48 8b 4f 30 48 c7 c0 b4 49 72 bd f6 c1 01 75 1c 48 8b 47 60 =
<48> 8b 40 20 48 85 c0 74 08 48 05 30 01 00 00 eb 07 48 c7 c0 79 7b
<4>[  414.327785] RSP: 0018:ffffa4a300d177b8 EFLAGS: 00010246
<4>[  414.327787] RAX: 0000000000000000 RBX: ffffffffbd7a8680 RCX: 00000000=
00000000
<4>[  414.327788] RDX: ffff9c27b3b0f4c0 RSI: ffff9c27b3b0f480 RDI: ffff9c27=
b3b0f480
<4>[  414.327789] RBP: ffffa4a300d177b8 R08: 0000000000000000 R09: 00000000=
00000004
<4>[  414.327791] R10: 0000000000000001 R11: ffffffffbca45536 R12: 00000000=
00000005
<4>[  414.327792] R13: 0000000000000004 R14: ffff9c27b6c79bb0 R15: ffff9c27=
b3b0f480
<4>[  414.327794] FS:  00007898a2965e00(0000) GS:ffff9c27b7f80000(0000) knl=
GS:0000000000000000
<4>[  414.327795] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[  414.327797] CR2: 0000000000000020 CR3: 000000022ded2006 CR4: 00000000=
00762ee0
<4>[  414.327798] PKRU: 55555554
<4>[  414.327799] Call Trace:
<4>[  414.327804]  trace_event_raw_event_dma_fence+0xc9/0x1e5
<4>[  414.327807]  dma_fence_init+0xa6/0xca
<4>[  414.327809]  __i915_request_ctor+0x7f/0xa9
<4>[  414.327812]  setup_object+0x88/0x8a
<4>[  414.327815]  new_slab+0x22e/0x429
<4>[  414.327817]  ___slab_alloc+0x2c8/0x42e
<4>[  414.327820]  ? __i915_request_create+0x68/0x238
<4>[  414.327822]  ? __i915_request_create+0x68/0x238
<4>[  414.327824]  __slab_alloc+0x3c/0x5f
<4>[  414.327826]  kmem_cache_alloc+0x19b/0x201
<4>[  414.327828]  __i915_request_create+0x68/0x238
<4>[  414.327830]  i915_request_create+0x8a/0xca
<4>[  414.327833]  i915_gem_do_execbuffer+0x12f9/0x1830
<4>[  414.327837]  i915_gem_execbuffer2_ioctl+0x157/0x398
<4>[  414.327839]  ? i915_gem_do_execbuffer+0x1830/0x1830
<4>[  414.327840]  drm_ioctl_kernel+0x94/0xf6
<4>[  414.327842]  drm_ioctl+0x276/0x39b
<4>[  414.327845]  ? i915_gem_do_execbuffer+0x1830/0x1830
<4>[  414.327847]  do_vfs_ioctl+0x4f4/0x771
<4>[  414.327849]  ksys_ioctl+0x58/0x83
<4>[  414.327851]  __x64_sys_ioctl+0x1a/0x1e
<4>[  414.327853]  do_syscall_64+0x54/0x7e
<4>[  414.327856]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
<4>[  414.327859] RIP: 0033:0x7898a2f88f07

> -----Original Message-----
> From: Auld, Matthew <matthew.auld@intel.com>
> Sent: Wednesday, June 16, 2021 5:29 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Mason, Michael W
> <michael.w.mason@intel.com>; Daniel Vetter <daniel@ffwll.ch>
> Subject: [PATCH] drm/i915: return DRIVER_NAME for the fence driver name
>=20
> The first tracepoint for a request is trace_dma_fence_init which is calle=
d in
> the ctor before we have properly setup the request->engine. So if it's a =
non-
> recycled request the rq->engine might be NULL, or some garbage value,
> which leads to a crash.
>=20
> Since we are not permitted to use kmem_cache_zalloc() here with
> SLAB_TYPESAFE_BY_RCU, one approach is simply to return DRIVER_NAME.
> We can then revisit this later if we decide to get rid of
> SLAB_TYPESAFE_BY_RCU.
>=20
> Fixes: 855e39e65cfc ("drm/i915: Initialise basic fence before acquiring
> seqno")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Michael Mason <michael.w.mason@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/i915/i915_request.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_request.c
> b/drivers/gpu/drm/i915/i915_request.c
> index 1014c71cf7f5..55fa94bde22e 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -61,7 +61,7 @@ static struct i915_global_request {
>=20
>  static const char *i915_fence_get_driver_name(struct dma_fence *fence)  =
{
> -	return dev_name(to_request(fence)->engine->i915->drm.dev);
> +	return DRIVER_NAME;
>  }
>=20
>  static const char *i915_fence_get_timeline_name(struct dma_fence
> *fence)
> --
> 2.26.3

