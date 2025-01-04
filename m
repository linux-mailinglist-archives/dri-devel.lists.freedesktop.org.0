Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07022A0191A
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2025 11:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16E010E4F9;
	Sun,  5 Jan 2025 10:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scioteq.com header.i=@scioteq.com header.b="v7Z9JoeR";
	dkim=pass (2048-bit key; unprotected) header.d=mail-dkim-us-east-2.prod.hydra.sophos.com header.i=@mail-dkim-us-east-2.prod.hydra.sophos.com header.b="X4IPY5Xp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rd-use2.prod.hydra.sophos.com (rd-use2.prod.hydra.sophos.com
 [18.216.23.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D117110E04E
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2025 17:45:14 +0000 (UTC)
Received: from ip-172-21-0-105.us-east-2.compute.internal
 (ip-172-21-0-105.us-east-2.compute.internal [127.0.0.1])
 by rd-use2.prod.hydra.sophos.com (Postfix) with ESMTP id 4YQSWs4q1dzvPs0
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2025 17:45:13 +0000 (UTC)
X-Sophos-Product-Type: Gateway
X-Sophos-Email-ID: 91279709e73447f282ee0f9c94ae2d9a
Received: from PAUP264CU001.outbound.protection.outlook.com
 (mail-francecentralazlp17011027.outbound.protection.outlook.com
 [40.93.76.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by relay-us-east-2.prod.hydra.sophos.com (Postfix) with ESMTPS id
 4YQSWr2FW9zjWwM; Sat,  4 Jan 2025 17:45:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfHkCM+GiW2MjhyJScaMLaBLXZP59nnP5i+PIp2gn3f9GqaBaJR9p9q4fZ+qfWTNq9YYk7hVfKSQI/7o/AsWsHPdloVVRNADOxIab6wnUnVRbUoR+wEPsbisDmqCZfKRDCo8LIAngxeEwNRgSQUQVOCDUqTjuQEO9fv86QwygPd6GnjdOelinM4dqnB9yj4RY1vdQ4sCIx7djYjStkBv8b0IcwHY3Xg+AunxBrtjgrTrdeU85EGpMUwSp8I5bowKORjS1dmWi+Ywtv+YukpA9RX1t/nf1Fa9G1ZwapVl/Q5h55lFSTuAn0u4WJol7cBnbF83lBOKN6GYJXYuqES6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysO9alifdlT+vLVvmP0cN70Jlvo0DP99ZGWz/Uxf8vc=;
 b=jclz4Svgkf3geEIELOSV+3XrsPGf8TbHlGKp+gkeBSFv5j//usMxqaogjxgpLKy0gYvr9i/P+7ZuTAsZMn1H6auuzzzOktkSuciheYusSwbQK/a4JPXh5snHbzH72Oy0YslGDRVarRPg5zT9to+mYBYL1m/9LhQIK1MOmpOWuaQrnTpi5YgvwWM402PTEgTTz025mj71trycBIqzgiDvRj+NSF2g+tPqizx84Xnzr6rh5zC/Oegkzta82/vq+5IayTKpqwONLVkP27mQtBLey8I1iFsQmBVcQQRTVPB4TakvTlzmTEfyWsC4QxGj+4L1ALwHnDFESGZuOtU11A2+iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=scioteq.com; dmarc=pass action=none header.from=scioteq.com;
 dkim=pass header.d=scioteq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736012707; 
 s=sophose3b6b7cefe1d4c498861675e62b33ff6; d=scioteq.com;
 h=Content-Type:Date:Subject:CC:To:From;
 bh=ysO9alifdlT+vLVvmP0cN70Jlvo0DP99ZGWz/Uxf8vc=;
 b=v7Z9JoeRW85Uk/9HWZV+mGOx1deLyIh44m7D4hnhl0x19btfw0OuAkQ2qgkHf/R8
 2mkST1f8hrfbr4/Osksu5NhsCs1iEMS8L4XrRigASx0Vb2cK9Y6H87Eel5ECYzoRz9E
 p4NcdS3iRysJmIM1w2zibESUFj99CWUcTE72WI7mNQFW9bDTNkE+bhYpnjKVj7ktuVA
 dzTPJNt/twhHHMF7+EFJoqeMKCXRFrSxfnocdWHLsc5eV2U91B9/xZ4lnLR5C1X8f5m
 gASVM2BMOvV8m/einnWxtf4v41KAQBLeQr0f8rdMntUNHerSc9xQlpP7tzr43wcl9BQ
 VGtw2oQaoA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736012707; 
 s=v1; d=mail-dkim-us-east-2.prod.hydra.sophos.com;
 h=Content-Type:Date:Subject:CC:To:From;
 bh=ysO9alifdlT+vLVvmP0cN70Jlvo0DP99ZGWz/Uxf8vc=;
 b=X4IPY5XpXVwjog015a1ldYDamlrPWNV4vdIz7eQMFUVUXFYCDBiyoT8sTcT2LYjl
 +eMwIzaoHuKkz+0E3Ts3liGW1nJ4Gnn0sVkf/tALH9WAqn1bIBW4YSALE045QamBpvf
 WyS6a6bqLfAVcOfCiCsbBRia1ijIHHl1jFlE912Sb5Qm4Bax9281mcyMZ9nh6LZpiwj
 bpALh9kbuySd7AMUHMdGhOvGCiUFuPNUBZUi+PTdJjdEGFqVvNzE/zefcBxDLwHG+DK
 0fxtNqmm3qxZxOLUQ2UC8VSR9+Ss3IM0v1ss4hLeI2leGBWi1jD64t6ROLCtHNb3KBg
 mi17XkEoUQ==
Received: from PASP264MB5297.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43b::20)
 by PATP264MB5509.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3fc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Sat, 4 Jan
 2025 17:45:08 +0000
Received: from PASP264MB5297.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3de1:b804:8780:f3cd]) by PASP264MB5297.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3de1:b804:8780:f3cd%5]) with mapi id 15.20.8314.015; Sat, 4 Jan 2025
 17:45:08 +0000
