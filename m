Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856E15F148F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 23:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DFC10EDAF;
	Fri, 30 Sep 2022 21:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBEA10EDAF;
 Fri, 30 Sep 2022 21:10:12 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-357208765adso14771147b3.12; 
 Fri, 30 Sep 2022 14:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=M1w1EWPn1vLoOId55Q91gnxn8wS8AwPmtHIhCGOHN0M=;
 b=REbiTCxqzTXXjShheYbGyeOylXALyVd3WWejaZI1kZe1D+P0wnqNuB3hXoSpZfK4Fa
 JnWc8punZ2lcrdDg5a5hNaNxNBTwaLGc75orEzHnYlq9F7mRhGQPJGMswayT9rSgIkk1
 UrzlwX/md/fIxSk48OXrH0uTZc7DhiLOEYA03R8OzCqCIwIEulWd7z737PgqMUaTwmrW
 Ai2H7An1NPeX8HiuDxhKx792lD2bGFalMewrK2z8z8+0Fnp0VMMrX1HmVrDuJ5A8orgF
 7XdUPCT6pbKngPw9cb8qTXq3yBBY0vFca3wYvqy/WejC6aK/xITzxH/PeCIFFvD4BZxj
 mCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=M1w1EWPn1vLoOId55Q91gnxn8wS8AwPmtHIhCGOHN0M=;
 b=qr7K/Z8NXpplZDZnBMpNVjLO5X83BXVkG1S0/J/pHxNdUQixmdg1ZiWZwi/HmvY5lt
 kQfTbArNYasVDzx2i23Lctv5IelBrO3epUUPLvaCDN+/TryYuSgXk4mxotsJ1fAewt7+
 D7A32X6ITchl0gmXs3IxTYogkXX338b6JZa4EcVMCJO+/z2bhNgEmdYNb4LJh80ugso6
 kiaYWd6Z6RDJN7nhqWNOygW1zHmW+WIK2uLE++/K+uyWSNkLisKAqOa0rR/ZpzFFmD36
 qHR5cUL4wBrUJcCug+63Z7g0qz09LWv7aJZYVDQ6zUh+LgyyikP+al7PXGbtjT7q6QLH
 +ByQ==
X-Gm-Message-State: ACrzQf3FD0ZGm1zin64HPb31RByTE21wjig6BJTFIGp2CrxBWBBuJoS6
 BbN/lqcVU1szH+SGhszhVXR6yj6ZQYV6Iz2QdOY=
X-Google-Smtp-Source: AMsMyM4a+PlK5rozN6GTpMcjF7T3JXqNFGUhpP5HbCOi8rUxczy4AxJq4KL4QkhOwDL95P8jdmXP2Rrw+SQKqI4sgWg=
X-Received: by 2002:a0d:e581:0:b0:356:cd48:a936 with SMTP id
 o123-20020a0de581000000b00356cd48a936mr2920874ywe.397.1664572211698; Fri, 30
 Sep 2022 14:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220819200928.401416-1-kherbst@redhat.com>
 <YymY+3+C2aI7T3GU@eldamar.lan>
 <CACO55ts7rpbyYv3ovWt1iCfkGsChCUVitmHqtzAwFpfbPEZGYQ@mail.gmail.com>
 <YymrJSfXe4LaXmkA@eldamar.lan>
In-Reply-To: <YymrJSfXe4LaXmkA@eldamar.lan>
From: Computer Enthusiastic <computer.enthusiastic@gmail.com>
Date: Fri, 30 Sep 2022 23:09:59 +0200
Message-ID: <CAHSpYy1mcTns0JS6eivjK82CZ9_ajSwH-H7gtDwCkNyfvihaAw@mail.gmail.com>
Subject: Re: [PATCH] nouveau: explicitly wait on the fence in
 nouveau_bo_move_m2mf
To: Salvatore Bonaccorso <carnil@debian.org>
Content-Type: multipart/mixed; boundary="00000000000061ec3805e9eb6b35"
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000061ec3805e9eb6b35
Content-Type: text/plain; charset="UTF-8"

Hello,

Il giorno mar 20 set 2022 alle ore 13:59 Salvatore Bonaccorso
<carnil@debian.org> ha scritto:
[..]
> Computer Enthusiastic, can you verify the problem as well in a
> non-Debian patched upstream kernel directly from the 5.10.y series
> (latest 5.10.144) and verify the fix there?
>
> Regards,
> Salvatore

I've tested the vanilla kernel 5.10.145 (it was the latest one week
ago) without Debian kernel patches, but using the kernel config file
from the latest kernel for Debian Stable:
- without the Karol's patch: it always fails both suspend to ram and
hibernate to disk with the usual behavior (a very long time to suspend
or hibernate, then it fails on resume with a garbled screen)
- with the Karol's patch: it succeeds both suspend and hibernate and
it correctly resumes afterwards.

The kernel was tested using the following graphic adapter:
Graphics:  Device-1: NVIDIA G96CM [GeForce 9600M GT] driver: nouveau v: kernel
          Device-2: Suyin Acer HD Crystal Eye webcam type: USB driver:
uvcvideo
          Display: x11 server: X.Org 1.20.11 driver: loaded:
modesetting unloaded: fbdev,vesa
          resolution: 1280x800~60Hz
          OpenGL: renderer: NV96 v: 3.3 Mesa 20.3.5

