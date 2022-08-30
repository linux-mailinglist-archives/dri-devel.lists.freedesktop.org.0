Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 456545A6955
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB27C10E0FA;
	Tue, 30 Aug 2022 17:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831D810E0FA
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 17:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=n3BfHw5PefRvzcOIO6sgbfBKO6vC5BZ/oJ9fLf1w7GI=;
 b=VvuIHcgm31RoGQz/bWZ5bFZuISuKqIdIicu+On8vsop1D78qHCpn/yy8CsOOdaVQsB81WFvaLcIMo
 /rE71LDC3EPWHR+HQQ5XHUwLKgM+0TH5x+aATQ8Emj55g9d8HHc9M2vZhpRvtlZjcNLvlE4z7fPLhc
 RjszyNcyb4PyHOxp/u0cw/vosQjseeRA2BDy9oQDEyX0svSDAy1fDZZQLD6uwB3OiL2C9B0DnXI+eP
 yyK2lRhBLPdeAe+5Pp5jTn4nXILSq0K+f2VOaM2o2zEUpgqS5Y4xERo1RsiDo4DdNIBDFBH0p3P+6/
 BPxQKuKg4dnOqdS0PXs3mNzZqkoKkxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=n3BfHw5PefRvzcOIO6sgbfBKO6vC5BZ/oJ9fLf1w7GI=;
 b=JraHDPTkoXnCs3RESpCFN6h2F7rJWy/53sl/xQ6XzCzk8Kl2sSIlsswXAMyFkKt/hV5TjzdXDt2aV
 rAfACMhBQ==
X-HalOne-Cookie: 941d2c37e9c4c58e81edbe42287d739f4454378b
X-HalOne-ID: 13648c46-2887-11ed-a6d1-d0431ea8a283
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 13648c46-2887-11ed-a6d1-d0431ea8a283;
 Tue, 30 Aug 2022 17:13:34 +0000 (UTC)
Date: Tue, 30 Aug 2022 19:13:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] tty/vt: Remove printable variable
Message-ID: <Yw5FPM8iHDxHmVwk@ravnborg.org>
References: <20220830132803.403744-1-daniel.vetter@ffwll.ch>
 <20220830134117.416003-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220830134117.416003-1-daniel.vetter@ffwll.ch>
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
Cc: Yangxi Xiang <xyangxi5@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 nick black <dankamongmen@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Xuezhi Zhang <zhangxuezhi1@coolpad.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Jiri Slaby <jirislaby@kernel.org>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, Aug 30, 2022 at 03:41:17PM +0200, Daniel Vetter wrote:
> Every since the 0.99.7A release when console_register() was introduced
> it's become impossible to call vt_console_print (called
> console_print() back then still) directly. Which means the
> initialization issue this variable protected against is no more.
> 
> Give it a send off with style and let it rest in peace.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: nick black <dankamongmen@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Yangxi Xiang <xyangxi5@gmail.com>
> Cc: Xuezhi Zhang <zhangxuezhi1@coolpad.com>

I saw this was sent again on accident, but that sdoes not prevent me
from adding a:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I was a bit reluctant to r-b it, but well this looks obviously correct,
so ...

	Sam
