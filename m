Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA92881B58D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 13:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6049210E6A5;
	Thu, 21 Dec 2023 12:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842E610E6A5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 12:12:25 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a235eb41251so84547466b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 04:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703160744; x=1703765544; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=E4qv3jGP7gLEgZjUc+DCJ3ozSBiiDWwnXgsxwGglWH0=;
 b=hPOm+GUUVwNGOtbzFzzMFZBhE6jJ2NhpttOJ76cdOzbQeU6MHr9RUucU8h8kBX5QMv
 kUv1Gq0TvaongSBI1P25p1UV3JOAldIQQjDaHlxuG3lJwJK3ZBeAbDGTci9pP535yQtv
 6pAQvFkKXKszGSusjGgcZDFrx8L79LNi6K6O+QL4ROlaJo9cGv2/kWaiX/hEuoXcL0YV
 rtV9eZlNkVDyEjzcd1iq14aFE3rEzZySr2VbKkof5uZxKrreZixb6H/hprxuQAqTKub3
 hizDU7PRmi3hmJfb0TCr6L5ZFjpzNMSnnxLc31cFTZmX1zWmXK48gCSGzhm9etxnv0OS
 kTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703160744; x=1703765544;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E4qv3jGP7gLEgZjUc+DCJ3ozSBiiDWwnXgsxwGglWH0=;
 b=sfqqXr1syM0BaOohj7ujEEVSmHUaS3qRSTz877om/TSXJXlBOaVWB1y3fp1ZlDYo5A
 x1r7L3niHsGIHwhOMp16QnVUo+t+1z3xrK/3LjF9WAN0t00phhyiBuYW15uN/wbTYvVo
 uY1fm94zSqasvbJh9aub4sSFc2lY0CBhS1Dbk9ZZBN0eicNwCQiypbmwaTgpeSCd/6/R
 0dR+NTI2EeS+vfwY2IdAIYlT3vG41EjBgPWsMR+ojP1nercA+/9RiXjLB8sihzgfJPix
 I98O93Oi3CXjhIdrwQJavKOAT7K1YkS+XeZFuQ2hkarEW/uBtmjKz2/FFaTNhqYfHYv0
 icGg==
X-Gm-Message-State: AOJu0YwovNbu2rEEQ1jDt0QScBPbTsAkScQDC/rorBZh3f0Hq8KIZAKq
 UqJ5F6rmVP68GozitCEqyW0o9qjeqvzujIZpGQLJOwppDLA=
X-Google-Smtp-Source: AGHT+IHHYj5qdn10wRLTJT0rMa2vjtq9rzIRKD6YiUiAloux4gx5bmzKqARuihQj/WefL6bY+2zXhaU0xd/BzstMl2w=
X-Received: by 2002:a17:906:2247:b0:a24:457d:9b24 with SMTP id
 7-20020a170906224700b00a24457d9b24mr1392537ejr.96.1703160743596; Thu, 21 Dec
 2023 04:12:23 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 21 Dec 2023 07:11:47 -0500
Message-ID: <CAAxE2A5P+Ac58gWvfk9G-zkhU7wbq8nBygQaTg+aQ=CwdBknFA@mail.gmail.com>
Subject: [ANNOUNCE] libdrm 2.4.119
To: xorg-announce@lists.x.org, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="0000000000001e2b85060d040372"
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

--0000000000001e2b85060d040372
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

New libdrm has been released.

Marek Ol=C5=A1=C3=A1k (2):
      amdgpu: add amdgpu_va_get_start_addr
      meson: bump libdrm version to 2.4.119

git tag: libdrm-2.4.119

https://dri.freedesktop.org/libdrm/libdrm-2.4.119.tar.xz
SHA256: 0a49f12f09b5b6e68eaaaff3f02ca7cff9aa926939b212d343161d3e8ac56291
 libdrm-2.4.119.tar.xz
SHA512: c8dd7665e85c01a67fcce1c1c614bc05a3ec311f31cae7de5fb1cd27d0f11f1801b=
e63de3fa3e33b2f505544fd4b1bc292965c5e8de46a3beaaedb10334945ca
 libdrm-2.4.119.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.119.tar.xz.sig

See the attachment for the signed message.

