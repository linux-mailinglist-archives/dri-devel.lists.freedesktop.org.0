Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AA21CEC1
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 20:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578E489308;
	Tue, 14 May 2019 18:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B44089308
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 18:12:59 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id j1so10865562qkk.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 11:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HrkjcsngWKiOpJS10js6bvf1zdshTsN54KJhQwcMKVg=;
 b=EMP0206NsFx02VHi/Ct0dKRuTkXBkGxvba5J/IiO660k0oHkJEqHi4wTi/F6f/CINw
 yCBLPv4ViYkxvRV4VHAHcwrNu9CVzrTjhPs9DzO+inQ4I6PyRrAa43ExxX/u/SEvpoD1
 8ZREeuAy352v8VhP4DgDxMMHHozOOLemAHDLArwfZ/1twF3ahUOw/xuEIKOTOF1pbZ9/
 UuEAdkueXGJz3DS7Ow8rGZ67Mwi6nKfWy7AgQqB08DA8DLrt1VDBH8jID0N3fGayJLQP
 ApnEGKMRKJ8R8h5oIUhPXYC3ZR+fczF4C4KMjkQP1L+mpzL0X7m2QCPWrG8L4u17ycBo
 ENBg==
X-Gm-Message-State: APjAAAWcrrbtuNnAyeFkR2Anw5qgb62k9UtYhgi/3h8P72EIMOU14RlE
 SK6Ssd1QG9QLn2jXFSLeSAQ2XQ==
X-Google-Smtp-Source: APXvYqyKze9u0JIuismmXNkd+chXAfH2zyghRGa1LErYSasX1sE5+g2ouyvkDufBwjI7Z5AohXUjtQ==
X-Received: by 2002:a37:358:: with SMTP id 85mr28270475qkd.174.1557857578793; 
 Tue, 14 May 2019 11:12:58 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g55sm14028045qtk.76.2019.05.14.11.12.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 11:12:58 -0700 (PDT)
