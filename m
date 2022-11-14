Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DFF6287F2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 19:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD7A10E037;
	Mon, 14 Nov 2022 18:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA2610E037;
 Mon, 14 Nov 2022 18:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668449515; x=1699985515;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OR885UDdwz8zbR/+fPAsQDZ0l9SQGzPf2KIhjxr8jb8=;
 b=XVllvCscbq0f4ROjk/h/KhGtpirofImD9qL7qYDtFY8gzDPz1Fi49xkd
 +bAm2Xru9H9/vcbQ3IAY4PGc4Q0VgVavIo9a1Fzp6lAYRBMjqYFI4Fy4e
 DX7HNczhgvu49IXb9zmFUfL6U9cfFg5yJ5lQKQ4z73HwrLW0FKzRRsj+V
 4ae2CW/BH3Knz+UwcwdDF7iRmhFxblAO84lk7CJvhuGrvzQ7bT+H/Pr7d
 HdOdTJuI3x80Lbb5z1r31WViyyYcoRtQl/tij7iLNyJQqvsKKAZ90OzB5
 0lgNNHgbNEHHTfrWUIaJkrY0fT2RFwbgwaPGQ9Ve3dDmOVepVFqTthXPT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="338832301"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="338832301"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 10:11:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="727626306"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="727626306"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2022 10:11:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 10:11:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 14 Nov 2022 10:11:54 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 14 Nov 2022 10:11:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8dSe8b3vnN5rcW6Eo10q8u0gJvd7Glj9TeaHrymZTcQQnZ+TZv/K03P8XsGnZkDxntPHGu/lyiBcC1Jq+4dPPNMdmTxBd6cwqzM3tpSEeTEeyWycaQ0tclT1raBTTvWynHvEh1PxmZP012BeNz/8bwLyAoQMDJfB0EbNEBOcMMgwmuAqJRvn4uqLaB1ufy8qmcFXsn8Hx1V8q9fXQN5MCwiZs+K3PCI7rjPftWlKNDoLvhzWpoZcTEa5cG7zmnXiUTp3KxUzqWZZk7gOkuea7z7heRpr0+dutYPcp6lVnQDZDdo6R3h9qcJVH9MQ9GH1xlBa5ohUrf233xViNxfgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcyDZSeJEJuX8jK8hw3xV6J1Ggb3Rrn8JnoVTp3q1e8=;
 b=PLCEH74q9C79n6eLgHCx/fI7VwYEI9HQKzFOHizkTiFy38MYce5Z6mQ4Y+Zeg46DdN8q88GbweHoki3U6wgveQ6SeH2Qh4tzcfKubHdpi7xoLvgRxX0GtJiX0XLPUTjXqusR1mP//7N/bpBMCtV9uQ7EBbkPiaTsNvc3EHIPElKEaI2iMCFGzKxst51sdYF6Z4SGzV7viGUBM6QVqqsYZF9VL3KUATmBAyUF5PKg0Szn8+LdeQdj6R3+bkOhwkhUkxZuydh0UH3Jb/90OJGByMB8np90gnyookvO+6G64LIEvxBp8AQ/LeyO6CFUBGJwt9eddYj0hMymAqzscY8C4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 PH0PR11MB5807.namprd11.prod.outlook.com (2603:10b6:510:140::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 18:11:51 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::793f:3870:4550:8aee]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::793f:3870:4550:8aee%8]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 18:11:51 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jakob Koschel
 <jakobkoschel@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2 1/4] i915: Move list_count() to list.h for broader use
