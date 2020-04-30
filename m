Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED0D1C0ECA
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC326EC1A;
	Fri,  1 May 2020 07:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2131.outbound.protection.outlook.com [40.107.237.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9BF6E8A5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 13:48:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKieZCVf49+jocNGD0P/6N+Z/QTNitmSlE4Eahn8U239vFNaD0Nik7bXIZq2AGmYNy0AW7Ru3aaQPQrEk2pti99dtxp9OUH5pLyujIUmRHLKpLyFq4xQU9414GkzbgaMMm7ITUOkYdRxXLGOzPLgRaKVF1GDyy8UPuKDNaH72cWwJfVfsZnO2qbT8Nk403Zgejd5ukuINM/L3+v/sWbmc1niYYuLt0NPXFFea8PKBBVh7SrXoyWlnsNieGR0F8PEJ/9Mz2hBLOTrJgCwoewuAu4s1UuHhjw74hbxO0Qkzu8kzpL89TBaXZloeM7kJcUIgbzRkhZBhX8cKDSC9fXVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fFoKeRKi9qJp0dj0IJd4NcM5VKY03LBk03ZJCrvV8o=;
 b=Ed1td/lTAP8WuC7Ldx6B0dBNeX14wUOjprDnBNKJsu/FHGcCaOAyBFc6TPOSAEWNmU/iiI0+zlVBMSt9KO9ZBpHhDSl2kiZMogcaScsl1JWleo6BBV/HyICNYgKRH6Z/OiDXUXVjojMEoCu9AdqaMl1skiltwSV+qANJ/A5ejAYSS+IEuQvNXvQfe3oHwUIpQi8iv+iFOiKaT+IbVO77SdQrIHoXiGEOc+pubb9cafUG/ka1iqFp7+6NY/TDU68gBB5gwIVDoTYFmOwJtPLQkYl2DNV6lq32RQYUSZ3Am/0vFPboHvlezcJctW5pNT5aKdLlDrk4tOvmGHtyx8c4Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fFoKeRKi9qJp0dj0IJd4NcM5VKY03LBk03ZJCrvV8o=;
 b=1U4TH3Sd2PHN0wI3xT6DWUOhHJRG7mMk8YUrKv1zzm0EdkQOFigXx/R5Ae3IfPCMiU8Q7fX15ClDxUx78gAmDUDa3j5CNl233A6WKLNuohPg7TCKiwTKIhUNCOyf76Ke0ES5iMFgZ02FRJuKb0f5lDPuYf5BpPDsxKNEdwpvHNM=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB7122.namprd04.prod.outlook.com (2603:10b6:a03:222::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 13:47:56 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f%6]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 13:47:56 +0000
Date: Thu, 30 Apr 2020 21:47:46 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v7 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
Message-ID: <20200430134746.GA2188@xin-VirtualBox>
References: <cover.1582529411.git.xji@analogixsemi.com>
 <a81adcf2e79d440edcb7b3989f31efcb80a6e9ff.1582529411.git.xji@analogixsemi.com>
 <CANMq1KBfB6tXFqYGvr=8fV_bpCV5GbVHeEbRs+fuaZba65-OPw@mail.gmail.com>
 <20200424065124.GA31922@xin-VirtualBox>
 <CANMq1KBJ6f74aNAr8BwC3wz8MEeJzwXOQE44gv6C=DNzYmUWCQ@mail.gmail.com>
 <20200428100508.GD3456981@phenom.ffwll.local>
 <20200430033614.GA6645@xin-VirtualBox>
 <20200430133731.GA10381@phenom.ffwll.local>
 <20200430133839.GB10381@phenom.ffwll.local>
Content-Disposition: inline
In-Reply-To: <20200430133839.GB10381@phenom.ffwll.local>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK0PR01CA0064.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::28) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK0PR01CA0064.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::28) with
 Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 13:47:55 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 441bbb21-1fb2-40ed-2548-08d7ed0d1633
