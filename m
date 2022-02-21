Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE654BDA44
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 15:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC0210E497;
	Mon, 21 Feb 2022 14:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01on2121.outbound.protection.outlook.com [40.107.23.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE8B10E497
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 14:35:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3b06mtELjrC4xLesr7rRamjC9nT2F0zAJy1KVyO1CbE2d+g1id1e8goJ4mWEUBqNfNxdpP4XKqmEM0sjwD+9FQ7oDosExC+CLE/5X3F6uqdyfIS215EkP32nddC1oiUodD3Of4SsYcLElMoKbO5X3iQgM8IdnnNyHgrQwXjrgzhbPgCHBWMGLNcMO9JpZOHDCL03zgmQaKO/chwyxDY/uiUUgxWe6s6Jk6+aspGOhuh1lnV4+qt1AiF0NsU52kmZSbogcp8WfNFIi2591JEcdKdH22t89+ZIaxF9sBfK853/kz17MkZUMSG/+tssxwaPi9UUErGHKEQE9PP348mrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNHeXud4n0DDP8xr4cnC8SHO/zpwGgoUC6EH03LJl8Q=;
 b=GMTQjeXUEdlIINma2p/jP8lrdcJWOvnggk5v2zBWMcU5eedltJV4EPcuNTFcz4c7dGznaLa/0eNtz/p+B/n94cJ185jD4/CBW4zDEspwl/CAuh5FUkhWNcC4aJJrHeNDIu/eL4+16fKQSndSspmImOODQTz07LiyCB0nirAeWCQTApZRbaFOgKYiXX+l1jeLWk0k0bRAcxo6XYJQr+HOtEnMNKzXtgJbAYl79I86XgoRhGDhNVhcFH7LzboTi/dBNVbcvLy18OhDrD23P/ZFkCRLNYjuge/NsOq/tVwsyOemf5ATSKQ9N1JBFh7FVXUgiDW2uNvligey/p4brxaiPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNHeXud4n0DDP8xr4cnC8SHO/zpwGgoUC6EH03LJl8Q=;
 b=kdTiwkrgwOM1KGYwj+whhUG80v+HoWZJhiPjOf8sWjKZ++Q9h3BoiI5cKLuQsINahIvGyPQTGyDeQf/f2tEGtbOwoCrSnffnVSdKeUjf093nfeL4DW0Y9EC6lEiFcCH4Ru1iOJYAUrSW9SxfEpBTV9ZcxzCATucBRMPCZ1WizVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
Received: from ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3d::11)
 by GVAP278MB0833.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:47::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 14:34:58 +0000
