Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0601710DEA4
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 19:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B766E99C;
	Sat, 30 Nov 2019 18:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B666E99C
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 18:41:27 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m4so35268664ljj.8
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 10:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Irn5UBlraoC6oNG6oHJ0v3sniaA47hfP9JyZ+OOZ5YQ=;
 b=SerqPknfRF9jBr7yokgg9Sf4Ms7LfPx5aUdFjcIIDyXopQvIQpSVEgYyM+Nz+dubp4
 A3HGJ1Vx+CwgTOyiDp0nPkB+yC+zPGOPFHkISDW2Z4+jt8jEv2yvskrPzdXqmKzfVdV6
 OEvtuPU35935o6xk5XWXQ7A7au2MpHxw8CFd8AGwxyBnAofHQi1kpAwhVN9YWwc6LHwu
 kKJMddmANYhd+OpnEgg8EJo1jx6UedykIZwUaseo26S6p7C3dsQ1jEDS3XxYHUXS4TvI
 SxfaTwGgwktzL3Yxbbw1bG4mdg4cUY4rHrcEpSvI1fVX0/HaMDPjyFbXzQrTLZqT+LH3
 ZEAA==
X-Gm-Message-State: APjAAAVGlad/kmygFy2T9N2uNhjccqtwgnHQbTGbUuZby40P3ThcvL2p
 kfU4o0Cy+RtaXiTlcea545pqoKJJi7A=
X-Google-Smtp-Source: APXvYqxvrpU3T2VjVTBFctKo/t41ZjXH2AGM8Vu4TXG6Aupu6kJssmgU6zyUvz5gdFSa/8SKKAF/wQ==
X-Received: by 2002:a05:651c:1059:: with SMTP id
 x25mr42007773ljm.255.1575139285967; 
 Sat, 30 Nov 2019 10:41:25 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175])
 by smtp.gmail.com with ESMTPSA id j18sm7352868lfh.6.2019.11.30.10.41.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Nov 2019 10:41:25 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id e28so11124503ljo.9
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 10:41:25 -0800 (PST)
X-Received: by 2002:a2e:99d0:: with SMTP id l16mr28337844ljj.1.1575138960919; 
 Sat, 30 Nov 2019 10:36:00 -0800 (PST)
MIME-Version: 1.0
References: <20191125204248.GA2485@ziepe.ca>
In-Reply-To: <20191125204248.GA2485@ziepe.ca>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 30 Nov 2019 10:35:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgLUF3zZzTgaAM+JQu6T7MWdXLZUDgXodSZxSv0TMNCmw@mail.gmail.com>
Message-ID: <CAHk-=wgLUF3zZzTgaAM+JQu6T7MWdXLZUDgXodSZxSv0TMNCmw@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull hmm changes
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Irn5UBlraoC6oNG6oHJ0v3sniaA47hfP9JyZ+OOZ5YQ=;
 b=DqePDF5z5ErRyWSeEgVaSsv8stVnpuBr+ZgPAs/bxB2P6a9Q83YgJNJKigI+qKzX7l
 d1ItFUaSCRwJc7UUmQ1puXVuXuwv0D/q5PC8EPzfuJQ/gVPTSHLlpdwz/uBl8j4dRAmh
 vp3NOQ7crMVKbNTlP5JnOPAY9FVhRRSy9edd8=
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

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMTI6NDIgUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVs
bGFub3guY29tPiB3cm90ZToKPgo+IEhlcmUgaXMgdGhpcyBiYXRjaCBvZiBobW0gdXBkYXRlcywg
SSB0aGluayB3ZSBhcmUgbmVhcmluZyB0aGUgZW5kIG9mIHRoaXMKPiBwcm9qZWN0IGZvciBub3cs
IGFsdGhvdWdoIEkgc3VzcGVjdCB0aGVyZSB3aWxsIGJlIHNvbWUgbW9yZSBwYXRjaGVzIHJlbGF0
ZWQgdG8KPiBobW1fcmFuZ2VfZmF1bHQoKSBpbiB0aGUgbmV4dCBjeWNsZS4KCkkndmUgZW5kZWQg
dXAgcHVsbGluZyB0aGlzLCBidXQgSSdtIG5vdCBlbnRpcmVseSBoYXBweSB3aXRoIHRoZSBjb2Rl
LgpZb3UndmUgYWxyZWFkeSBzZWVuIHRoZSBjb21tZW50cyBvbiBpdCBpbiB0aGUgZWFybGllciBy
ZXBsaWVzLgoKICAgICAgICAgICAgTGludXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
