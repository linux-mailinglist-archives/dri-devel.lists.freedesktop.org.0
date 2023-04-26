Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A356EFC45
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 23:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B0F10E238;
	Wed, 26 Apr 2023 21:16:33 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5D410E238;
 Wed, 26 Apr 2023 21:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682543792; x=1714079792;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qA/XPD8SFng3qP5QEs7gxhxg2nCgVjM93lm+vZH/Z4A=;
 b=OKMunohso8efwsRjpoIR67jUKfEQnWUVYKEAp3iaukVMCbkOnXS6gPFS
 gAktX2X676HaVP9ZBovkzNh2OmDxUm+ig+R2kvFZ26XtQnWJ42VC21i2n
 KvswWYIvlRu/LbT46XaXMNtrzUr5vC+cybm3+Ny1r7woxHrhQdsGbFEgF
 ORxzlDcvOQJ3AsBcgRkT5XSJNG/U/5JE2B/CZYD2cIfk1bP7gkkSjvDY5
 hWFzOWiP5DtrCkSWJZdObk6Pffp/lvZSazoN/dmCSD1LBHuAbFZoyepAe
 SJjBiTpftFaNy1RmdCWuil+xaRFdK1XcDfZdKei4u4JnTUmCbBIiJpgvu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="412552055"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="412552055"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="758783682"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="758783682"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 26 Apr 2023 14:16:31 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 14:16:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 14:16:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 14:16:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I42Q+OwrV11B46hMUyB3yR/4Bm0hfTST4gO+RawKdLCs2590gscvTYKKOa6JAHoebgU6bmIZL2IXKZl2c77FK3BaM0Pm2QxTBantgfyya6pXO54EOVkYS/tSOJ2Dz0dHABe+B54mBLPBOpo+BAyd7QdJYCxRGkoPf/YLhCJk/Ctp6gGgygfdpRAnfK7+89NYwB5bohUeER7mWau9VaCy6FsBVnkvomNTRLrLXUdoXMczNPDG8olODPDCV80ADyH+TX0tm55g/yYlIG5Ll6HBnxOEvKHlzQ+je1LemzGozXYxnAPE9iYG/qnpt7UWvFo+Iaw9GnVZEF5vUT6c/byw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qA/XPD8SFng3qP5QEs7gxhxg2nCgVjM93lm+vZH/Z4A=;
 b=lXQGNyKGS5MtushjcZ/2qHKgIi5MPPAMFKGpPtCKowMM0Nh6V6zQZFGZBadZcVOJif3bG1BaE2oQjATCVssYXRmbO9W8xu8NbYyw3UnWqIEytAB5ceNIAY14nBxXO7DHJdwRYWIK8/1fCLcqLNcrEUq66SGY7aGqcEgiX/cGddArUJlQAVR/9Oyo0eXE4MQtfBLprtVr8VKrK/Sw11qrXhNMQl62Q3M90numT447Y2AmImXI3ArR64GYc+vM3hspyzl1rdw9ZgPgO2JEJQnotlgZC5pQnO6hAOMd5mX1uvpGv7aBDV1ctwZ1wtoaEEXc5F452G06nr90s+rYhjas8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY8PR11MB7848.namprd11.prod.outlook.com (2603:10b6:930:6c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.20; Wed, 26 Apr 2023 21:16:25 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 21:16:25 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH 6/6] drm/i915/guc: Capture list clean up - 5
Thread-Topic: [Intel-gfx] [PATCH 6/6] drm/i915/guc: Capture list clean up - 5
Thread-Index: AQHZeGxWzl9WUMpv40e1LYxru3IPOq8+F9uA
Date: Wed, 26 Apr 2023 21:16:25 +0000
Message-ID: <34b960b6fc19503b72034d18dcf175934766fe12.camel@intel.com>
References: <17322661-e12f-7e14-b190-1089cc04a9e5@intel.com>
 <20230426182407.4097589-1-John.C.Harrison@Intel.com>
