Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 104D750BFC5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 20:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDF210E521;
	Fri, 22 Apr 2022 18:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C4F10E521
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 18:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=RmhUUUCpcHfVg6xSPwGBYxyh+rU7k+W5w2E8TeTZD94=;
 b=Ye9x8599HWP/C8aOblfZLP0QAloUDKkKGLtEDQqRoXE1VbI8hwqZgLZ3UayC51jSpTh56KfuT5M4b
 pjLttoX8p6tQ/dDCYAeVLTuBPy/0WvlvzVKTEfuH6Chxdi1t23GuQIdQnZPJTsW8zju/YbM4kBP6NA
 ev314fPutUNWnef8fuDpJPNU+p1LgQ96A5Rl1MwRdaMRRM1YGcyOw+2RGAm2HYbofh5RdTbLnufXYk
 RVQaxAt5nOUjzbE4l8HXrQvasYKLRd8L+EPRv6I59D3t8wjbQiqfJRW1+hIvtNHt82yV5MD+Sdv9wT
 m0qR/2hnOJRXIAyqyWrziu+/x4URVHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=RmhUUUCpcHfVg6xSPwGBYxyh+rU7k+W5w2E8TeTZD94=;
 b=6aSSbl03mn7WS//quP+2fkXQ3ynp11lpKMAmhkvy6MRNJNMVY66ba1PgcJvwegMwExOmz+bmcZUR1
 W2QkYz0BA==
X-HalOne-Cookie: 2df95b491998405fbeae84f185e0291a90d9464c
X-HalOne-ID: 60219175-c268-11ec-8225-d0431ea8bb10
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 60219175-c268-11ec-8225-d0431ea8bb10;
 Fri, 22 Apr 2022 18:16:48 +0000 (UTC)
Date: Fri, 22 Apr 2022 20:16:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add DataImage FG040346DSSWBG04
 panel support
Message-ID: <YmLxDwe8jt9tT5Cr@ravnborg.org>
References: <20220422102242.18959-1-marex@denx.de>
 <20220422102242.18959-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422102242.18959-2-marex@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 22, 2022 at 12:22:42PM +0200, Marek Vasut wrote:
> Add DataImage FG040346DSSWBG04 4.3" 480x272 TFT LCD 24bit DPI panel
> support.
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
