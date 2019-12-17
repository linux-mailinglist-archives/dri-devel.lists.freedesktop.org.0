Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B471F122630
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 09:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECE46E953;
	Tue, 17 Dec 2019 08:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5255F6E954
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 08:04:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j42so6000848wrj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 00:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=59PF/ZoN9PEcljCEfUWq9+2UpqXkI9QJ+WueONJK6vg=;
 b=Js7XkOnqL9mLWXj3Nk1n1z5yiMCUI42W3kT7m2TV5ccCJafOLUBX7CaDR94q2Q+2kU
 wfx2sx5P//G5vMjX6AcOY+L4J1x1l1krGBmLSXWfzp+YbbNePKa73TfPlIVcFQQ8+T/L
 4U0f5EeL/pz8Ho4W2qpaFrF9vQCDgEpKgim/sa6gDxXykJnZxNjHCIGZqjeS30F6+ooO
 I7j7QagAMFjk1RRmCevKKkghR7K1LDon8Ey2npBUAmYCIJGwc05ySrr0OQMcIEggkibP
 KlPulkn7fUh/6WOffxLYx4vwSqOoxxT/poi9eC3OBqAg6umDF4HYj/YgCcpbed927f99
 Ng+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=59PF/ZoN9PEcljCEfUWq9+2UpqXkI9QJ+WueONJK6vg=;
 b=r7rNcpPPsKPMf0EEny2uIGdvlA/1y4idRlmgdmlT6a10N8VCYWd9jzg+YkwaB6Jc17
 EHjciuYeD/kGFsHln8v5xjhKXOwDc3iZUQ2cIuMTZ/rLRIA0VP3wfqP4M4YE6MvLuZDZ
 oll0UZ/tox7NgZv/FTcO+2v6cpxbXH8KfczEMPXZjyOb5HQvYfUGn2Ix52grogAj9e/Z
 zuLr6dIPujPBVoqGCACRtBvwJPFd7VpumTMXeM+t5ENgDhjnOvpNKZfCiFVskbiPopuU
 m0cwP2TDNhjLsQphEKohj3leCx+WqF3O2nGfq5m3QPEaURCniFOcoWHJhBmXdQwE4pH5
 rBiQ==
X-Gm-Message-State: APjAAAVym0OMMN0B7+gTUj3srwnFSlnKeESv6EAGn7rcFXshF2MRbIKW
 k4+n6xpZ8thpiJ+FEpNQeCEqBA==
X-Google-Smtp-Source: APXvYqwunMIpx5LEAro6KhRVI7eLYj5KSjPuseOp44wZBm5HKeXEInlffqYba0rAmNxtSbK1uge9hw==
X-Received: by 2002:a5d:6349:: with SMTP id b9mr36828219wrw.346.1576569862856; 
 Tue, 17 Dec 2019 00:04:22 -0800 (PST)
Received: from dell (h185-20-99-142.host.redstation.co.uk. [185.20.99.142])
 by smtp.gmail.com with ESMTPSA id g25sm2358999wmh.3.2019.12.17.00.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 00:04:22 -0800 (PST)
Date: Tue, 17 Dec 2019 08:04:22 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [CI 2/3] mfd: intel_soc_pmic: Rename pwm_backlight pwm-lookup to
 pwm_pmic_backlight
Message-ID: <20191217080422.GG18955@dell>
References: <20191216202906.1662893-1-hdegoede@redhat.com>
 <20191216202906.1662893-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216202906.1662893-3-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxNiBEZWMgMjAxOSwgSGFucyBkZSBHb2VkZSB3cm90ZToKCj4gQXQgbGVhc3QgQmF5
