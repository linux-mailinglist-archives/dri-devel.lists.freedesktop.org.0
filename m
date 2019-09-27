Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76092C088F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 17:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939FE6EF16;
	Fri, 27 Sep 2019 15:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F326E831
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 15:27:42 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id b128so2151484ybh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 08:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=xCO5ciSSmIdXUVqoacYxpnyVZL078hnLTwI76k2DE7k=;
 b=tOh2pihPYbxMfGsoZqEA4IlCDGc59pZlUmvETjE2VOvIUw1vAQoyWN1nwTQ4I5wilQ
 mqXUiDTj+Mrjcly7oo0I3QfYH1BqVtqFEmx3FfApZdGyKJnMJ4NUlz6EnHugSOA9uap0
 QjdlZg8qjcIGfgLCbbX+P2Fjj1ai9UjCsPeqW4EeuHijsWdfvYLrh+sfXpYlJJ/BZGOc
 V5Wlya0vZqiKYOKxvNrjcWwH5fiGBjhzddw9sA5+TD6HuiZu6YqP6jTD8Ro8ZRDHcGM2
 f9NBga3EnxA1v1IlWlkcAnvuNz4JYcSw0NVKyz4iLMmMME46WdJML5Evnl4R1/AXjXs9
 2fNA==
X-Gm-Message-State: APjAAAWGX69eot6iQLtz3F69ZQuI1TFMl3G3i50uyXhTm9uLNbICr77k
 d4pt5VlpkrDhash9sPF99HK/Aw==
X-Google-Smtp-Source: APXvYqxkU8et7jLwrzFx/tRStZaD6IFTrQHtqijrmhQ0XMDpm/KwUIV+ELQYIos5zDDP46bNGkWn4A==
X-Received: by 2002:a25:5f10:: with SMTP id t16mr5955074ybb.25.1569598062040; 
 Fri, 27 Sep 2019 08:27:42 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 207sm644901ywu.106.2019.09.27.08.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 08:27:41 -0700 (PDT)
Date: Fri, 27 Sep 2019 11:27:41 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 5/6] drm/amdgpu/dm/mst: Report possible_crtcs
 incorrectly, for now