From: Jesse Van Gavere <jesse.vangavere@scioteq.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: ADV7511/13 implementing atomic ops and bus formats
Thread-Topic: ADV7511/13 implementing atomic ops and bus formats
Thread-Index: AdtZbi8EHgRPTTpYSqu6qWF3rjBzcwBWKoWAAIs1GzAANvdigABAD4rQ
Date: Sat, 4 Jan 2025 17:45:07 +0000
Message-ID: <PASP264MB529722778C69339AF994DEC0FC162@PASP264MB5297.FRAP264.PROD.OUTLOOK.COM>
References: <PASP264MB52976B917B5F002234D72DDEFC0F2@PASP264MB5297.FRAP264.PROD.OUTLOOK.COM>
 <rh4xzo2cxciakrmaiw6bm4hfx6qwf4zj7bqwdzzdovt7rp4wrl@ir34ydimkp25>
 <PASP264MB5297BCB83AB9AC42FFB8F4F5FC142@PASP264MB5297.FRAP264.PROD.OUTLOOK.COM>
 <u3mciz2pjwgw5nrrkittkyqfcvrwa2hog5aueo23irvmgaty2p@vcggz5nodvwg>
In-Reply-To: <u3mciz2pjwgw5nrrkittkyqfcvrwa2hog5aueo23irvmgaty2p@vcggz5nodvwg>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=scioteq.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PASP264MB5297:EE_|PATP264MB5509:EE_
x-ms-office365-filtering-correlation-id: 9a79f1b5-16ec-41bc-0f31-08dd2ce7873c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?47y1H1Vc8I41a/e+EtIFGIZOwHRZuQN2mapzd9YNRfVGna18+kRyFkxMFwrw?=
 =?us-ascii?Q?Rw+8qAcIejr6nmFSeFhVGmAWokYDVIuDvhL6nwR42i/QoZJhAgs4cfgLq9id?=
 =?us-ascii?Q?vwfi/SjeHBVnTIIb9xrP55izN8cH13dWm+OncaPSz7b9H9+wwDY3CTSPL9n1?=
 =?us-ascii?Q?rPcJSqu6qdn8/fT23bgis0/260Dm6BLsFAFWfCi4pFSxuNs99DEOtapg7MRQ?=
 =?us-ascii?Q?piuAYWQBf9O5qjxdHDzY/x69Tz1CXw4//zgna0kaFnkwWhnd15G5HCXmp+6v?=
 =?us-ascii?Q?zkIuFgvlHbqX7civRMev99kBBBJJBMEm9EB4iKxrC0AVrZXFkUMlD1QZLvAS?=
 =?us-ascii?Q?9A9JTF6BSE3w2zkyEhhvwRgAyyX1loicuWzh31tUOnatyJ5OpaqYZBYatTOj?=
 =?us-ascii?Q?i8l9pOogPv0anMFWohcpt2MMq5vBq5l+g7BWR65reMRpC4HbFOO0uG8vJyhU?=
 =?us-ascii?Q?a6MN557ijtbmN6i5F+PT1mc5ze7YhU/cu+nAeHnL4h7bhE4z7cGRcCPfGWX7?=
 =?us-ascii?Q?dfB+85Czj3Qdm0aZz2B0wF1wm7Rm2Zx5YhA88IfqbKCD6PPiOX2Q6crvEXXq?=
 =?us-ascii?Q?3fD4+bTnakxbRG1iRXkWt9yfKmqSA4u1hu7TbttEx1DT26isI3al8mvVOjHK?=
 =?us-ascii?Q?AsHPHsHLnXrmAAkMnsS0m37TZN1Pmu1eqwq4fFUlaAI1eeFJk4In9U3iV2Iw?=
 =?us-ascii?Q?LeDxk0/OpqzZsCgvSSpF9rVB6/FSw5nQD1yN56XwU0XVriBQ7h8H8usNSlrf?=
 =?us-ascii?Q?/E+QAnh3LwO0wOss81XMEJua82vQoxWMnMxD5DdWVLOdYzVUFTb514I44QZG?=
 =?us-ascii?Q?88TTWrZGvEyHkic78/j1N6P0qs+zqDdqPmm/2H3cuNKSpjcgi0uPhpBBDBy3?=
 =?us-ascii?Q?FZKfdDtpXp9K9+qn+lkVSdMTcOYXWInZccOUrETnMh90ZefiTpi+PDKXoAzr?=
 =?us-ascii?Q?T2l46ZGgr7eTGSUAAyQ5zqkWo8PsDDaBOeZfXaowi+HtLK50g5Nbs0C7oFQX?=
 =?us-ascii?Q?QcxYw334UrfKN/vtw4c55D3PzI6rPVFBu3Yfk7hS8IHNvjL913T/Iz3gkXH4?=
 =?us-ascii?Q?h0iyyibZ8WJVJa9yFY5XKzXv+chfQzPE3jX4fN104NvQSIc06pPaT3ReICG3?=
 =?us-ascii?Q?zXSNzRIU1swb24lPe4YSqTQ8x7DfCpYHP2nkOQT5b6fjmzgU7J9W7p2aggOT?=
 =?us-ascii?Q?E549haRuFr8ciA6qefo7Ir2k6jK5UGoUzr/eXaV86INBPiH4wZ6nlfZeSgAE?=
 =?us-ascii?Q?s/zgLqMm3NUcGENdSofyZG95PK1YvgbhegpXhJGBE8/1HyBe1WywFBbYevGa?=
 =?us-ascii?Q?mLVhlwengZAd1E+RfFsbbG2M99Ayk0ChPvfzaZj3DnijOFmxc4IPfReh2vcx?=
 =?us-ascii?Q?UnxoZzLHLYuvQljexYk/GrHgUoECxCBrMsSAayS/C5lu3OoZ2c9eS9kmw6LE?=
 =?us-ascii?Q?Keb3R6no0n2vNeaisBYXY3UT8YiBkzdT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; 
 IPV:NLI; SFV:NSPM;
 H:PASP264MB5297.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE; 
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IYC9b54fTmuxtCguspL5MbXqk1HicBgDlQFp6/gk4IimsFs4hSxZprk5lXrA?=
 =?us-ascii?Q?q10h4ZcEXMvXAfDwE8+ZQ8WYc/SBOpYCjYyu5FhMQ/sH6gOFPr2x6l6GPuAe?=
 =?us-ascii?Q?kuqDxQoQQso7gSYYHpvMaJYL9xkChOXyQkfNxdFVhVX4NO3Pr0kmCyRtQ259?=
 =?us-ascii?Q?hHgla1JTWoU/CjowFnm808srrqfAFccE/8odBQ9PQLstZLlp/8bhKx/XvR1C?=
 =?us-ascii?Q?UAvi3Ir4J2vPxFyZGNJW5GV0ow2u5VMtVBpnc0/cSyp0XLagQUhY9kQRJmPe?=
 =?us-ascii?Q?F1TM62wtH6TC0y3gv5B/e+9t/aW+n5bZPvhLQughaDUyOGKeMdjuFWgjN/IU?=
 =?us-ascii?Q?bMIeqzQDXoXpDTdoyRSGimmO1dHPhfQ254NTBD2aPhwmbKV/Tpe50hmuItOg?=
 =?us-ascii?Q?l2z6PXsz3XH8DBbJOpK7YTtHuphFpZN5sEUdbFOTRRPv7hb0nuLLgJYIA0uA?=
 =?us-ascii?Q?mgtjNJjABST4iiUM2tPo/S0KvJLoMK5/zhdfDt4x+mzS8lZS7GUCeZK4HQyV?=
 =?us-ascii?Q?I5lmVhLwCYgCFw1UwS7OtZ0GLlgDuItN8iAPXVXX6YathuDBcjtoM+zwBIiC?=
 =?us-ascii?Q?ih2VFilX6DYPP+IZmNmnIHjw64LhazaLJ/L+LJ18bhHq9iVcv5nfPJyHQ4xO?=
 =?us-ascii?Q?I7yDp+WHU8EZWLrCKWXoN0qGtOmp/zN8AqsKZaAITFfJoO1Du95qzs1tgZAj?=
 =?us-ascii?Q?Cj2c2JVvk7u+NkGmCf3P2Fgo27XBWwhui0/xX2dGT/6imQkfqtq0yNJpNy7K?=
 =?us-ascii?Q?A1w1wB/6McyHDkCgC7B+6ha/QPVCG9LyRhLpOCJFCdHzAloeOmWCtrE+PiOF?=
 =?us-ascii?Q?Do0PMPId/rtikH2DFHecj9iM5/vWorId4pitUadKgvbd3qTinDw0rYDGVKYv?=
 =?us-ascii?Q?qBlNX0xrkIJvUOK9xfuyB+Jy13Fso0V3nrtlot1MooA5CNfqbCNR1CLLprAh?=
 =?us-ascii?Q?0rA0K75PxPG/U7SPPIE1D0/vnnVD4dFd6r2KMp+N/JdpfhtfIxga1aWOFCUc?=
 =?us-ascii?Q?k7R0PAGWuGVzP3XFiL62f7OzYh46v20gTw2EStNHy8eRKgQMFqS7gtMWDITM?=
 =?us-ascii?Q?0bEOkxNrcZzZ/qaSNI+GikPv7iPNR14OhcDXIx1ILkTLc0NJrpegxI5ZGWRB?=
 =?us-ascii?Q?b4uVaoh1FzmDICHes3jj1FAWKbbNyzKPTwZYkoXhXb6KStj4qwNbNxIsWyfA?=
 =?us-ascii?Q?ndTtJlcFKzj+ztjut11Du9qaqqhUP1KsxjdRVFnzoBPA3Pl/ZfcOIYJaGe3y?=
 =?us-ascii?Q?8aTZrTmzWsE4Xop1xFExjpAr3ZXGyubzTPpyRSDubeYJlob+UdA+fUtEzt/V?=
 =?us-ascii?Q?UMGarsUhOrY8Kr9ReLAWf7JinVthcfNOMZYSI0PN3TdG4E7Xns0ABwcvbaUg?=
 =?us-ascii?Q?6ra3FpKqeF4ibrpUwgHnlIBzU7yng9TmCWMjLUZlrxe13NldLinHwPnnhGds?=
 =?us-ascii?Q?ODCuGEjLgr2SGk30Skquegk4J94K0if6qs0CqpHU/Nm0YjNZ6t629eDXOeFJ?=
 =?us-ascii?Q?y/qWebGlMfhq94OHHZKSRLF9yyslfUHSesm23rX864IXdfHBLTctvfl3pFZv?=
 =?us-ascii?Q?EzONSmLDs9JIdkjKprETgY8D7gJ+EbTp8KwNwOD98vs3bN8IL5Yc1tkD7+Bc?=
 =?us-ascii?Q?iQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IwaF6KLMhBzqNiv6oWvul8sQH4k2ThSnt8xDLtZam11+6/EqhENWMC2vONiqW3joCgpbB8UwO8ALWCF2qfDTgUn95pu5dowcf1lyHEJNJoc/p3I0YCQEKXqzGJ6dMJ/E8fLhdSaVMnUgFGdN3xX1Lyp52MQaEB5usxStwxt4F6r8AGfEj9RYflFoDXaYiQTqETen46oTRolAGyHZZKfpuqTIJLNlEVo6n6muHDW8JCe8C+m5RoSE5kkst9KYZug5bKlibI5XGgMlZInnH+onc2BQw2yPWJ8J79A2Mryc0xX2NOBI2dxfQx5F8gN1/yv+Ms0LbcdBDj670oxAo5WczcylHKqKGCvDeMAKJ/qtzYP5tSccduOmSs3ij0CAKA+Zb7ya1mr5Ur6HDvbWin3A7/82AF2gScn8/aWz9Qij121PoLGHxoRGSA93Yu68BGW1B05j1+6hjyWGUqMmypqG3CXSA+zvvTFmNVqcrNlhcaKSW5mrZOjIC8Od7bQr+2DRvQSP4tLzksQhQU0VZ/0MhoQirjhOD/GPEiKuirRTmoq8Chh6pErYDWvcwbTkrX6RB6suD35a8lrS4wO74pl6fzMZbW5wCNrLOXQ7EHdy3TkjV2Hkkc63xyiBjV4L0LDBAvOH0NiDxLPcKZKWv5I1OpyBGtZ1eOVt32qvp5A09so=
