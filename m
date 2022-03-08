Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE54D1A98
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 15:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF7D10E400;
	Tue,  8 Mar 2022 14:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418DD10E2BD;
 Tue,  8 Mar 2022 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646749829; x=1678285829;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pYu9pjPBHXNy5DJVA9jQw6ar7KwvJFtDx5xs7e4PBxc=;
 b=U63TrUK82WckelrsHOnD3V4lpBWf0HNTc42Yrkz+NyKxQqJ1utAeARd3
 FRTzXEhSKxeJWJD1vHjFn74FEPtabrfwy0LmCPOwAwtAh7G+O0f8Rfv24
 BiQZtn/LR0nL6nU18m5PJNSQPGqkCCCJXdcpOuVPM7bKLL00xV1Wm7Ekg
 aUshEWiXd0KPNgswivbcvrDGHp+wuFW7L6riLgwI1TiI2BqhrPM6wxrPs
 Q1ynolGjGUUlCuOdnYsyq/RILntzEkpDS+FJ8jk3Eeaf3ysRXSvGS3oXZ
 XIyo1gZRYdcSy25orBAGPzpVcKptFrxcvSm/muFzQB0MhT5aPN5cHLRVI A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254422144"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="254422144"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:30:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="632244329"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2022 06:30:22 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 06:30:22 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 06:30:21 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 8 Mar 2022 06:30:21 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 8 Mar 2022 06:30:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSrklvrwGqKopijKzNe/7v5PqnImCsNfwqgl6ll5jPCitx6H7B5lEkEpA0P2rLu84gBceS8KTXm32hXXBu06CUYFD4rAe4SkLw/c4Y/+j5QBz2OcXWagsNRBiH7OhnkljomXURQp/nCcUgtYLmvkUKkXATE+tEt1GUjaIe63lcbGb1xpLNKL4hwB2fFa8umtEbkmFVCV2Ny6xSvra8Hr6PBq8OzUN/OFuHZYeEjGiItS0Fz0MP4neBNSord9E4HyTQcnl5YVbmjgst/ZiJ7/l2hDi8lbo0H6m1r59JIFiOM+/lR2nXsW4+sW3aAGXdlqyoEtbFUIB/ZS6EhmkYbnZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYu9pjPBHXNy5DJVA9jQw6ar7KwvJFtDx5xs7e4PBxc=;
 b=UQL7jA+PdfSUJP/Ckk/czhTWuCpHpeiUqMrLDtXvlyV7ZLUMq4FFUOcP5/tYLHBBeYmh+dTIK2DlM6CNdEvnp9w1tRmCD8zfpEorRdbgRi0YaLyVMsqdD5aAFIe0BuRoF4w+omZuXRx/HxzbXGdhZbhSnmUHuy691q381aYgTj9eOjYpFie8zi3CVfwEB9Tg168Kbn4a00lyeziRu/e+9OAizXkSIOuWiBNueZ2qXcKs46OHUed2cAzmM7UyhN2ZuV1494KgObuCt8xTu/fyzvzpe/meSVaqgCVeWoadC4mpM6WaWYCpXpxKuygFYuhWGvq9LmR9B0sZEACCV5HzMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB1741.namprd11.prod.outlook.com (2603:10b6:300:10d::20)
 by MN2PR11MB3983.namprd11.prod.outlook.com (2603:10b6:208:137::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 14:30:15 +0000
Received: from MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::216d:6bf4:d46c:f133]) by MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::216d:6bf4:d46c:f133%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 14:30:15 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
Thread-Topic: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting
 from drm_writeback_connector structure changes
Thread-Index: AQHYGBFjkzht//tf006vXTl+IOhLcKyANJuAgAAJCYCAAAMWAIAAJNoAgCXncoCAAnYugIAARKuAgAAFXYCAABSgAIADdIKAgAABCACAAYHWAIABC+0ggAATFQCAAACv0IAADC0AgAAspxCAAHAdgIAF3gPw
Date: Tue, 8 Mar 2022 14:30:15 +0000
Message-ID: <MWHPR11MB1741B36C4BA59CDF84D9F52EE3099@MWHPR11MB1741.namprd11.prod.outlook.com>
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
 <MWHPR11MB174170C633719C9CBAC0DE18E3059@MWHPR11MB1741.namprd11.prod.outlook.com>
 <9ae6ae27-b8fb-712a-64ec-c5e069059689@quicinc.com>
