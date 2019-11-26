Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CE210A0A4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 15:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23DE6E40A;
	Tue, 26 Nov 2019 14:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A826E409;
 Tue, 26 Nov 2019 14:45:49 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id j18so2582045wmk.1;
 Tue, 26 Nov 2019 06:45:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/t8Zi+5PgFFl1P/jVhGM7Y3bmRaQSmL6LZ28gmOon1s=;
 b=KZ4OGbYbQJ6mggJbz3/2H3OVzAvrUD+V3ht6v4ulN50+ER8frRWoKSOcZLtZtksTAP
 O2OtkeF+QlDpuEp408N3lfkqVZ/VQkdIZ1OQKkWVO31rwhKneuitA07g/yd+CAYWnM5c
 QEP+IFI01keezHQSlLz/VLb5/5kJmYN7IdDRn8A/tX5WCmx88iWxLnbPtxLFpKkfqDa1
 ZCKl0M8fEkaqh+c04xtmSLrnJedHmyslds7Cgo/VLD2oOuGKoa2hZggJahTx2XlXi+Ri
 I763pcLUPKlPcUS6yrPnq42ESIMGWVW5aeQd+0HlZWjKdV6muSe3V1an+tU8Sr3MyvyA
 blmQ==
X-Gm-Message-State: APjAAAWN+M8pGUF5lUhNCoARKYpVB+j3WWWPOLFoXYkeZk1hM9fyQcjf
 q6eaqCzEYcpfp+/mKCNLe+RJoBvoIA4M8FafgDS/3v/I
X-Google-Smtp-Source: APXvYqzufawFgPPlbbLLj/ErINPbBk2hG9wcOfy4O6dfPFObwXe1NY0U6daBZMmD5S1ut3NGsnOpKJfZXCj5n0KB9XY=
X-Received: by 2002:a1c:41c2:: with SMTP id o185mr4432670wma.34.1574779547444; 
 Tue, 26 Nov 2019 06:45:47 -0800 (PST)
