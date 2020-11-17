Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3911D2B6BB6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 18:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8712489C8D;
	Tue, 17 Nov 2020 17:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF1689C8D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 17:29:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u12so16781824wrt.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 09:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=FROWGsH7Dx97guc9ujjqMeX/SzGuLi2yD3mmQjMN8Gw=;
 b=lWa4MH/4y1JT4uoM08zKk7JftI+U9CDGGyz8OX0rRi7T9zDzoCGKTrzRaczE+OYdQa
 xKZdr7i8MeRzbLh11SQGZW9DhRFzHG5NVFURHUeXdHU0hOAwyNLKfMCYjVguTYCzFlAQ
 aqYwXcl8u/X+GL+3j2W6ylnIHZEjk5+dstyRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=FROWGsH7Dx97guc9ujjqMeX/SzGuLi2yD3mmQjMN8Gw=;
 b=p9+DRhpA9PaNSP9ItDhELDDSQJ+jpQ2V82wUtbfoC904QI76aQG9XS/t1zAn/BSkRj
 ZWPeVl/fyclxTAQYg2SJrhI6Eo7yly5ChpjBwcSKI97TBEAG8limvwOJlQIL5K7/VhP+
 s6PN1cjG20zuJgZtMJn8VHwEfrM7lSlnnTkAv26BGUHlNotLqda1efMYNpG3xDlev7Gk
 JhjajU+ipO8V0hrJra+agpvMXhCPzJ0T7XpaT6TbJkmbmemABmmR0vhyMQ/i+V//khRp
 NVLKKZHl7Pp24STc7eGI0T1Hoag3v3p17ZYvfpzv9Mp0LDwPcGFf6wN5jmSPpvvkeKje
 UFTg==
X-Gm-Message-State: AOAM533rSHQFCMUy5p4smc8BNN9Sab2rHHXjirzO0aCFUeev4l0fx46Z
 LlFpMjSgsoqyN0qIYQT8cRWFcQ==
X-Google-Smtp-Source: ABdhPJx+BnHbl/cFR2hypORia53biB2S0AX0CRMhWkYyVQSS1zuJpDkCMnVSXjw1JIT88MC4cefjtg==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr567492wrv.299.1605634167815;
 Tue, 17 Nov 2020 09:29:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u23sm4816488wmc.32.2020.11.17.09.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:29:26 -0800 (PST)
Date: Tue, 17 Nov 2020 18:29:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 03/42] drm/drm_dp_mst_topology: Remove set but never used
 variable 'len'
Message-ID: <20201117172925.GN401619@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-4-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116174112.1833368-4-lee.jones@linaro.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMDU6NDA6MzNQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jOiBJbiBmdW5jdGlvbiDigJhk
cm1fZHBfc2VuZF9xdWVyeV9zdHJlYW1fZW5jX3N0YXR1c+KAmToKPiAgZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYzozMjYzOjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGxlbuKA
mSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+IAo+IENjOiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENj
OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ2M6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+CgpHb2luZyB0byBhcHBseSB0aGlzLCBidXQgSSBub3RpY2VkIHRo
YXQgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGUKYnVpbGRfcXVlcnlfc3RyZWFtX2VuY19zdGF0dXMo
KSBpcyBwb2ludGxlc3MuIENhbiB5b3UgcGxzIGZvbGxvdyB1cCB3aXRoCmFuIGFkZGl0aW9uYWwg
cGF0Y2ggdG8gY2hhbmdlIHRoYXQgdG8gdm9pZD8KClRoYW5rcywgRGFuaWVsCgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgNCArKy0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCj4gaW5kZXggZTg3NTQyNTMzNjQwNi4uMDQwMWIyZjQ3NTAw
MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC0zMjYwLDcg
KzMyNjAsNyBAQCBpbnQgZHJtX2RwX3NlbmRfcXVlcnlfc3RyZWFtX2VuY19zdGF0dXMoc3RydWN0
IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCj4gIHsKPiAgCXN0cnVjdCBkcm1fZHBfc2lk
ZWJhbmRfbXNnX3R4ICp0eG1zZzsKPiAgCXU4IG5vbmNlWzddOwo+IC0JaW50IGxlbiwgcmV0Owo+
ICsJaW50IHJldDsKPiAgCj4gIAl0eG1zZyA9IGt6YWxsb2Moc2l6ZW9mKCp0eG1zZyksIEdGUF9L
RVJORUwpOwo+ICAJaWYgKCF0eG1zZykKPiBAQCAtMzI4MSw3ICszMjgxLDcgQEAgaW50IGRybV9k
cF9zZW5kX3F1ZXJ5X3N0cmVhbV9lbmNfc3RhdHVzKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5
X21nciAqbWdyLAo+ICAJICovCj4gIAl0eG1zZy0+ZHN0ID0gbWdyLT5tc3RfcHJpbWFyeTsKPiAg
Cj4gLQlsZW4gPSBidWlsZF9xdWVyeV9zdHJlYW1fZW5jX3N0YXR1cyh0eG1zZywgcG9ydC0+dmNw
aS52Y3BpLCBub25jZSk7Cj4gKwlidWlsZF9xdWVyeV9zdHJlYW1fZW5jX3N0YXR1cyh0eG1zZywg
cG9ydC0+dmNwaS52Y3BpLCBub25jZSk7Cj4gIAo+ICAJZHJtX2RwX3F1ZXVlX2Rvd25fdHgobWdy
LCB0eG1zZyk7Cj4gIAo+IC0tIAo+IDIuMjUuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
