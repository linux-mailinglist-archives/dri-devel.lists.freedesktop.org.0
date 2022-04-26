Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9563150F340
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 09:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA4010E6C1;
	Tue, 26 Apr 2022 07:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694D710E5A3;
 Tue, 26 Apr 2022 07:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650959964; x=1682495964;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=R1f0tcaobjkICpfBq9SwDQwPB+IK9e48ABqrqWqCz0Q=;
 b=ldgUB8sxxZ3G3h7J9Xc17uWrU3sUIZqIk4MFCh9HP7bzr087Njovledp
 blMOMLQJm2QdWVGGPKiKQyIA9fbjj0lZmfXU3b+evEw6OuLTlHfZDQ7W5
 QG3lVw0M2uqLWZuCyEKlMoY8nnRne2m7oMXnLQJ3mp0vtbya2DxRf9bZN
 gSMrewq1pv6mH1KIB8z2jt9D+PgsCRMBedNGJIRFQC9Xz76Zxw2hDd//b
 POd++nrp1uqOtYPNIQTfhzsk6WMawvh34ArbIq8RsODE3NbB8/zXF+geH
 z4gnhIVlY2blNQIoWpj3m1KUTK1TDMhs00yfdsXcSuFqSjruJCx/tBLkH A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="247422365"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="247422365"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 00:59:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="730130018"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga005.jf.intel.com with ESMTP; 26 Apr 2022 00:59:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 00:59:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 00:59:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 00:59:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMSuBsVWTZl80SGNhKnGtX6/iE/t32attMkKkhC6M41GumpDAGEEp1g/9IrfIBiC98LVNioSJbxrgISMMW4ijxmVrwD1Nn7H0bpaLsSKt+TrYxFF6RbXEG94aNIMhIE443fHZnDTHMO3dVbf/3tSr9SZlQZe1d584qkIs2krawSdo72Vw/9xRLUklyIIDGvgtbr11EvSb5RqhbhzcF2Snx0G9pQXou/qMTr5mGWZJJJO2Bc6QRYX38y42swSojlWp+6dB2YM3gZAuLD6ad0brQawWcg9DXwTM+PEaINNNJjhm3rm8+k23R61o4OiDPq6Fs4sITFFipS0nwjbtKty8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UU72AmrUglEiWpZtRyC5wdBG5f5sZSys59W5pevI/RM=;
 b=LQIEdSxYyrqmYe9V7u6us+/CfJ9hCHrxKzHQfWTmPPaHisj2SHXl9ZiFf+YX5NYhIEqNQoUP1t4eVlPnxSe2ruQkr+agCGqoVyUsM36gR0wmvaq2Y+5afNzmscPN4vYB20+tcRrFkYLy8UQheOviQFz+EtrzZTFgNJU/NwI94Lkrb4MbE7fHdapy1ZRQwxzLcvDo/ImYRth0TICDvq/1LEBtPynML5Zx8Deiy+R08n3nq+zmq8xHn+BhvCcoaq+1NjlZkKtHAB30jcvKzlld8dzDcxyKgDajPes6scuiLsXv4K3Yj5RwoF4f4ycC8wsFbNwplC3Cudxv5B0uWacSjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 BN6PR1101MB2146.namprd11.prod.outlook.com (2603:10b6:405:50::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 07:58:59 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 07:58:59 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: [PULL] gvt-next
Thread-Topic: [PULL] gvt-next
Thread-Index: AQHYWUN8Agog0QB2HUW+VGhdlmLDqA==
Date: Tue, 26 Apr 2022 07:58:59 +0000
Message-ID: <c5cf6773-e7a2-8ba8-4cde-0bb14007bc6b@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2420354e-5b09-4687-5bae-08da275a9eee
x-ms-traffictypediagnostic: BN6PR1101MB2146:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR1101MB21467BD1A173D10FF0A64570CAFB9@BN6PR1101MB2146.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f65xKIgxfHwpidQOLtodVUZGy8bUuK/zQx5+ohGcXl6Qbw078HBUDwzdjM4AteLE1oeIcQlVwToL5E1/IlVIzUsuN4wf6qSUqyRtFuvgFZFYzYUDD1fQkn1OlPjS2aU5S00q0HCldL8gcvylvZIR6z96UWvvM4YL/NYAbFMeKZBw8WnPoi47moWwQmKhq+18qQLdzL7FgWMXIiNXDTeseFeyX22It7+fUcS29aSdYn1e9Hc1GIY9TJm2IPuvk4dEBtpXGblHiovDHulFPkKWfoceB/pZkoS5TOlbEs8uhSjJJjgvkLa08oIsxQLOgAbXHz2EP0JGzkHMrJHVk90Ey5M37vORVyNRdNSS4uiTKd6fXDrptLpQqZY256T+uir3sJ1wg1AaWTZhbv9kClfEB1vVCMAC+uop+sQMMBO1kpFBdiNXrKrGDP09jZOd36l9XOt8RTqS4F855KoSi4z4UpuB81BK/xGpMp1Ft2/2PlS8ju26O5eLAMFXHxvl0l+ElJf9ex4AagYdOLZOEtxBZPfXcwcG9vNFBYej9vbuYu7upcEvxUIsGLhggUD+MhwuTXdViiGlDQwm0FZ8PdpSv1g0m0qZogdAj7vzuIx11Nk97c6gJTjfbdV5lKP8ssar1/TOlr5GAdT39hSSajKFqJ4c63/tAwnT9SqXSiH/ltrB5u7BqICMQl4HGsucdpySZo3ktusQW0XTxE5ni1CC9BnXvkHHRlM2NKpqUbcJuT6hzdHXw/ZZSZOhZ+qUqpFuuDKibMBevmmlFvzRdCieEOUbXMngZGyStFqDk4qJrJovwg7dk44mG7I74Th32ApfyjrQ1ZOtXvdNHEvLb3tgPM1GDrBSV2NksQL4ulasCRA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(54906003)(64756008)(66946007)(6512007)(66556008)(8676002)(76116006)(122000001)(82960400001)(66446008)(66476007)(4326008)(2616005)(966005)(316002)(71200400001)(36756003)(508600001)(6506007)(110136005)(86362001)(91956017)(186003)(38070700005)(38100700002)(26005)(4744005)(2906002)(31686004)(7416002)(8936002)(5660300002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?QzTIrv/dShYkc6SItMLRGsKBHVKu57ihuO9EbRCDJ1AgnZSHgSTO6WXd?=
 =?Windows-1252?Q?ySPIeIsSIlVu/GYU/X6Zp580C6z9cK5aUa1PlYWYGyJuz3FkWem/MTIy?=
 =?Windows-1252?Q?x3WcJpjBaflGJbUsdalck3uA8+78s/Q81JtzpNSHLyjpTM5LTVskBfSH?=
 =?Windows-1252?Q?GmkKgGyWnGcaScQGMC7r++te5YNWCQqPD6Rw54LBQ/fPnfpq8pfsfPNy?=
 =?Windows-1252?Q?mpSwX59b0PN4PTQUNtodPuAL934ntvGvNtxHn9yIYSRXVciflrdfZT+z?=
 =?Windows-1252?Q?3xdZrQU8N6QIuZT6X1J7tlwyz/2l6iSIPBoJABdom6nmTXC+JoXQl+v8?=
 =?Windows-1252?Q?D+FIdggZM2hpmv1pPN/Jdb0d+NCLsmWiNiOGXWQ4MLpabR1jGFYQpUyP?=
 =?Windows-1252?Q?rIRFo3jb5p6xg7qcOnvJZpiO1hcgctfTrkB9jdKeD+pZ3wj6Y3uUazhI?=
 =?Windows-1252?Q?pzcL9epkon3QDnjVTnkEtJtG1lx/4zyrf9B6VeLyeNCMOAUFPr4ZYoQg?=
 =?Windows-1252?Q?NbKu9QVV6suNBR/A5ldLr58sQZqbOK26khv1Vmc0xzb7qcqUu3BYqONR?=
 =?Windows-1252?Q?BFmK3iThvc9Rmo8+sGgej2cWVrrvK3ytw6CYXo6VJSSC94TfV2JQRLHq?=
 =?Windows-1252?Q?u2fUSxdiBtlbYq1k0yJ7V/qfjai0umct756C01fqh+XbFP1oePWrCeb4?=
 =?Windows-1252?Q?gu9hG/ShTJTHGtKyWpxhoS/bqBr1UxNoMv6A/HbKQ49OXU6ijQoQvjDP?=
 =?Windows-1252?Q?CsGvWKrqRU/0XFvRK5nVYPdxvE1+DBVG3FV27tuifQ7PR6ymOtQTqSx1?=
 =?Windows-1252?Q?L2uaEPBAEdlOIBjlK99+wHRj4lKkCWmSdGdwRoHYFnzNxBmSLsl7hUa0?=
 =?Windows-1252?Q?QO7gkkrlZ7m4ECB6hVItuVF/stkAGSw2l86I57LOfAqIEq/vw14eE1aK?=
 =?Windows-1252?Q?BvFBibKvNgvguJ6BcRIGT2X2osBjl3ENHxMtoQQnl1VwHaPU1Wigfg0N?=
 =?Windows-1252?Q?w6kzjmzoqk5iF3uuWvcy0xBbzoDRm32rI6mFf2BQfpIL4nnnmnJYg/RW?=
 =?Windows-1252?Q?IR4scVikDx5NJtgI+1+L4pwczkNsAs1XBH+ETK0IxTi+1gi8RayFDfZ6?=
 =?Windows-1252?Q?3p0mii4UC5CisYKaXtowM2SMAW8gAs6aGUoHUNtU1mFWIYYk6ucC3IR9?=
 =?Windows-1252?Q?rCszDr+yP9puwElpxvZbipp40XJOIwF4X7JbVuU3mcXoo30VcZPyKCvl?=
 =?Windows-1252?Q?uBWlXgvvY1gT56SHA8nRyhdqnokj+ZEre/E1oUbmmfo6a03f75kwK7q7?=
 =?Windows-1252?Q?UIoFG7ZFAolNzd82K92kw9zhdp37K3UEZ/Pq9+90ljq9+NkYcbB51K6l?=
 =?Windows-1252?Q?O0xQbQqHiGlGNMVSDS3TASv2MeYUEZcNwmHAvjklr8xB2hqu1vKA6HL9?=
 =?Windows-1252?Q?d87x1B9ODBrSXqXh6wK/aXwLoSRG27CiU0z15kCstoDdgTde1UOQwUcq?=
 =?Windows-1252?Q?ZVCZuIfzUuPirpGfjTJ6/NxD1qiGQkBi5vJZ0H9Zp12mgijAm5xAMMY0?=
 =?Windows-1252?Q?NCIS5JWvMu6t1r5B9vUVfy8Bf4p7EYlhhlclM1PE++KUauFGckIRvkPL?=
 =?Windows-1252?Q?AClAOCwjaFY1vqeG6IFgL+X2/FQZdjIApf1wa8gNLQgFtBqH0Eq1ehtH?=
 =?Windows-1252?Q?p+yQ9fujfyTD9lIvizmewCJQXJPlZb+Dut9JcZrPqIJq5DPhC2rnapUA?=
 =?Windows-1252?Q?HdeMmndCQVAaU2KojkpfDeA2jRU6I/ZsFAM6WGxPfcbYL1Gczi/HOGI7?=
 =?Windows-1252?Q?OWAFw6Nc00b6KcP8LdRH0JWJQkQsFfvUwcnZmm/XWgo95wKAT4r6jSNP?=
 =?Windows-1252?Q?4N5bDQaJ/yfyYg=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <B5F697618687E340A4D72B8D8DDB8BAB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2420354e-5b09-4687-5bae-08da275a9eee
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 07:58:59.3150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /q+D5B8IrhwYTt6mmsBYbNBaUfNzi4Y1lEg/PS32I8UXBJ+LmqWUjwFjk18D4ktbVzJNH3Hm2EsOgI8ziJjNsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2146
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi folks:

Here is the pull of gvt-next which fixs the compilation error when i915 deb=
ug
is open after the GVT-g refactor patches.

Thanks so much for the efforts.

Thanks,
Zhi.

The following changes since commit 2917f53113be3b7a0f374e02cebe6d6b749366b5=
:

  vfio/mdev: Remove mdev drvdata (2022-04-21 07:36:56 -0400)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-2022-04-26

for you to fetch changes up to 2da299cee780ea797b3f72558687868072cf5eb5:

  drm/i915/gvt: Add missing export of symbols. (2022-04-25 18:03:04 -0400)

----------------------------------------------------------------
gvt-next-2022-04-26

- Add two missing exports of symbols when i915 debug is enabled.

----------------------------------------------------------------
Zhi Wang (1):
      drm/i915/gvt: Add missing export of symbols.

 drivers/gpu/drm/i915/intel_gvt.c | 2 ++
 1 file changed, 2 insertions(+)
