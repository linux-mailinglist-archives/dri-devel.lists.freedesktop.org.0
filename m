Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 533CE270C02
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966F06E1CF;
	Sat, 19 Sep 2020 08:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770125.outbound.protection.outlook.com [40.107.77.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95046ECB7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 10:06:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHz2evpO/gCC2D965Mnj0TmsqFd0dvnfXhDgECkwu1YoAhhMk2UgiPS1HWsmuev+GzyfqWbKrlP5SrJBb3b1TN8HBNQEvPt8EcS5wXL0afzvv6jsNHpFrI9xPNGYZE0ab08JGRdi1pTWJv2dHjVy82WzLO8OVvI2L+vXo98LI7eGrR6LcYONsIcldtk9ZtRtTzzvBZl3X1TkavTNnUw+FlTRxPP9wjsro4bkoyBi6MIiPhhntdisGJ83F4ukhrvutN/T9Wcxhu1OtUfOXh/OPtsultXgDsviS5ZJDloobgMjkeNYhNzznVJsTyBNL7m4sZWFFHUWwaRgNoofy9ZbrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GOa9I9E5Rw+i2I7d+2eRbuch8sNPGq3arZ2d5/rK7c=;
 b=XLDvDfUqWFv1XLcOwPXgjSl/TurAIenMhzXp5Gu30EhMxe5XAjxzzeBENm63UDOmUEkCoZdokUf+lzfxE7RVHXTPE7IYBx1/QQtvRHLv11o0Kgzh7BYKOhqlPzQXbSB90cckEzMAdVb+8Gdmc/Y0HHj60qNkER/6ed1wbOSQCQZfPpdn2bqbtIfGpy/ycFfdUvtRUzhGnnL/qykD9Q18Py+Z5m8mceFzABP/60i+2ftmflxHjc1VFLaPE7SoTq732PcAqXUQ0gaVvIFYabmUWM9vYjru1qNHnhCqo5Lw4i+XKajwTLznOM2MugO8+tEQonygCyusZ8m1vmA1HJmTVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GOa9I9E5Rw+i2I7d+2eRbuch8sNPGq3arZ2d5/rK7c=;
 b=aDkx7s/jqUg3892r1s83NZmh0M3oN59GPtOLMYowotukFLRYKzmsn+6IAtplX0Xi11wgj4f/IplSRuB9umYM+C+e18ZwMit/v06N49EOodJ0kkYLITIIEyP9uEGS5icmenkNL94B99ISVw2z70M+HdRoAVbcX8mfo7sSKxYbeHA=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5624.namprd04.prod.outlook.com (2603:10b6:a03:10c::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Fri, 18 Sep
 2020 10:06:25 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::1dc0:7d4b:9820:e68]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::3c04:982f:7d75:779e%7]) with mapi id 15.20.3370.019; Fri, 18 Sep 2020
 10:06:25 +0000
Date: Fri, 18 Sep 2020 18:06:17 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v16 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP
Message-ID: <20200918100617.GA13792@pc-user>
References: <536a274e38d994817c6d0c118f7f8553e74f73c9.1600324895.git.xji@analogixsemi.com>
 <20200918084534.GV4282@kadam>
Content-Disposition: inline
In-Reply-To: <20200918084534.GV4282@kadam>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:202:2e::23) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (114.247.245.146) by
 HK2PR06CA0011.apcprd06.prod.outlook.com (2603:1096:202:2e::23) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3391.11 via Frontend Transport; Fri, 18 Sep 2020 10:06:24 +0000
