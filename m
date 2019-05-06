Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8427C15E07
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD1C89DA2;
	Tue,  7 May 2019 07:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB6F89A1E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 16:31:11 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id p190so7305334qke.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 09:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=3tB4TRcqPwl6IgCCTq3FyKBtrVczmpENbbiRumQIu5I=;
 b=ZEImRvisSoLhflWTusiGopZF4WJjHpEbEsDZKEy/kgftq+0IFMZTzYJtkAJZI/rAhC
 jYN5QsrQWNOfVVpxMfzZgi4eIzLejuL3mez7MliWSLZi0fDJWBstZe83LYAEbKVdUI5H
 WWPhWdelibMd52tsxRZRJm181YGc/kkx6Asvis2s/n/aTI1FvxPgMIbsSNI76RXbhWum
 O1NOVJMZeVYzYgRGigFs9N0Cr5GCt8HJqENEIypEuEepMRUk8YHQNWzxY0OHf5F+2edM
 T1mNqS02Jk0mtwV4FJkP4/VRlkgsTcTHnQrjlByL42gW5sM5UOgbZugOwmwCM1TOF7tV
 VhEw==
X-Gm-Message-State: APjAAAXDmAjGmFCB11QjPksoiMcIQcAcYWjIfkN8uqxnhiiPoaw5gFP/
 XtjqCd64wvNm29l5FhSritBZxB2qJo9v9eMX
X-Google-Smtp-Source: APXvYqwDoIRoTGaFyeue7qd81SpE5xeykRQrED4HzbPSjcVVRn6t+xvIGHOhvH8ghp1kYB1swN7rJoVGjZYp31y2
X-Received: by 2002:ac8:3390:: with SMTP id c16mr6277321qtb.315.1557160270425; 
 Mon, 06 May 2019 09:31:10 -0700 (PDT)
Date: Mon,  6 May 2019 18:30:47 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <67ae3bd92e590d42af22ef2de0ad37b730a13837.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 01/17] uaccess: add untagged_addr definition for other
 arches
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=3tB4TRcqPwl6IgCCTq3FyKBtrVczmpENbbiRumQIu5I=;
 b=C5Bzseg2BAkWez5di4p65TqBX8PhS2fPXqJjrcuborrGzdIMmjBkEGS1oepu/kO4gi
 ZrAiwZ1YbirX9TOQW6iDBsdtMTgTZyQlBla9C/k5+v0DS9Eu7yTQTxvIZJRaIMRpa57h
 rZkszsH1RsVjkBjXJm8Nw6zDYrexUGyc9BNsDlgeAocqmj+aaO1LdZJjYgfxEDSFYcJj
 gjdVUEcQ+veFKjzDustw9+BWdSodbg3cE0gzjdewRwKOf7czWg4u+rE0852iiQixBdas
 JIw3pQAvoPC6IfNeEfBV09Q69TtafbxIB+dc/sgJQwlLGyiy5Ze3tqDZ/eiYCNwSry9q
 rXvw==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>, Lee Smith <Lee.Smith@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gYWxsb3cgYXJtNjQgc3lzY2FsbHMgdG8gYWNjZXB0IHRhZ2dlZCBwb2ludGVycyBmcm9tIHVz
ZXJzcGFjZSwgd2UgbXVzdAp1bnRhZyB0aGVtIHdoZW4gdGhleSBhcmUgcGFzc2VkIHRvIHRoZSBr
ZXJuZWwuIFNpbmNlIHVudGFnZ2luZyBpcyBkb25lIGluCmdlbmVyaWMgcGFydHMgb2YgdGhlIGtl
cm5lbCwgdGhlIHVudGFnZ2VkX2FkZHIgbWFjcm8gbmVlZHMgdG8gYmUgZGVmaW5lZApmb3IgYWxs
IGFyY2hpdGVjdHVyZXMuCgpEZWZpbmUgaXQgYXMgYSBub29wIGZvciBhcmNoaXRlY3R1cmVzIG90
aGVyIHRoYW4gYXJtNjQuCgpBY2tlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmlu
YXNAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBn
b29nbGUuY29tPgotLS0KIGluY2x1ZGUvbGludXgvbW0uaCB8IDQgKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2lu
Y2x1ZGUvbGludXgvbW0uaAppbmRleCA2YjEwYzIxNjMwZjUuLjQ0MDQxZGY4MDRhNiAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCisrKyBiL2luY2x1ZGUvbGludXgvbW0uaApAQCAtOTks
NiArOTksMTAgQEAgZXh0ZXJuIGludCBtbWFwX3JuZF9jb21wYXRfYml0cyBfX3JlYWRfbW9zdGx5
OwogI2luY2x1ZGUgPGFzbS9wZ3RhYmxlLmg+CiAjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgog
CisjaWZuZGVmIHVudGFnZ2VkX2FkZHIKKyNkZWZpbmUgdW50YWdnZWRfYWRkcihhZGRyKSAoYWRk
cikKKyNlbmRpZgorCiAjaWZuZGVmIF9fcGFfc3ltYm9sCiAjZGVmaW5lIF9fcGFfc3ltYm9sKHgp
ICBfX3BhKFJFTE9DX0hJREUoKHVuc2lnbmVkIGxvbmcpKHgpLCAwKSkKICNlbmRpZgotLSAKMi4y
MS4wLjEwMjAuZ2YyODIwY2YwMWEtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
