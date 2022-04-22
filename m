Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA86F50ACB1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 02:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAA310E102;
	Fri, 22 Apr 2022 00:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2056.outbound.protection.outlook.com [40.107.22.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AB310E102
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 00:15:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LywH8lHRWjUFt2d5MQI3DIhhMJK1iOccgcbtAL9kJwPfs8KmoiNCFB5lDEnzviz+ip8hvqGklj/23BpVtW1PQ1Wj/l7ncqUYWOk/ewuchctGdglGGODb/kOwSw55jPBuSPdz5qpq1UfkaUwFFsfBYarqAfuq8ZPrHxne0w7Ls1YrWVuuTbZ67vhZycIRZnlzyKraHe/nmjR24uyM0BWBSpuiNE8LskemeCdR8464udaZy2D7seAjDWfHtZj4jA4bOsIU3bS9tth34TtHUm00DsCSaTticCemhn5hwkV296Rd5b0c7+GHnGE3ZMSM+la1Pqh4nSfl57fBbjVPCyWcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWFyUZj/zVtNc8NFvbrp+n5nF+S91xdhKq7gx4mJsC8=;
 b=PEyEiFc04FqdcdtlTsqS1GLbSs8RF6NyPtKyQNfQyfy9UMxu5Wt7ZIISDgG+Qi5NSJrY6dabXFK7vridokEpPGGznLniSGArenDs9k7g8s94iuNH4dYiMybh7gFySWXkcyJx8opGrLGhrHaQs736XXd+EanQfpkO7xdhwWkT3ikfyEa3ZjkfExuei8e8vrajsM52DFlhvoul+u1ypcbrA/U27YXzdCDKz4tDVv5qPnn6UlGZbHUwmDfx5dDltRsyC6jSrdBDmFRQp5cwqRyboIEU9D6qJT76RqFVXuLDhG0of2wDCwAdEY3s2uUKufC6axKz5PCSDJ1XyltJ0UFGVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWFyUZj/zVtNc8NFvbrp+n5nF+S91xdhKq7gx4mJsC8=;
 b=j/j3I9lmmIdywINLpjsakINCQIwPySDGIOX5mmSk/+haWEAT5glA3ziA/Q+WjXV4H+rddb+BDjYoHUK0jMqZKv4Qt/jqo+rvaQh3kGjRa6DU5LitF2jzjJKT2dQ3+cePLi3XHRfDAS7K3/LxQ1ce/o43wix75oodRTtga+exLqU=
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Fri, 22 Apr
 2022 00:15:34 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::30fe:e822:948:e688]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::30fe:e822:948:e688%5]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 00:15:34 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: kernel test robot <lkp@intel.com>
Subject: RE: [EXT] [PATCH] drm: bridge: dw_hdmi: Audio: fix returnvar.cocci
 warnings
Thread-Topic: [EXT] [PATCH] drm: bridge: dw_hdmi: Audio: fix returnvar.cocci
 warnings
Thread-Index: AQHYVZHwENrE1Ads70manIRj8DA8x6z7EMIg
Date: Fri, 22 Apr 2022 00:15:34 +0000
Message-ID: <DB7PR04MB545078BA054E5C78C5CCF9DBF4F79@DB7PR04MB5450.eurprd04.prod.outlook.com>
References: <202204212311.TnfpcTGm-lkp@intel.com>
 <YmFzutFV/iDyEQF2@dd18de969aa6>
