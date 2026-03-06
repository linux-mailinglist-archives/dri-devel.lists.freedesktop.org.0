Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AECtEgszqmm8NAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:51:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C3521A60B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C0910E2C2;
	Fri,  6 Mar 2026 01:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ffIi8k6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7808710E2E8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 01:51:04 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-7d598f4c618so4756081a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 17:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772761864; x=1773366664; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F0rsOoswj5eD7nQPQpmkp6jfLbhrwTpwHV3qnnV31B8=;
 b=ffIi8k6S/mG4Ohgz4svYnPQOpbbSsXiS36JTQL9zs3UwvCVI+zPAJVSi7UqQc0TF3i
 CbazuXNxwQrjQOrgx/MmeLnnCES54VvT6+Kls2lRoYlD5DSqAMAmh9MKfGwBbTaaIvSD
 HHEZIBgJDb8RF3OJ5da3eLYQIS7Qu/Waa2tChr+xFFFuV0MTojc1IrTn6UbxwRoQhfTl
 t78F9B8d8PtwNU8vo2xFAJDITCpXBkgk4HsZUjQBtSlOyYttNF9mVM8HsbhTRX0zwzBy
 VbqJ/g9Xrb4WGTOF/WB0NZsm7wzh/vBC5VV7crIWsTP0LJvqm7CDAixU3Z8CWgIeyOoA
 m7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772761864; x=1773366664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F0rsOoswj5eD7nQPQpmkp6jfLbhrwTpwHV3qnnV31B8=;
 b=dqQ8uFd+GMVDOqTZjciTOoKhug5F4rc/kAYxD+JyrW7I76Yoz2m2rLZUN/3Nuph8I+
 kYkF07AMfsCRuataMS2NRRr3nOCthKGFXNkUxM+HE1qkvZCjaayicneML2ECtnz/O8kn
 Ef+oA71E0i0d1H6NbaslSqJqfa4hEVphVpZ3UIc/G+aApnqUInJKNexW+EpTH+u0Bw4K
 pRW8VX/nbNn45nJ97BrUXtZ7VgQEmlgWVz2n71ubiim9R6AROwM9tKviYFL19zhbL5Vh
 eM9TqDv+IDQTaNAtmswpGGR0gW8gMWG+en67v+Qjiob4uAw2+nE/h7sar63Th1q1pJA1
 OeHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1hhb17pRG8lzzcVpLvdsPywWocTjwwJuDgxDpiTVi73WP6dKLnYFMfowfSaKkpyLvfooDPgd88n0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoK+V3g3DmKaK4ORKdqyppZnn6Zy61UBSmsO0yDgwo5pvpBBGS
 FBYqiNg5RQJhz/OZI6x5I6Z71lPqU1AC4jT3xPA4Z+3Jq840d86jhCqW
X-Gm-Gg: ATEYQzzlQLWdUqRSe6+UkJ26YGZf5yNIgOR33IpCmRtYr88kIAjTTysDFfFdrMfXDKp
 Abm++yj7Z+lDDQ6qqBWdHpK+/+0AnWJQQaxlipG2tfYyF9zmR+LpfVL11Dn7VElffrI6EI20S4W
 jdrVWkk4m7c0Xn8g6a3fKUuDbA/bfW2mKMUXznk+rrGKcy5FE1HShlh+L2u7Wni7psLdqbcEGA0
 DA/BYUQGYfz5uTJFqAAdR37CWCKWD6iL6CHo01nHi3N0DxCVQ3k6XdsDDKkNj6Pku4fO46jaoG/
 Bw6R6UWM/PO3/UieTLIwgrBPHTC6NuWV0HoHCwpQguSN0j0Q0FmQIoPUDxzy5o5KSIPlbGwuSzx
 Su7gPu74Bi61HLm2ge89RWJ46CXQGovZsfb2Jk7MLfVeSbP+UF5YS3hw/Iek9H17ZBS6PMRim8Y
 om6QFa+stMCjW5wBJf9mwDk2ZEpaW1zPUrpqAUxs0IeXpnxVBT6oO8gAC58s0=
X-Received: by 2002:a05:6820:162a:b0:679:9873:5e7e with SMTP id
 006d021491bc7-67b9bd1af62mr408389eaf.42.1772761863366; 
 Thu, 05 Mar 2026 17:51:03 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-67b9cc1a627sm115245eaf.6.2026.03.05.17.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 17:50:58 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 virtualization@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 2/7] virtio: use pr_debug_ratelimited to avoid flooding
