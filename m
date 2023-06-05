Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7802872318B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 22:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFD510E050;
	Mon,  5 Jun 2023 20:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354F210E050
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 20:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685997687; x=1717533687;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nLeyKO5KbyNGYoShhq92VBHL9eKUI+Y4YV+l0tTVIPA=;
 b=N4BICY8pSxc8IisraDBXKgBS6MOj8g2obHJqIP7mpQvdOWg/tvWW92zb
 fxPcvmh++Fw9pCjamaQefWUOwaXl8HFjPjn1SCX7mAeLrLPm5a+XF9q4i
 jyHAqknXvHFI37+a6s39k1H37zJpB9E79ZDvR6+cEWGxRQROb+rI3yANP
 GQq2YgSiJHhNNGdBZuc2nHDiN0J/YE0vNfYnc0ZTq78/8+NY/wlpuNJdK
 gmttWqwBugmrb7f7FlSJhn0rpi/J0YShN+VPrFuZ7M+MalG2iUG5tdXUv
 UdbN6DnsVQudHTaAiAjEnlJWeUiiap/CSLpmqZClLdxaHvmsnn/Lf5OjV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359793191"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="359793191"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 13:41:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="821313801"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="821313801"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2023 13:41:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 13:41:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 13:41:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 13:41:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQGkKoHXWyby3mRhlYw6/ALOc7cjBmLPyaAsJeWULkQNZunpTyDSUuBIEA2wSRY36CPEE/Ia2TT9PpdhvLyqpD5rmyiMrhW8efiybWLbaP4vKaZJI+iYnC2YTpX9GmC5g8eYMZ8U+4p0Nyw1ntTPQTn5UPPfe8oDFhykh4jbggTw0nMb/gWNHrmk5ITFPGk5AQLYtkciCrGdXbQQHpqCp5oGQXY+PWi77jqbO7TNjtmiXGO9oIDZijIGGU6xRw5rDXBpJIYlGvyiWkDJRyQrSFSSa4YUEdoGC0h8g5DgbCPEF3RGOiYSUd621eBw7fFEwg2Yw5HfADTb21QE/BZmbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLeyKO5KbyNGYoShhq92VBHL9eKUI+Y4YV+l0tTVIPA=;
 b=OOC7aXosZI/vJEvecrazMK2wqj7dCL4nkJVfflFYstfKgF6vELrq6/R/Jp8iXSaHPzjxJNFu4EJH8WxP1JsDx1JYldDr4VumkyrGhp+g2l4OG744P1OexVEFOn+SfmD43oSK8R0fD/BeWmsKy2Js7pQVn6WOAgL9y0s6fGE9hSBj7czQKJbww+2zaU+wEIOWLxDDKnVU/NzUzomSAqw1pGvDSgH4wFGBgcPhd+nFuqKDBIjL7SUXovMD1s04twFsu8pnBlZLvz3Y114j9bj8tkbIeeFbOjwdFnUFQXerR+hpWuSdNEB0FD9Z7lwZaoMQ9d3YZKWAJif1hPYtBo9VUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DM6PR11MB4705.namprd11.prod.outlook.com (2603:10b6:5:2a9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 20:41:20 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 20:41:20 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH 02/30] backlight/gpio_backlight: Compare against struct
 fb_info.device
Thread-Topic: [PATCH 02/30] backlight/gpio_backlight: Compare against struct
 fb_info.device
Thread-Index: AQHZl7zgyIG+qRqVTUyv8ft4ggwl5q98pi5ggAABa4CAAATxQA==
Date: Mon, 5 Jun 2023 20:41:20 +0000
Message-ID: <IA1PR11MB641897CDCE208910A9F88607C14DA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-3-tzimmermann@suse.de>
 <IA1PR11MB641847841A33FE16F9B96BA7C14DA@IA1PR11MB6418.namprd11.prod.outlook.com>
 <20230605202307.GA452402@ravnborg.org>
