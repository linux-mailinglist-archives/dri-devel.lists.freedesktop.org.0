Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F066769AC7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 20:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3FA8991D;
	Mon, 15 Jul 2019 18:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552838991D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 18:28:13 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id s19so11709061lfb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 11:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FZIog1Mvh3lUi4/RzCGQ/kW0L9u/W2zjWZcp30VMENo=;
 b=ZTvsMz2oEhT2cj8dw1uJXCP62tTrnKoAsdQkNir2N9PKXcMn2x4YA8v0Qgfrql1EQo
 s6XgLh21yduIh6d77dntngZFvFo5nogLRAhCn1JDhUQ/cKEegfgDcE8txvF9XSCtMjm6
 3ljA2DiPS7+LCDI/QwDkkh3NaAvp2i7u0iYv4Ab2h1TbqwTlkVa6xg5jYSpg3uuoJlL6
 eyCswQt0g1ccm5auBriIrpc2DK4GobHE+5a9rYb1Z6OJDZKGqgMNZ+Pmyo7rshuHBod3
 sW73MjTUlDzdcBvr2rZpYHQaJ0KY/C+XQ7G1tjHAZrp8wtGZ1Sogd1PZ8vFy6uQvidHp
 9rnw==
X-Gm-Message-State: APjAAAVu5959ZzB0tmabe+ctfLpSjRqfqcgUpmRnFCfPUjwH2Hm3kbSP
 XC6ch1thHqlm452PmDbIFbcnCLBSD/cRwkCP+Ac=
X-Google-Smtp-Source: APXvYqzvD8yqDkUBTqN7WBaHdVE+p2R6KZiWjpuKnTZcdWROs75uHPYKbHDXgO2CkCrT67XHNkdOf+Bc4P7F51uZHu4=
X-Received: by 2002:a05:6512:51c:: with SMTP id
 o28mr12661850lfb.67.1563215291451; 
 Mon, 15 Jul 2019 11:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9twvwhm318btWy_WkQxOcpRCzjpok52R8zPQxQrnQ8QzwQ@mail.gmail.com>
 <CAHk-=wjC3VX5hSeGRA1SCLjT+hewPbbG4vSJPFK7iy26z4QAyw@mail.gmail.com>
In-Reply-To: <CAHk-=wjC3VX5hSeGRA1SCLjT+hewPbbG4vSJPFK7iy26z4QAyw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 16 Jul 2019 04:27:59 +1000
Message-ID: <CAPM=9ty8kbEouQCwAedk+6jgByoiK4iBny=P_Hz9iB7Qy=dYww@mail.gmail.com>
Subject: Re: drm pull for v5.3-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FZIog1Mvh3lUi4/RzCGQ/kW0L9u/W2zjWZcp30VMENo=;
 b=cmrHSx/chP07OGY5ck533woHYSzk1JADL55gJ6bx5/mRhRUNpVkETGFkgUTovdSIj4
 AAHNALIMSyu8BkSmRGl+ZjsDU6PubyIXY39vb/8pu9dm5ern2Ocx4SHeFeCgYVTy0hu/
 rTDbuaJYJaXg5FXmI8O4V+p1CUPe/uz8V7L3A5EdTkf5ZqHALu5VZ7ckdANrBAit1T8H
 GWxphmhxhRGIDWx7Myb96eHyf7QXt06n1b1pUw9jkdtX76xnRqlXNw6+rlpYhI8subKh
 5bJ7aO1n71cfnvPUDKNCZ4BlcdqHMz/Ti/EoO1b/VldfAs5r8fMWR17TsXkxDHRDpDLO
 O+cQ==
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

