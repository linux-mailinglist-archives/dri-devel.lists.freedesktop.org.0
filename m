Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464C45104AC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA0710E8B5;
	Tue, 26 Apr 2022 16:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A528710E8B1;
 Tue, 26 Apr 2022 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650992026; x=1682528026;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ofFX8yz7UIGTNctbMZ8jjLrfI6BWP4lf9lpTed8eYg4=;
 b=Te1Fjt0SdFrHpu53+Cac9u5ClhOpusdYZXEN5xqysL/OG5rGxfBQv2vq
 /UnlIlCe8MDY1n9uzxt/NlgJ/27NOLbxYe2fxhmiFOCpFzQ44SHEsRyuG
 nTzYmDVTS55SJ0sWuEQ1bVkkIv34QqVM9jNqoxCMybtiOx4jyI9TX+yrV
 xT2iMEWCC0LbAfmflBcIgCt3aRgRXQNPUdnNBZsz1w9UDAVn6C5Rh3wbZ
 ag82qyHdSWVQSwqRq7zPBqjlh0PPYjYUfxaS5i67Ad4WkJZs606m6QDb5
 4GHGvfFNpp5RDNYcGFe++ioSE5VmRzzAd62bQhzE2wTNV+ZSrsrK1oJ2M g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="265175597"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="265175597"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 09:53:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="513251720"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 26 Apr 2022 09:53:46 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 09:53:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 09:53:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 09:53:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtilMg4ZlJ1DfO0Ub66HfRBstrGqQRUIot0ikJd2wD57t1fiXWRbB3zE8wPwgRKtjcH3CjEudCnmVB5t4K8/aYWepPszauZxkK5j2NRVvVRodbWXZW0UwfZE/F5pXkTmDtabPJcmPEJsPEtf1reyKZC/Cq/01SPpl5P4eIlsNlK6qJiZ1tedI2dNOtUsrmxjhtU4udUlvLxwvPtBx3YPWZu5UuFVFerI6Z/1Tjv+ME6C0BlVk6NDsET1x+yfD1wsNY9yj5WY/Ct5v+oANP5zItw686WBUTIAun2D7Rzt0vLJcC5MGnP5vwXAIYtV4kEm7clv1CWipyF7b9j+hjWxzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofFX8yz7UIGTNctbMZ8jjLrfI6BWP4lf9lpTed8eYg4=;
 b=OemsclLYaBt57V00fLjjWeesmVRCeN9lQpZocIq5i1iEJAagCXPDF0boPk0hrBVzYhT7VTDQHRWzc/AviYP0MFBiYS9MAEC/GHMYFbL/AoJt8Bk0mDdUgrYqYUVLGFGEli31Tdhi3rVKAFe1uto04eY35CCImmNI2PO4fca8wJZozyEexrfoNcDhm/oL0rFZjqlg4eWWqMJ4pQhfuhGdookCFnzmQvEfxfVuxxDkJEuSJksLcDBlgxj5ULGob2X9XkKG+I7nY2EghFQAcw2BtFgAbEAk6e0Bd95mfi3W3IjE9K9Rps/YFb9JQv/IMevV5sco9U/ZFvtMFa9cAvST0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4204.namprd11.prod.outlook.com (2603:10b6:5:206::19)
 by DM6PR11MB3834.namprd11.prod.outlook.com (2603:10b6:5:137::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 16:53:43 +0000
Received: from DM6PR11MB4204.namprd11.prod.outlook.com
 ([fe80::e984:2d9:5a2e:a110]) by DM6PR11MB4204.namprd11.prod.outlook.com
 ([fe80::e984:2d9:5a2e:a110%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 16:53:43 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/3] drm: Add infrastructure to allow seamless mode
 switches
Thread-Topic: [PATCH 1/3] drm: Add infrastructure to allow seamless mode
 switches
Thread-Index: AQHYVbTmXuO+sYOyNEmtmvab3ghfaq0CcEyw
Date: Tue, 26 Apr 2022 16:53:43 +0000
Message-ID: <DM6PR11MB42047B32244DF1844FD7DC9789FB9@DM6PR11MB4204.namprd11.prod.outlook.com>
References: <20220421192205.32649-1-jose.souza@intel.com>
In-Reply-To: <20220421192205.32649-1-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc45e454-7296-4e48-9908-08da27a55282
x-ms-traffictypediagnostic: DM6PR11MB3834:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB3834E184688062830855CCFD89FB9@DM6PR11MB3834.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nej0ykSD5Rpp4PhaDgR1IDMjJBOH8iY4j4Ug1tAl/tARNi60Smue3iXSGWI0KRuysxGmn1gkWJ408u+AMFnIjY2tu4QbJAP5dAegf8I9ECQwgQrrrbInka8SuLlJTdD2mspaHUsDsQQuOmfY0Y0wbu5bwVTSskJObeEpCZveC8EmcS5qt/2P4FORDq6GQh4OrkYufzAjjGXBn18+z8jLtCCqnwU7J+UHqm3zssGkJhatpg4yMhIj/TKlPAsavkD+RRM2DDF+yahqzMGyXpO62eyzVDFG93LbMYV9+AHAkIJZsqb7scB0cxkorauw+vgQ5UMnlLXsLef0qf84aBmTJ8eSVegRTdw3IJwyQ0k0FmhKqP3/ym0XU526QYw6lUbqyZSugc4ujdwdjuWqZT6vu+8VzqERFT3hRftK0yUMVL69w9DR9srtRhDrCeTvGk4LPyfm8jf1NwpszqvNm3vQS/0/sXFQevvPFGgLFhIra7EmmTVNhu71pWpYFd4fNjOxxcWJpzm6A8ECvulSQWwTeajOWw0d7zjRetOzSHfLRgR+PhON7k290yj+N3R7WegdnDBFbgARBKGznwMldBAQStvRszhLx6cBDLQZxbI6CoUC90RlOM4yw8WhOKDpmHGN9ja1NvgxFjpOB7qmF+eTJ/rU5mQbdnmhWnrWDuSM3PYx4hhSUWYzpxviboob8ugPMTgeZsxgVsLE2yogeKPhsw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(66946007)(26005)(2906002)(122000001)(54906003)(71200400001)(83380400001)(186003)(110136005)(52536014)(7696005)(6506007)(86362001)(76116006)(9686003)(8936002)(33656002)(38070700005)(38100700002)(55016003)(316002)(66574015)(5660300002)(508600001)(66446008)(53546011)(64756008)(66476007)(4326008)(66556008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y092SkFLN0UvbmZaazVVSW1nYmlGMFhHNDluOEZiZm1MUHVsaUJUb1g1K3B0?=
 =?utf-8?B?TjFyME4rMDlHTzRWNGpwcG00eHYvWXZmZWRGR29xSHh1WThOTmZUcjVPOWJv?=
 =?utf-8?B?cGo5N242TFZnSnpibmI5Y3Z5V0FHMUs5QzZaV2YvM1pIRkIreDU2SUlxcHZB?=
 =?utf-8?B?MzFja1dCSlJRYS8vRmhMbUdFZHhuYy90TW9sdGU2dm5kU2hMcUlkcllJQVZB?=
 =?utf-8?B?Si9SaWFaM0VpN1JXTTAyZ3ZFWVNzbkJYU3g3TFJHWTJadDFyUnQ3SzJ5Z1FU?=
 =?utf-8?B?QkF2MnQ0azR1N1l4eDVoelNEVUVkaW83dW5waS9ST2ZnSjdnMUwzMUNyTG4w?=
 =?utf-8?B?c25PUWtvN25KYWE2VGtKV1pQcks1TEF5ak5na3FRV1BNUFlXeUpEdTRPb3lm?=
 =?utf-8?B?bitjMDlDZno3THZuSDFFY2ZvNzVkRkVVOG1nL2w0Tk1SSGtLNDZCbWpSWDk3?=
 =?utf-8?B?NDkvd3UxWkx1a3JiZTdrNHFsKzhNVHdyZmIwVnFOZkw0VjFUcXNLTXhEV3NH?=
 =?utf-8?B?ZW5PRE9BQTdBblFzeGUxbGhXcloycWFLSlJ0TS9pbjA0dUtxNmRYWWJxYldj?=
 =?utf-8?B?SlhuWmpQU2tuZHA3RS93L3NaZlpHa05BTHlOMzNnWGszWDBPcnRlVmx6VU5P?=
 =?utf-8?B?ekNySFpGS3o2Vld4Zk9rdmVuTUt1Q2MrN0FHclAxd2l4ZG1mTjdTWnFYY0or?=
 =?utf-8?B?TUthcUIxZWgzK3c2NlVsZURpdXo3dFljVlFTSnhLV2xoemNjZUZzcDg3UCtp?=
 =?utf-8?B?aTAxZ1R0dWdIZVB0d2gxRnk2VVJ3TE9xT3N5dEZXQmhBbWdDbjVtbFlnVnJ0?=
 =?utf-8?B?S3JQdWYyYldOclRTMmJKMFkyTXZZd3Fsc3JRenN4WmRVNHl1aWsxVlhhQWlI?=
 =?utf-8?B?eC94b0JxQ0lvMG9WK2N5VGJQc21IcXN3QzhveTBKbjNKVFlUeDJISXRpdXdN?=
 =?utf-8?B?ZzU1cmNLcFNSVFRRQjF5ZDdkNkNROGZpdmlqcTdHNE1qVXhZNmU4ODdpOGpj?=
 =?utf-8?B?ZVNmRnM1ZjB5OU9XT3JkYzVNb1QrRlUrajd3Ynp3bDVJcU1leXJST2l5a3Mv?=
 =?utf-8?B?S1JwVjkraVoxVXA1UlYrWDFJWEgzSDVTYnhqdEpHNlg3eXlWc28vZVZCNUxE?=
 =?utf-8?B?aGJwdEpwbmIyMmNhWGUydHVpcmNkbjRPMXc3bnVWWTh4TkMvbTV4c2dHcW1U?=
 =?utf-8?B?dWVUYjJ6dlZzblRYRGtQTHBrR1FzanIxWXp1bENaR2Q5S01vQ2FQeGxFcCs0?=
 =?utf-8?B?aUFBeEovZHBQOFpZSlVCQTFuejR6UHdBRWFLT3lvOTEvcjRwTWUwUVdJc2JN?=
 =?utf-8?B?WHZETVM4d1BxeHg0YU4wMVl4S2FrTmp0Z24wcjBDZXU4c0NvVVVNOWZQYndu?=
 =?utf-8?B?NkpRUStMYXNKamNIa3FjOEUzTFNrZU1wdlVYKzhlRzlkeTh6a0w5WndqK1Bv?=
 =?utf-8?B?ajIybUtUNHJpS2VLUkUxMURtVTViZnJhQVpVYmhOaCtHYkJRVU14ZUNNdkNS?=
 =?utf-8?B?N2tzeXhkZFVEcVJqUW5pT1FtQjBHVFNRKy81TUhoUUpLV2xhRTk2M0tqbVJv?=
 =?utf-8?B?cEYvRGlHQ2kycXkxRmRsZHVWaGhEM0xMQVdleWJSbGJZL3p6NjJzdEJocE9L?=
 =?utf-8?B?Vy9QUGtVbzNMQldnbXJmbTFPODV1d0d3SC9ZcWlJenVXeFhZRzl2K0l6OSsv?=
 =?utf-8?B?SDRidTF3cTg3dHZxeVlMQWZEcjZaMW5MZ201ZHkwb3phb2RpUUx4b01KMnBy?=
 =?utf-8?B?TVF6RGh1dUV6MW5sUmRaQzI2ZUR0ZWlYOHllK3NuWkVaSlJwMHZSRGZXYVBr?=
 =?utf-8?B?L2VqME9sYlpwQWIrYjZwaXVZS2tlYXNUWmFoUVRDbWx6VzRCQkZuMVdqOUVa?=
 =?utf-8?B?a0t4eC9rdWYzbEtiZ0U5dXFvMmltOExEajkvdm9DVlhCdXBkS2lHNGpYOWxl?=
 =?utf-8?B?S2M5L0x6TjU3Nm50OFF3cG0vY0FxQXU1RzJUSlNRbjhSSFRkajhwWGhGSjUx?=
 =?utf-8?B?WmxoRWh0Z1FIV0ZEUm9vajJzaC9yc3dNOXgzRUVmNG9GZGw1cXJrRFhJMWRz?=
 =?utf-8?B?OGxXNGRIOXhIeEIrL2dJZVF4SkJIN0xzQXB5TTNnYTVUSDNvdkJDcUF1em5z?=
 =?utf-8?B?Qi9SN2NhQTBQS3I2a3loRmpFcGxxWjZWODlKZmNQaGhUMXR6dkJwMGpyYnZZ?=
 =?utf-8?B?YkVMWk11WThnTmxya1RWNDRtYmZGT25GallLWXJ2ZkJHcFZMTXJhRERzcHpT?=
 =?utf-8?B?aTEzMnljQnhVY0I2T0VRNmFOcFJPZjV1ak1JMkhaK3prdlA0RFpPRGZOK2dX?=
 =?utf-8?B?QmdIMlBySEJWajNmN2FHQXovZ3BWNGU3ZWRCOTBkR2Ywem1RdzEwbDBGZHZU?=
 =?utf-8?Q?X+5DbtPL+BYh7nHQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc45e454-7296-4e48-9908-08da27a55282
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 16:53:43.3255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P3FIpHMN9c2wBi/Vpv0RCNN+i/v/FoyrWRUHgNpD7P0Q+L8StNyVU9h6rjSZfeT+pb5ZbDbgZOg98sgjGeehme4ZCZ6zRnFPFl3OscfbQbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3834
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
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gSm9zZSwNCg0KVGhhbmtzIG11Y2ggZm9yIHRoZSBwYXRjaC4gSSB0ZXN0ZWQgaXQgb24g
Y2hyb21lIHN5c3RlbSBhbmQgdGhlIHBhdGNoIHdvcmtzLg0KQWRkaW5nIG15IFRlc3RlZC1ieS4N
ClRlc3RlZC1ieTogVmlkeWEgU3Jpbml2YXMgPHZpZHlhLnNyaW5pdmFzQGludGVsLmNvbT4NCg0K
UmVnYXJkcw0KVmlkeWENCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBT
b3V6YSwgSm9zZSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgQXByaWwg
MjIsIDIwMjIgMTI6NTIgQU0NCj4gVG86IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFNyaW5pdmFzLCBWaWR5YSA8
dmlkeWEuc3Jpbml2YXNAaW50ZWwuY29tPjsgU2VhbiBQYXVsDQo+IDxzZWFucGF1bEBjaHJvbWl1
bS5vcmc+OyBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPjsN
Cj4gU291emEsIEpvc2UgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0gg
MS8zXSBkcm06IEFkZCBpbmZyYXN0cnVjdHVyZSB0byBhbGxvdyBzZWFtbGVzcyBtb2RlDQo+IHN3
aXRjaGVzDQo+IA0KPiBJbnRlbCBoYXJkd2FyZSBzdXBwb3J0cyBjaGFuZ2UgYmV0d2VlbiBtb2Rl
cyB3aXRoIGRpZmZlcmVudCByZWZyZXNoIHJhdGVzDQo+IHdpdGhvdXQgYW55IGdsaXRjaGVzIG9y
IHZpc3VhbCBhcnRpZmFjdHMsIHRoYXQgZmVhdHVyZSBpcyBjYWxsZWQgc2VhbWxlc3MgRFJSUy4N
Cj4gDQo+IFNvIGZhciBpOTE1IGRyaXZlciB3YXMgYXV0b21hdGljYWxseSBjaGFuZ2luZyBiZXR3
ZWVuIHByZWZlcnJlZCBwYW5lbCBtb2RlDQo+IGFuZCBsb3dlciByZWZyZXNoIHJhdGUgbW9kZSBi
YXNlZCBvbiBpZGxlbmVzcyBidXQgQ2hyb21lT1MgY29tcG9zaXRvcg0KPiB0ZWFtIGlzIHJlcXVl
c3RpbmcgdG8gYmUgaW4gY29udHJvbCBvZiB0aGUgbW9kZSBzd2l0Y2guDQo+IFNvIGZvciBhIGNl
cnRhaW4gdHlwZXMgb2YgY29udGVudCBpdCBjYW4gc3dpdGNoIHRvIG1vZGUgd2l0aCBhIGxvd2Vy
IHJlZnJlc2gNCj4gcmF0ZSB3aXRob3V0IHVzZXIgbm90aWNpbmcgYSB0aGluZyBhbmQgc2F2aW5n
IHBvd2VyLg0KPiANCj4gVGhpcyBzZWFtbGVzcyBtb2RlIHN3aXRjaCB3aWxsIGJlIHRyaWdnZXJl
ZCB3aGVuIHVzZXItc3BhY2UgZGlzcGF0Y2ggYQ0KPiBhdG9taWMgY29tbWl0IHdpdGggdGhlIG5l
dyBtb2RlIGFuZCBjbGVhcnMgdGhlDQo+IERSTV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VUIGZs
YWcuDQo+IA0KPiBBIGRyaXZlciB0aGF0IGRvbid0IGltcGxlbWVudCBhdG9taWNfc2VhbWxlc3Nf
bW9kZV9zd2l0Y2hfY2hlY2sNCj4gZnVuY3Rpb24gd2lsbCBjb250aW51ZSB0byBmYWlsIGluIHRo
ZSBhdG9taWMgY2hlY2sgcGhhc2Ugd2l0aCAiW0NSVEM6JWQ6JXNdDQo+IHJlcXVpcmVzIGZ1bGwg
bW9kZXNldCIgZGVidWcgbWVzc2FnZS4NCj4gV2hpbGUgYSBkcml2ZXIgdGhhdCBpbXBsZW1lbnRz
IGl0IGFuZCBzdXBwb3J0IHRoZSBzZWFtbGVzcyBjaGFuZ2UgYmV0d2Vlbg0KPiBvbGQgYW5kIG5l
dyBtb2RlIHdpbGwgcmV0dXJuIDAgb3RoZXJ3aXNlIGl0IHNob3VsZCByZXR1cm4gdGhlIGFwcHJv
cHJpZWQNCj4gZXJybm8uDQo+IA0KPiBTbyBoZXJlIGFkZGluZyBiYXNpYyBkcm0gaW5mcmFzdHJ1
Y3R1cmUgdG8gdGhhdCBiZSBzdXBwb3J0ZWQgYnkgaTkxNSBhbmQNCj4gb3RoZXIgZHJpdmVycy4N
Cj4gDQo+IENjOiBWaWR5YSBTcmluaXZhcyA8dmlkeWEuc3Jpbml2YXNAaW50ZWwuY29tPg0KPiBD
YzogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+DQo+IENjOiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKb3PD
qSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2F0b21pYy5jICAgICAgICAgICAgICB8ICAxICsNCj4gIGRyaXZlcnMv
Z3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jICAgICAgIHwgMTYgKysrKysrKysrKysrKysrDQo+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuYyB8ICAxICsNCj4gIGlu
Y2x1ZGUvZHJtL2RybV9jcnRjLmggICAgICAgICAgICAgICAgICAgIHwgMjUgKysrKysrKysrKysr
KysrKysrKysrKysNCj4gIDQgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2F0b21pYy5jDQo+IGluZGV4IDU4YzAyODNmYjZiMGMuLjIxNTI1ZjlmNGI0YzEgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9hdG9taWMuYw0KPiBAQCAtNDM3LDYgKzQzNyw3IEBAIHN0YXRpYyB2b2lk
IGRybV9hdG9taWNfY3J0Y19wcmludF9zdGF0ZShzdHJ1Y3QNCj4gZHJtX3ByaW50ZXIgKnAsDQo+
ICAJZHJtX3ByaW50ZihwLCAiXHRzZWxmX3JlZnJlc2hfYWN0aXZlPSVkXG4iLCBzdGF0ZS0NCj4g
PnNlbGZfcmVmcmVzaF9hY3RpdmUpOw0KPiAgCWRybV9wcmludGYocCwgIlx0cGxhbmVzX2NoYW5n
ZWQ9JWRcbiIsIHN0YXRlLT5wbGFuZXNfY2hhbmdlZCk7DQo+ICAJZHJtX3ByaW50ZihwLCAiXHRt
b2RlX2NoYW5nZWQ9JWRcbiIsIHN0YXRlLT5tb2RlX2NoYW5nZWQpOw0KPiArCWRybV9wcmludGYo
cCwgIlx0c2VhbWxlc3NfbW9kZV9jaGFuZ2VkPSVkXG4iLA0KPiArc3RhdGUtPnNlYW1sZXNzX21v
ZGVfY2hhbmdlZCk7DQo+ICAJZHJtX3ByaW50ZihwLCAiXHRhY3RpdmVfY2hhbmdlZD0lZFxuIiwg
c3RhdGUtPmFjdGl2ZV9jaGFuZ2VkKTsNCj4gIAlkcm1fcHJpbnRmKHAsICJcdGNvbm5lY3RvcnNf
Y2hhbmdlZD0lZFxuIiwgc3RhdGUtDQo+ID5jb25uZWN0b3JzX2NoYW5nZWQpOw0KPiAgCWRybV9w
cmludGYocCwgIlx0Y29sb3JfbWdtdF9jaGFuZ2VkPSVkXG4iLCBzdGF0ZS0NCj4gPmNvbG9yX21n
bXRfY2hhbmdlZCk7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxw
ZXIuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jDQo+IGluZGV4IDk2
MDMxOTNkMmZhMTMuLmU2ZjNhOTY2ZjdiODYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fYXRvbWljX2hlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWlj
X2hlbHBlci5jDQo+IEBAIC02MzEsNiArNjMxLDIyIEBAIGRybV9hdG9taWNfaGVscGVyX2NoZWNr
X21vZGVzZXQoc3RydWN0DQo+IGRybV9kZXZpY2UgKmRldiwNCj4gIAkJCWRybV9kYmdfYXRvbWlj
KGRldiwgIltDUlRDOiVkOiVzXSBtb2RlDQo+IGNoYW5nZWRcbiIsDQo+ICAJCQkJICAgICAgIGNy
dGMtPmJhc2UuaWQsIGNydGMtPm5hbWUpOw0KPiAgCQkJbmV3X2NydGNfc3RhdGUtPm1vZGVfY2hh
bmdlZCA9IHRydWU7DQo+ICsNCj4gKwkJCWlmICghc3RhdGUtPmFsbG93X21vZGVzZXQgJiYNCj4g
KwkJCSAgICBjcnRjLT5mdW5jcy0NCj4gPmF0b21pY19zZWFtbGVzc19tb2RlX3N3aXRjaF9jaGVj
aykgew0KPiArCQkJCXJldCA9IGNydGMtPmZ1bmNzLQ0KPiA+YXRvbWljX3NlYW1sZXNzX21vZGVf
c3dpdGNoX2NoZWNrKHN0YXRlLCBjcnRjKTsNCj4gKwkJCQlpZiAocmV0ID09IC1FT1BOT1RTVVBQ
KSB7DQo+ICsJCQkJCWRybV9kYmdfYXRvbWljKGRldiwgIltDUlRDOiVkOiVzXQ0KPiBTZWFtbGVz
cyBtb2RlIHN3aXRjaCBub3Qgc3VwcG9ydGVkXG4iLA0KPiArCQkJCQkJICAgICAgIGNydGMtPmJh
c2UuaWQsIGNydGMtDQo+ID5uYW1lKTsNCj4gKwkJCQkJcmV0dXJuIHJldDsNCj4gKwkJCQl9DQo+
ICsNCj4gKwkJCQlpZiAocmV0IDwgMCkNCj4gKwkJCQkJcmV0dXJuIHJldDsNCj4gKw0KPiArCQkJ
CW5ld19jcnRjX3N0YXRlLT5zZWFtbGVzc19tb2RlX2NoYW5nZWQgPQ0KPiB0cnVlOw0KPiArCQkJ
CW5ld19jcnRjX3N0YXRlLT5tb2RlX2NoYW5nZWQgPSBmYWxzZTsNCj4gKwkJCX0NCj4gIAkJfQ0K
PiANCj4gIAkJaWYgKG9sZF9jcnRjX3N0YXRlLT5lbmFibGUgIT0gbmV3X2NydGNfc3RhdGUtPmVu
YWJsZSkgeyBkaWZmIC0tDQo+IGdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3N0YXRl
X2hlbHBlci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmMN
Cj4gaW5kZXggM2I2ZDNiZGJkMDk5Ni4uYzA5MzA3M2VhNmUxMSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmMNCj4gQEAgLTE0Miw2ICsxNDIsNyBAQCB2
b2lkDQo+IF9fZHJtX2F0b21pY19oZWxwZXJfY3J0Y19kdXBsaWNhdGVfc3RhdGUoc3RydWN0IGRy
bV9jcnRjICpjcnRjLA0KPiAgCWlmIChzdGF0ZS0+Z2FtbWFfbHV0KQ0KPiAgCQlkcm1fcHJvcGVy
dHlfYmxvYl9nZXQoc3RhdGUtPmdhbW1hX2x1dCk7DQo+ICAJc3RhdGUtPm1vZGVfY2hhbmdlZCA9
IGZhbHNlOw0KPiArCXN0YXRlLT5zZWFtbGVzc19tb2RlX2NoYW5nZWQgPSBmYWxzZTsNCj4gIAlz
dGF0ZS0+YWN0aXZlX2NoYW5nZWQgPSBmYWxzZTsNCj4gIAlzdGF0ZS0+cGxhbmVzX2NoYW5nZWQg
PSBmYWxzZTsNCj4gIAlzdGF0ZS0+Y29ubmVjdG9yc19jaGFuZ2VkID0gZmFsc2U7DQo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oIGIvaW5jbHVkZS9kcm0vZHJtX2NydGMuaCBp
bmRleA0KPiBhNzBiYWVhMDYzNmNhLi5iN2NlMzc4ZDY3OWQzIDEwMDY0NA0KPiAtLS0gYS9pbmNs
dWRlL2RybS9kcm1fY3J0Yy5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgNCj4gQEAg
LTE0MCw2ICsxNDAsMTYgQEAgc3RydWN0IGRybV9jcnRjX3N0YXRlIHsNCj4gIAkgKi8NCj4gIAli
b29sIG1vZGVfY2hhbmdlZCA6IDE7DQo+IA0KPiArCS8qKg0KPiArCSAqIEBzZWFtbGVzc19tb2Rl
X2NoYW5nZWQ6IEBtb2RlIGhhcyBiZWVuIGNoYW5nZWQgYnV0IHVzZXItDQo+IHNwYWNlDQo+ICsJ
ICogaXMgcmVxdWVzdGluZyB0byBjaGFuZ2UgdG8gdGhlIG5ldyBtb2RlIHdpdGggYSBmYXN0c2V0
IGFuZCBkcml2ZXINCj4gKwkgKiBzdXBwb3J0cyB0aGlzIHJlcXVlc3QuDQo+ICsJICogVG8gYmUg
dXNlZCBieSBkcml2ZXJzIHRvIHN0ZWVyIHRoZSBhdG9taWMgY29tbWl0IGNvbnRyb2wgZmxvdyB0
bw0KPiArCSAqIGFwcHJvcHJpYXRlIHBhdGhzIHRvIGNoYW5nZSBtb2RlIHdpdGhvdXQgYW55IHZp
c3VhbCBjb3JydXB0aW9uLg0KPiArCSAqIE5ldmVyIHNldCB0b2dldGhlciB3aXRoIEBtb2RlX2No
YW5nZWQuDQo+ICsJICovDQo+ICsJYm9vbCBzZWFtbGVzc19tb2RlX2NoYW5nZWQgOiAxOw0KPiAr
DQo+ICAJLyoqDQo+ICAJICogQGFjdGl2ZV9jaGFuZ2VkOiBAYWN0aXZlIGhhcyBiZWVuIHRvZ2ds
ZWQuIFVzZWQgYnkgdGhlIGF0b21pYw0KPiAgCSAqIGhlbHBlcnMgYW5kIGRyaXZlcnMgdG8gc3Rl
ZXIgdGhlIGF0b21pYyBjb21taXQgY29udHJvbCBmbG93LiBTZWUNCj4gYWxzbyBAQCAtOTM5LDYg
Kzk0OSwyMSBAQCBzdHJ1Y3QgZHJtX2NydGNfZnVuY3Mgew0KPiAgCQkJCSAgICAgaW50ICptYXhf
ZXJyb3IsDQo+ICAJCQkJICAgICBrdGltZV90ICp2YmxhbmtfdGltZSwNCj4gIAkJCQkgICAgIGJv
b2wgaW5fdmJsYW5rX2lycSk7DQo+ICsNCj4gKwkvKioNCj4gKwkgKiBAYXRvbWljX3NlYW1sZXNz
X21vZGVfc3dpdGNoX2NoZWNrDQo+ICsJICoNCj4gKwkgKiBDYWxsZWQgd2hlbiB1c2VyLXNwYWNl
IHdhbnRzIHRvIGNoYW5nZSBtb2RlIHdpdGhvdXQgZG8gYQ0KPiBtb2Rlc2V0Lg0KPiArCSAqIERy
aXZlcnMgY2FuIG9wdGlvbmFsbHkgc3VwcG9ydCBkbyBhIG1vZGUgc3dpdGNoIHdpdGhvdXQgYW55
IHZpc3VhbA0KPiArCSAqIGNvcnJ1cHRpb24gd2hlbiBjaGFuZ2luZyBiZXR3ZWVuIGNlcnRhaW4g
bW9kZXMuDQo+ICsJICoNCj4gKwkgKiBSZXR1cm5zOg0KPiArCSAqIFplcm8gaWYgcG9zc2libGUg
dG8gc2VhbWxlc3Mgc3dpdGNoIG1vZGUsIC1FT1BOT1RTVVBQIGlmIG5vdA0KPiArCSAqIHN1cHBv
cnRlZCBzZWFtbGVzcyBtb2RlIGNoYW5nZSBvciBhcHByb3ByaWF0ZSBlcnJubyBpZiBhbiBlcnJv
cg0KPiArCSAqIGhhcHBlbmVkLg0KPiArCSAqLw0KPiArCWludCAoKmF0b21pY19zZWFtbGVzc19t
b2RlX3N3aXRjaF9jaGVjaykoc3RydWN0DQo+IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAr
CQkJCQkJIHN0cnVjdCBkcm1fY3J0YyAqY3J0Yyk7DQo+ICB9Ow0KPiANCj4gIC8qKg0KPiAtLQ0K
PiAyLjM2LjANCg0K
