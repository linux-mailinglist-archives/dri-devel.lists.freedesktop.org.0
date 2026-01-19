Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D99ED3B890
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 21:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A750C10E50F;
	Mon, 19 Jan 2026 20:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="gG0TX4/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF8810E50F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 20:36:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768854997; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DDjzrAeHUiLdJ10jIaZP77QoiEf05fdiS/r/o9YrmGO0vc4RPuWWl4eDW4JrFoHu5lB9tTQYQhxQGEmNSruAr2Yc5PeDF5bUXjnnxZOHbumCS5QJdqyffIWYQS2goRrjs9FpKqcNtz94MkTYomlqzcKO1dPiFZwbeisVU9gRDKM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768854997;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=TQdZGb0oOwWI8Cu0pUCKnjGsYoiNP2/SvTOlD9oeAxQ=; 
 b=EtEsUwKrbWnz3PAwXaNNWsYBs88RTJqITbAOSv0zLqavXjvuQZI5LSCRuYQYPikFUKroEBg+eioatxnPIocBW0AdDppFJfTFW6znNKffLE5ktmfEoU5Xl92utkjuMRAO1kCNxu4y1fP9dR/A8zmmPy0e0ZRFwdq+o9sdokXTxzA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768854997; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=TQdZGb0oOwWI8Cu0pUCKnjGsYoiNP2/SvTOlD9oeAxQ=;
 b=gG0TX4/wFavmfeksiWlWZG9KSTfLN67eMW+lWfKCms9JCa2GqsXOTmHBZpixbFiU
 VrqqSB+D3SbwekdnVy+5CM8Nz56Kb8djpkTaq8De4qPib1r+kEpYNLK13pGjfvjE9dh
 FPDqwCB0R5kfOWWdMf0f+kmzq1SF4jQ+7IYHBcpY=
Received: by mx.zohomail.com with SMTPS id 1768854995501810.1118848998957;
 Mon, 19 Jan 2026 12:36:35 -0800 (PST)
Date: Mon, 19 Jan 2026 12:36:34 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com,
 aliceryhl@google.com, dri-devel@lists.freedesktop.org,
 ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
 a.hindborg@kernel.org, dakr@kernel.org
Subject: Re: [PATCH] rust: drm: tyr: Fix register name in error print
Message-ID: <aW6V0gn4mLiCUu1q@um790>
References: <20260119070838.3219739-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119070838.3219739-1-dirk.behme@de.bosch.com>
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

On Mon, Jan 19, 2026 at 08:08:38AM +0100, Dirk Behme wrote:
> The `..IRQ..` register is printed here. Not the `..INT..` one.
> Correct this.

Hi Dirk, I was hoping to get rid of this register read since it's really
just a bit of debugging, and it's the timeout error that is of more
interest.

What do you think of handling this through my read_poll_timeout changes
instead?

https://lore.kernel.org/rust-for-linux/20260119202645.362457-1-deborah.brouwer@collabora.com/

Thanks,
Deborah

> 
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GPUs")
> Link: https://lore.kernel.org/rust-for-linux/A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com/
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>  drivers/gpu/drm/tyr/driver.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 0389c558c0367..3047fd12fd849 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -76,7 +76,7 @@ fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
>          dev_err!(dev, "GPU reset failed with errno\n");
>          dev_err!(
>              dev,
> -            "GPU_INT_RAWSTAT is {}\n",
> +            "GPU_IRQ_RAWSTAT is {}\n",
>              regs::GPU_IRQ_RAWSTAT.read(dev, iomem)?
>          );
>  
> -- 
> 2.48.0
> 
