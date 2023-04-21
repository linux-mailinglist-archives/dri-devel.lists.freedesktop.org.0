Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6980A6EA06A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 02:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E288310ED60;
	Fri, 21 Apr 2023 00:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE44910ED60;
 Fri, 21 Apr 2023 00:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682035563; x=1713571563;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rG7jvgPsycV16yhoxcCiAHPP22otUYU7cCNDR1CYsEQ=;
 b=kdzrY32jxoNvCzHs9CUb/9bbwV9H8YIM8zpahGd9ob+LxY9/yRnbNK16
 WYr3S/+znqxh98pfHa0HC9OJsEc4PSeq4tOzZStFjeRSlp2wzgomaW4zm
 F9MlqwhX+W1ZlUATI/FhMiRhw7o4W321fO9UMsabeasU9TYmTI2ypbfo7
 gIboApR1opf0Sq4qEwW75yaUFher0PL62suUm4RhCyJ/aZr+giRXB1ZzK
 /lB+dil+82F+UEth+ktS0Sy0t7ucDU9EejeXMHT+0dj6z8Y0x6pnvVdZt
 I22b+JJ+uINI51H+X4us/i1Z7bHl/FBKUx1DCI/3vxdYFUPZJ7m7sc92b A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432159772"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="432159772"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 17:05:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="669532469"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="669532469"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 20 Apr 2023 17:05:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 17:05:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 17:05:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 17:05:23 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 17:05:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtAp34IayRRqj4y6/drGowecAFaDcUXbX1pYSb9DW9E03TFaRdT7eXxQyQJEIXMIsYXuDyk8HDPRJvN3k83tHk+CU9GI2KCbI/kMq+DQuirsPezbu1yMiV1frQWlpsReZn1DMkgEOvNG9zTHs9evA43sKRv9B2f8zEg2YhX9xkGivk91ca51Kk1zSDFwuOTMG1BFuw8HSdPI0LrbQapnPGcmzSWsksLluFVxfeOLS/6+axiLmkDs/NmgoMhl2HqJY3bdbOE1FPiqpVY/GEgbBo8Gk/M49Ao68Pv1qMGoGyTrHCIYduxefueQfN1eUR2DSvFppk0s79SCSZTvK9e6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rG7jvgPsycV16yhoxcCiAHPP22otUYU7cCNDR1CYsEQ=;
 b=RA+yFUNRctyUF4GmqfIM7hyMpxM9ZjvHXZWekeKYeu9Zj1uEcPEUfSz1ZhZ5CUx68RlqUq5C4sVu0CmSG70zhiQluchDXrp4zQfPfDQ4Dz7fzKDYx5Zfm7h3mm8waOlr7L5GlShafOz0qiCl7UoH7FvWHEhS2MVF0ufKL6Gekyw5NMhfGLaMr2SnKX+eqNvnUfvAZw1jDfFRyr9aTa1/gXGgElzBypFy5ylscTxYqjX8bT9gubHjGfmsv0PkZo5W//GEwkfLtq5FSkkeQk6tEj0gBt/pV2wsWkrtDCwAG+x3H0l/h6gDVGqnXBI/8eTFd9Vrb3mqddw0c0NaQC4sqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW5PR11MB5907.namprd11.prod.outlook.com (2603:10b6:303:1a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 00:05:21 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 00:05:18 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] mei: gsc_proxy: add gsc proxy driver
Thread-Topic: [PATCH 2/4] mei: gsc_proxy: add gsc proxy driver
Thread-Index: AQHZYl+LdvZWWA8yYk2tzJ5AqOH2La8yU8uAgAKPloCAACHFgA==
Date: Fri, 21 Apr 2023 00:05:17 +0000
Message-ID: <76603eeda91847d3510de7191ebe08a9d6880fb8.camel@intel.com>
References: <20230329165658.2686549-1-daniele.ceraolospurio@intel.com>
 <20230329165658.2686549-3-daniele.ceraolospurio@intel.com>
 <612b04c9c35f1f67083ce5cb889f909fb89bb066.camel@intel.com>
 <553a192a-f52a-a3fb-4f20-ed79bf75f0c6@intel.com>
