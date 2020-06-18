Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB31D1FFC9F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 22:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6776EBD0;
	Thu, 18 Jun 2020 20:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DE96EBCD;
 Thu, 18 Jun 2020 20:39:16 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0dcf00ed288847e9b97b82.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:cf00:ed28:8847:e9b9:7b82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DB92D1EC0422;
 Thu, 18 Jun 2020 22:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1592512755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=qaDaPVDxHbDWv9+oI2zUb1akLXpcihmbLjFQrzPj0K8=;
 b=XYKOiU4H4SlbzHHBUXpUZ6YpP4J6LTxnIut7y2vtqiqxUuq9vm22Z1RT9w/OOylJz7WqWx
 bYcP29reJYY7dLlvIfXCB87pT/9tW8Wl4XF/fMvrk7s0gbcBQGcTcdZXFpIP3Jg8Vbev0A
 2fHs8D4bkhd3QJbIWWEUjwdylcFIsRA=
Date: Thu, 18 Jun 2020 22:39:07 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] 2dd4d163cd9c ("drm/nouveau: remove open-coded version
 of remove_conflicting_pci_framebuffers()")
Message-ID: <20200618203907.GG27951@zn.tnic>
References: <20200618200106.GF27951@zn.tnic>
 <CAKb7UviibvRfqJgtLkePEuXFa6mQfi4h=7eeW+YQxB-StVjjrA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UviibvRfqJgtLkePEuXFa6mQfi4h=7eeW+YQxB-StVjjrA@mail.gmail.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 18, 2020 at 04:19:02PM -0400, Ilia Mirkin wrote:
> Hi Boris,
> 
> There was a fixup to that patch that you'll also have to revert first
> -- 7dbbdd37f2ae7dd4175ba3f86f4335c463b18403. I guess there's some
> subtle difference between the old open-coded logic and the helper,
> they were supposed to be identical.

Thanks, that's a good point. I reverted both but it still hangs. So
either my bisection is wrong or reverting those two is not enough due to
other changes.

I'll redo the bisection tomorrow, on a fresh head, to check.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
