Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA468D7163
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 19:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB1410E0CD;
	Sat,  1 Jun 2024 17:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K+icN19D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AB810E05B
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 17:45:21 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a63036f2daaso344648266b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jun 2024 10:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717263919; x=1717868719; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1vuCDbN/caROSmYnumlEKbQGmeff4pEof5WOx6aw0WM=;
 b=K+icN19DAas+Y2Qo+YPhQ6MDl3mXwyvhor4Y+ddhwyTFiH5PdsbJFBpWFC7IGFMAHR
 2Zv1ymn8H/naSFQR8BnN+yM3uSeV6jA0K9YchLI5BGkvZP+5g/dVlH5ijkPyK+RCQRfm
 Z4m1xcfyYCka8bbPV92jqMMdWNEPiTZ1QxuCEBe/dy4FrfwQ7mapzoGrTLrua1SpAOs8
 vAUJpYGS5pMLjBJ1z/rHJV/TIPeq4J14e72CInjhaFAYHpX/XvRKrlJ7uOy4NzCSxWu1
 zn3c9Jkch67Ha2uk5jImO7pirErDF/qfgSf5v5XX39eymFgvVyoZHqUrEPa1eKY12SXj
 5Dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717263919; x=1717868719;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1vuCDbN/caROSmYnumlEKbQGmeff4pEof5WOx6aw0WM=;
 b=GOgMbycwwORbhrm22s1rxWZI7puNg/JYg2yLOAs4SHrPbYDayMFHblLO9hNbI4G9Wd
 kvTWBGe4e8xatcfyTYkFe4KNvRslbPLlwiUYuS5Uxg1/Zm6bvUzf8wPz9ru8MuDeWEpn
 QBcczrk8syM+CpgTiwRSU1aTDQaXX1/RFocmGNQfWTO1MUGymAUERN4CedA+lgfufYmi
 6BZ29YsJ5+ERR0DL/VUsEiUrT6PrdpBCF8MRfihXdBS/Sk4fzjC1GZvnz31uY1o3Xsvu
 w/Y80zrc37cNhIDKcqyd9SWCCd12CPAVeluBL50JLlsNAlUirkVFiAOQ6IMuTGsaIjmN
 q/Hw==
X-Gm-Message-State: AOJu0Yw/8FgbL/gVZ8ogTDJ+QLGOPKUOrofVmxsgBDaAFdQXEwVHX8Af
 +Aq/CNHuyPSUbcXzmMQFTaAH1hpleXl/e9eDkXehpHQGdJL98FPm3+tH1km6wm50csmnDzRnan8
 tXyi2sgOvL8Gy2bXWbhikVJx4b0mJVRqn
X-Google-Smtp-Source: AGHT+IGHcpmZvyekS9s2//pqCpqJlHOX9S86U4F6VyA6WCK10mM8DKrVUrfV0ru55v3bN+6hw52+3aXBwI360P8AXrg=
X-Received: by 2002:a17:906:f6cd:b0:a68:5b93:594e with SMTP id
 a640c23a62f3a-a685b935b09mr261395266b.39.1717263919172; Sat, 01 Jun 2024
 10:45:19 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Sat, 1 Jun 2024 13:44:42 -0400
Message-ID: <CAAxE2A5RjFs3t_o0P2zKudNiQk05XYeSCMKPF5W6XJKDh5cBhg@mail.gmail.com>
Subject: [ANNOUNCE] libdrm 2.4.121
To: xorg-announce@lists.x.org
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="000000000000e36c9e0619d7a92c"
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

--000000000000e36c9e0619d7a92c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512


Adri=C3=A1n Larumbe (1):
      meson: make build system happy by replacing deprecated feature

David Heidelberg (1):
      include poll.h instead of sys/poll.h

David Rosca (1):
      amdgpu: Make amdgpu_device_deinitialize thread-safe

Dylan Baker (2):
      Revert "xf86drm: ignore symlinks in process_device()"
      xf86drm: Don't consider node names longer than the maximum allowed

Flora Cui (3):
      tests/amdgpu: fix compile warning with the guard enum value
      tests/amdgpu: fix compile error with gcc7.5
      tests/amdgpu: fix compile error with gcc14

Francesco Valla (1):
      tests/util: add tidss driver

Joaquim Monteiro (2):
      meson: Replace usages of deprecated ExternalProgram.path()
      meson: Fix broken str.format usage

