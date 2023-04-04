Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6B86D6BB0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 20:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE41A10E1F4;
	Tue,  4 Apr 2023 18:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31D910E1F4;
 Tue,  4 Apr 2023 18:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680632598; x=1712168598;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S3tOloQDhVEX+cKunWBcX5Fs5K1WP5JxE4qf9hbn1Vs=;
 b=HzamtAeGeW8IgTG9mWpTQbe+OtgcW+SAIOh49dLL7nZOlSvpSNhdoLMu
 k1qRz3OkYvmKN0WCKvGxSNnj/ZhrVhFuv7h3ls1t8J2wsa63b4XNrSPHz
 ZzJ4b49v8GFCPzu1x7teSn5vTqgo6/ojnoYLBx0C3bdYTum2EQNFPDlvE
 yNhq5JLsGofHXJ+Uo3OoS2cQucb/P7H/oe/X/2rAg6CSvwrbSkWYy/hxx
 YTJfEBRFhMyDm5JHwZoB+ij1EKrBS+gsInIWBdEMer/wZU1kiFzYmNmQy
 B9Eqm+43T9r6TVam+B9I2og41EnQrSElQMPIJhUPd6oVznAh6MhRFZ3UT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="322653885"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="322653885"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 11:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="680000495"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="680000495"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 04 Apr 2023 11:23:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 11:23:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 11:23:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 11:23:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqC+EoPeFcOvqckW391K1ZxOm76kTZroA+6OGY7M1NRJG5U+KpQcVKzt/wIEKuL+PvzQQZOP8WeuODf+Pg5jS9UeKoyW+PUR3n0Jlf+dG3eW8gbHkOsocxhP+qrthyNyzQF6ZWs/ULnU/KqgbEMhZj2AdeBzlIncKWEI5zwan6IKELSwJBOhJP2JrN34nLRUQXX9mIuT4xPr1EmwwxTkSom/6yqh6GjkMLCB0rbWtZme4SE6wgeaXigHiYNoSozsyzmBNYZvrJuq8I8yWYEYYuV6Vcw5rHSvYffOp+6kehwAysv1SOnDrc5I8dw/L/MID0qeEAIku8Z4BkOduHRpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmE1wiJ9wTZnPma9Ybb+ljgU1NMVHSqmtkAIAwo8DYc=;
 b=NZvP4tneLKJOQ2vIgZWRjMo2VzFgR1e+P1xwp22EuYTq7hd0Hm4MrB/PY0d5qozktwYWsahCwrLpQHAwV71b5y3jwtPMl/uZP9aAyM2Yfw1RjsTSxd1e6RtGoEyAzg8i10F4OHfWOvNDzoJ8OdYs+LtEV+CoyfRpZbJoMd03wPz7YWlQ0CegGib1PGyCuek9brYN4aFUQYPZH0dfxJLGFR8+zPPh30Wv23Sknr5U3b/D+NFpHIw9KxGdjFK3iE7KwkPb7+soQLvZF4/NqrjcBGG/WgvnJqVDhj7fKC+Q6RoGNyFY++zPzIIHqCm7pgfvIxg4WIf9fLY1G8UkBvwbig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.35; Tue, 4 Apr 2023 18:23:10 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::df8c:4a33:f53a:9a2e]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::df8c:4a33:f53a:9a2e%9]) with mapi id 15.20.6254.030; Tue, 4 Apr 2023
 18:23:10 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v3] drm/i915/mtl: Disable stolen memory backed FB for A0
