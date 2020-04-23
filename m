Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B6D1B6706
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2C96EA0F;
	Thu, 23 Apr 2020 22:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D316E884
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 14:52:47 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id g2so2447597plo.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 07:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=XXa44dRejUVD9khGbpB7Lq0g9wT1bE7Lq11QXvftrgA=;
 b=qE2OfZI2wUVvj77T4PFS0pvS8DTwl271ADgwm6nQaDeGBfGTNSVgYanwxrIvfw4rAI
 J58hPTNIqmjrHrUpsIOY6RtbFoJGIgscCA41U8MGHAHQTPoudHOATd9n32TM7IoqKprO
 7s/TmDNACHiujN3hfikbHxN8ZlKxSGsqz2Ql/+u5h8BPgBFgL19XhinLPzl2rW8Nh1ZQ
 G/HIyN4hEzJHAz/4ZmhJE3bAvpQqzlXcYv0qngMoe68yFw0BvvR8Am6znPtWDs2jnPQO
 w/px3lOq3k9fN2N+okO6iwWf0bdu1nGSw3QjAMDkoovNlS16b3D6r2yGbnlV7bXlHBZl
 4aIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=XXa44dRejUVD9khGbpB7Lq0g9wT1bE7Lq11QXvftrgA=;
 b=dKEdgBLjrxUqqy7zXVw+OPeixL71AOOql9QCeJv78GC3Om92bNE03Kt3T2kVeeTbrr
 Uk3P/rIs6HV8fYAl8WUeZ2/lZK1hM1njfGGKqfpkW+ZllGOA/5uFmMZU2h/O/mb8zxD2
 Uu2EZnpR3SgR1bnLkm+ja+dgHFsijrft7z+PzX28AG9HkIsc/hjWqJ4+vVJtfXNpqk1g
 Brnqpd5GwuMF2PQeeRKh9k06DLydtly442fCgQW8FtWdhV9ZFID/rt28ltKXWCBbIANy
 0n9NINWtbp7Q9ScxbyI/vOzQ799rXlXDZ+m/ni28EF6u/7eH1+vvQThsgYUvVZBXVcDp
 y/WQ==
X-Gm-Message-State: AGi0PuZsKm3Z1acgwpYlsoLoaTzEyor48WK70/ZnCVgyyENiGmRz1i5O
 Fd8KQ+LFOzXqmU5RVFVIW54=
X-Google-Smtp-Source: APiQypJpH6Jh81nSVTNgvgCANJgQ3DPA4JhoZAwMB7qvMzGPSlAcC3qmZOotUwN/EekORxapq5Vkgw==
X-Received: by 2002:a17:90a:2f64:: with SMTP id
 s91mr1147538pjd.30.1587653566730; 
 Thu, 23 Apr 2020 07:52:46 -0700 (PDT)
Received: from localhost ([176.122.158.71])
 by smtp.gmail.com with ESMTPSA id r189sm2319896pgr.31.2020.04.23.07.52.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Apr 2020 07:52:46 -0700 (PDT)
Date: Thu, 23 Apr 2020 22:52:40 +0800
From: Dejin Zheng <zhengdejin5@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v1] fbdev: sm712fb: fix an issue about iounmap for a
 wrong address
