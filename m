Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6CDC25E5B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 16:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B6210EBD7;
	Fri, 31 Oct 2025 15:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="JohOQDw3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com
 [209.85.128.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D2110EBD6
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:49:50 +0000 (UTC)
Received: by mail-yw1-f227.google.com with SMTP id
 00721157ae682-7864cef1976so15114747b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761925790; x=1762530590;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5qbXFw9NwFzLhVaxyoLv2xWgWvS06vKVK0wZBVdsPfk=;
 b=JNl8P3Qhp1i3QABI87DdaP5xhKEP3EX5ojvk3teYxLPbZSDEsrdd7NZfsQ4WAUJqfo
 D7Lr6XWwS6RojCnNgZbtqQz5Nb8AdcLklOfNSpvp9oj5OQXcaAVgYB0fyPdL1R1uNxuf
 F7sDfzMWM2BimRzFo6c+ySCVYreWYmdY+RGwmvg1riNe/hKeSdhT7NOML/og/4CjMPXj
 MPdBK/2l7EGYADb4lAjjHdTqHmNkEkuVZoezw9ObCHHM/W96WwlfG1CVPk8wRQk2qls1
 0K78rrySYigVikbdPI1AqsMZaRs4J40miexgmWIVHn1VUbRsatzg2aMTRaSXLhe7yfp+
 /Heg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF5yB0eEsamWzBRMKKJTdys1lIESQQ3vcRcWenGEvSAHA79l3wSRZhnaIC/AjjdwZ0WcIrEzT+M7c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz82Div9jd5VaOa8CpCG329zDGvtlUz0KvHEoM+WhlhQT3jtIPm
 YS9iJOIZ6M6dXe2zjq4lAboRGw3f35k+Iog9AVV8MS+Q0QXHiY1OYlmWLpuyn8RQLL3k3v9FhW2
 5+/GJU9/N87/mcyRSnNy68AUE++8dK3EFIpMidxxtB2wtZY7IfhcTL0EzYBi9DBo3OTBEvH+86e
 ChFz4YLMrzA1WwplYnOD4ln4LWncBbcsCczFaOlO+WjOM+od1oTQohPPQshqTYkLQ3UpAO9ZsUM
 O6TrcCvBojHZhENnzta
X-Gm-Gg: ASbGncvmtjex6WdQlBBITT5eWHV7k+8JGIKtAsTkJP5SNbXFxwVo7i1UmFNdRowDwIL
 8rKyxyTLgs1FOPLH9Du27oTEqEd/VDjHCOW1MrpGRGQB+BU9LjoncOasMhIF193aDXEmHKWCHxH
 T6fHa1LSElD1kl1GZnztF7JYT0t/+1Hm+3wqvoV8hJwNOmvfDpGIQVWUogsAq1WFjgYQz0D5wr7
 6MQyTyqLLy8CvgmJwtPuNsGvjk3IbSkPmE2XILvmY57Cuq4thZur1OZ0HZkh+xzapvlJmlVv8cN
 +Ivc+VloAisnKn/fZGBTjC2r2rM2OqtsKb/HnqYDL4Fl4hfrnJ+t9udBWDUzZqx9hMMB0LDE/Qv
 QhqouAWniryO15qM30NY7DqtlSroGAJuTSvXQ8hQAi+IDZsQsAtZiOaiKMWckXsEmaOe8Yb0ZpL
 CHgGx4qD6mRvBkWOpHAo8qGusTSr6KdmhTYg==
X-Google-Smtp-Source: AGHT+IE5Q2DcSvjys+TWa/SwS/8HdfmEuKB118xcBMM3gcvBOKuAwD5VpbY/PrfoTBL/KT2SwAMBg6sGgYw6
X-Received: by 2002:a05:690e:400f:b0:63e:3546:6fc5 with SMTP id
 956f58d0204a3-63f829e176cmr5879929d50.32.1761925789320; 
 Fri, 31 Oct 2025 08:49:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
 by smtp-relay.gmail.com with ESMTPS id
 00721157ae682-7864ba75da7sm1332347b3.7.2025.10.31.08.49.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 Oct 2025 08:49:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-475c422fd70so20506005e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1761925788; x=1762530588;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5qbXFw9NwFzLhVaxyoLv2xWgWvS06vKVK0wZBVdsPfk=;
 b=JohOQDw3VwjWHiOmV8Abvh/KTegIKaVQKdXkk+sC1r6E9kGlsH0SWlkj2bgDcy16aA
 4s2ptldQkZ9uNUmPk5F8k5hLGJAvqJzbl8bR8gDegVwdsgGxGtEJPl66LRjuAJq6fkoA
 t+k1Sr0XGhBadqKNALf7unlCxEfdylueKKpOw=
X-Forwarded-Encrypted: i=1;
 AJvYcCUkkWfTnqhbvNzImkWewHvYQCQ9EysFTmOngqvT//qSvgydg+DGyBkS/r07QroFNDL5ZgQrgiK0b5Q=@lists.freedesktop.org
X-Received: by 2002:a05:600c:1f8b:b0:46e:2801:84aa with SMTP id
 5b1f17b1804b1-477346cf87cmr20778645e9.0.1761925787616; 
 Fri, 31 Oct 2025 08:49:47 -0700 (PDT)
X-Received: by 2002:a05:600c:1f8b:b0:46e:2801:84aa with SMTP id
 5b1f17b1804b1-477346cf87cmr20778425e9.0.1761925787110; Fri, 31 Oct 2025
 08:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251027121042.143588-1-tzimmermann@suse.de>
 <20251027121042.143588-5-tzimmermann@suse.de>
In-Reply-To: <20251027121042.143588-5-tzimmermann@suse.de>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Fri, 31 Oct 2025 10:49:34 -0500
X-Gm-Features: AWmQ_blahi0XxSMOWp6pzrZA1RLRoAiMqN5ZmEGSAfOUNZwq_ogjeunj884oaZQ
Message-ID: <CAO6MGtjg8PiRiSLomJQRBduTBSC0WkqX67tEZwA9qwOgRzchpw@mail.gmail.com>
Subject: Re: [REGRESSION][ASAN] drm/client: Deprecate struct
 drm_client_buffer.gem
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, javierm@redhat.com,
 rrameshbabu@nvidia.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 francesco@valla.it, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000b84f610642765053"
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

--000000000000b84f610642765053
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 7:11=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> The client buffer's framebuffer holds a reference and pointer on
> each of its GEM buffer objects. Thus the field gem in the client-
> buffer struct is not necessary. Deprecated the field and convert
> the client-buffer helpers to use the framebuffer's objects.
>
> In drm_client_buffer_delete(), do a possible vunmap before releasing
> the framebuffer. Otherwise we'd eventually release the framebuffer
> before unmaping its buffer objects.
>
> v2:
> - avoid dependency on CONFIG_DRM_KMS_HELPER
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

This patch has caused a crash on vmwgfx with ASAN enabled.

[   22.286155] Console: switching to colour dummy device 80x25
[   22.359287] vmwgfx 0000:00:0f.0: vgaarb: deactivate vga console
[   22.388482] vmwgfx 0000:00:0f.0: [drm] FIFO at 0x00000000fb800000
size is 8192 KiB
[   22.390036] vmwgfx 0000:00:0f.0: [drm] VRAM at 0x00000000f0000000
size is 131072 KiB
[   22.391255] vmwgfx 0000:00:0f.0: [drm] Running on SVGA version 2.
[   22.392209] vmwgfx 0000:00:0f.0: [drm] Capabilities: rect copy,
cursor, cursor bypass, cursor bypass 2, 8bit emulation, alpha cursor,
3D, extended fifo, multimon, pitchlock, irq mask, display topology,
gmr, traces, gmr2, screen object 2, command buffers, command buffers
2, gbobject, dx, hp cmd queue, no bb restriction, cap2 register,
[   22.396463] vmwgfx 0000:00:0f.0: [drm] Capabilities2: grow otable,
intra surface copy, dx2, gb memsize 2, screendma reg, otable ptdepth2,
non ms to ms stretchblt, cursor mob, mshint, cb max size 4mb, dx3,
frame type, trace full fb, extra regs, lo staging,
[   22.400175] vmwgfx 0000:00:0f.0: [drm] DMA map mode: Caching DMA mapping=
s.
[   22.400224] audit: type=3D1130 audit(1761925118.444:63): pid=3D1 uid=3D0
auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
msg=3D'unit=3Dsystemd-fsck@dev-disk-by\x2duuid-AFBE\x2d8A94 comm=3D"systemd=
"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?
res=3Dsuccess'
[   22.401320] vmwgfx 0000:00:0f.0: [drm] Legacy memory limits: VRAM =3D
4096 KiB, FIFO =3D 256 KiB, surface =3D 0 KiB
[   22.406225] vmwgfx 0000:00:0f.0: [drm] MOB limits: max mob size =3D
1048576 KiB, max mob pages =3D 524288
[   22.407602] vmwgfx 0000:00:0f.0: [drm] Max GMR ids is 64
[   22.408398] vmwgfx 0000:00:0f.0: [drm] Max number of GMR pages is 65536
[   22.409393] vmwgfx 0000:00:0f.0: [drm] Maximum display memory size
is 262144 KiB
[   22.419541] vmwgfx 0000:00:0f.0: [drm] Screen Target display unit initia=
lized
[   22.422876] vmwgfx 0000:00:0f.0: [drm] Fifo max 0x00040000 min
0x00001000 cap 0x0000077f
[   22.426030] vmwgfx 0000:00:0f.0: [drm] Using command buffers with DMA po=
ol.
[   22.427664] vmwgfx 0000:00:0f.0: [drm] Available shader model: SM_5_1X.
[   22.621336] [drm] Initialized vmwgfx 2.21.0 for 0000:00:0f.0 on minor 0
[   22.627782] fbcon: vmwgfxdrmfb (fb0) is primary device
[   22.640191] Console: switching to colour frame buffer device 160x50
[   22.641788] Oops: general protection fault, probably for
non-canonical address 0xdffffc000000001f: 0000 [#1] SMP KASAN NOPTI
[   22.641795] KASAN: null-ptr-deref in range
[0x00000000000000f8-0x00000000000000ff]
[   22.641802] CPU: 6 UID: 0 PID: 134 Comm: kworker/6:1 Not tainted
6.18.0-rc2+ #63 PREEMPT(lazy)
[   22.641809] Hardware name: VMware, Inc. VMware20,1/440BX Desktop
Reference Platform, BIOS VMW201.00V.24928539.B64.2508260915 08/26/2025
[   22.641812] Workqueue: events drm_fb_helper_damage_work
[   22.641824] RIP: 0010:drm_gem_lock+0x25/0x50
[   22.641831] Code: 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 b8
00 00 00 00 00 fc ff df 53 48 89 fb 48 81 c7 f8 00 00 00 48 89 fa 48
c1 ea 03 <80> 3c 02 00 75 0f 48 8b bb f8 00 00 00 31 f6 5b e9 16 2e 15
01 e8
[   22.641835] RSP: 0018:ffff88810638fb78 EFLAGS: 00010202
[   22.641838] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff9e6=
94d16
[   22.641841] RDX: 000000000000001f RSI: ffff88810638fbf0 RDI: 00000000000=
000f8
[   22.641844] RBP: ffff88810638fbb0 R08: 0000000000000001 R09: ffffed1020c=
71f6d
[   22.641847] R10: ffff88810638fb6f R11: 0000000000000006 R12: 00000000000=
00000
[   22.641849] R13: ffff88810bfc6710 R14: ffff88810638fbf0 R15: ffff8881063=
8fbf0
[   22.641852] FS:  0000000000000000(0000) GS:ffff8882b6b3b000(0000)
knlGS:0000000000000000
[   22.641855] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   22.641858] CR2: 00007f7357b568a1 CR3: 0000000106a70006 CR4: 00000000007=
706f0
[   22.641887] PKRU: 55555554
[   22.641889] Call Trace:
[   22.641891]  <TASK>
[   22.641894]  drm_client_buffer_vmap_local+0x78/0x140
[   22.641903]  drm_fbdev_ttm_helper_fb_dirty+0x20c/0x510 [drm_ttm_helper]
[   22.641913]  ? __pfx_drm_fbdev_ttm_helper_fb_dirty+0x10/0x10 [drm_ttm_he=
lper]
[   22.641918]  ? __raw_spin_lock_irqsave+0x8c/0xf0
[   22.641924]  ? __pfx___raw_spin_lock_irqsave+0x10/0x10
[   22.641928]  ? __pfx_mutex_lock+0x10/0x10
[   22.641936]  drm_fb_helper_fb_dirty+0x29a/0x5e0
[   22.641942]  ? __pfx_drm_fb_helper_fb_dirty+0x10/0x10
[   22.641946]  ? _raw_spin_lock_irq+0x8a/0xe0
[   22.641950]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[   22.641955]  process_one_work+0x668/0xeb0
[   22.641962]  worker_thread+0x5f6/0x1060
[   22.641967]  ? __kthread_parkme+0x8d/0x170
[   22.641972]  ? __pfx_worker_thread+0x10/0x10
[   22.641976]  kthread+0x36f/0x710
[   22.641980]  ? __pfx_kthread+0x10/0x10
[   22.641983]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[   22.641987]  ? __pfx_kthread+0x10/0x10
[   22.641990]  ret_from_fork+0x1c9/0x260
[   22.641995]  ? __pfx_kthread+0x10/0x10
[   22.641999]  ret_from_fork_asm+0x1a/0x30
[   22.642004]  </TASK>
[   22.642006] Modules linked in: vfat(+) snd_ac97_codec(+) vmxnet3(+)
ac97_bus fat snd_seq snd_pcm gameport vmwgfx(+) snd_rawmidi
snd_seq_device snd_timer drm_ttm_helper snd i2c_piix4 ttm i2c_smbus
joydev soundcore loop nfnetlink vsock_loopback
vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock zram
vmw_vmci lz4hc_compress lz4_compress polyval_clmulni
ghash_clmulni_intel ata_generic pata_acpi serio_raw fuse
[   22.642056] ---[ end trace 0000000000000000 ]---
[   22.642059] RIP: 0010:drm_gem_lock+0x25/0x50
[   22.642063] Code: 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 b8
00 00 00 00 00 fc ff df 53 48 89 fb 48 81 c7 f8 00 00 00 48 89 fa 48
c1 ea 03 <80> 3c 02 00 75 0f 48 8b bb f8 00 00 00 31 f6 5b e9 16 2e 15
01 e8
[   22.642066] RSP: 0018:ffff88810638fb78 EFLAGS: 00010202
[   22.642069] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff9e6=
94d16
[   22.642072] RDX: 000000000000001f RSI: ffff88810638fbf0 RDI: 00000000000=
000f8
[   22.642074] RBP: ffff88810638fbb0 R08: 0000000000000001 R09: ffffed1020c=
71f6d
[   22.642077] R10: ffff88810638fb6f R11: 0000000000000006 R12: 00000000000=
00000
[   22.642079] R13: ffff88810bfc6710 R14: ffff88810638fbf0 R15: ffff8881063=
8fbf0
[   22.642082] FS:  0000000000000000(0000) GS:ffff8882b6b3b000(0000)
knlGS:0000000000000000
[   22.642085] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   22.642087] CR2: 00007f7357b568a1 CR3: 0000000106a70006 CR4: 00000000007=
706f0
[   22.642112] PKRU: 55555554

