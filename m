Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF6CA735D6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 16:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE7B10E907;
	Thu, 27 Mar 2025 15:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qnx.com header.i=@qnx.com header.b="L2+PTq6K";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=blackberryltd.onmicrosoft.com header.i=@blackberryltd.onmicrosoft.com header.b="SEvhBoiK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-a01.blackberry.com (smtp-a01.blackberry.com [208.65.78.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0229310E907
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 15:41:44 +0000 (UTC)
Received: from pps.filterd (mhs402cnc.rim.net [127.0.0.1])
 by mhs402cnc.rim.net (8.18.1.2/8.18.1.2) with ESMTP id 52RB7S8v032550;
 Thu, 27 Mar 2025 11:41:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnx.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=pfpt20241003;
 bh=gGbPSUsf6VQJ410qZgaj7tPriHujum1WUlNVLTNzunk=;
 b=L2+PTq6K0sl/HJr8b6SGiAI7hr1ND1x1dO6bT3R950xCsKq+jfUOI4Izfat2+2XO3ET3
 wY8hTBuKlG28eDXqtg25kKj5a6+NXNdP26JtV2dZgoubA9vaS9PrAofXDodvFEsyxTpZ
 hUSxSt/tppQ1qHJbZ4BwNR7bDZzzPQRzkNuzmj0T5FeLXX+1vwvBI6ZP0yl+Lwlixccp
 zQ3YdcErUUB4sikQmlguzH8RfFKbbMkvAVtQy3t2nSigZkIPjhg9CV6FNZHu4f1rauJv
 7v218X9Y7hcSdAIit+QEoCazDRIwf2f+CKnPAOWHXxVOtrZNFDZNp2EjuWNVVr8dbrCc vQ== 
Received: from xch212cnc.rim.net (xch212cnc.rim.net [10.3.27.117])
 by mhs402cnc.rim.net (PPS) with ESMTPS id 45jd1d0nb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 27 Mar 2025 11:41:38 -0400
Received: from XCH212YKF.rim.net (10.12.114.212) by XCH212CNC.rim.net
 (10.3.27.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 27 Mar
 2025 11:41:37 -0400
Received: from xce211cnc.rim.net (10.4.225.59) by XCH212YKF.rim.net
 (10.12.114.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Thu, 27 Mar 2025 11:41:37 -0400
Received: from YT5PR01CU002.outbound.protection.outlook.com (40.93.18.49) by
 hybrid-smtp.blackberry.com (10.4.225.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 27 Mar 2025 11:41:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWMlHQ9OosYVMs6OOKNL2+7oMCkYj1JShtXyMeUeKXXhVPG8HbY4TGrnLUUjGLLAUP3eiY78MM9Z8Yu6ZDEMSlLRkF4kOzKbk1Q6nv6bg2023J5pzAwOVJUpoNTMF71xePqkOT1pvVxY4Ez35NKnQ5H3KpErfEneQZfqR8BKZsRrz7ktfwM+3LScKtJCrWiEl827toYYARIuS4dJgEy3Ah6dsAI4E9QqMqkCj7Au3+32KMc3dR3V0xsRtSYtRBAafQ6nNLAwpNUQnaS95Htqw+8/oW7n1v6JACcHmQRg1h5JsKFPWTCP8/Z7TsdcvmRbhMCSfEjMIHRVuj2883zXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnzw19JFJ2XC482v9d377M+BWltsGzBdkqzFcWD0t8Q=;
 b=bxwIvIiF7gmr8dFugZM+jsGf8eT63P2vp94Sdq35+/M083ImMfl/2oC/3ptmGxKqpaaWZ0NH+52Ipj9HQ2R4Rx9S69kBT+1RDI1pBb9gYPFSMHwW7ONtwmM+KSf203N+PWin1LknV/ByaHOEY+thDVUkYifuKzUPia/OYXCd7hh1yDWWBVjyMN5ihzg4tQpr/BXos32E+OIr5PzfWgAsJLL6Yor692Iv1edHsevz6Ul6Ap7axWcjyS6/Ybg79jIGJR6YUwKnj9n9dAy9gbmPAS4tR9sXONEF0xo5+wGZQLkOgHhpuFhbi2dy/QoDmEDb6fUY5MAR06gCe1eVQ83clQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qnx.com; dmarc=pass action=none header.from=qnx.com; dkim=pass
 header.d=qnx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blackberryltd.onmicrosoft.com; s=selector2-blackberryltd-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnzw19JFJ2XC482v9d377M+BWltsGzBdkqzFcWD0t8Q=;
 b=SEvhBoiKe4vTgQFHNS65WTfB8TJhLTb3r7c/5zGG+If02jmtWsrv2o9z8xpHk2g3hdmNcW173ibBZlaim7+qXmbtITSF0/lfoMkL3TsmGiTiPPZ3wC9Lm9Ga9GCcn1fPpkcSynRdKqNeTIfHFtq/uzBvOS6IJ81aKVEk8qRURaY=
Received: from YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:65::18)
 by YT4PR01MB10550.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:107::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 15:25:49 +0000
Received: from YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4bd4:b377:328c:1d04]) by YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4bd4:b377:328c:1d04%4]) with mapi id 15.20.8534.044; Thu, 27 Mar 2025
 15:25:49 +0000
