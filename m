Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD30280C623
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 11:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAE910E3B9;
	Mon, 11 Dec 2023 10:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFA710E3C4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 10:12:51 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BB8HtRp019705; Mon, 11 Dec 2023 10:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=Nkok8XC2iTGXvRalUaJWACArOTUZixFMS2OaDtpP3yY=; b=
 I7hjxxt6V8JmCs5yplG712+ELOfjuL1a745frIhGXWxOU1TFxtegucJ+BhqVy/vd
 PctA4KCTKOJrSqaK2hBxkkFhXmIeGfFFtRuHPjdc6CBeyE10eQ1DayYNRXWO9W7t
 Xbq3syJVRPTYdyp7Bcm4yWX0GOnr/DWEnJn0eB+bwJyn9F5zCmmnJFfjuC07+qDK
 4cvxNkYQUazN/LIkATLofbjBkDanEbS5QvyLTTL7p6jU3tva/xwJryqpo3ocEIdo
 LKGm5inrd3xjuQh3In/hVxACvex9zFRm17BcyQqK6g37TLpYGBeh+A2EeYQCh7s9
 MW/3c1ou5ZRu9NkUYMpYSg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3uvfcs942v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 11 Dec 2023 10:12:34 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 10:12:33 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 10:12:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajZ2cvhyMpB3CtLmpqAT688nxj2RAITWlhLh8hWaynSy1P/VXS3+vliKxbG8daj2sAOhkQAYIou3/Sp7zWggA55KUx6RWQkPGygbw1RNLWbWzGs/1+Lw1J148Bwnyb0tfQ//xGBYDdDthYnQVy1Tk0ytwGXOiaAwremcQPhmMr+dVLx+xx2C12OrYof/eJyvtpFXJgwH6KRSR50mWk2iQ055v3CId8zjY1CtQpaawSVHI2XeW/QfWrurpRZ356rX+s6xsf1y48JEvr31GlCDCjoRXfI5PLCT54AOanQleWOgnNvMkHuqweJPSQ01ekpF5quqUGF5gxKexkvaWSzYuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nkok8XC2iTGXvRalUaJWACArOTUZixFMS2OaDtpP3yY=;
 b=BDZPpxTk4e/z4AAtmu5ajEIpOxWkN0B5r/wuEBo2ftsU2/Fr06o6gGdbJM3ZTNw3ka33pUEf7/c1WW3Bfjrz93MiNfS8HE6Nc/2a0nSAUiuCxEGrXxAaLHn6fKsLzgkmv/t8GCW3XejxgNSzj1vsIh40cvOP55soRAuj7ysyLhlkOGNxGon0Zn9vQqEejYVcOKItAxR8Nlcj87flKvPnfTAYEcR5/ZZgrPzcHbzDVS0Ib8Sv+qrBzYpoaBjMfqXr4ZEnUNIHxe1Tk9RPxlu/f7IOa4d/1D1uloMuKFpA6l4A5RRvcM4nYCYKGn19vA+t5BOz2ur1+bshzcpfdpKTpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nkok8XC2iTGXvRalUaJWACArOTUZixFMS2OaDtpP3yY=;
 b=rd/MIwErwwpq/p39h9HiN8jZRooTfdKY1kZNRUKUtW2DiUF7j5CIc8eN7sSsn2WhyCwfo5Xf53g5G4s/EiuKEXwF4QWN137UiZIT6oex1yjhu6aP1V9l58tlJz27MquS2pqITvjBoQV9PuF/d71siA2OeDFMNukLRda5mtaBWVo=
Received: from LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:23c::11)
 by CWXP265MB5154.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:195::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 10:12:30 +0000
Received: from LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a3f5:aa1a:ff75:79a2]) by LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a3f5:aa1a:ff75:79a2%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 10:12:30 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: Frank Binns <Frank.Binns@imgtec.com>, "knaerzche@gmail.com"
 <knaerzche@gmail.com>, Matt Coster <Matt.Coster@imgtec.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/imagination: vm: Fix heap lookup condition
