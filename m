Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631122CCE5E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 06:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504F16EB6A;
	Thu,  3 Dec 2020 05:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5D96EB69;
 Thu,  3 Dec 2020 05:13:53 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id d17so1536459ejy.9;
 Wed, 02 Dec 2020 21:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5WPnS5pwJlxDsHU3b2hVfaGtku031ZMmI6e07UWE01Y=;
 b=ibtRC9iVdTrJ0NWlFpcUSgnNYsyuSv61L9Yisgywo83nDFRz53Z38Qeu+UcQYyq9sk
 uwMx9mb5f79T16LQB/UN+wxWSZLToyAQebESHeUNB6cgEdQb53D7ccqQacHZ7WMosi4f
 OlEenjbUv2bLAJgv+CS2GJa9nqr+N35XXPgcUmRHHkGJq9JEV+ugFmLCJ+BiEWBdCvgE
 c8TbKt5UHY0bL8Y5EaKKqgve58V6j/MKduzxJVBjsfSzKp7wiKNNx8QjbLbiBHzkxxM4
 +5NIH1saeKR9/lOdbtmT21O16fTJRY4/UZOq2tQrbm98v8VNv+gZg3/AUIELRqOSX6sh
 DUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5WPnS5pwJlxDsHU3b2hVfaGtku031ZMmI6e07UWE01Y=;
 b=Wm4DtiRwzC1ngG2Pvi1rYDfVk403KxLOfvubNk5xxlL8jH8evJsXlTnrpigXE3AQdV
 6t0Ere/xOXs+TmXWqbIhDS2yB6+j2XjS64lf/1Kw87PdDAYgiPeqByj3thKI3JRq5BU+
 NetfUKqsVNQfyLi6XhT9qCpYT/WFnwyi4N6ArbqdZ4GitWsc7WqwNk3hSbEORUJlxEG3
 A1FrBJ9PgcSOSRKvkmoYm4TmMEEYFS2Lwydj6ctyyd4/ske6vwLlY2aL4FDUSjeKKPQ5
 XTcQObyWEXi04ynFVmtC/g9/3BgIzmIG9XBbaY4RTV4ALDjzrGQZifhn14RDRYfdm1RX
 wnAg==
X-Gm-Message-State: AOAM533Xe1NDoQnHHUaEx2FaVgMATHfyAEFGUgikkooyK4NYfOBuaYGR
 G8izsLRSCQbOHf6CePiqPV/tjUmzKsPzVjSWKnk=
X-Google-Smtp-Source: ABdhPJyryb6Q4rraQZaWkl22aCVMDALGJTStNiGZjuPvClvMQElRqxXfGTWCdrlup0D4pQSXgamrmRPLTD72X0NF6lw=
X-Received: by 2002:a17:906:ae55:: with SMTP id
 lf21mr1007595ejb.101.1606972431790; 
 Wed, 02 Dec 2020 21:13:51 -0800 (PST)
MIME-Version: 1.0
References: <5d3e93cb-1a95-589c-71ed-2413932884d5@telusplanet.net>
In-Reply-To: <5d3e93cb-1a95-589c-71ed-2413932884d5@telusplanet.net>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 3 Dec 2020 15:13:40 +1000
Message-ID: <CAPM=9tw8jSy-uapN-VY5v_+rm6awGdmMzyy_ArBUoXEPhqk9ZQ@mail.gmail.com>
Subject: Re: Nouveau video --- [ cut here ] ----- crash dump 5.10.0-rc6
To: bob <gillb4@telusplanet.net>, Ben Skeggs <skeggsb@gmail.com>
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
Cc: nouveau <Nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cc'ing Ben + nouveau

