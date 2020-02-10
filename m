Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F3157EFA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 16:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04B06EC9E;
	Mon, 10 Feb 2020 15:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05olkn2066.outbound.protection.outlook.com [40.92.90.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D806E97F;
 Mon, 10 Feb 2020 13:26:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrmZF70+LFlw8w5D5qBpKMITzi7cP40pIQLl8g3Iw8v4f2A91pJ/40/0fn4HKWQr4t3g3yZqaMjQXNLcwVctYrd19SFNuC5XeLZPiwJvqge6AzL+PFmFmgGfDEN7i6l+i5cMc+uNHYq2hM0X1rcqWWN1tP9i138gmPlmlZwvkk9rhYdYBpwYoDWkA5zoRrkvxYzOYV3fNcvGL/jAc9OPL/h0AFvI2pZ+JO3X35x/RLxB/M78YEVH6hHgoszEH5kQFAyz7LhmL8XHlnbgfFjL7GUed1EQ+rTqsYubH2FhNoe4+gzJywgXzM47dd1U/rXCM0CIsUjcAZu82822mihL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xf7B3Eeg7BQqwbpemDqXtuTUXpJ5+5Dup4JNoqcPuIM=;
 b=V/QdDES5mKYv7Cz4Jh/KQfYFf/g3m0GrGCMUgExf7MXBEwC3IkytzzOBR1TusPp7a0rLbRlSQ/7cxZ4iHfy6lgX320kLZPVPWP6pX/Ta2S0ecuDhHJPgLpedV3A2boj+Wlla7u6h5HDYHiESc9flZLW+85iuOZ43zISjVGSzH2+jYSn/NY2QRDKn1TrTme+pMhy/+ejnVd6V9ues6iJIoDP00Vy6gPFrx6It1rvgU+Zo2hTazGdRn1tBnqBgYAs30knwyq4tnfYlBKK1mQSeXzQV6xfiVCqkjjWCXhaDmnv0HEENDy6cjLYg4vYhwD2eI7pOj5j5Ujs2d9aN8DsQ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xf7B3Eeg7BQqwbpemDqXtuTUXpJ5+5Dup4JNoqcPuIM=;
 b=pcd75T9ftrguVRYe5rglj7rKQldC9V3wg2J2z8HGYI3CsU8BjcH4ujvr5kLJBBE2+mA07WKyAgmaWlhG3miIP8nNA84+ITNtrfSmHRNT6GRJUP0jDYhEMCYxSYB/WQaaVCeePqoZeepCenOy20Q62j47lMXJZveLPrmC2WWrP1cTRBCjuRvSYAQxREhMT08RN90wgPwKzBdsegTnAqOmhwMkvgc1qYaVwMg2AJC3/BKvBZpYO4dp7XLfDisVdCVpfEulC14xdFthM30JgnmOTSyR5DOWDJ2k5rvqkZZ7Zf2kYd1erHnTi+jodoeM+pwLthsyBYKHG5d+r2p/J8fHHw==
Received: from AM6EUR05FT005.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::34) by
 AM6EUR05HT188.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::295)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21; Mon, 10 Feb
 2020 13:26:27 +0000
Received: from DB7PR08MB3801.eurprd08.prod.outlook.com (10.233.240.58) by
 AM6EUR05FT005.mail.protection.outlook.com (10.233.241.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21 via Frontend Transport; Mon, 10 Feb 2020 13:26:27 +0000
Received: from DB7PR08MB3801.eurprd08.prod.outlook.com
 ([fe80::7435:b1b7:7a14:4095]) by DB7PR08MB3801.eurprd08.prod.outlook.com
 ([fe80::7435:b1b7:7a14:4095%4]) with mapi id 15.20.2707.028; Mon, 10 Feb 2020
 13:26:27 +0000
From: David Binderman <dcb314@hotmail.com>
To: "harry.wentland@amd.com" <harry.wentland@amd.com>, "sunpeng.li@amd.com"
 <sunpeng.li@amd.com>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "David1.Zhou@amd.com" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
Subject: linux-5.6-rc1/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:8411:45:
 error: Division by zero.
Thread-Topic: linux-5.6-rc1/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:8411:45:
 error: Division by zero.
Thread-Index: AQHV4BU/KGsH5jTAckazxatedoiBTg==
Date: Mon, 10 Feb 2020 13:26:27 +0000
Message-ID: <DB7PR08MB3801C24293CA03F7C57603929C190@DB7PR08MB3801.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:FD6E60A8EF71E7A386D465942962850874370F6B51794666A892BA8F1712BF9A;
 UpperCasedChecksum:F22907425F3B99976FB8AAF77B2FA8F8B94FC0436BB85773C5ABB413F697F9E9;
 SizeAsReceived:7678; Count:43
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [x9jgQ0ZWRU2OLvsMeD//RVYE+ymvS22Bvh68yje+jIm/c0sL04YmbzXUjXLTpKDo]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: a44eed28-d88b-490c-8df2-08d7ae2cd550
x-ms-traffictypediagnostic: AM6EUR05HT188:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0AIGj5kNreVkFuRc1U2ZqgydwxhDoFQt8dJVJ5gTtzv5hUtFCSmYGRzk0TA+CxQmsqsbzD0guVZlyVtQyMWmcH2Tempu5Qn21n4d46+LoBM607uOyIId/qTV0vx0PzXXvWZeLYLR6OIWboGKhIY/D5/RR/Z7esf5zJffrbRKb4kO7hxnX6CCnebt4qphFQCQ
x-ms-exchange-antispam-messagedata: LCxzYPB48oqpu47oCvSa/iHpTxt8qHudmFUL4r4GOVCWm8Z82cI1ZQIcVHTuOyBhQrPC3C9hwtjdwtFYtlm7u2mu49FhoR1BAIbz0kvqj/F0/IkthAgiBEh63B51toGSHj3+tM1wl3gKPJ2gQ8VFlXnQuo8lfL6M0C8eCsAH35v0sB1w+EmnK4hb2B5PL3tR3v25k3cEF7GB+uydSV+ITQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a44eed28-d88b-490c-8df2-08d7ae2cd550
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 13:26:27.6125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT188
X-Mailman-Approved-At: Mon, 10 Feb 2020 15:38:06 +0000
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

Source code is

    unsigned int vsync_rate_hz = 0;
    struct dc_static_screen_params params = {0};
    /* Calculate number of static frames before generating interrupt to
     * enter PSR.
     */
    unsigned int frame_time_microsec = 1000000 / vsync_rate_hz;

Suggest code rework.

Regards

David Binderman
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
