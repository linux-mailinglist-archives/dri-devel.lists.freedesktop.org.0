Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1936F500A6E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 11:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF1610FED6;
	Thu, 14 Apr 2022 09:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB85310FE33;
 Thu, 14 Apr 2022 09:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649929893; x=1681465893;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H2L/juFz3ZYYHUunW7HI9ihsrLDgsKO6ImMiWzbawe8=;
 b=LdOa0CohO11r9qYLFKqNeEX5I2curvHw/aN5Jy5W9JDdqmny+vmUHWxS
 cTOI7mZvfZqGLIOKtqq25jRgfz91W+YdU/JML9+6oOTNLvCovKdGK6XMQ
 3xxR4OB/ba2xQG1e5enadFl3XSyIl52cARwO8RiMjDY3cjvUe1ZE2fInV
 TOmYTeZcPvsXIzrduYv7e7mGHldq0xwNrQo5/5phTLAuGv9NmN6kyFe0R
 aFzApqgrCArLHYPj6wengs8IXXmoldJbyozk/FeCUIz2IbRgnqw7N5gMl
 h99Aj0cVveea62X7L1D92A52mwEdL+8wxw9pC2UGNbgAHM9y0qC5Y3Q7u A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="244779159"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="244779159"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 02:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="661305016"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga004.jf.intel.com with ESMTP; 14 Apr 2022 02:51:32 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 14 Apr 2022 02:51:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 14 Apr 2022 02:51:32 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 14 Apr 2022 02:51:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SE4lNFehhVEZbxpi65m/HCVgxALYYOkHh/xU1Ydoxrn1eU8QtQ8wY+C+qomjMvDuSssP094lz3akI9UuFNjUEXtItMlP5tELfouwdas++lH3r3fzzEHNtGI+q0Y/HsvYaekifm17SOleYldf23lLSrHvNXwAbwXjSqbL4CHPmYTOaIf1Sdt3cJPVGFHR+q6bvDMuBhCtKq+7hvHF2VJD3R0VLNrFpKN0BcWRGc+mzX6XvO1b1wcH0HkJefT0CSi3Rnsjd+Eu8WqesuodNflv7o6LQhsnS/wpCy//vU733pW7pgwXc5b4dahUK82Er2qTvG5msFs+rGHF5CobJ34ruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2L/juFz3ZYYHUunW7HI9ihsrLDgsKO6ImMiWzbawe8=;
 b=PmOb9lo4ZuD1xAStlp3c0z88CS8fVy8WtRvlrWsD1GET8Rl2/Oi+BxZSN5dyzcAQdOlMX902xgURQAlIHXsgfqvDDJa9XhxsS2BdcjkKnMugajUfMzTH9OJtpMaQhGTPOKXH4JJkL+vdBRKck201bHMyNKt1zwmkWmSQwalaucwPknF/RFCF7Uwe+7zh/mWkgFdDMpv3DB4UJLKT1uZ22QI1yuU7l+Pcb4s8iP7hMRJeRPfClgQIYn5K7qOX/OMEr9moYwmmgDRXyYxqX6BnOPeYZzLrXtca8WhwiB0ZDuqYRcYZ0e4dGYRO90TZhVkLK/fr40OD9deloeon2o8HxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Thu, 14 Apr 2022 09:51:30 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::5c5:6019:652d:a5eb]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::5c5:6019:652d:a5eb%7]) with mapi id 15.20.5144.030; Thu, 14 Apr 2022
 09:51:30 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?utf-8?B?RnJhbsOnb2lzIFZhbGVuZHVj?= <francoisvalenduc@gmail.com>,
 "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Subject: RE: [Intel-gfx] commit 15512021eb3975a8c2366e3883337e252bb0eee5
 causes white spots in console screens
Thread-Topic: [Intel-gfx] commit 15512021eb3975a8c2366e3883337e252bb0eee5
 causes white spots in console screens
