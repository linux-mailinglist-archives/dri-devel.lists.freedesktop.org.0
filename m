Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 284215D067
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 15:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF86A89BB2;
	Tue,  2 Jul 2019 13:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DD889BCD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 13:21:49 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m10so27256377edv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 06:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=7fkANFdIynH0ClOKT8icytDm2bPs8Oi+kCWWSVdcdA8=;
 b=WvtwIWMSiDOv76wiofjuFBVup1GVTn06MRIHOFN+hoS9WLNsxDv0h6/sj0pbnGPpmd
 MNFV+q6mG9zqSVXg5CP3yUv1LjhG4EW6HJmoN3IW3ZihP9LsWvjtnMfOJspsKEu6T28I
 STFLAqdS20ytSZlEXCd8360h0QapZ+brMe7LksOPDUEW7wo1pgyvVcfAtNQkI5HkoOkG
 y0cbEAh4t66erOqCETP6XIeI0aCzffv50sLtkN11bt1ZtEd4fZ/P+hDVOcf4iWE0XAPw
 uJNfcOFDWoAZw6BZHmRLkHH6to+O+akPfyaVNeVzivjjfcVFUzWEiWB4Z/Er9d0K6xLF
 kjow==
X-Gm-Message-State: APjAAAU3snY75RA6kWqK3yrutDRMJ4EFHyTeTYB6+P3fPxwxTyAtmvNl
 WmOnmleLH430OsxlOPlKz8b4UA==
X-Google-Smtp-Source: APXvYqwowvc8e4ZheEmGpoF6aPCzIdTqQI1K+iW3qBLevgjjlBPWrFh2dxKneIMd8Pj3DvnH+Fqfig==
X-Received: by 2002:a50:9451:: with SMTP id q17mr35506080eda.119.1562073707787; 
 Tue, 02 Jul 2019 06:21:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id e22sm353050ejj.61.2019.07.02.06.21.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 06:21:46 -0700 (PDT)
Date: Tue, 2 Jul 2019 15:21:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [RFC PATCH v3 00/11] new cgroup controller for gpu/drm subsystem
Message-ID: <20190702132144.GC15868@phenom.ffwll.local>
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <CAKMK7uFq7qCpzXqrD4o8Vw_dOwt=ny_oS7TRZFsANpPdC604vw@mail.gmail.com>
 <CAOWid-e-gxFBoiBii4wZs0HMnHwCvJWOQWpNopdPHi8So53gNw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-e-gxFBoiBii4wZs0HMnHwCvJWOQWpNopdPHi8So53gNw@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7fkANFdIynH0ClOKT8icytDm2bPs8Oi+kCWWSVdcdA8=;
 b=BTU52gar4d2uAXU7lUx5EpJIF3EcAp0CiRv1mW0icR0JHvBgE+FlPJLuARtyRQJRDw
 hkjUc125FywMVMfJBYGA2ntZYZ5rGikIrisudqwjZpZNMueIW2/Hsg68j/8iZ7ZTK5wM
 d6+lMzt+8S3twI2IJAddGxnM6D7yK822me3kQ=
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
Cc: joseph.greathouse@amd.com, Kenny Ho <Kenny.Ho@amd.com>, jsparks@cray.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, lkaplan@cray.com,
 Alex Deucher <alexander.deucher@amd.com>, Jerome Glisse <jglisse@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMDE6MTA6MjhBTSAtMDQwMCwgS2VubnkgSG8gd3JvdGU6
