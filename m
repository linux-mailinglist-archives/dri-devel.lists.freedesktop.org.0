Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B538A70600
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 17:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A18910E09B;
	Tue, 25 Mar 2025 16:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qnx.com header.i=@qnx.com header.b="00p+D0f0";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=blackberryltd.onmicrosoft.com header.i=@blackberryltd.onmicrosoft.com header.b="DGtYcZUJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1360 seconds by postgrey-1.36 at gabe;
 Tue, 25 Mar 2025 16:05:18 UTC
Received: from smtp-a01.blackberry.com (smtp-a01.blackberry.com [208.65.78.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B8A10E09B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 16:05:18 +0000 (UTC)
Received: from pps.filterd (mhs402cnc.rim.net [127.0.0.1])
 by mhs402cnc.rim.net (8.18.1.2/8.18.1.2) with ESMTP id 52PB32l0007465;
 Tue, 25 Mar 2025 11:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnx.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=pfpt20241003;
 bh=ys2PCx3J6+SO/ElRVRcLr/e+UhG3cdhoTsjPPBipEMo=;
 b=00p+D0f0TigNOivtBUB0yDrdy4bPD/vY2qdME2UWzV8N5WGbZWf8+ldYQjNS9yTXdeF+
 +b1pNmJolrCSGtokjW99neqGt/spI4O8tB6tKdiVQAkkSA0tP17EknXwj6w9W2pkR8Q7
 NChCalJSWT8dQYv1Gs6xLUsVfZZqBk7HQFOhU7yP5/jDa5JijmON1gp4lEGxYiaaYjvt
 Yp058nBBmAbNEsZiM0Xx5jVAa2alhPxBpGJrwGy6a6N/AcaZ/Lr5UCwOxzoX3Ql4rv7S
 hvjDU+1VQFx41FksmUXabFYmTVPQHm+fTBjtb+E4SGufIonKim6fOlpJbbiBviXfe4Xi DQ== 
Received: from xch213ykf.rim.net (xch213ykf.rim.net [10.12.114.213])
 by mhs402cnc.rim.net (PPS) with ESMTPS id 45jd1ch0j9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 25 Mar 2025 11:42:32 -0400
Received: from XCH214YKF.rim.net (10.12.114.214) by XCH213YKF.rim.net
 (10.12.114.213) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 25 Mar
 2025 11:42:32 -0400
Received: from xce210ykf.rim.net (10.5.224.155) by XCH214YKF.rim.net
 (10.12.114.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Tue, 25 Mar 2025 11:42:32 -0400
Received: from YT6PR01CU002.outbound.protection.outlook.com (40.93.18.30) by
 hybrid-smtp.blackberry.com (10.5.224.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 25 Mar 2025 11:42:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkKNI6T3QlO/FzxWMDJ8z8s8qTbBxLTNgttt1XCyCtbQ1JtJcTzAjGGuTe7YbLfRqO3e6fy1rdEwbAI0Mpov4ZMTyHtfDH4Wexspkz4QPwdIY32K6eEb2Q4dMBNTQXPxeFUxv9eyN2w1B+ManBbOXf6ECCKNzcYz/kM+KffAxPY7DQdEw5CDE3BYW0eOrZRR276XWylxJNmnEownt9CZmIa92/PAbJhQgN7W+bdaZEm2r6j+Z1ydQpuoDNsXmgcKt0ObfZYQWyf0R0erQVMhtYV7ImoF/ah5wm5NVoxnW+wNxJu3Mn7cYrUA5OgdUEZ51qVhsjyP6P1Uoz/7a2r0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAY6T10mE31LHFTrUlLncUqdKOimXp8ZC79UtCnmddQ=;
 b=d3BKdlLmpfE5FzpUobN7BdAYVi8TsgSKH4K2oM75qtoLhPG2qkkGbtjSRe/oHgmGlhkuZTBqBJnfOvtCFAmgFqr9zJ+9t3xhzAUMGZCU9axwFSnZNT05FU6HfTZS5kiV5n7fZdGMVOFmyIqxQWU1qBk3H+vG9w5wSNWSffcb+uXOWRF7S3uk+der1JWwVpPcNfrC8B/L+qZi8/ZxaQVtSHjUuRFaNu2zqdjFjL8DVDYNFZymh7/lubNEJKPOy9s8pEjGHiwX7sVrwqbOjimXnniLqV0wVplZRPnlbfrHELyrxjGqkqj4+RH5Xh8oGINtIU4qOvSXRzY0J1uwX73aUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qnx.com; dmarc=pass action=none header.from=qnx.com; dkim=pass
 header.d=qnx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blackberryltd.onmicrosoft.com; s=selector2-blackberryltd-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAY6T10mE31LHFTrUlLncUqdKOimXp8ZC79UtCnmddQ=;
 b=DGtYcZUJHQcL0rOwo+vKJs4+y2NxQF43x9o/310YvrJ/XjfqQV24KlglHSxxifFVCE5bSMr5v5dVgWfmLyTdQPTmTRmykHGw940u5jg+BEOPsR0t+XoE7RLbXpYSGJGyyBdjgJgL0FJ9nntY3v0BY+rN+y2O5AOEE+wWt5Ks+RY=
Received: from YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:65::18)
 by YT2PPFEC9C76D91.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b08::49f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 15:42:30 +0000
Received: from YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4bd4:b377:328c:1d04]) by YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4bd4:b377:328c:1d04%4]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 15:42:29 +0000
From: Aaron Ruby <aruby@qnx.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>
Subject: [PATCH] drm/virtio: Add capset definitions
Thread-Topic: [PATCH] drm/virtio: Add capset definitions
Thread-Index: AQHbnZxHmdoVduxa0EubwmukDSLjSg==
Date: Tue, 25 Mar 2025 15:42:29 +0000
Message-ID: <YT3PR01MB58570C381CB52E7EF5B1E751AFA72@YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT3PR01MB5857:EE_|YT2PPFEC9C76D91:EE_
x-ms-office365-filtering-correlation-id: c27eca8e-59ac-4013-f39a-08dd6bb3a6c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?gdDSCqP5uCwI4A4FdFe41UBMAfyoY4M4iqSLspj7hWL6frydg9kC6rDmQ0?=
 =?iso-8859-1?Q?3KfkomCUANvrriGUVbewtXvlihh0K3ocklzVTUtCBA7vZ4lm+797mfRhHy?=
 =?iso-8859-1?Q?OHVaCHBDvj/ZqRIDxfslgZcYG0KC8W4DGXdsFE8hilDeb0gO5qKRWbHtjr?=
 =?iso-8859-1?Q?L/Wt1RObIdeWJtD94OE5LTI+VceqTGeJ3o5ZU5RwCAz3TkPJIHTjyPSxvg?=
 =?iso-8859-1?Q?J/XA686vQgPVFjKtWACpNWwtQ0hHLi9+c6RroaBE++qQ+E+LhdRsDKor+r?=
 =?iso-8859-1?Q?n2LMaPzu9lsMOJKPeAoikXBUU8zs/vC14USSQm6OJvmVbazYVhJbU1E6oB?=
 =?iso-8859-1?Q?i3IxPW66lm59p1KVAVNm5SuzxGld90qk3oPTQsjVAMAr74ATq++2zKtTgd?=
 =?iso-8859-1?Q?xW/eKLKeCpHBj3nDuRhSjdQ8Pa+YfOayCus+AwHHtcHFC0ekbYHqWWniJD?=
 =?iso-8859-1?Q?5NpyVeD035FOBgSL1FL2EZ1fNoVVlh//AoonEXS4u7iS4dklH8FyhL3zHE?=
 =?iso-8859-1?Q?3wW18NljX4QNeHs06fB5VTJn1Gn17mol2+u8eVdnLccrXXeyLC12jQO4ST?=
 =?iso-8859-1?Q?xnMqBXUn0Vc8pT1A8MxcM+UZPm7+M1BcTk3CmsJJ12ldJxIMA0jqxanG8y?=
 =?iso-8859-1?Q?2PrNch+m1Fpq92jomko1upDDfhewWPMZ2f8zGEdMez/6CM6FgzxBtv2Fuf?=
 =?iso-8859-1?Q?+YUggKUb0jnmUAOKpQTv0Dcw5s5EQKNIsbAKM1P0vIRH+VChLiCX/pe4fL?=
 =?iso-8859-1?Q?r0/K74XWjk2gBMh3F2U0O1HnBt59JXq5OuOIhgjA1c/KJvKlfs7kacNNaS?=
 =?iso-8859-1?Q?6amsrvIOh3S6XhFzHQxOt072msGxrPkTe20MnMLPQi0si0MyNGbmHl6qb6?=
 =?iso-8859-1?Q?v+6rx6P5BZ9/IgEvZly2x9G9XnjYOcHVC0HkzbxDuJ5bbhGLuCE6Dg+m4c?=
 =?iso-8859-1?Q?31qOpiKAnCbFAffTdeMq5lOyGDZ0ChQ9GQNhYLpK6uuRAd0KNpcQbpjsQ+?=
 =?iso-8859-1?Q?5JxU8Byu8FImy4byfjRGwX5LcU1omOQZi/SppYz5MH50JXI56G4XUWLs6P?=
 =?iso-8859-1?Q?KrRiVAXjwRnrEjTrB64lDbDezuTrTnaoOuDuMy9GKnklCY3jqzZqoUZ/Us?=
 =?iso-8859-1?Q?FFsTb+xy/bvp5YjuQaR+n9EifCgbBKVuj/gvGiKWTF4V1I3vttVVcMpD31?=
 =?iso-8859-1?Q?PlMRa74V/KrnxpamyyPWoNYz2d7mTJgLjEg1DWmGijZbs/XJ/EZcm5MEEs?=
 =?iso-8859-1?Q?n9OK7RC65hlzUoNNFB7BHjUPQbv/NqwQokt7x7iFnCGzfNfCZnq9gkslNS?=
 =?iso-8859-1?Q?RxC4fP8SxAyoBrj61gieAJ5b49cz5w6vjxcPvCIZIdMiLfXFGsfCAaa0PA?=
 =?iso-8859-1?Q?WJKdZ9B9KKplV+Jonj6lnc0JaPZoni3D8qOEB2tJ2oAMm7ftj96LyuqQ4X?=
 =?iso-8859-1?Q?j2k5E9aI0coUlxB1szgIlXx9C8HSUlz8w57h/33dqmc5t0NyiaCSENgMCg?=
 =?iso-8859-1?Q?8z/3AP54p8ak8B1HQUa04W?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3wt+UAlEewDf/gd1VcpLuMlvT6tOGRyFBL8UJCyNueCCWNYiYB1+eJ2NOJ?=
 =?iso-8859-1?Q?wx9O/gO+Cjz2jWcRbX3q96iTt0whhJn8cj24JwongRqDCqHwDy6QGQgP1M?=
 =?iso-8859-1?Q?kjAmOQMZtTzePvayQpmtGYUQJSXDfsz2rn/WF8laq72YALuOpsvEuHllrp?=
 =?iso-8859-1?Q?A6064+rVJG7Ld4wFhXDpynU0wIMtdPNVGq7k8+GvfuEGfgLmgzzKPwWybs?=
 =?iso-8859-1?Q?k0Jq5Vw7UueIGYoNLRubRc2kSRJVokpxlyWC1F4HbPDHtmF2NzleOFeuiE?=
 =?iso-8859-1?Q?mmgbZ8KCUywPjkpCk+ZlZv+NOpQP0iMM9cUoLkGsTsD6n/OECiRSjDZDd6?=
 =?iso-8859-1?Q?oBkdwDYjuWOUqKBQDb4WTerVqZ6hrVduLkswc6WaAAHahsmA26Z/5tK7kK?=
 =?iso-8859-1?Q?+8p6aVSGIk+1zPwfQqph9slR/IzgqDqtYb+LXLzO/uc92Cx8Zh5YhfI7nF?=
 =?iso-8859-1?Q?GPoyXNCLlERl3oct5zGfmi3e8M5OXT7n7f4eK8IvXzfdfShnFvA37zHK6q?=
 =?iso-8859-1?Q?vsgy6miZrRHNrnx3Db9yyjwUxf/CUf4vzIm95hYCt+FB9shjMq5rv4Pu/H?=
 =?iso-8859-1?Q?9nOXIU+cIIQv14A/pHlf6RlNvIZihaUFIyKjvpD18rOX5E1cdhPi/k7iqZ?=
 =?iso-8859-1?Q?d/B8+z2KHUAzyST87e6Kslu/MJ5EQQlPifsZtvWR/vfGjG3uL2Y/2oyAxg?=
 =?iso-8859-1?Q?IvrpT8BTLnSVYCQrHt8T2iFXEHsqBYCMadSBAivVKHYKzN5+XykRfNhTh8?=
 =?iso-8859-1?Q?UxRP1PvroD9sE/5IrW0wOnMhugpezkUEM44afdWGGXGRq4JTjzgrPhFhEt?=
 =?iso-8859-1?Q?YaJqsgq5qqDqei/SPJWNhvdQr9o3f9v5Si/DJNFb29IcaGfeANr1yFOSBC?=
 =?iso-8859-1?Q?KYgK65npxwJopyjmi175jJAzJNau+FS2Pb4uAT9/5kv8IcWaNT8uHqWhhD?=
 =?iso-8859-1?Q?qcAIHhjs4na+B2Z1zdKslNkPQ0oN2t8+H//b8JKPk0EW0xYXuKIvrlqRwG?=
 =?iso-8859-1?Q?FajU2u3dmUi/FqbrjEnC93Lo5bezOo9lYWUFZsrOaOfbycww/OJ6A4GkZw?=
 =?iso-8859-1?Q?ElHmLI50MWLCeYAylBMg9lBFXILUPBICFIxnb3vWgPzZ/kRONvKdU9QnI9?=
 =?iso-8859-1?Q?t0ATd8rxIBtTHJvF/XYsgfRkUk0M58gKR5ys00TZBRzYOJAe4pUJr2ojcR?=
 =?iso-8859-1?Q?YDVFbOy8XwWHN8cHLTE2fPFBBQRd1KBD0grfslb604Jv3qjphQqN2eEkyg?=
 =?iso-8859-1?Q?hXowp2fA4nnRP0fsUdJik2rWUVFSItIo4I6s50NfQWYtDzptRevqh21+fD?=
 =?iso-8859-1?Q?UnvZvv4g2DLqMKFoFFI1Im/Sz31dY4nvxPh6aMb6f/9iVoUe0avM5Ge3rp?=
 =?iso-8859-1?Q?loMvmcmWE/5vSfzO5uBVDrojIIWLK0AljHk5DG/R+vystPePtdw+KuvLPh?=
 =?iso-8859-1?Q?iowcaPZR4s/IhAVGqV6bDKD6bqFTyCOCJnclJPTbSXIvFruLIYag0NY1nU?=
 =?iso-8859-1?Q?pUyPOqI2o5fUKxE948qWBomyVkcaLMKYBJmtD6XLsxs/gOQ9qg86n7Pf2Q?=
 =?iso-8859-1?Q?4VYg1FanyPS0EZ1OBqs8kOgAsoqdVADFzAYy+5xWCiOzLSF0bg8t4NN/mN?=
 =?iso-8859-1?Q?8IqRDYl4UqAwtB+FsQxnpvn5TJddInhNUQ?=
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c27eca8e-59ac-4013-f39a-08dd6bb3a6c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 15:42:29.7177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7fe064f1-1f82-4006-b05f-62ea659f38b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y6DYm//ykAsE10oCZo3CwjbH3eD8zglSrg9C3GpdWE9ydCvDuQX6eUd7x8WYbs3XScXWQsyuxu9ZJBqjUpp95g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PPFEC9C76D91
X-OriginatorOrg: qnx.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_06,2025-03-25_02,2024-11-22_01
Content-Type: text/plain; charset="iso-8859-1"
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

