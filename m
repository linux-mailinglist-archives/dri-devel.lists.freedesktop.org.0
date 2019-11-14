Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DDEFC14A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7EB6E347;
	Thu, 14 Nov 2019 08:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535F26E37C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 08:13:24 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id v138so4487814oif.6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 00:13:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=usVDWHmv5DZNuthEvhDRqqQKzdMyMIvl9UxvVAa6s+c=;
 b=e6OYa6V2QL2UBCIPTrQct4/UI9Pwc1OqyW1DGI3bhzuTMVjohWX/NTMUdgMXrgptmt
 WcNgX8zB0zWw0OiXMkA2PpmHEcQgIX+/+7IvNXGva09eoCS9SS/xt38D2OOcklGNfD4I
 9PuyFqWPqk5r/3bzOKAfdgsqW46BvEsy64SX1aY6FXN9eElVzuSVGK+2o9HrePmvsARk
 XgGF9E30BFOOkJNRrk8lY+eZZVLkvy+j6oQwfVao4DIhz2YOHmNx8wXUpaVZx/7mU/Jf
 mio+nqkEStbuuqHcHQ+IpKpwnmBDqPGQQRmLXR4RoEXwkvbL/+8GhK0boNc2sIO+5llp
 cYIQ==
X-Gm-Message-State: APjAAAU1P+63LV7weAbSXu3errHWzAxkjA1SLa8kVn5Zlh8eXOqeE2BJ
 4Kb/dr2SNZ8O+sQVSFZGrmw+SOORGKKupxMujK3776DF
X-Google-Smtp-Source: APXvYqwqQCQaA3F6ZKKUKpEx9Eoo5sCURhlwvYB8pTkEdyjKJ6eqP4fUfUiX75oO6pBis7dQUh1wZMgkTrevONrO9Mc=
X-Received: by 2002:aca:ead7:: with SMTP id i206mr2548604oih.128.1573719203449; 
 Thu, 14 Nov 2019 00:13:23 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txqtne1+ycij3YYmxWA1jAOB=VoWCZbjnLb71hwxB7_Cw@mail.gmail.com>
In-Reply-To: <CAPM=9txqtne1+ycij3YYmxWA1jAOB=VoWCZbjnLb71hwxB7_Cw@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 14 Nov 2019 09:13:11 +0100
Message-ID: <CAKMK7uFtbRifpYanq3qOAOfzFFKWEe0zvJUg8A241TJ6rqoE+A@mail.gmail.com>
Subject: Re: drm-next + i915 CVE yolo merge
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=usVDWHmv5DZNuthEvhDRqqQKzdMyMIvl9UxvVAa6s+c=;
 b=BbCt6M/v9oopnar8pEN7RlVzFklqP69U8AbkzOIN+5GrjamrCRP1+qvY7wqrofMBb3
 Mk2jKbnksSOdVFooQtP7eItdaHnE/bRK0JHOZP+oM0OAu/cF0u052ois71XgMSpH4wkE
 nK66VYcZHhsQhluupF5/ivusOJogeOV3wM+G8=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Bloomfield,
 Jon" <jon.bloomfield@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgMjozMyBBTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFp
bC5jb20+IHdyb3RlOgo+IFRoZSBsYW5kaW5nIG9mIHRoZSBpOTE1IENWRSBmaXhlcyBpbnRvIExp
bnVzIHRyZWUgaGFzIGNyZWF0ZWQgYSBiaXQgb2YKPiBhIG1lc3MgaW4gbGludXgtbmV4dCBhbmQg
ZG93bnN0cmVhbSBpbiBkcm0tbmV4dCB0cmVlcy4KPgo+IEkgdGFsa2VkIHRvIERhbmllbCBhbmQg
aGUgaGFkIHRhbGtlZCB0byBKb29uYXMgYSBiaXQsIGFuZCBJIGRlY2lkZWQgdG8KPiBnbyB3aXRo
IHdoYXQgRGFuaWVsIGRlc2NyaWJlcyBhcyB0aGUgWU9MTyBtZXJnZSwgd2hlcmUgSSBqdXN0IHNv
bHZlIGl0Cj4gYW5kIHByYXksIGFuZCBldmVyeW9uZSBlbHNlIHZlcmlmaWVzL2ZpeGVzIGl0Lgo+
Cj4gSW4gbXkgZmF2b3VyIEkndmUgYmVlbiByZWFkaW5nIHRoZXNlIHBhdGNoZXMgZm9yIGEgY291
cGxlIG9mIG1vbnRocwo+IG5vdyBhbmQgYXBwbGllZCB0aGVtIHRvIGEgbG90IG9mIHBsYWNlcywg
c28gSSdtIHF1aXRlIGZhbWlsaWFyIHdpdGgKPiB3aGF0IHRoZXkgYXJlIGRvaW5nLgo+Cj4gVGhl
IHdvcnN0IGN1bHByaXQgd2FzIHRoZSBSQzYgY3R4IGNvcnJ1cHRpb24gZml4IHNpbmNlIHRoZSB3
aG9sZSBvZgo+IHJjNiBnb3QgcmVmYWN0b3JlZCBpbiBuZXh0LiBIb3dldmVyIEkgYWxzbyBoYWQg
YWNjZXNzIHRvIGEgdmVyc2lvbiBvZgo+IHRoaXMgcGF0Y2ggSm9uIHdyb3RlIG9uIGRybS10aXAg
YSBjb3VwbGUgb2Ygd2Vla3MgYWdvLgo+Cj4gSSB0b29rIHRoYXQgcGF0Y2gsIGFwcGxpZWQgaXQg
YW5kIGZpeGVkIGl0IHVwIG9uIHRvcCBvZiBkcm0tbmV4dC4gVGhlbgo+IEkgYmFja21lcmdlZCB0
aGUgY29tbWl0IHRoYXQgYWxzbyB3ZW50IGludG8gTGludXMnIHRyZWUuIFRoZW4gSQo+IHJlbW92
ZWQgYW55IGV2aWRlbmNlIG9mIHRoZSBSQzYgcGF0Y2ggZnJvbSBMaW51cycgdHJlZSBhbmQgbGVm
dCB0aGUKPiBuZXdlciB2ZXJzaW9uIHBpZWNlcyBpbiBwbGFjZS4gVGhlIG90aGVyIHN0dWZmIG1v
c3RseSBtZXJnZWQgZmluZSBhbmQKPiB0aGUgcmVzdWx0cyBsb29rZWQgZmluZSwgYnV0IEknZCBk
ZWZpbml0ZWx5IHRoaW5rIGV2ZXJ5b25lIGF0IEludGVsCj4gc2hvdWxkIGJlIHN0YXJpbmcgYXQg
aXQsIGFuZCBteSBkaW5xIHRpcCByZXNvbHV0aW9ucyBBU0FQIGFuZAo+IGhvcGVmdWxseSBpdCBn
b2VzIGludG8gQ0kgYW5kIGNvbWVzIG91dCBzbWVsbGluZyBvZiBzb21ldGhpbmcgZ29vZC4KPgo+
IExldCBtZSBrbm93IGlmIGl0J3MgYWxsIGhvcnJpYmxlIGFzYXAsCgpBZGQgTWFydGluIGFuZCBB
cmVrIGZvciBDSSByZXN1bHRzLiBUaGUgeW9sbyBzdHVmZiBsYW5kZWQgaW4KQ0lfRFJNXzczNDAs
IGRpZCB3ZSBicmVhayBhbnl0aGluZyBpbiB0aGVyZT8gRnJvbSBhIHF1aWNrIGxvb2sgc2VlbXMK
YWxsIG9rLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
