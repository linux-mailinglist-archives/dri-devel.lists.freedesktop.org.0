Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAECBFA85
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 22:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BF86EDFF;
	Thu, 26 Sep 2019 20:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793DB6EDFF
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 20:17:15 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d1so182967ljl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 13:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7RbCDRjRAvWcIi7QkdCjwk6XzzWsIsN9TecD9WwksU0=;
 b=YJ/AsdZNFRVM6Yj4A48sTFtxnQ7bYUhoUr/yfU4DI4+++Nbhb6wEWD93AkB6TMv+3+
 KNAVWBxRhr3WvbtVtgSVz0InjxinfzW7lGIZkoxwwGuDv6WXuNSbMqCPNaYdZo5BMJg8
 QLMFF5UZ/wDhynBtqmBiuzSMiZn49M+ZfSppnHeVPQlkZvuPv/MpELy6/o835BsNlZU/
 f32WHjlgmN4MSv1eZgdIbUg/j9lpgXYm5yB0XygOR7M6YgFQBNsExoqLIQHBQr5jjpNJ
 qzhrRZSkuQOdlo7WHQ+wneWQxvK0eMZlMITcxfGu2mQcVM7TEP3+ZpD6EIB7d7CaetB0
 NWyQ==
X-Gm-Message-State: APjAAAX9R7kmQOu/Lwj2ShY2iX74cly96P0D3r5KNa/ueYAYQBJwkiwb
 4W9QGFVN1gcJje0IzngfIDIs/N/PgHo=
X-Google-Smtp-Source: APXvYqy868ADWAtvmpGb4omG0KoE59erhIK2uYcPNwxx8rGuqkSleE6gvRHxtMlGmitvIQmnB3dJYg==
X-Received: by 2002:a2e:9753:: with SMTP id f19mr297198ljj.197.1569529033152; 
 Thu, 26 Sep 2019 13:17:13 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id f6sm47691lfl.78.2019.09.26.13.17.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2019 13:17:12 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id m13so192523ljj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 13:17:12 -0700 (PDT)
X-Received: by 2002:a2e:8789:: with SMTP id n9mr344627lji.52.1569529031736;
 Thu, 26 Sep 2019 13:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
 <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
 <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
In-Reply-To: <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Sep 2019 13:16:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
Message-ID: <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7RbCDRjRAvWcIi7QkdCjwk6XzzWsIsN9TecD9WwksU0=;
 b=aB5pA3SyZ5HaFLWIhKIPBd/X2uy1rvQJqJjWNTqTRvRCwfYAHVwoGVtpWvbJi2/gvM
 4lACq7gPi2ifoD1gBfDLo2nCP7EvRcJXd25QAJYSNV2Hv0abkMJ3RTdFJkKbYrWUIHZ0
 HfDtd6wvPm9AKCezZy9cGdX9Q1c6mc+eBmIyA=
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
Cc: Linux-MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTowOSBQTSBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJl
KQo8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4KPiBUaGF0IHNhaWQsIGlmIHBlb3Bs
ZSBhcmUgT0sgd2l0aCBtZSBtb2RpZnlpbmcgdGhlIGFzc2VydCBpbgo+IHB1ZF90cmFuc19odWdl
X2xvY2soKSBhbmQgbWFrZSBfX3dhbGtfcGFnZV9yYW5nZSBub24tc3RhdGljLCBpdCBzaG91bGQK
PiBwcm9iYWJseSBiZSBwb3NzaWJsZSB0byBtYWtlIGl0IHdvcmssIHllcy4KCkkgZG9uJ3QgdGhp
bmsgeW91IG5lZWQgdG8gbW9kaWZ5IHRoYXQgYXNzZXJ0IGF0IGFsbC4KClRoYXQgdGhpbmcgb25s
eSBleGlzdHMgd2hlbiB0aGVyZSdzIGEgInB1ZF9lbnRyeSIgb3AgaW4gdGhlIHdhbGtlciwKYW5k
IHRoZW4geW91IGFic29sdXRlbHkgbmVlZCB0byBoYXZlIHRoYXQgbW1hcF9sb2NrLgoKQXMgZmFy
IGFzIEkgY2FuIHRlbGwsIHlvdSBmdW5kYW1lbnRhbGx5IG9ubHkgZXZlciB3b3JrIG9uIGEgcHRl
IGxldmVsCmluIHlvdXIgYWRkcmVzcyBzcGFjZSB3YWxrZXIgYWxyZWFkeSBhbmQgYWN0dWFsbHkg
aGF2ZSBhIFdBUk5fT04oKSBvbgp0aGUgcHVkX2h1Z2UgdGhpbmcsIHNvIG5vIHB1ZCBlbnRyeSBj
YW4gcG9zc2libHkgYXBwbHkuCgpTbyBubywgdGhlIGFzc2VydCBpbiBwdWRfdHJhbnNfaHVnZV9s
b2NrKCkgZG9lcyBub3Qgc2VlbSB0byBiZSBhCnJlYXNvbiBub3QgdG8ganVzdCB1c2UgdGhlIGV4
aXN0aW5nIHBhZ2UgdGFibGUgd2Fsa2Vycy4KCkFuZCBvbmNlIHlvdSBnZXQgcmlkIG9mIHRoZSB3
YWxraW5nLCB3aGF0IGlzIGxlZnQ/IEp1c3QgdGhlICJpdGVyYXRlCm92ZXIgdGhlIGlub2RlIG1h
cHBpbmdzIiBwYXJ0LiBXaGljaCBjb3VsZCBqdXN0IGJlIGRvbmUgaW4KbW0vcGFnZXdhbGsuYywg
YW5kIHRoZW4geW91IGRvbid0IGV2ZW4gbmVlZCB0byByZW1vdmUgdGhlIHN0YXRpYy4KClNvIG1h
a2luZyBpdCBiZSBqdXN0IGFub3RoZXIgd2Fsa2luZyBpbiBwYWdld2Fsay5jIHdvdWxkIHNlZW0g
dG8gYmUKdGhlIHNpbXBsZXN0IG1vZGVsLgoKQ2FsbCBpdCAid2Fsa19wYWdlX21hcHBpbmcoKSIu
IEFuZCB0YWxrIGV4dGVuc2l2ZWx5IGFib3V0IGhvdyB0aGUKbG9ja2luZyBkaWZmZXJzIGEgbG90
IGZyb20gdGhlIHVzdWFsICJ3YWxrX3BhZ2Vfdm1hKCkiIHRoaW5ncy4KClRoZSB0aGVuIGFjdHVh
bCAiYXBwbHkiIGZ1bmN0aW9ucyAod2hhdCBhIGhvcnJpZCBuYW1lKSBjb3VsZCBiZSBpbiB0aGUK
dXNlcnMuIFRoZXkgc2hvdWxkbid0IGJlIG1peGVkIGluIHdpdGggdGhlIHdhbGtpbmcgZnVuY3Rp
b25zIGFueXdheS4KVGhleSBhcmUgY2FsbGJhY2tzLCBub3Qgd2Fsa2Vycy4KCiAgICAgICAgICAg
ICBMaW51cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