Date: Thu,  5 Mar 2026 18:50:05 -0700
Message-ID: <20260306015022.1940986-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306015022.1940986-1-jim.cromie@gmail.com>
References: <20260306015022.1940986-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: C9C3521A60B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:intel-gvt-dev@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:jim.cromie@gmail.com,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:virtualization@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,redhat.com,linux.alibaba.com,linaro.org,amd.com,lists.linux.dev,vger.kernel.org,lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[drm-misc-fixes-2026-02-26-80-g9a2f253ad689:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

When I test dynamic-debug's static-key toggling performance in a
virtme-ng session, it is too easy to create an enormous flood of
printks to the console.

  #> echo +p > /proc/dynamic_debug/control
  #> echo -p > /proc/dynamic_debug/control

Now theres no "good reason" to shoot your own foot, but this is also
easy to fix, by ratelimiting the sources of the flood.  I don't think
theres a loss of utility to virtio.

Example console output is below the snip.  For this test-case,
ratelimiting suppresses >900k callbacks.  It also allows this simple
load test for the static-key toggling performance in a following patch.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---

root@drm-misc-fixes-2026-02-26-80-g9a2f253ad689:/home/jimc/projects/lx/wk-D/b0-dd# ddcmdq -p
[  619.868567] dyndbg: query 0: "-p" mod:*
Delta-CAL (IPI): 71

- above is a noop baseline.

root@drm-misc-fixes-2026-02-26-80-g9a2f253ad689:/home/jimc/projects/lx/wk-D/b0-dd# ddcmdq +p
[  648.876520] dyndbg: query 0: "+p" mod:*
[  648.878263] dyndbg: match on module: led_class
[  648.878350] dyndbg: match on module: probe
[  648.878474] dyndbg: match on module: pci
[  648.878636] dyndbg: match on module: pci_driver
[  648.878743] dyndbg: match on module: irq
[  648.878845] dyndbg: match on module: setup_bus
[  648.879032] dyndbg: match on module: pcieportdrv
[  648.879139] dyndbg: match on module: bwctrl
[  648.879197] dyndbg: match on module: aspm
[  648.879241] dyndbg: match on module: slot
[  648.879328] dyndbg: match on module: pci_acpi
[  648.879431] dyndbg: match on module: quirks
[  648.879521] dyndbg: match on module: pci_hotplug
[  648.879576] dyndbg: match on module: vgaarb
[  648.879710] dyndbg: match on module: backlight
[  648.879826] dyndbg: match on module: fb
[  648.879900] dyndbg: match on module: tables
[  648.880012] dyndbg: match on module: acpi
[  648.880977] dyndbg: match on module: ac
[  648.881021] dyndbg: match on module: button
[  648.881097] dyndbg: match on module: fan
[  648.881196] dyndbg: match on module: video
[  648.881295] dyndbg: match on module: processor
[  648.881558] dyndbg: match on module: thermal_lib
[  648.881671] dyndbg: match on module: thermal
[  648.881784] dyndbg: match on module: srat
[  648.881860] dyndbg: match on module: battery
[  648.881938] dyndbg: match on module: acpi_x86
[  648.882088] dyndbg: match on module: pnp
[  648.882219] dyndbg: match on module: dmaengine
[  648.882351] dyndbg: match on module: virt_dma
[  648.882429] dyndbg: match on module: acpi_dma
[  648.882518] dyndbg: match on module: dw_dmac_core
[  648.882619] dyndbg: match on module: virtio_ring
[  648.882833] dyndbg: match on module: tty_io
[  648.882835] virtqueue_get_buf_ctx_split: 852672 callbacks suppressed
[  648.882836] No more buffers in queue
[  648.882837] virtqueue_add_split: 4962 callbacks suppressed
[  648.882838] Added buffer head 0 to 00000000531af360
[  648.882842] No more buffers in queue
[  648.882843] No more buffers in queue
[  648.882843] No more buffers in queue
[  648.882844] No more buffers in queue
[  648.882844] No more buffers in queue
[  648.882845] No more buffers in queue
[  648.882845] No more buffers in queue
[  648.882846] No more buffers in queue
[  648.882846] No more buffers in queue
[  648.882857] Added buffer head 0 to 00000000531af360
[  648.882869] Added buffer head 0 to 00000000531af360
[  648.882874] vring_interrupt: 88637 callbacks suppressed
[  648.882876] virtqueue interrupt with no work for 00000000e20c0e9d
[  648.882882] Added buffer head 0 to 00000000531af360
[  648.882899] Added buffer head 0 to 00000000531af360
[  648.882909] Added buffer head 0 to 00000000531af360
[  648.882919] Added buffer head 0 to 00000000531af360
[  648.882930] Added buffer head 0 to 00000000531af360
[  648.882941] Added buffer head 0 to 00000000531af360
[  648.882951] Added buffer head 0 to 00000000531af360
[  648.883860] virtqueue interrupt with no work for 00000000531af360
[  648.883920] virtqueue interrupt with no work for 0000000088284d45
[  648.883980] virtqueue interrupt with no work for 000000006b8c4aa3
[  648.884033] virtqueue interrupt with no work for 00000000f205a9b7
[  648.884085] virtqueue interrupt with no work for 0000000021930e68
[  648.884138] virtqueue interrupt with no work for 0000000081dad94c
[  648.884190] virtqueue interrupt with no work for 0000000097d16d2d
[  648.884243] virtqueue interrupt with no work for 00000000b4539010
[  648.884296] virtqueue interrupt with no work for 00000000ac870038
[  648.884418] dyndbg: match on module: tty_jobctrl
[  648.884476] dyndbg: match on module: vt_ioctl
[  648.884528] dyndbg: match on module: serial_base
[  648.884625] dyndbg: match on module: 8250
[  648.884698] dyndbg: match on module: 8250_base
[  648.884795] dyndbg: match on module: 8250_exar
[  648.884856] dyndbg: match on module: 8250_pci
[  648.884962] dyndbg: match on module: 8250_pericom
[  648.885014] dyndbg: match on module: virtio_console
[  648.885091] dyndbg: match on module: iommu
[  648.885132] dyndbg: match on module: init
[  648.885174] dyndbg: match on module: ppr
[  648.885216] dyndbg: match on module: iommu
[  648.885256] dyndbg: match on module: dmar
[  648.885334] dyndbg: match on module: iommu
[  648.885419] dyndbg: match on module: virtio_iommu
[  648.885481] dyndbg: match on module: drm
[  648.885577] dyndbg: match on module: ttm
[  648.885651] dyndbg: match on module: component
[  648.885756] dyndbg: match on module: core
[  648.885979] dyndbg: match on module: bus
[  648.886081] dyndbg: match on module: dd
[  648.886238] dyndbg: match on module: syscore
[  648.886339] dyndbg: match on module: class
[  648.886429] dyndbg: match on module: platform
[  648.886519] dyndbg: match on module: faux
[  648.886567] dyndbg: match on module: main
[  648.886664] dyndbg: match on module: wakeup
[  648.886765] dyndbg: match on module: firmware_class
[  648.886925] dyndbg: match on module: regmap
[  648.886971] dyndbg: match on module: regcache
[  648.887089] dyndbg: match on module: regcache_flat
[  648.887142] dyndbg: match on module: regmap_debugfs
[  648.887195] dyndbg: match on module: mei
[  648.887914] dyndbg: match on module: mei_me
[  648.888149] dyndbg: match on module: dax
[  648.888267] dyndbg: match on module: dma_buf
[  648.888322] dyndbg: match on module: scsi_mod
[  648.888413] dyndbg: match on module: virtio_scsi
[  648.888486] dyndbg: match on module: libata
[  648.888736] dyndbg: match on module: ahci
[  648.888816] dyndbg: match on module: libahci
[  648.888895] dyndbg: match on module: ata_piix
[  648.888960] dyndbg: match on module: pata_amd
[  648.889050] dyndbg: match on module: pata_oldpiix
[  648.889124] dyndbg: match on module: pata_sch
[  648.889172] dyndbg: match on module: mdio_bus
[  648.889229] dyndbg: match on module: libphy
[  648.889303] dyndbg: match on module: realtek
[  648.889395] dyndbg: match on module: fwnode_mdio
[  648.889468] dyndbg: match on module: virtio_net
[  648.889697] dyndbg: match on module: pcmcia_core
[  648.889848] dyndbg: match on module: pcmcia
[  648.890263] dyndbg: match on module: pci_quirks
[  648.890322] dyndbg: match on module: i8042
[  648.890355] dyndbg: match on module: libps2
[  648.890441] dyndbg: match on module: input_core
[  648.890546] dyndbg: match on module: ff_memless
[  648.890670] dyndbg: match on module: atkbd
[  648.890724] dyndbg: match on module: psmouse
[  648.890981] dyndbg: match on module: rtc_core
[  648.891135] dyndbg: match on module: rtc_cmos
[  648.891242] dyndbg: match on module: i2c_boardinfo
[  648.891303] dyndbg: match on module: i2c_core
[  648.891519] dyndbg: match on module: i2c_smbus
[  648.891624] dyndbg: match on module: i2c_i801
[  648.891757] dyndbg: match on module: pps_core
[  648.891925] dyndbg: match on module: power_supply
[  648.892085] dyndbg: match on module: hwmon
[  648.892129] dyndbg: match on module: thermal_sys
[  648.892260] dyndbg: match on module: therm_throt
[  648.892315] dyndbg: match on module: md_mod
[  648.892570] dyndbg: match on module: dm_mod
[  648.892696] dyndbg: match on module: sysfs
[  648.892741] dyndbg: match on module: dmi_scan
[  648.892787] dyndbg: match on module: qemu_fw_cfg
[  648.892889] dyndbg: match on module: esrt
[  648.892935] dyndbg: match on module: mailbox
[  648.893006] dyndbg: match on module: pcc
[  648.893051] dyndbg: match on module: nvmem_core
[  648.893103] dyndbg: match on module: snd
[  648.893191] dyndbg: match on module: snd_timer
[  648.893249] dyndbg: match on module: snd_pcm
[  648.893356] dyndbg: match on module: snd_seq
[  648.893514] dyndbg: match on module: snd_intel8x0
[  648.893572] dyndbg: match on module: snd_ac97_codec
[  648.893667] dyndbg: match on module: snd_hda_core
[  648.893867] dyndbg: match on module: snd_intel_dspcfg
[  648.894017] dyndbg: match on module: snd_intel_sdw_acpi
[  648.894131] dyndbg: match on module: snd_hda_codec
[  648.894336] dyndbg: match on module: snd_hda_codec_realtek_lib
[  648.894479] dyndbg: match on module: snd_hda_codec_alc269
[  648.894585] dyndbg: match on module: snd_hda_scodec_component
[  648.894655] dyndbg: match on module: snd_hda_codec_generic
[  648.894775] dyndbg: match on module: snd_hda_intel
[  648.894939] dyndbg: match on module: sock
[  648.894987] dyndbg: match on module: dev
[  648.895119] dyndbg: match on module: sch_api
[  648.895174] dyndbg: match on module: route
[  648.895215] dyndbg: match on module: ip_fragment
[  648.895264] dyndbg: match on module: ip_output
[  648.895313] dyndbg: match on module: tcp
[  648.895350] dyndbg: match on module: tcp_input
[  648.895468] dyndbg: match on module: tcp_output
[  648.895575] dyndbg: match on module: tcp_timer
[  648.895634] dyndbg: match on module: tcp_ipv4
[  648.895687] dyndbg: match on module: tcp_cong
[  648.895743] dyndbg: match on module: tcp_fastopen
[  648.895796] dyndbg: match on module: tcp_recovery
[  648.895854] dyndbg: match on module: udp
[  648.895951] dyndbg: match on module: arp
[  648.895994] dyndbg: match on module: icmp
[  648.896096] dyndbg: match on module: devinet
[  648.896151] dyndbg: match on module: fib_trie
[  648.896250] dyndbg: match on module: ping
[  648.896409] dyndbg: match on module: sysctl_net_ipv4
[  648.896505] dyndbg: match on module: ipconfig
[  648.896567] dyndbg: match on module: tcp_cubic
[  648.896625] dyndbg: match on module: ip6_checksum
[  648.896718] dyndbg: match on module: sysctl_net
[  648.896832] dyndbg: match on module: i386
[  648.896886] dyndbg: match on module: mmconfig_shared
[  648.896944] dyndbg: match on module: fixup
[  648.897029] dyndbg: match on module: acpi
[  648.897087] dyndbg: match on module: irq
[  648.897185] dyndbg: match on module: decompress
[  648.897253] dyndbg: match on module: kobject
[  648.897366] dyndbg: match on module: kobject_uevent
[  648.897478] dyndbg: applied queued updates to 1900 sites in total
[  648.897586] applying 1879 queued jump_labels
[  648.898378] virtqueue callback for 00000000b8493952 (000000004941ab6e)
[  648.898493] virtio_fs_send_req: opcode 5 unique 0x45a0 nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.898493] virtio_fs_send_req: opcode 5 unique 0x459e nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.898582] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.898752] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.898905] virtio_fs_send_req: opcode 5 unique 0x45a2 nodeid 0x2f2 in.len 40 out.len 4095 queue_id 1
[  648.898912] virtio_fs_send_req: opcode 5 unique 0x45a4 nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.899066] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.899183] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.899276] virtio_fs_send_req: opcode 5 unique 0x45a6 nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.899281] virtio_fs_send_req: opcode 5 unique 0x45a8 nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.899413] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.899528] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.899608] virtio_fs_send_req: opcode 5 unique 0x45ac nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.899608] virtio_fs_send_req: opcode 5 unique 0x45aa nodeid 0x2f2 in.len 40 out.len 4095 queue_id 1
[  648.899711] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.899850] virtqueue callback for 00000000531af360 (00000000df837aee)
[  648.899957] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.899989] virtio_fs_send_req: opcode 5 unique 0x45ae nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.899992] virtio_fs_send_req: opcode 5 unique 0x45b0 nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.900080] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.900084] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.900520] virtio_fs_send_req: opcode 5 unique 0x45b2 nodeid 0x2f2 in.len 40 out.len 4095 queue_id 1
[  648.900557] virtio_fs_send_req: opcode 5 unique 0x45b4 nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.900725] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.901958] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.902056] virtio_fs_send_req: opcode 5 unique 0x45b6 nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.902069] virtio_fs_send_req: opcode 14 unique 0x45b8 nodeid 0x245 in.len 48 out.len 16 queue_id 1
[  648.902292] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.902409] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.902506] virtio_fs_send_req: opcode 5 unique 0x45ba nodeid 0x2f2 in.len 40 out.len 4095 queue_id 1
[  648.902507] overlayfs: open(00000000cc553079[bin/grep/l], 0100040) -> (00000000ebc0a9b2, 01100040)
[  648.902707] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.902793] virtio_fs_send_req: opcode 5 unique 0x45bc nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.902861] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.903071] virtio_fs_send_req: opcode 14 unique 0x45be nodeid 0x28 in.len 48 out.len 16 queue_id 1
[  648.903072] virtio_fs_send_req: opcode 5 unique 0x45c0 nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.903325] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.903329] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.903546] overlayfs: open(0000000044db1ed7[lib64/ld-linux-x86-64.so.2/l], 0100040) -> (00000000ce7f73a3, 01100040)
[  648.903629] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.903800] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.903896] virtio_fs_send_req: opcode 5 unique 0x45c2 nodeid 0x2f2 in.len 40 out.len 4095 queue_id 1
[  648.903921] virtio_fs_send_req: opcode 14 unique 0x45c4 nodeid 0x2b in.len 48 out.len 16 queue_id 1
[  648.904123] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.904252] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.904382] overlayfs: open(0000000044db1ed7[/ld.so.cache/l], 0100000) -> (00000000a546e0ec, 01100000)
[  648.904421] virtio_fs_send_req: opcode 5 unique 0x45c6 nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.904521] virtio_fs_send_req: opcode 25 unique 0x45c8 nodeid 0x2b in.len 64 out.len 0 queue_id 1
[  648.904698] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.904849] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.904982] virtio_fs_send_req: opcode 5 unique 0x45ca nodeid 0x2f2 in.len 40 out.len 4095 queue_id 1
[  648.905003] virtio_fs_send_req: opcode 5 unique 0x45cc nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.905214] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.905333] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.905469] virtio_fs_send_req: opcode 14 unique 0x45ce nodeid 0x2f3 in.len 48 out.len 16 queue_id 1
[  648.905476] virtio_fs_send_req: opcode 5 unique 0x45d0 nodeid 0x4b in.len 40 out.len 4095 queue_id 1
[  648.905672] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.905803] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.905910] overlayfs: open(00000000b23a5ecd[bin/gawk/l], 0100040) -> (0000000042a63553, 01100040)
[  648.905918] virtio_fs_send_req: opcode 14 unique 0x45d2 nodeid 0x4c in.len 48 out.len 16 queue_id 1
[  648.906095] virtio_fs_send_req: opcode 5 unique 0x45d4 nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.906255] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.906359] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.906486] overlayfs: open(0000000044db1ed7[lib64/libpcre2-8.so.0.15.0/l], 0100000) -> (00000000761f1272, 01100000)
[  648.906498] virtio_fs_send_req: opcode 14 unique 0x45d6 nodeid 0x28 in.len 48 out.len 16 queue_id 1
[  648.906653] virtio_fs_send_req: opcode 25 unique 0x45d8 nodeid 0x4c in.len 64 out.len 0 queue_id 1
[  648.906842] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.906929] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.907050] overlayfs: open(000000001dc27c49[lib64/ld-linux-x86-64.so.2/l], 0100040) -> (00000000cb9765b4, 01100040)
[  648.907060] virtio_fs_send_req: opcode 5 unique 0x45da nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.907329] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.907428] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.907453] virtio_fs_send_req: opcode 14 unique 0x45dc nodeid 0x2b in.len 48 out.len 16 queue_id 1
[  648.907633] virtio_fs_send_req: opcode 14 unique 0x45de nodeid 0x30 in.len 48 out.len 16 queue_id 1
[  648.907709] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.907848] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.907943] overlayfs: open(0000000044db1ed7[lib64/libc.so.6/l], 0100000) -> (000000003b97b39b, 01100000)
[  648.907943] overlayfs: open(000000001dc27c49[/ld.so.cache/l], 0100000) -> (00000000fce78bd3, 01100000)
[  648.908091] virtio_fs_send_req: opcode 25 unique 0x45e0 nodeid 0x30 in.len 64 out.len 0 queue_id 1
[  648.908169] virtio_fs_send_req: opcode 25 unique 0x45e2 nodeid 0x2b in.len 64 out.len 0 queue_id 1
[  648.908341] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.908447] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.908581] virtio_fs_send_req: opcode 5 unique 0x45e4 nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.908724] virtio_fs_send_req: opcode 18 unique 0x45e6 nodeid 0x2b in.len 64 out.len 0 queue_id 1
[  648.908776] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.908895] virtio_fs_send_req: opcode 14 unique 0x45e8 nodeid 0x2a7 in.len 48 out.len 16 queue_id 1
[  648.908956] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.909155] virtio_fs_send_req: opcode 5 unique 0x45ea nodeid 0x2f4 in.len 40 out.len 4095 queue_id 1
[  648.909156] overlayfs: open(0000000044db1ed7[locale/locale-archive/l], 0100000) -> (00000000a546e0ec, 01100000)
[  648.909346] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.909427] virtio_fs_send_req: opcode 25 unique 0x45ec nodeid 0x2a7 in.len 64 out.len 0 queue_id 1
[  648.909506] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.909725] virtio_fs_send_req: opcode 14 unique 0x45ee nodeid 0x2f5 in.len 48 out.len 16 queue_id 1
[  648.909764] virtio_fs_send_req: opcode 14 unique 0x45f0 nodeid 0x2a9 in.len 48 out.len 16 queue_id 1
[  648.910023] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.910119] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.910240] overlayfs: open(0000000044db1ed7[gconv/gconv-modules.cache/l], 0100000) -> (0000000046b528d3, 01100000)
[  648.910245] overlayfs: open(000000001dc27c49[lib64/libreadline.so.8.3/l], 0100000) -> (000000006c3dd911, 01100000)
[  648.910382] virtio_fs_send_req: opcode 25 unique 0x45f2 nodeid 0x2a9 in.len 64 out.len 0 queue_id 1
[  648.910515] virtio_fs_send_req: opcode 25 unique 0x45f4 nodeid 0x2f5 in.len 64 out.len 0 queue_id 1
[  648.910662] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.910775] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.910915] virtio_fs_send_req: opcode 5 unique 0x45f6 nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.910930] virtio_fs_send_req: opcode 14 unique 0x45f8 nodeid 0x2b2 in.len 48 out.len 16 queue_id 1
[  648.911124] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.911233] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.911331] overlayfs: open(0000000044db1ed7[locale/locale.alias/l], 0100000) -> (000000001b94a7b7, 01100000)
[  648.911332] virtio_fs_send_req: opcode 5 unique 0x45fa nodeid 0x2f6 in.len 40 out.len 4095 queue_id 1
[  648.911483] virtio_fs_send_req: opcode 25 unique 0x45fc nodeid 0x2b2 in.len 64 out.len 0 queue_id 1
[  648.911664] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.911757] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.911865] virtio_fs_send_req: opcode 18 unique 0x45fe nodeid 0x2b2 in.len 64 out.len 0 queue_id 1
[  648.911870] virtio_fs_send_req: opcode 14 unique 0x4600 nodeid 0x2f7 in.len 48 out.len 16 queue_id 1
[  648.912086] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.912188] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.912284] overlayfs: open(000000001dc27c49[lib64/libmpfr.so.6.2.2/l], 0100000) -> (00000000dd259cff, 01100000)
[  648.912289] virtio_fs_send_req: opcode 18 unique 0x4602 nodeid 0x28 in.len 64 out.len 0 queue_id 1
[  648.912456] virtio_fs_send_req: opcode 25 unique 0x4604 nodeid 0x2f7 in.len 64 out.len 0 queue_id 1
[  648.912515] virtio_fs_send_req: opcode 18 unique 0x4606 nodeid 0x2a9 in.len 64 out.len 0 queue_id 1
[  648.912599] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.912603] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.912924] virtio_fs_send_req: opcode 18 unique 0x4608 nodeid 0x4c in.len 64 out.len 0 queue_id 1
[  648.912943] virtio_fs_send_req: opcode 5 unique 0x460a nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.913017] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.913020] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.913078] virtio_fs_send_req: opcode 18 unique 0x460c nodeid 0x30 in.len 64 out.len 0 queue_id 1
[  648.913298] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.913356] virtio_fs_send_req: opcode 18 unique 0x460e nodeid 0x2a7 in.len 64 out.len 0 queue_id 1
[  648.913463] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.913537] virtio_fs_send_req: opcode 18 unique 0x4610 nodeid 0x245 in.len 64 out.len 0 queue_id 1
[  648.913877] virtio_fs_send_req: opcode 5 unique 0x4612 nodeid 0x2f8 in.len 40 out.len 4095 queue_id 1
[  648.913927] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.914084] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.914219] virtio_fs_send_req: opcode 14 unique 0x4614 nodeid 0x2f9 in.len 48 out.len 16 queue_id 1
[  648.914388] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.914488] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.914586] overlayfs: open(000000001dc27c49[lib64/libgmp.so.10.5.0/l], 0100000) -> (00000000c480dc70, 01100000)
[  648.914746] virtio_fs_send_req: opcode 25 unique 0x4616 nodeid 0x2f9 in.len 64 out.len 0 queue_id 1
[  648.914898] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.914993] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.915130] virtio_fs_send_req: opcode 5 unique 0x4618 nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.915297] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.915391] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.915500] virtio_fs_send_req: opcode 14 unique 0x461a nodeid 0x42 in.len 48 out.len 16 queue_id 1
[  648.915676] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.915772] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.915873] overlayfs: open(000000001dc27c49[lib64/libm.so.6/l], 0100000) -> (00000000aab89989, 01100000)
[  648.916022] virtio_fs_send_req: opcode 25 unique 0x461c nodeid 0x42 in.len 64 out.len 0 queue_id 1
[  648.916184] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.916282] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.916386] virtio_fs_send_req: opcode 5 unique 0x461e nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.916559] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.916656] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.916756] virtio_fs_send_req: opcode 14 unique 0x4620 nodeid 0x30 in.len 48 out.len 16 queue_id 1
[  648.916947] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.917045] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.917171] overlayfs: open(000000001dc27c49[lib64/libc.so.6/l], 0100000) -> (00000000065b2aff, 01100000)
[  648.917339] virtio_fs_send_req: opcode 25 unique 0x4622 nodeid 0x30 in.len 64 out.len 0 queue_id 1
[  648.917498] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.917596] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.917710] virtio_fs_send_req: opcode 5 unique 0x4624 nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.917901] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.917998] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.918105] virtio_fs_send_req: opcode 5 unique 0x4626 nodeid 0x1ed in.len 40 out.len 4095 queue_id 1
[  648.918283] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.918380] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.918489] virtio_fs_send_req: opcode 14 unique 0x4628 nodeid 0x1ee in.len 48 out.len 16 queue_id 1
[  648.918682] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.918780] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.918881] overlayfs: open(000000001dc27c49[lib64/libtinfo.so.6.5/l], 0100000) -> (0000000057c26190, 01100000)
[  648.919054] virtio_fs_send_req: opcode 25 unique 0x462a nodeid 0x1ee in.len 64 out.len 0 queue_id 1
[  648.919219] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.919318] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.919997] virtio_fs_send_req: opcode 18 unique 0x462c nodeid 0x2b in.len 64 out.len 0 queue_id 1
[  648.920159] virtio_fs_send_req: opcode 14 unique 0x462e nodeid 0x2a7 in.len 48 out.len 16 queue_id 1
[  648.920169] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.920368] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.920492] overlayfs: open(000000001dc27c49[locale/locale-archive/l], 0100000) -> (00000000fce78bd3, 01100000)
[  648.920627] virtio_fs_send_req: opcode 25 unique 0x4630 nodeid 0x2a7 in.len 64 out.len 0 queue_id 1
[  648.920772] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.920871] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.921036] virtio_fs_send_req: opcode 14 unique 0x4632 nodeid 0x2a9 in.len 48 out.len 16 queue_id 1
[  648.921211] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.921308] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.921400] overlayfs: open(000000001dc27c49[gconv/gconv-modules.cache/l], 0100000) -> (00000000d54e120f, 01100000)
[  648.921523] virtio_fs_send_req: opcode 25 unique 0x4634 nodeid 0x2a9 in.len 64 out.len 0 queue_id 1
[  648.921666] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.921770] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.921832] virtqueue callback for 00000000531af360 (00000000df837aee)
[  648.922226] virtio_fs_send_req: opcode 18 unique 0x4636 nodeid 0x28 in.len 64 out.len 0 queue_id 1
[  648.922326] virtio_fs_send_req: opcode 18 unique 0x4638 nodeid 0x2a9 in.len 64 out.len 0 queue_id 1
[  648.922400] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.922416] virtio_fs_send_req: opcode 18 unique 0x463a nodeid 0x2f5 in.len 64 out.len 0 queue_id 1
[  648.922482] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.922564] virtio_fs_send_req: opcode 18 unique 0x463c nodeid 0x2f7 in.len 64 out.len 0 queue_id 1
[  648.922690] virtio_fs_send_req: opcode 18 unique 0x463e nodeid 0x2f9 in.len 64 out.len 0 queue_id 1
[  648.922762] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.922780] virtio_fs_send_req: opcode 18 unique 0x4640 nodeid 0x42 in.len 64 out.len 0 queue_id 1
[  648.922847] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.922929] virtio_fs_send_req: opcode 18 unique 0x4642 nodeid 0x30 in.len 64 out.len 0 queue_id 1
[  648.923060] virtio_fs_send_req: opcode 18 unique 0x4644 nodeid 0x1ee in.len 64 out.len 0 queue_id 1
[  648.923126] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.923166] virtio_fs_send_req: opcode 18 unique 0x4646 nodeid 0x2a7 in.len 64 out.len 0 queue_id 1
[  648.923228] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.923311] virtio_fs_send_req: opcode 18 unique 0x4648 nodeid 0x2f3 in.len 64 out.len 0 queue_id 1
[  648.923487] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.923557] virtiofs virtio0: virtio_fs_vq_done requests.0

