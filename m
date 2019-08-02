Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF517FD19
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 17:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE5F6EEA5;
	Fri,  2 Aug 2019 15:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C226EEA5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 15:11:28 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e3so72692888edr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 08:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=wfiIBOS+brQ1KWbhQkuFy4c67Yaa6GXA+JN7706mnR0=;
 b=Hq5YoE2YznyzqfOhd+Sahn4+wdQ5DKX+BQKFEbxYq9D7/6+lhqYvC1xlD04KMrXTR2
 n20WQbxxk4y80SB89UPLKwuI5bJYN6HzdNDhoeJDoi3qzrL7cK+hhQ+YV3tl34AjNAaF
 9n2O0gzF031W03/o+ozb2/ZDJHOxQpHeIPq5e2okXxvv5qi4YMuFPryxEkvpakiu1ACP
 I+50nKTd4yApmfya5U5s+pQBuYjnLwu6tgfv082W9d7FjA74w1ZzSEZJN65hLfyXfwvo
 rre0CVXBbGUjJWlYjSI21bvYy4mTnu5qA8BsbTe3pUyVnQwg4mOWXraE5WPj3sMCUmux
 wGYw==
X-Gm-Message-State: APjAAAU2hzfvR7CmBwQxw5LFy708A9vuiKiuTasCHsI6QihgacznyVMN
 MJdEkZSiMaxCI9kT3lpXqTYe0YP+wJ0=
X-Google-Smtp-Source: APXvYqxrYyVdPY8z+dGGTHhFI2cVRb44HOuQEw+1X2plnHLLw0MZkLwoSAgjRQbzOvXJSx7X1XmMFQ==
X-Received: by 2002:a50:a56d:: with SMTP id z42mr18488013edb.241.1564758686891; 
 Fri, 02 Aug 2019 08:11:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id w35sm18496880edd.32.2019.08.02.08.11.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 08:11:26 -0700 (PDT)