In-Reply-To: <553a192a-f52a-a3fb-4f20-ed79bf75f0c6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MW5PR11MB5907:EE_
x-ms-office365-filtering-correlation-id: a0371b0d-c334-4dac-ed03-08db41fc172c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gg/0SAbe9d/Z7v46zRfI1inDraqkWIC6U/+XKO/MP3IZSOFATA+4Np1aLs7IBVqXSHIV0+C5olgO+Hb/qct/REu6nEEYR7bb55WAyUctHfrIacwvrxcA7lJcgXCDzkwlRRhr/unR5DorYFZUwGL5wjnKmY1d5iXRI9Bjb4siSUzYVs1h0QyLb2XEAoW9gvK1u+d85gE3AlTyohZXeqKSdf2e2srt+qi9ommfLMjMj3+izJwl3mppU/FeBlZXY/0fVJm8r/NrHCuwhmWJAs+ZuSk8QfIhcmFPNxdTPjchVmaxtm2U8467DkFi+SCPPTTJBQCH8iPflmBJMcc9IcUM6LQhZK1sColY3wPb8JCgx+T4GeLEtYtjDst82JpKplCayFCRSPn1/SSevbFfY/3jLQqNW3iQKz/IwZ3A5FUjUGQrlibbsB+mPKObw6UFuCh/OqGan5UYQ6mN/nqRt4KJpqp/pKVt6p/4HMJ0trCqzQlo0kGBJVewsOhVmBbEdnheXfSFoPIXW7yLICBziVEwY2vZQYFwar9kUU/kVIFEzZr+vRnrc/78F7Xl24qih7Y753lHejq/QXpP1n1HMKXkUL/L4TM40RAZn8M0XvJA0Rs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199021)(5660300002)(8676002)(8936002)(316002)(82960400001)(41300700001)(122000001)(4326008)(66476007)(66446008)(64756008)(38100700002)(86362001)(38070700005)(53546011)(2906002)(6512007)(6506007)(26005)(966005)(6486002)(107886003)(2616005)(83380400001)(186003)(36756003)(110136005)(66946007)(76116006)(66556008)(478600001)(54906003)(71200400001)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEdjZkhMemJvREVWb3VBMEtmSUNpOTZOc1poZkZQS2d0Mnh1Q3IwSEhWUVF6?=
 =?utf-8?B?RWp6aUdnblVhWUNqajVXQ2R0dTNUNmx3YXZqMHVsbjNreEE4aGNteU5iUExH?=
 =?utf-8?B?NHQzZ01xSGFaa2NWbHludFhtZENTek1WNkRrNHVTSUpCVUtQNTd0ZldvTWpt?=
 =?utf-8?B?N0tjNVFVc0IvckFINkFVdTB4N1lpVy90SitlNVpmZVY0eURPT01nMEkvcUxN?=
 =?utf-8?B?VzcrRWZ3T0VmTHhGcEI5ck5xME9TRHQzSytIYzBQQkh5VGhUaVdUSWhtSDdE?=
 =?utf-8?B?VXIvR2xleFFWbzB0bWlzRW1VSXN3SWpKOFRVaEhtdFU5QStTTFd6RnVTNnQx?=
 =?utf-8?B?aGlsbUV2czBmYVZIZERlQ1A5c3NrUzUxR1MvNUFaVTdJd3RRdzVIbHZVUGYz?=
 =?utf-8?B?U1g4RVVLK1E5UUZJeVBMNDhUTjZsb0R0SW1UcjgvdkU0Y0c3a2VrcGFsOU40?=
 =?utf-8?B?UG5pK20yVnptOGM2Sk5TYjJmTVFCR1FvVVhjcHNEdjh4Z3pKNVVKREJHSXJQ?=
 =?utf-8?B?cEY5WnNmSUNCN0FEU0Z3aU9BTk5XUW0xaEtVSTJqL3RBTG0xKzVPa1Fid3Vp?=
 =?utf-8?B?NGk1N04yajVTNno0ekdXR3dmZThLQ1pDdklmU0krYTc2OGpNZ2o5YWl5UWU0?=
 =?utf-8?B?S0NkU1NJRnZHVWRybUhwTjF3MWlsNWF4ajZZRURrZkZFQkZYN1BRdnh3R2RC?=
 =?utf-8?B?MWE3NjFzcmtkeEE4ZElGcERpVG1MNjM3M0JDNUI5UENuOVE5cTlXengxSk9z?=
 =?utf-8?B?YSt4ZWp3TmV0OUVmWWFCRDJLeEVrb3htVyt0OGNFT3E0OHpKaTFZMUNzZjBU?=
 =?utf-8?B?WnZwSmpmVFVEMTY4M0trOTFuL1B5enRuSjZGZ05QNlBKR3RSdHltektraml3?=
 =?utf-8?B?Y0JHeit6RDlXVDdUQ2RvRktEa09xdC9lWXk1VFkxTnZ1blYxQVR0c0FERmNp?=
 =?utf-8?B?dHlmaUlVc0NiemF2dUtIM0w0YWE5WmxBVW9wakRmN1R3YUZPKzU2SVBZMDJU?=
 =?utf-8?B?WE9CY1hEU3QxZTFXUFR6QzNock9WbTBIYmRHYXM4NkVyY1dlRkE4Z1RmeGpH?=
 =?utf-8?B?Mi8yZnQ4OHlNOUdnNENNTU5wRUc5YkFhWFhldGtlS3dQMExPWUQrN0hka2Zs?=
 =?utf-8?B?OXJKbEVNZUQ3a1c2RC9WbkVKeitPVTd4MUh3WVVCSWJpSHdCbDUvbi9NeTky?=
 =?utf-8?B?MGlmTmhQVWFuZlpESzZpZ09iMjgvSU1UZFpkRGJadHk4QlVra1YycXNvcktq?=
 =?utf-8?B?Nk95aWlnK09mc2VMTjk4UWVKRzgrcW9tZCtUWlhENjhRZkgwWW01bUJZa05W?=
 =?utf-8?B?QUhVcDBJcXhKMWpYYTRkQWxiOW9ZRjBVUkVLdXpsZ1NDc1pjaEtPVUEyWFBy?=
 =?utf-8?B?MlREd1BaV2tkM2h2ejAyamw2YU9pRHZRZ000OXRqQkYvRFJhbGtWeVBIUG52?=
 =?utf-8?B?SFErakVDMEI2ZE45Uzdic2JpMU1nczVkM0NPdThCVGRKUGR1azB6aG9TQmV0?=
 =?utf-8?B?KzJLUDA4OU5oL2xIRzFYclpBQzV5Yk1GRk1DN25JQmxmTU9rQzMvNXpHd1c2?=
 =?utf-8?B?cW4xOTZLeTVEclRzbmkvUmpyRmY0emFlcjI4K1JqeE5SQXBabXZ0OGZZWCt6?=
 =?utf-8?B?c3loOXpkbW44ckh5NkhyVzNvM0VBazdDTVc5YndmVi9ZR2R5b2k4dGRxclJx?=
 =?utf-8?B?bHY1ejZsWTNnM1VkektlQ2lCNUZuNmJJUWFtQ0lrNVhmTHJRU2NrNEZHMFN6?=
 =?utf-8?B?ZSttdWRIZnpJN1lLYVBTSEgwOVo4K2U5cU5NZXNYQUdQSjllYnhqY2RhYlNR?=
 =?utf-8?B?M1BsRDJsSE1TR25yMlc0UWxNUnY2eTBDa3IrR1F3OEo4MVZNdjlhRzlvbmJO?=
 =?utf-8?B?L2FoYXJUdHRIVEdKVXMrN1lBUDZUTW5vNlFIYWpHOXB4U24zOVBWditXem9h?=
 =?utf-8?B?eVgvQlNmcUFtcWpSTmI0U3ZiMXRGcEdiUUFBK2t4WTRrTWR3QTYvS0NvUzd6?=
 =?utf-8?B?a2FlYWlUSWdXMGhabUMzZkZXT0xnNFVtMXdzN1BnU3c5ZitwVjc5cEVVcUI2?=
 =?utf-8?B?YzJVUFQ2VkdlYVExYklzTUl5KzhZL3lqYW9oQ2VJaHJERXpJVG9aY1RMS0FH?=
 =?utf-8?B?L0ZTU2VDZC9hOWU5OFhWVExyZE13c2tlbjFtUnltTTU5YmpMQlFyZzUxaTFD?=
 =?utf-8?Q?CNn9C2X5C8e40zMrm4Jji4o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CBA3541545AC844A03092F3273AE6BF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0371b0d-c334-4dac-ed03-08db41fc172c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 00:05:17.9126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bpes9fiINGiHVZga29Fomkst5++XdEZak7G84yFvsH1UwCRGZh/OEM1xxv2Fh10s6r3+7YT4XagOaDbRenvFJsTFniNBDk9jz9HgcriHAQN1aUPA8pw1Zv+igaDECxPA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5907
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>, "Winkler,
 Tomas" <tomas.winkler@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aSBndWVzcyB3ZSBhcmUgc2V0dGxlZCB3aXRoIHRoaXMgcGF0Y2guLi4NCg0KT24gVGh1LCAyMDIz
