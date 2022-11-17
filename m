Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C8E62D9A8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 12:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D374510E0C0;
	Thu, 17 Nov 2022 11:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150058.outbound.protection.outlook.com [40.107.15.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9F210E0C0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 11:41:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHtJKJQyRhR5Sx/dBWbrRRLLtR5XtUM+4+zyAGp2YUQGMWHZ1e4VspfalttLmnDLY5g/aJKBQnOPLxIIANr0r1f8LZ/GzP1AsJTy/Pm5Q8S//671bbjUc5+nTRaiHfN9NsEFpncqDbmcTr9RosO5icdYJF3iRtmMhh0xwuHDVh2ZJRZz5pzcXbBCK4r9C2FDNqU4Ate1wYWshfqpxlzAXVFlvRdPMVnYyfn5YCrvD88MKaqzbq+OC65ouXKuwlIkwEDZvGBGiFZlXqUEaQ6ixeMElCE/NNRMf+wEuM62zivJvL4H500bgEujJyV1XZT5zs1epoEm78DIZIe25syT7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OURMDYoROAfumyJJ8L+CmLWIRCkO9JRnfXXseLsMbC8=;
 b=aHOUjieKFWAeF5D/fDreAr+Rhp2i3Cu6XPIuuyHXQInpzapDbK1vxgWz7odgUD56C+b5LE+vrwsieepiYGhilOQA+TwdQgDWiIfjuAnshyTTUrPv6wBLptp6AoZP8H3sTYo64navlV6weHnsAwUsWQjLgYln6sXEe89ynOHUJq2AZWqa65Eaf5mwYnvRSC8UYGeiNpbBWb8Qmgr3EHrgRLvF0BKI8yroaCjwIqKqiWu84MysEmLR2D3fJteMNh/IAyfSFxz3QFUnlnWQovPQyQSVL/qlBSwFEA48CzzCXOQx2efqkTqepkeDZGY3ArLSCHP2Jswl3M+3U9WiO8yQiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OURMDYoROAfumyJJ8L+CmLWIRCkO9JRnfXXseLsMbC8=;
 b=TfphsqJba4UrvAGs95UsfyybwOseUGMfEuvCq/NWKrIO0v4YbfO5P0ykc5ZX1akqrvIv1gaknaeMUH1fwnHDeQAcDX/H9UPd1jETkLMktvKYU1QvKly66tTnBdqVC8N8+D2MJ6HUh4Qpwv/Mz7pn3GnQXGZZddQPYGu7z5k9qWI=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB8436.eurprd04.prod.outlook.com (2603:10a6:20b:347::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Thu, 17 Nov
 2022 11:41:14 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%5]) with mapi id 15.20.5813.016; Thu, 17 Nov 2022
 11:41:14 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [EXT] Re: [PATCH v3 05/10] dt-bindings: display: bridge: Add MHDP
 DP for i.MX8MQ
Thread-Topic: [EXT] Re: [PATCH v3 05/10] dt-bindings: display: bridge: Add
 MHDP DP for i.MX8MQ
Thread-Index: AQHY83H6QfZa/GS5QE20GehI6TjGIq5ByZ6AgAD3F7A=
Date: Thu, 17 Nov 2022 11:41:14 +0000
Message-ID: <PAXPR04MB944846C2AE5B8F1CAA9C9782F4069@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1667911321.git.Sandor.yu@nxp.com>
 <71c504aeb11f55e9dca533cc1b490b8e069c7b7b.1667911321.git.Sandor.yu@nxp.com>
 <20221116162701.GA195244-robh@kernel.org>
