Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB54CD629
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 15:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4C310FC16;
	Fri,  4 Mar 2022 14:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31F010FC13;
 Fri,  4 Mar 2022 14:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646403421; x=1677939421;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g6FZ5RLSW8akmMLYRlfacQTjYZ9Y4O6jXSHccwzjKCY=;
 b=YA25OCDIv5Qc1n2uriUNuwSBfbS9qZQsGIvnIRiRv95Z4ZVs2YNuYYpQ
 LBIgJhXi85C4L6EDfFeXTQi31SFgRyJ/hV3hMl6w1BOXGx6f+Ep4Xtj2l
 fhjyBk4En0lJZ/qHfBNxBwcNzs0EbyteZcldx3ZdjoaIoBhhkRELX8TYX
 6FJKuO2K5UTBYD9FCzAA2E1+PBM0wF2fxy4IaHV0oNTfG4SYth3SMyFKi
 1lt3EKsnSsxqdrsClJgyCxqvm2KhTCW+UcghEE/9cXvBxdrvndtX5e6Du
 B9OZvJhcJVQMZmCqeBMHY+nwS2b2wDXm78bFDbrjhYkNArmNqhO7Ds+1+ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="233941896"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="233941896"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 06:17:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="576889312"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 04 Mar 2022 06:17:00 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 06:17:00 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 06:17:00 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 06:17:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sq+mJQk8xI4kZt98bFRQuiwD+KfyXCyUFGruFOwkIDFJccdpvrI4nRMBj2rmpMrX2wtGpOI/3LHjrvQnEblj0PR2dRiVdpN6aJa/vFr3TsLWELXuS00PDJrUcpkOQJjMZ2cG4UXU6bGORd7/qUUC22Wo3gmyXlMdXVb87lgsw9QLSirXC8dhgrB/feasiOIZthanr/ys8D+2KuhB7u72DR7iTwbZ9DlM4nCZiBVDrGeb7GP8i1KgfwMqm4H87JQBZhAsxl2dUVQuKNvrVSyMMKm2wkJN/meV9dbdNO9npiQsENry8oUF3HDFWZhPsjVWobPha0nv6wmErPvnGIu6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6FZ5RLSW8akmMLYRlfacQTjYZ9Y4O6jXSHccwzjKCY=;
 b=LwgsGdXISz9Vd5NXHGBu05uJqxKPAC/zeWF6nYznOSozwX3CiZPoaN6+4mu1geqXWYGHlWOYYYsuVJ0vwwyQ//ZMk7ILb++VTabdIe+uNhnHuy+/sI43NO5YS9u1fpprrPrFDlEzA6Ol2n65ekQRpFT18GwmoStJV7HVJdvvIpofTem8aaC3wsApYU6K+2BB17A/GxUewZZwADx7nGVgHjS4AdhA9US9GnsQ5P6ZI9za5tUjOvd3hg0fLe44ZDcHX8dxbHYbyxJ2wOO7n0Z8nJKAtp5cUElrkFDipIUSMRYn9Oxxho4cBDSUIwNuLEYge29wi00Rs6vfocCltAryMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB1741.namprd11.prod.outlook.com (2603:10b6:300:10d::20)
 by BL1PR11MB5414.namprd11.prod.outlook.com (2603:10b6:208:31e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 4 Mar
 2022 14:16:55 +0000
Received: from MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::216d:6bf4:d46c:f133]) by MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::216d:6bf4:d46c:f133%6]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 14:16:55 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
Thread-Topic: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting
 from drm_writeback_connector structure changes
