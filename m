Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228DFCF3BE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338666E1E9;
	Tue,  8 Oct 2019 07:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092072030.outbound.protection.outlook.com [40.92.72.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C7288610
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 16:42:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiiYjMgCwxTFUMMC6QTH3enU61y7z4pl/PcDqUk3e6AqDYJOsQBQJN10xV+jo1cP1pW8HGFDrgr7M+pApzUQOQjPdceA6g02QO7oNi9LPCf9jqX1DgmlmfFwdD2dUqnqKEIVClX/LIeuAQ+zTzdrYDd3dPBDop2A27Tc0f2v600mCOIBtgMeoBSWw2BjeO86P/hC2wLwFZHi4PxKnpBusFhduKV/6C1151EtOaB7BN67OnH/LxxsUi2RQ8QMQscqSCDc5PIun+Nmqj+e7BlB8llcj4IVnUM4OYNhL42VwiYcrBQ4AHqLOFAKqKMk2zCDpXzvj4Uxs5Gc5nF+5qry8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLtlqlpaERP3KxtYDrJzgVsPX8VjMW6DC7xVuER3j08=;
 b=afxg3cgX9G7ioJ1eE3xZ45jRVQ9SlDx5lcj/CQ8JLCM9m6+X/lhCwpl0CMieU/JfKEy4VFyBadDPfaQZSGzUcXm7TEO+DrploAKfIDizGgAGsaMI2B5aMX+2JPr0SrKkQF70BEdZM0EClHltYrqF91KknOOlwVlkI5isE9Vqfk4PTHM9x0UxoCpgvmklFRa02SRwfGRgduXEGHSXXlodUDaidXQRZLf029XlWlJYzDUCYy+q21L6cL5BJBqAQDCyYb7k63LD47xz3ZdlTWMbDUSPNNOjBXqP1u4OHdJUqef1h6T6BPiSdNC0iuN6Lve92CNKyMVf0BhcC3PP5t4Gwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (10.152.16.53) by AM5EUR03HT240.eop-EUR03.prod.protection.outlook.com
 (10.152.17.157) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15; Mon, 7 Oct
 2019 16:41:58 +0000
Received: from DB7PR08MB3801.eurprd08.prod.outlook.com (10.152.16.52) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 7 Oct 2019 16:41:58 +0000
Received: from DB7PR08MB3801.eurprd08.prod.outlook.com
 ([fe80::c487:5369:d008:ab32]) by DB7PR08MB3801.eurprd08.prod.outlook.com
 ([fe80::c487:5369:d008:ab32%3]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 16:41:58 +0000
From: David Binderman <dcb314@hotmail.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-5.4-rc2/drivers/video/fbdev/amifb.c:1875: bad expression ?
Thread-Topic: linux-5.4-rc2/drivers/video/fbdev/amifb.c:1875: bad expression ?
Thread-Index: AQHVfS22u8OCmNQ++EKynDbfcV+9ZQ==
Date: Mon, 7 Oct 2019 16:41:57 +0000
Message-ID: <DB7PR08MB38017AC9AEE4B4FC5E2E4FE89C9B0@DB7PR08MB3801.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:692D43F5F7A6CAD2FF9DA41DDE9282A9DB8E8BFCF7567D0778AB4970E3DD9669;
 UpperCasedChecksum:2526605D70D4B03D93795A300BE54F32E0EBE9D930E091DDFD5415D0EA9475DE;
 SizeAsReceived:7045; Count:42
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [vaqMn1OT34Mh183xB8TpA+lR+aISYvBDDA8J1lOa+UIFxilu4jX1NpX05T5IHQWb]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: AM5EUR03HT240:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IckADxSEgOrB85dmye5qlFz+bM3WC7KGUM7TGrrtuRyMVIi1vfGGEij5AUNcPKyAB/ZptvGjvGrfwqr90HozGLPT/Zlisu921jnZAYyZ2sm1THT3rXPH5vhEQS0/nMZKWIjsXVlYokXiX43uYcBVjTlwvh88F6yL3kjOK67Wydfe8XggsdvHOvMGbSNuOG1s
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9853630c-cd1a-447f-71df-08d74b454524
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 16:41:57.9088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT240
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hotmail.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLtlqlpaERP3KxtYDrJzgVsPX8VjMW6DC7xVuER3j08=;
 b=pIiUMcyZks4XcyKkTmHxm4DIqHiDl4It9Pv7lVEC1BxM1IFcVFTDAsPrhHbPBMngpIrXCQgOx1zhaPn6WGPLFfONNDF8B0cyPLAPKvRxAHs7973kb5pI0Iz1NvODvpWfVfTFoZjcfL7JmuzMG+mNch93D1jHYJoGq8a5j5x/wa/2uI3SpUhf7HwaPg/ub/hDMHG+CEswx4FNmnXrr9n8ufyY8Ded9GJ9qQsjKIxyb5SlrAa2v04qrQzljSTmiGbwx7VWWc23NxZcazyVMUcxheRqyhNykOYIdCPjuHCB61X19ikGb49YSpoUITd27Fubm9VVpOe0Hfdyj1hiN8b3eg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gdGhlcmUsCgpsaW51eC01LjQtcmMyL2RyaXZlcnMvdmlkZW8vZmJkZXYvYW1pZmIuYzox
ODc1OjQxOiBlcnJvcjogRXhwcmVzc2lvbiAnKCoobHNwcitkZWx0YSk8PDE2KXwoKmxzcHIrKykn
IGRlcGVuZHMgb24gb3JkZXIgb2YgZXZhbHVhdGlvbiBvZiBzaWRlIGVmZmVjdHMgW3Vua25vd25F
dmFsdWF0aW9uT3JkZXJdCgpTb3VyY2UgY29kZSBpcwoKICBkYXRhd29yZHMgPSAoKihsc3ByICsg
ZGVsdGEpIDw8IDE2KSB8ICgqbHNwcisrKTsKCk1heWJlIGJldHRlciBjb2RlOgoKICBkYXRhd29y
ZHMgPSAoKihsc3ByICsgZGVsdGEpIDw8IDE2KSB8ICgqbHNwcik7CiAgKytsc3ByOwoKUmVnYXJk
cwoKRGF2aWQgQmluZGVybWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
