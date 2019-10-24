Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE01E31F2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 14:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A9E6E32D;
	Thu, 24 Oct 2019 12:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708166E32D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 12:12:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s1so17041238wro.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 05:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=fc53k7B5F6NLESUV742hYt2msCMxd7JzKfAjx90Oa0A=;
 b=EhW74m86BrA/9OxqWDHqhhvQ6moUl//8dQBLyRhzUHj8DjF2tPhdEReJ5zwIU6QZqR
 fypX0ccUmi2pGNz/fJsDthaEoMJlV+A8O2wyRsOAYDiq1z3nggoVIoRIUJHh32GHkwZD
 ozQZN37b1iiBB8JEbLsEJ3Cxkk8JbydsD2BR0Lx41q8axjb5CaWDTEGMRdDeu/a2divf
 UPK2oXYE9NICtMeSDyuVgo9BrA/dF0pON4iX49S5u1EjYTuoH7Kh/N2bek5/ibuJywnt
 n0jAvkYIbOlbdm0v6DREQzvCKVceKj1JvngLMevJ8AYuhs22j9osanalGkw+S0Jo60B/
 1bZw==
X-Gm-Message-State: APjAAAXB9ZRMIPrms4tCXQpO/hIIzSiL+a4ZjQL2bOMMeqOYFlou2WOH
 WWA6+JSm2ZMKFl6ZWGhzrZQi/GmHosc=
X-Google-Smtp-Source: APXvYqyInOM2B8sEpcOlgWCcHvh8/lrRHJhKiTZfomB/Eaa8D0QdEDVAJw76ekONB1Yy6OlI8NMz0w==
X-Received: by 2002:adf:fe81:: with SMTP id l1mr3468437wrr.165.1571919158048; 
 Thu, 24 Oct 2019 05:12:38 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id h17sm3521290wme.6.2019.10.24.05.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 05:12:37 -0700 (PDT)
Date: Thu, 24 Oct 2019 14:12:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [Outreachy][PATCH] drm/mediatek: remove cast to pointers passed
 to kfree
Message-ID: <20191024121235.GC11828@phenom.ffwll.local>
Mail-Followup-To: Wambui Karuga <wambui.karugax@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie
References: <20191023111107.9972-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023111107.9972-1-wambui.karugax@gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=fc53k7B5F6NLESUV742hYt2msCMxd7JzKfAjx90Oa0A=;
 b=DjwKgdzIp56RgNcD65/nmLFKaNV7MqWG0ZJMX0u8Sh/CqLeGAPEsZKygrx9XDDwz0v
 9BlKYvuRacw322e0u4tDq3lT6nmgdzgBNktPjnTyfvxIyjoutcLqGnFfQMWd8eaHbE2z
 jxkLCbNetvnHJ7Ein19DIR7Hp2l7N1S5cyd3c=
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDI6MTE6MDdQTSArMDMwMCwgV2FtYnVpIEthcnVnYSB3
cm90ZToKPiBSZW1vdmUgdW5uZWNlc3NhcnkgY2FzdHMgdG8gcG9pbnRlciB0eXBlcyBwYXNzZWQg
dG8ga2ZyZWUuCj4gSXNzdWUgZGV0ZWN0ZWQgYnkgY29jY2luZWxsZToKPiBAQAo+IHR5cGUgdDE7
Cj4gZXhwcmVzc2lvbiAqZTsKPiBAQAo+IAo+IC1rZnJlZSgodDEgKillKTsKPiAra2ZyZWUoZSk7
Cj4gCj4gU2lnbmVkLW9mZi1ieTogV2FtYnVpIEthcnVnYSA8d2FtYnVpLmthcnVnYXhAZ21haWwu
Y29tPgoKQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LCB0aGFua3MgZm9yIHlvdXIgcGF0Y2guCi1E
YW5pZWwKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jIHwg
NCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5j
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMKPiBpbmRleCBjYTY3MmYx
ZDE0MGQuLmIwNGEzYzJiMTExZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9nZW0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2dlbS5jCj4gQEAgLTI3MSw3ICsyNzEsNyBAQCB2b2lkICptdGtfZHJtX2dlbV9wcmltZV92bWFw
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQo+ICAJCQkgICAgICAgcGdwcm90X3dyaXRlY29t
YmluZShQQUdFX0tFUk5FTCkpOwo+ICAKPiAgb3V0Ogo+IC0Ja2ZyZWUoKHZvaWQgKilzZ3QpOwo+
ICsJa2ZyZWUoc2d0KTsKPiAgCj4gIAlyZXR1cm4gbXRrX2dlbS0+a3ZhZGRyOwo+ICB9Cj4gQEAg
LTI4NSw1ICsyODUsNSBAQCB2b2lkIG10a19kcm1fZ2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKm9iaiwgdm9pZCAqdmFkZHIpCj4gIAo+ICAJdnVubWFwKHZhZGRyKTsKPiAg
CW10a19nZW0tPmt2YWRkciA9IDA7Cj4gLQlrZnJlZSgodm9pZCAqKW10a19nZW0tPnBhZ2VzKTsK
PiArCWtmcmVlKG10a19nZW0tPnBhZ2VzKTsKPiAgfQo+IC0tIAo+IDIuMjMuMAo+IAoKLS0gCkRh
bmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9i
bG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
