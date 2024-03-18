Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3489687E2F5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 06:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7E510F2AB;
	Mon, 18 Mar 2024 05:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8uiPa9g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2491810F2A8;
 Mon, 18 Mar 2024 05:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710739318; x=1742275318;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LTwOBly6mUjpJkyaAA1jZ6OcLEx7nDwsjaFXsDrEWhk=;
 b=c8uiPa9g/wLWodGZR7T+3AJ9d2Y9brbFvnBf9TtCgMXST0nr/MQASX8b
 FI1kXIYzIph/41YF1W9Hgh4rYbnVVKlqUmkgDGlFr4RqlZn2sm2aIrjHD
 ckhqKtK9tp87vziu72IP0JrDNi+LIGz7XMLzpyDrJ6KQVs2cnkHn8aL8x
 BdsoasHsZUnK9fz84Qv2sN6zjjrApJbsgU68mFbiQipr3s62G5cVuPMTU
 2LQ9WW4WjnrBeMKHo4tL3InYYIpJTxt1AzLM8BMey5lUZRhS3mkWwNjKs
 PpD91m0JhA0+Zvt6C4hczlr4YN8GhX97PZiMWahKf5zdHWPOVRPfrBRIG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5743230"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5743230"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2024 22:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="44287807"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Mar 2024 22:21:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Mar 2024 22:21:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Mar 2024 22:21:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Mar 2024 22:21:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2z7z3pPd9R4MBaNp6gERjqc3uV2q0OfuoJDol0nM4i6tPXoNvXQR4cxujU2QNvcr7BWJcsYAUTGGwx98T0ofvsk4Lo6t7eGmBt4Ky/c0aX1nsvZNmW0LAkiFznvuSKIq89QbHpWjJO7vfjuTd7kRMzHNbQ9+qNTJNd8HN6oruKu92MUZ9LzNVdgifMRxgHK+2YmaE2X+52WxyWb8hJNQrzz43y0zICXnU3CsP+YZI30sXvQVu5LPgiaV4hCZSQu6cM8XIPBJ1A9AKGCCOUkoPrIZXjf9ilnKlHF1cQr2gIySz/9cofOtjKJNALZ8vkdwRQG55ZKNOaOIKESc2IzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTwOBly6mUjpJkyaAA1jZ6OcLEx7nDwsjaFXsDrEWhk=;
 b=Ypfq2hNGBXIaTrvSNx7pphw41VSPs1K8OlYubu8p/rBQlUCKcgkF9+oZJE6cvqQyEdqXawCEGzBXksRn7wLrnwk9JmKmXpMGf89AOh8ofoA3PvqO1pqNSDrtn4oaB70XlZKr7pASbc62O/14wUXXVMe22puO8Mh4Kifd320Sbyh7kzcj93epRGc6OAZvt4oovLTtMOQgC8y8B6RIElMbdi9qRq0fq33lBO0RFJhcrMvFsXLkkCaCeTDhScRQmwtz/b9iIIgpbMSsMHzGImJ8oXj/ft/jX5uveb2ldfd6Zvpb+rBkUtGAvYnYw3fUF2OG93bULO5ULicWiPgUlhihJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by BL3PR11MB6339.namprd11.prod.outlook.com (2603:10b6:208:3b3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.10; Mon, 18 Mar
 2024 05:21:54 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a%7]) with mapi id 15.20.7409.008; Mon, 18 Mar 2024
 05:21:54 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>
CC: "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Andi Shyti <andi.shyti@kernel.org>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] drm/i915/gt: Report full vm address range
Thread-Topic: [PATCH] drm/i915/gt: Report full vm address range
Thread-Index: AQHadX44Sh9xWy77xE2oPkbaYDlfvLE3RheAgAAhsQCAAaQigIAD8QaQ
Date: Mon, 18 Mar 2024 05:21:54 +0000
Message-ID: <BN9PR11MB527575D97CB63C5E4B1B0E7AE72D2@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <20240313193907.95205-1-andi.shyti@linux.intel.com>
 <46ab1d25-5d16-4610-8b8f-2ee07064ec2e@intel.com>
 <35df0767-384f-49f2-806a-f83765ca7c4c@linux.intel.com>
 <ZfSAo791UDRnBSwc@ashyti-mobl2.lan>
