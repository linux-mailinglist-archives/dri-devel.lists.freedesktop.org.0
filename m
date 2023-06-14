Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5798F72F5F8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 09:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3A710E100;
	Wed, 14 Jun 2023 07:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::70b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C398B10E0AB;
 Wed, 14 Jun 2023 03:49:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1gNg6RASD24kpC8YR3F6UdHDx507rHUnxW+sOEXCYsiCdH11K3VKmBGFO5jH7IE2ewYnBRToRIc1WxzaUmmcaNQk9HSSbTtMMVIaImClnVQ+Jq8nvHdjSlTn+y1+V7+VbU/ogiNfWodn9b3tB3kG2Avot/tKvNgGR/Gsz6oVBtxgqQRQfy2BTvwfVR1vG4J3LNVQa63yaKZlsN5czSCEsPBWIaOAnOzZq8yn4hQl7V+C/Su+ZB8jiNQGpXAf9OdLmcAhCLTghY6ilfAau2Rp81BngRaKVKFULtIFGE2V0E5nG0ezTFRK0MBed+yIrNy897PDXWVlDq5aCsgXwMJGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg1MjGA4EeBDR4ldMR7wOv4EYdw5NCW/+aTJKjGqxxU=;
 b=G/vuGqYjQFdNj5XTf0oSUrlYl/s/9x7ZO+FudaqKrQsn6i+i89Bo7fMVk7HnAH64F0mmgc/9BR4s3TMMAY3myCjaOoJdyqEMjGIy64RZpAFtMHbXbdkcwP/mE+mMAVLnQwwTE9z8yJEsfWZ5QqCU6Zahwldl9y40uWCm/NrpAzLX1bFct4U2B5fKDpqvDuEhN5SD9HvvjddkQ04Z/TbkWYrSRT3nwrXqKuPFjsmzkyi0egs2VpaWHYjsqY2/dpc7rwe9klMYU1f07iF23KOrtAhhY8GSIU919Xkra0pkkg1331IM+L7Fm+h+6vtQzUhFyN9yQnz7oS++zwMgWvc6rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg1MjGA4EeBDR4ldMR7wOv4EYdw5NCW/+aTJKjGqxxU=;
 b=c8Fjgw5g0MNNf0v5/+r3tySA2qTHC7JA/Is0HZlmwemtOog4OY8Pq8xoXEFyg9rgWe8fxpvtY+l99BR1MlMUbG7u3rQqLzPEdNJUft6+rNSPlP9NwqxGIsSvs2LfOUgrEVamEfTDN9nO1jmrFW4wuiejXjkg2lAX4y+TSZ9LXqHChuiMCXtH4DGPAPjT3TS/QA95S0hxK9dh3mIZs1Cle2k5m0/HeZYoNu6sZg7/X3gaJ1TsiAdU4VQuCD5gPFP1nf5/QaLOaxKdWfTvAHcmGHeFeeechqCuVFfKh928LsZR8DmK7hQJsxQANQ+7XPZ5MamYXcG/enf8bxr/siRfdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com (2603:1096:4:d0::18) by
 JH0PR06MB6797.apcprd06.prod.outlook.com (2603:1096:990:2f::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.31; Wed, 14 Jun 2023 03:49:51 +0000
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::7dfd:a3ed:33ca:9cc8]) by SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::7dfd:a3ed:33ca:9cc8%6]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 03:49:51 +0000
From: Wang Ming <machel@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Wang Ming <machel@vivo.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] amd/display/dc:remove repeating expression
Date: Wed, 14 Jun 2023 11:49:23 +0800
Message-Id: <20230614034936.876-1-machel@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYXPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:403:a::14) To SG2PR06MB3743.apcprd06.prod.outlook.com
 (2603:1096:4:d0::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB3743:EE_|JH0PR06MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: b4869103-8dff-450f-bc87-08db6c8a67d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pzyDFYdlaT4O7JuxzAsq0eTYza62XBRqz6vEHpX2hk1FWYHoyugNAH/kADViVzmGvhY7a0cnAvW1z5uimuIVP7iPyu0UQvBx8CuewcfHcN6nLZjNTfpCmziTNCVwz0OtcvONa/MY2KEwYxKenF//kan81eUYduvnL7ETF4Rak5sQqLkyCQtjfsXr0kJs6qTdok2ijOGGyaScTH+v+hxeOju14DnlfyyZA91+QjwQOOHMzK2+eJHK3GbHOU4ckF6xrQY7kg619/ArRyJ64VWBBY70vCg9nSwLqwqsWTOAjQ+kMArfZrbY+SIBHJqSGLCQEejX2WttOq1vB6AV5F2jGjgB4gUnXRMvR3/JU4ICOV5w71Suae3vsizPCEhBXMNqbn/QKSSWmnazkgwfCOgZ/MESUWOfRrvWE3zeMiZB2NOUaCmcIS5oLC8RKJKHaNUl8/HeqGx4cHNRlQMkLlxSCVT29s39LIbgMjWjWdvacGScRz7FrNDU2IGRdGr2JhiJDkvIPxnnxGp1JB4UEVtmX7xBWSR7GFINAAUYJaffYhXjUQbxLqWWpO3amwmDAM1uXaPLpXVyo0iyaro8vg0ny6MWD3iO6ZKVvIWEs/MrpH+IOjhfC0intvYH3oZkxwM03mT3DdHuRACxOacSa42rwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3743.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199021)(41300700001)(8676002)(6666004)(8936002)(5660300002)(4326008)(7416002)(66946007)(316002)(66556008)(66476007)(110136005)(36756003)(478600001)(2906002)(6486002)(52116002)(38350700002)(38100700002)(1076003)(26005)(6512007)(86362001)(6506007)(186003)(2616005)(83380400001)(921005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+k77ozdF8enZIcBfJla5UsncccRBY2IYE7JORBKLfyGu6oHmsqtkFzX1RCTm?=
 =?us-ascii?Q?jCvd5FeCJp/AOM5jcQpVQTtyOwYjswp91BTrabZLnU4WqPItTAsfhycJYlzQ?=
 =?us-ascii?Q?CIbjTKJStVx8u5uh0tbn9ih2ZneWjTsUWRUTPLfo9L8ovaJDsvuOI2+eKnDP?=
 =?us-ascii?Q?1jwS962mXQ9rQ0TLQTYRBxF/zGUSwoqBZAX40EoTY14bDiKHA+aH1hpvdTEf?=
 =?us-ascii?Q?AEduMetWot2P+S5QrfaB/lhgWVr7hFJ4k3O8+uT6W/zByNz6cOCFJlPT1yD+?=
 =?us-ascii?Q?kjpsHH+TdX5Dhe2RMgEb5UtCI7BwjcjzNpiM1jspabw5kGFUqB/mnVGuRCh/?=
 =?us-ascii?Q?PyNzaIDeyGIG7HYxEGGtUBJojb6YGokzFySDLSEkvv5KyWMmxkpIlhJEyJNF?=
 =?us-ascii?Q?AtKlwRoUR29rUCS7tGOGIZry7DuF0n98+ESZlPuGClrB+19r+7NyipbCqkCL?=
 =?us-ascii?Q?7LOVnBAkvlK9BeYPwNtkcOMktcWhRCgCbPlb3F/NsIxFpQyA8XB6G2J/EIuy?=
 =?us-ascii?Q?2Ckyxzl0jUpGV8j1cC9XK6HW9fUjKLC4jIjPndrWSjqAgicbHl4NULXGKE90?=
 =?us-ascii?Q?BuzRBkmxVI1yaBiWEPGgXtOqfqcUGl/BjIaHe3W/MSmlVfnH60v5+KNRoLSw?=
 =?us-ascii?Q?Yc1vNTVDCt2DgUpE5poZ5CYN4y3VfcfiK5fywU1Is+gbyDbVBI0/F97XHgIN?=
 =?us-ascii?Q?mUvljOr2DxrqB2t53NJQdjBjxIJj1/52cHP7H5AkLPJqBrl3w6SlNgbU4Db8?=
 =?us-ascii?Q?7C78hWJlDR/zGy9ZwRJbD5XDjwmMRd9+zGaiNlKNYuGk9LCgCwmE8iXU6PBB?=
 =?us-ascii?Q?mnKxL2Uza7mYDZhZr0EUxOKbZqTcaW9OciDz8jFs9W3gcydL4+2gv7HNaZ/K?=
 =?us-ascii?Q?UPynhyby3SO81rI1s8DjD2K8ekxCx3nMubZY0Mq1B+5L93GWwYgVlxsteXWF?=
 =?us-ascii?Q?UEEtRmkkX+FdebnZBzeXBb4dlLq3u2a0XT2gphmsxCPacQBS1Cz/Oh0B7ILt?=
 =?us-ascii?Q?MO0Bx0zzkyxo9FMyTQ3M4LFIZU43nFeLJaJIe+t9WqVrsVplcBnfGKP11qk2?=
 =?us-ascii?Q?RPW4IN9t7r5e8nirLaCKmtiffR2xg2ybztGFR+lsatTHOED4IA+UW+9HhQ9P?=
 =?us-ascii?Q?DXwgdX3Wx0JWSa5WNyBBQAkEGuGqfM5n7Zi6gOTAfGuzxsxKBmpRWZTRWMiC?=
 =?us-ascii?Q?WZLF2l3s4dzyV77lsHh4yorGJW7/+MjJhz8EmCH0BbI1bi2Z5WPU3sBr4YG7?=
 =?us-ascii?Q?v0Mtiwf5l7+jo6Gccfguh2rCXftu5qD78IJEKBRpYAS2dOv7d6/iZ99HOcH8?=
 =?us-ascii?Q?dgw51PufXKoxieO5M2IPKW0E0gLC6Fm1MXGMNdybyTUR2K/M6d0wqa/s5HWb?=
 =?us-ascii?Q?uYGEbnSVhFGqXwjhh3sSf5J91cDr78HLTdBmQm1v8kBn89IiqYpiZvXQCILl?=
 =?us-ascii?Q?lEFkfcKU+S4yMsaHdL23NFiqW4zOv04OwCBNItebqOL1UKGnel1ktneKTfhv?=
 =?us-ascii?Q?PB/YmmJ2C4L/kuLDhKMqjAYcJtaSzHBwVtLVfWS29fpbfbMJOz/KcADR1y4W?=
 =?us-ascii?Q?IE2BHQCyhODXXmQviZgjDvO17pe47Ywfk4/Hx8n/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4869103-8dff-450f-bc87-08db6c8a67d1
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3743.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 03:49:50.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhqES1Fjrj2FlhDlozaGfmcf2MNcbHWGtyDIiwFBMC/EaD/b2cR116IPX6w12fcFjQUS33doYr6M573lkJMUTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6797
X-Mailman-Approved-At: Wed, 14 Jun 2023 07:20:34 +0000
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
Cc: opensource.kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Identify issues that arise by using the tests/doubletest.cocci
semantic patch.Need to remove duplicate expression in if statement.

Signed-off-by: Wang Ming <machel@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c b/driv=
ers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
index 0cc853964..b419a04ef 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
@@ -1610,7 +1610,7 @@ static int source_format_to_bpp (enum source_format_c=
lass SourcePixelFormat)
 {
        if (SourcePixelFormat =3D=3D dm_444_64)
                return 8;
-       else if (SourcePixelFormat =3D=3D dm_444_16 || SourcePixelFormat =
=3D=3D dm_444_16)
+       else if (SourcePixelFormat =3D=3D dm_444_16)
                return 2;
        else if (SourcePixelFormat =3D=3D dm_444_8)
                return 1;
--
2.25.1


________________________________
=E6=9C=AC=E9=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=BB=B6=E5=86=85=E5=
=AE=B9=E5=8F=AF=E8=83=BD=E5=90=AB=E6=9C=89=E6=9C=BA=E5=AF=86=E5=92=8C/=E6=
=88=96=E9=9A=90=E7=A7=81=E4=BF=A1=E6=81=AF=EF=BC=8C=E4=BB=85=E4=BE=9B=E6=8C=
=87=E5=AE=9A=E4=B8=AA=E4=BA=BA=E6=88=96=E6=9C=BA=E6=9E=84=E4=BD=BF=E7=94=A8=
=E3=80=82=E8=8B=A5=E6=82=A8=E9=9D=9E=E5=8F=91=E4=BB=B6=E4=BA=BA=E6=8C=87=E5=
=AE=9A=E6=94=B6=E4=BB=B6=E4=BA=BA=E6=88=96=E5=85=B6=E4=BB=A3=E7=90=86=E4=BA=
=BA=EF=BC=8C=E8=AF=B7=E5=8B=BF=E4=BD=BF=E7=94=A8=E3=80=81=E4=BC=A0=E6=92=AD=
=E3=80=81=E5=A4=8D=E5=88=B6=E6=88=96=E5=AD=98=E5=82=A8=E6=AD=A4=E9=82=AE=E4=
=BB=B6=E4=B9=8B=E4=BB=BB=E4=BD=95=E5=86=85=E5=AE=B9=E6=88=96=E5=85=B6=E9=99=
=84=E4=BB=B6=E3=80=82=E5=A6=82=E6=82=A8=E8=AF=AF=E6=94=B6=E6=9C=AC=E9=82=AE=
=E4=BB=B6=EF=BC=8C=E8=AF=B7=E5=8D=B3=E4=BB=A5=E5=9B=9E=E5=A4=8D=E6=88=96=E7=
=94=B5=E8=AF=9D=E6=96=B9=E5=BC=8F=E9=80=9A=E7=9F=A5=E5=8F=91=E4=BB=B6=E4=BA=
=BA=EF=BC=8C=E5=B9=B6=E5=B0=86=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6=E3=80=81=
=E9=99=84=E4=BB=B6=E5=8F=8A=E5=85=B6=E6=89=80=E6=9C=89=E5=A4=8D=E6=9C=AC=E5=
=88=A0=E9=99=A4=E3=80=82=E8=B0=A2=E8=B0=A2=E3=80=82
The contents of this message and any attachments may contain confidential a=
nd/or privileged information and are intended exclusively for the addressee=
(s). If you are not the intended recipient of this message or their agent, =
please note that any use, dissemination, copying, or storage of this messag=
e or its attachments is not allowed. If you receive this message in error, =
please notify the sender by reply the message or phone and delete this mess=
age, any attachments and any copies immediately.
Thank you
