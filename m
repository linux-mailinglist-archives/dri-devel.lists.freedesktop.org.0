Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B503FD004EB
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 23:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB1A10E65C;
	Wed,  7 Jan 2026 22:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="PFnUpd9j";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="PBQACCoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2AD10E65C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 22:29:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-0n7x.prod.antispam.mailspamprotection.com;
 s=arckey; t=1767824949; 
 b=dSO8fB6nn0PuEtJV9lfG844nxf+FLMYJFK4OX4YUUauI/TIeBl+d1EBJyxILQUQwL+Nx1iYNS7
 Y2OTKLSmsU0Vo6jcOemG4mfoUsTwP/ozafOsywouvkYV1BfYXLrAkcfOF/96aZXEpsDCXUFODM
 /xpwJ7d8FLnUOOJMzsAjN3RXoX7VjmJB3YQyH6eiR6otd2N5S6XSlkZ8JTKogpTsiTOo7a1lIz
 HfTo1YqOlt/xznFUV3iH7/0KdzVX59ZxHi3LKyBwI9jPCgAxxamJ/7sUgTxrkpckVi+kmFZT9W
 ECOIZMx+oti9RIfcBskkhcp0oOlU0uLR3mFMEc3Rn0GxLg==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-0n7x.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-0n7x.prod.antispam.mailspamprotection.com;
 s=arckey; t=1767824949; 
 bh=vUJ0BbrXYh7mZy663ljqfYIed37Fm7MXEIH9GYaQaRw=;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
 From:Date:DKIM-Signature:DKIM-Signature;
 b=hcDau2fq2vnU2sELca99JBjbD/oPznmbY6VImaOL0hHcZvJSxkwd4k7ZWmoVBmFwWLKpnkw4N8
 rZGu8U7jpcnlFtCJbUzUdBdWm0ei3Y6QLRgLutUvQ767EY2sI5DdwwXKUkahPoDBnfahsLoteO
 wgwf5JBulGHs09xEK6F9OOp7VyyScepZrK+MXqG0FgcWtZypCcueZWNcAI+0n0rzf4HCyt1K1N
 mG2CPoqpEM7Ba35sxHByWapEkbWxozC9GFNLrXqnT9pqDc7DOB9A4JVjW8VAXVqHt/3wB6JtfB
 aTMzUt1wJBU3IKaO7DWakc7+luS1DkkPpco2eRn62knY2g==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 List-Unsubscribe:Content-Transfer-Encoding;
 bh=yVpw/AFuECU04xueC/YGj/KVCIxCNmuJWWOG1YRA/ns=; b=PFnUpd9juK6XPm/LWKQt9N7Z+5
 e4/H6g1g0+7PwN64taj+752Rhm080MRL9GhZZp7bqhEaVwGMco5AFY8T/+G5XKUz/dVed+C/Z9GC+
 9mwsaVdPPgTGNjYAs1NE9vVgVNj/JXAncaMz/Jm6a7v3SSvR6Sjr3qcnl/AOXNwFTCXw=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-0n7x.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vdc1Z-000000028Is-0086
 for dri-devel@lists.freedesktop.org; Wed, 07 Jan 2026 22:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=yVpw/AFuECU04xueC/YGj/KVCIxCNmuJWWOG1YRA/ns=; b=PBQACCoT+6hh/NZcgoOJuQrlyl
 AwyX7RM6fS0wUTl/N2m4KlG8PIsV41d4736N+derKRY6gvBkcko+zzKriqABXlCcdZmZGzc9nGXYw
 /WLBORKPx8Y/mpxbzSH+lrc9RAjfdxnntlULWjn8oAamIcupVWU6xjI7Z0iE5hvzIF9Y=;
Received: from [95.248.141.113] (port=63495 helo=bywater)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vdc1B-00000000BOX-0u1s; Wed, 07 Jan 2026 22:28:41 +0000
Date: Wed, 7 Jan 2026 23:28:39 +0100
From: Francesco Valla <francesco@valla.it>
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/3] drm: client: add splash client
Message-ID: <aV7eF5C_yUGAfdRe@bywater>
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
 <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
 <894581a9-2a30-428d-ab94-34697147d68e@kernel.org>
 <aV1xe09kYUwj4ocm@bywater>
 <dedc1825-26ca-4976-b174-8d7a740e25e3@kernel.org>
 <12c72476-a4e8-4b00-80ae-b8eed0b6f7a7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12c72476-a4e8-4b00-80ae-b8eed0b6f7a7@kernel.org>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 472b68edcc488cc517e80b9ed1649f0b
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vdc1Z-000000028Is-0086-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-0n7x.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

On Tue, Jan 06, 2026 at 08:40:46PM -0600, Mario Limonciello (AMD) (kernel.org) wrote:
> > > Yes, that's the idea. I am still searching a EFI-enabled platform I can
> > > perform some proper tests on, as I'm not really familiar with EFI.
> > > This version was tested with OVMF on QEMU, but without a real userspace.
> > 
> > Almost any modern x86 platform except for a chromebook uses EFI.
> > 
> > I'll add them to my local dev tree and test too and see if I can get you
> > some feedback if I run into any problems.
> > 
> From my side when testing I hit this during kernel build:
> 
> ERROR: modpost: "bgrt_tab" [drivers/gpu/drm/clients/drm_client_lib.ko]
> undefined!
> ERROR: modpost: "bgrt_image_size"
> [drivers/gpu/drm/clients/drm_client_lib.ko] undefined!
>

I got the dependency wrong there, mistrusting the efifb driver (but I
should have checked). I made CONFIG_DRM_CLIENT_SPLASH_SRC_BGRT dependent
on CONFIG_EFI, while it should depend on CONFIG_ACPI_BGRT (which in turn
depends on CONFIG_EFI). I'll fix in the next revision (if the overall
work is deemed useful).

Also, please note that the current version is not considering the x/y
offset provided by the BGRT, nor the associated quirks and sanity
checks.

Thank you

Regards,
Francesco

