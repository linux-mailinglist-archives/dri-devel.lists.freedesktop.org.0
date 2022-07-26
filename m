Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3497D580AFF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 08:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D27710FBDD;
	Tue, 26 Jul 2022 06:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1515.securemx.jp [210.130.202.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9182F10FBDD
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 06:15:26 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 26Q6F33v022118;
 Tue, 26 Jul 2022 15:15:03 +0900
X-Iguazu-Qid: 34trpbd9IC41e4v2kS
X-Iguazu-QSIG: v=2; s=0; t=1658816103; q=34trpbd9IC41e4v2kS;
 m=0iGqhylLcSYnE60v/Wl9w6rR54yh9X4VuGxAgciZon8=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
 by relay.securemx.jp (mx-mr1510) id 26Q6F1E0022213
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 26 Jul 2022 15:15:01 +0900
X-SA-MID: 42668458
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TP3rTQqATDjYir5SDUUBh4etfAq5aFS9mWvzPNQIUcMwzrItZJlz9+oTs1/YsQ11TmqUKzBT830CNgCvVQVjYp7BGE34nl+mR0J3+r3SiPiRA0bTumvKiSyD93+D2qynKRmdnx12DthOBK4WUm+GDr/f8X5mPeVpZLt56ImBGr7X2yZJ7KXvu546ZI9qD6Cnlh4Pwyy+odHPyCr68eEeelHIBV3oghTI6QG81d470MY3B4ZNSBAGiaPeiW0LWx/BFI8rIapNO+JoWxZShPLf6vdeN/sepnw3VqE2ZCYVVEVzQIdybmEvsv9jGx77r6wz0EBd56JnyUBDL8WhCu272Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LochckwdzCR+mcS4dn9k+2wdjXt5JVQXDVzqGdWDE5U=;
 b=AKwkm+ix15nUWWqRWf+DtsdZAOvkQKc/ZCL2c/5Z7/OcTaT/5iQBdHWyqkURsiQ5OJ+WX6ZaF2jWir/kAr/V3duVZVC325vZWo3y/z3TpGGpvaHntncJq7Ksy+pMCsU3Bkb3KaM45xK60nh6lzdnkrGoi4W1dIfW+ESXWyLyGntiztg/t3+oYXtvf36fUb2cDETJvq4ky8a3wG64QPflVLyG9DNSM3M2Alkj8vx8mSdwHL0swiFPC5EDHigah7ubZrK4rVSBcQ7ozdNShu5oa0f53+Fa3ThuFUndAQeiU+J4z+t7c1RVQyuzrHLwT1wwYQc5e5cnLJYT5U7HKEQAsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2 0/5] Add Toshiba Visconti DNN image processing
 accelerator driver
Thread-Topic: [PATCH v2 0/5] Add Toshiba Visconti DNN image processing
 accelerator driver
Thread-Index: AQHYnaUi/BiBjs98DUW2eb3g4GGnba2PDfeAgAEL1GA=
Date: Tue, 26 Jul 2022 06:09:50 +0000
X-TSB-HOP2: ON
Message-ID: <TYAPR01MB62010C6B98C1C197E7E894AF92949@TYAPR01MB6201.jpnprd01.prod.outlook.com>
References: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
 <Yt6Qw/r0FQ0ElYdn@kroah.com>
