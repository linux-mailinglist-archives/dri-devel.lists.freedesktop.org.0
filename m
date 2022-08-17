Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB6B5968C2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 07:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2181010EA08;
	Wed, 17 Aug 2022 05:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE4210EA19;
 Wed, 17 Aug 2022 05:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660714919; x=1692250919;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=38gzigTJIUJudMo5VUuVRJzj/86k32iZJk6TDsqifU4=;
 b=YKAGkzLxsXm5ZJPlWCqJjDf4bY2Hp+2j1r+xKrXOWVH2HOSQ8E6kGfxc
 IVzHWdyKaVT1kRwVSAcI2iLKtVG/IgbQ6XiPlviiA8zZpGktVkKtYLb4/
 HUl9ObS2gu/AdTTQID0rienr10AKj0bM+hPU/Cjg8LWkR0UVf69F2TJFY
 NAkKN/YHIubl5jZ+eVdYndtk9fPbOGGJu77kUCiXcTqUZsg2vxFQ+0fGn
 Px8Pu3kTC/zmJATjA0q2JkOvfdEtQ6cDGUx1+A9umkZqF0DsdK+FxOnj7
 TmWA658cPSCyekynuqgeQs57SYTd/2VRTrPkboxxulAlqoGcSP2qQTlQe Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="292402421"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="292402421"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 22:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="640317258"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 16 Aug 2022 22:41:58 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 16 Aug 2022 22:41:57 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 16 Aug 2022 22:41:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 16 Aug 2022 22:41:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 16 Aug 2022 22:41:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCNsVMVA7cCMF0wBBJxa6EX5498Tgit+clSrNz60/T2LNRwNpLO2+gS5zeBI7KVBMbrgiNz8roTK6Ro/WadIBQyN7n8MnB9vCK919uNhk0iYXzV3nzhTwG0ttPYRJnbanWYkf5cue1q0dwlBy6u7YrPcQEoe1rwE42DV04jZvhDf1qLyzHySCS93sSxIO1Tvou9PTjCPjp+3u7KMWQUlGQQuryAMfvt/ULcoPeAdZe4fuwGuivl5g8o6nuVczxh+nRYrVt4hepNMt5J+klIunNBKeoDYVDKQ9yL8q6FLrVtw2ls7lVl1dacc7DKggKHYUvnMV0BvVgWtRHUjFSYAjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38gzigTJIUJudMo5VUuVRJzj/86k32iZJk6TDsqifU4=;
 b=e7gp8J3x2Q8fFt4zXCDaAwwcRjovop85D+sEjoZf5QwwEqbIlTGkjdrVstZUypF7dkR+zNt3IHKB14Cuk8lUj40ZtBpQWkvQBJaqJVZ1kcFVkZ4bYdZbB72iRxEqd00Cnz5PtLK6tSVsD4pSg1x32MegspBgX1o93JxfMwc4+DVlChWHCRp+9kiPdfVxZnSx5tN5M/g9L0/CJYiHMf5ZOMTAGRGu0KPo275RGkOcnDhjXHCvE6WBViv9riD73vWbjnuPNov9oan+Y0h5UrTC9wKJUTlUPB/27jF6C0SeyYIVRGPNBtFZ8nayQkb7ba2d+2qLAej75tRsUzGljEPa8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SN6PR11MB2781.namprd11.prod.outlook.com (2603:10b6:805:62::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 05:41:55 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::b1a6:2b63:7c49:5cc5]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::b1a6:2b63:7c49:5cc5%4]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 05:41:55 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [Intel-gfx] [RFC 1/1] drm/i915/dgfx: Avoid parent bridge rpm on
 mmap mappings
Thread-Topic: [Intel-gfx] [RFC 1/1] drm/i915/dgfx: Avoid parent bridge rpm on
 mmap mappings
Thread-Index: AQHYqxK1ywwgylcI/E63sKkFz7gtXq2mrNsAgAvwZ8A=
Date: Wed, 17 Aug 2022 05:41:55 +0000
Message-ID: <CY5PR11MB62111C01310E6546B0F5715A956A9@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20220808103555.345-1-anshuman.gupta@intel.com>
 <20220808103555.345-2-anshuman.gupta@intel.com> <YvJ3ykH0MS+i1jp2@intel.com>
