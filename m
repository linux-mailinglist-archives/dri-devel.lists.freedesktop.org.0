Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F230F1A060
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 17:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FDE89DB8;
	Fri, 10 May 2019 15:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3651689DC5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 15:42:13 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id n17so5728996edb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 08:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=5scDEyv0R6c1gbZNSV9M8USa2K6rXIk1Dlorf7zQo/Y=;
 b=a3oJhpUMFBGoDclNolTV1PgHnF6MOTzRhQDxVEWMm54aW31NvdlvGwV8XW2VUoFtFd
 FmldCcV31rknrA7Tk50OXTl1cWF+Joc8eyqNadqr0FMzrksGG8rDaO18A/yqnmWLc87h
 RASN9ASqvCeix8TswUqswQoB4zx5sPXLOnKo3XpK/7BSPDGxgdJ3OPhcHPQeePsZis7V
 giJxrCaeZD132/vrnq/vWo+PLkfYQvz172iRHwmcQ8joSxNQMQHIwcbEs05K7JYV5xeS
 ijXz9X8MFNNVZjutbCokJ0eXExtSWFVqSNa9K+27hmIBdZH7mwKliNBIajTfYy0hQl1A
 +k1w==
X-Gm-Message-State: APjAAAWOoTNuw8RGSH1YRha7aG1n83Y9la1+Mb4z+dfx7L4ANP3Bz5HK
 +vSNWdUPekZnEfaQp4aOsVNPjQ==
X-Google-Smtp-Source: APXvYqwtjWAuJI7vSSDQqshzNMeanI9C6CdxiD8Ou2WPvPmpYLBnmD0H69j5RDSLnWul/Zw6IKqEAQ==
X-Received: by 2002:a50:9184:: with SMTP id g4mr319651eda.65.1557502931699;
 Fri, 10 May 2019 08:42:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b42sm1533362edd.83.2019.05.10.08.42.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 08:42:11 -0700 (PDT)
Date: Fri, 10 May 2019 17:42:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] Revert "vgaarb: Keep adding VGA device in queue"
Message-ID: <20190510154208.GL17751@phenom.ffwll.local>
References: <20190510142958.28017-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510142958.28017-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5scDEyv0R6c1gbZNSV9M8USa2K6rXIk1Dlorf7zQo/Y=;
 b=fxPosACWv6mGUhJu7/KE3YAM60yVY1nP7a8+Rh5NSaGK208loHwgpK7ShyH3GyON+s
 439eTIB8Ajkv9cBUfkXMri35fOXcCdOQ7C4xTLSsEVcOH05OXABBesAlPjMs41Z0WVeF
 7R94EVATWA/Qee0HaUgQ7lGIIh/4pJz3yHgQ4=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Aaron Ma <aaron.ma@canonical.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDk6Mjk6NThBTSAtMDUwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IFRoaXMgYnJlYWtzIG11bHRpcGxlIGdyYXBoaWNzIGNhcmRzIGluIHRoZSBBbWlnYW9u