In-Reply-To: <Yt6Qw/r0FQ0ElYdn@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6c59c53-3cf9-458f-206b-08da6ecd7371
x-ms-traffictypediagnostic: TYAPR01MB3424:EE_
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KvzD/Gg7PaLcwlAhqqfY8M+3OGS6UM80bN4D0m2VzgF0oxKSQFX6wuWhy3gntwQG30iKJMrfLjjZCV2QwwVVkZegoe4O8FMoRxEqp9XdPwCQu0CCewjytgVUGi9BADAQX2PmQRcxb0o1qJXCGHdq5i3+yVJID340l70+2hws/meOa1x+IZ2tQXSfAjO1sFr8BasbM7ebBeXYwbuVW99MVk2A7JmxgVbGqM27Z8NMOB9n6ARL7fkV4jJKmTt48xZBYjOwitd76ByWxP3krUeLT2OvDw0va7yVoN2Sh/RPc+pbjmVU+D6GDk+mdWRjLFsThz+yMd44VYLg9fsiGyiGxjpjEfdUVF20oU4qhDOsNNKoCxGgTxqCRe7MCBplQ7SKja1Yh6r5/UCUh2/Tq2jMb70fQQulwWfKQiFZQL7EBr07WNai47KEGxZucBc7ePppjk5W7ovtyyHeTo1t08Ij8luFT4zg5jHJ5fH14kY/8ERk5Z7w8jYDOW6yhT31BrvhTkBNmnKnvwkuasnJRQ3HwFHqIUJMknNGGLXVnC+iriGRg+3eDhln10aaCm19rNWAiwSnBLo5BewiCh8/nWy2/sqGnJ3qjnuhysdETJszr0BYpC1ooDgsXwshZVlFfwtDIDL9Q+Bbwdzz/co2qK0F7pQ9HGfHSZ/ulp8UyN0ef4wJcgTCeKYBnXrnTabhaEz5g693GCf7StascjKKpedsN6X9SwfupGilKSDlD+InCk7JkNN7veZqakVAb5XTXuCnUBcjc273gr0y4xpuUZ6qAFxSnntdXORZ5d6MTP9Ya+1xUSe6rF2O+tHKdu+pYBctQ77/JaHs4gtBrSgMtNPMIw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYAPR01MB6201.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(4326008)(966005)(316002)(55016003)(66556008)(66946007)(66476007)(64756008)(66446008)(8676002)(71200400001)(8936002)(54906003)(478600001)(76116006)(6916009)(52536014)(5660300002)(7416002)(2906002)(41300700001)(6506007)(7696005)(53546011)(86362001)(33656002)(186003)(38070700005)(66574015)(38100700002)(83380400001)(9686003)(26005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2NZVXB5REhZenZuRTdEOGxOWEN6K29ZWXN3VE92M0VzRzdOQmtPN3RZUzVD?=
 =?utf-8?B?V0YrYVU2M1A4QklQc1Y5eWhDSTR4ZndHYzlucThDdHpycXQ0RXNFYUpiaHRS?=
 =?utf-8?B?SGdrR0FycDVXZ2oxRjl6aklnbzQwdU84c2M3WXpaRVl5QVhuL2hoVFVxNFhX?=
 =?utf-8?B?N3RzNUt4cm05UDVBSk90b3c5OWVqQmhZZlRiQ05uRjBKTGNFRWFVNWt1K0pD?=
 =?utf-8?B?cUpCd29oajJVeFBVaS9UVmsxTkJldGFjOFI5S05HSnNQazJOaVhaQWtrRW1Z?=
 =?utf-8?B?RzFJb2VtZWtWTFkvZUxxTmk5V25IL09XUnlDVGlIdWZHK2pWRURqdWVYck5q?=
 =?utf-8?B?WjUvSmNhU25tNm1JSzBIQWNxMTd5dERteTc4bUEvOHdsMGlrQng5aktIaXIx?=
 =?utf-8?B?TGc5OS9WQWxVbnlIdXB4MGhRbmxJblpuM1c2OHJKYUYzeDkrSTNLbVh1NHNC?=
 =?utf-8?B?T2NYUHlTTmRyR2RPTnBUQUdjVlNsdlJKejhMZ05rVTNiYVlpM1pGUDhHSXNt?=
 =?utf-8?B?SU50QVppNFFaamZvZ01tc2wzbXdNbTI5d0Nra044OGpOMjJCbGwwZHlxd1Vt?=
 =?utf-8?B?dXVQVjAzUEltdmFDTGdYdGhFZlVrU251MmxxclNKdEJTK1RlZm01V21aY2ZN?=
 =?utf-8?B?L1RRNS9UUHBrT2JwS01vWXN6akp4RlpEOWFSMlJsNDgzdEc0ZExuT241cHUr?=
 =?utf-8?B?aVpBWTNiVDVqbVFaZWxMR0FGL3ZVY05LYzg1RTVxNndTMDJUeGIyR2lZT253?=
 =?utf-8?B?UjJyZVFjM2lnUmEySHBZcHlNT0ZwUlFwL1cvSU9EY2NpelpxZVJDYkdCYTZS?=
 =?utf-8?B?YWp5V2Z3V0tROXpZSWI5MXVTVC9xSEhwUk0vazhKVWN5ZXVqdER4N2R5WHpm?=
 =?utf-8?B?K3F2ZUxtTWRXQzlDQURHMU82VEY0NTJPN1lVTmRwRnFaUVNGMkh3NUtON2xi?=
 =?utf-8?B?MTlTT2I0aml5MHBxcVVlRkx0YVhsbVFMSVNJcGl6ZDlVbUJhMllGSzdZWXBF?=
 =?utf-8?B?dnNLWTNqOG9TRmpHYk4xY3JuYzhlRnNmbUZRcHh2OFVSa3BhamhiZkxKeGti?=
 =?utf-8?B?d3FvTHl2bDk3bFVRbXlBeGEwRkhod242L0NPZHljM200ZDIvclA5bHlhQ082?=
 =?utf-8?B?NXF3MjFVQUM0NmV3Z3dRZi9zYmxJSlV0eWlEZ05BbUxYQVhkOXBRbEZ5dVB1?=
 =?utf-8?B?bVF1N2NBY09ReER5VUg2UFRWOTRnS3cyWC9IdXJ1cjZpR1piSEF2ejNSUWRR?=
 =?utf-8?B?ZUpydWJZV0tLNnBnZTcrSG5Eak05NVVBNzNWS1JjSkRRcFVjcURZY29zN1kz?=
 =?utf-8?B?dmhqTnE1dVZvNDRqNnMvaWZoNkhFRDFBTVBPdWxGdjdFWGxWUDBLc3V2K3du?=
 =?utf-8?B?cE5tYllmQWZ1ZUxjeXhjY2dCdklVNkdQdmoveEYwbWVFamFRUmJFN3d5b1Br?=
 =?utf-8?B?VFczdUFhUkU4blBGamFtaDVjWkRmdVFaNURwbHR6dzNRK2J0d3NvbUg0TXp2?=
 =?utf-8?B?b2dpcTBkQm5FSE5HY2orTGlIYVBGZXY4cHFvb0s2Sm5HeW1wQXZiMDV6TGJN?=
 =?utf-8?B?a0VzOEtES0gvL3o2d2ZsNDVjOWtDN1N5b1ljNW9Jb21EZkJrUFhVSS9jTVM0?=
 =?utf-8?B?ZzVDYUNneTZXZ0w0cHlmZnZOYUd0SXVXTzdTRjV3MTR5YUZtakQ0eXdYZEtm?=
 =?utf-8?B?RzcwMzlxdXp1M2JOT29vdm5RUDd4cUxDVC9KS0NOeXI0ZGJrTEllVDQ3ZnRq?=
 =?utf-8?B?WXdUQ3dGcW9GNzdLanpuaWZ5L1U5elJHcUtWNExOVE9hbk1KUkxpVzJiMVhw?=
 =?utf-8?B?S0pxc0dWQlZKL0Nna0I3QmFjWC9JRmRUaHkwaHJHMmt4TE90c1RqdnFSRkUz?=
 =?utf-8?B?eDRwUEJFZTFrZUJaN0tFVEE0bVV3MUtnaXd1UytHUEhlOUJDazcyRFNUVTM5?=
 =?utf-8?B?UU8rcWMzRW1RTG4yVXMybmdCd01tQ2RtUDliOHV5MTByeW5pSTJVOUtVNEJI?=
 =?utf-8?B?OGdNY0JMVS83anp5TG5FclIrNGN2eWdmbzZteGlFU2lOVkgwSkc2UVQyeW5z?=
 =?utf-8?B?eE5aNDlOVXA0K0RGbFFkeitZOS9SUVo5UW9jdzZiTlh0bkYyVm94OXZITitt?=
 =?utf-8?B?SFIyY3dLL1pFS3U0N0VRTFZMazVHS0hmdWpiNFd4bk9sd0I1M0dRL2oyZVY4?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6201.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c59c53-3cf9-458f-206b-08da6ecd7371
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 06:09:50.9866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U8r+XcxDJNUVAVmrymBWo0undg9SGOZcMDHF1zjenYzYeKfd0iAcKXRQl/XefYXWy/OIMF6cLtwwKNk4sdMFKmLGAGZKCF+ZtQdZghtuqBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3424
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
Cc: linaro-mm-sig@lists.linaro.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, hverkuil@xs4all.nl, robh+dt@kernel.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3JlZw0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudHMuDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+DQo+IFNlbnQ6IE1vbmRheSwgSnVseSAyNSwgMjAyMiA5OjQ3IFBNDQo+IFRvOiBpc2hpa2F3
YSB5dWppKOefs+W3nSDmgqDlj7gg4peL77yy77yk77yj4pah77yh77yp77y077yj4peL77yl77yh
6ZaLKQ0KPiA8eXVqaTIuaXNoaWthd2FAdG9zaGliYS5jby5qcD4NCj4gQ2M6IFJvYiBIZXJyaW5n
IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD47
DQo+IGl3YW1hdHN1IG5vYnVoaXJvKOWyqeadviDkv6HmtIsg4pah77yz77y377yj4pev77yh77yj
77y0KQ0KPiA8bm9idWhpcm8xLml3YW1hdHN1QHRvc2hpYmEuY28uanA+OyBKb25hdGhhbiBDb3Ji
ZXQgPGNvcmJldEBsd24ubmV0PjsNCj4gU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJv
Lm9yZz47IENocmlzdGlhbiBLw7ZuaWcNCj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT47IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOw0KPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MiAwLzVdIEFkZCBUb3NoaWJhIFZpc2NvbnRpIEROTiBpbWFnZSBw
cm9jZXNzaW5nDQo+IGFjY2VsZXJhdG9yIGRyaXZlcg0KPiANCj4gT24gRnJpLCBKdWwgMjIsIDIw
MjIgYXQgMDU6Mjg6NTNQTSArMDkwMCwgWXVqaSBJc2hpa2F3YSB3cm90ZToNCj4gPiBUaGlzIHNl
cmllcyBpcyB0aGUgRE5OIGltYWdlIHByb2Nlc3NpbmcgYWNjZWxlcmF0b3IgZHJpdmVyIGZvciBU
b3NoaWJhJ3MgQVJNDQo+IFNvQywgVmlzY29udGlbMF0uDQo+ID4gVGhpcyBwcm92aWRlcyBEVCBi
aW5kaW5nIGRvY3VtZW50YXRpb24sIGRldmljZSBkcml2ZXIsIE1BSU5UQUlORVIgZmlsZXMNCj4g
YW5kIGRvY3VtZW50cy4NCj4gPg0KPiA+IEJlc3QgcmVnYXJkcywNCj4gPiBZdWppDQo+ID4NCj4g
PiBbMF06DQo+ID4NCj4gaHR0cHM6Ly90b3NoaWJhLnNlbWljb24tc3RvcmFnZS5jb20vYXAtZW4v
c2VtaWNvbmR1Y3Rvci9wcm9kdWN0L2ltYWdlLQ0KPiA+IHJlY29nbml0aW9uLXByb2Nlc3NvcnMt
dmlzY29udGkuaHRtbA0KPiA+DQo+ID4gZHQtYmluZGluZ3M6IHNvYzogdmlzY29udGk6IEFkZCBU
b3NoaWJhIFZpc2NvbnRpIEROTiBpbWFnZSBwcm9jZXNzaW5nDQo+IGFjY2VsZXJhdG9yIGJpbmRp
bmdzDQo+ID4gICB2MSAtPiB2MjoNCj4gPiAgICAgLSBObyB1cGRhdGUNCj4gPg0KPiA+IHNvYzog
dmlzY29udGk6IEFkZCBUb3NoaWJhIFZpc2NvbnRpIGltYWdlIHByb2Nlc3NpbmcgYWNjZWxlcmF0
b3IgY29tbW9uDQo+IHNvdXJjZQ0KPiA+ICAgdjEgLT4gdjI6DQo+ID4gICAgIC0gY2hlY2tlZCB3
aXRoIGNoZWNrcGF0Y2gucGwgLS1zdHJpY3QNCj4gPg0KPiA+IHNvYzogdmlzY29udGk6IEFkZCBU
b3NoaWJhIFZpc2NvbnRpIEROTiBpbWFnZSBwcm9jZXNzaW5nIGFjY2VsZXJhdG9yDQo+ID4gICB2
MSAtPiB2MjoNCj4gPiAgICAgLSBjaGVja2VkIHdpdGggY2hlY2twYXRjaC5wbCAtLXN0cmljdA0K
PiA+ICAgICAtIHJlbW92ZWQgdW51c2VkIGNvZGUNCj4gPg0KPiA+IE1BSU5UQUlORVJTOiBBZGQg
ZW50cmllcyBmb3IgVG9zaGliYSBWaXNjb250aSBETk4gaW1hZ2UgcHJvY2Vzc2luZw0KPiA+ICAg
djEgLT4gdjI6DQo+ID4gICAgIC0gTm8gdXBkYXRlDQo+ID4NCj4gPiBEb2N1bWVudGF0aW9uOiBk
cml2ZXItYXBpOiB2aXNjb250aTogYWRkIGEgZGVzY3JpcHRpb24gb2YgRE5OIGRyaXZlci4NCj4g
PiAgIHYxIC0+IHYyOg0KPiA+ICAgICAtIG5ld2x5IGFkZGVkIGRvY3VtZW50cw0KPiA+DQo+ID4g
WXVqaSBJc2hpa2F3YSAoNSk6DQo+ID4gICBkdC1iaW5kaW5nczogc29jOiB2aXNjb250aTogQWRk
IFRvc2hpYmEgVmlzY29udGkgRE5OIGltYWdlIHByb2Nlc3NpbmcNCj4gPiAgICAgYWNjZWxlcmF0
b3IgYmluZGluZ3MNCj4gPiAgIHNvYzogdmlzY29udGk6IEFkZCBUb3NoaWJhIFZpc2NvbnRpIGlt
YWdlIHByb2Nlc3NpbmcgYWNjZWxlcmF0b3INCj4gPiAgICAgY29tbW9uIHNvdXJjZQ0KPiA+ICAg
c29jOiB2aXNjb250aTogQWRkIFRvc2hpYmEgVmlzY29udGkgRE5OIGltYWdlIHByb2Nlc3Npbmcg
YWNjZWxlcmF0b3INCj4gPiAgIE1BSU5UQUlORVJTOiBBZGQgZW50cmllcyBmb3IgVG9zaGliYSBW
aXNjb250aSBETk4gaW1hZ2UgcHJvY2Vzc2luZw0KPiA+ICAgICBhY2NlbGVyYXRvcg0KPiA+ICAg
RG9jdW1lbnRhdGlvbjogZHJpdmVyLWFwaTogdmlzY29udGk6IGFkZCBhIGRlc2NyaXB0aW9uIG9m
IEROTiBkcml2ZXIuDQo+ID4NCj4gPiAgLi4uL3NvYy92aXNjb250aS90b3NoaWJhLHZpc2NvbnRp
LWRubi55YW1sICAgIHwgIDU0ICsrDQo+ID4gIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92aXNj
b250aS9jb21tb24ucnN0ICB8IDExNSArKysrDQo+ID4gIERvY3VtZW50YXRpb24vZHJpdmVyLWFw
aS92aXNjb250aS9kbm4ucnN0ICAgICB8IDM5NCArKysrKysrKysrKysrDQo+ID4gIE1BSU5UQUlO
RVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArDQo+ID4gIGRyaXZl
cnMvc29jL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ID4gIGRy
aXZlcnMvc29jL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ID4g
IGRyaXZlcnMvc29jL3Zpc2NvbnRpL0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAgNyArDQo+
ID4gIGRyaXZlcnMvc29jL3Zpc2NvbnRpL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgOCAr
DQo+ID4gIGRyaXZlcnMvc29jL3Zpc2NvbnRpL2Rubi9NYWtlZmlsZSAgICAgICAgICAgICB8ICAg
NiArDQo+ID4gIGRyaXZlcnMvc29jL3Zpc2NvbnRpL2Rubi9kbm4uYyAgICAgICAgICAgICAgICB8
IDUyMw0KPiArKysrKysrKysrKysrKysrKysNCj4gPiAgZHJpdmVycy9zb2MvdmlzY29udGkvZG5u
L2h3ZF9kbm4uYyAgICAgICAgICAgIHwgMTgzICsrKysrKw0KPiA+ICBkcml2ZXJzL3NvYy92aXNj
b250aS9kbm4vaHdkX2Rubi5oICAgICAgICAgICAgfCAgNjggKysrDQo+ID4gIGRyaXZlcnMvc29j
L3Zpc2NvbnRpL2Rubi9od2RfZG5uX3JlZy5oICAgICAgICB8IDIyOCArKysrKysrKw0KPiA+ICBk
cml2ZXJzL3NvYy92aXNjb250aS9pcGFfY29tbW9uLmMgICAgICAgICAgICAgfCAgNTUgKysNCj4g
PiAgZHJpdmVycy9zb2MvdmlzY29udGkvaXBhX2NvbW1vbi5oICAgICAgICAgICAgIHwgIDE4ICsN
Cj4gPiAgZHJpdmVycy9zb2MvdmlzY29udGkvdWFwaS9kbm4uaCAgICAgICAgICAgICAgIHwgIDc3
ICsrKw0KPiA+ICBkcml2ZXJzL3NvYy92aXNjb250aS91YXBpL2lwYS5oICAgICAgICAgICAgICAg
fCAgOTAgKysrDQo+IA0KPiBXaHkgaXMgdGhpcyBpbiBkcml2ZXJzL3NvYy8/DQoNCkFjdHVhbGx5
LCBJJ20gbm90IHN1cmUgd2hlcmUgaGlzIG1vZHVsZSBzaG91bGQgbGl2ZSBpbi4NClRoZSBkaXJl
Y3RvcnkgZHJpdmVycy9zb2Mgd2VyZSBjaG9zZW4ganVzdCBiZWNhdXNlIHRoZSBkcml2ZXIgaXMg
c3BlY2lmaWMgdG8gVmlzY29udGkgU29DLg0KSXMgaXQgYmV0dGVyIHRvIG1vdmUgdGhlIGRyaXZl
ciB0byBhbm90aGVyIGRpcmVjdG9yeSBzdWNoIGFzIGRyaXZlcnMvbWlzYyA/DQoNCj4gQW5kIHVh
cGkgZmlsZXMgYmVsb25nIGluIHRoZSBjb3JyZWN0IGluY2x1ZGUgcGF0aCwgbm90IGJ1cnJpZWQg
aW4gYSBkcml2ZXINCj4gc3ViZGlyZWN0b3J5IHdoZXJlIHRoZXkgd2lsbCBuZXZlciBiZSBwaWNr
ZWQgdXAgY29ycmVjdGx5IGJ5IHRoZSBidWlsZCBzeXN0ZW0uDQo+IEhvdyBkaWQgeW91IHRlc3Qg
dGhlc2U/DQoNCkkgdW5kZXJzdGFuZCBpdCdzIG5vdCBhIGdvb2QgaWRlYSB0byBwbGFjZSB1YXBp
IGZpbGVzIHVuZGVyIGRyaXZlciBzdWJkaXJlY3RvcnkuDQpBIGJ1aWxkIGNvbW1hbmQgIm1ha2Ug
aGVhZGVyc19pbnN0YWxsIiBkaWQgbm90IHBpY2sgb3V0IGhlYWRlcnMuDQpJIHVzZWQgYWRkaXRp
b25hbCBzaGVsbCBzY3JpcHQgdG8gaW5zdGFsbCBoZWFkZXJzIGZvciBWaXNjb250aS4NCkknbGwg
bW92ZSB1YXBpIGhlYWRlcnMgdG8gaW5jbHVkZS91YXBpL2xpbnV4Lg0KDQo+IHRoYW5rcywNCj4g
DQo+IGdyZWcgay1oDQoNClJlZ2FyZHMsDQogIFl1amkNCg==