Delta-CAL (IPI): 6007
- this number is before the insert-sort, final number is better.

[  648.926990] virtio_fs_send_req: opcode 14 unique 0x464a nodeid 0xae in.len 48 out.len 16 queue_id 1
[  648.927221] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.927312] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.927409] overlayfs: open(00000000ae2b3a37[/machine-id/l], 0100000) -> (00000000ebc0a9b2, 01100000)
[  648.927537] virtio_fs_send_req: opcode 25 unique 0x464c nodeid 0xae in.len 64 out.len 0 queue_id 1
[  648.927709] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.927798] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.927888] virtio_fs_send_req: opcode 18 unique 0x464e nodeid 0xae in.len 64 out.len 0 queue_id 1
[  648.928052] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.928135] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.928914] virtqueue callback for 00000000b8493952 (000000004941ab6e)
[  648.929008] virtio_fs_send_req: opcode 5 unique 0x4650 nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.929175] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.929246] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.929318] virtio_fs_send_req: opcode 5 unique 0x4652 nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.929467] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.929535] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.929604] virtio_fs_send_req: opcode 5 unique 0x4654 nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.929751] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.929824] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.929899] virtio_fs_send_req: opcode 5 unique 0x4656 nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.930043] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.930110] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.930188] virtio_fs_send_req: opcode 5 unique 0x4658 nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.930331] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.930399] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.930503] virtio_fs_send_req: opcode 5 unique 0x465a nodeid 0x23 in.len 40 out.len 4095 queue_id 1
[  648.930648] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.930717] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.930795] virtio_fs_send_req: opcode 14 unique 0x465c nodeid 0x204 in.len 48 out.len 16 queue_id 1
[  648.930976] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.931046] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.931132] overlayfs: open(00000000b23a5ecd[bin/sed/l], 0100040) -> (0000000074755de1, 01100040)
[  648.931288] virtio_fs_send_req: opcode 5 unique 0x465e nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.931448] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.931517] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.931600] virtio_fs_send_req: opcode 14 unique 0x4660 nodeid 0x28 in.len 48 out.len 16 queue_id 1
[  648.931751] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.931826] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.931906] overlayfs: open(00000000fea37e0c[lib64/ld-linux-x86-64.so.2/l], 0100040) -> (00000000ebc0a9b2, 01100040)
[  648.932282] virtio_fs_send_req: opcode 14 unique 0x4662 nodeid 0x2b in.len 48 out.len 16 queue_id 1
[  648.932437] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.932508] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.932593] overlayfs: open(00000000fea37e0c[/ld.so.cache/l], 0100000) -> (00000000a546e0ec, 01100000)
[  648.932710] virtio_fs_send_req: opcode 25 unique 0x4664 nodeid 0x2b in.len 64 out.len 0 queue_id 1
[  648.932868] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.932945] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.933038] virtio_fs_send_req: opcode 5 unique 0x4666 nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.933203] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.933285] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.933377] virtio_fs_send_req: opcode 5 unique 0x4668 nodeid 0x2c in.len 40 out.len 4095 queue_id 1
[  648.933528] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.933606] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.933695] virtio_fs_send_req: opcode 14 unique 0x466a nodeid 0x2d in.len 48 out.len 16 queue_id 1
[  648.933850] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.933924] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.934031] overlayfs: open(00000000fea37e0c[lib64/libacl.so.1.1.2302/l], 0100000) -> (000000003b97b39b, 01100000)
[  648.934194] virtio_fs_send_req: opcode 25 unique 0x466c nodeid 0x2d in.len 64 out.len 0 queue_id 1
[  648.934349] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.934427] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.934513] virtio_fs_send_req: opcode 5 unique 0x466e nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.934668] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.934745] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.934835] virtio_fs_send_req: opcode 14 unique 0x4670 nodeid 0x41 in.len 48 out.len 16 queue_id 1
[  648.934991] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.935069] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.935152] overlayfs: open(00000000fea37e0c[lib64/libselinux.so.1/l], 0100000) -> (00000000761f1272, 01100000)
[  648.935308] virtio_fs_send_req: opcode 25 unique 0x4672 nodeid 0x41 in.len 64 out.len 0 queue_id 1
[  648.935462] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.935540] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.935650] virtio_fs_send_req: opcode 5 unique 0x4674 nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.935800] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.935899] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.935994] virtio_fs_send_req: opcode 14 unique 0x4676 nodeid 0x30 in.len 48 out.len 16 queue_id 1
[  648.936148] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.936226] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.936316] overlayfs: open(00000000fea37e0c[lib64/libc.so.6/l], 0100000) -> (0000000046b528d3, 01100000)
[  648.936448] virtio_fs_send_req: opcode 25 unique 0x4678 nodeid 0x30 in.len 64 out.len 0 queue_id 1
[  648.936612] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.936691] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.936784] virtio_fs_send_req: opcode 5 unique 0x467a nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.936943] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.937022] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.937125] virtio_fs_send_req: opcode 5 unique 0x467c nodeid 0x43 in.len 40 out.len 4095 queue_id 1
[  648.937274] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.937353] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.937447] virtio_fs_send_req: opcode 14 unique 0x467e nodeid 0x44 in.len 48 out.len 16 queue_id 1
[  648.937604] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.937683] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.937769] overlayfs: open(00000000fea37e0c[lib64/libattr.so.1.1.2502/l], 0100000) -> (00000000ce7f73a3, 01100000)
[  648.937964] virtio_fs_send_req: opcode 25 unique 0x4680 nodeid 0x44 in.len 64 out.len 0 queue_id 1
[  648.938148] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.938229] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.938329] virtio_fs_send_req: opcode 5 unique 0x4682 nodeid 0x26 in.len 40 out.len 4095 queue_id 1
[  648.938499] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.938577] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.938669] virtio_fs_send_req: opcode 5 unique 0x4684 nodeid 0x4b in.len 40 out.len 4095 queue_id 1
[  648.938831] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.938914] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.939013] virtio_fs_send_req: opcode 14 unique 0x4686 nodeid 0x4c in.len 48 out.len 16 queue_id 1
[  648.939192] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.939272] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.939361] overlayfs: open(00000000fea37e0c[lib64/libpcre2-8.so.0.15.0/l], 0100000) -> (000000001b94a7b7, 01100000)
[  648.939502] virtio_fs_send_req: opcode 25 unique 0x4688 nodeid 0x4c in.len 64 out.len 0 queue_id 1
[  648.939654] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.939734] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.940088] virtio_fs_send_req: opcode 18 unique 0x468a nodeid 0x2b in.len 64 out.len 0 queue_id 1
[  648.940214] virtio_fs_send_req: opcode 1 unique 0x468c nodeid 0x1 in.len 48 out.len 128 queue_id 1
[  648.940273] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.940394] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.940552] virtio_fs_send_req: opcode 14 unique 0x468e nodeid 0x2a7 in.len 48 out.len 16 queue_id 1
[  648.940730] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.940819] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.940910] overlayfs: open(00000000fea37e0c[locale/locale-archive/l], 0100000) -> (00000000a546e0ec, 01100000)
[  648.941042] virtio_fs_send_req: opcode 25 unique 0x4690 nodeid 0x2a7 in.len 64 out.len 0 queue_id 1
[  648.941215] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.941295] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.941413] virtio_fs_send_req: opcode 14 unique 0x4692 nodeid 0x2a9 in.len 48 out.len 16 queue_id 1
[  648.941577] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.941654] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.941735] overlayfs: open(00000000fea37e0c[gconv/gconv-modules.cache/l], 0100000) -> (000000007d5f2653, 01100000)
[  648.941867] virtio_fs_send_req: opcode 25 unique 0x4694 nodeid 0x2a9 in.len 64 out.len 0 queue_id 1
[  648.942022] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.942105] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.942374] virtio_fs_send_req: opcode 18 unique 0x4696 nodeid 0x28 in.len 64 out.len 0 queue_id 1
[  648.942487] virtio_fs_send_req: opcode 18 unique 0x4698 nodeid 0x2a9 in.len 64 out.len 0 queue_id 1
[  648.942559] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.942599] virtio_fs_send_req: opcode 18 unique 0x469a nodeid 0x2d in.len 64 out.len 0 queue_id 1
[  648.942660] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.942757] virtio_fs_send_req: opcode 18 unique 0x469c nodeid 0x41 in.len 64 out.len 0 queue_id 1
[  648.942912] virtio_fs_send_req: opcode 18 unique 0x469e nodeid 0x30 in.len 64 out.len 0 queue_id 1
[  648.942973] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.943020] virtio_fs_send_req: opcode 18 unique 0x46a0 nodeid 0x44 in.len 64 out.len 0 queue_id 1
[  648.943084] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.943247] virtio_fs_send_req: opcode 18 unique 0x46a2 nodeid 0x4c in.len 64 out.len 0 queue_id 1
[  648.943318] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.943353] virtio_fs_send_req: opcode 18 unique 0x46a4 nodeid 0x2a7 in.len 64 out.len 0 queue_id 1
[  648.943417] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.943514] virtio_fs_send_req: opcode 18 unique 0x46a6 nodeid 0x204 in.len 64 out.len 0 queue_id 1
[  648.943698] virtqueue callback for 00000000ffb9412a (00000000c5ce06f7)
[  648.943776] virtiofs virtio0: virtio_fs_vq_done requests.0
[  648.948394] uart_wait_until_sent(0), jiffies=4295316070, expire=4295316142...
root@drm-misc-fixes-2026-02-26-80-g9a2f253ad689:/home/jimc/projects/lx/wk-D/b0-dd#
---
 drivers/virtio/virtio_ring.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 335692d41617..99f9e547d264 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -759,7 +759,7 @@ static inline int virtqueue_add_split(struct vring_virtqueue *vq,
 						vq->split.avail_idx_shadow);
 	vq->num_added++;
 
