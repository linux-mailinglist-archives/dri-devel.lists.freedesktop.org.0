Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF6D546D3D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 21:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBF61125B0;
	Fri, 10 Jun 2022 19:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415811125B0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 19:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=yUY/DnIxjDue7wT95qIOB79riamGBEfZ96J6K/Td21w=;
 b=WbYF3yEuHjKi421BzbyY2CD+QL/rWS7WXaQK5nlcZ3rX7m3U8DyTwQpk2Hn1OnP++6xy9XuFn0+FD
 9lrwb5CXeUCBjzcAg0JP1v3IMKHFgCsRFX7pYJnvjsVgNTvvVq77Qf6/W2PXd+PAO96H1krFVBHlZX
 RBQI/ukV7QE0XLMoak0abtoDLSct+W4Dt9l5+hgll4cYy9D9DSclmBDJpRziJ4jPX8eIn79YjFH+Ax
 5GGRUEOrXPCxSa6Eo3yA5fCx96ENO2KDERmSdvviG9R83akUVq29lXMPpQa9bMD44ah23fG+Nv/tVA
 bLRxmanpnfL5AT05H/t93fBtDo+EJXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=yUY/DnIxjDue7wT95qIOB79riamGBEfZ96J6K/Td21w=;
 b=cp4Qer+Ca5vbaOZQ2RKoX1pcPPkX4ULqp1SNlb/2ByHWnkr93naQB1aJUJWVov1t5gilzSpvlUC9W
 BbJJXzEAg==
X-HalOne-Cookie: 37fa42ebdd97f57a6e422a39d60d3a92bdb63160
X-HalOne-ID: 84985802-e8f3-11ec-be77-d0431ea8bb03
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 84985802-e8f3-11ec-be77-d0431ea8bb03;
 Fri, 10 Jun 2022 19:28:34 +0000 (UTC)
Date: Fri, 10 Jun 2022 21:28:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 2/3] drm/panel: panel-dsi-cm: Use backlight helpers
Message-ID: <YqObYPttYuRDikrO@ravnborg.org>
References: <20220607182026.1121992-1-steve@sk2.org>
 <20220607182026.1121992-3-steve@sk2.org>
 <20220609215236.ojxw6l2vkf652hgu@mercury.elektranox.org>
 <20220610194720.485cf7be@heffalump.sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220610194720.485cf7be@heffalump.sk2.org>
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen.
On Fri, Jun 10, 2022 at 07:47:20PM +0200, Stephen Kitt wrote:
> Hi Sebastian,
> 
> On Thu, 9 Jun 2022 23:52:36 +0200, Sebastian Reichel
> <sebastian.reichel@collabora.com> wrote:
> > On Tue, Jun 07, 2022 at 08:20:25PM +0200, Stephen Kitt wrote:
> > > diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c
> > > b/drivers/gpu/drm/panel/panel-dsi-cm.c index b58cb064975f..aa36dc6cedd3
> > > 100644 --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> > > +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> > > @@ -86,16 +86,10 @@ static void dsicm_bl_power(struct panel_drv_data
> > > *ddata, bool enable) return;
> > >  
> > >  	if (enable) {
> > > -		backlight->props.fb_blank = FB_BLANK_UNBLANK;
> > > -		backlight->props.state = ~(BL_CORE_FBBLANK |
> > > BL_CORE_SUSPENDED);
> > > -		backlight->props.power = FB_BLANK_UNBLANK;
> > > +		backlight_enable(backlight);
> > >  	} else {
> > > -		backlight->props.fb_blank = FB_BLANK_NORMAL;
> > > -		backlight->props.power = FB_BLANK_POWERDOWN;
> > > -		backlight->props.state |= BL_CORE_FBBLANK |
> > > BL_CORE_SUSPENDED;
> > > +		backlight_disable(backlight);
> > >  	}  
> > 
> > The brackets can be removed now. Otherwise:
> 
> > 
> > Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Thanks, I’ll wait a little more to see if there are any other reviews of the
> patches and then push a v2 with that fix.
It would be very nice if you could kill all uses of FB_BLANK in the
drivers/gpu/drm/panel/* drivers, and post them as one series.
This is long overdue to introduce the backlight helpers.

The three you posted is already a nice step forward, and there may be
more panel drivers I have missed.

	Sam
