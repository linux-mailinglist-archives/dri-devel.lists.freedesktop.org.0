Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9630EBD4E1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 00:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CB36EAFF;
	Tue, 24 Sep 2019 22:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8485A6EAFF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 22:24:13 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45D0121655
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 22:24:13 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id j31so4175971qta.5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 15:24:13 -0700 (PDT)
X-Gm-Message-State: APjAAAW1nfQobUb2oWjD+EFyrjbNOa8BXTnsSFigpZeZ5Xk9pZo5Bnmc
 xjmhbd/HSgVQsnkxXaWAjaP2UnZrlfx1lrqb6Q==
X-Google-Smtp-Source: APXvYqz3J7T5n5Hv39c604FC+cCp5etHuxMA7LzZcuNRwIuVcrgftRk+LhZPeV3r5rJnGjlejxIwVSOtr/KzGrPbazU=
X-Received: by 2002:ac8:75c7:: with SMTP id z7mr2201367qtq.136.1569363852500; 
 Tue, 24 Sep 2019 15:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190924212920.76103-1-john.stultz@linaro.org>
In-Reply-To: <20190924212920.76103-1-john.stultz@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 24 Sep 2019 17:24:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLR212Et5Z82Gr=DJfB5WY-4o8bN_s5peu07EnaEVEOYQ@mail.gmail.com>
Message-ID: <CAL_JsqLR212Et5Z82Gr=DJfB5WY-4o8bN_s5peu07EnaEVEOYQ@mail.gmail.com>
Subject: Re: [PATCH] libdrm: Convert to Android.mk to Android.bp
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569363853;
 bh=Mruq9xcsLKxYgmYRHZAYK6jWlvW3PWkH2imd9Yt6cZY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bzGHClQIgO4qzhbVwYiXPGOKCHSwQeKaciUK0ADBZXU/O8Of8JaJaVxkIr1NNWARL
 jAy1TBHjQAhKa5OqQwM8GQs43fVua7kPhmyOkrrvEBhMsg21KL3C4I7HFtXT5T4+Md
 OhgFAijmnlZy4TIecW8+vBRbMqMC7+4MQkSnzHS4=
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
Cc: Rob Clark <robdclark@chromium.org>, Jiyong Park <jiyong@google.com>,
 Robert Foss <robert.foss@collabora.com>, Mauro Rossi <issor.oruam@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Eric Anholt <anholt@google.com>,
 Sean Paul <seanpaul@chromium.org>, Dan Willemsen <dwillemsen@google.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgNDoyOSBQTSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpA
bGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIHJlbW92ZXMgdGhlIGRlcHJlY2F0ZWQg
QW5kcm9pZC5tayBmaWxlcyBhbmQgcmVwbGFjZXMKPiB0aGVtIHdpdGggQW5kcm9pZC5icCBmaWxl
cywgdXNlZCBpbiBBbmRyb2lkIE4gYW5kIG5ld2VyCj4gcmVsZWFzZXMuCj4KPiBUaGlzIGlzIG5l
ZWRlZCBpbiBvcmRlciB0byBidWlsZCBsaWJkcm0vbWFzdGVyIGFnYWluc3QgcmVjZW50Cj4gQW5k
cm9pZCByZWxlYXNlcyBhbmQgQU9TUC9tYXN0ZXIsIGFzIHNvbWUgb2YgdGhlIFRyZWJsZSBidWls
ZAo+IG9wdGlvbnMgcmVxdWlyZWQgc2luY2UgQW5kcm9pZCBPIGNhbm5vdCBiZSBleHByZXNzZWQg
aW4KPiBBbmRvcmlkLm1rIGZpbGVzLgo+Cj4gUGF0Y2ggb3JpZ2luYWxseSBieSBEYW4gV2lsbGVt
c2VuIHdpdGggZml4ZXMgZm9sZGVkIGluIGJ5Ogo+ICBKZXJyeSBaaGFuZywgRWxpb3R0IEh1Z2hl
cyBhbmQgbXlzZWxmLgo+Cj4gV2hpbGUgdGhpcyBkb2VzIGNvc3QgY29tcHRhYmlsaXR5IHdpdGgg
b2xkZXIgcHJlIEFuZHJvaWQgTgo+IHJlbGVhc2VzLCBJJ2QgY29udGVuZCB0aGF0IGJlaW5nIGFi
bGUgdG8gYnVpbGQvdGVzdAo+IGxpYmRybS9tYXN0ZXIgYWdhaW5zdCBBT1NQL21hc3RlciBhbmQg
cmVjZW50IHJlbGVhc2VzIGlzIG1vcmUKPiB2YWx1YWJsZSB0aGVuIHNvbGV5IG1haW50YWluaW5n
IHN1cHBvcnQgZm9yIG9sZCBhbmQgdW5zdXBwb3J0ZWQKPiBBbmRyb2lkIHJlbGVhc2VzLgoKVHJ5
aW5nIHRvIG1haW50YWluIHNvbWV0aGluZyB0aGF0IHdvcmtzIGFjcm9zcyBtb3JlIHRoYW4gMyBy
ZWxlYXNlcyBvcgpzbyBpcyBwYWluZnVsLiBJIGRvbid0IHRoaW5rIGFuZHJvaWQteDg2IGZvbGtz
IGhhdmUgdGhlIGJhbmR3aWR0aCB0bwptYWludGFpbiB0aGluZ3Mgb2xkZXIgdGhhbiB0aGF0ICph
bmQqIHVwZGF0ZSB0byBuZXdlciB2ZXJzaW9ucy4gU28gSQp0aGluayBvbmx5IHN1cHBvcnRpbmcg
dGhlIG4gbGF0ZXN0IHJlbGVhc2VzIGlzIGdvb2QuCgpBcmUgLmJwIGZpbGVzIGZvciBtYXN0ZXIv
USBjb21wYXRpYmxlIGJhY2sgdG8gTiAob3IgTyk/IElJUkMsIGF0IGxlYXN0CmZvciB0aGUgZmly
c3QgY291cGxlIG9mIHJlbGVhc2VzIHdpdGggLmJwIGZpbGVzLCB0aGV5IHNlZW1lZCB0byBoYXZl
CmluY29tcGF0aWJsZSBjaGFuZ2VzLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
