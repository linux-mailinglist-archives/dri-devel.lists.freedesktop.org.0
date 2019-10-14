Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC9DD5DF3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 10:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E4989DA8;
	Mon, 14 Oct 2019 08:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE55189DA8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 08:56:09 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id j8so2430383eds.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 01:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=9F9gOYnMz1+3hKjqRaXRapzlcu7Wa8gomJLsrlXQKa0=;
 b=nTAt7YivI902QXMCT8kagFe+Iz7QiiB3RUh/TZ4hIjhqw90d0u0ZH9NEhQYj0rJvBf
 MgNGKpywxQdoRGBJdL8liJySlEUXmKxbR6RhLVk4RuKLWQpyN5ih9SgLwcXgosQAscf6
 tIVoOe4xBdkFkqXzfQU9kYpDhPE/y+N09N4MideDC7VlKAJBO+hgcOOzEKEMlWX3ks1a
 Az7zLqrGrT0TgYTG1/XsH83YZxSqwOLq6ERTyZIazC16PevrIQfQStcN4DjJjYRzemCs
 jMy3U04JlPsnqOt68Q4J6wGoUKSYwgPZqB5vPLEGDB9zeCPylBvHvr7jk3XDF8FwFEqM
 y4SA==
X-Gm-Message-State: APjAAAWDTvwV/7P1YPZpAiEu5yojyDC0147EtgZcMiVVgzLmUMkvL5Ef
 YF7JE9frwuBpGpoZCONPb7g1yQ==
X-Google-Smtp-Source: APXvYqz+qN5kR4Hx6/KSVeypn+Z7ntkOnMDY9b5LAjIyvJNHuU8TmhPdlZMFr08lxA2iT3clRfPgFg==
X-Received: by 2002:a17:906:5388:: with SMTP id
 g8mr27299623ejo.278.1571043368485; 
 Mon, 14 Oct 2019 01:56:08 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id v22sm3077031edm.89.2019.10.14.01.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 01:56:07 -0700 (PDT)
Date: Mon, 14 Oct 2019 10:56:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Message-ID: <20191014085605.GF11828@phenom.ffwll.local>
Mail-Followup-To: "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, 
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Brian Starkey <Brian.Starkey@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>, nd <nd@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "Oscar Zhang (Arm Technology China)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
 "Channing Chen (Arm Technology China)" <Channing.Chen@arm.com>,
 "Yiqi Kang (Arm Technology China)" <Yiqi.Kang@arm.com>,
 "Thomas Sun (Arm Technology China)" <thomas.Sun@arm.com>,
 "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
References: <20191011054240.17782-1-james.qian.wang@arm.com>
 <20191011054240.17782-2-james.qian.wang@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011054240.17782-2-james.qian.wang@arm.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=9F9gOYnMz1+3hKjqRaXRapzlcu7Wa8gomJLsrlXQKa0=;
 b=H3fsufQY+jqDLcAODQvS6dik5keKPPlV2l5p8CI7y+FRxa4pGXYxJjncbozWnJXz6G
 ceDsHxGT9HNEGu4vcQsYHfkpiTXCYlvrJL4wrEsl2Ov72zkFDOjo+IJt5uyvUQusaUds
 9xbzdg1w3vJK3LNLxoAHppF0MzZm0Od1SGiEU=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDU6NDM6MDlBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gQWRkIGEgbmV3IGhlbHBlciBmdW5jdGlv
biBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKCkgZm9yIGRyaXZlciB0bwo+IGNvbnZlcnQg
UzMxLjMyIHNpZ24tbWFnbml0dWRlIHRvIFFtLm4gMidzIGNvbXBsZW1lbnQgdGhhdCBzdXBwb3J0
ZWQgYnkKPiBoYXJkd2FyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBqYW1lcyBxaWFuIHdhbmcgKEFy
bSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIHwgMjMgKysrKysrKysrKysrKysrKysrKysr
KysKPiAgaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaCAgICAgfCAgMiArKwo+ICAyIGZpbGVz
IGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYwo+
IGluZGV4IDRjZTVjNmQ4ZGU5OS4uM2Q1MzNkMGI0NWFmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xv
cl9tZ210LmMKPiBAQCAtMTMyLDYgKzEzMiwyOSBAQCB1aW50MzJfdCBkcm1fY29sb3JfbHV0X2V4
dHJhY3QodWludDMyX3QgdXNlcl9pbnB1dCwgdWludDMyX3QgYml0X3ByZWNpc2lvbikKPiAgfQo+
ICBFWFBPUlRfU1lNQk9MKGRybV9jb2xvcl9sdXRfZXh0cmFjdCk7Cj4gIAo+ICsvKioKPiArICog
ZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbgo+ICsgKgo+ICsgKiBAdXNlcl9pbnB1dDogaW5w
dXQgdmFsdWUKPiArICogQG06IG51bWJlciBvZiBpbnRlZ2VyIGJpdHMKPiArICogQG46IG51bWJl
ciBvZiBmcmFjdGluYWwgYml0cwo+ICsgKgo+ICsgKiBDb252ZXJ0IGFuZCBjbGFtcCBTMzEuMzIg
c2lnbi1tYWduaXR1ZGUgdG8gUW0ubiAyJ3MgY29tcGxlbWVudC4KCldoYXQncyB0aGUgUSBtZWFu
aW5nIGhlcmU/IEFsc28gbWF5YmUgc3BlY2lmeSB0aGF0IHRoZSBoaWdoZXIgYml0cyBhYm92ZQpt
K24gYXJlIGNsZWFyZWQgdG8gYWxsIDAgb3IgYWxsIDEuIFVuaXQgdGVzdCB3b3VsZCBiZSBsb3Zl
bHkgdG9vLiBBbnl3YXk6CgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD4KCj4gKyAqLwo+ICt1aW50NjRfdCBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19x
bV9uKHVpbnQ2NF90IHVzZXJfaW5wdXQsCj4gKwkJCQkgICAgICB1aW50MzJfdCBtLCB1aW50MzJf
dCBuKQo+ICt7Cj4gKwl1NjQgbWFnID0gKHVzZXJfaW5wdXQgJiB+QklUX1VMTCg2MykpID4+ICgz
MiAtIG4pOwo+ICsJYm9vbCBuZWdhdGl2ZSA9ICEhKHVzZXJfaW5wdXQgJiBCSVRfVUxMKDYzKSk7
Cj4gKwlzNjQgdmFsOwo+ICsKPiArCS8qIHRoZSByYW5nZSBvZiBzaWduZWQgMnMgY29tcGxlbWVu
dCBpcyBbLTJebittLCAyXm4rbSAtIDFdICovCj4gKwl2YWwgPSBjbGFtcF92YWwobWFnLCAwLCBu
ZWdhdGl2ZSA/IEJJVChuICsgbSkgOiBCSVQobiArIG0pIC0gMSk7Cj4gKwo+ICsJcmV0dXJuIG5l
Z2F0aXZlID8gMGxsIC0gdmFsIDogdmFsOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woZHJtX2NvbG9y
X2N0bV9zMzFfMzJfdG9fcW1fbik7Cj4gKwo+ICAvKioKPiAgICogZHJtX2NydGNfZW5hYmxlX2Nv
bG9yX21nbXQgLSBlbmFibGUgY29sb3IgbWFuYWdlbWVudCBwcm9wZXJ0aWVzCj4gICAqIEBjcnRj
OiBEUk0gQ1JUQwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oIGIv
aW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaAo+IGluZGV4IGQxYzY2MmQ5MmFiNy4uNjBmZWE1
NTAxODg2IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKPiArKysg
Yi9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oCj4gQEAgLTMwLDYgKzMwLDggQEAgc3RydWN0
IGRybV9jcnRjOwo+ICBzdHJ1Y3QgZHJtX3BsYW5lOwo+ICAKPiAgdWludDMyX3QgZHJtX2NvbG9y
X2x1dF9leHRyYWN0KHVpbnQzMl90IHVzZXJfaW5wdXQsIHVpbnQzMl90IGJpdF9wcmVjaXNpb24p
Owo+ICt1aW50NjRfdCBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKHVpbnQ2NF90IHVzZXJf
aW5wdXQsCj4gKwkJCQkgICAgICB1aW50MzJfdCBtLCB1aW50MzJfdCBuKTsKPiAgCj4gIHZvaWQg
ZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICAJCQkJ
dWludCBkZWdhbW1hX2x1dF9zaXplLAo+IC0tIAo+IDIuMjAuMQo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
