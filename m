Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87366A13BE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 00:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4303910E0A1;
	Thu, 23 Feb 2023 23:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E325410E0A1;
 Thu, 23 Feb 2023 23:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677194849; x=1708730849;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7YKWvyASfjRnIVvefA4JmFOze5eX/03dTyLUiQalSrs=;
 b=jNSXBC5QKoylVW5N64mApuwaX6kJAi3WgVRtnPYeuNRYbvgz/FPfMPRY
 TIx1UvHtVqvmkblnWDXw6A8yORtxOhwEL7myVMj5Wfg/PHSEPrPqRPuLb
 8YZEkxNbhg4stj2jCsjfZG3EUdeoAtCFKw4/tdYl5uCRhtaAKrbafDK/e
 n7n9Oyg2GwI96aTS9KQNO+CdkaSrjeb5BELlITGlcP5LSuQFUMEiOJgWu
 d0VVQLwiDJcEWqBMn0qM6r4Z2D5qfLw+LI27ERug0THz3tV1qwM8qx8r8
 SJpmBDxFssvO9hpwnb8nMKX29AZGBpH5xAERjSrLtVcpw9x2jCt04mkLk w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="398081448"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="398081448"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 15:27:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="815536572"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="815536572"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2023 15:27:27 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 15:27:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 23 Feb 2023 15:27:25 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 23 Feb 2023 15:27:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuUJo4eLPoybh4IBrDosTsVDx4wMipZFOTIzvCeftIGrjca6tx4H02P/oQYd/2eJ26SxNTCx+CC2QeEh9GzxQ1xDqXX2cdtrYX2XUEOACUGxCAzG/AurETrZXWB+57cqLK1yVQz7SeACLyjBOlVND/o+t9qRdXheCfOF5UGjaq1GBjdHjCX0FyjwYzCNiTw+h8dCMVhApL4CU8q7vAnPyGP6as6vVG4VGP5fv3Z5yMgpJ5U5JK8V9+kkYI6hx76v01pVXL/A2dBjmdVHzmOqW9SM+vFKHZvRCTQI+duYXOTxynYahuBsPuT40JJe6hdHDwTAQVSnXJlmqN6zESBrnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YKWvyASfjRnIVvefA4JmFOze5eX/03dTyLUiQalSrs=;
 b=iRSJXUNO834rYnViSUg2isfUexJnME/y3JhF+yFJKNMiSqW/0eoGnJI6btk2mejweJlEV9ZSE5vZELbqrUTllVMHfxGDeoZlNAcK8brdGX7kGnuJrAWAss89b534JPre9HGEy9NsDTW+esd7eu+5QLOMVnvQV25zDz/TV2G3QTcu4vYJ8c5HsnWkVBMVubqSau5mT6Ch8MPtwpRjgdNoEohkApRC1zW3tsPPVZJ5KZv3V3kzaPmbq6Lg+bfoh/sccYeLNtYgWlga/SOlA1RweKLI+CNBdh5ifx2dhLk+3KGCpkErXI/w8RqeBsXMqzcqFoOCPhPb440e4w6UHGfrCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW4PR11MB7078.namprd11.prod.outlook.com (2603:10b6:303:219::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 23:27:23 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 23:27:23 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v5 5/8] drm/i915/pxp: Add ARB session creation
 and cleanup
Thread-Topic: [Intel-gfx] [PATCH v5 5/8] drm/i915/pxp: Add ARB session
 creation and cleanup
Thread-Index: AQHZQLy8dSmZjfcHoEa0mqcErnEcV67SedeAgArBcIA=
Date: Thu, 23 Feb 2023 23:27:22 +0000
Message-ID: <465d52f7588a20589a63b8ded64eb42f9af1dbb8.camel@intel.com>
References: <20230214213844.2890382-1-alan.previn.teres.alexis@intel.com>
 <20230214213844.2890382-6-alan.previn.teres.alexis@intel.com>
 <a37b0016cc45876ea9df28f91c34a92daacb08e1.camel@intel.com>
