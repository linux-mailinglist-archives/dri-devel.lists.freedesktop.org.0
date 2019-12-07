Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8E81169F4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8606E359;
	Mon,  9 Dec 2019 09:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770095.outbound.protection.outlook.com [40.107.77.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095E16E20F
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 18:45:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkbKAV9nE88sjDPOpf7fiL16/OWV6aona4mUIW33yJdQGjF/uMfg8NTLU+sGhntncK9gvDlJW4Z1vv401jcTGxRY8BbpjJbLRwtTHmd5a7BPehSYrZ0kcjsnSnhTXqR31BVGFuf0MsnWbXWOORUhN0sooFnwS4kZbkiw8nSnfILldiUbRzDHYrPlsNL/DL5IORtv+m8GW/FOyYPGTndVH+O6DhBAvtapK+qKf7EJwuICPC1xJEdbq0ccvom5/qkfKDz6V56ftZP19Bl2gHGE1jBAG1rsSdlsrN5LxvNE/gbzbtcpq6pfNnS1Oo2hevArN7wudb+6RsySoqTpg5MCIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=543H2LkNliSsJFfScz4bw5i6VEXYTiYQIcRJThnxA4A=;
 b=BHI9a401lpwV4oSB65y4gY0AtwypcqEBvMP73rHXB0xhUwReK42w9KxriYf7OF0pULtHrcJ7/f8RsPSV0tzv2rVWt3myV6v9jix/BmYrSLGW5vumbrbriCwNt1bA3rBYV9W8u1N6wehL4BxuNW8ZUfNMCuMfZE03NovOZ04D3Fh/b1KFhUyN8h7ZrPvIHY6UQI48cHcmR4lV3eiSPFUHso853tgusC8j2OV1+Vv6G/TOcz+0ZAj51vGYNpJuypyp9n8FXCce49ARNwMug6r1L8ODVrG0hsjtCT218Rbs/XCaR3gGWEuD9yn00Cf00a4d4HP7Rbi9ca/6coW3jookWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from CY4PR21MB0629.namprd21.prod.outlook.com (10.175.115.19) by
 CY4PR21MB0741.namprd21.prod.outlook.com (10.173.189.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.3; Sat, 7 Dec 2019 18:45:30 +0000
Received: from CY4PR21MB0629.namprd21.prod.outlook.com
 ([fe80::ed94:4b6d:5371:285c]) by CY4PR21MB0629.namprd21.prod.outlook.com
 ([fe80::ed94:4b6d:5371:285c%4]) with mapi id 15.20.2516.003; Sat, 7 Dec 2019
 18:45:29 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Colin King <colin.king@canonical.com>, KY Srinivasan <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger
 <sthemmin@microsoft.com>, Sasha Levin <sashal@kernel.org>, Bartlomiej
 Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>
Subject: RE: [PATCH][next] video: hyperv: hyperv_fb: fix indentation issue
Thread-Topic: [PATCH][next] video: hyperv: hyperv_fb: fix indentation issue
Thread-Index: AQHVmxDKZML+qQStOkW0VXMY7bFvUqevJqBw
Date: Sat, 7 Dec 2019 18:45:29 +0000
Message-ID: <CY4PR21MB0629CD9D4B8FFAD1AE685C10D75E0@CY4PR21MB0629.namprd21.prod.outlook.com>
References: <20191114172720.322023-1-colin.king@canonical.com>
In-Reply-To: <20191114172720.322023-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-07T18:45:27.9353183Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=00eb9548-a232-4731-99e6-d5da4ac9b67f;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8c804d41-0b5d-4bee-a9a2-08d77b45a21a
x-ms-traffictypediagnostic: CY4PR21MB0741:|CY4PR21MB0741:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR21MB0741B940373EBE3D805147DCD75E0@CY4PR21MB0741.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:635;
x-forefront-prvs: 0244637DEA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(346002)(39860400002)(376002)(366004)(189003)(199004)(8990500004)(316002)(66946007)(5660300002)(33656002)(186003)(66476007)(110136005)(8936002)(54906003)(52536014)(26005)(229853002)(66556008)(66446008)(10090500001)(4744005)(81166006)(8676002)(81156014)(64756008)(10290500003)(86362001)(9686003)(71200400001)(76176011)(71190400001)(4326008)(99286004)(2906002)(7696005)(76116006)(74316002)(6506007)(55016002)(478600001)(102836004)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR21MB0741;
 H:CY4PR21MB0629.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: giADaz7nzTN7arVkco24/gVnVkWjjl2Ct0JJuZVq1azU2xduvJvtELwK8SUvdNargEohW5YSqsK0dL00dvgcyq8JKHIDO/thNgMEC/QjC200owvLEJfKll8RCuagislYpUas8auo2VWWl5we2GjF+LtOakz1vSIHXDus0rAVfEN5gmFXuzctbV0uM0fLhjVq4jhPfQiDNiJ7VMdT44ZmzR4kUOb2LfTLcQS3RdY5mFuyrOArv9GEYiyajGLvAqqKQWsViwOD5KKOO/XtkUakjsBTzUEUsG1yyutpKtLGyp4Ttf45Be+TiRS5/cSFfH+TsyJX8a7y4sHZsTEeGYFbSaW3XLnNrj6swBhGFpbo8qxQkfxhkZedwzO4pPI9U79UeAq+o5s0v5TSyPFA1nzPGqC2T8DXatG+jU3ZAgub6jRIx1Psdk+pf6o11MQ1k/oA
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c804d41-0b5d-4bee-a9a2-08d77b45a21a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2019 18:45:29.7521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jX3rwiPavfyDCoK3pKc2rPkqMgRsT7MuskEADWC/w/wAS+r+312nFdnqTAFGhRrP2K3lPy0uSwdmqEN+qNxemMZwVY/7oUjBjFGtMTYx2K8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR21MB0741
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=543H2LkNliSsJFfScz4bw5i6VEXYTiYQIcRJThnxA4A=;
 b=QOeQdcoabhlDRIWsf9cECZKZsCPzlBhC6OYmWgb2ri6Y5/JPHjqcTkwqBrEfx309JZSvWGncEOmMpRnz0GpBEV7lbvOCCmRX7MB6Y6ZfQjDaBJvTqvFiNaSEgPPZUpKSSAM1MmQhhaQsUwm/gA24EZIacs/YstXGsaDTt0rLaL8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4gU2VudDogVGh1
cnNkYXksIE5vdmVtYmVyIDE0LCAyMDE5IDk6MjcgQU0NCj4gDQo+IFRoZXJlIGlzIGEgYmxvY2sg
b2Ygc3RhdGVtZW50cyB0aGF0IGFyZSBpbmRlbnRlZA0KPiB0b28gZGVlcGx5LCByZW1vdmUgdGhl
IGV4dHJhbmVvdXMgdGFicy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxj
b2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy92aWRlby9mYmRldi9o
eXBlcnZfZmIuYyB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5
cGVydl9mYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9oeXBlcnZfZmIuYw0KPiBpbmRleCA0Y2Qy
N2U1MTcyYTEuLjVmY2Y0YmRmODVhYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRl
di9oeXBlcnZfZmIuYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jDQo+
IEBAIC01ODIsOCArNTgyLDggQEAgc3RhdGljIGludCBzeW50aHZpZF9nZXRfc3VwcG9ydGVkX3Jl
c29sdXRpb24oc3RydWN0IGh2X2RldmljZQ0KPiAqaGRldikNCj4gIAl0ID0gd2FpdF9mb3JfY29t
cGxldGlvbl90aW1lb3V0KCZwYXItPndhaXQsIFZTUF9USU1FT1VUKTsNCj4gIAlpZiAoIXQpIHsN
Cj4gIAkJcHJfZXJyKCJUaW1lIG91dCBvbiB3YWl0aW5nIHJlc29sdXRpb24gcmVzcG9uc2VcbiIp
Ow0KPiAtCQkJcmV0ID0gLUVUSU1FRE9VVDsNCj4gLQkJCWdvdG8gb3V0Ow0KPiArCQlyZXQgPSAt
RVRJTUVET1VUOw0KPiArCQlnb3RvIG91dDsNCj4gIAl9DQo+IA0KPiAgCWlmIChtc2ctPnJlc29s
dXRpb25fcmVzcC5yZXNvbHV0aW9uX2NvdW50ID09IDApIHsNCj4gLS0NCj4gMi4yMC4xDQoNClJl
dmlld2VkLWJ5OiBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT4NCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