Date: Fri, 2 Aug 2019 17:11:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Inki Dae <inki.dae@samsung.com>
Subject: Re: [GIT PULL] exynos-drm-fixes
Message-ID: <20190802151124.GR7444@phenom.ffwll.local>
References: <CGME20190802083122epcas1p298fb8295a77e3adfa839eec619318591@epcas1p2.samsung.com>
 <1564734791-745-1-git-send-email-inki.dae@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564734791-745-1-git-send-email-inki.dae@samsung.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wfiIBOS+brQ1KWbhQkuFy4c67Yaa6GXA+JN7706mnR0=;
 b=LNBcPEbfa5JcdPBN2zelrVyqVY53vR3NhCoWYWHlCv74UczB8O9Lhz3JxAYh4Zl+XX
 7165/ATqNKNV8PMFVHh/M+jczMEl497jJv76COojyBXeMVixRFcICvFkapFkYFfIY1XO
 4JEmk+GCIKHX8GJ5OqxKG9KN2klLT1xJ58DTM=
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
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDU6MzM6MTFQTSArMDkwMCwgSW5raSBEYWUgd3JvdGU6
Cj4gSGkgRGF2ZSwKPiAKPiAgICBKdXN0IHR3byBmaXh1cHMgd2hpY2ggZml4ZXMgdW5kZWZpbmVk
IHJlZmVyZW5jZSBlcnJvciB3aXRoIE5PTU1VCj4gICAgY29uZmlndXJhdGlvbiBhbmQgcG90ZW50
aWFsIGluZmluaXRlIGlzc3VlIG9mIHNjYWxlciBtb2R1bGUsCj4gICAgYW5kIHR3byB0cml2aWFs
IGNsZWFudXBzLgo+IAo+ICAgIFBsZWFzZSBraW5kbHkgbGV0IG1lIGtub3cgaWYgdGhlcmUgaXMg
YW55IHByb2JsZW0uCgpQbGVhc2UgcHJlcCAtZml4ZXMgcHVsbCByZXF1ZXN0IG9uIFRodSBsYXRl
c3QsIHNvIHRoaXMgZG9lc24ndCBlYXQgaW50bwp3L2Ugb3IgaW4gY2FzZSB0aGVyZSdzIGFuIGlz
c3VlIHRoYXQgbmVlZHMgdG8gYmUgZml4ZWQgdGhlcmUncyBqdXN0IG5vCnRpbWUgb3RoZXJ3aXNl
IHRvIG1ha2UgdGhlIG5leHQgLXJjLgoKPiAKPiBUaGFua3MsCj4gSW5raSBEYWUKPiAKPiBUaGUg
Zm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGY4OTgxZTAzMDllOTAwNGM2ZTg2ZDIxODA0
OTA0NTcwMGM3OWQ3NDA6Cj4gCj4gICBNZXJnZSB0YWcgJ21zbS1maXhlcy0yMDE5XzA4XzAxJyBv
ZiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL21zbSBpbnRvIGRybS1maXhlcyAo
MjAxOS0wOC0wMiAxMDoxNzoyNSArMTAwMCkKPiAKPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBnaXQg
cmVwb3NpdG9yeSBhdDoKPiAKPiAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9kYWVpbmtpL2RybS1leHlub3MgdGFncy9leHlub3MtZHJtLWZpeGVzLWZvci12
NS4zLXJjMwoKQXBwbGllZCwgdGhhbmtzLgotRGFuaWVsCgo+IAo+IGZvciB5b3UgdG8gZmV0Y2gg
Y2hhbmdlcyB1cCB0byAxYmJiYWIwOTdhMDUyNzZlMzEyZGQyNDYyNzkxZDMyYjIxY2ViMWVlOgo+
IAo+ICAgZHJtL2V4eW5vczogZml4IG1pc3NpbmcgZGVjcmVtZW50IG9mIHJldHJ5IGNvdW50ZXIg
KDIwMTktMDgtMDIgMTY6NTA6MTggKzA5MDApCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IC0gVHdvIGNsZWFudXAg
cGF0Y2hlcwo+ICAgLiB1c2UgZGV2X2dldF9kcnZkYXRhIGZvciByZWFkYWJpbGl0eSBpbnN0ZWFk
IG9mIHBsYXRmb3JtX2dldF9kcnZkYXRhCj4gICAuIHJlbW92ZSByZWR1bmRhbnQgYXNzaWdubWVu
dCB0byBub2RlLgo+IC0gVHdvIGZpeHVwIHBhdGNoZXMKPiAgIC4gZml4IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gJ3ZtZl9pbnNlcnRfbWl4ZWQnIHdpdGggTk9NTVUgY29uZmlndXJhdGlvbi4KPiAg
IC4gZml4IHBvdGVudGlhbCBpbmZpbml0ZSBzcGluIGlzc3VlIGJ5IGRlY3JlbWVudGluZyAncmV0
cnknIHZhcmlhYmxlIGluCj4gICAgIHNjYWxlcl9yZXNldCBmdW5jdGlvbiBvZiBleHlub3NfZHJt
X3NjYWxlci5jCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEFybmQgQmVyZ21hbm4gKDEpOgo+ICAgICAgIGRybS9l
eHlub3M6IGFkZCBDT05GSUdfTU1VIGRlcGVuZGVuY3kKPiAKPiBDb2xpbiBJYW4gS2luZyAoMik6
Cj4gICAgICAgZHJtL2V4eW5vczogcmVtb3ZlIHJlZHVuZGFudCBhc3NpZ25tZW50IHRvIHBvaW50
ZXIgJ25vZGUnCj4gICAgICAgZHJtL2V4eW5vczogZml4IG1pc3NpbmcgZGVjcmVtZW50IG9mIHJl
dHJ5IGNvdW50ZXIKPiAKPiBGdXFpYW4gSHVhbmcgKDEpOgo+ICAgICAgIGRybS9leHlub3M6IHVz
aW5nIGRldl9nZXRfZHJ2ZGF0YSBkaXJlY3RseQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L0tjb25maWcgICAgICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfZHJtX2ZpbWMuYyAgIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZzJkLmMgICAgfCAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9n
c2MuYyAgICB8IDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3NjYWxl
ci5jIHwgNCArKy0tCj4gIDUgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