Thread-Index: AQHYGBFjkzht//tf006vXTl+IOhLcKyANJuAgAAJCYCAAAMWAIAAJNoAgCXncoCAAnYugIAARKuAgAAFXYCAABSgAIADdIKAgAABCACAAYHWAIABC+0ggAATFQCAAACv0IAADC0AgAAspxA=
Date: Fri, 4 Mar 2022 14:16:55 +0000
Message-ID: <MWHPR11MB174170C633719C9CBAC0DE18E3059@MWHPR11MB1741.namprd11.prod.outlook.com>
References: <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com>
 <87y22ts948.fsf@intel.com> <YfqGbqQQz5vrDaLI@pendragon.ideasonboard.com>
 <87v8xxs2hz.fsf@intel.com>
 <CAF6AEGtdnWWhGp7U7nAPD4r3Uoe5BJKVm2rQ2MS=q5GqF6MYDA@mail.gmail.com>
 <YhyB0WmJDWVFO1se@pendragon.ideasonboard.com> <871qzn6vmc.fsf@intel.com>
 <Yhy/6+z7QshG+qOo@pendragon.ideasonboard.com>
 <YhzROBOwTUkZw3Ez@pendragon.ideasonboard.com>
 <4d8daabe-10d9-a3cf-d305-68414cffe4ed@quicinc.com>
 <Yh+4EOKA5FgrlZrF@pendragon.ideasonboard.com>
 <0cfd36a2-26e4-309d-d8e9-e3bf8a5d2417@quicinc.com>
 <MWHPR11MB174187335183FC24BE0F1EA5E3059@MWHPR11MB1741.namprd11.prod.outlook.com>
 <CAA8EJppTVN1EnytD5mCmr4ZTi4M8u9ENOmJuweNyDRkB3LEHnw@mail.gmail.com>
 <MWHPR11MB1741708DEFD56E02C1BBC7A3E3059@MWHPR11MB1741.namprd11.prod.outlook.com>
 <CAA8EJppHOJzJt=oapYhshajWt3mSXKjoMUdcnb3T_i+62Xo8NA@mail.gmail.com>