Jonathan Gray (6):
      amdgpu: add marketing names from Adrenalin 23.11.1
      amdgpu: add marketing names from PRO Edition for W7700
      amdgpu: add marketing names from Windows Steam Deck OLED APU driver
      amdgpu: add marketing names from amd-6.0
      amdgpu: add marketing name for Radeon RX 6550M
      amdgpu: add marketing names from amd-6.0.1

Jos=C3=A9 Exp=C3=B3sito (1):
      amdgpu: Make amdgpu_cs_signal_semaphore() thread-safe

Marek Ol=C5=A1=C3=A1k (2):
      amdgpu: sync amdgpu_drm.h
      Bump version to 2.4.121

Matt Turner (2):
      symbols-check: Add _GLOBAL_OFFSET_TABLE_
      symbols-check: Add _fbss, _fdata, _ftext

Pierre-Eric Pelloux-Prayer (5):
      amdgpu: add amdgpu_va_manager
      amdgpu: expose amdgpu_va_manager publicly
      amdgpu: add amdgpu_va_range_alloc2
      amdgpu: add amdgpu_device_initialize2
      amdgpu: fix deinit logic

Simon Ser (3):
      ci: build with meson --fatal-meson-warnings
      ci: use "meson setup" sub-command
      xf86drm: document drmDevicesEqual()

Tobias Jakobi (1):
      xf86drm: ignore symlinks in process_device()

git tag: libdrm-2.4.121

https://dri.freedesktop.org/libdrm/libdrm-2.4.121.tar.xz
SHA256: 909084a505d7638887f590b70791b3bbd9069c710c948f5d1f1ce6d080cdfcab
 libdrm-2.4.121.tar.xz
SHA512: cc8816d61884caa0e404348d1caeb0b2952fb50e1dc401716adfe08121096e2a678=
26db0bda0d8b163d67c5ee048870177670d5eac28a5abe5792d09ba77ab2e
 libdrm-2.4.121.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.121.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEE86UtuOzp654zvEjGkXo+6XoPzRoFAmZbXJwACgkQkXo+6XoP
zRqHVwv+KRbbqQP2ahamI8S/7dedztW5SWX7BF1UqDzRik2YZfMBffhCzfGMW21U
ABSge4zDYyOtbL3DTod6BADaFsdpVnGDlhbAT9fpZi7RDtfQGfPl20+ZwYPCIAhP
9b91Yr8nJLFP6unUvgPX0IYQJdv7TD6Y3oqXrK/IsYOTXSiIEzqA0YJOc70AQU18
sgqArrctak1g67aI1XeFpdRjca2ZUqZwShigG+jQGeR0dsHC/A1HV7ilzF6MW2Mw
A9YO/i3SFrCoIzZC0zaaAO8MjGMPFgU+MIp/pkHBXNpkKa2rN7Yb/fEvuGhcDPy8
Ir/RFs53Gja3O4P4oBWYcHSifF/y+FOZddGCwrsRGkFgUEW7yBc++9fR242ChAOA
UhTJmUnxoxjpQ8JF5sfChu5fW3+rAzpeQOctDUskwHdSMyZj8BoThUWxq96p1S+w
CCRBDPNcw0rPwsnreijVFD/vJh2Kycq6Q9w8/uvFBkSM0m7hPgsH+RxmOJzOLga6
3TRyxV6a
=3D9Via
-----END PGP SIGNATURE-----

If gmail messed up the message, the original signed message for
signature verification is attached.

Marek

--000000000000e36c9e0619d7a92c
Content-Type: text/plain; charset="UTF-8"; name="announce.txt"
Content-Disposition: attachment; filename="announce.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_lwweikv70>
X-Attachment-Id: f_lwweikv70

