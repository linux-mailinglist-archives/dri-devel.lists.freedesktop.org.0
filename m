Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 516C273288E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 09:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDDD10E5B9;
	Fri, 16 Jun 2023 07:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2067.outbound.protection.outlook.com [40.107.20.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAA010E5B9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 07:14:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjOPzluFAXS9WqVSI/Dnaq2fx44/2SVabLVAI+dm5fIjUjt2VmN7do1e/mG44T7E61AFN3YjO8tr9H6UVIey153Yrt1s3JWtjzm3jsCER94qV3yJ5/CYXpdtXDJ1+TCXng9TZW6V1pOm+VssuzIMyShFVftG0vT3WCzmcL/PMWYoWkaJuymnX9xDnybSG9g+xBUCEg37EUchgYv2nfz7ZRs8U5r+f2k4d0PqeEe3u8l9aoQQqyXdVQE50RhrTaWXXLD13aaZE+75g2KfQZt//34Kn1cp1MKr4MYVeFCZgKeRxYwTX+LP9OoqK2AXnUnAcjN8jok+NAX3ssRhUW1VaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=684CEngxMLDoGn6N4o1ky5K9QhDvkkZszbq1RqD7Kpc=;
 b=DlO5ydP2Xq1jX6oNQT1s34x7YVPBeE87jrpz9ZIViEn1DTEy9ySq8TCV5JQOnUs+XVPYDNKfVbrMmtfm9tj9waEL0cg3os4qk5BQnJFIC2sQRD2tgwFKXxRAR0Oj8SKJXDVG5Wo5zOeKtxnI3VvkFZpxmI/yQOHYtvCZS+ocAjq6vb+yP8xLu7aO+DgCU6fD0Fjhcwol26BjjWDO39hLDQGyDxtuNeR0G+ALNzGVcVjnWn9vR3kLy5fq4oEDOuwTrCRyT06fbKnV/AZHu4aLakOkyA1tDtD+mHFdoHUDKsABGquuCShuB2aWc9ekoR0HrbExgXFUBYc6Ga7NxOWkDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=684CEngxMLDoGn6N4o1ky5K9QhDvkkZszbq1RqD7Kpc=;
 b=sdFU+fDULH0Teh08UMkfkTi7RpLHLT9acoi2icvPeauRfubzybHA4hcjU1EeK7agLcg0hugToaGFZFlsnWzi8z7b0FOPdmY8pxVfeW00HCrO7FGKnXPpfyLrLpHt8QvUOMC8i1zFuco6gJt6qnat+bKoRn1LGg+XZWZrep001kA=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS1PR04MB9681.eurprd04.prod.outlook.com (2603:10a6:20b:480::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 07:13:57 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 07:13:56 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [EXT] Re: [PATCH v6 3/8] drm: bridge: Cadence: Add MHDP8501 DP
 driver
Thread-Topic: [EXT] Re: [PATCH v6 3/8] drm: bridge: Cadence: Add MHDP8501 DP
 driver
Thread-Index: AQHZnyaVOp3VLStRVUaOGqNURseKhq+MD9UAgAD0dsA=
Date: Fri, 16 Jun 2023 07:13:56 +0000
Message-ID: <PAXPR04MB9448680E4F589E1F722ADD2CF458A@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <67f54be91e91f6291c4ad3f5155598d699b8bc09.1686729444.git.Sandor.yu@nxp.com>
 <20230615163308.GA1588386@ravnborg.org>
In-Reply-To: <20230615163308.GA1588386@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AS1PR04MB9681:EE_
x-ms-office365-filtering-correlation-id: 0db8404a-4dd1-4405-29d6-08db6e393fdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mxnzv0IpsXIDigCT0qVWgq9q/Ftkz4rG9sNNGt5FgcSu8HnGIBkdHcXnXImuFdpEDPA5f5w+7k92w/EJyhZtH68SPo+JMaS9gRJNCyTjBF1aJ0vxehKYoUkqSYpmVxJ4RzoYK53zjGnLngfAFbdEYsyfi41TkJMDM5Co5zLFQtZkg+TxMumAvHoyIDhjQFDmQqEYOENIvrB/xWGsHxyhu5EslKx2PvuRKcJKkLosQ8ReJR1tXkCIdWQKeIieSceHcYsOp3HKVtr9sIiJDthTIkC02pSmyzUObETygxflJCMccav3gk0vJZ5BBHtgK3+LxQZrSRIqKAhtoYCMty1qIaUX8SW1mpl7d3Z5K44dQJ7SLlyIMOEEe8eAwc5F2tsbK6+O4gr9rlmGGhGrHb9aZCIKKeEb/c+weyAfOZnY14PyFja3mv89vGjvqyVBDndeL/iHM2CutM4kGBhYMELOCdpz+lmqPgO/dRIGvYLbFPguCWDJ7p/kMtQTkY3wTZ1/GM+3yWh3Hv/8WaoYH2VhVKAulr40vWP6sAKCgYBu8allOPPSCxduUZ3qMxzmSyRJI5PpbHx1oVWpgMIs/Q55uZ4IBGdpkl0xoXIMo+V/p3NIu82xU4UFg4l6lKfEpd1m
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(186003)(38070700005)(2906002)(33656002)(38100700002)(44832011)(7416002)(86362001)(53546011)(26005)(83380400001)(55016003)(9686003)(6506007)(122000001)(66446008)(4326008)(316002)(66476007)(64756008)(71200400001)(76116006)(66556008)(6916009)(7696005)(66946007)(478600001)(41300700001)(54906003)(8676002)(5660300002)(8936002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?SEZIaWxSSkFsT3FLNjZXdkZMcHRuSElMRmwwckdYaEhTdkNyTUJuelIwL3NQ?=
 =?gb2312?B?d3hHMU10Y2gxTFlUckt3YWtodzcweWhNY1YyUWtSWGpSdTZVbFFLZmZxY1dW?=
 =?gb2312?B?a1RTOUlKSFk3WlMwWEY0Vlhmd3NhMWpnTEo2UmgzeHY0eUhSeFBGVUpoZHZW?=
 =?gb2312?B?aUhwWHBMRmNKMW9JTEN3c0JSK3Q5dENseldwaHozVTVLVXQwMmw0UTlWSyto?=
 =?gb2312?B?RWNrUVVZOHIzNHJoU01SYkFoanQvcmxnT1BlRUQydTVoTXU5WjQ3bjZvK1Bv?=
 =?gb2312?B?alBKOXV0cGhPVnhRcEZONzQ0RE1la2JXamxyRWJ5MEM3MWxNMkovWWlWQ0Nk?=
 =?gb2312?B?OTRycFFpclI5ZjJmWG9yTXFINjFPblpFbVZONDh1MktwVDhQYklYY2NFZHdW?=
 =?gb2312?B?L21TSDhWeHVyWDhMTmxLdlN5VXJsajhHcHA0aWZxb0dUdSt5R2lmUENveWxu?=
 =?gb2312?B?ai8zcWdhN2J5dkFaWllUWU1EaDBWNFRRZVBQRVJaVjBSK0FBRGtCUmFHUFl1?=
 =?gb2312?B?TUpyU2tIVElzMjZKWUdLWG1ZQUJDZk12WENENXl0ak9oQ1R2TDR2eHF1NFJO?=
 =?gb2312?B?YkJaZjhNMkVKYnNleGxtNGVEaGY2bks1ZWoyVFRZbVNBcExNd2NDRGVNcVFi?=
 =?gb2312?B?cGcrT0ZUcndQMlpyQ1Z0ajlPMVd6cHpMY25Ec21ONEFnSEZ4ZTZ6OFoxcWp5?=
 =?gb2312?B?T2ZWVmdzOHBucENtcnhzenV1Mk44OVlNVS9EYytGQXc5K3N0dHMyNmg5YjNm?=
 =?gb2312?B?azFsNjM3TUcrRVBzL0I1a0pMQ0dPY01ZbWVMekxqMS9Zd3AxRXloRVFvSTJH?=
 =?gb2312?B?d1dUTUNEWnBhR3lzNVZjZC9BeWdGdElEMTZMSU9pZzdvWUFhWHhDTEQ4RHJS?=
 =?gb2312?B?THhjeHc4Zjkrb0lSVmM1VUJycDIybFdYdVhFMTI3NXBESkpkVlZXS3pzY1RB?=
 =?gb2312?B?TjJscnd4bFpBQXd6N0l4dVhua2I4TnRJcmJHbUhCUFJaTVp0a3ZxOHNNTm8y?=
 =?gb2312?B?NVR5UXBvR2tVUlVYRnQyd3JpekFvbWlaTTZxUC9xT3pPMjNiVlQreTQ4Mm15?=
 =?gb2312?B?bzNzK050M0pkVGJzWkpZMXlBS25FTld3TDZvMGc1UDBnVHFReXpLdm5UeXVt?=
 =?gb2312?B?V3YwZ0w5elU2T1hVSzc0T0FTcTRUU0x1empnTklwcG1DNGpob05Ub3Jwa0JK?=
 =?gb2312?B?anp5SkEySGZkLzUwNk1ReW45Y1VKQklUM2s5czAwdmJNRTR0Slkxc1F1WUJz?=
 =?gb2312?B?NzRrSzZGWXJjS3BYVVFrT3RJRmMwTEpsZ0VJdW01SUNPS2xlajFSQ0JKOU9M?=
 =?gb2312?B?eUNBbkI3ajRYY0hZVUpBSTRvVGNIc2NyRDNudU5mN1lWMmMzdnFZZm13Y2Fk?=
 =?gb2312?B?OGJtVm9tdVJydTRzMXIzS0QvQXBXWkJadThNYXp0SEVZNjgrYzRHVHdOaGQw?=
 =?gb2312?B?Rkk4b2U2aHYyU0JtTFpOaTQyeUl5bnVhRmVZUXdOellJM3JtR3pKYWdldzY3?=
 =?gb2312?B?THhMWEt5ekd5L1NTTTJxNndvWG1LaFhKZ0RMZmpFUURqUVJuajVNdkYzYWg2?=
 =?gb2312?B?OS9Qd3RwcTh5MXk5eDJwN0xIWlFqaVhvOGtLTGQ1NCtrZTVnUGhvODlxb0RV?=
 =?gb2312?B?bk85SjZzby9Da1lhSGdWUzFTbjgyL3hYdEJuUEhwZGZxbkJvKzBwYnJtWC9u?=
 =?gb2312?B?ZThiVDFsWk9UblF6WU1FMWRxeFlkZ3d6Wm1ZUzhmL1Ztdm41aVFydXgydFY1?=
 =?gb2312?B?eWhoTVhKR3dQRVVnWUVwRmJUd0pHZldCejVHV0xNMjBkMlEvVEtJNEpwcmRY?=
 =?gb2312?B?MUQvWURnTWg4SDUvQzhKQ2NpZlZ3NlBKT0xvQzZLUG00dGpyUVJseTJ1VmFh?=
 =?gb2312?B?S3o4Tko0VWF3ck9IamxPaUkxSHhPaDVoRzlKYWwySy9FUjdEUU5kZXd3YkVq?=
 =?gb2312?B?VjB4VlNOQytuOGJjQmVIdzR6TUs3RWhDZ29XRE8relZRdWZpR1ZTck9PNExr?=
 =?gb2312?B?K0tOUVllNGY2ekZEMW9XQ1R3aW16QTI5VXFsL01aSzRpdCticEE5YkE5UjFz?=
 =?gb2312?B?eGpvZ0VjTFUyemMxUk1qazFwNXc4OXlJbWtGblJ1OFNlUFF0b0VZNURVZGhD?=
 =?gb2312?Q?bD4M=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db8404a-4dd1-4405-29d6-08db6e393fdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 07:13:56.6427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krIJOTWHhMrzUruK+lv2d+yu3m4Wj0llVgfc6VPMb2La7vdXdYlJYoJojg4SZClB7y3X4mrQUdqIICIHivSjBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9681
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
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oliver Brown <oliver.brown@nxp.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLA0KDQpUaGFua3MgeW91ciBjb21tZW50cywNCg0KRm9yIGkuTVg4TVEsIHRoZSBkaXNw
bGF5IGRyaXZlciBEQ1NTIGhhZCBjcmVhdGUgaXRzIG93biBjb25uZWN0b3IuDQpJIHdpbGwgZHJv
cCB0aGUgY29kZSBpbiB0aGUgbmV4dCB2ZXJzaW9uIHJldmlldyBwYXRjaCBzZXQuDQoNClRoYW5r
cw0KU2FuZG9yDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2FtIFJh
dm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KPiBTZW50OiAyMDIzxOo21MIxNsjVIDA6MzMNCj4g
VG86IFNhbmRvciBZdSA8c2FuZG9yLnl1QG54cC5jb20+DQo+IENjOiBhbmRyemVqLmhhamRhQGlu
dGVsLmNvbTsgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZzsNCj4gcm9iZXJ0LmZvc3NAbGluYXJv
Lm9yZzsgTGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tOw0KPiBqb25hc0Brd2lib28u
c2U7IGplcm5lai5za3JhYmVjQGdtYWlsLmNvbTsgYWlybGllZEBnbWFpbC5jb207DQo+IGRhbmll
bEBmZndsbC5jaDsgcm9iaCtkdEBrZXJuZWwub3JnOyBrcnp5c3p0b2Yua296bG93c2tpK2R0QGxp
bmFyby5vcmc7DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7
IGZlc3RldmFtQGdtYWlsLmNvbTsNCj4gdmtvdWxAa2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtcGh5QGxpc3RzLmluZnJhZGVhZC5vcmc7IE9saXZlciBCcm93bg0KPiA8b2xp
dmVyLmJyb3duQG54cC5jb20+OyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsNCj4g
a2VybmVsQHBlbmd1dHJvbml4LmRlDQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggdjYgMy84
XSBkcm06IGJyaWRnZTogQ2FkZW5jZTogQWRkIE1IRFA4NTAxIERQDQo+IGRyaXZlcg0KPiANCj4g
Q2F1dGlvbjogVGhpcyBpcyBhbiBleHRlcm5hbCBlbWFpbC4gUGxlYXNlIHRha2UgY2FyZSB3aGVu
IGNsaWNraW5nIGxpbmtzIG9yDQo+IG9wZW5pbmcgYXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQs
IHJlcG9ydCB0aGUgbWVzc2FnZSB1c2luZyB0aGUgJ1JlcG9ydA0KPiB0aGlzIGVtYWlsJyBidXR0
b24NCj4gDQo+IA0KPiBIaSBTYW5kb3IsDQo+IA0KPiBPbiBUaHUsIEp1biAxNSwgMjAyMyBhdCAw
OTozODoxM0FNICswODAwLCBTYW5kb3IgWXUgd3JvdGU6DQo+ID4gQWRkIGEgbmV3IERSTSBEaXNw
bGF5UG9ydCBicmlkZ2UgZHJpdmVyIGZvciBDYW5kZW5jZSBNSERQODUwMSB1c2VkIGluDQo+ID4g
aS5NWDhNUSBTT0MuIE1IRFA4NTAxIGNvdWxkIHN1cHBvcnQgSERNSSBvciBEaXNwbGF5UG9ydCBz
dGFuZGFyZHMNCj4gPiBhY2NvcmRpbmcgZW1iZWRkZWQgRmlybXdhcmUgcnVubmluZyBpbiB0aGUg
dUNQVS4NCj4gPg0KPiA+IEZvciBpTVg4TVEgU09DLCB0aGUgRGlzcGxheVBvcnQgRlcgd2FzIGxv
YWRlZCBhbmQgYWN0aXZhdGVkIGJ5IFNPQw0KPiBST00NCj4gPiBjb2RlLiBCb290bG9hZCBiaW5h
cnkgaW5jbHVkZWQgSERNSSBGVyB3YXMgcmVxdWlyZWQgZm9yIHRoZSBkcml2ZXIuDQo+IA0KPiBU
aGUgYnJpZGdlIGRyaXZlciBzdXBwb3J0cyBjcmVhdGluZyBhIGNvbm5lY3RvciwgYnV0IGlzIHRo
aXMgcmVhbGx5IG5lY2Vzc2FyeT8NCj4gDQo+IFRoaXMgcGFydDoNCj4gPiArc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIGNkbnNfZHBfY29ubmVjdG9yX2Z1bmNzID0gew0K
PiA+ICsgICAgIC5maWxsX21vZGVzID0gZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVfY29ubmVjdG9y
X21vZGVzLA0KPiA+ICsgICAgIC5kZXN0cm95ID0gZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwLA0KPiA+
ICsgICAgIC5yZXNldCA9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9yZXNldCwNCj4gPiAr
ICAgICAuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9DQo+IGRybV9hdG9taWNfaGVscGVyX2Nvbm5l
Y3Rvcl9kdXBsaWNhdGVfc3RhdGUsDQo+ID4gKyAgICAgLmF0b21pY19kZXN0cm95X3N0YXRlID0N
Cj4gPiArZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUsDQo+ID4gK307
DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1
bmNzDQo+IGNkbnNfZHBfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyA9IHsNCj4gPiArICAgICAuZ2V0
X21vZGVzID0gY2Ruc19kcF9jb25uZWN0b3JfZ2V0X21vZGVzLCB9Ow0KPiA+ICsNCj4gPiArc3Rh
dGljIGludCBjZG5zX2RwX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBkcm1fYnJpZGdlX2F0dGFj
aF9mbGFncyBmbGFncykNCj4gew0KPiA+ICsgICAgIHN0cnVjdCBjZG5zX21oZHBfZGV2aWNlICpt
aGRwID0gYnJpZGdlLT5kcml2ZXJfcHJpdmF0ZTsNCj4gPiArICAgICBzdHJ1Y3QgZHJtX2VuY29k
ZXIgKmVuY29kZXIgPSBicmlkZ2UtPmVuY29kZXI7DQo+ID4gKyAgICAgc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvciA9ICZtaGRwLT5jb25uZWN0b3I7DQo+ID4gKyAgICAgaW50IHJldDsN
Cj4gPiArDQo+ID4gKyAgICAgaWYgKCEoZmxhZ3MgJiBEUk1fQlJJREdFX0FUVEFDSF9OT19DT05O
RUNUT1IpKSB7DQo+ID4gKyAgICAgICAgICAgICBjb25uZWN0b3ItPmludGVybGFjZV9hbGxvd2Vk
ID0gMDsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICBjb25uZWN0b3ItPnBvbGxlZCA9IERSTV9D
T05ORUNUT1JfUE9MTF9IUEQ7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgZHJtX2Nvbm5lY3Rv
cl9oZWxwZXJfYWRkKGNvbm5lY3RvciwNCj4gPiArICZjZG5zX2RwX2Nvbm5lY3Rvcl9oZWxwZXJf
ZnVuY3MpOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgIGRybV9jb25uZWN0b3JfaW5pdChicmlk
Z2UtPmRldiwgY29ubmVjdG9yLA0KPiAmY2Ruc19kcF9jb25uZWN0b3JfZnVuY3MsDQo+ID4gKw0K
PiBEUk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBvcnQpOw0KPiA+ICsNCj4gPiArICAgICAgICAg
ICAgIGRybV9jb25uZWN0b3JfYXR0YWNoX2VuY29kZXIoY29ubmVjdG9yLCBlbmNvZGVyKTsNCj4g
PiArICAgICB9DQo+IA0KPiBVbmxlc3MgeW91IGhhdmUgYSBkaXNwbGF5IGRyaXZlciB0aGF0IGRv
IG5vdCBjcmVhdGUgdGhlaXIgb3duIGNvbm5lY3RvciB0aGVuDQo+IGRyb3AgdGhlIGFib3ZlIGFu
ZCBlcnJvciBvdXQgaWYgRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9SIGlzDQo+IG5vdCBz
ZXQuDQo+IEl0IGlzIGVuY291cmFnZWQgdGhhdCBkaXNwbGF5IGRyaXZlcnMgY3JlYXRlIHRoZWly
IG93biBjb25uZWN0b3IuDQo+IA0KPiBUaGlzIHdhcyB0aGUgb25seSBkZXRhaWwgSSBsb29rZWQg
Zm9yIGluIHRoZSBkcml2ZXIsIEkgaG9wZSBzb21lIGVsc2Ugdm9sdW50ZWVyDQo+IHRvIHJldmll
dyBpdC4NCj4gDQo+ICAgICAgICAgU2FtDQo=
