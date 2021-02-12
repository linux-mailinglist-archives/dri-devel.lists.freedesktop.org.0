Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC388319890
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 04:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78B86E20C;
	Fri, 12 Feb 2021 03:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47716E20C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 03:06:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7BCC564D8F;
 Fri, 12 Feb 2021 03:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613099193;
 bh=Y5jlZ1AxNHbt3YDm7bqmvIY0oj4JfdcMXAG3Sn9zFww=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=LUYfOHY5xWeHN5nIymwETMGQtD84vyNSuj+XDv/VGEX+hqHmfnzXIthcbeZyWqMjW
 QeVDX23eU689XSQdw9ePn3JohaTJn3Xxsra5o1D0Ll3UWfmK+IW5vjlH5l2W3tsGLf
 bku87/bIuj4QkmbmUX6k62E2TBqIFCHBMyg0gSquH3vmN9Qpz69f3+PqOs8H5LnfRX
 JOHwou6cPmbJxWVBS5k6us+DXe26owh6u/Jh00mvNVhcGo+XccaIVDP6tF4dVBJ4x9
 VKSHLcbizp351h5j7mhEkQduqNEZG5t+ndFUNEqsAszCgrr/W37xmDl4Ty+bTt0yuW
 bI/RrooWldyTQ==
MIME-Version: 1.0
In-Reply-To: <20210209175900.7092-2-jernej.skrabec@siol.net>
References: <20210209175900.7092-1-jernej.skrabec@siol.net>
 <20210209175900.7092-2-jernej.skrabec@siol.net>
Subject: Re: [PATCH v3 1/5] clk: sunxi-ng: mp: fix parent rate change flag
 check
From: Stephen Boyd <sboyd@kernel.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>, mripard@kernel.org, wens@csie.org
Date: Thu, 11 Feb 2021 19:06:32 -0800
Message-ID: <161309919221.1254594.13394926523127979721@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: airlied@linux.ie, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Jernej Skrabec (2021-02-09 09:58:56)
> CLK_SET_RATE_PARENT flag is checked on parent clock instead of current
> one. Fix that.
> 
> Fixes: 3f790433c3cb ("clk: sunxi-ng: Adjust MP clock parent rate when allowed")
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Tested-by: Andre Heider <a.heider@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---

Ok, Applied to clk-fixes
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