Date: Tue, 14 May 2019 14:12:57 -0400
From: Sean Paul <sean@poorly.run>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Fix low refresh rate selection
Message-ID: <20190514181257.GS17077@art_vandelay>
References: <20190424132210.26338-1-matt.redfearn@thinci.com>
 <20190511193226.GO13043@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190511193226.GO13043@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HrkjcsngWKiOpJS10js6bvf1zdshTsN54KJhQwcMKVg=;
 b=UywwujrY/ytEzSfp8rG9FXW/ApAoK75ult5EIRsYGH1clhBX7Ek9y6Tj6lWt9Xo6pK
 P8kF8427XKk1mgLR646yNWutCI9Y4T3sU62CshHLqV9b0UYbtVRph4V9DhrPDpK147Zx
 bDPZrVlvWhkkSq5ZLj8Xa8I6WWnhSNA5PiYSumt4rpj34C9M6t2h2wW+9ZLG7JMPpTL3
 48SXBH1rghW8V51fCr0a+0MEYGnRSGDasXc2GYaXoxPGkQLcMlxBlHQJlU7voH/u3aIO
 PUHIxzdBMivxsr5/Zpqw8TcH09MZDT6mzWt6LZcFAxotbq5el/9nRruGl72Nolpv4GFx
 3sqw==
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
Cc: Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Redfearn <matthew.redfearn@thinci.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Matt Redfearn <matt.redfearn@thinci.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBNYXkgMTEsIDIwMTkgYXQgMTA6MzI6MjZQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBNYXR0LAo+IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9u
IFdlZCwgQXByIDI0LCAyMDE5IGF0IDAxOjIyOjI3UE0gKzAwMDAsIE1hdHQgUmVkZmVhcm4gd3Jv
dGU6Cj4gPiBUaGUgZHJpdmVyIGN1cnJlbnRseSBzZXRzIHJlZ2lzdGVyIDB4ZmIgKExvdyBSZWZy
ZXNoIFJhdGUpIGJhc2VkIG9uIHRoZQo+ID4gdmFsdWUgb2YgbW9kZS0+dnJlZnJlc2guIEZpcnN0
bHksIHRoaXMgZmllbGQgaXMgc3BlY2lmaWVkIHRvIGJlIGluIEh6LAo+ID4gYnV0IHRoZSBtYWdp
YyBudW1iZXJzIHVzZWQgYnkgdGhlIGNvZGUgYXJlIEh6ICogMTAwMC4gVGhpcyBlc3NlbnRpYWxs
eQo+ID4gbGVhZHMgdG8gdGhlIGxvdyByZWZyZXNoIHJhdGUgYWx3YXlzIGJlaW5nIHNldCB0byAw
eDAxLCBzaW5jZSB0aGUKPiA+IHZyZWZyZXNoIHZhbHVlIHdpbGwgYWx3YXlzIGJlIGxlc3MgdGhh
biAyNDAwMC4gRml4IHRoZSBtYWdpYyBudW1iZXJzIHRvCj4gPiBiZSBpbiBIei4KPiA+IFNlY29u
ZGx5LCBhY2NvcmRpbmcgdG8gdGhlIGNvbW1lbnQgaW4gZHJtX21vZGVzLmgsIHRoZSBmaWVsZCBp
cyBub3QKPiA+IHN1cHBvc2VkIHRvIGJlIHVzZWQgaW4gYSBmdW5jdGlvbmFsIHdheSBhbnl3YXku
IEluc3RlYWQsIHVzZSB0aGUgaGVscGVyCj4gPiBmdW5jdGlvbiBkcm1fbW9kZV92cmVmcmVzaCgp
Lgo+ID4gCj4gPiBGaXhlczogOWM4YWY4ODJiZjEyICgiZHJtOiBBZGQgYWR2NzUxMSBlbmNvZGVy
IGRyaXZlciIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJlZGZlYXJuIDxtYXR0LnJlZGZlYXJu
QHRoaW5jaS5jb20+Cj4gCj4gV293LCBhIDQuNSB5ZWFyIG9sZCBidWcgZml4LCBuaWNlIDotKQo+
IAo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+Cj4gCgpBcHBsaWVkIHRvIGRybS1taXNjLW5leHQtZml4ZXMuCgpUaGFua3Mh
CgpTZWFuCgo+ID4gLS0tCj4gPiAKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEv
YWR2NzUxMV9kcnYuYyB8IDYgKysrLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
ZHY3NTExL2Fkdjc1MTFfZHJ2LmMKPiA+IGluZGV4IDg1YzJkNDA3YTUyLi5lN2RkZDNlM2RiOSAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Ry
di5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYu
Ywo+ID4gQEAgLTc0NywxMSArNzQ3LDExIEBAIHN0YXRpYyB2b2lkIGFkdjc1MTFfbW9kZV9zZXQo
c3RydWN0IGFkdjc1MTEgKmFkdjc1MTEsCj4gPiAgCQkJdnN5bmNfcG9sYXJpdHkgPSAxOwo+ID4g
IAl9Cj4gPiAgCj4gPiAtCWlmIChtb2RlLT52cmVmcmVzaCA8PSAyNDAwMCkKPiA+ICsJaWYgKGRy
bV9tb2RlX3ZyZWZyZXNoKG1vZGUpIDw9IDI0KQo+ID4gIAkJbG93X3JlZnJlc2hfcmF0ZSA9IEFE
Vjc1MTFfTE9XX1JFRlJFU0hfUkFURV8yNEhaOwo+ID4gLQllbHNlIGlmIChtb2RlLT52cmVmcmVz
aCA8PSAyNTAwMCkKPiA+ICsJZWxzZSBpZiAoZHJtX21vZGVfdnJlZnJlc2gobW9kZSkgPD0gMjUp
Cj4gPiAgCQlsb3dfcmVmcmVzaF9yYXRlID0gQURWNzUxMV9MT1dfUkVGUkVTSF9SQVRFXzI1SFo7
Cj4gPiAtCWVsc2UgaWYgKG1vZGUtPnZyZWZyZXNoIDw9IDMwMDAwKQo+ID4gKwllbHNlIGlmIChk
cm1fbW9kZV92cmVmcmVzaChtb2RlKSA8PSAzMCkKPiA+ICAJCWxvd19yZWZyZXNoX3JhdGUgPSBB
RFY3NTExX0xPV19SRUZSRVNIX1JBVEVfMzBIWjsKPiA+ICAJZWxzZQo+ID4gIAkJbG93X3JlZnJl
c2hfcmF0ZSA9IEFEVjc1MTFfTE9XX1JFRlJFU0hfUkFURV9OT05FOwo+IAo+IC0tIAo+IFJlZ2Fy
ZHMsCj4gCj4gTGF1cmVudCBQaW5jaGFydAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIs
IEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
