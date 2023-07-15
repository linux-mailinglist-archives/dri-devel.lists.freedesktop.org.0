Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471577546E2
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 07:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE42E10E03B;
	Sat, 15 Jul 2023 05:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A7110E03B;
 Sat, 15 Jul 2023 05:10:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lza7S9xXeBSpafpLcSjixlRhVcLmXKJh4XViN7jfRJ6PdC8ScOx49jgy7f+eviHksGv46knjzLmsSkesHP+fQ5cR/+Sn6/qcIv6YOwfnMy3Bub3XyL8vOMWz++jcjl56d2yDRXVFvZt9w9N6vVQonBYYEw1H44FJWZQHCcY0fc0vInCSldm41hqKF2s/zfA1i2IBkpOa7oQyKX89C39Oth+XrtUc2jegU+h/iOrDR5+cdyFAi2egLu1teHjq9KUo0fV82v9n7ww2NjHp5PFK2iyaj8BCHSbXE7jx2lhVNboo8AbD0YiQEN8F6GE9IgdXu2rdFAa463L6AW4JmOtJiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHQiPb1keYpPpdcZmLoiVbwy73vEJxvmTS9BjjAQt28=;
 b=E5faBAZAepnhuLaTc4PoLf3j3amPHApckUWZug3Q15JpvlSBgpN5WVlkJAoRyHRwIDhge9VnX03Ep0TExPgEISJxxZDH2/V/i2SkQSxFYLezdxmv5Oe8KjTHUkbWtxx/ufR2Chxg7KlcK2MYNjbtgC0xD7dRusGOtH4gjVtqMqnUZGwHzqOaHPvvJL4xt80+fa5I51Q31Nl3Q1pFb6vC9NI7eZKBNjBIMlvGU+rG9HCQmnoPOwggEEQ5wARz0/zmIwwEhIZ5dWRf2FD+9yItfO+dfft12WHOEP8G0pBg4coNISFASWA3oY6e+i0KvDMWji2ySV4ldvrksIoXTNb5lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHQiPb1keYpPpdcZmLoiVbwy73vEJxvmTS9BjjAQt28=;
 b=jQQm0kXlAdicLXZG/0UwEStaU/o8bL723Z3Gzeox4B+UaqQLXtpc5ote/ntfsofmVyjLe+l7uEm9TYAKHRltoGrPvE5E7zehNLaXL6wmKJ04Mei+mLm0dlWqxmeCXqH6QrL4jXF1xgIyW1ur1gUhWRRPuJA+Ybh7pAinGQGvJRY=
Received: from MN2PR12MB4128.namprd12.prod.outlook.com (2603:10b6:208:1dd::15)
 by LV8PR12MB9359.namprd12.prod.outlook.com (2603:10b6:408:1fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Sat, 15 Jul
 2023 05:10:21 +0000
Received: from MN2PR12MB4128.namprd12.prod.outlook.com
 ([fe80::3739:2458:832b:bcbc]) by MN2PR12MB4128.namprd12.prod.outlook.com
 ([fe80::3739:2458:832b:bcbc%3]) with mapi id 15.20.6588.028; Sat, 15 Jul 2023
 05:10:21 +0000
From: "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>
To: "shijie001@208suo.com" <shijie001@208suo.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH] drm/radeon: ERROR: "foo* bar" should be "foo *bar"
Thread-Topic: [PATCH] drm/radeon: ERROR: "foo* bar" should be "foo *bar"
Thread-Index: AQHZtlRCcWt8DYZ9SUS9rfIqQ8pYVa+6SDkQ
Date: Sat, 15 Jul 2023 05:10:21 +0000
Message-ID: <MN2PR12MB4128493974ADD3F52EE304119035A@MN2PR12MB4128.namprd12.prod.outlook.com>
References: <tencent_09B72958FF97A0465961F04F38F298FE6E08@qq.com>
 <22e66975eb7b90c1e10527cc6dd76e99@208suo.com>
