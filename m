Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1C855BC26
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 23:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E213B10F2A4;
	Mon, 27 Jun 2022 21:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C443A10F2A4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 21:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=o3o8D4GTvlHaE/VGiET7TeprrI0MzLS1L9aAV5TO1ZU=;
 b=uhpTWrZvXsDjnHSZOUGP3lSeCL1U+U5ICYtQUl8Dj8ajl69dZx/zs4gm+nnYGQ53+7UAdHKmja73F
 5/JMNoR2yOky8nxYvd6NlRTpf6uhlDUve+oG9wVBmwjOhmKg6Ntyd0YidxESf7ehIrG4PdYOKcetSo
 4YFmBJLC9qADbD1HRlEm658fgbsdKpuxu9WwiXqP/Dr9Uoru0J5Mm5rlxcSLgVA6Ggqr/smj+L8wr2
 LTNBDiUfhJpKLkGdw276pS4DUt6soi8t3MRlg33mZ+Z/ahAxz9LkVIByQtv6L7iIs0mOENq5zH3/w5
 imwMIqXCsws0vBLIyo7KYLiisSj9fPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=o3o8D4GTvlHaE/VGiET7TeprrI0MzLS1L9aAV5TO1ZU=;
 b=b64CFpHHyPjyJqHg7gZ9Db+evx7sXbueLDK6BG28Yz3RYCgT6vbCmfl2bs1fF3SKlJ9jOp7dd6lX+
 HE0EIJQBA==
X-HalOne-Cookie: 304d79826e095e17f8f9be3abe93b396225f6f2c
X-HalOne-ID: 956c481f-f660-11ec-be7c-d0431ea8bb03
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 956c481f-f660-11ec-be7c-d0431ea8bb03;
 Mon, 27 Jun 2022 21:32:02 +0000 (UTC)
Date: Mon, 27 Jun 2022 23:32:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/28] OpenChrome DRM for Linux 5.20
Message-ID: <Yroh0fe4Fzqgam3W@ravnborg.org>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
 <dacc0636-d307-3f2f-260d-09208a0dd9c1@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dacc0636-d307-3f2f-260d-09208a0dd9c1@suse.de>
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
 dri-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin/Thomas,

> 
> I had a brief look over the patches. Even though the code looks fairly rough
> in places, I think we should get this driver merged ASAP.

Agreed, we have a had a few cases where we dragged out committing much
too long time.

Timing wise, it would be good if we can already hit drm-misc-next right
_after_ the pull -so we have a full cycle to fix anything before it hits
mainline.

> For the old via driver, I think we need a better apprach. IMHO it would be
> preferable to put the new driver into via/ but keep the old driver there as
> well.  A build option would control which is being used.

I assume the user base for via drivers are very small and they have the
fbdev driver already.
So I support replacing the current via drm driver as Kevin tries to do.

But anyway we need a patch set that applies without extra
delete file / add file cycles as the next step.

	Sam
