Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A4982207D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 18:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EE010E0A3;
	Tue,  2 Jan 2024 17:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF9F10E0A3;
 Tue,  2 Jan 2024 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704217249; x=1735753249;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NJ/dmX0h4QleQ1NVsHQHDUzVb/3aXtQWLpZrUYIJeCw=;
 b=ZJUCHqdMUVQaTZp9D0TtddYqr7msHFEN0Jre10tyOVtri0NdsjD6M2uj
 IGbP75/CdMpRny73zMWP+Si2IMj66Ph7UrdfWF7/nuO7SF0nVA8rnpWMW
 5Rk7Y9xFmbUvAy2NInQ+XPXs2iHbvklLTbWyXup60JnIds6aFjQS4J/PF
 ZVvWb5sr3w6qPMbA4iNpvIpgBMQXpbJ34QPFnrzseWr4QZ0tu+FDXrFH/
 gHtWk5VLqRW5rzeqIJhGOS2dx+kpiCIKHL98g2OQqHD7q3J2EjPUnueoX
 pbxApdbMMKVf04P7E/RI0W+Xljlb8aDOdJ/mR6V8NsSmbFED82fHO69js Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="399667270"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="399667270"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 09:40:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="898592343"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="898592343"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 09:40:47 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 09:40:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 09:40:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 09:40:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4zbC8d/jscTlFJfh8yQOqpG7smK/bGor6qFtLTjn3PvSklzAYB04wbV2SfRUuWgYs+pz0ffLkI21aILlynTUpHF3raU19HRDleF0Y/WFmaEcgS6EMhTVEktfW0tpZ2DueMhgryGV+oFBi8QE+UOVk+PNgh2agbINpRg4E2GtQ4VRwIvcYngG2d6DzKAxAPb7kqTLFp/9qu399XOYVJ219GKYlTzN5q4IXqFEIN8E/7H4WrEdtOq7xX6eN07HIJ+2l9XTqWqDcTjZev/oeSEF0GIPLngSqgB5J3xJrqF8IhJD3auzDL0T9UNggfert6YOxl5Q/DsY3IgA7lJI9CRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJ/dmX0h4QleQ1NVsHQHDUzVb/3aXtQWLpZrUYIJeCw=;
 b=CEQrWPrsFAfsFROD9TXfWB/MvC/kIfkERNr+2OwxlZ2jU8vMbeg6ln1FQBly0ha91Ia2FvP5GH0wGv/tm6EuLzhXlJZumle2Nsq6qzU1X45VownmyxWlANJm9pQWMgL0ArB5dxAve5+mIVAgT9nLwAqN6cIxK50GD5b1V9+CqWObTwVfNOCXHTb7WkIS+YVom5LjC3a7IDWmm6vsHyd9drr5yeNK1MQ/8/QB9cdKgNXxkmRfhvnZsLI3dbeAUeJsh4Fb+NPjUjhPkjZZMs+JkHpObDwxrsGrWE3zwck5/1rQlBemUNlQNSWwrQk6QJ/hmN3v+z/V4nDw6oV5bweXWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SN7PR11MB8025.namprd11.prod.outlook.com (2603:10b6:806:2dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.24; Tue, 2 Jan
 2024 17:40:44 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::da85:3d5:65fd:4a21]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::da85:3d5:65fd:4a21%7]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 17:40:44 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v9 0/2] Resolve suspend-resume racing with GuC
 destroy-context-worker
Thread-Topic: [PATCH v9 0/2] Resolve suspend-resume racing with GuC
 destroy-context-worker
