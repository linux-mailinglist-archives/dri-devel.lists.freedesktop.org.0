Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F698474FB
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990A9891FF;
	Sun, 16 Jun 2019 14:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A82388DF5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 18:59:47 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id p10so2059469pgn.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 11:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OK2URELdO7RxY+uNF7Lnr7thgZnPbEJ6QBz1RSeWqB4=;
 b=ZBpiNJXciPswWIRd5b5NLCxVBHk+ovEVJW8YklaZGxBYKfUFxsizzX/PzgdS1Ny041
 kcM/1VkfSnHaths6m5xf1q5EcQnq13pUQdG3qBjiamEGCjSkPAdZzzw1NZPmQGtAsx1A
 SmFpGdOqyNvJr9Zt/FPzt5SxgBVn6XWeiqvRkqyccDGQOU1vxGWsqifvVk/V3CEO+hgD
 IZFgNsifxUU4gwO5JmBrujqCnbpPMfV7X5upN4UIGsG7enH0PTnxJ6uLv0zQmnsMjXBN
 6lffLmy5eSiOO7/tHV/Dl71fic8GsGxJNK35lDXL17HoqN8bX+WzTlgsfhDcUfUK2Kxt
 Dk7Q==
X-Gm-Message-State: APjAAAX3RZfX5HCYd6ISLl84/On5SgC+kNsqWaZvvkyaf1z2rE4QRo+W
 RoO0HCPhLMuwNuj0rBd7Gx7+n/Qr7YusvwbHdnIbNg==
X-Google-Smtp-Source: APXvYqxqVeicjZxel9x1al9yGWZ6O6UvyQw1hBmdDdXXapS54ZMeer7SqOBYNyZjU1XbQM6Qwan5fL3eu8LSxsqMcsQ=
X-Received: by 2002:a63:52:: with SMTP id 79mr36867363pga.381.1560538786212;
 Fri, 14 Jun 2019 11:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
 <875zp8wlbv.fsf@intel.com>
In-Reply-To: <875zp8wlbv.fsf@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 14 Jun 2019 11:59:34 -0700
Message-ID: <CAKwvOdmq2og84Ja6eNpiNdZd_ArxJ+=4a6_q_c2OgwX3Z+93NQ@mail.gmail.com>
Subject: Re: Cleanup of -Wunused-const-variable in
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OK2URELdO7RxY+uNF7Lnr7thgZnPbEJ6QBz1RSeWqB4=;
 b=v9fX7y6Et9gHVGLX5J5DVJ/e2cwXQKLP4ZiWPdKMtAzWG2+bTlmWHEfzNUxqF3oO6w
 Yf0m7UPWVy1QdoBtIl4sIcv7tXOFsigW8eZmUUtqn1PUz1yry+9GvwWTJFbRdcedECFL
 WnjU+wabR53xj69PzK/SDyBSgbDyhqgFZOJZEmLcnMqeiK0pjCPfzk9gSpL7PR/YXK0P
 iC9NxNHaOy9RGJHE2e0lBCDxc0fiq/RyRuXv62RiO8xrdayq99KbUQ+Ui12sbCphRIjf
 rRvb1+w4YbuRhU5WDSUtww1dA5WzZdqjRhg4Fd3M2OuKms1PlVEsaT+RFwSnlqG+UHPn
 A2Fg==
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Huckleberry <nhuck@google.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMjo0MyBBTSBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFA
bGludXguaW50ZWwuY29tPiB3cm90ZToKPiBObyBvcGluaW9uIG9uIHRoZSBzYWlkIHZhcmlhYmxl
cyBhYm92ZSwgYnV0LCBGV0lXLCBwZXJzb25hbGx5IEkgdGhpbmsKPiBpdCdzIGZpbmUgdG8gYWRk
IHRoZSBjZmxhZ3MgdG8gc3VwcmVzcyB3YXJuaW5ncyBsb2NhbGx5IHdoZXJlIG5lZWRlZCBpbgo+
IG9yZGVyIHRvIGJlIGFibGUgdG8gYWNoaWV2ZSB0aGUgZ3JlYXRlciBnb2FsIG9mIHJlbW92aW5n
IHRoZSBjZmxhZ3MKPiBnbG9iYWxseS4KCkkgdGhpbmsgdGhlcmUncyBvbiB0aGUgb3JkZXIgb2Yg
fjEwIG9mIHRoZXNlOgpodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lz
c3Vlcz9xPWlzJTNBaXNzdWUraXMlM0FvcGVuK2xhYmVsJTNBLVd1bnVzZWQtY29uc3QtdmFyaWFi
bGUKTmF0aGFuJ3MgZ290IGEgcHJldHR5IGdvb2QgaGFuZGxlIG9uIGp1c3QgZml4aW5nIHRoZW0u
Cgo+IEluIGRyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlIHdlIGFjdHVhbGx5IGdvIGZvciBt
dWNoIHN0cmljdGVyCj4gd2FybmluZ3MgdGhhbiB0aGUga2VybmVsIGRlZmF1bHRzLCBhbmQgZGlz
YWJsZSBhIG1vcmUgbGltaXRlZCBhbmQKPiB0YWlsb3JlZCBzZXQgb2Ygd2FybmluZ3MuCgpJIGxp
a2UgdGhpcy4KCj4KPiBZb3UgY2FuIGRvIHRoaXMgYm90aCBvbiBhIHN1YmRpciBhbmQgZmlsZSBs
ZXZlbCB3aXRoIHN1YmRpci1jY2ZsYWdzLXkKPiBhbmQgQ0ZMQUdTX2ZpbGVuYW1lLm8sIHJlc3Bl
Y3RpdmVseS4KClRoYXQgc2FpZCwgSSBoYXZlIHVzZWQgdGhpcyB0cmljayBiZWZvcmUsIGJ1dCBJ
IGZlZWwgbGlrZSB0aGUgZmV3ZXIKcGVvcGxlIHRoYXQga25vdyBhYm91dCB0aGlzIHRyaWNrLCB0
aGUgbGVzcyBpdCBjYW4gYmUgW2FiXXVzZWQuCi0tIApUaGFua3MsCn5OaWNrIERlc2F1bG5pZXJz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
