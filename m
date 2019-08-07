Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F27C85317
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 20:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACF96E759;
	Wed,  7 Aug 2019 18:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCB46E757;
 Wed,  7 Aug 2019 18:42:30 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id n11so89386225qtl.5;
 Wed, 07 Aug 2019 11:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6JF0JpfpWnYJ7LeS8tHF/WudXM8ckd9/w0E867zQqNs=;
 b=jWyT03RT74qRBWfCRLOzN5Ta6kqT/49MJmr8h1Kml95tPz3/5dBFcgFub5/SUouAid
 md74SH3ORLR/CyELc73CquEMbCXF9bjCKuh3ipA8WoGp26ATNPWfsbU0V/u08wcF3WHZ
 aP1oZCV6lDQjOctypESoeKAaHhimErtRWc7fHvVxMsHJrwiRxGN87SSeo3lkL4FkTtYq
 B7F6qWiPno/pIPjgMfl8rKSQf5wfX9HT+g5KU83KmEubNxj+uMo/m/Z6qnpEkyxhPMK6
 gKIpRF0A7LiWZa22F82oFE/hYGnA1MIK84jTbRpjtvlYxJVJ5ezvzrYXurTJWNXlGjwB
 V7bQ==
X-Gm-Message-State: APjAAAXwSa9OwWGFvrKgATdKQBp4gXhk7q2KPr29mxgUMHC1MRufAT4U
 ZAIdb9bGpfnIH77M9uiRTpfFHg0Ys6Q=
X-Google-Smtp-Source: APXvYqyDMGrs5DeNZ82xhkVSRltDUZP3iHeA1gzhKUcUr51qZs01usV5L2LAJyFIYtpt7MOd7r/BxQ==
X-Received: by 2002:a0c:a8d2:: with SMTP id h18mr9680486qvc.16.1565203349286; 
 Wed, 07 Aug 2019 11:42:29 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id 2sm47957534qtz.73.2019.08.07.11.42.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 11:42:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-fixes-5.3
