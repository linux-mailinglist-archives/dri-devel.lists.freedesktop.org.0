Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182E25B14D
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FE989DE6;
	Sun, 30 Jun 2019 18:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F846E8D9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 11:08:10 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id f17so8577344wme.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 04:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=dy0OUe3jXni/DbPtLLfy+Imo87lyDK8mTTLuUeXMhQE=;
 b=oNbgVW6XET4nKPMjBwN0ISLUV/ls9iQbKr5i0Ev79jdGmVRbNYDdPsDdJKbHrz0P7W
 dg4SCLljqnZXg8wI4yAsMuvFK3bkXPy/HWhGtpOQfo6gS2SVg4X//T1q9bGKHqcvK+Wi
 iVNnsIZym5zr7eLfscrGpcSim74T1s+AGftEqZvRd02TbBgN8TZjEVZz13NG2XJax37A
 Z4MmZ5Dcq/Bw49sG4N18z1ajZXKbQ5ywSs/1Z/7udnQOUjjfaJXHHvv6lX+7Sd6XYq5V
 lgUYBtTcCy7KKCarmPgBEnu4yiqqms/f7wn14FXi6RsyzBGT96bE7DeFGHUqwGSKswk/
 jiCA==
X-Gm-Message-State: APjAAAU1SF7JeMJxWqA8NG9E+OO1OJLrhrfDXZTzDLy5bbeseYuMWThc
 a9cReRCYWW3pfoNjlaljrBc4lbgf
X-Google-Smtp-Source: APXvYqxYvkKURCgyUJXuWl/eokkCivdDGRAptwCUKRQLarQKa2GsozG8CLcA4mJrFNiZtrYRVV5N6A==
X-Received: by 2002:a1c:9813:: with SMTP id a19mr6705286wme.11.1561720089456; 
 Fri, 28 Jun 2019 04:08:09 -0700 (PDT)
Received: from Timur-XPS (catv-80-99-228-232.catv.broadband.hu.
 [80.99.228.232])
 by smtp.gmail.com with ESMTPSA id a12sm1339165wrr.70.2019.06.28.04.08.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 04:08:08 -0700 (PDT)
Message-ID: <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Fri, 28 Jun 2019 13:08:07 +0200
In-Reply-To: <20190628103204.GJ2640@lahna.fi.intel.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=dy0OUe3jXni/DbPtLLfy+Imo87lyDK8mTTLuUeXMhQE=;
 b=JhyUIAbjbkv+J5oz2x3QPVYrJyTofGswUgjL+uSI98JuOddof1Ax4VU2dbTqPPdgd5
 NqWnYDt/VzSlQKIo9fzooHMI/5e9RJlfNWwDOmvBnIHMe8CCdNsJWVu9mDgP23Tfk/er
 pdcyC1ImHDLXFBR8oFLZ7Aul27dLezUreowHCptDAMXSrQIc/62xC2x9AoW5yGDZWKkO
 zvmhKvrTBulctLeYsDpxjvU88Bb6x/EDWjYazIPeXchaDwEN7QBMJU1ChF/TcNag5vAq
 D57VhU8it7OWoLTU1CIcqh1oN5VbebF2NX1lE+NjKxOHhHXNhJ+ZlmFlN3G95M9p4P9I
 iE8w==
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