In-Reply-To: <22e66975eb7b90c1e10527cc6dd76e99@208suo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=04be9b7b-aa88-49d3-8273-4dfd9977871a;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-07-15T05:09:03Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR12MB4128:EE_|LV8PR12MB9359:EE_
x-ms-office365-filtering-correlation-id: ae682383-4d85-4dba-18b5-08db84f1c9dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HNqWbzEKXPVCREDXbiSoXsL9LOL3Hf1YcBweDJEX0131IJFw5DmJifuDJqJ0wSbqCeDRf1YD7WkQf04g8nzlimZeCLC03kI5tZO/e19C7bIJ6+CPj54Fu9qYM5qBBF22Rv2DW3qmGKJ3gbW3WKTV9KYA/bxULUwix41rQQ6ooyAwoSf9POXjTfZwWZDrPwIkmQghCpaQFNeKqz7HQU1m9FmiKzZqNr3zORFgrCphh0tljbiX520Fk32eYRe+yp+ASGz83kip8EzW91rpyiwRnVey8thZ34odUenIrcdhLyJ0MX8t5Tzo4/U0pZUmZFKGL0Wtz1AwnZjjGVn0xj+6nV99BIXPCo5WMnLtI015qyFGs5T5Ep2yqGRXLG3rLFuqEXmRl6bYW3LWKWmXk133ohZBhQewsxkCu9znr5efEcHPfljm5xqvSPs2r4JMMFP9+6pBm7GYZ7frbIGW6yhqtFph2IrE7R99upxeAfADZY6RffpqNgQd8PrGwVRv/zugkRoLFAT9kYQvDx+3BLRCV4P/ylHLiEpf6Y7K4gPLn+uTSiojNRwOm+WJR7zltl/LhdqL9+kepJouYwmB2bmAyR9RuUwvHFpzKOgDv/mBCfvsgt7eK8lkn8fn0teLoh3F
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4128.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(2906002)(83380400001)(38070700005)(52536014)(38100700002)(122000001)(55016003)(41300700001)(4326008)(7696005)(64756008)(66446008)(66476007)(66556008)(316002)(76116006)(66946007)(9686003)(8936002)(8676002)(86362001)(33656002)(478600001)(54906003)(110136005)(71200400001)(186003)(5660300002)(6506007)(53546011)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iqkWKMoCCdUw5Hp1p/Vnssnbb5eUMGiIJkvTLZdZ5AJY2NcOZtIyMrWbMwnq?=
 =?us-ascii?Q?W1K43M7VpQ7yOmSzVwV6QJSIPIieGv/em5WHiDJV43SoPO+LKw0y04xBnNAG?=
 =?us-ascii?Q?NHQqbu/9X7Jx9vORO4wGD3/vYhC/vj2BTZlSM52kktJedFkYrNW+tu6efneZ?=
 =?us-ascii?Q?4AtnEQ3NpvORmi0QHv3m0TUQ4gRfQXO59hcTbGLUcpM0vbUjF7+mGelcYJjH?=
 =?us-ascii?Q?3oiph86UUZHqKzyjMmZ6aeoC/UVVdzXpC4rUn7GZh0F/r/1TVc8pvnvudmEL?=
 =?us-ascii?Q?U9XTac+jvFwvVnxHrjr335YaQudu9TDsbW05YYQb6ptqFxsEy5a1pnNVxMia?=
 =?us-ascii?Q?GL3oIHkHvp9uXBQktjOQ6kbMzfO1Cm36l/pzXVIfl+1jrJPmyAtCUNEgfVSt?=
 =?us-ascii?Q?nGpmvJALdD7iPVKKIbJUNa9TYkWZFt8cVaxfwHX/tYcVAf4tEriLW/YifQiy?=
 =?us-ascii?Q?xLeeXm8mX2hYlxLTw6777hbX9BRmh3asYBA5p2WAPDUr7td9YKTzOFwevSAE?=
 =?us-ascii?Q?PK7xaDhlsq6PXZGnhInIOafkiMMQ2w6jXC2aZnAGD7f0O4TTcCIT8I57nHdL?=
 =?us-ascii?Q?r96v9n8fg11E2OywHkstm3Ecn70igc8s2+bdonOdpddgOdQ1LixQRcNnR2vW?=
 =?us-ascii?Q?aizmZSozcKoHmo0EIr+vhdcbPg5tZx2kNyC4UJHdHVu8j3SWXprie6TSpWx3?=
 =?us-ascii?Q?rR0sVkzWLHAXKyiuHWW3dQIaMhGw7WBr1xOAXzAdGn3w7ggIOjv6FV8dYJqy?=
 =?us-ascii?Q?e89rtGFdepnqF056nCpxOqGz204VBJt0KMwh5pBoG/IJnq/GCc3g2nCnAj3u?=
 =?us-ascii?Q?X6648fnUlfAf6WivvLzONuSpbase7n1Gs6DB4xY39DAdlOtDccOnVadGNKJZ?=
 =?us-ascii?Q?JTR0Ujd0uA7hFMhMO8y149qE9ewIluVj6RYt74rv2H6FAiltE+OuAxCV32p9?=
 =?us-ascii?Q?RUz0ghgMbpOYvsqEgoar6DmL4JsAbW2kLB1b26d4E/QDWliyWR5xkqAfFs8D?=
 =?us-ascii?Q?Z5TzEBzbBTtxcW8EYPIyVhshRe6NmzFx4SF0+BPh818KmH2I+F3Y9DS5Fpu9?=
 =?us-ascii?Q?+c6K2BZfLBCiUtxKK8MkgGE3huT2JAfPkhltVjjO0OEvYmx3Hhkb03t9h9EB?=
 =?us-ascii?Q?sfK9Ea69TIx4wox/hYYdQq08/SpSxenA/FP/ONDddISAqqPFikIJVvKkVPNN?=
 =?us-ascii?Q?/+G/c1M+dLyQGR7hfedwdEGnoNEzGWxyl5aKu6V2PWNJWZ9LtMDNMHncJFuL?=
 =?us-ascii?Q?Hk/09wb4RjGYY64QTs5j2uQayDBK9YdGvhVtImFsun+zW85NOBCVssWpYGNL?=
 =?us-ascii?Q?c0GNFHjnnHQb5W1QkE094f9ex4sGxd+hpn+L/dGlelGeO6sLyOsxKTxK51Tu?=
 =?us-ascii?Q?jkgFYWjF3vROXoqcii4MwIBUGNgtB1+/xASI7hKRaiteO8AZ6PdAIXq8Cp6v?=
 =?us-ascii?Q?/oRY6PqTInhSoI9GEa+WCpYuwTM90xNQ3gvw00AF9CpBqZj07xhuHmuwhb5N?=
 =?us-ascii?Q?CQxAcEefdC0MhCX4bzE4yNMmKOh2c9sa1f5HhkJ0o5FxxL6Ksr/A0+Cm5V2k?=
 =?us-ascii?Q?nHq/WxPJPaV1k7VBDAA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4128.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae682383-4d85-4dba-18b5-08db84f1c9dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2023 05:10:21.1631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ftl5t+AcdnAO0syjEdBrHfd0y3jUzgGcBxLtdtJvozlj1GDI23WrDQ95XbT+dbCa3FWMQCs6X+KiIeVVFJVqFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9359
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Reviewed-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of shijie00=
1@208suo.com
Sent: Friday, July 14, 2023 1:36 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Pan, Xinhui <Xinhui.Pan=
@amd.com>; airlied@gmail.com; daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; linux-k=
ernel@vger.kernel.org
Subject: [PATCH] drm/radeon: ERROR: "foo* bar" should be "foo *bar"