X-Originating-IP: [114.247.245.146]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ca03eeb-434e-4b80-420f-08d85bba802a
X-MS-TrafficTypeDiagnostic: BYAPR04MB5624:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB5624EB1792AEA71F1C91FF42C73F0@BYAPR04MB5624.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:16;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZHnc0GZw6OEkh1Bcyl+bQKlwwJhVsSZnGTaI9KVgGg2r60HuYUEJFbP2DGt11k6HhVqzC3TSim386dmr651DnW4vvPvXyoif8JYf53WHLRdZqGS2G32ZGGfBNATuf31U9wohg8sDGQYx9FT7Bugxdzsl0nbCi/VTcq4rSHsUYBAPpeKbUNwV5NU5pAcr8Fo/XE1ae3A1ZpNHP7ZXdzfCLzgdBFwsc0Wzy+o/bqeL/6IOZjiVZnTSBhnc2pNh4IJiOhjS/NXKVgXT02lGkqKz5v7ReToILifiuX/3jAggVs1LbYtuJfHxinTtX5mCI9pEr+dMt87rycF2iIM4D+dK1RWUB175HnjkkS2L1BYAshD2gRoRTShIgmFTqTIKQ0UgE3v+FmxF2ns2iCe1kE0nlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(39850400004)(396003)(366004)(136003)(55016002)(2906002)(6666004)(16526019)(52116002)(26005)(66946007)(33716001)(4326008)(107886003)(6496006)(83380400001)(86362001)(1076003)(186003)(8936002)(33656002)(8676002)(956004)(7416002)(316002)(54906003)(478600001)(5660300002)(66556008)(66476007)(6916009)(9686003)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: gghywm3lHwOK+s/LdQD7evvtXXMQ2YHvVxHGf3Pjw0U3rkbJomwELxkfMq/9pE4AHDZc5ybflXOvA8lffeBQpURDpcM+bJpnUDqvQK3d2ayBuyzl6w6TbGXe4v9FYrKFYi9VppTH+ERc30nUv4CYMlXEnmUSzLI31EwsgUc9vWNBTXiOr5/i8ZInXrReHo382e58zDMOAOY8DlIANPom0M5tnU9e304LRcj56zgWneW74b4aj4zqF86CuxnW/lQvpjneer/M/E19S3OVu9j2CwPStL1xvQxstX8lnLaYz+aukvpYp/g50ogftWtLUklG8wy2Vh/4zwDrJ1ScqNEjzGcqBFjXNQ+7YflqsK4qst0EUcsmDp1HowD3sWf+clurmiM5cGW0w11bevVlUZ8c0ba0jzRe0g2LKMOTliTsQrggGbZhqfSyR0iTFhAUm0gMajkBsViKt5Uftwz6nzwezRE6gEQaU+uCTtLV2Picy3wzKYRUX1D0kecCrK9eSij/dGy9Q+BoWABq/HSjuii5R6BGlm4OwuyLvR0CL6cd9z93tS+5mG4njmUjHfoVbLEVIi+gk3IRbuEy5PnjOjFDYGDA9ezhTbyOJGcemghshefPF2b4EKktxZD+LpoIo3efkv9Pa6iFLXQ8NHR1RSnwRQ==
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca03eeb-434e-4b80-420f-08d85bba802a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 10:06:24.9753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNP2mMyYRP7p84Yb6EEHgpxaftVfKLm+8mBrOWaetCdB92QvgsHJPkGfeGM+cXYWOL0Omim2tqMP53ruO1khYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5624
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Pi-Hsun Shih <pihsun@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 11:45:34AM +0300, Dan Carpenter wrote:
> Hi Xin,
> 
> url:    https://github.com/0day-ci/linux/commits/Xin-Ji/Add-initial-support-for-slimport-anx7625/20200917-163238
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 5925fa68fe8244651b3f78a88c4af99190a88f0d
> config: mips-randconfig-m031-20200917 (attached as .config)
> compiler: mips-linux-gcc (GCC) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Hi Dan, OK, I'll fix it right now.
Thanks,
Xin
> 
> smatch warnings:
> drivers/gpu/drm/bridge/analogix/anx7625.c:1289 anx7625_get_edid() warn: possible memory leak of 'edid'
> 
> # https://github.com/0day-ci/linux/commit/667ee517c70d2bedafe5bfa0dc5f13fc60d5133d
> git remote add linux-review https://github.com/0day-ci/linux
> git fetch --no-tags linux-review Xin-Ji/Add-initial-support-for-slimport-anx7625/20200917-163238
> git checkout 667ee517c70d2bedafe5bfa0dc5f13fc60d5133d
> vim +/edid +1289 drivers/gpu/drm/bridge/analogix/anx7625.c
> 
> 667ee517c70d2be Xin Ji 2020-09-17  1264  static struct edid *anx7625_get_edid(struct anx7625_data *ctx)
> 667ee517c70d2be Xin Ji 2020-09-17  1265  {
> 667ee517c70d2be Xin Ji 2020-09-17  1266  	struct device *dev = &ctx->client->dev;
> 667ee517c70d2be Xin Ji 2020-09-17  1267  	struct s_edid_data *p_edid = &ctx->slimport_edid_p;
> 667ee517c70d2be Xin Ji 2020-09-17  1268  	int edid_num;
> 667ee517c70d2be Xin Ji 2020-09-17  1269  	u8 *edid;
> 667ee517c70d2be Xin Ji 2020-09-17  1270  
> 667ee517c70d2be Xin Ji 2020-09-17  1271  	edid = kmalloc(FOUR_BLOCK_SIZE, GFP_KERNEL);
> 667ee517c70d2be Xin Ji 2020-09-17  1272  	if (!edid) {
> 667ee517c70d2be Xin Ji 2020-09-17  1273  		DRM_DEV_ERROR(dev, "Fail to allocate buffer\n");
> 667ee517c70d2be Xin Ji 2020-09-17  1274  		return NULL;
> 667ee517c70d2be Xin Ji 2020-09-17  1275  	}
> 667ee517c70d2be Xin Ji 2020-09-17  1276  
> 667ee517c70d2be Xin Ji 2020-09-17  1277  	if (ctx->slimport_edid_p.edid_block_num > 0) {
> 667ee517c70d2be Xin Ji 2020-09-17  1278  		memcpy(edid, ctx->slimport_edid_p.edid_raw_data,
> 667ee517c70d2be Xin Ji 2020-09-17  1279  		       FOUR_BLOCK_SIZE);
> 667ee517c70d2be Xin Ji 2020-09-17  1280  		return (struct edid *)edid;
> 667ee517c70d2be Xin Ji 2020-09-17  1281  	}
> 667ee517c70d2be Xin Ji 2020-09-17  1282  
> 667ee517c70d2be Xin Ji 2020-09-17  1283  	anx7625_low_power_mode_check(ctx, 1);
> 667ee517c70d2be Xin Ji 2020-09-17  1284  	edid_num = sp_tx_edid_read(ctx, p_edid->edid_raw_data);
> 667ee517c70d2be Xin Ji 2020-09-17  1285  	anx7625_low_power_mode_check(ctx, 0);
> 667ee517c70d2be Xin Ji 2020-09-17  1286  
> 667ee517c70d2be Xin Ji 2020-09-17  1287  	if (edid_num < 1) {
> 667ee517c70d2be Xin Ji 2020-09-17  1288  		DRM_DEV_ERROR(dev, "Fail to read EDID: %d\n", edid_num);
> 667ee517c70d2be Xin Ji 2020-09-17 @1289  		return NULL;
> 
> kfree(edid); before returning.
> 
> 667ee517c70d2be Xin Ji 2020-09-17  1290  	}
> 667ee517c70d2be Xin Ji 2020-09-17  1291  
> 667ee517c70d2be Xin Ji 2020-09-17  1292  	p_edid->edid_block_num = edid_num;
> 667ee517c70d2be Xin Ji 2020-09-17  1293  
> 667ee517c70d2be Xin Ji 2020-09-17  1294  	memcpy(edid, ctx->slimport_edid_p.edid_raw_data, FOUR_BLOCK_SIZE);
> 667ee517c70d2be Xin Ji 2020-09-17  1295  	return (struct edid *)edid;
> 667ee517c70d2be Xin Ji 2020-09-17  1296  }
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
