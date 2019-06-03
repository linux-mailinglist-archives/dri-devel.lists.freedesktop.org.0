Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2C632EC1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 13:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9654189257;
	Mon,  3 Jun 2019 11:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0297B89A5C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 07:20:27 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id b21so8123275oic.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 00:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GEVWM7tk2X0vIeVpBfbnjHTmUmzZq0YTfPqoCxhdB3k=;
 b=p+X2XUkpeNYmQvHAJsfDfT0ZqSH6YfueCjatOIshIJ6yBtwS8wn+XvtIxgH0+B0wIx
 Y/mqn6iFjCxRTpInHcfSwihUgWA+ml54iRiTfoXipeXKXXq4fG7j2i1wrhDyeWtDTE1e
 76sp/T4MsYxBGfPRqJplxoXVSbrcN2Km1leeTrRCCWdt+PzqH48UPEiakpjmpHQ5HQmC
 Jl6rdw72lBnCFWnvyY+eP6vphbXFeBOTp6Y2uwAv25a0i9tAO+5eHz3PdDgzdM87L3oa
 kp2KqpP7BHi5d7FXlcb8fDJddpU3sW2XEQ9cHz6bM8bbeEO05tMBIwQGGP7+kFetWcrt
 m8HQ==
X-Gm-Message-State: APjAAAVISWdcXcZhu9AOfOrr3ZY51nC+d+bNuSUj05J7h0pLCOwYepYL
 /V2toGyfbzki9IVORP/PYOou7KiWcgmMyrJ1sN0=
X-Google-Smtp-Source: APXvYqyBAyt5/cdoI5PEbnfHVPqUyMP8VDhGOtfD/l3kfmSAFiBdZRTjDIRci5k9coO2+u5V8bBCF8zMJanGbPRDOL4=
X-Received: by 2002:aca:418a:: with SMTP id o132mr122975oia.16.1559546427083; 
 Mon, 03 Jun 2019 00:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190601153917.GA20765@t-1000>
In-Reply-To: <20190601153917.GA20765@t-1000>
From: Mathieu Malaterre <malat@debian.org>
Date: Mon, 3 Jun 2019 09:20:14 +0200
Message-ID: <CA+7wUswLsZ7PF6Pi8Oz=9287UYZQeKCFJHP7FDtPf1Cq8PO7ag@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: Fix Warning comparing pointer to 0 reported
 by coccicheck
To: Shobhit Kukreti <shobhitkukreti@gmail.com>
X-Mailman-Approved-At: Mon, 03 Jun 2019 11:37:53 +0000
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMSwgMjAxOSBhdCA1OjM5IFBNIFNob2JoaXQgS3VrcmV0aSA8c2hvYmhpdGt1
a3JldGlAZ21haWwuY29tPiB3cm90ZToKPgo+IGRyaXZlcnMvdmlkZW8vZmJkZXYvY29udHJvbGZi
LmM6IFdBUk5JTkcgY29tcGFyaW5nIHBvaW50ZXIgdG8gMAo+IGRyaXZlcnMvdmlkZW8vZmJkZXYv
Y29udHJvbGZiLmM6IFdBUk5JTkcgY29tcGFyaW5nIHBvaW50ZXIgdG8gMAo+IGRyaXZlcnMvdmlk
ZW8vZmJkZXYvY29udHJvbGZiLmM6IFdBUk5JTkcgY29tcGFyaW5nIHBvaW50ZXIgdG8gMAo+Cj4g
U2lnbmVkLW9mZi1ieTogU2hvYmhpdCBLdWtyZXRpIDxzaG9iaGl0a3VrcmV0aUBnbWFpbC5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29udHJvbGZiLmMgfCA4ICsrKystLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb250cm9sZmIuYyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvY29udHJvbGZiLmMKPiBpbmRleCA3YWY4ZGIyLi4wNzkwN2M1IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvY29udHJvbGZiLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvbnRyb2xmYi5jCj4gQEAgLTE4Miw3ICsxODIsNyBAQCBpbnQgaW5pdF9tb2R1bGUodm9p
ZCkKPiAgICAgICAgIGludCByZXQgPSAtRU5YSU87Cj4KPiAgICAgICAgIGRwID0gb2ZfZmluZF9u
b2RlX2J5X25hbWUoTlVMTCwgImNvbnRyb2wiKTsKPiAtICAgICAgIGlmIChkcCAhPSAwICYmICFj
b250cm9sX29mX2luaXQoZHApKQo+ICsgICAgICAgaWYgKGRwICE9IE5VTEwgJiYgIWNvbnRyb2xf
b2ZfaW5pdChkcCkpCj4gICAgICAgICAgICAgICAgIHJldCA9IDA7Cj4gICAgICAgICBvZl9ub2Rl
X3B1dChkcCk7Cj4KPiBAQCAtNTgwLDcgKzU4MCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGNvbnRy
b2xfaW5pdCh2b2lkKQo+ICAgICAgICAgY29udHJvbF9zZXR1cChvcHRpb24pOwo+Cj4gICAgICAg
ICBkcCA9IG9mX2ZpbmRfbm9kZV9ieV9uYW1lKE5VTEwsICJjb250cm9sIik7Cj4gLSAgICAgICBp
ZiAoZHAgIT0gMCAmJiAhY29udHJvbF9vZl9pbml0KGRwKSkKPiArICAgICAgIGlmIChkcCAhPSBO
VUxMICYmICFjb250cm9sX29mX2luaXQoZHApKQo+ICAgICAgICAgICAgICAgICByZXQgPSAwOwo+
ICAgICAgICAgb2Zfbm9kZV9wdXQoZHApOwo+Cj4gQEAgLTY4Myw4ICs2ODMsOCBAQCBzdGF0aWMg
aW50IF9faW5pdCBjb250cm9sX29mX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpkcCkKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FTlhJTzsKPiAgICAgICAgIH0KPiAgICAgICAgIHAgPSBremFs
bG9jKHNpemVvZigqcCksIEdGUF9LRVJORUwpOwo+IC0gICAgICAgaWYgKHAgPT0gMCkKPiAtICAg
ICAgICAgICAgICAgcmV0dXJuIC1FTlhJTzsKPiArICAgICAgIGlmIChwID09IE5VTEwpCj4gKyAg
ICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwoKSU1ITyB0aGUgYWJvdmUgc2hvdWxkIGJlIGRl
c2NyaWJlZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCgo+ICAgICAgICAgY29udHJvbF9mYiA9IHA7
IC8qIHNhdmUgaXQgZm9yIGNsZWFudXBzICovCj4KPiAgICAgICAgIC8qIE1hcCBpbiBmcmFtZSBi
dWZmZXIgYW5kIHJlZ2lzdGVycyAqLwo+IC0tCj4gMi43LjQKPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
