Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B46BCF36B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 12:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6660810E062;
	Sat, 11 Oct 2025 10:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GSnjwwvL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C5310E274
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 10:02:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E5DB8603B4;
 Sat, 11 Oct 2025 10:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C056FC4CEF4;
 Sat, 11 Oct 2025 10:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760176931;
 bh=YlmQ9aCDxmzwJaOv2eFDecf35+SRpX/9bZI4+B1UZYM=;
 h=Date:From:To:Cc:Subject:From;
 b=GSnjwwvLrZhenWC0bCrbyI7+Un5WQSZecoDUl1nG06RY8duXVm9xXe/9nwiH++5NC
 0NSinosmk/pceGTXSPe4xBkqBtf/xXMwJCNNtAx4yQ3PMBZLMbtLAmGai0ujR5v0xI
 qMAG9027UjO7WkmNLdcecHPyhlmeN5yK4XMlue384+kjYiX2NWSz1k5xOPAXFMhVmc
 p3htxD977PZ3//PvA0M+62t/VwU1OYzTqGyOT9AkLLXUGp7614FUXfYW51tNWrLTa9
 MYnIp0JnLh9J4uB90VAbZJBE2QoGO0PDwvjZ/GSxRIpSk+OkHRFEfeOASBJmAhbHFn
 OYem1zK/68wvQ==
Message-ID: <301d7da1-5101-4f16-90cd-5bb4ac41c87b@kernel.org>
Date: Sat, 11 Oct 2025 12:02:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Adding EDID support to simpledrm on top of the EFI sysfb ?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

A while ago I did a blogpost about not having the native GPU drivers in
the initrd: https://hansdegoede.dreamwidth.org/28291.html

With the Fedora /boot partition size increase there has been renewed
interest in this and as a result I got an interesting comment on
the blog post pointing out that there are EFI protocols to get EDID
info for the monitor (presumably for the one the GOP has lit up).

It would be useful to see if we can hook this up so that the simpledrm
device can report the physical dimensions of the screen and the boot
splash does not need to guess the DPI and thus does not need to guess
whether to do hiDPI scaling or not. The comment is here:

https://hansdegoede.dreamwidth.org/28291.html?thread=14467#cmt14467

and it points to:

https://uefi.org/sites/default/files/resources/2_-_AMD_UEFI_Plugfest_EDID_Spring2012.pdf
https://uefi.org/specs/UEFI/2.9_A/12_Protocols_Console_Support.html

Unfortunately I do not have time to work on this myself, hence this
email in the hope that someone else can pick this idea up.

Regards,

Hans



