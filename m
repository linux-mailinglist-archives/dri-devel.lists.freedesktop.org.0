Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D900651288B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 03:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E801710E044;
	Thu, 28 Apr 2022 01:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1116.securemx.jp [210.130.202.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2C910E044
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 01:10:20 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 23S19rok022751;
 Thu, 28 Apr 2022 10:09:53 +0900
X-Iguazu-Qid: 2wGrMWgEdBd6GN6Ngx
X-Iguazu-QSIG: v=2; s=0; t=1651108192; q=2wGrMWgEdBd6GN6Ngx;
 m=qKm4QAUwiJVlxj0YXa2lXfXVsLmFOMw99eJSJrQqz2g=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
 by relay.securemx.jp (mx-mr1110) id 23S19pMp025943
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Apr 2022 10:09:51 +0900
X-SA-MID: 36936064
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWJZnfuGIwDh8XCzM+nkHByjzOW8qorA60eZXORd4oM9i3kZkvHOsBmkOPMOLzbj9cGKoRMxiGDRMR0psrXpexW71MxbCHqswsWzKR9a0StbBURuCHPhD9M2ivYGwSqhBNVX7Hx67lqkihMQnUZgxgq5acS/8WeRx0aLlg47eGNMAZfcrEBM2eQy4tUI9acVQPIbCXRHrdLf8Tv1meDgR/5WJaPU29SVAdQ4SjaBrmYWYKf3uRAXlB+sWaPqpmRzeoBFBOTewpraOrGRmn0cvOXmkBtLsA/o5AWulCMd4BdxQNtaVd6fNhfRuStVENCQ4F+TDs0z4U7Pgw/+IHQrdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5l4gg1q/4v9TDNVPtJXbo70QS0L7DiAIheaZPaF+K2k=;
 b=ZsOGdVA4sef4tvqbZ9FWa4SAAwS/SwyP5NVwSonVTAKTazL0nrQZPeP4cY6B4sN1j85p/DVbyRPVpHCXCwgf8SxgqgP4q1+RfXCG5Ss5peg/C+xcWX0Ro/uaCeRVsjzTe6hpJOgPupgoeCuQT0sfrIk3Rh2KKgPGME/Zut2IQi+gqXE5xCt8wkUVpSx/rPK9j5VRvai6zynvGCDqpZbDh0celJki7IATwQabK7mnyjfHE+98sLJng1RecfYxC+EqVAMIsakySTcbsCIauM/17jhQpLzh9wkG+v/OieGUgbFsULAHEBMcLGU9oR8dfGDQ8H09glkO9oBD0ANRo/JoVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 0/4] Add Toshiba Visconti AFFINE image processing
 accelerator driver
Thread-Topic: [PATCH v2 0/4] Add Toshiba Visconti AFFINE image processing
 accelerator driver
Thread-Index: AQHYWjoJd/nT+QZfgE+cymkJugszLK0EUOgAgAAwv2A=
Date: Thu, 28 Apr 2022 01:04:44 +0000
X-TSB-HOP2: ON
Message-ID: <TYAPR01MB6201F59EE8154C901CFF7F7892FD9@TYAPR01MB6201.jpnprd01.prod.outlook.com>
References: <20220427132345.27327-1-yuji2.ishikawa@toshiba.co.jp>
 <Ymm9yOsIW4lTjckp@pendragon.ideasonboard.com>
