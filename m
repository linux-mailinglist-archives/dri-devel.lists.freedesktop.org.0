Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F79D3060F
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 03:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A616E183;
	Fri, 31 May 2019 01:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A224B6E183
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 01:12:57 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id x47so6055959qtk.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 18:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=N7Ld0oTeLa6tjc6aAUtX11UdWIlu7aDW1RqOfC98wMU=;
 b=Ct79YNVBrCbZIZ9V1hujo+VZZhHm80OCs+9WRO0253Nvnp46FX1X5O8gAlb5RtDZN6
 2U/EEnD6zCsaH7UUq6y3JRNLRryTMX6507uAHVU7poSgKWuVCzvo08A3FoYmm5T5yu0X
 I0gPMAzcfvQGQNS2r7nahE1vKwiVGwkUuEj6EGb4yJKjcy0576Pa3Y8O1/45Oz9g6Kp/
 HEgKQWmK6zT1hzwDRoz8wXvJenGkuinh0Z1OT5JHDH5ld26/kqhq7nVXRqI5U8XMDALE
 ecl/g5VXHJuvJHRwQbmbdy547t7Lb5viLdF7FfEo4OwHqxYgj0C4797cs1FV2S/Dsyx2
 o9/w==
X-Gm-Message-State: APjAAAVEH80y/UchBKAS5CBU+JurvHNg+yr/j+VikCz2MAML4leJy3cY
 4fTpnn/eoz+IGSdzZRhGXIWlsKKiN8FhhGCwHKs=
X-Google-Smtp-Source: APXvYqyT4Gu/IscOyDRCD+y3J0nNV+vi1s9deC8Ea5jxYqX7ny9Fh9taIHkBJ0ZeUx4Qv8PPuuNS4qTV8cEt3cb6B4o=
X-Received: by 2002:a0c:d973:: with SMTP id t48mr6328257qvj.83.1559265176588; 
 Thu, 30 May 2019 18:12:56 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 31 May 2019 11:12:45 +1000