In-Reply-To: <9ae6ae27-b8fb-712a-64ec-c5e069059689@quicinc.com>
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
x-ms-office365-filtering-correlation-id: 5010257e-fc90-46b9-0ab8-08da011029a4
x-ms-traffictypediagnostic: MN2PR11MB3983:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB39837BEC85AE09809C0F12FCE3099@MN2PR11MB3983.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g9uFsdK400LWKhe/yhQUiIeITFJ8wn8lx3pvQ0saYdCjhPzclt8+WPrmwoNPxOGJNSGSFNf2wINqfsWNqdhGd2Cej+dbpb4g0NCr8CNubfNlgXMqYVIvBB7aKdo2lL9kynIniLiTWRNdFQp5NpD+muWoSZYQTRuuru4i/vx14iy6eRA/GRUA8QPIQ24jXXqe3k5VJjtUN8OZy9x+gJbMZlaOGaLJeIaQvfntSmKLN3lTQraweTnNO8lYVz7lc97qoGtYP0shvyhNFjuje9K6G9hPIAOkOvakMxXyOupUHsMCsaEyB1Bff4t+19MqOsW4TwyfLW6BPCxjEaNdMspC1p8SfreV2Z76S6plRunIwHt//muLa+/QPULWeF8RJ/aunjfRAJ2UpXpZ8BlT5Lp/vEhDLBR5Ja4f6AHhDL8QF8vcIjkVKdXK+CiuPMqWlUFVOeZTiuPDXIX05UWcC6YTt3urtyLL52xN7wgZwPhVW7wQW0y0F9hSefI5zUijnsaPRc8/c+6RVKSJdtfh/0L/dLnZSI16bNosCz0Hd9FcBDv9ktX9eD3VO3ezLdjxthfj1B2bmry5gZpb9Rd1QRZo6KuvFUzthpE6mlI74ZPx4tndRFqZTTfF7C7zSVhntn7gNHeWEPhCYZ6uLq7oqfpI6+osdOENhh34tgJwO3suw/hOfreHK2xkhhA1z+HleW8Wogt8xFxfF7djwocLupE0mQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1741.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(5660300002)(6506007)(7696005)(33656002)(52536014)(8936002)(508600001)(9686003)(76116006)(2906002)(107886003)(186003)(26005)(4326008)(8676002)(64756008)(66476007)(66946007)(66556008)(66446008)(38100700002)(110136005)(38070700005)(122000001)(82960400001)(55016003)(316002)(71200400001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWRjTTZpMkRLekFIYy9wd0xMeWE4WjdPa0hjUWJwaGQxV21nYktzSkJOZ2Zq?=
 =?utf-8?B?dFNmZjU0Z2VXTEl1dGpkSWc5eG5FVVM0YkJkUjJxeTk0Y3AzeWhrYUtqaG5B?=
 =?utf-8?B?cDl4RW1UU1pmT0VOV2dLQTE5QTVxeU9keUZnbFhTYXFTejg3bWFETHVCOHFr?=
 =?utf-8?B?bFpxUFdxdCt2Y0p5RWRPdGR3WHBmYnRaNUlGWkREY2lYYVEvcll1dHM4VWNJ?=
 =?utf-8?B?aEdkeEFyQjFCNWNZWEx3MnVXSGl4STl0c2ZZQzlwZlRiQnFtVVVibEpGd3NZ?=
 =?utf-8?B?SjRtYWVBMGxHNHJuYWpzNzZrL082cjR1Q2pVRnBjK00yMlVSU1hxaVRWK0d5?=
 =?utf-8?B?KzFCOWFyTEE1VFVkU0VUTGV2ZG1vWHpyNFBmTDBqYzZvek9uKzhiQVQ2T0Jv?=
 =?utf-8?B?K1d5WS9INklFUDVCd2ZFTXN3MTluL2l6bXY3bUlVdk5abmZMRnM5N2kwMkI2?=
 =?utf-8?B?M1hrVUNhVmVvM1ZIOVBVWU5xbWwxblUxbDlBYXdSL2N6a1U1TCt4c01tTktq?=
 =?utf-8?B?d0Y0UjFLNHpFMG5GRkVaWnE2QnFjd2JQYzliR3V2WHo0cHRPYWpxNUlkZjVx?=
 =?utf-8?B?SWhIamtjSnN0bWhqc0x1b1YzY21jYXIzdWFsT0NQcGUyZS84Nmd4a3ZTWG5x?=
 =?utf-8?B?V2k1aGE4YlZWMlhNQ083bTRFTkZLNmE3NTJVSXZoY21GWXhPVWJ3TngyR05i?=
 =?utf-8?B?RWxKQmFDVnNIbzNkdDkxRHJoSEJzc3JoYnNQZ1FkMWg2cGwzNXJEOVk4S2gw?=
 =?utf-8?B?cTNrWU9STUZoZnZ2S1Ribnc5bDRxYmJ2bEZ1OWdWMjdyQ0dIcVJPd25JMU82?=
 =?utf-8?B?bjMyaGVJaEwwT0tMZFp0Q2NiUGVjUUEySDQvQUZvVHBGT2hQMVloY1VTTm1V?=
 =?utf-8?B?TW1VaU14ejVZUWtBUnJFb05oNTNFZXRxNWVFd21MR0s2RGZFekRGRDRzMzBa?=
 =?utf-8?B?Vm8zWTM5aGU0bmVWTWhCejR1ZmJ2TFh0U2FvNnI3ODlOeUZZL09iM3Y1eXlv?=
 =?utf-8?B?QlNOTmVEOFFiaXNSRmR5Lzk0YnYyV0FlLzBxNkFqK01UclZPTlJVYVZyR3ph?=
 =?utf-8?B?dWpuZDV1ODhwMk9ZVkpKNDJBTmJwVWFhMnVpWVFkdWJHMDNLa1NHUytYblVv?=
 =?utf-8?B?Q1VHa3cybnFqdkVrZ2J2VU44TXJmd3Vvckx3N0VOdE9tQ0JXcUZhcUIyYnFi?=
 =?utf-8?B?QmNFZUV3Wnp2NVlGNG9vSDducUhaRi9NZEkyclRoL0draUtZbTJUM0FZNnND?=
 =?utf-8?B?QXJoc1NCazJEUjQwUGtDdHAvZDNjdFFISkIra3BlZWlSSEJHcHVHSFVDanZx?=
 =?utf-8?B?MjBlMC9XdkpYTmxlS3VpVVdIOU43QjZvZDlEL2YvSUtsRWU0ZHUwYXVMTDlJ?=
 =?utf-8?B?NjgzS1BkbTIxdk5KSnVmU0RBM3NRRGhCYWpsMmlEWEZJSTdaSHB5S1UvS2tr?=
 =?utf-8?B?M090blhiT0M1M1IxRVBMQUs5UVViSkNtSXJyKzF0d2V5NkM4UHY3YTNDdC9l?=
 =?utf-8?B?eXJ6YXJQR1FkRWlvaVFab1RKRFhiRFVObUV6MW8zeU80TkhsYWZzTzdkRC9a?=
 =?utf-8?B?TGdDVUR2UTBGb2lxWkhKUS9nWGlkTjF5MzVxWHpFSy8wRytDNDlyNUpjNE9O?=
 =?utf-8?B?SW93MTZwODhYU09vU2YwcTVONHphbitMZzBMcm9hbFgvU2svZktiZmhsVHpH?=
 =?utf-8?B?NE5SM3Zjd0JlcHh2bmw4a2VWTG82TEJBRm5XdzYrWjg5M1ZYYzRGQ2NTa05k?=
 =?utf-8?B?N3NhRGpPcGtmQWNUYllOYWpEc1BSUTBzenhiM3dEMTZOUE9maVBmZy9ra3Bm?=
 =?utf-8?B?L3VhRDJ5bGR4V09LZ0RQTUQrbWF0MENkeTlxVlBoUDE1ODFVdy9Kc0MyTG1v?=
 =?utf-8?B?YTNTaVlkdUNqeTRxZzYrRnFQemhkZjJqZ216cGZUQkREMXdnbHd5ZXh3bzc2?=
 =?utf-8?B?Q05EaHdqR2MxZjZld0J2OGFMeUY1YU1FV2FCazRvdUVROS80R0lNSElNalJG?=
 =?utf-8?B?a2FITnhaMlExQnFlYjFsejBFOEoveThybnB3bVRMSzFsbVpSMFVlcks3MGYw?=
 =?utf-8?B?cEdlbGJBcExWNmhyVEpMU3Nldmx2dzVoeVdZV2h0dVJyNmlvb1pmUGVaSDVT?=
 =?utf-8?B?VmYxTGY5Q1dBU2FXT2FnbEI4aE9OeElIVWh4Q3VCU21VaEkwZ0V3eitROGVR?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1741.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5010257e-fc90-46b9-0ab8-08da011029a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 14:30:15.4817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5mjaLmqb/4ElQKnPK9JJtDYFj+ZNFRjCBhsBhZLbN3hCfLmhIIoUGXImz1ooZBSTii03W14hOAZl+jDxZSh8HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3983
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
 Jani" <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel
 Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWJoaW5hdiwNCj4gPiBIaSwNCj4gPj4+IEhpLA0KPiA+Pj4+PiBIaSBBYmhpbmF2LA0KPiA+