Date: Wed,  7 Aug 2019 13:42:21 -0500
Message-Id: <20190807184221.3323-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6JF0JpfpWnYJ7LeS8tHF/WudXM8ckd9/w0E867zQqNs=;
 b=SRuGA+ZCuwjoRovtu1V3PML6ApdXs9nS6RyZ2t7SWRJIQvUB9Qm193V0FqfJ/isjbZ
 ZMrKpfhryi33Th9zCcGDTb2NzFNo/Olt77ewYvB2WQ0x7ylXG1OMPSqqgJiYbr+x4V/U
 bd+czIbSzoalyhMrUNM9NQKY0ZTMq/NqnEPBb/LGRLWedxu1bMDov6qwjFOxQM/xWdRi
 Q0U6w2hIrQDhz02hQAvPIaClwxG+3D4mNdassAKk22C5PHPJje2T6mWfZvih99IFibsJ
 4Ug+gyY8dGXZDgYanyZbzmF2kwuvXmtpzKlCup4bRjUL/X+rYbarCiT4Yp0OiiLZLOm8
 gd4g==
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

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuMy4gIE5vdGhpbmcgdG9vIG1ham9yIGJ1Zy13
aXNlLiAgSSdtIHJldmVydGluZyB0aGUga2ZkIEdXUyBpb2N0bAp0aGF0IHdhcyBhZGRlZCB0aGlz
IGN5Y2xlLiAgQWZ0ZXIgd29ya2luZyB3aXRoIGl0IGZvciBhIHdoaWxlIHRoZSBrZmQgdGVhbQpk
ZWNpZGVkIGl0IHdhc24ndCBxdWl0ZSByaWdodC4gIEkgc2hvdWxkIGhhdmUgYmVlbiBzdHJpY3Rl
ciB3aXRoIGl0IGluIHRoZQpiZWdpbm5pbmcuIFJldmVydCBpdC4KClRoZSBmb2xsb3dpbmcgY2hh
bmdlcyBzaW5jZSBjb21taXQgOWM4YzljN2NkYjRjOGZiNDhhMmJjNzBmNDFhMDc5MjBmNzYxZDJj
ZDoKCiAgTWVyZ2UgdGFnICdleHlub3MtZHJtLWZpeGVzLWZvci12NS4zLXJjMycgb2YgZ2l0Oi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2RhZWlua2kvZHJtLWV4eW5v
cyBpbnRvIGRybS1maXhlcyAoMjAxOS0wOC0wMiAxNzoxMDoxNyArMDIwMCkKCmFyZSBhdmFpbGFi
bGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Au
b3JnL35hZ2Q1Zi9saW51eCB0YWdzL2RybS1maXhlcy01LjMtMjAxOS0wOC0wNwoKZm9yIHlvdSB0
byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDRiM2UzMGVkM2VjNzg2NGU3OTg0MDNhNjNmZjJlOTZiZDBj
MTlhYjA6CgogIFJldmVydCAiZHJtL2FtZGtmZDogTmV3IElPQ1RMIHRvIGFsbG9jYXRlIHF1ZXVl
IEdXUyIgKDIwMTktMDgtMDcgMTA6MjE6MzggLTA1MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRybS1maXhlcy01LjMt
MjAxOS0wOC0wNzoKCmFtZGdwdToKLSBGaXhlcyBWQ04gdG8gaGFuZGxlIHRoZSBsYXRlc3QgbmF2
aTEwIGZpcm13YXJlCi0gRml4ZXMgZm9yIGZhbiBjb250cm9sIG9uIG5hdmkxMAotIFByb3Blcmx5
IGhhbmRsZSBTTVUgbWV0cmljcyB0YWJsZSBvbiBuYXZpMTAKLSBGaXggYSByZXN1bWUgcmVncmVz
c2lvbiBvbiBTdG9uZXkKCmFtZGtmZDoKLSBSZXZlcnQgbmV3IEdXUyBpb2N0bC4gIEl0J3Mgbm90
IHJlYWR5LgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpBbGV4IERldWNoZXIgKDEpOgogICAgICBSZXZlcnQgImRybS9hbWRr
ZmQ6IE5ldyBJT0NUTCB0byBhbGxvY2F0ZSBxdWV1ZSBHV1MiCgpFdmFuIFF1YW4gKDEpOgogICAg
ICBkcm0vYW1kL3Bvd2VycGxheTogY29ycmVjdCBuYXZpMTAgdmNuIHBvd2VyZ2F0ZQoKS2V2aW4g
V2FuZyAoMSk6CiAgICAgIGRybS9hbWQvcG93ZXJwbGF5OiBob25vciBodyBsaW1pdCBvbiBmZXRj
aGluZyBtZXRyaWNzIGRhdGEgZm9yIG5hdmkxMAoKTGlrdW4gR2FvICgxKToKICAgICAgZHJtL2Ft
ZGdwdTogcGluIHRoZSBjc2IgYnVmZmVyIG9uIGh3IGluaXQgZm9yIGdmeCB2OAoKTWFyZWsgT2zF
ocOhayAoMSk6CiAgICAgIFJldmVydCAiZHJtL2FtZGdwdTogZml4IHRyYW5zZm9ybSBmZWVkYmFj
ayBHRFMgaGFuZyBvbiBnZngxMCAodjIpIgoKTWF0dCBDb2ZmaW4gKDEpOgogICAgICBkcm0vYW1k
L3Bvd2VycGxheTogQWxsb3cgY2hhbmdpbmcgb2YgZmFuX2NvbnRyb2wgaW4gc211X3YxMV8wCgpU
aG9uZyBUaGFpICgyKToKICAgICAgZHJtL2FtZC9hbWRncHUvdmNuX3YyXzA6IE1hcmsgUkIgY29t
bWFuZHMgYXMgS01EIGNvbW1hbmRzCiAgICAgIGRybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wOiBNb3Zl
IFZDTiAyLjAgc3BlY2lmaWMgZGVjIHJpbmcgdGVzdCB0byB2Y25fdjJfMAoKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZHMuaCAgICAgICAgfCAgMSAtCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmggICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgICAgICAgICB8IDEyICstLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMgICAgICAgICAgfCA0MCArKysrKysrKysrKysrCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jICAgICAgICAgIHwgNDQgKysrKysrKysr
KystLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMgICAgICAgfCAy
OCAtLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyAg
ICAgfCAgNCArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUu
aCB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyAgICAg
fCA3OSArKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvc211X3YxMV8wLmMgICAgICB8ICAyICstCiBpbmNsdWRlL3VhcGkvbGludXgva2ZkX2lv
Y3RsLmggICAgICAgICAgICAgICAgIHwgMjAgKy0tLS0tLQogMTEgZmlsZXMgY2hhbmdlZCwgMTM4
IGluc2VydGlvbnMoKyksIDk0IGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
