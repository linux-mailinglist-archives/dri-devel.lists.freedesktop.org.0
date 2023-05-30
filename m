Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F091715A91
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9245210E374;
	Tue, 30 May 2023 09:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2331410E374
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 09:46:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126205206011.34.openmobile.ne.jp
 [126.205.206.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08EC97EC;
 Tue, 30 May 2023 11:46:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685439996;
 bh=hB8bI2OI4BfKf+ifsUhNkvV6Hff+MOc38Z2//iApy5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pSE7LNLNf8bm0AEHw7/lSnsCU8oN/gXzirxmFkJRHbUu1c9gY8xFYpDXNFOWtW/Ow
 IasrGWnfqPN6XmmdlMAcb3j+bIYLrMJ2TFPNojBZugAQAugwTFMNqws976UVermofH
 POyL+PYLNMqlqIe7Blcav2u7WVchKXWrbFzvCk8s=
Date: Tue, 30 May 2023 12:46:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm: rcar-du: Use dev_err_probe()
Message-ID: <20230530094656.GA19436@pendragon.ideasonboard.com>
References: <20230530092629.18329-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUQ+WS=DS3n-7Kb=DFkqFD=gX0zpy85XZJ1TaMuSoZzqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUQ+WS=DS3n-7Kb=DFkqFD=gX0zpy85XZJ1TaMuSoZzqQ@mail.gmail.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Tue, May 30, 2023 at 11:38:44AM +0200, Geert Uytterhoeven wrote:
> On Tue, May 30, 2023 at 11:34 AM Laurent Pinchart wrote:
> > Replace manual handling of EPROBE_DEFER with dev_err_probe() to simplify
> > the code.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> I sent a similar patch before:
> https://lore.kernel.org/linux-renesas-soc/62adddea1fc5e9133766af2d953be7334f4622aa.1638959417.git.geert+renesas@glider.be
> leading to your comment that the deeper paths should be fixed instead.

Thanks for your help dealing with my goldfish memory :-)

I'll try to fix the deeper paths.

-- 
Regards,

Laurent Pinchart
