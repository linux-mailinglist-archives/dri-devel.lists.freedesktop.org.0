Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F5C5853B2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD5E12B318;
	Fri, 29 Jul 2022 16:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18C718A6D6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659112869; x=1690648869;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CYque/qqe8+sxkoN3DLojI44Tx36I/xTy+0UfACcqsM=;
 b=K6tkInAJb8dw+uX9Fwept66cGUzqaa0wbTaEPhr1VK/EcohCv8bnbHhh
 oSVujjicmEr7WU+qHs4Slmxc9bF82bURmeKt+rb7Qrakm7md950VTaArb
 hO9OvWlbKfQWilpgPBIGRu7j22oK89sd40xNAZFw1raByGj86y2SG3smU
 shOseAyqsrlAoTQOHHt8DCyX7vtaGWUwsNNweHp9w3yyJVW4F5CoVn1w0
 3HXMwVHwo7ngceteR+C8SrWDEnjNBNVcxC1VNbUZVpGAz9M5li4BhUFeF
 rPK0s67uUVF4pnPRrlmg1WLfotwu1KbWcA5hCmd/WdP0BQPWFTy7oY3gw g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="375105088"
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; d="scan'208";a="375105088"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 09:40:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; d="scan'208";a="660306122"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga008.fm.intel.com with ESMTP; 29 Jul 2022 09:40:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 29 Jul 2022 09:40:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 29 Jul 2022 09:40:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 29 Jul 2022 09:40:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCa6ZokproKq7gsM1/s+U1t0xAIqIS58et4UiTUIIVcKCVPcxHDUCdTOhu82PofwNbcGcdV7oUmLdncutBa3qRf3OmBNnawN6FDFRI6IYuR8Cb6AI7Jhvo7uplPMg+qOqmMZgvw7UFvm5mgwvR9uVaDnTFYXUEA1+HVBfEIlqza1spUoZcIordHZGrgSYwqYe2RPbMZOQn7AK/VOBVzRSRzj810ZySAsXJFDqmC2dpVPHM59XoCiENGfaIGiVSW18WAZcfMMtZHJ2ww8U5RdOHGw1yiVcb4yQxoPUpAHKmVbFEU+KQ+8G+ti5L1oCf4PEG33gQCgU22aRZ6MYU2bxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYque/qqe8+sxkoN3DLojI44Tx36I/xTy+0UfACcqsM=;
 b=WfScZZLwaDKJ68oSKBLCc55DNu9A8/SkBW0f3mTSNdqQyWeHourIc8X/MBihFbrDQQIN2iEiL7/j8vK+m7fhOFSW+ixVynB1NrAB6zxGH1JUipCKR9nZAmCAqqEtUz8+Jzgom6QnhqHAXKPnXDJ8KDA/kR7lGBX9+yGDoUTGJiQbxagOzQrwg2WhCqGxiw3C4n0410T1VbK9ceWKMhzmYqOozSlq635Jl1ZCJA9np1zMFTVPMHVpxQ0Lmalgx6zEGBwRLXgHLkH2oRQslqTUpfmFuwkUrgQmksLmoZqXdu+7ngd4eoZm+N2NZ4t+3BTDLcWfBeHI6gkY+D4kzGdMzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by DM6PR11MB3355.namprd11.prod.outlook.com (2603:10b6:5:5d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.23; Fri, 29 Jul
 2022 16:40:27 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::5c0d:3883:7fe4:627b]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::5c0d:3883:7fe4:627b%7]) with mapi id 15.20.5482.012; Fri, 29 Jul 2022
 16:40:27 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Zeng Jingxiang
 <zengjx95@gmail.com>, "edmund.j.dea@intel.com" <edmund.j.dea@intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "maxime@cerno.tech" <maxime@cerno.tech>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH] drm/kmb: fix dereference before NULL check in
 kmb_plane_atomic_update()
Thread-Topic: [PATCH] drm/kmb: fix dereference before NULL check in
 kmb_plane_atomic_update()
