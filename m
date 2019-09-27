Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A37C0C04F9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 14:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A4D6EEE5;
	Fri, 27 Sep 2019 12:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE306EEE5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 12:17:53 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id r4so2149077edy.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 05:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=zCiD3TkmkX3XcFX04Lf0rUa1Py59Hl7dbwV8vnS+nx4=;
 b=oh3+Il8qv3B3yochUv+rCtaKeX8U8o5SoG9PbPoqh/FIydTnsSaw+ieI9Wzh4P6W31
 x6okqX4C9eamicbLHkECooTKlWFXVE2F5g6u5+DkmwJy9/7amdlXY7vvhd4k74i8L7qa
 0dIlde+e7Bn3sjl2f8H6Yp/ecwBL3g8iXQcz8vX3ReeuWYPIc95yB/3Wzi2tvh7afooK
 fWHD8sbqe6Wq4X4mHYMNt95xtbHrveGVg3auknDWTEqbP9DQokgYfEmYWWvkoUbNfzvW
 W1YKSzouTzjfSQi5rA6cp4jI2tUIwiJjHdPiP3/QIibRiV7H5kZRS/mwE/nHrCK589za
 NlnA==
X-Gm-Message-State: APjAAAWy2+q20Kzl+3ONseiqtj4lmZCtB7CO7FEx5DkrKypPoqTg9Gi3
 foo7SP0bKx0fTk3S2G5xEINXdnjWsxk=
X-Google-Smtp-Source: APXvYqzDqxxVYTiADi5x5I86mOGr2mlaIGwZzHeIBO80YOSWqGJpba79qB+UWXl+lD8oNUZcMGCMZA==
X-Received: by 2002:a17:906:699:: with SMTP id
 u25mr7229807ejb.250.1569586671584; 
 Fri, 27 Sep 2019 05:17:51 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id u27sm497064edb.48.2019.09.27.05.17.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 05:17:50 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 9F6F8101F61; Fri, 27 Sep 2019 15:17:54 +0300 (+03)
Date: Fri, 27 Sep 2019 15:17:54 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
Message-ID: <20190927121754.kn46qh2crvsnw5z2@box>
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
 <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
 <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
 <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=zCiD3TkmkX3XcFX04Lf0rUa1Py59Hl7dbwV8vnS+nx4=;
 b=yDe5MTtY8Qrujp2zCelibfB/Ag25mYxKxY2uPMP1hitaI7IgiQ9rREkUyCW4wjVBwi
 99q/NqenKNcoyT6mSmQzKGfzUogxfbJ1FTM41FiO3wJKi/PHmD5EODBVanDBPfYoDekO
 Ss5Q37xyH4SmU/9+z4EkXuqhFO2yc0I8YvUGpaFGjt72YjJz8b//uyaW9bwMtiit4E5L
 2cZYQset3YJ8ja5+8hKqjI4c4hyqbWLQBcw108T1HOBpGkOfHlDGih7OHJObjRki284N
 ThKmD2Vmtfo3li+XFIlDBghUyC+Y8E2KQHpQAM7icIJ118ql+QWzvYugd7LeZt5SRcYT
 QLnA==
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDE6MTY6NTVQTSAtMDcwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTowOSBQTSBUaG9tYXMgSGVsbHN0csO2
bSAoVk13YXJlKQo+IDx0aG9tYXNfb3NAc2hpcG1haWwub3JnPiB3cm90ZToKPiA+Cj4gPiBUaGF0
IHNhaWQsIGlmIHBlb3BsZSBhcmUgT0sgd2l0aCBtZSBtb2RpZnlpbmcgdGhlIGFzc2VydCBpbgo+
ID4gcHVkX3RyYW5zX2h1Z2VfbG9jaygpIGFuZCBtYWtlIF9fd2Fsa19wYWdlX3JhbmdlIG5vbi1z
dGF0aWMsIGl0IHNob3VsZAo+ID4gcHJvYmFibHkgYmUgcG9zc2libGUgdG8gbWFrZSBpdCB3b3Jr
LCB5ZXMuCj4gCj4gSSBkb24ndCB0aGluayB5b3UgbmVlZCB0byBtb2RpZnkgdGhhdCBhc3NlcnQg
YXQgYWxsLgo+IAo+IFRoYXQgdGhpbmcgb25seSBleGlzdHMgd2hlbiB0aGVyZSdzIGEgInB1ZF9l
bnRyeSIgb3AgaW4gdGhlIHdhbGtlciwKPiBhbmQgdGhlbiB5b3UgYWJzb2x1dGVseSBuZWVkIHRv
IGhhdmUgdGhhdCBtbWFwX2xvY2suCj4gCj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwsIHlvdSBmdW5k
YW1lbnRhbGx5IG9ubHkgZXZlciB3b3JrIG9uIGEgcHRlIGxldmVsCj4gaW4geW91ciBhZGRyZXNz
IHNwYWNlIHdhbGtlciBhbHJlYWR5IGFuZCBhY3R1YWxseSBoYXZlIGEgV0FSTl9PTigpIG9uCj4g
dGhlIHB1ZF9odWdlIHRoaW5nLCBzbyBubyBwdWQgZW50cnkgY2FuIHBvc3NpYmx5IGFwcGx5Lgo+
IAo+IFNvIG5vLCB0aGUgYXNzZXJ0IGluIHB1ZF90cmFuc19odWdlX2xvY2soKSBkb2VzIG5vdCBz
ZWVtIHRvIGJlIGEKPiByZWFzb24gbm90IHRvIGp1c3QgdXNlIHRoZSBleGlzdGluZyBwYWdlIHRh
YmxlIHdhbGtlcnMuCj4gCj4gQW5kIG9uY2UgeW91IGdldCByaWQgb2YgdGhlIHdhbGtpbmcsIHdo
YXQgaXMgbGVmdD8gSnVzdCB0aGUgIml0ZXJhdGUKPiBvdmVyIHRoZSBpbm9kZSBtYXBwaW5ncyIg
cGFydC4gV2hpY2ggY291bGQganVzdCBiZSBkb25lIGluCj4gbW0vcGFnZXdhbGsuYywgYW5kIHRo
ZW4geW91IGRvbid0IGV2ZW4gbmVlZCB0byByZW1vdmUgdGhlIHN0YXRpYy4KPiAKPiBTbyBtYWtp
bmcgaXQgYmUganVzdCBhbm90aGVyIHdhbGtpbmcgaW4gcGFnZXdhbGsuYyB3b3VsZCBzZWVtIHRv
IGJlCj4gdGhlIHNpbXBsZXN0IG1vZGVsLgo+IAo+IENhbGwgaXQgIndhbGtfcGFnZV9tYXBwaW5n
KCkiLiBBbmQgdGFsayBleHRlbnNpdmVseSBhYm91dCBob3cgdGhlCj4gbG9ja2luZyBkaWZmZXJz
IGEgbG90IGZyb20gdGhlIHVzdWFsICJ3YWxrX3BhZ2Vfdm1hKCkiIHRoaW5ncy4KCldhbGtpbmcg
bWFwcGluZ3Mgb2YgYSBwYWdlIGlzIHdoYXQgcm1hcCBkb2VzLiBUaGlzIGNvZGUgdGhhcyB0byBi
ZQppbnRlZ3JhdGVkIHRoZXJlLgoKLS0gCiBLaXJpbGwgQS4gU2h1dGVtb3YKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
