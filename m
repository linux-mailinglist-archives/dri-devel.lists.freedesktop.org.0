Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315BD4FCF09
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 07:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14E910FBAA;
	Tue, 12 Apr 2022 05:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6B110FBB1;
 Tue, 12 Apr 2022 05:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649742148; x=1681278148;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6NE4RHco2isQcPvu0LE0v0YLMXzQezzJ37VsUjQjo3g=;
 b=UdOR0j+52V2T6vtq730JZYX/6vq8ZUdt2beSH1PAaTMegRJJmEPcyQHX
 /P4pS7ulXXaQCKCz3k8lsy9maLBfcYjoW+Dsxrr70No6qtBGfyyMhXKPU
 NdfC3VyU4WTC8Fp2ETca0ccbFiXieYdEN9cj3xXVEngqYu0yau+15zxHO
 XqTrH3v4dMEjfz2rzYwBCMDAi9GOPH74RAnX6XZ/tGUT7HUBa45YTrYKb
 fURct+YtWvWKZjlOuOhgxFivz7cv5kMRq+Yig0SDFtVurSz1Tu+lltsiN
 jBOnGYOZtSjufhxPL7fySWHbBgO4g0z+1yqAvHTgrOXEnICez0EoBcy8m A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="322726651"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="322726651"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 22:42:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="854212661"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2022 22:42:27 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Apr 2022 22:42:27 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Apr 2022 22:42:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Apr 2022 22:42:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Apr 2022 22:42:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O49L2dSSvJYpbBwPLAMuZ5sQYydac39vMPj48f8xm6z0jcQdl3iy+z5MAMmDwjaPutyXgf9KYNW6wko7ZHfBpwAPHaECERgrCrCPu4/E3GkkGuJ3lgWZA6vV3Sc6EEAvoKVWghL/QApBsb7hQ0YXcdFlkNbxse2t2S3F2pH305fTQAOM9ycAQOJhr8YMOoDQU9RsYLHZ0wSNCzZE/gtZHUAH8YNJ9Tz2sL8SgzNsuWOkSIvBjp5mZGLKpODwWywOjTy5EtQ+KP+rVDUnp7/YYYi2j+JJI2z/vBXYGRRv8iwST1jKqB6Feom9AJ4Z/my2dYiA4EluDYDVmF0S341buQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NE4RHco2isQcPvu0LE0v0YLMXzQezzJ37VsUjQjo3g=;
 b=IQhIcNI3fnw85ttUdQQyqok49e8atGBUa/PvkZkUI1nd4PRdem1wofIwxPqC5DTpPZOhVEmlbb8e0SM9xNKzPqzuzxPTgpNWfndZpanHmdLvU0L1yBAGE2Z+DNFuQXdEVjd90bz2h86VW83pvljZkFYwrvf/IiIKegYh8xbRwWzf04CA6nbg7mPv/2yWDJKGQ+CZOUrkzOads9YpsXTR1ARaFIxZqcjsyrElN0a23StbILt6ttD6TtMsnfZIsVXc4mBZ6k/yw1eM9PgA7AWbr0gYS4vn5DEjIoRZosiEc7x+R85Ef9djWYDx85djziqcBbNcm0BXDOZDYsM0Cgj2ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 SJ0PR11MB5005.namprd11.prod.outlook.com (2603:10b6:a03:2d3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 05:42:24 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 05:42:24 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Zhi Wang
 <zhi.wang.linux@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v9 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Thread-Topic: [PATCH v9 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Thread-Index: AQHYSk/vDxh6otQMi0KsvRqKHUKM56zkjLIAgAGCyICABbwRAA==
Date: Tue, 12 Apr 2022 05:42:24 +0000
Message-ID: <b2138ee5-20b0-f296-34df-29ed32edd1b1@intel.com>
References: <20220407071945.72148-1-zhi.a.wang@intel.com>
 <20220407071945.72148-2-zhi.a.wang@intel.com> <874k35541h.fsf@intel.com>
 <986b8ff0-d0de-437c-8a56-c54aafb6159a@intel.com>
In-Reply-To: <986b8ff0-d0de-437c-8a56-c54aafb6159a@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: becd3970-9f9b-47be-d610-08da1c4738e1
x-ms-traffictypediagnostic: SJ0PR11MB5005:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR11MB50051A2030B27FB989C6888ACAED9@SJ0PR11MB5005.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gBjSs8qguyedxl3pOsF4NVfU9JlSlqdA4ilkvHNIqnyU0ByrF6VsfoNctXy4aZxn4ZkHwrkRc+teuU+wo8usRuwuQMvQ6LGLckuaxLKkK01hYMaoNji8RVtPxCDUMV4FnMTKCmCOAEVW9HZnT1zX4oyJpsdYwPi2/FY18goNLsQjles4F6WZY3T0n80TGvkCU6jpw7EIq1aaOnGk+pbU+TwoZr593NnoaNihq3mBEWBtnrZjRo0sSNEgaMYgLUQCkHw12NMckeY/4M8hZD+fBUKKada1st7zgotL8n0dGoNMlosL+J0AwqU5tdQJVZbw5hGJvOWn0WLzxbFHAJV/K+Lx+2UsxVEEcOXnJ/cOS1JvRLdXa2dElG96wG9EtZwOLELRkhD0ZZcWiCiWmw5Ih/SQV8Pu36N7VhDoHejNs4SXKvho3jqQgtVGWAIM/pQdQK+MLd1Mt/TI9p3c4hg6R4/sRs3VdYsydIYhA3YVvMs+BZ7Ucj7kO0yjWz5wduXGghJFTYOESoVWbeLKgsLX0C1BFlApGgu+5O01F8TrusjvTDNkz3FYBXfejELW/q/1cGnfoupQdYtqvybxWZf/Rm0yNYdcKy/akdLa2ajlIn4ZfnawGQJOOVDWn4RLLI5AuINAGmAH/hsB9zaYRtKAiuKORb3BYt1eixl/1wgGwMjnSKnP6fX0d3huOIXY4f/TczO00YUUL65wBE0kv9I5omfMsth+UkLs3u7WkwU7m2CvU7kyVRwcpnQQAdQwxN1K4tQ/X0kBtzn16DYtS+4tzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(2616005)(38100700002)(122000001)(66446008)(66946007)(64756008)(8676002)(86362001)(76116006)(4326008)(71200400001)(8936002)(38070700005)(54906003)(66476007)(91956017)(110136005)(66556008)(316002)(82960400001)(2906002)(53546011)(6486002)(6506007)(6512007)(186003)(7416002)(31696002)(83380400001)(26005)(5660300002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTdWMkthNER4cTBQSlphQmJSTklmVUlJV3JBUG1RaU8wUFZjaG15K1dORS9W?=
 =?utf-8?B?V1lXWUpZUzByclNTQUtCUHcycGM2aEFPL0JuaWdQdnREMGUvREVOb3lyb1hu?=
 =?utf-8?B?Qm1iVk56WDBnTVR0R1ZJc2JEUHB2RXVHbmpQTnlzWWhjMEk3UjZSb2FWT1ZV?=
 =?utf-8?B?eGp5UFdWdXZjZXh4b0Y2TFZsRnIxMkZwN2tQbHJJaGRFdnBVQVFuUlowRVZI?=
 =?utf-8?B?ajJJdko1Y0RSUG1GdUthSGJ5bmllajZ1UmxKK0gvbHdkTjRub2ZyYjZLcWc4?=
 =?utf-8?B?cEJjcGJmdDBaS2hHS0YvQ3dCUE5qdUF4RGtvS3VGRkgwanVubS9aV3JvaHFB?=
 =?utf-8?B?SE84S1N0WllQVFNTQlBoUHlENjVZRm0vRExOV0xFTVpSK0tCK1Vmb21IVDlV?=
 =?utf-8?B?VERuR1B5UWQ2NmZmcTQ5RVp2Y2JIaWJRcW1BUTBGdnp2bzN2Y1FoazNpNCtm?=
 =?utf-8?B?bG5ERlNJZk1yeUc1cWgwVFZDS1lJZGpBSkpPZHdLQjFYNjg5UytiQ2tMSDRX?=
 =?utf-8?B?WXhlWHhUYXVZRHBDLzA2SUtFSVoxTW9VcnFXWjFrUEtGZTNzOEh6VXhYODRi?=
 =?utf-8?B?VWlyTlNPZ01kRU5iTmVvdUhGSzViNW95dE9xRytIRVRUR0hqUTllaGNSbjlY?=
 =?utf-8?B?MmpRbHhPTEVIeU03eFloUUoxNlJzekR2by9wUk9EdUk0Z2xCbGpvK1pXNFk0?=
 =?utf-8?B?a2dRTGZoK1I1aDUwYVp1bjMzZDdLcnprdjU1cjA5elFDR2ZWY25hR0RRcWdo?=
 =?utf-8?B?K0Q1VzNBREsrZS9RK2txTDVJVTFSTWFxVCtpTWtndkMrWmZUaVZ6R3IrSHJh?=
 =?utf-8?B?aEpOVjl5cXVRN1FSOXJPdEZZYXZZaUhxRFZ5djJheVkwRVl3bmd0aUt1OWRM?=
 =?utf-8?B?Q3ZRNURCTzIwektZNXcwQjdnZ1R0Zk5uT1kwL0NQdnpsRmM3akU3T09OZnFT?=
 =?utf-8?B?ZHFXeEdIUkE4M1NYM2RwTHVaMHNmem9XT2E4TWVHR3doVmc3a3VJbUR3cExC?=
 =?utf-8?B?anlES3dVdjNtWk1hR2YxREs5SzgxUC9EVE5pUEo1WGlxSkVKL21FZkRXcmww?=
 =?utf-8?B?YXVqb1lpM0Noc3JaaGdsR1hJZllTR3RmSTkwdHZvYzcvcnJZOEpMOVZnSEpQ?=
 =?utf-8?B?M3VZVHJOc3o1UCtLNmxMVjVVSStZaldNT01LYVY2aEcyM1p4YTFKL3h4MVdk?=
 =?utf-8?B?UE03eklzUHhEMGF1Y0lKWC84ak9RRm5PQm95blpnWjFKVk5JUHFBZzA4M29E?=
 =?utf-8?B?aENISE5XS2s3clhrbjhFeFhjZXpJRXF4ZnBZclZKR0hGRU5kc0lwRTlPVHJz?=
 =?utf-8?B?NnZXdmpwZ2RjRFQyV0d2Z1JyS21ZcHZ3cnZLREJydld0VC9TRDF3UUcyWTl6?=
 =?utf-8?B?eU5hYlY3cTM3TWdNUFZlQktNanNLVktmNkt6SEhsR0Y1WCtvN05mTER1d29V?=
 =?utf-8?B?M1dYQTh1RTdQNWMyZjZDVmlGbXRMMGtIQXBsSkhDSUs2T0w3N2N3ZjZsdFdh?=
 =?utf-8?B?MDZ6TUJ4K2FDUGJmZmJXeHpzWkNyT3FKZGlEV0twY3FONWlXYUFVc21VL1Bx?=
 =?utf-8?B?aFo5MWg4bEgwdlF3Z2F4bmErcllPOHBXOXFKWVZUOXkrMDdPUzc4QVNpZXFY?=
 =?utf-8?B?Q2RvSENiSmdMSVVnTGNrZW4wSTNSTVRlWkhVS2RVcCtYVzhPYjhSN1U0TTRQ?=
 =?utf-8?B?THgweFFlTmJuZWtSTUduaHU0d010Mkg3Kyt2aXVaNkJlTHNMa0plNHRLM01u?=
 =?utf-8?B?SGtzbW16azFScXJsd01ndW5qU0w0amVBMVErcGlFYjZXSDVhVnZzRkJGVmdM?=
 =?utf-8?B?cjZuWVVvSUc2VURRci9KU0NmMkZVWVg0eWcyZVg5cVVuNzczUzlxTmlhQTZM?=
 =?utf-8?B?U0xGZm12VlVQY3E5SHZIK3lpOWsrQ1diTkdnUjE5UHl4OVF0RXdYUU5zQk9M?=
 =?utf-8?B?QURibmZWR1FBTEZGb29qQWVJd3BRV0hmWjM4ZnJTbGg1WTJ4di9mMjZhbmxN?=
 =?utf-8?B?YUQwbXdiUjJiY3MrUE1DYjBvOW1saGdhTlRtK0JkVHBya0NFQ21yWFFseVoy?=
 =?utf-8?B?b0U3Vnc4akJUR3Q3dEwzNWZDOWN4d0xpSHc2aVVpdjdUVm5BZSs3elQzSHJN?=
 =?utf-8?B?MEJ0a0hXL1JEckk1UmpidEw0anMxWDkwSEROUGlrZmJDM2FLUlJiY3NPSDg4?=
 =?utf-8?B?bnVNY2ZDcHJTZEF0c0UvS2JaWWlNMUFjOWRxMnhxUjFmVEdqbnhYQnJLZzZV?=
 =?utf-8?B?V0hBWmVTU1lDczc3MUtoMEY2MHdJMWhIbWRqeS9NdkpnSnE2MThrcm9Sb3Rn?=
 =?utf-8?B?bURsYTFvb2ZCQ2VEMDlndm1VSFFkTk9TL0lvSzVYU045RXRZNzVqdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB7825EACDB4424C984D993467AEFEE6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: becd3970-9f9b-47be-d610-08da1c4738e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 05:42:24.7990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A5sS5xma/iB79aDxdWSvCKWzmtZEJY9jcC93CDSbI3fQhc/uRoVelYYQ/+DiyPWnDNQWbAs7snRl7YjSZrnw0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5005
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
Cc: Zhi Wang <zhi.a.wang@gmail.com>, Jason
 Gunthorpe <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZy4gOikNCg0KT24gNC84LzIyIDI6MDcgUE0sIFpoaSBXYW5nIHdyb3RlOg0KPiBIaSBKYW5p
Og0KPiANCj4gVGhhbmtzIHNvIG11Y2ggZm9yIHRoZSBoZWxwLiBDYW4geW91IGdlbmVyYXRlIGEg
bmV3IHRhZyBvbiBkcm0taW50ZWwtbmV4dD8gSSBub3RpY2VkIHRoYXQgdGhlcmUgd2FzIG9uZSBw
YXRjaCBtb3ZpbmcgdGhlIERNQyByZWxhdGVkIHJlZ2lzdGVycyBpbnRvIGRpc3BsYXkvaW50ZWxf
ZG1jX3JlZ3MuaCwgd2hpY2ggaXMgbm90IGluY2x1ZGVkIGluIHRoZSBsYXRlc3QgdGFnIG9uIGRy
bS1pbnRlbC1uZXh0Lg0KPiANCj4gR3Vlc3MgaXQgd291bGQgYmUgYmV0dGVyIHRoYXQgSSBjYW4g
Y2hhbmdlIHRoaXMgcGF0Y2ggYWNjb3JkaW5nIHRvIGl0IHdoZW4gY2hlY2tpbmcgaW4uIFRoaXMg
d291bGQgcHJldmVudCBhIGNvbmZsaWN0IGluIGZ1dHVyZS4NCj4gDQo+IFRoYW5rcywNCj4gWmhp
Lg0KPiANCj4gT24gNC83LzIyIDM6MDMgUE0sIEphbmkgTmlrdWxhIHdyb3RlOg0KPj4gT24gVGh1
LCAwNyBBcHIgMjAyMiwgWmhpIFdhbmcgPHpoaS53YW5nLmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6
DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2d2dC5oIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZ3Z0LmgNCj4+PiBpbmRleCBkN2QzZmI2MTg2ZmQuLjc2
NjVkN2NmMGJkZCAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9n
dnQuaA0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2d2dC5oDQo+Pj4gQEAg
LTI2LDcgKzI2LDE3IEBADQo+Pj4gIA0KPj4+ICBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZTsNCj4+
PiAgDQo+Pj4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4NCj4+DQo+PiBZb3Ugb25seSBuZWVk
IDxsaW51eC90eXBlcy5oPi4gUGxlYXNlIGFkZCBpdCBiZWZvcmUgdGhlIGZvcndhcmQNCj4+IGRl
Y2xhcmF0aW9uIGFib3ZlLg0KPj4NCj4+PiArDQo+Pj4gICNpZmRlZiBDT05GSUdfRFJNX0k5MTVf
R1ZUDQo+Pj4gKw0KPj4+ICtzdHJ1Y3QgaW50ZWxfZ3Z0X21taW9fdGFibGVfaXRlciB7DQo+Pj4g
KwlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNTsNCj4+PiArCXZvaWQgKmRhdGE7DQo+Pj4g
KwlpbnQgKCpoYW5kbGVfbW1pb19jYikoc3RydWN0IGludGVsX2d2dF9tbWlvX3RhYmxlX2l0ZXIg
Kml0ZXIsDQo+Pj4gKwkJCSAgICAgIHUzMiBvZmZzZXQsIHUzMiBzaXplKTsNCj4+PiArfTsNCj4+
PiArDQo+Pj4gIGludCBpbnRlbF9ndnRfaW5pdChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2
X3ByaXYpOw0KPj4+ICB2b2lkIGludGVsX2d2dF9kcml2ZXJfcmVtb3ZlKHN0cnVjdCBkcm1faTkx
NV9wcml2YXRlICpkZXZfcHJpdik7DQo+Pj4gIGludCBpbnRlbF9ndnRfaW5pdF9kZXZpY2Uoc3Ry
dWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KTsNCj4+PiBAQCAtMzQsNiArNDQsNyBAQCB2
b2lkIGludGVsX2d2dF9jbGVhbl9kZXZpY2Uoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9w
cml2KTsNCj4+PiAgaW50IGludGVsX2d2dF9pbml0X2hvc3Qodm9pZCk7DQo+Pj4gIHZvaWQgaW50
ZWxfZ3Z0X3Nhbml0aXplX29wdGlvbnMoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2
KTsNCj4+PiAgdm9pZCBpbnRlbF9ndnRfcmVzdW1lKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpk
ZXZfcHJpdik7DQo+Pj4gK2ludCBpbnRlbF9ndnRfaXRlcmF0ZV9tbWlvX3RhYmxlKHN0cnVjdCBp
bnRlbF9ndnRfbW1pb190YWJsZV9pdGVyICppdGVyKTsNCj4+PiAgI2Vsc2UNCj4+PiAgc3RhdGlj
IGlubGluZSBpbnQgaW50ZWxfZ3Z0X2luaXQoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9w
cml2KQ0KPj4+ICB7DQo+Pj4gQEAgLTUxLDYgKzYyLDE2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBp
bnRlbF9ndnRfc2FuaXRpemVfb3B0aW9ucyhzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3By
aXYpDQo+Pj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBpbnRlbF9ndnRfcmVzdW1lKHN0cnVjdCBkcm1f
aTkxNV9wcml2YXRlICpkZXZfcHJpdikNCj4+PiAgew0KPj4+ICB9DQo+Pj4gKw0KPj4+ICt1bnNp
Z25lZCBsb25nIGludGVsX2d2dF9nZXRfZGV2aWNlX3R5cGUoc3RydWN0IGRybV9pOTE1X3ByaXZh
dGUgKmk5MTUpDQo+Pj4gK3sNCj4+PiArCXJldHVybiAwOw0KPj4+ICt9DQo+Pg0KPj4gVGhlIENP
TkZJR19EUk1fSTkxNV9HVlQ9eSBjb3VudGVycGFydCBmb3IgdGhpcyBpcyBpbiBtbWlvLmguIFNo
b3VsZCBiZQ0KPj4gYm90aCBpbiB0aGUgc2FtZSBoZWFkZXIuDQo+Pg0KPj4+ICsNCj4+PiAraW50
IGludGVsX2d2dF9pdGVyYXRlX21taW9fdGFibGUoc3RydWN0IGludGVsX2d2dF9tbWlvX3RhYmxl
X2l0ZXIgKml0ZXIpDQo+Pj4gK3sNCj4+PiArCXJldHVybiAwOw0KPj4+ICt9DQo+Pj4gICNlbmRp
Zg0KPj4+ICANCj4+PiAgI2VuZGlmIC8qIF9JTlRFTF9HVlRfSF8gKi8NCj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZ3Z0X21taW9fdGFibGUuYyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2ludGVsX2d2dF9tbWlvX3RhYmxlLmMNCj4+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDI5NDkxYTZkMjA5DQo+Pj4gLS0tIC9kZXYv
bnVsbA0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2d2dF9tbWlvX3RhYmxl
LmMNCj4+PiBAQCAtMCwwICsxLDEyOTAgQEANCj4+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IE1JVA0KPj4+ICsvKg0KPj4+ICsgKiBDb3B5cmlnaHQgwqkgMjAyMCBJbnRlbCBDb3Jwb3Jh
dGlvbg0KPj4+ICsgKi8NCj4+PiArDQo+Pj4gKyNpbmNsdWRlICJpOTE1X2Rydi5oIg0KPj4+ICsj
aW5jbHVkZSAiaTkxNV9yZWcuaCINCj4+PiArI2luY2x1ZGUgImRpc3BsYXkvdmx2X2RzaV9wbGxf
cmVncy5oIg0KPj4+ICsjaW5jbHVkZSAiZ3QvaW50ZWxfZ3RfcmVncy5oIg0KPj4+ICsjaW5jbHVk
ZSAiaW50ZWxfbWNoYmFyX3JlZ3MuaCINCj4+PiArI2luY2x1ZGUgImk5MTVfcHZpbmZvLmgiDQo+
Pj4gKyNpbmNsdWRlICJpbnRlbF9ndnQuaCINCj4+PiArI2luY2x1ZGUgImd2dC9ndnQuaCINCj4+
DQo+PiBHZW5lcmFsbHkgd2UgaGF2ZSB0aGUgaW5jbHVkZSBsaXN0cyBzb3J0ZWQuDQo+Pg0KPj4g
T3RoZXIgdGhhbiB0aGUgbml0cGlja3MgYWJvdmUsIHRoZSBzZXJpZXMgaXMNCj4+DQo+PiBBY2tl
ZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4+DQo+Pg0KPj4gQlIs
DQo+PiBKYW5pLg0KPj4NCj4+DQo+IA0KDQo=