LS0tLS1CRUdJTiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQpIYXNoOiBTSEE1MTIKCgpBZHJpw6Fu
IExhcnVtYmUgKDEpOgogICAgICBtZXNvbjogbWFrZSBidWlsZCBzeXN0ZW0gaGFwcHkgYnkgcmVw
bGFjaW5nIGRlcHJlY2F0ZWQgZmVhdHVyZQoKRGF2aWQgSGVpZGVsYmVyZyAoMSk6CiAgICAgIGlu
Y2x1ZGUgcG9sbC5oIGluc3RlYWQgb2Ygc3lzL3BvbGwuaAoKRGF2aWQgUm9zY2EgKDEpOgogICAg
ICBhbWRncHU6IE1ha2UgYW1kZ3B1X2RldmljZV9kZWluaXRpYWxpemUgdGhyZWFkLXNhZmUKCkR5
bGFuIEJha2VyICgyKToKICAgICAgUmV2ZXJ0ICJ4Zjg2ZHJtOiBpZ25vcmUgc3ltbGlua3MgaW4g
cHJvY2Vzc19kZXZpY2UoKSIKICAgICAgeGY4NmRybTogRG9uJ3QgY29uc2lkZXIgbm9kZSBuYW1l
cyBsb25nZXIgdGhhbiB0aGUgbWF4aW11bSBhbGxvd2VkCgpGbG9yYSBDdWkgKDMpOgogICAgICB0
ZXN0cy9hbWRncHU6IGZpeCBjb21waWxlIHdhcm5pbmcgd2l0aCB0aGUgZ3VhcmQgZW51bSB2YWx1
ZQogICAgICB0ZXN0cy9hbWRncHU6IGZpeCBjb21waWxlIGVycm9yIHdpdGggZ2NjNy41CiAgICAg
IHRlc3RzL2FtZGdwdTogZml4IGNvbXBpbGUgZXJyb3Igd2l0aCBnY2MxNAoKRnJhbmNlc2NvIFZh
bGxhICgxKToKICAgICAgdGVzdHMvdXRpbDogYWRkIHRpZHNzIGRyaXZlcgoKSm9hcXVpbSBNb250
ZWlybyAoMik6CiAgICAgIG1lc29uOiBSZXBsYWNlIHVzYWdlcyBvZiBkZXByZWNhdGVkIEV4dGVy
bmFsUHJvZ3JhbS5wYXRoKCkKICAgICAgbWVzb246IEZpeCBicm9rZW4gc3RyLmZvcm1hdCB1c2Fn
ZQoKSm9uYXRoYW4gR3JheSAoNik6CiAgICAgIGFtZGdwdTogYWRkIG1hcmtldGluZyBuYW1lcyBm
cm9tIEFkcmVuYWxpbiAyMy4xMS4xCiAgICAgIGFtZGdwdTogYWRkIG1hcmtldGluZyBuYW1lcyBm
cm9tIFBSTyBFZGl0aW9uIGZvciBXNzcwMAogICAgICBhbWRncHU6IGFkZCBtYXJrZXRpbmcgbmFt
ZXMgZnJvbSBXaW5kb3dzIFN0ZWFtIERlY2sgT0xFRCBBUFUgZHJpdmVyCiAgICAgIGFtZGdwdTog
YWRkIG1hcmtldGluZyBuYW1lcyBmcm9tIGFtZC02LjAKICAgICAgYW1kZ3B1OiBhZGQgbWFya2V0
aW5nIG5hbWUgZm9yIFJhZGVvbiBSWCA2NTUwTQogICAgICBhbWRncHU6IGFkZCBtYXJrZXRpbmcg
bmFtZXMgZnJvbSBhbWQtNi4wLjEKCkpvc8OpIEV4cMOzc2l0byAoMSk6CiAgICAgIGFtZGdwdTog
TWFrZSBhbWRncHVfY3Nfc2lnbmFsX3NlbWFwaG9yZSgpIHRocmVhZC1zYWZlCgpNYXJlayBPbMWh
w6FrICgyKToKICAgICAgYW1kZ3B1OiBzeW5jIGFtZGdwdV9kcm0uaAogICAgICBCdW1wIHZlcnNp
b24gdG8gMi40LjEyMQoKTWF0dCBUdXJuZXIgKDIpOgogICAgICBzeW1ib2xzLWNoZWNrOiBBZGQg
X0dMT0JBTF9PRkZTRVRfVEFCTEVfCiAgICAgIHN5bWJvbHMtY2hlY2s6IEFkZCBfZmJzcywgX2Zk
YXRhLCBfZnRleHQKClBpZXJyZS1FcmljIFBlbGxvdXgtUHJheWVyICg1KToKICAgICAgYW1kZ3B1
OiBhZGQgYW1kZ3B1X3ZhX21hbmFnZXIKICAgICAgYW1kZ3B1OiBleHBvc2UgYW1kZ3B1X3ZhX21h
bmFnZXIgcHVibGljbHkKICAgICAgYW1kZ3B1OiBhZGQgYW1kZ3B1X3ZhX3JhbmdlX2FsbG9jMgog
ICAgICBhbWRncHU6IGFkZCBhbWRncHVfZGV2aWNlX2luaXRpYWxpemUyCiAgICAgIGFtZGdwdTog
Zml4IGRlaW5pdCBsb2dpYwoKU2ltb24gU2VyICgzKToKICAgICAgY2k6IGJ1aWxkIHdpdGggbWVz
b24gLS1mYXRhbC1tZXNvbi13YXJuaW5ncwogICAgICBjaTogdXNlICJtZXNvbiBzZXR1cCIgc3Vi
LWNvbW1hbmQKICAgICAgeGY4NmRybTogZG9jdW1lbnQgZHJtRGV2aWNlc0VxdWFsKCkKClRvYmlh
cyBKYWtvYmkgKDEpOgogICAgICB4Zjg2ZHJtOiBpZ25vcmUgc3ltbGlua3MgaW4gcHJvY2Vzc19k
ZXZpY2UoKQoKZ2l0IHRhZzogbGliZHJtLTIuNC4xMjEKCmh0dHBzOi8vZHJpLmZyZWVkZXNrdG9w
Lm9yZy9saWJkcm0vbGliZHJtLTIuNC4xMjEudGFyLnh6ClNIQTI1NjogOTA5MDg0YTUwNWQ3NjM4
ODg3ZjU5MGI3MDc5MWIzYmJkOTA2OWM3MTBjOTQ4ZjVkMWYxY2U2ZDA4MGNkZmNhYiAgbGliZHJt
LTIuNC4xMjEudGFyLnh6ClNIQTUxMjogY2M4ODE2ZDYxODg0Y2FhMGU0MDQzNDhkMWNhZWIwYjI5
NTJmYjUwZTFkYzQwMTcxNmFkZmUwODEyMTA5NmUyYTY3ODI2ZGIwYmRhMGQ4YjE2M2Q2N2M1ZWUw
NDg4NzAxNzc2NzBkNWVhYzI4YTVhYmU1NzkyZDA5YmE3N2FiMmUgIGxpYmRybS0yLjQuMTIxLnRh
ci54egpQR1A6ICBodHRwczovL2RyaS5mcmVlZGVza3RvcC5vcmcvbGliZHJtL2xpYmRybS0yLjQu
MTIxLnRhci54ei5zaWcKCi0tLS0tQkVHSU4gUEdQIFNJR05BVFVSRS0tLS0tCgppUUd6QkFFQkNn
QWRGaUVFODZVdHVPenA2NTR6dkVqR2tYbys2WG9QelJvRkFtWmJYSndBQ2drUWtYbys2WG9QCnpS
cUhWd3YrS1JiYnFRUDJhaGFtSThTLzdkZWR6dFc1U1dYN0JGMVVxRHpSaWsyWVpmTUJmZmhDemZH
TVcyMVUKQUJTZ2U0ekRZeU90YkwzRFRvZDZCQURhRnNkcFZuR0RsaGJBVDlmcFppN1JEdGZRR2ZQ
bDIwK1p3WVBDSUFoUAo5YjkxWXI4bkpMRlA2dW5VdmdQWDBJWVFKZHY3VEQ2WTNvcVhySy9Jc1lP
VFhTaUlFenFBMFlKT2M3MEFRVTE4CnNncUFycmN0YWsxZzY3YUkxWGVGcGRSamNhMlpVcVp3U2hp
Z0cralFHZVIwZHNIQy9BMUhWN2lsekY2TVcyTXcKQTlZTy9pM1NGckNvSXpaQzB6YWFBTzhNakdN
UEZnVStNSXAvcGtIQlhOcGtLYTJyTjdZYi9mRXZ1R2hjRFB5OApJci9SRnM1M0dqYTNPNFA0b0JX
WWNIU2lmRi95K0ZPWmRkR0N3cnNSR2tGZ1VFVzd5QmMrKzlmUjI0MkNoQU9BClVoVEptVW54b3hq
cFE4SkY1c2ZDaHU1ZlczK3JBenBlUU9jdERVc2t3SGRTTXlaajhCb1RoVVd4cTk2cDFTK3cKQ0NS
QkRQTmN3MHJQd3NucmVpalZGRC92SmgyS3ljcTZROXc4L3V2RkJrU00wbTdoUGdzSCtSeG1PSnpP
TGdhNgozVFJ5eFY2YQo9OVZpYQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K
--000000000000e36c9e0619d7a92c--
