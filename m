Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE625583F32
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 14:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE4914B6F2;
	Thu, 28 Jul 2022 12:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F5F10FB4B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 12:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659012564; x=1690548564;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SNgj2nSi4ugmtOCpdd2jr77n2uY8p6DwOtDpsgPv8go=;
 b=ihqYbVWt0VzReKmkcnhC2m+RbISArtZXHwN056CwVcSvKw5rTSrzsC6J
 pm1zWXOB4V6rhkMO+SN8Q5TvMjqKQJDSPIboi6B+e00FR94seccmVdpLm
 Azj5YruidS2j4B+G4UMM3qVT1MIsQ9SxvYgktDBqsIGZzNxpYlbp4ck0Z
 g6HS4YQBAUf1rC4fSY8O7iLNhJQdQ2mQQIqZdVIHW3+ez3vPNOcXw5REV
 fNNIxYJMuoZY3ekMDczwcaL6pbCtFnuGBsBmHKXbIGYa7QPbTwcp2Tujl
 JA4ftxo7hPbzmjyy6oYcDak/a6NdmD6jHORr1TR2QRSNgkcT0WTI3eAj/ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="374804888"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="374804888"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 05:49:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="928276192"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 28 Jul 2022 05:49:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 05:49:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 05:49:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 28 Jul 2022 05:49:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 28 Jul 2022 05:49:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRIGMbbBaGayA5w26OJ9D2IHBCAeWGlQ+81lmCaLvu6i5jKBXMTnYGZQDdMa7Exim/hpDGE2U7uwoy7607W19EWwE9igERHQVcfo3bQthFg/QfbDAVrzex3Negbd1ciyRCT5UiUlhrW7y43nJf2ohOug5+kEzs+xnhRQq+wRioOfy2v9Q0fnIS+XHfIba/iA/ex7hc/2q9b3e+ZT+9baUucgeQoIg8Qgy83tBC+zHLJ+9+lZ7VPxMjJa40H/y74WPpHgeAoBCZ0GgTwJtKNNXApsTHu448J14DV4wnrDx6m2mb6HUu8J8aXJ77ItVwPmveAl5JGEoGUbNnCOtbIEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enjYm7DgTvkTZHYPbQe1mPg81BmFvjWKqAgYzCNj3M8=;
 b=Gk0IQQVpPjuVeEoZeRTF6FJu11XQ9aM9GozPvUziDRVI+WQTCnaSw2zszGsHAUAIOlHc4YzG49bGwu+0RlHA5a5A5u9kyTTdeq/q7B2F8+JmzGFlY6LrzfvBGqoRO3Ymd7ZfjaLxA0XInRHn/38ctBZF62qWlToLhUkhbI94RS0E3t2aIdJ/0blQignhSpFDMwTg6EfORzAAevlarfm5p0cfVSFOUJERMv7nlLN9qlUzXn5BlizzPVCbDCKWYkWNhX5OcBm0rI5mfIw0tj0+8zuDgTFDmGP5LuwXrtIqYoJzX7BbwNkiH4G8laKSjy2/ejQHWSQZP+d92Lxz/ofpPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by MN0PR11MB6134.namprd11.prod.outlook.com (2603:10b6:208:3ca::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Thu, 28 Jul
 2022 12:49:16 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::347a:3ce7:e32f:a82e]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::347a:3ce7:e32f:a82e%5]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 12:49:15 +0000
From: "Liu, Chuansheng" <chuansheng.liu@intel.com>
To: Peter Suti <peter.suti@streamunlimited.com>, "dan.carpenter@oracle.com"
 <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas
 <javierm@redhat.com>
Subject: RE: [PATCH v3] staging: fbtft: core: set smem_len before
 fb_deferred_io_init call
Thread-Topic: [PATCH v3] staging: fbtft: core: set smem_len before
 fb_deferred_io_init call
Thread-Index: AQHYoYuplkHDyCTFCkGJGaJymTDkcK2TuxOA
Date: Thu, 28 Jul 2022 12:49:15 +0000
Message-ID: <BL1PR11MB544569ACF9F4EE383F07959597969@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <YuDlfLeossnntH/C@kroah.com>
 <20220727073550.1491126-1-peter.suti@streamunlimited.com>
