Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7CE184A1
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 06:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5B0899A5;
	Thu,  9 May 2019 04:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0C0892E0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 04:45:48 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d15so803675ljc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 21:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AQ3ahBtrby00WGAyZWof9Vlr6BSMHsqFyhjQEamJnzE=;
 b=a/om66OlB3AjyWaqAzTlkTAtZQ/zCDnVSRxz9IaoWvHbp9P6tlJG2w9PcOg05os0fn
 gSn5jtHJus7++t4KGmTInhJLPCkLihOIkoAlsILkuD1NI60eN+RdlxqQZL/faMALRE+b
 8JMJvBykvkZbTMlkGA+qqjhgWk6txsliENGtB41ZDgDY70VFKNNFRzr2nF9K2y3TTM4h
 Q4uMgS4rGhJVxNC56MAtpzRj8qWq9cT9HX97H1oPtdLD/X55EzfnKwPp6qH/xA2dVadG
 99ccL0QSBwrPlU3qgDHqWPYqGQGHjfS59v/mn3U1Ycpv2x4QUNgMuoEhPrkXxROOJufb
 XDSw==
X-Gm-Message-State: APjAAAVoldw4OdyNKvCTKc9+Ol97naVbppooREXb05m4JLnzAZtGqmuI
 OTIoqha5g8muZ0yXZxHipq8fcn63Mjg=
X-Google-Smtp-Source: APXvYqw6LNlAdu02Xja+2WPpK0JAmEV5luUGxxwdKbY5O/oQ6JAT8GmH69qrHQdFi1sBQQ8lSJfj6w==
X-Received: by 2002:a2e:7510:: with SMTP id q16mr882351ljc.160.1557377146307; 
 Wed, 08 May 2019 21:45:46 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id v86sm122942lje.73.2019.05.08.21.45.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 21:45:45 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id h126so537865lfh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 21:45:45 -0700 (PDT)
X-Received: by 2002:a19:ca02:: with SMTP id a2mr1028796lfg.88.1557377144919;
 Wed, 08 May 2019 21:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyFp5LZ6QO1TaDK5jSb5+2SCe3Rjmk0_juVfr-zfspBLg@mail.gmail.com>
In-Reply-To: <CAPM=9tyFp5LZ6QO1TaDK5jSb5+2SCe3Rjmk0_juVfr-zfspBLg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 May 2019 21:45:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg6imuGGw_4d6ywhu=0Kxr+H2S=hHavoDXYjN6o7SqMUg@mail.gmail.com>
Message-ID: <CAHk-=wg6imuGGw_4d6ywhu=0Kxr+H2S=hHavoDXYjN6o7SqMUg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.2-rc1
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AQ3ahBtrby00WGAyZWof9Vlr6BSMHsqFyhjQEamJnzE=;
 b=V1aIeV7NQDjmmXhVAKkywYFX6AKTuO6do8R9nS8zNOfezCIDk7mpi1oKUNpvDujRq7
 9tjfCPAh139UsCgLmGYasz6j3iOgjZuAB3H3fmE0Yk9elQxT5rGKkCd7f11W8OqmGil2
 BNo+a22azdGP+taAkZXgH3LYllXbknT3A7PHc=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGF2ZSwKCk9uIFdlZCwgTWF5IDgsIDIwMTkgYXQgODoyOCBQTSBEYXZlIEFpcmxpZSA8YWlybGll
ZEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBpcyB0aGUgbWFpbiBkcm0gcHVsbCByZXF1ZXN0
IGZvciA1LjIuCgpUaGFua3MuIEkndmUgbWVyZ2VkIGl0LCBidXQgSSBnb3QgYSBjb3VwbGUgb2Yg
Y29uZmxpY3RzIHdpdGggZml4ZXMKKHJldmVydHMpIHRvIG1haW5saW5lIGluIHRoZSBtZWFudGlt
ZS4KClRoZSBvbmUgdG8gdGhlIGk5MTUgZHJpdmVyIHlvdSBzZWVtIHRvIGhhdmUgYXBwbGllZCBh
Z2FpbiAoYWZ0ZXIgdGhlCmZ1bmN0aW9uIHdhcyBtb3ZlZCBhbmQgcmVuYW1lZCkuCgpUaGUgb25l
IHRvIHRoZSB2aXJ0Z3B1IGRyaXZlciwgSSByZWFsbHkgZG9uJ3Qga25vdyBpZiBpcyBuZWVkZWQg
YW55Cm1vcmUuIEkgc3VzcGVjdCBJIGNvbXBsZXRlbHkgdW5uZWNlc3NhcmlseSBtZXJnZWQgdGhh
dAp2aXJ0Z3B1X2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoKSBmdW5jdGlvbiB0aGF0IGNhbWUg
aW4gYmVjYXVzZSBJCmRlY2lkZWQgdG8gZG8gdGhlIG1lcmdlIG9mIHRoZSByZXZlcnQuCgpJdCdz
IGEgdHJpdmlhbCBmdW5jdGlvbiB0aGF0IGp1c3QgcmV0dXJucyBhbiBlcnJvciwgYW5kIHlvdXIg
dHJlZSBqdXN0CmxlYXZlcyBpdCBhcyBOVUxMLCBhbmQgSSBzdXNwZWN0IG15IG1lcmdlIGRvZXNu
J3QgaHVydCwgYnV0IGl0IGFsc28KcHJvYmFibHkgZG9lc24ndCBtYXR0ZXIuCgpTbyB5b3Ugc2hv
dWxkIGNoZWNrIG15IG1lcmdlLgoKVGhhbmtzLAoKICAgICAgICAgICAgICAgIExpbnVzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
