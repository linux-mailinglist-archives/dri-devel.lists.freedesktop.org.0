Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 835195B146
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAE589DC9;
	Sun, 30 Jun 2019 18:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D796E937
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 14:53:05 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g135so9401243wme.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 07:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Sga2c12T0ZFFUJF1LGGvcSrUsVd+cFzvC9RoD6jsqZs=;
 b=GUvuOLHeLfNw7I7gUg7iFBQaDHuel09669HQV8R/6XyTVE26b8OIXQ94ACo2Jdgj9H
 YaQgj9ILtS2IDloDeXPVZ+nVPPn/Gu7G0+4RdFr+49HyaKudTZV/ct2BLBSFdH20k84P
 UXRTlF7kzt/eT4/1gerfOdJBsSSoSAf/9r2VhiGQUq0Hj5osp7AfOOtzo8OHWZX3yOQ/
 0TsA/1JhexD+cKntr7dupDPnpz0142oqABv5bvPzl6UiJVf1KJh81swo89KWbnJFTpmz
 jmD0qLsyFdgw7mGqL7sRkfT+nTiHLRR1vh8LOahQ1BB4cR2ivzz3n4zK+l8gOmygCNBO
 ZoMQ==
X-Gm-Message-State: APjAAAVQCIUuSO8No8gawm/YEHcIzha/eXpYPdIljhJTXG05ANHTCN8K
 MBZCHr3HNWceIVobV1q6Sh8=
X-Google-Smtp-Source: APXvYqy6oHHG4ir+zA6s0TkfY9+WjxYK9sH0n67JqWteJfL0SU+DPbIVVmC/q0mp8EtdDqcxGbrDsA==
X-Received: by 2002:a7b:c766:: with SMTP id x6mr7828805wmk.40.1561733584713;
 Fri, 28 Jun 2019 07:53:04 -0700 (PDT)
Received: from Timur-XPS (catv-80-99-228-232.catv.broadband.hu.
 [80.99.228.232])
 by smtp.gmail.com with ESMTPSA id v4sm2599940wmg.22.2019.06.28.07.53.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 07:53:04 -0700 (PDT)
