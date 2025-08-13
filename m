Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68A3B244F2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 11:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977FD10E6A4;
	Wed, 13 Aug 2025 09:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Gw4A60S0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RVhlVVVY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="topybgz3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9B5FwsJl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8AC10E6A4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 09:06:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D11E1219BE;
 Wed, 13 Aug 2025 09:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755075979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wzPfss0Yx81jm9T9+iN5ZthUeT7U2XD4wjBOjc1Dsnw=;
 b=Gw4A60S0hTXkXfeFH2xcZAMc40qN3iZr9CcHEx9ycD3OnUKHU4DmqHwHcy4aP6CurW/uMK
 CGpS4frnBZxw5OFue9T7hgZjGoxPCKloSdhn9rkQ9hPnJgtBrrrKSUGAPo4wDi/50F1/g6
 aD8K/qYaU3fgaM5zkrzcUfStMbv0XcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755075979;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wzPfss0Yx81jm9T9+iN5ZthUeT7U2XD4wjBOjc1Dsnw=;
 b=RVhlVVVYaOE6dzETfyqdm4YXHqLJWpSw2caDrnnYjJ9+Jn4w3H6fwWiOLLo3Sz05YdhXxM
 G5NJ+Htttui+sVCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755075978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wzPfss0Yx81jm9T9+iN5ZthUeT7U2XD4wjBOjc1Dsnw=;
 b=topybgz3V4ZL1tf3jXFyvDYIqy+rSBo669MRUOv4KK6GRFVqMTsY2NFBMZBgjYWk8EuxH2
 Gg304KAH1NouwSpMtAd+5VH72pAgYxePiUrhdo1p5nlKmmfi6/muFt63+6kskkLkrDfUfY
 i9kspoWq+tUsAFeAYz0LQu0moijhTQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755075978;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wzPfss0Yx81jm9T9+iN5ZthUeT7U2XD4wjBOjc1Dsnw=;
 b=9B5FwsJlCcAx0wZ1G7OnXQAFvXyQ1xD8YM0oj6V7YHq+sM1HVRqCBS4nVL1r4Bvig8fO7m
 VRxjDReqRvc50kBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 780A113479;
 Wed, 13 Aug 2025 09:06:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NVOzG4pVnGhEFAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 13 Aug 2025 09:06:18 +0000
Message-ID: <a0325fe4-90ce-45d4-91ad-881c7900a7d5@suse.de>
Date: Wed, 13 Aug 2025 11:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] kernel panic is not displayed correctly in
 qemu (CONFIG_DRM_BOCHS)
To: Askar Safin <safinaskar@zohomail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?=
 <noralf@tronnes.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 virtualization <virtualization@lists.linux.dev>,
 ryasuoka <ryasuoka@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 qemu-devel <qemu-devel@nongnu.org>, regressions
 <regressions@lists.linux.dev>, Ben Hutchings <benh@debian.org>
References: <197f290e30b.eaadc7bc7913.7315623184036672946@zohomail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <197f290e30b.eaadc7bc7913.7315623184036672946@zohomail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; TO_DN_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[11]; MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.30
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

Hi