In-Reply-To: <ZfSAo791UDRnBSwc@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|BL3PR11MB6339:EE_
x-ms-office365-filtering-correlation-id: 76ff007d-ff1c-438e-6cd8-08dc470b52fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dmY+4GltPvo3tMNjPbIhyn/JqRZJIJFfjZASaYgIaF75cDtN5RweRJcR25Kq0fotEB5PJ+DzPHiB5tTks1aE982YNzuCCWaxefTrS2zGZa5k8nN4Mai07ubI0PK4VWhmLUqY2ocOF6jkaQ5YTxZc002ribpqDWVORqkyUkzcjvGOREvbJyrvcog310mU/HLY/uayntG+31xk0FeZ0IsXXxQUixBytlgvnD6oMmPpXfHSmF1OmWd1+jH4Byvu9GWIPE6PkBpdI6fx7SO4XQoTQf0wW016J4lpRQ0wPTBCY5Zfi+SD5RohfRXlo15YJSzYvNdgQ+x2/ki0UYldE06re+sSu4iIvuV6W3utQsQyHSwwKBkgz/lcQgnTz/oM/fOxayp+WcQG30jRLWsqa+jnrYQ4GuJOtlyHC4wK3dYqzN5JMKqUBQoKVpU/HgM8L3yUdyp9i6k/1z5pKUHBOSF34iBRJ3r0trIXZ/wgq7s5LaAbSpBhuaIQg2tuJkqDPUMU8SNbLI/QGXYIUbYf+86qSjfFfOvhlb1BGTZbGVLqDq2DVcwlgXlVDO9DbOt5F5MHFSSC94foRnrgEFa8LKgWbe61pEL0p22/vV27eoX6kJiU9wLFfDz/g10n5xRM+HNV1W2YZce+qr4ysVENj3XgZZKuIFL6LbnkNhNBiZYHl6O1bfdwSEvG34czdqHAGn+IiiVbnoFnkqcYxBjp4BTM8rKsnzfwCbFvntGY9TDsyRs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Zu83X3R6GUCfn8GvgD17SG3bhVn71P5ecUnid+ShV4UcOJVOlNKrr9cMpC3k?=
 =?us-ascii?Q?eGB1P+s2OsEEF6kO8paItZCsk74qpXOzTQ+56mUvI945SAjA0KOBPETw1/Rf?=
 =?us-ascii?Q?xvPVxCAiSlMEcE2r7xIyc4WQji1uxENfoUOM19+XP2rUWs6JcPA8G1YlkyW3?=
 =?us-ascii?Q?h95WZcZ8rpZSXVuXEqSjO36s6YL5S02ICDKsf1A5OaoTlf47Uvzy56SqH8eI?=
 =?us-ascii?Q?3bX7TI+VtpnhzrVllc9/ogI7kyarzQhhs2dpDl3GBvqHJa68MHPr6w/zBMx9?=
 =?us-ascii?Q?PUFRZHKcPVj/0J2BKi+g6USWrDUe+PB+h1xeYQAwBMBHCIRJKnnrHpXndGU+?=
 =?us-ascii?Q?6uqP5pkVDabJ1nsKUEYld3k3VsBp1xGMCsg6xXIB5gTGn09hCcFweyuxnGgV?=
 =?us-ascii?Q?1x5WVbKpEx+W54t3qvnxJQK0usSBVJzKanL4xSJUva/3yZ3dZesfhgK3X7Wy?=
 =?us-ascii?Q?X7vHclIY/azKbzuIbB89DSMamhbYaW048WwPSS7Wvk08BwF15ER7akcbcYJV?=
 =?us-ascii?Q?kZN6qYGj98rGt+8pz37xv8S42TIB795Ht7TVuL6ZB1i5/gp2vmkW7A4htFHr?=
 =?us-ascii?Q?pmHXiN159UwFrE5wz/JYo6qG2AamwrH7OQl4ZJCT9j4nSZJ8UTSMM4BHiEDN?=
 =?us-ascii?Q?a/SUzk+ZUhxshH4R8uyWqMLwPyHSge/RwHlSEm5dpj1ksk2qBXL2HAWFXtgK?=
 =?us-ascii?Q?OQW1t89FATkRXcKYV3Gjj9M6n3s/sxcnEfJe7xMo5DaUhxgco1XOmjZ6MciY?=
 =?us-ascii?Q?elFHpa9GjKP23/tShzXwduCkuZiTrPLmjjLE/hwekcqpZY2hNddEm8CRyouB?=
 =?us-ascii?Q?CtFKTPTH+O6HG3QlRAU+wNxWsB9PND+T2gKtZ6DEKefelnDMuZLT+Cj06nnM?=
 =?us-ascii?Q?7aAaQ2SpjFpoVmTgj/EkFmXiloYQ6gORxpZGBlZpgCR5lCy6R3DKlthe5r5O?=
 =?us-ascii?Q?QOFcASkGPhIrFuRr1WjjQKAoo3mP5Q3BNn+qQwcaMBcD6Zk/BbMIxKcQDE9t?=
 =?us-ascii?Q?C1cmYBBKt2NpDcJhPc6qzGVaosPfro0syMTzoA/cQSqhoJhhYTf0EQaGrobQ?=
 =?us-ascii?Q?uEyeeyxDNzcQQfhkeGYbMDoTUmE7oxNBXK3PaPTEpp8uFIiJZrvqPVkfVz9/?=
 =?us-ascii?Q?6gmeqVh/fAGgJyGWOBGJ9d88fjGOvSexC+9KXdliwlLypfgB3WByBHgMmzqk?=
 =?us-ascii?Q?h+/OzMkQpL5IzSlR5iVxmKZN6n5fuZDKkxv0C/ghCRHu2WvkxZBDio740ezy?=
 =?us-ascii?Q?a5j3Zdx0ehH85SLHEtMe0VvZfMeu+X9BuKdHAkIRcFebLwozlSm3UWuPZAjj?=
 =?us-ascii?Q?2vWUZZLAnnDF4evNNTRYkwCrWdjqT/1J+4reJBN2Vl2LrxJYelA7S+OueRha?=
 =?us-ascii?Q?HGAdTOCLP3JiW9UjRQTFD0jQzyV9MA56IzUwlq70Xc2vpXvnD74rAz6jXetv?=
 =?us-ascii?Q?6NnWsMS0kEXIvgtAjwl+IRRbPVnOlyisYgcCqJ1RLjDlZ2twnstzDYeA2gBR?=
 =?us-ascii?Q?WhuX2k/T0BeQ7AhQL4hPFt/mC4LAz7PX6AgKplZBtGb4U9+0v3/+wSy3nIJ8?=
 =?us-ascii?Q?Z38nV2NUWSMbEi3rDBpTRzXs88LqVA6vXo4lsYfO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ff007d-ff1c-438e-6cd8-08dc470b52fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 05:21:54.2028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a0/9BTj6z+WCsTPpS1i7lvjOh5iS+ofytcafOnIrGTCF4g/cMQ4pKwphoJGhuYyMCkjCN9yxHfnmX16DPKKLwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6339
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > Lionel, Michal, thoughts?
Compute UMD needs to know exact GTT total size.
