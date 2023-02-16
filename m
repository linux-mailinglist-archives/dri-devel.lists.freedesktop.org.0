Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB1E6991D8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F7D10ED21;
	Thu, 16 Feb 2023 10:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0717.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::717])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AA710ED21
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 10:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVRSF3mHNW4f2N8txkjvX5Gb7iekDboo/kWayxWr7uxmA1zHjU8wsIqnjYXX6xHqoK/PE6VQFTsEPMwmtDSB68cGIvnMUqJEW67G+l6v0smfVkenltpaBD35Vbq4mHsTRD/RK7ISZhEq6di2/qR9RHZ6luktu1fupaxwCQEgGNk/wXt7jA958tMLdxHXxh9JmBJBGr7b41zDgdmTbeqCjsi9qQlMEE8GSCsJGFOY8czsSbD553C/fWPEiZU7byvhUt5RXLoaiWjN8GZFHjc+NeC121xSoj2EuyFK1LUsFFSXzP25NBX0V0mexPd3FselnU/LRaBC8NdUx/ZDyHHhgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iuBDrNe132npvh8xgi4vJsc4vWNjncpDBeeNRp7/ui0=;
 b=Zxdj13BhjSfbJiw2FYqjE4LIm7KfF4jxBNhvQM8DnSQs0UgnstdD/t+1n2KKORbYRzqcJv+ERf/Qhh7SKT5MkklWX2FmrJTPtRq8c+LfhwXKT5u/m3bQiQuuKtLO8Qu1tTlaFthjMdNGBzQQTs2Vww0o44K957yq8MMqgs+PZJisv3iccITzfo8JQVl6A3ass7h2/eIIPDpSU/6dD0fmfpbameBxMGZ6ge2WYev79IFEp9Oyvg5eCTuuN8Js/hXVMmOalogur/sNqyhP2IymZuz/6rPVldejZTeiszI1sg27RvSy1VhCDLTw3qAHKc7BoDZ/at7+OQPP67U+qv7bUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuBDrNe132npvh8xgi4vJsc4vWNjncpDBeeNRp7/ui0=;
 b=eh4BOvPREfZz4tACk5rQ0GuLYud9YYa5RNZNgzaXX8CKJ32y7jxTXHDmXlb1rBRppsP/NQEVhmWqPx5EDazEPwNFSUOe80XvkvneiWjXmYsdd4thuhiDsSyQvi5okeogGPhvW7DrwWAPTk/LBaJUxtHuQa/zlM1+PabK/O8By/YnafHp8zvZJGvEtoj3HaXBo80MTPE80blRPL7ex5jvyQkEhZd0KLa+RKdsYBIv6U5i26bCHh9lZEpSfXL/O1GVlxOf/Ub+fWlFN9k1+5U9MaAWaddwQhlzvNib4cD+3oBjZiCRuVZOuiP+hlTdkzUMPQnkury8Wz17+Zh99fA1NQ==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by AS8PR02MB7237.eurprd02.prod.outlook.com (2603:10a6:20b:3f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 10:40:23 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::46d6:40b:b9:61ca]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::46d6:40b:b9:61ca%6]) with mapi id 15.20.6111.012; Thu, 16 Feb 2023
 10:40:23 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Oded Gabbay <ogabbay@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 04/27] habanalabs: save class in hdev