Am 10.07.25 um 06:21 schrieb Askar Safin:
> Steps to reproduce:
>
> - Build Linux v6.16-rc5 so:
>
> $ cat mini
> CONFIG_64BIT=y
>
> CONFIG_EXPERT=y
> CONFIG_EMBEDDED=y
>
> CONFIG_PRINTK=y
> CONFIG_PRINTK_TIME=y
>
> CONFIG_PCI=y
>
> CONFIG_TTY=y
> CONFIG_VT=y
> CONFIG_VT_CONSOLE=y
> CONFIG_DRM=y
> CONFIG_DRM_FBDEV_EMULATION=y
> CONFIG_DRM_BOCHS=y
> CONFIG_FRAMEBUFFER_CONSOLE=y
> CONFIG_PROC_FS=y
> $ make KCONFIG_ALLCONFIG=mini allnoconfig
> $ make
>
> - Then boot this Linux image in Qemu so:
>
> $ qemu-system-x86_64 -enable-kvm -m 1024 -daemonize -kernel arch/x86_64/boot/bzImage
>
> Kernel will (predictably) panic (because it has no initramfs, nor real disk), but actual panic message will not be shown!
>
> Last shown line is "Run /bin/sh as init process"
>
> My host OS is Debian Trixie. "uname -a":
>
> Linux receipt 6.12.33+deb13-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.12.33-1 (2025-06-19) x86_64 GNU/Linux
>
> Qemu version is:
>
> QEMU emulator version 10.0.2 (Debian 1:10.0.2+ds-1)
>
> Guest kernel is v6.16-rc5 x86_64.
>
> The problem doesn't reproduce on old guest kernels. I. e. old guest kernels actually show panic message.
>
> I did bisect, and bisect showed the following two commits:
>
> ===
>
> commit a6c3464f69cf5a8a31eb31cc436e7dbd325b8ff9
> Author: Thomas Zimmermann <tzimmermann@suse.de>
> Date:   Thu Jun 13 09:30:33 2019 +0200
>
>      drm/gem-vram: Support pinning buffers to current location
>      
>      Pinning a buffer prevents it from being moved to a different memory
>      location. For some operations, such as buffer updates, it is not
>      important where the buffer is located. Setting the pin function's
>      pl_flag argument to 0 will pin the buffer to whereever it is stored.
>      
>      v2:
>              * document pin flags in PRIME pin helper
>      
>      Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>      Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>      Link: https://patchwork.freedesktop.org/patch/msgid/20190613073041.29350-2-tzimmermann@suse.de
>
> commit 58540594570778fd149cd8c9b2bff61f2cefa8c9
> Author: Thomas Zimmermann <tzimmermann@suse.de>
> Date:   Wed Jul 3 09:58:34 2019 +0200
>
>      drm/bochs: Use shadow buffer for bochs framebuffer console
>      
>      The bochs driver (and virtual hardware) requires buffer objects to
>      reside in video ram to display them to the screen. So it can not
>      display the framebuffer console because the respective buffer object
>      is permanently pinned in system memory.
>      
>      Using a shadow buffer for the console solves this problem. The console
>      emulation will pin the buffer object only during updates from the shadow
>      buffer. Otherwise, the bochs driver can freely relocated the buffer
>      between system memory and video ram.
>      
>      v2:
>              * select shadow FB via struct drm_mode_config.prefer_shadow_fbdev
>      
>      Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>      Acked-by: Noralf Trønnes <noralf@tronnes.org>
>      Link: https://patchwork.freedesktop.org/patch/315833/
>      Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>
> ===
>
> Commit a6c3464f69cf5a8a31e changed good behavior to absolutely wrong: after a6c3464f69cf5a8a31e I see just black screen.
> Then (after many commits) 58540594570778fd149 made screen working again, but now panics are not shown.
>
> So, result: all commits in range a6c3464f69cf5a8a31e .. 58540594570778fd149 are not testable (black screen), all commits before a6c3464f69cf5a8a31e
> are "good" (panic is shown) and all commits after 58540594570778fd149 (inclusive) (including v6.16-rc5) are "bad" (panic is not shown).

The bochs driver uses a shadow framebuffer. It's apparently not being 
flushed to VRAM on kernel panics. You could try the new DRM panic screen 
to make that happen.

Best regards
Thomas

>
> The next commit after 58540594570778fd149 is 5fd5d2b7c53de5a1290d82, thus correct regzbot instruction is:
>
> #regzbot introduced: a6c3464f69cf5a8a31e..5fd5d2b7c53de5a1290d82
>
> Config above is not special. It is result of minimizing standard Debian config.
>
> The bug is reproducible with standard Debian kernels (if we use them as guests).
>
> Reproduction steps are so:
> - Install Debian Trixie to Qemu VM
> - Boot it with "init=/bin/true" added (to cause kernel panic)
>
> You will not see panic message.
>
> I minimized this Debian bug to small config shown in the beginning of this letter.
>
> --
> Askar Safin
> https://types.pl/@safinaskar
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