-	pr_debug("Added buffer head %i to %p\n", head, vq);
+	pr_debug_ratelimited("Added buffer head %i to %p\n", head, vq);
 	END_USE(vq);
 
 	/* This is very unlikely, but theoretically possible.  Kick
@@ -930,7 +930,7 @@ static void *virtqueue_get_buf_ctx_split(struct vring_virtqueue *vq,
 	}
 
 	if (!more_used_split(vq)) {
-		pr_debug("No more buffers in queue\n");
+		pr_debug_ratelimited("No more buffers in queue\n");
 		END_USE(vq);
 		return NULL;
 	}
@@ -1595,7 +1595,7 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
 
 	vq->num_added += 1;
 
-	pr_debug("Added buffer head %i to %p\n", head, vq);
+	pr_debug_ratelimited("Added buffer head %i to %p\n", head, vq);
 	END_USE(vq);
 
 	return 0;
@@ -1744,7 +1744,7 @@ static inline int virtqueue_add_packed(struct vring_virtqueue *vq,
 	vq->packed.vring.desc[head].flags = head_flags;
 	vq->num_added += descs_used;
 
-	pr_debug("Added buffer head %i to %p\n", head, vq);
+	pr_debug_ratelimited("Added buffer head %i to %p\n", head, vq);
 	END_USE(vq);
 
 	return 0;
@@ -1902,7 +1902,7 @@ static inline int virtqueue_add_packed_in_order(struct vring_virtqueue *vq,
 	vq->packed.vring.desc[head].flags = head_flags;
 	vq->num_added += total_sg;
 
-	pr_debug("Added buffer head %i to %p\n", head, vq);
+	pr_debug_ratelimited("Added buffer head %i to %p\n", head, vq);
 	END_USE(vq);
 
 	return 0;
@@ -3231,7 +3231,7 @@ irqreturn_t vring_interrupt(int irq, void *_vq)
 	struct vring_virtqueue *vq = to_vvq(_vq);
 
 	if (!more_used(vq)) {
-		pr_debug("virtqueue interrupt with no work for %p\n", vq);
+		pr_debug_ratelimited("virtqueue interrupt with no work for %p\n", vq);
 		return IRQ_NONE;
 	}
 
-- 
2.53.0

