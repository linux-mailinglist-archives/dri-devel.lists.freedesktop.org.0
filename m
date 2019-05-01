Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F291105A1
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 08:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7711589218;
	Wed,  1 May 2019 06:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C0589218
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 06:52:44 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id x78so7012802vsc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 23:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=r0jg1hAMfzX9XOKdadiQceO0a+I86s/eYRTin7NDK8U=;
 b=mcxLIeiDtzLXB6WsIuBQagyOcn/jECstGvpRGGObqwMKy4/Pul/zUJF1k+m8TxDS88
 8gLYRmcGRoGJqLLiNCs8eXXvdj09QEyPPN/OlecnLUG7DP2HOrYmtsZPMFgHQv8eEjJ6
 DPmPxC5fEbCIelOOhaMj6qICvH2QFllTe92B3E5GRmYGiuo0WqqKbX1+lh1shzXxDTxt
 vow9cBo5K51HD3bwhJ8E3cJoojEKhsdrEkWjPZFz5XhZwXGnMBtVCmQcBy87heqHBRST
 N4sy1nuRcBPZYfEvcjEzUKMvKszf3QCRuiJFsZoUWcT56nyhyrFuuXT9gh5BSTjwBo4S
 TFHw==
X-Gm-Message-State: APjAAAWTQnVY5M833addXfiYxL8m6pP0nArnTnHZ8Nli2WqEQIMZm1PD
 T5c5DrxpFNk7NjONL8Cx9lVZwVbhVCqZIx6hNAYsopGj
X-Google-Smtp-Source: APXvYqxeP3y860PVKCL+iyyD8E9jBPkOS2HfUqscz3UaYJHa5mEsvMP5ky1rTnF6w2ViceYhdjRYCfK7l66ffi5VltA=
X-Received: by 2002:a67:df91:: with SMTP id x17mr18815411vsk.76.1556693563368; 
 Tue, 30 Apr 2019 23:52:43 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 1 May 2019 16:50:41 +1000
Message-ID: <CACAvsv7+Ch=r9pt+kPRP8obo_uLscL9Hrg3xq4s92StLvgy=Mw@mail.gmail.com>
Subject: nouveau-next 5.2
To: dri-devel@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=r0jg1hAMfzX9XOKdadiQceO0a+I86s/eYRTin7NDK8U=;
 b=Ie1rEtEMaYiZg/RWIJgkclX6QXuRjupoNxG7XB61didojEv5fi43CWHuA+sFlCYD6h
 W1swm2451Wa4RFARHOKGDDZPp7X2+IaGzzrEIm/h3PSpWuPxOoko2K7Jfi0pGmCdm++O
 5FCiAXeosORDY49w25ZALsIu+y20IEhHaiNkmEPj/aaRnE4hDgcw7/xQk5hAgt+8yekO
 2LtMQ2/1yeB8L7HYV9AvBoiC6dHQA5FY6T1mTSfrEf+ySM+mp83ZQl0Ba7Qyt/se1wmW
 qwGD28ObhYl/Abs9GWYu59otW5TtUSjTllUbg0VkyCprYVDWUfNjE7/cBwN+51AOegcW
 wctQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IERhdmUsCgpObyBtYWpvciBjaGFuZ2VzIHJlYWR5IGZvciB0aGlzIHJvdW5kLCBidXQgYSBm