In-Reply-To: <20230426182407.4097589-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY8PR11MB7848:EE_
x-ms-office365-filtering-correlation-id: 3ddc2a43-923a-4320-05ad-08db469b7e50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zwpSdu1efcdnBPVcBFD0UEi+AcCOd9cshqzG87URu8mOPQ+59ScwP1n6VoVnZwqSw7WVqNfn7o/jkPOVCKKpqeRDSM/67jukkpAmDSGUA3h6iomrS5GRP4+lO7gG9+CYYlm3IbKz4LSBNMx7OcaU+4eUMWJXa+DrD8h3guoPjW22E+xWtfRfxQt3uVrkhJ5BeItDjIZTdOKufABWCg5SkPki7f6TRAKl8S56ua4mjqcZ7Q5EOPrUnBRAf/if9uV27T+Bra37IYTCaWCR7fK7XQlY2QNFKd2bGLblXj7tbgZMwemI86ctKQf1snH65ZjHgerp082jkUoFExPT/3ZTfSkv3/EXJX8meBP1gRR3wD5Vdf+y8Doh6SdUzcwKvL4K++jj2D0RYzCsJgJ4goUXTmtb4Y9Liy9iwL+SBhoLCinOr3EuUQaBTCEgEGHGVPLNLwg0GAm9q/RYM439Oppr0t9PcfGemPD8Pdlt9MqLpd58JQ9nRHgI09nONk7uF36DjVfnABBpi5Il/Bnr56ULi3xN66JxdxIQcIQU2IhJJlrTFqW+x6AaK6lED1ckF9itNHj0DM0wJ9e2CeqI+9A8JY697gB4fFh5EPpdLF99K2AWIVjvsXe32ZdC9CQ2psMx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199021)(110136005)(36756003)(38070700005)(558084003)(478600001)(86362001)(122000001)(38100700002)(8676002)(2906002)(8936002)(4326008)(64756008)(66446008)(82960400001)(450100002)(66476007)(66556008)(76116006)(316002)(66946007)(5660300002)(41300700001)(186003)(6512007)(26005)(91956017)(6506007)(2616005)(6486002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlJiMDF1NU5OU2o2OStmS3E5c3Q3TXZOL1YvVnJlVllVcnlrNzlDelRCSVVS?=
 =?utf-8?B?dGkyMHVJSFJQWi91N0tsdmRQWFlNcStVNFBUWHkxOGFqbC9hQ0pOZWg0djJJ?=
 =?utf-8?B?T0MxVkl2RW5jS0trMHZOa2dZTm1jZ2dpdEFSMzR0YXQ0Ymk5WTVsQWhBSlNC?=
 =?utf-8?B?WFRrbEtCQm1tMEsxcmNWaUs5a0ZVVDRyY2NWVFd2SFZGU3RMc0QzS3o4ZlR2?=
 =?utf-8?B?aHEva3lpVFB0OVgzd0pTZFZ1WnJvWHBEOEF1MEZya3JHckNEWDdPd1RkVUJV?=
 =?utf-8?B?cXlrUHF5Mm5CbjlXYUVya0JvbmtkaUhYUzFyZ1BQZ3lVR1I1T2NDRU00YnVy?=
 =?utf-8?B?KzRaM3R5YVk5NnN6Sm92TW1NMGdHU3JyTksva3dDakk4a1ZXaVRKK2R4ajY4?=
 =?utf-8?B?c3MzQ3NzUlI5TTZSYjdJL0pzRDE5TElEUjVYdXM4bExGUTViQ2dLM2p6TTNO?=
 =?utf-8?B?b1A4ZnFYeTJwa2hUVG5ZUiszWitDR3ZkRm1qKzlYQjNhV0lWZmZPL1h2OGJ1?=
 =?utf-8?B?cldLR2RGVkE1US9WbXZzMkdxZUFPZmVDbGI1TFZZVUVzcWZsTGlrN3J0d29J?=
 =?utf-8?B?RzVMOUlLSmY4TE02RlpMeEovOC9ybk8ybFRyTzZjOTFpVjFDYUVIWW1weSs4?=
 =?utf-8?B?am8zQ3pBNGlOaG1IU25YU25OZ1lVcFBlZ0Z0MGpRT1VBdUxYUGR2OFdUTEdt?=
 =?utf-8?B?WTdweWJNZHFaWVlnS1pBQjk5WEE5ektqTVRrT0pwTy9KNjdGK3NDUW4xSmtn?=
 =?utf-8?B?cGs2MCs2OW1ZRmhDN2hkZ3UyclpoUVFRSVpqUGY2K1F1biswekhCSlFWVGtX?=
 =?utf-8?B?STY3V0RQdFJuL1MwTkVSOGZPdG41Q0xEd3FNSnNlN2RWREg1NGRjQ25wVE52?=
 =?utf-8?B?VEZ6MWVYRGNvaHM0Q3RVeWtyK1NkQXZIK0JaL2djRVBCSEFTUkp0ZDRTaTdq?=
 =?utf-8?B?UkErcE81aVQySkZZSlNWdUxSMEV6cUFZNzJUUjM0TnIrNmxhaW94bVhiTXFy?=
 =?utf-8?B?d0xvOStIWExWQkp0YTdYRmVsR3oxK28weURlR0pOUmlFZlhIYm9nd0pZdlps?=
 =?utf-8?B?eHZZcnhtSDdYQVNGZ3YyRVE4aVdTbE9QUXVCaUhnYysxYWZWb2lqb1ZTY0tB?=
 =?utf-8?B?Vk5EVXE5Q203eEJ4WTUzYlpsZWk0MThyZDIzdFE3dWlRRkRYQ3RadlU1Ykh0?=
 =?utf-8?B?dmdWcU5YS0Y3K20yZ2hCTFJ0Nk1BaTRTc3BQV0pJcjAzWWZYSG1oV0tKcTU0?=
 =?utf-8?B?Vytsa3NUSGVma1d6UVYySSttN2tURE9zR0h5OEZEVVpTZ0RSQWl0SXIwRTlo?=
 =?utf-8?B?Z2ZWMU81U0xCaDBrd052MkJGN3pCeFZoOGt0NjJDMWs5cysxcTlObmZFWjNv?=
 =?utf-8?B?aS95NVdBSTl6bkdPK0o3L2tUMHFmazRBL1FGNnRrbGhWSmpsMzNHQ29UQytL?=
 =?utf-8?B?OUc4Szg0anhhOFBjR2NJSmxEWGdQQWFRMU1zVWNEa3dhSXBESEltdVNvdzAz?=
 =?utf-8?B?N0tTRldDb0J4Yk5zdXBLZUp6RDZ2bmdxS1NzWGlTdnFxM0JzQ1pubk40bTU1?=
 =?utf-8?B?bW1UU25ZNWtwS1E1VFg2VzZueGRURGpBdCtUZEcxdlBnSEY2cjFyK25HV1lw?=
 =?utf-8?B?WDJYWVpObTVuZEhUNXhZbEl0TjNoQ2FiUUgwQVVvYndxZjh6WTgxUmVVek9Y?=
 =?utf-8?B?MExsay9mSndrZmlpaWpSR0pqQTE1S0hDZTZZNUg2dE8rYWs4SVVoS1FKcUZO?=
 =?utf-8?B?QWJDWXdWNUxmN3o5cjVlRDdmK282eHF0Qm1JcGhqQWhRRmFXTDd0N3ZMbmkw?=
 =?utf-8?B?by96a3hKekZYY0VhN3h2MVJieW56LzV0SHlFUGVIMVg4L2hJOVhPVXFKTExO?=
 =?utf-8?B?TVhMbHozZ1ZnUVlKbVgweUpJQkdSbXk3M2pJRGVHSnNGNXBKMlowQWFGZUh2?=
 =?utf-8?B?Ukg5Mkxnc3JEcThDNlY0aTlRMUxvNGVScDYyQW5xR1BxbDNITmVkQUhYMjF0?=
 =?utf-8?B?Y3ROQVBIUjU1OXNvWjJISlNnWm40UHBmdmlJUXZHekM5K0xTcUVFZWpRYzdj?=
 =?utf-8?B?V3dENkVVYjlkRHNvZE1xQ01jVXhqaU5EVkZhcWk1ZHQ0dTF5NThYdTlqbDA5?=
 =?utf-8?B?MWZzNTRoOFdvVTFCV3BRWFJJV0w0SHNrSHVHUEh4cHdweEhYQUFOREs1Q09r?=
 =?utf-8?Q?ONudyY4qTfNBDl7X2S6GXyU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C285E2FD5E91DC4684B69C647180446E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ddc2a43-923a-4320-05ad-08db469b7e50
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 21:16:25.5923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FH8z97h9qOADRjfuUDa4vY3T6g8Jmcur8E2FC4bmgdA4qvgxlecNK/NzZT5os2qCvn+d4rw/GQ607h5FtVKowSpjmxumxom8kjJw3s+lbGqrJrLzRCO27CXIhX39+kCG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7848
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA0LTI2IGF0IDExOjI0IC0wNzAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPg0KPiANCj4gUmVuYW1lIHRoZSAnZGVmYXVsdF8nIHJlZ2lzdGVyIGxpc3QgcHJlZml4IHRv
ICdnZW44XycgYXMgdGhhdCBpcyB0aGUNCj4gbW9yZSBhY2N1cmF0ZSBuYW1lLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCg0K
UmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwu
Y29tPg0K
