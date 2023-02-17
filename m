Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5D869A427
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 04:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72B710E3C1;
	Fri, 17 Feb 2023 03:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADEA10E3C1;
 Fri, 17 Feb 2023 03:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676603563; x=1708139563;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tr2A+LbQfeSFLLg/6ymIw7viVg9cYCzRK3V33agPq2E=;
 b=ItGYvb9TebP99pOq3in/l2fJVWY1UV7xUm6+kpi2Y5ir2OAXeehkCyqT
 YsZ9SqtaADNtwkJfpey1Fk6rfznD0BlY50Wxsk8N5Iqm5GcN9zYCr6kdg
 gtUMQFpDBslO2oOo1vaQsNFMl9Oz4OQ5Z2x87kYWEPRuXB3TQpoTBqiZp
 bS6H+CunIQLlhABmZ9D66CkX3MjlMYFexdbwjw67S/kI6NX7RD2tLq5Nc
 ikGyyF11el1M/iTvzILe2NdaL1vFPMTyj+Xim1hrYCm9xzvt6awE65VhJ
 mUmL+iKX1p6BMiLzvn2J4gKbyOJQn+Qb78W1pGiTYfZTfR53OSUcTlNZs Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="394373520"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="394373520"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 19:12:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="700759518"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="700759518"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 16 Feb 2023 19:12:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 19:12:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 19:12:29 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 19:12:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fx4Hh0lLugVHDos06BJpPRJxvKVC2RPreDl5jD3cYW4h0sDMmQtV9kiwDFoccv2K2Dkl/YWawYfFSuKEg1B2V4VGPaf3E6kSK6p4cdvnifEQRSbOFwXD4vISPITyG+77EZS9WDmoTZvHZuqXpbzCx9/nUrDhPyWg3TCv6AIoUq+eoUnvZ53Ic3Pr6dWuOjKKelIqmkYnIRruJJmp6S7uqcsNJKKPzmIz0CV5qrMTXTzVXiBXVHRLm3Cz16ad0scI6TEAgUbaCr+69kdWBDAU42i9uqKHkxcmt/P7VOKimjErP1+uq6pryaSiUshVi8iDsD24Mxa461mlJDQA6Cb/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tr2A+LbQfeSFLLg/6ymIw7viVg9cYCzRK3V33agPq2E=;
 b=J34z1mO1O4vyVxiiDLI35UU/P9k2/YvcKwFiDXFpt5nsqwVwSpcgpAyKzhm+AV8m3Cusykycwx72c96nWP4ACtgC+eDxOdn2BxFP/TbIjTiwwD6NsJ63u/mAoLoP+flGP/3EEEZ2O9SL3HxJnSuXwlH0of7GMTFEO3XAyf0r2SA7sCFJ15fii4R7uCGO2iUrE2plTrPpzkmcO5rK9wilPhPeHY91EObY2M0GMOEcC1YUzW/GS30G26QO+6+0CPifTKzbPQzBNFjffveQiJNLibqlP9EqJOF/vyVoyl7ChXWwHUF1hi4kBCl8yVrOoJlMaS4WtCwMHR/M4ZrdFySnjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM8PR11MB5637.namprd11.prod.outlook.com (2603:10b6:8:33::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13; Fri, 17 Feb 2023 03:12:27 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 03:12:27 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Thread-Topic: [PATCH v5 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Thread-Index: AQHZQLy8dSmZjfcHoEa0mqcErnEcV67SedeA
Date: Fri, 17 Feb 2023 03:12:26 +0000
Message-ID: <a37b0016cc45876ea9df28f91c34a92daacb08e1.camel@intel.com>
References: <20230214213844.2890382-1-alan.previn.teres.alexis@intel.com>
 <20230214213844.2890382-6-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230214213844.2890382-6-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM8PR11MB5637:EE_
x-ms-office365-filtering-correlation-id: 77b24519-75d1-4e4b-123f-08db1094cc29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oRay1HZ5yYOZHgDbKBeYQZtWurVc/7TnZWuiCqRMgAfAX9aC7/u+Zuhz+mJ6huNToKnM28RAhRhvqq3PsGisUzrgi1b6AkdmIbAtPefTh9BxqF8jVB023l6+MvjGkhIz9LgNIAiARyGF4DnuBbSklT1O6JdgtPtpyiZEgnMfCZU+avVodybF/7W3dcRlRK8dBZgKTVeg1dnIZpjHK9lAosBUddJjHLoALsBuqfHD+d+aIEuvLncu2WpvPxpGOV/PjM+GcFs8ADmkie5T7xD+Wf03ZqvSDiAYMDGbGDKyoMVX3NgR02HXN6T1fY48tFyTkAPt90W1c5IzxyqQpJ+lA8OCQGNEfO+YM8dz6l2zwVV0ne8bcidJ3lZ7N6dX7MhgE4qAXNS4MUJNSJP/rOZOf47fg3rDsyIT+yqZjYTMYMeNW1/hTEGlOZJZJWZZHbACp9IKHWlxigiTp49wMvk+82vPBTYgYrMO7TB9WtGRva/o5+TIuD3T+VQ58ls2dSNNlYgnIM7fhAmi7fPAF5Qwq/vbtX2eWEUp2VUhAdfCf2jP8eBeEOSUmD4d5Om1fnvQenmR/QDKr0uqXibjCEYCdSewDTfpJUZr6SpmQpneINZmxxpuGz5ZrletPF2hEf8pE6PI/luCaAR2UKwWFl8o9d/tG6mbKqssO6ciU9NZo3oH/P0Oh4oWheayIbVJwF8/iJ/WtXT0XfuYczprQXE1zQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199018)(6486002)(2616005)(83380400001)(86362001)(2906002)(36756003)(71200400001)(107886003)(6506007)(6512007)(26005)(186003)(478600001)(38070700005)(122000001)(38100700002)(82960400001)(6916009)(41300700001)(5660300002)(8936002)(4326008)(64756008)(91956017)(66946007)(8676002)(66556008)(76116006)(66476007)(66446008)(316002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0lHbnFjQXdGL3M1bC9va1p4TGlEY093QmtZVko3Q01YV01xMllEZXQyaVV4?=
 =?utf-8?B?VjNnRGRIY2c1SVhNSjcyTjM2T1ppaTJTNHNvRFBPQXVyZVpZL0w1K2NNMytZ?=
 =?utf-8?B?S2czTWRNYWdhUUswZHJqTERRQlhBRmQ5eVJzNjd1c1lBcnFDbTd5WDVzd0tO?=
 =?utf-8?B?L3k3bWdvWkxQSURqck1GOXg2UG95V2ZNdmJGNDVyZ2JWbnFLamxLMzZyd2ZT?=
 =?utf-8?B?WkZPYWlHRGpnQUNkREJlWUF3QUd1S29FL21JMVNSZkRhNnhzVXd6YS8vcG1V?=
 =?utf-8?B?MWRtYVMrOUl4NEwxQlp4NkVXdzZjSkUvMEhZRW5Bdnc1a3IyQkhoQVBkR3I2?=
 =?utf-8?B?cXBKSWlvWkUrL2JVeXdnMm84ekN0YTJadWl2UG1uTnRBSW5pTXNtdmIxNmtj?=
 =?utf-8?B?cjhMN2ZKUVVDZVBqbncyTFd2RDhiNnFmSzBuc05sZjJGV0l1dEIrWHRzQXFV?=
 =?utf-8?B?aVE5Znd0ZFJTWUpuM2lpbG0zWmJhdVJ6R1BlelJsWXhXUnNnYStmTURYOHZ6?=
 =?utf-8?B?cExQd2trL3l1UnJ4OUhhVWpTZkZENVZiRXZ6V1RrVHdyRmV2ejdYSU9EY1FY?=
 =?utf-8?B?eERUNEYzdkV4Ky8zL1JHeXh4RU5LRmc5NDRWUG9PTEM1UHdyMzBHRWlWbGRI?=
 =?utf-8?B?RE5DRjMybXg1RStxcVpFMEtaK1Npa043U0FuS290N3BPZ1hRcHpGL0swbzND?=
 =?utf-8?B?OXNSTkdUNnFWOUNqQWJkQVByblZleHNDSVE2OTErRXVxemxXN2hNdWxMWHZO?=
 =?utf-8?B?ZXF5dU9pMXhWdjFSOXQwNC9SY05HZGJ3bFRUU0FrUlJaSGZscitqVFQxM0s4?=
 =?utf-8?B?UHl4SzZOZ1Y3N0RnektaRXE2NWhJL2FsQitVYmJCdzVCTGUrUWh2a1pNQTFT?=
 =?utf-8?B?d1BGWGpYOG1tK2VUNlhLZzdXb1B4ZTFBaWF2ZWFwc2dpeXdrLzdqRVRhOURY?=
 =?utf-8?B?YjRKSTRzVUdrZE9kTkRRdWlSS1FzV0lHVzFZWUpOMy9HaHN1NmIvZ0JPL1VH?=
 =?utf-8?B?SitXZkF1aFB1Q2FmenMrbnF3V1BrWGJqVktITUlxaFFIb1YzWEpGbWhKR1dD?=
 =?utf-8?B?Z3pFUFRkODVZNWpTV1JENC92d3FQUlhscTFTMHpJNkU1NnNwUjRZNTBiQys2?=
 =?utf-8?B?cmJDYldQMGRIQ21TNlg1LzByMmV4Zk9GR2xrMk1oYWdYY25ueHZ5SzAwdldh?=
 =?utf-8?B?WGVDeDBOcngyMnUrR0pRVDFIUGE4Sk1NR0NLdHBPSGpVb0RRcCtYWmRQd1VY?=
 =?utf-8?B?d3lrSDBEakxoblVlb0RMelZVYW1nbkE1QmZucU5GYXVETmRIU0NUcnh6THhB?=
 =?utf-8?B?RGJzZFI2di9VOG94di9HUzUrcjlOMDZvQlYrOFBqSll2SmhXaDZIdzBzNTRW?=
 =?utf-8?B?UkFubDVweUw5TEhia2dXUHk1bVdnVEUzaEQza0VhMFhwd1NOS1pBdjQyTWN2?=
 =?utf-8?B?L0FrWHV1THBVQ0hpZVpYalVPT3lHcmUyNDJkRGdYV0FLQ0oxUDNHd2xFdWZr?=
 =?utf-8?B?djExNEZENVR6M085Yi84TUpTazllUVZNbk9xdUZGTVNUWTBtK283OVhPVFdZ?=
 =?utf-8?B?c3hoL1FLNk5BeHpXMDA5aGJrMHVNQnBUS2xld1pxZmtvZnNzY2VOMjhiN1hS?=
 =?utf-8?B?VkgrMVpnNEc4NTBsVFcydndrR0QwMUMyK0plSFRxN2ZyQXdlWFZrNUZ5OHZI?=
 =?utf-8?B?VDBqYlBkaU0yNHFpMktFVi94UWVpOUlEZ2FGd0phMTBFWi9JQTEzODBTMFlX?=
 =?utf-8?B?RTdiWWc4UUFmQlE0c2JUb0FVQVI4RTlXTityRWdENnd2aDZqSjhPOXdHelE2?=
 =?utf-8?B?Y1NGdjNsWG5haE9yV1lPeXBKRkVzRG1OMTdYUnpWYkZHa0Izak0vdlpyOTZr?=
 =?utf-8?B?cUZKUGJyR1FWWGo5OGN4VlNrdVdkWWR6Rld0cXlxWGF0akxGcVlselh3aDVr?=
 =?utf-8?B?djl2WXZWREY0TStqb0hmTzJiNFpuMG9iZDJWalpXSGZHYzVEKyt2Q1RZMlhz?=
 =?utf-8?B?NjhQZ08zZlVsSlRtckhLanZhUVB3d1p6cVRNMnNaZ3daeU5wZkxXR0VYWm5C?=
 =?utf-8?B?S2c0TXA3amI5YXEra1lBNGxTdjl6REJQZDluRmJtSDhqOHBObnRTZ0xvL0RT?=
 =?utf-8?B?VVdDMzNGeUw5QXlHSkJVUlFZRWVRSWx0cUc3Mnk0K0lVbnJyNFRkbGQ4bWVp?=
 =?utf-8?Q?Wx1MrXLUCK2ZJVioAPfqbk8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15DB2B404175FE4F8C88F2E3ED497AB0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b24519-75d1-4e4b-123f-08db1094cc29
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 03:12:26.9348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2DYF1OepU+mzMXTMQw0ZOc55Blq94KZO6KHnm1SNTeTuvl7JLPzPuQ80bay+u+xq3aRwVlv36lNHOy2LL5n2XmBXYfrorz0eEAhqciY65dA2gNyGnzQlHNH5A4a2hmq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5637
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTAyLTE0IGF0IDEzOjM4IC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBBZGQgTVRMJ3MgZnVuY3Rpb24gZm9yIEFSQiBzZXNzaW9uIGNyZWF0aW9u
IHVzaW5nIFBYUCBmaXJtd2FyZQ0KPiB2ZXJzaW9uIDQuMyBBQkkgc3RydWN0dXJlIGZvcm1hdC4N
Cj4gDQo+IEFsc28gYWRkIE1UTCdzIGZ1bmN0aW9uIGZvciBBUkIgc2Vzc2lvbiBpbnZhbGlkYXRp
b24gYnV0IHRoaXMNCj4gcmV1c2VzIFBYUCBmaXJtd2FyZSB2ZXJzaW9uIDQuMiBBQkkgc3RydWN0
dXJlIGZvcm1hdC4NCj4gDQo+IEJlZm9yZSBjaGVja2luZyB0aGUgcmV0dXJuIHN0YXR1cywgbG9v
ayBhdCB0aGUgR1NDLUNTLU1lbS1IZWFkZXIncw0KPiBwZW5kaW5nLWJpdCB3aGljaCBtZWFucyB0
aGUgR1NDIGZpcm13YXJlIGlzIGJ1c3kgYW5kIHdlIHNob3VsZA0KPiByZXN1Ym1pdC4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50
ZWwuY29tPg0KPiAtLS0NCg0KYWxhbjpzbmlwDQoNCk5vdCBwYXJ0IG9mIHRoaXMgcGF0Y2ggdG9k
YXkgYnV0IGEgbmV3IG1vZGlmaWNhdGlvbiBpcyByZXF1aXJlZCB0aGF0IHdvdWxkIGVuZCB1cCBn
b2luZyBpbnRvIHRoaXMgcGF0Y2ggLS0tPg0KDQpTbyBmcm9tIHRoZSBpbnRlcm5hbCB0ZXN0aW5n
IHdlIGFyZSBkb2luZyBvbiBNVEwsIGkgaGF2ZSBub3RpY2VkIHRoYXQgdGhlIGZpcnN0IHRpbWUg
dGhlIEdTQyBmaXJtd2FyZQ0KaXMgcmVxdWVzdGVkIHRvIGluaXQgdGhlIGFyYiBzZXNzaW9uIChy
aWdodCBhZnRlciBhIGNvbGQtYm9vdCBvciDCoGRyaXZlci1yZWxvYWQtYWZ0ZXItZmxyKSwgaXQg
dGFrZXMgbXVjaCBsb25nZXIuDQpUaGlzIGhhcyByZXN1bHRlZCBpbiB0aGUgb2JzZXJ2YXRpb24g
b2YgdGhlIGZvbGxvd2luZyBwcm9ibGVtYXRpYyBldmVudCBmbG93Og0KDQoxLiBhcHAgb3IgaWd0
IGNhbGxzIGdlbS1jb250ZXh0LWNyZWF0ZSB0byBjcmVhdGUgYSBwcm90ZWN0ZWQgY29udGV4dCAo
YWZ0ZXIgYSBmcmVzaCBib290IG9yIGRyaXZlciByZWxvYWQpLg0KMi4gaW50ZWxfcHhwX3N0YXJ0
IHdpbGwgYmVnaW4gdGhlIGdsb2JhbCB0ZWFyZG93biBhbmQgcmVjcmVhdGlvbiB3aGVyZToNCgky
LWE6wqB0aGUgZmlyc3QgcGFydCAoaS5lLiBzZXNzaW9uIHRlYXJkb3duKSBpcyBza2lwcGVkIChz
aW5jZSBhcmIgc2Vzc2lvbiB3YXNudCBjcmVhdGVkIGJlZm9yZSB0aGlzKQ0KwqAgwqAgwqAgwqAg
Mi1iOiB0aGUgc2Vjb25kIHBhcnQgKGkuZS4gYXJiIHNlc3Npb24gaW5pdCBjb21tYW5kcyB2aWEg
dGhlIGdzYyBmaXJtd2FyZSkgZG9lcyBoYXBwZW4gYW5kIHRha2VzIGEgbG9uZyB0aW1lIChvbiBm
aXJzdCB0aW1lKQ0KMy4gc3RlcCAyIGlzIHF1ZXVlZCB0aHJ1IGEgd29ya2VyIHdoaWxlIHRoZSBt
YWluIGNhbGwgaW50byBpbnRlbF9weHBfc3RhcnQgY29udGludWVzIHRvIHdhaXQgZm9yIHRoZSBh
cmINCsKgIMKgIHNlc3Npb24gdG8gc3RhcnQgYW5kIGZpbmFsbHkgYmFpbHMgb3V0IHdpdGggYSB0
aW1lb3V0IChiYWNrIHVwIHRocm91Z2ggZ2VtLWNvbnRleHQtY3JlYXRlKS4NCjQuIGFwcCByZXRy
aWVzIGFnYWluIGFuZCBub3cgd2UgZ2V0IGEgc2Vjb25kIGNhbGwgdGhhdCByZXBlYXRzIHN0ZXAg
MSB3aGlsZSAyLWIgaXMgc3RpbGwgd3JhcHBpbmcgdXAuDQrCoCDCoCBzbyBkZXBlbmRpbmcgb24g
dGhlIHJhY2Ugb2YgdGhpcyBzdGVwIDQgKHN0ZXAtMS1yZWNhbGwpIHZzIHRoZSBjb21wbGV0aW9u
IG9mIHN0ZXAgMi1iLCB3ZSBjb3VsZCBlbmQgdXANCsKgIMKgIGdldHRpbmcgYSAybmQgdGVhcmRv
d24gcmlnaHQgKGkuZS4gc3RlcCAyLWEgZ29pbmcgaW4pIGFmdGVyIHRoZSB0aGUgZmlyc3QgYXJi
LXNlc3Npb24tY3JlYXRpb24gY29tcGxldGVkDQogICAgLi4uIGV2ZW50aG91Z2ggaW4gYm90aCBj
YXNlcyBhcHAganVzdCB3YW50cyB0aGUgY3JlYXRpb24uDQoNClRoZSBzaW1wbGVzdCBmaXggKHdp
dGggbWluaW1hbCBjb2RlIGNoYW5nZXMpIHdvdWxkIGJlIHRvIGFkZCBhIGNvbXBsZW1lbnRhcnkg
ImlzX2FyYl9jcmVhdGlvbl9wZW5kaW5nIiBmbGFnDQphbG9uZ3NpZGUgdGhlIGlzX2FyYl92YWxp
ZCBmbGFnIC0gd2l0aCBib3RoIHJlbWFpbmluaW5nIHByb3RlY3RlZCBieSB0aGUgYXJiLW11dGV4
LiBUaGF0IHNhaWQsIHdlIEknbGwgcmVzcGluIHJldjYNCndpdGggdGhpcyBmaXggYWxvbmcgd2l0
aCBvdGhlciBtdXRleCBmaXggb24gUGF0Y2g0Lg0KDQrCoCDCoCDCoCDCoMKgDQoNCg==