In-Reply-To: <20220727073550.1491126-1-peter.suti@streamunlimited.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: beaf851e-9e22-487c-d2f9-08da7097946e
x-ms-traffictypediagnostic: MN0PR11MB6134:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IBAeRomupI7Lt6rtpcLCsFCRRCox64kC7/HsMBN4oe1hj8Pv0PEbYKlr+m6chnzua/BlC+slOiJcWmmbtfmjdmGWUtLJ/4FG9gRGujUn7zgA55bDG3VCGIr979rID3vqvWVzkG9WlK+gOXWHUa5gqjJK9G01ijTnDR8CLyO5mLBVEV4dz3dThvpakK2eK9GMGdL1wNuk32MbPbklK1LwXbor8ZatWqSuRF54r3nJQ7otZKAjDnau2yNcnP3WmVBF9fgzeESrlxuPViJa7brOAx2VFybF0mk74mK6KPPHtRC5Kgix39Nqe+KvbGiyhI9aV11aVYT3HXY0ZY6wIDHGXWHaIdC5MKBEiaOpeELZPijObGGlJWTUlp26lMmX00YBLwQlVlA8TSGMZ/X9MEO7GJzMmCxVO289jA6GQt7iq0m9noXmwBPQ/0kJ29IxV+SotclCYuQzPA8eSIO6J6bSw9wiBxyCsPHxGoCoscJULy8RL8cKh83YULciLkUNePo2ke0nrijyeMn76oMmsOid7IRRVBX7EXY2ykaKxdq1t5HC9ptbFHivWiZNoS+kPW9S9Tvf/RDdHJVN6T/naIGiTdbc2NdejuuJ4GUMh9GQHRESXwuWiWBKxuwTw5TPVPRuQDhQIlOJQ3tiTq9H5Uau6wgy5HPYi/5Zvq992piYfX+GmrljLsHAz26/qFalcGMPbYn30lbZ6T21A/WeQJrRTrMKwrIpi6cn/gKuBKE+BYPbb2tQmYEavnb3YLXKnm3wlLlEI/xq4yjS6pv+MjL2DuLJ4GpZD1XQgJJuCgVHQv6tYPloPzqcAN1fL6UNbu9I
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(136003)(396003)(366004)(39860400002)(8676002)(4326008)(76116006)(66946007)(66556008)(82960400001)(5660300002)(4744005)(2906002)(52536014)(38070700005)(8936002)(64756008)(33656002)(66446008)(66476007)(55016003)(38100700002)(122000001)(186003)(316002)(9686003)(6506007)(7696005)(86362001)(478600001)(26005)(71200400001)(53546011)(83380400001)(54906003)(110136005)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FVP69A9eTxtmG2HSy2CS5DR+N1TWFL0sC6gad9RSVEXvZb4K7wcHkSHGJqS8?=
 =?us-ascii?Q?GReGHmjHbTZza6G64ebRdwk0FN95/sDOX/xh0zPcBPg3PzQYuWu5K2FMjbSU?=
 =?us-ascii?Q?J89EgGfECrxWC6SNud31sntI0lvN6It/hJlhu0X07FFeS8aXoBNJDK8mQALk?=
 =?us-ascii?Q?zdK0guZcYvQLIAIJ0V9ItVinlXjihRU5kAUdKS+t2yZRIoUjEhCtCOnj1vE+?=
 =?us-ascii?Q?WFO7C+U+dHoQTJ8w5u3fh0s/DnLo3GecVBbMoVzRJqujv3X8Uq05RhY0LPUt?=
 =?us-ascii?Q?YDN6stkAK6I0Osyqf2U7cSBZmGD2MZAgNy7gmLa3K3HZjHNn0pa9cP5vcz+N?=
 =?us-ascii?Q?Q2g1novqAeE0qfPZzDStx3MfaB97m9jKN6jTJqZ2OqccAo1M4h4vdxB1PBHH?=
 =?us-ascii?Q?B12h2LcBJgEovroT+3Xrc2F+a0aa/vIjY98qNBYYJYSC+Q4yUlmTW4Ly4SV/?=
 =?us-ascii?Q?blrcUHduaXsqR1l2EZwVp/JrveMIkUqt8EvW7bwwK7M7P7NosZS8Vg29/+C6?=
 =?us-ascii?Q?8jeKX5oZHUxoG9VH1T8t5/gCJkc2Itp8xsw8uOJVXxFunrLxr6VbUueprvHm?=
 =?us-ascii?Q?bG3Gz/HlOzHDm+dk9miW9Tm9Shuj0g3Fd8y5+RplVjneOcrw6A32SvP0e4Hq?=
 =?us-ascii?Q?eyWwffd2nHKalC6HhVWuyhuD4rQy76U149k6T1m+vStBCGIfFN0LwHrGvz2Z?=
 =?us-ascii?Q?7xmfnY9t3cJ1FT9HTcRLaodsdu0xhciipxDbW91x5FdSWJHjx2Dv7WBws1Xp?=
 =?us-ascii?Q?pwbSc3YjQZAnDqm4rMX67W4JkFUDViwXnfWJn1+YjQYSQA0YXRapY4t2A608?=
 =?us-ascii?Q?qcI4Zmh33S5hMBflwIWAQK19AFEoSyg+Vv/AyNL7/DCchmUDqVgeuR2NY3zP?=
 =?us-ascii?Q?HJNsI3+Gg2DAIxENMs/PXP4XxKV0WcaHilCscZHXwzzSUCEP/sP4kotVcWyy?=
 =?us-ascii?Q?pA0th9+3w440Y2RYyoH8lg1IXW1BJXe5aKJAvOdEUUT37mZfs5XUvBILIwMN?=
 =?us-ascii?Q?WQvefOyrJRLXZtjHEK5NVVElNk8jopinNKdbX4uh/GUcmQ76feuR3zqjUxew?=
 =?us-ascii?Q?tHEqshvC1+jg8yv+E4aIf4r7Ig30tyFbRV8tnwaPUzttLM9dIt7I3DLkB72T?=
 =?us-ascii?Q?GTXw97U5X/oZv+9kTauaKOsBmn9ow68bFm+vZ3SkZw8SOeeNFgAgDECYy//n?=
 =?us-ascii?Q?9NdPrhR785H8hta+V2YT7CUnjbCILUlmHqGJhqUjVxtd5mR8Sp10VbheVfUn?=
 =?us-ascii?Q?/DF9eXNTf5N5AJt4l/OtBDvWF2K8FXBxbfP5aHV9evX/sSbHOlpQ0X4IlUev?=
 =?us-ascii?Q?PbzY7f3bRxdeysKLnhpUPf6nN5ItaQeIKbWNO/PN8ENRDg3unAOIdt8c5s0D?=
 =?us-ascii?Q?yArJ7fzK2ddURs0EfLMdZyMeXznchVmgf1g+lkPDsA/AKeHxNexJ3tMI6JmN?=
 =?us-ascii?Q?OLx0wq+ZkadupOgKVFN7tpy9pnGKg9E883R3zrrjkD9wo/ITbiOLHOjjYSup?=
 =?us-ascii?Q?BlAuqjULVqcR3UvUIK93GmdLCdPpVc6dxctSA0IFsCY0WNa/PKZylwfujDaY?=
 =?us-ascii?Q?6Wxl/7xRcbWR7qJzaJmlJT5ysqGO3QOql+klpAtE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beaf851e-9e22-487c-d2f9-08da7097946e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 12:49:15.8853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qka/pNoPAkDHVqlgcgkDMsiHRW/MtN8CVYBmvwZM9o+FZJNFtijrqKKbOW7TQmrPtnLkwdgL5UQnczt1l0szVVdV3smQOSdeGkxDPZd8bqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6134
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peter,