MIME-Version: 1.0
References: <70afeeda-e6a5-4c3b-2691-efe282472fa1@linux.ee>
In-Reply-To: <70afeeda-e6a5-4c3b-2691-efe282472fa1@linux.ee>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Nov 2019 09:45:35 -0500
Message-ID: <CADnq5_PUgfHjvwYiYO26aTKMUAShGD5jQ=bSL+-is2Ws17BMGQ@mail.gmail.com>
Subject: Re: radeon UBSAN warning from user syscall
To: Meelis Roos <mroos@linux.ee>
Content-Type: multipart/mixed; boundary="000000000000869a5e059840efdb"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/t8Zi+5PgFFl1P/jVhGM7Y3bmRaQSmL6LZ28gmOon1s=;
 b=l/dkERRgN7Bes+LBozrM4+hDK50h/5+7u9QvXBrPFbdY43ImGZBP13zx3SF+sLPUZZ
 ltmO4az7T4KdI21xfspS35+4pccCERc7vElJVcH5KCsFaAKruCyPDXdSJvkvmfaAO8xk
 Siva8BxQvGXEwPlT9Z31eT+3Qk5aQC0wSFSqt98Oq6dDkQfqG8aG6Z7evkNrisHsh9Ns
 HzxrYgAoqa/9cvcfX66HVP/9gp6mWKyEjvCCI9OYGP0wcrMsD+bpVB+/r21gxhWUCh/u
 Hp3X1CLiInQIL+suLCbMpzMC3bz3DoQo/CeqiZksEMzLyJXQVJ8jnftf1vIh9O6MlINk
 ebkQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000869a5e059840efdb
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 26, 2019 at 3:39 AM Meelis Roos <mroos@linux.ee> wrote:
>
> I tried latest (5.4) custom kernel (with UBSAN) on my Dell D600 laptop and found that it exhibits a
> UBSAN warning triggered by userspace ioctl. Here is dmesg with anything radeon-related + the warning, and config:
>
> [   17.659534] [drm] radeon kernel modesetting enabled.
> [   17.659607] radeon 0000:01:00.0: remove_conflicting_pci_framebuffers: bar 0: 0xe8000000 -> 0xefffffff
> [   17.659609] radeon 0000:01:00.0: remove_conflicting_pci_framebuffers: bar 2: 0xfcff0000 -> 0xfcffffff
> [   17.659613] radeon 0000:01:00.0: vgaarb: deactivate vga console
> [   17.661629] Console: switching to colour dummy device 80x25
> [   17.667764] [drm] initializing kernel modesetting (RV250 0x1002:0x4C66 0x1028:0x011D 0x01).
> [   17.667822] resource sanity check: requesting [mem 0x000c0000-0x000dffff], which spans more than PCI Bus 0000:00 [mem 0x000d0000-0x000dffff window]
> [   17.667832] caller pci_map_rom+0x6d/0x19a mapping multiple BARs
> [   17.668236] agpgart-intel 0000:00:00.0: AGP 2.0 bridge
> [   17.668246] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
> [   17.668269] radeon 0000:01:00.0: putting AGP V2 device into 4x mode
> [   17.668291] radeon 0000:01:00.0: GTT: 128M 0xE0000000 - 0xE7FFFFFF
> [   17.668299] radeon 0000:01:00.0: VRAM: 128M 0x00000000E8000000 - 0x00000000EFFFFFFF (32M used)
> [   17.668336] [drm] Detected VRAM RAM=128M, BAR=128M
> [   17.668337] [drm] RAM width 64bits DDR
> [   17.681858] [TTM] Zone  kernel: Available graphics memory: 412324 KiB
> [   17.681861] [TTM] Initializing pool allocator
> [   17.681868] [TTM] Initializing DMA pool allocator
> [   17.681905] [drm] radeon: 32M of VRAM memory ready
> [   17.681907] [drm] radeon: 128M of GTT memory ready.
> [   17.681918] [drm] radeon: power management initialized
> [   17.685726] radeon 0000:01:00.0: WB disabled
> [   17.685735] radeon 0000:01:00.0: fence driver on ring 0 use gpu addr 0x00000000e0000000 and cpu addr 0x116c2780
> [   17.685738] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [   17.685739] [drm] Driver supports precise vblank timestamp query.
> [   17.685755] [drm] radeon: irq initialized.
> [   17.685758] [drm] Loading R200 Microcode
> [   17.788181] [drm] radeon: ring at 0x00000000E0001000
> [   17.788207] [drm] ring test succeeded in 1 usecs
> [   17.788379] [drm] ib test succeeded in 0 usecs
> [   17.788845] [drm] Panel ID String: 2K077 141X13
>
> [   17.788846] [drm] Panel Size 1024x768
> [   17.788880] [drm] No TV DAC info found in BIOS
> [   17.788912] [drm] Radeon Display Connectors
> [   17.788913] [drm] Connector 0:
> [   17.788914] [drm]   VGA-1
> [   17.788916] [drm]   DDC: 0x60 0x60 0x60 0x60 0x60 0x60 0x60 0x60
> [   17.788917] [drm]   Encoders:
> [   17.788918] [drm]     CRT1: INTERNAL_DAC1
> [   17.788920] [drm] Connector 1:
> [   17.788920] [drm]   DVI-D-1
> [   17.788921] [drm]   HPD1
> [   17.788923] [drm]   DDC: 0x64 0x64 0x64 0x64 0x64 0x64 0x64 0x64
> [   17.788923] [drm]   Encoders:
> [   17.788924] [drm]     DFP1: INTERNAL_TMDS1
> [   17.788925] [drm] Connector 2:
> [   17.788925] [drm]   LVDS-1
> [   17.788926] [drm]   Encoders:
> [   17.788927] [drm]     LCD1: INTERNAL_LVDS
> [   17.788927] [drm] Connector 3:
> [   17.788928] [drm]   SVIDEO-1
> [   17.788929] [drm]   Encoders:
> [   17.788929] [drm]     TV1: INTERNAL_DAC2
> [   17.957500] [drm] fb mappable at 0xE8040000
> [   17.957503] [drm] vram apper at 0xE8000000
> [   17.957504] [drm] size 1572864
> [   17.957505] [drm] fb depth is 16
> [   17.957505] [drm]    pitch is 2048
> [   18.013861] fbcon: radeondrmfb (fb0) is primary device
> [   18.566984] Console: switching to colour frame buffer device 128x48
> [   18.576250] radeon 0000:01:00.0: fb0: radeondrmfb frame buffer device
> [   18.577844] [drm] Initialized radeon 2.50.0 20080528 for 0000:01:00.0 on minor 0
> [   64.194226] ================================================================================
> [   64.194238] UBSAN: Undefined behaviour in drivers/gpu/drm/radeon/r200.c:480:34
> [   64.194244] shift exponent 4096 is too large for 32-bit type 'int'
> [   64.194248] CPU: 0 PID: 447 Comm: Xorg Not tainted 5.4.0 #16
> [   64.194249] Hardware name: Dell Computer Corporation Latitude D600                   /0X2034, BIOS A16 06/29/2005
> [   64.194251] Call Trace:
> [   64.194266]  dump_stack+0x16/0x19
> [   64.194272]  ubsan_epilogue+0xb/0x29
> [   64.194274]  __ubsan_handle_shift_out_of_bounds.cold+0x26/0x78
> [   64.194368]  ? radeon_cs_packet_next_reloc+0x3c/0x170 [radeon]
> [   64.194403]  ? r100_reloc_pitch_offset+0x27/0x140 [radeon]
> [   64.194433]  r200_packet0_check.cold+0x5e/0x63 [radeon]
> [   64.194473]  ? r200_copy_dma+0x430/0x430 [radeon]
> [   64.194508]  r100_cs_parse_packet0+0x53/0xe0 [radeon]
> [   64.194543]  r100_cs_parse+0x2de/0x4b0 [radeon]
> [   64.194583]  ? r200_copy_dma+0x430/0x430 [radeon]
> [   64.194617]  radeon_cs_ioctl+0x305/0x890 [radeon]
> [   64.194626]  ? ttm_bo_init_reserved+0x2f0/0x390 [ttm]
> [   64.194662]  ? radeon_cs_parser_init+0x550/0x550 [radeon]
> [   64.194689]  drm_ioctl_kernel+0x8b/0xd0 [drm]
> [   64.194724]  ? radeon_cs_parser_init+0x550/0x550 [radeon]
> [   64.194735]  drm_ioctl+0x249/0x4f0 [drm]
> [   64.194740]  ? ttm_bo_vm_fault+0xce/0x5a0 [ttm]
> [   64.194774]  ? radeon_cs_parser_init+0x550/0x550 [radeon]
> [   64.194780]  ? ktime_get_mono_fast_ns+0xbe/0x200
> [   64.194805]  radeon_drm_ioctl+0x40/0x80 [radeon]
> [   64.194829]  ? radeon_pmops_resume+0x60/0x60 [radeon]
> [   64.194833]  do_vfs_ioctl+0x3fc/0x6b0
> [   64.194838]  ? vm_mmap_pgoff+0x86/0xd0
> [   64.194845]  ? add_sysfs_fw_map_entry+0x8c/0x8c
> [   64.194847]  ksys_ioctl+0x37/0x70
> [   64.194849]  sys_ioctl+0x11/0x13
> [   64.194852]  do_fast_syscall_32+0x95/0x240
> [   64.194857]  entry_SYSENTER_32+0xa9/0xfb
> [   64.194859] EIP: 0xb7ef29a9
> [   64.194862] Code: 5d c3 8d b4 26 00 00 00 00 b8 00 09 3d 00 eb b4 8b 04 24 c3 8b 14 24 c3 8b 1c 24 c3 8b 34 24 c3 90 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90 8d 76
> [   64.194864] EAX: ffffffda EBX: 0000000e ECX: c0206466 EDX: 0145cb10
> [   64.194866] ESI: 0145c8d0 EDI: c0206466 EBP: 0000000e ESP: bff7a708
> [   64.194867] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00203292
> [   64.194869] ================================================================================

