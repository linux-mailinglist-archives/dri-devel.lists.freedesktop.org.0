Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FC31C0EBB
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEFB6EBA7;
	Fri,  1 May 2020 07:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2133.outbound.protection.outlook.com [40.107.243.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2927A6E906
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 13:59:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6JVKx67HV5kuxCh9T0l1mZe8hLmJCXswIZKx2AOonvAUB33ZkARhJQwhLFZHZO+2KbQd+wont2vTUa4eOE8ngf8K3ML99D2eVsSvm8IR5yOpxTjPc5XLOUuPdA/iLCzdFQgEKRCLQv5VjJmq8hgsNwRwmSGKFCMRSuAho8M/K4A8hWUdTH9fv/rFQAVEcVnNeL1Cybk+DL9l6XV2GZ11XaombRLoUqzEFIjPgocSvODj3r0tnUsHM+/Jwym9ZWZNp8rKEu+OrIE6z76G5v9CHd1Rz61RNCXTVX1yQ1hBLfUtywucE9YbdU+cUtp+xhuJHwO9+TsgMM6oHLXOThkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nV2K2UmOfEu2/KxSlCxftF8YHacxp+rmdX293usi4xs=;
 b=bCUWhovNrF70xVNhFMaxgINFh4l4HrAtmThCEgu3FcFxgd8M+ZN83Dr4zQRUEiHsA9Cxxe3FJyB4NSROHtJzQeActcwmuIW3DN3dt4SeZmUNJPibNx6bVv7suzjFiThrWN5I2UZq//LCYV6IRcy7Z/GZEdE+x4YEODZl1Uij/zt+28QhSvC5qHUjql+kD2YK7GCTCJIa01nSR/L8eLUDXWJDa90KnC86g1EI3c91FjtsMvKF8QLRu3d4lk9IjEP8pPVN+berxa6fxVO6pBCU7tHxjPWgkoD0CyqFx5D/ZH+kz9mfkkDFKzSDqkNOLjWr7sqzNvyI/dBZOSt+9tUo+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nV2K2UmOfEu2/KxSlCxftF8YHacxp+rmdX293usi4xs=;
 b=rEt7LUcd5dvfyH7bXmERWnHfvpaS6OADkRZXQS/cAhLS4Ym0TwuMz8Ysr/XPKwtku0ZGffvZjPbUM1kS/OeVEcbcRwSopxuXuSP0oOFQYrNSDaxIS3G/YGVgVGoSeHeBWz917sCPTxVqzRNOBCsISvTUL4OJ635osEsZHsJJZic=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB7105.namprd04.prod.outlook.com (2603:10b6:a03:222::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Thu, 30 Apr
 2020 13:59:01 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f%6]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 13:59:01 +0000
Date: Thu, 30 Apr 2020 21:58:52 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v7 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
Message-ID: <20200430135852.GA2270@xin-VirtualBox>
References: <a81adcf2e79d440edcb7b3989f31efcb80a6e9ff.1582529411.git.xji@analogixsemi.com>
 <CANMq1KBfB6tXFqYGvr=8fV_bpCV5GbVHeEbRs+fuaZba65-OPw@mail.gmail.com>
 <20200424065124.GA31922@xin-VirtualBox>
 <CANMq1KBJ6f74aNAr8BwC3wz8MEeJzwXOQE44gv6C=DNzYmUWCQ@mail.gmail.com>
 <20200428100508.GD3456981@phenom.ffwll.local>
 <20200430033614.GA6645@xin-VirtualBox>
 <20200430133731.GA10381@phenom.ffwll.local>
 <20200430133839.GB10381@phenom.ffwll.local>
 <20200430134746.GA2188@xin-VirtualBox>
 <20200430135438.GD10381@phenom.ffwll.local>
Content-Disposition: inline
In-Reply-To: <20200430135438.GD10381@phenom.ffwll.local>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HKAPR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:203:d0::13) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HKAPR04CA0003.apcprd04.prod.outlook.com (2603:1096:203:d0::13) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.2958.19 via Frontend Transport; Thu, 30 Apr 2020 13:59:00 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb8a6d22-0e4c-44f9-033e-08d7ed0ea2c0
X-MS-TrafficTypeDiagnostic: BY5PR04MB7105:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB7105BC1E6CDBD2F2E927F5E9C7AA0@BY5PR04MB7105.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0389EDA07F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39850400004)(396003)(346002)(136003)(376002)(7416002)(5660300002)(6666004)(478600001)(4326008)(83080400001)(107886003)(66946007)(9686003)(66476007)(55016002)(6916009)(66556008)(16526019)(6496006)(33656002)(26005)(33716001)(54906003)(8936002)(316002)(966005)(1076003)(8676002)(186003)(2906002)(956004)(53546011)(52116002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DX3TiNaBit1WJJ2IXHpRrlj7Nd31Z1lPJ1raNJu2gIc6JU82PrMjhq51XuOYRe+0iZ4GjGZj2jJvYBMqYmG+mmrglnrtBy1wtwdW2BlJwHIfZQBnZgvq9Ftt2JQF/n6TWgEckqZUxrAmA6XD5yKgzhQl7blZQeTNg4LxvYhtbXRpPKPgEZg9uLOoWS4psciqKOrGzJTXACKCulZe20YMz+8opqPIMy/6B7lxdTVcy++VuJFFWzV/26CxpM9ypp1GUu/pDA/BZTULb/okncLd9yKkvYugMNCMb9Q9QeR3+M8zYn0/BZDtHjAErWsDF6n1jBTP1YQIM32xTR9nUlsDk/1Fg4yuuWAqeem2KKb3wEvhvqQwkrFDDaZ354HSV6oruM5W0FagDXusY+9ySixWPkhM3Vu9GXTgzX3oQps6fnW2DKMWaUqXqWxL9pv5HogJPNF3mKMZbMRFI390M5nRFhbAmu/eG1MLJPlxILgCRAtuHWIbm2JsjQKyMt73wtP3ZeOrQlzyupVJxhC8B3FrQQ==
X-MS-Exchange-AntiSpam-MessageData: iEUx9eNooNBJ6sjBqjD9ozxAY8wF6MY0uFEzIFRj4ehBotD/fig16HGWIlIcmO8kUFH45SbFd/73nziuav3fkx0USv+Z1JKyMtI/awHICoHRTPDnp9WHmQrD60dKkuMytmIbkFlxYY1Dpv6jaeatHVYq2OuqNnXox5yElhys7EnWpRMmNN2/5QydMmwwWsVWS8yqJ6QEVUJmo74IQpCjWJeTMLUpnKvQ5XisYtm6Z8tAejLdgofkl2Ha3wR3woS3svpjXQCOGn7eydykACvdLZrYFhfP+jfyfZ5AYDRJHv05oJqRTGpbjaA7ulvVC257my3lXsofVnvNYgYnlyVxVffbjWUHyz4gwLt8S3VPtYK9DsLzMfreM0vfv4WAFVWQg4pEBZdsTHs6yMBiP8E989mB7dwkC3uchPTHornV9e8NIW4iupZp0BZP9RFT/AzaDqZJqaAEstGfrGmw1yM2Dvp7e1HO8UckJg/m1zulowRGru1/ZB+U0ZcEaGQKfNH/iG8oxBgUwEmyfuC2u17JBwTgXKVlTxy37CmBphfvj5nQOJFV1IeNLW6n/leWSNqc4XRJuyKI/zdjqxF2HpF6AYB2HdN7ErasV7Wl8rwzP/biubIeg0VXr8YcL1vRslZqeB/ibqadWEB6/rxgBGzogXqVOIj/U9nAyDXrkySVZwqG+UjiKqOT2c5ei04Y0wQPbEDb7XpmDSRQPAKWo5G3ec/cxAtrH9Oe+2MIy7uFDHG05Dy2zZOkYumy1xQaTP+xCSL+HdTK95SneazfDHki1bKlaxnvOkG4N2t+xGKMj07C14WwEW0gn/WRB0gRY1hj
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8a6d22-0e4c-44f9-033e-08d7ed0ea2c0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 13:59:01.4192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtTwQUkPtDVHLz+5lBzeay7bHLZ4w04qm1Vseg1ReJOkm1MMDOJBQHoWlgqbNW739+iHG6g9ekYzw8zLzz8S+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7105
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sheng Pan <span@analogixsemi.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 03:54:38PM +0200, Daniel Vetter wrote:
> On Thu, Apr 30, 2020 at 09:47:46PM +0800, Xin Ji wrote:
> > Hi Daniel,
> > 
> > On Thu, Apr 30, 2020 at 03:38:39PM +0200, Daniel Vetter wrote:
> > > On Thu, Apr 30, 2020 at 03:37:31PM +0200, Daniel Vetter wrote:
> > > > On Thu, Apr 30, 2020 at 11:36:14AM +0800, Xin Ji wrote:
> > > > > On Tue, Apr 28, 2020 at 12:05:08PM +0200, Daniel Vetter wrote:
> > > > > > On Fri, Apr 24, 2020 at 08:12:04PM +0800, Nicolas Boichat wrote:
> > > > > > > On Fri, Apr 24, 2020 at 2:51 PM Xin Ji <xji@analogixsemi.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, Apr 23, 2020 at 07:55:15PM +0800, Nicolas Boichat wrote:
> > > > > > > > > Hi,
> > > > > > > > >
> > > > > > > > > Just commenting on the mode_fixup function that was added in v7.
> > > > > > > > >
> > > > > > > > [snip]
> > > > > > > > > > +       /*
> > > > > > > > > > +        * once illegal timing detected, use default HFP, HSYNC, HBP
> > > > > > > > > > +        */
> > > > > > > > > > +       if (hblanking < HBLANKING_MIN || (hfp < HP_MIN && hbp < HP_MIN)) {
> > > > > > > > >
> > > > > > > > > should this be adj_hblanking/adj_hfp/adj_hbp?
> > > > > > > > NO, need check original HFP and HBP, if they are not legal, driver need
> > > > > > > > set default value to adj_hsync, adj_hfp, adj_hbp.
> > > > > > > > >
> > > > > > > > > > +               adj_hsync = SYNC_LEN_DEF;
> > > > > > > > > > +               adj_hfp = HFP_HBP_DEF;
> > > > > > > > > > +               adj_hbp = HFP_HBP_DEF;
> > > > > > > > > > +               vref = adj->clock * 1000 / (adj->htotal * adj->vtotal);
> > > > > > > > > > +               if (hblanking < HBLANKING_MIN) {
> > > > > > > > > > +                       delta_adj = HBLANKING_MIN - hblanking;
> > > > > > > > > > +                       adj_clock = vref * delta_adj * adj->vtotal;
> > > > > > > > > > +                       adj->clock += DIV_ROUND_UP(adj_clock, 1000);
> > > > > > > > > > +               } else {
> > > > > > > > > > +                       delta_adj = hblanking - HBLANKING_MIN;
> > > > > > > > > > +                       adj_clock = vref * delta_adj * adj->vtotal;
> > > > > > > > > > +                       adj->clock -= DIV_ROUND_UP(adj_clock, 1000);
> > > > > > > > > > +               }
> > > > > > > > > > +
> > > > > > > > > > +               DRM_WARN("illegal hblanking timing, use default.\n");
> > > > > > > > > > +               DRM_WARN("hfp(%d),hbp(%d),hsync(%d).\n", hfp, hbp, hsync);
> > > > > > > > >
> > > > > > > > > How likely is it that this mode is going to work? Can you just return
> > > > > > > > > false here to reject the mode?
> > > > > > > > We want to set the default minimal Hblancking value, then it may display,
> > > > > > > > otherwise. If we just return false, there is no display for sure.
> > > > > > > 
> > > > > > > Right, understand your argument. I'm pondering if it's not just better
> > > > > > > to reject the mode rather than trying a timing that is definitely
> > > > > > > quite different from what the monitor was asking for. No super strong
> > > > > > > opinion, I'll let other people on the list weigh in.
> > > > > > 
> > > > > > Yeah mode_fixup is supposed to be used to adjust the mode in intermediate
> > > > > > stages (e.g. if you go from progressive to interlaced only at the end of
> > > > > > your pipeline or something like that). It's not meant for adjusting the
> > > > > > mode yout actually put out through a hdmi or dp connector. For fixed
> > > > > > panels adjusting modes to fit the panel is also fairly common, but not for
> > > > > > external outputs.
> > > > > > 
> > > > > > Since this is a DP bridge I'd say no adjusting, just reject what doesn't
> > > > > > fit.
> > > > > We have found some panel which HBP less than 8, if we reject to adjust
> > > > > video timing, then there is no display. The customer does not accept it,
> > > > > they push us to fix it, the only resolve way is to adjust timing.
> > > > 
> > > > Are we talking about external DP screen here, or some built-in panel? For
> > > > the later case we do a lot of mode adjusting in many drivers ...
> > > > 
> > > > I haven't checked, by if our connector type is eDP then this should be all
> > > > fine.
> > > 
> > > Ok I read the patch now, you seem to support both. Would it work if we
> > > make this adjustement conditional on it being an internal panel only? I
> > > think that would be perfect.
> > > -Daniel
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > Based on comments of V8, only keeped eDP built-in panel in V9 version,
> > removed external DP screen support.
> 
> Ah even better. Then the above adjusting has my:
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Maybe add a comment to the code summarizing the discussion. Definitely
> needs to be covered in the commit message.
OK, I'll add it in the next serial.

Thanks, Xin
> 
> Thanks, Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