Thread-Index: AQHaOUorAjQQfHhWj0i4YIzjELYM67DG0wgA
Date: Tue, 2 Jan 2024 17:40:44 +0000
Message-ID: <6711fcb78aba723e1f04e607226e859047fa0916.camel@intel.com>
References: <20231228045558.536585-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20231228045558.536585-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SN7PR11MB8025:EE_
x-ms-office365-filtering-correlation-id: ab666cd3-d30b-40a5-cf0d-08dc0bb9f274
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OHVJkLW0FE8pIw6896ZAg3iUqSxWSSyNmi/FewYO2HZuKQQmyX8xzSBbZewUHQeEWlbIGt+QMqlRcRT9+9qKrVPIkQy9NfRUzGV3wUOrNe5YviMChvwwiTHO1uGW7YAax0TJNk5a+uXOgXScGp/C9yFN4AvkpjwKkon/pe6fj+NwoIidIWTsritsxttqsXmanGCYrahUYe2Ecuyckhwz2PEdmLYlxcG/SQ5zflxgDhKhe+XQdiJjSizJn1uXU/z+HjqxJR+RdsylnPKgJUeP34EjVUYfge0cF1JmooxizwaANAB6FhVTvnqhaizJKf22laBx7yxSkpJNsRvGj/T03ThhedpEZa6bUmdzYyM36LA2J6uEmRXXrnXPSor+uEnrMlyZmJC9KsD2CPOokHfhhZum0H6EpPawt/VqgH8YzC1asCCjAmCip2gNObnK2zMiH4/l98NMrBekiKOpYPA4Bxw0RmN6AmKWHKfr/oDWMBxhkpsx/6GWmpmVcVPTlzArF/o1cJhdcGuKqrhKEPWUi8+rnQN/ItR7FFYYD3t4LhpvMa7/MLc2JcCDo0RondQizqm0zx/z4CxSmmBOuxd0KsbdDzz+PpwHEAuiwFJj7wNhTeOFL0vxgVYLEU0NxNI4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(39860400002)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(64756008)(6486002)(91956017)(66556008)(66446008)(4326008)(76116006)(66946007)(450100002)(66476007)(8936002)(54906003)(110136005)(2616005)(316002)(26005)(107886003)(478600001)(6506007)(71200400001)(6512007)(8676002)(83380400001)(5660300002)(2906002)(4001150100001)(41300700001)(15650500001)(38070700009)(36756003)(122000001)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFJHUUxiUGhYVUdETXpLOExmemJpTWZpSWpYOVFVKzhDZEhZUmtyQVpsR3dj?=
 =?utf-8?B?Zng1NkQ2MlhvUFBUVktQNVp0RGFpTW9JcENVTVh1dDVLbFI1K2FhU3NvZnRV?=
 =?utf-8?B?Q1JwQVBibWE2MHk2bEZkazA0VmZnYTFKSkw5bmI2UjRVNmhVeU5VWW9BRWhJ?=
 =?utf-8?B?by90TTdBN1NFSkM1RFk4VUxabzhlU1BDMVdNZERlZ1lVVlZ3T1Jabmo4VGlt?=
 =?utf-8?B?SUl0YmhrK3dvRW1kUWlaUmZjR0ZCRDVZU2M5YWJZMWg2WUM0MHdtTUh3bVVa?=
 =?utf-8?B?a0JXQWNLVVJmU1F5cVpKZS9Sc0EwemNJblI2ZDdBU2lUVm5NdEUwNHNqcDZC?=
 =?utf-8?B?amtjaFRDdEN3Z2VVQ2srYXVyZUdnbElmOGJ1VjU5eVFhUEkydG9NY0R1RjdD?=
 =?utf-8?B?QkNoQ20xVnlSaFRoNC9IMkMwdFlrU3lQbzNldGJqdEhXV2pnNG00WjZGZk14?=
 =?utf-8?B?Z0lzMXNpUElxbDFqd21UY2lRWkM1MWpTSzdtWitUazVMOWcxMHJXclUxOTcx?=
 =?utf-8?B?aHlZYVQ3V010bFptWEdDWTBpTFNtNEk1eFhTdUJTYkdKQS9jV1JRU0IyZE94?=
 =?utf-8?B?STJsU25ja3h6T25PdEUwdFExWUt6ajRxbko5d1dJMzBtRFdwNHcxTzdUMG82?=
 =?utf-8?B?cVJ4RjlSdkpaN1kvRGtJdWhNakJqcGdjOS9QRDIzV0g0OXJhM3dpZXBxdnFq?=
 =?utf-8?B?VnVUNHZOb0VnVENKVXV5UFhuYkMzYnVuL1lMSHpHdnFxVVZtRWNSOC9kcHJJ?=
 =?utf-8?B?WTdYT1kvQmlRUmJHQ0xjMjc4MExrVjZvTXFJeS9qQjNreTJ1eHoxeVRxR1Vw?=
 =?utf-8?B?TWZJZjRKejJEa25NYldMU29ZeDBIc29TcW1zY3ZJK0NCY2JVdXBaL0QwNFEz?=
 =?utf-8?B?RjNxQnlTSk9jTDlnbzl6NlRUeFF5ZDVTdHUxU1R3ZldIWk40M3V3b2RRbDJZ?=
 =?utf-8?B?b3IwL0dvWmdWbmdWRGZNblNiV1lVaStyZ0NHcktRZ2tWc3Z6aUNJQzJNelZ6?=
 =?utf-8?B?YUVVVnVCWWNXWFFCSzlKQ0o0VXJxUnRuU1AzRDMzM2c4U1dKY0JnT0JHdUFr?=
 =?utf-8?B?TUtySlhnYWhRREdnblFtKytQdXhTbXk1cW45UFJEbHBvZkUxdnpLcHV0dklJ?=
 =?utf-8?B?ZXRLTFhFdWtHeTJnc3owakFsRVRXcEl1VEthcmtKbUpNNVpuUUcxS3FtMEs3?=
 =?utf-8?B?YnpMaDNrWEdhMFBldCtuRWQ3VlFNTmNyVlFYbHptN3ppR0NNUVE1MkpGRmZx?=
 =?utf-8?B?ZGtFTUdHbnBMRWRzZDFieWV1WW5KcWJXQjRodzI0amI3cnVvWVNETDdqYmEx?=
 =?utf-8?B?TGNrY3hBR0VsVXU5TTJLSytHSEdqTmp6bW9iWk1INno5VVZxRlJpcERVQ2tF?=
 =?utf-8?B?RDhjbGNjSC9yWCtRM3JseGRlTzlaNDFLdnZHNGswTHdUQ1ZoK2ZJSytWUnR2?=
 =?utf-8?B?WGVsclNHTDdhTzRqVFdWNy9EQU5MR0FualloQ1A4Sy9ubGpUbFBqRUE4MXNP?=
 =?utf-8?B?RVhHdUczSityZ2d1YjI0NGduamU0UVJrM053OXd2U08yWXlYMXlKc1krT2x4?=
 =?utf-8?B?NEJvY1ZhQzZnODNlUVRVb013c0xybGZGOGx6eEo1SlFUb050aU5kRDMzVDRj?=
 =?utf-8?B?V1czd1kyRmtnNTMvOE9BRDByWlkyWER6cE1HekVLV1lKVVdIUllnWDF1M0VB?=
 =?utf-8?B?UmxUcHUwYVZGT2Q2QzJXb3d1dnh1RGJyQ2tnSlhDYUM3V3pJbE9pUTljOStS?=
 =?utf-8?B?Y2F6Q3R6OE1SWFpzZ2hreHJaTjVZV2krQ3pmYWdmT0ZxTWlkR3hTNmt2ZmZG?=
 =?utf-8?B?Z0ZtOXQyWXBRTzZKbXVEY3BmNm42WGNOMzlGcWpPWk1tZC9VbytZVjUzNXpB?=
 =?utf-8?B?aXNydWY0UUVMdlp2NTFqQVRrVEJDRnhFL2hIOWF4UEI3MWM2NUZpYmJxcjBp?=
 =?utf-8?B?VkJjbmhvNGphTFF5WHllZG9JZW53aGFHMmpVYzRVSkE1Q1hjUmlKR3A2YlB3?=
 =?utf-8?B?NlBSdS9Pd2M0MkJWemF5eWpVMjNKZlVMN0pIT3lKNlhtcUdWcU1PeTF1eU5Z?=
 =?utf-8?B?emxUNjJvc0NNZHJqejdQZ2t3YktPRnJBVkkzRGVsYXQ4WFJpZDRySFQ2bk5u?=
 =?utf-8?B?U3NTb0cyNmNJTHIvdFh0c2lTUXVsWXVlWUdOUkgrcmpHSzVPS3AwSmdOeEdy?=
 =?utf-8?Q?Ua5DUQRdsY+8FR1mfEYmq2w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <832D6609FF9BBE469A52FF3D4F0B9909@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab666cd3-d30b-40a5-cf0d-08dc0bb9f274
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2024 17:40:44.3843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hl+kOz0c5eUm7/lUU0hMei1I4e1xigfJ2krMD9pnC9liXjtMbEFgUEyFHnr0UMD4125Z07oV1sH1rfnCoBZkcvWaX4TwFA2zkf13sFw7H0KSh7YG0PcK9QJheR1Wdx/+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8025
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
Cc: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTEyLTI3IGF0IDIwOjU1IC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBUaGlzIHNlcmllcyBpcyB0aGUgcmVzdWx0IG9mIGRlYnVnZ2luZyBpc3N1
ZXMgcm9vdCBjYXVzZWQgdG8NCj4gcmFjZXMgYmV0d2VlbiB0aGUgR3VDJ3MgZGVzdHJveWVkX3dv
cmtlcl9mdW5jIGJlaW5nIHRyaWdnZXJlZA0KPiB2cyByZXBlYXRpbmcgc3VzcGVuZC1yZXN1bWUg
Y3ljbGVzIHdpdGggY29uY3VycmVudCBkZWxheWVkDQo+IGZlbmNlIHNpZ25hbHMgZm9yIGVuZ2lu
ZS1mcmVlaW5nLg0KPiANCmFsYW46c25pcC4NCg0KYWxhbjogSSBkaWQgbm90IHJlY2VpdmUgdGhl
IENJLXByZW1lcmdlIGVtYWlsIHdoZXJlIHRoZSBmb2xsb3dpbmcgd2FzIHJlcG9ydGVkOg0KICAg
ICAgSUdUIGNoYW5nZXMNCiAgICAgIFBvc3NpYmxlIHJlZ3Jlc3Npb25zDQogICAgICBpZ3RAaTkx
NV9zZWxmdGVzdEBsaXZlQGd0X3BtOg0KICAgICAgc2hhcmQtcmtsOiBQQVNTIC0+IERNRVNHLUZB
SUwNCkFmdGVyIGdvaW5nIHRocnUgdGhlIGVycm9yIGluIGRtZXNnIGFuZCBjb2RlcywgaSBhbSBj
b25maWRlbnQgdGhpcyBmYWlsdXJlIG5vdA0KcmVsYXRlZCB0byB0aGUgc2VyaWVzLiBUaGlzIHNl
bGZ0ZXN0IGNhbGxzIHJkbXNybCBmdW5jdGlvbnMgKHRoYXQgZG9lbid0IGRvDQphbnkgcmVxdWVz
dHMgLyBndWMgc3VibWlzc2lvbnMpIGJ1dCBnZXRzIGEgcmVwbHkgcG93ZXIgb2YgemVybyAodGhl
IGJ1ZyByZXBvcnRlZCkuDQpTbyB0aGlzIGlzIHVucmVsYXRlZC4NCg0KDQpIaSBAIlZpdmksIFJv
ZHJpZ28iIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPiwganVzdCBhbiBGWUkgbm90ZSB0aGF0IGFm
dGVyIHRoZSBsYXN0DQpyZXF1ZXN0ZWQgcmViYXNlLCBCQVQgcGFzc2VkIHR3aWNlIGluIGEgcm93
IG5vdyBzbyBpIGFtIGNvbmZpZGVudCBmYWlsdXJlcyBvbiByZXY3DQphbmQgcHJpb3Igd2FzIHVu
cmVsYXRlZCBhbmQgdGhhdCB0aGlzIHNlcmllcyBpcyByZWFkeSBmb3IgbWVyZ2luZy4gVGhhbmtz
IGFnYWluDQpmb3IgYWxsIHlvdXIgaGVscCBhbmQgcGF0aWVuY2VzIC0gdGhpcyB3YXMgYSBsb25n
IG9uZSAgOikNCg==
