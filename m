Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E9A68254
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 04:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515A88982E;
	Mon, 15 Jul 2019 02:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9302D8982E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 02:49:00 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id r9so14557105ljg.5
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2019 19:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0xXZnp3zLEv9/8rZrVJ8Bb1hgH0mFVq0ktioQL8IoBE=;
 b=SZ4uNqdP1WgVxAnjibJ7708Rkiuc+7xdm+xpLBa8ZFqNXJ2c8mPhdxusuaQ1WsR3V0
 TgKuyI9VM9PlDQbUf8JQrNRx2lXaYjWemdCmgKorVHMYz3wdXpa65LpvYYbvfprSKe5p
 p1R1FLMy0+THtNWWx+d1rIa8huA1dqgxttxWGwrpyEuYcE/l7+RwbYQ4DgvDJF0ajGiM
 n6UEyqmOHpF9TIphcZn1vKHpumW/MbgY+hIZ51RpjdPGMrGxi/CCF+Of9KBnHBZDuJZC
 y3KcroJfrG5KFraHEDUT5TzWWLquUbrUYq0xBg3D9X+FngkDnksVdUeJzfWR9nmqL4Bn
 JdUQ==
X-Gm-Message-State: APjAAAXWprpzPqpEHdC/jRqUdVajS2XFnIFS2L7y3vMwctkAvVjvsSw/
 aqfY3kmFkuIOF1sMYk5QWSOImLa/NLc=
X-Google-Smtp-Source: APXvYqwd6UDlqPZGPjKO0h7qSvdbUxsVVQRnEsZzyUPequy2H874421XZBGLjFAUW/UNkUkVsGICQg==
X-Received: by 2002:a2e:86cc:: with SMTP id n12mr12320113ljj.146.1563158938210; 
 Sun, 14 Jul 2019 19:48:58 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171])
 by smtp.gmail.com with ESMTPSA id c30sm2129457lfp.70.2019.07.14.19.48.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jul 2019 19:48:56 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id t28so14544766lje.9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2019 19:48:56 -0700 (PDT)
X-Received: by 2002:a2e:9ec9:: with SMTP id h9mr11885151ljk.90.1563158936002; 
 Sun, 14 Jul 2019 19:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190709192418.GA13677@ziepe.ca>
In-Reply-To: <20190709192418.GA13677@ziepe.ca>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 14 Jul 2019 19:48:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgHKrYEMDbA9CxZ2Sw8JuW3=Wxr1fZo+EvXXLhg4iUOmw@mail.gmail.com>
Message-ID: <CAHk-=wgHKrYEMDbA9CxZ2Sw8JuW3=Wxr1fZo+EvXXLhg4iUOmw@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull hmm changes
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0xXZnp3zLEv9/8rZrVJ8Bb1hgH0mFVq0ktioQL8IoBE=;
 b=QG6qimnZ0OuOr18TPPyD1ZpsfC2oaBrHXD55BhiSP6dw+mQqPSGsIUy/Yf4/KOcnWu
 3PMYYqkRk/B44HHs/mOcE5iy2y+FDx49TCkO+kDXoObGp0hcYXLYXFAlMjRw25zjrKgL
 tjFllJ7em2UwShT6KqGZwlL9Geykn6fnTBnEs=
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
Cc: David Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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

T24gVHVlLCBKdWwgOSwgMjAxOSBhdCAxMjoyNCBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxs
YW5veC5jb20+IHdyb3RlOgo+Cj4gSSdtIHNlbmRpbmcgaXQgZWFybHkgYXMgaXQgaXMgbm93IGEg
ZGVwZW5kZW5jeSBmb3Igc2V2ZXJhbCBwYXRjaGVzIGluCj4gbW0ncyBxdWlsdC4KCi4uIGJ1dCBJ
IHdhaXRlZCB0byBtZXJnZSBpdCB1bnRpbCBJIGhhZCB0aW1lIHRvIHJldmlldyBpdCBtb3JlCmNs
b3NlbHksIGJlY2F1c2UgSSBleHBlY3RlZCB0aGUgcmV2aWV3IHRvIGJlIHBhaW5mdWwuCgpJJ20g
aGFwcHkgdG8gc2F5IHRoYXQgSSB3YXMgb3Zlcmx5IHBlc3NpbWlzdGljLCBhbmQgdGhhdCBpbnN0
ZWFkIG9mCmZpbmRpbmcgdGhpbmdzIHRvIGhhdGUsIEkgZm91bmQgaXQgYWxsIGxvb2tpbmcgZ29v
ZC4KClBhcnRpY3VsYXJseSB0aGUgd2hvbGUgInVzZSByZWZlcmVuY2UgY291bnRzIHByb3Blcmx5
LCBzbyB0aGF0CmxpZmV0aW1lcyBtYWtlIHNlbnNlIGFuZCBhbGwgdGhvc2UgbmFzdHkgY2FzZXMg
Y2FuJ3QgaGFwcGVuIiBwYXJ0cy4KCkl0J3MgYWxsIG1lcmdlZCwganVzdCB3YWl0aW5nIGZvciB0
aGUgdGVzdC1idWlsZCB0byB2ZXJpZnkgdGhhdCBJCmRpZG4ndCBtaXNzIGFueXRoaW5nICh3ZWxs
LCBhdCBsZWFzdCBub3RoaW5nIG9idmlvdXMpLgoKICAgICAgICAgICAgICAgICAgICAgIExpbnVz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
