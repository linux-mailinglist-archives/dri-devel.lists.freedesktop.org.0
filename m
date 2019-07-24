Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2925A72E1B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 13:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8196E4B5;
	Wed, 24 Jul 2019 11:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27A46E528
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:48:55 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id m10so46839661edv.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 04:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=PRLil33NxiuRwPhkz9AGD9OCbasbz/uYVDN8aHKwtfw=;
 b=tKmqO5Wf+khA1PT2cBxZNQ4PNjzZbKhnz2byzkoLprDUjEuaUOKi3BMAXwNPVwQO7l
 wy/jzTMsUwXSDxvuxZntGGa1B7PJi07scXE47ZqL8HH+7CBhI9WcHXpi2/lqM5ILoKFr
 gDQBv0He8I9ZQ38wuVQQqN129q7qlhdZMa42Z37sTFqnYm49mkS0L3QaI6JPamO+eWGq
 EQJYu+iDc914SrYv6QPYTyhnpzFN1zFQi0/9VZU4J5H0N2brPwwGOjc0JAxjcvfiC3Lg
 fESMWe/uwddOqaFbi2HBcX6LVoY7x1W7CHSpHajtCQv48WuzTeEKyNfrAdyF6Owl7c2G
 65rw==
X-Gm-Message-State: APjAAAVLSNI3IktJLJBZnIyQ3UWrgKzagWhm25jIMrxnDGeLHWebgIw2
 N6thWDwY2db0i9zx6NCuvZk=
X-Google-Smtp-Source: APXvYqwce5JAuM4tpZ6erSCkFx9btOgJvWsbioaOQpFfrc0xgMrV99WzcAbXIWAgJiGOF5QtIfGfXA==
X-Received: by 2002:a50:e703:: with SMTP id a3mr71857540edn.291.1563968934452; 
 Wed, 24 Jul 2019 04:48:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id w4sm9098366eja.34.2019.07.24.04.48.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 04:48:53 -0700 (PDT)
