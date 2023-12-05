Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D720805F63
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 21:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFB910E5FD;
	Tue,  5 Dec 2023 20:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 122161 seconds by postgrey-1.36 at gabe;
 Tue, 05 Dec 2023 20:27:41 UTC
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032F210E5FD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 20:27:40 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F018040E0195; 
 Tue,  5 Dec 2023 20:27:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 0DbshhlbnEIz; Tue,  5 Dec 2023 20:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1701808056; bh=uA2hJ4fVupdMziiNt0kfklNPGuoMpg4ALqlVG80QktE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y4QJXKFl4RtofbKfcrV8Od1c5MXix6a4l7FeCuYf8nvptijcUjjQHMFPuXKoz57/6
 Kyce2V3ri7B+CzbjEB7H7UG0I8aFePTBPyz7/lCaqLLgtx0wsCJXWcDOPXr3kv4Cc6
 CUAByGkaqOQEAj0kqj9/e9FqT86n9DhpVxiuPlGUM56csvruCA1M01J/ul50TpO5hq
 yLSQHnIkH1zb+hWXLrm0zDPkUH2i2m01pjXO5QBqZlwq5AmyFGSsMllztFWXFiKZ7k
 VROTu8ZdnO/IDjk0vkyyxBfoOESwWocsvqqFxCGaCDo+/ddWhcU8NshDBZWBcLS0GV
 UYgD1HyEJzFZayMtWOLkcC/oTEowJKYuh4mwjzpkHfmGwyTBqFykoqsEU173p229IQ
 GFT1I2sJjFYZe+pX/mI0D3FjIldJ/P4h1R9skZ+wDHoL/StmZ4qmqxI1uvwftn+E6k
 rV2acJ5oSIlbQZLdxxJ8a2vUVVTvoSSNw3ftv1AbjpOt0lIz0eXYXaHWcljPl9yv6Z
 P/C+ZqKvo2B9v9Kq4uM4Icgng7geUrNwu3jM/yEBQbJM82WwJXNwklHVt2YqVI2BuX
 6/pIygb17U9sOzs/IqIkyeSQyPLdJ4RlQOlVj9C818BNJ1GMymh1MX1OhySCmD9eD/
 kkI+j0u2Yj92vcJoQF5eGhVM=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C412340E014B;
 Tue,  5 Dec 2023 20:27:08 +0000 (UTC)
Date: Tue, 5 Dec 2023 21:27:03 +0100
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <amakhalov@vmware.com>
Subject: Re: [PATCH v2 5/6] drm/vmwgfx: Use vmware_hypercall API
Message-ID: <20231205202703.GIZW+Hl814mKqEDy/m@fat_crate.local>
References: <20231122233058.185601-8-amakhalov@vmware.com>
 <20231201232452.220355-1-amakhalov@vmware.com>
 <20231201232452.220355-6-amakhalov@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231201232452.220355-6-amakhalov@vmware.com>
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
Cc: pv-drivers@vmware.com, dri-devel@lists.freedesktop.org, namit@vmware.com,
 hpa@zytor.com, timothym@vmware.com, dave.hansen@linux.intel.co, x86@kernel.org,
 mingo@redhat.com, linux-graphics-maintainer@vmware.com,
 linux-input@vger.kernel.org, tzimmermann@suse.de, richardcochran@gmail.com,
 virtualization@lists.linux.dev, mripard@kernel.org, akaher@vmware.com,
 jsipek@vmware.com, tglx@linutronix.de, netdev@vger.kernel.org,
 dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org, horms@kernel.org,
 bp@alien8.d, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 01, 2023 at 03:24:51PM -0800, Alexey Makhalov wrote:
> Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
> Eliminate arch specific code.
> 
> drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h: implement arm64 variant
> of vmware_hypercall here for now. The move of these functions to
> arch/arm64/include/asm/vmware.h as well as removal of
> drivers/gpu/drm/vmwgfx/vmwgfx_msg_{x86,arm64}.h header files will
> be performed in the follow up patchset.

Same note as for patch 1 - no commit order in git.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
