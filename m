Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AFE58EDF9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 16:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985D318BF31;
	Wed, 10 Aug 2022 14:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1515.securemx.jp [210.130.202.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98462BB7F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 14:10:55 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 27AEAgaB003525;
 Wed, 10 Aug 2022 23:10:43 +0900
X-Iguazu-Qid: 34trbpZOfxgaFR450y
X-Iguazu-QSIG: v=2; s=0; t=1660140642; q=34trbpZOfxgaFR450y;
 m=31MFKplLmQJrGFCmXm3zY/HRciNKbsJoh+M7BEN3oYw=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
 by relay.securemx.jp (mx-mr1511) id 27AEAfuq004377
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 10 Aug 2022 23:10:41 +0900
X-SA-MID: 43725840
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbI1hh9gfk6atuwYzjvslZ4ItRHamE3HtBw+/IqwCxJMblt+KTewE+FHh1eSaYYgjg9cVdtstwvf48LhDktsCeUGYswM1xW4eJd5hwx1+H5zZ1X+zv6fNU+woGWAS3h80ftUqPHmmu9j0IPwAaL2Swggg3FdNNlLrfp5tSR96V2nnF5lhx8m+FHb7+yP94Imk7UnBt0WFCaMA2S3YwU/golx1ME/bm8AqyfSCf55c5t1UJ9PUyz2sbGxezB09QuZe371nnPEdL2JQxpF55MhnpVvWw+dP/bGIuw/jTr9+TbHM4FG3U6rFdNZ4567a3ZKgXXJmASlsORGQU/kr/KDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mG+/xoJidwwjEcdl7YpurlyryNYlch5v+2jTUbnOaUM=;
 b=M/NvhM1Zz42tEYVr7ubMXP3XSdoRa2sbEUxO8Etx1uI+fzLoMfitOXhhHXnQuPOYg+Pqg/FCoFn7TvOj1eVOvHpkuJTUGFRUkxTuS3D9qb0a5XCmb7t5/B+MEhrgTXdIx7Yr1oHbXGz3e/+Suf3E/Jeea5pJ9P84oJa965FUXVgQGEl6ZxMBNY+cFi74j3lwpUtTT0zjWENH8J9TfJijeI6m1h4MUX6ootolEDns3uikHSrA/rxfhkhpLfuFrOESmNsM9NXSWoenC7+mQQ0dcAv0svQrfzRVQ3E0uVYtcvCeCLBxzJsLx7CI8zoO1rYoTUMli/hL2hFvAwSvJQR1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <oded.gabbay@gmail.com>, <airlied@gmail.com>, <gregkh@linuxfoundation.org>,
 <jiho.chu@samsung.com>
Subject: RE: New subsystem for acceleration devices
Thread-Topic: New subsystem for acceleration devices
Thread-Index: AQHYpNMiuKJkJQ8DYkaebqXY59xh6q2djiWAgAAVQYCAADu3gIAAgxIAgAFD4wCAA2RFgIAEHdUAgAENkRA=
Date: Wed, 10 Aug 2022 14:05:36 +0000
X-TSB-HOP2: ON
Message-ID: <TYAPR01MB6201272491EA2F23A14A9D8192659@TYAPR01MB6201.jpnprd01.prod.outlook.com>
References: <CAFCwf11=9qpNAepL7NL+YAV_QO=Wv6pnWPhKHKAepK3fNn+2Dg@mail.gmail.com>
 <CAPM=9tzWuoWAOjHJdJYVDRjoRq-4wpg2KGiCHjLLd+OfWEh5AQ@mail.gmail.com>
 <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
 <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
 <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
 <CAPM=9txme2dQD9kyM6gnYyXL34hYP8wcGMbduOUcFsKe+4zTcQ@mail.gmail.com>
 <CAFCwf11TPKTF_Ndi60FneWp5g3SoawJvfJoKVWJ-QjxjpawMmg@mail.gmail.com>
 <CAFCwf13WU3ZEjurEaEnVC56zorwKr-uuQn-ec10r301Fh+XEtA@mail.gmail.com>
In-Reply-To: <CAFCwf13WU3ZEjurEaEnVC56zorwKr-uuQn-ec10r301Fh+XEtA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b54e89fb-8524-4edc-747b-08da7ad965f9
x-ms-traffictypediagnostic: TYAPR01MB3856:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S0gBeFfTnwX28t388llP4LOIxQhxMd9VI9q5X8SxaUS1NkUH8ogasJn7HmHXcAsGehxEXXn10Vvtp930d4067klNwlB4KjpgWM9qMucWIuaKgfhcqo2Wvl0mY8s5l028qcjhsFFC52hb+wT1EnmUXJqymlftpXdiyotVICjZF32bXlX+0ntWa7k5C0DYqsUeWwTX8798siluoAEOUWJLT6MfG7IiPAJgeR0zYLXnPn1En4J3Z1asHnl5c8cNBQ2gc7rnBYHhNdQP4BHjAxihVkiWGizozTE69tc2+PCntVECeb7i4s3icCzjbAqpUkZ7xIUDsgBr8Z4zkQOdRBaQ/pfujPotcNOxu9LL2F7c8zWFosNBQLPjEz23qkJvJbllqPRsMD+ob9MhUjRXsZqwdN8MC+I5T0ggCdEe5nVj5L99zktAP/q/TwO0KCXc9QBt9aFXzWQ5DjfuMipkuR1Ov8Hhh6nNuTzK4CMzRAKLyqwt3/oqxv09aW5ds7A8x0Kh3ZnT9E8dqeG/9AeEBAEsNQD4vItSZ3oLsc6/w8D6Pz+V6BhVJyhI/6SCcPqroYb27o96eTKGYRz8VdVleSCFDyBr3utMVetJl7WxbzZ5pD1op7WKj2auApN08M/yrirfl5/LXFVGM/b6UTEZvN2IAjxF4t2JWtkzVjmQmPEZWAC8Aue6l7rOickmO7t5MoC7TpZXmBKSoveuV9E9k3JuJls+Y/ZKx57OmW7TWBkbsA6bAFW3OHBhtmvNhxlNCISSmgooXC6zfkz2PX6OJ6BK2MPOg3c+quvinwd3rppZlTYu7nalDSN5y9oRKUdRunq0DRIitiyCvr8tM9muIiDIqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYAPR01MB6201.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(53546011)(478600001)(71200400001)(55236004)(26005)(7696005)(41300700001)(966005)(9686003)(6506007)(122000001)(38070700005)(186003)(38100700002)(5660300002)(4326008)(64756008)(33656002)(8676002)(66946007)(66476007)(76116006)(66446008)(2906002)(66556008)(83380400001)(8936002)(52536014)(54906003)(110136005)(86362001)(55016003)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTdSYXo0aE1iY1JsQlA1eHdhaDNTVEtKS3VlV2twenJOWEVEMmZZQ2JvWXVx?=
 =?utf-8?B?YkwydVdLUmhtYUlFVytlREJHY0tmeVlCNklzVnh3dkMrUnhqR2xRanJOOTh3?=
 =?utf-8?B?WjQxTFl2dnFZSURiMkFKUExtUVcyN0dCemMxTXVMRWR2VjZqa3dXeWZ2eTJX?=
 =?utf-8?B?Y2QvbGlCb3hCUUhrRjY3T3JRUkl3d3BjeUprUWlFYUpkRGV5aVB5eVRvNkw5?=
 =?utf-8?B?dGVGUWdHeExOelViYy84UHFpaVRGMUtSUlNWNWtheldnVXF6allPNVFBUkk1?=
 =?utf-8?B?ZG1VZ0thWkJKcjMvWEwwVW9TUU5oNjdnVUFQM3B6K1VrS3o2bVB1MzNuZ2Ew?=
 =?utf-8?B?Yjg5aGo1Q0NTSE9VekR3aUhsWERRMEl2bVdsdmNCN3BPYTY2a0h0NDlvMUc3?=
 =?utf-8?B?RjVkSmxWZGpsYzlNQ0sxYmsydDB1ZUlIYUhhVWhpRFVDVFVWa0RyeFdwNEhW?=
 =?utf-8?B?MklHcWdFU2dWaGZSYkxSMXNzMVpsWW1nT3BRZmE1Yk12bFkvVS8rd1NmaGw4?=
 =?utf-8?B?WnlTdnd0M0NBUmh5YnhYaHJVT3RHSzRLd2JBTHpUMERtTmhkakV3UkVxWTYz?=
 =?utf-8?B?eUsxeDZra0NXZExPMmZYckhzQ2V2TGV6dG1Xa1l1dFpiWEUzWEZpcnhkcS9t?=
 =?utf-8?B?eTAwVUVVdEdlQVp2dnpqL3FCYXM1eEI0Zm5uaUhVRzBUd1lSZGJYbnRGWUla?=
 =?utf-8?B?RXg3VmFGQUFRUi9iM0NMb1F0VjBKV2IyNFc0N2c4aVloeFpyc2wySnBBM3dv?=
 =?utf-8?B?RkkzK1ZWY0pQUU41UTduY2hPZU1IcXM0dUdJM0dzaVJIV0tKOFJjTVV0Ymhl?=
 =?utf-8?B?TzRjYkVhSTlCdldieFFpRVhOZURFNDBGcS9TcnJvQzBNbDdiVWcydnFaNjFY?=
 =?utf-8?B?QlhuZUxYNnA2NXB3a2FVVks2TGl0aTlDbzNqNUtodGRjeTF3TDA4TGhvekVY?=
 =?utf-8?B?QU9Yeml0UFJrYlJ2ZndEV0dLaWZHVEJmVklMSzBJYmdCMG1mMGwwSVZucWNn?=
 =?utf-8?B?OGYzVDZEdmZFMXdJcGdlSWhDTlZDcCtHellWSllNTXBZeWs2dWhGR1dmV0V2?=
 =?utf-8?B?aUJjNkpYczU3L0I2VDhWRVh3TVVrY2MyalQ2TlRNS1BxMTFFZHpiU1l4MWR4?=
 =?utf-8?B?dHJLa2Q2OVlxa1JxRDlMaGs0YjNMMEdkWi85MlM2eDZPODJJNFV1bzBHR3pp?=
 =?utf-8?B?MEJOdmJkd2FBYXdnbk52V0ttNWZ6UUVpTi93TWNVKytWN0daMnZvWUFpY3lN?=
 =?utf-8?B?MW1rdTVCREZoUW5rR1dLaEt6N1lXa0FHQkdyMHFVdFhaMEhQbWVoRC9KRjhl?=
 =?utf-8?B?eWNHSVNJQmNPRmtFZHFWYitjRFMxSjNNNWZmd0czc1lxQ2p2TTRyOVo1OEdF?=
 =?utf-8?B?UHM2OS84bEVBbHhINXI5dUVvS0pnWmNnQTNodmNTS21SaGtISTRxS2VRV29F?=
 =?utf-8?B?eTVLYjMyRitjRENDSm5rOFVwOU9ESlFHMU5QSGJ3WWRWRDVjY2pGRXVjbzh3?=
 =?utf-8?B?MnBENnJjL2svM2NjMlVwSFA2U3ZKdUdpRzhUVHlMVHRxNU43YnNqQmhjMTNa?=
 =?utf-8?B?WG1HSmNxeEx3bzJjc1NUdzVwR1ZneEFrbnF2b1UzTG0xVzNiYnM0ZDRXSmdk?=
 =?utf-8?B?OGs0L2ZwUXE3SGhmZVVZN2tpbkM3a0R6bVFuSkhmbmhVTitKWEorcHJseW9K?=
 =?utf-8?B?L3psdHYvRVVnR2JDcXRNMmp1OGpaK2pPTDNYejdsY3VPRlNHTitIN0pVQ3lE?=
 =?utf-8?B?L3UrK29WMG52cS9GbzJ5RHQ2UjMveVg0TDNHVldFZnZzQ3p2MWdOaGFuQ1d2?=
 =?utf-8?B?RVJubmJDb2ZwaDE5cjJyMnU2QU1sWXRqTEk0eUprTVpCYzl0L2ROcWhpejFQ?=
 =?utf-8?B?cElrWStxRHlXa1ZIaU1JQmVIa0l3L3UxM3AwRUpRYW5IRGFEUHd4QTJrWTYy?=
 =?utf-8?B?Njh5cGt6bUFOdlNleWI5cUY4dHFRaEFDdzA1Q3ZsejVERGtmNHZGeWJjeWtr?=
 =?utf-8?B?K3dycFA5TjdlTFB1cE9WYlhmQnpoanJPT0lHc2pURHBidGxaWGR4N21RUk9L?=
 =?utf-8?B?ZEFOZ29HZ29lOG9JNVNSeGE2UjNWeU9IN2lPY1Izc2c4eHl1RzBGVDk2YVYr?=
 =?utf-8?B?eHRrQ0FZNDRHZVUxZFhxWGFDRkJlS1MyVlJIanBkcUR2c2laV0dkdFdWbDEw?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6201.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b54e89fb-8524-4edc-747b-08da7ad965f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 14:05:36.3529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jshWlmKCFAahU6MDZCG8yHVlQXnh4ih5PGvNG5Bit96iFMZkzYMWF8k63HfMVnk1NH4TRMXJER8dVbKhfadELRxiT4NfQJDIXW6P+C2h98M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3856
X-OriginatorOrg: toshiba.co.jp
MSSCP.TransferMailToMossAgent: 103
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
Cc: jgg@nvidia.com, arnd@arndb.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBPZGVkIEdhYmJheSA8b2RlZC5n
YWJiYXlAZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAxMCwgMjAyMiA2OjQy
IEFNDQo+IFRvOiBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBHcmVnIEtyb2FoLUhh
cnRtYW4NCj4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgaXNoaWthd2EgeXVqaSjnn7Pl
t50g5oKg5Y+4IOKXi++8su+8pO+8o+KWoe+8oe+8qe+8tO+8o+KXiw0KPiDvvKXvvKHplospIDx5
dWppMi5pc2hpa2F3YUB0b3NoaWJhLmNvLmpwPjsgSmlobyBDaHUgPGppaG8uY2h1QHNhbXN1bmcu
Y29tPg0KPiBDYzogZHJpLWRldmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsg
QXJuZCBCZXJnbWFubg0KPiA8YXJuZEBhcm5kYi5kZT47IExpbnV4LUtlcm5lbEBWZ2VyLiBLZXJu
ZWwuIE9yZw0KPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IEphc29uIEd1bnRob3Jw
ZSA8amdnQG52aWRpYS5jb20+DQo+IFN1YmplY3Q6IFJlOiBOZXcgc3Vic3lzdGVtIGZvciBhY2Nl
bGVyYXRpb24gZGV2aWNlcw0KPiANCj4gSGkgSmlobywgWXVqaS4NCj4gDQo+IEkgd2FudCB0byB1
cGRhdGUgdGhhdCBJJ20gY3VycmVudGx5IGluIGRpc2N1c3Npb25zIHdpdGggRGF2ZSB0byBmaWd1
cmUgb3V0IHdoYXQncw0KPiB0aGUgYmVzdCB3YXkgdG8gbW92ZSBmb3J3YXJkLiBXZSBhcmUgd3Jp
dGluZyBpdCBkb3duIHRvIGRvIGEgcHJvcGVyIGNvbXBhcmlzb24NCj4gYmV0d2VlbiB0aGUgdHdv
IHBhdGhzIChuZXcgYWNjZWwgc3Vic3lzdGVtIG9yIHVzaW5nIGRybSkuIEkgZ3Vlc3MgaXQgd2ls
bCB0YWtlDQo+IGEgd2VlayBvciBzby4NCj4gDQo+IEluIHRoZSBtZWFudGltZSwgSSdtIHB1dHRp
bmcgdGhlIGFjY2VsIGNvZGUgb24gaG9sZC4gSSBoYXZlIG9ubHkgbWFuYWdlZCB0byBkbw0KPiB0
aGUgdmVyeSBiYXNpYyBpbmZyYSBhbmQgYWRkIGEgZGVtbyBkcml2ZXIgdGhhdCBzaG93cyBob3cg
dG8gcmVnaXN0ZXIgYW5kDQo+IHVucmVnaXN0ZXIgZnJvbSBpdC4NCj4gWW91IGNhbiBjaGVjayB0
aGUgY29kZSBhdDoNCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvb2dhYmJheS9saW51eC5naXQvbG9nLz9oPWFjDQo+IGNlbA0KPiANCj4gSXQgaGFzIHR3
byBjb21taXRzLiBUaGUgZmlyc3QgYWRkcyB0aGUgc3Vic3lzdGVtIGNvZGUgYW5kIHRoZSBzZWNv
bmQgYWRkcyB0aGUNCj4gZGVtbyBkcml2ZXIuDQo+IFRoZSBzdWJzeXN0ZW0gY29kZSBpcyBiYXNp
Y2FsbHkgZHJtIGNvZGUgY29waWVkIGFuZCByZW5hbWVkIGFuZCBzbGlnaHRseQ0KPiBtb2RpZmll
ZCwgYnV0IEkgcmVhbGx5IG9ubHkgd29ya2VkIG9uIGl0IGZvciBhIGNvdXBsZSBvZiBob3VycyBz
byB0YWtlIHRoYXQgaW50bw0KPiBjb25zaWRlcmF0aW9uLg0KPiANCj4gVGhlIGltcG9ydGFudCB0
aGluZyBpcyB0aGF0IHRoZSBkZW1vIGRyaXZlciBzaG93cyB0aGUgYmFzaWMgc3RlcHMgYXJlIHJl
YWxseQ0KPiBzaW1wbGUuIFlvdSBuZWVkIHRvIGFkZCB0d28gZnVuY3Rpb24gY2FsbHMgaW4geW91
ciBwcm9iZSBhbmQgb25lIGZ1bmN0aW9uIGNhbGwgaW4NCj4geW91ciByZWxlYXNlLiBPZiBjb3Vy
c2UgeW91IHdpbGwgbmVlZCB0byBzdXBwbHkgc29tZSBmdW5jdGlvbiBjYWxsYmFja3MsIGJ1dCBJ
DQo+IGhhdmVuJ3QgZ290IHRvIGZpbGwgdGhhdCBpbiB0aGUgZGVtbyBkcml2ZXIuIE9uY2UgeW91
IHJlZ2lzdGVyLCB5b3UgZ2V0DQo+IC9kZXYvYWNjZWwvYWMwIGFuZA0KPiAvZGV2L2FjY2VsL2Fj
X2NvbnRyb2xENjQgKGlmIHlvdSB3YW50IGEgY29udHJvbCBkZXZpY2UpLiBJZiBJIHdlcmUgdG8g
Y29udGludWUNCj4gdGhpcywgdGhlIG5leHQgc3RlcCBpcyB0byBkbyB0aGUgb3BlbiBhbmQgY2xv
c2UgcGFydC4NCj4gDQo+IEkgd2lsbCB1cGRhdGUgb25jZSB3ZSBrbm93IHdoZXJlIHRoaW5ncyBh
cmUgaGVhZGluZy4gQXMgSSBzYWlkLCBJIGltYWdpbmUgaXQgY2FuDQo+IHRha2UgYSBmZXcgd2Vl
a3MuDQo+IA0KPiBUaGFua3MsDQo+IE9kZWQNCg0KSGkgT2RkZWQsDQpUaGFuayB5b3UgZm9yIHVw
bG9hZGluZyB0aGUgZnJhbWV3b3JrIGFzIHdlbGwgYXMgYSBzYW1wbGUuIA0KSXQncyBleGNpdGlu
ZyB0byBzZWUgbmV3IHNvZnR3YXJlIGlzIGdyb3dpbmcgdXAuDQoNClNpbmNlIFZpc2NvbnRpIERO
TiBpcyBhIHBsYXRmb3JtIGRldmljZSwgSSdsbCB3cml0ZSBzb21lIHRlc3QgY29kZSB0byBpbml0
aWFsaXplIGRyaXZlciBhbmQgc2VlIGlmIGl0IHdvcmtzLg0KDQpSZWdhcmRzLA0KWXVqaQ0K

