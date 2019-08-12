Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC4A8E69E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740B56E8E8;
	Thu, 15 Aug 2019 08:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31D76E4A6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 06:59:18 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t14so47486807plr.11
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 23:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lU9sd0t6+gG5Nv5bhUpF/5WxDNzHrTOFuSzTVXXmTl8=;
 b=iwCprUrPbi7sEJZMDeGnjKmEMDzc+hMAbKfjHl2AS3RF205T4SJA1U/jwKUqcJfhcG
 bw2gxS6EfxbcXNKJV8GJCMrKNDQ8a+JykWE/mhQp8vSre7Qn4emlWN+WHGDrB/XgY1bF
 3ZqQF9FnuTWI3all+O4OFCfdVlHY4mHpXoTUv2K7hWQIFOP+zMSRIhmA5IHIJTpeEzpo
 t2zqBAJIU3T9AT4fK0m2TThyaymoA6r8qP6q9HhQp0eB5/YACsOdhA4ZZUod2mzotxlo
 R6Wg60rbkAbDGYtUjx+jAEbJr1M24RcHi47h9IMaS2ob/BaIdHu2iiF/wybHSx+fFReS
 RMJQ==
X-Gm-Message-State: APjAAAW2W/ZmkkceyMd0doGZ1LhhIZMgLceNk2r7/ixGfSxVusVKPAKd
 5p4mH2pNSYuJIfsWYJkj+yU=
X-Google-Smtp-Source: APXvYqxGQtAAm/9bZEb20DwM5smEC6IAD75c2e4mNLcMD5COWxsN4uscMrkfBX+siT1jauyZejyO5g==
X-Received: by 2002:a17:902:b68f:: with SMTP id
 c15mr31825302pls.104.1565593158123; 
 Sun, 11 Aug 2019 23:59:18 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id n7sm118800185pff.59.2019.08.11.23.59.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 11 Aug 2019 23:59:17 -0700 (PDT)
Date: Sun, 11 Aug 2019 23:59:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 03/10] input: keyboard: gpio_keys: convert platform
 driver to use dev_groups