Thread-Topic: [PATCH v3] drm/i915/mtl: Disable stolen memory backed FB for A0
Thread-Index: AQHZZyE5lq4ywpcfykqF4Nqf+y906K8bdojg
Date: Tue, 4 Apr 2023 18:23:10 +0000
Message-ID: <DM4PR11MB59712413E17700844D310CAC87939@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230404181342.23362-1-nirmoy.das@intel.com>
In-Reply-To: <20230404181342.23362-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|SJ0PR11MB7155:EE_
x-ms-office365-filtering-correlation-id: 2e1c68ad-a89a-45fd-ee40-08db3539a52e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T7sEFUikRIOao7Xe7NQDWwO4z+7M7sOgNpzQGUxd4h5R4zR1oCwwswyZpJYS1mQuKFfVyoMMuBwOpF5roAAkjxaAD7W/Sb3mOZCux6opUm4jo432fTctqfbUIqKQINa/XLCSB3Lk+uuzuleyLquAtCnA0p400ur0Vk/mvCFIjaGexWrWswb1JDSfXsp53HXy5WAMHJ/5WzWe3xX2kp/WyMfJ3tYwn1sedPOSQazx+Ax/2JaeJ3mQyxSgTDyW6zZI5qMRtx9cfHZ0JnlRHy06tVHrnTZhopDrgEIaU/thqbFWdJ6HbM7kBwdRJrnTP8We33w9CllTgXb1+n1xcexvJXG9lnHCSoJyKu+lnOOIioArUf22J6+PxKVPJbFxiOg+G/hWjrnsqFvn3z6JPuY9Ru5gM7ozmZBcbGXfMBMBNEulaGqis+L0exyYs9z7THAliG49C8W8aBuGJcbpphOjzzQ2jMJoml/CSVzyxkQR4uWQ4EjbrX2bDiPFb+TBWtWo9ORmcqniy4XI1+Ibx0awXr5NjP8GJJAt8bE5SpYPDuDaiPTEEk/oULGICtLnSc+3w3qBwOnPaon3opAK74NUvx6uD9OzQDuFq9KZ3QJrSX/TthE/CbmbTnogzimWvZdn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(71200400001)(33656002)(38070700005)(7696005)(186003)(83380400001)(55016003)(82960400001)(122000001)(38100700002)(26005)(6506007)(9686003)(53546011)(66946007)(76116006)(66556008)(64756008)(66446008)(66476007)(4326008)(110136005)(54906003)(316002)(8676002)(8936002)(2906002)(41300700001)(52536014)(5660300002)(86362001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iZqhzltRayvqsNjiuTCqSuqesh8VkqZX8LN6WAEcheLfb4EjKkWf9ME4d1oF?=
 =?us-ascii?Q?TxAd4efY0DPyCgyloi8/Kp/yHZ0YG+2KBwMu61MObIYLhy/iDKm6AmiVWYtA?=
 =?us-ascii?Q?laj1XphUzfEiHF3OkK8DsCMoateK8McZKU6LJK4oi+8E7hw2YF19KCZjoGLB?=
 =?us-ascii?Q?7IIKwlK2elufTwqa8h1L0yFgqXNLDZsi9umme7VsMQz3f63OTI4iSEsbOxX3?=
 =?us-ascii?Q?+pud8Ob5KgAfHy2I5uKNHda9YIpi1OkNd5YsZGuNvvu4bOBKJmKVxMSV6gdO?=
 =?us-ascii?Q?ABroXFSSEy/JutXwC+Yb8bzWYmESorpTsVxf20vzTkxMDDcJQ6juRUaFlp+i?=
 =?us-ascii?Q?p0Jd0O1BpTGffj3/bu7DF+g6ADLMckY9CiklkBpXRd8COQVzFvvLqWyfNcn9?=
 =?us-ascii?Q?LrKtgjXYGtNjINcaWaimY3IgSXmxPltCmaQsjQ9repYPcH8YGaPnVpDS/E35?=
 =?us-ascii?Q?nh1TULMevI0IZ3pGPOVjJasjHQ7uotlY4TG4P+UtzoON7tXPMlhEsMcVM0eo?=
 =?us-ascii?Q?t/yzoXKjKls5Xb5QIpjWKdIE1/ycSMBFFkPs+RvNYpZEsToz0/bg3HJoy5XO?=
 =?us-ascii?Q?DhMnY07W+UDCt/8VbKN8ING85KqHuNw7oKk4RM2d4Sbt3LPwuDxhSK8KKeK0?=
 =?us-ascii?Q?yJyY/NZJF5llWqPaz7adUlHcuuJcfRu35SbISFJRUHALAmKKFDNuSPiz+JMD?=
 =?us-ascii?Q?L78DE2nxd31/dFCOn9x3UoLzJqgBxJDywULSaGfUJ2SS1LDic0/OAw47w46B?=
 =?us-ascii?Q?GncnjS1cz6LtgH8jZbC4KeauKhOaqfDeKJYHBksACiYKRRyuSc7uGQUoOOhh?=
 =?us-ascii?Q?0RB4eq9Z87TCWqLARddBKmQYs8xqDhROq8vWB6AgMZwxG8cV9SBe+JQv5nwB?=
 =?us-ascii?Q?1DUzhPAGCc1BcJ7OEuWyFpoXWk5wDvSdMJ6howEtm8IWho7Ws0N9UJa8QFgF?=
 =?us-ascii?Q?6cHrQeVm/dAACxclv6nxAwXjrEFvqKNk6U87GdpYdsqM1l0yZL+ljfJnQJtF?=
 =?us-ascii?Q?x+0XvkM8Nn6fgHJW1jjfqPh4LJHdYLXSIxyA2hciqrt8s+6JSWUnGyctIwCU?=
 =?us-ascii?Q?dVr3e3Cu3Z4z30Un/xJWcl0Gir3c16CMfO1QYU7TO8SE69UecstvdUpuERDe?=
 =?us-ascii?Q?l8PVkHjTpet4TbYjx+w6rLbevQ2ol5VsSkuXQYE0W5+dCEeGOLzknWS5XbPW?=
 =?us-ascii?Q?QjEMaQIVvCwIEbvDcM8rWHgd8/cU9ISzG1ITIsHi5p+KwDntQKe5GdxOGGcz?=
 =?us-ascii?Q?OVQ1mssh0t+M3CVZrFoSltOIThf2YPeH6Hs4Q7RDjrQ6SU8XnXMqFWONmqxe?=
 =?us-ascii?Q?mOtC9YG12V5KdInm3Km3U+lz9y7RhtfcPRo/OdVGFKb3vWWDd6/Rya5cPSwT?=
 =?us-ascii?Q?56knB+J3nhNxhv+SRtBEVL0MrXIgc2YekcmJCb0Lr2xoPF14CVbq8mZmS6pL?=
 =?us-ascii?Q?bKYjMLtD7SRGzYB96XxqYrUzNcGB+cgH4GUpRr39+m5aN3aAdPxZBAHUn1Rl?=
 =?us-ascii?Q?RSVA24lJ47pbytNLDc42SXgbzS0TM+0a21lsdujNHrmHEKxaJJ5oup2KcJ4P?=
 =?us-ascii?Q?eOj9Uo/inPD5E1yaGCeFpB2IVEb8oWDDC2TiDLW3P6ABwaybhvy23rL7On5R?=
 =?us-ascii?Q?pg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1c68ad-a89a-45fd-ee40-08db3539a52e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 18:23:10.3349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1g+c3HUycvs648uCqSHx/PrqfpMKAFQ+/4yCxRHvX/JDlBUXqKsk5Z3FwZuUxnES51mKlyiIJ8OcOugo9oZmieAXlvpvDv4j0pv4mWmEzOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7155
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Das, Nirmoy <nirmoy.das@intel.com>
> Sent: Tuesday, April 4, 2023 11:14 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Das, Nirmoy <nirmoy.das@intel.com>;
> Auld, Matthew <matthew.auld@intel.com>; Andi Shyti
> <andi.shyti@linux.intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Sripada, Radhakrishna
> <radhakrishna.sripada@intel.com>
> Subject: [PATCH v3] drm/i915/mtl: Disable stolen memory backed FB for A0
>=20
> Stolen memory is not usable for MTL A0 stepping beyond
> certain access size and we have no control over userspace
> access size of /dev/fb which can be backed by stolen memory.
> So disable stolen memory backed fb by setting i915->dsm.usable_size
> to zero.
>=20
> v2: remove hsdes reference and fix commit message(Andi)
> v3: use revid as we want to target SOC stepping(Radhakrishna)
>=20
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>


LGTM,
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 8ac376c24aa2..ee492d823f1b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -535,6 +535,14 @@ static int i915_gem_init_stolen(struct
> intel_memory_region *mem)
>  	/* Basic memrange allocator for stolen space. */
>  	drm_mm_init(&i915->mm.stolen, 0, i915->dsm.usable_size);
>=20
> +	/*
> +	 * Access to stolen lmem beyond certain size for MTL A0 stepping
> +	 * would crash the machine. Disable stolen lmem for userspace access
> +	 * by setting usable_size to zero.
> +	 */
> +	if (IS_METEORLAKE(i915) && INTEL_REVID(i915) =3D=3D 0x0)
> +		i915->dsm.usable_size =3D 0;
> +
>  	return 0;
>  }
>=20
> --
> 2.39.0