In-Reply-To: <20221116162701.GA195244-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AS8PR04MB8436:EE_
x-ms-office365-filtering-correlation-id: e1725c92-f008-42a4-142f-08dac890a205
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dE2al8J+ta8l+KxQrzqZvBzOAjX6y1nkEcNp6+9MxNUEAiApkhhSqR9sbK67MkZ1MNpK9nJJv7cNnxuQVtRobh30Wcd3epeRG0N1WQiy6vwmGOj4G5ckxx2GPuCND8VAhjn6DGvWGADlUy3/c2bNquamoeUra0qgFDZv+PQeBW0K4UN0Lcogu+O7tM7Gyr7kHVLYoy8KLR8kzIxAtNIRwOWtv0QoEmJOpKaQt7Al5IJX7mMEJPeWKbzWJtp/FNDV6klXmlviI4Zqdgl5YoNzgFo5YCKVyf4Rg9V/MC1AzOUnYIZub0F76cP1Ury34HC3tokqnP5T6JIpZqyvk42+I+Q1P6Y5fZJUjB9MPq5GX9lIbPuBLhUK0faeubl8gJvbN3YULi/Out5z4P67yDnLtJMJt/bFBvuWM6q0QMEtsBcRTmfaI00u7OeIPwn3DkrM//sRDDrpbrWBqh6JWTlrWL1W0FJ6OPUKugvxpec2S0Nzr9DHJeZ7fYeS2tS7UyDVKcWylNWYPqRVSW7owVz5kDPrGEI6dKk+TRXoZHeBXxWGxuD5B2X24Op9gjVqkXcE25sPZRH/UO1lH49swffLiTNqPb2LzKxyf/Edq2P2TDIqZIdaYkB5XTOVZzm75VA4lsOynL61nZX0jLgtzo4+wIoIOSfY4q3g9ln/qSkxLpAs4SQn5SwNrIuRsI2zlPoxwVWk8hft0PP9mq5DOsgg0LQiLNUNYX4//vpH42YFeZ8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199015)(86362001)(8676002)(76116006)(55016003)(33656002)(66476007)(66946007)(66556008)(66446008)(41300700001)(64756008)(478600001)(52536014)(186003)(44832011)(4326008)(71200400001)(26005)(45080400002)(8936002)(316002)(9686003)(83380400001)(38100700002)(122000001)(7696005)(7416002)(38070700005)(53546011)(6506007)(6916009)(5660300002)(54906003)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?KzZkVFJsMXdLMzUyRWpmUnVDSXR0ZFFTTDRWVEQwR3RmQ0hqQnU3WUZOUXpn?=
 =?gb2312?B?ODI0Z211aUNaOUNSUHFNcWNRc0lhbHlXS1NjNHpmODBXWTk2R3BueFdpd2E1?=
 =?gb2312?B?Skszd2JYRjFKSER5dUNzTi9qSmcrV0tLUXNPcUZYTERVWE11MzJ2RGk5Q2NT?=
 =?gb2312?B?a1ZNa2x1Q3QyRTRhMGorTkY0ZUE4RTZEQmpQVHc0SWxDT2pWdlhncFFMM1Bt?=
 =?gb2312?B?VXZ0cDN1eFdDUjhDTXh4UGQzOGVZcnR3aWVUeVh0Q0IzSFdJN2UzclJXZ0lC?=
 =?gb2312?B?RVI5UWs0b1RXY2tlaE1oaFF6cUJySlVjRTgzZklvT3FpbGkwNnJMekZuUjMy?=
 =?gb2312?B?UE56Y1FGdHhudnR3cTJUcm82dTQ0S2ppbVJncVB6dkcvSHdsa2tsQ0NxRDFw?=
 =?gb2312?B?UXlYa3p3VDNlWXpHRzdLM2lhQVhWZnpQWEhmeHhsTURrQm5ZWEZtbjJxWVZ4?=
 =?gb2312?B?RDYrRzRtWXJKNnB2Mk1Bb0hCZzNFemI5Y21OYUlSb1hwR1prUEN4MU9EQkpU?=
 =?gb2312?B?dy9aMkhucU1JdVpkQWVHSlljYmc2RHlpcGE0WDFlak5RbWVHQmpYWVozNVdG?=
 =?gb2312?B?NUxlV2FVYVpsbGU5OWhhVkE3L09qOHNMZmhWWlJQSXdRbTl4OVhvVkYrZnFC?=
 =?gb2312?B?eHV3eEVQU2NBcjNGZk9FbllSNUJqOUlpU09XcGVGejFGTys1bHFMR0IzUGF1?=
 =?gb2312?B?d3hhaFNaSi9aMmR4WEk0bnBEZWZGM0wrMlRWdWh6YnpwSFl1WlB5RVdwa2ZD?=
 =?gb2312?B?MmI0bGxoMXN6RFhJKzh5M0ZNdThLaFNwVU5DWjRKTUYxK3ZIbzY3eHYvOHRI?=
 =?gb2312?B?MmpFbkg4UTJ3azlOZ2FpTXhYZnlOVTJGL3NFSnpsQUhXOXE5WkpETS9CYnov?=
 =?gb2312?B?bUNXZHBuS00rYVBCajlUYTB2eUQrVU5OcG9pU1NQOUlkUFNwL2NEQkdKSW90?=
 =?gb2312?B?YXp2b2VWZ01kSVRCK0pjdlY1b051YzNtWFlXV1BsNzljaXJyY0R3NVNZdzJk?=
 =?gb2312?B?NmZQUHZaSlgzMGx5QUxiaGFxK0M1OXhIZG5lQWJJdWZlcDZsQkQyNWo0TDhX?=
 =?gb2312?B?NkVXcWdrbzVnVjYxblpDdUN0Z1cwVitOWkJjUGVJMkJZaytoQzJBUWZyRmtG?=
 =?gb2312?B?OEY3QW1JSUpiaFZ5NFZCdUtQTUtHZFNEejMyTFFuUHNzeE9PVW9YWXIzV1di?=
 =?gb2312?B?SmVaSjZ6SGxVcCttSE9Pd3hVRHpqQkVweE9BKzJpaEwwVmRsTXZXd050S0JQ?=
 =?gb2312?B?RURqWTR2WURQaGJqZUdiM0Y0dkVtZ09HTG11TWRZa3JmMzF6R0pPeXh0MnB1?=
 =?gb2312?B?YThBVXQ2SENZWVpiQzUwMkQ3UVJxSE80QytQaWJveVlWM2xmcGxqSTFrNTZE?=
 =?gb2312?B?MHFwWnR6QzBFNzIrYTlYUnM2enBoalBOcFYwQlRhSzN3OHRXMWI2bGFYOWh0?=
 =?gb2312?B?M0p4dzlHeGVsUDlDdzhuRU5Nc0pZdHZoVVppV0IvbWFCblZEMWZ1dzlXbDlB?=
 =?gb2312?B?M1FjOEJFQmdlbmh5ajJiUURDS2Y0aEg3MVAxbGtVbkd3ME9kOWg3a3ZGSWJB?=
 =?gb2312?B?TEVwaU10ODc2d1dBb2Z1VjdIYTgzN3NOK3dsN3dyNXc2N3h6TENLRkx6MTNv?=
 =?gb2312?B?ZmdwdzMrWXhaNEhONFJQbTBteGdBTThHWmlpcWRXT0Q2a1FhNG1HaTB2UUtL?=
 =?gb2312?B?Nlkybmk3L1ZKazNFcGtFMldRRDEzRlNNZEpUcVNRQURXRjNUTmswNnUxaE1M?=
 =?gb2312?B?UFdPbWltaWlUbmE0MEx5UDk0TUtCQkpWQ3NHbHVRUUk1Qm9yL2Y0Y1gvWkUr?=
 =?gb2312?B?ZDFCeWZYb2xVV00xNmhzY0dWQ0MrRlRIZ3BPeWlpUTJuWTM1RC9Kb0Y2UUw1?=
 =?gb2312?B?SEVpMHY2OUN1Kys3N1hKWDVWK3NjK0NKaHBiZ1Z6OHR3eVlDa0E1YlBiM0Uy?=
 =?gb2312?B?dTVycjZHM09HQjM0UllwTkNtUCtGVC92c0ZpckpTbHRWS0dXUW92a1diVnFs?=
 =?gb2312?B?QWFFVC91VXJwcmJaQ3oybm1kRmJDMHFxOTFLSVhXSDdKaWxuT1ZMRXE4eW0x?=
 =?gb2312?B?MTBEMUJud0VLZlppbExzb3VVOTBJOU5GRVdSOVdrMDNkdTd3bjFSek1LTHlH?=
 =?gb2312?Q?Pda+muTpmCuYLcQqoscvBty62?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1725c92-f008-42a4-142f-08dac890a205
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2022 11:41:14.5277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: frHKigqgg8P4sLPXBalX2iJgwv6yVzzLezQLxslWhK/XB2vzIStMASPXdgseOMFuxp6DB+UHOW5xo/pJDvt4LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8436
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
 "penguin-kernel@i-love.sakura.ne.jp" <penguin-kernel@i-love.sakura.ne.jp>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oliver Brown <oliver.brown@nxp.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLA0KDQpUaGFua3MgeW91ciBjb21tZW50cywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBTZW50OiAy