In-Reply-To: <20230605202307.GA452402@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DM6PR11MB4705:EE_
x-ms-office365-filtering-correlation-id: c913af04-8d4d-47f9-975a-08db6605383a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PXcOQO5r5zVEH72nbD1cVwKt5CJnL4cfM7agKZua3xS9Jbaw7mf09Ve+zbh3cC+VeLBdqGt14e33tQydBJALHAqwb7ZNdzcx1Svqc+GkzWuh3wnMOejjxt1I3eKiGNiqqcWFZZFU/ZqUqFrdKmhsc7NrtYGBU6XVYmTsfAPm6dVfAdahDfn9fmFHfql6UwfmWRCCL8626f5zFF7R3hpcw2+hPXY5tMaYKWtXwhxF+gZuH66EM1sSH9Rrvm5WItbsXTuy9R8HSqh4yb9pLTX5mRJA0REgG8a8z09yZ1+WxKec1lzxy09+2W+8wWGCM8AZQCgp3jwolytFO2FyHj14ZZ9cOkIbbnBnfLOaW5FlatBA6FXjQWogQHyxBlHWDYwUJbVWNjwjCZEDIjbw9T1eSvH2Iz9iYrpyD1U6xgWFE0mj9qVKjke3yflkB9CMSfqlaU/OaAYAEsueQlAQE55D0IS3T+D25zlHeZ0OU+3n8eRzeJLtXo2CyS2vqd9qcC8HMR3nSzpeEZ3uAnSk98y+iftOcr4jvxESdZiZBfDrzw+KxUu+X2j5Rkj+4UAZGCCG37xVRAcQSLj4U3PmsoaHxivTUyGZO67TlDSURFhESYrns1DmQj/pQy9MkdKJH7I6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(7416002)(6506007)(26005)(9686003)(122000001)(83380400001)(2906002)(186003)(33656002)(55016003)(316002)(5660300002)(86362001)(52536014)(8676002)(8936002)(38070700005)(41300700001)(6916009)(64756008)(66556008)(76116006)(66946007)(66476007)(38100700002)(66446008)(82960400001)(54906003)(4326008)(71200400001)(478600001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmJtZThPVTliODZKbFVxYVZoTUpKV2JOZ2Jrc3daUzJkK2dOTllKZ1lMTUls?=
 =?utf-8?B?bzVPWUhSb3pGbzllNElNUzA0ZlA4cWNlSEJEeHNFNnF2cnJ2bkxRbWFadEhY?=
 =?utf-8?B?ako2VFdVelRxMkw5Ni80eU9ldS9tTzhmd3ozSUxPbk9GVFNSdjQ0c3h0Z3hE?=
 =?utf-8?B?cGxTeE93U0xNQUluOEY0bGJNeTJJOGJjSXBtamY4OCtISmxKdG5ZeTk5TDRj?=
 =?utf-8?B?eFRINVJkMkRzZXNOeVNrWE9JYzhYK1JSVzN1eTJ2Ymh4Z1VWbm5ROGhtUEEw?=
 =?utf-8?B?VVE0Q3dOSzgzZ21TOEZZbWRQeFB3VEc0Z3RhcndyRXZ4Y2pSVFhhZTMxb0pT?=
 =?utf-8?B?Znk5TTVDR3RhN1hybUo3eU5hVjZnMVpZSkV1K0JaM05NZERKYkMzSk9OcXU5?=
 =?utf-8?B?OUFkYVhoYUtPTWxtUEhtS1dmbjdwTUh2MW1LZ21LWi9aTW5RcXdnOG5WZVpE?=
 =?utf-8?B?L1N2aktIdTZtRnJQbHpPMGU0TU1MOEphNGR0Z3J6M3ZGT1lmZVZvdjlXczFQ?=
 =?utf-8?B?V2pkSGIwbFVWZjF2Sm9PNGNxT0w2MVpXczVlK2cxR01YcXhVMzluTWhLaUc1?=
 =?utf-8?B?cXk5SzJqL3VBM2toZFplbXozZStSZHRsMXcyRVVOZzBPaktxQUd3VkxNdys3?=
 =?utf-8?B?dEtXVDNWSnJsYWJHQkJYdDErU0xsYmtLcjRaQXhBSHNWZ2M5TmRYNjFNSjVH?=
 =?utf-8?B?cWRYZDQyRXA3Z2UrM2VxbzZvUTFPRWNudkt0WmNpaFlnbVl0YW1BYUY4Znov?=
 =?utf-8?B?aW5SUDBhbUFSdHRNTzRaaHVnV2NuS25WTWMyR1dGMXgxYW5RSmg5cDlXYllx?=
 =?utf-8?B?dEpybWJhRkdZeitjZ1lKR2gwYTJ2bHVIWTI0bkRpNFVqc09UaHF0ME5ZSjJU?=
 =?utf-8?B?NElTcU80UXhJbFJQYk5sdTIyeWVucEN3UkZnaFBXSEN6MURRMlVqU1JBR1pN?=
 =?utf-8?B?MW8rNE1EeTJHVWtQQTZEK3c3SCswNlFFTlp1NUJJZ2wzR0s2eUFTYkNCWjhP?=
 =?utf-8?B?L3lJRmhSTEFzdW0rSlUvTDBCZVgyM0FLY3oxN3hwSGhwZHhLQVBPZG0veWJw?=
 =?utf-8?B?YVZLYzV4UmsrUTcxQmJOazFRWkVzRDZoV1lCYS8xUk9XcFQrdElUS3YvZmkr?=
 =?utf-8?B?KzRFLzMwZEhrRlRUbitUalJ3RTBBN0NESEwvQzR3NENpMVBsYk9YMWh3cU9F?=
 =?utf-8?B?cFJHZXYzQTB2YTRCN0VPME9sLzdBSEVpckVIVHpwMXhMUzQ1NUVQdHVZa2lU?=
 =?utf-8?B?T2dXYVZRZGZHUlh0RGNxb2NhaHZPRmNKdTJReExWNFk2VTd3MVFiWEhXMHBP?=
 =?utf-8?B?RkZnQThraGV3azBKbGpodTk1MWJjRm1Ia1psbDJHb1ljSWdvT2hvRTFOYkpW?=
 =?utf-8?B?MGtXeUNuSzEvSkp2WWdZUlJRYTlQaUwwaTVieVBnb0ZVcVFQZHIxZVE1eWRp?=
 =?utf-8?B?WGlWUVhhY1hBZ1c0ZncyQ2I1d3RVSnBmWDBaMVJxWFc3TEFXbm1hUE15ZnIy?=
 =?utf-8?B?YVFLMTY5c2J3blJ4OFNqTzZkUzBkdGtjUTBZYm9YWGY0eEN6RlMreUNVc1F1?=
 =?utf-8?B?WlFQRWJLQXNBWTBhZUlHOVY2R09WWUxmYzRkZHIvRzN5USt1WGJzekJOUE5q?=
 =?utf-8?B?dFhiY29NaVVFYklXZ2tkQzRqRS9zaHMybHBXQ3dQZFQwTk8rTWhUaWxEbG5t?=
 =?utf-8?B?TFRIT2tWOEZ3Rk5oVDlyOHZmRzZ6SFEwN29Jc1JlRE1aL1VEL0dOa3pOTmFP?=
 =?utf-8?B?V1d0aUJWVG9KbTFhejZlcGp5dXR1WVFwOEtnVTlQSFFCcTlpZ05tNDBWdE5M?=
 =?utf-8?B?WjF3WGNWcE5mRWJhS3NOQzR4STg1UVdDa1lpK1JESmc3ZFp1OTdIL3VyakJU?=
 =?utf-8?B?cUpGRTN1Wm9mcU9jbE9XeGtPcEFBNmZ0UmFnMm9aeGJWNldtcWVISXJhdHE3?=
 =?utf-8?B?SDdyRFZRa3EzRUdmSTZ1T2Y3N082RFFRMmJWQWZjSHdRa09aekhZL0sySUpO?=
 =?utf-8?B?QkhTK2dFR01wYnRzQTFKTVpFV1dmRGErL3FGc082RFFjWWk5TVhZNmZicXdK?=
 =?utf-8?B?UmdGVzNYeVA3ZjNXcHpaeEdFaTNPUXZoMlFpK1A0RjlBbHdLbEJ5YkpHRm96?=
 =?utf-8?Q?gBZFeBj7uvoZ/4IPo3/q/aX6T?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c913af04-8d4d-47f9-975a-08db6605383a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 20:41:20.7285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CrtSCx3AwiVpTH1wvf9uPfG3hLPxwFDG6VeY5NKnHMEj1vaDy2bpfYJPwlfuuY0VY3cJzWdj27+JLmhCTiVVWj6Ma3KknXAlQkLIxLgL6VM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
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
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 Rich Felker <dalias@libc.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "lee@kernel.org" <lee@kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, John
 Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPg0KPlNlbnQ6IE1vbmRheSwgSnVuZSA1LCAyMDIzIDQ6MjMgUE0NCj5UbzogUnVo
bCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+DQo+Q2M6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPjsgZGFuaWVsQGZmd2xsLmNoOw0KPmphdmllcm1A
cmVkaGF0LmNvbTsgZGVsbGVyQGdteC5kZTsgZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU7DQo+bGVl
QGtlcm5lbC5vcmc7IGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnOyBqaW5nb29oYW4xQGdtYWls
LmNvbTsgbGludXgtDQo+ZmJkZXZAdmdlci5rZXJuZWwub3JnOyBSaWNoIEZlbGtlciA8ZGFsaWFz
QGxpYmMub3JnPjsgbGludXgtDQo+c2hAdmdlci5rZXJuZWwub3JnOyBsaW51eC1zdGFnaW5nQGxp
c3RzLmxpbnV4LmRldjsgZHJpLQ0KPmRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSm9obiBQ
YXVsIEFkcmlhbiBHbGF1Yml0eiA8Z2xhdWJpdHpAcGh5c2lrLmZ1LQ0KPmJlcmxpbi5kZT47IGxp
bnV4LW9tYXBAdmdlci5rZXJuZWwub3JnDQo+U3ViamVjdDogUmU6IFtQQVRDSCAwMi8zMF0gYmFj
a2xpZ2h0L2dwaW9fYmFja2xpZ2h0OiBDb21wYXJlIGFnYWluc3Qgc3RydWN0DQo+ZmJfaW5mby5k
ZXZpY2UNCj4NCj5IaSBNaWNoYWVsLg0KPg0KPj4gPg0KPj4gPkZpeGVzIGEgYnVnIGluIHRoZSBi
YWNrbGlnaHQgZHJpdmVyIGFuZCBwcmVwYXJlcyBmYmRldiBmb3IgbWFraW5nDQo+PiA+c3RydWN0
IGZiX2luZm8uZGV2IG9wdGlvbmFsLg0KPj4NCj4+IEkgb25seSBzZWUgYSByZW5hbWUgZnJvbSBm
YmRldiAgdG8gZGV2Li4uDQo+Pg0KPj4gSXMgdGhlcmUgbWlzc2luZyBjb2RlPw0KPj4NCj4+IFdv
dWxkICBhIGZpeGVzOiBiZSB1c2VmdWw/DQo+Pg0KPj4gTQ0KPj4NCj4+ID5AQCAtMzUsNyArMzUs
NyBAQCBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X2NoZWNrX2ZiKHN0cnVjdA0KPj4gPmJhY2ts
aWdodF9kZXZpY2UgKmJsLA0KPj4gPiB7DQo+PiA+IAlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdi
bCA9IGJsX2dldF9kYXRhKGJsKTsNCj4+ID4NCj4+ID4tCXJldHVybiBnYmwtPmZiZGV2ID09IE5V
TEwgfHwgZ2JsLT5mYmRldiA9PSBpbmZvLT5kZXY7DQo+PiA+KwlyZXR1cm4gIWdibC0+ZGV2IHx8
IGdibC0+ZGV2ID09IGluZm8tPmRldmljZTsNCj4+ID4gfQ0KPg0KPlRoZSByZWFsIGNoYW5nZSBp
cyBoZXJlIHdoZXJlIGluZm8tPmRldiBpcyByZXBsYWNlZCBieSBpbmZvLT5kZXZpY2UuDQoNClll
YWgsIGFmdGVyIGEgZmV3IHBhdGNoZXMsIEkgd2FzIGdldHRpbmcgdGhlIGlkZWEgdGhhdCB0aGUg
bmFtZSB3YXMgdGhlIGJ1Zy4g8J+Yig0KDQpUaGFua3MsDQoNCk0NCg0KPglTYW0NCg==