Marek

--0000000000001e2b85060d040372
Content-Type: text/plain; charset="UTF-8"; name="signed.txt"
Content-Disposition: attachment; filename="signed.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_lqf5vq8m0>
X-Attachment-Id: f_lqf5vq8m0

LS0tLS1CRUdJTiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQpIYXNoOiBTSEE1MTIKCgpOZXcgbGli
ZHJtIGhhcyBiZWVuIHJlbGVhc2VkLgoKTWFyZWsgT2zFocOhayAoMik6CiAgICAgIGFtZGdwdTog
YWRkIGFtZGdwdV92YV9nZXRfc3RhcnRfYWRkcgogICAgICBtZXNvbjogYnVtcCBsaWJkcm0gdmVy
c2lvbiB0byAyLjQuMTE5CgpnaXQgdGFnOiBsaWJkcm0tMi40LjExOQoKaHR0cHM6Ly9kcmkuZnJl
ZWRlc2t0b3Aub3JnL2xpYmRybS9saWJkcm0tMi40LjExOS50YXIueHoKU0hBMjU2OiAwYTQ5ZjEy
ZjA5YjViNmU2OGVhYWFmZjNmMDJjYTdjZmY5YWE5MjY5MzliMjEyZDM0MzE2MWQzZThhYzU2Mjkx
ICBsaWJkcm0tMi40LjExOS50YXIueHoKU0hBNTEyOiBjOGRkNzY2NWU4NWMwMWE2N2ZjY2UxYzFj
NjE0YmMwNWEzZWMzMTFmMzFjYWU3ZGU1ZmIxY2QyN2QwZjExZjE4MDFiZTYzZGUzZmEzZTMzYjJm
NTA1NTQ0ZmQ0YjFiYzI5Mjk2NWM1ZThkZTQ2YTNiZWFhZWRiMTAzMzQ5NDVjYSAgbGliZHJtLTIu
NC4xMTkudGFyLnh6ClBHUDogIGh0dHBzOi8vZHJpLmZyZWVkZXNrdG9wLm9yZy9saWJkcm0vbGli
ZHJtLTIuNC4xMTkudGFyLnh6LnNpZwoKLS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlR
R3pCQUVCQ2dBZEZpRUU4NlV0dU96cDY1NHp2RWpHa1hvKzZYb1B6Um9GQW1XRUt4OEFDZ2tRa1hv
KzZYb1AKelJxbVpRd0FuN3pjQjJHeVBGR3UrakpPR3BNNHhOMDdXRk5uVi9Tc0RML2tJUHNYdVF2
T2ZxenloKzNpdER2dQpuSnpsZGVOeVdhOUVERXRqNDB5MWhMbVlYZ21TQmNiUHFzajRnbWkxOTBV
Vk1FWXlZS3ZLS3FIKytTeVdhMktFCjBETGpPaWJrYTJBalRBV1lEZjNKQTg2ZWV6S244eFhhN2w4
L1JhVUltLzhEWVhmTDhtazBNZGpyWmh5U25NWm4KenJaNVFUOHJzTkVhVklPSEhSbFlia1JRcytX
WlhTOVc3RmZYcStCR3JQWmpQK0M0ZGFsdDVHSm9hVi9OZzNnSApDOTAwU1JGN2VTa3NlUndOS3lF
MWw4NmFXRmE4UHd4b1UxQjBmK2cxdmxZQXZpdmU3QklyN1dYSnUrN3NoR0hJCnlWaHUrUmxXRjFB
VlVEc2NIakNPc25TeFMxZjRQSEFTTVhkVnJlTjRNcGZwQ0hZWWx6RnQwa3V3WEphNEZPSEYKL3c5
MEQrSFNBUkYrdnZTeUd3bkZSeWJJSjE2dXdRWlNTR285RkwyTGhoRGxHcU9mZDZjd3lsMXZMVWsy
Z1YwcQp0QnRyYWhDMW0wRWV2UHhPR1Rvd3RmRUlrdUZreHJtSE9nM0hIM1dqMFRlN0FIQTEwT3VP
ZzFhSnBueURJVXByCldNVW1IT050Cj13cUdJCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=
--0000000000001e2b85060d040372--