Cj4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMzoyNCBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgo+ID4gQW5vdGhlciBxdWVzdGlvbiBJIGhhdmU6IFdoYXQgYWJvdXQg
SE1NPyBXaXRoIHRoZSBkZXZpY2UgbWVtb3J5IHpvbmUKPiA+IHRoZSBjb3JlIG1tIHdpbGwgYmUg
YSBsb3QgbW9yZSBpbnZvbHZlZCBpbiBtYW5hZ2luZyB0aGF0LCBidXQgSSBhbHNvCj4gPiBleHBl
Y3QgdGhhdCB3ZSdsbCBoYXZlIGNsYXNzaWMgYnVmZmVyLWJhc2VkIG1hbmFnZW1lbnQgZm9yIGEg
bG9uZyB0aW1lCj4gPiBzdGlsbC4gU28gdGhlc2UgbmVlZCB0byB3b3JrIHRvZ2V0aGVyLCBhbmQg
SSBmZWFyIHNsaWdodGx5IHRoYXQgd2UnbGwKPiA+IGhhdmUgbWVtY2cgYW5kIGRybWNnIGZpZ2h0
aW5nIG92ZXIgdGhlIHNhbWUgcGllY2VzIGEgYml0IHBlcmhhcHM/Cj4gPgo+ID4gQWRkaW5nIEpl
cm9tZSwgbWF5YmUgaGUgaGFzIHNvbWUgdGhvdWdodHMgb24gdGhpcy4KPiAKPiBJIGp1c3QgZGlk
IGEgYml0IG9mIGRpZ2dpbmcgYW5kIHRoaXMgbG9va3MgbGlrZSB0aGUgY3VycmVudCBiZWhhdmlv
dXI6Cj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NS4xL3ZtL2htbS5odG1sI21l
bW9yeS1jZ3JvdXAtbWVtY2ctYW5kLXJzcy1hY2NvdW50aW5nCj4gCj4gIkZvciBub3cgZGV2aWNl
IG1lbW9yeSBpcyBhY2NvdW50ZWQgYXMgYW55IHJlZ3VsYXIgcGFnZSBpbiByc3MKPiBjb3VudGVy
cyAoZWl0aGVyIGFub255bW91cyBpZiBkZXZpY2UgcGFnZSBpcyB1c2VkIGZvciBhbm9ueW1vdXMs
IGZpbGUKPiBpZiBkZXZpY2UgcGFnZSBpcyB1c2VkIGZvciBmaWxlIGJhY2tlZCBwYWdlIG9yIHNo
bWVtIGlmIGRldmljZSBwYWdlIGlzCj4gdXNlZCBmb3Igc2hhcmVkIG1lbW9yeSkuIFRoaXMgaXMg
YSBkZWxpYmVyYXRlIGNob2ljZSB0byBrZWVwIGV4aXN0aW5nCj4gYXBwbGljYXRpb25zLCB0aGF0
IG1pZ2h0IHN0YXJ0IHVzaW5nIGRldmljZSBtZW1vcnkgd2l0aG91dCBrbm93aW5nCj4gYWJvdXQg
aXQsIHJ1bm5pbmcgdW5pbXBhY3RlZC4KPiAKPiBBIGRyYXdiYWNrIGlzIHRoYXQgdGhlIE9PTSBr
aWxsZXIgbWlnaHQga2lsbCBhbiBhcHBsaWNhdGlvbiB1c2luZyBhCj4gbG90IG9mIGRldmljZSBt
ZW1vcnkgYW5kIG5vdCBhIGxvdCBvZiByZWd1bGFyIHN5c3RlbSBtZW1vcnkgYW5kIHRodXMKPiBu
b3QgZnJlZWluZyBtdWNoIHN5c3RlbSBtZW1vcnkuIFdlIHdhbnQgdG8gZ2F0aGVyIG1vcmUgcmVh
bCB3b3JsZAo+IGV4cGVyaWVuY2Ugb24gaG93IGFwcGxpY2F0aW9ucyBhbmQgc3lzdGVtIHJlYWN0
IHVuZGVyIG1lbW9yeSBwcmVzc3VyZQo+IGluIHRoZSBwcmVzZW5jZSBvZiBkZXZpY2UgbWVtb3J5
IGJlZm9yZSBkZWNpZGluZyB0byBhY2NvdW50IGRldmljZQo+IG1lbW9yeSBkaWZmZXJlbnRseS4i
CgpIbSAuLi4gSSBhbHNvIGp1c3QgbGVhcm5lZCB0aGF0IHRoZSBkZXZpY2UgbWVtb3J5IHN0dWZm
LCBhdCBsZWFzdCB0aGUgaG1tCnBhcnQsIGlzIHByb2JhYmx5IGdldHRpbmcgcmVtb3ZlZCBhZ2Fp
biwgYW5kIG9ubHkgdGhlIGhtbV9taXJyb3IgcGFydCBvZgpobW0gd2lsbCBiZSBrZXB0LiBTbyBt
YXliZSB0aGlzIGRvZXNuJ3QgbWF0dGVyIHRvIHVzLiBCdXQgcmVhbGx5IG5vIGlkZWEuCi1EYW5p
ZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