On Thu, 3 Dec 2020 at 14:59, bob <gillb4@telusplanet.net> wrote:
>
> Hello.  I have a crash dump for:
>
> $ uname -a
> Linux freedom 5.10.0-rc6 #1 SMP Sun Nov 29 17:26:13 MST 2020 x86_64
> x86_64 x86_64 GNU/Linux
>
> Occasionally when this dumps it likes to lock up the computer, but I
> caught it this time.
>
> Also video likes to flicker a lot.   Nouveau has been iffy since kernel
> 5.8.0.
>
> This isn't the only dump, it dumped probably 50 times.  If you are
> really desperate for all of it,
>
> reply to me directly as I'm not on the mailing list.  Here is one of them.
>
> [39019.426580] ------------[ cut here ]------------
> [39019.426589] WARNING: CPU: 6 PID: 14136 at
> drivers/gpu/drm/nouveau/dispnv50/disp.c:211 nv50_dmac_wait+0x1e1/0x230
> [39019.426590] Modules linked in: mt2131 s5h1409 fuse tda8290 tuner
> cx25840 rt2800usb rt2x00usb rt2800lib snd_hda_codec_analog
> snd_hda_codec_generic ledtrig_audio rt2x00lib binfmt_misc
> intel_powerclamp coretemp cx23885 mac80211 tda18271 altera_stapl
> videobuf2_dvb m88ds3103 tveeprom cx2341x dvb_core rc_core i2c_mux
> snd_hda_codec_hdmi videobuf2_dma_sg videobuf2_memops videobuf2_v4l2
> snd_hda_intel videobuf2_common snd_intel_dspcfg kvm_intel snd_hda_codec
> videodev snd_hda_core kvm mc snd_hwdep snd_pcm_oss snd_mixer_oss
> irqbypass snd_pcm cfg80211 snd_seq_dummy snd_seq_midi snd_seq_oss
> snd_seq_midi_event snd_rawmidi snd_seq intel_cstate snd_seq_device
> serio_raw snd_timer input_leds nfsd libarc4 snd asus_atk0110 i7core_edac
> soundcore i5500_temp auth_rpcgss nfs_acl lockd grace sch_fq_codel sunrpc
> parport_pc ppdev lp parport ip_tables x_tables btrfs blake2b_generic
> libcrc32c xor zstd_compress raid6_pq dm_mirror dm_region_hash dm_log
> pata_acpi pata_marvell hid_generic usbhid hid psmouse firewire_ohci
> [39019.426650]  firewire_core crc_itu_t i2c_i801 ahci sky2 libahci
> i2c_smbus lpc_ich
> [39019.426658] CPU: 6 PID: 14136 Comm: kworker/u16:0 Tainted: G        W
> I       5.10.0-rc6 #1
> [39019.426659] Hardware name: System manufacturer System Product
> Name/P6T DELUXE, BIOS 2209    09/21/2010
> [39019.426662] Workqueue: events_unbound nv50_disp_atomic_commit_work
> [39019.426665] RIP: 0010:nv50_dmac_wait+0x1e1/0x230
> [39019.426667] Code: 8d 48 04 48 89 4a 68 c7 00 00 00 00 20 49 8b 46 38
> 41 c7 86 20 01 00 00 00 00 00 00 49 89 46 68 e8 e4 fc ff ff e9 76 fe ff
> ff <0f> 0b b8 92 ff ff ff e9 ed fe ff ff 49 8b be 80 00 00 00 e8 c7 fc
> [39019.426668] RSP: 0018:ffffb79d028ebd48 EFLAGS: 00010282
> [39019.426670] RAX: ffffffffffffff92 RBX: 000000000000000d RCX:
> 0000000000000000
> [39019.426671] RDX: ffffffffffffff92 RSI: ffffb79d028ebc88 RDI:
> ffffb79d028ebd28
> [39019.426671] RBP: ffffb79d028ebd48 R08: 0000000000000000 R09:
> ffffb79d028ebc58
> [39019.426672] R10: 0000000000000030 R11: 00000000000011c4 R12:
> 00000000fffffffb
> [39019.426673] R13: ffffa05fc1ebd368 R14: ffffa05fc1ebd3a8 R15:
> ffffa05fc2425000
> [39019.426675] FS:  0000000000000000(0000) GS:ffffa061f3d80000(0000)
> knlGS:0000000000000000
> [39019.426676] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [39019.426677] CR2: 00007fb2d58e0000 CR3: 000000026280a000 CR4:
> 00000000000006e0
> [39019.426678] Call Trace:
> [39019.426685]  base827c_image_set+0x2f/0x1d0
> [39019.426687]  nv50_wndw_flush_set+0x89/0x1c0
> [39019.426688]  nv50_disp_atomic_commit_tail+0x4e7/0x7e0
> [39019.426693]  process_one_work+0x1d4/0x370
> [39019.426695]  worker_thread+0x4a/0x3b0
> [39019.426697]  ? process_one_work+0x370/0x370
> [39019.426699]  kthread+0xfe/0x140
> [39019.426701]  ? kthread_park+0x90/0x90
> [39019.426704]  ret_from_fork+0x22/0x30
> [39019.426706] ---[ end trace d512d675211c738c ]---
> [39021.426751] ------------[ cut here ]------------
>
>
> Thanks in advance,
>
> Bob
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
