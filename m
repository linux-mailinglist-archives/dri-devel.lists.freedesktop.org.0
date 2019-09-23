Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A765CBC240
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949A46E9BB;
	Tue, 24 Sep 2019 07:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2BB6E921;
 Mon, 23 Sep 2019 17:04:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h7so14823449wrw.8;
 Mon, 23 Sep 2019 10:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ykwFxYrA4TPvhlZt6sywAP+RMRKlnDd3p5lXkqoJCKQ=;
 b=mCkY1c/fHCAUOSnqSlQ4aiSS/uk2JOcCE1bMrFkjlTZxUWMVmj7i0LH5j3ZakIT4WI
 Htht7cGmrpvnfikg3KCpuUGQY54hp7nZpLEg4MNRoGsXul7Es9WiI1NrwwIDRxEyglwI
 8Fug4Er+9MmuKiIsyneZ38vXN8qsFmLKFUWI5SSlV1ym6UNquWcdAdGamyBYgUfnvc8u
 Bqf4Kps1SINqRMb0mKI8P/XAyIMJaXpXjW0zpjYpC8HJJXHPVax8Ch29Bw7MsSOM35Ic
 lBE42gCE3EzLIf6/nkvzdkCLPqTkofY2X9xx94fZ1QXxTQaTAVisNKUrajPmcPeVFj0s
 b4gg==
X-Gm-Message-State: APjAAAV41/KZ2uml7MLviv6fH//YdG48ettx8GDR9duhnHqtQRQnIIfM
 WuRSD5mD9jL9t7d3KjRxEZdyeQNgagW4DSQ0saE=
X-Google-Smtp-Source: APXvYqxQ90sr4EEa5aeBIMKyauKkuhRVFiILEHi5/Rp9Omk2zAC6No51Ma4Vf+KeCWq95/D6l9MSDnnw5pvl9Qg6zwA=
X-Received: by 2002:a5d:4d8c:: with SMTP id b12mr341653wru.198.1569258262873; 
 Mon, 23 Sep 2019 10:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190921100439.64402-1-kholk11@gmail.com>
 <20190921100439.64402-2-kholk11@gmail.com>
 <CAOCk7NrAoZw3NDPoW-f+Od+zb6WXav7OqGqoGJR3vcV8doTSqw@mail.gmail.com>
In-Reply-To: <CAOCk7NrAoZw3NDPoW-f+Od+zb6WXav7OqGqoGJR3vcV8doTSqw@mail.gmail.com>
From: AngeloGioacchino Del Regno <kholk11@gmail.com>
Date: Mon, 23 Sep 2019 19:04:12 +0200
Message-ID: <CAK7fi1Y+h+qg3NjnX4KKJhXeZfptSsTzQ9YhNH8kMHZYSfbE5Q@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/5] drm/msm/mdp5: Add optional TBU and TBU_RT
 clocks
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
X-Mailman-Approved-At: Tue, 24 Sep 2019 07:07:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ykwFxYrA4TPvhlZt6sywAP+RMRKlnDd3p5lXkqoJCKQ=;
 b=IysTAF4o9O45FzinjBLSR32vsaOnelTbtPbjbibEm3uDyNozHftQuAp3XHwZXC1t63
 o6Z5OOEQN6DQ/V/gawziEqGQAC9898g9i0DxggcNjoHi8ACHenswnKia2O6z4qZhjP7f
 uOqLPPZZaUtmLlWA9CuuPkvxnMzi+8CfAhowohorheHEPJdkAj9Y/EQPq+phVjkjHdU1
 kNCJSirhzFhcIMHK5JLuabw48DpRcGkcWQYK3aH8l71wX/C2sZEit29tlMo9bYGIteRD
 dnMotfhruT5RlYimgmlaYciwhSB02uZKUyQx43+fD6CDqcYsFDs7haHZTbpO16HYzLTu
 M7/A==
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
Cc: Mark Rutland <mark.rutland@arm.com>, marijns95@gmail.com,
 Jonathan Marek <jonathan@marek.ca>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 freedreno <freedreno@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWwgZ2lvcm5vIGx1biAyMyBzZXQgMjAxOSBhbGxlIG9yZSAwMjo0NSBKZWZmcmV5IEh1Z28KPGpl
ZmZyZXkubC5odWdvQGdtYWlsLmNvbT4gaGEgc2NyaXR0bzoKPgo+IE9uIFN1biwgU2VwIDIyLCAy
MDE5IGF0IDg6MTYgQU0gPGtob2xrMTFAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiAi
QW5nZWxvIEcuIERlbCBSZWdubyIgPGtob2xrMTFAZ21haWwuY29tPgo+ID4KPiA+IFNvbWUgU29D
cywgbGlrZSBNU004OTU2Lzg5NzYgKGFuZCBBUFEgdmFyaWFudHMpLCBkbyBmZWF0dXJlIHRoZXNl
Cj4gPiBjbG9ja3MgYW5kIHdlIG5lZWQgdG8gZW5hYmxlIHRoZW0gaW4gb3JkZXIgdG8gZ2V0IHRo
ZSBoYXJkd2FyZSB0bwo+ID4gcHJvcGVybHkgd29yay4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bmdlbG8gRy4gRGVsIFJlZ25vIDxraG9sazExQGdtYWlsLmNvbT4KPgo+IEkgZG9uJ3Qgc2VlIHRo
ZXNlIGNsb2NrcyBkb2N1bWVudGVkIGluIHRoZSBtZHA1IERUIGJpbmRpbmdzIGRvY3VtZW50Lgo+
IFRoZXkgbmVlZCB0byBiZSBhZGRlZCBpbiB0aGUgRFQgZmlyc3QuCgpJIGtub3csIHlvdSdyZSBy
aWdodC4uLiBJJ3ZlIGp1c3Qgbm90aWNlZCBpdC4gSSdtIHNvcnJ5LCBJJ3ZlCmNvbXBsZXRlbHkg
Zm9yZ290dGVuIHRvCmFkZCB0aGVtIHRvIHRoZSBkb2N1bWVudGF0aW9uLgpJJ2xsIGRvIHRoYXQg
QVNBUCBhbmQgcmVzZW5kLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