From: Aaron Ruby <aruby@qnx.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>
Subject: [PATCH v2] drm/virtio: Add capset definitions
Thread-Topic: [PATCH v2] drm/virtio: Add capset definitions
Thread-Index: AQHbnyxaEn0fzB0C/EapgIb3dXQbGA==
Date: Thu, 27 Mar 2025 15:25:49 +0000
Message-ID: <YT3PR01MB5857E808EDF6949F2DF517FDAFA12@YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT3PR01MB5857:EE_|YT4PR01MB10550:EE_
x-ms-office365-filtering-correlation-id: c0c5b85d-7fb7-43a5-46db-08dd6d43a77a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?RAbBzsgkoLxf3gv7zUd99IdOedIv1fXo+KVyKCeyXoxPjetW5Pl7de+rYA?=
 =?iso-8859-1?Q?iYpVTFKMlRtLdZ0vqsSp81wTK/Z2N/XNzp5Jin/pQEeNlbSKaOXnuI6pZy?=
 =?iso-8859-1?Q?/ORR9gHXxFdWs2h4dyx46JR/mNscxDO0Dd/8Y79wKC+oj2a18B+gT2gL1e?=
 =?iso-8859-1?Q?KrpqfFko7PwZYXHRJYhFPlWQIHIRO1xUdZaG3H6BLmCIPSzefvrJ9bu3Nm?=
 =?iso-8859-1?Q?jXgB5L191YME7l9OPFwF/haWqyPUfLiTyaxkg9xs8cykL4YqGH/gEbTDBf?=
 =?iso-8859-1?Q?ZqkuY+KZGUqJCBbsSHkWD8XaPGgrfXKhZb/Y0CrKjhIwxgsfdBp2+7MBcF?=
 =?iso-8859-1?Q?ZUodR7fdAIvVl8j/LeCbSWXWmn1elcsZtXL3DmPPzYwVq2oPh4dGGguID3?=
 =?iso-8859-1?Q?+ZW4tISuSPk2cO/AePCkDVRfnW02Qoy7qQMaHrBwQU/olrSLoL+DwZ9sxb?=
 =?iso-8859-1?Q?Xw8XEsJPgr+UYE8VnlbYTEJkhKqdtX6Sd/RSEW8VqppvuzIJqBCycRx2jB?=
 =?iso-8859-1?Q?K/fswhWFU/KDFkLFXoiS61P+Zd6cMZWlC0fdozFnp5QUMAnowxw95Uj+zF?=
 =?iso-8859-1?Q?d1VOVsjPi4HeXU9wIHb56uqKT3ngT9EKYYsKlKYz95mtMVSjCVP7ZPz2XL?=
 =?iso-8859-1?Q?qMX5/vlMXsN0TZ6Yun+YOQT4y9S0nCxBhCTbE9m+5ZW20nYGGgD2aSFTjz?=
 =?iso-8859-1?Q?X+h2K8c3ymIcSsbFPVnBHCFRCUPqWUMkUYIf1orXI88899Jdqg7A7leq1D?=
 =?iso-8859-1?Q?qndS8XFyCZOakhdBIlJJAYSGGH980sbTr4/0ZEZ6QOo+KWIu/hLLXu/Ylh?=
 =?iso-8859-1?Q?0VxD+xP6E1Ne0Ib69qbkn/nPigLmH3Od2FOcOJGLoCgs1vJZiHdPchk2z2?=
 =?iso-8859-1?Q?5NLNB8ziKNZp5wTwY98vRh8wxe+WWEdqrJDD3g1x7KUEr5LTO595qg5+mr?=
 =?iso-8859-1?Q?/f9SHj6QF0eC0k8t0iY3/ha0227kY6IlB9ddl9k8VtBQeaJ9vYC4Wh9RA0?=
 =?iso-8859-1?Q?QDYw4Ts6IENy2Q4QmX4KEmxoggnsRlC6FfhCdDAz8ii5jnGHeAoBqi8y7I?=
 =?iso-8859-1?Q?SIJO2QwDXvzHnP9JRJFsmifHOcNfSvpmV0xDmbda9KjpdMM8hBCmJQJeFw?=
 =?iso-8859-1?Q?203/oX4VXNDweENSPAnBF7WH2vjfIYPcIjPsVlxINFKjFPzwMeKVxWz69J?=
 =?iso-8859-1?Q?3STKqcM73/RPJUmanSiBcUYHpJTQlD367ONYLAe0D7Oze5bPM8Vcm7pNAR?=
 =?iso-8859-1?Q?J/ua5ecE2MnkDuNZCzzTOGZ4TNKMTEGg8hWD88SYCk7D1l3lVSxpFfmsTD?=
 =?iso-8859-1?Q?oC4sH3VLlHE1XOgw6Joppy8awfDzQ7x72qiGbhOPrUcl/3T8SEK0d/8dof?=
 =?iso-8859-1?Q?FFg5dGOhNmrrY3dUgb/MbM6nkpNZkDx4u2o0Z+tF855f9ShvrO6S8RRQbs?=
 =?iso-8859-1?Q?8GXsf/g80gdkDrIhuuFSiycdHRYeD3wK1UUExBaYK0J30TmSqIwr0sQxya?=
 =?iso-8859-1?Q?VbhkXzDWKJQ4tkzjM4O2vm?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5jCiHXDlQUUhTRDOpjRSgwImFSmAXY/wCBoGVP0OdOM4MrPQmYupJeg4uK?=
 =?iso-8859-1?Q?/bU27EhxFQ6YBY2H3erjFzFZeYOSkfVcdsODoQTSNDV/kt5Fwi0w2pZJaY?=
 =?iso-8859-1?Q?rlVKL+Jx0pH08izO7wo8IaVJoHlrlDbzPk2IjS84V+uwaguo+vE9N7SuUg?=
 =?iso-8859-1?Q?44O3MAP8Xg9VPwyBsRtDJCofK3k7HnEwRuzu8V5g1SpVHf4+joJNnU4HN0?=
 =?iso-8859-1?Q?UCQrXymdBNnlySBsHBVaTNq4GNY/AJ5qKxgsoSo1GldPOtCSEGnbduLb/L?=
 =?iso-8859-1?Q?XN5QjAMpk34hQkQcb0e7sfoJ7agJBJJ0MKHK2KURUFM2aJLmIrepwZN3uS?=
 =?iso-8859-1?Q?bH35YNiTa0NlDSjLKw181asAAPeEYZKDUrZEqJskZSuixhRpa9YNrJsybk?=
 =?iso-8859-1?Q?c3RzHXaXX66dgXeGHMTeuii5DKBuIRLT7rNQDMnbGQOyFbwnsbIE1Sejc6?=
 =?iso-8859-1?Q?vmQacFZ+qz2XaduIyvxW7yHR9evlq1ta56Joak8xRsW/g2AOJAzC/k4g8w?=
 =?iso-8859-1?Q?eJbABES3lBC9WyqbcHhwptLSJwz1AkSzLCDK5r59M7Fj6OVGa0Tlm8apPV?=
 =?iso-8859-1?Q?c5lhLpDs0EVMW7y+cRlVaihC1j5bvzSqdDYLsHR0lgzcnoPr03EBf97Tm2?=
 =?iso-8859-1?Q?9d1c3eZQRrov7SbbGtDaC7cgPWungNCKGh8HiHVroCNk45DrOPtfREBIWm?=
 =?iso-8859-1?Q?TaTDXiM+vcy1ACyzuoglAAdZy1qxDs4+vIiycIFAwy+4fpvFW7Hqstp7JZ?=
 =?iso-8859-1?Q?GY3OY0i5YjNZKAjTtftTONwvM2KWMk98WfGCaq47nTG69Ao2pvfUo4VB/G?=
 =?iso-8859-1?Q?mVZTsxVWo9/dQ0o7Rimza4jAHbN4zoyIIYtvQn7sTps/nAjO7Mhl31ESAp?=
 =?iso-8859-1?Q?2YTjI4ts76GChivaPFUMIVFQw7Ib/rNcYgBxiNRJMLeiLgdunePn22JXeJ?=
 =?iso-8859-1?Q?rARyQSmZ6/awIa4XeKr8j+8j0T5oICZg2VgeA6/LEvtFD1dRnAWXsPChVC?=
 =?iso-8859-1?Q?Vj0hXoQww5B2joyYn0dfH74ddjiAw7z7szWVKIV0zVT7xGgIHFaU8z5adX?=
 =?iso-8859-1?Q?I761vvams9UQCptjbUFysJ2KITOgXSetsGwvRtdp/hMVagYHdjbYVAUNEz?=
 =?iso-8859-1?Q?qdYnbpX3XTTTme0XZKvnwR8i/XDDuDTixGIK087K739IIa6kBfVU5NHwMZ?=
 =?iso-8859-1?Q?PnanWDqlhNWslVNoxoo0l2vOGTRoe2GSnCKJajImBZiosYbqdvfscg+iAK?=
 =?iso-8859-1?Q?hROAIDx+NxzBx3U8LyLz6ubYnKouVXedQAlLmklFcMIFqRx+EjVVZoxgxE?=
 =?iso-8859-1?Q?H3nCEbk6cRZooDEbVN56LJ5BvoF+uWV+pzzHB8BONW3oRfBt7brKqHonWM?=
 =?iso-8859-1?Q?OQSLR/AIqlvoIskWCx2RaL/Tx19owIUwCwWTLcwr0r3Dg5DxjPJRxTGhct?=
 =?iso-8859-1?Q?VaZdv/4swPw7rxVER5EaupagsYlxmkheFjZIItpTAZgPjsrt9cSaGQ0Zzz?=
 =?iso-8859-1?Q?5msA3CE8quGoKAWwLbPlEKQ+XCEMe+5N/3O8Q/Npju6+JN/Td167rSsKiZ?=
 =?iso-8859-1?Q?m26h9UDjlHlshNKrGIkgUZ/2eW7suQq+hL2rOnOUKU8mxScmj2S47V8fKG?=
 =?iso-8859-1?Q?Uf2HeMEXfBeZreQ2iF0mrK+rrW4XWO1vGk?=
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c5b85d-7fb7-43a5-46db-08dd6d43a77a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 15:25:49.6280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7fe064f1-1f82-4006-b05f-62ea659f38b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kq2ZchWFnKLiIgrCXS6ze5WyNTDJ1Wk8zIlWE79XWtkuBA50Upz8v2yeuqTD8yTAfBoCKabMvZkX3UgqPAk2kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT4PR01MB10550
X-OriginatorOrg: qnx.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_02,2025-03-26_02,2024-11-22_01
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


