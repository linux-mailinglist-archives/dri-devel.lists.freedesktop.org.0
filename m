Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C613C476D80
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 10:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5378B10EF34;
	Thu, 16 Dec 2021 09:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GBR01-CWL-obe.outbound.protection.outlook.com
 (mail-eopbgr110072.outbound.protection.outlook.com [40.107.11.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB2910EF34
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 09:34:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEPz9fkzZOKxQLrYXML+W3LUwWMEz08o56sTh0jpuk7kn8ljQj0jAIajY+HrC6/4vxfaTULWOauVJVxAhLt5DjvGdy34+96psnSm1Gg8M+U8r5wdKuYeBjsWoeaQPN2M2H/qnsJa+CFIueWbj4AeKLrv9LhsPCSWkF4N1RvQZu8solHR+kVEPZ1uwGbVGXCfa4SmFq8kOFvRVchelU1UMOZyCTK/EYaADEhb+pAGsMsaOFGeSOjXue/0hZMcwB7autIpIvZbuzku5r3WWAvZ6gGKB5OKA4vgnKaICJRaeaVOCvOo9CNlypcSqGtem/bR7ka9SDFqmN8VEsUmVw+tdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgitBD3dHqQ+ah3/uyR+vpeM6M6tRwU6t1NNBVQoBhY=;
 b=CYoT5+a77QCgvT7YlRuA+kxbZ6ite44rz3UvRif+AbzSxat22vwKa6rP/aT3ELPiMSaEIA6VSAW+g8bEH3JA+V/WrX3Aj+fu4Yr2amu+iWefQxrbxVAljpCtt+sT0wOV3JERQKBlH/XsJhf4a91N3wQYDmfg2RVn7dNjwIrLuIeZ5ia7qwVuVC8xlAd7b87aA3AZ8SsiU8jMasNH5CB40fAGRNJEelnFFvUx4DcNNH2d4BjeGq089SxgUPtvrz1FT2oIjoHGemKQ5fV90/U+ThuriGAS0TJKj4BTAyhNZNqlXsceOtPkrWDpBiGBk1bwTM6ZwGKoii+Po757pYfk7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phabrix.com; dmarc=pass action=none header.from=phabrix.com;
 dkim=pass header.d=phabrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phabrix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgitBD3dHqQ+ah3/uyR+vpeM6M6tRwU6t1NNBVQoBhY=;
 b=Qc2I8VZWIdYK1VSq4gg4AdrNpBbyC0RqZbaM2TeG1eWExl7sPY0Uj3lZbTOfOBvcWbjnBp5VqRx04SWhak5FIHGiOReqyIy1fptcAMWztgKmvTXL39OxXFS6NCxcutFgsqWf9BD0MMK+N022klt2dmtyPJt+VvG3fY2jF8BHogM=
Received: from CWXP265MB2229.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:78::10)
 by CWXP265MB2757.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 09:34:03 +0000
Received: from CWXP265MB2229.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1d94:b29b:2630:306a]) by CWXP265MB2229.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1d94:b29b:2630:306a%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 09:34:03 +0000
From: Chris Pringle <Chris.Pringle@phabrix.com>
To: Lucas Stach <l.stach@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKAkyBFWFRFUk5BTDpSZTogSU1YNlEgRFJNIC0gRnJhbWVidWZmZXIg?=
 =?utf-8?Q?update_rate_with_LVDS?=
Thread-Topic: =?utf-8?B?4oCTIEVYVEVSTkFMOlJlOiBJTVg2USBEUk0gLSBGcmFtZWJ1ZmZlciB1cGRh?=
 =?utf-8?Q?te_rate_with_LVDS?=
Thread-Index: Adfx0YSqR8L4UozcQg2nKBiOnrrPTQAAbNOAACMabjA=
Date: Thu, 16 Dec 2021 09:34:03 +0000
Message-ID: <CWXP265MB2229FEEF065052B02839AD20EB779@CWXP265MB2229.GBRP265.PROD.OUTLOOK.COM>
References: <CWXP265MB2229746771FD019967F0BD42EB769@CWXP265MB2229.GBRP265.PROD.OUTLOOK.COM>
 <c1bcea09976a6d10185b52fe6e29964fdd0a107a.camel@pengutronix.de>