Received: from ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c4e:9890:b0f5:6abb]) by ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c4e:9890:b0f5:6abb%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 14:34:58 +0000
Date: Mon, 21 Feb 2022 15:34:57 +0100
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/panel: simple: Tune timing for ET057090DHU
Message-ID: <20220221143457.GA303652@francesco-nb.int.toradex.com>
References: <20220127114810.319121-1-francesco.dolcini@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127114810.319121-1-francesco.dolcini@toradex.com>
X-ClientProxiedBy: GV0P278CA0064.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:2a::15) To ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:3d::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4161cea0-4594-4951-45c0-08d9f5475614
X-MS-TrafficTypeDiagnostic: GVAP278MB0833:EE_
X-Microsoft-Antispam-PRVS: <GVAP278MB08339EFDD756502BE7AB7C80E23A9@GVAP278MB0833.CHEP278.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zB/11MH+CrcWbD3Mn/Tb5NmQZVGQa8AGVcrj99cMsMc6WvLkD6B+XQUg7rJsyEecW6EXSTzJKlKyfJkyIfAvJfcvgXQHFy7RpguYw+IP1aexG0vTwhnj8f7LTuZRrcRSi1L8P4OLn4llbL5S2ddQ7xbrbJd2pAjcLQl/Or831g2RwE/FiWI4ttXgU7E4FVcvPt5E0jQvKo96W1rQlFk+Q1QTd4qPgi6lK8FK79xPSCif3TQ1NVFdZGzq3y/AS2h7nayZP8AtuUB6erxITdcaaZxtTeLsB+y7AnVKMan47pqURRidBDvGEnjMNHJJAC92L338/Fet9HcUH2pUMXSd1zxVvpntw9IvIqpcYJcesgUgUB9XI1UB7EQKHUwk0nlV4aWbSJXQc3aN+dLAY/VJovsu9zebm4JMFCdWYMqcHzL5ixWF8N6aynwIcAuOLConYkZNy0nKg8/lvCrmvPNgayskA4lz3syfTEAuJZiKqKu2JQpu7i1TcDbg9djT2dXFKFyEwzDYh/5FEW2GJqT3TOdLRpPFj0dBlMAyU265RXI/KLP8/FjsshOm6rugBkjsBeKohbBPtNpuV49wQ+xmCcpUQgcl0dfvWbV/sq34wGMKCaYxOxcpfMmbt+YKCUUkQFdO6Bkn0T6l9pXHegWkj4Uv3L9YfFmIRD4cvsgVP8OicGkCXgDzjTms/BlNdXxwe0sDNZA+7xpqqTm1CN06wA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(110136005)(54906003)(8676002)(186003)(26005)(66556008)(66476007)(8936002)(5660300002)(83380400001)(4326008)(66946007)(316002)(44832011)(86362001)(6506007)(508600001)(52116002)(6486002)(33656002)(2906002)(38100700002)(38350700002)(107886003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GefHq9kJFbXqUQKyrXd+1iHIe7R3qOn9OITBXGYpEmK8GcoU+PbkZAmmxBOT?=
 =?us-ascii?Q?z8h+X8k3pdnDjqiEe3ZbAOvkkbnNN540p5JNxT/wsTfATrQnKyfwVQi8RSfZ?=
 =?us-ascii?Q?JG7sbGX9ukfoCELBy+xy+bDEubcwXJG08mSa31MHHHQDmceyE23jY2KBqO1n?=
 =?us-ascii?Q?zlb0V+KWa9mAHBTRC+PxZSRujqNh2v7sc/uSYmmJME/jgyaGqzYF6PeNBCMh?=
 =?us-ascii?Q?9G4Gni5cGOc6H9j3eN2vceANeMJcOsc5GbwRTXaA8IAgEN+Na5BRiATaBwfC?=
 =?us-ascii?Q?BkQcOcteqb8T8sNTgZdkPx82p2cu7/vU8xUShiEC17/hg+ZWAkKr9HEoUxcF?=
 =?us-ascii?Q?F2oFu5PT8SVaGqgFRP6F6HqAwHRZZmQJdJ5TeJnVXQQLRBJooHBbrjGjFELx?=
 =?us-ascii?Q?Lw+dxdiMgqgolrKZY9rKIzto9pbCtBzFlSDTV69XnfBF+FZWyjw2Ct5emWDe?=
 =?us-ascii?Q?LOF6nBu9FqY5hBPnzxQ82uqxExxv48JhlKFwPGro1q4hgYOysRrkmBw5Sfca?=
 =?us-ascii?Q?ji+vKK7LxuvUWFvxWdZ4Wm+a1saIglLKrmfcnLOAP45Dlq1VeVPxAg1Qdqgd?=
 =?us-ascii?Q?7xoArf7scbaZV8N0Vh75SLjW0AvPNWzEw/B0OBsjWrAH06EZksO+qeTOmSUY?=
 =?us-ascii?Q?xxF0EiOJSHbl2pGI67/6etWMu6P6ZM4lCFpQOhnH/GGPtbf6w7xaZPK63NOd?=
 =?us-ascii?Q?diPhK1nk7oc+hIpBMlKYxiIq7gnOq+eQUzXFlgqrxC94JaQjYuZAXpqEhmCt?=
 =?us-ascii?Q?Av2tX7ym5VSar+BZ2hi23tGS830kkp+SxvbQw8XUk6C95GPB/osqa4mKMT4H?=
 =?us-ascii?Q?J1hjRS/ya1EZP89LE8aXhF1mFcso9DLkKBkoP5sOlECnANMIwHGsoga92YyT?=
 =?us-ascii?Q?x0qjS5Awe+RSwttGG9kN4FrNJi673l8K80cmmJ2hw2/4Tgyx7s480ldzG9E+?=
 =?us-ascii?Q?qgKlfYuqagk2pTuzG9fC2MfcujijPRXTL61TJQMHafvpXDr7Wl/aiO42l22c?=
 =?us-ascii?Q?g616pqXc4W9FEzpMWN3hWiEvj/0QoYOrGn3tpVzIlGFgt1DYw67ALcuK9I2f?=
 =?us-ascii?Q?X8fl9k5R2jF7NYT6oQm8IaP3ywwPXVf7GCRxNYOdie9Vt6lWwBfFXT78VeNi?=
 =?us-ascii?Q?lOiaB+0rPOg6vcK8/5ylaMzfYs+SUWtB2ayRC7fDVKBlYaSCa8oDiooyKGil?=
 =?us-ascii?Q?X0sN/I3lMuhmNC/De0mbEdwPZZ+i+LnUdguzbLxgOskQWAtFtYgZeSvlhYrj?=
 =?us-ascii?Q?nfakAzrzVU76xpQUlJ3PvJaXg/fKQxIA6UlO8BkrFxSSleLPZo8yZ5lZXISJ?=
 =?us-ascii?Q?qbmdQVXpPrVe7jgqBfmB4gdM/+5buOt+ds6N9+RAZ9dMJqcN5kNbwDGdMnOy?=
 =?us-ascii?Q?qSS0j48PAsQB5XlIjqN2FWkYvUuXt+MJCseT8+NQUjrwB/ZuSt/sZSQxU//k?=
 =?us-ascii?Q?HZnHo4MypBnwdVTuEzub5Aulk1cLRxMSq/nBEkf2uZEU9WWkRi8gTWg2jMmI?=
 =?us-ascii?Q?cIth0qhqTVgGjAmJj/vWpmFj+srcHwJIbnbAG3JPC3lFRqkAhKet6FOfVqXB?=
 =?us-ascii?Q?zPlU2oa9pSf+Gg7oaZ8j8EjZ3CNZ6lKkp9muoPT59RbH4nn8iXVqqycOlAuz?=
 =?us-ascii?Q?Y2Dx9FTAiuYd2i3c9tOWm3q8uzTiXAA7iH/8rPkhNw2ksQXdIEH8R/6+Gidm?=
 =?us-ascii?Q?uK6wVQ=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4161cea0-4594-4951-45c0-08d9f5475614
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 14:34:58.6381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKeh9Quzl10FxpQi3XyQTaE8vbz9kJdOUB0Hs2P54hEotIQK6lI/Kv4SI0/Tiw4yJQpv4RI8OlXa51mZaTKlQrs6kznkT28SO+//kfksjuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0833
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
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello all,
just a gently ping on this patch.

Any concern? We (Toradex) added this panel long time ago and we are
using this updated timing since a long time now.

Francesco

On Thu, Jan 27, 2022 at 12:48:10PM +0100, Francesco Dolcini wrote:
> From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> 
> VESA Display Monitor Timing v1.13 has recommendations for the historical
> VGA mode 640x480 60Hz. These parameters are compatible with EDT
> ET057090DHU recommended timings.
> 
> Use VESA DMT timing parameters for EDT ET057090DHU panel.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Cc: Oleksandr Suvorov <oleksandr.suvorov@foundries.io>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v2: removed stale vrefresh field
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 0c8786ebffd1..52e936dd2d6f 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1598,12 +1598,12 @@ static const struct drm_display_mode edt_et057090dhu_mode = {
>  	.clock = 25175,
>  	.hdisplay = 640,
>  	.hsync_start = 640 + 16,
> -	.hsync_end = 640 + 16 + 30,
> -	.htotal = 640 + 16 + 30 + 114,
> +	.hsync_end = 640 + 16 + 48,
> +	.htotal = 640 + 16 + 48 + 96,
>  	.vdisplay = 480,
>  	.vsync_start = 480 + 10,
> -	.vsync_end = 480 + 10 + 3,
> -	.vtotal = 480 + 10 + 3 + 32,
> +	.vsync_end = 480 + 10 + 2,
> +	.vtotal = 480 + 10 + 2 + 33,
>  	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
>  };
>  
> -- 
> 2.25.1
> 
