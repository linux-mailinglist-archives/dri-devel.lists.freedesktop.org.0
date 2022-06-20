Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2117C55220F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 18:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A0010E13B;
	Mon, 20 Jun 2022 16:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC0E10E0CF;
 Mon, 20 Jun 2022 16:17:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A86EEB80F4B;
 Mon, 20 Jun 2022 16:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9872DC3411B;
 Mon, 20 Jun 2022 16:17:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Af0L2X3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1655741820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r8XDY6Tg9spjyImBEe77x+p7/fYrgyNJ1O9uDQWn2Pg=;
 b=Af0L2X3PmvbwJ8zDev6gDT0wyfJArwgs5704ObT3ml0Z8726NwQbwe5Je6gkkjQc1Qpjzf
 /5hfWpPyFzLQHEma5MEgeCwlHDdtnTrY4bBGPVAsaizUaMwT2AR8/nkPtz5c1tYegNIZmy
 lGfwO3no0o8pds+lPvb85ZiMQSzkRIY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2213f23c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 20 Jun 2022 16:17:00 +0000 (UTC)
Date: Mon, 20 Jun 2022 18:16:54 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Re-add check for low
 voltage sku for max dp source rate
Message-ID: <YrCddlmhykkRDQAC@zx2c4.com>
References: <20220613102241.9236-1-Jason@zx2c4.com>
 <CAHmME9q0QbuUR-11gkFG9PQpHrNfZk2b-Ja+tDnqbV13JCJ7+g@mail.gmail.com>
 <875ykvtix5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <875ykvtix5.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On Mon, Jun 20, 2022 at 07:10:30PM +0300, Jani Nikula wrote:
> On Mon, 20 Jun 2022, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> > Hi Jani,
> >
> > Do you plan to merge this revert?
> 
> Yes, I've done that now, thanks for the bisection and the patch.

Thanks!

I see that this went into `drm-intel-next`, but shouldn't it go into
`drm-intel-fixes`, so that it makes it into 5.19-rc4?

Jason
