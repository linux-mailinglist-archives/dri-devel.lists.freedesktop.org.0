Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3328D4F23A7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 08:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2780010ED7B;
	Tue,  5 Apr 2022 06:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9F610ED7B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 06:52:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AFA87B81B9C;
 Tue,  5 Apr 2022 06:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5887BC340F3;
 Tue,  5 Apr 2022 06:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649141561;
 bh=sfI+F1qddgBQPEPVyPm4UsT8iPzrWXdjhWe583jbPNo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=V/qs96FwacDoAwIb3AYjsXmHxIyAPgkVCDF70o06rl9Kv/EU36wYnE2B+iVWmFDuY
 9yuhSTxtp1RApbos0thzGGcgBcYzB4OUjwwadhMoCk9ddnMLEKl7z5ojHVyxLNPTxe
 fkI47UjfZEnf1/Ud4Zb2n1JXmLeINpIf17so9GlwWdiyUMNfRV7wQ5S+MxBnAEYklV
 Y8YdKnoXbq3CdeKDF/1PwekiJc2XNSMWQ0QvtapOIX7H8ZI+dMggm5cQNjfN6CVOOX
 7Pm2r4QROcmMfAGlnaeACUWbHHdwgaBx6T+/ZTGZ0SVcsrXuQJQPOhC5ncYhaHg04Y
 CE7JnbN9mYeEw==
From: Kalle Valo <kvalo@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v5.18-rc1
In-Reply-To: <CAMuHMdV_-3TOHYehUsHeqwHjQtzN1Ot886K7vwPr4P-4u8eehw@mail.gmail.com>
 (Geert Uytterhoeven's message of "Tue, 5 Apr 2022 08:46:06 +0200")
References: <CAHk-=wg6FWL1xjVyHx7DdjD2dHZETA5_=FqqW17Z19X-WTfWSg@mail.gmail.com>
 <20220404074734.1092959-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2204041006230.1941618@ramsan.of.borg>
 <874k38u20c.fsf@tynnyri.adurom.net>
 <CAMuHMdV_-3TOHYehUsHeqwHjQtzN1Ot886K7vwPr4P-4u8eehw@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 05 Apr 2022 09:52:33 +0300
Message-ID: <87czhwrphq.fsf@kernel.org>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 USB list <linux-usb@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma <linux-rdma@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 linux-um <linux-um@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-xfs@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> On Mon, Apr 4, 2022 at 8:39 PM Kalle Valo <kvalo@kernel.org> wrote:
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> >> /kisskb/src/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c:
>> >> error: case label does not reduce to an integer constant: => 3798:2,
>> >> 3809:2
>> >
>> > arm64-gcc5.4/arm64-allmodconfig
>> > powerpc-gcc5/powerpc-allmodconfig
>> > powerpc-gcc5/ppc64_book3e_allmodconfig
>>
>> After v5.17 there were two commits to brcmfmac/sdio.c:
>>
>> $ git log --oneline v5.17.. drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
>> ed26edf7bfd9 brcmfmac: Add BCM43454/6 support
>> 6d766d8cb505 brcmfmac: pcie: Declare missing firmware files in pcie.c
>>
>> I can't see how either of them could cause this warning. Could something
>> else cause this or am I missing something?
>
> Doh, I should not have reduced the CC list in the xfs subthread...
>
> The builds above are all gcc-5 builds, so they are affected by the same
> issue as XFS: unsigned constants that don't fit in int are lacking a
> "U" suffix.
>
> I assume Arnd's patch for
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> fixes this?
> https://lore.kernel.org/all/CAK8P3a0wRiS03imdXk2WbGONkSSczEGdE-ue5ubF6UyyDE9dQg@mail.gmail.com

Great, thanks. I assume Arnd will submit it officially at some point.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
