Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F614F19D3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 20:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCC189ACD;
	Mon,  4 Apr 2022 18:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E4D10E1D7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 18:39:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1607DB818F3;
 Mon,  4 Apr 2022 18:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B0EC340F3;
 Mon,  4 Apr 2022 18:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649097561;
 bh=uoCUt9kRip3xmuGeLGDqglk9GEPAPCSc46dVFwVFFvs=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=pWjK8T/SiEbCNPFdLabaKBhPZF8HEsxpYiFOPoj11AhzUzWc0mFSTNoTlb44mzjIt
 F3UZs1LSUjPo/vOdjOWkHWODjT6vCZV4ZDdN74DxYDMI5v/o8GBHU2fLfKRNJyKNv7
 gtUzy0Kf5ojn5swpmgVLnbCnNNgCbQO7w0i9dnoCj/kzOzhXBF6WNWKxFi9motkxV1
 mAZPq5pTW07Pv3EOFvaB4dD/VUmByyweb+IizmotBRaNxe2OECt5SeCdq2GbRkzw8s
 AQKJTPhJozQ/0jP8eneP9qLPjEAktInngDlNV+gUc4cd2uHWA+D6yPbPP1WfCZEgV2
 5G+GoDEs7Lu2A==
From: Kalle Valo <kvalo@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v5.18-rc1
References: <CAHk-=wg6FWL1xjVyHx7DdjD2dHZETA5_=FqqW17Z19X-WTfWSg@mail.gmail.com>
 <20220404074734.1092959-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2204041006230.1941618@ramsan.of.borg>
Date: Mon, 04 Apr 2022 21:39:15 +0300
In-Reply-To: <alpine.DEB.2.22.394.2204041006230.1941618@ramsan.of.borg> (Geert
 Uytterhoeven's message of "Mon, 4 Apr 2022 10:16:08 +0200 (CEST)")
Message-ID: <874k38u20c.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

>> /kisskb/src/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c:
>> error: case label does not reduce to an integer constant: => 3798:2,
>> 3809:2
>
> arm64-gcc5.4/arm64-allmodconfig
> powerpc-gcc5/powerpc-allmodconfig
> powerpc-gcc5/ppc64_book3e_allmodconfig

After v5.17 there were two commits to brcmfmac/sdio.c:

$ git log --oneline v5.17.. drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
ed26edf7bfd9 brcmfmac: Add BCM43454/6 support
6d766d8cb505 brcmfmac: pcie: Declare missing firmware files in pcie.c

I can't see how either of them could cause this warning. Could something
else cause this or am I missing something?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
