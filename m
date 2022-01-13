Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E82648E66B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 09:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC4C10EA1C;
	Fri, 14 Jan 2022 08:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8E910F6BA;
 Thu, 13 Jan 2022 11:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1642073670; x=1642678470;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/PYcy18J578MRAxNpcaU+A84EmlZrs7/u/NnY89zzdM=;
 b=eLIQWP5zAsZCFtj1K8jQEo/giqZJRgyn5G8K3E/1QmKyPomI9cpqPsnZ
 6zlikti/8WQsJmj1KLE0zZupsY/n1/kwMY85Uo96rd2dlfSOxPhJhhOct
 +0QKznrRRYH0d5LU5Wjp+p3ig3+0Oap4e5R/AFC7pwkvF9cYch4vecN2l M=;
Received: from mail-bn8nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.177])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 11:34:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMJRoyUuRbkg8pkDAbPL0BG+RP1YxDuFX45hd3kbFkLNNlUUhFpdlcxLCDbaAgm7Mv6/vUzzMh2kLhAZJttYLmiUfoxVci1jQXzR3j6oWcgtbxaqa+cApfAcmi2ngj84ta1pcJLMfbaBkn+jpxintjG1ZDsBRHY2WcylEo08Ump+qIkas474hs6skPkTqnX1BAtsy4zAWw7eieS3qFzamC/bIaYdfASu2JE1m2dvbMpudV+RMEUNZ0lPiuj3+49W/zGaqOnDiXYcApIbkiWQb4CCRanXCGY66o7zZWC4WTMO13k7ltPIQcHNcytTgSCI3APsO8I7dBuEFMCEtHMtzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PYcy18J578MRAxNpcaU+A84EmlZrs7/u/NnY89zzdM=;
 b=fDJxEXAgEFHDoi0Q7LBQmn7lFn0okqm1FCMywifiBm94Wy+BFytcGNGF67J+d9223pMJf9qi/Wm95VVr1RZnnraJdDsaelDGSTEWuKAH5QprIB/FeANgdjQfMPkWBKGSWuqHS72D48tW1EfcJG/A2XNlTiDZtG+BtYhPRBHEM2/KOHLedOzQRDVguPk6YisbFfzAMFqBnp0dF/Yn3HkJNybEvA/NlGjr01FQuoD6uBW3Rql4WxRNN8k7z5sF5NCF6ITsRuty4twPcyKikP5xha8hdQ3MXmaZw4q5HCi/CUfwf1CMwubwQliFcADbNyGQtgZ1wT0ySACcKwt4+H3YWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MW2PR02MB3820.namprd02.prod.outlook.com (2603:10b6:907:c::16)
 by MW4PR02MB7316.namprd02.prod.outlook.com (2603:10b6:303:76::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Thu, 13 Jan
 2022 11:34:24 +0000
Received: from MW2PR02MB3820.namprd02.prod.outlook.com
 ([fe80::d941:6af6:1ee:d00f]) by MW2PR02MB3820.namprd02.prod.outlook.com
 ([fe80::d941:6af6:1ee:d00f%5]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 11:34:24 +0000
From: Rajeev Nandan <RAJEEVNY@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
Subject: RE: [v2 2/3] drm/msm/dsi: Add dsi phy tuning configuration support
Thread-Topic: [v2 2/3] drm/msm/dsi: Add dsi phy tuning configuration support
Thread-Index: AQHYBiFyuvcnl+olxE6SmJwn9wyQIaxcS+KAgAM29OCAAB7bgIABLXFQ
Date: Thu, 13 Jan 2022 11:34:23 +0000
Message-ID: <MW2PR02MB3820B9DC4E8E55A1AC872168EA539@MW2PR02MB3820.namprd02.prod.outlook.com>
References: <1641819337-17037-1-git-send-email-quic_rajeevny@quicinc.com>
 <1641819337-17037-3-git-send-email-quic_rajeevny@quicinc.com>
 <CAA8EJpr_iEvv3oM-KteT7or3HyMk45Z8mzWyKwZ=rnASm-hNXA@mail.gmail.com>
 <MW2PR02MB3820E98516A4F484A3ECF25FEA529@MW2PR02MB3820.namprd02.prod.outlook.com>
 <CAA8EJpqdrmnhDFd7kYyt1E+8U5sUjiR+oR1DoMX72iZjAE5QXw@mail.gmail.com>
In-Reply-To: <CAA8EJpqdrmnhDFd7kYyt1E+8U5sUjiR+oR1DoMX72iZjAE5QXw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd8b2106-9b85-4726-bcfb-08d9d688a623
x-ms-traffictypediagnostic: MW4PR02MB7316:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <MW4PR02MB7316717F7600152DCF61303BEA539@MW4PR02MB7316.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0IOpKpuvDSsUDJiIcDiSOFb78lH+/iIuu3oBCI48bYALwiRntZe4n+Sw/VI0yUEhonEbp8tGbKOTUroqneVhOgTPiHkZfFRhOkb5/t/t3VXuoeHFX/ku8tWyK+pvvVhhWCYje/ddR8zQc9gv71OpwAVUzYt7WTxEblfwNYWpcu5hQdkxUkLWXExWWPtCv1LNReLYFHH1i1sDF/LNEkcgijAwLUowkHTZ+pLYUCo3YJKd72yIanwT4JqlO8TrvrSfr8xoSQbBvVi4pUGNgzmOKY8pbUoIrYZR4MU7izdoMygDBQJopoU5DyjMjDWFRdqo8jxvgizewVkYG3D1sPkzL4uzV1Fke8qZ9Nr3nLpsecLoGDV1Tzoo2b27ypzFxS+8HqM8fxgBYkJ6ayFSVxnvBlxR1UBOl9G4KrXo6SZ5tvLre5sjXoL/7hlbjKGHypBe8/omBzCPc8VqLcUdceCXA4nY4COUgRabEaBObgdNpfu3CmxrN4jc/rDKEpoE4dVHcbBe2eajSTVaK3fUtV+fKWF6D88KCTPq1dbedfkPuEA4n6kJwXP0EAjwFwlw+SsnkC1OLBTk5gmsBfVwD6GLaQKwP/a4DPusALJ2CqW/XQ6CJTbgMHtRXRWhu+4EZDvcsT7orZtdXiSvE3o+aSd+qPYbPeCyD1UrUjEJHgMy31Ixdl8lwALc7R+iP5lvDrlpGNcoKWU2CBINEAxQ26Ih2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3820.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(55016003)(9686003)(7416002)(26005)(2906002)(83380400001)(71200400001)(7696005)(508600001)(66946007)(6506007)(76116006)(4326008)(64756008)(33656002)(66476007)(66556008)(8936002)(52536014)(38100700002)(86362001)(8676002)(122000001)(316002)(186003)(6916009)(66446008)(54906003)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1pzS2VodHEyR2lJVzJLQk0rVjZCOWZ6Z0VvNGRhWHRsbGtKTkdJUTF3RmNZ?=
 =?utf-8?B?bVlGWGc4TUVVbDRZS3JabjJxUWRhU00xNnV1QlRHTEUwa0lPWU1BQS9iTnR0?=
 =?utf-8?B?UnRvTmVtc3RNWXZLSERLRnJna2ZkREdlNUVoRkZuZjNMZWZTcSt0U2I1TUVV?=
 =?utf-8?B?dGxacHpiOXRTUGxDcXc0L3Q0YjFLODVGdDZybnJJUDRYREV5SG4xckdQSStS?=
 =?utf-8?B?Q2tzQ2JKM1A3bnU1NUh6citiL2V6YnV2MHdtUjVPaGRkbjZiSmNEQTFjTG1W?=
 =?utf-8?B?NXZxUkFiU2pPeEllcXljcW5YT3FBV2RYSXlxZmZCR0EzL0FHZUpoSk1YZmpv?=
 =?utf-8?B?c1VkVEhFUFl3YkhGRWo0bFZTUGtEYzEyZmd6QWpyY1B6eDNFNkYxZFozemdm?=
 =?utf-8?B?MzRtQUovaHkxM1U3THZpU0VVL2FtVVBhR2VKWHdWOVBGN0JNcnpScWcxb3VN?=
 =?utf-8?B?NmFjeXBRNFV3RmNqdUUyVGNNMU9kUnEwRHJUT1czbThPeS8reDBBZ1Zhb2lo?=
 =?utf-8?B?MFhzRERIZ2ZZRHgwclRoektGb29IUVFFWVRmTjM3Ry9RaE9JdlFBZlovSjN0?=
 =?utf-8?B?UlltODVDTzkyREUvbXkxTzVhOHFGZDdQLzN6Q2ZpOUZWcnhNTzVDMUxDaEQv?=
 =?utf-8?B?cDdYaitVYkVqTmdkUTlVY2NQWHVLM1VRNUIyanh5eUJSZEVHRXpFQlZ3cFhq?=
 =?utf-8?B?Q2liWUxoOE1FZCsvYVhWS3RFWlNxYS9qTHFQUytmTTZvTVNISDhjOGN1RUov?=
 =?utf-8?B?TkR0UEtmOFluL2dSbjlGbkU0M3FFQ2dDejhsTFEvM3UwWHg3ZHBJUHZnZmNJ?=
 =?utf-8?B?bUpHcTQzclFUeFl1cTkyeU9MUHltYXJBTFlCUVo4TVJQbEpCOGQ3Ykt1MWNU?=
 =?utf-8?B?U25PaCsrTVBoeHh1KzFZalR6MjlXRkVsUThkUjFaTWlUYmF5VFVnalFIandI?=
 =?utf-8?B?bGQ4Q0tYMGJkR3hVQjdMZ05YNGVNVVphR1grcUlVcjBQbkpXZ24yTWNQZi8x?=
 =?utf-8?B?T3VHZVZSQnhYa2Fpd0FWVGFvZklHa2VsYy9VZjhEMisrcUFEcUdmMmVCRW1r?=
 =?utf-8?B?cUFUWCtMN1Nad2U4ZXltV3BzOUVFRVpOQVB3aXdId3ZWMk5Ydys3enVSaEl0?=
 =?utf-8?B?MkVHQzZFZldTNmlQWUVoMkpmUDBoNlRqaEZKcmtYL0VVS3prWlpBcjJGeHhX?=
 =?utf-8?B?YUV3OUNIYTIyQTlCLzdoYkNMQmhlaXMvVlFiOVhqNVJpU3JDbWh2UXZzcVJH?=
 =?utf-8?B?MTBmem9CZHVRT3RoVGNqOXdPR3ovSTdmMS9KK0ZUSW1OMk5hU3ZzUWUreDhh?=
 =?utf-8?B?M2lZN041MW5KYUxTZzl5SE01dkdjTFF5NVN1UG9vSlM1Yk5VdG5rRFR4ZzM3?=
 =?utf-8?B?MnNIZHFmVmY3Rk5pU3VjSEE5OVpDTFhDVGZtSWhZRDZrM0VCZGNCSDJGeUlZ?=
 =?utf-8?B?NDdBRVBSbFlXa3pQUWVkQk5oc2VKOW1ROEhHR2RReDhUOXlyWGMzQzUyam9K?=
 =?utf-8?B?MjZ0c1pxSEl4YXpoVFMzWEkxRUxOc20yQXNPVWV6TytWNHNGOFJMMGZuaVNT?=
 =?utf-8?B?YTNPRGpJblpIQ2F3VWJGMTRBbGFvNDlvb1Q3WFA5TlRBZlZvNlZmNlUzdysw?=
 =?utf-8?B?VWlKUk9mbE81WG8yci9RemNwMTRUTjAyZmZEVC9vKy9IY05NUzZzM2U2OXdn?=
 =?utf-8?B?SGY0TUVwY09oTWhTZys4Si9tY3Evd0NYSlYwdW4zaW95OFVodVEzeGZ2WEdP?=
 =?utf-8?B?WDZSVno0R0NBZ0Z6YVNabS9QN3dhMjJWbnJSRlQ2d0IzSGN6TnBrU1laT1ht?=
 =?utf-8?B?VlJXYmllcmRwV2w5dWRpSEdjWi9XR01zYXBnTlQ0NERFbEhYNWdGT21tMmdY?=
 =?utf-8?B?dDMydEZtVlJReTV4OUNMY09hekQvL1hrTmlsZHNiU2RIY0FQVWFjdFU5Z3o2?=
 =?utf-8?B?N2dxenVXVHFUVE5NSXdvTjIzajQyTFQraEJuODRjZ3lsWlZRV3RsSVBuRndO?=
 =?utf-8?B?NWNYWUo2S2RGNENsaHJwME90cUdJT0lURVUxaU90NGV5SFZKbFpOVDZFSVpZ?=
 =?utf-8?B?dmxwcXpyU29MWmo5SzNVMlV1dmxJUko5MWk0TnpEM3d6SklNZmN1MWpMTVZl?=
 =?utf-8?B?cjhUOGlYWld1ZndVY3MrbTB3dVlScS94enl5aFlMOHpDRTNtWkRpRlBicWlM?=
 =?utf-8?B?NldHTUhXaFhjMlcyKzZsRVNFWUdDeUFTUHJuUVQwdzF0dDV1Zm1KUFJYYkJm?=
 =?utf-8?B?b2M0WEZ3SnoxQW1JZzdhYVpjS3JBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3820.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8b2106-9b85-4726-bcfb-08d9d688a623
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2022 11:34:23.8861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hgseNDmCReFmmr0kyZKsqAlirFYhz/t7XIOZWT7l3dlNwt8dOm/9EFlLFvn5ATDopc/UHkYPlJ6QrGZBSjvRiUKml6g5CVcX6dtJwvHrsZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7316
X-Mailman-Approved-At: Fri, 14 Jan 2022 08:27:12 +0000
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
Cc: "sean@poorly.run" <sean@poorly.run>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 quic_kalyant <quic_kalyant@quicinc.com>,
 "jonathan@marek.ca" <jonathan@marek.ca>, "airlied@linux.ie" <airlied@linux.ie>,
 quic_rajeevny <quic_rajeevny@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 quic_mkrishn <quic_mkrishn@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LA0KDQo+IA0KPiBPbiBXZWQsIDEyIEphbiAyMDIyIGF0IDE5OjA5LCBSYWplZXYg
TmFuZGFuDQo+IDxSQUpFRVZOWUBxdGkucXVhbGNvbW0uY29tPiB3cm90ZToNCj4gPg0KPiA+IEhp
IERtaXRyeSwNCj4gPg0KPiA+ID4gPg0KPiA+ID4gPiArICAgICAgIGlmIChwaHktPmNmZy0+b3Bz
LnR1bmluZ19jZmdfaW5pdCkNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHBoeS0+Y2ZnLT5vcHMu
dHVuaW5nX2NmZ19pbml0KHBoeSk7DQo+ID4gPg0KPiA+ID4gUGxlYXNlIHJlbmFtZSB0byBwYXJz
ZV9kdF9wcm9wZXJ0aWVzKCkgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gPiBTdXJlLiBJIGRp
ZG4ndCB1bmRlcnN0YW5kIHlvdXIgY29tbWVudCBpbiB2MSB0byB1c2UgY29uZmlnX2R0KCkgaG9v
ay4gSQ0KPiB0aGluaywgbm93IEkgdW5kZXJzdG9vZC4NCj4gPiBUaGlzIGZ1bmN0aW9uIGNhbiBi
ZSB1c2VkIHRvIHBhcnNlIFBIWSB2ZXJzaW9uIChubSkgc3BlY2lmaWMgRFQgcHJvcGVydGllcywN
Cj4gY3VycmVudGx5IHdlIHdpbGwgYmUgdXNpbmcgaXQgZm9yIFBIWSB0dW5pbmcgcGFyYW1ldGVy
cywgYW5kIGxhdGVyIHNvbWUgb3RoZXINCj4gcHJvcGVydGllcyBjYW4gYmUgYWRkZWQuDQo+ID4g
SSB3aWxsIHVzZSBwYXJzZV9kdF9wcm9wZXJ0aWVzKCkgaW4gbmV4dCBwb3N0LiBQbGVhc2UgY29y
cmVjdCBtZSBpZiBJIHN0aWxsDQo+IGRpZG4ndCBnZXQgaXQuDQo+IA0KPiBZb3UgdW5kZXJzdGFu
ZGluZyBmb2xsb3dzIG15IHByb3Bvc2FsLCB0aGFuayB5b3UuDQo+IA0KPiA+DQo+ID4gPg0KPiA+
ID4gPiArDQo+ID4gPiA+ICAgICAgICAgcmV0ID0gZHNpX3BoeV9yZWd1bGF0b3JfaW5pdChwaHkp
Ow0KPiA+ID4gPiAgICAgICAgIGlmIChyZXQpDQo+ID4gPiA+ICAgICAgICAgICAgICAgICBnb3Rv
IGZhaWw7DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkv
ZHNpX3BoeS5oDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHku
aA0KPiA+ID4gPiBpbmRleCBiOTEzMDNhLi5iNTU5YTJiIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5oDQo+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmgNCj4gPiA+ID4gQEAgLTI1LDYgKzI1LDcg
QEAgc3RydWN0IG1zbV9kc2lfcGh5X29wcyB7DQo+ID4gPiA+ICAgICAgICAgdm9pZCAoKnNhdmVf
cGxsX3N0YXRlKShzdHJ1Y3QgbXNtX2RzaV9waHkgKnBoeSk7DQo+ID4gPiA+ICAgICAgICAgaW50
ICgqcmVzdG9yZV9wbGxfc3RhdGUpKHN0cnVjdCBtc21fZHNpX3BoeSAqcGh5KTsNCj4gPiA+ID4g
ICAgICAgICBib29sICgqc2V0X2NvbnRpbnVvdXNfY2xvY2spKHN0cnVjdCBtc21fZHNpX3BoeSAq
cGh5LCBib29sDQo+ID4gPiA+IGVuYWJsZSk7DQo+ID4gPiA+ICsgICAgICAgdm9pZCAoKnR1bmlu
Z19jZmdfaW5pdCkoc3RydWN0IG1zbV9kc2lfcGh5ICpwaHkpOw0KPiA+ID4gPiAgfTsNCj4gPiA+
ID4NCj4gPiA+ID4gIHN0cnVjdCBtc21fZHNpX3BoeV9jZmcgew0KPiA+ID4gPiBAQCAtODEsNiAr
ODIsMjAgQEAgc3RydWN0IG1zbV9kc2lfZHBoeV90aW1pbmcgew0KPiA+ID4gPiAgI2RlZmluZSBE
U0lfUElYRUxfUExMX0NMSyAgICAgICAgICAgICAgMQ0KPiA+ID4gPiAgI2RlZmluZSBOVU1fUFJP
VklERURfQ0xLUyAgICAgICAgICAgICAgMg0KPiA+ID4gPg0KPiA+ID4gPiArI2RlZmluZSBEU0lf
TEFORV9NQVggICAgICAgICAgICAgICAgICAgNQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsvKioNCj4g
PiA+ID4gKyAqIHN0cnVjdCBtc21fZHNpX3BoeV90dW5pbmdfY2ZnIC0gSG9sZHMgUEhZIHR1bmlu
ZyBjb25maWcNCj4gcGFyYW1ldGVycy4NCj4gPiA+ID4gKyAqIEByZXNjb2RlX29mZnNldF90b3A6
IE9mZnNldCBmb3IgcHVsbC11cCBsZWdzIHJlc2NvZGUuDQo+ID4gPiA+ICsgKiBAcmVzY29kZV9v
ZmZzZXRfYm90OiBPZmZzZXQgZm9yIHB1bGwtZG93biBsZWdzIHJlc2NvZGUuDQo+ID4gPiA+ICsg
KiBAdnJlZ19jdHJsOiB2cmVnIGN0cmwgdG8gZHJpdmUgTERPIGxldmVsICAqLyBzdHJ1Y3QNCj4g
PiA+ID4gK21zbV9kc2lfcGh5X3R1bmluZ19jZmcgew0KPiA+ID4gPiArICAgICAgIHU4IHJlc2Nv
ZGVfb2Zmc2V0X3RvcFtEU0lfTEFORV9NQVhdOw0KPiA+ID4gPiArICAgICAgIHU4IHJlc2NvZGVf
b2Zmc2V0X2JvdFtEU0lfTEFORV9NQVhdOw0KPiA+ID4gPiArICAgICAgIHU4IHZyZWdfY3RybDsN
Cj4gPiA+ID4gK307DQo+ID4gPg0KPiA+ID4gSG93IGdlbmVyaWMgaXMgdGhpcz8gSW4gb3RoZXIg
d29yZHMsIHlvdSBhcmUgYWRkaW5nIGEgc3RydWN0IHdpdGgNCj4gPiA+IHRoZSBnZW5lcmljIG5h
bWUgdG8gdGhlIGdlbmVyaWMgc3RydWN0dXJlLiBJJ2QgZXhwZWN0IHRoYXQgaXQgd291bGQNCj4g
PiA+IGJlIGNvbW1vbiB0byBzZXZlcmFsIFBIWSBnZW5lcmF0aW9ucy4NCj4gPg0KPiA+IFRoZSAx
MG5tIGlzIFBIWSB2My54LCBhbmQgdGhlIFBIWSB0dW5pbmcgcmVnaXN0ZXIgY29uZmlndXJhdGlv
biBpcyBzYW1lDQo+IGFjcm9zcyBEU0kgUEhZIHYzLnggZGV2aWNlcy4NCj4gPiBTaW1pbGFybHkg
dGhlIFBIWSB2NC54IGRldmljZXMgaGF2ZSBzYW1lIHJlZ2lzdGVyIGNvbmZpZ3VyYXRpb24gdG8g
YWRqdXN0DQo+IFBIWSB0dW5pbmcgcGFyYW1ldGVycy4NCj4gDQo+IFdoYXQgYWJvdXQgMTRubSAo
djIueCwgc2RtNjYwKT8gT3IgZXZlbiAwLjAtbHBtIChhcHE4MDE2KT8NCg0KVGhlIDE0bm0gKHYy
LngpIGhhcyBkaWZmZXJlbnQgcmVnaXN0ZXJzIGFuZCBwYXJhbWV0ZXJzIGZvciB0aGUgRFNJIFBI
WSB0dW5pbmcuIA0KICBEcml2ZSBzdHJlbmd0aDogRFNJUEhZX0hTVFhfU1RSX0hTVE9QICYgX0hT
Qk9UIGZvciBlYWNoIGxhbmUgKFRvcC9ib3R0b20gYnJhbmNoIGRyaXZlIHN0cmVuZ3RoIGFkanVz
dG1lbnQpDQogIERyaXZlIGxldmVsOiBOQQ0KICBQcmUtZW1waGFzaXM6IERTSVBIWV9QRU1QSF9T
VFJCT1QgJiBfU1RSVE9QIGZvciBlYWNoIGxhbmUgKHZhbHVlcyBhcmUgYmFzZWQgb24gSFNUWCBs
b2FkaW5nIG9uIHRoZSBsYW5lKQ0KDQpUaGUgYXBxODAxNiBpcyBhIHZlcnkgb2xkIGNoaXAgYW5k
IEkgY291bGRuJ3QgZmluZCB0aGUgdHVuaW5nIGRvY3MgZm9yIGl0Lg0KDQpJIHRoaW5rIGdvaW5n
IHdpdGggeW91ciBzdWdnZXN0aW9uIHRvIGFsbG93IGVhY2ggZHJpdmVyIHRvIHNwZWNpZnkgaXRz
IHN0cnVjdHVyZSwgd2UgZG9uJ3QgbmVlZCB0byB3b3JyeSBhYm91dCB0aGUgZGV0YWlscyBvZiB0
aGUgdHVuaW5nIGNvbmZpZ3MgbmVlZGVkIGZvciBlYWNoIFBIWSB2ZXJzaW9ucy4NCg0KPiANCj4g
Pg0KPiA+IFRoZSB2NC54IGhhcyBmZXcgY2hhbmdlcyBhcyBjb21wYXJlZCB0byB2My54IDoNCj4g
PiAtIHJlc2NvZGVfb2Zmc2V0X3RvcDoNCj4gPiAgIEluIHY0LngsIHRoZSB2YWx1ZSBpcyBub3Qg
cGVyIGxhbmUsIHJlZ2lzdGVyIGlzIG1vdmVkIGZyb20gUEhZX0xOXyBibG9jayB0bw0KPiBQSFlf
Q01OXyBibG9jay4gT25lIHZhbHVlIG5lZWRlZCB0byBjb25maWd1cmUgYWxsIHRoZSBsYW5lcy4N
Cj4gPiAgIFdoZXJlYXMgaW4gdjMueCwgY29uZmlndXJhdGlvbiBmb3IgZWFjaCBsYW5lIGNhbiBi
ZSBkaWZmZXJlbnQuDQo+ID4gICBJbiBjYXNlIG9mIHY0LngsIHdlIGNhbiB1c2UgcmVzY29kZV9v
ZmZzZXRfdG9wWzBdIGFuZCBpZ25vcmUgcmVzdCB2YWx1ZXMuDQo+IA0KPiBVZ2guDQo+IA0KPiA+
DQo+ID4gLSByZXNjb2RlX29mZnNldF9ib3Q6DQo+ID4gICAgc2FtZSBhcyByZXNjb2RlX29mZnNl
dF90b3AgY29tbWVudHMgZ2l2ZW4gYWJvdmUuDQo+ID4NCj4gPiAtIHZyZWdfY3RybDoNCj4gPiAg
ICB2NC54IGhhcyB0d28gcmVnaXN0ZXJzIHRvIGFkanVzdCBkcml2ZSBsZXZlbCwNCj4gUkVHX0RT
SV83bm1fUEhZX0NNTl9WUkVHX0NUUkxfMCBhbmQNCj4gUkVHX0RTSV83bm1fUEhZX0NNTl9WUkVH
X0NUUkxfMQ0KPiA+ICAgIFRoZSBmaXJzdCBvbmUgaXMgdGhlIHNhbWUgZm9yIHYzIGFuZCB2NCwg
b25seSBuYW1lIGlzIGNoYW5nZWQgKF8wIHN1ZmZpeCkNCj4gPiAgICBUaGUgc2Vjb25kIG9uZSBS
RUdfRFNJXzdubV9QSFlfQ01OX1ZSRUdfQ1RSTF8xIGlzIGFkZGVkIHRvDQo+IGFkanVzdCBtaWQt
bGV2ZWwgYW1wbGl0dWRlcyAoQy1QSFkgbW9kZSBvbmx5KQ0KPiA+ICAgIFdlIGNhbiBhZGQgYSBu
ZXcgbWVtYmVyIHZyZWdfY3RybF8xIGluIHRoZSAic3RydWN0DQo+ID4gbXNtX2RzaV9waHlfdHVu
aW5nX2NmZyIgd2hpbGUgYWRkaW5nIFBIWSB0dW5pbmcgc3VwcG9ydCBmb3IgVjQueA0KPiA+DQo+
ID4gQXBhcnQgZnJvbSB0aGUgZXhpc3RpbmcgbWVtYmVycywgdGhlIHY0LnggaGFzIGEgZmV3IG1v
cmUgcmVnaXN0ZXIgY29uZmlnDQo+IG9wdGlvbnMgZm9yIGRyaXZlIHN0cmVuZ3RoIGFkanVzdG1l
bnQgYW5kIERlLWVtcGhhc2lzLg0KPiA+IFdlIGNhbiBhZGQgbmV3IG1lbWJlcnMgdG8gYWRkcmVz
cyB0aGVtIGZvciB2NC54IFBIWSB0dW5pbmcuDQo+IA0KPiBJIGRvIG5vdCBsaWtlIHRoZSBpZGVh
IG9mIHB1c2hpbmcgZWFjaCBhbmQgZXZlcnkgcG9zc2libGUgb3B0aW9uIGludG8gZ2VuZXJpYw0K
PiBzdHJ1Y3R1cmUuDQo+IEkgc2VlIHR3byBwb3NzaWJsZSBzb2x1dGlvbnM6DQo+ICAtIEFkZCBv
cGFxdWUgdm9pZCBwb2ludGVyIHRvIHN0cnVjdCBtc21fZHNpX3BoeS4gQWxsb3cgZWFjaCBkcml2
ZXIgdG8NCj4gc3BlY2lmeSBpdCBvbiBpdCdzIG93bi4NCj4gDQo+IE9yOg0KPiANCj4gLSBhZGQg
YSB1bmlvbiBvZiBwZXItbm0gc3RydWN0dXJlcy4NCj4gDQo+IEZyb20gdGhlc2UgdHdvIG9wdGlv
bnMgSSdtIGJpYXNzZWQgdG93YXJkcyB0aGUgZmlyc3Qgb25lLiBJdCBlbmNhcHN1bGF0ZXMNCj4g
dGhlIGRhdGEgc3RydWN0dXJlIHdpdGggdGhlIHVzaW5nIGNvZGUuDQoNCkkgYWdyZWUgd2l0aCB5
b3UsIEkgd2lsbCBpbXBsZW1lbnQgdGhlIGZpcnN0IG9wdGlvbi4NCg0KVGhhbmtzLA0KUmFqZWV2
DQoNCj4gDQo+IA0KPiA+DQo+ID4gVGhlIFBIWSB2NC54IGlzIHRoZSBsYXRlc3QgUEhZIHZlcnNp
b24sIGFuZCBtb3N0IG9mIHRoZSBuZXcgZGV2aWNlcyBhcmUNCj4gY29taW5nIHdpdGggdjQueC4g
U28sIEkgY2FuIHNheSB0aGF0IHRoZSBzdHJ1Y3R1cmUgbWVtYmVyIGlzIGdvaW5nIHRvIHJlbWFp
bg0KPiB0aGUgc2FtZSBmb3Igc29tZSB0aW1lLg0KPiA+IChUaGluZ3MgbWF5L21heSBub3QgY2hh
bmdlIGluIHY1LCBidXQgSSBuZXZlciBoZWFyZCBvZiBpdCBjb21pbmcpDQo+ID4NCj4gPiBUaGFu
a3MsDQo+ID4gUmFqZWV2DQo+ID4gPg0KPiA+ID4gPiArDQo+ID4gPiA+ICBzdHJ1Y3QgbXNtX2Rz
aV9waHkgew0KPiA+ID4gPiAgICAgICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXY7DQo+
ID4gPiA+ICAgICAgICAgdm9pZCBfX2lvbWVtICpiYXNlOw0KPiA+ID4gPiBAQCAtOTgsNiArMTEz
LDcgQEAgc3RydWN0IG1zbV9kc2lfcGh5IHsNCj4gPiA+ID4NCj4gPiA+ID4gICAgICAgICBzdHJ1
Y3QgbXNtX2RzaV9kcGh5X3RpbWluZyB0aW1pbmc7DQo+ID4gPiA+ICAgICAgICAgY29uc3Qgc3Ry
dWN0IG1zbV9kc2lfcGh5X2NmZyAqY2ZnOw0KPiA+ID4gPiArICAgICAgIHN0cnVjdCBtc21fZHNp
X3BoeV90dW5pbmdfY2ZnIHR1bmluZ19jZmc7DQo+ID4gPiA+DQo+ID4gPiA+ICAgICAgICAgZW51
bSBtc21fZHNpX3BoeV91c2VjYXNlIHVzZWNhc2U7DQo+ID4gPiA+ICAgICAgICAgYm9vbCByZWd1
bGF0b3JfbGRvX21vZGU7DQo+ID4gPiA+IC0tDQo+ID4gPiA+IDIuNy40DQo+ID4gPiA+DQo+ID4g
Pg0KPiA+ID4NCj4gPiA+IC0tDQo+ID4gPiBXaXRoIGJlc3Qgd2lzaGVzDQo+ID4gPiBEbWl0cnkN
Cj4gDQo+IA0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0cnkNCg==