IFRyYWlsIChCWVQpIGFuZCBDaGVycnkgVHJhaWwgKENIVCkgZGV2aWNlcyBjYW4gdXNlIDEgb2Yg
Mgo+IGRpZmZlcmVudCBQV00gY29udHJvbGxlcnMgZm9yIGNvbnRyb2xsaW5nIHRoZSBMQ0QncyBi
YWNrbGlnaHQgYnJpZ2h0bmVzcy4KPiAKPiBFaXRoZXIgdGhlIG9uZSBpbnRlZ3JhdGVkIGludG8g
dGhlIFBNSUMgb3IgdGhlIG9uZSBpbnRlZ3JhdGVkIGludG8gdGhlCj4gU29DICh0aGUgMXN0IExQ
U1MgUFdNIGNvbnRyb2xsZXIpLgo+IAo+IFNvIGZhciBpbiB0aGUgTFBTUyBjb2RlIG9uIEJZVCB3
ZSBoYXZlIHNraXBwZWQgcmVnaXN0ZXJpbmcgdGhlIExQU1MgUFdNCj4gY29udHJvbGxlciAicHdt
X2JhY2tsaWdodCIgbG9va3VwIGVudHJ5IHdoZW4gYSBDcnlzdGFsIENvdmUgUE1JQyBpcwo+IHBy
ZXNlbnQsIGFzc3VtaW5nIHRoYXQgaW4gdGhpcyBjYXNlIHRoZSBQTUlDIFBXTSBjb250cm9sbGVy
IHdpbGwgYmUgdXNlZC4KPiAKPiBPbiBDSFQgd2UgaGF2ZSBiZWVuIHJlbHlpbmcgb24gb25seSAx
IG9mIHRoZSAyIFBXTSBjb250cm9sbGVycyBiZWluZwo+IGVuYWJsZWQgaW4gdGhlIERTRFQgYXQg
dGhlIHNhbWUgdGltZTsgYW5kIGFsd2F5cyByZWdpc3RlcmVkIHRoZSBsb29rdXAuCj4gCj4gU28g
ZmFyIHRoaXMgaGFzIGJlZW4gd29ya2luZywgYnV0IHRoZSBjb3JyZWN0IHdheSB0byBkZXRlcm1p
bmUgd2hpY2ggUFdNCj4gY29udHJvbGxlciBuZWVkcyB0byBiZSB1c2VkIGlzIGJ5IGNoZWNraW5n
IGEgYml0IGluIHRoZSBWQlQgdGFibGUgYW5kCj4gcmVjZW50bHkgSSd2ZSBsZWFybmVkIGFib3V0
IDIgZGlmZmVyZW50IEJZVCBkZXZpY2VzOgo+IFBvaW50IG9mIFZpZXcgTU9CSUkgVEFCLVA4MDBX
Cj4gQWNlciBTd2l0Y2ggMTAgU1c1LTAxMgo+IAo+IFdoaWNoIHVzZSBhIENyeXN0YWwgQ292ZSBQ
TUlDLCB5ZXQgdGhlIExDRCBpcyBjb25uZWN0ZWQgdG8gdGhlIFNvQy9MUFNTCj4gUFdNIGNvbnRy
b2xsZXIgKGFuZCB0aGUgVkJUIGNvcnJlY3RseSBpbmRpY2F0ZXMgdGhpcyksIHNvIGhlcmUgb3Vy
IG9sZAo+IGhldXJpc3RpY3MgZmFpbC4KPiAKPiBTaW5jZSBvbmx5IHRoZSBpOTE1IGRyaXZlciBo
YXMgYWNjZXNzIHRvIHRoZSBWQlQsIHRoaXMgY29tbWl0IHJlbmFtZXMKPiB0aGUgInB3bV9iYWNr
bGlnaHQiIGxvb2t1cCBlbnRyaWVzIGZvciB0aGUgQ3J5c3RhbCBDb3ZlIFBNSUMncyBQV00KPiBj
b250cm9sbGVyIHRvICJwd21fcG1pY19iYWNrbGlnaHQiIHNvIHRoYXQgdGhlIGk5MTUgZHJpdmVy
IGNhbiBkbyBhCj4gcHdtX2dldCgpIGZvciB0aGUgcmlnaHQgY29udHJvbGxlciBkZXBlbmRpbmcg
b24gdGhlIFZCVCBiaXQsIGluc3RlYWQgb2YKPiB0aGUgaTkxNSBkcml2ZXIgcmVseWluZyBvbiBh
ICJwd21fYmFja2xpZ2h0IiBsb29rdXAgZ2V0dGluZyByZWdpc3RlcmVkCj4gd2hpY2ggbWFnaWNh
bGx5IHBvaW50cyB0byB0aGUgcmlnaHQgY29udHJvbGxlci4KPiAKPiBBY2tlZC1ieTogSmFuaSBO
aWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hl
bmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
SGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZmQv
aW50ZWxfc29jX3BtaWNfY29yZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCkFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5p
Y2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0Nz
CkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
