Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 691942EF976
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E52B6E8CB;
	Fri,  8 Jan 2021 20:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE916E8CB;
 Fri,  8 Jan 2021 20:41:05 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id q25so12769212oij.10;
 Fri, 08 Jan 2021 12:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NTx5LeKnYnLkoXQznJaUS7zKYcrqt2Ko/4Y7E5dK00A=;
 b=jAy6YwGlsJ//Dekv8mtyYzo/NOupI6elU0Ai5x+r2R1hFetfM8tITa+D1i7ST3thr4
 cTZsFHuk9JEYWbf9fMG/to0c6/u+hhWaRKSmtsHTgw41P7CKXiVuamhIFeTTBnbcHxpR
 g46VhK28DNWSBFLZPTJU5+IhqDZC+tpUO5nM5N8AS4YbNg7rm72ihtQZaWs1x4p+FQAH
 Cb5m5KJf8h0GzvhI6lmvi48JT7gqWQXqMZkIJBsYpCL0FtpXo9x2KkbwBFQf6fCJ82Vd
 sUELUnpEEWt3QBjODjgCZ1Vy0GeYvz9Lph+ZYbMgncjviMQqASH/dHv7ilqqHUNQNi6M
 9vUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NTx5LeKnYnLkoXQznJaUS7zKYcrqt2Ko/4Y7E5dK00A=;
 b=jr4L62pALvwLPt9Yj/SPkaqq2hUdmU4JxCTBJumkFNHDkh75M+LLzC1JEskHSqt2P2
 /RMcf7hPu5OQeVEy20nLmBeALPhRTCLEjIKuD58mxd+ZNTfA+snf0SxTjzwwwTHLT5J5
 le60B0wTjiSwVKyPNUzblmJCGLvRwGrk1Rjvv6x/+wv6O2lbnpOtDPhpMIXMofTsoPTs
 3qMsGIvRw7NqCVK//K+Vozuf8ELF0Xj6jLSmJEEqPzNzDBgFA7jrameLejqR4Sl0jaKa
 EMZ9Dgnr01Zv3/ZQOBmLtRFaysi04Aqv4h8S6o1VsCNKz9CqH9AFM1o+U8+9MYUnfOXo
 A5Hw==
X-Gm-Message-State: AOAM530tz8jv5aRjcx1nht+cjW2AmVkdMtGAqqyTOE0NQfh+GUGu3U7x
 EzZ6kEoS10KO0MfLnDFTXigVZapqTN/fmQPOTU3sYfv7
X-Google-Smtp-Source: ABdhPJyMJEylrNAKV8TeNc4u2T6Iys0/IgPNC6RbdUIWbjrpijkT/O0KdlEJzF3eOSPP/7hjLXEwa5ssrqanfyVtO9g=
X-Received: by 2002:aca:4f97:: with SMTP id d145mr3437896oib.123.1610138465292; 
 Fri, 08 Jan 2021 12:41:05 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-18-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-18-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 15:40:53 -0500
Message-ID: <CADnq5_PLki2Hx16Zjn-9Z2aVMerN5pCJs2vMJ+c=hRJdmyMv_w@mail.gmail.com>
Subject: Re: [PATCH 17/40] drm/amd/display/dc/bios/bios_parser: Make local
 functions static
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Igor Kravchenko <Igor.Kravchenko@amd.com>, David Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIEZyaSwgSmFuIDgsIDIwMjEgYXQgMzoxNSBQTSBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xs
b3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlci5jOjI1ODg6MTY6IHdhcm5p
bmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYdXBkYXRlX3Nsb3RfbGF5b3V0X2luZm/i
gJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8u
Li9kaXNwbGF5L2RjL2Jpb3MvYmlvc19wYXJzZXIuYzoyNjkyOjE2OiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmGdldF9icmFja2V0X2xheW91dF9yZWNvcmTigJkgWy1XbWlz
c2luZy1wcm90b3R5cGVzXQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBh
bWQuY29tPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IElnb3Ig
S3JhdmNoZW5rbyA8SWdvci5LcmF2Y2hlbmtvQGFtZC5jb20+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBT
aWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlci5jIHwgNCArKy0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19wYXJz
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyLmMK
PiBpbmRleCAyM2EzNzNjYTk0YjVjLi5mMDU0YzU4NzJjNjE5IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlci5jCj4gQEAgLTI1ODUs
NyArMjU4NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWdyYXRlZF9pbmZvICpiaW9zX3BhcnNlcl9j
cmVhdGVfaW50ZWdyYXRlZF9pbmZvKAo+ICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gIH0KPgo+IC1l
bnVtIGJwX3Jlc3VsdCB1cGRhdGVfc2xvdF9sYXlvdXRfaW5mbygKPiArc3RhdGljIGVudW0gYnBf
cmVzdWx0IHVwZGF0ZV9zbG90X2xheW91dF9pbmZvKAo+ICAgICAgICAgc3RydWN0IGRjX2Jpb3Mg
KmRjYiwKPiAgICAgICAgIHVuc2lnbmVkIGludCBpLAo+ICAgICAgICAgc3RydWN0IHNsb3RfbGF5
b3V0X2luZm8gKnNsb3RfbGF5b3V0X2luZm8sCj4gQEAgLTI2ODksNyArMjY4OSw3IEBAIGVudW0g
YnBfcmVzdWx0IHVwZGF0ZV9zbG90X2xheW91dF9pbmZvKAo+ICB9Cj4KPgo+IC1lbnVtIGJwX3Jl
c3VsdCBnZXRfYnJhY2tldF9sYXlvdXRfcmVjb3JkKAo+ICtzdGF0aWMgZW51bSBicF9yZXN1bHQg
Z2V0X2JyYWNrZXRfbGF5b3V0X3JlY29yZCgKPiAgICAgICAgIHN0cnVjdCBkY19iaW9zICpkY2Is
Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgYnJhY2tldF9sYXlvdXRfaWQsCj4gICAgICAgICBzdHJ1
Y3Qgc2xvdF9sYXlvdXRfaW5mbyAqc2xvdF9sYXlvdXRfaW5mbykKPiAtLQo+IDIuMjUuMQo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