Since the context-type additions to the virtio-gpu spec, these have been
defined locally in guest user-space, and virtio-gpu backend library code.

Now, these capsets have been stabilized, and should be defined in
a common space, in both the virtio_gpu header, and alongside the virtgpu_drm
interface that they apply to.

Signed-off-by: Aaron Ruby <aruby@qnx.com>
---
 include/uapi/drm/virtgpu_drm.h  | 6 ++++++
 include/uapi/linux/virtio_gpu.h | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index c2ce71987e9b..9debb320c34b 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -163,6 +163,12 @@ struct drm_virtgpu_3d_wait {
 	__u32 flags;
 };
=20
+#define VIRTGPU_DRM_CAPSET_VIRGL 1
+#define VIRTGPU_DRM_CAPSET_VIRGL2 2
+#define VIRTGPU_DRM_CAPSET_GFXSTREAM_VULKAN 3
+#define VIRTGPU_DRM_CAPSET_VENUS 4
+#define VIRTGPU_DRM_CAPSET_CROSS_DOMAIN 5
+#define VIRTGPU_DRM_CAPSET_DRM 6
 struct drm_virtgpu_get_caps {
 	__u32 cap_set_id;
 	__u32 cap_set_ver;
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gp=
u.h
index bf2c9cabd207..be109777d10d 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -309,8 +309,9 @@ struct virtio_gpu_cmd_submit {
=20
 #define VIRTIO_GPU_CAPSET_VIRGL 1
 #define VIRTIO_GPU_CAPSET_VIRGL2 2
-/* 3 is reserved for gfxstream */
+#define VIRTIO_GPU_CAPSET_GFXSTREAM_VULKAN 3
 #define VIRTIO_GPU_CAPSET_VENUS 4
+#define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5
 #define VIRTIO_GPU_CAPSET_DRM 6
=20
 /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
--=20
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
