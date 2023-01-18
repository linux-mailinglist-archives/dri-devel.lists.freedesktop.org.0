Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ED6672A22
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 22:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5399A10E840;
	Wed, 18 Jan 2023 21:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57E410E840
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 21:14:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4EC7DB81E7F;
 Wed, 18 Jan 2023 21:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4755C433EF;
 Wed, 18 Jan 2023 21:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674076466;
 bh=viBveGu88AsjPiWErhOmDAlRkCq1n+hHkT6lfehusXM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=P+6bLzgWp6OrhYNUKh0Na3pZPGFySZh1vdknGJs07Sv3v9YQhRQ7UswUPlw4GiBgb
 JBPUBrig5WTpInKkRFONkP/qc6CodmBitUjFCcDCfQLo1cyUyetD7Kp9k8Qb17wgtf
 Ev7/LKkPyqO5/wzi0MeavkzZqTdOa0E4pe1t4JLsTsowOZVhq11e7Bs5MHljC8fGUZ
 5pplkjlokWREuRzbafSn4/zwL3I5O6s+99jorULvNBLgkMz0VFdVYR6U+Ckav7/c+b
 6H+dWMgEuCCuq+a/HE6ZcKBDJFmnXJF5TuENyt50XslCKLYGV7z+x/M33viHH/sh7W
 AW4QXjPlBy92Q==
Date: Wed, 18 Jan 2023 15:14:24 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Bug 216950] New: DisplayPort USB-C hub issue
Message-ID: <20230118211424.GA259217@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-216950-41252@https.bugzilla.kernel.org/>
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
Cc: Marcin <martii@interia.pl>, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 07:49:38PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=216950
>            Summary: DisplayPort USB-C hub issue
>     Kernel Version: 6.2.0-rc3
> ...
> Created attachment 303624
>   --> https://bugzilla.kernel.org/attachment.cgi?id=303624&action=edit
> dmidecode + kern.log
> 
> I have HP 845 EliteBook G7 (Ryzen) and before 6.2.0-rc3 installation
> there was no issue with my laptop and HP docking station via USB-C.
> 
> This kernel display behaves weirdly. LCD monitor (connected to
> docking station via DisplayPort) wakes up only once after reboot.
> Second docking connection ends up with blank external screen and
> only restart helps.
> 
> Display manager detects extra screen and even newly launched apps
> land there.
> 
> I didn't have such issues with original distro kernel
> 5.16.15-76051615-generic

This report (which looks like a regression between
5.16.15-76051615-generic and 6.2.0-rc3) was raised against PCI, but I
don't see PCI issues in the logs.  Any DRM ideas?

Bjorn