From 73e0b6fb04d90b70de1f40e8e2ffc8fe497fa204 Mon Sep 17 00:00:00 2001
From: Aaron Ruby <aruby@qnx.com>
Date: Mon, 24 Mar 2025 16:18:43 -0400
Subject: [PATCH] drm/virtio: Add capset definitions

Since the context-type additions to the virtio-gpu spec, these have been
defined locally in guest user-space, and virtio-gpu backend library code.

Now, these capsets have been stabilized, and should be defined in
a common space, in both the virtio_gpu header, and alongside the virtgpu_drm
interface that they apply to.
---
=A0include/uapi/drm/virtgpu_drm.h=A0 | 6 ++++++
=A0include/uapi/linux/virtio_gpu.h | 3 ++-
=A02 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index c2ce71987e9b..9debb320c34b 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -163,6 +163,12 @@ struct drm_virtgpu_3d_wait {
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 flags;
=A0};
=A0
+#define VIRTGPU_DRM_CAPSET_VIRGL 1
+#define VIRTGPU_DRM_CAPSET_VIRGL2 2
+#define VIRTGPU_DRM_CAPSET_GFXSTREAM_VULKAN 3
+#define VIRTGPU_DRM_CAPSET_VENUS 4
+#define VIRTGPU_DRM_CAPSET_CROSS_DOMAIN 5
+#define VIRTGPU_DRM_CAPSET_DRM 6
=A0struct drm_virtgpu_get_caps {
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 cap_set_id;
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 cap_set_ver;
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gp=
u.h
index bf2c9cabd207..be109777d10d 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -309,8 +309,9 @@ struct virtio_gpu_cmd_submit {
=A0
=A0#define VIRTIO_GPU_CAPSET_VIRGL 1
=A0#define VIRTIO_GPU_CAPSET_VIRGL2 2
-/* 3 is reserved for gfxstream */
+#define VIRTIO_GPU_CAPSET_GFXSTREAM_VULKAN 3
=A0#define VIRTIO_GPU_CAPSET_VENUS 4
+#define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5
=A0#define VIRTIO_GPU_CAPSET_DRM 6
=A0
=A0/* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
--
2.25.1

----------------------------------------------------------------------
This transmission (including any attachments) may contain confidential info=
rmation, privileged material (including material protected by the solicitor=
-client or other applicable privileges), or constitute non-public informati=
on. Any use of this information by anyone other than the intended recipient=
 is prohibited. If you have received this transmission in error, please imm=
ediately reply to the sender and delete this information from your system. =
Use, dissemination, distribution, or reproduction of this transmission by u=
nintended recipients is not authorized and may be unlawful.
