Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED528DB99
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B826E79A;
	Wed, 14 Aug 2019 17:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF0B6E79A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:26:39 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id z51so23128927edz.13
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=pXC5/OEihtE+FUVRETHVdjT4BXzBpIfug/HOmRZcRu4=;
 b=GP6uUxFohhbwpzokmWeF1udAo9Yvk8+B0OPn+FLGSfqT5s6+2ZWMPrzoNmSnrUs9k6
 Zs36cWxQuAjzHJLarLZtl+QKCjjpEMgHn4YGE6VvCNlvvaHp4nYiPTWNwD8GIa3lGb15
 DCNgsovhzfD1lHxxWNZ30B9SC19f+eFKbCWLeMnmoHfwbzUVxjdI88eQNp70QtmPaPdt
 Y3YurqoaCGaPZE6fg+ebhde3rDYqOfUvI1Ak26idMh+LXCyAzXFTMXKMqKrdQGtEG2SK
 fcUKloSXz/QNaOxtA/yyRIcjIqZL2y6XvTLxGRM0eCazWVPHZh0WQfpZIInxuZtmfXBW
 HH2g==
X-Gm-Message-State: APjAAAUOKzyObtAWjbl4jxuGIzo1AlPx9Qrt5aqTSeejGyVBRNAWutU7
 NhhFlhMlcF0r6PwUTWQYJGtq/g==
X-Google-Smtp-Source: APXvYqw2PiKxyrraKFWvxjXXc3J0J30ES6r8S8EKfgdKpPuCPYENTuVS5y9/MWBZJyp+Z4DlbgMcPQ==
X-Received: by 2002:a50:f4c1:: with SMTP id v1mr799404edm.282.1565803597599;
 Wed, 14 Aug 2019 10:26:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id w35sm73768edd.32.2019.08.14.10.26.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 10:26:36 -0700 (PDT)
Date: Wed, 14 Aug 2019 19:26:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] drm/vboxvideo: Make structure vbox_fb_helper_funcs
 constant
Message-ID: <20190814172634.GP7444@phenom.ffwll.local>
References: <20190813062548.24770-1-nishkadg.linux@gmail.com>
 <687f24b1-c3c5-c9d6-9abb-3c84ae009715@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <687f24b1-c3c5-c9d6-9abb-3c84ae009715@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pXC5/OEihtE+FUVRETHVdjT4BXzBpIfug/HOmRZcRu4=;
 b=WtOh5og8I769ArhtC7BbkXrMuwBrHZrcEyoZumjCdinYHXXITms0oCj0y3HhFX3BPc
 JY9wGsvnFmLddMpLdJFmkZ8bWbnknYu+u5oQf+51H1IX7vecFmNE6O9DIJvXBip1Uqff
 QpqBbNDmDGuccFaCWSBbrpAQcnTm3QNiVXkX0=
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDk6NTc6MTlBTSArMDIwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBIaSwKPiAKPiBPbiAxMy0wOC0xOSAwODoyNSwgTmlzaGthIERhc2d1cHRhIHdyb3Rl
Ogo+ID4gVGhlIHN0YXRpYyBzdHJ1Y3R1cmUgdmJveF9mYl9oZWxwZXJfZnVuY3MsIG9mIHR5cGUg
ZHJtX2ZiX2hlbHBlcl9mdW5jcywKPiA+IGlzIHVzZWQgb25seSB3aGVuIGl0IGlzIHBhc3NlZCBh
cyB0aGUgdGhpcmQgYXJndW1lbnQgdG8KPiA+IGRybV9mYl9oZWxwZXJfZmJkZXZfc2V0dXAoKSwg
d2hpY2ggZG9lcyBub3QgbW9kaWZ5IGl0LiBIZW5jZSBtYWtlIGl0Cj4gPiBjb25zdGFudCB0byBw
cm90ZWN0IGl0IGZyb20gdW5pbnRlbmRlZCBtb2RpZmljYXRpb25zLgo+ID4gSXNzdWUgZm91bmQg
d2l0aCBDb2NjaW5lbGxlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBOaXNoa2EgRGFzZ3VwdGEg
PG5pc2hrYWRnLmxpbnV4QGdtYWlsLmNvbT4KPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCwg
dGhpcyBsb29rcyBnb29kIHRvIG1lOgo+IAo+IFJldmlld2VkLWJ5OiBIYW5zIGRlIEdvZWRlIDxo
ZGVnb2VkZUByZWRoYXQuY29tPgoKSSdtIGFzc3VtaW5nIHlvdSdsbCBhcHBseSB0aGlzIHRvIGRy
bS1taXNjLW5leHQgdG9vPyBHb29kIHRvIHN0YXRlIHRoYXQsCnRvIGF2b2lkIGNvbmZ1c2lvbiBh
bmQgY29vcmRpbmF0aW9uIGlzc3Vlcy4KLURhbmllbAoKPiAKPiBSZWdhcmRzLAo+IAo+IEhhbnMK
PiAKPiAKPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMg
fCAyICstCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X2Rydi5jCj4gPiBpbmRleCAwMjUz
N2FiOWNjMDguLjJiNTdlYTMxOTVmMiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92
Ym94dmlkZW8vdmJveF9kcnYuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92
Ym94X2Rydi5jCj4gPiBAQCAtMzIsNyArMzIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9k
ZXZpY2VfaWQgcGNpaWRsaXN0W10gPSB7Cj4gPiAgIH07Cj4gPiAgIE1PRFVMRV9ERVZJQ0VfVEFC
TEUocGNpLCBwY2lpZGxpc3QpOwo+ID4gLXN0YXRpYyBzdHJ1Y3QgZHJtX2ZiX2hlbHBlcl9mdW5j
cyB2Ym94X2ZiX2hlbHBlcl9mdW5jcyA9IHsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9m
Yl9oZWxwZXJfZnVuY3MgdmJveF9mYl9oZWxwZXJfZnVuY3MgPSB7Cj4gPiAgIAkuZmJfcHJvYmUg
PSB2Ym94ZmJfY3JlYXRlLAo+ID4gICB9Owo+ID4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
