Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C127F7EA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037316EE05;
	Fri,  2 Aug 2019 13:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9966EE01;
 Fri,  2 Aug 2019 13:10:41 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id p184so36029276pfp.7;
 Fri, 02 Aug 2019 06:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XbUxMY+radp8eo+hzS4Ig8it6rorCi9bzOQPywSdVAs=;
 b=B0sLjJ3eG50hXjCap60cYULXmHEMdBCAMpN9Edf1Ps8GFo5+gBiHuRLV86BJOybag+
 sf3lUgtJ9jkIT17mESlT22z/2oi4VuSeBaEaGv9wQf7VEviPE0pwMWKp1PSm5KJrn8+M
 L/90l5ngIDM9Ryk9d0TeaIYPodb8kaRhjuSrTMapjkJ5OCi93Jz2YPd5mHioxZUHoqB0
 uiGABUd017pRJBrUiFbXh8Hoq8IsGJOqjRHtCwkymZzA8tT/lWCT9iKGF8/VlP62IoPn
 9zb8YGXWue0kQeOGNVMjD3EhNwsQBnZc4QTPkFzTC4A/5/DhVEFFw4ZhNAHdERrIROWO
 CKbA==
X-Gm-Message-State: APjAAAVKL8WK4NRzFG+0iv9XXG/1kokUgDnjEQldPRF9q/Y26JoFnEnQ
 DeUMsGgO7B1M/TKy0SQ+xkI=
X-Google-Smtp-Source: APXvYqw3yX23z9WQPbZceAFXCw+ZNQHWkzUno80U33FlW4KnxdfGmoluqj/SSReDS77iakJJxRWzTw==
X-Received: by 2002:a63:b10f:: with SMTP id r15mr54143605pgf.230.1564751440748; 
 Fri, 02 Aug 2019 06:10:40 -0700 (PDT)
Received: from localhost ([121.137.63.184])
 by smtp.gmail.com with ESMTPSA id m11sm60228796pgl.8.2019.08.02.06.10.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 06:10:40 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Fri, 2 Aug 2019 22:10:37 +0900
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 1/2] i915: convert to new mount API
Message-ID: <20190802131037.GA466@tigerII.localdomain>
References: <20190802123956.2450-1-sergey.senozhatsky@gmail.com>
 <156475048333.6598.10268421599352645066@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156475048333.6598.10268421599352645066@skylake-alporthouse-com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XbUxMY+radp8eo+hzS4Ig8it6rorCi9bzOQPywSdVAs=;
 b=kYjtG7zLaGULpxcdiBGXSs4vwutKA/rWEos6ytuddi7eh2JaDuw1cg6O1TCEtS2BbR
 UwPA9X9pcMa45kjSHSkhkSdLpyg6jiDUXTANUEF2ZsqndJqAfPtuvKk8vP+9d11pmc6n
 puiPGhAqXIu6LVVxB3WbME+rkhTZ53dB7Q1jT0ju6FkjuPYCxKGd+ItC+fMP1Md7vynE
 v1bi/LsP/rKAux7G8aIj62fDiKPx19Gq4IPjI8TCWILl8JSWG5dWwiuDMVoAexHV+GNa
 lteSV/dXS5AjaIXRdQl57NlnWqZxb1HzB5LaU1fUgp7u4v7PKVimz126lsuz57gU7z4A
 YQ+g==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gKDA4LzAyLzE5IDEzOjU0KSwgQ2hyaXMgV2lsc29uIHdyb3RlOgpbLi5dCj4gPiAgaW50IGk5
