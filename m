Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDCF27136
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 22:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CD689C29;
	Wed, 22 May 2019 20:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB0E89C1F;
 Wed, 22 May 2019 20:54:37 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id i26so4143493qtr.10;
 Wed, 22 May 2019 13:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mrnPm9ahvNjNxnz5KaPS6mQ7ZaTt/HK7yE28/LEAzxA=;
 b=f7NNP78I2K050pI8z3PaAUxRGnRs9IyM7IIsjVUTUIRjq519/sD8oOQVVZ1QL28cqy
 ymRDXZzFLi73fwvV8rQbEKGeP/YigG36cnrd2vNqFzX701ueDw7xDfltgrZ7VzmxgSOQ
 qboct2G5GGOaibmziir43a7Dy2dpa7h7G3F8ogNyXUCTYyBPsLuFxm2BlSt30ZCyOn2+
 FwkktdZTHdc8k5h8fI2cFnY3ggyjuvHlhtlWGn8rMUyaKKzQb3zos7P68ihiPJAUkrl2
 tv1+/CfzbcZtM0K/MTIxDnlw6yTUUD1dsUm+kNVQ2smuJ7+wbe8OiIJLaDe04VaoFTDG
 WcjQ==
X-Gm-Message-State: APjAAAVwIQ/1q2d5rlPEQphBTlA7CMoyQdC0xmWrbLH//d+HoTmuu+sW
 I/EVC6Ixw4HnuYzxn1y+sz/adJ0Z
X-Google-Smtp-Source: APXvYqz4z1238q63jl4uY9B/ewILs+aiSXJT6IiiGclLsT7QW5V4ME3P3RqTZGvoCVfzgZVDioFgjQ==
X-Received: by 2002:ac8:444b:: with SMTP id m11mr57425530qtn.68.1558558476918; 
 Wed, 22 May 2019 13:54:36 -0700 (PDT)
Received: from localhost.localdomain ([71.219.72.228])
 by smtp.gmail.com with ESMTPSA id r129sm12472186qkb.9.2019.05.22.13.54.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 22 May 2019 13:54:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-fixes-5.2
Date: Wed, 22 May 2019 15:54:25 -0500
Message-Id: <20190522205425.3657-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mrnPm9ahvNjNxnz5KaPS6mQ7ZaTt/HK7yE28/LEAzxA=;
 b=MNi8a6cGX0TRgN4olXAkjs9s5tNIj6OeoWqVsvW14OFBo6dyGwpyRqwSPVsY95dCTY
 6MkOTkbar+btdoVXeZpwkrU7o54fWrBvOWpi+nmpDc6UrzY9SHFP/sGkQSqLvNOBCceq
 pDji4H3HI+3g9z5SaxMEdODKoRoicsyMrDoFvjWxVBL64QSEKe4QlR1ioJkiI7AW9X9K
 rVdypqNItkFvMTimZZNPsCyP/vqLu6zoUaUEl/ZbR+jK7zKBQK/Av5S/hwnD2GYXnKFJ
 z8bAGNKvRTWUmHleWW6efbXgcR1vgPYTlXLs2uRV2pwhMU1m5nhJfdX+69b0IsmwCgjK
 C9TA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuMjoKLSBGaXggZm9yIERNQ1UgZmlybXdhcmUg
aXNzdWVzIGZvciBzdGFibGUKLSBBZGQgbWlzc2luZyBwb2xhcmlzMTAgcGNpIGlkIHRvIGtmZAot
IFNjcmVlbiBjb3JydXB0aW9uIGZpeCBvbiBwaWNhc3NvCi0gRml4IGZvciBkcml2ZXIgcmVsb2Fk
IG9uIHZlZ2ExMAotIFNSLUlPViBmaXhlcwotIExvY2tpbmcgZml4IGluIG5ldyBTTVUgY29kZQot
IENvbXB1dGUgcHJvZmlsZSBzd2l0Y2hpbmcgZml4IGZvciBLRkQKClRoZSBmb2xsb3dpbmcgY2hh
bmdlcyBzaW5jZSBjb21taXQgYTE4ODMzOWNhNWEzOTZhY2M1ODhlNTg1MWVkN2UxOWY2NmIwZWJk
OToKCiAgTGludXggNS4yLXJjMSAoMjAxOS0wNS0xOSAxNTo0NzowOSAtMDcwMCkKCmFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0
b3Aub3JnL35hZ2Q1Zi9saW51eCBkcm0tZml4ZXMtNS4yCgpmb3IgeW91IHRvIGZldGNoIGNoYW5n
ZXMgdXAgdG8gNDNkODEwN2YwYmRjYWE0MzAwZTQwMjMxY2M0NWVjYmQxZjc3ZjczZjoKCiAgZHJt
L2FtZGtmZDogRml4IGNvbXB1dGUgcHJvZmlsZSBzd2l0Y2hpbmcgKDIwMTktMDUtMjAgMjE6MjI6
NDkgLTA1MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCkFsZXggRGV1Y2hlciAoMik6CiAgICAgIGRybS9hbWRncHUvc29j
MTU6IHNraXAgcmVzZXQgb24gaW5pdAogICAgICBkcm0vYW1kZ3B1L2dtYzk6IHNldCB2cmFtX3dp
ZHRoIHByb3Blcmx5IGZvciBTUi1JT1YKCkRhbiBDYXJwZW50ZXIgKDEpOgogICAgICBkcm0vYW1k
L3Bvd2VycGxheTogZml4IGxvY2tpbmcgaW4gc211X2ZlYXR1cmVfc2V0X3N1cHBvcnRlZCgpCgpG
bG9yYSBDdWkgKDEpOgogICAgICBkcm0vYW1kZ3B1OiBrZWVwIHN0b2xlbiBtZW1vcnkgb24gcGlj
YXNzbwoKSGFyaXNoIEthc2l2aXN3YW5hdGhhbiAoMSk6CiAgICAgIGRybS9hbWRrZmQ6IEZpeCBj
b21wdXRlIHByb2ZpbGUgc3dpdGNoaW5nCgpIYXJyeSBXZW50bGFuZCAoMik6CiAgICAgIGRybS9h
bWQvZGlzcGxheTogQWRkIEFTSUNSRVZfSVNfUElDQVNTTwogICAgICBkcm0vYW1kL2Rpc3BsYXk6
IERvbid0IGxvYWQgRE1DVSBmb3IgUmF2ZW4gMQoKS2VudCBSdXNzZWxsICgxKToKICAgICAgZHJt
L2FtZGtmZDogQWRkIG1pc3NpbmcgUG9sYXJpczEwIElECgpZaW50aWFuIFRhbyAoMSk6CiAgICAg
IGRybS9hbWRncHU6IHNraXAgZncgcHJpIGJvIGFsbG9jIGZvciBTUklPVgoKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyAgICAgICAgICAgICAgIHwgMTcgKysrKysrKysr
Ky0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICAgICAgICAg
ICAgICAgIHwgMTEgKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMgICAgICAgICAgICAgICAgICAgIHwgIDUgKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2UuYyAgICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIHwgMTEg
KysrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICAg
ICAgICAgICAgIHwgIDcgKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyAgICAgfCAxMiArKysrKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9pbmNsdWRlL2RhbF9hc2ljX2lkLmggICAgIHwgIDcgKysrKy0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jICAgICAgICAgICAgfCAgMiArLQog
OSBmaWxlcyBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