ZSB4NTAwMAo+IG9uIFBQQy4KPiAKPiBUaGlzIHJldmVydHMgY29tbWl0IDNkNDJmMWRkYzQ3YTY5
YzBjZTE1NWY5ZjMwZDc2NGM0ZDY4OWE1ZmEuCj4gCj4gQnVnOiBodHRwczovL2J1Z3MuZnJlZWRl
c2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDkzNDUKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ0M6IEFhcm9uIE1hIDxhYXJvbi5t
YUBjYW5vbmljYWwuY29tPgoKR2l2ZW4gdGhhdCB0aGUgYnVnIGlzIGEgYml0IGEgbWVzcyBJIHRo
aW5rIHdlIG5lZWQgdG8gYWRkIGEgYml0IG1vcmUKY29udGV4dCBoZXJlIGluIHRoZSBjb21taXQg
bWVzc2FnZS4gTXkgdW5kZXJzdGFuZGluZzoKCkdvYWwgb2YgdGhlIHJldmVydCBjb21taXQgd2Fz
IHRvIG1ha2UgdGhlIGludGVncmF0ZWQgYm9vdCBkZXZpY2UgdGhlCnByaW1hcnkgb25lLCBpZiB3
ZSBjYW4ndCBkZXRlY3Qgd2hpY2ggb25lIGlzIHRoZSBib290IGRldmljZSwgaW5zdGVhZCBvZgp0
aGUgbGFzdCBvbmUuIFdoaWNoIG1ha2VzIHNvbWUgc2Vuc2UuCgpOb3cgcGVvcGxlIGhhdmUgcmVs
aWVkIG9uIHRoZSBrZXJuZWwgcGlja2luZyB0aGUgbGFzdCBvbmUsIHdoaWNoIHVzdWFsbHkKaXMg
YW4gYWRkLW9uIGNhcmQsIGFuZCB0aGVyZWZvcmUgc2ltcGx5IHBsdWdnaW5nIGluIGFuIGFkZC1v
biBjYXJkIGFsbG93cwp0aGVtIHRvIG92ZXJ3cml0ZSB0aGUgZGVmYXVsdCBjaG9pY2UuIFdoaWNo
IGFsc28gbWFrZXMgc2Vuc2UsIGFuZCBzaW5jZQppdCdzIHRoZSBvbGRlciBiZWhhdmlvdXIsIHdp
bnMuCgpJIHRoaW5rIGl0J2QgYmUgZ29vZCB0byBhZGQgYSBjb21tZW50IGhlcmUgdGhhdCB0aGlz
IGJlaGF2aW91ciBoYXMgYmVjb21lCnVhcGksIGUuZy4KCgkvKiBBZGQgYXQgdGhlIGZyb250IHNv
IHRoYXQgd2UgcGljayB0aGUgbGFzdCBkZXZpY2UgYXMgZmFsbGJhY2sKCSAqIGRlZmF1bHQsIHdp
dGggdGhlIHVzdWFsIHJlc3VsdCB0aGF0IHBsdWcgaW4gY2FyZHMgYXJlIHByZWZlcnJlZAoJICog
b3ZlciBpbnRlZ3JhdGVkIGdyYXBoaWNzLiAqLwoKV2l0aCB0aGF0IChvciBzaW1pbGFyKSBhbmQg
bW9yZSBjb21taXQgbWVzc2FnZSBjb250ZXh0OgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS92Z2EvdmdhYXJi
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS92Z2EvdmdhYXJiLmMgYi9kcml2ZXJzL2dw
dS92Z2EvdmdhYXJiLmMKPiBpbmRleCBmMmYzZWY4YWYyNzEuLjhhM2M0NTIxOWEyYSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS92Z2EvdmdhYXJiLmMKPiArKysgYi9kcml2ZXJzL2dwdS92Z2Ev
dmdhYXJiLmMKPiBAQCAtNzI1LDcgKzcyNSw3IEBAIHN0YXRpYyBib29sIHZnYV9hcmJpdGVyX2Fk
ZF9wY2lfZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+ICAJdmdhX2FyYml0ZXJfY2hlY2tf
YnJpZGdlX3NoYXJpbmcodmdhZGV2KTsKPiAgCj4gIAkvKiBBZGQgdG8gdGhlIGxpc3QgKi8KPiAt
CWxpc3RfYWRkX3RhaWwoJnZnYWRldi0+bGlzdCwgJnZnYV9saXN0KTsKPiArCWxpc3RfYWRkKCZ2
Z2FkZXYtPmxpc3QsICZ2Z2FfbGlzdCk7Cj4gIAl2Z2FfY291bnQrKzsKPiAgCXZnYWFyYl9pbmZv
KCZwZGV2LT5kZXYsICJWR0EgZGV2aWNlIGFkZGVkOiBkZWNvZGVzPSVzLG93bnM9JXMsbG9ja3M9
JXNcbiIsCj4gIAkJdmdhX2lvc3RhdGVfdG9fc3RyKHZnYWRldi0+ZGVjb2RlcyksCj4gLS0gCj4g
Mi4yMC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9y
YXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
