Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3FF69B69
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 21:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA5289688;
	Mon, 15 Jul 2019 19:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6F489791
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 19:32:04 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id v18so17438283ljh.6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 12:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QH6mzwJIBaZ3G36AHlLbxgzJ8rwuVsgI+lLEoxYsK9w=;
 b=MlKpfcbjKOGtU3fST3CgEg/Nhz3CRR9zxsgTKZUaR6aptoz5jTXE0zja3VFPp/hvIa
 JqiWFFVsdrvxPQ9KGvFVqPcg5apJ6T0sOYU2mJNL+9PdtEZaiUhZ93AX934eUCv2z5lb
 MPBV78UqGY7INuQ+PYXa9Ob2kgOweR67DkkUgfU6vExJunOnvhiYQBB80GidSSNU5ZjN
 TJzmCCvfKc9bLAEA5Vaj3+wpSYfZ45pvnkDcqsuu9qKMgovEdcwjmmY6FmGT+TLi4IOO
 OJkkqfHj12CR90LZVDgq+ck8LeJPrdp55GGYYxnfXliQUzMzduWj63VaZ4eXi5z55MmZ
 qK7Q==
X-Gm-Message-State: APjAAAVh6aMLeAnJ6HU4RwTYAOOhu5uiaR3iLDj5YF8cP/aGvPup+Vjj
 jPpyD3E2yTf0Ty9Zz1utiTqe8SG/6rY=
X-Google-Smtp-Source: APXvYqyjMzG5na/b7sSAYBdkCvj8Zka4RGlQLnSLIL5LPn4EZQHYaOj4cIjqtRuB3Xe+d08IaLwx+w==
X-Received: by 2002:a2e:2bd3:: with SMTP id r80mr15347663ljr.23.1563219121792; 
 Mon, 15 Jul 2019 12:32:01 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id z22sm3327463ljz.20.2019.07.15.12.32.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 12:32:00 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 62so6962317lfa.8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 12:32:00 -0700 (PDT)
X-Received: by 2002:ac2:4839:: with SMTP id 25mr12319620lft.79.1563219119724; 
 Mon, 15 Jul 2019 12:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9tx+CEkzmLZ-93GZmde9xzJ_rw3PJZxFu_pjZJc7KM5f-w@mail.gmail.com>
 <20190715122924.GA15202@mellanox.com>
 <CAHk-=wgEimwxXiDUdp9eSGZn4j6n8g-4KhdEG0kPVgKFQeAXgw@mail.gmail.com>
 <20190715191702.GD5043@mellanox.com>
In-Reply-To: <20190715191702.GD5043@mellanox.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Jul 2019 12:31:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiH=SduQ+2bSERNuf9TC-NQn-3=BqToDuL8diB=k8_+vA@mail.gmail.com>
Message-ID: <CAHk-=wiH=SduQ+2bSERNuf9TC-NQn-3=BqToDuL8diB=k8_+vA@mail.gmail.com>
Subject: Re: DRM pull for v5.3-rc1
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QH6mzwJIBaZ3G36AHlLbxgzJ8rwuVsgI+lLEoxYsK9w=;
 b=fZquCJKyVQmNiOuila449WNml0toGrUhvi/TXjq6RmeJeTSHXMPfrC1NN9OKxfEA1T
 pgWXSeBYNLl98LgbeaKaiAwNtqam9tD+vpgz79U6td8Cesv7eEszSbvGC3jcYfZC7jaX
 rBMA37V6hr/kMJRWw/9WJWu6Tm8uev7R4tEG4=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMTI6MTcgUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVs
bGFub3guY29tPiB3cm90ZToKPgo+IEFib3V0IHRoZSBvbmx5IHRoaW5nIEkgY291bGQgY29uY3Jl
dGVseSBzdWdnZXN0IGZvciB3b3JraW5nIHdpdGggLW1tCj4gaXMgaWYgdGhlcmUgd2FzIHNvbWUg
d2F5IHRoZSAtbW0gcXVpbHQgcGF0Y2hlcyBjb3VsZCBwYXJ0aWNpcGF0ZSBpbgo+ICdnaXQgbWVy
Z2UnIHJlc29sdXRpb24gYXQgeW91ciBsZXZlbC4KCkFuZHJldyBkaWQgbWFrZSBub2lzZXMgYWJv
dXQgaGF2aW5nIG11bHRpcGxlIGdpdCBicmFuY2hlcy4gV2UnbGwgc2VlLgoKICAgICAgICAgICAg
ICAgICAgICBMaW51cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