T24gVHVlLCAxNiBKdWwgMjAxOSBhdCAwMzozOCwgTGludXMgVG9ydmFsZHMKPHRvcnZhbGRzQGxp
bnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDE1LCAyMDE5IGF0IDEy
OjA4IEFNIERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVk13
YXJlIGhhZCBzb21lIG1tIGhlbHBlcnMgZ28gaW4gdmlhIG15IHRyZWUgKGxvb2tpbmcgYmFjayBJ
J20gbm90Cj4gPiBzdXJlIFRob21hcyByZWFsbHkgc2VjdXJlZCBlbm91Z2ggYWNrcyBvbiB0aGVz
ZSwgYnV0IEknbSBnb2luZyB3aXRoIGl0Cj4gPiBmb3Igbm93IHVudGlsIEkgZ2V0IHB1c2ggYmFj
aykuCj4KPiBZZWFoLCB0aGlzIGlzIHRoZSBraW5kIG9mIGNvbXBsZXRlbHkgdW5hY2NlcHRhYmxl
IHN0dWZmIHRoYXQgSSB3YXMKPiBfYWZyYWlkXyBJJ2QgZ2V0IGZyb20gdGhlIGhtbSB0cmVlLCBi
dXQgZGlkbid0LgoKTG9va3MgbGlrZSB3ZSB3ZXJlIGFsbCBmb2N1c2VkIG9uIG1ha2luZyBzdXJl
IGhtbSB0cmVlIHdhcyBnb29kLCBJCnJlYWxseSBkcm9wcGVkIHRoZSBiYWxsIHdhdGNoaW5nIHRo
ZSBvdGhlciBiYWxsLgoKSSBwdWxsZWQgc3R1ZmYgaW4gZnJvbSBUaG9tYXMgcXVpdGUgYSB3aGls
ZSBhZ28sIGFuZCBoaXMgcHVsbCByZXF1ZXN0CmRpZCBzYXkgaXQgaGFkIGJlZW4gbG9va2VkIGF0
IGJ5IG1tIGRldnMsIEkgbG9va2VkIGJhY2sKYSB3ZWVrIG9yIHNvIGFnbyBiZWZvcmUgdGhlIGZs
dSBoaXQgbWUgYmFkbHkgYW5kIHdlbnQgaGV5IHRoaXMgaXNuJ3QKYXMgZ29vZCwgYnV0IHJlbW92
aW5nIGl0IGlzIGEgbWVzcyBJIGJldHRlciBwaW5nIHNvbWUgcGVvcGxlLCB0aGVuIEkKcHJvbXB0
bHkgZmVsbCBpbnRvIGEgaG9sZS4KCkl0J3MgYmFkIHRob3VnaCBzbyBJJ20ganVzdCBnb2luZyB0
byByZXZlcnQgaXQgYWxsIG91dC4KCkknbGwgc2VuZCBhIG5ldyBQUiB0b2RheSB3aXRoIGl0IHJl
dmVydGVkLCByZWJ1aWxkaW5nIHRoZSB0cmVlIG1pZ2h0CmJlIHBvc3NpYmxlLCBidXQgeW91J2Qg
bG9zZSBhIGxvdCBvZiB0ZXN0aW5nIGNvbmZpZGVuY2UgaW4gdGhlIHJlc3Qgb2YKaXQuCgo+IEkn
bSBub3QgcHVsbGluZyB0aGlzLiBXaHkgZGlkIHlvdSBtZXJnZSBpdCBpbnRvIHlvdXIgdHJlZSwg
d2hlbgo+IGFwcGFyZW50bHkgeW91IHdlcmUgYXdhcmUgb2YgaG93IHF1ZXN0aW9uYWJsZSBpdCBp
cyBqdWRnaW5nIGJ5IHRoZSBkcm0KPiBwdWxsIHJlcXVlc3QuCgpJIHRvdGFsbHkgb3ZlciB0cnVz
dGVkIFRob21hcyBvbiB0aGlzLCBJIGdsYW5jZWQgYXQgdGhlIGhlbHBlcnMgd2hlbiBJCm1lcmdl
ZCB0aGVtIGFuZCB3ZW50IHRoZXkgc2VlbWVkIHJlYXNvbmFibGUgZm9yIHRoZSB2bXdhcmUgYWRk
cmVzcwpzcGFjZSBjb2hlcmVuY3kgbW9kZWwsIGFuZCB0aGV5J2QgYmVlbiBwb3N0ZWQgdG8gbGlu
dXgtbW0gYSBmZXcgdGltZXMKYW5kIGhhZCBzb21lIGZlZWRiYWNrLAoKSSBjYXVnaHQgaXQgbW9y
ZSBsYXN0IHdlZWsgd2hlbiBJIHdhcyByZS1yZXZpZXdpbmcgYWxsIHRoZSBzdHVmZiBpbiBteQp0
cmVlIGFuZCBJIHdhcyBsaWtlIGhleSB0aGF0IGlzbid0IHJpZ2h0LCBidXQgcmVtb3ZpbmcgaXQg
bWlnaHQgYmUKdHJpY2t5LCB0aGVuIEkgc3BlbnQgYSB3ZWVrIHdpdGggYSBjb3VjaCBhbmQgbm8g
YnJhaW4uCgpTbyBJJ20gdG90YWxseSByZXNwb25zaWJsZSBmb3IgdGhpcyBjcmFwIGxhbmRpbmcg
aW4gbXkgdHJlZSwgYW5kClRob21hcyB3aWxsIGJlIGdldHRpbmcgYSBsb3QgbW9yZSBwdXNoIGJh
Y2sgaW4gZnV0dXJlLgoKRGF2ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
