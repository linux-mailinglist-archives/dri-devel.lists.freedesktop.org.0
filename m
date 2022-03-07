Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5FA4D02B0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E1910E0B0;
	Mon,  7 Mar 2022 15:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5011A10E0B0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 15:25:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7C0761494;
 Mon,  7 Mar 2022 15:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B884C340EB;
 Mon,  7 Mar 2022 15:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646666733;
 bh=BNQWhI2ZZ59vaTrOPgc5ts1aXPYVmELNBcWywiAR6ug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SnAbyCdbk1hQur6TFu02eVVDcJCVsjO+0vHlxOYZuK08YK0WDdtrP0AY8VMxqnRQx
 oRs4ngY50FAS0myedFBp7iw5T0zkCCKtxsg41jU5JIOIhChW2pTYVEJ7t7PYYAMQMF
 j6zFXYzafHCzaTD6CLd/Tf62jEwuUnbmS8eWr91M=
Date: Mon, 7 Mar 2022 16:25:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH 5.15 000/262] 5.15.27-rc1 review
Message-ID: <YiYj6t7uhxZ5cw2t@kroah.com>
References: <20220307091702.378509770@linuxfoundation.org>
 <CA+G9fYtXE1TvxtXZPw++ZkGAUZ4f1rD1tBkMsDb33jsm-C1OZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtXE1TvxtXZPw++ZkGAUZ4f1rD1tBkMsDb33jsm-C1OZw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel@lists.freedesktop.org, patches@kernelci.org,
 Hou Tao <houtao1@huawei.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 shuah@kernel.org, Christoph Hellwig <hch@lst.de>, f.fainelli@gmail.com,
 Will Deacon <will@kernel.org>, jonathanh@nvidia.com, linux@roeck-us.net,
 slade@sladewatkins.com,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 lkft-triage@lists.linaro.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, pavel@denx.de, akpm@linux-foundation.org,
 torvalds@linux-foundation.org, sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 07, 2022 at 06:30:18PM +0530, Naresh Kamboju wrote:
> On Mon, 7 Mar 2022 at 15:07, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 5.15.27 release.
> > There are 262 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Wed, 09 Mar 2022 09:16:25 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.27-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> 
> Following build errors/warnings noticed on arm64.
> 
> 
> arch/arm64/net/bpf_jit_comp.c: In function 'build_insn':
> arch/arm64/net/bpf_jit_comp.c:791:21: error: implicit declaration of
> function 'bpf_pseudo_func' [-Werror=implicit-function-declaration]
>   791 |                 if (bpf_pseudo_func(insn))
>       |                     ^~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors

Found this one, now dropped.

