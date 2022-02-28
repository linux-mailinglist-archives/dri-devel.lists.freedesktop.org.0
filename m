Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B7C4C70FE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 16:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495AB10E70D;
	Mon, 28 Feb 2022 15:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9581B10E706
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 15:52:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 528116100E;
 Mon, 28 Feb 2022 15:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E25C340E7;
 Mon, 28 Feb 2022 15:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646063528;
 bh=FuAUJa0N5Z3zphhfMynlqEJerBpQRZ5NCVKZkXGEJGA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=VprTpx0jqlg28TEPAjgnsQnPwdyANZxyYqLPyfs6nhvUP4tDdDNCxCLaecPFnDKOe
 K3mOuzruH85GTx1YVXCqi3FryOM5FbBpO1Rp1ZHDskHC6ScefuS351oY/N6DnPZSp3
 f8jv4N9xjmGlo41NVxvTGal0VLCobj/hEydYuSgNTt9wAWMz2jfUucAkBh2ZO9sFCo
 kewqC6q6ns3J7faSVGHVArFRo4gJzRnxq3zeEOvT4a1pGK5XnfDVwg/kPFvisH+vP9
 CWvjMcwj0vCCoWOJGXqaes5OemaWWxcXYj+MvBw4dkf0m2L6hCVSi116pE7dG3MiEp
 TDGbS+qUtokWw==
Date: Mon, 28 Feb 2022 09:52:06 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] docs: fix 'make htmldocs' error in vgaarbiter.rst
Message-ID: <20220228155206.GA501015@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228023003.1653402-1-wanjiabing@vivo.com>
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
Cc: jiabing.wan@qq.com, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 10:30:02AM +0800, Wan Jiabing wrote:
> Fix following 'make htmldocs' error:
> Error: Cannot open file ./drivers/gpu/vga/vgaarb.c
> Error: Cannot open file ./drivers/gpu/vga/vgaarb.c
> WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version
> 2.4.4 -export ./drivers/gpu/vga/vgaarb.c' failed with return code 2
> 
> Fixes: d6e1898bfa5b ("PCI/VGA: Move vgaarb to drivers/pci")
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Thanks, I squashed this into d6e1898bfa5b.

> ---
>  Documentation/gpu/vgaarbiter.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaarbiter.rst
> index 339ed5fecd2e..bde3c0afb059 100644
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
> 2.35.1
> 
