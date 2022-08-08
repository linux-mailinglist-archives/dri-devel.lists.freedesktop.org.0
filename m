Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A7358CE2A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 20:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F7D10EA59;
	Mon,  8 Aug 2022 18:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5101510FC45
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 18:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=8ro8QFe7F/CDvg3eP66qcmeu1H41L9IuomH3WYmriAI=;
 b=tGd2NiYLim+c3xMEFjVFUBfbz2SPzSphF2BBc2VJu+m+kwrxSvTOxD+XVhOf9la9E6q186oAldj3z
 sosFApHd9SKr87tRmZV2ewecLbensdlGs4c2mZLDE0eJfMrFEAZAhW/TtNl6k9jHz1C8AVuELD0emP
 zV1kjwQXI9L4C6mtjfXifMRisXtLPIGpuh0iE2DP3Dj/dUHoWIO5OnkdHLN3a9rfl7zoz7SmAbGOOa
 jrrgEd6eIuqN/zn8Wz2gwzBFEJchF1fwriXc0DKlyXE0PzA6BvizOHguRcuHbbqPWMBTC0USx4vHdF
 cQWrQseMTykprcawkLz398ERHJy7trw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=8ro8QFe7F/CDvg3eP66qcmeu1H41L9IuomH3WYmriAI=;
 b=NhYFoGzwJdhws65nnxTSLZa2jPTF/UvdJHuohisXpY3pQYMKJMLroOxeF8n+NCpNVh4gOquCgxUU0
 AfhfGSQCQ==
X-HalOne-Cookie: 8b0e6ce8bd136faba0eabe5db463d88f1075504a
X-HalOne-ID: 73e86908-174b-11ed-8244-d0431ea8bb10
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 73e86908-174b-11ed-8244-d0431ea8bb10;
 Mon, 08 Aug 2022 18:53:55 +0000 (UTC)
Date: Mon, 8 Aug 2022 20:53:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: Re: [PATCH v1 0/7] New DRM driver for Intel VPU
Message-ID: <YvFbwqOKwwLPoGKi@ravnborg.org>
References: <20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com>
 <CAPM=9tyqsK3X_+s53Xy5jUs+cq3+aSkYne-E4NLLJ+NBnRqjNg@mail.gmail.com>
 <20220808144918.GA2666787@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808144918.GA2666787@linux.intel.com>
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 andrzej.kacprowski@linux.intel.com, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stanislaw,

> I'm not sure what we can add to TODO file, from driver perspective
> I think it's pretty much ready for merging (except renaming), just
> other components: F/W and user-space are not yet released.
> 
> > I think I'd like Christian/Maarten to maybe review the fencing/uapi,
> > to make sure nothing too much is wrong there. The submit/waitbo model
> > is getting a bit old, and using syncobjs might be useful to make it
> > more modern. Is this device meant to be used by multiple users at
> > once? Maybe we'd want scheduler integration for it as well (which I
> > think I saw mentioned somewhere in passing).
> 
> In the future we are planning to add support for
> HW based scheduling (we are also looking at SW scheduler) and we will
> likely revisit submit/sync APIs at that time.

This is already two entries in the TODO file.

	Sam