Message-ID: <CAPM=9twUWVimrFu+Lbu4SHZw8szeHD=FGD8GVyf5tmd6p8w7=Q@mail.gmail.com>
Subject: [git pull] drm fixes for 5.2-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=N7Ld0oTeLa6tjc6aAUtX11UdWIlu7aDW1RqOfC98wMU=;
 b=iIzFM01G7oNvtLnXJ4NQTVQOEiTm84RMPDHBl9Ck5VjJNGHGlDDSDIhThogOHNTRQM
 wNgBEcAg/RhkKODP6JFl5nwNfAX+KkiRNZ616KsPOaJe65opufMMHCbVSt1YXviTw9Ka
 UQrMiF308s6L66y72Fl8zk+QbpVQQJ1MuSCirUg86y7daFM6lBYhU4hF0GjoS8ArLMJP
 REUyfejU4i+hU5CvXwf5Nm6Hs2G1isEMpCaB/e6BInyF67nIVXMexAejsMW+EL4eLxRF
 LnDIzAVH/oqomX1fG58Q6YoJOFejF80iMvfSqgHhn87YJg8ul4PEwlwVs5LWR02AswkN
 vSdA==
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMsCgpOb3RoaW5nIHRvbyBjcmF6eSwgcHJldHR5IHF1aWV0LCBtYXliZSB0b28gcXVp
ZXQuCgphbWRncHU6Ci0gYSBmaXhlZCB2ZXJzaW9uIG9mIHRoZSByYXZlbiBmaXJtd2FyZSBmaXgg
d2UgcHJldmlvdXNseSByZXZlcnRlZCwKLSBzdG9sZW4gbWVtb3J5IGZpeAoKaW14OgotIHJlZ3Jl
c3Npb24gZml4CgpxeGw6Ci0gcmVtb3ZlIGEgYmFkIHdhcm5pbmcuCgpldG5hdml2OgotIFZNIGxv
Y2tpbmcgZml4LgoKRGF2ZS4KCmRybS1maXhlcy0yMDE5LTA1LTMxOgpkcm0gZXRuYXZpdiwgaW14
LCBhbWRncHUgZml4ZXMKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBjZDZjODRk
OGYwY2RjOTExZGY0MzViYjA3NWJhMjJjZTNjNjA1YjA3OgoKICBMaW51eCA1LjItcmMyICgyMDE5
LTA1LTI2IDE2OjQ5OjE5IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRv
cnkgYXQ6CgogIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0gdGFncy9kcm0t
Zml4ZXMtMjAxOS0wNS0zMQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDJhM2UwYjcx
NjI5NmE1MDRkOWU2NWZlYTdhY2IzNzljODZmZTQyODM6CgogIE1lcmdlIHRhZyAnaW14LWRybS1m
aXhlcy0yMDE5LTA1LTI5JyBvZgpnaXQ6Ly9naXQucGVuZ3V0cm9uaXguZGUvZ2l0L3B6YS9saW51
eCBpbnRvIGRybS1maXhlcyAoMjAxOS0wNS0zMQowOToxNToyNSArMTAwMCkKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJt
IGV0bmF2aXYsIGlteCwgYW1kZ3B1IGZpeGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkRhdmUgQWlybGllICg0KToKICAg
ICAgTWVyZ2UgYnJhbmNoICdldG5hdml2L2ZpeGVzJyBvZgpodHRwczovL2dpdC5wZW5ndXRyb25p
eC5kZS9naXQvbHN0L2xpbnV4IGludG8gZHJtLWZpeGVzCiAgICAgIE1lcmdlIHRhZyAnZHJtLW1p
c2MtZml4ZXMtMjAxOS0wNS0yOScgb2YKZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJt
L2RybS1taXNjIGludG8gZHJtLWZpeGVzCiAgICAgIE1lcmdlIGJyYW5jaCAnZHJtLWZpeGVzLTUu
Micgb2YKZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXggaW50byBkcm0t
Zml4ZXMKICAgICAgTWVyZ2UgdGFnICdpbXgtZHJtLWZpeGVzLTIwMTktMDUtMjknIG9mCmdpdDov
L2dpdC5wZW5ndXRyb25peC5kZS9naXQvcHphL2xpbnV4IGludG8gZHJtLWZpeGVzCgpGbG9yYSBD
dWkgKDEpOgogICAgICBkcm0vYW1kZ3B1OiByZXNlcnZlIHN0b2xsZW4gdnJhbSBmb3IgcmF2ZW4g
c2VyaWVzCgpHZXJkIEhvZmZtYW5uICgxKToKICAgICAgZHJtL3F4bDogZHJvcCBXQVJOX09OQ0Uo
KQoKSGFycnkgV2VudGxhbmQgKDEpOgogICAgICBkcm0vYW1kL2Rpc3BsYXk6IERvbid0IGxvYWQg
RE1DVSBmb3IgUmF2ZW4gMSAodjIpCgpMdWNhcyBTdGFjaCAoMSk6CiAgICAgIGRybS9ldG5hdml2
OiBsb2NrIE1NVSB3aGlsZSBkdW1waW5nIGNvcmUKClBoaWxpcHAgWmFiZWwgKDEpOgogICAgICBk
cm0vaW14OiBpcHV2My1wbGFuZTogZml4IGF0b21pYyB1cGRhdGUgc3RhdHVzIHF1ZXJ5IGZvciBu
b24tcGx1cyBpLk1YNlEKCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAg
ICAgICAgICAgIHwgIDMgKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jIHwgMTIgKysrKysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9l
dG5hdml2X2R1bXAuYyAgICAgICAgICAgIHwgIDUgKysrKysKIGRyaXZlcnMvZ3B1L2RybS9pbXgv
aXB1djMtcGxhbmUuYyAgICAgICAgICAgICAgICAgfCAxMyArKysrKysrKy0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmggICAgICAgICAgICAgICAgIHwgIDEgLQogZHJpdmVy
cy9ncHUvZHJtL3F4bC9xeGxfcHJpbWUuYyAgICAgICAgICAgICAgICAgICB8ICAxIC0KIDYgZmls
ZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
