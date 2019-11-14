Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE9FBD83
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 02:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E083F6E10C;
	Thu, 14 Nov 2019 01:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436556E10C;
 Thu, 14 Nov 2019 01:33:37 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id g3so4738648ljl.11;
 Wed, 13 Nov 2019 17:33:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=jVTDTHy4FpoRBo0q0atf8Zj+6l3upS3hfspF/TrFPnk=;
 b=dmKILPbGbUtJralrqjYWS4oL3gSLt1ayV0RG5pGiyqKoxTMavwwuzMwRvtO22TK88i
 MPJDD68+/eJzTldu7AmM1vkfu6MMaxcpk58C5jFyFOTD+IyNt6s5ZxnOJOE6hu8cwlrW
 ULE3vjao1Ye1uSora33+mP+ZsF6O+6EPANJEgEiDlHdbyLVhXc/gDjheaMApdTbOAOJJ
 oVJ+uCCG/C00tvLdqrWUl1eiqWO/0jXUK8NKQY/hPa+Vk/gQJTu94D/P46x8OI44QiEK
 fDt8Dwx21PwaHg4B5AW7deMEjBlNGe/K21o171cdcxjtwCjcnkE/+u1d0bg+MDfUqF0J
 mTkQ==
X-Gm-Message-State: APjAAAWxvLFZXyiQ3nGV8CXq2vOKTEEZZZP8IVEJiCZjgFmBzf7ZGPkg
 VCptZmVBiv+07gCEYOsfTT9KwfF/rWx1EOTNQqQjng==
X-Google-Smtp-Source: APXvYqwlstMgw4VCYyIyUKsBuCCIFJotWoEkP8aQmRtA0IvwlKimhqj6sc4zwlCLO/qCVKisekA+CzRPoATzqwKUIJc=
X-Received: by 2002:a2e:7c12:: with SMTP id x18mr4608763ljc.130.1573695215356; 
 Wed, 13 Nov 2019 17:33:35 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 14 Nov 2019 11:33:24 +1000
Message-ID: <CAPM=9txqtne1+ycij3YYmxWA1jAOB=VoWCZbjnLb71hwxB7_Cw@mail.gmail.com>
Subject: drm-next + i915 CVE yolo merge
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 "Bloomfield, Jon" <jon.bloomfield@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=jVTDTHy4FpoRBo0q0atf8Zj+6l3upS3hfspF/TrFPnk=;
 b=X7V7yU/ion7JqchnaFYDJB3sQn/tP2nM3z4OeNH8yMh8WdJCsPb0qb5rIeHLyZ40aJ
 PM12S1chnYh50FxdMfQZ5V4LgUkbt9wCJjYArwrgLTMQcJV3Fb+e/SvXczTF49gpS80J
 Z+xcVP3JadfRWQlTuye0mhl9FnEVDLq0U5u3nXTYcOOH2Y4rTkAcRcVivCMBSq1cvw89
 YzzoEpzYbu3XVDkAFaNQQ6Mz0a4MJRf7s2dtthxf1aCELG2ymE3/L0gP7FDe52h5CR1Q
 g9KO7CghZBFLi7x7IAYPA1wetlUntwdtbgm8Et/To/2swoWeBHZwOjWKzTZ0HxreYL3v
 m9Bg==
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGxhbmRpbmcgb2YgdGhlIGk5MTUgQ1ZFIGZpeGVzIGludG8gTGludXMgdHJlZSBoYXMgY3Jl
YXRlZCBhIGJpdCBvZgphIG1lc3MgaW4gbGludXgtbmV4dCBhbmQgZG93bnN0cmVhbSBpbiBkcm0t
bmV4dCB0cmVlcy4KCkkgdGFsa2VkIHRvIERhbmllbCBhbmQgaGUgaGFkIHRhbGtlZCB0byBKb29u
YXMgYSBiaXQsIGFuZCBJIGRlY2lkZWQgdG8KZ28gd2l0aCB3aGF0IERhbmllbCBkZXNjcmliZXMg
YXMgdGhlIFlPTE8gbWVyZ2UsIHdoZXJlIEkganVzdCBzb2x2ZSBpdAphbmQgcHJheSwgYW5kIGV2
ZXJ5b25lIGVsc2UgdmVyaWZpZXMvZml4ZXMgaXQuCgpJbiBteSBmYXZvdXIgSSd2ZSBiZWVuIHJl
YWRpbmcgdGhlc2UgcGF0Y2hlcyBmb3IgYSBjb3VwbGUgb2YgbW9udGhzCm5vdyBhbmQgYXBwbGll
ZCB0aGVtIHRvIGEgbG90IG9mIHBsYWNlcywgc28gSSdtIHF1aXRlIGZhbWlsaWFyIHdpdGgKd2hh
dCB0aGV5IGFyZSBkb2luZy4KClRoZSB3b3JzdCBjdWxwcml0IHdhcyB0aGUgUkM2IGN0eCBjb3Jy
dXB0aW9uIGZpeCBzaW5jZSB0aGUgd2hvbGUgb2YKcmM2IGdvdCByZWZhY3RvcmVkIGluIG5leHQu
IEhvd2V2ZXIgSSBhbHNvIGhhZCBhY2Nlc3MgdG8gYSB2ZXJzaW9uIG9mCnRoaXMgcGF0Y2ggSm9u
IHdyb3RlIG9uIGRybS10aXAgYSBjb3VwbGUgb2Ygd2Vla3MgYWdvLgoKSSB0b29rIHRoYXQgcGF0
Y2gsIGFwcGxpZWQgaXQgYW5kIGZpeGVkIGl0IHVwIG9uIHRvcCBvZiBkcm0tbmV4dC4gVGhlbgpJ
IGJhY2ttZXJnZWQgdGhlIGNvbW1pdCB0aGF0IGFsc28gd2VudCBpbnRvIExpbnVzJyB0cmVlLiBU
aGVuIEkKcmVtb3ZlZCBhbnkgZXZpZGVuY2Ugb2YgdGhlIFJDNiBwYXRjaCBmcm9tIExpbnVzJyB0
cmVlIGFuZCBsZWZ0IHRoZQpuZXdlciB2ZXJzaW9uIHBpZWNlcyBpbiBwbGFjZS4gVGhlIG90aGVy
IHN0dWZmIG1vc3RseSBtZXJnZWQgZmluZSBhbmQKdGhlIHJlc3VsdHMgbG9va2VkIGZpbmUsIGJ1
dCBJJ2QgZGVmaW5pdGVseSB0aGluayBldmVyeW9uZSBhdCBJbnRlbApzaG91bGQgYmUgc3Rhcmlu
ZyBhdCBpdCwgYW5kIG15IGRpbnEgdGlwIHJlc29sdXRpb25zIEFTQVAgYW5kCmhvcGVmdWxseSBp
dCBnb2VzIGludG8gQ0kgYW5kIGNvbWVzIG91dCBzbWVsbGluZyBvZiBzb21ldGhpbmcgZ29vZC4K
CkxldCBtZSBrbm93IGlmIGl0J3MgYWxsIGhvcnJpYmxlIGFzYXAsClRoYW5rcywKRGF2ZS4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
