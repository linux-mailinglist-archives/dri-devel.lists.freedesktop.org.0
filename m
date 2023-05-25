Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9E27110DE
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 18:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0212410E6C7;
	Thu, 25 May 2023 16:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BC510E6C6;
 Thu, 25 May 2023 16:26:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F97861943;
 Thu, 25 May 2023 16:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D93CC433D2;
 Thu, 25 May 2023 16:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685031970;
 bh=9r0jbBR7McMF/0ZzdVdV9BfHGtbNUDijnKKHIwO5/SY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kNUFM1i9s3rgYgosQSKJAdpoSN1Oe9VctXVEKJSNXhhKiWx2MV/5LnMcHe4Zg1HNW
 k+h/SbNfjW0VNAFL5gPWWWVlSdPsPChVp+Tffrw5ZcioNvQB6pSMJxyCVU1yjSDLFu
 KgQYBkFZM+FuA+I7VVVTN0EfhnKY/496zbB4IR5lR3nQ512+cYvqM5oLxVPDaEHI1W
 9IeoE9jbqZTfJhpjLtAZHZLdfeJBep5plsD5bnZrncnQfDDC6wgG2mCRPRicnXhZ6C
 SMu2+gwvEz3mr0rLPmTgheekWF7odzrLeyT7nTUSVXc2CX7gx+RYEYQaa52wJ4peJx
 ylYLVWXkIdzmw==
Date: Thu, 25 May 2023 09:26:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2] drm/amd/display: enable more strict compile checks
Message-ID: <20230525162607.GA550162@dev-arch.thelio-3990X>
References: <20230524191955.252212-1-hamza.mahfooz@amd.com>
 <CADnq5_Mz6aPFYGnr8J8C8UeTpbo7JDg+uvjqAxo7o4vmTGej2A@mail.gmail.com>
 <DM6PR12MB3996C4248CBC968A7B08341583419@DM6PR12MB3996.namprd12.prod.outlook.com>
 <BL1PR12MB589849F37FBE98A3A06A316185419@BL1PR12MB5898.namprd12.prod.outlook.com>
 <3fefc712-913a-a391-bc7b-c0c75eff1c3d@amd.com>
 <CADnq5_OdWbg6zKjPrRwd2QSDnHgFuThF+OQHM=tVWj-2ySCu_A@mail.gmail.com>
 <e26351ed-ba64-b7e1-5165-de40622e0d30@amd.com>
 <202305250832.0127ABAC@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202305250832.0127ABAC@keescook>
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Ho, Kenny" <Kenny.Ho@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Russell,
 Kent" <Kent.Russell@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 08:37:07AM -0700, Kees Cook wrote:
> Hi!
> 
> On Wed, May 24, 2023 at 04:27:31PM -0400, Hamza Mahfooz wrote:
> > + Kees
> > 
> > On 5/24/23 15:50, Alex Deucher wrote:
> > > On Wed, May 24, 2023 at 3:46 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
> > > > 
> > > > Sure, I think we tried enabling warnings as errors before and had to
> > > > revert it because of weird compiler quirks or the variety of compiler
> > > > versions that need to be supported.
> > > > 
> > > > Alex, are you planning to upstream this, or is this only to enforce more
> > > > internal discipline about not ignoring warnings?
> > > 
> > > I'd like to upstream it.  Upstream already has CONFIG_WERROR as a
> > > config option, but it's been problematic to enable in CI because of
> > > various breakages outside of the driver and in different compilers.
> > > That said, I don't know how much trouble enabling it will cause with
> > > various compilers in the wild.
> 
> -Wmisleading-indentation is already part of -Wall, so this is globally
> enabled already.
> 
> -Wunused is enabled under W=1, and it's pretty noisy still. If you can
> get builds clean in drm, that'll be a good step towards getting it
> enabled globally. (A middle ground with less to clean up might be
> -Wunused-but-set-variable)
> 
> I agree about -Werror: just stick with CONFIG_WERROR instead.

There is also W=e, added by commit c77d06e70d59 ("kbuild: support W=e
to make build abort in case of warning") in 5.19, which works well for
building with configurations that do not have CONFIG_WERROR enabled and
avoiding dipping into menuconfig.

Unconditionally enabling -Werror with no way to turn it off is just
asking for problems over time with new compiler versions, either due to
new warnings in -Wall or warnings that have been improved or changed.
Should that still be desired, consider doing what i915 and PowerPC have
done and add a Kconfig option that can be disabled.

Cheers,
Nathan