Thread-Index: AQHYovha9jwL5q3OmE+pLUQWk+vsja2VZ5GAgAAArQCAACP6YA==
Date: Fri, 29 Jul 2022 16:40:26 +0000
Message-ID: <BY5PR11MB41828228EF0D27174703431B8C999@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20220729030711.2117849-1-zengjx95@gmail.com>
 <a68022f4-28d0-7743-27fe-6df652082184@suse.de>
 <fef74b28-80f1-9184-efa5-25f3343ace40@suse.de>
In-Reply-To: <fef74b28-80f1-9184-efa5-25f3343ace40@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f290c150-3ef5-48d7-4d20-08da71810aab
x-ms-traffictypediagnostic: DM6PR11MB3355:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mt947Z0NCUtBuCh2aHOO2PRgUiBBk4OFK1s3k3ocm9AFlgqmxWxWnRZAt7U/qsUey/1Y4nXdNqqdayC8l6eRQtbZoM4K78rA0qo28oLNxFfRJHwVONTLwfAgDVBtdeDZseoTAgjYTbWDNbdLnhmUIxByxByfyGBjwWXdG56jECI5Fn2/RZ2UVIyo7tJyVDcM0v3o34rCLUSBud5lDsrKX3fySh/1GXR49jiyau8+R20EsoW9yzc8Gvt1LCinmz3GZXQRUUAkPVX1/+MLm5SnoFuvGA9ShMdgxnKsgwXwNtIXex/ed2ZZbZo2h2pA6gcKVax4fB3YzNpX9bcg2HKz8d4mcJRiCNubIJnsfNF9koDJ2lzdkAPNZcawRVLsOzOHzirZiSRz/nGZ2ApLRvEVc1xmP+Vmp7devWpBX3UQltAaRSz6ANQW9NlvBA84SFCrqMENsZ+hH3sGIevR1CPzKP+8fWtKsGlJRLp8qcBx/s92rxoAECSJa9Wmwo83wtQafz/WwKkfQYsBlBEZoFbGkL48W6gq1cBUJPYvchT7rRPFrfg/fFSs14XBMDUF0HrG4q2XRwyqxNxP3234BvcZI8Sr06WSIxvLq9zLRSac+1xQfl2ScD5W34DsXHibxfRJJQ+I0iFdnTYml+wkv9SyvQdOtLV12bq5F08VjwV3DStm8KgOVS7dv9ZkeS6ZuHubXRahVRUFs1xX1pJTRPdfyGm4mgHlrTH/gVPi5kxFPwnqRlw+IzeUe4Jg9mB5Azi2YfiYdsxYySx7JZe1N2qREi1MSOIPUwf3VcWP4fV6EsArj4fIvzoEwzX6fL7ntUr0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(366004)(39860400002)(346002)(396003)(53546011)(71200400001)(82960400001)(83380400001)(2906002)(122000001)(86362001)(66556008)(76116006)(54906003)(38100700002)(8676002)(66476007)(66446008)(110136005)(38070700005)(26005)(66946007)(64756008)(5660300002)(6506007)(8936002)(33656002)(316002)(41300700001)(7696005)(4326008)(55016003)(52536014)(66574015)(9686003)(7416002)(478600001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXYySHltWlBtTG5CRFI1c1ppbDNuQm1ad1NkTmNBZEpUOFJOdGpFSzFxWXBX?=
 =?utf-8?B?djVicGV5YTJvU2VZaThSQ0N6S0YyS2JXczRFYlMvUHJldEZwbVhsTE5UTnJ5?=
 =?utf-8?B?cGc0NTZGc201OUUwTGtsRXhpWmE2cVduTDNsRXlScnYwdFYzYjEvUTdOSWhn?=
 =?utf-8?B?bDV4d2oxZ2NHZTZNUWpiOGdOdXBMTEUxR0trdFBzZU9pVFR0YUF3OUF4UHhj?=
 =?utf-8?B?cDlpSW1rZjA0S3p3U3NpUnFmS0pUVW0zMTY5VkxLNE5rZk1QV2VoU1pkUUlD?=
 =?utf-8?B?L3ZPYTU1OHBOK3ZGTUdUZzBpRVJYZDI4MVNBUCtrNVhvZWFiSjZ4SWhCMWVY?=
 =?utf-8?B?MXFKZi9qdTIxY3lwMUkvWE9wODltMk8vaDhtaVh5SkhrUVVUN0czSzBTcURR?=
 =?utf-8?B?NDFNYU42WEVtdkpIaVcvZHp4ZEVOLzJLNkJXc01rSWgwQThoVXp1QXo2QnU5?=
 =?utf-8?B?cEpJOFpZbVBaZmR4SUVMRUhBWDR3Y3pUaXdVck9xTE9FQThMc2d1L2xlQ1pN?=
 =?utf-8?B?TmkzR2ZveEdwZEYrQjAxY3BZYkx6UFoycXhsQVdWc3kxNHJyOXVPSkpBSGZ5?=
 =?utf-8?B?MWZJamtzcm5PdlVrM21mMjNiYXoyUWozNkVmZzE3bzg3RE1YakV4T3U2V0tP?=
 =?utf-8?B?ZjB3RnAwWlFMdU9jU0t3MWpJUE5lbXViTkVsZVlWd3FhbUFrQThpZ08zZ2x2?=
 =?utf-8?B?ajMwN0lBVjZndXJLbVVZM29XZDZHNzd5N2ZldlpHVzdhSDQreTJxTnpXcVp2?=
 =?utf-8?B?Y3NqQjdpUm56NGs2Y2ZpUmcwSTNZcWxEVCtWV3hSYzZwSncrZVA0K09NZzRQ?=
 =?utf-8?B?WFk2OTE0eUhsR0pGMGNpSjRCL2FibFNFaFE1dFl4NTBOMVgzMlY5dFgwMEFM?=
 =?utf-8?B?ZEdwTE1FcFZBdVpDTUJ3VUZwQTNFWFdwTFFkdm93R05uaHlFT2tJcDNzdHZz?=
 =?utf-8?B?SEZia0FoN2Q1WXdmc0NaNnhSK05zOXZuNDhOS1RuQ3cyMnd0aUtSYXdVTVl5?=
 =?utf-8?B?T2lGM2RyaCtoTTBWTllwU09yOE5tWklFZlpQbFZNSDFuVmx5UmhuZ1BKWGRv?=
 =?utf-8?B?UGRBZGtyS051RDZwUWxLR0ZmZ1B2Wk1nUjBidzdYamF4TmRyVU5JOUpwdGk0?=
 =?utf-8?B?RzNBQ0pYOFcxVEpJOGRQUnZLSFhWMmJYY3dPdThCVXRQMDVwWkIwTUhzR1R2?=
 =?utf-8?B?cVFiUDRtdWliR0V2SkZYOEcvSTJsS0VLSFBaaGtaSytUUXNPTnRNTG9MZGVv?=
 =?utf-8?B?Y3Byd1FlWEFwSVBwYTcvclhObEhCaUdlZ2x2L1FmQWkxTG5ZYWNkdXRjS1Rn?=
 =?utf-8?B?emtmMmt4cWdrOW90TDNIc2NPRGkrVEZ3aWNVcWREL25WdmlHaXlnellaWEhC?=
 =?utf-8?B?S2NpZEdyTStSVHJhcnBWL0dHWFJ2RC9Tdm9PYXk3RllzRXM4cGdYSmhCZjY2?=
 =?utf-8?B?eWs5OVlTWU1xekZOOGpGWW1qWEtKTm1zMFhDc1hZcEZrRTZnRlhVdlhxUlJH?=
 =?utf-8?B?d0thV3BCcGNzVU5KRVY0L3pwY01KNHlrdUpvd3dZY3ZqLzY1eXd0NzVPcVJQ?=
 =?utf-8?B?QXdlczlyeVlmZVdZVy94MzlCekdXazlmdmgxNE0rSE9jL0plb08wblZvalJT?=
 =?utf-8?B?UVRpTjZxR0J3d0tFNnA1Q1pOOFBJWXhpTFVvWHIzYWJwVVZ5WXZZcVFRaklR?=
 =?utf-8?B?K0ovUTVTN3pha245R0orMURLbUVzTGMwOUJYVG45QUpUYm5rTmNtVW1ibEMz?=
 =?utf-8?B?c3ZYTEpLUTNZd1prQWEwVGZOUE5RaUNLbGhsb3R4dTlkRkdlc1Z1ZURiOTM1?=
 =?utf-8?B?djZQSjNEVVFkdXVUcDFZZHBqaWc4a2lXMGNybUluaDBjcXFPYlRvYlQ4MEJD?=
 =?utf-8?B?d0RqUGRKdkYvbnpNdmQvV1RuQ0xXNER1TjgrdElwTTd4WXlJMWQ1Y0ViWnBI?=
 =?utf-8?B?U0QyTE5vQVdGL1Y2S0JHclZ1TE1PaE9oWWN1d2ZZVFA4NHk1bHlzbWRvVmVD?=
 =?utf-8?B?WTVLanZuSHo4cEI5QkhEQWtqelJNekhMNjVVUldJM2ZHOEhvZkFwbnExSUFK?=
 =?utf-8?B?QlFheGZFRk5jRTRhWlkwR2FSSEo2SWsvZGFXZjcrdGgyZzhtYlRnTkR0S0xH?=
 =?utf-8?B?ejdpeHJLamR2UjNZR0h6a1Z3eXV3T0tEeFZUUFNkZjRKeTVMY2lJdHdpV2Jy?=
 =?utf-8?B?b0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f290c150-3ef5-48d7-4d20-08da71810aab
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2022 16:40:26.9596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EtxHRy9vDF4IOfGVeTEPT0hFCOj9enXZLyrATlvJjpyNEaJBz01p9qcfVopDM9ILzNS/P19sEGF4GvGAm0x+vKiaF/C3qjf1+jvLGlgDsbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3355
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
Cc: Zeng Jingxiang <linuszeng@tencent.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWdyZWUgd2l0aCBUaG9tYXMsIGRybV9hdG9taWNfY29tbWl0KCkgd2lsbCBub3QgY2FsbCBrbWJf
YXRvbWljX3VwZGF0ZSgpIHdpdGggYSBOVUxMIHBsYW5lLiBUaGlzIGlzIG5vdCBhbiBhY3R1YWwg
YnVnLg0KDQpUaGFua3MsDQpBbml0aGEgDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IFNlbnQ6
IEZyaWRheSwgSnVseSAyOSwgMjAyMiA3OjI2IEFNDQo+IFRvOiBaZW5nIEppbmd4aWFuZyA8emVu
Z2p4OTVAZ21haWwuY29tPjsgQ2hyaXNhbnRodXMsIEFuaXRoYQ0KPiA8YW5pdGhhLmNocmlzYW50
aHVzQGludGVsLmNvbT47IGVkbXVuZC5qLmRlYUBpbnRlbC5jb207IGFpcmxpZWRAbGludXguaWU7
DQo+IGRhbmllbEBmZndsbC5jaDsgbGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tOyBt
YXhpbWVAY2Vybm8udGVjaDsNCj4gdmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20NCj4gQ2M6
IFplbmcgSmluZ3hpYW5nIDxsaW51c3plbmdAdGVuY2VudC5jb20+OyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOw0KPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIGRybS9rbWI6IGZpeCBkZXJlZmVyZW5jZSBiZWZvcmUgTlVMTCBjaGVj
ayBpbg0KPiBrbWJfcGxhbmVfYXRvbWljX3VwZGF0ZSgpDQo+IA0KPiBIaQ0KPiANCj4gQW0gMjku
MDcuMjIgdW0gMTY6MjMgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoNCj4gPiBIaQ0KPiA+DQo+
ID4gQW0gMjkuMDcuMjIgdW0gMDU6MDcgc2NocmllYiBaZW5nIEppbmd4aWFuZzoNCj4gPj4gRnJv
bTogWmVuZyBKaW5neGlhbmcgPGxpbnVzemVuZ0B0ZW5jZW50LmNvbT4NCj4gPj4NCj4gPj4gVGhl
ICJwbGFuZSIgcG9pbnRlciB3YXMgYWNjZXNzIGJlZm9yZSBjaGVja2luZyBpZiBpdCB3YXMgTlVM
TC4NCj4gPj4NCj4gPj4gVGhlIGRybV9hdG9taWNfZ2V0X29sZF9wbGFuZV9zdGF0ZSgpIGZ1bmN0
aW9uIHdpbGwgZGVyZWZlcmVuY2UNCj4gPj4gdGhlIHBvaW50ZXIgInBsYW5lIi4NCj4gPj4gMzQ1
wqDCoMKgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9sZF9wbGFuZV9zdGF0ZSA9DQo+ID4+IMKg
wqDCoMKgwqDCoMKgIGRybV9hdG9taWNfZ2V0X29sZF9wbGFuZV9zdGF0ZShzdGF0ZSwgcGxhbmUp
Ow0KPiA+PiAzNDbCoMKgwqAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqbmV3X3BsYW5lX3N0YXRl
ID0NCj4gPj4gwqDCoMKgwqDCoMKgwqAgZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0YXRlKHN0
YXRlLCBwbGFuZSk7DQo+ID4+DQo+ID4+IEEgTlVMTCBjaGVjayBmb3IgInBsYW5lIiBpbmRpY2F0
ZXMgdGhhdCBpdCBtYXkgYmUgTlVMTA0KPiA+PiAzNjPCoMKgwqAgaWYgKCFwbGFuZSB8fCAhbmV3
X3BsYW5lX3N0YXRlIHx8ICFvbGRfcGxhbmVfc3RhdGUpDQo+ID4NCj4gPiBJcyB0aGlzIGFuIGFj
dHVhbCBidWcgdGhhdCBoYXBwZW5zPw0KPiA+DQo+ID4gQWxsIHBsYW5lcyBzaG91bGQgYWx3YXlz
IGhhdmUgYSBzdGF0ZS4gVGhlcmVmb3JlIHRoZSB0ZXN0cyBmb3INCj4gPiAhbmV3X3BsYW5lX3N0
YXRlIGFuZCAhb2xkX3BsYW5lX3N0YXRlIGNhbiBiZSByZW1vdmVkLCBJJ2Qgc2F5Lg0KPiANCj4g
SnVzdCB0byBjbGFyaWZ5OiBtb3ZpbmcgdGhlIHRlc3QgZm9yICFwbGFuZSBiZWZvcmUgdXNpbmcg
b25lIG9mIHRoZQ0KPiBnZXRfcGxhbmVfc3RhdGUgZnVuY3Rpb25zIGlzIGEgY29ycmVjdCBidWdm
aXguDQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4gVGhvbWFzDQo+IA0KPiA+DQo+ID4gQmVzdCByZWdh
cmRzDQo+ID4gVGhvbWFzDQo+ID4NCj4gPj4NCj4gPj4gRml4ZXM6IDk3NzY5N2UyMGIzZCAoImRy
bS9hdG9taWM6IFBhc3MgdGhlIGZ1bGwgc3RhdGUgdG8gcGxhbmVzIGF0b21pYw0KPiA+PiBkaXNh
YmxlIGFuZCB1cGRhdGUiKQ0KPiA+PiBGaXhlczogMzc0MThiZjE0YzEzICgiZHJtOiBVc2Ugc3Rh
dGUgaGVscGVyIGluc3RlYWQgb2YgdGhlIHBsYW5lIHN0YXRlDQo+ID4+IHBvaW50ZXIiKQ0KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBaZW5nIEppbmd4aWFuZyA8bGludXN6ZW5nQHRlbmNlbnQuY29tPg0K
PiA+PiAtLS0NCj4gPj4gwqAgZHJpdmVycy9ncHUvZHJtL2ttYi9rbWJfcGxhbmUuYyB8IDEzICsr
KysrKysrLS0tLS0NCj4gPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9rbWIv
a21iX3BsYW5lLmMNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0va21iL2ttYl9wbGFuZS5jDQo+ID4+
IGluZGV4IDI3MzViOGViMzUzNy4uZDJiYzk5OGI2NWNlIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0va21iL2ttYl9wbGFuZS5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9r
bWIva21iX3BsYW5lLmMNCj4gPj4gQEAgLTM0MiwxMCArMzQyLDcgQEAgc3RhdGljIHZvaWQga21i
X3BsYW5lX3NldF9hbHBoYShzdHJ1Y3QNCj4gPj4ga21iX2RybV9wcml2YXRlICprbWIsDQo+ID4+
IMKgIHN0YXRpYyB2b2lkIGttYl9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUg
KnBsYW5lLA0KPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQ0KPiA+PiDCoCB7DQo+ID4+IC3CoMKgwqAg
c3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3BsYW5lX3N0YXRlID0NCj4gPj4gZHJtX2F0b21p
Y19nZXRfb2xkX3BsYW5lX3N0YXRlKHN0YXRlLA0KPiA+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcGxhbmUpOw0KPiA+PiAtwqDCoMKgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm5ld19wbGFu
ZV9zdGF0ZSA9DQo+ID4+IGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0ZShzdGF0ZSwNCj4g
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBsYW5lKTsNCj4gPj4gK8KgwqDCoCBzdHJ1Y3Qg
ZHJtX3BsYW5lX3N0YXRlICpvbGRfcGxhbmVfc3RhdGUsICpuZXdfcGxhbmVfc3RhdGU7DQo+ID4+
IMKgwqDCoMKgwqAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmI7DQo+ID4+IMKgwqDCoMKgwqAg
c3RydWN0IGttYl9kcm1fcHJpdmF0ZSAqa21iOw0KPiA+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGlu
dCB3aWR0aDsNCj4gPj4gQEAgLTM2MCw3ICszNTcsMTMgQEAgc3RhdGljIHZvaWQga21iX3BsYW5l
X2F0b21pY191cGRhdGUoc3RydWN0DQo+ID4+IGRybV9wbGFuZSAqcGxhbmUsDQo+ID4+IMKgwqDC
oMKgwqAgc3RhdGljIGRtYV9hZGRyX3QgYWRkcltNQVhfU1VCX1BMQU5FU107DQo+ID4+IMKgwqDC
oMKgwqAgc3RydWN0IGRpc3BfY2ZnICppbml0X2Rpc3BfY2ZnOw0KPiA+PiAtwqDCoMKgIGlmICgh
cGxhbmUgfHwgIW5ld19wbGFuZV9zdGF0ZSB8fCAhb2xkX3BsYW5lX3N0YXRlKQ0KPiA+PiArwqDC
oMKgIGlmICghcGxhbmUpDQo+ID4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+ID4+ICsNCj4g
Pj4gK8KgwqDCoCBvbGRfcGxhbmVfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9vbGRfcGxhbmVfc3Rh
dGUoc3RhdGUsIHBsYW5lKTsNCj4gPj4gK8KgwqDCoCBuZXdfcGxhbmVfc3RhdGUgPSBkcm1fYXRv
bWljX2dldF9uZXdfcGxhbmVfc3RhdGUoc3RhdGUsIHBsYW5lKTsNCj4gPj4gKw0KPiA+PiArwqDC
oMKgIGlmICghbmV3X3BsYW5lX3N0YXRlIHx8ICFvbGRfcGxhbmVfc3RhdGUpDQo+ID4+IMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm47DQo+ID4+IMKgwqDCoMKgwqAgZmIgPSBuZXdfcGxhbmVfc3Rh
dGUtPmZiOw0KPiA+DQo+IA0KPiAtLQ0KPiBUaG9tYXMgWmltbWVybWFubg0KPiBHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
PiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4gKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KPiBHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=
