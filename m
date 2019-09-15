Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B33B31D9
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2019 21:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122A76E0BF;
	Sun, 15 Sep 2019 19:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317F26E0A6;
 Sun, 15 Sep 2019 19:47:42 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id q1so1680920ion.1;
 Sun, 15 Sep 2019 12:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ps21+yPehanjsccA3pZUx6ng3VBZ3IcyIL4amI2VF5w=;
 b=RbrknyOTJA64n0E88+4zfHh5vg/YCGA0m9UeqOlAns4zwUWkgyDZ29eOa9ym5+bNFl
 FLPn3PiIe1GQmC4yC82cpD4MJszpwD7UvHsXznlYqti/iQp69PHvdHf+eRfVBxkhgod6
 VskXH6/i7QEPFhbPUXIN7QL0IwoCAJI9lONwGkUzEpeCu74SH3Bx7/ec+HmQBBW8HIyP
 rQEs5GirHSCWG4IVwFTm8/cCwwmdquOZzlmnbJDg47Fl+0ulqsK9rQWKSo/TWAr/ExkW
 +AnDLAkMIfbPsvUTFRwseJlChVCgFIGFY1SnhETV1JTJefQ6hxNmE7/303i6SMQEO+Ck
 HX4w==
X-Gm-Message-State: APjAAAWYUPeE1a35xcn4T9wAqBZH2ipnLpSPCYGD/ujW3wn7VAM+6qUk
 R3MCMZr+el5BzO11rqHoLQetIc9GDKLavi+mPXU=
X-Google-Smtp-Source: APXvYqzouMT3490kgEIyPMulv062Ufqzn/3+z3GgV9OLnyn1nVykUuPn/Soja6AbuPnNw1wewiIpcMto3ChbI8F7FYM=
X-Received: by 2002:a5e:c241:: with SMTP id w1mr5045599iop.36.1568576861178;
 Sun, 15 Sep 2019 12:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190830032948.13516-1-hdanton@sina.com>
 <CABXGCsNywbo90+wgiZ64Srm-KexypTbjiviwTW_BsO9Pm11GKQ@mail.gmail.com>
 <5d6e2298.1c69fb81.b5532.8395SMTPIN_ADDED_MISSING@mx.google.com>
 <CABXGCsMG2YrybO4_5jHaFQQxy2ywB53pY63qRfXK=ZKx5qc2Bw@mail.gmail.com>
 <CAKMK7uH9q09XadTV5Ezm=9aODErD=w_+8feujviVnF5LO_fggA@mail.gmail.com>
 <5d6f10a6.1c69fb81.6b104.af73SMTPIN_ADDED_MISSING@mx.google.com>
 <20190904083747.GE2112@phenom.ffwll.local>
 <CABXGCsMEjP-UQ5A1xpL-xWHxtFEsOUO14+cmWJUS1ff1hgReFA@mail.gmail.com>
 <CAKMK7uHQFpQjE8qxw5UUDg6xdbzcr0zaZ7P6WsBK7m0ksKdg3g@mail.gmail.com>
 <CABXGCsN_r6614xDft_FY5N-B1QRFkhz27Q5U7nnr=mwtOWyCUw@mail.gmail.com>
 <1d23703e-f6df-e663-a205-45c98cd125e8@amd.com>
In-Reply-To: <1d23703e-f6df-e663-a205-45c98cd125e8@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 16 Sep 2019 00:47:30 +0500
Message-ID: <CABXGCsNA+p8QCGPduiTfOwdYsk+qGMXL9JTGsQXGtnDEDy4-xg@mail.gmail.com>
Subject: Re: gnome-shell stuck because of amdgpu driver [5.3 RC5]
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Ps21+yPehanjsccA3pZUx6ng3VBZ3IcyIL4amI2VF5w=;
 b=YV6Kb/eLk881/ykb8u2SWxFYQbT5+5klEOmw9fV/zDtdCEXG2iqUY5MzfrwySkLxwA
 OOM5PQ+xIojQQ5LBiMmhcB1Wx7/Hbm9nPn9MaAN3E3WEh7tKYvWP+D+mbJHC+gq+ci7l
 lEFDRVXbFzHU/lcd1Xih/GPBSfzAkCin/NidSim9UJdwJkqPkFiNfr5Z30Zj2QUKbSAo
 U4YRgmm4KUwBTCm7oUOQYzyTyAEZLSpvbNJumG39JiW3FIaulBXeSfrqfgCrJkiStqPU
 VgB5aSWZ81AI8zwpnk8LBsy7iC45NMbOcu9iVQI4mMywSx+UeCI7D+CglgHmwcxaoNLh
 tqiw==
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
Cc: Hillf Danton <hdanton@sina.com>,
 Linux kernel <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCA5IFNlcCAyMDE5IGF0IDE0OjE1LCBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFu
LktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEkgYWdyZWUgd2l0aCBEYW5pZWxzIGFuYWx5c2lz
Lgo+Cj4gSXQgbG9va3MgbGlrZSB0aGUgcHJvYmxlbSBpcyBzaW1wbHkgdGhhdCBQTSB0dXJucyBv
ZiBhIGJsb2NrIGJlZm9yZSBhbGwKPiB3b3JrIGlzIGRvbmUgb24gdGhhdCBibG9jay4KPgo+IEhh
dmUgeW91IG9wZW5lZCBhIGJ1ZyByZXBvcnQgeWV0PyBJZiBub3QgdGhlbiB0aGF0IHdvdWxkIGNl
cnRhaW5seSBoZWxwCj4gY2F1c2UgaXQgaXMgcmVhbGx5IGhhcmQgdG8gZXh0cmFjdCBhbGwgbmVj
ZXNzYXJ5IGluZm9ybWF0aW9uIGZyb20gdGhhdAo+IG1haWwgdGhyZWFkLgoKaHR0cHM6Ly9idWdz
LmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExNjg5Ckl0J2xsIGRvPwoKLS0KQmVz
dCBSZWdhcmRzLApNaWtlIEdhdnJpbG92LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