ZXcgbWlzYyBmaXhlcyBpbnN0ZWFkLgoKQmVuLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNl
IGNvbW1pdCA3YzEzZTVjYzIzOTE5NTA1NDFmNDFmYzlhYjAzMzZhYWU3N2M3ZjYzOgoKICBNZXJn
ZSB0YWcgJ2RybS1pbnRlbC1uZXh0LWZpeGVzLTIwMTktMDQtMjUnIG9mCmdpdDovL2Fub25naXQu
ZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0taW50ZWwgaW50byBkcm0tbmV4dCAoMjAxOS0wNC0yNgox
MTozNTo1OSArMTAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoK
ICBnaXQ6Ly9naXRodWIuY29tL3NrZWdnc2IvbGludXggbGludXgtNS4yCgpmb3IgeW91IHRvIGZl
dGNoIGNoYW5nZXMgdXAgdG8gMzBkZjE2YjkzYjI1ZmUzNDVlNGM1ZDRlOWM3ODlkM2Y0ZjMzN2I3
MjoKCiAgZHJtL25vdXZlYXUvbm91dmVhdTogZm9yd2FyZCBlcnJvciBnZW5lcmF0ZWQgd2hpbGUg
cmVzdW1pbmcgb2JqZWN0cwp0cmVlICgyMDE5LTA1LTAxIDExOjA4OjM5ICsxMDAwKQoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpCam9ybiBIZWxnYWFzICgxKToKICAgICAgZHJtL25vdXZlYXU6IFJlbW92ZSBkdXBsaWNhdGUg
QUNQSV9WSURFT19OT1RJRllfUFJPQkUgZGVmaW5pdGlvbgoKQ29saW4gSWFuIEtpbmcgKDEpOgog
ICAgICBkcm0vbm91dmVhdS9mYi9yYW1nazEwNDogZml4IHNwZWxsaW5nIG1pc3Rha2UgInN1Y2Vz
c2Z1bGx5IiAtPgoic3VjY2Vzc2Z1bGx5IgoKSm9uIERlcnJpY2sgKDQpOgogICAgICBkcm0vbm91
dmVhdS9iYXIvbnY1MDogY2hlY2sgYmFyMSB2bW0gcmV0dXJuIHZhbHVlCiAgICAgIGRybS9ub3V2
ZWF1L2Jhci9udjUwOiBlbnN1cmUgQkFSIGlzIG1hcHBlZAogICAgICBkcm0vbm91dmVhdS9iYXIv
Z2YxMDA6IGVuc3VyZSBCQVIgaXMgbWFwcGVkCiAgICAgIGRybS9ub3V2ZWF1L21tdTogcXVhbGlm
eSB2bW0gZHVyaW5nIGR0b3IKCkx5dWRlIFBhdWwgKDEpOgogICAgICBkcm0vbm91dmVhdS9pMmM6
IERpc2FibGUgaTJjIGJ1cyBhY2Nlc3MgYWZ0ZXIgLT5maW5pKCkKClRvYmlhcyBLbGF1c21hbm4g
KDEpOgogICAgICBkcm0vbm91dmVhdS9ub3V2ZWF1OiBmb3J3YXJkIGVycm9yIGdlbmVyYXRlZCB3
aGlsZSByZXN1bWluZyBvYmplY3RzIHRyZWUKCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9pbmNs
dWRlL252a20vc3ViZGV2L2kyYy5oIHwgIDIgKysKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfZGlzcGxheS5jICAgICAgICAgfCAgOSAtLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9kcm0uYyAgICAgICAgICAgICB8IDEyICsrKysrKysrKystCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9iYXIvZ2YxMDAuYyAgIHwgIDIgKysKIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jhci9udjUwLmMgICAgfCAxNCArKysrKysr
KystLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZiL3JhbWdrMTA0LmMg
fCAgMiArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvaTJjL2F1eC5jICAg
ICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL3N1YmRldi9pMmMvYXV4LmggICAgIHwgIDIgKysKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L252a20vc3ViZGV2L2kyYy9iYXNlLmMgICAgfCAxNSArKysrKysrKysrKysrCiBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9pMmMvYnVzLmMgICAgIHwgMjEgKysrKysrKysrKysr
KysrKystCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9pMmMvYnVzLmggICAg
IHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvbW11L3ZtbS5jICAg
ICB8ICAyICstCiAxMiBmaWxlcyBjaGFuZ2VkLCA5MSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlv
bnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
