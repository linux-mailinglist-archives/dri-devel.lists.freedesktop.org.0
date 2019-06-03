Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D13DC32A85
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 10:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802EE8910D;
	Mon,  3 Jun 2019 08:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1F0891A1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 08:12:23 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a8so25685669edx.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 01:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=bu9fRbADjbhdG6PJSniK0Rbfljbuyue27FG/YXYJsvM=;
 b=pRjFJn+gEnbmjebTtek6NbAK1qcSSA9f3WnXOHgrqL5W4WRNWW+58p/1HAvr2pweeF
 rmCa5x6hpgTYgPUOSDwMwNLBRkyHRXi5RbBMcYErcY8BUzFRpqxixy3LXMv6AofBEYis
 byuTTt14OwDGIhfzB/YL4FzmhA529D8q3wpDZhPGWOgZZrv3EgQ29cAPm3lgMbtEDt6h
 51e12ZZ9efjRqOEbULru2dJySuFUj8u9e5qFZ4bfzzOBfbO/DlMzeRxsJFsWJyFKiLcM
 /pnRaAzX47ZEzHlY6BbJfoCXhLKKvXoXqQIvh19EzIP/n+jqzYzpTnEXXcyWApXdvAsq
 8Ziw==
X-Gm-Message-State: APjAAAWCry5kCGJTmG5bgwcwgd9jBvddMEUEfK68vm1O5T3Ca7v5ubD9
 YcFPBtshmduEDzki1LPRmY19jQ==
X-Google-Smtp-Source: APXvYqyDRotTft0hHy2QDseBjAcP4nWYAwQQR/Jn1kend0tZc4YPtMxvLB1ApLXQ9yIkgC0FuM7Mow==
X-Received: by 2002:a05:6402:1851:: with SMTP id
 v17mr11605756edy.3.1559549542392; 
 Mon, 03 Jun 2019 01:12:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id j23sm1782397edq.95.2019.06.03.01.12.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 01:12:21 -0700 (PDT)
Date: Mon, 3 Jun 2019 10:12:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH 1/4] drm: Drop a redundant unused variable
Message-ID: <20190603081219.GH21222@phenom.ffwll.local>
References: <1559159944-21103-1-git-send-email-uma.shankar@intel.com>
 <1559159944-21103-2-git-send-email-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559159944-21103-2-git-send-email-uma.shankar@intel.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bu9fRbADjbhdG6PJSniK0Rbfljbuyue27FG/YXYJsvM=;
 b=Lm2Wf3JuF6NfS/fnrkDE762BWOISW1SFcGOlogs/Am0n1CVZgHGu8DX6rkbWhofRO9
 1dARl4gtwCnf7rHjMJ9YmSMgm1/1Qa5FYRsIJyqDJvgQBW/cETaCspGnDtsLhfGnXwQG
 0VhotYY2U0wNhyCBbmFQJFm4Tdc6C6qo1aZaU=
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
Cc: dcastagna@chromium.org, jonas@kwiboo.se, intel-gfx@lists.freedesktop.org,
 emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDE6Mjk6MDFBTSArMDUzMCwgVW1hIFNoYW5rYXIgd3Jv
dGU6Cj4gRHJvcCBhIHJlZHVuZGFudCBhbmQgdW51c2VkIHZhcmlhYmxlICJoZHJfb3V0cHV0X21l
dGFkYXRhIiBmcm9tCj4gZHJtX2Nvbm5lY3Rvci4KPiAKPiBTdWdnZXN0ZWQtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBTaWduZWQtb2ZmLWJ5OiBVbWEgU2hhbmthciA8dW1h
LnNoYW5rYXJAaW50ZWwuY29tPgoKRm9yIG5leHQgdGltZSBhcm91bmQ6IFBsZWFzZSBhZGQgRml4
ZXM6IGxpbmVzIHRvIGluZGljYXRlIHdoaWNoIGFscmVhZHkKbWVyZ2VkIGNvbW1pdCB5b3UncmUg
aW1wcm92aW5nLgoKUGF0Y2ggbWVyZ2VkLCB0aGFua3MuCi1EYW5pZWwKCj4gLS0tCj4gIGluY2x1
ZGUvZHJtL2RybV9jb25uZWN0b3IuaCB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IGluZGV4IGY4ZjQwMDMuLjU0NzY1NjEgMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCj4gKysrIGIvaW5jbHVkZS9kcm0v
ZHJtX2Nvbm5lY3Rvci5oCj4gQEAgLTEyNDQsOCArMTI0NCw2IEBAIHN0cnVjdCBkcm1fY29ubmVj
dG9yIHsKPiAgCSAqLwo+ICAJc3RydWN0IGxsaXN0X25vZGUgZnJlZV9ub2RlOwo+ICAKPiAtCS8q
IEhEUiBtZXRkYXRhICovCj4gLQlzdHJ1Y3QgaGRyX291dHB1dF9tZXRhZGF0YSBoZHJfb3V0cHV0
X21ldGFkYXRhOwo+ICAJc3RydWN0IGhkcl9zaW5rX21ldGFkYXRhIGhkcl9zaW5rX21ldGFkYXRh
Owo+ICB9Owo+ICAKPiAtLSAKPiAxLjkuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUg
RW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
