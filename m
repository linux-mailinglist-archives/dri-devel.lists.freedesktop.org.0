Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A35430EE76
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E62B6ED0B;
	Thu,  4 Feb 2021 08:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB9D6EBA0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 19:53:53 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id x71so1139220oia.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 11:53:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=rJtZNrYrmVI0rQ9nhl6JiZvzCggCKb0CLguL81DdNqI=;
 b=XD2w22czvSJQpG22gh1aoeqkYQJOmLy3Ehh9ZYLx+AqZyt8/HH7SJ757bOMv5eY4tE
 2p51nOoVuKxW9Yp1cbupTDNUzXVT/39ZKUOHNk7vdoiSUyQLWcRUV3zBxcHagjz1ABHn
 uG2vKacb2e80uvHnVbYwsg8TUsg67gaapvwv6tVmKLj7K0nEpC7PlExPgL98PqVg0LC3
 +vw+ZgPEcW1UiG3jMnh0nTnbRAqOoY13apTQoPayiaoUoFpLveioU1SQpxu8AkDTU2VH
 +EVYwpakEGY6P8QdfyTgyLw4JyPweFGdVs/jGSfO+xjU0vcVbEY0rPYQUH2D0uRHkR/T
 Si5g==
X-Gm-Message-State: AOAM531wfVSZM1hckCI5jys754u44Xz3Cd35qjEv9IrOlB9QQGg7CYaC
 uSRJgWO1lBw5ept0e/fVE03CE8ZkPd6pbg==
X-Google-Smtp-Source: ABdhPJxlto25mU2z/+orYVrD1BLOTT58/zTXPkYeQDCpNY94ia/nUefliayEPJYDDwsKy9PsRgA+5g==
X-Received: by 2002:aca:d883:: with SMTP id p125mr3084118oig.114.1612382033105; 
 Wed, 03 Feb 2021 11:53:53 -0800 (PST)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
 [209.85.210.49])
 by smtp.gmail.com with ESMTPSA id f7sm631350oop.9.2021.02.03.11.53.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 11:53:52 -0800 (PST)
Received: by mail-ot1-f49.google.com with SMTP id s107so1043974otb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 11:53:52 -0800 (PST)
X-Received: by 2002:a05:6830:2434:: with SMTP id
 k20mr3182923ots.169.1612382032280; 
 Wed, 03 Feb 2021 11:53:52 -0800 (PST)
MIME-Version: 1.0
From: Toni Spets <toni.spets@iki.fi>
Date: Wed, 3 Feb 2021 21:53:40 +0200
X-Gmail-Original-Message-ID: <CAM+GfYH16EhimL6pYpgD1jutMoL6Ai2dAWQs=j71GqXbrm9J=A@mail.gmail.com>
Message-ID: <CAM+GfYH16EhimL6pYpgD1jutMoL6Ai2dAWQs=j71GqXbrm9J=A@mail.gmail.com>
Subject: [PATCH] drm/rockchip: remove atomic helper dirtyfb
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="00000000000046dd8b05ba73f2dd"
X-Mailman-Approved-At: Thu, 04 Feb 2021 08:32:37 +0000
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
Cc: Sandy Huang <hjc@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000046dd8b05ba73f2dd
Content-Type: multipart/alternative; boundary="00000000000046dd8905ba73f2db"

--00000000000046dd8905ba73f2db
Content-Type: text/plain; charset="UTF-8"

The blocking implementation of the dirtyfb ioctl is extremely slow when
used for damage tracking on RK3399. If this implementation is in place Xorg
will default to using it and will slow down considerably when doing a lot
of small draws. This is most apparent with the fvwm window manager on
startup where it will almost lock up for many seconds seconds on RK3399.

Removing this implementation did not cause any visible issues on RK3399 but
it did fix the performance issues on Xorg as it will disable damage
tracking when the ioctl returns it's not supported.

-- 
Toni Spets

--00000000000046dd8905ba73f2db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The blocking implementation of the dirtyfb ioctl is e=
xtremely slow when used for damage tracking on RK3399. If this implementati=
on is in place Xorg will default to using it and will slow down considerabl=
y when doing a lot of small draws. This is most apparent with the fvwm wind=
ow manager on startup where it will almost lock up for many seconds seconds=
 on RK3399.<br></div><div><br></div><div>Removing this implementation did n=
ot cause any visible issues on RK3399 but it did fix the performance issues=
 on Xorg as it will disable damage tracking when the ioctl returns it&#39;s=
 not supported.<br></div><div><div><br>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature" data-smartmail=3D"gmail_signature">Toni Spets</div></div></di=
v></div>

--00000000000046dd8905ba73f2db--

--00000000000046dd8b05ba73f2dd
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-rockchip-remove-atomic-helper-dirtyfb.patch"
Content-Disposition: attachment; 
	filename="0001-drm-rockchip-remove-atomic-helper-dirtyfb.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kkpttsli0>
X-Attachment-Id: f_kkpttsli0

RnJvbSA3OTk4NGVlNjdjODAxZjU1MmU5ZWFmNGQwY2ZiNjIxMDFkMWYwZjJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUb25pIFNwZXRzIDx0b25pLnNwZXRzQGlraS5maT4KRGF0ZTog
V2VkLCAzIEZlYiAyMDIxIDIxOjE0OjUwICswMjAwClN1YmplY3Q6IFtQQVRDSF0gZHJtL3JvY2tj
aGlwOiByZW1vdmUgYXRvbWljIGhlbHBlciBkaXJ0eWZiCgotLS0KIGRyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJt
X2ZiLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMKaW5kZXgg
M2FhMzdlMTc3NjY3Li4yNTU0ZmQxYzhhZWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
cm9ja2NoaXBfZHJtX2ZiLmMKQEAgLTIxLDcgKzIxLDYgQEAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzIHJvY2tjaGlwX2RybV9mYl9mdW5jcyA9IHsKIAkuZGVzdHJv
eSAgICAgICA9IGRybV9nZW1fZmJfZGVzdHJveSwKIAkuY3JlYXRlX2hhbmRsZSA9IGRybV9nZW1f
ZmJfY3JlYXRlX2hhbmRsZSwKLQkuZGlydHkJICAgICAgID0gZHJtX2F0b21pY19oZWxwZXJfZGly
dHlmYiwKIH07CiAKIHN0YXRpYyBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICoKLS0gCjIuMjcuMAoK
--00000000000046dd8b05ba73f2dd
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--00000000000046dd8b05ba73f2dd--