In-Reply-To: <YvJ3ykH0MS+i1jp2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7238d8f8-d0fa-4ac2-3153-08da801331c3
x-ms-traffictypediagnostic: SN6PR11MB2781:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O6Snrewh/lmhsbmX1ozipokd4aChxqAibeumqtxTgmnCAeUzyDiZCeZMees6rhumQpqGjAnmqz8MG6PZWVu6zMIJoHVc+lHdoIjb/wB4kSyY/WS0L18/cb8pMpxe9bM6cSfAKyoYt2yP7lQF40934/B6+1oQjpsRYwcFNhUxQSW0tLbaVmp1um3PKfYYBEFzrSlo6PIpnAuwauLe1TgTfFfk5zPe+mWIRYDrc8aoK1WMYFrtK6rOKlCeC5GZGao+IyeZ3li9N+rkk5UrH0VCYs2aHiaKD5LjRx45G46ecPQNpiBJrEtJL3yPnXLZNXReynSJNNLkbsNwR3xVmnyl52mW7qGAUXrrrf1KVJ2qDFgMAMHw/C+s+my/tcHvcHqIGNTe2jaERTxJlAZRiVQkFKrmWm7Xh1lIsP2zPZuWJS9ed3IqYbuFyU5BOQHC9nu2bYqq9CYKVdqJc7RZ+/Y7PK2EUFWRyp1p2v/5B5uB3jtLr2lfzEEHNFe/cu9ZmTYVIon6Xcb5Dstnj/1XphrHNnDcagz0HaO18NXstbVgk9ypelTmzG3R447uGsUXkO8QZv+myrKO5NeAb3fOLz+Ly9gC2q73sSabIqflsXU9R8if/ETU2Jh0gJyw0K40THfiVx5H54WaLjjuXrD0n3f9jYt+MHm5t1a9spin2gEk5svw+r3mAjk2UJF0jkrwKFbu/GHm6wMjyv0NFyTIA6br7sWalNP94uy/FXeoD2VQnw0JjOtzkcenClxLOKNqqB7thkf2e8pGMYEJ+2t9Jz2JMD7u6xUdwTH1JyzAeNcYYmA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(396003)(376002)(136003)(346002)(54906003)(55236004)(83380400001)(316002)(6636002)(82960400001)(55016003)(53546011)(9686003)(7696005)(26005)(41300700001)(38070700005)(33656002)(478600001)(107886003)(186003)(6506007)(5660300002)(8676002)(64756008)(76116006)(66946007)(66446008)(2906002)(66476007)(122000001)(86362001)(52536014)(8936002)(66556008)(6862004)(4326008)(71200400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTE2S3NBNUZCakl5MlFoL3ZSU0I1VUppWmsrZE94bGlvRGVDTkVDckVzdk1r?=
 =?utf-8?B?dTNqQXhaZ1VoMUp1azhmeVZlQkN0RmVtOFlyL2hBeExCZlp1UWNrQkdVOCtD?=
 =?utf-8?B?RHROYS9OQnBqd29NRGl6N3ZCd1RXUXBjR01IbG5sejlLTmRTVHNVOWRzRmhV?=
 =?utf-8?B?dVk0SlZSWTZDWlNuYStaY2FHdG5KVU9TQ0FyU01mNlh6TzU1WU1MTk5IaVlR?=
 =?utf-8?B?NTdtRnU0eHQzSC90Wk1PTHNCd0xGNXJ5aGw4WjQxYi82VXhOb0lBcGdpSHdn?=
 =?utf-8?B?WEZ5a1dMYU9KZ2MxaHJlNjZMV0o2ZmxQdE1Ja3pTL0c0TjByMWhYak9jekNq?=
 =?utf-8?B?ZnQ1UXMzbmE5UzUxbldUQkphU2xaTlNUQ3ZkMkgrL3JnQUFOV0FsSHhjS2dX?=
 =?utf-8?B?NmUwYlFmbktqT0dKbTZPTHprNjVpVUhKY0gzc3VJVEdZbFcyM2N5dk80bk9h?=
 =?utf-8?B?T1MzbTExd1NreXZFVzlGbS9RREVrcUczaHkyZitTVzhVS3dWVUQzUXArYzdk?=
 =?utf-8?B?d3NWOVppY2RNeVhnemlyUmZoNjhLTDJOVGVIeGdxVjYzbkV4aWxCTTJxTnIx?=
 =?utf-8?B?QXVEenlvS1owdlVlUUQ5M0tmQW1PQm56NGtsWWVJeDdJRGI2MHA1dE9sS01S?=
 =?utf-8?B?TVphSG42L2gwbFpTbnBLN3VyZTBuV0wwUnRpZmhjRjZZUUZiSW5xd0lxRjhh?=
 =?utf-8?B?NEFuLzhWcStqREtLMVVxeHh3VzJLL0JZcE9yZ3hySHEwUW02TXdaZys1S05X?=
 =?utf-8?B?TnBxWHVqeTRGVHZEOC9DSiswUnV1dTV3c3p0TStsSFlqUFJubVJ6c0Q0L0hs?=
 =?utf-8?B?cWk5Vm9EdHpLcW43UFd3T2doeklBV2xGSnlxUnVzcHQxZGpPTE02NXRDcVNU?=
 =?utf-8?B?ZWh5eDlzRjhCOVJwK1lVMlIrMjZRcGU3cHBzK0M3ZlppUEtHL1oySGhrY09C?=
 =?utf-8?B?dnRKaGhyMEo5ZEQ5L2pjUlhjQnU0a2RHNnF5UTNYekl4OUdjQjJIY3dsY2cz?=
 =?utf-8?B?MHUwOUUrc0NWQUFJZzBCYTcwUTN6NlJxNDAwcFVCL1A0eU5xeVYvMTI3SE9W?=
 =?utf-8?B?UFY3QzVWTWgyd3ZUMVlxSnpzby9KU0I0bnk1cm9wUmtRUmpuWFd4ZjNySE5a?=
 =?utf-8?B?Z3NoNmVWc3NJQzNDOHAzV1BjdzNwUUluaklodnN0VGliZWlzaEtpMWc0Sm1p?=
 =?utf-8?B?bG1zcEsxY2M2bEptT3FqNWJQT2t4Zk8yS1BMdllkUU1BOTN3WUxHSmR2b1FQ?=
 =?utf-8?B?TjJvTkdINGRpUngzK21weThucU5FRVdRWWJKWGljR0w3NW1rL0RxQXN6Q1VN?=
 =?utf-8?B?YXpnT0lKdVJOV0JXL0QvWXo0SGh5dk9XcFdqWkpmM0VhY2V5NzN1TW1yWnZm?=
 =?utf-8?B?UzkvaW5WL01BQ2ZDaWEwOUNTU2FDWWxIaG9RZTBiUnM2bGRkYTJmL0NkNWdp?=
 =?utf-8?B?VW9SRnhLeC9vbFhlODlJMUVZaDVpd0tkR2JyOHdVQno1OENyZkR4K285RUhz?=
 =?utf-8?B?bTdBamtWeDJDSnRYR1pKUWFITy9FNzNCMXg3M3lXTG4xcnp1OTdKZnVnQy8y?=
 =?utf-8?B?RmNKZEtOaldXWHNCb0tEOWptRzIrWGcxSjNnS3doaS9WZllKYWNya1JuejBB?=
 =?utf-8?B?TkY1TkNjMzFWRUs4VHNPN05HSUZnbFhDMWIrT0U3eWVsUDA3Tkw2cW9JdHhs?=
 =?utf-8?B?LzEzZFNvK3lOSm9oZXljeVRnL2hPUU9XQ2hqU0NzSTR4OUtIOTc3SzR1L29j?=
 =?utf-8?B?QUd1ZDdRdUNuMTZ4QmR6ODUwcWhUZS9qZDZhd0xqN0lQcTIyYUIxSFR2NVEr?=
 =?utf-8?B?SHVrRzFTQUZYZXdETUMyWUxYb1BBelVwbzRlbnNlZURyM2NhSDdmV3hkaVJ2?=
 =?utf-8?B?VktYbklLTzJQbGE4bjZFdzVXWWV2dkY5R24yWDJtUGVYdnBWV0I3MStTVFFB?=
 =?utf-8?B?TlduSUxLcjBtQ0hocFM3TGNaWGIvUEZIZWtXc3ZqeE91MEptc0h6YTMranV0?=
 =?utf-8?B?SDZSb1JXQ0FEajNLeTZzT1lRRDVlQlMwT1JsakgySzROcVFlQTl4L2JIVlRN?=
 =?utf-8?B?aGhyVVBSSTBxTThydWtnN1F2ak1hYmFaaytqWnFIUjRla21DU1FTQUp0UG9G?=
 =?utf-8?Q?p2zL/L5GW6/mvlP3XSnhJ3Hae?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7238d8f8-d0fa-4ac2-3153-08da801331c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 05:41:55.3487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qqidrwB6B09vGkSRnUN+28a4V2qUiKOzqcewphhtLQWkqP5COndONDOZt4MDvp4ls6tVaV/KjrRbjuH+q2/LDaPys+f4xvK5ddgxyOb8vl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2781
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
 "Lahtinen, Joonas" <joonas.lahtinen@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVml2aSwgUm9kcmlnbyA8
cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDksIDIwMjIg
ODozNiBQTQ0KPiBUbzogR3VwdGEsIEFuc2h1bWFuIDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+
DQo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkYW5pZWxAZmZ3bGwuY2g7
IFdpbHNvbiwgQ2hyaXMgUA0KPiA8Y2hyaXMucC53aWxzb25AaW50ZWwuY29tPjsgZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW0ludGVsLWdmeF0gW1JGQyAx
LzFdIGRybS9pOTE1L2RnZng6IEF2b2lkIHBhcmVudCBicmlkZ2UgcnBtIG9uDQo+IG1tYXAgbWFw
cGluZ3MNCj4gDQo+IE9uIE1vbiwgQXVnIDA4LCAyMDIyIGF0IDA0OjA1OjU1UE0gKzA1MzAsIEFu
c2h1bWFuIEd1cHRhIHdyb3RlOg0KPiA+IEFzIHBlciBQQ0llIFNwZWMgU2VjdGlvbiA1LjMsDQo+
ID4gV2hlbiBhIFR5cGUgMSBGdW5jdGlvbiBhc3NvY2lhdGVkIHdpdGggYSBTd2l0Y2gvUm9vdCBQ
b3J0IChhIOKAnHZpcnR1YWwNCj4gPiBicmlkZ2XigJ0pIGlzIGluIGEgbm9uLUQwIHBvd2VyIHN0
YXRlLCBpdCB3aWxsIGVtdWxhdGUgdGhlIGJlaGF2aW9yIG9mIGENCj4gPiBjb252ZW50aW9uYWwg
UENJIGJyaWRnZSBpbiBpdHMgaGFuZGxpbmcgb2YgTWVtb3J5LCBJL08sIGFuZA0KPiA+IENvbmZp
Z3VyYXRpb24gUmVxdWVzdHMgYW5kIENvbXBsZXRpb25zLiBBbGwgTWVtb3J5IGFuZCBJL08gcmVx
dWVzdHMNCj4gPiBmbG93aW5nIERvd25zdHJlYW0gYXJlIHRlcm1pbmF0ZWQgYXMgVW5zdXBwb3J0
ZWQgUmVxdWVzdHMuDQo+ID4NCj4gPiBEdWUgdG8gYWJvdmUgbGltaXRhdGlvbnMgd2hlbiBJbnRl
bCBER0ZYIENhcmRzIGdyYXBoaWNzIFBDSSBmdW5jJ3MNCj4gPiB1cHN0cmVhbSBicmlkZ2UocmVm
ZXJyZWQgYXMgVlNQKSBlbnRlcnMgdG8gRDMsIGFsbCBtbWFwIG1lbW9yeSBtYXBwaW5nDQo+ID4g
YXNzb2NpYXRlZCB3aXRoIGxtZW0gb2JqZWN0cyByZWFkcyAweGZmLCB0aGVyZWZvcmUgYXZvaWRp
bmcgVlNQDQo+ID4gcnVudGltZSBzdXNwZW5kIGFjY29yZGluZ2x5Lg0KPiA+DQo+ID4gVGhpcyB3
aWxsIG1ha2Ugc3VyZSB0aGF0IHVzZXIgY2FuIHJlYWQgdmFsaWQgZGF0YSBmcm9tIGxtZW0sIHdo
aWxlDQo+ID4gREdGWCBDYXJkIGdyYXBoaWNzIFBDSSBmdW5jIGlzIGluIEQzIHN0YXRlLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gR3VwdGEgPGFuc2h1bWFuLmd1cHRhQGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX21t
YW4uYyB8IDExICsrKysrKysrDQo+ID4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X3R0bS5jICB8ICA4ICsrKysrKw0KPiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRp
bWVfcG0uYyAgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9pbnRlbF9ydW50aW1lX3BtLmggIHwgIDIgKysNCj4gPiAgNCBmaWxlcyBjaGFuZ2Vk
LCA1NiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ2VtL2k5MTVfZ2VtX21tYW4uYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX21tYW4uYw0KPiA+IGluZGV4IDBjNWM0Mzg1MmUyNC4uOTY4YmVkNWI1NmQzIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9tbWFuLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jDQo+ID4g
QEAgLTg0NSw2ICs4NDUsMTAgQEAgc3RhdGljIHZvaWQgdm1fb3BlbihzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSkNCj4gPiAgCXN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmogPSBtbW8t
Pm9iajsNCj4gPg0KPiA+ICAJR0VNX0JVR19PTighb2JqKTsNCj4gPiArDQo+ID4gKwlpZiAoaTkx
NV9nZW1fb2JqZWN0X2lzX2xtZW0ob2JqKSkNCj4gPiArCQlpbnRlbF9ydW50aW1lX3BtX2dldF92
c3AodG9faTkxNShvYmotPmJhc2UuZGV2KSk7DQo+ID4gKw0KPiA+ICAJaTkxNV9nZW1fb2JqZWN0
X2dldChvYmopOw0KPiA+ICB9DQo+ID4NCj4gPiBAQCAtODU0LDYgKzg1OCwxMCBAQCBzdGF0aWMg
dm9pZCB2bV9jbG9zZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCj4gPiAgCXN0cnVjdCBk
cm1faTkxNV9nZW1fb2JqZWN0ICpvYmogPSBtbW8tPm9iajsNCj4gPg0KPiA+ICAJR0VNX0JVR19P
Tighb2JqKTsNCj4gPiArDQo+ID4gKwlpZiAoaTkxNV9nZW1fb2JqZWN0X2lzX2xtZW0ob2JqKSkN
Cj4gPiArCQlpbnRlbF9ydW50aW1lX3BtX3B1dF92c3AodG9faTkxNShvYmotPmJhc2UuZGV2KSk7
DQo+ID4gKw0KPiA+ICAJaTkxNV9nZW1fb2JqZWN0X3B1dChvYmopOw0KPiA+ICB9DQo+ID4NCj4g
PiBAQCAtOTcyLDYgKzk4MCw5IEBAIGludCBpOTE1X2dlbV9tbWFwKHN0cnVjdCBmaWxlICpmaWxw
LCBzdHJ1Y3QNCj4gdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCj4gPiAgCQlyZXR1cm4gUFRSX0VSUihh
bm9uKTsNCj4gPiAgCX0NCj4gPg0KPiA+ICsJaWYgKGk5MTVfZ2VtX29iamVjdF9pc19sbWVtKG9i
aikpDQo+ID4gKwkJaW50ZWxfcnVudGltZV9wbV9nZXRfdnNwKHRvX2k5MTUob2JqLT5iYXNlLmRl
dikpOw0KPiA+ICsNCj4gPiAgCXZtYS0+dm1fZmxhZ3MgfD0gVk1fUEZOTUFQIHwgVk1fRE9OVEVY
UEFORCB8DQo+IFZNX0RPTlREVU1QIHwgVk1fSU87DQo+ID4NCj4gPiAgCS8qDQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90dG0uYw0KPiA+IGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3R0bS5jDQo+ID4gaW5kZXggNWE1Y2YzMzJk
OGE1Li5iY2FjZDk1ZmRiYzEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL2k5MTVfZ2VtX3R0bS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX3R0bS5jDQo+ID4gQEAgLTExMDEsNiArMTEwMSwxMCBAQCBzdGF0aWMgdm9pZCB0dG1f
dm1fb3BlbihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QNCj4gKnZtYSkNCj4gPiAgCQlpOTE1X3R0bV90
b19nZW0odm1hLT52bV9wcml2YXRlX2RhdGEpOw0KPiA+DQo+ID4gIAlHRU1fQlVHX09OKCFvYmop
Ow0KPiA+ICsNCj4gPiArCWlmIChpOTE1X2dlbV9vYmplY3RfaXNfbG1lbShvYmopKQ0KPiA+ICsJ
CWludGVsX3J1bnRpbWVfcG1fZ2V0X3ZzcCh0b19pOTE1KG9iai0+YmFzZS5kZXYpKTsNCj4gPiAr
DQo+ID4gIAlpOTE1X2dlbV9vYmplY3RfZ2V0KG9iaik7DQo+ID4gIH0NCj4gPg0KPiA+IEBAIC0x
MTEwLDYgKzExMTQsMTAgQEAgc3RhdGljIHZvaWQgdHRtX3ZtX2Nsb3NlKHN0cnVjdCB2bV9hcmVh
X3N0cnVjdA0KPiAqdm1hKQ0KPiA+ICAJCWk5MTVfdHRtX3RvX2dlbSh2bWEtPnZtX3ByaXZhdGVf
ZGF0YSk7DQo+ID4NCj4gPiAgCUdFTV9CVUdfT04oIW9iaik7DQo+ID4gKw0KPiA+ICsJaWYgKGk5
MTVfZ2VtX29iamVjdF9pc19sbWVtKG9iaikpDQo+ID4gKwkJaW50ZWxfcnVudGltZV9wbV9wdXRf
dnNwKHRvX2k5MTUob2JqLT5iYXNlLmRldikpOw0KPiA+ICsNCj4gPiAgCWk5MTVfZ2VtX29iamVj
dF9wdXQob2JqKTsNCj4gPiAgfQ0KPiANCj4gd2UgbmVlZCB0byBlbnN1cmUgdGhlIHJ1bnRpbWUg
cG0gZ2V0IC8gcHV0IGF0IGRtYSBidWYgYXR0YWNoICYgZGV0YWNoIGFzIHdlbGwsDQo+IG5vPw0K
PiANCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9ydW50
aW1lX3BtLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRpbWVfcG0uYw0K
PiA+IGluZGV4IDZlZDU3ODZiY2QyOS4uYTU1NTc5MTg2NzRmIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRpbWVfcG0uYw0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2ludGVsX3J1bnRpbWVfcG0uYw0KPiA+IEBAIC02NDYsMyArNjQ2LDM4IEBA
IHZvaWQgaW50ZWxfcnVudGltZV9wbV9pbml0X2Vhcmx5KHN0cnVjdA0KPiA+IGludGVsX3J1bnRp
bWVfcG0gKnJwbSkNCj4gPg0KPiA+ICAJaW5pdF9pbnRlbF9ydW50aW1lX3BtX3dha2VyZWYocnBt
KTsNCj4gPiAgfQ0KPiA+ICsNCj4gPiArdm9pZCBpbnRlbF9ydW50aW1lX3BtX2dldF92c3Aoc3Ry
dWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpIHsNCj4gPiArCXN0cnVjdCBwY2lfZGV2ICpwZGV2
ID0gdG9fcGNpX2RldihpOTE1LT5kcm0uZGV2KSwgKnZzcDsNCj4gPiArDQo+ID4gKwlpZiAoIUlT
X0RHRlgoaTkxNSkpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCXZzcCA9IHBjaV91cHN0
cmVhbV9icmlkZ2UocGRldik7DQo+ID4gKwlpZiAoIXZzcCkgew0KPiA+ICsJCWRybV9lcnIoJmk5
MTUtPmRybSwgIkZhaWxlZCB0byBnZXQgdGhlIFBDSSB1cHN0cmVhbQ0KPiBicmlkZ2VcbiIpOw0K
PiA+ICsJCXJldHVybjsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlwY2lfZGJnKHZzcCwgImdldCBy
dW50aW1lIHVzYWdlIGNvdW50XG4iKTsNCj4gDQo+IHdlIHNob3VsZCBhbHdheXMgcHJlZmVyIHRo
ZSBkcm1fZGJnIGluIG91ciBzdWJzeXN0ZW0NCj4gDQo+ID4gKwlwbV9ydW50aW1lX2dldF9zeW5j
KCZ2c3AtPmRldik7DQo+IA0KPiB3aHk/IEkgYmVsaWV2ZSB0aGF0IGdyYWJiaW5nIG91ciBvd24g
cmVmIHdvdWxkIGJlIGVub3VnaCB0byBibG9jayB0aGUNCj4gdXBzdHJlYW0gY2hhaW4uIEkgZG9u
J3QgdW5kZXJzdGFuZCB3aHkgdGhpcyBpcyBzdWNoIGFuIHNwZWNpYWwgY2FzZSB0aGF0IHdlIGRv
bid0DQo+IHNlZSBhbnkgb3RoZXIgZHJpdmVyIGluIHRoZSBsaW51eCB0cmVlIGhhdmluZyB0byBk
byBzdWNoIGEgdGhpbmcuIHdoYXQgYW0gSQ0KPiBtaXNzaW5nPw0KSGkgUm9kcmlnbyAsDQpJIHdh
cyB0cnlpbmcgdG8gZ2V0IHdha2VyZWYgZm9yIGk5MTUgZGV2aWNlIGluIGk5MTVfZ2VtX21hcCwg
dm1fb3Blbiwgdm1fY2xvc2UgaG9vay4NCkJ1dCB0aGlzIGRvZXMgbm90IGxvb2tzIGxpa2UgYSBz
Y2FsYWJsZSBzb2x1dGlvbiB3aXRoIHdha2VyZWYgY29va2llIGluIG1tYXAgaG9va3MuDQpDb25z
aWRlcmluZyB0aGUgc2NlbmFyaW8uDQpJOTE1IG9iamVjdCBoYXMgZW1iZWRkZWQgYSB3YWtlcmVm
IGNvb2tpZSBpbiBzaWRlIGdlbSBvYmplY3QuDQpvYmotPndha2VyZWYgPSBpbnRlbF9ydW50aW1l
X3BtX2dldChycG0pIGluIGk5MTVfZ2VtX21tYXAgYW5kIHZtX29wZW4oKQ0KaW50ZWxfcnVudGlt
ZV9wbV9wdXQocnBtLCBvYmotPndha2VyZWYpIGluIHZtX2Nsb3NlKCkuDQp2bV9vcGVuKCkgd2ls
bCBiZSBjYWxsZWQgZm9yIGFueSBmb3JrKCkgYW5kIHZtX2Nsb3NlKCkgd2lsbCBnZXQgY2FsbCBm
b3IgYW55IGluc3RhbmNlIG9mIHZtX29wZW4gYXMgd2VsbCBhcyBmb3IgbXVubWFwKCkuDQpOb3cg
aXQgd2lsbCBkaWZmaWN1bHQgdG8gdHJhY2sgdGhlIGNvcnJlY3Qgb2JqLT53YWtlcmVmIGNvb2tp
ZSBoZXJlLCBpdCBtYXkgbGVhZCB0byB1bnJlbGF0ZWQgd2FrZXJlZiBpc3N1ZS4NClRpbGwgd2Ug
Z2V0IGEgcm9idXN0IHNvbHV0aW9uIGJ5IGludmFsaWRhdGluZyB0aGUgbW1hcCBtYXBwaW5nLCBj
YW4gd2UgY29uc2lkZXIgdGhpcyB0byBhcyB0ZW1wb3Jhcnkgc29sdXRpb24uDQoNClRoYW5rcywN
CkFuc2h1bWFuIEd1cHRhLg0KDQo+IA0KPiA+ICt9DQo+ID4gKw0KPiA+ICt2b2lkIGludGVsX3J1
bnRpbWVfcG1fcHV0X3ZzcChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkgew0KPiA+ICsJ
c3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGk5MTUtPmRybS5kZXYpLCAqdnNwOw0K
PiA+ICsNCj4gPiArCWlmICghSVNfREdGWChpOTE1KSkNCj4gPiArCQlyZXR1cm47DQo+ID4gKw0K
PiA+ICsJdnNwID0gcGNpX3Vwc3RyZWFtX2JyaWRnZShwZGV2KTsNCj4gPiArCWlmICghdnNwKSB7
DQo+ID4gKwkJZHJtX2VycigmaTkxNS0+ZHJtLCAiRmFpbGVkIHRvIGdldCB0aGUgUENJIHVwc3Ry
ZWFtDQo+IGJyaWRnZVxuIik7DQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAr
CXBjaV9kYmcodnNwLCAicHV0IHJ1bnRpbWUgdXNhZ2UgY291bnRcbiIpOw0KPiA+ICsJcG1fcnVu
dGltZV9tYXJrX2xhc3RfYnVzeSgmdnNwLT5kZXYpOw0KPiA+ICsJcG1fcnVudGltZV9wdXQoJnZz
cC0+ZGV2KTsNCj4gPiArfQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
bnRlbF9ydW50aW1lX3BtLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRp
bWVfcG0uaA0KPiA+IGluZGV4IGQ5MTYwZTNmZjRhZi4uYjg2ODQzYmY0ZjVkIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRpbWVfcG0uaA0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRpbWVfcG0uaA0KPiA+IEBAIC0xNzMsNiAr
MTczLDggQEAgdm9pZCBpbnRlbF9ydW50aW1lX3BtX2luaXRfZWFybHkoc3RydWN0DQo+ID4gaW50
ZWxfcnVudGltZV9wbSAqcnBtKTsgIHZvaWQgaW50ZWxfcnVudGltZV9wbV9lbmFibGUoc3RydWN0
DQo+ID4gaW50ZWxfcnVudGltZV9wbSAqcnBtKTsgIHZvaWQgaW50ZWxfcnVudGltZV9wbV9kaXNh
YmxlKHN0cnVjdA0KPiA+IGludGVsX3J1bnRpbWVfcG0gKnJwbSk7ICB2b2lkIGludGVsX3J1bnRp
bWVfcG1fZHJpdmVyX3JlbGVhc2Uoc3RydWN0DQo+ID4gaW50ZWxfcnVudGltZV9wbSAqcnBtKTsN
Cj4gPiArdm9pZCBpbnRlbF9ydW50aW1lX3BtX2dldF92c3Aoc3RydWN0IGRybV9pOTE1X3ByaXZh
dGUgKmk5MTUpOyB2b2lkDQo+ID4gK2ludGVsX3J1bnRpbWVfcG1fcHV0X3ZzcChzdHJ1Y3QgZHJt
X2k5MTVfcHJpdmF0ZSAqaTkxNSk7DQo+ID4NCj4gPiAgaW50ZWxfd2FrZXJlZl90IGludGVsX3J1
bnRpbWVfcG1fZ2V0KHN0cnVjdCBpbnRlbF9ydW50aW1lX3BtICpycG0pOw0KPiA+IGludGVsX3dh
a2VyZWZfdCBpbnRlbF9ydW50aW1lX3BtX2dldF9pZl9pbl91c2Uoc3RydWN0IGludGVsX3J1bnRp
bWVfcG0NCj4gPiAqcnBtKTsNCj4gPiAtLQ0KPiA+IDIuMjYuMg0KPiA+DQo=