> -----Original Message-----
> From: Peter Suti <peter.suti@streamunlimited.com>
> Sent: Wednesday, July 27, 2022 3:36 PM
> To: Liu, Chuansheng <chuansheng.liu@intel.com>; dan.carpenter@oracle.com;
> Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Thomas Zimmermann
> <tzimmermann@suse.de>; Javier Martinez Canillas <javierm@redhat.com>
> Cc: Peter Suti <peter.suti@streamunlimited.com>; dri-
> devel@lists.freedesktop.org; linux-fbdev@vger.kernel.org; linux-
> staging@lists.linux.dev; linux-kernel@vger.kernel.org
> Subject: [PATCH v3] staging: fbtft: core: set smem_len before
> fb_deferred_io_init call
>=20
> The fbtft_framebuffer_alloc() calls fb_deferred_io_init() before
> initializing info->fix.smem_len.  It is set to zero by the
> framebuffer_alloc() function.  It will trigger a WARN_ON() at the
> start of fb_deferred_io_init() and the function will not do anything.

Please show us the WARN_ON() call stack, then everything is clear. It is th=
e driver itself issue to be fixed.
I saw Thomas made such WARN_ON().

>=20
> Fixes: 856082f021a2 ("fbdev: defio: fix the pagelist corruption")

Don't agree with such description.

Best Regards
Chuansheng


