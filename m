Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 583064C9554
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 21:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAA510E13F;
	Tue,  1 Mar 2022 20:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBCD10E13F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 20:02:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6FEF5CE1D23;
 Tue,  1 Mar 2022 20:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAACC340EE;
 Tue,  1 Mar 2022 20:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646164939;
 bh=UUVYbmulLMUrxKXtd4GDe7HCMoTaW7UmSbQD4MyDMB4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=D5kGyTrI2spf/l4NhdmT6MAfu6xixhKJBqviPcNaGRRDED6ajN1UzpP5rXAYiiuia
 jTBj9CGU34KkG+O57KUHrA3ewxgVMa5RSQpdXpQa/c6cO6uE9TJYin/jEeGU+h3K79
 GNKln+BmV1OsZplf7va3TlkqAtFHEHgmgMR7P3xMJleJv8STfn4Ah+WdZMauHmpSnb
 0JMEpV8Jew1RdVjBpmik8GdluzN8ZI4PPi8+y6BsLrblZ8KiX7eaOE0G0XhL8nrN4P
 synUu/GHEihS+iTVu4SHcXDVotSKNn+tpN9DDxa73RDy6xGJB+J9Y+p0pFJMR3jWRx
 0AD9vkEDXV3VA==
Date: Tue, 1 Mar 2022 14:02:18 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: trix@redhat.com
Subject: Re: [PATCH] vgaarbiter: fix vgaarbiter doc build break
Message-ID: <20220301200218.GA642697@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301192909.294900-1-trix@redhat.com>
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
Cc: tzimmermann@suse.de, corbet@lwn.net, airlied@linux.ie,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bhelgaas@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 01, 2022 at 11:29:09AM -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> make htmldocs fails with
> Error: Cannot open file ./drivers/gpu/vga/vgaarb.c
> 
> The location of the file changed
> drivers/gpu/vga/vgaarb.c -> drivers/pci/vgaarb.c
> So update the docs with the new location.
> 
> Fixes: d6e1898bfa5b ("PCI/VGA: Move vgaarb to drivers/pci")
> Signed-off-by: Tom Rix <trix@redhat.com>

Fixed, thanks!

> ---
>  Documentation/gpu/vgaarbiter.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaarbiter.rst
> index 339ed5fecd2e4..bde3c0afb0590 100644
> --- a/Documentation/gpu/vgaarbiter.rst
> +++ b/Documentation/gpu/vgaarbiter.rst
> @@ -100,7 +100,7 @@ In-kernel interface
>  .. kernel-doc:: include/linux/vgaarb.h
>     :internal:
>  
> -.. kernel-doc:: drivers/gpu/vga/vgaarb.c
> +.. kernel-doc:: drivers/pci/vgaarb.c
>     :export:
>  
>  libpciaccess
> -- 
> 2.26.3
> 
