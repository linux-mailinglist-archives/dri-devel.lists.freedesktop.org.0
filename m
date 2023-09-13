Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8215479F4E0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 00:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB8910E117;
	Wed, 13 Sep 2023 22:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C91410E114;
 Wed, 13 Sep 2023 22:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694643709; x=1726179709;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HotvJc97T0EhOqPHtGNYDUT5nJOUtgefkT9KOPtBO/M=;
 b=cPBDlW4tMCDG8Ss0u3uwdy27ZlXpHi+vHF2zHpUdTamwmyS6scCY3ufF
 LQMCTu0sihNggyfR/ThmxdyjgI/rGOBbsU5pGaXL0/8pfysxDiUEOLY7p
 csyAHYI27r4RwZQ9l/ygVK1NcCDjpbt91QBUKo6ofZefLsHGqtsDKFOlS
 LmJby6RWflAKE49Li7XyfYTlwrnNyqomRwa0knWSxSWdi3IScNUMwLXIX
 Ut5JATql6NsgeC7sYf38m5hSW6rPT85IfclDJMZEBUv/HrNIonyUW75f2
 PeqshwfvfH0nC3A0QD0TYl3eYT2SNL5PTgkh3D2O2Er5Oc/DsqwHhDlIZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="369070000"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="369070000"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:21:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779392256"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="779392256"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 15:21:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 15:21:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 15:21:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 15:21:47 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 15:21:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/RHK/KHkNRrfS82Q3CV3eOMfT0d74Wpu5o9iMDaOtd5NROOcYfBbSRsbAK++mnu8wekDwHy24ekbK84pm2goUoHXw29w52kt9EX+HPAwJRxcPB3vLlNjO+yHvr/VU3yb25n0fx85+IgXMqIAQm/nWdgUPMs3UuD59HWhUkyT8EM0kWY6OmogORWOSt11KM+UeB/lOidsFxUahCB124/u7HOChzMjQsBSa5NyjFa+RwJ7ThPLPYmn5E20t8w0IBy5q4uv9grcAbB1FiwnDarkOd0/g1t4QS8sCTJh//9+OzImN1E09OaT+DAvJAxFmxDnx2uY4q7hwfPk8KTQyF9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HotvJc97T0EhOqPHtGNYDUT5nJOUtgefkT9KOPtBO/M=;
 b=UM4v17sxdfBcY8bnyxupmeeIVHFhAoirreccsBJWyLOQnFw54300ht3QWiJj3R6fTAwf5xBuKzxyIMCKx1bCs9T6+n1VM9WjzmC66l7k1pfcwZj6KjZmZMLd3PbM2HgRAuqnFZ9+OOx4G833prtTKjoyWnGdDVzBcDy8wMIxZFASIfP1PGN5gEJdz8+T4acjaRwfmvAwl59o0IdzBgT7P8bbv0JYagc8AgwCviVdehDl/CJSdbBKZyvXXCILD/nKMS8MZL0pJA+bUnTA8ofP6vCypYubVpdcjrLkQXDKHpHyJ6Lcdme1G8RvsusIAyDoA3fuyJhaWXhQwWSNrX5QWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 22:21:41 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 22:21:41 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v1 1/1] drm/i915/pxp: Add drm_dbgs for critical PXP events.
Thread-Topic: [PATCH v1 1/1] drm/i915/pxp: Add drm_dbgs for critical PXP
 events.
Thread-Index: AQHZ4SEh6ecqNXqcVUuWJmGgi0APu7AVYdoAgAP9NwA=
Date: Wed, 13 Sep 2023 22:21:40 +0000
Message-ID: <2d862e6d59a9c549fd31269b8b776d1a6fcd24a8.camel@intel.com>
References: <20230907002032.81587-1-alan.previn.teres.alexis@intel.com>
 <87o7i9f4c5.fsf@intel.com>
