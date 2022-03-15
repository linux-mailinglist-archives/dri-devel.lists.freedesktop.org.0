Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2075D4D96EF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 09:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD5710E461;
	Tue, 15 Mar 2022 08:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A846410E461;
 Tue, 15 Mar 2022 08:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647334785; x=1678870785;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4hF4jAv/ttMJ4/IxPDzeDkGaYuzX9SBMlAC6e2NiY5U=;
 b=QA+7rTSX+7e5S4ZXLRr+OqQtv/aMq0YRH88xwWfyK4J9KANHzSQnul3E
 tbjja5WP3wxpLy32otq3y/XmaCxJkNKj3W6bWuR+xbBmbCB7M7HzDuj4o
 0pYTsizFru8/2+dguLk5aQU9HDtdANrDalH+m9tVbyHpKD4q5Es2ukVp4
 0Enj3mEIXwejL4LooB9x8LjXVHndi/2qT8RsW9201CDU+yRBcxG8epHYM
 qLEq+UsIOKjFSaN23NC9Euy+PYB2+oQVHOSQcnTTOu6TLJXGFYBF0ecFI
 NWCUbWNxgpfPH0YC+u8jcKVhcJssYv2V9qzyC9LcUOH8CZc9Soj4kRT5T Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256440555"
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="256440555"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 01:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="613196341"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 15 Mar 2022 01:59:45 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 01:59:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 15 Mar 2022 01:59:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 15 Mar 2022 01:59:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htJWbQALk27MrQ4x3xO52oCqdpxr1ZFgePc3dUNQVlql5V/W91wYcjnsmLwuUbOfisXi+2GXnzclljyB96OSkijDW36FqleQeX/4QDOoei7HhwEhGieig6mpZ3Zdvd24oOZbF6lcx+9ivpAnEyLX2To4xekpWgxTas+2FERwxJzXBFGq6a6YiuIm2RVsdsAtfoOZs8Bm1aUmwtyCK3Wgz1xkkoXN+9LGOECep6yaOKfHpMbMGlFfPX6iL8NIcU9avupazr7bpH6aRep/1ouY463AfC1kIctAvJW8FFRoonWcf96A5ervE3Qxa39fiV8U7kpX/BRq0oNGqC96WXjaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLza6Dbm2oRR/Ub9zBL+1wWfif1d62I2uMXB4bG1z6s=;
 b=fgU5sJz0BcuM55COQXHQFx2/69t4L142xHxHcjyQlBbfnEfuIGYpWfN0m/3ARf7CbERNQH6Pn2GJzozhhuyGqKCo28Ii08Faief5iJtjTLnme71q8kDNWqed5nRTNCoU3DRfxRG0ujiKQIXtg2XELeMD0yUbItAYvqb0TZU9SCsVqoqo2lktsJC5iijJRN7RLzu6xeKmqlfGBmBkATZ77/9DNvp+jbJqlSwEZ4dDAHo4brTk/L27ABHuWf/uEBdN98YFDeW5e3V7VNGF5xCMxjtIGGZ5ZUSA/FG2UiBBWx1aElBvj2hZ+9nMVVDQf4V1JfwEeCgvOUAFcb1b2eVVgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 MWHPR11MB1741.namprd11.prod.outlook.com (2603:10b6:300:10d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Tue, 15 Mar
 2022 08:59:41 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4c9:5841:3761:6945]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4c9:5841:3761:6945%4]) with mapi id 15.20.5061.028; Tue, 15 Mar 2022
 08:59:41 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v6 1/3] i915/gvt: Introduce the mmio table to support VFIO
 new mdev API
Thread-Topic: [PATCH v6 1/3] i915/gvt: Introduce the mmio table to support
 VFIO new mdev API
Thread-Index: AQHYHNy+WB6hSk3In0CMw3y1iZvDnKyJw40AgAEP4YCAANFZAIA0pK6AgAAPQYCAAABkgIAAAywA
Date: Tue, 15 Mar 2022 08:59:40 +0000
Message-ID: <b114ad4d-3cb8-2bf8-bb09-8559c7616939@intel.com>
References: <20220208111151.13115-1-zhi.a.wang@intel.com>
 <871r0dqtjf.fsf@intel.com> <20220209072805.GA9050@lst.de>
 <4e2faf7b-383e-58b3-8ae9-8f8d25c64420@intel.com>
 <20220315075217.GA2830@lst.de> <87a6drvc02.fsf@intel.com>
 <20220315084817.GA4105@lst.de>
