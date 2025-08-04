Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369D4B1A13B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 14:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC00410E4FD;
	Mon,  4 Aug 2025 12:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NdhYXMYF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA8110E1A6;
 Mon,  4 Aug 2025 12:21:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C780B5C4D68;
 Mon,  4 Aug 2025 12:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2477C4CEF0;
 Mon,  4 Aug 2025 12:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754310082;
 bh=GVIsR9UI1altV1kTtPcm/oryGSkEOWVRMx3oTcoTi0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NdhYXMYF2kB3fulUFPbo2J9FQYtA2TD011batkMCZyIMlr/UOolu/T4sYpzeVSAmP
 QDNrZKVJzBrTGaphb+5EZZ9XeuoXhFq3c7d8dIEPiAIZ/W7vIrdlvHH7E6Dn5cCVLB
 +Qc/ByIvGFYuEsMP7tQL13P4wpB3w+trYOWG1oI5hfQxe72auVOiPnVkRL+OaiIoVT
 ylv4YwSiIN3PztHNfcKbMBQFXeJTiWWmo+oU4ggdtciVtO0yLhyz9U5PzsWHKW2a/3
 TxxT9+MmT4yx4D7eWfMLakTD3v8H73Nj3lzeuWMhocaemttC6lxAz2unBW3CTOTz7w
 dg/kaO4Mb0BPQ==
Date: Mon, 4 Aug 2025 14:21:17 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>, 
 Thorsten Leemhuis <linux@leemhuis.info>
Cc: Andy Mindful <andy.mindful@gmail.com>, linux-kernel@vger.kernel.org, 
 regressions@lists.linux.dev, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org, rafael@kernel.org,
 ville.syrjala@linux.intel.com, tglx@linutronix.de
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend in
 6.8+ on ThinkPad X1 Carbon Gen 10
Message-ID: <20250804-canceln-lokal-6bd98d42ab9c@brauner>
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com>
 <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
 <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com>
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

On Mon, Aug 04, 2025 at 11:15:46AM +0300, Jani Nikula wrote:
> On Sun, 03 Aug 2025, Andy Mindful <andy.mindful@gmail.com> wrote:
> > Here what I have from bisecting, please let me know if it makes things
> > clearer or not.
> 
> Doesn't point at graphics, anyway.
> 
> Cc: Christian.

No idea, the listmount() changes look completely unrelated and it's way
back in v6.8 so absolutely no clue. Should probably go talk to
hibernate/suspend/power people or talk to Thorsten to bisect this
further.

> 
> 
> BR,
> Jani.
> 
> 
> >
> > git bisect log
> > git bisect start
> > # status: waiting for both good and bad commits
> > # good: [6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1] Linux 6.7.11
> > git bisect good 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> > # status: waiting for bad commit, 1 good commit known
> > # bad: [6613476e225e090cc9aad49be7fa504e290dd33d] Linux 6.8-rc1
> > git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
> > # skip: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
> > git bisect skip 0dd3ee31125508cd67f7e7172247f05b7fd1753a
> > # good: [ba5afb9a84df2e6b26a1b6389b98849cd16ea757] fs: rework
> > listmount() implementation
> > git bisect good ba5afb9a84df2e6b26a1b6389b98849cd16ea757
> > # good: [61da593f4458f25c59f65cfd9ba1bda570db5db7] Merge tag
> > 'media/v6.8-2' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
> > git bisect good 61da593f4458f25c59f65cfd9ba1bda570db5db7
> > # bad: [e38f734add21d75d76dbcf7b214f4823131c1bae] Merge tag
> > 'staging-6.8-rc1' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
> > git bisect bad e38f734add21d75d76dbcf7b214f4823131c1bae
> > # bad: [5d197e97fb106c09d3d013be341e5961fd70ec8a] Merge tag
> > 'hsi-for-6.8' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-hsi
> > git bisect bad 5d197e97fb106c09d3d013be341e5961fd70ec8a
> > # good: [1b1934dbbdcf9aa2d507932ff488cec47999cf3f] Merge tag
> > 'docs-6.8-2' of git://git.lwn.net/linux
> > git bisect good 1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> > # good: [1b1934dbbdcf9aa2d507932ff488cec47999cf3f] Merge tag
> > 'docs-6.8-2' of git://git.lwn.net/linux
> > git bisect good 1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> > # bad: [8c9244af4dc8680a453e759331f0c93d5bde1898] Merge tag
> > 'kvm-x86-svm-6.8' of https://github.com/kvm-x86/linux into HEAD
> > git bisect bad 8c9244af4dc8680a453e759331f0c93d5bde1898
> > # bad: [783288010035e4c250a0b6491a4642cdb8d30548] KVM: x86: add
> > missing "depends on KVM"
> > git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
> > # bad: [783288010035e4c250a0b6491a4642cdb8d30548] KVM: x86: add
> > missing "depends on KVM"
> > git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
> > # bad: [861deac3b092f37b2c5e6871732f3e11486f7082] Linux 6.7-rc7
> > git bisect bad 861deac3b092f37b2c5e6871732f3e11486f7082
> >
> > # being on a 861deac3b092
> > git bisect bad
> > The merge base ba5afb9a84df2e6b26a1b6389b98849cd16ea757 is bad.
> > This means the bug has been fixed between
> > ba5afb9a84df2e6b26a1b6389b98849cd16ea757 and
> > [1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> > 61da593f4458f25c59f65cfd9ba1bda570db5db7
> > 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> > ba5afb9a84df2e6b26a1b6389b98849cd16ea757].
> >
> > Thanks.
> >
> > вт, 29 лип. 2025 р. о 13:20 Jani Nikula <jani.nikula@intel.com> пише:
> >>
> >> On Tue, 29 Jul 2025, Andy Mindful <andy.mindful@gmail.com> wrote:
> >> > Please let me know if any further information or testing is required.
> >>
> >> Likely the quickest way to find the root cause is to bisect the issue.
> >>
> >>
> >> BR,
> >> Jani.
> >>
> >> --
> >> Jani Nikula, Intel
> 
> -- 
> Jani Nikula, Intel
