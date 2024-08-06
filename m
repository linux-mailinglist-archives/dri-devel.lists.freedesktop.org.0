Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1E494898A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 08:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF0310E0A1;
	Tue,  6 Aug 2024 06:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zv6CZQIW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B089910E0A1;
 Tue,  6 Aug 2024 06:38:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 89EE6CE0D9A;
 Tue,  6 Aug 2024 06:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F45AC32786;
 Tue,  6 Aug 2024 06:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1722926335;
 bh=Fi+lZKOUhW5Q57CjW0zk+vxyeKJfgoYlfcviUnvH59U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zv6CZQIWyRCLPJ7K95vQ8cS+NpDmVhm2d7cp97T1o0xDLC0/f/33XZX+pyrTTv//0
 1rUaztKb4F3cBlOKRzWDbGLAJCfClbycF8TcsxvBCwJFZrc9WqYD5/sHN3bSqSKISZ
 kms9tRQD5NPDdbGxDZnCvN7wET1avrfF+Psj1/1I=
Date: Tue, 6 Aug 2024 08:38:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, stable@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Jann Horn <jannh@google.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 0/2] Fix mmap memory boundary calculation
Message-ID: <2024080640-landfall-doozy-e0d2@gregkh>
References: <20240805102554.154464-1-andi.shyti@linux.intel.com>
 <ZrFMopcHlT6G7p3V@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrFMopcHlT6G7p3V@ashyti-mobl2.lan>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 05, 2024 at 11:05:22PM +0100, Andi Shyti wrote:
> Hi Greg,
> 
> > Andi Shyti (2):
> >   drm/i915/gem: Adjust vma offset for framebuffer mmap offset
> >   drm/i915/gem: Fix Virtual Memory mapping boundaries calculation
> 
> I have forgotten to Cc the stable mailing list here. These two
> patches need to be merged together even if only the second patch
> has the "Fixes:" tag.
> 
> Is there anything I should still do here?
> 
> I could have used the "Requires:" tag, but the commit id would
> change in between merges and rebases.

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
