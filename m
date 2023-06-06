Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 805BE72423F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 14:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB44610E116;
	Tue,  6 Jun 2023 12:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDFF10E116
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 12:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686054909; x=1717590909;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rjS4jvJns154qZ6I8xu6Bq13yhy9RXKxCE/EzGmYIsk=;
 b=Ypo6eA91OkMLrGtiK49vRZiSqoIlWwcRPI04ISzF3iEGhaCDmBjDZywL
 2MiMVW9wuWER5xCoem/EhJT6uyoQfZGc0I4J7veS3XFIAtE+l83oNdUQz
 shDEZHDbNdLYkDyU/9cHWKgFNLcA/P4zydXJ1c/VLOIEKMIqfB6iyXc1L
 709QURRKV+8Q71eUDrvVfdRyEymI26swAVXMpc4ek/E9YBVAptfZHOvMC
 naUVEV2rWen1/5fQa71qXpoYL98s0AWzMkz3eAa4Tdtje9OedlQvNWfyk
 0Z7mpQkfaSYDZVlbJbBTQWxPbBtnBBVD1KvrBZXt0nzZ2ebkzXUYouLeq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="346254522"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="346254522"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:35:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="833208154"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="833208154"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 06 Jun 2023 05:35:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 05:35:07 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 05:35:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 05:35:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 05:35:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMcXjFBdH0Z6vAvgDJdL4RcG7dZ/wofQbigB8ZBa1I9/XNVZLIvH5AznmkA9DJi35vaQw4HdMHMziPvzLzUfz9DaPcyhVkijPXKbzXg1X2LDZNY5JYsdZ7iA3DVly7Z6FTeIKzI3ioKfS/0KpYnqfPt+lcM4Lr8xwm4Hmg/OOhmY5AI8etnNzuhnwhbbkCJr51o0Fzcf9hWYSggzA7rnXLPXBCnR1++D+1Eut3Ga3Ku2RDr6fCeqb14Db6hze3XxPDAlMsVODPXIH21YEG/iUcreHLsX0lcyBmIK8/AhzAfa/eedzhIolYupYU5X2EAVxEp8rHdWMnQcllg8V63qdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LA4AkgDPlwY2jFgPQUuwCvzCRWq9+c5XAMXurFIJEDs=;
 b=kTXy3N6l145A3yRl+Y1lYDlTlUDMcnV1Twb0HewHf2aBFuRxKmkt7cwrSmvzl/B34hIqUamDsYNdBcYzQc7eunHSH3ZeOj6pEEfy3MhdVNtUYPTd03aahrFw8xMqc3TM9WI7DNPxDvml2WfxhknTRxv1XVNcZcSUIujbfj+OUXlxhfhATnMMg5V3vXkO7VQPiJUV+q++z2bN5N7BNNFzjM0Uz4qjMDcLLFSjP+IdhcbcY8rdIOaakaqHb17v16EfBkE8vX06cOiG9JesM5iWHQV7iRmNSa+5enajAp5AR5aA+jOKaemPXdIPm9FKUKlI6Yr5ZV+tr01is8oyRmN20A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by MN0PR11MB6088.namprd11.prod.outlook.com (2603:10b6:208:3cc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.27; Tue, 6 Jun
 2023 12:35:04 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19%4]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 12:35:04 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "deller@gmx.de" <deller@gmx.de>, 
 "David.Laight@ACULAB.COM" <David.Laight@ACULAB.COM>
