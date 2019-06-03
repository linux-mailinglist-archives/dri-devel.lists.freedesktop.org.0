Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E706533FAC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA64896BF;
	Tue,  4 Jun 2019 07:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc4a.google.com (mail-yw1-xc4a.google.com
 [IPv6:2607:f8b0:4864:20::c4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432958929C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 16:55:27 +0000 (UTC)
Received: by mail-yw1-xc4a.google.com with SMTP id q79so4464752ywg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 09:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=BzAJ0+9x2pcfr7Do5TUN53ZGOyHm87DfwLwwZIYymzc=;
 b=ekd9hQkNosXJUd0I843xWVIQnCrd4r4AmsyOvmcyKpo7OvHhfoSsvbCReCTQj5B7pT
 ABOX1mqwvewck6VLAY+DsYfKsxq4EAtOUqSl9CpIu9NdRgNqPYlz4DNgJ44HnEEMSfsg
 egoijqevX0Bb0M0WuiYE4Mi51QX622wR1+KhkNikAS2iULYyNHkZ36Y2qQVQbRvnY/es
 Op4dG7dJmlgLWTxo2vVnREKXsP+DBbmRZkyW602LlfVtGat5crTaV2tTDnkKKlAhbTHF
 MWv+aIkxB+aADs/sv81XyeQfqlYsrFAv0JrvBMFQA+8wYqj+ST30gb/agyd/tiQWsN4c
 5cUg==
X-Gm-Message-State: APjAAAUvEvPcXVzJxD4mii48FohbDG2AWgJ6mzm/DLZVLzRYe5AGoquW
 i29ip78XVltTnDla8S3zUOOuMgNyte1/8GOe
X-Google-Smtp-Source: APXvYqw8qo6YCAA2LDG0hCmceBSOfUoHZIsTSjRJKNeADMAk1c3BAJX7XTjP1o6wTWUARrevZDffoxW7ORioylDq
X-Received: by 2002:a25:4445:: with SMTP id r66mr13094125yba.55.1559580926346; 
 Mon, 03 Jun 2019 09:55:26 -0700 (PDT)
Date: Mon,  3 Jun 2019 18:55:03 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <097bc300a5c6554ca6fd1886421bb2e0adb03420.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 01/16] uaccess: add untagged_addr definition for other
 arches
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=BzAJ0+9x2pcfr7Do5TUN53ZGOyHm87DfwLwwZIYymzc=;
 b=Gd3MS7x4gwNqCAsuebDb+LQXe1ROUCAjzPqIs7DNAteGO+I/k2kuk/JUQDg2yytLs0
 mAnj4aXyNOLD53bou+rnAjAI+DoFCDM6597Xb+r9d5tHdnUBLOhHUJdZUvwspRQQklB/
 nVb9mJ+RVgKXuTmdk46XK6MPO9GX2CvoeDiI4JmSZych6aS7p7s1LkUgQ8IFSJW5YLx/
 IwfItaZEAlz+YxcxGixqEutWhh0H0I+YiPlFdGJFMPEbbW0iVK8sXmL/5Dzp9W2t8wq7
 Jn42agr19zJj2QbOHan385htTUuPv+QknbBnCycF9d956GlhodbETKPupW6IU9maR3WJ
 cryQ==
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
 Kostya Serebryany <kcc@google.com>, Khalid Aziz <khalid.aziz@oracle.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
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
YXNAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEtoYWxpZCBBeml6IDxraGFsaWQuYXppekBvcmFjbGUu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5j
b20+Ci0tLQogaW5jbHVkZS9saW51eC9tbS5oIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVkZS9s
aW51eC9tbS5oCmluZGV4IDBlODgzNGFjMzJiNy4uOTQ5ZDQzZTljMGI2IDEwMDY0NAotLS0gYS9p
bmNsdWRlL2xpbnV4L21tLmgKKysrIGIvaW5jbHVkZS9saW51eC9tbS5oCkBAIC05OSw2ICs5OSwx
MCBAQCBleHRlcm4gaW50IG1tYXBfcm5kX2NvbXBhdF9iaXRzIF9fcmVhZF9tb3N0bHk7CiAjaW5j
bHVkZSA8YXNtL3BndGFibGUuaD4KICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+CiAKKyNpZm5k
ZWYgdW50YWdnZWRfYWRkcgorI2RlZmluZSB1bnRhZ2dlZF9hZGRyKGFkZHIpIChhZGRyKQorI2Vu
ZGlmCisKICNpZm5kZWYgX19wYV9zeW1ib2wKICNkZWZpbmUgX19wYV9zeW1ib2woeCkgIF9fcGEo
UkVMT0NfSElERSgodW5zaWduZWQgbG9uZykoeCksIDApKQogI2VuZGlmCi0tIAoyLjIyLjAucmMx
LjMxMS5nNWQ3NTczYTE1MS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
