Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9366E3FFE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 08:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CB710E375;
	Mon, 17 Apr 2023 06:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF44410E1D1;
 Mon, 17 Apr 2023 06:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681713809; x=1713249809;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EKUMvj+SgY+/Ghvg1ljgNMWDIMeYj6PjtolILhc4KSM=;
 b=KPdrjnbzNmMvWb3dBx+pGhf8Um/nz63NYkcwhtSf5wjDaUpgS833PhX2
 jswWAUIHyxoi6AAZQRQIbqXA1BUnhA8JOJ7SLVkt3vI9tb9AMCB8IeDGE
 TEP0VE1zGpm43XFfQ7bUP7LzPY90Jqnu6kDWoe7t2LBxQiuH8De5T3rqa
 D8XcNjN3XHx5qGCo/MtMB0Ggx/Z9jwKr7ZrBXQb09qmfm/WmOFc2NEwo7
 XypFGRHl9V2rA9YBhQbbk0ctiW7EbHC92ona7WVmCj5W/FPte6XskE8wx
 H7qvdZTbU0t1Hn8K6Pa9ZTE9WLUbDloxePC/cptGjJSHAHDogt/wxqMZo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="342309565"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="342309565"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2023 23:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="640856274"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="640856274"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 16 Apr 2023 23:43:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 16 Apr 2023 23:43:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 16 Apr 2023 23:43:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 16 Apr 2023 23:43:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 16 Apr 2023 23:43:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brTsImiCHSn8+pMYBXLgfXsbxrtJwA3p3cf65xYYHxTvwwshuWxjvlxCvlQPZNtiAL3amujM7QXozfjb0r0gQTdTlsxwe/fiViUZNGPD9ASM6nRapmqjjCINNL/BNDG56ef/89xS0dUFgp6IUHM4mAUD39yPMmzhiRhzFxAaBgEkaABjolJD/4QdLULh9r8IfiHxRSYDKsOa9sEQDc6lkj7UPmncWctTz9x3GYhY+VW/l5aKJ6xhULCY9bYbXx/ZT5w/jisqEslVBRMJFEZvPigXs9HMRG937lT6XfCSJ7lomvohSQluhf9C8Zcs/9FG9e/YVA34QRD80QF5r02t4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKUMvj+SgY+/Ghvg1ljgNMWDIMeYj6PjtolILhc4KSM=;
 b=G69W+AfTUgtnPV14Quh5X1SpRgD20krgApH39Yygmiq/l6gswxdqgBYzHvI1Whcrf0VW3HNVsHVJGK7EsnQlFGOyEVC/l51R1ptK3WdHXPXNd2xpGF6FSRRjEeh5wQ5coMWhLEtSk+VTLmoK42QnzT+5qFhkUQuQsJxiyaPurlLaL3j1Gzek0BghODY+Q4sQ/4lDzRRgno800Aod/gtjIiJXxwMhKqdXZis8BzNsJ944WAEMWVqF21AzSSD6UokZdx6Fkn3b646SCWg1ohhkCY6AN1vzf59+y5XVYVNIw+tPW9pagj/AJMgFDQPipcAR/v+9KZay7ukB1zW4oRtGoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2574.namprd11.prod.outlook.com (2603:10b6:805:59::14)
 by BL1PR11MB5430.namprd11.prod.outlook.com (2603:10b6:208:31e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 06:43:20 +0000
Received: from SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::cb23:5215:112f:30c3]) by SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::cb23:5215:112f:30c3%5]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 06:43:20 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Timo Aaltonen <tjaalton@ubuntu.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 0/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Topic: [Intel-gfx] [PATCH 0/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Index: AQHZcPUub5n1q1S/5k+A98HERh8xS68vCsIAgAABp9A=
Date: Mon, 17 Apr 2023 06:43:20 +0000
Message-ID: <SN6PR11MB257475B612B2D78EC9801D189A9C9@SN6PR11MB2574.namprd11.prod.outlook.com>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <22235ebd-434f-ec17-43ca-41a29589b202@ubuntu.com>
In-Reply-To: <22235ebd-434f-ec17-43ca-41a29589b202@ubuntu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2574:EE_|BL1PR11MB5430:EE_
x-ms-office365-filtering-correlation-id: 287979a8-c951-4354-04af-08db3f0f08bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iuwT9gJMUrpZ9WUrJGJUXitwjBYsran5PYTpHcLDMbmCyQCC+lssrAnKxE7+u+e42TOSKlNqUgM2E/aiLzyGHrFHAk5II36SI28asp3RIOcb9faGAwPctG2TOAwfMPDE+fkQ0/bOmdinzNdJsJ883ncxL7Sd6VgGQzJLl2VIEtycCC8BCAWgcqoTHmLbLvSIdtK8Q0WIs0eCM0dsKRGZHMsExA+Z9R7BalIAo7Twp3IrC1A8JF77o+S95S6K8ASnIOSK2a8/YpmBvewtxh0NKIlFLdaYChppiIP839KUBfAr3UnAwIbk+njTexjYiLP/Podlts846WoGenJqmX9sNphcyDkcn6QkoD92nGZBNiWNaeEY5FCiPR670uSY3gEMHBadWkBeNcdBAGpc9zNpgvRzHP3xfYPQ9Mz4QDmTV1lrP0CBly6k56CSAvlcssZNYQrOOAMjBEA573pL+O+lpgZFWBl++wZ8Odrix2mQqlfMG0MKm5PHgozmlDphUsGTjboRraTycvoLpb7JyNOVXKQ5s9l4AjIoaD2RXBQ6NyaBKiTbx0X1QboTW1Suz33SEJgu/30cvY0MTjD8WsjaYs/4FohjXZL3x1A03nbaM2QHb0h+ZshKi0Z8sjgAsUbI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2574.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199021)(38100700002)(8676002)(8936002)(122000001)(38070700005)(52536014)(5660300002)(2906002)(4744005)(33656002)(86362001)(55016003)(478600001)(7696005)(71200400001)(110136005)(186003)(26005)(6506007)(66476007)(76116006)(66946007)(66446008)(9686003)(83380400001)(82960400001)(41300700001)(316002)(4326008)(64756008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1lMK0FkMGV2VU4yT2o2c2I5MzlCcE83VnNTWnBHYlBFODY2VWhyM05xYWta?=
 =?utf-8?B?SDMzZW9XOVNTenBTOUF4bGRlRWk5cjB6dXVES3NndXpEemhscGcwdU5XamJR?=
 =?utf-8?B?Ym5aQlBDODdqbmFobG9UaGNVYkNFQiswc04xR1U3b2o5eXJrdUdhd25ZZEZr?=
 =?utf-8?B?OGVQWGpKME9ZWFdJUzNSUjE5TitoZEVXSHNrWUVSZ3BMT285NFU4WWU4ZzJS?=
 =?utf-8?B?SVZVV2puSlJVbkxzY0xtN0kxRnNzYi9aaURBYjd0emFxcHBFOWdTbFJvSGFl?=
 =?utf-8?B?SkNjNG44NDBYcUk2cXE2b08xRTB2UU9nV250ZGZObUd6bnI4TVk4R3NYcEND?=
 =?utf-8?B?WlpHeURJVnp0cFBsUWhXRzFEVi9yMzZCMDQ4NUl1UC9OWEI0b2hBSlBRM0Yx?=
 =?utf-8?B?TzVtcVFsUnFsT0xlbERYQ1Y3TTh0SUEvTm1ZOUxZYUVYWTBTRUpFUE5BRXZ5?=
 =?utf-8?B?OWRFQXIrQzlkQmkwQ1NwUkEzaGNsNlhTNUp5OCtua0pCMWVRZnhyT0QzYkxI?=
 =?utf-8?B?dSs5QjVLa0l6c3VNV0pMcXpScjlmU0p6RTJTeFFGVEJOWUxDQ2R6WUttQkJz?=
 =?utf-8?B?M1FRVjg1cExMejU2NjVCSS9TcUVaTWEyenhFcFVTVXFENVNsOXRjczVoR3RG?=
 =?utf-8?B?VnRMdnlsSHVoZGdPUEJQV3laYUVVWDg4VW5TQk1SaWxmcG1HTDdtUzVVSXRy?=
 =?utf-8?B?VDc5ZzRtMG0rN3hVU09lc2owOE42clpTTDNuY2pGU0FtVkNIaVRxamFmdzJj?=
 =?utf-8?B?L2pBbFRXYzNuL1RjN0dJUXFjbWNrU3BISXovaXhtWkhOU3ZZZDlRK21BOXdu?=
 =?utf-8?B?Ynd2UE03SFRFRHlkMTJFbW51eWVIUmMxbkdsa3FNalQyYmRRU1o1WkR1cVdO?=
 =?utf-8?B?aW85SmIxUUNla0JoeU8yUkNNcnczei9JY2l3VWNDNFh5UHhZcUFDamRGYWwy?=
 =?utf-8?B?Nnh5YjNtTWJ0UUFIMWRDWGFSUEZpbmJ1aUJJL3JzR1llUWJCUXNncThuOTlZ?=
 =?utf-8?B?NVlBdU9yNjJoNi9tMDJhVDJ2ZVFKaFYwaTdWVXhpUkZxeDkxc3NLeFZXeGZR?=
 =?utf-8?B?bHI1NUthUE15eVZKeTRNWjFGNldnamRCd0c4Y0ZSdElZRXdCVXVJNDRKS2tK?=
 =?utf-8?B?TzdYV0VUZWlELyt6V29lbEFvRkNaRnVVRTVUSlJ5WjVxTlpNVFRUMWQ0SEhE?=
 =?utf-8?B?WUVabHh4SFVGZmtmY3diaFJOYkdRd2ZKNHVrMzNFZnpPMzFsQkhybUorc0M4?=
 =?utf-8?B?WEhLZ3pvSjd4dmtNUW9jdTljUXZkM3I5RVRBN1cwcGc3VmZuc0JPRHVpSWRq?=
 =?utf-8?B?UUs4ZzUrNnk5Tm9FUitMT29KQzVya3V6Sk5GYnhOdUhUQ2VYL2VSVndpK0J4?=
 =?utf-8?B?eXNsZDZOcmVSNlEycmhxQmNrakVJQll4cWN4UzkrZENjcC9UWFBER2MvemR4?=
 =?utf-8?B?QWQ1Q09aWmpEM0ZXNmtLMjRETDZGQzF3a3R6VEE0UmpRS00yMEQ5aGFNeXNr?=
 =?utf-8?B?VEh6N0pNUlczdVVVYUN6Rm9sWDJqUlM4ekFTR0s4bXZaWVZNREJHWmExUUJo?=
 =?utf-8?B?SkIvdGRRbkhjeGNiY3hPWURrcm1TcC9rdHVwNEVEV2o3RGI5TjFhUXJ1NmN4?=
 =?utf-8?B?RFo0UXM3bUZuN0JYQThWa21yeXI4OEtKb2wrMEpOdWhySVlUQ0xPZGpCWC9s?=
 =?utf-8?B?RXU2SXo5WS9WaTFjdlBVNVVGNVBUVWkrTXRIUkNRcFpxL2w0eTB5dVVVYzNi?=
 =?utf-8?B?Q1N0YmtuK1paY052OEJWSVQvT25tZWp0dkFhb1BJTmhHcTJObXkyREFqa1V0?=
 =?utf-8?B?QTdXQ3FodXZGOE82UDFyc3ZEL0V2ZzUzY3FNbXBnLzZJbWN2Y2xpY0NRT2Vj?=
 =?utf-8?B?a1NmdXNwbkpNcTNCcEE5Z09JWUp6RDJucEUyb2ZLNkcxcENaaWt0dGlKR09O?=
 =?utf-8?B?eEpURnVIMXBkYWNLS1MxcmJzZVRueWFuSWFJUGtTWThINmVzbGNaZ01BT0Iv?=
 =?utf-8?B?K0FtcDVjU3NnWXZmZFZ6ZURtVmEvem9Bc1hNaDd4em85SldLTzVkSVRpbUxW?=
 =?utf-8?B?N1lBdjVxUzhsR2JlUGQrNE02bjk4NVRjcHlraTRFOGNSZGRGM2thWDJLd1ZQ?=
 =?utf-8?Q?XHnw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 287979a8-c951-4354-04af-08db3f0f08bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 06:43:20.6253 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SPYl1RHhB5L1t0/wgWRto5fQxoyheWwyn78CR8q3KDaI7rznCYAW8NaX6ffCjIcpKd5y/Xjzqe0Qhzp6zv9EcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5430
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBmZWkueWFuZ0BpbnRlbC5jb20ga2lyam9pdHRpIDE3LjQuMjAyMyBrbG8gOS4yNDoNCj4+IEZy
b206IEZlaSBZYW5nIDxmZWkueWFuZ0BpbnRlbC5jb20+DQo+PiANCj4+IFRoZSBzZXJpZXMgaW5j
bHVkZXMgcGF0Y2hlcyBuZWVkZWQgdG8gZW5hYmxlIE1UTC4NCj4+IEFsc28gYWRkIG5ldyBleHRl
bnNpb24gZm9yIEdFTV9DUkVBVEUgdUFQSSB0byBsZXQgdXNlciBzcGFjZSBzZXQgY2FjaGUgDQo+
PiBwb2xpY3kgZm9yIGJ1ZmZlciBvYmplY3RzLg0KPg0KPiBpZiBJJ20gY291bnRpbmcgcmlnaHQs
IHRoaXMgd291bGQgYmUgdmVyc2lvbiA1IG9mIHRoZSBzZXJpZXMsIHlldCB0aGF0IGlzIG5vdCBz
aG93biBhbnl3aGVyZSBub3IgdGhlIGNoYW5nZXMgYmV0d2VlbiBzZXJpZXMuLg0KDQpZZXMsIG1v
c3RseSBhZGRyZXNzaW5nIG1pbm9yIGlzc3VlcywganVzdCB3YW50IHRvIGtlZXAgdGhlIGNvbW1p
dCBtZXNzYWdlIGNsZWFuIGFzIGl0J3MgdGhlIGVuYWJsZW1lbnQgcGF0Y2ggc2V0IGZvciBuZXcg
cGxhdGZvcm0uDQoNCj4gLS0NCj4gdA0KDQo=
