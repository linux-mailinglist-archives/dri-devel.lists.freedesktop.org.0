Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09169A6A0B2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 08:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FFD10E143;
	Thu, 20 Mar 2025 07:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="j+mT875P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5346F10E143
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 07:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742456939;
 bh=VEdQkK/M+AHwY+qnwBstoqwJ9cdmVKhiNgj+o7GwjyQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j+mT875PgH3qCuHWdopTEF922HTEWxsQfNNs1FqbCjPLRLW4iYDX6Ofww+qncNhMQ
 uwVWtoi9eVsZ604BswYZf16lLC1+uypnQcKKwqElozxuOPdBTBKhRiMV7peYETdw2d
 7o07uUfztUY2byQhg5bgGJFktbB+2BaZpdfQYwf3Ewa/XmThDnqFwOQ3EAFt3uZUbm
 nH0dBx5j7L9C1NzjVMkoYB1V5gK1MMSv+1hV3zhBNwuF8a1ilwecKbeG4xdhN4ibKc
 AcGsPTdX/xN9iTArNn9ARbnkkZSexhdb/JBXek8PsOmWhUwgZRMWtyRuC0vvwV82Ve
 ZHdbXwUzPKHKw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 22E3017E0B46;
 Thu, 20 Mar 2025 08:48:59 +0100 (CET)
Date: Thu, 20 Mar 2025 08:48:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Hari.PrasathGE@microchip.com>
Cc: <Manikandan.M@microchip.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <Dharma.B@microchip.com>,
 <sam@ravnborg.org>, <bbrezillon@kernel.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH] MAINTAINERS: update Microchip's Atmel-HLCDC driver
 maintainers
Message-ID: <20250320084854.49d61c2a@collabora.com>
In-Reply-To: <662be697-acdb-42c2-8078-6baeb985a4ba@microchip.com>
References: <20240620095856.777390-1-manikandan.m@microchip.com>
 <20240620161317.063833a9@collabora.com>
 <662be697-acdb-42c2-8078-6baeb985a4ba@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 17 Mar 2025 08:30:51 +0000
<Hari.PrasathGE@microchip.com> wrote:

> Hello,
> 
> On 6/20/24 7:43 PM, Boris Brezillon wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Thu, 20 Jun 2024 15:28:56 +0530
> > Manikandan Muralidharan <manikandan.m@microchip.com> wrote:
> >   
> >> Drop Sam Ravnborg and Boris Brezillon as they are no longer interested in
> >> maintaining the drivers. Add myself and Dharma Balasubiramani as the
> >> Maintainer and co-maintainer for Microchip's Atmel-HLCDC driver.
> >> Thanks for their work.
> >>
> >> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>  
> > 
> > Acked-by: Boris Brezillon <boris.brezillon@collabora.com>
> >   
> 
> Looks like this patch is still not applied. May I know if there is 
> anything do be done from our side ?

Uh, sorry about that, I thought it had been applied by Sam. I just
queued the patch to drm-misc-next. Sorry again for the delay.

Regards,

Boris
