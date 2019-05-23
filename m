Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B86B2809D
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 17:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA9389F2E;
	Thu, 23 May 2019 15:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EAF89F2E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 15:11:02 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c17so4686433lfi.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 08:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+XRLAU6oU5E0/8gW3lY2rtdeODZlzcPWAFZA13HWTCU=;
 b=G7EoYTqRkoY8FYPNQtWp2CcxgXvTD5rTD8eB+/YAK1Frk34EL04nYfL8r4rnCg6Rqq
 xYKcWuwFVXnbdl5FIGtDQ5mXTVbk9glJnMauqN3PO6kNsOrfvr2srwwAfK1IhSNanBdM
 scGaNjT/IVncMNO6CGCh6Zro0bVOhGdAoAtM7FO64bUN+eCiHWsyMr15HpQXxbxNzXq1
 9q5oGVHBQov9Tzg8+s1joY3moMoZhcLHBeZ3eq978Sgt1qRvXAk1NxvxGKNq5QkU9kaH
 M6EGJQeAyDtobEqm546P3mvA8PfTZAdwGIufMz5UyWPzt+WY0fqzp5s2Yy8jD80vWnQF
 IMMw==
X-Gm-Message-State: APjAAAU3wTaanEc6L36pBE57AIaBa8OZkQ9p1GEQJ0yqmsP1nwN4aB0U
 YnGUVVD1u5h7mgpaAyZqxU4ZAZBR2YA=
X-Google-Smtp-Source: APXvYqyzGY1lDVU1+bEL5b6H6IOHFD/3slOSCi20kU3AOXrpUgERf6J52mzr9OQ9sQ3anHIF3KUdxQ==
X-Received: by 2002:a19:5045:: with SMTP id z5mr48794366lfj.108.1558624261017; 
 Thu, 23 May 2019 08:11:01 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id n196sm5397781lfn.18.2019.05.23.08.11.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 08:11:00 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id q16so5814551ljj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 08:11:00 -0700 (PDT)
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr18999482lji.189.1558624260065; 
 Thu, 23 May 2019 08:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190523100013.52a8d2a6@gandalf.local.home>
In-Reply-To: <20190523100013.52a8d2a6@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 May 2019 08:10:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg5HqJ2Kfgpub+tCWQ2_FiFwEW9H1Rm+an-BLGaGvDDXw@mail.gmail.com>
Message-ID: <CAHk-=wg5HqJ2Kfgpub+tCWQ2_FiFwEW9H1Rm+an-BLGaGvDDXw@mail.gmail.com>
Subject: Re: [RFC][PATCH] kernel.h: Add generic roundup_64() macro
To: Steven Rostedt <rostedt@goodmis.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+XRLAU6oU5E0/8gW3lY2rtdeODZlzcPWAFZA13HWTCU=;
 b=A87Rf4qG4wn9ePdBXWK4S6A+i4fN/l2BHBriTyA/NV7md909J0ajFqoql7nafgIWFX
 zNeMu8SMtxpeDziW/96Gcai5LoSeFlFor/iwm8XXRysAwkMkqUmZRyYrQAC88L1pZlXU
 ZQKZDUd8/qaGGjTkJPmRfmYpeswXlH3T1V2Y0=
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-xfs@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgNzowMCBBTSBTdGV2ZW4gUm9zdGVkdCA8cm9zdGVkdEBn
b29kbWlzLm9yZz4gd3JvdGU6Cj4KPiArIyBkZWZpbmUgcm91bmR1cF82NCh4LCB5KSAoICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiAreyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIHR5cGVvZih5KSBfX3kgPSB5OyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIHR5cGVvZih4KSBfX3ggPSAo
eCkgKyAoX195IC0gMSk7ICAgICAgICAgICAgICAgIFwKPiArICAgICAgIGRvX2RpdihfX3gsIF9f
eSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIF9feCAqIF9feTsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArfSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKClRoZSB0aGluZyBhYm91
dCB0aGlzIGlzIHRoYXQgaXQgYWJzb2x1dGVseSBzdWNrcyBmb3IgcG93ZXItb2YtdHdvIGFyZ3Vt
ZW50cy4KClRoZSByZWd1bGFyIHJvdW5kdXAoKSB0aGF0IHVzZXMgZGl2aXNpb24gaGFzIHRoZSBj
b21waWxlciBhdCBsZWFzdApvcHRpbWl6ZSB0aGVtIHRvIHNoaWZ0cyAtIGF0IGxlYXN0IGZvciBj
b25zdGFudCBjYXNlcy4gQnV0IGRvX2RpdigpIGlzCm1lYW50IGZvciAid2UgYWxyZWFkeSBrbm93
IGl0J3Mgbm90IGEgcG93ZXIgb2YgdHdvIiwgYW5kIHRoZSBjb21waWxlcgpkb2Vzbid0IGhhdmUg
YW55IHVuZGVyc3RhbmRpbmcgb2YgdGhlIGludGVybmFscy4KCkFuZCBpdCBsb29rcyB0byBtZSBs
aWtlIHRoZSB1c2UgY2FzZSB5b3Ugd2FudCB0aGlzIGZvciBpcyB2ZXJ5IG11Y2gKcHJvYmFibHkg
YSBwb3dlciBvZiB0d28uIEluIHdoaWNoIGNhc2UgZGl2aXNpb24gaXMgYWxsIGtpbmRzIG9mIGp1
c3QKc3R1cGlkLgoKQW5kIHdlIGFscmVhZHkgaGF2ZSBhIHBvd2VyLW9mLXR3byByb3VuZCB1cCBm
dW5jdGlvbiB0aGF0IHdvcmtzIG9uCnU2NC4gSXQncyBjYWxsZWQgInJvdW5kX3VwKCkiLgoKSSB3
aXNoIHdlIGhhZCBhIGJldHRlciB2aXN1YWwgd2FybmluZyBhYm91dCB0aGUgZGlmZmVyZW5jZXMg
YmV0d2Vlbgoicm91bmRfdXAoKSIgKGxpbWl0ZWQgdG8gcG93ZXJzLW9mLXR3bywgYnV0IGVmZmlj
aWVudCwgYW5kIHdvcmtzIHdpdGgKYW55IHNpemUpIGFuZCAicm91bmR1cCgpIiAoZ2VuZXJpYywg
cG90ZW50aWFsbHkgaG9ycmlibHkgc2xvdywgYW5kCmRvZXNuJ3Qgd29yayBmb3IgNjQtYml0IG9u
IDMyLWJpdCkuCgpTaWRlIG5vdGU6ICJyb3VuZF91cCgpIiBoYXMgdGhlIHByb2JsZW0gdGhhdCBp
dCB1c2VzICJ4IiB0d2ljZS4KCkVuZCByZXN1bHQ6IHNvbWVib2R5IHNob3VsZCBsb29rIGF0IHRo
aXMsIGJ1dCBJIHJlYWxseSBkb24ndCBsaWtlIHRoZQoiZm9yY2UgZGl2aXNpb24iIGNhc2UgdGhh
dCBpcyBsaWtlbHkgaG9ycmlibHkgc2xvdyBhbmQgbmFzdHkuCgogICAgICAgICAgICAgICAgICBM
aW51cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
