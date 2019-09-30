Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44778C213F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 15:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1003C89958;
	Mon, 30 Sep 2019 13:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05D989958
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 13:04:00 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r9so8543069edl.10
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 06:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=X92OS/YmMaYZnmIebA59VUdwEwr03gpB8PIctXgbJZ4=;
 b=jI1dP62mzP91aPb0XV8TBOsSRmsqV55vE6AXQD/Jfp43QZnVIpkSMLmJbbtNAkJWX9
 DFerKsU8ydI940eM7IHXLB0aqFRFsCSRSFl/bjWtLw1Eh/w//ycyNY/3+C/CKSERrN2T
 At2L8fvxlolsUzivyvSyc7xVxsDFmoi0s0Hxk77kcWHEnH2vmmLCuGkLfqx3+0xukTiQ
 irV59Hq75CtpKgUaiepEGCeycMs6ShCX+p9Tv/8ss/9MjfMC/a5ZiCFBp+vVN95AkoR9
 B8jVwjpb5lh74rMwLWJ+wTtFieZGZzCUMRwdjG6EJVhJaum+IsCaleuv1ROwUNWUWPmn
 XncQ==
X-Gm-Message-State: APjAAAWV/6PUcpxXJilRrvket7UvPPgT1oL+0oAxMTXgb+TJQfBw+S6i
 +BpAkCdCBMbMq9nmZdSNjq3PkA==
X-Google-Smtp-Source: APXvYqzelB36HojuzAqNfWSyrjONv3COCBUzGnQRje/uJA4lFQXG93gbJIZP+wzSdnBe8CIKycKesw==
X-Received: by 2002:a50:ab83:: with SMTP id u3mr19213587edc.228.1569848639143; 
 Mon, 30 Sep 2019 06:03:59 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id a50sm2437505eda.25.2019.09.30.06.03.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Sep 2019 06:03:58 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 3569C1020E6; Mon, 30 Sep 2019 16:03:57 +0300 (+03)
Date: Mon, 30 Sep 2019 16:03:57 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Ack to merge through DRM? WAS Re: [PATCH v2 1/5] mm: Add
 write-protect and clean utilities for address space ranges