In-Reply-To: <20220315084817.GA4105@lst.de>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7482fb68-d921-4a5f-383c-08da06622449
x-ms-traffictypediagnostic: MWHPR11MB1741:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR11MB17412AF71A3E0BA4B07B6A6BCA109@MWHPR11MB1741.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DsWOzv+MnjU1zpsQzgdWzR60VMjXrgcVr+DOx+KwUdzk/yBysQI1WhKzc4Y8khqguJo345sBIt3KwfuKYFeY0l8IuwbpqAFTIoFcG1P18Pb/m9I0qoxg9M2ugeXSSLOpP72NqXLIdZ3uzTZM7u3DuU0Vb0dTrHSZNzoWKmSgpVvbQi6xpA7aJ6F6hJU80z22HBE4wBKF/O2IytzTV0UPHoAaEkH0dLfyHvHzP2xoJFfdiAqsqdnJ3OcP25FISqOP9aQlsv0ta11DQv/nlXbFzs1/Nya/t9GWtTqs39aT57un45BtScvaQtxNWCGh4UMEvxnVpN2gdirfAXXexrqiWpf8VhuaxecQzjpjCz95qAjGd4buGxMy0v4KdNrNDpmHtHYaC0exmalP4q+Gfb+6EXYS4I7qzKDpznThYZ6Lx5fTAWmWEbfpBuAzgHU3yUN2D8iD8OqhasbrBgsIUKpMC/49yH5jn6Bjn2sKrN15ILzmsGMp6NCSE3xIu3o8M5y4lQcmSA1gm+x1fuTe++6KC6qSRglqto1Cn3kYL2v6Mi7KBkZ3ffuyHmqUBSlj3I0rMZm3XcrmjtvKTAGI9M36agBMJ7/0rXuwFlXejoezGWtPpMsFlnkyLgq6LF2b5cawrVYEN5qG6MCIxVvnDob/vesaFmuATGwnL9POoduAvxe295NPif5wLr9OxtINWYVkVbxlaB7rSJc7D9R6nVx6yrrzLtL4+IakUh51Z0xDGksZzdmzOjJfjbbtkRfpAFYyNr9AZddOJ8adknllZGdxyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(4744005)(7416002)(36756003)(66476007)(66946007)(66446008)(76116006)(64756008)(4326008)(8676002)(91956017)(5660300002)(66556008)(54906003)(110136005)(316002)(8936002)(2616005)(6512007)(86362001)(71200400001)(186003)(26005)(122000001)(82960400001)(38070700005)(508600001)(6486002)(6506007)(53546011)(31696002)(2906002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?w8qdRf6PzHRtLY6XOmRX1GVKAMUEEdC0l7WiRVGnftvqBN8G3W+9m8Q8?=
 =?Windows-1252?Q?aLFKKjdSyhMdtekllYPMNd+dLD1nSfXYVLLkjNMSKwlXryjAcbg83GZb?=
 =?Windows-1252?Q?UsmJx1v8TTo56G9C3gObTHJFzEaBCsGC2IhGrie37oc7vQ+WGmGzuhLe?=
 =?Windows-1252?Q?eOl7S/ez5BMb20eyG3lfkJMk9mUGwBGXWLs8riEmYhqLUUQamoPBlVzr?=
 =?Windows-1252?Q?r1J9/4ilkZ6sCiVczuDKYRa9I46hwgIRCTbZQuE2o57sStz6NnJdTbJG?=
 =?Windows-1252?Q?z3LzmWtnxhsRMqcacm45Tub29b+Dx//1mB4bc/yGT0TT5eOtoRjT5IDd?=
 =?Windows-1252?Q?TKSOZJcsT38N0GHdNUlfkRJeP+c6CKhbjyz7zXCm3qypgL5TJS2TdYsM?=
 =?Windows-1252?Q?r/ZnNk+e/qh29BCByA3Nse63isr7if5VtbvONtxYsgiz82/X0t2kB71j?=
 =?Windows-1252?Q?GL0wrO2EBLsqQ6wUFWFdyZkRezVmgh0Va+7MDYDnzTrB0H4DW7eIbtAD?=
 =?Windows-1252?Q?qHNGoeiK4GxaEypsD6kN2xZKeCguXEsgnby6KGuuyMTc7JOplOnHiNMF?=
 =?Windows-1252?Q?PwlR6Wfb2FzEVyZydxHBjKiWIH4xxqBIXUMs1xBa81zzsKen1aRRJQxF?=
 =?Windows-1252?Q?CUrM5kRAnaTcBjrn5heyJCjbbG8A+ZZtuJVQEnbfojitihnz9dHn1lkD?=
 =?Windows-1252?Q?erBVBXVi1MG4A5JVgwX0Pr9KQKFp0W3cj5g55G9+WfQ/4QzE5rh1r9u9?=
 =?Windows-1252?Q?jtJ25/1d3nERqai41CcHgPe3vKyH37QnsWoHVEBmV7Grm0zg7PGGPvPN?=
 =?Windows-1252?Q?miLG4Uxunzkwzq1wt95OnoNbt3NxX3R9VaRrJne1Ay9WAkET4goeNTLe?=
 =?Windows-1252?Q?rN9rVkcrV0qtU1GHPMqmaxW1evYbMqcPK9DKeSBZO8P9CP7Snq+NAAEG?=
 =?Windows-1252?Q?XE8lVS1zWaLYb/XfpoT1QBCdqCfN63zC0QlC97PNI1y9bx3QjlhFEKbI?=
 =?Windows-1252?Q?G+oAUea9zKWUkfGaIU2foNbJZi4ZgRaXFf3MhBGacEIezMOLEiOtpsLr?=
 =?Windows-1252?Q?zJj89IyHdq/K0eofsx6k6++oBKknejkkkdvG2Jmcr2zp60iVD7DeZ0dn?=
 =?Windows-1252?Q?VMkdeeBVTGH3OWiYARuUWiNyYpdG1+/bkPDvnpayCtgz+u/g3AHdZ8rC?=
 =?Windows-1252?Q?rsU5JeM66cz3IYtT665g2AybTYM1KNuNN5ekrjfRoR3UjHgtKse08S4h?=
 =?Windows-1252?Q?P2EZQ8HQAtRDeXpbAjNypNimy+uWTEJrXwLIMmwWmaKscQeQTVVXN7TP?=
 =?Windows-1252?Q?mro4ipVLFvt/tsTHSzFApfxoC33R7WJXgq7ZQFLpwYnFQ66MYi3QGKvc?=
 =?Windows-1252?Q?6ohX3DF/Wx2RlX85cl4AXK2Rd3o1FGm8NaGmgXRSdaAwkr0EpLq6/3UZ?=
 =?Windows-1252?Q?gCVCr+UqY9w0YoLeN/baXjUlw6bZTrOBOxCdW9plcooIA6YYuL0R6/hE?=
 =?Windows-1252?Q?UnJ4oQR25YzLo7v14HXQ2BLeEfPzwRLiQcJqisgIjszOo9zQEBphQEQd?=
 =?Windows-1252?Q?IsUHn+dtihb0iGAQ?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <2CBDCE2BF7905A469C92A16729E476E2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7482fb68-d921-4a5f-383c-08da06622449
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2022 08:59:41.0124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oFXya3zV5QgoAIVVOBIH7FgSvaNDjB7bAmHUlON63Q5D2vbMSVWt3GZiPfUBt8sPRqASc2Na3c0KewECfQEGpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1741
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I was actually testing it for almost two weeks, but still I met some hang a=
nd I was trying to figure where the problem is as this is quite a big chang=
e. Let's see if I can figure it out this week.

Thanks,
Zhi.

On 3/15/22 8:48 AM, Christoph Hellwig wrote:
> On Tue, Mar 15, 2022 at 10:46:53AM +0200, Jani Nikula wrote:
>> On Tue, 15 Mar 2022, Christoph Hellwig <hch@lst.de> wrote:
>>> Just curious, what is the state of this seris?  It would be good to
>>> have it ready early on for the next merge window as there is quite
>>> a backlog that depends on it.
>>
>> Can't speak for the status of the series, but for drm the deadline for
>> changes headed for the merge window is around -rc5/-rc6 timeframe
>> i.e. this has already missed the upcoming merge window.
>=20
> I know.  I meant the next one, not the one ending now.  And I don't
> want to miss another one.
>=20