Subject: RE: [PATCH 0/3] fbdev/hitfb: Various fixes
Thread-Topic: [PATCH 0/3] fbdev/hitfb: Various fixes
Thread-Index: AQHZmGN2I72MSwXIBk+R7pCImqEsCK99tZjg
Date: Tue, 6 Jun 2023 12:35:04 +0000
Message-ID: <IA1PR11MB641863EB1C3839123D9D0BDBC152A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20230606104056.29553-1-tzimmermann@suse.de>
In-Reply-To: <20230606104056.29553-1-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|MN0PR11MB6088:EE_
x-ms-office365-filtering-correlation-id: 57d55cba-7a11-452b-a193-08db668a744b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u3Mhs4fT1O7u5j5Qi/DK5+waWwWw/zErtIVpw3iNaRqdOhX+QEy3WmurkccP11o9mQyCzcPHqJ3ZVEsYugSldnIgXnaFT2FpFnlKBMT/W0ElgFErOK8EoHgLfgKz4h3BkskotEtEGJH0ECsg89H9l2Vh6DBzlEl0ZNsFvU5uNE4v2QPjAoh4Z7uid2hNR7NW7jqQ+LTnZ1P96CCCioePE/Au9uz55j+/mZk4S724939JNandU8PRZArNqCcDpRQhZS660zmvuoT3T5TawhlQRKZoON5cGMbXrfM3S8BgQSGA1FYMUdCXxafNeucHxIT639to4B2dDF9Pd2tchaxk5j6ku8eDkebiZmjPYW4o3Zts2ilq7o9M8Bsi0ukjAXwYjwcpXuQc6a4M2oEcOHNnrJq9kaH8cL+L+I8x1ZjoK5g53bY+u6BakVl/cKJ/exBEc3YZ2Sp2KQHEJ/fTzVjXbie/m+s2c5d6FBaKo7ZiFoktOAlqpug+wn6uGtvjqDlnfH2mKxmttFsLrwgOu2wcR7rcWM1YsKoIz4JpO92qYRKOup/j9egYKEPggGx5858pMTK9gSKFeR2bmgNv1m4TrEnIEDV2TbuzV++NkVyC9k5UV0/n31ZHlelKQyTJWMiT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199021)(478600001)(4744005)(2906002)(7696005)(26005)(71200400001)(33656002)(38070700005)(83380400001)(9686003)(86362001)(186003)(122000001)(6506007)(82960400001)(38100700002)(55016003)(52536014)(5660300002)(8936002)(8676002)(41300700001)(66556008)(76116006)(64756008)(4326008)(66476007)(66446008)(66946007)(316002)(54906003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oKRwJVWCmjUq+4oZUZdeIHAr2RX2bB1XHCDE5m+VfHPh6F/YyZZW26I8nt2p?=
 =?us-ascii?Q?QhdYfdcVkIgIMEhyLG4gh/LctNF2D5GfXExL92H7B5N1tIuKC1gGkS7/7TNj?=
 =?us-ascii?Q?Zd2SpfBbFiMWui9c8dLlZOO4KrJ0ydr++at0IwsIVtIiFbficLU9oQmdzmLj?=
 =?us-ascii?Q?RW55ZejB5of5d578PcUk65gtpsfOOD6kpu73vcdUHPK0ot4o7wz8ciCHwK7R?=
 =?us-ascii?Q?/i5mQPUcutqjcrmu3krHiG8sY8Sfi8Jrqu2LzJ0c9RlH3s3vj2wexcqlg3Qv?=
 =?us-ascii?Q?M5pH7EDZNIWj0P2Zs2XsTxaTfrYUe8qZg7PDG1mLCf0h7sIUrUL5GWHjidvN?=
 =?us-ascii?Q?mWhtPv1Kq6iJSi8ocKF83v3kbZnVbV48WlQRIbJrXT9HyfXxp5Z7IiECcebB?=
 =?us-ascii?Q?RPqmQDW+e5H7daU3M0a1RaZJhYIxfdeWj8GcowYRIr6U+OZu4UcX+psAJwGV?=
 =?us-ascii?Q?kfPhSNt0BboNcxclY/VbY5sRfGjFmtDxfI5BVNuI0dUT7IT4Ed06+verHIQ9?=
 =?us-ascii?Q?l+INAkjddiHB/4i8nUpJEUs6hYxkKw+78tUygvQcWoSjfyvpmTeifFVaHTXi?=
 =?us-ascii?Q?Kvp9NAT5Hjhb0WqNf4QA5G22trxSkKurdpplaYh8d3mh9lsXMFWJNQfk5zbU?=
 =?us-ascii?Q?H28hvw+io13GzlGAmePUlSQpJG9voZGaNUlvPG+uTKxjZnuJ7mmZWJ2B3HlU?=
 =?us-ascii?Q?NbqEAF812gb7DAza1gW4JdDF5Go3WfEIljf/9cR+XngDED44pH0aJDJHxQll?=
 =?us-ascii?Q?tzBJS6fnj7YnCC15rnfeYdAryyJeJlEcO/UPyU10lg7azl/9UXtdteo/BXII?=
 =?us-ascii?Q?DNk7uJWP+lWNjkIslqmnyvDHVwL8xSI40ps/2cdF5/lmrGdKBXIOHHa3jF03?=
 =?us-ascii?Q?8HZplbklFIfAJAtpH5PN0SerzGUqtrQKuEl5ptxWvJ8VjLBVhHkEpJ7jlAmZ?=
 =?us-ascii?Q?zZGWiinhJIm7eG0+bJCcKh/mGJPrPt62C/LhMn5af2E1iOrSKQganljdLvWO?=
 =?us-ascii?Q?RrlyGOZzaZjlwcXRFbNjTii3Xg9d2pkZPEnUaM2AqS4m3+DJnJeYcR+moCL9?=
 =?us-ascii?Q?WYOkhLRxR4ePb7bLRJLQOOqZh51Npfo+jNalIdwqt1/fx/HILwaE09QhtT9a?=
 =?us-ascii?Q?xxHuJt98Zuf4yxT75CtcvALhosMearIENJ888kH2SKLyHsoF1RSadi5IWsqS?=
 =?us-ascii?Q?jvVXo0oUOhi3zrsiEvvE2lwS1sLgjvCTYb81wNAwWwLPrucq9AcjlWhIxpjW?=
 =?us-ascii?Q?0EBjv4aa3Ay84YNrrOE3Vss/JBJfsYdDwxrHE+YJqsp1pdzTP8wEWhICmkRV?=
 =?us-ascii?Q?svooHRYwlKD5OZjesCZwsdWTL5nF6+FXGuDCvdt+fS5GSplp7+V4mpLoHgv6?=
 =?us-ascii?Q?GD5TN+rIo0yz3QciNRiT+H1m2cItVnLm2WfSPJOCokgusw19b6raMYnSeZLx?=
 =?us-ascii?Q?fYRg7kqZI3ZxxaWVskLTjGhZZDvYQ0vl2enB0uqUAf4IEhkf+9GrFACF1cMS?=
 =?us-ascii?Q?AQqKpGwmqGf+4ZtDIwmaHiL1DVcu4TNQNBIuxgIGCCMZR++xSOyNwFivihc1?=
 =?us-ascii?Q?bIc/9gLhrx0LDM95FANfVNjeWBTepdahGwOzETv6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d55cba-7a11-452b-a193-08db668a744b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 12:35:04.5091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tHwKfiGJYFEIsGPX1/WR6VTliZFmHI4Vr1U6ptSRUhj0Xg4598lxIYWo2M7Cw/EdqPdunts6PgeRKHKtcJ+ntluJO+fCUnGzX5Jwom8G6J4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6088
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Thomas Zimmermann
>Sent: Tuesday, June 6, 2023 6:41 AM
>To: deller@gmx.de; David.Laight@ACULAB.COM
>Cc: linux-fbdev@vger.kernel.org; Thomas Zimmermann
><tzimmermann@suse.de>; dri-devel@lists.freedesktop.org; linux-
>sh@vger.kernel.org
>Subject: [PATCH 0/3] fbdev/hitfb: Various fixes
>
>Fix a number of minor warnings in the hitfb driver. I discovered
>them while working on bb47f218fd01 ("fbdev/hitfb: Cast I/O offset
>to address").
>
>Thomas Zimmermann (3):
>  fbdev/hitfb: Declare hitfb_blank() as static
>  fbdev/hitfb: Fix integer-to-pointer cast
>  fbdev/hitfb: Use NULL for pointers

These look reasonable to me.

For the series:

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

> drivers/video/fbdev/hitfb.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>
>base-commit: 29c0f369e17ba0abf08c65ca065417aebab208c6
>--
>2.40.1

