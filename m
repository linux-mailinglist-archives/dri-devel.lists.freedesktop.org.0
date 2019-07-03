Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A785E7AF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 17:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1022F89FE3;
	Wed,  3 Jul 2019 15:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5E389FE3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 15:21:26 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id i11so2496156edq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 08:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZILkcL1OhXDfgS8zirS2PmlWc8JEmuJOaF8y0WXK1fc=;
 b=kURVuzw0zGIDhW4F0wi4/iuucpnfnCu5o72aiHuCXuzDSKjPyLTVlijOV55heqfp4q
 tTDq/7CsL1VhelSZlxQ142hPIpDEF7Ot5UvMQKdk9KMgpy5OsIy9NtzhZp09zGwxu/Gb
 DWQiBC//3EzGI7NCH57mauufK0d0DGUuclzQE+Bwixu5cSubsSoIeU13qhUt0FQefMfd
 uURiXQVr4f605jPHg5hN+jTJW4uOCLpXUGBgCE9DgYdX08PwJgtoHY3WKeWFlAjJo5Gk
 Enma3oILgHtp46liu973QqrIKuksiRWG4fjo5XNGqAzboBKhnuUQmZWI1AIp8V880Hqp
 OWGA==
X-Gm-Message-State: APjAAAUBsBjJBndXcJTzBrrlfjCOdBgHmbEeNAg1Kk7cyQBsrRdYTxBd
 HBd9kU+KK9/wuZD8y3s8UIgfSHzfYUw=
X-Google-Smtp-Source: APXvYqzhNEFDMHLgwrpt58GWXwwhnrAfrs7t5n6ZRulWVyCqtws38C6vzJtc3IuK58t8SUG6hAf3Xw==
X-Received: by 2002:a50:f982:: with SMTP id q2mr43095231edn.270.1562167284782; 
 Wed, 03 Jul 2019 08:21:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id g2sm777755edg.81.2019.07.03.08.21.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 08:21:24 -0700 (PDT)
Date: Wed, 3 Jul 2019 17:21:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] drm/drm_debugfs_crc.c: Document that .verify_crc_source
 vfunc is required for enabling CRC support.
Message-ID: <20190703152120.GI15868@phenom.ffwll.local>
References: <20190703150330.21992-1-Liviu.Dudau@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703150330.21992-1-Liviu.Dudau@arm.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZILkcL1OhXDfgS8zirS2PmlWc8JEmuJOaF8y0WXK1fc=;
 b=e7KkelXiNxU3nFibpcdQGKtFY8Gqy0DsVdXfS5t0nMkpCvSjX2/LoJ+pGA4w5SqI9g
 qcmzExDPlxSdUjUrBloY4IWZDErDq/lVE6UhO2FtysutS58cIZA4Xwbe+sRWcd92eSCX
 zmvnxxn8xvNa3qSECFhQfakl9efzTGKOINk+w=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 DRI devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDQ6MDM6MzBQTSArMDEwMCwgTGl2aXUgRHVkYXUgd3Jv
dGU6Cj4gZHJtX2RlYnVnZnNfY3J0Y19jcmNfYWRkKCkgZnVuY3Rpb24gY2hlY2tzIHRoYXQgYm90
aCAuc2V0X2NyY19zb3VyY2UgYW5kCj4gLnZlcmlmeV9jcmNfc291cmNlIGhvb2tzIGFyZSBwcm92
aWRlZCBiZWZvcmUgZW5hYmxpbmcgZGVidWdmcyBzdXBwb3J0IGZvcgo+IHJlYWRpbmcgcGVyLWZy
YW1lIENSQyBkYXRhLiBNYWtlIHRoYXQgZXhwbGljaXQgaW4gdGhlIGRvY3VtZW50YXRpb24uCj4g
Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBTaWduZWQtb2ZmLWJ5OiBM
aXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKSSB0aGluayB3ZSBoYXZlIHNvbWUgcmVmYWN0
b3Jpbmcgcm9vbSBoZXJlIGlmIHdlIG1ha2UgdmVyaWZ5X2NyY19zb3VyY2UKb3B0aW9uYWwgKGFu
ZCBvbmx5IGFsbG93ICJhdXRvIiBmb3IgdGhhdCBjYXNlKS4gQnV0IHdvdWxkIG9ubHkgcmVtb3Zl
IGxpa2UKMy00IGltcGxlbWVudGF0aW9ucywgc28gSSBndWVzcyB0aGF0J3MgZm9yIHdoZW4gdGhl
IG5leHQgdHJpdmlhbCBvbmUgc2hvd3MKdXAuCi1EYW5pZWwKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZGVidWdmc19jcmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMu
Ywo+IGluZGV4IDdjYTQ4NmQ3NTBlOS4uNjYwNGVkMjIzMTYwIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZGVidWdmc19jcmMuYwo+IEBAIC02Niw5ICs2Niw5IEBACj4gICAqIHRoZSByZXBvcnRlZCBDUkNz
IG9mIGZyYW1lcyB0aGF0IHNob3VsZCBoYXZlIHRoZSBzYW1lIGNvbnRlbnRzLgo+ICAgKgo+ICAg
KiBPbiB0aGUgZHJpdmVyIHNpZGUgdGhlIGltcGxlbWVudGF0aW9uIGVmZm9ydCBpcyBtaW5pbWFs
LCBkcml2ZXJzIG9ubHkgbmVlZCB0bwo+IC0gKiBpbXBsZW1lbnQgJmRybV9jcnRjX2Z1bmNzLnNl
dF9jcmNfc291cmNlLiBUaGUgZGVidWdmcyBmaWxlcyBhcmUgYXV0b21hdGljYWxseQo+IC0gKiBz
ZXQgdXAgaWYgdGhhdCB2ZnVuYyBpcyBzZXQuIENSQyBzYW1wbGVzIG5lZWQgdG8gYmUgY2FwdHVy
ZWQgaW4gdGhlIGRyaXZlciBieQo+IC0gKiBjYWxsaW5nIGRybV9jcnRjX2FkZF9jcmNfZW50cnko
KS4KPiArICogaW1wbGVtZW50ICZkcm1fY3J0Y19mdW5jcy5zZXRfY3JjX3NvdXJjZSBhbmQgJmRy
bV9jcnRjX2Z1bmNzLnZlcmlmeV9jcmNfc291cmNlLgo+ICsgKiBUaGUgZGVidWdmcyBmaWxlcyBh
cmUgYXV0b21hdGljYWxseSBzZXQgdXAgaWYgdGhvc2UgdmZ1bmNzIGFyZSBzZXQuIENSQyBzYW1w
bGVzCj4gKyAqIG5lZWQgdG8gYmUgY2FwdHVyZWQgaW4gdGhlIGRyaXZlciBieSBjYWxsaW5nIGRy
bV9jcnRjX2FkZF9jcmNfZW50cnkoKS4KPiAgICovCj4gIAo+ICBzdGF0aWMgaW50IGNyY19jb250
cm9sX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQo+IC0tIAo+IDIuMjEuMAo+
IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