Looks like the shift and mask are reversed.  Does this patch fix it?

Alex

--000000000000869a5e059840efdb
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-radeon-fix-r1xx-r2xx-register-checker-for-POT-te.patch"
Content-Disposition: attachment; 
	filename="0001-drm-radeon-fix-r1xx-r2xx-register-checker-for-POT-te.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k3fz2m140>
X-Attachment-Id: f_k3fz2m140

RnJvbSA1MDBlOWFhMTM3OWQ1YTAxMmU0MmFhNzA5MjllMjk0N2U0ZmEzNzUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFR1ZSwgMjYgTm92IDIwMTkgMDk6NDE6NDYgLTA1MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vcmFkZW9uOiBmaXggcjF4eC9yMnh4IHJlZ2lzdGVyIGNoZWNrZXIgZm9yIFBPVCB0ZXh0
dXJlcwoKU2hpZnQgYW5kIG1hc2sgd2VyZSByZXZlcnNlZC4gIE5vdGljZWQgYnkgY2hhbmNlLgoK
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjEwMC5jIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3IyMDAuYyB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
MTAwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3IxMDAuYwppbmRleCA3MDg5ZGZjOGMyYTku
LjFjY2VlNGU1ODgwZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yMTAwLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yMTAwLmMKQEAgLTE4MjYsOCArMTgyNiw4IEBA
IHN0YXRpYyBpbnQgcjEwMF9wYWNrZXQwX2NoZWNrKHN0cnVjdCByYWRlb25fY3NfcGFyc2VyICpw
LAogCQkJdHJhY2stPnRleHR1cmVzW2ldLnVzZV9waXRjaCA9IDE7CiAJCX0gZWxzZSB7CiAJCQl0
cmFjay0+dGV4dHVyZXNbaV0udXNlX3BpdGNoID0gMDsKLQkJCXRyYWNrLT50ZXh0dXJlc1tpXS53
aWR0aCA9IDEgPDwgKChpZHhfdmFsdWUgPj4gUkFERU9OX1RYRk9STUFUX1dJRFRIX1NISUZUKSAm
IFJBREVPTl9UWEZPUk1BVF9XSURUSF9NQVNLKTsKLQkJCXRyYWNrLT50ZXh0dXJlc1tpXS5oZWln
aHQgPSAxIDw8ICgoaWR4X3ZhbHVlID4+IFJBREVPTl9UWEZPUk1BVF9IRUlHSFRfU0hJRlQpICYg
UkFERU9OX1RYRk9STUFUX0hFSUdIVF9NQVNLKTsKKwkJCQkJCXRyYWNrLT50ZXh0dXJlc1tpXS53
aWR0aCA9IDEgPDwgKChpZHhfdmFsdWUgJiBSQURFT05fVFhGT1JNQVRfV0lEVEhfTUFTSykgPj4g
UkFERU9OX1RYRk9STUFUX1dJRFRIX1NISUZUKTsKKwkJCXRyYWNrLT50ZXh0dXJlc1tpXS5oZWln
aHQgPSAxIDw8ICgoaWR4X3ZhbHVlICYgUkFERU9OX1RYRk9STUFUX0hFSUdIVF9NQVNLKSA+PiBS
QURFT05fVFhGT1JNQVRfSEVJR0hUX1NISUZUKTsKIAkJfQogCQlpZiAoaWR4X3ZhbHVlICYgUkFE
RU9OX1RYRk9STUFUX0NVQklDX01BUF9FTkFCTEUpCiAJCQl0cmFjay0+dGV4dHVyZXNbaV0udGV4
X2Nvb3JkX3R5cGUgPSAyOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yMjAw
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3IyMDAuYwppbmRleCA4NDA0MDE0MTNjNTguLmY1
ZjJmZmVhNWFiMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yMjAwLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yMjAwLmMKQEAgLTQ3Niw4ICs0NzYsOCBAQCBpbnQg
cjIwMF9wYWNrZXQwX2NoZWNrKHN0cnVjdCByYWRlb25fY3NfcGFyc2VyICpwLAogCQkJdHJhY2st
PnRleHR1cmVzW2ldLnVzZV9waXRjaCA9IDE7CiAJCX0gZWxzZSB7CiAJCQl0cmFjay0+dGV4dHVy
ZXNbaV0udXNlX3BpdGNoID0gMDsKLQkJCXRyYWNrLT50ZXh0dXJlc1tpXS53aWR0aCA9IDEgPDwg
KChpZHhfdmFsdWUgPj4gUkFERU9OX1RYRk9STUFUX1dJRFRIX1NISUZUKSAmIFJBREVPTl9UWEZP
Uk1BVF9XSURUSF9NQVNLKTsKLQkJCXRyYWNrLT50ZXh0dXJlc1tpXS5oZWlnaHQgPSAxIDw8ICgo
aWR4X3ZhbHVlID4+IFJBREVPTl9UWEZPUk1BVF9IRUlHSFRfU0hJRlQpICYgUkFERU9OX1RYRk9S
TUFUX0hFSUdIVF9NQVNLKTsKKwkJCXRyYWNrLT50ZXh0dXJlc1tpXS53aWR0aCA9IDEgPDwgKChp
ZHhfdmFsdWUgJiBSQURFT05fVFhGT1JNQVRfV0lEVEhfTUFTSykgPj4gUkFERU9OX1RYRk9STUFU
X1dJRFRIX1NISUZUKTsKKwkJCXRyYWNrLT50ZXh0dXJlc1tpXS5oZWlnaHQgPSAxIDw8ICgoaWR4
X3ZhbHVlICYgUkFERU9OX1RYRk9STUFUX0hFSUdIVF9NQVNLKSA+PiBSQURFT05fVFhGT1JNQVRf
SEVJR0hUX1NISUZUKTsKIAkJfQogCQlpZiAoaWR4X3ZhbHVlICYgUjIwMF9UWEZPUk1BVF9MT09L
VVBfRElTQUJMRSkKIAkJCXRyYWNrLT50ZXh0dXJlc1tpXS5sb29rdXBfZGlzYWJsZSA9IHRydWU7
Ci0tIAoyLjIzLjAKCg==
--000000000000869a5e059840efdb
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--000000000000869a5e059840efdb--