Thread-Topic: [PATCH] drm/imagination: vm: Fix heap lookup condition
Thread-Index: AQHaLBqMKZG3Q71Cr0OoYFH7Tl3kmA==
Date: Mon, 11 Dec 2023 10:12:30 +0000
Message-ID: <bd44e6e66db23505c0275b14805e711e3a75b4d1.camel@imgtec.com>
References: <20231208170856.1748413-1-knaerzche@gmail.com>
In-Reply-To: <20231208170856.1748413-1-knaerzche@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO2P265MB4600:EE_|CWXP265MB5154:EE_
x-ms-office365-filtering-correlation-id: 1564873e-8597-4abf-c83a-08dbfa31af23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0fKfmbDLPWqSzbn+S+9jk/X7mzdzyCQr4bKnxix9d/IvPhQOxUZfIymBbhUNjV8JsILeEL8To9yp3Jh5NBYJjK0LZj0yy/QMVAq1kfyyqe1KqBllx1zPYSZ2HUPjoOyblgaHY5E+l7bL+/KE7FUGhvuquJACShPPY4OVnJflVo+Q33A3nC62pThupDiUK2X0fmnBdpOmDPYq+PLte6wEY/VfjR/vzdqIzp8Pen/WdHwRqVRW1lBxjAFjdX2tkRnozLOPBo3nMdMLgB0eispZq4GGfZlHKgPR3X5RkvSO08ckMfBWV1aYuKjXeodtMA7vvg1CvmZT1D1jXJaBRjWdIZP+FZ72wHv13VDSwYgY29Tq7SzeFO1Gg1qCnQxZP9Uha4Tk4GbOWel8ZQkBtdOk+rYsDOTr6tmuMSjR4ccmg1IhRzQ6fT0hwgq6LLfW+LyhlMQrcRyQYCMWOqpRuK7t/9CjMgU8661hUMo+ambe3lMgU6jjrm3bUg3p3ihNHbHrZI9F8LMvtNyGuvfmH1izIz62lKXnx1JfqIlU5w45UuLwv4Zv3ag4Ofv6UNFZDvf887IVADhuoYqJs7WxAV8NRnRrHADV/3jFeEJk+od/4hFMN2WVUr/3UT2xNZ19+bYBovPAajdwWP1xR0SZ90M0NFAgmr1TLDS0ckbgi91rjUQ6AesBY224ZS5ACRfDJj68/+6wL322KMkFI/vl3pYHTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39840400004)(366004)(346002)(136003)(230922051799003)(230273577357003)(230173577357003)(451199024)(1800799012)(186009)(64100799003)(6512007)(2616005)(26005)(6486002)(71200400001)(478600001)(6506007)(122000001)(76116006)(83380400001)(5660300002)(2906002)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(41300700001)(316002)(4326008)(8676002)(8936002)(110136005)(38100700002)(38070700009)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVRRWlhkWXBPR3FwYWpvUVhMNDJZLytUMmQ3V1FnaGFlSkdMSFZEV3VFcHJi?=
 =?utf-8?B?UWE4cnE0MDNQblA1MUZTQjN1S0pxS3pNWkVWWDNRRmM3eGlyMmUxcXRqNSsr?=
 =?utf-8?B?V1h4K3RGLy9rWUJ5VElZb0JmMGhWaFJoR2YvOE1hNTNKNlA1QTF2VWJWeGJE?=
 =?utf-8?B?WnRYclFoWjhHUVNGanJGb2lpTkxLQlNRY2JQZE44RWxVanNsR3dvaG9lU3RX?=
 =?utf-8?B?U1RuUytzYlFNRHF1NlErUjBkTkZ1emxIclhSblQzKys0aUoweE9OSDlNK0tX?=
 =?utf-8?B?dTd3VmdNUHBzdyt6MFR1MFVTVW9vMWtZa25hZXRRWDdIVE5uVlFOL1A2RWJ2?=
 =?utf-8?B?a1BCMlQwMXgwQm1LaFdKcjdHbjhEZi9SaCtLWm5ieFprVDNmbjN5TGdTUlFr?=
 =?utf-8?B?SXNDZmxUVGRBUFRZZnRzNFhwK0pjNGhNemhmYTNrZTVha2tITWpSNDJuc0Jm?=
 =?utf-8?B?d1BHZ1QvVHUrc0h0WGUrQXdrNDNRQTBNdG9TMDczaE4wdVR3N3JVK2liOWFw?=
 =?utf-8?B?UVRwUXhwMXgwZk9PNUszQk5KWmljSklCZzRmcFllcnVPald0MmRYMnZndWYr?=
 =?utf-8?B?Y3E4MHpyVWdsWHE1Q0VqUEF4M3c2OU80NWtGZzBRVkhnUWtXMUxsKzlNcjUz?=
 =?utf-8?B?cjdFQjhlejRjWmtCUjM5RXNaVkhGcmZFdGEwbHUvNCtPYnRQR3FYZmpyZzZZ?=
 =?utf-8?B?dUtKNjhKNGs3OXJRY0luejFXbEVuYitQcHJ3YUlyWThrQklaRy9RVzRtRHli?=
 =?utf-8?B?OXZpU1g2dHE4bWdrbUljbTlkbDRTcnFxbWVMcVkvc250QWFjdUZVOEV5NitJ?=
 =?utf-8?B?aHRnZk5oZ1RrM3dEVHFRblU4ajFCNTZvOUxPc3VhR3pYYnlwRmZsVHRnVkJm?=
 =?utf-8?B?dVJPcWVMZWkvb3I2R1JPb2laU2o0c09uK2lUYXUxRms4UG1jY1c2dEFjMlZz?=
 =?utf-8?B?TkxveTBuYzhxZUtXZ2d5RHo5TmZtYW5JcTRmeWk5dFlxbEFxQWovbVdzaHo1?=
 =?utf-8?B?TnZ6WXFZa0ZLakZCMGlHdXVjTTFZbHJDMEg0ODI4VWtmK010S0graGhJTndN?=
 =?utf-8?B?VXVla1ZURGVKSkp5bW9iK3hoUlhhSXBhdmtkVEF3NlFORXlvTWlFU1V5YXZU?=
 =?utf-8?B?SlJLbjE2RE5GeXR3N094ZzdBZ3BBSkVHWVF6YUpIdGFTTnB0dmZpVC9sTmhC?=
 =?utf-8?B?UnhmYmxLTHdyQ2w0b09iem85cDlnS3ltb05OWFI2eGFab0kzek91VDA0YTJB?=
 =?utf-8?B?T1RENzhYSnpmRmxsa1RhZ2dUNXJ3bUJEYUY4M2Z5VHkrOGh4NEJmeG9CL1hm?=
 =?utf-8?B?eFVVOVVVK0lOUU1jak9SbEduVWtONFFJRFoyd25ZTVM2TUZtU3c4amZjSzVj?=
 =?utf-8?B?T25ZZDZ0QTBaQk5vMFI4WEF4ZC9XdGlranpUMDR6dGJpNTJtcjVKMjNGcGtz?=
 =?utf-8?B?YW1sVVhpV3o4eFdZamdpSTJTem1qZ1E4M0lTSkEyVTJudlIwVDlMWlBYRTcr?=
 =?utf-8?B?TDN0S2xDbkY0YTJ1YWxTRXhSandjMGJBem9UVm9xNTZqRVAyODl2THh1QkFn?=
 =?utf-8?B?Nkw4eDNBdzVqNzdqL05CcXhuMUNsMmNVWmFtckJlU2hIVitqMk5laThmTjFu?=
 =?utf-8?B?eCt6NFdaQ1RnS04zZGRSRTlVLzdjalFXTDdqaGdadTlETmFkdFJBcHJHdVhn?=
 =?utf-8?B?NjVwWnlRK3ZxQzBmTVp3QjRBcmQ3dlp0T2JaY0NpYnZGdS9hNUQvYWlvV0J4?=
 =?utf-8?B?NFhoa21zeHlaNVRZZlRyai9jYlNWT2x2NHFoY2dRcmJrVUZYMXlJKzlKMTc2?=
 =?utf-8?B?YVNQTzZEL0lNWForTjJ1TTh2elc4cEF1ZTZ5RjRMTUFBTTdKRWpnR1RlWjEv?=
 =?utf-8?B?VEpucGxxb1o4dVVzeitvUmJKV3p6NXd5R00xaHRaMzlTWW9aOFRaTWZSSjlr?=
 =?utf-8?B?cVpBVS9MaE4xUDJaYnpRTHJqaG1STVBHNjUrbkdzblRZcGUvb21IU3J5OVpx?=
 =?utf-8?B?bEtzK3BrV3Fpc0VvYWdSY3BYQWdrZFM0S1BvbE1kSDF0dDBqaS9yR1VvZXZH?=
 =?utf-8?B?Q2JvK0FrR2NuWkVyZmJjM1B4U1UvSU9raTdqeVJlYnBYRHVMSDdEQmlLc3lp?=
 =?utf-8?B?VzdPZWlrT1dOS2dma3dOMWNrSmlBUjMxNHMva29sZFY5eHZ5K1QxWWRnTjlO?=
 =?utf-8?B?Z1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2357C6D8B51B184884A9E11328EBC607@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1564873e-8597-4abf-c83a-08dbfa31af23
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 10:12:30.1240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UthJPVeJzbk+rMY9z5yjHtX7Nmjc9hiYWYwve7V5kBtIG3qBEiQH7/GgPNOxzEWQZlflqZLaj42UBIEqDlwgV7LpOlGzVy1yRH1VbGI7DQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5154
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 2HbDZ04FQCYfJELmp5aBVgmkabmcP7Cd
X-Proofpoint-ORIG-GUID: 2HbDZ04FQCYfJELmp5aBVgmkabmcP7Cd
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
Cc: Sarah Walker <Sarah.Walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIEFsZXghDQoNClJldmlld2VkLWJ5OiBEb25hbGQgUm9ic29uIDxkb25hbGQucm9ic29u
QGltZ3RlYy5jb20+DQoNCk9uIEZyaSwgMjAyMy0xMi0wOCBhdCAxODowOCArMDEwMCwgQWxleCBC
ZWUgd3JvdGU6DQo+ICoqKiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZXMgZnJvbSBhIHNv
dXJjZSBub3Qga25vd24gdG8gSW1hZ2luYXRpb24gVGVjaG5vbG9naWVzLiBUaGluayBiZWZvcmUg
eW91IGNsaWNrIGEgbGluayBvciBvcGVuIGFuIGF0dGFjaG1lbnQgKioqDQo+IA0KPiBXaGVuIGNv
bmRpdGlvbmFsbHkgY2hlY2tpbmcgZm9yIGhlYXAgZXhpc3RlbmNlIG9mIGEgY2VydGlhbiBhZGRy
ZXNzIGluDQo+IHB2cl92bV9iaW5kX29wX21hcF9pbml0IHRoZSBjb25kaXRpb24gd2hldGhlciB0
aGUgbWFwIHJlcXVlc3QgY29tZXMgZnJvbSBhDQo+IHVzZXIgaXMgaW5jb3JyZWN0OiBUaGUgY29u
dGV4dCBtdXN0IG5vdCBiZSB0aGUga2VybmVsLWNvbnRleHQgdG8gYmUgYQ0KPiB1c2VyKHNwYWNl
KSBjb250ZXh0IGFuZCBzaG91bGQgYmUgbG9va2VkIHVwIGluIHB2cl9oZWFwcy4NCj4gDQo+IFRo
YXQgbWFrZXMgYWRkcmVzc2VzIGNvbWluZyBmcm9tIHVzZXJzcGFjZSBub3QgYmVpbmcgdmVyZmll
ZCBhZ2FpbnN0IHRoZQ0KPiBkZWZpbmVkIHJhbmdlcyBhbmQgcHJldmVudHMgZmlybXdhcmUgbG9h
ZGluZyBmb3IgbWV0YSBjb3Jlcy4NCj4gDQo+IEZpeGVzOiBmZjVmNjQzZGUwYmYgKCJkcm0vaW1h
Z2luYXRpb246IEFkZCBHRU0gYW5kIFZNIHJlbGF0ZWQgY29kZSIpDQo+IFNpZ25lZC1vZmYtYnk6
IEFsZXggQmVlIDxrbmFlcnpjaGVAZ21haWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pbWFnaW5hdGlvbi9wdnJfdm0uYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pbWFnaW5hdGlvbi9wdnJfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJf
dm0uYw0KPiBpbmRleCBmNDIzNDVmYmU0YmYuLjgyNjkwY2VlOTc4YyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pbWFnaW5hdGlvbi9wdnJfdm0uYw0KPiBAQCAtMjI1LDcgKzIyNSw3IEBAIHB2cl92bV9i
aW5kX29wX21hcF9pbml0KHN0cnVjdCBwdnJfdm1fYmluZF9vcCAqYmluZF9vcCwNCj4gIAkJCXU2
NCBkZXZpY2VfYWRkciwgdTY0IHNpemUpDQo+ICB7DQo+ICAJc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpvYmogPSBnZW1fZnJvbV9wdnJfZ2VtKHB2cl9vYmopOw0KPiAtCWNvbnN0IGJvb2wgaXNfdXNl
ciA9IHZtX2N0eCA9PSB2bV9jdHgtPnB2cl9kZXYtPmtlcm5lbF92bV9jdHg7DQo+ICsJY29uc3Qg
Ym9vbCBpc191c2VyID0gdm1fY3R4ICE9IHZtX2N0eC0+cHZyX2Rldi0+a2VybmVsX3ZtX2N0eDsN
Cj4gIAljb25zdCB1NjQgcHZyX29ial9zaXplID0gcHZyX2dlbV9vYmplY3Rfc2l6ZShwdnJfb2Jq
KTsNCj4gIAlzdHJ1Y3Qgc2dfdGFibGUgKnNndDsNCj4gIAl1NjQgb2Zmc2V0X3BsdXNfc2l6ZTsN
Cg==
