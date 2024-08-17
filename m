Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCE4955824
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 15:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE0310E088;
	Sat, 17 Aug 2024 13:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=verizon.net header.i=@verizon.net header.b="NrAmeryo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic316-11.consmr.mail.bf2.yahoo.com
 (sonic316-11.consmr.mail.bf2.yahoo.com [74.6.130.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBF810E088
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 13:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1723902324; bh=vp1ZIKZj8k1K41caezVgW55kRks0QRPON9MRRH5jLto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=NrAmeryofeepKacrRmfuSwwsyOJoONk7SOt7na5RQ1oURiYZQp2NS+y6wlGgQsxev3xuZLvm7p1IqUK7F7zwEbbOR9soBKAr1cKJ2x5oRWABu2xnnH5dPkJ02HdFZqvgBjWKJ+FcFlGH12r1Ww2BrUZ76gVEud+xz6S4KqF1aQ3vaEOfZHXPIA6hJLvxfTQd+20re0xSU5pd507Se5rVsqD0LYBVMNE/3LnEwwwdoa+CstD3GzmwlSSiTDfngUVB1XHyvg5iut/cUYeUyncNvF/aUgALc+LFqvo6MmcZJlj91Aeg0BjuKMpqGVonT+rsxxMcaenngWgcMfrUjnJFPw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1723902324; bh=b1v4NMYmFZ1aeabhl3sYQ6Z+H8XLnEi15xTIoQql87i=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=ZDPo3q8jNqJNpuwa79/XCN3pKq8PqET+2dYrXiNrjwgyNljcCKm5+AktkUZ2k5Zoc1jqpvDWNwIicj6EiIYy4nmeMvfg1ZOu5hsck8XIdS2+5MoVdeAoFJGWlM8WE6whloWAJMKlDF8zzJqJCHAeanzSpiGewJG6ZFnVJm1OAkRfuCp1SPZBgP0qtna/BOV49E7YDa5r1P5CCcOapuFF2f/X7eJvz5x9mPix5ddC2IQtSVOcT3IcwdoF0ThKhT06mth/w3mwxtF/I6oKUZCXaYBuRvFFNlwMnF9pMYTw4fx/Ap+tpBfGFZ0yyWhcEd7vxnR1lD32LWQgtOeOFQn7oQ==
X-YMail-OSG: fGod_h8VM1nBhmyhLpaBQXflgGYNjJiP3oDUczVkdgXyqA8htvNpy6yfOwfh.3k
 TuRXz.B_.iGxMBfx7ghjMv79KokwhnrA4aEBFlKxNFy3iUmHxf2KFL7.GKcA7_QQJIIr90v.v._E
 _mREgBzmvR9cManPACqw.gvD2hCioyK9qtv9zTd18lgbKu_VnvuIvJgscI5CNkncbRhBlWAUAqmq
 9vjmGBuJggcbxOa__JOx2CQ6zILkP1qR9x62C5jt8Jfkv3Uo.iEJahSR_tkUSHlLiHAAR3CZ8bcF
 Xc1aYumYwQb15HmYHbgtyOZ.noWqmsy9mqvyxKlRJlJAUAVPCj2Jfzabc9O5x.hTN_M.KpCo2_2S
 NAkt12fuokb0Y62DYm_O6GDK8BRK8609a5qzFYftb0Qtu.RlStC6pir5IS0GPBdV3bQc0EjjXnOh
 yORu1EL.juH3L0rl60e.7AeSqYDifE9W8wElir_F1slPu8Un5Fi8PgYkjXT21g6a7gUQw6chs6Fi
 PiJIAYaTdUuzXOwxzQOVy7COnTSd1qR6aHTCQV1g4RhJYvqkDDrnBqQcfT3ynp2cDeUbcTscT717
 doEZnqt3aAkAxMp41fZKGCMMVBj23n4eHwJPnHawjRCGlePLY2dyz55dKTnehJONKznoT.4qerm7
 Rff0U3ejZ_sDRzNc4QaKhL0PMHS5Mo2w5sVzOg1ppxfZLlUmddy.qvyTig1Zg8c2Wyw1oZg6AAgQ
 cEIeOrgdykhISdkYmsqpNevMuwESgkoenNvsUH5XiHCS5TjB2lsseuVPFxdONMBQLig0DLk6n9HL
 mO3tpELyZD_jlBRzapM822CQrc57KxNBItAIlxVcFCSd0tQF._rDgz393rZWNxR6jwEvYvxfLAIa
 eh0Ziqk1WgeISI2FbulbXNxyn3Ww8WlVgOMjR1CX5SYbeYo7j..WRJQ2LAEB5EO6tc.BZMCeDM4a
 XfAEcEmvCKJjfpFK7ZWxH7ziD7ztc_ED3ye0KhuPsBv4Esn16OLVuN0B2y0YUQD24hXLQ4TWesBd
 _532ZaDCDMX4jsh7svqtKYoleWcdsBoiEK1PsX8m_F_PLBMxW9tAVdXMaG2cdruBIYj1ohpAMyyA
 Awg69Mgb7UptfzzMDp6UwAaGlqAn_8x6XYp7UIMw2WD9iLkQyJMKha99Bbjlyk..5Zf8dyV4qZjT
 Nsd.z8UgFlpv2OtMdqyLQR6ZscQmuFEat9wxChLk7Ubibecwu8wx43Ydl0PbEiY4UdXYrizOzt3M
 dCYEiV5VsunLe1LvKtPK3hshJ7utNVgjXtg1pxbSpTIQd9vTPK8jLm3ZkzETujoDblnThgq8FGNo
 eMVMfa6XNxPgIooiB1kVgFgHspWpRcd5CO_bjqeq.EpofB75_aDxUekSZbRU.hKhdwDjNp0aD6tX
 dBzc2CjyG2tFEK2f_9dwI45zJlp2G4TQu61HAktixbxIDZ8KfRGBERK0Ve.t2shePhYes3qHe5rI
 qjQyHZ_T81G5iqHgtR6BNPMzW4y6BX4KzJmHAP0MVQk5J43XDuF.mfzFwHgQmu71CdG0hfQW9lyf
 9vbNQhLWNEv7hjc6iQQLFbbwa.JOBqjYHJei8Yfgj4TpYuHQixKukkUKESR5RzgIAu7OdtSpwfNn
 3aI_AXLrYHO31TdEHAbeIqUBFGWeE0H9wqYD0g3VpBQ3naFW3t0kvr4rE7xW6Z2InN88ZeXvtFWn
 GtxOA6wbKIuTG1X0zRq_W6mu8wqINN3qMyzw1hqcA9wclOiujtwXI3ZvBgZWsoYJQJBuSLCApTNT
 ps5DTVvIujF2Q0vb7gUayhEIr4CQeKibT7C6iQ23A6yWGy2De8TITebGB3cp1nS4JXvuzLn9UY.n
 tibSjosM8yNMSNFhnmdL8yZcRaq56YwODl64xhrrdlhEgRoJToPyf5TApbqozNsf52e8E2kjDhap
 0O2ENSeFxj2PHBY2idgGkrPBAPEJeacqhqqzaTxho3wcAQ7DLwO_cNHZmGY6avzJlHOeXwGN.DO3
 nw61Td2n_PZyBbwQ2FaYMLtupG3nFRVrH1jppTpc7Y318Dau6CjZQMssXuUAeuGp8Y5hm8cpPkZh
 7WJ6FXXwLG3fDc0Mixh.7g726AcmP12v09lcLDjD4gwW_qNfnBGi4uennosPqn4RLmH8966JXIcp
 koCHZ7MnWEAFg1Bi1d9ihxYnqvdsObWRZ_DrBVHa3KNjnEhFY.88ICOORyg8ULl2X83ap6G4lOj7
 __q_JLHSCtNP4WFa8vupmUtMoIRMf0ecT3kpynt9ErjWPgkNsZHSN08f.KzP51F4y0C5dFD46Djz
 M2fiPqBM-
X-Sonic-MF: <bluescreen_avenger@verizon.net>
X-Sonic-ID: 8fd3c1d2-0703-4aff-8fd9-043a92bc5d9c
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.bf2.yahoo.com with HTTP; Sat, 17 Aug 2024 13:45:24 +0000
Received: by hermes--production-bf1-774ddfff8-xjgzc (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 8e4c07eb80e93175ad9bf94c00d9ce30; 
 Sat, 17 Aug 2024 13:45:23 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [RFC PATCH v2 0/5] drm/log: Introduce a new boot logger to draw
 the kmsg on the screen
Date: Sat, 17 Aug 2024 09:45:22 -0400
Message-ID: <3578804.V25eIC5XRa@nerdopolis2>
In-Reply-To: <20240816125612.1003295-1-jfalempe@redhat.com>
References: <20240816125612.1003295-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailer: WebService/1.1.22544
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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

On Friday, August 16, 2024 8:52:32 AM EDT Jocelyn Falempe wrote:
> drm_log is a simple logger that uses the drm_client API to print the kmsg boot log on the screen.
> This is not a full replacement to fbcon, as it will only print the kmsg.
> It will never handle user input, or a terminal because this is better done in userspace.
> 
> If you're curious on how it looks like, I've put a small demo here:
> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
> 
> Design decisions:
>   * It uses the drm_client API, so it should work on all drm drivers from the start.
>   * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
>     It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
>   * It uses a circular buffer so the console->write() callback is very quick, and will never stall.
>   * Drawing is done asynchronously using a workqueue.
>   * drm_log can only be built-in (and drm must be built-in too).
>     The reason is that, if you build it as a module, then a userspace application will be more appropriate than this module.
>   * When nbcon will be ready, I will use it. It should simplify this a lot, but I prefer not to depend on it yet.
>  
> The first patch is not for review/merge, it's a squash of my pending drm_panic series:
> https://patchwork.freedesktop.org/series/135944/
> 
> The second patch, moves the drawing function from drm_panic.c, to drm_draw.c, so they can be re-used by drm_log.
> The next patches are the actual drm_log implementation.
> 
> v2:
>  * Use vmap_local() api, with that change, I've tested it successfully on simpledrm, virtio-gpu, amdgpu, and nouveau.
>  * Stop drawing when the drm_master is taken. This avoid wasting CPU cycle if the buffer is not visible.
>  * Use deferred probe. Only do the probe the first time there is a log to draw. With this, if you boot with quiet, drm_log won't do any modeset.
>  * Add color support for the timestamp prefix, like what dmesg does.
>  * Add build dependency on  disabling the fbdev emulation, as they are both drm_client, and there is no way to choose which one gets the focus.
> 
> Thanks and best regards,
> 
> 
I tested it, and it seems pretty cool. And fast, it seems to keep up when I echo 100,000 lines to /dev/kmsg with seq



