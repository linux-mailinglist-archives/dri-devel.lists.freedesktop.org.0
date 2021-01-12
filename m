Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 259072F461B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924426E0D0;
	Wed, 13 Jan 2021 08:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2125.outbound.protection.outlook.com [40.107.243.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0A96E123
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:28:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMtrmMGobkSxHP1MnEw6gXesbjbwxv6CGYLsYBqqGehPD/ugWKCQxeM7OSPyKsiyKSpwbUo2P7u1I9UrWVn6EoWN8cXRH7RRL+/TIz1FeVWTVF54HYDqUyBoz6XLqADI1DqD1+f4BAHhsmB3FNmTqtJUsU8je30O2n3COUs28Cgz5ETFlhP5vWwX+9yVeJ37MV7igOA61i06wZAPupzecswN5hL92qJzxIk4k/e/FeastbM52yMaOoggoy33cK3xwP3gy//0PlmwmpLvb08LUHKLLHhc+Nbzpv03nxEcS7LZt7IGN7lOGczvP1b12exNtZ7G8PS8yRaNSjOp7oTg5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GgPiNXiVuBpzGbi7AtrQy9O8vS5DAE5SaScCeXPoMw=;
 b=FNDsHtfOluydXRGeMJzPQN0b7JY6RG0t+Wxzz+n+pY/hknVSSlnwgMAUYhz6yE6ZurAQqdsFACEh3xoxOR8MwUWAr+SeC2wEQi+ygdEk7FL5G9X4LmOmUpRTMauK8VUTCPZoyqJeHwimD/DdnoqOWLFsQw+1baY4nwbtj9tlelv5bCOLeKpQWkmXRPzeTyXtwZCBrvTFJFB8YTDIC09qthBTYwhogNDEJGnYYiYtOelcddXHEv482O24MFFoHdpa9aEDgtnpdZFNG26Xl9ppXi/vyk3BllT5KVYqzw/o08CoefV700hC0jZgtvx1cObBEE+LudOtXQ6+e+Eu8p7OWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GgPiNXiVuBpzGbi7AtrQy9O8vS5DAE5SaScCeXPoMw=;
 b=sOfVUhlOKyhQD6g1Ovq4vEFs9qGNTGSEr+KKQudgqxsOkBGOUjHO7H8dz/NKk/fAoQoHsgrxLUH/sxLZ+nnRROGV39VlbJScpCtz6TYu1KgzDMTCmq3QXQh8C9eitGQKh5XBGsJQiR1flmu2tUC3mb5419r0lfASzRZR8Hyz4q8=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6913.namprd04.prod.outlook.com (2603:10b6:a03:22e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.9; Tue, 12 Jan
 2021 08:28:49 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::b59c:9ae:6e98:5e1e]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::b59c:9ae:6e98:5e1e%8]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 08:28:49 +0000
Date: Tue, 12 Jan 2021 16:28:43 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7625: add MIPI DPI input feature
 support
Message-ID: <20210112082843.GB5827@pc-user>
References: <cover.1609380663.git.xji@analogixsemi.com>
 <f7fce2657d3c98a4d705f88eb9684f97b646793e.1609380663.git.xji@analogixsemi.com>
 <20210105141701.GG2809@kadam>
Content-Disposition: inline
In-Reply-To: <20210105141701.GG2809@kadam>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR02CA0142.apcprd02.prod.outlook.com
 (2603:1096:202:16::26) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (61.148.116.10) by
 HK2PR02CA0142.apcprd02.prod.outlook.com (2603:1096:202:16::26) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 08:28:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8f6d433-1bfb-4b79-8345-08d8b6d4166f
