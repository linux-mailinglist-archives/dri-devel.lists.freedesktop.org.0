Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8940351631
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 17:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD896E1D8;
	Thu,  1 Apr 2021 15:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456FA6E1D8
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 15:29:13 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id c16so2162264oib.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 08:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+uDqLrqEwtbwuk+ipQ/4chsYUIiuhxorCkDeq2wHxEY=;
 b=TKNIlthVc1vJKhvutpzSSGqT9SRXbo0yFXQ7nkqP4dVMeopb1EkclvFcMlTSe4QBS1
 Le74aYL8mhGnFOJy5VVxLwNeaPRZlj9z6dsJlnTkW40zbHUhZxW3eE02b2miccszPvJq
 ZUCpihWDIp1B5QDkAV8eefPgdiJ1yHX1a44DnCy/BzrLJ17CJC0KfacNPVF53EdTqMHh
 zxhbWV/+G/9PjFGQFUeIpRrVyLzmfvaY5hJaEnNkTPzSf7oDm5Sjm/LfRfu9+3DVeJW+
 5FPC95Q633HSUQp6PJw2olyq1Vruu3yqFtMBjjAVtFwFjGG6vq6F1xrqudYSc/IFllNj
 +uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+uDqLrqEwtbwuk+ipQ/4chsYUIiuhxorCkDeq2wHxEY=;
 b=QsEEjWYsOuwKZA9uRZ9wkvf/mqbh4apFkz4KFMrDougP/wTCfBKfNqBqCDLGGb0vlB
 lbtXAy4MYQ/22+i2hEZh4QHiywQLTRPlZQgV2JNqQy5uL4+AU9IDDsqfHBZ5rZP8hZBn
 O17PQ06Xy4RfnjG+zcTe5Mi5oGlu8n/NWknMQU5Un3yOT/Wq5P8V95VHlsNt5kyzC7+/
 1RGGQBPeScT/7aGZtN1f2K+LfSFLU/RA0q1CcVKkmdA724erjBtTmCYDAcHX5R4SFK+I
 hRVJ4sao1/4PNnpR8o8mCpRR6E562AESlpQ9lHMdTsIbiS1xdrG4a1xtEoHCUCWXh7SF
 6LwA==
X-Gm-Message-State: AOAM53379xaKXqHcymlkr5WlmdAm0GyF+8LnMLrPvEJ+tG7Zwan7lu5g
 20hlyW4rFVJ9nE5ZZr6Ba7wysKtdY1e16JWCinkmpPvznOg=
X-Google-Smtp-Source: ABdhPJwSfFLWE+KW6cwxbF84QbObR7F8eHvmhnp7mNiDeN+wwBg7Cu2+7PtRtI+WgRWm/xKLosq6ryI8heqhhPqIRYA=
X-Received: by 2002:a05:6808:68a:: with SMTP id
 k10mr6333886oig.120.1617290952660; 
 Thu, 01 Apr 2021 08:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210401125213.138855-1-christian.koenig@amd.com>
In-Reply-To: <20210401125213.138855-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 1 Apr 2021 11:29:01 -0400
Message-ID: <CADnq5_NMGj1e8-SkL1UhMYqqhrqUwzkJmrky-noNF6WKsC=+NQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: add missing member documentation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMSwgMjAyMSBhdCA4OjUyIEFNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IEp1c3QgZml4IGEgd2FybmluZy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KPiBSZXBvcnRlZC1ieTogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcu
YXU+Cj4gRml4ZXM6IGYyZjEyZWI5YzMyYiAoImRybS9zY2hlZHVsZXI6IHByb3ZpZGUgc2NoZWR1
bGVyIHNjb3JlIGV4dGVybmFsbHkiKQoKUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KCj4gLS0tCj4gIGluY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIu
aCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmggYi9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVy
LmgKPiBpbmRleCAxYzgxNWUwYTE0ZWQuLmY4ODhiNWU5NTgzYSAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL2RybS9ncHVfc2NoZWR1bGVyLmgKPiArKysgYi9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVy
LmgKPiBAQCAtMjc3LDYgKzI3Nyw3IEBAIHN0cnVjdCBkcm1fc2NoZWRfYmFja2VuZF9vcHMgewo+
ICAgKiBAaGFuZ19saW1pdDogb25jZSB0aGUgaGFuZ3MgYnkgYSBqb2IgY3Jvc3NlcyB0aGlzIGxp
bWl0IHRoZW4gaXQgaXMgbWFya2VkCj4gICAqICAgICAgICAgICAgICBndWlsdHkgYW5kIGl0IHdp
bGwgYmUgY29uc2lkZXJlZCBmb3Igc2NoZWR1bGluZyBmdXJ0aGVyLgo+ICAgKiBAc2NvcmU6IHNj
b3JlIHRvIGhlbHAgbG9hZGJhbGFuY2VyIHBpY2sgYSBpZGxlIHNjaGVkCj4gKyAqIEBfc2NvcmU6
IHNjb3JlIHVzZWQgd2hlbiB0aGUgZHJpdmVyIGRvZXNuJ3QgcHJvdmlkZSBvbmUKPiAgICogQHJl
YWR5OiBtYXJrcyBpZiB0aGUgdW5kZXJseWluZyBIVyBpcyByZWFkeSB0byB3b3JrCj4gICAqIEBm
cmVlX2d1aWx0eTogQSBoaXQgdG8gdGltZSBvdXQgaGFuZGxlciB0byBmcmVlIHRoZSBndWlsdHkg
am9iLgo+ICAgKgo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
