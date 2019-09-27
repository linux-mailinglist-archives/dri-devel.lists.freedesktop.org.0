Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E19C09B7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 18:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6FE6E14D;
	Fri, 27 Sep 2019 16:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A68D6E14D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 16:40:08 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id j19so3161552lja.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 09:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xikpq9YYpaESAspYkHi86qdMdW/0HQNg7LvP7+WL5BI=;
 b=cKmCTuopyUZzphU8qBiC7imfLuyC7U+4C+Gm4g6js+1VOo6WVOwMaro5VERFvgsQoq
 8w6lQXEWPHPlTRDdXCqymAVb0DRB99czRIe0NzLYBKSTemo2ir3Am93ZiduInwJkS/g5
 G1rBLCx2DobXQtgk3rZ6jHjurZge57x6oQzMvBl4ic4VWuIzd2yZIXLE7DkxXkr5jizG
 6jYI+AIfFwUeHs1Jr++l/OrCz88sivrnG/FX9I45Pz2xf4ebCTOpHYmIZ8itZgEfWsw8
 Lluiqoz6f3op6W9HnB8ZAzQz23s3tS3fGEbavQAxYblGp1CsOyTWEXnHPqjLEoyBFU9Q
 vC7g==
X-Gm-Message-State: APjAAAWbSEpAHn2+vSNAR/C8clFYqx/5Gtsj3E9spmL8yGEZFMnwXEKu
 asjQRBiW8F2SG1GUel2m7kTH9wqHR98=
X-Google-Smtp-Source: APXvYqw4ROD3usEgCUuteSr8kB0VT+wN0Bbp/RjpQV68CY89Qqv3f4T1M+lVAN4HwDO/cVqgOQB+tQ==
X-Received: by 2002:a2e:412:: with SMTP id 18mr3579946lje.96.1569602406277;
 Fri, 27 Sep 2019 09:40:06 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id i142sm575919lfi.5.2019.09.27.09.40.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2019 09:40:05 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id r22so2421781lfm.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 09:40:04 -0700 (PDT)
X-Received: by 2002:a19:f204:: with SMTP id q4mr3381847lfh.29.1569602404666;
 Fri, 27 Sep 2019 09:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
 <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
 <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
 <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
 <20190927121754.kn46qh2crvsnw5z2@box>
