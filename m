Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C646936FD
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 12:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1B710E00A;
	Sun, 12 Feb 2023 11:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A46B10E00A
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 11:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id C4063FB03;
 Sun, 12 Feb 2023 12:21:50 +0100 (CET)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CFLzvt03jpiR; Sun, 12 Feb 2023 12:21:49 +0100 (CET)
Date: Sun, 12 Feb 2023 12:21:48 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 0/1] drm/panel: st7703: Fix initialization failures on
 Xingbangda XBD599
Message-ID: <Y+jLzCUyno4A+SiD@qwark.sigxcpu.org>
References: <20230211171748.36692-1-frank@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211171748.36692-1-frank@oltmanns.dev>
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
Cc: Ondrej Jirman <megous@megous.com>, Purism Kernel Team <kernel@puri.sm>,
 Sam Ravnborg <sam@ravnborg.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Frank,

Thanks for giving this another spin!

On Sat, Feb 11, 2023 at 06:17:47PM +0100, Frank Oltmanns wrote:
> This patch fixes intermittent panel initialization failures and screen
> corruption during resume from sleep on panel xingbangda,xbd599 (e.g.
> used in PinePhone).
> 
> It was originally submitted by Ondrej Jirman in July 2020:
> https://lore.kernel.org/all/20200716123753.3552425-1-megous@megous.com/
> 
> The original patchset contained two patches. One of them broke the panel
> on the Purism Librem 5.

Just for completeness: It's the Librem 5 Devkit, the Librem 5 uses the
mantix,mlaf057we51-x panel.

> This is the concluding message from Guido Günther in that thread:
> https://lore.kernel.org/all/20200801110409.GA6351@bogon.m.sigxcpu.org/#t
> 
> Guido wanted changes to the commit message. I updated it to adress his
> requests.
> 
> I send this patch in Ondřej's name with his consent.
> 
> The patch is based on drm-next.
> 
> Please let me know what you think.

I'll retest this on the devkit on the next days, might be a moment until
I get to that.

Cheers,
 -- Guido