X-MS-TrafficTypeDiagnostic: BY5PR04MB6913:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB691386013D71BD93ED60B8C1C7AA0@BY5PR04MB6913.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rr9CU9Si9miXZjOdbDdeXqz5fMS7S6o52qCnaAEz9nYXStXTaWEzgvmhZbAnLHkDEYReKPopNe53Z76w5X05gJPpmP6iFk/PpHKDwMCEnNPUaCgO4y2V6uzUDrHr0DMCvrldpgGLpAw0xPBJiN0qjMKNwyWEpHHyHm3I5zy8ITGrBQBNr8axO/Gu6HNU+IqPcxOm4egoUKjfYsmCJrMna1xQihhlFhyr0lTr2tLQV5e5+p+FXK3ReCX/XomfeHCY/CeHJIfijLhJ4pMUrX3x/RFcKYwwuq+1K9G9FoJVhWKt9nA3NqIajUs4lD/8sCmXVY1kkvjYM2yi1LezuXPc/Mz2SYVVwSjtM5VMj8uxZI0Sf5ve+ALLZSTC69UwiBSt/SpIdyMGhNJ4zzvIneSNEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39840400004)(136003)(396003)(366004)(66946007)(4744005)(66556008)(54906003)(66476007)(9686003)(316002)(186003)(33716001)(6666004)(86362001)(26005)(55016002)(52116002)(7416002)(6496006)(6916009)(4326008)(5660300002)(1076003)(8936002)(956004)(2906002)(16526019)(8676002)(33656002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YuHBD+wwH9/9pZLDgU1nibExIcA5OtI8ZK54Fo7+LF36QHfJsOJGoc2N/Ptt?=
 =?us-ascii?Q?Q3yopSagLbBkkS3TVdZ2dZaGgPO9mSaV+/Sk+zjx3oGxCDtsdf54fe7ECbND?=
 =?us-ascii?Q?ofdWD1vkRNb9zUyr9OX6tS0uUuiNGSMTbZwIU9CAjijfdcZKfnpHwp/PPl73?=
 =?us-ascii?Q?77U6LMURmad6o5LnsOQTjdv55H7dULaySXl+iYu+HWhpBgoM+Cc5s7ruMgfX?=
 =?us-ascii?Q?6cCmDywLulDA7mwlF445YfPjchDJ7VKE5fDozsdBDVG9YTKWqHQKacksKqWs?=
 =?us-ascii?Q?8SFuMlsxtL09PktjTUfHPKaE7xfv8BXZmmPLRj43AiIqzAdaVIaMdl5t1Ptg?=
 =?us-ascii?Q?ATA2P27GqYm0UD/Zw6jINx/DZ6DblMrnlJ/AUTg5yjhtg3qqA53/RxxpgUOI?=
 =?us-ascii?Q?mDLXjftpXGFfI21SQARNAZoa+ry295tmSKORJ8jligfB3eQPGwQOBnI7IagX?=
 =?us-ascii?Q?hCi4jnJPg3c79XP8TdVUW68iW95Kk33QpOU/Oj24vFosKYP5sRNFMoab+sFr?=
 =?us-ascii?Q?fjCXDby94d93EnANxNh+cFy0gDuby9/XKTk896FZrD2D/9WMkbrLpA0rrcVa?=
 =?us-ascii?Q?72yxef1ZTGdNzn4ZahnHkxp7Y7rrGqrGa/OtcXthSIsphfIai03Sf9JgRSOs?=
 =?us-ascii?Q?mNZOhidFoIOdsOLCIquI3VfNF/0AsYoFpS0q4I+xuHVD33wZJddUl1Q4a0iQ?=
 =?us-ascii?Q?ke2CLHAsVGjj2oFFliasZ2Hz7ts+4oX3hjlhHJixYR9MKp8XLukCI1bZSTOQ?=
 =?us-ascii?Q?3BVx9wXb9OHRAOS7aljp/Yy9U0FgtdzJs7jPq0sP2rOpq7RBYhPyjklVQB/1?=
 =?us-ascii?Q?KnKNZduJcs+Ir0jy5chmJabev3CLVJHUVZm5NpgOUiEdpM8PH8xLinRu6+kA?=
 =?us-ascii?Q?vYD1zWEX91+GC9N7cDrDz05I29B3kMrr6dclyJ0y0nW6TnPfMhOFbC+uIrg4?=
 =?us-ascii?Q?QVwg3mKY8uGY9nE1CunObW9uhS0mY2T6v2fsWFLIRYzHH4ywYZOgB8sxwS30?=
 =?us-ascii?Q?BhO+?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 08:28:49.7628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f6d433-1bfb-4b79-8345-08d8b6d4166f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7zfdtef52SHD3GRKj1kIgC4mUw/DwGvqaMKb6kuUV97GQX5ky7ro5NDbEpjP/lR/dsg+boI94bXsALS2UAgUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6913
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
 Jernej Skrabec <jernej.skrabec@siol.net>, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 05, 2021 at 05:17:01PM +0300, Dan Carpenter wrote:
> On Thu, Dec 31, 2020 at 10:22:36AM +0800, Xin Ji wrote:
> >  static int anx7625_read_ctrl_status_p0(struct anx7625_data *ctx)
> >  {
> >  	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, AP_AUX_CTRL_STATUS);
> > @@ -189,10 +203,64 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
> >  			       AP_AUX_CTRL_STATUS);
> >  	if (val < 0 || (val & 0x0F)) {
> >  		DRM_DEV_ERROR(dev, "aux status %02x\n", val);
> > -		val = -EIO;
> > +		return -EIO;
> >  	}
> >  
> > -	return val;
> > +	return 0;
> 
> This s/val/0/ change seems like a bug fix.  Could you please send that
> as a separate patch at the start of the patch set?
Hi Dan Carpenter, OK, I'll send this as a separate patch.
Thanks,
Xin
> 
> > +}
> 
> regards,
> dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