X-OriginatorOrg: scioteq.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PASP264MB5297.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a79f1b5-16ec-41bc-0f31-08dd2ce7873c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2025 17:45:07.4284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f3e5b271-16f7-46b9-bdb3-4271ac933ef0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9yC0ozco+2NjvoKazSen7SpssYfX5lWVZp3hJrCDh8NV9Q4Yltk3pmkBffgzZg0k01CoU9R++i2VkIrmlayBANGdefgCXLIkfShpD6pVXHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PATP264MB5509
X_Sophos_TLS_Connection: OPP_TLS_1_3
X_Sophos_TLS_Delivery: true
X-Sophos-Email: [us-east-2] Antispam-Engine: 6.0.0,
 AntispamData: 2025.1.4.171246
X-LASED-From-ReplyTo-Diff: From:<scioteq.com>:0
X-LASED-SpamProbability: 0.085099
X-LASED-Hits: ARCAUTH_PASSED 0.000000, BODYTEXTP_SIZE_3000_LESS 0.000000,
 BODY_SIZE_1000_LESS 0.000000, BODY_SIZE_2000_LESS 0.000000,
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 BODY_SIZE_900_999 0.000000, CTE_QUOTED_PRINTABLE 0.000000,
 DKIM_ALIGNS 0.000000, DKIM_SIGNATURE 0.000000, FROM_NAME_PHRASE 0.000000,
 HTML_00_01 0.050000, HTML_00_10 0.050000, IMP_FROM_NOTSELF 0.000000,
 IN_REP_TO 0.000000, LEGITIMATE_SIGNS 0.000000, MSG_THREAD 0.000000,
 MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000, NO_CTA_FOUND 0.000000, 
 NO_CTA_URI_FOUND 0.000000, NO_FUR_HEADER 0.000000, NO_URI_FOUND 0.000000,
 NO_URI_HTTPS 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
 REFERENCES 0.000000, SUPERLONG_LINE 0.050000, SUSP_DH_NEG 0.000000,
 __ARCAUTH_DKIM_PASSED 0.000000, __ARCAUTH_DMARC_PASSED 0.000000,
 __ARCAUTH_PASSED 0.000000, __ARC_SEAL_MICROSOFT 0.000000,
 __ARC_SIGNATURE_MICROSOFT 0.000000, __BODY_NO_MAILTO 0.000000,
 __BOUNCE_CHALLENGE_SUBJ 0.000000, __BOUNCE_NDR_SUBJ_EXEMPT 0.000000,
 __BULK_NEGATE 0.000000, __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000, 
 __CC_REAL_NAMES 0.000000, __CT 0.000000, __CTE 0.000000,
 __CTYPE_CHARSET_QUOTED 0.000000, __CT_TEXT_PLAIN 0.000000,
 __DKIM_ALIGNS_1 0.000000, __DKIM_ALIGNS_2 0.000000, __DQ_NEG_DOMAIN 0.000000, 
 __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
 __FROM_DOMAIN_NOT_IN_BODY 0.000000, __FROM_NAME_NOT_IN_BODY 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000,
 __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV 0.000000,
 __IMP_FROM_MY_ORG 0.000000, __IMP_FROM_NOTSELF_MULTI 0.000000,
 __INVOICE_MULTILINGUAL 0.000000, __IN_REP_TO 0.000000,
 __JSON_HAS_SCHEMA_VERSION 0.000000, __JSON_HAS_TENANT_DOMAINS 0.000000,
 __JSON_HAS_TENANT_ID 0.000000, __JSON_HAS_TENANT_SCHEMA_VERSION 0.000000,
 __JSON_HAS_TENANT_VIPS 0.000000, __JSON_HAS_TRACKING_ID 0.000000,
 __MIME_BOUND_CHARSET 0.000000, __MIME_TEXT_ONLY 0.000000,
 __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000,
 __MSGID_32_64_CAPS 0.000000, __MULTIPLE_RCPTS_CC_X2 0.000000,
 __NO_HTML_TAG_RAW 0.000000, __OUTBOUND_SOPHOS 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __REFERENCES 0.000000,
 __SANE_MSGID 0.000000, __SCAN_D_NEG 0.000000, __SCAN_D_NEG2 0.000000,
 __SCAN_D_NEG_HEUR 0.000000, __SCAN_D_NEG_HEUR2 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_ALPHA_NEGATE 0.000000, __SUBJ_REPLY 0.000000,
 __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
 __TO_NAME_DIFF_FROM_ACC 0.000000, __TO_REAL_NAMES 0.000000,
 __URI_NO_MAILTO 0.000000, __X_FF_ASR_SCL_NSP 0.000000,
 __X_FF_ASR_SFV_NSPM 0.000000
