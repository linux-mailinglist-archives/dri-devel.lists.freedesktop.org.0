Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8D02FB0A
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 13:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196016E2A6;
	Thu, 30 May 2019 11:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc2c.google.com (mail-yw1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FF76E111
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 21:29:14 +0000 (UTC)
Received: by mail-yw1-xc2c.google.com with SMTP id k128so1714998ywf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 14:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=nuEUBDgPVOgomNMikbM53/bd5lzH+tqFhesodPxU8KY=;
 b=p91A/4U3QYEBFpw3TIiXlcZbiHR6/h3ylJKjXxDGMFUgHVmtsRN2IbI0Zmr2RKyL0x
 ABMD68Jf9K/dghg2XK8tO5N5C3tZXxrkGqiO85hX+hpIeuD7gkxB2kTpKcKiZZNe22eh
 sH65LClB6cCj9pIwdvbVee56Bei61vvJVi5xo8PTACwVkLdugvCnlPEfPKiXXFOkdj7q
 W1MpcSA8cH8lK0AgpfqFTUw4T8OXmy/V6eWjGhJrn20x64D6njWCR4Llba4PxD6qbnu9
 CScK2yNMByVLMiUkQzjdWb2yamCQBY/9nlqDXEeOlvJyfp/luUmS+GeEA0gpaV9BrUbU
 8Sxg==
X-Gm-Message-State: APjAAAV5urNOzpb/fgY6GhUD1EmKQJmRMZ8bbWGYEn7lUMf8GjtJ0nI3
 /IEDIK3HNwV33iKAfEy4OiGFOVKbKY23Rq4oVtRsL4aRCyo=
X-Google-Smtp-Source: APXvYqykJ6vnU/Am9rU53QEBtpVaBlc08p+8Us4hFVZWv5R8Fn2c5sQEB7wpdcpRBC/T362Zd3pv8cqg4Hglviwha+w=
X-Received: by 2002:a81:997:: with SMTP id 145mr53261ywj.457.1559165353618;
 Wed, 29 May 2019 14:29:13 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 29 May 2019 23:29:02 +0200
Message-ID: <CAJiuCcfSUAJ2w1qd-OC_CJPXoUVL03dCX1OeaUykNioHkR8Ciw@mail.gmail.com>
Subject: Panfrost impossible to probe without opp table
To: ezequiel Garcia <ezequiel@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
X-Mailman-Approved-At: Thu, 30 May 2019 11:39:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=nuEUBDgPVOgomNMikbM53/bd5lzH+tqFhesodPxU8KY=;
 b=Q+6TgyYnPpspz30nM0iUSiK2PwD0TwwSfX7wofBBHA5AXzcvU9vUhQ2P5uCKPwM+C7
 9A2HzaLqfT1Nxy9MBiNRRbaWAFCDLoZEJBkpZLIjgmSqybwW5ntThYmXdz+/Xkq4GCnN
 0NbWul/aKK+qKJGn9fu1kY9xorPZiFI9YUommUTkxFOGNGxzBFv/5xUCUBl6KZfaqLRN
 eYL3qsNhDZ0NwzUNkic+kGOL9r9HNhCvawqcvcQ+X9X9YKtvSctdavf0+lFNnBbytyet
 Jd+OorVcArZEn5Jq88GXgOiI9/wuEM6V2SnmGnYsFy1Wi2Uj3ZmsM4CmRMbn8slCc1qy
 3biA==
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
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpJIGhhdmUgcmViYXNlIG15IGtlcm5lbCBvbiBsYXRlc3QgNS4yLXJjMiwgYW5kIG15IHBh
bmZyb3N0IGRyaXZlciBpcwpubyBtb3JlIHByb2JpbmcuCgpUaGUgaXNzdWUgaXMgY29taW5nIGZy
b20gZjM2MTdiNDQ5ZDBiY2YzYjVkODBhOTdmNTE0OThkY2Y3NDYzY2Y3ZQogICAgZHJtL3BhbmZy
b3N0OiBTZWxlY3QgZGV2ZnJlcQoKICAgIEN1cnJlbnRseSwgdGhlcmUgaXMgc29tZSBsb2dpYyBm
b3IgdGhlIGRyaXZlciB0byB3b3JrIHdpdGhvdXQgZGV2ZnJlcS4KICAgIEhvd2V2ZXIsIHRoZSBk
cml2ZXIgYWN0dWFsbHkgZmFpbHMgdG8gcHJvYmUgaWYgIUNPTkZJR19QTV9ERVZGUkVRLgoKICAg
IEZpeCB0aGlzIGJ5IHNlbGVjdGluZyBkZXZmcmVxLCBhbmQgZHJvcCB0aGUgYWRkaXRpb25hbCBj
aGVja3MKICAgIGZvciBkZXZmcmVxLgoKSXQgc2VlbXMgdGhhdCB3aXRoIHRoaXMgY29tbWl0IHRo
ZSBPUFAgdGFibGUgaXMgbm93IG1hbmRhdG9yeS4KaXMgaXQgaW50ZW50aW9uYWw/CgpBY3R1YWxs
eQpbICAgIDMuMDQ2MjM3XSBwYW5mcm9zdCAxODAwMDAwLmdwdTogY2xvY2sgcmF0ZSA9IDQzMjAw
MDAwMApbICAgIDMuMDUxNTkzXSBwYW5mcm9zdCAxODAwMDAwLmdwdTogYnVzX2Nsb2NrIHJhdGUg
PSAxMDAwMDAwMDAKWyAgICAzLjA5NjAxMl0gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IG1hbGktdDcy
MCBpZCAweDcyMCBtYWpvciAweDEKbWlub3IgMHgxIHN0YXR1cyAweDAKWyAgICAzLjEwMzY4Ml0g
cGFuZnJvc3QgMTgwMDAwMC5ncHU6IGZlYXR1cmVzOiAwMDAwMDAwMCwxMDMwOWU0MCwKaXNzdWVz
OiAwMDAwMDAwMCwyMTA1NDQwMApbICAgIDMuMTExNzg5XSBwYW5mcm9zdCAxODAwMDAwLmdwdTog
RmVhdHVyZXM6IEwyOjB4MDcxMTAyMDYKU2hhZGVyOjB4MDAwMDAwMDAgVGlsZXI6MHgwMDAwMDgw
OSBNZW06MHgxIE1NVToweDAwMDAyODIxIEFTOjB4ZgpKUzoweDcKWyAgICAzLjEyMzQzNV0gcGFu
ZnJvc3QgMTgwMDAwMC5ncHU6IHNoYWRlcl9wcmVzZW50PTB4MyBsMl9wcmVzZW50PTB4MQpbICAg
IDMuMTMwNDA1XSBwYW5mcm9zdCAxODAwMDAwLmdwdTogRmF0YWwgZXJyb3IgZHVyaW5nIGRldmZy
ZXEgaW5pdAoKV2l0aCBjb21taXQgcmV2ZXJ0ZWQKWyAgICAzLjAzODIzNl0gcGFuZnJvc3QgMTgw
MDAwMC5ncHU6IGNsb2NrIHJhdGUgPSA0MzIwMDAwMDAKWyAgICAzLjA0MzU5M10gcGFuZnJvc3Qg
MTgwMDAwMC5ncHU6IGJ1c19jbG9jayByYXRlID0gMTAwMDAwMDAwClsgICAgMy4wODc5OTRdIHBh
bmZyb3N0IDE4MDAwMDAuZ3B1OiBtYWxpLXQ3MjAgaWQgMHg3MjAgbWFqb3IgMHgxCm1pbm9yIDB4
MSBzdGF0dXMgMHgwClsgICAgMy4wOTU2NThdIHBhbmZyb3N0IDE4MDAwMDAuZ3B1OiBmZWF0dXJl
czogMDAwMDAwMDAsMTAzMDllNDAsCmlzc3VlczogMDAwMDAwMDAsMjEwNTQ0MDAKWyAgICAzLjEw
Mzc2M10gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IEZlYXR1cmVzOiBMMjoweDA3MTEwMjA2ClNoYWRl
cjoweDAwMDAwMDAwIFRpbGVyOjB4MDAwMDA4MDkgTWVtOjB4MSBNTVU6MHgwMDAwMjgyMSBBUzow
eGYKSlM6MHg3ClsgICAgMy4xMTU0MTBdIHBhbmZyb3N0IDE4MDAwMDAuZ3B1OiBzaGFkZXJfcHJl
c2VudD0weDMgbDJfcHJlc2VudD0weDEKWyAgICAzLjEyMjc5OF0gW2RybV0gSW5pdGlhbGl6ZWQg
cGFuZnJvc3QgMS4wLjAgMjAxODA5MDggZm9yCjE4MDAwMDAuZ3B1IG9uIG1pbm9yIDAKCgpUaGFu
a3MsCkNsw6ltZW50Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
