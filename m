Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB2C39B9BC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 15:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5946E400;
	Fri,  4 Jun 2021 13:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D49C6E400
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 13:22:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 666EB613E7;
 Fri,  4 Jun 2021 13:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622812939;
 bh=iRXTZJ1/j6y4+BU2gyPMGifKfRMorvLra+BpePakUZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GWcoC2X3RFj7LIg0etg9XR+Ol4cYUMRjxMauHNEGImBMoOF7MscH3Lk4Hb6THjogO
 JzU7e9iNBriY/qU+Jk+VCz5o+C+lOYYF8EbbYgh9jsZBcK5nvZXMwjpMpFt86I7vUB
 Oy2RV60O8ouBKi6GmOLV4gyi7XH2gPYXGeKNvvRI=
Date: Fri, 4 Jun 2021 15:22:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 1/2] drivers/firmware: move x86 Generic System
 Framebuffers support
Message-ID: <YLopCCCkrci1IF9v@kroah.com>
References: <20210601145912.774054-1-javierm@redhat.com>
 <20210601145912.774054-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601145912.774054-2-javierm@redhat.com>
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
Cc: linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Arvind Sankar <nivedita@alum.mit.edu>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, x86@kernel.org,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Robinson <pbrobinson@gmail.com>,
 Joerg Roedel <jroedel@suse.de>, Chester Lin <clin@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sudeep Holla <sudeep.holla@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 01, 2021 at 04:59:11PM +0200, Javier Martinez Canillas wrote:
> The x86 architecture has generic support to register a system framebuffer
> platform device. It either registers a "simple-framebuffer" if the config
> option CONFIG_X86_SYSFB is enabled, or a legacy VGA/VBE/EFI FB device.
> 
> But the code is generic enough to be reused by other architectures and can
> be moved out of the arch/x86 directory.
> 
> This will allow to also support the simple{fb,drm} drivers on non-x86 EFI
> platforms, such as aarch64 where these drivers are only supported with DT.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
