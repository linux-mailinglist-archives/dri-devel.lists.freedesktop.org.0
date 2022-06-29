Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92055F5C1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 07:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4206E12B1DD;
	Wed, 29 Jun 2022 05:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0823912B1DA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 05:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656481105; x=1688017105;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qnQ3XgeIy9ibzlUK+z2AQgxrA9DojBvQcQHtZmD/PCU=;
 b=QaI+PVBEDlBxvFPUYRS41UvKMrY/qRrm3s1xY4moyCRfpgKem8mNXlQn
 8IwdZNk9VXdWwvcyFAeVnd1ykB3p0tslQ1gqMtRHrwxaUgGfAmg+dhN3/
 cvERIOUxoSpiRVrzohn4h/aSr3GVZ9I9W3ok4HF2I01uUzxrWRf5XN8qq
 qMMQe2qlwNWB23CiTKiVcjUoC6sR9TmlyHgMoZBGzgLoxmId+Frbqmv5h
 1luOls+CHj8wj9S4XYlFHvaQcJ8E8HzPM7clNly8/nw0OBz8uh1gHaqNi
 xxky6Pg8m5tXT9P8ocinQtxUehOra8uIx0K8jYnWP3FDNxFHajZkf76/9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="282662754"
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; d="scan'208";a="282662754"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 22:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; d="scan'208";a="590565833"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga002.jf.intel.com with ESMTP; 28 Jun 2022 22:38:24 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 28 Jun 2022 22:38:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 28 Jun 2022 22:38:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 28 Jun 2022 22:38:23 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 28 Jun 2022 22:38:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5SrQQOv9kkYX1jhTV/4hW4DfrXLSL0Q8KF+I/HtTMBzye0Es0aYqTWQYJYvoW8KW97prMa0w4eZ/QgJdfVw/7z0tZBFRXpn1V7KuNjxyLEK4vfmF685ds1FaovWbi5GDLVYb8CfF6I06/E8rXzdr7mQuoBdBt6WDIdUv2AkfWPHpnn0DbsL/PVzy+AqUVRPUvponAi+g9rqtOclodkfjbCaZ/8gVi+Azyb3yE9JIrLjWPxxJOolJipiAR4x5917S5h4ZRJBNeT+uC5KpWx39uMeqQ/UzrTYXjXqch2xWP7PvBvjFutamcyQiEiShlSbXY2awz6PO3Bs1o16Ibsueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2Co/6NxsQwaf/Bj+hgbyqK5utn8wN98IYLeje/U3cA=;
 b=OkXy+Z9cteU8DVnO+aTaRpto9jk95IegCC6dtcIsAzKGtmnAPIBzdIQ48rGFK5Soun4vcKqbwgQ/CdvAPhlOMXTrPHJ4/lMw9yiDMf/LYx7BC9n3ZDJiFHUazAXZF3p67TS8UpZLQlwsNhlTE0fIsTJgXL284z5wDsOgMoB9+FcPCl+zAoQkH1h2npHlJmcCtC70zGyYU+fCL5wwalKnHsVPE3bYlYA5AwB1kG1dmNRirrDetixuTaMDe4boEQYB6XqlSxjugBzXpR+Ih3SWAP4lfPOJ34lCJntDVsinP0igLMKDKA/ybahyGzMX7MKNqznhMk7O32MIKWlUh9lEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 CH2PR11MB4422.namprd11.prod.outlook.com (2603:10b6:610:4a::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.18; Wed, 29 Jun 2022 05:38:07 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::3546:7df4:c8d2:1152]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::3546:7df4:c8d2:1152%5]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 05:38:07 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH 2/2] drm/i915/fbdev: suspend HPD before fbdev
 unregistration
Thread-Topic: [Intel-gfx] [PATCH 2/2] drm/i915/fbdev: suspend HPD before fbdev
 unregistration
Thread-Index: AQHYhx+9jsPk0NKfiU6VUGYOe6oFBq1l4IQg
Date: Wed, 29 Jun 2022 05:38:07 +0000
Message-ID: <DM6PR11MB317754BAC87AD15EF47D274FBABB9@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20220623163813.1990801-1-andrzej.hajda@intel.com>
 <20220623163813.1990801-3-andrzej.hajda@intel.com>
