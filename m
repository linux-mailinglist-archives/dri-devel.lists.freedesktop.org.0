Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4364F68C25B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 16:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A4110E415;
	Mon,  6 Feb 2023 15:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E070E10E408
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 15:56:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 88C11B8120F;
 Mon,  6 Feb 2023 15:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104B5C433EF;
 Mon,  6 Feb 2023 15:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675699011;
 bh=BnMU2Vjrd6tRJvjN7xf5KorwAqVeIfdrGkW2yAZq9kQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ROhVM2Efz4vn2nh6kD6hb6VC89uKawXBwAHz5MXriaSHKM3TGp6uEWGs1ov1dLIBP
 4AUw3NeaIg0tbdX7P5IJjuSdbVJlJEeIqhGLd8818ThIPLEOtDMjK86AoOBsG9mQ5y
 bjHTjilv/6+C3nLLDiI114GMOQ2Ek4i/1J8nCf9VBgxIqtHvp+mR5LPP7zIrMksf+s
 EXnP6pFXTiwpU7u7Nnhju4JP/TojbNXs8hW7sN+gOkyxrn8VA2O2idinA0TMpRPlY5
 zM+fZOsT6nl/3k3xvNtpxlpr2LPs10GUGN1T3ctmJj8oOP2KG9FS9rDViCRb+QhibI
 htvSjNWMXZcaA==
Date: Mon, 6 Feb 2023 09:56:49 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] Revert "fbdev: Remove conflicting devices on PCI bus"
Message-ID: <20230206155649.GA2212009@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9twrKFPkEXTFWousnmJoH-mEG1KvGEBwqYY2e0biw-h8bw@mail.gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-pci@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Zeno Davatz <zdavatz@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 06, 2023 at 06:59:40AM +1000, Dave Airlie wrote:
> On Sat, 4 Feb 2023 at 09:09, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> >
> > This reverts commit 145eed48de278007f646b908fd70ac59d24ed81a.
> >
> > Zeno Davatz reported that 145eed48de27 ("fbdev: Remove conflicting devices
> > on PCI bus") caused a console hang.  The machine was actually still usable
> > via ssh, etc., but there was no activity on the console.
> >
> > Reverting 145eed48de27 for the nvidiafb on that system fixed the problem.
> >
> > Revert 145eed48de27 ("fbdev: Remove conflicting devices on PCI bus") since
> > we don't know what caused the problem.
> 
> Why is the user using nvidiafb?

I don't know, and of course, it really doesn't matter; we shouldn't
regress a user's experience, and there's no hint to the user of where
to look for a resolution.

Thanks for working out a better fix!

Bjorn
