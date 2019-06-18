Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AAA4A373
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 16:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607A46E1D3;
	Tue, 18 Jun 2019 14:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1916E1D3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 14:09:30 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p26so21980257edr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=rd5swHtQn6I4g05FOd476JWDZK1W4dVOi6bXk+VCUPQ=;
 b=UCCHYwBt4QKHgisApyx9H55AObLJBoa4ChD/Im7ZWkPqLk82vRTwLCZt8RxSq7H9fv
 yH4oT2za4lK2+f+RI7iIW88lqvIeSmbLXcFugVaxlik4UgUgmclr/1imfraDur1zoiAV
 dPThmVPgag+gH8FK97RCpftF8rYk2CkvzbFi8xirVic8C/gzhY7KxMKcUoh9+2Kgtzpv
 DXK10S02Xjrnqg0W+64FWjIYVE+Zjf2AXGnNtIfkx/ZTF/OqTb9vvt0qnwsCL3EnpKK0
 2TiNinFE1eqoLY1tPCM4b48SROxjaeDSnNQYcOup08f3WKuWhzkCvvR72s14Brd/ZIMy
 AAGw==
X-Gm-Message-State: APjAAAVHN7Rhe53QtMH7vKJmnnlWYWUdrMkiW1uj85yGrJr/jDiwLPf0
 oYTHgHxETlUdGdm+F2qmDe52TQ==
X-Google-Smtp-Source: APXvYqxfjGPU2BQiQCTzJdcSdy/5MdYMFSVDaL4zuBQZvv/UJIsO2W/GMuSac5Zl+3oa3BfMmQ4AWg==
X-Received: by 2002:a50:b635:: with SMTP id b50mr31792908ede.293.1560866969483; 
 Tue, 18 Jun 2019 07:09:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a9sm4932323edc.44.2019.06.18.07.09.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 07:09:27 -0700 (PDT)
Date: Tue, 18 Jun 2019 16:09:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 06/12] drm/virtio: remove ttm calls from in
 virtio_gpu_object_{reserve,unreserve}
Message-ID: <20190618140925.GB12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20190618135821.8644-1-kraxel@redhat.com>
 <20190618135821.8644-7-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618135821.8644-7-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=rd5swHtQn6I4g05FOd476JWDZK1W4dVOi6bXk+VCUPQ=;
 b=iz+ztRpIBrIo4iXy7HZw7wvhbwfGBVktYhUlYiMIbgaOxZQNafxnYMroWZS3Hvj4V/
 qIDUojvQUiaWn1A5Vt3azHhw+MYeoDPl5oah6fT//VjXyLmBISjRJLLZKJ4fPrbUnB6I
 c5RFdqjzd7ASAlYn1rZ96LAmB/zO6r2XJM6QU=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDM6NTg6MTRQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBDYWxsIHJlc2VydmF0aW9uX29iamVjdF8qIGRpcmVjdGx5IGluc3RlYWQKPiBvZiB1
c2luZyB0dG1fYm9fe3Jlc2VydmUsdW5yZXNlcnZlfS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZXJk
IEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X2Rydi5oIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYu
aAo+IGluZGV4IDA2Y2MwZTk2MWRmNi4uOTFjMzIwODE5YThjIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9kcnYuaAo+IEBAIC00MDIsNyArNDAyLDcgQEAgc3RhdGljIGlubGluZSBp
bnQgdmlydGlvX2dwdV9vYmplY3RfcmVzZXJ2ZShzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJv
KQo+ICB7Cj4gIAlpbnQgcjsKPiAgCj4gLQlyID0gdHRtX2JvX3Jlc2VydmUoJmJvLT50Ym8sIHRy
dWUsIGZhbHNlLCBOVUxMKTsKPiArCXIgPSByZXNlcnZhdGlvbl9vYmplY3RfbG9ja19pbnRlcnJ1
cHRpYmxlKGJvLT5nZW1fYmFzZS5yZXN2LCBOVUxMKTsKPiAgCWlmICh1bmxpa2VseShyICE9IDAp
KSB7Cj4gIAkJaWYgKHIgIT0gLUVSRVNUQVJUU1lTKSB7CgplcnJubyBzZW1hbnRpY3MgY2hhbmdl
IGhlcmUsIEkgdGhpbmsgeW91IG5vdyBnZXQgRUlOVFIuIFdpdGggdGhhdCBmaXhlZDoKClJldmll
d2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiAgCQkJc3Ry
dWN0IHZpcnRpb19ncHVfZGV2aWNlICpxZGV2ID0KPiBAQCAtNDE2LDcgKzQxNiw3IEBAIHN0YXRp
YyBpbmxpbmUgaW50IHZpcnRpb19ncHVfb2JqZWN0X3Jlc2VydmUoc3RydWN0IHZpcnRpb19ncHVf
b2JqZWN0ICpibykKPiAgCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCB2aXJ0aW9fZ3B1X29iamVjdF91
bnJlc2VydmUoc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibykKPiAgewo+IC0JdHRtX2JvX3Vu
cmVzZXJ2ZSgmYm8tPnRibyk7Cj4gKwlyZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKGJvLT5nZW1f
YmFzZS5yZXN2KTsKPiAgfQo+ICAKPiAgLyogdmlyZ2wgZGVidWZzICovCj4gLS0gCj4gMi4xOC4x
Cj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