In-Reply-To: <CAA8EJppHOJzJt=oapYhshajWt3mSXKjoMUdcnb3T_i+62Xo8NA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a741185-bef9-4f1a-f2a9-08d9fde9a326
x-ms-traffictypediagnostic: BL1PR11MB5414:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BL1PR11MB5414E0AC0FE59E2F92F63D5FE3059@BL1PR11MB5414.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fX7lxyHO4+bLCGjMg8aRYSjvTOTBFRV2WoviIARG7RTAJWeTFkLULTV/LFx+vMrzCvy4GR6oqbx1TTKuk04q9Bt5ltFULLUEylaw4b9bibOS2sxpOo8Qor/ZkNkeAvwrs2O33Mat1T7gCb7lKRFll6oQYaQKz44lESPp99n22mo1SB4foCA7mUcnWNcuSg6wFg7YptmNOI0BjEr0PCI8gO9VUI7bruZEdL0tUge13fU1lel1bU1x8oL5GvL5rEgefu0xFa7yPy+WTdug40/0cFeGs9Hadz5H+NOOcnE/U0nutdOYEHscAEgCWmwFoIqUrXIZ3iGfy3fVUeghKAJj282orPAlq4314/q3MVyMRZoNVsxaeUoc+z6d5qbMosxJ1sTaFCUIkPwAc6WLcIL6CcKVbFD59c7PSt7dPlaUhH5eWLHNIX+gGzfppTEZKCeaMuE7aamKttq1OSmUr9qYj78hLtmEjs4alheaT9i+oRXpbAQOJBW/Ix86BBMr2Go6JwSms+wxEie6wQxZ5AhWGBxGMBlwPY9ohs1r8XLzviQp1a800QL8b9oqr3VlO31yRDzh9WP2ZePVHXgqG4wlI8ltKtXj1Uw/Aom+Vsaqy8DXu7hNCCtADziSMYLvay78my4cOTNDcWJH0PFKl22m2Om1+Zi9m4Wf+3+gam3tZptpK44nDSnvAkr3rLsrCLkIF5KKtKeM8wWVNT7HRhHUAw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1741.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(186003)(122000001)(38100700002)(52536014)(33656002)(107886003)(82960400001)(54906003)(6916009)(9686003)(316002)(2906002)(7696005)(508600001)(6506007)(86362001)(55016003)(66556008)(66446008)(5660300002)(66476007)(66946007)(38070700005)(8676002)(4326008)(64756008)(71200400001)(8936002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjMvclRweUM2VERleHQ5S2dkYW9QaHI1MUhHdkxTNE96SmlNTXRZa0VaNDRS?=
 =?utf-8?B?aHZoUzgvazVBbkV4eklwT1VjYnF2YWFrM0lMdnllNnJpdTk0Wk4vUVArRExt?=
 =?utf-8?B?Vzc5cG1TaWY1RU1NS0RDa0ZlQjdZbHdlTXMyYUpTSHdHdzg4QkpCN3BLR0t6?=
 =?utf-8?B?Z3ZjcGlTOHN2UDJxaDMzMmo3aG5pQjNVUHhTVVJSRXdmTk1VUm5GRkM0TFBi?=
 =?utf-8?B?TzZOTzJ1Z3BDR0JZSzk4VnhFd2Q0NGJOS2lOMnh1ZnpISWRGRWJaeGNUcDIw?=
 =?utf-8?B?dEUxZkpoeDdZMU9BSzAxNkFKWjRmVTQyemVPZzMyLzZYRWxITEoxQUtRYU1Y?=
 =?utf-8?B?bVgyZVJpYzZ1bTExQUxRbGVaWmdUb2x6WkZ0MFUyTzM0cTFHNzM2UmE3VDdr?=
 =?utf-8?B?SW5iSXFiNm1yWDI5UUsyVG1TMDNnYVpuNU5PeWdMYldFcUlpNDJwcHFuSmd3?=
 =?utf-8?B?M0VNWVYzc3J3VDZucVR0dHZESEdHR3ZWbk04a1JIRWdrczZ4bXZKSDRuODVC?=
 =?utf-8?B?bjJkM2FuZCtZb2F3bjdiMlIxV3gyallZS3d4VlUwcHgyZ1lQeDAxdFJZWVlP?=
 =?utf-8?B?QUw2SUN4NXlCaWJoY1pjd1FVTkFSbGZHNXRWQUJFRHBqa0RzWVVGdks4d3pr?=
 =?utf-8?B?enlXSkx3WFM0K3lpNlBSaE92Z2VSYTI3TXZSN0pMUlBjZTFDSzc1THlZRDNv?=
 =?utf-8?B?aThGSWhpWWhuQ0JObDhxWDArTlRwVWY1T21kR0daR1paUFhRQU9DTTB3WmdK?=
 =?utf-8?B?aHBtTnBCNDRFLzJseDgzUVp3QWZ4RjNBZlhud0VZVFFVZ08zVFR3UVlBbDQ2?=
 =?utf-8?B?TEdoV3UrQjNnMnlDNWJjOTdONUFTL21HREIyVllEVUJnUUtFR0lzeDNaMklR?=
 =?utf-8?B?N1Q2TVU4TGM1eG5BQTlEdDVONDdrSlFWY05VNjdYYzJzbWUyYVFrU3RmOVIy?=
 =?utf-8?B?cE9rUWN4L2hjazZMV3JvRXdXWitFM1AwVVNxMDY2WmJ2WlEyQlFEZlJXM2NV?=
 =?utf-8?B?NlFHMVd3M29yNm02WUdhYTUydkpYdFB5OEw0UWw1aXFQK0hXcnRXaWpKMFlD?=
 =?utf-8?B?Nk5mQ25JYlVESlBTVTI4TGRmclNCSUZCbDRUQVdhekd6YTdvdzJXVDV6Rngx?=
 =?utf-8?B?aWx0dTJIVmI0dzE3M3JZNXMwSi81VFhaQlQrWlJLeTFnTnNXZ3BYQ0RQcmph?=
 =?utf-8?B?d3pVOHpJbU1sTERkSS9OWjcyMHhVcy9IMlZVbmJ2T2E4UVpRVlcwdmxCem5X?=
 =?utf-8?B?enRuTDVtSFlSQUJsUmNHUUgzTTZXS0VBWmJROVJsUHVJaHhZcDBKYXIvc0ZC?=
 =?utf-8?B?alllU1F0cFlQZWt0S3l1ZC9GQnNxVk5QREtLbGdaeXdQcTNWYkU2Yk5mS2l4?=
 =?utf-8?B?RXVzYlJNYW5KdGR6M2ZPVllQYzB5VmFQdUFLaXlEeG93djl4eUFldG12TGM1?=
 =?utf-8?B?ZGpOR2xUU3U4SUF1NGhRNi94cytkVldXL2ZZVjBEdWJ0Uk9LR004d0hkM3Vp?=
 =?utf-8?B?aXlJNVhhRmZsWVJUZmNJVEEzemhoWGgxSCtiOWJhYll5RWVCM2wzellqejJ1?=
 =?utf-8?B?RG9aSCtxUzdIVXZuczlOZkpaTlhZaFNVcGltQmhYc3lpaVNKd2RuVzdXYWFl?=
 =?utf-8?B?MnNlai90TmxxTDZQYjI1SFNHdk1pNlg0WFJYV25pQTJyRm96WkRlZlpGMU9X?=
 =?utf-8?B?bDNOK2E5YjB5eXdPbWxldERNdWg0ejZBR3JQVHJTWCtCdWJud3VkZHFSTjMr?=
 =?utf-8?B?SFAvdHdQVFJzd1h0bUJhamJ4YUZ3c2RFWTFya3F5aHlEb1ZMV1VjOS93YVpI?=
 =?utf-8?B?bEowS3F3NUk4ODQ0akN0dWNFNTFGRkxMNS9DczFNQndYa3h1QWNTSTg2NVJS?=
 =?utf-8?B?TW1oMnBqWGFCY0lkS3I3eE0zQUJURk5MUlRJRVNOTVhzZFdzWWtuZTk3Z1ZM?=
 =?utf-8?B?SnJoanR2NFZldU1GM2ZkY2Y2YVBkeWN2enZ6ZTBFcEhTcGRRQ1lISmZzcjN1?=
 =?utf-8?B?c2pib0lQYW4vMThleExNUlk1dmZ4Y3U1ZHJRQVA5cmZ0QnA1bE1FYUU5SzhT?=
 =?utf-8?B?cnpoQnNiNTAwOVFoQ1FXNTRRMmU5aFdTMGZEUWpQY0VRcDJsL0tPWmk5Rndu?=
 =?utf-8?B?VHdZLys2TUxpN25hMDlWYjNkSDExT1E1dXFBdVZ1WSthbE9nQitYcTdXRldt?=
 =?utf-8?Q?8KiOrlH7DlvQAYyXeEhjas8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1741.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a741185-bef9-4f1a-f2a9-08d9fde9a326
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 14:16:55.4988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +6vllGpcI/BtF6X2rKFIgNWvqbSAkty6DR4usYwThO1r8S3SBGyxAcf+wjoWjFQy8QF2BL3uTUD0mRcIcuE+XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5414
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
Cc: Carsten Haitzler <carsten.haitzler@arm.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIA0KPiA+IEhpLA0KPiA+ID4gPiBIaSBBYmhpbmF2LA0KPiA+ID4gPiA+IEhpIExhdXJlbnQN
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9rIHN1cmUsIEkgY2FuIHRha2UgdGhpcyB1cCBidXQgSSBu
ZWVkIHRvIHVuZGVyc3RhbmQgdGhlDQo+ID4gPiA+ID4gcHJvcG9zYWwgYSBsaXR0bGUgYml0IG1v
cmUgYmVmb3JlIHByb2NlZWRpbmcgb24gdGhpcy4gU28gd2Ugd2lsbA0KPiA+ID4gPiA+IGRpc2N1
c3MgdGhpcyBpbiBhbm90aGVyIGVtYWlsIHdoZXJlIHdlIHNwZWNpZmljYWxseSB0YWxrIGFib3V0
IHRoZQ0KPiBjb25uZWN0b3IgY2hhbmdlcy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEFsc28sIEkg
YW0gd2lsbGluZyB0byB0YWtlIHRoaXMgdXAgb25jZSB0aGUgZW5jb2RlciBwYXJ0IGlzIGRvbmUN
Cj4gPiA+ID4gPiBhbmQgbWVyZ2VkIHNvIHRoYXQgYXRsZWFzdCB3ZSBrZWVwIG1vdmluZyBvbiB0
aGF0IGFzIE1TTSBXQg0KPiA+ID4gPiA+IGltcGxlbWVudGF0aW9uIGNhbiBwcm9jZWVkIHdpdGgg
dGhhdCBmaXJzdC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEhpIEphbmkgYW5kIFN1cmFqDQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiBBbnkgY29uY2VybnMgd2l0aCBzcGxpdHRpbmcgdXAgdGhlIHNlcmll
cyBpbnRvIGVuY29kZXIgYW5kDQo+ID4gPiA+ID4gY29ubmVjdG9yIE9SIHJlLSBhcnJhbmdpbmcg
dGhlbT8NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IExldCBtZSBrbm93IGlmIHlvdSBjYW4gZG8gdGhp
cyBPUiBJIGNhbiBhbHNvIHNwbGl0IHRoaXMgdXANCj4gPiA+ID4gPiBrZWVwaW5nIFN1cmFqJ3Mg
bmFtZSBpbiB0aGUgQ28tZGV2ZWxvcGVkIGJ5IHRhZy4NCj4gPiA+ID4gSSB3YXMgYWN0dWFsbHkg
dGhpbmtpbmcgb2YgZmxvYXRpbmcgYSBuZXcgcGF0Y2ggc2VyaWVzIHdpdGggYm90aA0KPiA+ID4g
PiBlbmNvZGVyIGFuZCBjb25uZWN0b3IgcG9pbnRlciBjaGFuZ2VzIGJ1dCB3aXRoIGEgY2hhbmdl
IGluDQo+ID4gPiA+IGluaXRpYWxpemF0aW9uIGZ1bmN0aW9ucyB3aGVyZWluIHdlIGFsbG9jYXRl
IGEgY29ubmVjdG9yIGFuZA0KPiA+ID4gPiBlbmNvZGVyIGluY2FzZSB0aGUgZHJpdmVyIGRvZXNu
4oCZdCBoYXZlIGl0cyBvd24gdGhpcyBzaG91bGQNCj4gPiA+ID4gbWluaW1pemUgdGhlIGVmZmVj
dCBvbiBvdGhlciBkcml2ZXJzIGFscmVhZHkgdXNpbmcgY3VycmVudCBkcm0NCj4gPiA+ID4gd3Jp
dGViYWNrIGZyYW1ld29yayBhbmQgYWxzbw0KPiA+ID4gYWxsb3cgaTkxNSB0byBjcmVhdGUgaXRz
IG93biBjb25uZWN0b3IuDQo+ID4gPg0KPiA+ID4gSSB0aG91Z2h0IHRoYXQgTGF1cmVudCB3YXMg
cXVpdGUgc3RyaWN0IGFib3V0IHRoZSBjb25uZWN0b3IuIFNvIEknZA0KPiA+ID4gc3VnZ2VzdCB0
YXJnZXRpbmcgZHJtX3dyaXRlYmFja19jb25uZWN0b3Igd2l0aCBhbiBvcHRpb25hbGx5IGNyZWF0
ZWQNCj4gPiA+IGVuY29kZXIgYW5kIHRoZSBidWlsdGluIGNvbm5lY3Rvcg0KPiA+IEluIHRoYXQg
Y2FzZSBldmVuIGlmIHdlIHRhcmdldCB0aGF0IGk5MTUgd2lsbCBub3QgYmUgYWJsZSB0byBtb3Zl
DQo+ID4gZm9yd2FyZCB3aXRoIGl0cyBpbXBsZW1lbnRhdGlvbiBvZiB3cml0ZWJhY2sgYXMgYnVp
bHRpbiBjb25uZWN0b3IgZG9lcw0KPiA+IG5vdCB3b3JrIGZvciB1cyByaWdodCBub3cgYXMgZXhw
bGFpbmVkIGVhcmxpZXIsIG9wdGlvbmFsbHkgY3JlYXRpbmcNCj4gPiBlbmNvZGVyIGFuZCBjb25u
ZWN0b3Igd2lsbCBoZWxwIGV2ZXJ5b25lIG1vdmUgZm9yd2FyZCBhbmQgb25jZSBkb25lDQo+IHdl
DQo+ID4gY2FuIGFjdHVhbGx5IHNpdCBhbmQgd29yayBvbiBob3cgdG8gc2lkZSBzdGVwIHRoaXMg
aXNzdWUgdXNpbmcNCj4gPiBMYXVyZW50J3Mgc3VnZ2VzdGlvbg0KPiANCj4gVGhpcyBpcyB1cCB0
byBMYXVyZW50ICYgb3RoZXIgRFJNIG1haW50YWluZXJzIHRvIGRlY2lkZSB3aGV0aGVyIHRoaXMN
Cj4gYXBwcm9hY2ggd291bGQgYmUgYWNjZXB0ZWQgb3Igbm90Lg0KPiBTbyBmYXIgdW5mb3J0dW5h
dGVseSBJIGhhdmUgbW9zdGx5IHNlZW4gdGhlIHB1c2hiYWNrIGFuZCBhIHN0cm9uZw0KPiBzdWdn
ZXN0aW9uIHRvIHN0b3AgdHJlYXRpbmcgZWFjaCBkcm1fY29ubmVjdG9yIGFzIGk5MTVfY29ubmVj
dG9yLg0KPiBJIGhhdmVuJ3QgY2hlY2tlZCB0aGUgZXhhY3QgZGV0YWlscywgYnV0IElNTyBhZGRp
bmcgYSBicmFuY2ggaWYgdGhlDQo+IGNvbm5lY3RvcidzIHR5cGUgaXMgRFJNX0NPTk5FQ1RPUl9W
SVJUVUFMIHNob3VsZCBiZSBkb2FibGUuDQpCcmluZ2luZyBpbiB0aGUgY2hhbmdlIHdoZXJlIHdl
IGRvbuKAmXQgdHJlYXQgZWFjaCBkcm1fY29ubmVjdG9yIGFzDQphbiBpbnRlbF9jb25uZWN0b3Ig
b3IgZXZlbiBhZGRpbmcgYSBicmFuY2ggd2hpY2ggY2hlY2tzIGlmDQpkcm1fY29ubmVjdG9yIGlz
IERSTV9DT05ORUNUT1JfVklSVFVBTCBhbmQgY29uZGl0aW9uYWxseSBjYXN0IGl0DQp0byBpbnRl
bF9jb25uZWN0b3IgaXMgcXVpdGUgYSBsb3Qgb2Ygd29yayBmb3IgaTkxNS4NClRoYXQncyB3aHkg
SSB3YXMgc3VnZ2VzdGluZyBpZiBmb3Igbm93IHdlIGNvdWxkIG1vdmUgZm9yd2FyZCB3aXRoIG9w
dGlvbmFsbHkNCmNyZWF0aW5nIGJvdGggZW5jb2RlciBhbmQgY29ubmVjdG9yIG1pbmltaXppbmcg
YWZmZWN0cyBvbiBvdGhlciBkcml2ZXJzIGFzDQp3ZWxsIGFzIGFsbG93aW5nIHVzIHRvIG1vdmUg
Zm9yd2FyZC4NCldoYXQgZG8geW91IHRoaW5rLCBMYXVucmVudD8NCg0KPiANCj4gPiA+DQo+ID4g
PiA+IFdlIGNhbiB3b3JrIG9uIExhdXJlbnQncyBzdWdnZXN0aW9uIGJ1dCB0aGF0IHdvdWxkIGZp
cnN0IHJlcXVpcmUNCj4gPiA+ID4gdGhlIGluaXRpYWwgUkZDIHBhdGNoZXMgYW5kIHRoZW4gYSBy
ZXdvcmsgZnJvbSBib3RoIG9mIG91ciBkcml2ZXJzDQo+ID4gPiA+IHNpZGUgdG8gc2VlIGlmIHRo
ZXkgZ2VsIHdlbGwgd2l0aCBvdXIgY3VycmVudCBjb2RlIHdoaWNoIHdpbGwgdGFrZQ0KPiA+ID4g
PiBhIGNvbnNpZGVyYWJsZSBhbW91bnQgb2YgdGltZS4gV2UgY2FuIGZvciBub3cgaG93ZXZlciBm
bG9hdCB0aGUNCj4gPiA+ID4gcGF0Y2ggc2VyaWVzIHVwIHdoaWNoIG1pbmltYWxseSBhZmZlY3Rz
IHRoZSBjdXJyZW50IGRyaXZlcnMgYW5kDQo+ID4gPiA+IGFsc28gYWxsb3dzDQo+ID4gPiA+IGk5
MTUgYW5kIG1zbSB0byBtb3ZlIGZvcndhcmQgd2l0aCBpdHMgd3JpdGViYWNrIGltcGxlbWVudGF0
aW9uIG9mZg0KPiA+ID4gPiBjb3Vyc2Ugd2l0aCBhIHByb3BlciBkb2N1bWVudGF0aW9uIHN0YXRp
bmcgbmV3IGRyaXZlcnMgc2hvdWxkbid0DQo+ID4gPiA+IHRyeSB0bw0KPiA+ID4gbWFrZSB0aGVp
ciBvd24gY29ubmVjdG9ycyBhbmQgZW5jb2RlcnMgYW5kIHRoYXQgZHJtX3dyaXRlYmFjayB3aWxs
DQo+ID4gPiBkbyB0aGF0IGZvciB0aGVtLg0KPiA+ID4gPiBPbmNlIHRoYXQncyBkb25lIGFuZCBt
ZXJnZWQgd2UgY2FuIHdvcmsgd2l0aCBMYXVyZW50IG9uIGhpcw0KPiA+ID4gPiBwcm9wb3NhbCB0
byBpbXByb3ZlIHRoZSBkcm0gd3JpdGViYWNrIGZyYW1ld29yayBzbyB0aGF0IHRoaXMgaXNzdWUN
Cj4gPiA+ID4gY2FuIGJlIHNpZGUNCj4gPiA+IHN0ZXBwZWQgZW50aXJlbHkgaW4gZnV0dXJlLg0K
PiA+ID4gPiBGb3Igbm93IEkgd291bGQgbGlrZSB0byBrZWVwIHRoZSBlbmNvZGVyIGFuZCBjb25u
ZWN0b3IgcG9pbnRlcg0KPiA+ID4gPiBjaGFuZ2VzDQo+ID4gPiB0b2dldGhlci4NCj4gPg0KPiAN
Cj4gDQo+IA0KPiAtLQ0KPiBXaXRoIGJlc3Qgd2lzaGVzDQo+IERtaXRyeQ0KDQpCZXN0IFJlZ2Fy
ZHMsDQpTdXJhaiBLYW5kcGFsDQo=
