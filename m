Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873A2B45A3F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 16:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C3D10E2EA;
	Fri,  5 Sep 2025 14:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="jJoKNftB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDB210E2EA;
 Fri,  5 Sep 2025 14:22:52 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2597840E01A2; 
 Fri,  5 Sep 2025 14:22:51 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id nc-3Lh5YaFEi; Fri,  5 Sep 2025 14:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1757082164; bh=otGHC79VZ8v1vivAuhLG8SQvF7wyCsRqd+lBryvA9R8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jJoKNftB+n8YtQjBDsVxeEzjJzaayx7zcdVEYdc/GpwMbV8yabu7R1emW3HapdteJ
 DezdL+b8fQXgFqA80RyShrZg90lY8yYnqZFKJaEB8d4jUQW54n6QXBPRTtnX24ZcS4
 PAy8p7ZezvTG/lSbcipV9hHxr3UpjDdQkzwkCfHWm6n4Jr2SyhZ1kdQnsiUdEmpdsl
 ksV/PxS4qCUID4aOqPJnTCWYbIDPjBtgDHuBpnPul+wNSluCcINbyOte6ErYKo5221
 awRhD0CTaGzsRV9JCy/3wH/vdd969vdTCRIsQ544zKZiMOv0lIGyfSI1Tgi8LXd3z/
 tFvdx7PSYOewvd+aEeNVqBx7grBVKnAxX8OQJN6NR3ufQ1+3uPW1Mnip+QXawDyeYQ
 efLH/+PPdxK3YeumSZlAGrZNeCRyd4BnL2UKiWlrfjVAMuIQYaXiUeHDAG2j+InjtR
 F3/8YCAfolHgVI/ZL6XSBHv31/EoMwXjeXhoPuqPhsNyHSDVkcvF/3sKMQYuCkyqZm
 IEX5RQ+v9Rp068Zv5hZ8ZCUWsUqa8k3nJ8BEmdnSiojod27n9Cmv4uOjAx7SHejhUy
 1UnxL6Dq27xtBVxDiinMqKo0BUjACJSP9WVdSrriRd5sVsj7gWO6mfDnzppdF+eiu8
 enSr6Gv1rhgvFKmglEPRJ2Io=
Received: from zn.tnic (p5de8ed27.dip0.t-ipconnect.de [93.232.237.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id
 C7ADD40E01A5; Fri,  5 Sep 2025 14:22:40 +0000 (UTC)
Date: Fri, 5 Sep 2025 16:22:34 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/radeon: use dev_warn_once() in CS parsers
Message-ID: <20250905142234.GEaLryKuIrRmSHaaTR@fat_crate.local>
References: <20250902165332.2388864-1-alexander.deucher@amd.com>
 <20250905101422.GAaLq3_kDePySD36Ma@fat_crate.local>
 <CADnq5_OZ585tA6nf95jU2RD0odLi8jt+qzLbnDCh9289Cy_hAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADnq5_OZ585tA6nf95jU2RD0odLi8jt+qzLbnDCh9289Cy_hAQ@mail.gmail.com>
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

On Fri, Sep 05, 2025 at 09:56:25AM -0400, Alex Deucher wrote:
> The size and offset come from userspace, so it's likely a mesa issue.
> I've reported it here:
> https://gitlab.freedesktop.org/mesa/mesa/-/issues/13838

Cool, thanks!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
