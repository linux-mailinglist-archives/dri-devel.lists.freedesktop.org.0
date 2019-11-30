Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C399810DE83
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 19:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96176E15A;
	Sat, 30 Nov 2019 18:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C615E6E158
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 18:23:50 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id r19so1503450ljg.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 10:23:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u0JfrhdDhzTetmUD+84kClCBoBttknwfKi4pRj2979M=;
 b=BjVGC6MrK7pSzHnkQKHFH6U6VvLWuMVMbF4gARLwGM2q8/DCW49RImsn8LYruDM1cH
 qpMhZsUQL8gAQWw/Bsm4/k9aoOJTmP6DA/tWqyIDOR7vtKKbEihETtUJyvIlxxuFmJdG
 OIco0Uml8NChOIpGHdd5OcpDtFMgUBcQ6923lr6QLrqhKA7v6xLrdYdpovewWHFcL4Ie
 gPaOJ7YjwPJrQBK8yxHD0cJs4QfqdyP/o85pWyPLkYlaVQgfr62xl1SG++J4VRVfsvvX
 GT7vlaj+PJw0Crl2L0a10DZenoXpLmje4ut5wyS/P+b5L9b2HsbiuDqmY4DzufF0UOjT
 3TFQ==
X-Gm-Message-State: APjAAAW7t554Kc38/kSuKL9FfjGMWPrK+TzWnqChxk1bmVGF3S8ddSuC
 qnChMBa8skE6s6Z53olgRZ1e3/GG72k=
X-Google-Smtp-Source: APXvYqwdDV95WWk2q6oMrU7KLG5D5CQkyUCuGUQc0eoJhFBGjlw+JVsIvexGc6UddIMJFsGZFkRFkw==
X-Received: by 2002:a2e:5843:: with SMTP id x3mr11335239ljd.64.1575138228928; 
 Sat, 30 Nov 2019 10:23:48 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id w6sm5531059lfq.95.2019.11.30.10.23.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Nov 2019 10:23:48 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id m30so23037499lfp.8
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 10:23:47 -0800 (PST)
X-Received: by 2002:a19:4bd4:: with SMTP id y203mr36767338lfa.61.1575138227505; 
 Sat, 30 Nov 2019 10:23:47 -0800 (PST)
MIME-Version: 1.0
References: <20191125204248.GA2485@ziepe.ca>
 <CAHk-=wiqguF5NakpL4L9XCmmYr4wY0wk__+6+wHVReF2sVVZhA@mail.gmail.com>
In-Reply-To: <CAHk-=wiqguF5NakpL4L9XCmmYr4wY0wk__+6+wHVReF2sVVZhA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 30 Nov 2019 10:23:31 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiQtTsZfgTwLYgfV8Gr_0JJiboZOzVUTAgJ2xTdf5bMiw@mail.gmail.com>
Message-ID: <CAHk-=wiQtTsZfgTwLYgfV8Gr_0JJiboZOzVUTAgJ2xTdf5bMiw@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull hmm changes
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=u0JfrhdDhzTetmUD+84kClCBoBttknwfKi4pRj2979M=;
 b=bf0MgGTip6d1PItDL8VGeE1qaDY/j9ixz0qpAQkf5F6v9M5aNPOpI4jjr2XPxAxhcA
 GJKbY/6+tUCS+LVQS13ljyhVcfEbxwb3tv5e7NTZlJijMtJ6r3T+eylFOA0z7JAlzHKn
 R52/jRzjHqCo8LV/hAE+usMuZz8TLO3DZuEW4=
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, David Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBOb3YgMzAsIDIwMTkgYXQgMTA6MDMgQU0gTGludXMgVG9ydmFsZHMKPHRvcnZhbGRz
QGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IEknbGwgdHJ5IHRvIGZpZ3VyZSB0aGUg
Y29kZSBvdXQsIGJ1dCBteSBpbml0aWFsIHJlYWN0aW9uIHdhcyAieWVhaCwKPiBub3QgaW4gbXkg
Vk0iLgoKV2h5IGlzIGl0IG9rIHRvIHNvbWV0aW1lcyBkbwoKICAgIFdSSVRFX09OQ0UobW5pLT5p
bnZhbGlkYXRlX3NlcSwgY3VyX3NlcSk7CgoodG8gcGFpciB3aXRoIHRoZSB1bmxvY2tlZCBSRUFE
X09OQ0UpLCBhbmQgc29tZXRpbWVzIHRoZW4gZG8KCiAgICBtbmktPmludmFsaWRhdGVfc2VxID0g
bW1uX21tLT5pbnZhbGlkYXRlX3NlcTsKCk15IGluaXRpYWwgZ3Vlc3Mgd2FzIHRoYXQgbGF0dGVy
IGlzIG9ubHkgZG9uZSBhdCBpbml0aWFsaXphdGlvbiB0aW1lLApidXQgYXQgbGVhc3QgaW4gb25l
IGNhc2UgaXQncyBkb25lICphZnRlciogdGhlIG1uaSBoYXMgYmVlbiBhZGRlZCB0bwp0aGUgbW1u
X21tIChvaCwgaG93IEkgZGVzcGlzZSB0aG9zZSBuYW1lcyAtIEkgY2FuIG9ubHkgcmVwZWF0OiBX
VEY/KS4KClNlZSBfX21tdV9pbnRlcnZhbF9ub3RpZmllcl9pbnNlcnQoKSBpbiB0aGUKbW1uX21t
LT5hY3RpdmVfaW52YWxpZGF0ZV9yYW5nZXMgY2FzZS4KCkknbSBndWVzc2luZyB0aGF0IGl0IGRv
ZXNuJ3QgbWF0dGVyLCBiZWNhdXNlIHdoZW4gaW5zZXJ0aW5nIHRoZQpub3RpZmllciB0aGUgc2Vx
dWVuY2UgbnVtYmVyIGlzIHByZXN1bWFibHkgbm90IHVzZWQgdW50aWwgYWZ0ZXIgdGhlCmluc2Vy
dGlvbiAoYW5kIGFueSB1c2UgdGhvdWdoIG1tbl9tbSBpcyBwcm90ZWN0ZWQgYnkgdGhlCm1tbl9t
bS0+bG9jayksIGJ1dCBpdCBzdGlsbCBsb29rcyBvZGQgdG8gbWUuCgogICAgICAgICAgICAgICBM
aW51cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