In-Reply-To: <Ymm9yOsIW4lTjckp@pendragon.ideasonboard.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 312a38a9-c5c6-48ca-27e0-08da28b3155c
x-ms-traffictypediagnostic: OSAPR01MB4675:EE_
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-microsoft-antispam-prvs: <OSAPR01MB4675070AC140A01193B0D1F492FD9@OSAPR01MB4675.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +mjKbA/njymJBbol4QqlF6U8md4NyL++bBOLWI7QxykKQ0QoT93Pw18CjrSjGald3JLJhK9oYxzp9PNigI5+O/zkm0/+3aCuhVFsIPuhJyjQkaCdShExHu/rJzyAe5Bkw0L9LP2MV1RgLpTSGTydcOWXRNlG3xgskPAUlAXyQw5qVyMKHaZMSiM3jXkDBhvcEkueTmEYtGhQbd5TcHQUNJtNdGJ13HBT5BW6kKvGdNZNy1npZglO2391/pawRzHxDEkxFPOI+PwDUIXDBTijFi1Gal5g/WHMQ5KedXyOpezJtQclPbIoe3sGhPXfrBmZfVudqAYnpfOlCEVCdx2wc+VTb91S7BKyrcNDP+Lsoy608usP0XFMSWoOIPBCx5FhJMqjE4aFEwzpDKZAog9f6RhVM7WnaOgYV0eCkHMx6F9dmfT4SvdTCJyAq1GrN8pvrkivOmqfiFYUGF7sQH2WiJo4ZEktovH4bGdxwjdO0q5k0x48Dqu7yphJqDRQDvwgjg1bXPSMggjbN0psI9uBwx+XO0UKe45FaceXGyP/ovXDqXlpxg06geIUYj8qyyImt4uWHHjQ47Lv0o8is+8gpHf7Ng7EQzsvA5JW2ivclJIcJbHgNJf6VDWMvfc9h8U3gKmgXDR3oZy4g/W393RGBOR9gutAEs+ur+/ZjX7yHOlbPep/NQEqVRtqaZvlIkTQgqJk86EOfwJDTJC+nJnRtyzn3I8qEagOzW0lEfgPpfj9DeXij73AUceNjhC8NTCdf5JcBke1FKT4PCspwnUCy542kct5krQCscQqTXSLKNg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYAPR01MB6201.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(4326008)(86362001)(316002)(66574015)(52536014)(122000001)(8676002)(66556008)(76116006)(64756008)(33656002)(66946007)(66476007)(5660300002)(186003)(38100700002)(38070700005)(6916009)(83380400001)(2906002)(66446008)(7696005)(71200400001)(508600001)(6506007)(966005)(26005)(55016003)(53546011)(9686003)(7416002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUxLVERNRnlZZjJzOG41WkU0K1phTC9LN2NBMUdvSGJOR3Y0OHlyWEJJM1g3?=
 =?utf-8?B?dXRTMnpERHFPUndybis3SGNKQTEvbkpDbnRRaWJIdE9GRlJuSTA0VHBsVlAz?=
 =?utf-8?B?bGppcTVOYkx2YmVCKytwTEdBaEU4V09Pa3NXUmp0U3MzTkJNdzJudFZHTWkw?=
 =?utf-8?B?T285aTR0Wm9pYitSZXdsc2Z1TktmTUZ0bktyaklHQjJMd2h0Rk5DUzJpazFs?=
 =?utf-8?B?VWhybFZzSU9XVjVwaEh1MWtMczVJVHhPeU9jQXg0dmI1Mkx0NmVhNm9sWHFq?=
 =?utf-8?B?MGtrd0F1UjBITUkvekNaS1BYWVAvV0g2VUtIcUNSQjdqYzJDM0NCWVZrTWRv?=
 =?utf-8?B?cTlmZHFJQ2M3enZQYnBrSXE2WTRDNnVRUVdnNDFKRnRmVzY2eWhaUjc2NFJ5?=
 =?utf-8?B?em8rTHplM0hpZkVzN0VWbkRRMnpyWExTcjBaSW9WWDUzRUpVOFZpNzVvVDhU?=
 =?utf-8?B?SExsdnorSXg2R3FhN2FaU1BiUHdPUzNWODhxdFduK1NzZWJNdnJCN1k2dG5a?=
 =?utf-8?B?TkNIa1pDcmFvUnE2dUV3NGZGNitrZFhaYktlcUtxOGtMWDJ1b0xlZHVCREph?=
 =?utf-8?B?eUszZUFPZkorTTRtL3JrYjRjVCszdW4vaVJ5WFBOVEEwZ3ZGVDV3b2kzVE94?=
 =?utf-8?B?WXd4M0R3ejFsa0ZZV3ZvYTFVYVFMcDlXMm9qK29TWTdKY0FnaDNWL2xrYm9h?=
 =?utf-8?B?TEJScWJzSVlBMldwUkQ2bDErNmJEOW1aQmNZRTFQbUgwM3Z4T1ozVkMvaTM5?=
 =?utf-8?B?bnhtZTJncDFGOVEySnlNVS9zTmtjNnVKakQwY2VnZHpYcFRKcFJHaVEvVnJU?=
 =?utf-8?B?SExxUkd2ODk5T1g0UklGc3Qrdy9BcmcrRStyeFp1Q2pITGVRYXZ5UTRHNXR5?=
 =?utf-8?B?OFd5cnphV2Z0MUxjV0tmRXdpdEtKNFlFNHRmMmpST09xakJJa1lVVlE5YS9L?=
 =?utf-8?B?enpoS0ErZ2l6MzhkMlJKZ1Rld2JvdEJWTkc1TnZ3TmRaK0ZZeTUyeW1wRkk3?=
 =?utf-8?B?VFRNTlpVVVA2SXpiOCtodFhUWXh2NlQ4bDZTOTA3SFRMWk9RSHpZR2s2UXB3?=
 =?utf-8?B?WkhXV2JTVjNaa3dPcnhjdmtYaFdjYXJhOE00Z1Buayt1d1R4THNTN1dxVEp6?=
 =?utf-8?B?SEtvcG5VSysyVXNJVTNNOVpHL3Zyb0dIQWNYWGNVNXlWS0ZSaHBqWmtUUFFk?=
 =?utf-8?B?Q3F3SnJJdm5ieUNxei9hQUFvQ0xqODRQU1pKTGZTR0x5YXR1M0F3encyNnJn?=
 =?utf-8?B?ajE2UGFPcU1jeW9yZlpmTklhUlphL3FzZDVaR2RtOWpoN0thV1N0aHZxd0k2?=
 =?utf-8?B?Q1FzdzdwR0tDTTJ0YXlzUUhCdC9SbDkvWkc1WnZFY2hqa21kOUFya09LOUt4?=
 =?utf-8?B?aHUwUDc1Q1VicWJ4VXFJZVN0OVNTK3d0ZzhIK3l4ZHBGbER1NThPd1VaK2xX?=
 =?utf-8?B?SkxiNmVJOUNKWjNFQkJVR1NHZHlLMWdGZEttcThzRXB1RmozbngyWExRZzZH?=
 =?utf-8?B?THhGZVorcmoxUnF6QmFtRW5mcHJSMUZkRXlJaG40L3VjeERtY0tqR3EzbWJH?=
 =?utf-8?B?Qk1EdEtia1E4L0svVkRKWlpMc2hDOUoyU1h6dHNpTm1QTW5adzg1OXRkUnhs?=
 =?utf-8?B?MWNNKzd5VDJvampoZlNYeUlTNlJ6STd3eWxmaWxSU0dQRlFUemQ0eHVNOTNr?=
 =?utf-8?B?VkJZR0c3U3FmMUpGQVExYWUzRWtyWGZrVk1DNVg0cUc0anV4cGxsbjRQYjhV?=
 =?utf-8?B?WGd1VGR6RnZRM2E3N0RHSVNBZjg2NjdhTlRMemRveklyT0dpdGorL2xFdjVt?=
 =?utf-8?B?WFVtMkRhN3NVaDlub2dRQWlkTzNnem9qMVBzdG5TbTExYzBWVmtRY1YzODhO?=
 =?utf-8?B?TmRONGJvVlc5Nkp5dVZHOEk1UXZHeHlTK2ovdm1DR242Z25NWjVxV2J0OGxK?=
 =?utf-8?B?ZEZ0NS9LYU1CUHJqZmZ1ZEFaWmV5Wk9iN2R0WkpFRmM3UU8rRXlmL0g0dVho?=
 =?utf-8?B?WmdCemlveGNsZkpkcm1qREljZWlrVE9RQWE5SEtNM1VpRTEwZTRDM0x1aFFE?=
 =?utf-8?B?QW8zNTZuOVd2WEV5dGJ3R0hnejlqSko2WVp3c1hCUnJHQ3ZSMVdiMjViV3NL?=
 =?utf-8?B?WVRGNnFpSXZ4TE5CbWlBdFpIVDlIcC91TDRyd0dpZWtLbWdwR2xETHpXWUkw?=
 =?utf-8?B?QkNubXA0VWhJUk9Bb1UyNnRLK25tL3VMQTRQU2NWbll0R3ZFa1cxN1E0Rkxy?=
 =?utf-8?B?Nmp2Vi8yMjZqcnd3MDE2YkN0NmV6NEpMN0prZ3F3cVZSZXR0OVFOV2RUbVFH?=
 =?utf-8?B?M2FMR0hSQzF4c2tKcEpnQ0RlU2xzNGk0eDRad1pXWGh2VDByUTByMllkUUM2?=
 =?utf-8?Q?N0MEVKbSILpgZM/g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6201.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 312a38a9-c5c6-48ca-27e0-08da28b3155c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 01:04:44.8339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CuBsuj57UrToVxHpQZSiucshNQHSCynVkLSERnJKhEtyesMBWrEsoUaYdgfBEsvCUbSHaVeYAe/qOFeY9Ytojj8MI/bfGKmtnbcH5X+ICG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4675
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, sumit.semwal@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnQuDQoNCldlIGhhZCBuZXZl
ciBpbWFnaW5lZCB0aGF0IGFmZmluZSBkcml2ZXIgY2FuIGJlIGEgVjRMMiBkcml2ZXIuDQpBZmZp
bmUgaXMgb25lIG9mIHRoZSBhY2NlbGVyYXRvcnMgaW4gVmlzY29udGksIGFuZCBzb21lIGFjY2Vs
ZXJhdG9ycyByZWNlaXZlL3lpZWxkIG5vbi1waWN0dXJlIGRhdGEuDQpBbHNvLCBhcyB0aGUgb3Jp
Z2luYWwgYWNjZWxlcmF0b3IgZHJpdmVycyB3ZXJlIGltcGxlbWVudGVkIGZvciBrZXJuZWwgNC4x
OS54LCB3ZSB3ZXJlIG5vdCBhd2FyZSBvZiB0aGUgbGF0ZXN0IFY0TDIgYXJjaGl0ZWN0dXJlLg0K
Q3VycmVudGx5LCB3ZSBhc3N1bWUgYWNjZWxlcmF0b3IgZHJpdmVycyBhcmUga2lja2VkIGluZGl2
aWR1YWxseSwgbm90IGluIGFuIGltYWdlIHByb2Nlc3NpbmcgcGlwZWxpbmUsIHRoZXJlZm9yZSBz
aW1wbGUgbWlzYyBkcml2ZXIgaXMgZW5vdWdoIHNvbHV0aW9uLg0KDQpJcyB0aGVyZSBhbnkgbWVt
b3J5LXRvLW1lbW9yeSBkcml2ZXIgc2FtcGxlL3NrZWx0b24gdG8gYnJpbmcgbWUgYmV0dGVyIHVu
ZGVyc3RhbmRpbmc/DQoNCkJlc3QgcmVnYXJkcywNCll1amkNCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAyOCwgMjAyMiA3OjA0IEFN
DQo+IFRvOiBpc2hpa2F3YSB5dWppKOefs+W3nSDmgqDlj7gg4peL77yy77yk77yj4pah77yh77yp
77y077yj4peL77yl77yh6ZaLKQ0KPiA8eXVqaTIuaXNoaWthd2FAdG9zaGliYS5jby5qcD4NCj4g
Q2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBpd2FtYXRzdSBub2J1aGlybyjl
sqnmnb4g5L+h5rSLIOKWoe+8s++8tw0KPiDvvKPil6/vvKHvvKPvvLQpIDxub2J1aGlybzEuaXdh
bWF0c3VAdG9zaGliYS5jby5qcD47IFN1bWl0IFNlbXdhbA0KPiA8c3VtaXQuc2Vtd2FsQGxpbmFy
by5vcmc+OyBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ow0KPiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7DQo+IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsNCj4gbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMC80XSBBZGQgVG9zaGliYSBWaXNjb250aSBBRkZJTkUgaW1h
Z2UgcHJvY2Vzc2luZw0KPiBhY2NlbGVyYXRvciBkcml2ZXINCj4gDQo+IEhpIFl1amksDQo+IA0K
PiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4gSXQncyBuaWNlIHRvIHNlZSBjb250cmlidXRpb25z
IGZyb20gVG9zaGliYSBpbiB0aGUgaW1hZ2UNCj4gYWNjZWxlcmF0aW9uIGRvbWFpbiA6LSkNCj4g
DQo+IEknbGwgc3RhcnQgd2l0aCBhIGhpZ2gtbGV2ZWwgcXVlc3Rpb24gYmVmb3JlIGRpdmluZyBp
bnRvIGRldGFpbGVkIHJldmlldy4gV2h5IGlzDQo+IHRoaXMgaW1wbGVtZW50ZWQgaW4gZHJpdmVy
cy9zb2MvIHdpdGggYSBjdXN0b20gdXNlcnNwYWNlIEFQSSwgYW5kIG5vdCBhcyBhDQo+IFY0TDIg
bWVtb3J5LXRvLW1lbW9yeSBkcml2ZXIgPw0KPiANCj4gT24gV2VkLCBBcHIgMjcsIDIwMjIgYXQg
MTA6MjM6NDFQTSArMDkwMCwgWXVqaSBJc2hpa2F3YSB3cm90ZToNCj4gPiBUaGlzIHNlcmllcyBp
cyB0aGUgQUZGSU5FIGltYWdlIHByb2Nlc3NpbmcgYWNjZWxlcmF0b3IgZHJpdmVyIGZvciBUb3No
aWJhJ3MNCj4gQVJNIFNvQywgVmlzY29udGlbMF0uDQo+ID4gVGhpcyBwcm92aWRlcyBEVCBiaW5k
aW5nIGRvY3VtZW50YXRpb24sIGRldmljZSBkcml2ZXIsIE1BSU5UQUlORVIgZmlsZXMuDQo+ID4N
Cj4gPiBUaGUgc2Vjb25kIHBhdGNoICJzb2M6IHZpc2NvbnRpOiBBZGQgVG9zaGliYSBWaXNjb250
aSBpbWFnZSBwcm9jZXNzaW5nDQo+IGFjY2VsZXJhdG9yIGNvbW1vbiBzb3VyY2UiDQo+ID4gaXMg
Y29tbW9ubHkgdXNlZCBhbW9uZyBhY2NsZXJhdG9yIGRyaXZlcnMgKGFmZmluZSwgZG5uLCBkc3Bp
ZiwgcHlyYW1pZCkuDQo+ID4NCj4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gWXVqaQ0KPiA+DQo+ID4g
WzBdOg0KPiA+DQo+IGh0dHBzOi8vdG9zaGliYS5zZW1pY29uLXN0b3JhZ2UuY29tL2FwLWVuL3Nl
bWljb25kdWN0b3IvcHJvZHVjdC9pbWFnZS0NCj4gPiByZWNvZ25pdGlvbi1wcm9jZXNzb3JzLXZp
c2NvbnRpLmh0bWwNCj4gPg0KPiA+ICAgZHQtYmluZGluZ3M6IHNvYzogdmlzY29udGk6IEFkZCBU
b3NoaWJhIFZpc2NvbnRpIEFGRklORSBpbWFnZQ0KPiA+ICAgICB2MSAtPiB2MjoNCj4gPiAgICAg
ICAtIE5vIHVwZGF0ZQ0KPiA+DQo+ID4gICBzb2M6IHZpc2NvbnRpOiBBZGQgVG9zaGliYSBWaXNj
b250aSBpbWFnZSBwcm9jZXNzaW5nIGFjY2VsZXJhdG9yIGNvbW1vbg0KPiBzb3VyY2UNCj4gPiAg
ICAgdjEgLT4gdjI6DQo+ID4gICAgICAgLSBhcHBseSBjaGVja3BhdGNoLnBsIC0tc3RyaWN0DQo+
ID4NCj4gPiAgIHNvYzogdmlzY29udGk6IEFkZCBUb3NoaWJhIFZpc2NvbnRpIEFGRklORSBpbWFn
ZSBwcm9jZXNzaW5nIGFjY2VsZXJhdG9yDQo+ID4gICAgIHYxIC0+IHYyOg0KPiA+ICAgICAgIC0g
YXBwbHkgY2hlY2twYXRjaC5wbCAtLXN0cmljdA0KPiA+ICAgICAgIC0gcmVuYW1lIGh3ZF9BRkZJ
TkVfeHh4eCB0byBod2RfYWZmaW5lX3h4eHgNCj4gPg0KPiA+ICAgTUFJTlRBSU5FUlM6IEFkZCBl
bnRyaWVzIGZvciBUb3NoaWJhIFZpc2NvbnRpIEFGRklORSBpbWFnZSBwcm9jZXNzaW5nDQo+IGFj
Y2VsZXJhdG9yDQo+ID4gICAgIHYxIC0+IHYyOg0KPiA+ICAgICAgIC0gTm8gdXBkYXRlDQo+ID4N
Cj4gPiBDaGFuZ2UgaW4gVjI6DQo+ID4gICAtIGFwcGx5IGNoZWNrcGF0Y2gucGwgLS1zdHJpY3QN
Cj4gPiAgIC0gcmVuYW1lIGh3ZF9BRkZJTkVfeHh4eCB0byBod2RfYWZmaW5lX3h4eHgNCj4gPg0K
PiA+IFl1amkgSXNoaWthd2EgKDQpOg0KPiA+ICAgZHQtYmluZGluZ3M6IHNvYzogdmlzY29udGk6
IEFkZCBUb3NoaWJhIFZpc2NvbnRpIEFGRklORSBpbWFnZQ0KPiA+ICAgICBwcm9jZXNzaW5nIGFj
Y2VsZXJhdG9yIGJpbmRpbmdzDQo+ID4gICBzb2M6IHZpc2NvbnRpOiBBZGQgVG9zaGliYSBWaXNj
b250aSBpbWFnZSBwcm9jZXNzaW5nIGFjY2VsZXJhdG9yDQo+ID4gICAgIGNvbW1vbiBzb3VyY2UN
Cj4gPiAgIHNvYzogdmlzY29udGk6IEFkZCBUb3NoaWJhIFZpc2NvbnRpIEFGRklORSBpbWFnZSBw
cm9jZXNzaW5nDQo+ID4gICAgIGFjY2VsZXJhdG9yDQo+ID4gICBNQUlOVEFJTkVSUzogQWRkIGVu
dHJpZXMgZm9yIFRvc2hpYmEgVmlzY29udGkgQUZGSU5FIGltYWdlIHByb2Nlc3NpbmcNCj4gPiAg
ICAgYWNjZWxlcmF0b3INCj4gPg0KPiA+ICAuLi4vc29jL3Zpc2NvbnRpL3Rvc2hpYmEsdmlzY29u
dGktYWZmaW5lLnlhbWwgfCAgNTMgKysNCj4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAyICsNCj4gPiAgZHJpdmVycy9zb2MvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4gPiAgZHJpdmVycy9zb2MvTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4gPiAgZHJpdmVycy9zb2MvdmlzY29u
dGkvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgICA3ICsNCj4gPiAgZHJpdmVycy9zb2Mvdmlz
Y29udGkvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICA4ICsNCj4gPiAgZHJpdmVycy9zb2Mv
dmlzY29udGkvYWZmaW5lL01ha2VmaWxlICAgICAgICAgIHwgICA2ICsNCj4gPiAgZHJpdmVycy9z
b2MvdmlzY29udGkvYWZmaW5lL2FmZmluZS5jICAgICAgICAgIHwgNDUxDQo+ICsrKysrKysrKysr
KysrKysrKw0KPiA+ICBkcml2ZXJzL3NvYy92aXNjb250aS9hZmZpbmUvaHdkX2FmZmluZS5jICAg
ICAgfCAyMDYgKysrKysrKysNCj4gPiAgZHJpdmVycy9zb2MvdmlzY29udGkvYWZmaW5lL2h3ZF9h
ZmZpbmUuaCAgICAgIHwgIDgzICsrKysNCj4gPiAgZHJpdmVycy9zb2MvdmlzY29udGkvYWZmaW5l
L2h3ZF9hZmZpbmVfcmVnLmggIHwgIDQ1ICsrDQo+ID4gIGRyaXZlcnMvc29jL3Zpc2NvbnRpL2lw
YV9jb21tb24uYyAgICAgICAgICAgICB8ICA1NSArKysNCj4gPiAgZHJpdmVycy9zb2MvdmlzY29u
dGkvaXBhX2NvbW1vbi5oICAgICAgICAgICAgIHwgIDE4ICsNCj4gPiAgZHJpdmVycy9zb2Mvdmlz
Y29udGkvdWFwaS9hZmZpbmUuaCAgICAgICAgICAgIHwgIDg3ICsrKysNCj4gPiAgZHJpdmVycy9z
b2MvdmlzY29udGkvdWFwaS9pcGEuaCAgICAgICAgICAgICAgIHwgIDg4ICsrKysNCj4gPiAgMTUg
ZmlsZXMgY2hhbmdlZCwgMTExMSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvdmlzY29udGkvdG9z
aGliYSx2aXNjb250aS1hZmZpbmUNCj4gPiAueWFtbCAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvc29jL3Zpc2NvbnRpL0tjb25maWcgIGNyZWF0ZSBtb2RlDQo+ID4gMTAwNjQ0IGRyaXZlcnMv
c29jL3Zpc2NvbnRpL01ha2VmaWxlICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBkcml2ZXJzL3Nv
Yy92aXNjb250aS9hZmZpbmUvTWFrZWZpbGUNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvc29jL3Zpc2NvbnRpL2FmZmluZS9hZmZpbmUuYw0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9zb2MvdmlzY29udGkvYWZmaW5lL2h3ZF9hZmZpbmUuYw0KPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9zb2MvdmlzY29udGkvYWZmaW5lL2h3ZF9hZmZpbmUuaA0KPiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvdmlzY29udGkvYWZmaW5lL2h3ZF9hZmZpbmVf
cmVnLmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL3Zpc2NvbnRpL2lwYV9j
b21tb24uYyAgY3JlYXRlIG1vZGUNCj4gPiAxMDA2NDQgZHJpdmVycy9zb2MvdmlzY29udGkvaXBh
X2NvbW1vbi5oICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBkcml2ZXJzL3NvYy92aXNjb250aS91
YXBpL2FmZmluZS5oDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy92aXNjb250
aS91YXBpL2lwYS5oDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFy
dA0K