X-MS-TrafficTypeDiagnostic: BY5PR04MB7122:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB7122A0D37A5D40E51BF58FCEC7AA0@BY5PR04MB7122.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6fd+wCbyQN9Jpc0Oi5NyA8R8arpDcE4masqYN/yXLdvkNrYfJ9IDp1jWFhDHGDEdde9uvDogejCh3GsUo344jEvXfrepuXXXtvV4hSak5+sxMVTqHKNUs4fvmjTuLtxD68MCxcIJ+HgnxeTzyN0UMI6iF6B6Z8en3ZBFfOI1BhVL4RYVuF3rQll+YyHL35t4N6vcwMa71cU8mWxkiVoMM35EpcJQnaaOTCWM7Oy83MtYM69nvuQdOBQtJfknai1XDutqVnYJkwU3+1pcgCfaP0w+qFDCS2rrDY11hJLQKT11RkgrxIij7Rj6tl/OkmaTB/wYjIoTx7+OnNRcGBwPsklJWUy4FrW+5sl5qd6Odwnjy9ngLEUGjEjhYPuwlxN7WUSCDuRHwGfb78ZDqUpeI3rW7TWkcgmdgcrRbPNk9wUSlm44OXzf/Qcxw5qjYEnXPPq0zQT1v6u60Zz6BypSj0Vi1ncgD4fUdK+Mlga+MXuiKJV9SMlSGhntFDnZvdJCWY3s5ZsZyeY1OYCHaqUnAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(346002)(39850400004)(396003)(136003)(376002)(316002)(66476007)(66556008)(66946007)(54906003)(1076003)(5660300002)(107886003)(55016002)(9686003)(33656002)(8676002)(8936002)(86362001)(2906002)(53546011)(478600001)(33716001)(26005)(83080400001)(6496006)(956004)(966005)(52116002)(16526019)(6666004)(7416002)(4326008)(6916009)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 3RLz5S+T1QrCMxYtN33HXxqblnGT6h+rTu8M5YQMFWoMKXzfaxZMJLDxIp8QpksvXjJlCJrKdzYdSWjrQPkeaTwcZ/sjTIVPub0qWHWX0WLwNfxJHZ1E+D44ijFiNHFfRakSs5QIjvHQFpaXoUgowF29bQFfJXK6YW8wwitE8/CNMlw3vVubVKa9thsGfhJhUdsLWH6NvkmEUoW0N2iilWp/2XQhrcH5J7KrsWWTwh0DYO2czYqRaiCO5NP04yfgq4K/sqdGxDrOEDUd5khSCm/c0rXzj63ltKd5yYcjIMEdgi7Okj3NGz+xXimjvudHV7DbsjsSuAStUzj9X2ateY9Ng0372tqxcZAVwGZ8dT6J77S47N517WepDJi+gQNhcjpzLYv903ML5YBtoFeqnEwzx2apL4Xt/PyqgMsPfangcWoSUBC7LWcQK3YavglspyvaM6YAmiRqzuurBXLniv6EYZRtpWx7Ij8CkDegmmjXpoBHrneVgwXjVKCZSrOuY6l3BS36kXo11nq/UKg6xR/qI6M9hMoeSF0WTulbGhqGjPzcPamJaaLlnJImpd/6WuyK2AncZjSUkhNzUDGfs5ZVSJhP/y7PsFH8FyoIQyoxPUvBA33anRF+JPGlWwBEKbzeNQLjBn75dFBjNDQRtQ54JqclwSn235jite6J257HthnkWG0N522oeEhKgjEbRtyelW90y+kLu4vBUviALxEdFbiIBauRdl9O/0JbGhaqEVO9VGAUoMENzyECLoTMQQj+b4Ga+uC0uD/1rDk4XASJnuJ3yZ0/bvfZ6E5HXNvXeJCpdfnepECAfuSmjEJ3
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441bbb21-1fb2-40ed-2548-08d7ed0d1633
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 13:47:56.2188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gONIGJwybjQxZSp7gi0NTrqidgNm4SV2XCn8BqO/TLjfbTuD2LQuhGkE1O5cL+xisj5w3GJFztnrafwKU+nzYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7122
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

Hi Daniel,