Thread-Topic: [PATCH v2 1/4] i915: Move list_count() to list.h for broader use
Thread-Index: AQHY+EVNLB0FKkvj5EatDeG8LWjtS64+uCEw
Date: Mon, 14 Nov 2022 18:11:51 +0000
Message-ID: <DM5PR11MB1324523623D88188493D7518C1059@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20221114162207.62559-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221114162207.62559-1-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR11MB1324:EE_|PH0PR11MB5807:EE_
x-ms-office365-filtering-correlation-id: 544a6bd1-9bd3-441b-9ba7-08dac66bb41f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: afGjh/oBgOVI4aZO8p3qAXhtk6V55tK78WbkphKRykL6joQRPvMrNW8ZTzjLhWmSyld0cOtnBUFAd8v7Had0dQnqedlVp7GtACoZrbvK97zLb85fWFBJNtmrOrOhQo/a4Uz27a5wC1faFaB05PVkSxpK0rFPKXzhid4r0feVNeIOIrrytjq5T/xsY4T8k2U6dkdMz3t2UToDcpeJE8PnCDBCYjuVk/bvVJ4eroNHp1Lxbwgv9dr+ueiRn8quP29PfEBntzZwX7ob5UMoZe2W0V/H5RFs/9l0E0uReQfKdRduclRBNQrzClgHLI947FjLPKnTRR/P/w/oDSD+olr0edvm31aA/1FJArFeoFmfz7WCeI0CwJR1Hgivwo2szbzLIFwk2TcS7YZXuesPfFho4iIr+KhD2GfBBbB1NPJ+nGNUXuJsqkkv/TNETfsptB1CXgvnt5dAyFCHVn/K8Fgr9KHfHYq+QgEPXROTtc9TVh0qKOCNR+uzqiiQPTu4+I9cnJeumeIndwnaY2NLLnhZdm7vUMSuI5lIiDBUQ31Ww/jxiGERz3u7k9a41azP+67y5tJHBuDorj+xqbhGhpaI45kxMpUuvjfnbFzV5qCIKOHlqjR24FcOhzlBwDJOwhbz5vXaemO+cN1xVsQVgkDL0UkWp9Ny4y45UxywWINyzwalXdj00nhUaRsQiUwl0ZHIJYT9fOc9cNpiNXB9uNNZwbdFiMGPTp59lq6tGcf2UHql8r0b4lGffLRIiD5KDS0uzMMPSP8ttFSszpuHdyVbGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199015)(71200400001)(478600001)(54906003)(110136005)(5660300002)(186003)(8936002)(7416002)(52536014)(41300700001)(6506007)(2906002)(26005)(7696005)(66476007)(66446008)(316002)(66556008)(4326008)(76116006)(9686003)(64756008)(66946007)(8676002)(83380400001)(33656002)(82960400001)(86362001)(55016003)(38100700002)(122000001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3XMQzCPMbuXS92Svn/XZl0GoGyApJ4kWpXrHB7PZCyNevcfq89MlXTD+zWS9?=
 =?us-ascii?Q?W+/u7JsOLKtIPqV3IiB9+t53yfvSK4a/1P++OVx1tmS1IuG6P0EMtWpM80gt?=
 =?us-ascii?Q?EDpDGbKiwMBTX1x9ELMvFCSL/BlI5t/RGTxjsDXMgmpIY1DoS0ybVtuS+axf?=
 =?us-ascii?Q?SqF1n1CEBA+KWGxv5LC1AwQn2DEvGJRGHV1zGS81Bgvc69isnXHPGMp1QuOt?=
 =?us-ascii?Q?asZxXDOIMHQS7RzCFwqxd2IrLnGXJIe0A9uttR5QY09aca/p4y4oPrr0uXnu?=
 =?us-ascii?Q?/iQMl9BPVbMKOMEgo2zcU6CDN0w68VDdhCWYEKjBSjVjAdoDwSQQbzULSIK5?=
 =?us-ascii?Q?KVz+HsWu6s5HjOGm72EriIpP1DchqO0NrQtut7lZtJkRxWDS/f08r3oFeh9E?=
 =?us-ascii?Q?x31uPZWkDSRrYLlNuu/fN0f5IHhHhcwINoQsPlt8id9GvcMCP3jxpPM9xhWw?=
 =?us-ascii?Q?Py4u71XiRzrLuCGlYI0UpGukzgr4Nu3YT4vBBijSo3pREfJ/efkFuMGTeJqZ?=
 =?us-ascii?Q?1rLbzn0eUjpeD8T5+asR08HffcDsJ8MjVlF6B+QajmbjJhMzRXUPF03AUsA6?=
 =?us-ascii?Q?3dMbQA9dQjbVhOFjuYEy+uXAZPuWnsNPvbFzkXM/ytssNeQ2sC+QC0CY21JN?=
 =?us-ascii?Q?EGzuXFFVSb8S3OHXI1kgmEu3Inyv/GNoqrHq/0hTi07O0bOQ16bV03VfBO5Y?=
 =?us-ascii?Q?MD+bUWXrsKBEd6PIkEQHtBBnvUaYs+5T9xQ4rLWIlOaoGhPhOaPTdGIo6lWH?=
 =?us-ascii?Q?kMDe2VwR5HUmNMDvxaKH4x3qqaeZ+FqZz9DQx4Mbvhmo/x+lsKZOug93dVtG?=
 =?us-ascii?Q?shSTWcVt2++BIm45X5Y1QhZB2NpMb10aPTg2cuWi6yx6t1ZPFQpg5jIPPMyL?=
 =?us-ascii?Q?phZi5voEmIoudD+nsiZy65b3n4QlHTegDMLvgUOV2I4WQGEI2In9xCP201km?=
 =?us-ascii?Q?3aVhkCwfSbVhkmiZzRQeeU1zx6Sz5mTvE3/Ppq1Rz0tn04vPe3+NJvhNLtB6?=
 =?us-ascii?Q?ewyd2nJMUAaXqJPv3CzljO0ZGcUv7IrWFuyE/4Ws4cpgBjRdbNpc8JleqxBU?=
 =?us-ascii?Q?M7s1u3HJR6FQYQTGGYNzI8dPoupDPM5DsJXnVqgFo+p7PwC6Y+XwqHZvQknK?=
 =?us-ascii?Q?3rQN1WpM9W0PuoIg1JGuZ6o3/UwoFnCylMKQOkOH6H0MjXnH7NjKBwgnXL3+?=
 =?us-ascii?Q?FJqrCvwR+v1lztLYzbowEXrq3uw/3B8wVoHRbENxqtK+xGe19Fq/WxIWw6cf?=
 =?us-ascii?Q?9UvyAQu2uk46+YiVQjbzh5V6BVYRgk7xIML4tFReiP/RTHn3WSioMZo4Ql5t?=
 =?us-ascii?Q?8ECrYeRMHXJEY047VF8NlJTllyqVM6OawBfqfyXbn5n9T2i39QJWQ+1ish0+?=
 =?us-ascii?Q?rDtoPajkjEsTLicFgw9rs1tiEwUETkIi566bn+BGGjROYKXa99oZ33IdsR0U?=
 =?us-ascii?Q?U53ujahbEnCqd2eXBeBXhVXO+UvbUw67q6r1vYte3EafJ+eVFQlbCw9qe3tQ?=
 =?us-ascii?Q?k1KgXuff/h7MyRAnpjEyVfj6CD4e8z7/1/aeeHvIdId9m44CBoAgL1G9D5OI?=
 =?us-ascii?Q?vIDyAeNdWguXN3x96INfkOWW/weAj+hQNuY9XKi9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544a6bd1-9bd3-441b-9ba7-08dac66bb41f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 18:11:51.1648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hYVqunhhAGZtgbPn8Egey2jo0kqHmjseeBYvcEIbV4Y8GncFdu4jVR8kmf1GfMtTh+fxphJ1sEYpRG21JIMgnqbRpk3g6laL92179tBXKqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5807
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Kevin Cernekee <cernekee@gmail.com>,
 "Nyman, Mathias" <mathias.nyman@intel.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Andy Shevchenko
>Sent: Monday, November 14, 2022 11:22 AM
>To: Jakob Koschel <jakobkoschel@gmail.com>; Andy Shevchenko
><andriy.shevchenko@linux.intel.com>; Greg Kroah-Hartman
><gregkh@linuxfoundation.org>; Mathias Nyman
><mathias.nyman@linux.intel.com>; intel-gfx@lists.freedesktop.org; dri-
>devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; linux-
>usb@vger.kernel.org
>Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; Kevin Cernekee
><cernekee@gmail.com>; Nyman, Mathias <mathias.nyman@intel.com>; Vivi,
>Rodrigo <rodrigo.vivi@intel.com>; Andrew Morton <akpm@linux-
>foundation.org>
>Subject: [PATCH v2 1/4] i915: Move list_count() to list.h for broader use
>
>Some of the existing users, and definitely will be new ones, want to
>count existing nodes in the list. Provide a generic API for that by
>moving code from i915 to list.h.
>
>Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>---
>v2: dropped the duplicate code in i915 (LKP)
> drivers/gpu/drm/i915/gt/intel_engine_cs.c | 13 +------------
> include/linux/list.h                      | 13 +++++++++++++
> 2 files changed, 14 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>index 6ae8b07cfaa1..b5d474be564d 100644
>--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>@@ -2085,17 +2085,6 @@ static void print_request_ring(struct drm_printer
>*m, struct i915_request *rq)
> 	}
> }
>
>-static unsigned long list_count(struct list_head *list)
>-{
>-	struct list_head *pos;
>-	unsigned long count =3D 0;
>-
>-	list_for_each(pos, list)
>-		count++;
>-
>-	return count;
>-}
>-
> static unsigned long read_ul(void *p, size_t x)
> {
> 	return *(unsigned long *)(p + x);
>@@ -2270,7 +2259,7 @@ void intel_engine_dump(struct intel_engine_cs
>*engine,
> 	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> 	engine_dump_active_requests(engine, m);
>
>-	drm_printf(m, "\tOn hold?: %lu\n",
>+	drm_printf(m, "\tOn hold?: %zu\n",
> 		   list_count(&engine->sched_engine->hold));
> 	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
>
>diff --git a/include/linux/list.h b/include/linux/list.h
>index 61762054b4be..098eccf8c1b6 100644
>--- a/include/linux/list.h
>+++ b/include/linux/list.h
>@@ -655,6 +655,19 @@ static inline void list_splice_tail_init(struct list_=
head
>*list,
> 	     !list_is_head(pos, (head)); \
> 	     pos =3D n, n =3D pos->prev)
>
>+/**
>+ * list_count - count nodes in the list
>+ * @head:	the head for your list.
>+ */
>+#define list_count(head)		\
>+({					\
>+	struct list_head *__tmp;	\
>+	size_t __i =3D 0;			\
>+	list_for_each(__tmp, head)	\
>+		__i++;			\
>+	__i;				\
>+})

So all of the non-list_for_each code appears to be an inline.

This which, resembles the non-list_for_each pattern is a macro?

Just curious as to why the macro rather than inline?

Mike
+
> /**
>  * list_entry_is_head - test if the entry points to the head of the list
>  * @pos:	the type * to cursor
>--
>2.35.1

