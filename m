Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C752C29E8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 15:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850BF6E40A;
	Tue, 24 Nov 2020 14:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4196E40A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 14:43:53 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9105206F9;
 Tue, 24 Nov 2020 14:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606229032;
 bh=8+Oaa7bvZ05Y2HZFAnDkMV/oiZMjQ6zVl9gG9O4TVQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DLHFDVD4JFe0wJJJZiyfsxPA1CLFdIASTlSh88sa2UbiYHnT/8FEfnQO8E6pPdS+h
 jQJJFEzMeVLo6tIugMSFmH5vTL0uN8VVdS0ijgQNZWAEUuNszU2VtfHWeIvJP8BCo8
 sMuhFc27D3S1mYjpR3XaPky0bFlWab50KWn6Esx0=
Date: Tue, 24 Nov 2020 08:44:07 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 134/141] video: fbdev: lxfb_ops: Fix fall-through
 warnings for Clang
Message-ID: <20201124144407.GI16084@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <9c1dcb12aae7c7ff0907ffb99ffd227656cbe444.1605896060.git.gustavoars@kernel.org>
 <20201122220540.GC566387@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201122220540.GC566387@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Andres Salomon <dilinger@queued.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sun, Nov 22, 2020 at 11:05:40PM +0100, Sam Ravnborg wrote:
> Hi Gustavo,
> On Fri, Nov 20, 2020 at 12:40:32PM -0600, Gustavo A. R. Silva wrote:
> > In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> > by explicitly adding a break statement instead of letting the code fall
> > through to the next case.
> > 
> > Link: https://github.com/KSPP/linux/issues/115
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Thanks, applied this and the following patch to drm-misc-next.
> Looks forward to have this warning enabled.
> 
> One can only wonder how many hours will be saved by lettting the
> compiler tell you a break is missing. This is the kind of bugs you can
> stare you blind at.

Absolutely. We'll never know how many bugs this will catch in the
future decades of kernel development, before the code is even
committed/submitted. :)

Thanks!
--
Gustavo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
