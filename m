Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D4E6D105
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 17:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56436E3EF;
	Thu, 18 Jul 2019 15:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7588A6E3EF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 15:23:52 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d79so20729760qke.11
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 08:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=WNiVs/zOlaxMgnUWU86FyaftSbm6ryQPjqyll3zSd7Q=;
 b=cqZtc1eL8fOl5vHaKq2IhYKs4kDS6/Y/98WEDZ0O+UClSyoD/MK6Js49/Wm+8H4XCv
 JMuQFV2meCYomWAf+HwBmdhheaLZrrJrgyHtt19BsoKbfG9KB0Js8edMwK5YhtjVRfGH
 HCUuMJJRH5uGghknjdgWXAgGo31hMyzsTNUe2jW25zDE+FTiqrfGMIotRPmwNr8Ttqz7
 fQNKkDuLg8dbIApi3m5+YvNk9quWNyZptYHRSSr8DtkYE62kI0TiFtC45cHq8zrp/peY
 AP0RLwwv5G66Kh3N9/ySY0Po9IRnYGcj1Qn7057R4lwqvB+Wk0n7OyGuTSNuWJWAxkub
 PuYw==
X-Gm-Message-State: APjAAAXyMcpMH1vTxAp1rEI60DGEZ0wbPH7u8+16wAa+JcdDRKdvucgT
 kbY227md1ljux2d/rw3WTELNhw==
X-Google-Smtp-Source: APXvYqw3bbMMThZJQ3Zq+6BKVLoqpi23GsXIPv2dGahb9QdwCD00hd6jKX1mCTp164RNhZSg0IVhCg==
X-Received: by 2002:a37:8d04:: with SMTP id p4mr31358574qkd.113.1563463431641; 
 Thu, 18 Jul 2019 08:23:51 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id r40sm15914278qtk.2.2019.07.18.08.23.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 08:23:51 -0700 (PDT)
Date: Thu, 18 Jul 2019 11:23:50 -0400
From: Sean Paul <sean@poorly.run>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] drm/komeda: Adds error event print functionality
Message-ID: <20190718152350.GC31819@art_vandelay>
References: <1561604994-26925-1-git-send-email-lowry.li@arm.com>
 <20190718131737.GD5942@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718131737.GD5942@e110455-lin.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=WNiVs/zOlaxMgnUWU86FyaftSbm6ryQPjqyll3zSd7Q=;
 b=aNeIpJVdfnDhyIUT2LAXagP7hoA7Rh25uvo/HHVFsCpBrjupsYt4NhQaL0dOF93ewa
 oP+HJmgYhPLpUCdx/O/PMX/j1h1kw4h1IZwvvAiSCnN0mVd6SRT6JzlwXWTKGWoKVKZz
 na0PYmDkNh2V2hGj9NTYQytJvXcrkF2O44nFHXgdxiLRknegEEjcX7lX5C1UNHb11NTe
 9lWPynxuTVev8aJFEVI9VwuYxIz9b3OMKabpt/RXNsdbbfHRxMSIqV4DRVgjKjMGdQ4a
 CsSmwEcoj1j7qyWN2m093ietZTMi7X/hw3uBIgAcC+na0VUCiSiFlACmANmGt+tsklM0
 WDMA==
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDI6MTc6MzdQTSArMDEwMCwgTGl2aXUgRHVkYXUgd3Jv
dGU6Cj4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDQ6MTA6MzZBTSArMDEwMCwgTG93cnkgTGkg
KEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKCi9zbmlwCgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiA+IGluZGV4IDY0N2JjZTUu
LjE0NjJiYWMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9rbXMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfa21zLmMKPiA+IEBAIC00Nyw2ICs0Nyw4IEBAIHN0YXRpYyBpcnFyZXR1cm5f
dCBrb21lZGFfa21zX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEpCj4gPiAgCW1lbXNl
dCgmZXZ0cywgMCwgc2l6ZW9mKGV2dHMpKTsKPiA+ICAJc3RhdHVzID0gbWRldi0+ZnVuY3MtPmly
cV9oYW5kbGVyKG1kZXYsICZldnRzKTsKPiA+ICAKPiA+ICsJa29tZWRhX3ByaW50X2V2ZW50cygm
ZXZ0cyk7Cj4gCj4gQ2FsbGluZyB0aGlzIGZ1bmN0aW9uIGZyb20gdGhlIElSUSBoYW5kbGVyIGlz
IGEgYmFkIGlkZWEuIFdlIHNob3VsZCB1c2UgZGVidWdmcwo+IGlmIHlvdSByZWFsbHkgd2FudCB0
byBoYXZlIGEgdHJhY2Ugb2YgdGhlIGV2ZW50cywgYnV0IEkgcGVyc29uYWxseSBkb24ndCBzZWUK
PiB2YWx1ZSBpbiBoYXZpbmcgdGhpcyBmdW5jdGlvbmFsaXR5IGluIHRoZSBrZXJuZWwgYXQgYWxs
LiBZb3UgY2FuIGV4cG9zZSB0aGUKPiB2YWx1ZSBvZiB0aGUgZXZ0cy0+Z2xvYmFsIGFuZCBldnRz
LT5waXBlc1tdIGFzIGludGVnZXJzIGFuZCBkZWNvZGUgdGhhdCBpbgo+IHVzZXJzcGFjZSBvciBh
cyBhIGRlYnVnZnMgZW50cnkuCgpBbHRlcm5hdGl2ZWx5LCBjb25zaWRlciB1c2luZyBrZXJuZWwg
dHJhY2UgZXZlbnRzLiBUaGV5IGFsbG93IHlvdSB0byBzZWxlY3RpdmVseQp0dXJuIG9uL29mZiBj
ZXJ0YWluIGV2ZW50cyBhbmQgYWxzbyBhbGxvdyB5b3UgdG8gY3VzdG9taXplIHdoaWNoIGRhdGEg
aXMKcmVjb3JkZWQgYW5kIGhvdyBpdCdzIGZvcm1hdHRlZC4gU2VlbXMgbGlrZSBhIGdvb2QgZml0
IGZyb20gdGhlIHF1aWNrIHNjYW4gSSd2ZQpkb25lLgoKU2VhbgoKPiAKPiBCZXN0IHJlZ2FyZHMs
Cj4gTGl2aXUKPiAKPiA+ICsKPiA+ICAJLyogTm90aWZ5IHRoZSBjcnRjIHRvIGhhbmRsZSB0aGUg
ZXZlbnRzICovCj4gPiAgCWZvciAoaSA9IDA7IGkgPCBrbXMtPm5fY3J0Y3M7IGkrKykKPiA+ICAJ
CWtvbWVkYV9jcnRjX2hhbmRsZV9ldmVudCgma21zLT5jcnRjc1tpXSwgJmV2dHMpOwo+ID4gLS0g
Cj4gPiAxLjkuMQo+ID4gCj4gCj4gLS0gCj4gPT09PT09PT09PT09PT09PT09PT0KPiB8IEkgd291
bGQgbGlrZSB0byB8Cj4gfCBmaXggdGhlIHdvcmxkLCAgfAo+IHwgYnV0IHRoZXkncmUgbm90IHwK
PiB8IGdpdmluZyBtZSB0aGUgICB8Cj4gIFwgc291cmNlIGNvZGUhICAvCj4gICAtLS0tLS0tLS0t
LS0tLS0KPiAgICAgwq9cXyjjg4QpXy/CrwoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5l
ZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
