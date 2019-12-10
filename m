Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C17D1182CD
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5416E870;
	Tue, 10 Dec 2019 08:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C720D6E870
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:51:18 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d139so697493wmd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 00:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=2OStWiZ8mR/ZrbDoNbmkGBDlxNc16VgMrjrIx0/2wQ0=;
 b=AO6Z+SWE/wvktK+t5nl2eh8WclDR+xWSngx/QrzYjqLJER/L50nJAcGGJR4+Cj96yY
 wiO8rRU3JRYY2Ru+FHvRQscPNsk0j2BPCB0CcAjnoHu0+cSVts8aw4eKSW8Z8s8qBx6J
 ZTPPdgdPqkV4CEUfxMtT549C6Is7PdPrnSuHIglFlo2aZBK7KBlEmASJXczdr/NIlFvV
 +5KP5XWTCFrA/YyHfdaDtyddRxyFU1DBQmo/zo4JOknFQYos7bWoQFPROnfwBXv4mHeQ
 +912ddeZT55/L4itwCNWVpMW8pWeG++M1Kgz3pKZAcS7fNK4di4vqyAywZNVGjUAEC5T
 4WMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=2OStWiZ8mR/ZrbDoNbmkGBDlxNc16VgMrjrIx0/2wQ0=;
 b=bIyJzZOy+n8gDURrMNUZucb8vbBmkHEU3OuldUkVSbnlABTs1uK+VGu3kjfroETyNT
 SeLtZPEOKyJjbabu8xAlAhBEdCOdf6hRpxKu3Jp5+mj6boHR2c8y2rZcm6vO3atkbnyG
 ZARSmVVgGE6dRiGhaPOul3oFBSZHM5cx9D9wsiwJEDT3UOIUHwWhLO7iMKkcpQzT7Df3
 Dlu9xIrGfDKE7unM9V9wt/v+Vir84mU7quPLHUXI7sPnLqMftSR3eaLoV+RDASwNWXGn
 Ii0p3VvGUyQ3HH71BczLjo5R0+Kb07iqVGfaymaXrwn6VdQ7+pbM4nHpxxGj5qToGeex
 sbjQ==
X-Gm-Message-State: APjAAAWjeSjcXjDR2LDrH81jzdomiC9dGFVtqFlMYYuo4VuVMSJfOFKu
 yZNQ0/k2fkd2zSFX8DYhmVbvvw==
X-Google-Smtp-Source: APXvYqymznI8bXpwxJJKQCCpWC4oVPhj0hEsP762lFzOO7HarA6IWezEh7ZXOL05OBPRL642lpSf1g==
X-Received: by 2002:a05:600c:2383:: with SMTP id
 m3mr4012089wma.32.1575967877437; 
 Tue, 10 Dec 2019 00:51:17 -0800 (PST)
Received: from dell (h185-20-99-176.host.redstation.co.uk. [185.20.99.176])
 by smtp.gmail.com with ESMTPSA id h8sm2585037wrx.63.2019.12.10.00.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 00:51:16 -0800 (PST)
Date: Tue, 10 Dec 2019 08:51:11 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/3] mfd: intel_soc_pmic: Rename pwm_backlight pwm-lookup
 to pwm_pmic_backlight
Message-ID: <20191210085111.GQ3468@dell>
References: <20191119151818.67531-1-hdegoede@redhat.com>
 <20191119151818.67531-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191119151818.67531-3-hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxOSBOb3YgMjAxOSwgSGFucyBkZSBHb2VkZSB3cm90ZToKCj4gQXQgbGVhc3QgQmF5
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
bGx5IHBvaW50cyB0byB0aGUgcmlnaHQgY29udHJvbGxlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBI
YW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9p
bnRlbF9zb2NfcG1pY19jb3JlLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKRm9yIG15IG93biByZWZlcmVuY2U6CiAgQWNrZWQtZm9yLU1G
RC1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCi0tIApMZWUgSm9uZXMgW+ad
jueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9w
ZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8
IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