X-Sophos-Email-Transport-Route: opps_tls_13:
X-LASED-Impersonation: False
X-LASED-Spam: NonSpam
X-Sophos-MH-Mail-Info-Key: NFlRU1dzNHExZHp2UHMwLTE3Mi4yMS4wLjEwNQ==
X-Mailman-Approved-At: Sun, 05 Jan 2025 10:55:08 +0000
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

Hello Dmitry,

> How is it so? I don't see any specific requirements on the TIDSS side.

Seems right, must've been a mistake on my end

> I think that's a separate topic. Bridge drivers don't have to implement a=
tomic_check. In fact, if you check the latest LT9611 driver, it has dropped=
 the .atomic_check() completely, as the corresponding HDMI-state check func=
tion is supposed to be called by the connector code (e.g.
> drm_bridge_connector_atomic_check() calls it).

Yes I saw that commit now, I'll skip that function.

> Regarding the conversion of the adv7511 driver to using HDMI callbacks.
> This has been on my todo list, but I'd rather land HDMI Codec and generic=
 CEC patches first.

Thank you very much for all the information, very insightful.
Knowing all that I should be able to tackle the atomic ops/bus formats now,=
 and maybe the conversion could
Be a nice exercise for myself, so hopefully my next mail is a patch rather =
than more questions!

Best regards,
Jesse
