Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 957BF1C4E8C
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7066E50E;
	Tue,  5 May 2020 06:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092073066.outbound.protection.outlook.com [40.92.73.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BFF6E34A;
 Mon,  4 May 2020 08:07:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmoDIckvtUqqThUiBeY5kpuwXBAgBl8y9mRmF28mGrXZzG6ZTgTbllqJ3PWU6eehFRefBPUFQSFaRd/Z+9I1VIG20mmrGCaqzM7oZj9KaHohPS/y0xfJY4e2GcHU1426pnVUkCQohYs9qUJ82qbmiSfKJVbpbnlqgwxoeOGhhIyKeQlE7yEiEtyI8BaTs5riPf/TsKlR1hF7IEqNnbWfWq4lOTpyG7nHS0P/yWuFiOoX352G1L8sSuAuO8k/zhriHR9ToU9JqJOi6oA4EQqowUPSOLJMSRzXDkF+8pwZtRJaBFHTHS0vGIuS3DnTasfsXBEW1S27ufpBaqjq+607XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1zvImE4mgrVE4lvwEihKpslQwsE7lXcmlzjhkFx5Kg=;
 b=RI8Yp3A+hHLh1IA7LCGnFtApVUtTUdEFDvE4Z/PImKCzl4PBPeFVkhbV/NgilIlnhuqRUTfGAcQuMRuVjc7/pVMk1KB+IfdAUg3NLhVjYdxsQAUXEhFqufYEbtx5uU2zuS9pvqrgfkYmRHlYMMbYfB6hnSKZu0SeG+L3QwUwK7zyN1YBLTfvcIDzf8bYTsBiaOEoIFYFN4mtCgrBoV/Eof0cDiV40jc9EVJKlM999P2BQMppfKkLssOnvMbiZwbJhoSmjpUiNnK+sMWlsoSe3Z9IUzRGPdD48Vpcwjz2pTRlPSesCs3PJy+dp9WSuTKGJWGRpw4sKC1AR4ZvV8bVMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1zvImE4mgrVE4lvwEihKpslQwsE7lXcmlzjhkFx5Kg=;
 b=H7yZq02/vVypOsSCWejTJqMQ/98LpVPH/NARPLsZ0rRztd6MaYK5CqS3q+5njTifA11AhzT4Nnv1KoCTcSvZa7EkD6KXPlffN85FCnIKU7Go9byY9pOzcuLVA9Vc5pTn++vDpSd6aya91vB1+0JnK3FKvSTNhidfmjgd8WuNJP7w0pYShqJye0ktVl8XSU/yT3/eDH1l4sD8AIAsSRqz9+0dQSTth/NFfxRMriR+4/gVVP7hzJrrt2tdAyFQPSOiSf4RPMyQeb5Ys/dBj4mGrSCUSJJ8RobDMLPmo2J9dDKVoBoBPXEDAzbXoDpGimbomlRiAgV2gKJBctRFaf7img==
Received: from HE1EUR04FT029.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0d::49) by
 HE1EUR04HT180.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0d::392)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Mon, 4 May
 2020 08:07:47 +0000
Received: from DB7PR08MB3801.eurprd08.prod.outlook.com
 (2a01:111:e400:7e0d::49) by HE1EUR04FT029.mail.protection.outlook.com
 (2a01:111:e400:7e0d::288) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Mon, 4 May 2020 08:07:47 +0000
Received: from DB7PR08MB3801.eurprd08.prod.outlook.com
 ([fe80::4537:eb98:836d:4bc3]) by DB7PR08MB3801.eurprd08.prod.outlook.com
 ([fe80::4537:eb98:836d:4bc3%3]) with mapi id 15.20.2958.029; Mon, 4 May 2020
 08:07:46 +0000
From: David Binderman <dcb314@hotmail.com>
To: "harry.wentland@amd.com" <harry.wentland@amd.com>, "sunpeng.li@amd.com"
 <sunpeng.li@amd.com>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "David1.Zhou@amd.com" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-5.7-rc4/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c:1393: bad
 loop termination condition ?
Thread-Topic: linux-5.7-rc4/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c:1393: bad
 loop termination condition ?
Thread-Index: AQHWIeqJBtSVxSgrTECebrtQdGo2zA==
Date: Mon, 4 May 2020 08:07:46 +0000
Message-ID: <DB7PR08MB38014E850E1C929AD96A60EB9CA60@DB7PR08MB3801.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:8AE6E2072B8C62AF66B8E7C07DF59522F47FD98172B4AFA76BFF2A2C8854C32E;
 UpperCasedChecksum:6B39B62EF0C883FFD20700FD2403C6564F48BD1E3E8E68DB743A702BA149CC08;
 SizeAsReceived:7493; Count:43
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [aaQcRRRod76unxbEiSXV9GDK9SYO8GMg1D52xd4E0F8BOq7Co/ITOx7tWNoFmGI+]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 522d9952-b5b8-4078-52c4-08d7f0023b1a
x-ms-traffictypediagnostic: HE1EUR04HT180:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DwgQ1KQr91OXC5Cfb4Dxsod1y+MJGUfh8/+2i+Cof/eMAPQ+uhzW66GL80G+d9j5IgBlBBH/Yh/Aln8P0ceZ1tcPv7dkJXmDhM8QVXFAVELcvG98joaTy+gz5C+xOZZORxxahGZPPUBs7MDJwAwhjTUggX8t07DNuTibUn1IQiPP+cyimaivInYnBGca5lLOcN93huXvUmTsCph7djy4nw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR08MB3801.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: +S8tj8oTlLVUOx7ok0MNwLtIFIKEsmsGM+HwTmpdUdVz2cJzT7XRVzqB8at+LoVoSvhwpb+BKN4Rv9MeG2c/5V2XM589FnRDwy8291+W4JIfnhBJhf4aH1yVLPe12qnYsgVW29QxNY/qfkdpITLG2k24T0vmEiG9L98E/bNFf2KtbLOjHSQUGhtyXLdFxN9si2ruLQAOQONAoMAiMR8VAA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 522d9952-b5b8-4078-52c4-08d7f0023b1a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2020 08:07:46.7116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR04HT180
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello there,

linux-5.7-rc4/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c:1393:63: style: Unsigned expression 'j' can't be negative so it is unnecessary to test it. [unsignedPositive]

Source code is 

            for (closest_clk_lvl = 0, j = dcn2_1_soc.num_states - 1; j >= 0; j--) {

but

    unsigned int i, j, closest_clk_lvl;

so it looks like the loop never terminates. Suggest code rework.

Regards

David Binderman
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
