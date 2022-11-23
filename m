Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABD1635089
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 07:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3304D10E4ED;
	Wed, 23 Nov 2022 06:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2084.outbound.protection.outlook.com [40.107.103.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CA510E4EC
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 06:36:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/yRKcs4qVN7xOwl1te2zPagALNyPaayA8CTI0YPxPnXIJ0gNI5NPp9GJe8/kGrL/QF8NQzTcwpoo+P3BtEaldf9sLmcZ8CAy5zjQ8l///LI+IpPh1CkokPFMut4zbx9LtcQgPTFJ1+rrI1yJ52ktCmXFzWYamJXsTM7ovBQ3jmIFg7W364wK3NyKE/IpTpGGXoXUs/k0rxPJtDMCNguigexxVZiHn81n7DWr7/23KfGpBSS2mY03EQhcBtQEztma9j26qrqJHy1sk9tacIj3svhkvx8f+l8PnfXKTfgd64e4jlESLQkfdF86dE8xVrf2SY7+oXlg3brZdCrvhEFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbL7NsJ7O3x/Y6YS9j1+VFlIhH1jWLeMZtpmcE5i4Qs=;
 b=A84F/6BbYO15lqKrm+rXjABqLIQdMgQAMdei7mQDi5EXKOlnYyGU8O2GfwWP0lxR6vMWK1uujngZyS/HvFwgMFYX6O6T3NeNqztjnDGKhieGLz9gMlwCwh7YPPfnG42L44+9Ge5sCQnvhvEpPLQ5DYU6Dd6EhBvjDHhw8bB/CD7IuZUeQ/H3hLbj/PGgy2goWbOSJhs8ibZluwaHd1Rc2N6LpKMO9mLtoGnlTDmEcl1TBQSk0dfCd7re/5olFt+CjWVZ8lKQZ1AUAJnMAM2PaYXYUm7peIu8vDm/CQrzWACv5vJWgbr/ij1H7YfkqwQnZaFL4NDQIb8E8XXMoKhwCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbL7NsJ7O3x/Y6YS9j1+VFlIhH1jWLeMZtpmcE5i4Qs=;
 b=Jya/iY0EsVsRYB7paqAPSZBmeoZT9rk75OSk8V2nZ097s2K6DCwP3uL/F0LZEmAw21CWw4n3OfEKaszyVdaa8Y3tTtbq+L63/rmLauXghmMapn+Ce4E1s+MoHDe4pLa2TdDfiNITw9ZeMsVGdm5TsGiMO50CCuNBsDvgE05Nid0=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU0PR04MB9274.eurprd04.prod.outlook.com (2603:10a6:10:355::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 06:36:21 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400%6]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 06:36:21 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: RE: [EXT] Re: [PATCH v4 01/10] drm: bridge: cadence: convert mailbox
 functions to macro functions
Thread-Topic: [EXT] Re: [PATCH v4 01/10] drm: bridge: cadence: convert mailbox
 functions to macro functions
Thread-Index: AQHY/XlstS/wObBAJ02g1W0U4veKAa5LQAMAgAB4s8A=
Date: Wed, 23 Nov 2022 06:36:21 +0000
Message-ID: <PAXPR04MB94489F10D38BB14A22FDD598F40C9@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1669013346.git.Sandor.yu@nxp.com>
 <be4532b834109595b0fbf3562bf072caf2852a01.1669013346.git.Sandor.yu@nxp.com>
 <CAOMZO5AwwyZofwQNRnamNiLcj74HayNgocKsKx9epNGm8O-8-A@mail.gmail.com>
In-Reply-To: <CAOMZO5AwwyZofwQNRnamNiLcj74HayNgocKsKx9epNGm8O-8-A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|DU0PR04MB9274:EE_
x-ms-office365-filtering-correlation-id: f83097af-e3f3-4f02-b8f1-08dacd1d092f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 62/P9dQk/07O9Q2BoncThpwDoKE32YeElDiEmRgUUF9ciEXeNY6krJ50Kt8Q9rsyM3w4uFskAgCODhhYdJodN4ncVH+k/qJJJYx+jhVf87+KE8y/Rp7NT5S60eNsmj4huUyp1jjP3mTqO6aDUmYvQ1ZdqV0SrIIsbFGfu42sojNFZ+JT6nvbxufdEMpnOfPpC5fctgFfL4+eelzAwSWO/+0jgkvm581qNH45JBzL5SCtCiSFP91LlBDK8TU1+nv+XeH7BIMVqpMOnPsBrOIpojP7sSf4YzobhaC4Ibg9TWZ7P6c/zMOavZJrdKbfnqm/5KQaRzfwRbI8XyCJmUdkwZkA/WuYEpzMzxccp6FOsfgUsh/vdfvU6Oi9jRBUH+E5H3eR1+Sn9LOm8aoEpAQ2JK9kg3EH0UNHFdymLptlx+DZss5CKXW5sNS86s76/urySF70pl90w6cZQxzCooluItmMQ/i9EIYC77Ua5tdQOkbIIrglmVRGENIShMyjFPBzXLceoaQhSxC318FMa/OCfa5Tdsv+vJkmG6kI1/4ZxeAgnRr3UuuekE04PAQI+WBMwAm5PRwxdoFULS2YrXn5PbRSEkOPm0YNU+DFvkEPgcu9/VKV9iXyxH4QGM2zm8R+PP8Ars55H1HRfYjgGyYuNomVpucuh+4Pk1GKsTu97GqVZUSSTi6Z+ozug4C4jb/krumxFifZrSwp0lcZSLx7Yg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199015)(5660300002)(33656002)(8936002)(6916009)(186003)(316002)(38100700002)(122000001)(26005)(55016003)(53546011)(7696005)(7416002)(15650500001)(6506007)(71200400001)(9686003)(86362001)(38070700005)(478600001)(44832011)(83380400001)(52536014)(2906002)(54906003)(4326008)(8676002)(64756008)(66476007)(66556008)(66946007)(66446008)(41300700001)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0FYaGJhUUtZZjJBZkZXalQ1SnJWYlhUYnNWUE1sVDlzMFFCcUpMaDhYQUxW?=
 =?utf-8?B?MzlLdE9qSk4xcnQ5T0Z6citBZ0Y5dUtTcmFSY1VjekNVeUNDUjRXTHZ0V0gy?=
 =?utf-8?B?NGpTSElVMWFEWTBpeDRkZVp5bUlTcFBGdXdnMGdzeDQvb2F4d251Tjl3citq?=
 =?utf-8?B?dlhvakZMc2ZQazhieUsyVXVWZ2pWS0JmeFc5OWpUeVFCeGhYdUVzL3ZZUFJT?=
 =?utf-8?B?aFFYU3pOODlnNjlkbHhKUko2SVF2cUkxSWlVVmJkbjBIVUFuTGM1MkFQek5M?=
 =?utf-8?B?cG4rQWZUYzFWTlAyRVdicG1UZlJraWRNQk1Pcmh4a2s4K1M3OVBYT29tT0E2?=
 =?utf-8?B?bmFyeFJJR0ZGaE5HQTlKZWx3QndKZm14ZTZDUE9vM2JmSVdCYlcxMTVqQURt?=
 =?utf-8?B?OVBKcTBVTXdudEhqbkV5TWc0SFFRVXRnOE1RbW5mdlNlNlN6TlNwckluQmhV?=
 =?utf-8?B?WGxzL1RZRllyNlFobTZpL1doYlNBWWt0T0Yxclo1OERHRXlPeWlDd2RBTWpr?=
 =?utf-8?B?QXBRcmJqTnRzcmZBeUVIRDcrSnpGeWpESzFZbEdtUnNyNUdLMFNGWUVxMWV2?=
 =?utf-8?B?RUJyaGNiQk5iWE5jcHJhOHhZZWVLL0hrK3BzK0tPSmFNUzdSVVBMckcvUkJY?=
 =?utf-8?B?WlgxQkFPVU1sOUY3cG9PMVhTWW8wM0NuVXlGcVpyenlTNTFHUm0zUVJ0T0xG?=
 =?utf-8?B?akVWbGQxUGx0TDNYUm42SWdTeUV0YVFMYmNxS21nbHdQZU9KMFB5VVdRc0lH?=
 =?utf-8?B?SXpLMW1wN3QxUXd4aTBIdDRFbnRRM0F5WUhBb3ZDY1FmZVpxM0R6TDJub3dn?=
 =?utf-8?B?dUEvakREdk51elhnL2s3NWJhMHdKQ3JhTEV0TG9MRHI2ajdZczlZaS9WLzFw?=
 =?utf-8?B?WTJGNTNuNDlUczRWTlY3bGRLdjFwbzViVVR3ODJvcHV4UUtuZUx5bUtwQTlQ?=
 =?utf-8?B?aDQ0RnB2L0VDM3JmOU8zaE95NEo3dGtoWjZJWE5wQWdMNmhBcXRCSkIvTjV6?=
 =?utf-8?B?cDQ5NUdoUWk3WHMvcVh6QXVTRDVYNXVjTVZhc2Z6MlkzMWFqUFpJRkl0VExk?=
 =?utf-8?B?T251SjNGcmFheWZvbFZhdytQc1pDVUxwbVVwWXJRN3ZueUl2ZVY2eEVSQUR2?=
 =?utf-8?B?T1ptMnBoMW82L0tzZnlmdjNtVXJZUXhuQVNxSnlkNm5wdldkbFlPWHdlUjV3?=
 =?utf-8?B?TzQwQXNNTDFpbkc3QjR4TzRPbk04S2Z0UWhuN0lrclI5YnNkZVRxd2d5Tksv?=
 =?utf-8?B?YTZ2UFhWTDlRTFJXUjd4QjdOSU1ZOTFlc1luSVhCdEZ6U0Z0UGVDR0FwSzU1?=
 =?utf-8?B?Z1lESHhSbWRkZ2h6VDZ3djl5QmNaRFlDSE4rS29pQlNBblNxd25HSGZpWmYz?=
 =?utf-8?B?T0w0M2NucUVSWEQ4K1V0a2hyV3M0ajAySU4xVzBHUEE0YXR5L3pkVG9TaDR1?=
 =?utf-8?B?THEzMmsrUkEyRlVxZnRsVGh2QThFYUJaN0I2VUJ2REM1K3FxWVBQcGNoNDcw?=
 =?utf-8?B?WDhTaTY4aXZaN1J6Q2hOaDZOc0c3c0V5b0NFdlVSL3Q3ekNoYUFPZFQ3NHh1?=
 =?utf-8?B?T1JxbVF1Y1Q1eURnY2JwYkJLSnIrM2VURHhpQU1DV3hPOGlId0lnUlhvY3Vx?=
 =?utf-8?B?b1lnSTdqdW94MWk2UmZmM0ozUnZFUURwdXhrNHE4NktZS213YXVPMWYxZ0x5?=
 =?utf-8?B?Vk9qc1J3Z2FsUVdPQXRwVWpHMWl6aFVweEVZVzBEVXlMT0VCTFhEcWg1RmJo?=
 =?utf-8?B?WkcveHNrby9ybnZkL1MyZ0ZYbnpDK2xZV0VLaXlpSCtPKzlJQjkzZ3VmTjYz?=
 =?utf-8?B?Wk9Dbk5YNGsySUhhVmtSYU5rWFRReFdwU0g4V2RQSCtwenIzSVJ3dEJvd0li?=
 =?utf-8?B?T1NNQU13RnY5b1FlcHFVdWxnc00rSlU1NkRKdnVuQzE5b0pRMmRRZFJ6OVRs?=
 =?utf-8?B?MWoxb012Qk5hd3FIWUU0NnJ6OWxrOW81QUNKWGVGUUt2cjBqd3RMaHlJR28y?=
 =?utf-8?B?dC9hTlpMdWFXcFJRc2EvNGVsekYzaGhFd1NyZ1RIc0xLZmEwUGlkMGhPV2ZE?=
 =?utf-8?B?R2VnWnNoOGlwZ2lmRlhlWWRJNi9TeHJmWVdQN1BGMDUrWXRBZXliT0N5bWVv?=
 =?utf-8?Q?XZO0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f83097af-e3f3-4f02-b8f1-08dacd1d092f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2022 06:36:21.7746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rp2dNFFuvkXdwg8xcCsQS60m9TR28vIaZsyon1XVQdlij8DCH0n0MlNDPGmMPGC3lOTCI3e0EWR/4Ikar3/I3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9274
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
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "kishon@ti.com" <kishon@ti.com>, dl-linux-imx <linux-imx@nxp.com>,
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEZhYmlvIEVzdGV2YW0gPGZl
c3RldmFtQGdtYWlsLmNvbT4NCj4gU2VudDogMjAyMuW5tDEx5pyIMjPml6UgMjowOQ0KPiBUbzog
U2FuZG9yIFl1IDxzYW5kb3IueXVAbnhwLmNvbT4NCj4gQ2M6IGFuZHJ6ZWouaGFqZGFAaW50ZWwu
Y29tOyBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnOw0KPiByb2JlcnQuZm9zc0BsaW5hcm8ub3Jn
OyBMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb207DQo+IGpvbmFzQGt3aWJvby5zZTsg
amVybmVqLnNrcmFiZWNAZ21haWwuY29tOyBhaXJsaWVkQGdtYWlsLmNvbTsNCj4gZGFuaWVsQGZm
d2xsLmNoOyByb2JoK2R0QGtlcm5lbC5vcmc7IGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJv
Lm9yZzsNCj4gc2hhd25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsga2lz
aG9uQHRpLmNvbTsNCj4gdmtvdWxAa2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtcGh5QGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGFsZXhhbmRlci5zdGVpbkBldy50cS1ncm91
cC5jb207IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgZGwtbGludXgtaW14DQo+IDxsaW51eC1pbXhA
bnhwLmNvbT47IE9saXZlciBCcm93biA8b2xpdmVyLmJyb3duQG54cC5jb20+DQo+IFN1YmplY3Q6
IFtFWFRdIFJlOiBbUEFUQ0ggdjQgMDEvMTBdIGRybTogYnJpZGdlOiBjYWRlbmNlOiBjb252ZXJ0
IG1haWxib3gNCj4gZnVuY3Rpb25zIHRvIG1hY3JvIGZ1bmN0aW9ucw0KPiANCj4gQ2F1dGlvbjog
RVhUIEVtYWlsDQo+IA0KPiBIaSBTYW5kb3IsDQo+IA0KPiBPbiBNb24sIE5vdiAyMSwgMjAyMiBh
dCA0OjI3IEFNIFNhbmRvciBZdSA8U2FuZG9yLnl1QG54cC5jb20+IHdyb3RlOg0KPiA+DQo+ID4g
TWFpbGJveCBhY2Nlc3MgZnVuY3Rpb25zIGNvdWxkIGJlIHNoYXJlIHRvIG90aGVyIG1oZHAgZHJp
dmVyIGFuZA0KPiA+IEhEUC1UWCBIRE1JL0RQIFBIWSBkcml2ZXJzLCBtb3ZlIHRob3NlIGZ1bmN0
aW9ucyB0byBoZWFkIGZpbGUNCj4gPiBpbmNsdWRlL2RybS9icmlkZ2UvY2Rucy1taGRwLW1haWxi
b3guaCBhbmQgY29udmVydCB0aGVtIHRvIG1hY3JvDQo+ID4gZnVuY3Rpb25zLg0KPiANCj4gV2hh
dCBpcyB0aGUgcmVhc29uIGZvciBjb252ZXJ0aW5nIHRoZSBmdW5jdGlvbnMgdG8gbWFjcm8/DQpC
b3RoIEhETUkgUEhZIGRyaXZlciBhbmQgSERNSSBicmlkZ2UgZHJpdmVyIG5lZWQgbWFpbGJveCBB
UEkgZnVuY3Rpb24gdG8gYWNjZXNzIHJlZ2lzdGVyIGFuZCBnZXQgc3RhdHVzIGZyb20gZmlybXdh
cmUuDQpDb3ZlcnQgdGhvc2UgZnVuY3Rpb25zIHRvIG1hY3JvIGNvdWxkIGJlIGVhc3kgcmV1c2Vk
IGJ5IGJvdGggUEhZIGFuZCBicmlkZ2UgZHJpdmVyLg0KDQpCLlINClNhbmRvcg0KDQo=