Date: Wed, 24 Jul 2019 13:48:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: OLED panel brightness support
Message-ID: <20190724114851.GY15868@phenom.ffwll.local>
References: <28D3097A-5295-4445-BD73-1A338EFA546D@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28D3097A-5295-4445-BD73-1A338EFA546D@canonical.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=PRLil33NxiuRwPhkz9AGD9OCbasbz/uYVDN8aHKwtfw=;
 b=To6Yu5D65Ve0o+bRDUGL58NKBm/mBVPK3ci6Y+anLZl0TxJbS0/rra4LNO3KbEmw6L
 p7jRqYwdELwgDahuKoku4HwCWToC4V/spbbeKPI9QSw/HttpOa3O2ifEV/ewXQh+2RT+
 qG3k03I1RNPznK5SuAkDIlWlDwLqdSuFeanBs=
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
Cc: Anthony Wong <anthony.wong@canonical.com>, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@dell.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDY6NDY6NTVQTSArMDgwMCwgS2FpLUhlbmcgRmVuZyB3
cm90ZToKPiBIaSwKPiAKPiBDdXJyZW50bHksIE9MRUQgcGFuZWwgYnJpZ2h0bmVzcyBbMV0gaXMg
bm90IHN1cHBvcnRlZC4KPiBXZSBoYXZlIGEgc2ltaWxhciBEZWxsIHN5c3RlbSB0aGF0IGFsc28g
YWZmZWN0IGJ5IGxhY2sgb2YgT0xFRCBicmlnaHRuZXNzCj4gc3VwcG9ydC4KPiAKPiBJ4oCZdmUg
aW52ZXN0aWdhdGVkIGJvdGgga2VybmVsIGFuZCB1c2VyIHNwYWNlIGJ1dCBJIGhhdmVu4oCZdCBm
b3VuZCBhIGdvb2QKPiBnZW5lcmFsIHNvbHV0aW9uIHlldC4KPiBEZWxsIHN5c3RlbXMgdXNlIEVE
SUQgZGVzY3JpcHRvciA0IGFzIERlbGwgc3BlY2lmaWMgZGVzY3JpcHRvciwgd2hpY2gKPiByZXBv
cnRzIGl0cyBwYW5lbCB0eXBlIGFuZCB3ZSBjYW4ga25vdyBpdOKAmXMgYW4gT0xFRCBwYW5lbCBv
ciBub3QuCj4gCj4gTXkgaW5pdGlhbCB0aG91Z2h0IGlzIHRvIGFkZCBhIG5ldyBhdHRyaWJ1dGUg
4oCcb2xlZCIgaW4gZHJtX3N5c2ZzLmMgWzJdIHRvCj4gbGV0IHVzZXJzcGFjZSBsaWtlIGNsdXR0
ZXIgWzNdIHRvIGNvbnRyb2wgdGhlIGJyaWdodG5lc3MuCj4gSG93ZXZlciBvdGhlciBERXMgbWF5
IG5lZWQgdG8gaW1wbGVtZW50IHRoZWlyIG93biBPTEVEIGJyaWdodG5lc3Mgc3VwcG9ydAo+IHdo
aWNoIGlzbuKAmXQgaWRlYWwuCj4gCj4gU28gSeKAmWQgbGlrZSB0byBrbm93IGlmIHRoZXJl4oCZ
cyBhbnkgZ29vZCB3YXkgdG8gc3VwcG9ydCBPTEVEIGJyaWdodG5lc3MgaW4KPiBnb29kIG9sZCBi
YWNrbGlnaHQgc3lzZnMsIHRvIGxldCB1c2Vyc3BhY2Uga2VlcCB0byB0aGUgY3VycmVudCBpbnRl
cmZhY2UuCj4gCj4gWzFdIGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dp
P2lkPTk3ODgzCj4gWzJdIGh0dHBzOi8vcGFzdGViaW4udWJ1bnR1LmNvbS9wL1FZclJCcHBWVDkv
Cj4gWzNdIGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9jbHV0dGVyL2Jsb2IvbWFzdGVy
L2NsdXR0ZXIvY2x1dHRlci1icmlnaHRuZXNzLWNvbnRyYXN0LWVmZmVjdC5jI0w1NTkKCkkgdGhp
bmsgdGhlIE1vc3QgUHJvcGVyIFNvbHV0aW9uIHdvdWxkIGJlIHRvIGludGVncmF0ZSB0aGUgYmFj
a2xpZ2h0CnN1cHBvcnQgaW50byBkcm0sIGJ5IGFkZGluZyB0aGUgYmFja2xpZ2h0IGtub2JzIGFz
IGttcyBwcm9wZXJ0aWVzIHRvIHRoZQpjb3JyZWN0IGNvbm5lY3Rvci4gVGhpcyB3b3VsZCBmaXgg
YSB3aG9sZSBiYWcgb2YgaXNzdWU6Ci0gbm8gbW9yZSBpbGwtZGVmaW5lZCBtYWdpYyBmb3IgdXNl
cnNwYWNlIHRvIGZpbmQgdGhlIHJpZ2h0IGJhY2tsaWdodAotIHdlIGNvdWxkIGhhdmUgd2VsbC1k
ZWZpbmVkIHNlbWFudGljcyB3aGF0IGhhcHBlbnMgd2l0aCB0aGUgYmFja2xpZ2h0CiAgYWNyb3Nz
IGEga21zIG1vZGVzZXQKLSBpc3N1ZXMgbGlrZSB0aGlzIGNvdWxkIGJlIHNvbHZlZCB3aXRoIGEg
c21hbGwgaGVscGVyIGFuZCBhIGJpdCBvZiBjb2RlCiAgaW4gdGhlIGtlcm5lbCAodGhlcmUncyBh
bHNvIG90aGVyIEREQyBrbm9icyB0byBjb250cm9sIGJhY2tsaWdodCwgd2hpY2gKICB3ZSBhbHNv
IGRvbid0IHJlYWxseSBleHBvc2UgaW4gYSBjb25zaXN0ZW50IHdheSkuCgpEb3duc2lkZSBpcyBo
b3cgdG8gcm9sbCB0aGlzIG91dCBpbiBhIGJhY2t3YXJkIGNvbXBhdGlibGUgd2F5LCB3aXRob3V0
CmJyZWFraW5nIHRoZSB3b3JsZDoKLSBmYmNvbi9mYmRldiBuZWVkcyB0byBiZSB0YXVnaHQgdG8g
bm90IGRvIGl0J3Mgb3duIGJhY2tsaWdodCB3cmFuZ2xpbmcKICBmb3Iga21zIGRyaXZlcnMgd2hp
Y2ggaGFuZGxlIGJhY2tsaWdodCBuYXRpdmVseQotIHdlIG1pZ2h0IG5lZWQgYW4gb3B0LWluIG1h
Z2ljIGZvciB0aGlzLCBpZiBpdCB0dXJucyBvdXQgdGhhdCB0aGUga21zCiAgZHJpdmVyIGhhbmRs
aW5nIHRoZSBiYWNrbGlnaHQgYnJlYWtzIHN0dWZmCi0gdXNlcnNwYWNlIG9mYyBuZWVkcyB0byBm
YWxsIGJhY2sgdG8gaXRzIGN1cnJlbnQgcGlsZSBvZiBoYWNrcyBpZiB0aGUKICBiYWNrbGlnaHQg
c3R1ZmYgaXNuJ3Qgc3VwcG9ydGVkIG5hdGl2ZWx5LgoKQWRkaW5nIG1vcmUgaWxsLWRlZmluZWQg
c3lzZnMgZmlsZXMsIG9yIG1vcmUgbWFnaWNlIG9yZGVyaW5nIHJ1bGVzLCBvcgphbnl0aGluZyBl
bHNlIGxpa2UgdGhhdCBkb2Vzbid0IHNvdW5kIHRvbyBhcHBlYWxpbmcuCi1EYW5pZWwKLS0gCkRh
bmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9i
bG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