Thread-Index: AQHYT1m24GO+a3KPuEGMk9xSkGUaBazu8+SAgAAZgNqAAAhrSIAAFdqg
Date: Thu, 14 Apr 2022 09:51:30 +0000
Message-ID: <DM8PR11MB56557E53CB85DD86A4F21A21E0EF9@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <0da21aec-d299-1834-99f3-9a598e4649f7@gmail.com>
 <87v8vcgb63.fsf@intel.com> <20220414063139.GA31013@intel.com>
 <9d497fb9-4504-9e64-1d7f-9353cf96624c@gmail.com>
 <20220414080312.GA31389@intel.com>
 <1bcb195c-8c84-3641-7784-e7b7578bb40f@gmail.com> <87h76wf4lz.fsf@intel.com>
In-Reply-To: <87h76wf4lz.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 945c2062-f1a1-4fed-2dc9-08da1dfc59f4
x-ms-traffictypediagnostic: DM5PR11MB1418:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR11MB1418919DED5A7719D3AFCC93E0EF9@DM5PR11MB1418.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sg3fgK6fkVn1iLkKSzemg+7XfycO0M/pg1PqjocAscVP84+1WXPUjVytoThq3ZNARFDXnuZPPp8pShpeiYo4wiL/79TnU7acNVrC2CAIuZ/sZBm6c2EuvbLJMgGFEFaVzD5BHmnZe9vy5Q1SJMnC5bPAK+plfPjUbrmu5PaK13ccP+W19YwMFWzmAmKA0BtjcCrRkK0UPcdWzmWXvdtNqCJSTkqZsk4KgO1Ut68qeecZqVswtc94qjFgZLvV+I05mSJrnlACio+3wecahifPQX8l5r3x8hEG1UZ8OoUuPi9LBu9or65PstDpLTUqkur35sinWBj26HoG0IkaISw1VbPJtnfpmCGaoH1lTYgWqYy61Klkxza9HB5Bd83rmCT5iv4dtFKgxlTnoKGo37yV2OwWg6ACo6tgz9ZAViUkYuwDd09JvfsjlCzWbH+DqCM8JDM/dfvTwYkRHK4691zNRI5hPqxjsaV6DPlYMsl0pg3iaDO6XyKHbBMBnNZv8B32t5/jP6cr+gbpm01LAD32065aso5wYBpdRd6kIV6wpvqEkj/ZkFiTsOImc/ddqkXCVhde+INBFL2lou7w9t/DIUTaLhcOolEa6PgA1Scwu+8pQBsLuaowRt9eNPsxvLPQOQrd+zc0WYhabFbBhZBC1tRtUy6TrBAyeAyPpUL6BF1cys1xQJMdUWMv0JHCU14ISTv7RIaFk/bUvhTnX8vuNydw5NwZiIk4bEd3E/ajNSixQPzTY7hQccyCzM845AkkcSITYXj3gOiJF0+b42/7jN0JEYhcQ8PxIX0bRrD5sxI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(66574015)(55016003)(38070700005)(8676002)(4326008)(76116006)(71200400001)(64756008)(66556008)(66476007)(316002)(66946007)(54906003)(66446008)(6636002)(82960400001)(122000001)(38100700002)(110136005)(7696005)(9686003)(966005)(508600001)(6506007)(86362001)(2906002)(186003)(52536014)(33656002)(26005)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1l5QmRkNzBRN2RKd2xLeGxvRnBjRzA3RmhLbHFZaTRFbEFEZ21nalR1Si9C?=
 =?utf-8?B?aytJYmpvb2ZhV2VQaWwzMXBCTUtZbEE3VUNzMk10ZEZiM0dFMmUrNXpXZDVQ?=
 =?utf-8?B?MExGcTNMY2VOaXpTUzcvMXFmYWdVeFRpdVJZN2RUM0ZqaHVaN1VsZnl4cmFv?=
 =?utf-8?B?M1BvUUxBZis3aGN0ZkpqWnA3ODh4MmlIeG80bFdoWTFnZVZ0N1NzMVEySmxu?=
 =?utf-8?B?YTdORFhweHRqZDBvRXNId1dlRG1zZHFiVjh2djNNWXMxYnk4NU91cUFGcy9p?=
 =?utf-8?B?U0xzdzY3N3Z3dEZTNjRXWTM3STF1R0p2MXZzYzd4Z2M3SzU2by9Kbk1rclN1?=
 =?utf-8?B?ajl0cWIwc3liZHFrTmxSUVVISXNIN3JrVjRnSVpTWTh5OWF5T2lpTFRqQVJW?=
 =?utf-8?B?bmljSzc0M0dlbE52MCs4b1JSVDMxbnJTNWRlNldxSFFSQTkrOFgrclg0L1k5?=
 =?utf-8?B?ZmVES2p4Mk1SdERNem5reDY5MUpaN25VbWl5b0RRS0pWWklVYVNZT3BlUkZE?=
 =?utf-8?B?eXFTSlZmdFp6SVk1RCttZlIra1IwdVFXNmQwc0FiRnhDTSt0ckd0Zk1BcytX?=
 =?utf-8?B?QTJiY3NrdG12bGZSNkZ6TGFZZ3ViMzBEeStwZmdRMHJwQTZIbVRQcSs3c2Fo?=
 =?utf-8?B?WkdZYUNmRkNmMzd4K3c4aGxrQkNPZjJ5cEE5TE1wUmFFTXZVMURmRmFCeWZV?=
 =?utf-8?B?a2ZhQTkwNjZ5dDBKa0lZdDVXazQvWTFCQmlseG9sRUFSN1NUemZMeG1VTFRW?=
 =?utf-8?B?WW1EdFo2WlBZcjh0blAwd0dScFAzcGNxY3crUUt1NkNDaGExS3ByU3N2Nk5l?=
 =?utf-8?B?Q29IU1NhN1NhMHFKczNUUWdzYXN2ZUU2SzFZNnpmVGdEUU5TMXlObHd3cW0x?=
 =?utf-8?B?clA4bkdFQlFiTzNKNHZ3MGtjdUttN2U5YS9laGZtRVpjUVhpQlN4OGZNRXpn?=
 =?utf-8?B?WlB6YlJ2V3RaaEJuMGdhdkc4WHpkQ0VIUUJYL2YrS0FrYmd0dDBkYjNtNUx1?=
 =?utf-8?B?RUptRnoyTE5LRDFKaGtHRlF2ckoxaUJBd1hwVWpWNXNoWms3dHZyc0FDWE9o?=
 =?utf-8?B?UUo2QzZCRWVBY0crM2t6RlhhcGZiTVZBSXowbkcwaXd1a2dOZzYyYUJxREMr?=
 =?utf-8?B?dThOMytoQ3krdHFLYVNNcnpGcktOVFdGNHdkQnc3UGx6MWU0U2w1VkhwMjRx?=
 =?utf-8?B?eVNBQXFGZ3dlTUg3SUhZYkVyYjZPR2VMV08ralJHQUxKSk9QOVNEaEhtZjY4?=
 =?utf-8?B?VXRXa3FuenB1U2hNUzdTS25jMUowaTZJdHRRbUlZd2NtUExWdmEvK1I4SHlN?=
 =?utf-8?B?eXF2NHZlcy9DbmY1WXdsR2szQjR5RlFQSlM4cXAvdkVucWRHREhwQWxpcGNx?=
 =?utf-8?B?Z0dQc3U1ZDlpeklvZ1FpQTZSbFY1d0JUK1VPcjZQZHRXT2ptZDVCS3NjbVEy?=
 =?utf-8?B?SjlHVkd0TC9GOUlzT1U0UDZSajg4OGNZZUVJUmNsY0hBZnJpQnNnUmZUMFZ1?=
 =?utf-8?B?YTh1elFvK3BvVlI4RWJSdk9TeUEvT1VoKys2WStZSWFJa01uUEduWHdYYjRU?=
 =?utf-8?B?YXo5M3V3dmZucnVxbmxmSEpiRmVkMUpSMk5NMnVDQTdWNDVybVVzSTdFM05C?=
 =?utf-8?B?ODVlYmV5L1d6Mko5dm9rSm51TGt2azQwMEo5YVVuMmI2OC9XM3VEQzBIZ2M0?=
 =?utf-8?B?d3JtRVJJL0tmdUFwM0lFT0R4QUVKQlZJcjVERDNOS3k0U1JZUFVUMW9nVS9r?=
 =?utf-8?B?OXhHMFdkTGlTNmUvT3FmZlh2eFJJVmVYU3U0OUk3UThBcmFkT3prYVRHYmdm?=
 =?utf-8?B?QjVlcEVPd244bmZyTHlsNjREci93RW9Fa2oya20ya0hva1o3bk9PbXZkTUVT?=
 =?utf-8?B?V0VFVjhnTE5JZ0RybCsrWU9TbUFNWWJFajJORTVmMlZQM0FreDcrbjYxWDgr?=
 =?utf-8?B?aDZsOVFIc1laeGY5MHJ5RkMxd3RNM2Z4OTQwdy9VTlJzTmhCNWlCZlA0Q3NH?=
 =?utf-8?B?dEdtbkpOYU5MVWNzaGl3RmZ3QnJ1Y1FjZGVoZkVGdG5DNzJxUFl2cm56TTZH?=
 =?utf-8?B?eDVDL0x6dEgvZGNkRTE2TjB1WGNtekxIVDljUmNpdTJBUWFiVnJUYkppQS9V?=
 =?utf-8?B?WVVlVW9qSFhzaVh0WVRuaFY5WWgzQjNyZWpmZlA1UWZUbHE2UllmOHlqRkh5?=
 =?utf-8?B?K3MwQ1VucERTbFBlM2xVUzgxZkd3bHp3WDFaSUZ0MmE4cGg1ek50d25MRW5R?=
 =?utf-8?B?cmlIOW9xRmxrUkpBd2duWWRzbUtOaVJVOTBFQmxLemgxQ01ucTJnK3VwbDFP?=
 =?utf-8?B?MTJjTHpudHF2OWNRaHp5Rk0zRGgwbW5OZHpSUkQxUVozbnFVazVidz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 945c2062-f1a1-4fed-2dc9-08da1dfc59f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 09:51:30.1048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OXECLvgbNqx0bXC2EppSjDHFgPZg1LMvhTaSB8NXh9Ref0k8c1zsZxvlnFKBZYxG6PaaopMLN2EEPUXuLg4GiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1418
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBKYW5pDQo+
IE5pa3VsYQ0KPiBTZW50OiB0b3JzdGFpIDE0LiBodWh0aWt1dXRhIDIwMjIgMTEuMzINCj4gVG86
IEZyYW7Dp29pcyBWYWxlbmR1YyA8ZnJhbmNvaXN2YWxlbmR1Y0BnbWFpbC5jb20+OyBMaXNvdnNr
aXksIFN0YW5pc2xhdg0KPiA8c3RhbmlzbGF2Lmxpc292c2tpeUBpbnRlbC5jb20+DQo+IENjOiBp
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbSW50ZWwtZ2Z4XSBjb21taXQgMTU1MTIwMjFlYjM5NzVh
OGMyMzY2ZTM4ODMzMzdlMjUyYmIwZWVlNQ0KPiBjYXVzZXMgd2hpdGUgc3BvdHMgaW4gY29uc29s
ZSBzY3JlZW5zDQo+IA0KPiBPbiBUaHUsIDE0IEFwciAyMDIyLCBGcmFuw6dvaXMgVmFsZW5kdWMg
PGZyYW5jb2lzdmFsZW5kdWNAZ21haWwuY29tPiB3cm90ZToNCj4gPiBMZSAxNC8wNC8yMiDDoCAx
MDowMywgTGlzb3Zza2l5LCBTdGFuaXNsYXYgYSDDqWNyaXTCoDoNCj4gPj4gT24gVGh1LCBBcHIg
MTQsIDIwMjIgYXQgMDg6MzM6MzVBTSArMDIwMCwgRnJhbsOnb2lzIFZhbGVuZHVjIHdyb3RlOg0K
PiA+Pj4gTGUgMTQvMDQvMjIgw6AgMDg6MzEsIExpc292c2tpeSwgU3RhbmlzbGF2IGEgw6ljcml0
wqA6DQo+ID4+Pj4gT24gV2VkLCBBcHIgMTMsIDIwMjIgYXQgMDg6MTI6MjBQTSArMDMwMCwgSmFu
aSBOaWt1bGEgd3JvdGU6DQo+ID4+Pj4+IE9uIFdlZCwgMTMgQXByIDIwMjIsIEZyYW7Dp29pcyBW
YWxlbmR1YyA8ZnJhbmNvaXN2YWxlbmR1Y0BnbWFpbC5jb20+DQo+IHdyb3RlOg0KPiA+Pj4+Pj4g
Q29tbWl0IDE1NTEyMDIxZWIzOTc1YThjMjM2NmUzODgzMzM3ZTI1MmJiMGVlZTUNCj4gPj4+Pj4+
ICgxNTUxMjAyMWViMzk3NWE4YzIzNjZlMzg4MzMzN2UyNTJiYjBlZWU1KSBjYXVzZXMgYSBsb2Yg
b2Ygd2hpdGUNCj4gPj4+Pj4+IHNwb3RzIHRvIGFwcGVhcnMgb24gdGhlIHJpZ2h0IHVwcGVyIGNv
cm5lciBvZiBhbGwgY29uc29sZSBzY3JlZW5zDQo+ID4+Pj4+PiAoc2VlDQo+IGh0dHBzOi8vZHJp
dmUuZ29vZ2xlLmNvbS9maWxlL2QvMTNHYWJFdk9JS1NBajV5b3g2eWJBWkVEdTNJeG5jdzVRL3Zp
ZXcpLg0KPiA+Pj4+Pj4gZ2l0LWJpc2VjdCBzaG93cyB0aGF0IHRoaXMgaXMgdGhlIG9mZmVuZGlu
ZyBjb21taXQgYW5kIGlmIEkNCj4gPj4+Pj4+IHJldmVydCBpdCwgdGhlIHByb2JsZW0gZ29lcyBh
d2F5LiBUaGUgcHJvYmxlbSBzdGlsbCBvY2N1cnMgd2l0aA0KPiA+Pj4+Pj4ga2VybmVsIDUuMTgt
cmMyIGFuZCB0byBhbGwgc3RhYmxlIHRyZWVzIHdoZXJlIGl0IHdhcyBhcHBsaWVkLg0KPiA+Pj4+
Pj4gQ2FuIHNvbWVib2R5IGV4cGxhaW5zIHdoYXQgaGFwcGVucyA/DQo+ID4+Pj4+Pg0KPiA+Pj4+
Pj4gVGhlIHZpZGVvIGNhcmQgaXMgdGhlIGZvbGxvd2luZzogVkdBIGNvbXBhdGlibGUgY29udHJv
bGxlcjogSW50ZWwNCj4gPj4+Pj4+IENvcnBvcmF0aW9uIFdoaXNrZXlMYWtlLVUgR1QyIFtVSEQg
R3JhcGhpY3MgNjIwXSAocmV2IDAyKQ0KPiA+Pj4+Pj4gKHByb2ctaWYgMDAgW1ZHQSBjb250cm9s
bGVyXSkNCj4gPj4+Pj4+DQo+ID4+Pj4+PiBQbGVhc2UgdGVsbCBtZSBpZiB5b3UgbmVlZCBtb3Jl
IGluZm8uDQo+ID4+Pj4+IFRoYXQncyBjb21taXQgMTU1MTIwMjFlYjM5ICgiZHJtL2k5MTU6IFdv
cmthcm91bmQgYnJva2VuIEJJT1MgREJVRg0KPiA+Pj4+PiBjb25maWd1cmF0aW9uIG9uIFRHTC9S
S0wiKSwgYWRkaW5nIENjJ3MuDQo+ID4+Pj4+DQo+ID4+Pj4+IFBsZWFzZSBmaWxlIGEgcmVwb3J0
IGF0IGZkbyBnaXRsYWIgWzFdIGFuZCBhdHRhY2ggZG1lc2cgZXRjLiB0aGVyZS4NCj4gPj4+PiBU
aGF0IGNvbW1pdCBsb29rcyBsaWtlIGl0IGlzIGp1c3QgZGlzYWJsaW5nIGFsbCB0aGUgcGxhbmVz
LCBpZg0KPiA+Pj4+IHdyb25nIGRidWYvd20gY29uZmlndXJhdGlvbiBpcyBkZXRlY3RlZC4NCj4g
Pj4+PiBIb3dldmVyIGl0IHNob3VsZCBkbyB0aGF0IG9ubHkgb25jZSBkdXJpbmcgYm9vdCBhcyBJ
IHVuZGVyc3RhbmQuDQo+ID4+Pj4NCj4gPj4+PiBBcmUgeW91IHN1cmUgdGhhdCBpcyBleGFjdGx5
IHRoaXMgY29tbWl0IHdoaWNoIGlzIGNhdXNpbmcgdGhpcz8NCj4gPj4+PiBEb2VzIHRoZSBpc3N1
ZSBhcHBlYXIgYWx3YXlzPw0KPiA+Pj4+DQo+ID4+Pj4gVmlsbGUgU3lyasOkbMOkLCB0aG91Z2h0
cz8NCj4gPj4+Pg0KPiA+Pj4+IFN0YW4NCj4gPj4+Pg0KPiA+Pj4+PiBUaGFua3MsDQo+ID4+Pj4+
IEphbmkuDQo+ID4+Pj4+DQo+ID4+Pj4+DQo+ID4+Pj4+IFsxXQ0KPiA+Pj4+PiBodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2ludGVsL3dpa2lzL0hvdy10by1maWxlLWk5MTUtYnUN
Cj4gPj4+Pj4gZ3MNCj4gPj4+Pj4NCj4gPj4+Pj4NCj4gPj4+Pj4gLS0NCj4gPj4+Pj4gSmFuaSBO
aWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcg0KPiA+Pj4gQXMgSSBzYWlk
LCBnaXQtYmlzZWN0IHNob3dzIGl0J3MgdGhlIG9mZmVuZGluZyBjb21taXQgYW5kIGlmIEkNCj4g
Pj4+IHJldmVydCBpdCwgdGhlIHByb2JsZW0gZG9lc24ndCBoYXBwZW5zLiBPdGhlcndpc2UsIGl0
IGFsd2F5cyBvY2N1cnMuDQo+ID4+Pg0KPiA+Pj4gRnJhbsOnb2lzDQo+ID4+Pg0KPiA+PiBEb2Vz
IGl0IGp1c3QgaGFwcGVuIGFsbCB0aGUgdGltZSBvciBzb21lIHN0ZXBzL2NlcnRhaW4gY2lyY3Vt
c3RhbmNlcw0KPiA+PiBuZWVkZWQgZm9yIGl0IHRvIGhhcHBlbj8NCj4gPj4NCj4gPj4gT25seSBz
dXNwaWNpb24gYWZ0ZXIgbG9va2luZyBicmllZmx5IGlzIHRoYXQgb25jZSBzdXNwZW5kL3Jlc3Vt
ZSBpcw0KPiA+PiBkb25lIGl0IG1pZ2h0IGJlIG1lc3Npbmcgc29tZXRoaW5nIHVwLiBKdXN0IGEg
cXVpY2sgZ3Vlc3MuLg0KPiA+Pg0KPiA+PiBTdGFuDQo+ID4NCj4gPiBJdCBvY2N1cnMgcGVybWFu
dGVudGx5IGFzIHNvb24gYXMgSSBib290IG15IGNvbXB1dGVyLg0KPiANCj4gSSdkIGFwcHJlY2lh
dGUgdGhhdCBidWcgYmVpbmcgZmlsZWQsIGFuZCB0aGUgZGlzY3Vzc2lvbiBtb3ZlZCB0aGVyZSwg
c28gYWxsIHRoZQ0KPiBkZXRhaWxzIGFuZCBoaXN0b3J5IGFyZSBpbiBvbmUgcGxhY2UuDQpBZ3Jl
ZS4gDQoNCj4gDQo+IFRoYW5rcywNCj4gSmFuaS4NCj4gDQo+IA0KPiAtLQ0KPiBKYW5pIE5pa3Vs
YSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyDQo=
