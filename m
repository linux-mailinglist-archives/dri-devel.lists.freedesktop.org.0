Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF605B19D70
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 10:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AAF10E418;
	Mon,  4 Aug 2025 08:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7fRjb2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D3310E418;
 Mon,  4 Aug 2025 08:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754295354; x=1785831354;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=pA9jhh32U8fiXcMETW3qk/WW7vOAR6HRICqVHm7AxLA=;
 b=j7fRjb2rDlNHxai13W2xnc1jXtiU4JNW+NXuKp7t8IzbkhupqZv/gnbA
 Ypof10XFqZtKWpfya1nRXYRi2EU1TDPaC11p92mjkAw5vIo9T9L6rsFCx
 zIAZWho8wpDNezP2/H4s/psbUJc7bc+0RMtMZpoBRsvC559BTpqfH/7hh
 EVw+fHSW1ZkM53RsYz77H+h0sMWBg5zMmIxXudfER5WSjeK01wAYO0fl/
 xVD2NMlX985vXMe7lE1XymeLncgFX0kaVFV6YK0W7/7AeM9uE1NDvyVXk
 Nr0nsoq9Fo+YmKsT21tZnseJG0mX5359mSThYrUKH4D9Y4JVWEmNX8V3q w==;
X-CSE-ConnectionGUID: 68KNvBokS/60KyH2rD0VWw==
X-CSE-MsgGUID: J4qNIDVoSS+PFpck5fAt6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56416776"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="56416776"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 01:15:54 -0700
X-CSE-ConnectionGUID: x0GooDByQj6UMZMtLPw0UQ==
X-CSE-MsgGUID: 8d5EEFXwTP+ktmshP+cDIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="168304533"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.215])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 01:15:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Mindful <andy.mindful@gmail.com>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 rafael@kernel.org, ville.syrjala@linux.intel.com, tglx@linutronix.de,
 Christian Brauner <brauner@kernel.org>
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend
 in 6.8+ on ThinkPad X1 Carbon Gen 10
In-Reply-To: <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com>
 <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
Date: Mon, 04 Aug 2025 11:15:46 +0300
Message-ID: <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Sun, 03 Aug 2025, Andy Mindful <andy.mindful@gmail.com> wrote:
> Here what I have from bisecting, please let me know if it makes things
> clearer or not.

Doesn't point at graphics, anyway.

Cc: Christian.


BR,
Jani.


>
> git bisect log
> git bisect start
> # status: waiting for both good and bad commits
> # good: [6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1] Linux 6.7.11
> git bisect good 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> # status: waiting for bad commit, 1 good commit known
> # bad: [6613476e225e090cc9aad49be7fa504e290dd33d] Linux 6.8-rc1
> git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
> # skip: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
> git bisect skip 0dd3ee31125508cd67f7e7172247f05b7fd1753a
> # good: [ba5afb9a84df2e6b26a1b6389b98849cd16ea757] fs: rework
> listmount() implementation
> git bisect good ba5afb9a84df2e6b26a1b6389b98849cd16ea757
> # good: [61da593f4458f25c59f65cfd9ba1bda570db5db7] Merge tag
> 'media/v6.8-2' of
> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
> git bisect good 61da593f4458f25c59f65cfd9ba1bda570db5db7
> # bad: [e38f734add21d75d76dbcf7b214f4823131c1bae] Merge tag
> 'staging-6.8-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
> git bisect bad e38f734add21d75d76dbcf7b214f4823131c1bae
> # bad: [5d197e97fb106c09d3d013be341e5961fd70ec8a] Merge tag
> 'hsi-for-6.8' of
> git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-hsi
> git bisect bad 5d197e97fb106c09d3d013be341e5961fd70ec8a
> # good: [1b1934dbbdcf9aa2d507932ff488cec47999cf3f] Merge tag
> 'docs-6.8-2' of git://git.lwn.net/linux
> git bisect good 1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> # good: [1b1934dbbdcf9aa2d507932ff488cec47999cf3f] Merge tag
> 'docs-6.8-2' of git://git.lwn.net/linux
> git bisect good 1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> # bad: [8c9244af4dc8680a453e759331f0c93d5bde1898] Merge tag
> 'kvm-x86-svm-6.8' of https://github.com/kvm-x86/linux into HEAD
> git bisect bad 8c9244af4dc8680a453e759331f0c93d5bde1898
> # bad: [783288010035e4c250a0b6491a4642cdb8d30548] KVM: x86: add
> missing "depends on KVM"
> git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
> # bad: [783288010035e4c250a0b6491a4642cdb8d30548] KVM: x86: add
> missing "depends on KVM"
> git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
> # bad: [861deac3b092f37b2c5e6871732f3e11486f7082] Linux 6.7-rc7
> git bisect bad 861deac3b092f37b2c5e6871732f3e11486f7082
>
> # being on a 861deac3b092
> git bisect bad
> The merge base ba5afb9a84df2e6b26a1b6389b98849cd16ea757 is bad.
> This means the bug has been fixed between
> ba5afb9a84df2e6b26a1b6389b98849cd16ea757 and
> [1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> 61da593f4458f25c59f65cfd9ba1bda570db5db7
> 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> ba5afb9a84df2e6b26a1b6389b98849cd16ea757].
>
> Thanks.
>
> =D0=B2=D1=82, 29 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 13:20 Ja=
ni Nikula <jani.nikula@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>>
>> On Tue, 29 Jul 2025, Andy Mindful <andy.mindful@gmail.com> wrote:
>> > Please let me know if any further information or testing is required.
>>
>> Likely the quickest way to find the root cause is to bisect the issue.
>>
>>
>> BR,
>> Jani.
>>
>> --
>> Jani Nikula, Intel

--=20
Jani Nikula, Intel