MDIyxOoxMdTCMTfI1SAwOjI3DQo+IFRvOiBTYW5kb3IgWXUgPHNhbmRvci55dUBueHAuY29tPg0K
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtcGh5QGxpc3RzLmluZnJhZGVhZC5vcmc7
IGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tOw0KPiBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnOyBy
b2JlcnQuZm9zc0BsaW5hcm8ub3JnOw0KPiBMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5j
b207IGpvbmFzQGt3aWJvby5zZTsNCj4gamVybmVqLnNrcmFiZWNAZ21haWwuY29tOyB2a291bEBr
ZXJuZWwub3JnOw0KPiBrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7IHNoYXduZ3Vv
QGtlcm5lbC5vcmc7DQo+IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IGtlcm5lbEBwZW5ndXRyb25p
eC5kZTsgZGwtbGludXgtaW14DQo+IDxsaW51eC1pbXhAbnhwLmNvbT47IHR6aW1tZXJtYW5uQHN1
c2UuZGU7IGx5dWRlQHJlZGhhdC5jb207DQo+IGphdmllcm1AcmVkaGF0LmNvbTsgdmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb207IHNhbUByYXZuYm9yZy5vcmc7DQo+IGphbmkubmlrdWxhQGlu
dGVsLmNvbTsgbWF4aW1lQGNlcm5vLnRlY2g7DQo+IHBlbmd1aW4ta2VybmVsQGktbG92ZS5zYWt1
cmEubmUuanA7IE9saXZlciBCcm93biA8b2xpdmVyLmJyb3duQG54cC5jb20+DQo+IFN1YmplY3Q6
IFtFWFRdIFJlOiBbUEFUQ0ggdjMgMDUvMTBdIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBicmlkZ2U6
IEFkZCBNSERQDQo+IERQIGZvciBpLk1YOE1RDQo+IA0KPiBDYXV0aW9uOiBFWFQgRW1haWwNCj4g
DQo+IE9uIFR1ZSwgTm92IDA4LCAyMDIyIGF0IDA5OjAwOjA4UE0gKzA4MDAsIFNhbmRvciBZdSB3
cm90ZToNCj4gPiBBZGQgYmluZGluZ3MgZm9yIGkuTVg4TVEgTUhEUCBEaXNwbGF5UG9ydC4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbmRvciBZdSA8U2FuZG9yLnl1QG54cC5jb20+DQo+ID4g
LS0tDQo+ID4gIC4uLi9kaXNwbGF5L2JyaWRnZS9jZG5zLG1oZHAtaW14OG1xLWRwLnlhbWwgICB8
IDU5DQo+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDU5IGluc2Vy
dGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4NCj4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2NkbnMsbWhkcC1pbXg4bXEtZHAueQ0K
PiA+IGFtbA0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+DQo+IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2NkbnMsbWhkcC1pbXg4bXEtZHANCj4gPiAu
eWFtbA0KPiA+DQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
YnJpZGdlL2NkbnMsbWhkcC1pbXg4bXEtZHANCj4gPiAueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jNGQ1MzYyZGIyYjUNCj4gPiAtLS0gL2Rl
di9udWxsDQo+ID4gKysrDQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2NkbnMsbWhkcC1pbXg4bQ0KPiA+ICsrKyBxLWRwLnlhbWwNCj4gPiBAQCAt
MCwwICsxLDU5IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9S
IEJTRC0yLUNsYXVzZSkgJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6DQo+ID4gK2h0dHBz
Oi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJG
JTJGZGV2aQ0KPiA+DQo+ICtjZXRyZWUub3JnJTJGc2NoZW1hcyUyRmRpc3BsYXklMkZicmlkZ2Ul
MkZjZG5zJTJDbWhkcC1pbXg4bXEtZHAuDQo+IHlhbWwlDQo+ID4NCj4gKzIzJmFtcDtkYXRhPTA1
JTdDMDElN0NTYW5kb3IueXUlNDBueHAuY29tJTdDZmFkZGUxY2RjZWZlNGMxZTVmDQo+IGIxMDhk
YWMNCj4gPg0KPiArN2VmNjQyZiU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdD
MCU3QzAlN0M2MzgwNDIxMg0KPiA4MjMzMTY1MA0KPiA+DQo+ICs5NiU3Q1Vua25vd24lN0NUV0Zw
Ykdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU0NCj4geklpTENKQlRpDQo+
ID4NCj4gK0k2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MlN0MlN0MmYW1wO3NkYXRh
PUVqdnRuV2hQDQo+IE1WS2d6bEtDN2YNCj4gPiArOEdDM0V0aWRES2drVTV2TVN1UmF6M0JxZyUz
RCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+ICskc2NoZW1hOg0KPiA+ICtodHRwczovL2V1cjAxLnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUyRmRldmkNCj4gPg0K
PiArY2V0cmVlLm9yZyUyRm1ldGEtc2NoZW1hcyUyRmNvcmUueWFtbCUyMyZhbXA7ZGF0YT0wNSU3
QzAxJTdDU2ENCj4gbmRvci55dQ0KPiA+DQo+ICslNDBueHAuY29tJTdDZmFkZGUxY2RjZWZlNGMx
ZTVmYjEwOGRhYzdlZjY0MmYlN0M2ODZlYTFkM2JjMmI0Yw0KPiA2ZmE5MmNkDQo+ID4NCj4gKzk5
YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzgwNDIxMjgyMzMxNjUwOTYlN0NVbmtub3duJTdDVFdGcA0K
PiBiR1pzYjNkOGV5SlcNCj4gPg0KPiArSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlM
Q0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlNw0KPiBDMzAwMA0KPiA+DQo+ICslN0MlN0Ml
N0MmYW1wO3NkYXRhPWwwdFZZc091VDZTTmJSRWNnNjVzMEZZalZWcnBVTSUyRjVWenRSdnhFDQo+
IHNnQTglM0QmDQo+ID4gK2FtcDtyZXNlcnZlZD0wDQo+ID4gKw0KPiA+ICt0aXRsZTogQ2FkZW5j
ZSBNSERQIERpc3BsYXlwb3J0IGJyaWRnZQ0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4g
KyAgLSBTYW5kb3IgWXUgPFNhbmRvci55dUBueHAuY29tPg0KPiA+ICsNCj4gPiArZGVzY3JpcHRp
b246DQo+ID4gKyAgVGhlIENhZGVuY2UgTUhEUCBEaXNwbGF5cG9ydCBUWCBpbnRlcmZhY2UuDQo+
ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBlbnVt
Og0KPiA+ICsgICAgICAtIGNkbnMsbWhkcC1pbXg4bXEtZHANCj4gPiArDQo+ID4gKyAgcmVnOg0K
PiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgcGh5czoNCj4gPiArICAgIG1heEl0
ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBpdGVtczoNCj4gPiAr
ICAgICAgLSBkZXNjcmlwdGlvbjogSG90cGx1ZyBkZXRlY3QgaW50ZXJydXB0ZXIgZm9yIGNhYmxl
IHBsdWdpbiBldmVudC4NCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogSG90cGx1ZyBkZXRlY3Qg
aW50ZXJydXB0ZXIgZm9yIGNhYmxlIHBsdWdvdXQgZXZlbnQuDQo+ID4gKw0KPiA+ICsgIGludGVy
cnVwdC1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0OiBwbHVnX2lu
DQo+ID4gKyAgICAgIC0gY29uc3Q6IHBsdWdfb3V0DQo+ID4gKw0KPiA+ICsgIHBvcnQ6DQo+ID4g
KyAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQNCj4gPiArICAg
IGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBBIHBvcnQgbm9kZSBwb2ludGluZyB0byB0aGUgb3V0
cHV0IHBvcnQgb2YgYSBkaXNwbGF5IGNvbnRyb2xsZXIuDQo+IA0KPiBTaW1pbGFybHksIHlvdSBu
ZWVkIGFuIG91dHB1dCBwb3J0IHRvIERQIChvciBVU0ItQykgY29ubmVjdG9yLg0KPiANCkJvdGgg
dGhlIEhETUkgYW5kIERQIGRyaXZlciBkb24ndCBuZWVkIHRoZSBmdW5jdGlvbnMgb2YgZGlzcGxh
eS1jb25uZWN0b3IsIA0KZG8gd2Ugc3RpbGwgbmVlZCBhbiBvdXRwdXQgcG9ydCB0byBjb25uZWN0
b3IgaGVyZT8NCg0KQi5SDQpTYW5kb3INCg0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgICNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+DQo+ID4g
KyAgICBtaGRwX2RwOiBkcC1icmlkZ2VAMzJjMDAwMDAgew0KPiA+ICsgICAgICAgIGNvbXBhdGli
bGUgPSAiY2RucyxtaGRwLWlteDhtcS1kcCI7DQo+ID4gKyAgICAgICAgcmVnID0gPDB4MzJjMDAw
MDAgMHgxMDAwMDA+Ow0KPiA+ICsgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxNiBJUlFf
VFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAgICAgIDxHSUNfU1BJIDI1IElSUV9U
WVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICsgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJwbHVnX2lu
IiwgInBsdWdfb3V0IjsNCj4gPiArICAgICAgICBwaHlzID0gPCZkcF9waHk+Ow0KPiA+ICsNCj4g
PiArICAgICAgICBwb3J0IHsNCj4gPiArICAgICAgICAgICAgbWhkcF9pbjogZW5kcG9pbnQgew0K
PiA+ICsgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZkY3NzX291dD47DQo+ID4g
KyAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgfTsNCj4gPiArICAgIH07DQo+ID4gLS0NCj4g
PiAyLjM0LjENCj4gPg0KPiA+DQo=