In-Reply-To: <87o7i9f4c5.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BL1PR11MB5525:EE_
x-ms-office365-filtering-correlation-id: a66bbf44-6645-4126-24ab-08dbb4a7cde9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7cj7guiI+PkI5/Q/39ykY4LGYTwy0roiRL2nHdRdxjmNw8LvR8hjij1lk5KvJodtDMRl5PCcYJBUfTGc+YLVdMupcx35f6VBLVdORJPGIpW2YNkVbmcklAON/X3kUCVwx40ArtbtGmpdl2LXPYtDDYJ0quMJzrDkSS5szMB4EZET00mKgQ3MA8ppnyGlyVa7SUnKI2fJbRlRPY5Sm//rGXjRBUm2ZiOQupVi2d4QJTYre6cD43IGoiE1f+4HQErkcwdCGJ6U5eHN92Ew1F7IZOT3g4YcABYHhOjUmLuvX7cAzb2TYzecUS4CNOWjxqKDNgLjO8v0cy/OXkckAk3urlGY9LfsnBSQjnHCgvmQ0x0Jc9yHBJd+LycICXn/qihCFSvOfyoUXfmlO+A0KdbrYDk0Dg9bipgFrlYDrUqOdfWs/BHVPFXDyGhglyjcMmfDOfdhz1WLGsLSpr+Bux4dk3XM9rnh0+5v4tuH1iQENSn4cO8GFz49+Q9FZ6ZE3nRXZEWulbKRV8gAHAZ8vLKWXWUR7O41imowgGjXUUeJhfWIZTFIRZQ96yuKwCUmhjuYlg0BmccZGa7V+febLUvQiMuhlLTF6rTd+LZD2Orz5/MeZ52u4jZOCNIPNw3I/EFp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(396003)(346002)(376002)(1800799009)(186009)(451199024)(38070700005)(6486002)(71200400001)(6512007)(6506007)(36756003)(38100700002)(122000001)(82960400001)(41300700001)(66946007)(2616005)(478600001)(26005)(66476007)(66556008)(64756008)(54906003)(66446008)(316002)(91956017)(76116006)(110136005)(5660300002)(4326008)(4744005)(8676002)(8936002)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjN4Yy8xVzNnVi9aWFVDcWxlVmwxZWpnMjhJZU1nb1BURkRsWVRWbm1HS0lZ?=
 =?utf-8?B?aEYwNnVxbVJOdGVZNHB1a0EyTitGbGRBUWFUSkFObGNpM3Q5b29kWllqSUhF?=
 =?utf-8?B?VjJheGI5bmxTYW16M25uUVZJcC9GV1p6c3M0TSsxMDhZSkh1eHp2aUM0Z2Z1?=
 =?utf-8?B?VWE1di9TUzNqWTNycWQ2ZVlQTjMrblBQUW1PYnUrVXdHNmJMbzNFNUt2d05Y?=
 =?utf-8?B?NVFWaFVsTWFrVHRQRjBPVjg5YU8wRVlPZG9YQVJlRWp0SDBybTRFV0hNUXlH?=
 =?utf-8?B?MW1mOVA5QUd2amM0TWZ3ZGYyQjRraHE0R0UrUmhMVi9ldVA4aEJoa0d6NUo4?=
 =?utf-8?B?RUZpV2VGdTQ5YVVEY2p1ZTd0RE1PODZqQkR3U3ZqWk4wVHF2UjlXWHBUS1Nm?=
 =?utf-8?B?YXpmRFk1ZC90Q282V1drdlg4Y3F4UGdiY1NacFNwU2c3ckU1QUtrTHVvUDdo?=
 =?utf-8?B?YTRIakVIOTdPOWVUd1pUMHlObXR6NVFCSlZ6MWxXYjQ1ZGhINjV5dlV3dFVp?=
 =?utf-8?B?VFh3eXVvTWJhL0lHcGZRZVlEZjdCRnkxeHRLam1ML3JDVzZPenJoclRJQkFN?=
 =?utf-8?B?NWExQ1EzOS9CNStmeGttOTJUdmpCZXllYkVxOVpNR01WTGFRWE9KWjlvd3pG?=
 =?utf-8?B?ZURrbXJpOG1jRnN3RlBIR210c2k0RnFBOWhwOWc2Q1JvTlJtOElFOUhIYjF2?=
 =?utf-8?B?WU9wakNKd05IU2hBMFR6NFM0U200OXZQU0thT0VTVjcrK083L3lUam5hN3lH?=
 =?utf-8?B?NzZ1NUY1clArcnlkWjFzcE4xclZDWXBybElnQmV4N3lSd1JVVWZTdUUrTzht?=
 =?utf-8?B?S0xLVWJubFNEeDVIcVJvVFViWE03SzFiR0tzdDgvRE9ndnRWK2RyblJENlcv?=
 =?utf-8?B?WTFxM0pVTUdvczRRdWI2S2N0TmYzMllYL1daSnpTWHRLaE9LMDhKYjJSbFk0?=
 =?utf-8?B?WTNaaXBHb2FHUTU0Ri9sc1htYTZ2TWltMWt0VWJycFExWEVhSzdtTGg1M21B?=
 =?utf-8?B?Rit4YURMS3dQM1dobGQwVkpzRU1kL3k1djRIdUhlNHY0Wi9lT21tWlVIL2J1?=
 =?utf-8?B?eVQ4YTNmbnVLbGJPUU5rMm5vdXhwOU16ekMyMzhWcXd5aEI2SHY4MDNtelJY?=
 =?utf-8?B?ZGJrWktwWCtlQWxROG1SeGJwNWF2OVF2QzFlT3ZqTS9HZjcySU9wUW5uS214?=
 =?utf-8?B?dEgzdG9kaHJLckpkc0xiQ1ROdWI5U1FwZ2szdlNHUXlvanUzMGJoTG1rMXhh?=
 =?utf-8?B?QWxYRDJwVm56MGxGY0ozR25ZZFY4eFRBRDAxNi9CU2h2cFBIa2lXNE12d3Qv?=
 =?utf-8?B?S09KYlBtS3BPdWIxTEVXSlplRDFuVGFVVFMvNFRiSUpXbW1URGJ1eDVUM3dC?=
 =?utf-8?B?V3ZpQWM0UmRGSDZYOXdlV2srckF5bmdlTVVOS3FhYVliNUxhVzZZcGFhUGtJ?=
 =?utf-8?B?eUFjZlhmWGpoWDRJSzBZaW04MTQ5TWFNUlBINkVCaVJyaVcxSlhUanBDNzZG?=
 =?utf-8?B?NXRNQ0U0dWFXbkJZaWE0MTFmMzFwUjVucC8wcFpvMytCWWtoblg1Z1d6UW9E?=
 =?utf-8?B?dDh1cjRrdkpLWWYwZ2dlNUdoZEh2cjdFTFdIczRHNy9ULzM4S2JiYzFkUEl4?=
 =?utf-8?B?bnJxbFZKRWZCcVY4VHpUNWt1VU1RaDZZeDRldVVMUzRFUkFGN1N6TTN0UHBM?=
 =?utf-8?B?N1hMeWpjUmg3M3U1aUFiODJidnZrc1ptd2h5UDZJaHZ6L1pnL2xuWk0vT25Z?=
 =?utf-8?B?UEhjS0RiejNockgxdXlUblZFR1JsdWVSKzdUSUVYRDlJa204UmlYZCsyMW0r?=
 =?utf-8?B?bnZXTmNsOXdyZ290aU9ERnhUczdOL1BjUjY4VUprZFhuU3RwaFlUQ2MraUFr?=
 =?utf-8?B?UDBHUThJSkRrOW55OHRWNGk5Y0Vnb1lZQ29QT0h4Yi9SMHB4bm5qTmhqYmdZ?=
 =?utf-8?B?UXo3cm5GSm5keFhwNWdOMUlUUk9pT2ljeHliRGFmcmJWUElyTmRucGwyVU1P?=
 =?utf-8?B?ZVVNcEhiTlgyQzl1MUVpa0F3MUxtZzVnaTlsaCsyWjBPTTRnTFZ0aS9VaERy?=
 =?utf-8?B?andWZEp2c3hRRGtQYmtiZzJTeW9KQXhkL2poSEdIZkp6RW1tMFRyR1YrT1Fi?=
 =?utf-8?B?TklXTHR6QXE3VVlRNlc4NitsQ3pwQUNHakdxdFVoYWpibUtMZGsvTXN5OUVX?=
 =?utf-8?Q?3stcSzvxDDvubZFG4ZYLPLg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7758FD1D4962B74A9F29CFFD268B6FD1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66bbf44-6645-4126-24ab-08dbb4a7cde9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 22:21:41.0082 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qIW8+ofgZNDuYhVrLvESksVlrozvKY7pIP0tc1dp6iBc5LT/z2bPBpsNAuhEhG4+YRWynRQS2vz01cEuMs9OuriSKB/cYsMIvorhB7AVy2q6i5uvjbZz8yacgRWKskUR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5525
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA5LTExIGF0IDEyOjI2ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gV2VkLCAwNiBTZXAgMjAyMywgQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhp
c0BpbnRlbC5jb20+IHdyb3RlOg0KPiA+IERlYnVnZ2luZyBQWFAgaXNzdWVzIGNhbid0IGV2ZW4g
YmVnaW4gd2l0aG91dCB1bmRlcnN0YW5kaW5nIHByZWNlZGRpbmcNCj4gPiBzZXF1ZW5jZSBvZiBl
dmVudHMuIEFkZCBkcm1fZGJnIGludG8gdGhlIG1vc3QgaW1wb3J0YW50IFBYUCBldmVudHMuDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFs
ZXhpc0BpbnRlbC5jb20+DQphbGFuOnNuaXANCg0KPiANCj4gPiArDQo+ID4gKwlkcm1fZGJnKCZw
eHAtPmN0cmxfZ3QtPmk5MTUtPmRybSwgIlBYUDogJXMgaW52b2tlZCIsIF9fZnVuY19fKTsNCj4g
DQo+IGRybV9kYmcgYWxyZWFkeSBjb3ZlcnMgX19mdW5jX18gKHZpYSBfX2J1aWx0aW5fcmV0dXJu
X2FkZHJlc3MoMCkgaW4NCj4gX19kcm1fZGV2X2RiZyksIGl0J3MgcmVkdW5kYW50Lg0KPiANCj4g
RGl0dG8gZm9yIGFsbCBhZGRlZCBkZWJ1Z3MgYmVsb3cuDQoNCk15IGJhZCAtIHl1cCAtIHdpbGwg
Zml4IHRoZW0uDQpUaGFua3MgZm9yIHRha2luZyB0aW1lIHRvIHJldmlldyB0aGlzIHBhdGNoLg0K
Li4uYWxhbg0KPiANCg0K
