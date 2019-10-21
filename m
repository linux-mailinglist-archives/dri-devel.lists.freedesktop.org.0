Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E70EDDF5A6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 21:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9358B6E21F;
	Mon, 21 Oct 2019 19:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1EE6E220
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 19:05:11 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id x3so12044399oig.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 12:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HgHGWvN6Bj5hyNJniLQ4k5wccPyzgO8pGCipXRk1Y54=;
 b=r06yohIbchnN0ea9xRx2onGPDrJpOcTnTOELka7toiM8lmTZQ7Vu6yDx7Ae7Egph3Z
 zY+09lZxip4lKPNvULRGe1rSsM3jotTxSdUE9FFSxx4cg5mGxi4045NtHmGFSjcNYxPq
 vh0f1qrbDAx0l+Gj2rNA7cemlC9+eaO7kf6Xk1cFsFxsVbwDuoap/LIopC0+cFUslSxY
 01wGprzKjP5L+PEqqelPZmJlqyg2lmd4NvNJai7kjsGf7U+E4WYJtNNSQQNfQfUQVQIo
 eGAUDW8//Fl04Eezac7AVy8/tdXzP/4DZKAf0rIxwt4DmhkklUtffa/leZte+cT3wAxk
 5Qnw==
X-Gm-Message-State: APjAAAVL3iCw910ZHSLlPCXlkJya2RXDqwJHe+ckP+byanXJT/HVyKN8
 Pwh1SnkePuds93CU8+RIbaTAHbrcjj4rJ9Ph3RJ9rg==
X-Google-Smtp-Source: APXvYqwWzzGUzz1JAt2td+MFhU/b0S3R/rALubdx6OFVlDMUE3zqPszttr+7oqJt32tjWTqFThbEJ5YdFYeuFTnT50A=
X-Received: by 2002:aca:5405:: with SMTP id i5mr883384oib.161.1571684710216;
 Mon, 21 Oct 2019 12:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191021190310.85221-1-john.stultz@linaro.org>
In-Reply-To: <20191021190310.85221-1-john.stultz@linaro.org>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 21 Oct 2019 12:04:59 -0700
Message-ID: <CALAqxLW5eQhVBMyFamjMyU2Vsd6TgG=dC0zftwA2AtY-8S9Scg@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] DMA-BUF Heaps (destaging ION)
To: lkml <linux-kernel@vger.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HgHGWvN6Bj5hyNJniLQ4k5wccPyzgO8pGCipXRk1Y54=;
 b=yM7hcATBudH8QtZKtYwmZrQaiv0jewLVJrYFtSc/3axEtwv22+lqq6fwpzyQZRqiaB
 zbr8s6RsOGFnip2YhUQvv9vOpCkjD12ejLmww9OvYxAjikTkEEId6TVYp59pteKLabiH
 6F1g1uWTRrBZkPDp7p6RvYunKoLCdUU+oMKe8wgIF8BV4BiSVd/G5UIDsPsUCT8S5LTi
 eI6rdvPAIy9dGshQvE5VIZb9hgC4ywxkk4xgO6pUNt5EwEEx+nwqszE2IMF+BysJzbZ6
 9CupBenxGoN5ucqk3M/vBKPVxKl2Vcem8Ohp5GQweElKxalxKZnUGBTGrIP+wYCCLjbw
 +msA==
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMTI6MDMgUE0gSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6
QGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gTHVja3kgbnVtYmVyIDEzISA6KQo+Cj4gTGFzdCB3ZWVr
IGluIHYxMiBJIGhhZCByZS1hZGRlZCBzb21lIHN5bWJvbCBleHBvcnRzIHRvIHN1cHBvcnQKPiBs
YXRlciBwYXRjaGVzIEkgaGF2ZSBwZW5kaW5nIHRvIGVuYWJsZSBsb2FkaW5nIGhlYXBzIGZyb20K
PiBtb2R1bGVzLiBIZSByZW1pbmRlZCBtZSB0aGF0IGJhY2sgYXJvdW5kIHYzIChpdHMgYmVlbiBh
d2hpbGUhKSBJCgpCeSAiSGUiIEkgbWVhbiBCcmlhbiBoZXJlLgoKdGhhbmtzCi1qb2huCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