On Thu, Apr 30, 2020 at 03:38:39PM +0200, Daniel Vetter wrote:
> On Thu, Apr 30, 2020 at 03:37:31PM +0200, Daniel Vetter wrote:
> > On Thu, Apr 30, 2020 at 11:36:14AM +0800, Xin Ji wrote:
> > > On Tue, Apr 28, 2020 at 12:05:08PM +0200, Daniel Vetter wrote:
> > > > On Fri, Apr 24, 2020 at 08:12:04PM +0800, Nicolas Boichat wrote:
> > > > > On Fri, Apr 24, 2020 at 2:51 PM Xin Ji <xji@analogixsemi.com> wrote:
> > > > > >
> > > > > > On Thu, Apr 23, 2020 at 07:55:15PM +0800, Nicolas Boichat wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > Just commenting on the mode_fixup function that was added in v7.
> > > > > > >
> > > > > > [snip]
> > > > > > > > +       /*
> > > > > > > > +        * once illegal timing detected, use default HFP, HSYNC, HBP
> > > > > > > > +        */
> > > > > > > > +       if (hblanking < HBLANKING_MIN || (hfp < HP_MIN && hbp < HP_MIN)) {
> > > > > > >
> > > > > > > should this be adj_hblanking/adj_hfp/adj_hbp?
> > > > > > NO, need check original HFP and HBP, if they are not legal, driver need
> > > > > > set default value to adj_hsync, adj_hfp, adj_hbp.
> > > > > > >
> > > > > > > > +               adj_hsync = SYNC_LEN_DEF;
> > > > > > > > +               adj_hfp = HFP_HBP_DEF;
> > > > > > > > +               adj_hbp = HFP_HBP_DEF;
> > > > > > > > +               vref = adj->clock * 1000 / (adj->htotal * adj->vtotal);
> > > > > > > > +               if (hblanking < HBLANKING_MIN) {
> > > > > > > > +                       delta_adj = HBLANKING_MIN - hblanking;
> > > > > > > > +                       adj_clock = vref * delta_adj * adj->vtotal;
> > > > > > > > +                       adj->clock += DIV_ROUND_UP(adj_clock, 1000);
> > > > > > > > +               } else {
> > > > > > > > +                       delta_adj = hblanking - HBLANKING_MIN;
> > > > > > > > +                       adj_clock = vref * delta_adj * adj->vtotal;
> > > > > > > > +                       adj->clock -= DIV_ROUND_UP(adj_clock, 1000);
> > > > > > > > +               }
> > > > > > > > +
> > > > > > > > +               DRM_WARN("illegal hblanking timing, use default.\n");
> > > > > > > > +               DRM_WARN("hfp(%d),hbp(%d),hsync(%d).\n", hfp, hbp, hsync);
> > > > > > >
> > > > > > > How likely is it that this mode is going to work? Can you just return
> > > > > > > false here to reject the mode?
> > > > > > We want to set the default minimal Hblancking value, then it may display,
> > > > > > otherwise. If we just return false, there is no display for sure.
> > > > > 
> > > > > Right, understand your argument. I'm pondering if it's not just better
> > > > > to reject the mode rather than trying a timing that is definitely
> > > > > quite different from what the monitor was asking for. No super strong
> > > > > opinion, I'll let other people on the list weigh in.
> > > > 
> > > > Yeah mode_fixup is supposed to be used to adjust the mode in intermediate
> > > > stages (e.g. if you go from progressive to interlaced only at the end of
> > > > your pipeline or something like that). It's not meant for adjusting the
> > > > mode yout actually put out through a hdmi or dp connector. For fixed
> > > > panels adjusting modes to fit the panel is also fairly common, but not for
> > > > external outputs.
> > > > 
> > > > Since this is a DP bridge I'd say no adjusting, just reject what doesn't
> > > > fit.
> > > We have found some panel which HBP less than 8, if we reject to adjust
> > > video timing, then there is no display. The customer does not accept it,
> > > they push us to fix it, the only resolve way is to adjust timing.
> > 
> > Are we talking about external DP screen here, or some built-in panel? For
> > the later case we do a lot of mode adjusting in many drivers ...
> > 
> > I haven't checked, by if our connector type is eDP then this should be all
> > fine.
> 
> Ok I read the patch now, you seem to support both. Would it work if we
> make this adjustement conditional on it being an internal panel only? I
> think that would be perfect.
> -Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
Based on comments of V8, only keeped eDP built-in panel in V9 version,
removed external DP screen support.
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
