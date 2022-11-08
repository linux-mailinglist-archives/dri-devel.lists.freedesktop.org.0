Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F7362137F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 14:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DD810E289;
	Tue,  8 Nov 2022 13:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2076.outbound.protection.outlook.com [40.107.104.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFADB10E289
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 13:50:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKtYiC6W5aNRapejTcwDfABDPjo316HCdxPrFHAYoNcWz13L6BbCGeics9lbK3oK256rwEA0hgFBLBGOVrAjTeKu9Hki60mSpBV6si2U7jAvmSVHk8JSjcw6bBkAdG44CrPmYUy5Z3tkQaN/0PtwUGRRe1NGpwuZx5MEp6sdAx4um1QS2JXtb32mNI7+wmJGJlaTs0amsli/WGYVgfZrFynH1BKWEIVeB51ZX9yfBsCvJ9Z2eh9l3qb6W8BMdr1rOMWFKjhlMEp3jDXYJWhT1HF5eW9ltImDVfVxNZsf8zsMmNTmDeQnrcLHwxd/MmzeSD9QDmuUfYQdPMTTb7REPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7W+fkQS9yrGU5r/SegXmhCfFhovOpHLyKr3y8E43Se8=;
 b=NhAmc68CZhS781LmAmzbCstVj4ab3NDy+EKzff7NbLZFekoEhlJ0PWEzPLWJrFYsqfEcb+Y5UljqandO6xZ+MmtW1+b5VJBXwo1Gf9EBUuQ3duL9a799uL+pyK7MEUfa1hOv/UsZ7oaFhKQdo6kXstbqRvKzS97PD9Mp33yKHzwIHcZaSXSMUFYWj2zAvkKZuBemV93PmHF+SUAikd3wtXVdrBycm6jMNIg3ixKWc4ifb9B4Mv8JZlYHOTHabvb7SKWRnIuJPLOKHOzyWiO+oGhOi1gAas5AORl+wNJEnculNC9C8Fxt/vM+XzrUk2UUv+X8CoDmXHcSrhVDCkQqsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7W+fkQS9yrGU5r/SegXmhCfFhovOpHLyKr3y8E43Se8=;
 b=fNglTbu3ihZHbgNMHS6Kwfd//Am0Wbung18iHDKWHJt+5Bd5PrObLwixFSriY8O3RO//H723tl+1rer95j4DEQ+VmAzYQKiyBBNucWql+teLvGtXoqBvbpB4oe4bauAbvJcgTE8A0MNa/rkcLKrPUEUd7QXMdupvskMKV+o/ehY=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DBBPR04MB7804.eurprd04.prod.outlook.com (2603:10a6:10:1e0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 13:50:41 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%4]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 13:50:41 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Jani Nikula <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "robert.foss@linaro.org"
 <robert.foss@linaro.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>
Subject: RE: [EXT] Re: [PATCH v3 00/10] Initial support for Cadence
 MHDP(HDMI/DP) for i.MX8MQ
Thread-Topic: [EXT] Re: [PATCH v3 00/10] Initial support for Cadence
 MHDP(HDMI/DP) for i.MX8MQ
Thread-Index: AQHY83H2MlJmyHxlRkC0Y59mWaYHD641AXcAgAADdHA=
Date: Tue, 8 Nov 2022 13:50:41 +0000
Message-ID: <PAXPR04MB9448612AD6C7744B7C706D6FF43F9@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1667911321.git.Sandor.yu@nxp.com> <87iljp8u4r.fsf@intel.com>
In-Reply-To: <87iljp8u4r.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|DBBPR04MB7804:EE_
x-ms-office365-filtering-correlation-id: 2916975f-ea7a-489c-0e7f-08dac19039d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7ENOY6G7wWln+KB72WY2zT4i+nj86norGu5CGhOEL7aIDFzTCaWj+x/SFTPCWISKZeAJAoe5DuAIFvl2z9CFA4yP9V/4/sGbglnQFrRWVTUaIfKbyCF90s3zLRRjNh95Dyil2tCu5vjQcyGUj7M55+W0rEEPWBM+yMLQXRhll48A7T+Fh8lCy1J8mAtFOSi/Qm8Ckafz5I9QFReTZoO0r7MHnGAGSxIDIDegDXyJMMXX/XtFLZMwJsXhxwW7g0t7zrkvFXBfrM3QwpeTMoqvkR3oOeoQFZL2JgdmtqFbtvL5FMReTkNMX0ifholMhyw78ZAuqRaGFEE7oAED49ad+TcShxnboxFMI9UZvd47gGVos+QnydZ1nUlDNniXXcIKDyWLRAcWVICvxafsAofF63d9mP9QCz0N2PR03PpBH+TEcpipSyTM8wbpVemtG+Fx+AB6CHO97nC5U8tgWpQgSnBymb+opKCsLJNr0xU5GVnKybYEqmboMfsio5IOyDkQHOC6vJaKE1giZd9IxOUgw936FP+ZphcDUlx0wx54FxbvyddWqNutH9H/gqe5gZSNY4r1/FKfMnqbyKStmEh3Rg6AWiXn/2ZcR6YVOiqMLbgWz9uE2iNQEIc1bViXYjvb/HMrlDQWsh2jO37TGRxfznk4M1SMAIgNDh08JEAg4qtFhKBiYN3t7nrCEThcVJ2hiCoLifPNPFlWzRIjN+/W9g+MZ2p5eyiDKiDMESUFKoIyvu4EbwIJJz9WT1V+uYtWiUqkv9qvlVW5feVnkjxR8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199015)(33656002)(38070700005)(86362001)(921005)(54906003)(55016003)(7416002)(44832011)(2906002)(7696005)(6506007)(26005)(53546011)(38100700002)(186003)(83380400001)(122000001)(9686003)(66476007)(66556008)(66446008)(76116006)(64756008)(316002)(478600001)(110136005)(66946007)(52536014)(71200400001)(4326008)(8676002)(8936002)(41300700001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?VFU5VmZTYjgyemx1TDBocW9iTHRiM0cvVHRlQlRQdUcva0JNeUFxNnJhQkMz?=
 =?gb2312?B?THM3YVhDdEh1U2lyb1VDdlRnNzBQU3Q4VmNOd1ZGd2R2VHpJdDFicHVBT2Rl?=
 =?gb2312?B?WkVlY0VDUUQ3WW9WV3NnWUZrYUdQb0kvcnY4MDRRcU1IV2pMTm0zemdyOUlZ?=
 =?gb2312?B?R0dOblJlaUMzLzQvQ1dQZVlJRzN0WWlBcFc4c0NzOGFXN3BFNzJ0SjFvTlFm?=
 =?gb2312?B?UytuRSt2WUNDanp6VnJwaCt3L3FTNzhVWSsxV2hia1hmRERoYXFML1pVazVU?=
 =?gb2312?B?OTU4czFmWnBnVXcvMHBLN05QWlp5ZXpwdnFZVVFjV0U5bTFlRko0MWdLT2wr?=
 =?gb2312?B?OVMwanBIYUEzazJRSFZVZXpnb09IWGZHd2NPOEh5czU2ZE95emp3Q096WGdR?=
 =?gb2312?B?SVVHb3dMVWIyL2hVaEJPMTNxRitDSWRuemFCUDRIS0JLY2RsZmRvZW4zU1B5?=
 =?gb2312?B?d2oyemdmSkhJRnc1T1RCTXRKN3c1Q2QyaFJSOTR4cnVuczJFTGdCWFJEeExj?=
 =?gb2312?B?ZUQzWTBSN0kxZldxT000SmZTa3JwYUo3TWpXTFZKYjdLU3ZLSncwTnkwYXFY?=
 =?gb2312?B?aXhyTXl0a2N0Q2xKeWQ1Y21LaTZ1VFFJWHYrYjRUNFZOa2ZOT3V2NzFETk1S?=
 =?gb2312?B?aXlGNnR3dlFYRVdMa29GMjhDSkRqMXZ1R0ZLcXkrOW5qWHB4ZUNvSXpFUUlJ?=
 =?gb2312?B?WmZpZG81ZVZMQ2VqRWZQRWxkRW0wU3dobmJSbnd2WDRESi9yQWlmcXhDbU52?=
 =?gb2312?B?ZkEzVmlwQjMvcmM4MlFaZ0hDRCtDckNzSG5EckZTUmFLbTFZTnRyUkpOWXhp?=
 =?gb2312?B?ZGkyY1dOa3NPakNMcTcrL0s5eG9mcVBDN0dYcjc4Ni83aGxxWXBUWXFXOFlU?=
 =?gb2312?B?eUVWN0ZvV0JlYVhtdkt5WFRoQnhKTUoxWHgrOVcwNWRoUkF0UmpxRVJDQ0VL?=
 =?gb2312?B?MVZlNDFkeFJzWFNaNmVOUkN6R3QvekY4YVF1WlIxaVJQVHdmNWVSQmhTL1Jl?=
 =?gb2312?B?bit5MEw4NDVVOGo3OEZhUzR5RWVRWWZpYWVOcjY2Z1JNcmhXSHN4S0pPanBh?=
 =?gb2312?B?ZW42dHZhUnpGSXhWbnpZcVhqYXBtVi80WE5STXZWYW5FZVdrb25hZ3VkS1gx?=
 =?gb2312?B?UFE1ekZiQjQvOWwySHBlbFNKYTdPVEVrREE3Y1NsL3N4VUJYRGhsT3ZnUFQ5?=
 =?gb2312?B?Q003cWNZa0dCakxIVGhML0kyUUMwSTFsb0ZnRVlINjNleDZYYWdNTkZHbk1i?=
 =?gb2312?B?SndoV3Q3NnMwZHlyQmRhWGVyR0dnUUVWbUFxb01PdnpGWDZpbUxOS0Z5amNB?=
 =?gb2312?B?QnRZMUZLK0NiU05hT25tMEZJTlg0WEEvdzZObHhSZ0Y1OG83WU9qTDFTeDBw?=
 =?gb2312?B?Uk1ab1puK2NLZ0JmMllxN1RDQjBNa0NmWXRsMTVTWFozZTVqdXgwcFNiSGhs?=
 =?gb2312?B?OGhicEVQd0Y4SW1hZjdpZDc2K1ByTGxmeEg3VFJUQlFzbU1sMXREOEhPeTJH?=
 =?gb2312?B?TDBkcWJDMExGUlpHczVncjNZeXdmRWFoYUt0T0FLa3ZwZWRGSDNDNytZR0sv?=
 =?gb2312?B?dzJSWkkwU3ByN1ZRYTlZR2NsRVFNVlFRQW9BMzJjVnNFeVcyV1ZFSVZ2Mmlj?=
 =?gb2312?B?VmtTZHc0Tk0xUWRzTjFQbDJRekxSSFMxWGhYWFo2WlhXeEFrS2oxNGtaUUhH?=
 =?gb2312?B?VVRaY0gwRk4ydmcySkhIWkhVM0JUZTlybkJKQlg4RkNVZm1yd1BITFZnUG5X?=
 =?gb2312?B?OW9raXF6akpZQU1RWVhCaXRqMjcxRzVBOXB4K1Bxd0g1NWlONkxVb2ZWcjIw?=
 =?gb2312?B?blpmZ1dMekZzT3FnRlRRYnpNNk9LSmxWYmV3aWw1TEZxaFo5eXVUYjdRRFRr?=
 =?gb2312?B?V2h2bk5iMGd2QjBpYXpxN29pRDJVTkd6MldURHVNWEd5V2tkcm1McGR1S20y?=
 =?gb2312?B?TDVIVk14aG53VEdINGdDMy96MllXWUxIQ0pjbm9WUkVGQXZwUE1qYzJIcnJT?=
 =?gb2312?B?UnEza1h3aTQ4SWtSaGVpaWdOM1ZNYTRraTBhWUJ5azlhcW9ob3UxNitQRnBK?=
 =?gb2312?B?THo1YlN1ZGUxUWVOQlJWNFlQbzN3NFJlTlJZSytBQkpQZWc1Vi9PNW03Ulhn?=
 =?gb2312?Q?4cw4=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2916975f-ea7a-489c-0e7f-08dac19039d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 13:50:41.5724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAxy6hUf8p3ePI/4EZAH5ZKx0UMbKdYyZ8u9Axe8L5IBpkOe7+LJK4EAKT+ZDJbVvbqtYw6L1e3BF8PrKbVhcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7804
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
Cc: Oliver Brown <oliver.brown@nxp.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "penguin-kernel@I-love.SAKURA.ne.jp" <penguin-kernel@I-love.SAKURA.ne.jp>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "maxime@cerno.tech" <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UnVuIGdldF9tYWludGFpbmVyLnBsIGZvciBwYXRjaCAxLCANCllvdXIgZW1haWwgYWRkcmVzcyBp
cyBsaXN0IGFzIGZvbGxvdywNCkphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+IChj
b21taXRfc2lnbmVyOjIvOD0yNSUpDQoNCkFuZCBJIGFkZCB0aGUgZW1haWwgYWRkcmVzcyB0aGF0
IGNvbW1lbnQgYXMgImNvbW1pdF9zaWduZXIiIGludG8gQ2MgbGlzdC4NCg0KQi5SDQpTYW5kb3IN
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW5pIE5pa3VsYSA8amFu
aS5uaWt1bGFAaW50ZWwuY29tPg0KPiBTZW50OiAyMDIyxOoxMdTCOMjVIDIxOjE2DQo+IFRvOiBT
YW5kb3IgWXUgPHNhbmRvci55dUBueHAuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgt
cGh5QGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tOyBuZWls
LmFybXN0cm9uZ0BsaW5hcm8ub3JnOyByb2JlcnQuZm9zc0BsaW5hcm8ub3JnOw0KPiBMYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb207IGpvbmFzQGt3aWJvby5zZTsNCj4gamVybmVqLnNr
cmFiZWNAZ21haWwuY29tOyB2a291bEBrZXJuZWwub3JnDQo+IENjOiByb2JoK2R0QGtlcm5lbC5v
cmc7IGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZzsNCj4gc2hhd25ndW9Aa2VybmVs
Lm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsga2VybmVsQHBlbmd1dHJvbml4LmRlOw0KPiBk
bC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsgdHppbW1lcm1hbm5Ac3VzZS5kZTsNCj4g
bHl1ZGVAcmVkaGF0LmNvbTsgU2FuZG9yIFl1IDxzYW5kb3IueXVAbnhwLmNvbT47IGphdmllcm1A
cmVkaGF0LmNvbTsNCj4gdmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb207IHNhbUByYXZuYm9y
Zy5vcmc7IG1heGltZUBjZXJuby50ZWNoOw0KPiBwZW5ndWluLWtlcm5lbEBJLWxvdmUuU0FLVVJB
Lm5lLmpwOyBPbGl2ZXIgQnJvd24gPG9saXZlci5icm93bkBueHAuY29tPg0KPiBTdWJqZWN0OiBb
RVhUXSBSZTogW1BBVENIIHYzIDAwLzEwXSBJbml0aWFsIHN1cHBvcnQgZm9yIENhZGVuY2UNCj4g
TUhEUChIRE1JL0RQKSBmb3IgaS5NWDhNUQ0KPiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0K
PiBPbiBUdWUsIDA4IE5vdiAyMDIyLCBTYW5kb3IgWXUgPFNhbmRvci55dUBueHAuY29tPiB3cm90
ZToNCj4gPiBUaGUgcGF0Y2ggc2V0IGluaXRpYWwgc3VwcG9ydCBmb3IgQ2FkZW5jZSBNSERQKEhE
TUkvRFApIERSTSBicmlkZ2UNCj4gPiBkcml2ZXJzIGFuZCBDYWRlbmNlIEhEUC1UWCBQSFkoSERN
SS9EUCkgZHJpdmVycyBmb3IgaU1YOE1RLg0KPiANCj4gSGFzIHNvbWUgZ2V0X21haW50YWluZXIu
cGwgZ3VpZGFuY2UgY2hhbmdlZCByZWNlbnRseSBvciBzb21ldGhpbmcsIG9yIHdoeQ0KPiBhbSBJ
IGluY3JlYXNpbmdseSBiZWluZyBDYydkIG9uIHBhdGNoZXMgdGhhdCBhcmUgbGFyZ2VseSBpcnJl
bGV2YW50IHRvIG1lPw0KPiANCj4gQlIsDQo+IEphbmkuDQo+IA0KPiAtLQ0KPiBKYW5pIE5pa3Vs
YSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyDQo=