In-Reply-To: <a37b0016cc45876ea9df28f91c34a92daacb08e1.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MW4PR11MB7078:EE_
x-ms-office365-filtering-correlation-id: 2c307d4a-2fb4-4f4c-a32b-08db15f583ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SyN/czVzLwPKKAsPsympwZpwE3hjd9yZHX/hsDTHOndby3huJVQnQb4eo9msp1XmZNwnt2F6RqIJKi8itB+XdssWUDuQNmeoo2/ejzYGIMg+U58KU0naww3mZ+/H9tXifCqGWRyOjtIxvOdtcSZ4oRCgAFvzc0Ueu4mKe40Zr2Vcqy47TtJhA681CHkqn9IKi181SvvkCFT1pw/nZHeCLDaMlSYwTah1Bzkdg28mXN9ORwVnrDSPfXY7vFTVzCp1t6hUByKxC0XNy354LBGyvJGX6jFPSh4gnPOxWv/FKUFXiXQLGtDNB5j+9MTU+BWDBHx4Pr002ivxSwh5GfQMhoZmptN5Ikc0tU045U+PyU+KMgohNv9TvEeu0XHobhLpPkGDOaXNuOvBAdcksiJUYoTDAnwNK/GjvLSodqozXcR5Tsa7taDsZsOO+bGg0/0zt3pBrTrgGX8nIerUR/OKkL+tCvDFjRl/QUX7S6vHDQP80I7On6AfjFgVYaSe63KnP+3dF1DZHP+ptQKpkOa3hWeajBARKN3AD4N6gmzaymqIz7VnR8Ixkj2KPckMX+CCgJg0dl4dHPOk6BdB0qN9QFIdttwOLcm/Edmk1GqqPxGjKIK6OtciDHIHAtETMWIIyLZsjfPHCKwo957dUiBjVFCazmUsl/AuRosv3uEwT3taWSpuzAnWM1kscjPE+rc/xkR1uN2cFyGPmJQAI+Zllw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199018)(2616005)(91956017)(41300700001)(478600001)(83380400001)(5660300002)(8936002)(186003)(38100700002)(86362001)(26005)(8676002)(6916009)(4326008)(38070700005)(66946007)(76116006)(6506007)(6512007)(82960400001)(316002)(122000001)(66556008)(36756003)(66446008)(64756008)(66476007)(71200400001)(6486002)(450100002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzV0dUFZRjh0YnM1Rk5BYWdHUlVHLzU2ZExHQmFvL2wzYWwrVkM5cEQ1ektH?=
 =?utf-8?B?c3BodU5jTXVPQ3dGQ3dyMGc5L2s4UGh1ZHhadGZPK2NqNjdGZ3FJWVlSUTdF?=
 =?utf-8?B?SGlZRGVFMGd1a3A3TXpVU2paOEx6S0hMRENEVGNsamNwOHhXaE4vb1RSb3k5?=
 =?utf-8?B?cXVBQ2J4UnB0eXR4U0d0clhlMHhmc1owc0xNc3YvMFMrYlhhTGZoSW94eVdS?=
 =?utf-8?B?WHVHc2J4UnBqSTdhNk1BNFloMHhWc29WQTRLT0VrSXFIblhyZjhlUmQyN0Fs?=
 =?utf-8?B?VTVjR21vbllWQ1FwSkxRLzQrNWJUamtEdEtleDBsWm9KSDRCMWxyVXdlMDVj?=
 =?utf-8?B?SXVIT1F6VG5TUG1PMWxKdFNWbEt6MnNHWFJQNVlvVEpjeDNENFc1b1JUVDJr?=
 =?utf-8?B?NWQraGx4NnFEM0plTEpZbnRQbHdFcENQVTF0bmdRcVhWUzVudUhnT3lNUE5v?=
 =?utf-8?B?MG4xOVFoRUxHeGprQU1lQ3NmT3g4UWNlMDNVelJDTWwxVHU1YTB3N3F6amZn?=
 =?utf-8?B?NlV3a1VHNEFkTnQ1WDhxajdUN1REaXpiOFNUMCt1dXdSMVBZNW9tUnlBdFhq?=
 =?utf-8?B?MXU2OUxCNFNZZGdrQU00ZDdrMVZ1OUtyckNFMlVRM3V2MXJUZ1U4WDJKaUpU?=
 =?utf-8?B?ZUc1NzU3K1JTNUVMVlIrQmYzL25vQ2QvN2JSdWdIREtBU0lWenZQSS9PdFRD?=
 =?utf-8?B?VnFDRVlXZVU1TmxDcEhTdkwxUWFWQUpCUjNaZ3RVVlZwb1ZxZ2JFaVZGTjV5?=
 =?utf-8?B?eXFiWlY4dGUyaDI4TU1obUxuMXR1MTR4eXRrdk1vSXp5b2NxYnB5UU51bVEw?=
 =?utf-8?B?Kzgvbm9jckV2K0xuMGRzVllJUFVaaXprbUNScjRVS3g1bFZHam5hRDdyL0pU?=
 =?utf-8?B?ak42SjUwQlhVdU1WeTQ0OGd0NHpOWUJDWTFwSFNuREM3bmFnY3pxZVFpMS9X?=
 =?utf-8?B?cFNZUU9kUVU1TS9RWG9Gc0dkUVlLcGE5S3hQSjQ2enduQ1d0NXdiWXFSbGFl?=
 =?utf-8?B?L1NacjZxdGNpamJsZEpxdGEvSk9wRGRjWVo3dDRIVXAzdDd1M2VMYVlBcGxY?=
 =?utf-8?B?Rmg2VisvTzVHb1NKVk9zekg1bzdPTzh4ZUludXA1djZmS0FVNUhrQ3JJYW93?=
 =?utf-8?B?MGx6cEZGS0FHRnBacC9ZdnoxdndtUkVpeG5hby9QbDVybjhydFhjMVExQ0E5?=
 =?utf-8?B?R01pWmVTVDJtR3R0bmJZNE1PRzBXdHhxeVNFaVBscUxOdDcxQmF0OEcrYWNa?=
 =?utf-8?B?U3VOWUF1V21iZUl3QVI4SVh5YzVJWlNUdzZoVUpCejY5Yy9vQzA4WWF0dWwx?=
 =?utf-8?B?SS84Qk1YNVhHSTkvdlk3MFdmSFYvcG4zbVA0aGhLWnZnSndHZ1VjRG1sNTJR?=
 =?utf-8?B?UVg4ajJlRkdRR29WMHRXT2s5L3doVVE4d0NCZVpnSTRpenFYRzYyMzJKT1lO?=
 =?utf-8?B?WmEybjR1M2NpZEpibGNCUUpRRHpaRDhhMzl0OVAzTng3RXhmTWFPYUVwcUNq?=
 =?utf-8?B?aEpCQmIwU2kyUTBROENLaC8xKzZ4dlRCQnFXR1k3em9UTjJyd0F6RjA0Unc3?=
 =?utf-8?B?QTJtK3JRTHFiRW43cGJ6RWtuNzQwZkFsL2tJYTc5anhxaWdyWHhLdGtHMVRL?=
 =?utf-8?B?N2gzUGllc1dLdXJDQlQ2Rm9VNUZZeDl1cnRNRTVQS1dtajRDd3doSmF2Qk94?=
 =?utf-8?B?ZHFRbHZIUmpQTU1PTElUZXBpQ29LWGFnTFczcW04Z0ZCNjhZa0t0bWo2RUNM?=
 =?utf-8?B?ZE14Y3FYVVRRQk1VcUlaVjQrV2RaRFBtVWd5aG5iYnMycnpLRHdEUEY0b1dE?=
 =?utf-8?B?YzZmOEFyZTEybXRUeGc3SUtVcXczZGpRY0MxV3RyR0NOWFBpUjd4NVp6V085?=
 =?utf-8?B?MlZSQTN3NmtKU0dOam0vallhWXloUWFOQThvRUtjQmg3cVlERk1tY21BWW1L?=
 =?utf-8?B?RE92UFoxZS9ZS1VpdCtOMG5QOWxYcXFJU3B6Vm1ISW1KY2xieEx4R2Y2cncw?=
 =?utf-8?B?WUpXbXhYaklzamIyK2RkVFluSmZLV3lQeXBWT1dIZjcyU1UxL0JZOEtnc2V1?=
 =?utf-8?B?WWlqSlRlR1k3Sm0wNG93NXBWa0RlWFpadlBVY0luOU1nais3T3o3TGNCOXZ4?=
 =?utf-8?B?L0JrUU5nUFg0R0hYL3pFMWJldS9FTC9FZEFQTnJoOWtDT01VOURSaDFKY0t1?=
 =?utf-8?Q?cGAAbEE8yJ/hHQS62PkTl3GlsIHwQl6pqauri/w0HJu3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0A67E8D77A150408FE6EFC86C46BC83@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c307d4a-2fb4-4f4c-a32b-08db15f583ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 23:27:22.7526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XwY+Bbl5BF42foKCDTPCRnUUUFt+iGv1Wubldh4Q4iUGdNiQ/J656/zU2LfCg+TJiF0nCyzMFqLj/XgheZdy5EVNb1eUlHtfRA/N7vv4rM/m/8kWxnlkh/yQozfvtwLm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7078
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

T24gRnJpLCAyMDIzLTAyLTE3IGF0IDAzOjEyICswMDAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBPbiBUdWUsIDIwMjMtMDItMTQgYXQgMTM6MzggLTA4MDAsIFRlcmVzIEFs
ZXhpcywgQWxhbiBQcmV2aW4gd3JvdGU6DQo+ID4gQWRkIE1UTCdzIGZ1bmN0aW9uIGZvciBBUkIg
c2Vzc2lvbiBjcmVhdGlvbiB1c2luZyBQWFAgZmlybXdhcmUNCj4gPiB2ZXJzaW9uIDQuMyBBQkkg
c3RydWN0dXJlIGZvcm1hdC4NCj4gDQo+IGFsYW46c25pcA0KPiANCj4gTm90IHBhcnQgb2YgdGhp
cyBwYXRjaCB0b2RheSBidXQgYSBuZXcgbW9kaWZpY2F0aW9uIGlzIHJlcXVpcmVkIHRoYXQgd291
bGQgZW5kIHVwIGdvaW5nIGludG8gdGhpcyBwYXRjaCAtLS0+DQo+IA0KPiBTbyBmcm9tIHRoZSBp
bnRlcm5hbCB0ZXN0aW5nIHdlIGFyZSBkb2luZyBvbiBNVEwsIGkgaGF2ZSBub3RpY2VkIHRoYXQg
dGhlIGZpcnN0IHRpbWUgdGhlIEdTQyBmaXJtd2FyZQ0KPiBpcyByZXF1ZXN0ZWQgdG8gaW5pdCB0
aGUgYXJiIHNlc3Npb24gKHJpZ2h0IGFmdGVyIGEgY29sZC1ib290IG9yIMKgZHJpdmVyLXJlbG9h
ZC1hZnRlci1mbHIpLCBpdCB0YWtlcyBtdWNoIGxvbmdlci4NCj4gVGhpcyBoYXMgcmVzdWx0ZWQg
aW4gdGhlIG9ic2VydmF0aW9uIG9mIHRoZSBmb2xsb3dpbmcgcHJvYmxlbWF0aWMgZXZlbnQgZmxv
dzoNCj4gDQo+IDEuIGFwcCBvciBpZ3QgY2FsbHMgZ2VtLWNvbnRleHQtY3JlYXRlIHRvIGNyZWF0
ZSBhIHByb3RlY3RlZCBjb250ZXh0IChhZnRlciBhIGZyZXNoIGJvb3Qgb3IgZHJpdmVyIHJlbG9h
ZCkuDQo+IDIuIGludGVsX3B4cF9zdGFydCB3aWxsIGJlZ2luIHRoZSBnbG9iYWwgdGVhcmRvd24g
YW5kIHJlY3JlYXRpb24gd2hlcmU6DQo+IAkyLWE6wqB0aGUgZmlyc3QgcGFydCAoaS5lLiBzZXNz
aW9uIHRlYXJkb3duKSBpcyBza2lwcGVkIChzaW5jZSBhcmIgc2Vzc2lvbiB3YXNudCBjcmVhdGVk
IGJlZm9yZSB0aGlzKQ0KPiDCoCDCoCDCoCDCoCAyLWI6IHRoZSBzZWNvbmQgcGFydCAoaS5lLiBh
cmIgc2Vzc2lvbiBpbml0IGNvbW1hbmRzIHZpYSB0aGUgZ3NjIGZpcm13YXJlKSBkb2VzIGhhcHBl
biBhbmQgdGFrZXMgYSBsb25nIHRpbWUgKG9uIGZpcnN0IHRpbWUpDQo+IDMuIHN0ZXAgMiBpcyBx
dWV1ZWQgdGhydSBhIHdvcmtlciB3aGlsZSB0aGUgbWFpbiBjYWxsIGludG8gaW50ZWxfcHhwX3N0
YXJ0IGNvbnRpbnVlcyB0byB3YWl0IGZvciB0aGUgYXJiDQo+IMKgIMKgIHNlc3Npb24gdG8gc3Rh
cnQgYW5kIGZpbmFsbHkgYmFpbHMgb3V0IHdpdGggYSB0aW1lb3V0IChiYWNrIHVwIHRocm91Z2gg
Z2VtLWNvbnRleHQtY3JlYXRlKS4NCj4gNC4gYXBwIHJldHJpZXMgYWdhaW4gYW5kIG5vdyB3ZSBn
ZXQgYSBzZWNvbmQgY2FsbCB0aGF0IHJlcGVhdHMgc3RlcCAxIHdoaWxlIDItYiBpcyBzdGlsbCB3
cmFwcGluZyB1cC4NCj4gwqAgwqAgc28gZGVwZW5kaW5nIG9uIHRoZSByYWNlIG9mIHRoaXMgc3Rl
cCA0IChzdGVwLTEtcmVjYWxsKSB2cyB0aGUgY29tcGxldGlvbiBvZiBzdGVwIDItYiwgd2UgY291
bGQgZW5kIHVwDQo+IMKgIMKgIGdldHRpbmcgYSAybmQgdGVhcmRvd24gcmlnaHQgKGkuZS4gc3Rl
cCAyLWEgZ29pbmcgaW4pIGFmdGVyIHRoZSB0aGUgZmlyc3QgYXJiLXNlc3Npb24tY3JlYXRpb24g
Y29tcGxldGVkDQo+ICAgICAuLi4gZXZlbnRob3VnaCBpbiBib3RoIGNhc2VzIGFwcCBqdXN0IHdh
bnRzIHRoZSBjcmVhdGlvbi4NCj4gDQo+IFRoZSBzaW1wbGVzdCBmaXggKHdpdGggbWluaW1hbCBj
b2RlIGNoYW5nZXMpIHdvdWxkIGJlIHRvIGFkZCBhIGNvbXBsZW1lbnRhcnkgImlzX2FyYl9jcmVh
dGlvbl9wZW5kaW5nIiBmbGFnDQo+IGFsb25nc2lkZSB0aGUgaXNfYXJiX3ZhbGlkIGZsYWcgLSB3
aXRoIGJvdGggcmVtYWluaW5pbmcgcHJvdGVjdGVkIGJ5IHRoZSBhcmItbXV0ZXguIFRoYXQgc2Fp
ZCwgd2UgSSdsbCByZXNwaW4gcmV2Ng0KPiB3aXRoIHRoaXMgZml4IGFsb25nIHdpdGggb3RoZXIg
bXV0ZXggZml4IG9uIFBhdGNoNC4NCg0KQWZ0ZXIgYWRkaXRpb25hbCBvZmZsaW5lIGRpc2N1c3Np
b25zIHdpdGggRGFuaWVsZSwgd2UndmUgZGVjaWRlZCBhZ2FpbnN0IGFkZGluZyBtb3JlIGNvbXBs
ZXhpdHkuDQpJbnN0ZWFkIHdlJ2xsIGdldCB0aGUgb2ZmaWNpYWwgdGltZW91dCBzcGVjIGZyb20g
dGhlIGdzYy1maXJtd2FyZSBhbmQgYnVtcCB1cCB0aGUgYXJiLXNlc3Npb24gdGltZW91dA0KY3Jl
YXRpb24gYWNyb3NzIHRoZSBjYWxsLXN0YWNrIHRvIGVuc3VyZSBpdHMgc3VmZmljaWVudCBhbmQg
aWYgaXQgZmFpbHMsIHdlIHJldHVybiAtRU5PREVWIGluZGljYXRpbmcNCndlIGRvIG5vdCBoYXZl
IFBYUCBzdXBwb3J0LiBBbHRob3VnaCB0aGlzIHdpbGwgYmxvY2sgdGhlIGdlbSBwcm90ZWN0ZWQt
Y29udGV4dCBjcmVhdGlvbiwgaXQgd2lsbCBub3QNCmJsb2NrIG90aGVyIGFwcHMsIG9ubHkgdGhl
IG9uZXMgY3JlYXRpbmcgcHJvdGVjdGVkIGNvbnRleHRzIHdoaWNoIHdvdWxkIGVuZCB1cCB3YWl0
aW5nIHNvbWV3aGVyZSBmb3INCnRoZSBnc2MgZncgKGZyb20gYW4gZTJlIHN5c3RlbSBsZXZlbCkg
bm8gbWF0dGVyIHdoYXQgZGVzaWduIHdlIGVtcGxveSBzbyBidW1waW5nIG91dCB0aW1lb3V0IHdp
dGggYcKgDQpoYXJkIC1FTk9ERVYgc2VlbXMgbGlrZSB0aGUgbW9zdCBzdHJhaWdodCBmb3J3YXJk
Lg0KDQo=