Message-ID: <20200423145239.GC1562@nuc8i5>
References: <bb6ba7c9-ad92-9c54-e1c4-91d2f7d0f5f8@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb6ba7c9-ad92-9c54-e1c4-91d2f7d0f5f8@web.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, Teddy Wang <teddy.wang@siliconmotion.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMjMsIDIwMjAgYXQgMDI6MTQ6NDhQTSArMDIwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPiB0aGUgc2ZiLT5mYi0+c2NyZWVuX2Jhc2UgaXMgbm90IHNhdmUgdGhlIHZhbHVl
IGdldCBieSBpb3VubWFwKCkgd2hlbgo+ID4gdGhlIGNoaXAgaWQgaXMgMHg3MjAuCj4gCj4gSSBz
dWdnZXN0IHRvIGltcHJvdmUgdGhpcyBjaGFuZ2UgZGVzY3JpcHRpb24uCj4gSG93IGRpZCB5b3Ug
ZGV0ZXJtaW5lIHJlbGV2YW50IGRpZmZlcmVuY2VzIGZvciB0aGUgbWVudGlvbmVkIGNoaXAgbW9k
ZWw/Cj4KUmVhZCBhbmQgY2hlY2sgaXRzIGNvZGVz44CCCgpzbXRjZmJfcGNpX3Byb2JlKCkgLS0+
IHNtdGNfbWFwX3NtZW0oKQoKc210Y2ZiX3BjaV9wcm9iZSgpCnN3aXRjaCAoc2ZiLT5jaGlwX2lk
KSB7CiAgICAgICAgY2FzZSAweDcxMDoKICAgICAgICBjYXNlIDB4NzEyOgoJCXNmYi0+bGZiID0g
aW9yZW1hcChtbWlvX2Jhc2UsIG1taW9fYWRkcik7CgljYXNlIDB4NzIwOgoJCXNmYi0+ZHBfcmVn
cyA9IGlvcmVtYXAobW1pb19iYXNlLCAweDAwMjAwMDAwICsgc21lbV9zaXplKTsKICAgICAgICAg
ICAgICAgIHNmYi0+bGZiID0gc2ZiLT5kcF9yZWdzICsgMHgwMDIwMDAwMDsKCX0Kc210Y19tYXBf
c21lbSgpCglzZmItPmZiLT5zY3JlZW5fYmFzZSA9IHNmYi0+bGZiOwoKCnNtdGNmYl9wY2lfcmVt
b3ZlKCkgLS0+IHNtdGNfdW5tYXBfc21lbSgpCgpzbXRjX3VubWFwX3NtZW0oKQoJaW91bm1hcChz
ZmItPmZiLT5zY3JlZW5fYmFzZSk7Cgo+IAo+ID4gc28gaW91bm1hcCgpIGZvciBhZGRyZXNzIHNm
Yi0+ZmItPnNjcmVlbl9iYXNlIGlzIG5vdCByaWdodC4KPiAKPiBXaWxsIGFub3RoZXIgaW1wZXJh
dGl2ZSB3b3JkaW5nIGJlY29tZSBoZWxwZnVsIGhlcmU/Cj4gCnllcywgdGhpcyBpcyB3aHkgbmVl
ZCB0byBjaGFuZ2UgdGhpcyBjb2RlLgoKPiAKPiDigKYKPiA+ICsrKyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvc203MTJmYi5jCj4gPiBAQCAtMTQyOSw2ICsxNDI5LDggQEAgIHN0YXRpYyBpbnQgc210
Y19tYXBfc21lbShzdHJ1Y3Qgc210Y2ZiX2luZm8gKnNmYiwKPiA+ICBzdGF0aWMgdm9pZCBzbXRj
X3VubWFwX3NtZW0oc3RydWN0IHNtdGNmYl9pbmZvICpzZmIpCj4gPiAgewo+ID4gIAlpZiAoc2Zi
ICYmIHNmYi0+ZmItPnNjcmVlbl9iYXNlKSB7Cj4gPiArCQlpZiAoc2ZiLT5jaGlwX2lkID09IDB4
NzIwKQo+ID4gKwkJCXNmYi0+ZmItPnNjcmVlbl9iYXNlIC09IDB4MDAyMDAwMDA7Cj4gPiAgCQlp
b3VubWFwKHNmYi0+ZmItPnNjcmVlbl9iYXNlKTsKPiAKPiBIb3cgZG8geW91IHRoaW5rIGFib3V0
IHRvIHVzZSBkZXNjcmlwdGl2ZSBpZGVudGlmaWVycyBmb3IKPiB0aGUgc2hvd24gY29uc3RhbnRz
Pwo+ClRoZXNlIHR3byBjb25zdGFudHMgYXJlIG9yaWdpbmFsbHkgaW4gdGhlIGRyaXZlciwgSSBk
b24ndCBrbm93IGVub3VnaAphYm91dCBpdHMgbWVhbmluZywgVGhlcmUgYXJlIGEgbG90IG9mIGNv
bnN0YW50cyBpbiB0aGlzIGRyaXZlci4gSWYgSQpyZXBsYWNlIGl0IHdpdGggdGhlIG1hY3JvLCBJ
IHdvcnJ5IHRoYXQgdGhlIG5hbWUgb2YgdGhlIG1hY3JvIG1heSBub3QKYmUgYWNjdXJhdGUuCgo+
IFdvdWxkIHlvdSBsaWtlIHRvIGNsYXJpZnkgYW55IHJlbGF0ZWQgc29mdHdhcmUgYW5hbHlzaXMg
YXBwcm9hY2hlcz8KPgpqdXN0IHJlYWQgY29lZGVzIGFuZCBjaGVjayBpdC4KCj4gUmVnYXJkcywK
PiBNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