Message-ID: <29c0d7a01f5b233ff3b68ad215f7ac9308f860db.camel@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Fri, 28 Jun 2019 16:53:02 +0200
In-Reply-To: <20190628141455.GO2640@lahna.fi.intel.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <20190628125346.GM2640@lahna.fi.intel.com>
 <c5545128e27cbcce5888f9972ff066fb4979fd28.camel@gmail.com>
 <20190628141455.GO2640@lahna.fi.intel.com>
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Sga2c12T0ZFFUJF1LGGvcSrUsVd+cFzvC9RoD6jsqZs=;
 b=OfJ4Mm1PFvFllfLSgRXoU5EjikuCEi0T58PbEPjVvwga3aVhTGx/t9TWd+xwqkBHYr
 9PJopnVLuz5oHYRkT6HmT4yiKicU73zKN1WngFEJ56lv8YH0kNY+fuR8fLv0W6gsLNmt
 gqt3E4EEnvzFbEZsUCPNtKjpINXN5EHA1Gq5vmUN6G6aG3fJhE9/q5zyy+B/Jp+lM2VK
 kk7P7N9kSXOV+QFZ9/B4SmqmkgnJmUhYzv/0qzIOc25+4nJrzADoVELgrV/6mz4Li9Ef
 1YOQIJBJHTSXLhP7XqbryFH0G7PZnCfWWsKl/CulYPyj56cpfWCHJvTNgLH9htP+5zSP
 tXqQ==
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA2LTI4IGF0IDE3OjE0ICswMzAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6
Cj4gT24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMDM6MzM6NTZQTSArMDIwMCwgVGltdXIgS3Jpc3TD
s2Ygd3JvdGU6Cj4gPiBJIGhhdmUgdHdvIG1vcmUgcXVlc3Rpb25zOgo+ID4gCj4gPiAxLiBXaGF0
IGlzIHRoZSBiZXN0IHdheSB0byB0ZXN0IHRoYXQgdGhlIHZpcnR1YWwgbGluayBpcyBpbmRlZWQK
PiA+IGNhcGFibGUKPiA+IG9mIDQwIEdiaXQgLyBzZWM/IFNvIGZhciBJJ3ZlIGJlZW4gdW5hYmxl
IHRvIGZpZ3VyZSBvdXQgaG93IHRvCj4gPiBtZWFzdXJlCj4gPiBpdHMgbWF4aW11bSB0aHJvdWdo
cHV0Lgo+IAo+IEkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYW55IGdvb2Qgd2F5IHRvIHRlc3QgaXQg
YnV0IHRoZSBUaHVuZGVyYm9sdAo+IGdlbiAzCj4gbGluayBpcyBwcmV0dHkgbXVjaCBhbHdheXMg
NDAgR2IvcyAoMjAgR2IvcyB4IDIpIGZyb20gd2hpY2ggdGhlCj4gYmFuZHdpZHRoIGlzIHNoYXJl
ZCBkeW5hbWljYWxseSBiZXR3ZWVuIGRpZmZlcmVudCB0dW5uZWxzICh2aXJ0dWFsCj4gbGlua3Mp
LgoKVGhhdCdzIHVuZm9ydHVuYXRlLCBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgdGhlcmUgdG8gYmUg
c29tZSBzb3J0IG9mIFBDSWUKc3BlZWQgdGVzdCB1dGlsaXR5LgoKTm93IHRoYXQgSSBnYXZlIGl0
IGEgdHJ5LCBJIGNhbiBtZWFzdXJlIH4yMCBHYml0L3NlYyB3aGVuIEkgcnVuIEdub21lCldheWxh
bmQgb24gdGhpcyBzeXN0ZW0gKHdoaWNoIGZvcmNlcyB0aGUgZUdQVSB0byBzZW5kIHRoZSBmcmFt
ZWJ1ZmZlcgpiYWNrIGFuZCBmb3J0aCBhbGwgdGhlIHRpbWUgLSBmb3IgdHdvIDRLIG1vbml0b3Jz
KS4gQnV0IGl0IHN0aWxsCmRvZXNuJ3QgZ2l2ZSBtZSA0MCBHYml0L3NlYy4KCj4gCj4gPiAyLiBX
aHkgaXMgaXQgdGhhdCB0aGUgZ2FtZSBjYW4gb25seSB1dGlsaXplIGFzIG11Y2ggYXMgMi41IEdi
aXQgLwo+ID4gc2VjCj4gPiB3aGVuIGl0IGdldHMgYm90dGxlbmVja2VkPyBUaGUgc2FtZSBwcm9i
bGVtIGlzIG5vdCBwcmVzZW50IG9uIGEKPiA+IGRlc2t0b3AKPiA+IGNvbXB1dGVyIHdpdGggYSAi
bm9ybWFsIiBQQ0llIHBvcnQuCj4gCj4gVGhpcyBpcyBvdXRzaWRlIG9mIG15IGtub3dsZWRnZSwg
c29ycnkuIEhvdyB0aGF0IGdhbWUgZXZlbiBrbm93cyBpdAo+IGNhbgo+ICJ1dGlsaXplIiBvbmx5
IDIuNSBHYml0L3MuIERvZXMgaXQgZ28gb3ZlciB0aGUgb3V0cHV0IG9mICJsc3BjaSIgYXMKPiB3
ZWxsPyA6LSkKPiAKPiBUaGUgUENJZSBsaW5rcyBpdHNlbGYgc2hvdWxkIHRvIGdldCB5b3UgdGhl
IDggR1QvcyB4IDQgYW5kIEknbSBxdWl0ZQo+IHN1cmUgdGhlIHVuZGVybHlpbmcgVEJUIGxpbmsg
d29ya3MgZmluZSBhcyB3ZWxsIHNvIG15IGd1ZXNzIGlzIHRoYXQKPiB0aGUKPiBpc3N1ZSBsaWVz
IHNvbWV3aGVyZSBlbHNlIGJ1dCB3aGVyZSwgSSBoYXZlIG5vIGlkZWEuCj4gCj4gTWF5YmUgdGhl
IHByb2JsZW0gaXMgaW4gdGhlIGdhbWUgaXRzZWxmPwoKSSBoYWQgYSBicmllZiBkaXNjdXNzaW9u
IHdpdGggTWFyZWsgYWJvdXQgdGhpcyBlYXJsaWVyLCBhbmQgaGUgc2FpZAp0aGF0IHRoaXMgaGFz
IHRvIGRvIHdpdGggbGF0ZW5jeSB0b28sIG5vdCBqdXN0IGJhbmR3aWR0aCwgYnV0IGhlIGRpZG4n
dApleHBsYWluIGFueSBmdXJ0aGVyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