Fix five occurrences of the checkpatch.pl error:
ERROR: "foo* bar" should be "foo *bar"
ERROR: that open brace { should be on the previous line

Signed-off-by: Jie Shi <shijie001@208suo.com>
---
  drivers/gpu/drm/radeon/radeon_audio.c | 11 +++++------
  1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_audio.c
b/drivers/gpu/drm/radeon/radeon_audio.c
index d6ccaf24ee0c..a010bc2c155c 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -35,15 +35,14 @@

  void dce6_audio_enable(struct radeon_device *rdev, struct r600_audio_pin =
*pin,
          u8 enable_mask);
-struct r600_audio_pin* r600_audio_get_pin(struct radeon_device *rdev); -st=
ruct r600_audio_pin* dce6_audio_get_pin(struct radeon_device *rdev);
+struct r600_audio_pin *r600_audio_get_pin(struct radeon_device *rdev);
+struct r600_audio_pin *dce6_audio_get_pin(struct radeon_device *rdev);
  static void radeon_audio_hdmi_mode_set(struct drm_encoder *encoder,
      struct drm_display_mode *mode);
  static void radeon_audio_dp_mode_set(struct drm_encoder *encoder,
      struct drm_display_mode *mode);

-static const u32 pin_offsets[7] =3D
-{
+static const u32 pin_offsets[7] =3D {
      (0x5e00 - 0x5e00),
      (0x5e18 - 0x5e00),
      (0x5e30 - 0x5e00),
@@ -359,7 +358,7 @@ static void radeon_audio_write_latency_fields(struct
drm_encoder *encoder,
          radeon_encoder->audio->write_latency_fields(encoder, connector, m=
ode);
  }

-struct r600_audio_pin* radeon_audio_get_pin(struct drm_encoder
*encoder)
+struct r600_audio_pin *radeon_audio_get_pin(struct drm_encoder
*encoder)
  {
      struct radeon_device *rdev =3D encoder->dev->dev_private;
      struct radeon_encoder *radeon_encoder =3D to_radeon_encoder(encoder);=
 @@ -526,7 +525,7 @@ static void radeon_audio_calc_cts(unsigned int clock, =
int *CTS, int *N, int freq
          *N, *CTS, freq);
  }

-static const struct radeon_hdmi_acr* radeon_audio_acr(unsigned int
clock)
+static const struct radeon_hdmi_acr *radeon_audio_acr(unsigned int
clock)
  {
      static struct radeon_hdmi_acr res;
      u8 i;
