Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970A055A35E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7430010EBC8;
	Fri, 24 Jun 2022 21:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2937310EB87
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 21:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=A3DgmsxSeVcP2luuDtmswRHr1pZ1c9JYNprS0Jqp+Bw=;
 b=fYsFTW+TM2So4HvAjHCm7Mqa26yw+sdbZtMvrWLsZgvCXd1uhgQnwjcnDNBfkffFT7o+SgEmzUceC
 GYG3JyWXkaCDSqk1SAIMz+Xf1NAazuuqVSYU+eA8U/QZp8dmP6u8u9rkRSC69DKhBb8fhlQzAPhCh6
 PeL+Wm7l+Gecfd5lQDaMRPLLIbHIiGmL+wIDWSUrjxBKqSO/V3yyLdtidjE3kYAgZq6UToSs4C1Dt8
 D3xNCby+ijilM1hp9AqyDE3zrOX94KbyCj8dAf8zxMItTBY//qsp1MBEWSC1EDSOB3iUWws5Zi/Iqz
 +xIiI2QmvXeCWMziuWIFlAmm+V9o8lQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=A3DgmsxSeVcP2luuDtmswRHr1pZ1c9JYNprS0Jqp+Bw=;
 b=NGp7jouLBVmtC12uFW7Yu99+6bZiiHB6KSJ+e9iG+/XQZfDH8ZrEX37rzcQD7csGpUafGrjpRzzhT
 FAtOOBqAA==
X-HalOne-Cookie: 1fdaf0b3c478e4089af781b5826f88112ff1b828
X-HalOne-ID: d886c6f0-f402-11ec-8233-d0431ea8bb10
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id d886c6f0-f402-11ec-8233-d0431ea8bb10;
 Fri, 24 Jun 2022 21:16:00 +0000 (UTC)
Date: Fri, 24 Jun 2022 23:15:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Brace <kevinbrace@gmx.com>
Subject: Re: [PATCH 00/28] OpenChrome DRM for Linux 5.20
Message-ID: <YrYpjmgwuLQyVF1i@ravnborg.org>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624202633.3978-1-kevinbrace@gmx.com>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin,

On Fri, Jun 24, 2022 at 03:26:05PM -0500, Kevin Brace wrote:
> From: Kevin Brace <kevinbrace@bracecomputerlab.com>
> 
> Hi Dave and Daniel,
> 
> This is my first attempt (this is not a RFC posting) in trying to get
> OpenChrome DRM pulled in for Linux 5.20.

I tried to apply the patches one-by-one but they fail as they assume all
old via files are gone. Please fix v2 so all patches apply clean to the
chosen base.

There is no need for a respin now, give people a bit time to look at the
patches first. At least unless someone else needs it.

	Sam
