Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD3E55A1D6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125E710F1D8;
	Fri, 24 Jun 2022 19:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4EA10F1EE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Sihz11luVbLnMRxUqT40UrsUUIvpNZ+iZ5XFmcP949s=;
 b=fvhFy7tCy17aa75hVRKipc5JOYdRa1Z+RHBoenbtgriuGr33sLd85dLt4rr0BZOGVw47PyRE1fpkC
 pKJIpOzBY6k830ZRkM951a5iRedSU35/iHW/WrMzzV6Uj3H35r86dE2id0AQ9uAgPWMUxFgZ84HLxQ
 UhVA2j5/Rqqhko6KleF0iMHt8EbD+MFsYnz0ULbpZbG8491f/xvE8kKoRPOa6EpfcZdBey3wD8C2UT
 n4i5v7GGloV8NxaydiDBv/VY4KqliThyLs28AM6FX7+HKE37RQ9HXitKGR4Q8SFa81jn1oem9pOmjd
 VYOMSI3oUiJRZenZDIbYBPnlhvUsYCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Sihz11luVbLnMRxUqT40UrsUUIvpNZ+iZ5XFmcP949s=;
 b=8n9lroMQRcWpKMLu+unfvxTIumDzZX5gumVYDE20P3bgMXlOjnxe38bbVMAApCEO3vVTybIPOVmC8
 rnB6Y/QDA==
X-HalOne-Cookie: 2f5100d8768ceeccfebdba1eab392d44dbdd208c
X-HalOne-ID: 97d51f3c-f3f4-11ec-a6c4-d0431ea8a283
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 97d51f3c-f3f4-11ec-a6c4-d0431ea8a283;
 Fri, 24 Jun 2022 19:33:58 +0000 (UTC)
Date: Fri, 24 Jun 2022 21:33:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jiang Jian <jiangjian@cdjrlc.com>
Subject: Re: [PATCH] drm/panel: nt35510: Remove duplicate 'the' in two places.
Message-ID: <YrYRpfRapDZllh01@ravnborg.org>
References: <20220621140151.14404-1-jiangjian@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621140151.14404-1-jiangjian@cdjrlc.com>
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
Cc: airlied@linux.ie, thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 21, 2022 at 10:01:51PM +0800, Jiang Jian wrote:
> file: ./drivers/gpu/drm/panel/panel-novatek-nt35510.c
> line: 193,214,253
> * amplification for the the step-up circuit:
> changed to
> * amplification for the step-up circuit:
> 
> Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>

Thanks, applied to drm-misc (drm-misc-next)

	Sam