LTA0LTIwIGF0IDE1OjA0IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVsZSB3cm90ZToNCj4g
T24gNC8xOC8yMDIzIDExOjU3IFBNLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJldmluIHdyb3RlOg0K
PiA+IE9uIFdlZCwgMjAyMy0wMy0yOSBhdCAwOTo1NiAtMDcwMCwgQ2VyYW9sbyBTcHVyaW8sIERh
bmllbGUgd3JvdGU6DQo+ID4gPiBGcm9tOiBBbGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVz
eXNraW5AaW50ZWwuY29tPg0KPiA+ID4gDQo+ID4gPiBBZGQgR1NDIHByb3h5IGRyaXZlci4gSXQg
dG8gYWxsb3dzIG1lc3NhZ2luZyBiZXR3ZWVuIEdTQyBjb21wb25lbnQNCj4gPiA+IG9uIEludGVs
IG9uIGJvYXJkIGdyYXBoaWNzIGNhcmQgYW5kIENTRSBkZXZpY2UuDQo+ID4gYWxhbjpuaXQ6IGlz
bid0ICJJbnRlbCBpbnRlZ3JhdGVkIEdQVSIgY2xlYXJlciB0aGFuICJJbnRlbCBvbi1ib2FyZCBn
cmFwaGljcyBjYXJkIj8NCj4gPiBTYW1lIHRoaW5nIGZvciB0aGUgS2NvbmZpZyBkZXNjcmlwdGlv
biBsYXRlciAob3IgYW0gaSBtaXNzaW5nIHNvbWV0aGluZyBlbHNlIGhlcmUpLg0KPiANCj4gV2ls
bCBjaGFuZ2UNCj4gDQphbGFuOiBzYXcgeW91ciByZXBseSBvbiBiZXR0ZXIgYWx0ZXJuYXRpdmUg
Zm9yIGJvdGggJ2knIGFuZCAnZCcNCg0KYWxhbjpzbmlwDQo+ID4gPiArc3RhdGljIGludCBtZWlf
Z3NjX3Byb3h5X3JlY3Yoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpidWYsIHNpemVfdCBzaXpl
KQ0KPiA+ID4gK3sNCj4gPiA+ICsJc3NpemVfdCByZXQ7DQo+ID4gPiArDQo+ID4gPiArCWlmICgh
ZGV2IHx8ICFidWYpDQo+ID4gYWxhbjogbml0OiBzYW1lIGFzIGluIHRoZSAnc2VuZCcgYWJvdmUs
Li4gbm90IHN1cmUgaWYgd2Ugc2hvdWxkIGJlIGNoZWNraW5nIGZvciAhc2l6ZSBoZXJlLi4uDQo+
ID4gb3IgcGVyaGFwcyAwIHNpemVkIHJlY3YgaXMgc3VwcG9ydGVkLg0KPiANCj4gQUZBSUNTIHRo
ZSBsb3dlciBsZXZlbCBvZiB0aGUgbWVpIGNvZGUgZG8gYWxsb3cgZm9yIHNpemUgMCBmb3IgYm90
aCBzZW5kIA0KPiBhbmQgcmVjdi4gQWxzbywgdGhpcyBpcyB0aGUgc2FtZSBjaGVjayBhcyB3aGF0
IHdlIGRvIGZvciB0aGUgUFhQIGNvbXBvbmVudC4NCmFsYW46IGFncmVlZCAtIHRodXMgdGhlIG5p
dCBhcyBwZXIgbXkgZWFybGllciBlbWFpbC4NCg0KPiA+IA0KYWxhbjpzbmlwDQoNCj4gPiA+ICsJ
aWYgKHN1YmNvbXBvbmVudCAhPSBJOTE1X0NPTVBPTkVOVF9HU0NfUFJPWFkpDQo+ID4gPiArCQly
ZXR1cm4gMDsNCj4gPiA+ICsNCj4gPiA+ICsJcmV0dXJuIGNvbXBvbmVudF9jb21wYXJlX2Rldihk
ZXYtPnBhcmVudCwgKChzdHJ1Y3QgZGV2aWNlICopZGF0YSktPnBhcmVudCk7DQo+ID4gYWxhbjog
ZG8gd2UgY2FyZSBpZiBib3RoIHRoZXNlIHBhcmVudHMgYXJlIG5vbi1udWxsPyBpIG5vdGljZSBp
biBvdGhlciBtZWkgY29tcG9uZW50DQo+ID4gZHJpdmVycyBtYXRjaCBmdW5jdGlvbnMgd2UgZG8g
Y2hlY2sgdGhhdC4NCj4gDQo+IFRob3NlIHNob3VsZCBhbHdheXMgYm90aCBiZSBub24tTlVMTCwg
c2luY2UgYm90aCB0aGUgbWVpIGFuZCB0aGUgR0ZYIA0KPiBkZXZpY2UgaGF2ZSB0aGUgUENJIGJ1
cyBhcyBwYXJlbnQgKGFuZCB0aGUgcHJldmlvdXMgY2hlY2sgb24gcGRldiANCj4gZW5zdXJlcyB0
aG9zZSBhcmUgdGhlIDIgZGV2aWNlcyB3ZSdyZSBoYW5kbGluZyBhdCB0aGlzIHBvaW50KS4NCmFs
YW46IHNvdW5kcyBnb29kLg0KDQoNCg0KPiA+ID4gKyNkZWZpbmUgTUVJX1VVSURfR1NDX1BST1hZ
IFVVSURfTEUoMHhmNzNkYjA0LCAweDk3YWIsIDB4NDEyNSwgXA0KPiA+ID4gKwkJCQkgICAweGI4
LCAweDkzLCAweGU5LCAweDQsIDB4YWQsIDB4ZCwgMHg1NCwgMHg2NCkNCj4gPiBhbGFuOiBhcG9s
b2dpZXMgZm9yIHRoZSBuZXdiaWUgcXVlc3Rpb24sIGJ1dCB3aHkgYXJlIHdlIHVzaW5nIFVVSUQg
Zm9yIHRoZSBnc2NfcHJveHkNCj4gPiBhcyBvcHBvc2VkIHRvIEdVSUQgbGlrZSB0aGUgb3RoZXIg
bWVpIGNvbXBvbmVudHM/IGkgYW0gbm90IHN1cmUgaWYgaSByZWFkIHRoZSByaWdodA0KPiA+IGFy
Y2hpdmVkIHBhdGNoIHJldmlldyBidXQgaXQgc291bmRlZCBsaWtlIEdVSUQgaXMgZm9yIGludGVy
bmFsIHRvIGtlcm5lbCBvbmx5IHdoZXJlYXMNCj4gPiBVVUlEIGlzIGZvciBleHRlcm5hbCB0b28/
IA0KW3NuaXBdDQo+IEFGQUlDUyBhbGwgb3RoZXIgbWVpIGNvbXBvbmVudHMgdXNlIFVVSURfTEUg
YXMgd2VsbC4gVGhlIGNvZGUgd2FzIA0KPiB1cGRhdGVkIGZyb20gR1VJRCB0byBVVUlEX0xFIGlu
Og0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjEyMjgxNjA1NTguMjEzMTEtMS1h
bmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20vDQphbGFuOiBzb3VuZHMgZ29vZC0gdGhh
bmtzIGZvciB0aGUgVVJMLg0KDQoNCg0K