Message-ID: <20190930130357.ye3zlkbka2jtd56a@box>
References: <20190926115548.44000-1-thomas_os@shipmail.org>
 <20190926115548.44000-2-thomas_os@shipmail.org>
 <85e31bcf-d3c8-2fcf-e659-2c9f82ebedc7@shipmail.org>
 <CAHk-=wifjLeeMEtMPytiMAKiWkqPorjf1P4PbB3dj17Y3Jcqag@mail.gmail.com>
 <a48a93d2-03e9-40d3-3b4c-a301632d3121@shipmail.org>
 <CAHk-=whwN+CvaorsmczZRwFhSV+1x98xg-zajVD1qKmN=9JhBQ@mail.gmail.com>
 <20190927121754.kn46qh2crvsnw5z2@box>
 <CAHk-=whfriLqivyRtyjDPzeNr_Y3UYkC9g123Yi_yB5c8Gcmiw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=whfriLqivyRtyjDPzeNr_Y3UYkC9g123Yi_yB5c8Gcmiw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=X92OS/YmMaYZnmIebA59VUdwEwr03gpB8PIctXgbJZ4=;
 b=cJY93XdHuqF+imwwh62tcdky9RZEwqCQpzVJai8K40Gou9OtqAcoT7MhKJQ6O5Cc/A
 LjXpPigLgUd03NnABftRxqMgDJuRqWC40hRxzdmit4MTcsraNw3RQuiNTWzh+FIcITZG
 1ty/HtNKR+IyYN6Wb47vn6iIVymFi08uQ/8gC1i7u5vjh/U8gbBs1OsiYyWW0EDD9R6w
 52sqJtJlSwFRHLc02izDHy/P3KZF38xTMZ5jeCIyG7+C/R369yWNWcpIhXrrPL7hEFxw
 VS0GMqx8XiuLt9dflM3IPCNeRygSUUlKdWEqNxtWdjkg96I3mY84D+bSsiq+qjp6XJPB
 m8Bw==
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

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDk6Mzk6NDhBTSAtMDcwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gT24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgNToxNyBBTSBLaXJpbGwgQS4gU2h1dGVt
b3YgPGtpcmlsbEBzaHV0ZW1vdi5uYW1lPiB3cm90ZToKPiA+Cj4gPiA+IENhbGwgaXQgIndhbGtf
cGFnZV9tYXBwaW5nKCkiLiBBbmQgdGFsayBleHRlbnNpdmVseSBhYm91dCBob3cgdGhlCj4gPiA+
IGxvY2tpbmcgZGlmZmVycyBhIGxvdCBmcm9tIHRoZSB1c3VhbCAid2Fsa19wYWdlX3ZtYSgpIiB0
aGluZ3MuCj4gPgo+ID4gV2Fsa2luZyBtYXBwaW5ncyBvZiBhIHBhZ2UgaXMgd2hhdCBybWFwIGRv
ZXMuIFRoaXMgY29kZSB0aGFzIHRvIGJlCj4gPiBpbnRlZ3JhdGVkIHRoZXJlLgo+IAo+IFdlbGws
IHRoYXQncyB2ZXJ5IHF1ZXN0aW9uYWJsZS4KPiAKPiBUaGUgcm1hcCBjb2RlIG1haW5seSBkb2Vz
IHRoZSAicGFnZSAtPiB2aXJ0dWFsIiBtYXBwaW5nLiAgT25lIHBhZ2UgYXQgYSB0aW1lLgo+IAo+
IFRoZSBwYWdlIHdhbGtlciBjb2RlIGRvZXMgdGhlICJ2aXJ0dWFsIC0+IHB0ZSIgbWFwcGluZy4g
QWx3YXlzIGEgd2hvbGUKPiByYW5nZSBhdCBhIHRpbWUuCgpIYXZlIHlvdSBzZWVuIHBhZ2Vfdm1h
X21hcHBlZF93YWxrKCk/IEkgbWFkZSBpdCBzcGVjaWZpY2FsbHkgZm9yIHJtYXAgY29kZQp0byBj
b3ZlciBjYXNlcyB3aGVuIGEgVEhQIGlzIG1hcHBlZCB3aXRoIFBURXMuIFRvIG1lIGl0J3Mgbm90
IGEgYmlnCnN0cmV0Y2ggdG8gbWFrZSBpdCBjb3ZlciBtdWx0aXBsZSBwYWdlcyB0b28uCgo+IFNv
IEkgdGhpbmsgY29uY2VwdHVhbGx5LCBtbS9tZW1vcnkuYyBhbmQgdW5tYXBfbWFwcGluZ19yYW5n
ZSgpIGlzCj4gY2xvc2VzdCBidXQgSSBkb24ndCB0aGluayBpdCdzIHByYWN0aWNhbCB0byBzaGFy
ZSBjb2RlLgo+IAo+IEFuZCBiZXR3ZWVuIG1tL3BhZ2V3YWxrLmMgYW5kIG1tL3JtYXAuYywgSSB0
aGluayB0aGUgcGFnZSB3YWxraW5nIGhhcwo+IHdheSBtb3JlIG9mIGFjdHVhbCBwcmFjdGljYWwg
Y29kZSBzaGFyaW5nLCBhbmQgaXMgYWxzbyBjb25jZXB0dWFsbHkKPiBjbG9zZXIgYmVjYXVzZSBt
b3N0IG9mIHRoZSBjb2RlIGlzIGFib3V0IHdhbGtpbmcgYSByYW5nZSwgbm90IGxvb2tpbmcKPiB1
cCB0aGUgbWFwcGluZyBvZiBvbmUgcGFnZS4KCkkgZ3Vlc3MgaXQncyBtYXR0ZXIgb2YgcGVyc29u
YWwgcHJlZmVyZW5jZXMsIGJ1dCBwYWdlIHRhYmxlIHdhbGtlcnMgYmFzZWQKb24gY2FsbGJhY2sg
YWx3YXlzIGZlbHQgd3JvbmcgdG8gbWUuCgotLSAKIEtpcmlsbCBBLiBTaHV0ZW1vdgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