Pj4+Pj4gSGkgTGF1cmVudA0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IE9rIHN1cmUsIEkgY2FuIHRha2Ug
dGhpcyB1cCBidXQgSSBuZWVkIHRvIHVuZGVyc3RhbmQgdGhlIHByb3Bvc2FsDQo+ID4+Pj4+PiBh
IGxpdHRsZSBiaXQgbW9yZSBiZWZvcmUgcHJvY2VlZGluZyBvbiB0aGlzLiBTbyB3ZSB3aWxsIGRp
c2N1c3MNCj4gPj4+Pj4+IHRoaXMgaW4gYW5vdGhlciBlbWFpbCB3aGVyZSB3ZSBzcGVjaWZpY2Fs
bHkgdGFsayBhYm91dCB0aGUNCj4gPj4gY29ubmVjdG9yIGNoYW5nZXMuDQo+ID4+Pj4+Pg0KPiA+
Pj4+Pj4gQWxzbywgSSBhbSB3aWxsaW5nIHRvIHRha2UgdGhpcyB1cCBvbmNlIHRoZSBlbmNvZGVy
IHBhcnQgaXMgZG9uZQ0KPiA+Pj4+Pj4gYW5kIG1lcmdlZCBzbyB0aGF0IGF0bGVhc3Qgd2Uga2Vl
cCBtb3Zpbmcgb24gdGhhdCBhcyBNU00gV0INCj4gPj4+Pj4+IGltcGxlbWVudGF0aW9uIGNhbiBw
cm9jZWVkIHdpdGggdGhhdCBmaXJzdC4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBIaSBKYW5pIGFuZCBT
dXJhag0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEFueSBjb25jZXJucyB3aXRoIHNwbGl0dGluZyB1cCB0
aGUgc2VyaWVzIGludG8gZW5jb2RlciBhbmQNCj4gPj4+Pj4+IGNvbm5lY3RvciBPUiByZS0gYXJy
YW5naW5nIHRoZW0/DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gTGV0IG1lIGtub3cgaWYgeW91IGNhbiBk
byB0aGlzIE9SIEkgY2FuIGFsc28gc3BsaXQgdGhpcyB1cA0KPiA+Pj4+Pj4ga2VlcGluZyBTdXJh
aidzIG5hbWUgaW4gdGhlIENvLWRldmVsb3BlZCBieSB0YWcuDQo+ID4+Pj4+IEkgd2FzIGFjdHVh
bGx5IHRoaW5raW5nIG9mIGZsb2F0aW5nIGEgbmV3IHBhdGNoIHNlcmllcyB3aXRoIGJvdGgNCj4g
Pj4+Pj4gZW5jb2RlciBhbmQgY29ubmVjdG9yIHBvaW50ZXIgY2hhbmdlcyBidXQgd2l0aCBhIGNo
YW5nZSBpbg0KPiA+Pj4+PiBpbml0aWFsaXphdGlvbiBmdW5jdGlvbnMgd2hlcmVpbiB3ZSBhbGxv
Y2F0ZSBhIGNvbm5lY3RvciBhbmQNCj4gPj4+Pj4gZW5jb2RlciBpbmNhc2UgdGhlIGRyaXZlciBk
b2VzbuKAmXQgaGF2ZSBpdHMgb3duIHRoaXMgc2hvdWxkDQo+ID4+Pj4+IG1pbmltaXplIHRoZSBl
ZmZlY3Qgb24gb3RoZXIgZHJpdmVycyBhbHJlYWR5IHVzaW5nIGN1cnJlbnQgZHJtDQo+ID4+Pj4+
IHdyaXRlYmFjayBmcmFtZXdvcmsgYW5kIGFsc28NCj4gPj4+PiBhbGxvdyBpOTE1IHRvIGNyZWF0
ZSBpdHMgb3duIGNvbm5lY3Rvci4NCj4gPj4+Pg0KPiANCj4gSSB3YXMgcHJvcG9zaW5nIHRvIHNw
bGl0IHVwIHRoZSBlbmNvZGVyIGFuZCBjb25uZWN0b3IgYmVjYXVzZSB0aGUNCj4gY29tbWVudHMg
ZnJvbSBMYXVyZW50IG1lYW50IHdlIHdlcmUgaW4gYWdyZWVtZW50IGFib3V0IHRoZSBlbmNvZGVy
DQo+IGJ1dCBub3QgYWJvdXQgdGhlIGNvbm5lY3Rvci4NCj4gDQo+IEkgYW0gYWZyYWlkIGFub3Ro
ZXIgYXR0ZW1wdCB3aXRoIHRoZSBzaW1pbGFyIGlkZWEgaXMgb25seSBnb2luZyB0byBzdGFsbCB0
aGUNCj4gc2VyaWVzIGFnYWluIGFuZCBoZW5jZSBpIGdhdmUgdGhpcyBvcHRpb24uDQoNClNlZW1z
IGxpa2UgdGhpcyBwYXRjaCBzZXJpZXMgY3VycmVudGx5IHdvbid0IGJlIGFibGUgdG8gbW92ZSBm
b3J3YXJkIHdpdGggdGhlDQpjb25uZWN0b3IgcG9pbnRlciBjaGFuZ2Ugc28gSSBndWVzcyB5b3Ug
Y2FuIHNwbGl0IHRoZSBzZXJpZXMgdG8gZW5jb2RlciBwb2ludGVyDQpjaGFuZ2Ugd2hlcmUgd2Ug
b3B0aW9uYWxseSBjcmVhdGUgZW5jb2RlciBpZiByZXF1aXJlZCAsa2VlcGluZyBteSBuYW1lIGlu
IA0KY28tZGV2ZWxvcGVkIHRhZyBzbyB0aGF0IG1zbSBjYW4gbW92ZSBmb3J3YXJkIHdpdGggaXRz
IGltcGxlbWVudGF0aW9uIGFuZA0KdGhlbiB3ZSBjYW4gd29yayB0byBzZWUgaG93IHRoZSBjb25u
ZWN0b3IgaXNzdWUgY2FuIGJlIGJ5cGFzc2VkLg0KDQpCZXN0IFJlZ2FyZHMsDQpTdXJhaiBLYW5k
cGFsDQo+IEV2ZW50dWFsbHkgaXRzIHVwdG8gTGF1cmVudCBhbmQgdGhlIG90aGVyIG1haW50YWlu
ZXJzIHRvIGd1aWRlIHVzIGZvcndhcmQgb24NCj4gdGhpcyBhcyB0aGlzIHNlcmllcyBoYXMgYmVl
biBzdGFsbGVkIGZvciB3ZWVrcyBub3cuDQo+IA0KPiA+Pj4+IEkgdGhvdWdodCB0aGF0IExhdXJl
bnQgd2FzIHF1aXRlIHN0cmljdCBhYm91dCB0aGUgY29ubmVjdG9yLiBTbyBJJ2QNCj4gPj4+PiBz
dWdnZXN0IHRhcmdldGluZyBkcm1fd3JpdGViYWNrX2Nvbm5lY3RvciB3aXRoIGFuIG9wdGlvbmFs
bHkNCj4gPj4+PiBjcmVhdGVkIGVuY29kZXIgYW5kIHRoZSBidWlsdGluIGNvbm5lY3Rvcg0KPiA+
Pj4gSW4gdGhhdCBjYXNlIGV2ZW4gaWYgd2UgdGFyZ2V0IHRoYXQgaTkxNSB3aWxsIG5vdCBiZSBh
YmxlIHRvIG1vdmUNCj4gPj4+IGZvcndhcmQgd2l0aCBpdHMgaW1wbGVtZW50YXRpb24gb2Ygd3Jp
dGViYWNrIGFzIGJ1aWx0aW4gY29ubmVjdG9yDQo+ID4+PiBkb2VzIG5vdCB3b3JrIGZvciB1cyBy
aWdodCBub3cgYXMgZXhwbGFpbmVkIGVhcmxpZXIsIG9wdGlvbmFsbHkNCj4gPj4+IGNyZWF0aW5n
IGVuY29kZXIgYW5kIGNvbm5lY3RvciB3aWxsIGhlbHAgZXZlcnlvbmUgbW92ZSBmb3J3YXJkIGFu
ZA0KPiA+Pj4gb25jZSBkb25lDQo+ID4+IHdlDQo+ID4+PiBjYW4gYWN0dWFsbHkgc2l0IGFuZCB3
b3JrIG9uIGhvdyB0byBzaWRlIHN0ZXAgdGhpcyBpc3N1ZSB1c2luZw0KPiA+Pj4gTGF1cmVudCdz
IHN1Z2dlc3Rpb24NCj4gPj4NCj4gPj4gVGhpcyBpcyB1cCB0byBMYXVyZW50ICYgb3RoZXIgRFJN
IG1haW50YWluZXJzIHRvIGRlY2lkZSB3aGV0aGVyIHRoaXMNCj4gPj4gYXBwcm9hY2ggd291bGQg
YmUgYWNjZXB0ZWQgb3Igbm90Lg0KPiA+PiBTbyBmYXIgdW5mb3J0dW5hdGVseSBJIGhhdmUgbW9z
dGx5IHNlZW4gdGhlIHB1c2hiYWNrIGFuZCBhIHN0cm9uZw0KPiA+PiBzdWdnZXN0aW9uIHRvIHN0
b3AgdHJlYXRpbmcgZWFjaCBkcm1fY29ubmVjdG9yIGFzIGk5MTVfY29ubmVjdG9yLg0KPiA+PiBJ
IGhhdmVuJ3QgY2hlY2tlZCB0aGUgZXhhY3QgZGV0YWlscywgYnV0IElNTyBhZGRpbmcgYSBicmFu
Y2ggaWYgdGhlDQo+ID4+IGNvbm5lY3RvcidzIHR5cGUgaXMgRFJNX0NPTk5FQ1RPUl9WSVJUVUFM
IHNob3VsZCBiZSBkb2FibGUuDQo+ID4gQnJpbmdpbmcgaW4gdGhlIGNoYW5nZSB3aGVyZSB3ZSBk
b27igJl0IHRyZWF0IGVhY2ggZHJtX2Nvbm5lY3RvciBhcyBhbg0KPiA+IGludGVsX2Nvbm5lY3Rv
ciBvciBldmVuIGFkZGluZyBhIGJyYW5jaCB3aGljaCBjaGVja3MgaWYgZHJtX2Nvbm5lY3Rvcg0K
PiA+IGlzIERSTV9DT05ORUNUT1JfVklSVFVBTCBhbmQgY29uZGl0aW9uYWxseSBjYXN0IGl0IHRv
IGludGVsX2Nvbm5lY3Rvcg0KPiA+IGlzIHF1aXRlIGEgbG90IG9mIHdvcmsgZm9yIGk5MTUuDQo+
ID4gVGhhdCdzIHdoeSBJIHdhcyBzdWdnZXN0aW5nIGlmIGZvciBub3cgd2UgY291bGQgbW92ZSBm
b3J3YXJkIHdpdGgNCj4gPiBvcHRpb25hbGx5IGNyZWF0aW5nIGJvdGggZW5jb2RlciBhbmQgY29u
bmVjdG9yIG1pbmltaXppbmcgYWZmZWN0cyBvbg0KPiA+IG90aGVyIGRyaXZlcnMgYXMgd2VsbCBh
cyBhbGxvd2luZyB1cyB0byBtb3ZlIGZvcndhcmQuDQo+ID4gV2hhdCBkbyB5b3UgdGhpbmssIExh
dW5yZW50Pw0KPiA+DQo+ID4+DQo+ID4+Pj4NCj4gPj4+Pj4gV2UgY2FuIHdvcmsgb24gTGF1cmVu
dCdzIHN1Z2dlc3Rpb24gYnV0IHRoYXQgd291bGQgZmlyc3QgcmVxdWlyZQ0KPiA+Pj4+PiB0aGUg
aW5pdGlhbCBSRkMgcGF0Y2hlcyBhbmQgdGhlbiBhIHJld29yayBmcm9tIGJvdGggb2Ygb3VyIGRy
aXZlcnMNCj4gPj4+Pj4gc2lkZSB0byBzZWUgaWYgdGhleSBnZWwgd2VsbCB3aXRoIG91ciBjdXJy
ZW50IGNvZGUgd2hpY2ggd2lsbCB0YWtlDQo+ID4+Pj4+IGEgY29uc2lkZXJhYmxlIGFtb3VudCBv
ZiB0aW1lLiBXZSBjYW4gZm9yIG5vdyBob3dldmVyIGZsb2F0IHRoZQ0KPiA+Pj4+PiBwYXRjaCBz
ZXJpZXMgdXAgd2hpY2ggbWluaW1hbGx5IGFmZmVjdHMgdGhlIGN1cnJlbnQgZHJpdmVycyBhbmQN
Cj4gPj4+Pj4gYWxzbyBhbGxvd3MNCj4gPj4+Pj4gaTkxNSBhbmQgbXNtIHRvIG1vdmUgZm9yd2Fy
ZCB3aXRoIGl0cyB3cml0ZWJhY2sgaW1wbGVtZW50YXRpb24gb2ZmDQo+ID4+Pj4+IGNvdXJzZSB3
aXRoIGEgcHJvcGVyIGRvY3VtZW50YXRpb24gc3RhdGluZyBuZXcgZHJpdmVycyBzaG91bGRuJ3QN
Cj4gPj4+Pj4gdHJ5IHRvDQo+ID4+Pj4gbWFrZSB0aGVpciBvd24gY29ubmVjdG9ycyBhbmQgZW5j
b2RlcnMgYW5kIHRoYXQgZHJtX3dyaXRlYmFjayB3aWxsDQo+ID4+Pj4gZG8gdGhhdCBmb3IgdGhl
bS4NCj4gPj4+Pj4gT25jZSB0aGF0J3MgZG9uZSBhbmQgbWVyZ2VkIHdlIGNhbiB3b3JrIHdpdGgg
TGF1cmVudCBvbiBoaXMNCj4gPj4+Pj4gcHJvcG9zYWwgdG8gaW1wcm92ZSB0aGUgZHJtIHdyaXRl
YmFjayBmcmFtZXdvcmsgc28gdGhhdCB0aGlzIGlzc3VlDQo+ID4+Pj4+IGNhbiBiZSBzaWRlDQo+
ID4+Pj4gc3RlcHBlZCBlbnRpcmVseSBpbiBmdXR1cmUuDQo+ID4+Pj4+IEZvciBub3cgSSB3b3Vs
ZCBsaWtlIHRvIGtlZXAgdGhlIGVuY29kZXIgYW5kIGNvbm5lY3RvciBwb2ludGVyDQo+ID4+Pj4+
IGNoYW5nZXMNCj4gPj4+PiB0b2dldGhlci4NCj4gPj4+DQo+ID4+DQo=
