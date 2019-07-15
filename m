Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FB769AEC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 20:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD1C89AB7;
	Mon, 15 Jul 2019 18:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9EC89AB7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 18:38:12 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id v24so17312517ljg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Df/Yx/4+nCeEeOKf1uVvrrlXDNI2FBEEjRZW46mr8Bc=;
 b=FoosWLDcaaAAE50O/mL3GwkilSIG5ELhT1O4hft28Ju6Lp6UNhrlyw7ZqSyINVCzJ/
 UwympcfznkFSMHexs+JnLAaOR4Sjom4hCI4iXpO3safJJKNyybD/OicLtLNichUhNM1T
 VLnjz9O7HFcsnc2wwlGVZn3f7YGSZ+ZknidKyWCXPw2ixajzJ59ZfuqNTysz3OvUCDOd
 fZLG171Z+xcXduz78bxKzIK5Gg+iAb5CaCEGXRUruYBJZgYHHg7TmQLB7yDhB/kw4zzH
 JDjaXsZkR2X6TtRU9EDF7CopPS9o2vPl/KXrmWxNAcR0bdaqlUfbqby5TTCI5Ya7r3VY
 WJTA==
X-Gm-Message-State: APjAAAWfK1ydQFZH9bwLG60PO37sW6ep8oSIP8xCWLu760YrmhJfMvYf
 Ru7cBFc6n4bk0z8wJe69Xkxepprozw0=
X-Google-Smtp-Source: APXvYqwa/iHyW6GRswJv4VPI98D1eVMSr7LhWRGy9MpN5/MtYdBC8RmdZHPbuWe82P9XKYc9KXqySw==
X-Received: by 2002:a2e:9758:: with SMTP id f24mr14988445ljj.58.1563215888705; 
 Mon, 15 Jul 2019 11:38:08 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id m17sm2430531lfj.22.2019.07.15.11.38.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 11:38:07 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id v24so17312359ljg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:38:07 -0700 (PDT)
X-Received: by 2002:a2e:9bc6:: with SMTP id w6mr15258415ljj.156.1563215887270; 
 Mon, 15 Jul 2019 11:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9twvwhm318btWy_WkQxOcpRCzjpok52R8zPQxQrnQ8QzwQ@mail.gmail.com>
 <CAHk-=wjC3VX5hSeGRA1SCLjT+hewPbbG4vSJPFK7iy26z4QAyw@mail.gmail.com>
 <CAHk-=wiD6a189CXj-ugRzCxA9r1+siSCA0eP_eoZ_bk_bLTRMw@mail.gmail.com>
 <CAPM=9tx9N=qDnt8sn6dMw4BmfPwh-qNPGXDg5FA5fh5hKmooEA@mail.gmail.com>
In-Reply-To: <CAPM=9tx9N=qDnt8sn6dMw4BmfPwh-qNPGXDg5FA5fh5hKmooEA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Jul 2019 11:37:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg5CBo_1Q8MCF9iVVY1yqUS=sVCE8qA4wXw--QxzAqzNA@mail.gmail.com>
Message-ID: <CAHk-=wg5CBo_1Q8MCF9iVVY1yqUS=sVCE8qA4wXw--QxzAqzNA@mail.gmail.com>
Subject: Re: drm pull for v5.3-rc1
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Df/Yx/4+nCeEeOKf1uVvrrlXDNI2FBEEjRZW46mr8Bc=;
 b=PTL1nlF48G2tEQXY/Fs49JRstAULEghq3sqmvSB88fxjgt/mTefVpWKJ/dfeDx+Csy
 UFzqAMISngDRHnbeO82HN05He3V7Wtr08QNjlTbsj1Oit8nCa+5LtO4pw/DYBi7Tmtzh
 d93fJIWcQzwyJxWTyH1KBtFt8sOQQ2qz30SJk=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMTE6MjkgQU0gRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPiB3cm90ZToKPgo+IE5vdCB0aGF0IEkgd2FudCB0byBkZWZlbmQgdGhhdCBjb2RlLCBi
dXQgdGhlIG1tIHBhdGNoIHRoYXQgY29uZmxpY3RzCj4gYWxyZWFkeSBzaG93cyB0aGF0IHJlbW92
aW5nIHRoZSB0b2tlbiBpcyBmaW5lIGFzIG5vYm9keSBuZWVkcyBvcgo+IHJlcXVpcmVzIGl0LiBT
byB0aGUgZml4dXAgcGF0Y2ggaW4gbXkgdHJlZSB3YXMganVzdCBhIGJyaWRnZSB0byB0aGF0IHBh
dGNoLAo+IHdoaWNoIHJlZHVjZXMgY29uZmxpY3RzLiBSaXAgdGhlIHRva2VuIG91dCBvZiB0aGUg
bmV3IEFQSSwgcGFzcyBpdCBhcyBOVUxMCj4gdG8gdGhlIG9sZCBBUEkgdW50aWwgdGhlIG1tIHBh
dGNoIGlzIG1lcmdlZCBhZ2FpbnN0IGl0IHdoaWNoIGRyb3BzIHRoZQo+IHRva2VuIGZyb20gdGhl
IG9sZCBBUEkuCgpXZWxsLCB0byBtZSB0aGUgIm9sZCIgQVBJIGxvb2tzIGxpa2UgYSBuZXcgb25l
IHRvbywgc2luY2UgaXQncyB0aGF0CiJzdHJ1Y3QgcGFnZV9yYW5nZV9hcHBseSIgdGhpbmcuCgpC
dXQgSSBjYW4gYXBwcmVjaWF0ZSB0aGF0IGl0IG1ha2VzIGZvciBtaW5pbWFsIHBhdGNoIHRvIGF2
b2lkCmNvbmZsaWN0cyB3aXRoIG90aGVyIHBhdGNoZXMuIEl0IGp1c3QgZG9lc24ndCBsb29rIHZl
cnkgc2Vuc2libGUKc3RhbmQtYWxvbmUgYWZhaWsuCgpJIG1pZ2h0IGJlIG1pc3Npbmcgc29tZXRo
aW5nLgoKQnV0IHRoYXQgbGFzdCBwYXRjaCBpcyBtb3JlIG9mIGEgZGV0YWlsIC0gaXQgd291bGRu
J3QgZXZlbiBleGlzdCBpZiBpdAp3YXNuJ3QgZm9yIHRoZSBlYXJsaWVyIG1tIHBhdGNoZXMsIGFu
ZCB0aG9zZSBhcmUgdGhlIG9uZXMgdGhhdCBtYWtlIG1lCmdvIG1vcmUgdGhhbiAiV2hhYT8iIHNv
IGl0J3Mgbm90IGxpa2UgdGhpcyBpcyByZWFsbHkgYWxsIHRoYXQgYmlnIG9mCmFuIGlzc3VlLiBN
b3JlIG9mIGp1c3QgYSBub3RlIEkgbWFkZSB3aGlsZSBsb29raW5nIHRocm91Z2ggdGhlIG1tCnBh
cnRzLgoKICAgICAgICAgICAgICAgICBMaW51cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