SGkgTWlrYSwKClRoYW5rcyBmb3IgeW91ciBxdWljayByZXBseS4KCj4gPiAxLiBXaHkgYXJlIHRo
ZXJlIGZvdXIgYnJpZGdlIGRldmljZXM/IDA0OjAwLjAsIDA0OjAxLjAgYW5kIDA0OjAyLjAKPiA+
IGxvb2sKPiA+IHN1cGVyZmx1b3VzIHRvIG1lIGFuZCBub3RoaW5nIGlzIGNvbm5lY3RlZCB0byB0
aGVtLiBJdCBhY3R1YWxseQo+ID4gZ2l2ZXMKPiA+IG1lIHRoZSBmZWVsaW5nIHRoYXQgdGhlIFRC
MyBkcml2ZXIgY3JlYXRlcyA0IGRldmljZXMgd2l0aCAyLjUgR1Qvcwo+ID4gZWFjaCwgaW5zdGVh
ZCBvZiBvbmUgZGV2aWNlIHRoYXQgY2FuIGRvIHRoZSBmdWxsIDggR1Qvcy4KPiAKPiBCZWNhdXNl
IGl0IGlzIHN0YW5kYXJkIFBDSWUgc3dpdGNoIHdpdGggb25lIHVwc3RyZWFtIHBvcnQgYW5kIG4K
PiBkb3duc3RyZWFtIHBvcnRzLgoKU3VyZSwgdGhvdWdoIGluIHRoaXMgY2FzZSAzIG9mIHRob3Nl
IGRvd25zdHJlYW0gcG9ydHMgYXJlIG5vdCBleHBvc2VkCmJ5IHRoZSBoYXJkd2FyZSwgc28gaXQn
cyBhIGJpdCBzdXJwcmlzaW5nIHRvIHNlZSB0aGVtIHRoZXJlLgoKV2h5IEkgYXNrZWQgYWJvdXQg
aXQgaXMgYmVjYXVzZSBJIGhhdmUgYSBzdXNwaWNpb24gdGhhdCBtYXliZSB0aGUKYmFuZHdpZHRo
IGlzIGFsbG9jYXRlZCBlcXVhbGx5IGJldHdlZW4gdGhlIDQgZG93bnN0cmVhbSBwb3J0cywgZXZl
bgp0aG91Z2ggb25seSBvbmUgb2YgdGhlbSBpcyB1c2VkLgoKPiAKPiA+IDIuIFdoeSBhcmUgc29t
ZSBvZiB0aGUgYnJpZGdlIGRldmljZXMgb25seSBjYXBhYmxlIG9mIDIuNSBHVC9zCj4gPiBhY2Nv
cmRpbmcgdG8gbHNwY2k/Cj4gCj4gWW91IG5lZWQgdG8gdGFsayB0byBsc3BjaSBtYWludGFpbmVy
LgoKU29ycnkgaWYgdGhlIHF1ZXN0aW9uIHdhcyB1bmNsZWFyLgpJdCdzIG5vdCBvbmx5IGxzcGNp
LCB0aGUga2VybmVsIGFsc28gcHJpbnRzIGEgd2FybmluZyBhYm91dCBpdC4KCkxpa2UgSSBzYWlk
IHRoZSBkZXZpY2UgcmVhbGx5IGlzIGxpbWl0ZWQgdG8gMi41IEdUL3MgZXZlbiB0aG91Z2ggaXQK
c2hvdWxkIGJlIGFibGUgdG8gZG8gOCBHVC9zLgoKPiAKPiA+IDMuIElzIGl0IHBvc3NpYmxlIHRv
IG1hbnVhbGx5IHNldCB0aGVtIHRvIDggR1Qvcz8KPiAKPiBObyBpZGVhLgo+IAo+IEFyZSB5b3Ug
YWN0dWFsbHkgc2VlaW5nIHNvbWUgcGVyZm9ybWFuY2UgaXNzdWUgYmVjYXVzZSBvZiB0aGlzIG9y
IGFyZQo+IHlvdSBqdXN0IGN1cmlvdXM/CgpZZXMsIEkgc2VlIGEgbm90aWNhYmxlIHBlcmZvcm1h
bmNlIGhpdDogc29tZSBnYW1lcyBoYXZlIHZlcnkgbG93IGZyYW1lCnJhdGUgd2hpbGUgbmVpdGhl
ciB0aGUgQ1BVIG5vciB0aGUgR1BVIGFyZSBmdWxseSB1dGlsaXplZC4KCihTaWRlIG5vdGU6IG1l
c2EgMTkuMSBoYXMgYSByYWRlb25zaSBwYXRjaCB0aGF0IHJlZHVjZXMgdGhlIGJhbmR3aWR0aAp1
c2UsIHdoaWNoIGRvZXMgaGVscC4gSG93ZXZlciBpdCBkb2Vzbid0IHNvbHZlIHRoZSB1bmRlcmx5
aW5nIHByb2JsZW0Kb2YgdGhlIHNsb3cgVEIzIGludGVyZmFjZS4pCgpCZXN0IHJlZ2FyZHMsClRp
bQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