Message-ID: <20190927152741.GU218215@art_vandelay>
References: <20190926225122.31455-1-lyude@redhat.com>
 <20190926225122.31455-6-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926225122.31455-6-lyude@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=xCO5ciSSmIdXUVqoacYxpnyVZL078hnLTwI76k2DE7k=;
 b=cMG2MtToZzs3UHpI4/HPfkMWHQsMl3J0yUvt0dq90wo0nEp75aU/LhW8CZaUkAoJux
 vrO0oVe7aNc9TJr2ts+E0u31AkU85ro9bfc0Baeyx5eNn88oPZq3lNiK9cEbtKAXBERq
 iUbcOZ2DhLUYhJkDkNnZ3iREICTGVEd6NamF4yLvSlZLhS2QU4CJzd2V0+/zAHwhn067
 bSSQVZEN4GJugjJ+g9Ktr9e8jj5lTI0wDQOewqHICOYgmWh9K6EE3/FYFCYHvvx+eZuG
 717osfvhyXcCzvzXBMJAholxzGNrI/rNrFDHCQZ6C0ZbCK0GGShfAsFnUCM3uvTb/Pd/
 Tiaw==
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDY6NTE6MDdQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBUaGlzIGNvbW1pdCBpcyBzZXBlcmF0ZSBmcm9tIHRoZSBwcmV2aW91cyBvbmUgdG8gbWFr
ZSBpdCBlYXNpZXIgdG8KPiByZXZlcnQgaW4gdGhlIGZ1dHVyZS4gQmFzaWNhbGx5LCB0aGVyZSdz
IG11bHRpcGxlIHVzZXJzcGFjZSBhcHBsaWNhdGlvbnMKPiB0aGF0IGludGVycHJldCBwb3NzaWJs
ZV9jcnRjcyB2ZXJ5IHdyb25nOgo+IAo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy94
b3JnL3hzZXJ2ZXIvbWVyZ2VfcmVxdWVzdHMvMjc3Cj4gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3Jn
L0dOT01FL211dHRlci9pc3N1ZXMvNzU5Cj4gCj4gV2hpbGUgd29yayBpcyBvbmdvaW5nIHRvIGZp
eCB0aGVzZSBpc3N1ZXMgaW4gdXNlcnNwYWNlLCB3ZSBuZWVkIHRvCj4gcmVwb3J0IC0+cG9zc2li
bGVfY3J0Y3MgaW5jb3JyZWN0bHkgZm9yIG5vdyBpbiBvcmRlciB0byBhdm9pZAo+IGludHJvZHVj
aW5nIGEgcmVncmVzc2lvbiBpbiBpbiB1c2Vyc3BhY2UuIE9uY2UgdGhlc2UgaXNzdWVzIGdldCBm
aXhlZCwKPiB0aGlzIGNvbW1pdCBzaG91bGQgYmUgcmV2ZXJ0ZWQuCj4gCj4gU2lnbmVkLW9mZi1i
eTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDExICsrKysrKysrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gaW5kZXggYjQwNGYxYWU2ZGY3Li5m
ZThhYzgwMWQ3YTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMKPiBAQCAtNDgwNyw2ICs0ODA3LDE3IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X2RtX2NydGNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sCj4g
IAlpZiAoIWFjcnRjLT5tc3RfZW5jb2RlcikKPiAgCQlnb3RvIGZhaWw7Cj4gIAo+ICsJLyoKPiAr
CSAqIEZJWE1FOiBUaGlzIGlzIGEgaGFjayB0byB3b3JrYXJvdW5kIHRoZSBmb2xsb3dpbmcgaXNz
dWVzOgo+ICsJICoKPiArCSAqIGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9tdXR0ZXIv
aXNzdWVzLzc1OQo+ICsJICogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3hvcmcveHNl
cnZlci9tZXJnZV9yZXF1ZXN0cy8yNzcKPiArCSAqCj4gKwkgKiBPbmUgdGhlc2UgaXNzdWVzIGFy
ZSBjbG9zZWQsIHRoaXMgc2hvdWxkIGJlIHJlbW92ZWQKCkV2ZW4gd2hlbiB0aGVzZSBpc3N1ZXMg
YXJlIGNsb3NlZCwgd2UnbGwgc3RpbGwgYmUgaW50cm9kdWNpbmcgYSByZWdyZXNzaW9uIGlmIHdl
CnJldmVydCB0aGlzIGNoYW5nZS4gVGltZSBmb3IgYWN0dWFsbHlfcG9zc2libGVfY3J0Y3M/IDop
CgpZb3UgYWxzbyBtaWdodCB3YW50IHRvIGJyaWVmbHkgZXhwbGFpbiB0aGUgdS9zIGJ1ZyBpbiBj
YXNlIHRoZSBsaW5rcyBnbyBzb3VyLgoKPiArCSAqLwo+ICsJYWNydGMtPm1zdF9lbmNvZGVyLT5i
YXNlLnBvc3NpYmxlX2NydGNzID0KPiArCQlhbWRncHVfZG1fZ2V0X2VuY29kZXJfY3J0Y19tYXNr
KGRtLT5hZGV2KTsKCldoeSBkb24ndCB3ZSBwdXQgdGhpcyBoYWNrIGluIGFtZGdwdV9kbV9kcF9j
cmVhdGVfZmFrZV9tc3RfZW5jb2RlcigpPwoKU2VhbgoKPiArCj4gIAlyZXR1cm4gMDsKPiAgCj4g
IGZhaWw6Cj4gLS0gCj4gMi4yMS4wCj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVl
ciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