In-Reply-To: <YmFzutFV/iDyEQF2@dd18de969aa6>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2dd920e-ce09-49df-00a0-08da23f5382c
x-ms-traffictypediagnostic: DU0PR04MB9372:EE_
x-microsoft-antispam-prvs: <DU0PR04MB93728E1017E09D451E3A9605F4F79@DU0PR04MB9372.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yhjLB//Je6Iny47BiGdMqiD7qup2dARNAPgM6CUFAL1cxbFFOlVuYnCMOVMuREitmC6fd/tereGX4AB9M28l668ffcVzduMJQQGKuzcKTslick5u3vN/XIaD+eXrNETWJnM1d3wfEZenZV3ltitNIz7Twae+3Kay+oBrySGn4txwgsLQrtl8Q3TKVowJkhsC83Xux/F1pKkPa7Ib3eicSqhRsMejS0sWSREUvq34ni5TsATztTyb9PzjekQA3b0di/8ga9uWaoXG973BCBhMkLut1utQDpVPHiaQH6e8seoxNEznpVLtz1ua8Ocxiv7XNQ3DLSx2FFwWFKq+Gj35AhwO4NHa+LilBNERsUyRzS4017FPynJxUVp/4iQ8SVnJoOOrX+K03PyVgLwcfjz7N5O22Fbe0nSTKJJW8ql6lkndFF2tAml0lKgx2j2VnW4MolKp/xz3THk+t0hQmKQmb8tihn6UNBDeLKpiBHHuSjKCPXJIEyEJVk7qtnKb75iwavBxqMp0nR2bWf6fvrzClF6CDOYpWtsg84UXv6dk+CR9PY8heAvQWLyipQ+k4M5TU7BUPRORQCn9H+pondzep/RZsAx2Hf7oJeUveGvODONx2R1asJPA8ebMxahZXWwIwmL5YgUKYl86bojMtwi8d56vZ5cKsiis3pAdW57k5CRV/WZk185BSUckPKhqyqcmg77G0zk8TOeWcurpO5ZsNMQTuHj/tAAZ0Qht/gtHhb3vcmlqwK7UAuZIV6a+gE793jyf2vMq7zE1nzBDuZ7wVaOymDLE1pJSptcD6lzimEk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(8936002)(38070700005)(122000001)(38100700002)(26005)(71200400001)(83380400001)(66946007)(33656002)(316002)(5660300002)(7416002)(55016003)(66446008)(66476007)(66556008)(8676002)(64756008)(44832011)(54906003)(6916009)(52536014)(7696005)(76116006)(186003)(9686003)(6506007)(508600001)(86362001)(45080400002)(53546011)(966005)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?SlFDUnBIKzJsK2dpaDNZdEtnNW0zOXB5a04vZzcrNU1Mc2lYa3FDR1JTVWRW?=
 =?gb2312?B?ZnNrbFZQc3JvbVhtR2Z3bUc1N2JDeVYxRCtkWjdENW42Q3QzRmxoVjNLNEho?=
 =?gb2312?B?OXBSTnFxUXFDYVVNV3VyQ1F6aVI4azcxN3VpOFBxSkF4a0M1bkNiaDZlVlg1?=
 =?gb2312?B?a1JOd0xzUHRIYzBlTy92MjlpSjFPSDYxRFBYd0tZemc3YVRaK2xZY2Yrbmx3?=
 =?gb2312?B?VFNEdGt0TnpKOTlyZmFWWk9Gd1k1L0dTdngweVI0eENvdHQyaUFTcjBuT3Ri?=
 =?gb2312?B?QjRFS1pHekIrdE9BTmxlNFFycW55ejdjQ2ZjSzR4MjZtSE96QlR3aXdNNHdF?=
 =?gb2312?B?Z0JndkR3c2dBODIyVFJXSkcrMlo0V2p1MEUvaUllVW12K0xZM0VUR1Q5S0V1?=
 =?gb2312?B?VlM5V2dqYWpDRE5iTHc0UXRXTmJRdWVsTURoSUNmbW1YZEJBUUpjNDVDZW05?=
 =?gb2312?B?SFVDTnIyWXVyZHZoWERoNi9KWG5Ub2xldHJ1QmNHUzlyWHdka2tiaWhnZTJE?=
 =?gb2312?B?WEJHUjN6OUZQT2VjaXZEU0JWaHMxQnNNV2VkclRvcjE4NXdBM2tpZm1RWmx6?=
 =?gb2312?B?bC82c2RyVHplenlIQURuREJobVlDK2t2dmM5UU9uTldZUGVrQk5VWlZQeGpF?=
 =?gb2312?B?RGFXcEtYUmd2ZTNsR3IrY3V2M0lld0FWSk45b0Z5V1hjVEVtSUlpSWl6a0J2?=
 =?gb2312?B?T2dVRnpQenI2WDN2NWJWVEsrT2kxSXRJa1BlS3J5L1JXRC9Gb2k1Z2RRUHdI?=
 =?gb2312?B?bTk2eTVWeW0ycGloSk0zMk93anNrVSswRlBzMmE2SlFSRUoyUjNIWVBRYWxv?=
 =?gb2312?B?SmE5bk12bFB2RzkwakFVbnBnSU1Fb3VxQXFPbzZLcnR5TXNoVjdPYTYwOThX?=
 =?gb2312?B?M2VKT1VFUmdrSEJqVExRcS90RXdkbHFNcG9pSExJR0ZMb2pvdW1VUTQvWW90?=
 =?gb2312?B?NnByc0ZqTVl2TzVNckprbENzUkdYQzlyKzZ2TjFuejdJV09BbjBJTk1VbFoz?=
 =?gb2312?B?aGV3N3YxVlY1M0VUSlRsdUZMSUIvdnVTemVhM2YwSHBwNUNvRy84UWo4Y0p2?=
 =?gb2312?B?VHJTTWVjQ3BUMTFpTlpBUExUWitJZ3h5VExFZmQ0STE5RS9DNWJEdWZLeWdy?=
 =?gb2312?B?M3F4ZjN5dWxQK2hsVExXSXQ2cnZhZHBQd2hrZFltNmRENU9rR2xBV2hCQWRn?=
 =?gb2312?B?TWN6SDlWUklzOEtHTDViTS9oMm13bUZHVW1kVXlVbnkyeHlpTDdIMElPQ3Ny?=
 =?gb2312?B?UFJyVlhSUG9TbTUwaSttSDNManJrK0dsTmwvOWNtYzdnWFo2Z3lZOWVIMzAy?=
 =?gb2312?B?RUQyeEJ5Vm8wMTdSY0QyLzZaTThkSHdJUGl3UFF0bC9KaHZtdGdadHVRZUN0?=
 =?gb2312?B?VDFHNytja1FYQkdNRkk1NlprQkRFdE83VHR5c053NURnM0w1TmFKdlNQdzBo?=
 =?gb2312?B?Q0o0OVFBNjFscFJVTGphMG5iTS9TbytqckJMUGUxK0duRThkajBVV0hFbDZp?=
 =?gb2312?B?Yk04Mno5SWozL2NZL0JBSUh6enlkWXczVFhpRjFFdlcvaWdSc0ZpRVEzVTM5?=
 =?gb2312?B?SjdFTFZITmtiOFBQUkVqQXZlVnZZM1ZJcitFZW44dWo1bjNLUmRGc0s1SzJX?=
 =?gb2312?B?WEx6YVAvb2xYQ01LMFJRbzVETU5IUGloaVdiWHZRWEFqUFJpSjZrRGFjcEI4?=
 =?gb2312?B?bUNuTG5hSTNWcHIxQmJjclNoZDhxcjAra3lJU3h2SFVES3lXY21wazZZUldl?=
 =?gb2312?B?dzQ3MmpCVHIyUktCdjFTYkp3NThCa1RhOFArWmUxenhqVTg5MW9tQ1IxaldD?=
 =?gb2312?B?T28xRitiNlZ2Tjk4Q2ROWXhHRmQzRGwyWE15YmhuU2RiN3l2MkNHcWhqcGw1?=
 =?gb2312?B?Mk96RFkxTUxEdnU2enlLbkx0cmlKQ2F3WmhtR3VqUHJ6U1hpcHdMZU55TG93?=
 =?gb2312?B?dFZldWFTK1FEZVlBTE1OMUZMNzcxN0RSZCs2MnliRkxiZUdWK2dicUlXQndM?=
 =?gb2312?B?SnVoNi9OSWVOU3dxUjN2VGd4T3pHZzhrelB5Ylp5UVcwUGl5aEExNDNxbHo4?=
 =?gb2312?B?M1NjOW9xMzZlcnNwbm9QNU8wMGVnZXJGQzlYOC85WVQ4VWV5SlVyOGZRc3lN?=
 =?gb2312?B?TllIRndEcFpVaC9LVit2WEV3M0I1ejI0dmw5RVVlamRweWNFeFEwMytMWHlN?=
 =?gb2312?B?Qm5JanQrU21JTWlVNlowWWE3OWpUVHFrbUdzYndnRjVMQzhoQlg4Wm5Iekox?=
 =?gb2312?B?VzR4RitNdEZSdWowT2w3OFVFWGlVa2ZUbjhDL1U0WWthVjk4MXY5L01wbWM0?=
 =?gb2312?Q?aCtUGyjBTrj1m1vK73?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2dd920e-ce09-49df-00a0-08da23f5382c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 00:15:34.2089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XLANQXSRURJJ8mB76jv1T1ft+c9NoEuYKruMQwEYKECRFXdqctg+VMLANJPdlpj2V8w+I5YSRMVPJlhjHTbwQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9372
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "S.J. Wang" <shengjiu.wang@nxp.com>, Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbToga2VybmVsIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+DQo+IFNlbnQ6IDIwMjLE6jTUwjIxyNUgMjM6MTANCj4gVG86IFNh
bmRvciBZdSA8c2FuZG9yLnl1QG54cC5jb20+DQo+IENjOiBrYnVpbGQtYWxsQGxpc3RzLjAxLm9y
ZzsgTGludXggTWVtb3J5IE1hbmFnZW1lbnQgTGlzdA0KPiA8bGludXgtbW1Aa3ZhY2sub3JnPjsg
Um9iZXJ0IEZvc3MgPHJvYmVydC5mb3NzQGxpbmFyby5vcmc+OyBTLkouIFdhbmcNCj4gPHNoZW5n
aml1LndhbmdAbnhwLmNvbT47IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNv
bT47DQo+IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPjsgTGF1cmVudCBQ
aW5jaGFydA0KPiA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPjsgSm9uYXMgS2Fy
bG1hbiA8am9uYXNAa3dpYm9vLnNlPjsNCj4gSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVj
QGdtYWlsLmNvbT47IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47DQo+IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogW0VYVF0gW1BBVENI
XSBkcm06IGJyaWRnZTogZHdfaGRtaTogQXVkaW86IGZpeCByZXR1cm52YXIuY29jY2kNCj4gd2Fy
bmluZ3MNCj4gDQo+IENhdXRpb246IEVYVCBFbWFpbA0KPiANCj4gRnJvbToga2VybmVsIHRlc3Qg
cm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+IA0KPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWhkbWktZ3AtYXVkaW8uYzo4MDo1LTg6IFVubmVlZGVkDQo+IHZhcmlhYmxlOiAicmV0
Ii4gUmV0dXJuICIwIiBvbiBsaW5lIDk0DQo+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS1ncC1hdWRpby5jOjEwNTo1LTg6IFVubmVlZGVkDQo+IHZhcmlhYmxlOiAicmV0
Ii4gUmV0dXJuICIwIiBvbiBsaW5lIDExMg0KPiANCj4gDQo+ICBSZW1vdmUgdW5uZWVkZWQgdmFy
aWFibGUgdXNlZCB0byBzdG9yZSByZXR1cm4gdmFsdWUuDQo+IA0KPiBHZW5lcmF0ZWQgYnk6IHNj
cmlwdHMvY29jY2luZWxsZS9taXNjL3JldHVybnZhci5jb2NjaQ0KPiANCj4gQ0M6IFNhbmRvciBZ
dSA8U2FuZG9yLnl1QG54cC5jb20+DQo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8
bGtwQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBp
bnRlbC5jb20+DQo+IC0tLQ0KPiANCj4gdHJlZToNCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0Lmtlcg0KPiBuZWwu
b3JnJTJGcHViJTJGc2NtJTJGbGludXglMkZrZXJuZWwlMkZnaXQlMkZuZXh0JTJGbGludXgtbmV4
dC5naXQmYQ0KPiBtcDtkYXRhPTA1JTdDMDElN0NTYW5kb3IueXUlNDBueHAuY29tJTdDNzAyOGM4
OWNlMjM5NDBmZjA4MTQwOGQNCj4gYTIzYTkxMWM4JTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTlj
NWMzMDE2MzUlN0MwJTdDMCU3QzYzNzg2MQ0KPiA1MDYyOTk5NjA1NjklN0NVbmtub3duJTdDVFdG
cGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0oNCj4gUUlqb2lWMmx1TXpJaUxDSkJUaUk2
SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MlN0MlN0MmYW0NCj4gcDtzZGF0YT1QMXB1
bTJVcjNJOG9jYzVmMVdBblZobklJR0IwUTFIWGMyR3NSYlV4OHAwJTNEJmFtcDtyZXMNCj4gZXJ2
ZWQ9MCBtYXN0ZXINCj4gaGVhZDogICA2NWViOTJlNGM5ZjBhOTYyNjU2ZjEzMTUyMWY0ZmJjMGQy
NGM5ZDRjDQo+IGNvbW1pdDogZDk3MGNlMzAzZmY4MGFlNTdiYmQzZTc4NGYyNzcyZGJmMzA1NmUw
YyBbNDQ0MS81MzQ2XSBkcm06DQo+IGJyaWRnZTogZHdfaGRtaTogQXVkaW86IEFkZCBHZW5lcmFs
IFBhcmFsbGVsIEF1ZGlvIChHUEEpIGRyaXZlcg0KPiA6Ojo6OjogYnJhbmNoIGRhdGU6IDggaG91
cnMgYWdvDQo+IDo6Ojo6OiBjb21taXQgZGF0ZTogMiBkYXlzIGFnbw0KPiANCj4gIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1ncC1hdWRpby5jIHwgICAgNiArKy0tLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktZ3AtYXVkaW8u
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktZ3AtYXVk
aW8uYw0KPiBAQCAtNzcsNyArNzcsNiBAQCBzdGF0aWMgaW50IGF1ZGlvX2h3X3BhcmFtcyhzdHJ1
Y3QgZGV2aWNlDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBoZG1pX2NvZGVj
X3BhcmFtcyAqcGFyYW1zKSAgew0KPiAgICAgICAgIHN0cnVjdCBzbmRfZHdfaGRtaSAqZHcgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gLSAgICAgICBpbnQgcmV0ID0gMDsNCj4gICAgICAgICB1
OCBjYTsNCj4gDQo+ICAgICAgICAgZHdfaGRtaV9zZXRfc2FtcGxlX3JhdGUoZHctPmRhdGEuaGRt
aSwgcGFyYW1zLT5zYW1wbGVfcmF0ZSk7DQo+IEBAIC05MSw3ICs5MCw3IEBAIHN0YXRpYyBpbnQg
YXVkaW9faHdfcGFyYW1zKHN0cnVjdCBkZXZpY2UNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXJhbXMtPmllYy5zdGF0dXNbMF0gJg0KPiBJRUM5NThfQUVTMF9OT05BVURJ
Tyk7DQo+ICAgICAgICAgZHdfaGRtaV9zZXRfc2FtcGxlX3dpZHRoKGR3LT5kYXRhLmhkbWksDQo+
IHBhcmFtcy0+c2FtcGxlX3dpZHRoKTsNCj4gDQo+IC0gICAgICAgcmV0dXJuIHJldDsNCj4gKyAg
ICAgICByZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdm9pZCBhdWRpb19zaHV0ZG93bihz
dHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpIEBAIC0xMDIsMTQNCj4gKzEwMSwxMyBAQCBz
dGF0aWMgaW50IGF1ZGlvX211dGVfc3RyZWFtKHN0cnVjdCBkZXZpDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYm9vbCBlbmFibGUsIGludCBkaXJlY3Rpb24pICB7DQo+ICAgICAgICAg
c3RydWN0IHNuZF9kd19oZG1pICpkdyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiAtICAgICAg
IGludCByZXQgPSAwOw0KPiANCj4gICAgICAgICBpZiAoIWVuYWJsZSkNCj4gICAgICAgICAgICAg
ICAgIGR3X2hkbWlfYXVkaW9fZW5hYmxlKGR3LT5kYXRhLmhkbWkpOw0KPiAgICAgICAgIGVsc2UN
Cj4gICAgICAgICAgICAgICAgIGR3X2hkbWlfYXVkaW9fZGlzYWJsZShkdy0+ZGF0YS5oZG1pKTsN
Cj4gDQo+IC0gICAgICAgcmV0dXJuIHJldDsNCj4gKyAgICAgICByZXR1cm4gMDsNCj4gIH0NCj4g
DQo+ICBzdGF0aWMgaW50IGF1ZGlvX2dldF9lbGQoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpk
YXRhLA0KDQpSZXZpZXdlZC1ieTogU2FuZG9yIFl1IDxTYW5kb3IueXVAbnhwLmNvbT4NCg==
