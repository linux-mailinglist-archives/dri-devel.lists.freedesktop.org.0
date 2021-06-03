Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2BF39ABC7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 22:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837C86F4F7;
	Thu,  3 Jun 2021 20:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F766F4F7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 20:27:28 +0000 (UTC)
Received: from zn.tnic (p200300ec2f138500c7e12fc0802db454.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f13:8500:c7e1:2fc0:802d:b454])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0C77C1EC0246;
 Thu,  3 Jun 2021 22:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1622752042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=OdHEZyA0Yz82G9giMJIrJ6sLC/3gLs0Aj9USNqocCdM=;
 b=n/qUCf7CAevYLO1ua7Xqqjpw/2DKzujCT+H1jn+x5ugKmQ4H2WI5rxAl9X5LimeJKHbs2M
 kOUvyxeDDa1NQg8mJHgE84zLB/p8lkOiGljmxRGNZS3q9J3rhUJ5BPqkeW+gwtYIwq7KLo
 9nn344GKcSr0hzTiGpQkueO8Paj9s3Q=
Date: Thu, 3 Jun 2021 22:27:19 +0200
From: Borislav Petkov <bp@alien8.de>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 0/2] allow simple{fb,drm} drivers to be used on
 non-x86 EFI platforms
Message-ID: <YLk7HjX2OnLhMt4V@zn.tnic>
References: <20210601145912.774054-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210601145912.774054-1-javierm@redhat.com>
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
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Arvind Sankar <nivedita@alum.mit.edu>, Joerg Roedel <jroedel@suse.de>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Robinson <pbrobinson@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Chester Lin <clin@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sudeep Holla <sudeep.holla@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 01, 2021 at 04:59:10PM +0200, Javier Martinez Canillas wrote:
> The series touches different subystems and will need coordination between
> maintainers. Ard Biesheuvel said that can be merged through the EFI tree.

I'm always happy when code from arch/x86/ moves away so

Acked-by: Borislav Petkov <bp@suse.de>

Btw, for the future, please CC everyone on the whole patchset - I had to
go look at your 2/2 on lore to see what it does because I had only 1/2
in my mbox.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