--000000000000b84f610642765053
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
V0fYJUiKJMCwvDmndOil8EtMA8j2T6taUZoQINiKQ0oDWgY6eYVv7AdPVIeOOs3noCyUL8AyA7Bl
yoOPBB2/gk8VGcolEKgAAj+3hPbBF/d19x1bZzU3wABizBomVwykx5ms1nVXDbQajz8jqYECKWh9
3OMo7BuC3TAClu5mLr2zs0Ccpp6NRRkjTF8WtCJ+jSnjFJGLAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF2lhbi5mb3JiZXNAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBSvJWzgGK7aSByS+CQVBVfM
Xgm5azANBgkqhkiG9w0BAQsFAAOCAgEAfrWiLF3zrYq7D+KPNRaAP70FbxHeaiUfn27Hbu37Eefz
xeJTcFZH04IEtXqpM3NWYZm4A/dFn/VQPbLCRaeXzpT2TESVH6EFY7BEF0rnSSlUbFyi000MnSH3
h5m+MoyE+PzLqfzLBZS+EU/haCpPy6Nqhs3fPKG3w5VTnUPsAxXK7rSmkIDVNsvwRttuMq9KHJzH
Bx51dP/z3mel4OuMjgrwHk5uNY1Sn1MZAUQztVUsWguyfoKcmhxXbBccR5DdEfBgDEbq8bicPQ3J
kqEy1QZXJfHlJuAJIiEw7odGctwqLeGCU6cBLhnsg54ngjO3uYC6tIySul55MRxFKE8HIwIrx+D5
2SwhDeVLZ8sTK40uPzW5xg5laOWVCvmy2b+cHCGzarUeIlYdtw0ejdH9Hbkm0G7IrDvjkhPa64gR
6Q+m5CGRDk+8iWhieH6WFE4HL++BpZhoi+YsOkGU3DK0dA+pxQnXNcNw1s0eNbSUVwQzmlC4LqiK
Gj5JV81HTPLhoAya57a9i28Fp5qHZiFnCq4HMvwiwY7IWe+UwUuueU199aTK80xNiS553vHc6FpI
/vxGy+LveJqEtodfKqQKwDOVu//c1Lz3uergJHqFYTMykk5U95J3FG5q/7Mqe4RF6E9OgtuAJidS
6Ca5anjLQ/qzIfTjoXX7TJSjPztehRQxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgx2/5+PPF/QoW30N7swDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEID1L
Tszx3FOAQLt98jlIsAku1moyG7SYZ3YWLyyImTiNMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MTAzMTE1NDk0OFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAGE8j9Ou+EDGEsKDAAsK2qnMZ9AvCeyJCzoVMNHr
2b7pa8iqT0P7pFJuNP8+45tno1xb0uR6kAJ+FJhcfElfjhAK4/QqQBq+Up4lCt8BKIdrnslgoSiA
zSxlDTU7rlor+dnpHkwFfbjortjgWBnGx9l/J8qpB0wk1IrLmx+WxGghg0hEg7dI6YrUs+lb3l7/
IvoW5g8gjHcyi1Kg0UpctYcY+LtgKO30gfOQkRtkAI7Ndn+eeDJgeVTvHRMDv5VMdhVMCWa7VRuH
MZ89yBKa3Q9BNVs2lopftBXCMUbrj1mc4BgC4j0MXUSli1NKu9708V3l0sdY4zMcGCJnGNsQPW8=
--000000000000b84f610642765053--