Message-ID: <20190812065915.GU178933@dtor-ws>
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
 <20190731124349.4474-4-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731124349.4474-4-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lU9sd0t6+gG5Nv5bhUpF/5WxDNzHrTOFuSzTVXXmTl8=;
 b=YnvbXjUbXlQSkK3LpUAdhLpq46NSDWVuR665Ubu/270IW/4xBes43HY9xnyHv12M5L
 +Wx7wmzdJBh+uBRFuUUZm3XjZ2HNz24aSt2C0tnHJ3N0X5qZnLPwkFIGhzROicOathdX
 buPEuoqJdWYQUpDgQdVJAka7kd+5dOR64ba7JlpNiaaeGrvYnELpkHY1tEFeTbyWXdGo
 iEnvuWvOT+Jc/xCSbJMmHGTLyahNWiHXdg/Cdp2GY2REf+QoIJ+2/MfttFp4T7wNohjV
 Cgd5yZ4jZY1J4fHlp9NmGN1KS4pbrmsT/ParzL7gyOuhc+Vs880CYybK1BjIyTaP6bAl
 lLWw==
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
Cc: linux-fbdev@vger.kernel.org, Richard Gong <richard.gong@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDI6NDM6NDJQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IFBsYXRmb3JtIGRyaXZlcnMgbm93IGhhdmUgdGhlIG9wdGlvbiB0byBoYXZl
IHRoZSBwbGF0Zm9ybSBjb3JlIGNyZWF0ZQo+IGFuZCByZW1vdmUgYW55IG5lZWRlZCBzeXNmcyBh
dHRyaWJ1dGUgZmlsZXMuICBTbyB0YWtlIGFkdmFudGFnZSBvZiB0aGF0Cj4gYW5kIGRvIG5vdCBy
ZWdpc3RlciAiYnkgaGFuZCIgYSBidW5jaCBvZiBzeXNmcyBmaWxlcy4KPiAKPiBDYzogQmFydGxv
bWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgo+IENjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVs
Lm9yZwo+IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc+CgpBcHBsaWVkLCB0aGFuayB5b3UuCgo+IC0tLQo+ICBkcml2ZXJzL2lucHV0
L2tleWJvYXJkL2dwaW9fa2V5cy5jIHwgMTMgKystLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pbnB1dC9rZXlib2FyZC9ncGlvX2tleXMuYyBiL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQv
Z3Bpb19rZXlzLmMKPiBpbmRleCAwM2Y0ZDE1MmY2YjcuLjEzNzNkYzViMDc2NSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2dwaW9fa2V5cy5jCj4gKysrIGIvZHJpdmVycy9p
bnB1dC9rZXlib2FyZC9ncGlvX2tleXMuYwo+IEBAIC0zNTEsMTAgKzM1MSw3IEBAIHN0YXRpYyBz
dHJ1Y3QgYXR0cmlidXRlICpncGlvX2tleXNfYXR0cnNbXSA9IHsKPiAgCSZkZXZfYXR0cl9kaXNh
YmxlZF9zd2l0Y2hlcy5hdHRyLAo+ICAJTlVMTCwKPiAgfTsKPiAtCj4gLXN0YXRpYyBjb25zdCBz
dHJ1Y3QgYXR0cmlidXRlX2dyb3VwIGdwaW9fa2V5c19hdHRyX2dyb3VwID0gewo+IC0JLmF0dHJz
ID0gZ3Bpb19rZXlzX2F0dHJzLAo+IC19Owo+ICtBVFRSSUJVVEVfR1JPVVBTKGdwaW9fa2V5cyk7
Cj4gIAo+ICBzdGF0aWMgdm9pZCBncGlvX2tleXNfZ3Bpb19yZXBvcnRfZXZlbnQoc3RydWN0IGdw
aW9fYnV0dG9uX2RhdGEgKmJkYXRhKQo+ICB7Cj4gQEAgLTg1MSwxMyArODQ4LDYgQEAgc3RhdGlj
IGludCBncGlvX2tleXNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCj4g
IAlmd25vZGVfaGFuZGxlX3B1dChjaGlsZCk7Cj4gIAo+IC0JZXJyb3IgPSBkZXZtX2RldmljZV9h
ZGRfZ3JvdXAoZGV2LCAmZ3Bpb19rZXlzX2F0dHJfZ3JvdXApOwo+IC0JaWYgKGVycm9yKSB7Cj4g
LQkJZGV2X2VycihkZXYsICJVbmFibGUgdG8gZXhwb3J0IGtleXMvc3dpdGNoZXMsIGVycm9yOiAl
ZFxuIiwKPiAtCQkJZXJyb3IpOwo+IC0JCXJldHVybiBlcnJvcjsKPiAtCX0KPiAtCj4gIAllcnJv
ciA9IGlucHV0X3JlZ2lzdGVyX2RldmljZShpbnB1dCk7Cj4gIAlpZiAoZXJyb3IpIHsKPiAgCQlk
ZXZfZXJyKGRldiwgIlVuYWJsZSB0byByZWdpc3RlciBpbnB1dCBkZXZpY2UsIGVycm9yOiAlZFxu
IiwKPiBAQCAtMTAyNiw2ICsxMDE2LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
Z3Bpb19rZXlzX2RldmljZV9kcml2ZXIgPSB7Cj4gIAkJLm5hbWUJPSAiZ3Bpby1rZXlzIiwKPiAg
CQkucG0JPSAmZ3Bpb19rZXlzX3BtX29wcywKPiAgCQkub2ZfbWF0Y2hfdGFibGUgPSBncGlvX2tl
eXNfb2ZfbWF0Y2gsCj4gKwkJLmRldl9ncm91cHMJPSBncGlvX2tleXNfZ3JvdXBzLAo+ICAJfQo+
ICB9Owo+ICAKPiAtLSAKPiAyLjIyLjAKPiAKCi0tIApEbWl0cnkKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