In-Reply-To: <20220623163813.1990801-3-andrzej.hajda@intel.com>
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
x-ms-office365-filtering-correlation-id: 02643abf-4d64-4086-11fa-08da59918bd2
x-ms-traffictypediagnostic: CH2PR11MB4422:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sJHs6kSRmTZRQEchBqUhtrcNYfmYoSJvYXoCo7H7KBdDVCDOARRTMftSiDg63fktvqPAkea2ua2/B56mNsWtZNNRtWC894xXaoDOWi8wV8TOceTirP9HGSBf5ADtG6LDIAIwaBAKX1zBYg4TCpYc5Sa8JSBq+j3cqq/xdgeAYJqjB3RNNRYkKa5RgGqp1OZqUFD9XFoN4reMlWz/kDh4EtL2dGoUqIoLKeM+3AXChI3kAc+OTvB9lqsFbglKdp3hkL/1FiFaGw85SpjaqYRql6LzS8PZAOjUX7vQh0uYAx88Yk7Fn/X5aeN/2aQ8uF3aD1A4y6K1RJUSqSl/sDWzesgsUzOQ7ksO8bOarPsDoEH3Z5j+Rycfi5O2zg6KZG9tYcS8TlTjf+69nf7JHplkjQZyY/mvoNkbjsr+/yhbj5GCjVXznqAEcZvspqXNlfzRgtRhgCfZqrOCpK1wLGqefUZaHrfXf+Xrjda4n9/dceayu4b+gR1K62l3zjWPGuI4Vestg2n20ex1f76sbwPK9B3pF+EWKRAkQ54od9sU14TReAG0hK8NTO2zL9vmoDa14Sdi3FtC9D6P1V4EmCvNJmFDgzdqhyYMNTv+sp3tndc0331xs5vIRY5nrjdZxKWrrf9qe2Fg+RasolygGH23vCPHy90ifRrwkzGsu7hEEMjvkAY0DHqlvBftogfTE2pWjM0IpKNv9Wb5Ern/zm7M3zugGFZv0VswJDHpTmURQHvJ9R4nZxSuoUIRejXiUsUnX8Mi6/nRNaZ8s0jGs2z4i6xKS9hLie2k0A1fOfIZoKk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(396003)(346002)(136003)(366004)(52536014)(9686003)(38100700002)(26005)(71200400001)(478600001)(82960400001)(41300700001)(122000001)(5660300002)(2906002)(38070700005)(83380400001)(8936002)(55016003)(7696005)(55236004)(6506007)(4744005)(33656002)(66476007)(66446008)(64756008)(4326008)(8676002)(66556008)(66946007)(76116006)(316002)(54906003)(110136005)(186003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4hCfS/loWoFyn02ilg4Vdpt6nu/7eEAGzOOb7el0b3bHdWcL4kQT+U+Wrh?=
 =?iso-8859-1?Q?ZgdMrt3pSTqEBA9Y28eAqt0IytfO5Q3sgu98p6EUTRa2pJD2dTturPFFC+?=
 =?iso-8859-1?Q?AWsPbPE8b3UEYpjZ/mU+ZiWr8phUUC8UCi5qu+yv9jNBLH4XNU8707Xw7+?=
 =?iso-8859-1?Q?qoMa+I8bCXQB8dC8dSKmppRcc8UG95DgrX8LVWOCZlRv27agW9b4lc496J?=
 =?iso-8859-1?Q?j/UvBtTAVKyLA7XmfqVxQfzDXiyJJ0SCnKRvv4alXztuV5KuL1ZD1m17pg?=
 =?iso-8859-1?Q?4gUCJvtjlxvLs11TgbOygOwidY8loFEb/jX7JYOgFWKMUubJnkmEm97f/+?=
 =?iso-8859-1?Q?X9TxVBc+HzQnWcukr6W0FijcmtPAsmZ28SG/dtyHjnNqZfTjtvKJkneDnU?=
 =?iso-8859-1?Q?fKIZHvAlUCqwuBr9KIQ2+AGbn4Ax3NL1g80Loo767Jiqasa0kSYDnstm5C?=
 =?iso-8859-1?Q?X9Q/e7DeIQU1fCyOoMVW6/Js+jo0YgIg7MQfAefr86YGkgt3ykVdnWjQEq?=
 =?iso-8859-1?Q?35Jxheiqy1q9ZtQyrn8Q4azlyPUuGwc5eEzkHNxk9cWjgkHxt1G8ccpXA4?=
 =?iso-8859-1?Q?P6Cb+w4CyxZ8q8ukKF1h+zshZ0HdsMbRMRltYGwoPnDlGjPzpc4h9GEc+4?=
 =?iso-8859-1?Q?RZTgmP9v8hcIuzwAD8OLyM1Z2XZ5DImKErdXqHuqCvahhdYbUSer3Wmr4e?=
 =?iso-8859-1?Q?9XgqOy5TiiuSGz3wrEFB16RudDmSWxOskXL7xQ4rV73O8gRczFAaFvyGAF?=
 =?iso-8859-1?Q?mMEEwKGcVLfwqNYgEcBxlMFhXuy2O+dSWOQHfxlGJwBnicgmHhNgRDrv50?=
 =?iso-8859-1?Q?/qHGRAUyqop2dIw3F1XYoVmUi5UHdASGbYX+k8ORDUNTIUyMK0krQ1RO+Z?=
 =?iso-8859-1?Q?Qb7Jt/QUfe5/HNNDI38oIy6YorjkCGS5ToBD5meX6K98E8XP7noH5pS+3v?=
 =?iso-8859-1?Q?eu5MITarApzL/spyuCMLfHrWHo7LdcinEc+ozekU+J6K7/NGpJ7H9Twvvz?=
 =?iso-8859-1?Q?FHgCG92Wx6Q5V5ePiDjiQPPYDBHyPYBIeGHvKaxtSlkS+JzPkV63iV3Eqi?=
 =?iso-8859-1?Q?LMDozR9A0O0spa+qbKaqhq9jpD3mYQ0aGh6FaDLIDoxfza6H9Qz0tm3Fzy?=
 =?iso-8859-1?Q?n4+aEJ+PjXlI2caZRDDg3T4Ffq8cmKRYkdxKuOPPKQ9ey15ScjSOQjbg4D?=
 =?iso-8859-1?Q?PkmIFuJT8n+h9g+KpDl9CDA6qrCjfWPcO6S0uKwzH0kChnEUmqorYwdowQ?=
 =?iso-8859-1?Q?C+lKi+0RyN1LehFpud3LknTy7ZcigpnV4uxye0RAyq+YCAuF68HpVqRSfP?=
 =?iso-8859-1?Q?RNb7hfxaxEeyEwYOROflztKQW/7FurHi0ealUeWbIBHRJV+2Dguy/LMVKP?=
 =?iso-8859-1?Q?NqeyXyrcxglVVju5LdLv3JNyubsJXmrYcOjWHuxagUmw/JSok2sUSg0wrX?=
 =?iso-8859-1?Q?ic64qQKqfFBdg2Se2dgfIQcDvxNLzCKCvRjdflH6XLwr75cF8FM0Z6GTtR?=
 =?iso-8859-1?Q?ltRdgK9XJmpRFmQv/+IYQBxBn6ghPQsl97gTaicuqxvGQ0itYdNJ6aqIR/?=
 =?iso-8859-1?Q?j0mSSFhMp+mlU3xWeEo3c6zgzJ0Z8CPv58lFyWBypMd/lMaWmg/lxgNz9J?=
 =?iso-8859-1?Q?Mqs8XbEUTWrct1LtOkDbpymTPlpk5n0m7a?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02643abf-4d64-4086-11fa-08da59918bd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 05:38:07.6964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IFCZ93xqfbg7hjSdshYm/MuLOlccgi4q8NHjwmWEPc2Qmzo/gR78tpwx7z5dbXcQrWQ0/HODOhPJFB1MMXZRXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4422
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>  void intel_fbdev_unregister(struct drm_i915_private *dev_priv)  {
>  	struct intel_fbdev *ifbdev =3D dev_priv->fbdev; @@ -573,6 +594,8 @@
> void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
>  	if (!ifbdev)
>  		return;
>=20
> +	intel_fbdev_hpd_set_suspend(dev_priv,
> FBINFO_STATE_SUSPENDED);
> +

Instead of intel_fbdev_hpd_set_suspend(), will intel_fbdev_set_suspend() ma=
ke more sense?
If intel_fbdev_set_suspend() is called, then the below cancel_work_sync() m=
ay not be required.

>  	cancel_work_sync(&dev_priv->fbdev_suspend_work);
>  	if (!current_is_async())
>  		intel_fbdev_sync(ifbdev);

Thanks and Regards,
Arun R Murthy
--------------------
