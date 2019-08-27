Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8879F394
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 21:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D251A89321;
	Tue, 27 Aug 2019 19:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FC18932B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 19:54:59 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0CD00054E9B179BF3AF377.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0c:d000:54e9:b179:bf3a:f377])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 48BA51EC0C50;
 Tue, 27 Aug 2019 21:54:56 +0200 (CEST)
Date: Tue, 27 Aug 2019 21:54:56 +0200
From: Borislav Petkov <bp@alien8.de>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v2 2/4] x86/vmware: Add a header file for hypercall
 definitions
Message-ID: <20190827195456.GK29752@zn.tnic>
References: <20190823081316.28478-1-thomas_os@shipmail.org>
 <20190823081316.28478-3-thomas_os@shipmail.org>
 <20190827154422.GG29752@zn.tnic>
 <b82e190e-6887-b95a-a99a-176f22c57b7b@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b82e190e-6887-b95a-a99a-176f22c57b7b@shipmail.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alien8.de; s=dkim; t=1566935696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AvgPkyYE9dIG4yEdjhJf3EOgp9ARV7huDlcbngwRfvA=;
 b=gfRui7sC0y3LTSHJ6PedLtrZy4DTvufZrPXSlOiiXeGEzDgteTJI4GhEfL1GUyHvwbZSZh
 7rwMoemF7UV4vHloiOGW96VIpOVFKEOQggDpiSamF9RY3zGFvWoGyMf+/rRurVCS8t8lQw
 bAtVHRMfBDBi/2GtPGRRY4EmsOAoiZk=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, pv-drivers@vmware.com,
 x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Doug Covelli <dcovelli@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 linux-graphics-maintainer@vmware.com, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDk6MTk6MDNQTSArMDIwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKFZNd2FyZSkgd3JvdGU6Cj4gSXQgc2hvdWxkIGJlIGNvcnJlY3QuIFRoZSBmbGFncyBWTVdB
UkVfSFlQRVJWSVNPUl9IQiBhbmQKPiBWTVdBUkVfSFlQRVJWSVNPUl9PVVQgYXJlIG9ubHkgdmFs
aWQgZm9yIHRoZSB2bWNhbGwgLyB2bW1jYWxsIHZlcnNpb25zLgo+IAo+IEZvciB0aGUgbGVnYWN5
IHZlcnNpb24sIHRoZSBkaXJlY3Rpb24gaXMgdG9nZ2xlZCBieSB0aGUgaW5zdHJ1Y3Rpb24gKGlu
IHZzCj4gb3V0KSBhbmQgTEIgdnMgSEIgaXMgdG9nZ2xlZCBieSB0aGUgcG9ydCBudW1iZXIgKDB4
NTY1OCB2cyAweDU2NTkpCj4gCj4gU28gaW4gZXNzZW5jZSB0aGUgbG93IHdvcmQgZGVmaW5pdGlv
biBvZiAlZWR4IGlzIGRpZmZlcmVudCBpbiB0aGUgdHdvCj4gdmVyc2lvbnMuIEkndmUgY2hvc2Vu
IHRvIHVzZSB0aGUgbmV3IHZtY2FsbC92bW1jYWxsIGRlZmluaXRpb24gaW4gdGhlIGRyaXZlcgo+
IGNvZGUuCgpBaCwgb2ssIEkgc2VlIHdoYXQgeW91IG1lYW4uIFRoZSBvbGQgbWV0aG9kIHdvdWxk
IG92ZXJ3cml0ZSB0aGUgbG93IHdvcmQKb2YgJWVkeCBidXQgdGhlIG5ldyBvbmUgd291bGQgaGF2
ZSB0aGUgZmxhZ3MgYWxyZWFkeSBwcmVwYXJlZCBhbmQgKm5vdCoKb3ZlcndyaXRlIHRoZW0gc28g
YWxsIGdvb2QuCgpDYW4geW91IHBsZWFzZSBkb2N1bWVudCB0aGF0IG1vcmUgZXhwbGljaXRseSBp
biB0aGUgY29tbWVudCBpbgphcmNoL3g4Ni9pbmNsdWRlL2FzbS92bXdhcmUuaD8gU29tZXRoaW5n
IGxpa2U6CgoiLi4uIFRoZSBuZXcgdm1jYWxsIGludGVyZmFjZSBpbnN0ZWFkIHVzZXMgYSBzZXQg
b2YgZmxhZ3MgdG8gc2VsZWN0CmJhbmR3aWR0aCBtb2RlIGFuZCB0cmFuc2ZlciBkaXJlY3Rpb24u
IFRoZSBzZXQgb2YgZmxhZ3MgaXMgYWxyZWFkeQpsb2FkZWQgaW50byAlZWR4IGJ5IHRoZSBtYWNy
b3Mgd2hpY2ggdXNlIFZNV0FSRV9IWVBFUkNBTEwqIGFuZCBvbmx5IHdoZW4KdGhlIGd1ZXN0IG11
c3QgdXNlIHRoZSBvbGQgVk1XQVJFX0hZUEVSVklTT1JfUE9SVCogbWV0aG9kLCB0aGUgbG93IHdv
cmQKaXMgb3ZlcndyaXR0ZW4gYnkgdGhlIHJlc3BlY3RpdmUgcG9ydCBudW1iZXIuIgoKQW55d2F5
LCBzb21ldGhpbmcgYWxvbmcgdGhvc2UgbGluZXMuIFdlIHdhbnQgdG8gaGF2ZSB0aGUgYWx0ZXJu
YXRpdmVzCmNvZGUgYXMgY2xlYXIgYW5kIGFzIHRyYW5zcGFyZW50IGFzIHBvc3NpYmxlIGJlY2F1
c2UsIHdlbGwsIG9mIG9idmlvdXMKcmVhc29ucy4gOi0pCgpUaHguCgotLSAKUmVnYXJkcy9HcnVz
cywKICAgIEJvcmlzLgoKR29vZCBtYWlsaW5nIHByYWN0aWNlcyBmb3IgNDAwOiBhdm9pZCB0b3At
cG9zdGluZyBhbmQgdHJpbSB0aGUgcmVwbHkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