In-Reply-To: <c1bcea09976a6d10185b52fe6e29964fdd0a107a.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phabrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 275ad8c6-98f4-4fba-4243-08d9c07732b4
x-ms-traffictypediagnostic: CWXP265MB2757:EE_
x-microsoft-antispam-prvs: <CWXP265MB2757AEF2A47F097D29E9BD4FEB779@CWXP265MB2757.GBRP265.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M1KKWEp8hyRhFSpBerujel3IjijDHr8Kix1Qco7VD6+DTgiNG3PoycC6BcKi3UBOpnvd5AEFcMJMoF7rfsALOk3UzoKWtLUoEtKpHpjMpu6UImKHzqbQUCptznke22hL1W35odBKVA98gYng9ySIrxC2gOR1PhQFUZoZAigXW1QZmfFgqwlvfgAlw5oaNMPBNQq5qS+zAdRQm9LbJNIiwdY/D7CcTunujRnh7VF//1mKf7p56PweWKv5AXJH9/YmVumT+SE1uVtIzd4i7eXKvLoBH27QjSARnaizlZnFUgDCBEr4toymmCGKgbtKjqR1DiuBYDkhaVMVFJeIpyoNHPeq443RGTj8jiHBvgcjsTkTspppKR6O7wCA4WnmHjpnrbGaRxT0la8Gm4HGCwszIq44Q7YPbuGN2NkaAfY5JiqOs/0QDxreBw04eeRyf5a6R+4nf+sht7T9Y6QnWHmbXDvf2OgZFz+uNItRKch2g+duMJUYKRKY6Pu34+bzQwbCYkTdwBAj9rF7M7HjCXFrqxQsvF9/9+BYytJW5VzoaeLsFq8F/jhr7/zGcKEtsdqqqIyNtG7ba+CBK6HrM7hGKs2AMxzqA3G7nIflLW9I5LYcLh59Acm50CpL5QnRWKUF7jjTXBVNGGb9JqE02AJId5W8FxTozqYmBJBm/lI25ncO7qSXytdGn1V0kA73qEEpawj9Vr6SkaUmHyRDUyg9X53dsFHrbBrmgm/ZYERel68=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB2229.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(39840400004)(396003)(366004)(5660300002)(2906002)(26005)(38100700002)(71200400001)(8936002)(110136005)(6506007)(52536014)(38070700005)(7696005)(83380400001)(186003)(86362001)(33656002)(55016003)(122000001)(316002)(66946007)(66556008)(76116006)(64756008)(66446008)(66476007)(9686003)(508600001)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RThxYWZ6dkRxcUg2NWRKdzRzV2M4SnZSbHhjR2RUMFRVTWt5TTB6dEpWZDZI?=
 =?utf-8?B?YmFNcEYwVkV6Qy9JSTRESFZNRFMvZXo1bnVSVm5VYkQ4bGJURUozYlEzQWo3?=
 =?utf-8?B?L1REMThMQXhReTFOTUg3NWVicFI4V2dIbldxTzNoOUV1cExEWUdJS2FSemRy?=
 =?utf-8?B?VnJZcWVma3NrZXlLaHFsWGkrOC9tcm11QktzR2w1dzZEN1Q1Vm1lcmtCd0Jy?=
 =?utf-8?B?eE8zWnZ3Nk11V3BkM3ROcjhsanM2d092eTNza0tKZ0p1cmNhZ083NnBDZ2NK?=
 =?utf-8?B?WnpNVE5LMitDbFgyNzRoQlhPeW5LL1V2L1I5alYrdm9YaHpNYW44QmtvbzIv?=
 =?utf-8?B?eVJsZ25DbzVYRExZRmkrcFk5TjhTdDhvbHNkUnBYbG5Wc3NJTjhKcGI3OHJP?=
 =?utf-8?B?M2FCellUdWdneTNuMHNHT1U1eHVoUGhrZ0Q4V3NKK3JwSEZCOVZIc2h6TGlO?=
 =?utf-8?B?bUZ1WnpLWHBRV2xBeG9uQUFpVmlXb2krUXoyUDlLRkV0dmVBOC9ISW5UekJ5?=
 =?utf-8?B?aVBiMW9XdTJnUlMzSjdudXRDd3NaK1BmSHY4U3VZcVZGWXF6b1kwT2hWdUZx?=
 =?utf-8?B?THRKU1F0UkRqQU9zb2FST3lxdEpyWkh6YmJHNXlIaG9jWm1hSmlsS3ZML09D?=
 =?utf-8?B?RytwQUlMTnIwVUlxVFQ4VFNOdjM1UW5JeVZVajVnbGhZTVdabDJ1Q3V6TVE2?=
 =?utf-8?B?UXlwT1dNSkRPYnd1cU5FYVJUdFZCcHZZTXRKb245NWdNR0lMa2lPTm5KUGta?=
 =?utf-8?B?NE9ONkpMMVZHSFR1dHlVSlhMZjlwcHFVWW92bHRnUHNDTU9MS0g3VUwzdjJV?=
 =?utf-8?B?Q2d4cUtlZE04RzBFYytmZHExUWtkdEhXVDQ3TXkxQmRFbkRIcDZYeXFhbGxo?=
 =?utf-8?B?T2EwRWdwR1pOYklKMGhabjg0a3Vka1BWa1p1QysyVzRBYjlqTTA3YmZHakhO?=
 =?utf-8?B?U1ZVTTl1K09WdUdianBidmc5NFV5Z1g1SUVOdjdGSGxDcG81OEVFMlExN29n?=
 =?utf-8?B?VTdaRzRrSW1jcUxyMUcwSVhSaHBqc1JtL1JuSTBiTW1CRFZPYzlPOXZSZ0c3?=
 =?utf-8?B?UXIwVHRnekhzNFBEbGlOSXVoWGRwTmpXaG1LNFQzK2JKZDU3VisxY3B4T3Bx?=
 =?utf-8?B?OTFnczNnZklKaFlGNVQ3QWE2VEUrc2hwQ3k1aFlUeFJ2eHFPTkhCU0l4MGl1?=
 =?utf-8?B?NWpSNjdCUjBZVEhyKzRuSlpaUEpwRVhOVm56eGpBQmFLRTVLOVpxYjArUDds?=
 =?utf-8?B?bHY4bGFLVk1HdTNsN3RJZHJza1E5Q2RWc2NZcGZSVGFMLzQyYTd2RFNoZUln?=
 =?utf-8?B?dzMvL2kxZTNKZDB1NVFIMjcxV3ZVWHlrakk2bGp6MlVPTXZOUE9zeC9FSS8v?=
 =?utf-8?B?STRYZXA0MWVBT1JNN1IraE9KaXNDOVpzeTNQVkZnOHBaSnlmYm85Q2k5UkQ1?=
 =?utf-8?B?MU1wR2xhcmZlam1GSzlheWx3NzdBWXVIeUhlOFB3R3ZhdVBjTlV0VHZjNnhT?=
 =?utf-8?B?cVNlTitEaHZvYUJNMlpsYk5xakxDQ0Nrc2ppTE83NEJOUCtzdTJJQ1ExN3Jn?=
 =?utf-8?B?SXFhcURhZzd2L09yKzNsMlZXSHRzRzJLMjBHdUJjTUdvd0w2VHJ5Z3E4VFlT?=
 =?utf-8?B?bU9Ha1NJdGlwaHhTYU9WdmFzYmxsT0t4eFJKTEU5endTZDFCaXZiaXBxMVlh?=
 =?utf-8?B?NTlOajZiQkpxaDVFZ2VNTUtlbkVvQ3lzcEFSSWtyRUtvNzZTY0VDSTIzUnFF?=
 =?utf-8?B?ZWdmVHExcWlOVG5IN1FTdVFqOUJzTmJJZjdLQmptblQycnZHOUtHSGxKWEJH?=
 =?utf-8?B?U09QVnp1cjVXZEIrbGVuMXFSQkRXT2lxeWczbU5jTW9oTkdUMzBPMHJpTTd6?=
 =?utf-8?B?bkQrUUM4RnE0aXVNTVhlNisyOWFhK2prbHd1ekNXeGNpZ25YQ0NTTnlQWFph?=
 =?utf-8?B?WXVDeEkxeUhCMXU5RXdrazhpdHQzSW5PbE9VZ202MFVmazNvTHlnb2p0cjhK?=
 =?utf-8?B?ZDhQVmsveExKdzl0a3dwNlVVWUJsL2JMS0dSSEQ4UTYyUDV3OGt3L3RCbzd3?=
 =?utf-8?B?Rnl5ejl1K2lGOXptRnovOUZoRnU3eHZjY05lMkVNckNIT0FPSjc0N0tHWDlk?=
 =?utf-8?B?cDV0OXBwYkZQa1hsUFZTTnBLUzA0UHgwTFkwLy9PYmsvdHFRSGJyKzRKOTVr?=
 =?utf-8?B?T0ZjTFFCWmdXTzV0VVh3ZkpLbUg1UCtmanZTQWdXYjRId21yVzg4WVl1cHIv?=
 =?utf-8?B?dlgzeWNwU2VZNXRhejVuNlA0YjZBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phabrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB2229.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 275ad8c6-98f4-4fba-4243-08d9c07732b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 09:34:03.3326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20a0d659-dc6e-4307-9c1e-97f93b0e3d90
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yWlZgrNqw6YYXYgRF5uBT+zfGIb6lEKvWymCaHlc9t+7zaPfzKjdbSjoF7vtclVNgiUGHL6gWTHuZsCYwosfUgMDgN6tImWERtXAkmEXBnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2757
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+DQpTZW50OiAxNSBEZWNl
bWJlciAyMDIxIDE2OjQ2DQo+IEFtIE1pdHR3b2NoLCBkZW0gMTUuMTIuMjAyMSB1bSAxNjozMyAr
MDAwMCBzY2hyaWViIENocmlzIFByaW5nbGU6DQo+ID4gSeKAmW0gbG9va2luZyBmb3Igc29tZSBh
ZHZpY2UvZ3VpZGFuY2Ugb24gYW4gaXNzdWUgSeKAmXZlIHJ1biBpbnRvIHdpdGgNCj4gPiB0aGUg
SU1YIERSTSBpbXBsZW1lbnRhdGlvbiB3aXRoIExWRFMuIEnigJltIHVzaW5nIGFuIGlteDZxIHdp
dGggYW4gMTA4MHANCj4gPiBMVkRTIGRpc3BsYXkgb24ga2VybmVsIDUuMTAuNzMtcnQuIFdoZW4g
cnVubmluZyBRdCBhcHBsaWNhdGlvbnMNCj4gPiAoRUdMRlMpIHdpdGggdGhpcyBwbGF0Zm9ybSwg
SeKAmXZlIHJ1biBpbnRvIGEgc3RyYW5nZSBpc3N1ZSB3aGVyZSB0aGUNCj4gPiBmcmFtZWJ1ZmZl
ciBmbGlwIHJhdGUgKGFzIG9ic2VydmVkIGluIGxpYmRybSkgc2VlbXMgdG8gYmUgZml4ZWQgYXQN
Cj4gPiBlaXRoZXIgfjE0ZnBzIG9yIH4yOGZwcy4gVGhpcyBjaGFuZ2VzIGZyb20gfjE0ZnBzIHRv
IH4yOGZwcyB3aGVuIEkNCj4gPiBpbmNyZWFzZSB0aGUgcGl4ZWwgY2xvY2sgcmF0ZSBmb3IgdGhl
IGRpc3BsYXkgYWJvdmUgfjc1LjVNaHouDQo+ID4NCj4gPiBPdXIgcmVuZGVyIHRpbWVzIGFyZSB3
ZWxsIGJlbG93IDM1bVMg4oCTIHVzdWFsbHkgYXJvdW5kIDI4LTMwbVMuIFdpdGggYQ0KPiA+IHBp
eGVsIGNsb2NrIG9mIDc0TWh6LCB0aGUgZnJhbWUgYnVmZmVyIHJlZnJlc2hlcyBldmVyeSA3MG1T
LCBibG9ja2luZw0KPiA+IHRoZSBhcHAgd2FpdGluZyBmb3IgdGhlIG5leHQgcGFnZSBmbGlwLiBJ
bmNyZWFzaW5nIHRoZSBwaXhlbCBjbG9jayB0bw0KPiA+IDc1LjVNaHogY2F1c2VzIHRoZSBmcmFt
ZSBidWZmZXIgdG8gZmxpcCBldmVyeSAzNW1TLiBJbmNyZWFzaW5nIHRoZQ0KPiA+IHBpeGVsIGNs
b2NrIGZ1cnRoZXIgdG8gYXJvdW5kIDE0ME1IeiBtYWtlcyBubyBkaWZmZXJlbmNlIOKAkyB0aGUg
ZnJhbWUNCj4gPiBidWZmZXIgc3RpbGwgZmxpcHMgZXZlcnkgMzVtUy4gSXQgYXBwZWFycyBhcyBp
ZiB0aGUgY2xvY2sgZ292ZXJuaW5nDQo+ID4gdGhlIGZyYW1lIGJ1ZmZlciBpcyBub3Qgc2NhbGlu
ZyB3aXRoIHRoZSBkaXNwbGF5IHBpeGVsIGNsb2NrIGFuZCBpcw0KPiA+IHJ1bm5pbmcgYXN5bmNo
cm9ub3VzbHkg4oCTIEnigJltIHVuY2xlYXIgaWYgdGhpcyBpcyBieSBkZXNpZ24gb3IgaWYgdGhp
cw0KPiA+IGlzIGRvd24gdG8gcGxhdGZvcm0gbWlzY29uZmlndXJhdGlvbi4NCj4gPg0KPiA+IFRo
ZSBwaXhlbCBjbG9jayBmb3IgdGhlIExWRFMgZGlzcGxheSBpcyBzZXQgaW4gdGhlIERUUyBmaWxl
IGFuZCBpcw0KPiA+IGJlaW5nIGNvcnJlY3RseSBwaWNrZWQgdXAg4oCTIEkgY2FuIHNlZSB0aGUg
ZGlzcGxheSByZWZyZXNoIHJhdGUNCj4gPiByZWZsZWN0ZWQgaW4gdGhlIFF0IGxpYnJhcnkgbG9n
cyBhbmQgdGhlIHBpeGVsIGNsb2NrIHJhdGUgcmVmbGVjdGVkIGluDQo+ID4gdGhlIGRlYnVnIGtl
cm5lbCBsb2dzIGZvciB0aGUgaW14LWlwdXYzIGRyaXZlci4NCj4gPg0KPiA+IERvZXMgYW55b25l
IGhhdmUgYW55IHRob3VnaHRzIG9uIHdoYXQgbWlnaHQgYmUgY2F1c2luZyB0aGlzIGJlaGF2aW91
cj8NCj4gPiBJ4oCZZCBsaWtlIHRvIHVuZGVyc3RhbmQgd2h5IHRoZSBmcmFtZWJ1ZmZlciByZWZy
ZXNoIHJhdGUgaXMgbm90DQo+ID4gY2hhbmdpbmcgcHJvcG9ydGlvbmFsbHkgd2l0aCB0aGUgcGl4
ZWwgY2xvY2sgcmF0ZSwgYW5kIHdoeSB0aGUNCj4gPiBkdXJhdGlvbiBiZXR3ZWVuIGZsaXBzIHN1
ZGRlbmx5IGp1bXBzIGZyb20gMzVtUyB0byA3MG1TIHdoZW4gdGhlIHBpeGVsDQo+ID4gY2xvY2sg
ZHJvcHMgYmVsb3cgfjc1LjVNaHouDQo+IA0KPiBUaGlzIHNvdW5kcyBsaWtlIHRoZSBMREIgaXMg
dXNpbmcgYSBzeXN0ZW0gY2xvY2sgc291cmNlIGFuZCB0aHVzIGNhbiBub3QNCj4gY29ycmVjdGx5
IG1hdGNoIHRoZSByYXRlIG9mIHRoZSBkaXNwbGF5LiBVc2Vyc3BhY2UgZ2V0cyB0byBzZWUgd2hh
dCB0aGUgcGFuZWwNCj4gd2FudHMgYXMgYSBwaXhlbCBjbG9jaywgYnV0IHRoZSByYXRlIG1hdGNo
aW5nIG1heSBiZSB2ZXJ5IHBvb3Igd2hlbiBub3QNCj4gYmVpbmcgc291cmNlZCBmcm9tIHRoZSB2
aWRlbyBQTEwuDQo+IA0KPiBJZiB5b3UgZG9uJ3QgbmVlZCB0byBkcml2ZSBhbnkgb3RoZXIgZGlz
cGxheSBvbiB0aGUgc3lzdGVtLCB0aGUgYmVzdCBvcHRpb24gaXMNCj4gdG8gdXNlIHRoZSB2aWRl
byBQTEwgYXMgaXQgY2FuIHByb3ZpZGUgYWxtb3N0IHBlcmZlY3QgcmF0ZSBtYXRjaGluZy4gU2Vl
IHRoZQ0KPiBjbGtzIG5vZGUgaW4gYXJjaC9hcm0vYm9vdC9kdHMvaW14NnFkbC16aWktcmR1Mi5k
dHNpDQo+IGZvciBhbiBleGFtcGxlIG9uIGhvdyB0byBzd2l0Y2ggdGhlIExEQiB0byB1c2UgdGhl
IHZpZGVvIFBMTCBhcyBpdHMgY2xvY2sNCj4gc291cmNlLg0KPiANCg0KVGhhbmtzLCBMdWNhcywg
Zm9yIHRoZSBpbnN0YW50IHJlc3BvbnNlISBUaGF0J3Mgc29sdmVkIHRoZSBpc3N1ZSBmb3IgbWUg
YW5kIGV4cGxhaW5zIHRoZSBiZWhhdmlvdXIgSSB3YXMgc2VlaW5nLg0KDQpDaGVlcnMsDQpDaHJp
cw0KDQo=