Thread-Topic: [PATCH 04/27] habanalabs: save class in hdev
Thread-Index: AQHZPyL1R0SAail1qEm2awk2w/NJUq7RZ4aQ
Date: Thu, 16 Feb 2023 10:40:23 +0000
Message-ID: <DU2PR02MB75733C7D987BCCC7BA77BAAED2A09@DU2PR02MB7573.eurprd02.prod.outlook.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-4-ogabbay@kernel.org>
In-Reply-To: <20230212204454.2938561-4-ogabbay@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|AS8PR02MB7237:EE_
x-ms-office365-filtering-correlation-id: 04d7771d-b908-4e17-1764-08db100a3542
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QPSDHTdCyvAJkls7gsxs07S6D4nOhSLISZVkmEq1SnbL/M+x9B2Ck/4Ax7/ARN3O3rXDOHIJ6N6sqa+ZOVHi7Lb4nYxrpVYd+b4AvfPymsJOJxazPojVQG2jwC5JvQ4u9iP17LmyFmH1pkPN1nmOLHAIEm9vtjwqeCHJoFFYbS8VJl9CfII/AZ4dTB8wlVYtaYPtJ3EB0nhB4K6XXx0fkY14jjhZQIpMj+9eVhEHybHynADwOZeg97n0yW0GudgRd+g1r8Smc0xk7lfdhX++svCBgge97/2BMrz5oUmG+VnW9PMxJPwb+puOB4KYkzw9vJ9L0zI2lO+I39SKZFsnC/sfIiSR3qgMdy4p6MqRHNTjusb0VhlZTO698V/suOhfoPGZwJgZnrwRbtflwxYbin5IRusFfD6KJlXJhUtHcV0+ZHWhdxm9uI8S1l1p7YY72+H6cu1m+Ox9bmX6Wp+W4ihh34BsRqcbVPw0ASBHrXlqj8yV+fmm8NOwcDDurw57ZyqeOov3ZfI3Mfhrij6/r9oQ6bri1zy6OsLCKue8ELDmxTPVKm0V6NWWyLzxRUB6ymSYRzTAYUZMbjnIpDhkY+YeQGgE4hknW/SMH+g0TjMQ3JN0ymO/LO0gcw5JPHwcDtDdGHwpnrn7g4dsPpXtAPX56HHNn5ZxExyN+LY90KDjeVUQcZCCjmnh8PDYPJPdO7vXkD/PvaGhKxuMTb1zYg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39850400004)(366004)(136003)(376002)(346002)(396003)(451199018)(8936002)(26005)(9686003)(86362001)(7696005)(33656002)(71200400001)(110136005)(316002)(186003)(558084003)(53546011)(6506007)(2906002)(38100700002)(478600001)(82960400001)(5660300002)(55016003)(66476007)(66946007)(41300700001)(52536014)(76116006)(8676002)(66446008)(64756008)(38070700005)(122000001)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GESqjyTBA/CJ2Y/xQmpki6qAS3qLdcbcsGfgVGejuUVGsKPef7xaO9jnc5tr?=
 =?us-ascii?Q?spdeVg4fFHAxm67KpuYTgkiauqPxQSzItAIrNYCZ9XZMEzQy/TiXg7B6dYI3?=
 =?us-ascii?Q?iRtW1ayKteBSHGnaN7wQORQ5NrsUrnRaA7Zhfc+uU93gQd8ubi6z7JJULYpP?=
 =?us-ascii?Q?Ejngi7yPPN7kFSHyYZ4qr+DIpOZKFwEhEo9tucCSCebfYWlJjIY2Ntt4IEYI?=
 =?us-ascii?Q?veFez/l3PElknKNGXrN2S/9Ozu2Vdw1P9FankYPL/yG/T0cobMJfcXbIwEkX?=
 =?us-ascii?Q?5FFUuE1mZCK7NcyIKLNtxmE/WCtdmdPl0Jrx3Sp4TohuKWvrA4tpefvyVPA5?=
 =?us-ascii?Q?tWg4R7x+WTEq96TuWczwsJPFqNemjTRHqv47IRCwQbri2Oe5t+ivLuNWWDsm?=
 =?us-ascii?Q?vf7lt1o0HOVjYP8+lbXTjgUfFH5MDlfY76f5oNsxbm0SQhTRusMDuCui/RCI?=
 =?us-ascii?Q?QmPo5sgZNgMaw3th6AbvrnyxmtNq8SA1RLpeuKI+UlW6Iw3G1eA3j7RrD3j3?=
 =?us-ascii?Q?mk81ys/LCkbuXRZ/Lx5hpu87MBUNGMYQR4Mr93JCcFyVYr94uiw+ymwucI7p?=
 =?us-ascii?Q?DbSFXZOdWU0ntmaxXG9RRWl8ugjlqpHbvWYHmzr9C1Q5CoKmIVXaaG8WlZG4?=
 =?us-ascii?Q?e7bNdT6ETLw/Ho+J1K0DZnQLLKe6eRQT8N8+y+mfdaNU6EfzhUrf3DLv12VG?=
 =?us-ascii?Q?pplYqEhZB+EJyTqA2qgYdgbKFn3ob2vk4DM6qp1eX8uA9tqELu5Y2xDRQVFs?=
 =?us-ascii?Q?zjIYje8flJ4QiCtmmNK+HB+BDi/DpBNiCxIxiab81jG5KALc5Qx7OPtkUZUs?=
 =?us-ascii?Q?kyiqoYay2qRsPoNT78y2at2D8D66o7S7sRznawuKRKJFe+9mq9E7GSVcHwtK?=
 =?us-ascii?Q?UXQo1t8JpMtw6jJcKO7wkoT0NeDFRoJFxDlsiefdBagLVM9I80PPKYodudz6?=
 =?us-ascii?Q?/H+f6GDdV9QojKSlS6caMri1HkhyFiUfaOsqHexxvDaKByPckctZolcvRml7?=
 =?us-ascii?Q?cCe0AsffA2fMvRPNEMOcrhnu/8lZPk5MwEKKnWqpbyC3iyKV/s2xxyiOKVW/?=
 =?us-ascii?Q?AYIQr36AugVJ7nyU7wwkNIcSv31fxuedBP5nybW8IWXRnGZj+6M5fSJQUbWd?=
 =?us-ascii?Q?yf+ao9MYLazGTNWxHyAXZIJtSzi/6RdlzofuoCgiBeq0Hme+tN82Gt3SD29T?=
 =?us-ascii?Q?5O9yZfZKHl9g+UerGLjD7eeJhQO/rD4WCfgeQ5TXp7TB5mknliS3k9W93lt9?=
 =?us-ascii?Q?IBcUd9YMxmrqDlEHAIyi2J/WwgbPyXFNaZAdkOBRXQbo63Vw1TPt9h/ipSd0?=
 =?us-ascii?Q?MAmsPLffGSNes2QDPg4UtxluF9zbJqq12pu3v1JlFB3507VDP8pwL7qlH6Gx?=
 =?us-ascii?Q?00POAH/fQuHlJGVO5LGHOwVfo8aZlQxdkfH4qZjxgZl4+PcUmdqogrtJS8gT?=
 =?us-ascii?Q?S2jb3OcffeJFh+bSJa7aQdTz2ZcN2Q8XoXdRCndreWUsyTaXw1/pTFHRcPF5?=
 =?us-ascii?Q?MRDfcWXaHHWQfoUi9B0ubUa6vDP1Pw7F/2h2C2Jj3w4CEkYLytsLImuBZ992?=
 =?us-ascii?Q?JX18ONwn1+0ft+pgGds=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d7771d-b908-4e17-1764-08db100a3542
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 10:40:23.1673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +kZrkbC3kWxxHqkjZ2xTTy7vLNJeFctSZEtZWLiSBVc8e0WCIf7HTjbq+OdavhP7fKP3BFJslOSFSRfBHNbSKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7237
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

On Sun, Feb 12, 2023 at 22:45 Oded Gabbay <ogabbay@kernel.org> wrote:
> It is more concise than to pass it to device init. Once we will add the
> accel class, then we won't need to change the function signatures.
>=20
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>

Reviewed-by: Tomer Tayar <ttayar@habana.ai>