In-Reply-To: <20190927121754.kn46qh2crvsnw5z2@box>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Sep 2019 09:39:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=whfriLqivyRtyjDPzeNr_Y3UYkC9g123Yi_yB5c8Gcmiw@mail.gmail.com>
Message-ID: <CAHk-=whfriLqivyRtyjDPzeNr_Y3UYkC9g123Yi_yB5c8Gcmiw@mail.gmail.com>
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
To: "Kirill A. Shutemov" <kirill@shutemov.name>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xikpq9YYpaESAspYkHi86qdMdW/0HQNg7LvP7+WL5BI=;
 b=IbzOc3i8Qh0m8AF1EsRhezxjzpKCXsufVYfdSoXZLVLOVoGXeqKHkqV7wBluqDOwbT
 MCp9ANQ3eaGMUd8ZEHipocDweq22Nvp//cUG/Wnjk17KiGBd1UpAGJPuLeiMx8y+mZqx
 jxeglbySlcyzMuq1nYuuyMtVfExCtAU9niysk=
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgNToxNyBBTSBLaXJpbGwgQS4gU2h1dGVtb3YgPGtpcmls
bEBzaHV0ZW1vdi5uYW1lPiB3cm90ZToKPgo+ID4gQ2FsbCBpdCAid2Fsa19wYWdlX21hcHBpbmco
KSIuIEFuZCB0YWxrIGV4dGVuc2l2ZWx5IGFib3V0IGhvdyB0aGUKPiA+IGxvY2tpbmcgZGlmZmVy
cyBhIGxvdCBmcm9tIHRoZSB1c3VhbCAid2Fsa19wYWdlX3ZtYSgpIiB0aGluZ3MuCj4KPiBXYWxr
aW5nIG1hcHBpbmdzIG9mIGEgcGFnZSBpcyB3aGF0IHJtYXAgZG9lcy4gVGhpcyBjb2RlIHRoYXMg
dG8gYmUKPiBpbnRlZ3JhdGVkIHRoZXJlLgoKV2VsbCwgdGhhdCdzIHZlcnkgcXVlc3Rpb25hYmxl
LgoKVGhlIHJtYXAgY29kZSBtYWlubHkgZG9lcyB0aGUgInBhZ2UgLT4gdmlydHVhbCIgbWFwcGlu
Zy4gIE9uZSBwYWdlIGF0IGEgdGltZS4KClRoZSBwYWdlIHdhbGtlciBjb2RlIGRvZXMgdGhlICJ2
aXJ0dWFsIC0+IHB0ZSIgbWFwcGluZy4gQWx3YXlzIGEgd2hvbGUKcmFuZ2UgYXQgYSB0aW1lLgoK
VGhlIG5ldyBjb2RlIHdhbnRzIGEgY29tYmluYXRpb24gb2YgYm90aC4KCkl0IHZlcnkgbXVjaCBp
cyBhYm91dCB3YWxraW5nIHJhbmdlcyAtIGFzIGluIG1tL3BhZ2V3YWxrLmMuIEl0J3MganVzdAp0
aGF0IGl0IHdhbGtzIHBvdGVudGlhbGx5IG11bHRpcGxlIHJhbmdlcywgYmFzZWQgb24gd2hlcmUg
dGhlIGFkZHJlc3MKc3BhY2UgaXMgbWFwcGVkLgoKSSB0aGluayBpdCBoYXMgd2F5IG1vcmUgY29t
bW9uYWxpdGllcyB3aXRoIHRoZSBwYWdlIHdhbGtpbmcgY29kZSB0aGFuCml0IGhhcyB3aXRoIHRo
ZSBybWFwIGNvZGUuIEJ1dCB5ZXMsIHRoZXJlIGlzIHNvbWUgb2YgdGhhdCAibG9vayB1cAptYXBw
aW5ncyBiYXNlZCBvbiBhZGRyZXNzIHNwYWNlIiBpbiB0aGVyZSB0b28sIGJ1dCBpdCdzIHRoZSBs
ZWFzdCBwYXJ0Cm9mIGl0CgpBbmQgYXMgVGhvbWFzIHBvaW50ZWQgb3V0LCBpdCBhbHNvIGhhcyBj
b21tb25hbGl0aWVzIHdpdGgKdW5tYXBfbWFwcGluZ19wYWdlcygpIGluIG1tL21lbW9yeS5jLiBJ
biBtYW55IHdheXMgdGhhdCBwYXJ0IGlzIHRoZQpjbG9zZXN0LgoKSSdkIHNheSB0aGF0IGZyb20g
YSBjb2RlIHNoYXJpbmcgc3RhbmRwb2ludCwgbW0vcm1hcC5jIGlzIGFic29sdXRlbHkKdGhlIHdy
b25nIHBsYWNlLiBJdCdzIHRoZSBmdXJ0aGVzdCBhd2F5IGZyb20gd2hhdCBUaG9tYXMgd2FudHMg
dG8gZG8uCgpUaGUgbW0vcGFnZXdhbGsuYyBjb2RlIGhhcyB0aGUgbW9zdCBhY3R1YWwgY29kZSB0
aGF0IGNvdWxkIGJlIHNoYXJlZCwKYW5kIHRoZSBhZGRpdGlvbiB3b3VsZCBiZSBzbWFsbGVzdCB0
aGVyZS4KCkFuZCBjb25jZXB0dWFsbHkgdGhlIGNsb3Nlc3QgYW5hbG9ndWUgaW4gdGVybXMgb2Yg
d2hhdCBpdCBfZG9lc18gaXMKdW5tYXBfbWFwcGluZ19yYW5nZSgpIGluIG1tL21lbW9yeS5jLCBi
dXQgSSBzZWUgbm8gcm9vbSBmb3Igc2hhcmluZwphY3R1YWwgY29kZSB0aGVyZSB1bmxlc3Mgd2Ug
Y29tcGxldGVseSBjaGFuZ2UgaG93IHdlIGRvCnphcF9wYWdlX3JhbmdlKCkgYW5kIGFkZCBhIGxv
dCBvZiBjb25maWd1cmFiaWxpdHkgdGhlcmUgKHdoaWNoIHdlCmRvbid0IHdhbnQsIGJlY2F1c2Ug
cGFnZSB0YWJsZSB0ZWFyZG93biBhdCBleGl0IGlzIHJlYWxseSBhIHByZXR0eQpjcml0aWNhbCBv
cGVyYXRpb24gLSBJIGNvbW1vbmx5IHNlZSBjb3B5X3BhZ2VfcmFuZ2UoKSBhbmQKemFwX3BhZ2Vf
cmFuZ2UoKSBvbiBwcm9maWxlcyBpZiB5b3UgaGF2ZSB0aGluZ3MgbGlrZSBzY3JpcHQtaGVhdnl1
CnRyYWRpdGlvbmFsIFVOSVggbG9hZHMpLgoKU28gSSB0aGluayBjb25jZXB0dWFsbHksIG1tL21l
bW9yeS5jIGFuZCB1bm1hcF9tYXBwaW5nX3JhbmdlKCkgaXMKY2xvc2VzdCBidXQgSSBkb24ndCB0
aGluayBpdCdzIHByYWN0aWNhbCB0byBzaGFyZSBjb2RlLgoKQW5kIGJldHdlZW4gbW0vcGFnZXdh
bGsuYyBhbmQgbW0vcm1hcC5jLCBJIHRoaW5rIHRoZSBwYWdlIHdhbGtpbmcgaGFzCndheSBtb3Jl
IG9mIGFjdHVhbCBwcmFjdGljYWwgY29kZSBzaGFyaW5nLCBhbmQgaXMgYWxzbyBjb25jZXB0dWFs
bHkKY2xvc2VyIGJlY2F1c2UgbW9zdCBvZiB0aGUgY29kZSBpcyBhYm91dCB3YWxraW5nIGEgcmFu
Z2UsIG5vdCBsb29raW5nCnVwIHRoZSBtYXBwaW5nIG9mIG9uZSBwYWdlLgoKICAgICAgICAgICAg
ICAgTGludXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
