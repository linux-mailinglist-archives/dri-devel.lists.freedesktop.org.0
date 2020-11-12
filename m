Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1932B1750
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D935C6E44F;
	Fri, 13 Nov 2020 08:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58B96E10D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 09:10:01 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id z24so3661280pgk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 01:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=k4jNN4/h3s3NV1F+0Q0WzcgOTkCPpVphwH4WUMWMcI8=;
 b=Uxfg/gsxqnYTbyI4zPBy3DPpJCBbX5CGLrrfi0KExaYAzoThCHOXOQ1hSI5ZnPSrcG
 RJR3eefL0HKhCqAy/F05y5EGaSVgtQ6y0uXVxdInxuOtfEn8chJarRQdl5pZ2mShd+04
 K7nhMZzkl5H0kRqWrFwe6zbKKxRPTMY5qVttw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k4jNN4/h3s3NV1F+0Q0WzcgOTkCPpVphwH4WUMWMcI8=;
 b=r4+b0BbXmciy87LTcAn3t8T86D8w6SeYbxIy4gQls3iivxj3SADm1T28zEbwjJx2b2
 938I48jqZNKmT8S0Ey5YGR6L4qnJaQEs60dx8MEIoQu7/eLT/rS0YkeeGgZZOi+SBWKg
 zGB5953g2NkE2nHh4cOye04rC+dDk5JZcMjeA2Q/ZW4SOXctKWFajUgxOBxYZzBhA+G7
 9Fst1z2E38prFr3gsJsJP2j/jnjqMJGL2ziMtikwGpA++ly2GergbPRU8sRarAD2q7lZ
 Tb9om3XdKFPUh3ffqdiyIuueMooym6HoEosPPha8qCasKDgHUxCRiU//XTqSKezGIVmD
 KaRQ==
X-Gm-Message-State: AOAM531z2b0EMH0rkmb+fBjefsDwHgTw9Vcck5MgYPwpwACuPkGLsdqG
 iwF5N841/GfWwx9brAIIstBb2w==
X-Google-Smtp-Source: ABdhPJywHYqw1gmRPzduqhVbO8h5JLcgcIW+D9FrFiL5xpMLx94ZxY7IQYZKNYP9xrsabRAKTh4tpg==
X-Received: by 2002:a17:90a:6b0d:: with SMTP id
 v13mr8609605pjj.206.1605172201298; 
 Thu, 12 Nov 2020 01:10:01 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
 by smtp.gmail.com with ESMTPSA id e10sm5427187pfh.38.2020.11.12.01.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 01:10:00 -0800 (PST)
Date: Thu, 12 Nov 2020 01:09:59 -0800
From: Prashant Malani <pmalani@chromium.org>
To: Pi-Hsun Shih <pihsun@chromium.org>
Subject: Re: [PATCH] drm/bridge: anx7625: Add anx7625 port switching.
Message-ID: <20201112090959.GC1367855@google.com>
References: <20201112064051.3716968-1-pihsun@chromium.org>
 <20201112085920.GB1367855@google.com>
 <CANdKZ0cGXkcVfevpT4y_za5vu_y0s-NdCvhw1AVibK-q_W8yBw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANdKZ0cGXkcVfevpT4y_za5vu_y0s-NdCvhw1AVibK-q_W8yBw@mail.gmail.com>
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, heikki.krogerus@linux.intel.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, Nov 12, 2020 at 05:07:05PM +0800, Pi-Hsun Shih wrote:
> Hi Prashant,
> 
> Please see inline reply as below.
> 
> On Thu, Nov 12, 2020 at 4:59 PM Prashant Malani <pmalani@chromium.org> wrote:
> >
> > Hi Pi-Hsun,
> >
> > I haven't gone through the code, but did have a high-level comment
> > (kindly see inline)
> >
> > On Thu, Nov 12, 2020 at 02:40:40PM +0800, Pi-Hsun Shih wrote:
> > > When output 2 lanes DP data, anx7625 can output to either TX1/RX1 or
> > > TX2/RX2. In typical usage, these two TX/RX pairs corresponds to two
> > > orientations of typec.
> > >
> > > On some board one anx7625 is used as DPI to DP converter for two typec
> > > ports. In this case, the TX1/RX1 and TX2/RX2 are connected to two usb
> > > muxes, which mux the DP data with the rest of the USB3 data, and
> > > connects to the two typec ports.
> > >
> > > This patch adds option for anx7625 to acts as a usb typec switch and
> > > switch output lanes based on the typec orientation, or acts as two usb
> > > typec mux and switch output lanes depending on whether the two ports
> > > currently has DP enabled.
> > >
> > > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> > >
> > > ====================================================================
> > >
> > > This is an attempt to use typec framework with how we're using anx7625
> > > on Chrome OS asurada board.
> > >
> > > An example of the dts for the two ports case can be found at
> > > https://crrev.com/c/2507199/6
> >
> > Do you plan on submitting DT schemas & bindings documentation for the switch(es)
> > that are intended to be used?
> 
> Yes I plan to submit corresponding DT schemas & bindings documentation
> changes if this change looks good.
> 

That's great. Thanks for confirming :)


BR,

-Prashant
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