Therefore, 5.10.y series of the kernel need to be patched to work
correctly at least with the aforementioned graphic card.

The script I used to compile the kernel are attached for further
reference and verification.

Hope that helps.

--00000000000061ec3805e9eb6b35
Content-Type: application/octet-stream; name="vanilla-kernel-build-5.10.145"
Content-Disposition: attachment; filename="vanilla-kernel-build-5.10.145"
Content-Transfer-Encoding: base64
Content-ID: <f_l8oz7w3z0>
X-Attachment-Id: f_l8oz7w3z0

IyBEb3dubG9hZCBzb3VyY2UgY29kZQp3Z2V0IC1uYyBodHRwczovL2Nkbi5rZXJuZWwub3JnL3B1
Yi9saW51eC9rZXJuZWwvdjUueC9saW51eC01LjEwLjE0NS50YXIueHoKdGFyIHhmIGxpbnV4LTUu
MTAuMTQ1LnRhci54egoKIyBBdXRvbWF0ZSBzdWJ2ZXJzaW9uIGluZGV4ClNVQlZFUlNJT05fSU5E
RVg9IjEiCgojIERlbGV0ZSBmcm9tIHByZXZpb3VzIGJ1aWxkcwpjZCBsaW51eC01LjEwLjE0NQpy
bSAtcmYgLi9kZWJpYW4Kcm0gLXJmIC4uL2xpbnV4Lm9yaWcvCnJtIC1yZiAuLi9saW51eC11cHN0
cmVhbSoKCmNwIC9ib290L2NvbmZpZy01LjEwLjAtMTgtYW1kNjQgLmNvbmZpZwptYWtlIG9sZGRl
ZmNvbmZpZwoKc2NyaXB0cy9jb25maWcgLS1kaXNhYmxlIFNZU1RFTV9UUlVTVEVEX0tFWVJJTkcK
c2NyaXB0cy9jb25maWcgLS1zZXQtc3RyIFNZU1RFTV9UUlVTVEVEX0tFWVMgJycKCiMgQnVpbGQg
a2VybmVsCnRpbWUgbWFrZSAtaiA4IGRlYi1wa2cgTE9DQUxWRVJTSU9OPS12YW5pbGxhIEtERUJf
UEtHVkVSU0lPTj0kKG1ha2Uga2VybmVsdmVyc2lvbiktJFNVQlZFUlNJT05fSU5ERVgKCmV4aXQg
MAo=
--00000000000061ec3805e9eb6b35
Content-Type: application/octet-stream; 
	name="vanilla-kernel-build-5.10.145-patched"
Content-Disposition: attachment; 
	filename="vanilla-kernel-build-5.10.145-patched"
Content-Transfer-Encoding: base64
Content-ID: <f_l8oz7w5a1>
X-Attachment-Id: f_l8oz7w5a1

IyBEb3dubG9hZCBzb3VyY2UgY29kZQp3Z2V0IC1uYyBodHRwczovL2Nkbi5rZXJuZWwub3JnL3B1
Yi9saW51eC9rZXJuZWwvdjUueC9saW51eC01LjEwLjE0NS50YXIueHoKdGFyIHhmIGxpbnV4LTUu
MTAuMTQ1LnRhci54egoKIyBnZXQgcGF0Y2gKd2dldCBuYyAtTyBub3V2ZWF1LnBhdGNoIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5n
aXQvcGF0Y2gvP2lkPTM2NDBjZGNjYmU3NWI4OTIyZTViZmMwMTkxZGQzN2UzYWFhMjQ4MzMKCiMg
QXV0b21hdGUgc3VidmVyc2lvbiBpbmRleApTVUJWRVJTSU9OX0lOREVYPSIxIgoKIyBEZWxldGUg
ZnJvbSBwcmV2aW91cyBidWlsZHMKY2QgbGludXgtNS4xMC4xNDUKcm0gLXJmIC4vZGViaWFuCnJt
IC1yZiAuLi9saW51eC5vcmlnLwpybSAtcmYgLi4vbGludXgtdXBzdHJlYW0qCgpjcCAvYm9vdC9j
b25maWctNS4xMC4wLTE4LWFtZDY0IC5jb25maWcKbWFrZSBvbGRkZWZjb25maWcKCnNjcmlwdHMv
Y29uZmlnIC0tZGlzYWJsZSBTWVNURU1fVFJVU1RFRF9LRVlSSU5HCnNjcmlwdHMvY29uZmlnIC0t
c2V0LXN0ciBTWVNURU1fVFJVU1RFRF9LRVlTICcnCgojIEFwcGx5IHBhdGNoCnBhdGNoIC1wIDEg
PCAuLi9ub3V2ZWF1LnBhdGNoIHx8IGV4aXQgMQoKIyBCdWlsZCBrZXJuZWwKdGltZSBtYWtlIC1q
IDggZGViLXBrZyBMT0NBTFZFUlNJT049LXBhdGNoZWQgS0RFQl9QS0dWRVJTSU9OPSQobWFrZSBr
ZXJuZWx2ZXJzaW9uKS0kU1VCVkVSU0lPTl9JTkRFWAoKZXhpdCAwCg==
--00000000000061ec3805e9eb6b35--
