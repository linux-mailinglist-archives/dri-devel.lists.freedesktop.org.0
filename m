Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A6F623D1E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 09:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE9610E676;
	Thu, 10 Nov 2022 08:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2053.outbound.protection.outlook.com [40.107.105.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10F710E676
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 08:09:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/c+U96YoKwBs1vjCAEXeVxwMw8l4PBwWlwyH9/hthcED2l6n7jCKrumzGoagwctoyjpXRYLJDclyy0o7zyU1IwnNzRMYiWvZL3a58UK5npeOHrnJ1X0dGJXvuEWmhtT18DsnPSKfgceSs4fzfgTiXmXSIv6gEkACbebi7Di6LL4HDCtkaqnb9z1sUpXj8X8cpGxmK+GJvzadLmNmzlF5umTOzPf4tbXzOzn29lJRP7ietTmgieL/iv/6onEAT8d0/hOkJmskBc1Ibry3XGoi3VaG7VpZFjcvVN3b9ZZY+JG3FEOWSTINtBgMyANZrlB1MYrkjivUjdRJeRacLyObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/1uPrZ3m7SVklkS/HjKFwL0cXHMXEpJJuM1u0A2CKo=;
 b=JO/3Nl3pQugtkhnJ20uVqPgvLg93TSQv8HEzuUUHLUBFLjwTjeThcDh+OJUBPw1UNT64ZjRuzbO8TDL4QetVKUQ+tCoqRcFvGYtbMYxLinR6bYm2rcOM61OFYXUCf+XcnfRZRZ/vqK/CR0FT92WSTWZjbtl31OlciSxEV1JafQRxjMbr8k56kCpjeReKqNYKmwhSVFyfCkjiU2ErA0fJZUjBKQNZDVOFnUFKDY40emw9bZJiOE95mlVJKa2AdbHu5Yg2Am8XyxbsrGv7yqL3x3yBEXTMu9jJEQSip1skH8yVtrnO+bIhgrKbOud+zZP6H9+0Jy58BCheeYdp6OGPhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/1uPrZ3m7SVklkS/HjKFwL0cXHMXEpJJuM1u0A2CKo=;
 b=FOElM/4ZxgI9UiLss48NxNIBo25F+EPSkNwZS8/t8n59htd37nQUI7+/Kw4Gl4t6xaL8CLH/UjtjZScd8V3rrnNf3LYDaJ4hZWTL2Jo07dyCpkqdiLeBMC3ptnFC2NhX5Y9kBamRyzNpl3pc0NuHipsEIpF6Y0PqtEbXQex2+Kw=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8747.eurprd04.prod.outlook.com (2603:10a6:20b:408::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 08:09:54 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%5]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 08:09:54 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: RE: [EXT] Re: [PATCH v3 04/10] phy: Add HDMI configuration options
Thread-Topic: [EXT] Re: [PATCH v3 04/10] phy: Add HDMI configuration options
Thread-Index: AQHY83H5nnenN6Hei02J3GKYmAm5Wq43yA4AgAADDuA=
Date: Thu, 10 Nov 2022 08:09:53 +0000
Message-ID: <PAXPR04MB94487419FD1AD59B54681E97F4019@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1667911321.git.Sandor.yu@nxp.com>
 <3edf9db8261e7f59dcd84a61a492d2483b1e9970.1667911321.git.Sandor.yu@nxp.com>
 <Y2yqiuk13Jjbokum@matsya>
In-Reply-To: <Y2yqiuk13Jjbokum@matsya>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AM9PR04MB8747:EE_
x-ms-office365-filtering-correlation-id: dab186e1-3260-4b8e-74ff-08dac2f2f2f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mlbLH0f/VNE/xgRZnNYPGzDgEjXBC8dKa7Hgp0BTFrRv0an1sFcz6641Kg+9xkXGJoXAU7WIq9ZTuEldNkQmc5YiJg2Xxh/fAg/2MOPAHy7jbHlyxdmjD7MlTB3HAIPIpk1ZLtK4lSkWQ0vekZF1IjAr/yVlaWYCjGS2tiZb0RFt22XKecLKi0Zenc/oXY5nz+7/eGtlE2yql/LgiMzaVohHbk4KObwgIPo41ecInm4K5yc7DXJJVREY+Uev4g98CoCej4Of2rrSB6d9M4IvL7Db0RODlrF9RC3lYUiJpCxWMTLsSRBt/HkovSh9rgHFwj7PP9xgOLD2URsjK9bspLlsvGdhj5yF++OGnwdBX+4HfqXVyv0P0tG20PFqd2Tbx7I76ogiGBRdHpIjh7m/r1zfiJ/g/getSD39ECvY0Owy5DjkCR3V4PqS/REgWFbgPJG9R3pqeT5xiOCDXUzNGWwGTyfcTA6DEmVP0lgt/u/+GtdU30uWyHeFWxUqDJL4D2ygxfrt4jCJtomxPmcm3k9w0TGXwzSzXTKBokORKTLou33UqbQJJOMHT43MijSwPqxBUyJZ7Pe4hmW0bcpb9UnbYPfpQeTCW2UmWu8AL/vXb2bqZ0kWgqXbDFqdsX9EILUqyGe9PH0cjuZ7o9EYSZb72BQjkd1dq0kchBCwoDuVyaTxEN3fBNsbaFNEPRseermH6hcewpM2HwZCZV18DSyF6To+puPR1AVHNMi0zgVa0Y+WHItbO7HhOLpkUdGWBXcEbajzWAx9UvjnFc7G3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199015)(86362001)(8936002)(2906002)(71200400001)(44832011)(55016003)(8676002)(66946007)(33656002)(76116006)(4326008)(26005)(66556008)(66446008)(66476007)(9686003)(5660300002)(64756008)(83380400001)(186003)(7416002)(38070700005)(53546011)(7696005)(478600001)(6506007)(52536014)(316002)(38100700002)(122000001)(54906003)(6916009)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?Q0RBdTJCM2RqelMzZEZSNTZTNTVxMFA1aW9GQk4wRGhheDNRWGF2SUJCUWdy?=
 =?gb2312?B?THV0NnB1R1NlM0dzQ3JRN1pReXlOVVl5TjhiWVFtSnRySE91endod0tETnN6?=
 =?gb2312?B?YVYxMXNJY01YMnAwNUFpbURraitNMTNZT2tVKzlsK0h2ZzA0akFubkpQTnFG?=
 =?gb2312?B?aVpRdmNWbnV3RCttUHZXNFowRDNiUCtVNGU0SHR0cGU0Y25JNi81SVl4NWwx?=
 =?gb2312?B?a3M1aXBSK2poT2NHU2hFTFg3RXpOSWlFWkhYSDlac0Fpd2tENVUrODJWUklq?=
 =?gb2312?B?L0E5T2RVYVZZRWp1WFBTS09sTjlVejBTNS9Tc3U3RUV6ZmZHdG5CWU9TZVhn?=
 =?gb2312?B?azBUdnN3Ung0NnRacytLZmhRWng2cVNsY0dPVktYN0JIOTNpOHJkc1U1MkQz?=
 =?gb2312?B?ejh6Z3BneVZ3bnB3ZWNXOVlKODBkcHNCbjZNOHBVZ0ZieGRMdVZLbTZtMFlt?=
 =?gb2312?B?NzA2Qno1MTYzaTd5TXBLU3YrbEp0a3RtRThseGV2c0ZDT2M1WVJWRjNNbFJU?=
 =?gb2312?B?emk5WUtCNHhJUHBFaUNRR015QnJuekNKSnZmSi83MHVITXI4OWo3dnB4VTZU?=
 =?gb2312?B?dGpvc3BIZXVYTlVVaFlROTJPeVQ2RU4ydTl2VWZkS3lSNUQ5OWozQy9INEw0?=
 =?gb2312?B?NFFPaCs3MWp1YmpHZytVYVhPbk50bWVVdk5HRTVwY29oZFBqOWJBd3hCYXJI?=
 =?gb2312?B?c01vRDBnVDY5UUdmQ2VKbTAwMGRtVUdkb0JJamRlelpVWDUraGVnakN6M3Q3?=
 =?gb2312?B?WDZzWHAvVllFVGJDWUJETWxXWHdBWk9hM2RrbGh0bEJPNTJCVzdKcEorL1Bw?=
 =?gb2312?B?eUFGUnl1WFprQVhCdUlzTVRNYTFsM3ZhVjNIVlJrcXdjZWJ6cSswbzhGZnZH?=
 =?gb2312?B?clp3cVEwSTVUN3M4dFBHMmtqRVRoQzZIUnRBTnZCRHoreTBLcHJ1bmhJaEli?=
 =?gb2312?B?bG53QUNpQlhkUEo3Z2ZBM05DaXZmK0V5cENGQllkd09EUSsvRG1QVjg3Uk51?=
 =?gb2312?B?ZjdwT1NpVDJaaWZHOTN0SEo0L2xqcDlkc3dqYUVyRnpNRk9NbHpxOUlaR0Jo?=
 =?gb2312?B?KytkRUxlM3NldTY2ZDM3RFRKOHlHQkZDUUx1R2xvNDAxMnIxWWo0M2VyQm9W?=
 =?gb2312?B?SnNYbVpJZVZ2SFhEbFFxcFVGMUcrdG96NWNkMDJBZXpXT3JoRjE3YWUzVEZy?=
 =?gb2312?B?TG5aTmRSbHYxQkx0cDE2TkFyMVFNS1BPanEyb29XRFJFK3VMd0JDd2taSzNQ?=
 =?gb2312?B?U0RKb0pCU2d3N0dMcEVjb09BN0pwSXdHbDRmNy9BWWxRRkovbUE4MUdJNXhq?=
 =?gb2312?B?RFF4VlBNVjNBVVdCR0l6alNqQi95NkdaV1ZxOGhwNHpJRlpieGo1dFcwZm5y?=
 =?gb2312?B?YTV0MG4ybkRTdmgwdE9EalROOC8rdkZMSkdIOG5nTmRVaVNnYzNYWEVrTmhM?=
 =?gb2312?B?dUhYMjVHaE5wd2dnR1lIQnhpa0tOQjQ0T21MVnpkVkhiOTNaRjVtVjBuSnVu?=
 =?gb2312?B?MEUvTjBWRjZxeUJSVHhid2tVbEZwdVdiV25UMzlvbFBySFQwa3FDcXlkNVo2?=
 =?gb2312?B?aFUzVnFGU25HNWgyWFExMlNpa3psRDUxekxXTTlUVDJ0K0lpcHYraXYrRXJs?=
 =?gb2312?B?RzNabjNjODE3dkRzdTIvenRNN2x4MVhhb3ZXUGdlTXUyRUpORzZBeXJsRlNi?=
 =?gb2312?B?TC9IWi9hVHpucjRvTzE1U0pyTDRPT2ZZRmlJSVBibFlxSU5IK3RpTFlMQlJB?=
 =?gb2312?B?K2c2ejNkZGtmUWs0aEp4eEx6NXFZY1dFVVBTZVBGaEtKYWtJc2xqTDZ6ejNC?=
 =?gb2312?B?MWRVdjhuV2w3RXhUbWhGVUxneWwzSVRLNTVLMTZLZkprUmZFL2tzS2pzWEhT?=
 =?gb2312?B?WENFY0NybTVBQVlEbXJCS1c5cGlPQXBIRnFzdTBOZWFvbkRyNnBVcjZ4NEh5?=
 =?gb2312?B?RXlPWHNVVkJWbGFPZUUvcjB3Q1dTVnpheFJDZ3ZDOURDRDRpa2wrNUFtekEr?=
 =?gb2312?B?NXlSZDNzOERtTFdFR2FJaDZ0OXN0SGRYVWRhRUtkSS9ReXhRVVJQd3B2NUlw?=
 =?gb2312?B?RjNKa2FuRTBLMkhpeS9pbDNNUVlqWDJyeXZ0SHNRbTRMZ3hNWmFmcjRWT3Fm?=
 =?gb2312?Q?R2hE=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab186e1-3260-4b8e-74ff-08dac2f2f2f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 08:09:53.9571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1acaZKUeWAL+1BqZrPSGHaYJi1qD6hR2vqh3OTBLaOXVlo98d+e0ovdDONrwFN19XPWChjIURdwdFdJUENJ/Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8747
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
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oliver Brown <oliver.brown@nxp.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIHlvdXIgY29tbWVudHMsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogVmlub2QgS291bCA8dmtvdWxAa2VybmVsLm9yZz4NCj4gU2VudDogMjAyMsTqMTHUwjEw
yNUgMTU6MzkNCj4gVG86IFNhbmRvciBZdSA8c2FuZG9yLnl1QG54cC5jb20+DQo+IENjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsN
Cj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOw0KPiBsaW51eC1waHlAbGlzdHMuaW5mcmFkZWFkLm9yZzsgYW5kcnplai5o
YWpkYUBpbnRlbC5jb207DQo+IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc7IHJvYmVydC5mb3Nz
QGxpbmFyby5vcmc7DQo+IExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbTsgam9uYXNA
a3dpYm9vLnNlOw0KPiBqZXJuZWouc2tyYWJlY0BnbWFpbC5jb207IHJvYmgrZHRAa2VybmVsLm9y
ZzsNCj4ga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOyBzaGF3bmd1b0BrZXJuZWwu
b3JnOw0KPiBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGRs
LWxpbnV4LWlteA0KPiA8bGludXgtaW14QG54cC5jb20+OyB0emltbWVybWFubkBzdXNlLmRlOyBs
eXVkZUByZWRoYXQuY29tOw0KPiBqYXZpZXJtQHJlZGhhdC5jb207IHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tOyBzYW1AcmF2bmJvcmcub3JnOw0KPiBqYW5pLm5pa3VsYUBpbnRlbC5jb207
IG1heGltZUBjZXJuby50ZWNoOw0KPiBwZW5ndWluLWtlcm5lbEBpLWxvdmUuc2FrdXJhLm5lLmpw
OyBPbGl2ZXIgQnJvd24gPG9saXZlci5icm93bkBueHAuY29tPg0KPiBTdWJqZWN0OiBbRVhUXSBS
ZTogW1BBVENIIHYzIDA0LzEwXSBwaHk6IEFkZCBIRE1JIGNvbmZpZ3VyYXRpb24gb3B0aW9ucw0K
PiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBPbiAwOC0xMS0yMiwgMjE6MDAsIFNhbmRv
ciBZdSB3cm90ZToNCj4gPiBBbGxvdyBIRE1JIFBIWXMgdG8gYmUgY29uZmlndXJlZCB0aHJvdWdo
IHRoZSBnZW5lcmljIGZ1bmN0aW9ucyB0aHJvdWdoDQo+ID4gYSBjdXN0b20gc3RydWN0dXJlIGFk
ZGVkIHRvIHRoZSBnZW5lcmljIHVuaW9uLg0KPiA+DQo+ID4gVGhlIHBhcmFtZXRlcnMgYWRkZWQg
aGVyZSBhcmUgYmFzZWQgb24gSERNSSBQSFkgaW1wbGVtZW50YXRpb24NCj4gPiBwcmFjdGljZXMu
ICBUaGUgY3VycmVudCBzZXQgb2YgcGFyYW1ldGVycyBzaG91bGQgY292ZXIgdGhlIHBvdGVudGlh
bA0KPiA+IHVzZXJzLg0KPiANCj4gSXMgdGhlcmUgYW55IGRwZW5kZW5jeSBiL3cgcGh5IGFuZCBo
ZG1pLCBJIGRvbnQgc2VlIGFueXRoaW5nIGluIGNvdmVyLi4NCj4gDQo+IFBscyBjb25zaWRlciBz
cGxpdHRpbmcgdGhlIHBoeSBzZXJpZXMgLi4NCkJvdGggSERNSS9EUCBhbmQgUEhZIHBhdGNoIHNl
dCBkZXBlbmQgb24gZWFjaCBvdGhlciB0byBwYXNzIGJ1aWxkLg0KSERNSSBkcml2ZXIgZGVwZW5k
IG9uIHBoeS1oZG1pLmggYW5kIA0KUEhZIGRyaXZlciBkZXBlbmQgb24gY2Rucy1taGRwLW1haWxi
b3guaCB0byBwYXNzIGJ1aWxkLg0KVGhlIGZvbGxvd2VkIGRlc2NyaXB0aW9uIGhhZCBpbiBjb3Zl
ciBwYXRjaDoNCiJUaGUgcGF0Y2ggc2V0IGNvbXBvc2Ugb2YgRFJNIGJyaWRnZSBkcml2ZXJzIGFu
ZCBQSFkgZHJpdmVycy4NCkJvdGggb2YgdGhlbSBuZWVkIHRoZSBmb2xsb3dlZCB0d28gcGF0Y2hl
cyB0byBwYXNzIGJ1aWxkLg0KICBkcm06IGJyaWRnZTogY2FkZW5jZTogY29udmVydCBtYWlsYm94
IGZ1bmN0aW9ucyB0byBtYWNybyBmdW5jdGlvbnMNCiAgcGh5OiBBZGQgSERNSSBjb25maWd1cmF0
aW9uIG9wdGlvbnMiDQoNCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW5kb3IgWXUgPFNh
bmRvci55dUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBpbmNsdWRlL2xpbnV4L3BoeS9waHktaGRt
aS5oIHwgMzMNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGluY2x1
ZGUvbGludXgvcGh5L3BoeS5oICAgICAgfCAgNyArKysrKystDQo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgMzkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKSAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+
ID4gaW5jbHVkZS9saW51eC9waHkvcGh5LWhkbWkuaA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvcGh5L3BoeS1oZG1pLmgNCj4gPiBiL2luY2x1ZGUvbGludXgvcGh5L3BoeS1o
ZG1pLmggbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXgNCj4gPiAwMDAwMDAwMDAwMDAuLjczYTMy
ZWI1MzViMA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L3BoeS9w
aHktaGRtaS5oDQo+ID4gQEAgLTAsMCArMSwzMyBAQA0KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMCAqLw0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQgMjAyMiBOWFAN
Cj4gPiArICovDQo+ID4gKw0KPiA+ICsjaWZuZGVmIF9fUEhZX0hETUlfSF8NCj4gPiArI2RlZmlu
ZSBfX1BIWV9IRE1JX0hfDQo+ID4gKw0KPiA+ICtlbnVtIGhkbWlfcGh5X2NvbG9yc3BhY2Ugew0K
PiA+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfUkdCLA0KPiA+ICsgICAgIEhETUlfUEhZX0NP
TE9SU1BBQ0VfWVVWNDIyLA0KPiA+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfWVVWNDQ0LA0K
PiA+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfWVVWNDIwLA0KPiA+ICsgICAgIEhETUlfUEhZ
X0NPTE9SU1BBQ0VfUkVTRVJWRUQ0LA0KPiA+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfUkVT
RVJWRUQ1LA0KPiA+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfUkVTRVJWRUQ2LA0KPiA+ICt9
Ow0KPiANCj4ga2VybmVsLWRvYyBzdHlsZSBjb21tZW50cyBoZXJlIHRvbyBwbGVhc2UNCk9LLCBJ
IHdpbGwgYWRkIGl0Lg0KPiANCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiBzdHJ1Y3QgcGh5X2Nv
bmZpZ3VyZV9vcHRzX2hkbWkgLSBIRE1JIGNvbmZpZ3VyYXRpb24gc2V0DQo+ID4gKyAqIEBwaXhl
bF9jbGtfcmF0ZTogIFBpeGVsIGNsb2NrIG9mIHZpZGVvIG1vZGVzIGluIEtIei4NCj4gPiArICog
QGJwYzogTWF4aW11bSBiaXRzIHBlciBjb2xvciBjaGFubmVsLg0KPiA+ICsgKiBAY29sb3Jfc3Bh
Y2U6IENvbG9yc3BhY2UgaW4gZW51bSBoZG1pX3BoeV9jb2xvcnNwYWNlLg0KPiA+ICsgKg0KPiA+
ICsgKiBUaGlzIHN0cnVjdHVyZSBpcyB1c2VkIHRvIHJlcHJlc2VudCB0aGUgY29uZmlndXJhdGlv
biBzdGF0ZSBvZiBhIEhETUkgcGh5Lg0KPiA+ICsgKi8NCj4gPiArc3RydWN0IHBoeV9jb25maWd1
cmVfb3B0c19oZG1pIHsNCj4gPiArICAgICB1bnNpZ25lZCBpbnQgcGl4ZWxfY2xrX3JhdGU7DQo+
ID4gKyAgICAgdW5zaWduZWQgaW50IGJwYzsNCj4gPiArICAgICBlbnVtIGhkbWlfcGh5X2NvbG9y
c3BhY2UgY29sb3Jfc3BhY2U7IH07DQo+ID4gKw0KPiA+ICsjZW5kaWYgLyogX19QSFlfSERNSV9I
XyAqLw0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3BoeS9waHkuaCBiL2luY2x1ZGUv
bGludXgvcGh5L3BoeS5oIGluZGV4DQo+ID4gYjE0MTM3NTdmY2MzLi42ZjY4NzNlYTcyNzAgMTAw
NjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9waHkvcGh5LmgNCj4gPiArKysgYi9pbmNsdWRl
L2xpbnV4L3BoeS9waHkuaA0KPiA+IEBAIC0xNyw2ICsxNyw3IEBADQo+ID4gICNpbmNsdWRlIDxs
aW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4NCj4gPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvcGh5
L3BoeS1kcC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcGh5L3BoeS1oZG1pLmg+DQo+ID4gICNp
bmNsdWRlIDxsaW51eC9waHkvcGh5LWx2ZHMuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BoeS9w
aHktbWlwaS1kcGh5Lmg+DQo+ID4NCj4gPiBAQCAtNDIsNyArNDMsOCBAQCBlbnVtIHBoeV9tb2Rl
IHsNCj4gPiAgICAgICBQSFlfTU9ERV9NSVBJX0RQSFksDQo+ID4gICAgICAgUEhZX01PREVfU0FU
QSwNCj4gPiAgICAgICBQSFlfTU9ERV9MVkRTLA0KPiA+IC0gICAgIFBIWV9NT0RFX0RQDQo+ID4g
KyAgICAgUEhZX01PREVfRFAsDQo+ID4gKyAgICAgUEhZX01PREVfSERNSSwNCj4gPiAgfTsNCj4g
Pg0KPiA+ICBlbnVtIHBoeV9tZWRpYSB7DQo+ID4gQEAgLTYwLDExICs2MiwxNCBAQCBlbnVtIHBo
eV9tZWRpYSB7DQo+ID4gICAqICAgICAgICAgICB0aGUgRGlzcGxheVBvcnQgcHJvdG9jb2wuDQo+
ID4gICAqIEBsdmRzOiAgICBDb25maWd1cmF0aW9uIHNldCBhcHBsaWNhYmxlIGZvciBwaHlzIHN1
cHBvcnRpbmcNCj4gPiAgICogICAgICAgICAgIHRoZSBMVkRTIHBoeSBtb2RlLg0KPiA+ICsgKiBA
aGRtaTogICAgQ29uZmlndXJhdGlvbiBzZXQgYXBwbGljYWJsZSBmb3IgcGh5cyBzdXBwb3J0aW5n
DQo+ID4gKyAqICAgICAgICAgICB0aGUgSERNSSBwaHkgbW9kZS4NCj4gPiAgICovDQo+ID4gIHVu
aW9uIHBoeV9jb25maWd1cmVfb3B0cyB7DQo+ID4gICAgICAgc3RydWN0IHBoeV9jb25maWd1cmVf
b3B0c19taXBpX2RwaHkgICAgIG1pcGlfZHBoeTsNCj4gPiAgICAgICBzdHJ1Y3QgcGh5X2NvbmZp
Z3VyZV9vcHRzX2RwICAgICAgICAgICAgZHA7DQo+ID4gICAgICAgc3RydWN0IHBoeV9jb25maWd1
cmVfb3B0c19sdmRzICAgICAgICAgIGx2ZHM7DQo+ID4gKyAgICAgc3RydWN0IHBoeV9jb25maWd1
cmVfb3B0c19oZG1pICAgICAgICAgIGhkbWk7DQo+ID4gIH07DQo+ID4NCj4gPiAgLyoqDQo+ID4g
LS0NCj4gPiAyLjM0LjENCj4gDQo+IC0tDQo+IH5WaW5vZA0KDQpCLlINClNhbmRvcg0K
