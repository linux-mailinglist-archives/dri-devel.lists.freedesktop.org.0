Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29396165DD6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 13:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978D36ED75;
	Thu, 20 Feb 2020 12:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3776ED71;
 Thu, 20 Feb 2020 12:48:29 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id 73so1506671uac.6;
 Thu, 20 Feb 2020 04:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v+YfUmjm0rRy2NDyPsLEzuhKAGEV0AjX6YKssyACe9c=;
 b=W55WhTSfZOhdAAYakJSrRWddwAzjM8FLlyanWSJvS8cYoiA7mMlxMvNXfuJ/Szj833
 NmlmApKybyED66Qi1dX5o2qRxy4CJBTmB0P2uYdhbE8gAQVhKKHbzUw2lQZkRdvWJW8k
 ZO0Yj8QCcu1G4SYknwHbH4l+seWMH+zuQMXoKDZL1UlSIzwvm3jeDcFSG1a49DZTysEo
 xIfpQ6btbwu3WO5QBLzvSOa0zJXncclbDovzOjospSYFaWi8qdrpTuxaqFCgCbDG58YZ
 nuQfROs6Ere2BgS8Xm+fMhTElySjCZAa9RLGFK3fghMxVhdh/KFRZL7/Lh4KalLwk2hQ
 qicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v+YfUmjm0rRy2NDyPsLEzuhKAGEV0AjX6YKssyACe9c=;
 b=fusSOZPyzzvfEunFVBUR+ignyAN7hoY5smaPg2I5UozAgsbZe4vJVJEFoqG4aqb69I
 5fZ86YeZR0JwPE7jpJ1oOs+zWkOeE/pNSTJ3rQOJ0arlZ/Xcfo1A8HszPg4S5wqwMxRr
 je3TdZIxRqiKMeyIJRdCjkzGF6j+1BNsZfIL1VUjs+eoOktpEKo4SaET7GwGfED5opYX
 Gy9/rd7Zqu5p/RVEAB+ZqborEHxxmpw07GDWg3VY6Oa5vYyY6Ka+9U0DeOSoZp6SkDkE
 hLGdnmANMgkS+abpPI3L6iplXn0IxlnNd0sBoD6i2CdLGyhU1fS23f44TM8S2Bj01330
 DWOg==
X-Gm-Message-State: APjAAAWQbvuAQpc229AYIVtZ7KF003sq7GHJNrBCdjLP66WNKRgOjv3P
 WQmwkHHcsVZD05RwStWPT8WKOiuRk4aPIc1atH23TQ==
X-Google-Smtp-Source: APXvYqxzW5keSaDGmiOLZG/q6yKwp1ZY9HoQFBkCgyrbDDWix9sZIkAtWPoDNZ2erqvy7rXnks7tKmMq39edRLaxRy8=
X-Received: by 2002:ab0:5bc6:: with SMTP id z6mr16939866uae.46.1582202908669; 
 Thu, 20 Feb 2020 04:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-7-ville.syrjala@linux.intel.com>
In-Reply-To: <20200219203544.31013-7-ville.syrjala@linux.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 20 Feb 2020 12:48:17 +0000
Message-ID: <CACvgo50PDBc03+J+8ePSid8D8iXHF_f94cNsAE0OAOpaoF+n+g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 06/12] drm: Shrink {width,height}_mm to u16
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBGZWIgMjAyMCBhdCAyMDozNiwgVmlsbGUgU3lyamFsYQo8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IEluc3RlYWQgb2Ygc3VwcG9ydGluZyB+MjAw
MGttIHdpZGUgZGlzcGxheWVzIGxldCdzIGxpbWl0IG91cnNlbHZlcwo+IHRvIH42NW0uIFRoYXQg
c2VlbXMgcGxlbnR5IGJpZyBlbm91Z2ggdG8gbWUuCj4KPiBFdmVuIHdpdGggRURJRF9RVUlSS19E
RVRBSUxFRF9JTl9DTSBFRElEcyBzZWVtIHRvIGJlIGxpbWl0ZWQgdG8KPiAxMCoweGZmZiB3aGlj
aCBmaXRzIGludG8gdGhlIDE2IGJpdHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2RybS9k
cm1fbW9kZXMuaCB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oIGIv
aW5jbHVkZS9kcm0vZHJtX21vZGVzLmgKPiBpbmRleCA1MmU4Y2E2MTNlNGIuLjJiYjJiMWE4NTky
YSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fbW9kZXMuaAo+ICsrKyBiL2luY2x1ZGUv
ZHJtL2RybV9tb2Rlcy5oCj4gQEAgLTMzMCw3ICszMzAsNyBAQCBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSB7Cj4gICAgICAgICAgKiBBZGRyZXNzYWJsZSBzaXplIG9mIHRoZSBvdXRwdXQgaW4gbW0s
IHByb2plY3RvcnMgc2hvdWxkIHNldCB0aGlzIHRvCj4gICAgICAgICAgKiAwLgo+ICAgICAgICAg
ICovCj4gLSAgICAgICBpbnQgd2lkdGhfbW07Cj4gKyAgICAgICB1MTYgd2lkdGhfbW07Cj4KPiAg
ICAgICAgIC8qKgo+ICAgICAgICAgICogQGhlaWdodF9tbToKPiBAQCAtMzM4LDcgKzMzOCw3IEBA
IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHsKPiAgICAgICAgICAqIEFkZHJlc3NhYmxlIHNpemUg
b2YgdGhlIG91dHB1dCBpbiBtbSwgcHJvamVjdG9ycyBzaG91bGQgc2V0IHRoaXMgdG8KPiAgICAg
ICAgICAqIDAuCj4gICAgICAgICAgKi8KPiAtICAgICAgIGludCBoZWlnaHRfbW07Cj4gKyAgICAg
ICB1MTYgaGVpZ2h0X21tOwo+CkZ3aXcgd2UgY291bGQgZG8gdGhlIHNhbWUgZm9yIHN0cnVjdCBk
cm1fZGlzcGxheV9pbmZvLCBhbHRob3VnaCB3ZQpzaG91bGQgYmUgY2FyZWZ1bGwgc2luY2UgdGhh
dCBpbmZvIHNldHMgcGFzc2VkIHRvIHVzZXJzcGFjZS4KClJlZ2FyZGxlc3MsIHRoaXMgcGF0Y2gg
aXM6ClJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29t
PgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