MTVfZ2VtZnNfaW5pdChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkKPiA+ICB7Cj4gPiAr
ICAgICAgIHN0cnVjdCBmc19jb250ZXh0ICpmYyA9IE5VTEw7Cj4gPiAgICAgICAgIHN0cnVjdCBm
aWxlX3N5c3RlbV90eXBlICp0eXBlOwo+ID4gICAgICAgICBzdHJ1Y3QgdmZzbW91bnQgKmdlbWZz
Owo+ID4gKyAgICAgICBib29sIG9rID0gdHJ1ZTsKPiAKPiBTdGFydCB3aXRoIG9rID0gZmFsc2Us
IHdlIG9ubHkgbmVlZCB0byBzZXQgdG8gdHJ1ZSBpZiB3ZSBzdWNjZWVkIGluCj4gcmVjb25maWd1
cmluZy4KCk9LLCBtYWtlcyBzZW5zZS4KCj4gPiAgICAgICAgIHR5cGUgPSBnZXRfZnNfdHlwZSgi
dG1wZnMiKTsKPiA+ICAgICAgICAgaWYgKCF0eXBlKQo+ID4gQEAgLTM2LDE4ICszOSwyOSBAQCBp
bnQgaTkxNV9nZW1mc19pbml0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KQo+ID4gICAg
ICAgICAgICAgICAgIHN0cnVjdCBzdXBlcl9ibG9jayAqc2IgPSBnZW1mcy0+bW50X3NiOwo+ID4g
ICAgICAgICAgICAgICAgIC8qIEZJWE1FOiBEaXNhYmxlZCB1bnRpbCB3ZSBnZXQgVy9BIGZvciBy
ZWFkIEJXIGlzc3VlLiAqLwo+ID4gICAgICAgICAgICAgICAgIGNoYXIgb3B0aW9uc1tdID0gImh1
Z2U9bmV2ZXIiOwo+ID4gLSAgICAgICAgICAgICAgIGludCBmbGFncyA9IDA7Cj4gPiAtICAgICAg
ICAgICAgICAgaW50IGVycjsKPiAKPiBIbW0sIHdlIGNvdWxkIGF2b2lkIHRoaXMgaWYgd2UgdXNl
ZCB2ZnNfa2VybmVsX21vdW50KCkgZGlyZWN0bHkgcmF0aGVyCj4gdGhhbiB0aGUga2Vybl9tb3Vu
dCB3cmFwcGVyLCBhcyB0aGVuIHdlIHBhc3Mgb3B0aW9ucyB0aHJvdWdoIHRvCj4gcGFyc2VfbW9u
b3RpdGhpY19tb3VudF9kYXRhKCkuIE9yIGFtIEkgYmFya2luZyB1cCB0aGUgd3JvbmcgdHJlZT8K
CkhtbS4KV291bGRuJ3QgdGhpcyBlcnJvciBvbiAhVFJBTlNQQVJFTlRfSFVHRV9QQUdFQ0FDSEUg
c3lzdGVtcz8KImh1Z2U9bmV2ZXIiIHNob3VsZCBiZSBhbiBpbnZhbGlkIG9wdGlvbiB3aGVuIHN5
c3RlbSBkb2VzCm5vdCBrbm93IGFib3V0IFRIUC4KClsuLl0KPiA+ICsgICAgICAgICAgICAgICBp
ZiAoIWZjLT5vcHMtPnBhcnNlX21vbm9saXRoaWMgfHwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZmMtPm9wcy0+cGFyc2VfbW9ub2xpdGhpYyhmYywgb3B0aW9ucykpIHsKPiAK
PiBjaGVja3BhdGNoLnBsIHdpbGwgY29tcGxhaW4gdGhhdCB0aGlzIHNob3VsZCBsaW5lIHVwIHdp
dGggdGhlICcoJwoKSXQgZG9lc24ndC4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0Kb3V0Z29pbmcvMDAwMS1pOTE1LWNvbnZlcnQtdG8tbmV3LW1vdW50
LUFQSS5wYXRjaAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCnRvdGFsOiAwIGVycm9ycywgMCB3YXJuaW5ncywgNTMgbGluZXMgY2hlY2tlZAoKb3V0Z29p
bmcvMDAwMS1pOTE1LWNvbnZlcnQtdG8tbmV3LW1vdW50LUFQSS5wYXRjaCBoYXMgbm8gb2J2aW91
cyBzdHlsZSBwcm9ibGVtcyBhbmQgaXMgcmVhZHkgZm9yIHN1Ym1pc3Npb24uCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm91dGdvaW5nLzAw
MDItaTkxNS1kby1ub3QtbGVhay1tb2R1bGUtcmVmLWNvdW50ZXIucGF0Y2gKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQp0b3RhbDogMCBlcnJv
cnMsIDAgd2FybmluZ3MsIDExIGxpbmVzIGNoZWNrZWQKCm91dGdvaW5nLzAwMDItaTkxNS1kby1u
b3QtbGVhay1tb2R1bGUtcmVmLWNvdW50ZXIucGF0Y2ggaGFzIG5vIG9idmlvdXMgc3R5bGUgcHJv
YmxlbXMgYW5kIGlzIHJlYWR5IGZvciBzdWJtaXNzaW9uLgoKWy4uXQo+ID4gKyAgICAgICBpZiAo
IW9rKQo+ID4gKyAgICAgICAgICAgICAgIHByX2VycigiaTkxNSBnZW1mcyByZWNvbmZpZ3VyYXRp
b24gZmFpbGVkXG4iKTsKPiAKPiBMZXQncyBtYWtlIGl0IGEgYml0IG1vcmUgdXNlciBmcmllbmRs
eSwKPiAKPiBkZXZfZXJyKGk5MTUtPmRybS5kZXYsCj4gCSJVbmFibGUgdG8gcmVjb25maWd1cmUg
aW50ZXJuYWwgc2htZW1mcyBmb3IgcHJlZmVycmVkIgo+IAkiIGFsbG9jYXRpb24gc3RyYXRlZ3k7
IGNvbnRpbnVpbmcsIGJ1dCBwZXJmb3JtYW5jZSBtYXkgc3VmZmVyLlxuIik7CgpJIGd1ZXNzIG5v
dyBjaGVja3BhdGNoIHdpbGwgY29tcGxhaW4gOikKCj4gQXNzdW1pbmcgdGhhdCB3ZSBjYW4ndCBq
dXN0IHVzZSB2ZnNfa2Vybl9tb3VudCgpIGluc3RlYWQsIHdpdGggdGhlIG5pdHMKPiBSZXZpZXdl
ZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpUaGFua3MuCgpJ
J2xsIHNpdCBvbiBpdCBmb3Igc2V2ZXJhbCBkYXlzLCBqdXN0IHRvIHNlZSBpZiBtb3JlIGZlZWRi
YWNrIHdpbGwgY29tZS4KCgktc3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
