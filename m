Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5573D82ECA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 11:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2326B897E3;
	Tue,  6 Aug 2019 09:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25067897E3
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 09:38:21 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id v15so81728545eds.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 02:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=lXyS+3a5qcDEyEF5LisBaQWkib6lVU2+K34nQBXYqTA=;
 b=j7VUjXuDGHu7KCGlwKNjf4UljhiwiUM7KLYFHCJ7u91CZutyfNbpdiN0hmZaTxWzY8
 wYw8CGGOxSp9nsyd5mTwzzlG18YSsuvcUIZDvrXOsQQIkYOhObkDcK/PRmmo0SzZQrsz
 ImgjQuHzt9TvGGrTpCGB3IeHH8sJToH5cn6beQ5Ygk+glNJAP6sjGLIUGAkcijjABfAV
 uQcx2n5At9u7Y8IdPdShAZPyDI/jqhMF3l1oIJZoeVAAjOpObySVeLZ1OiK8lsgaQ2+i
 NwyM1pDNK5aEJzQaEQZdDGsnk6CZORFW0kyGHeHHhg29WeuLkVm2jhYOyAF6SMxLZcI4
 6BuA==
X-Gm-Message-State: APjAAAUKLveZZh5sxdy7gL/F9QltdQ29jb2tFJYGeretr6syOISsd3dG
 AIQHywPAdutR+yVN36s8dLGtIw==
X-Google-Smtp-Source: APXvYqzqH6/bXZ26nVBNYTN2PzoLaN+S9OSr40dprY04zqgu8B5JxMBvPeFFL2JFhDIKf3hdZUQCxA==
X-Received: by 2002:a50:d79b:: with SMTP id w27mr2729896edi.126.1565084299696; 
 Tue, 06 Aug 2019 02:38:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id cw14sm14578958ejb.91.2019.08.06.02.38.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 02:38:18 -0700 (PDT)
Date: Tue, 6 Aug 2019 11:38:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/2] drm: add cache support for arm64
Message-ID: <20190806093816.GY7444@phenom.ffwll.local>
Mail-Followup-To: Christoph Hellwig <hch@lst.de>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190805211451.20176-1-robdclark@gmail.com>
 <20190806084821.GA17129@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806084821.GA17129@lst.de>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=lXyS+3a5qcDEyEF5LisBaQWkib6lVU2+K34nQBXYqTA=;
 b=VvVVfZAImggq+hv+uSLRfZNheEhVjvL+W5UVpgopska+tQ8Ns32KSgvyatrllNVad8
 8GXMBagHGD5RYCv4YfaSEOmkLu2BiH8CqUfZr0AvoqzTNY8/+hR40D4CrQXnT4khXUlf
 mxChHJ1ZYcKjNhkwkqyFKIV2AgxEs20G4jtB4=
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
Cc: Rob Clark <robdclark@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMTA6NDg6MjFBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhpcyBnb2VzIGluIHRoZSB3cm9uZyBkaXJlY3Rpb24uICBkcm1fY2ZsdXNo
XyogYXJlIGEgYmFkIEFQSSB3ZSBuZWVkIHRvCj4gZ2V0IHJpZCBvZiwgbm90IGFkZCB1c2Ugb2Yg
aXQuICBUaGUgcmVhc29uIGZvciB0aGF0IGlzIHR3by1mb2xkOgo+IAo+ICBhKSBpdCBkb2Vzbid0
IGFkZHJlc3MgaG93IGNhY2hlIG1haW50YWluY2UgYWN0dWFsbHkgd29ya3MgaW4gbW9zdAo+ICAg
ICBwbGF0Zm9ybXMuICBXaGVuIHRhbGtpbmcgYWJvdXQgYSBjYWNoZSB3ZSB0aHJlZSBmdW5kYW1l
bnRhbCBvcGVyYXRpb25zOgo+IAo+IAkxKSB3cml0ZSBiYWNrIC0gdGhpcyB3cml0ZXMgdGhlIGNv
bnRlbnQgb2YgdGhlIGNhY2hlIGJhY2sgdG8gdGhlCj4gCSAgIGJhY2tpbmcgbWVtb3J5Cj4gCTIp
IGludmFsaWRhdGUgLSB0aGlzIHJlbW92ZSB0aGUgY29udGVudCBvZiB0aGUgY2FjaGUKPiAJMykg
d3JpdGUgYmFjayArIGludmFsaWRhdGUgLSBkbyBib3RoIG9mIHRoZSBhYm92ZQo+IAo+ICBiKSB3
aGljaCBvZiB0aGUgYWJvdmUgb3BlcmF0aW9uIHlvdSB1c2Ugd2hlbiBkZXBlbmRzIG9uIGEgY291
cGxlIG9mCj4gICAgIGZhY3RvcnMgb2Ygd2hhdCB5b3Ugd2FudCB0byBkbyB3aXRoIHRoZSByYW5n
ZSB5b3UgZG8gdGhlIGNhY2hlCj4gICAgIG1haW50YWluYW5jZSBvcGVyYXRpb25zCj4gCj4gVGFr
ZSBhIGxvb2sgYXQgdGhlIGNvbW1lbnQgaW4gYXJjaC9hcmMvbW0vZG1hLmMgYXJvdW5kIGxpbmUg
MzAgdGhhdAo+IGV4cGxhaW5zIGhvdyB0aGlzIGFwcGxpZXMgdG8gYnVmZmVyIG93bmVyc2hpcCBt
YW5hZ2VtZW50LiAgTm90ZSB0aGF0Cj4gImZvciBkZXZpY2UiIGFwcGxpZXMgdG8gImZvciB1c2Vy
c3BhY2UiIGluIHRoZSBzYW1lIHdheSwganVzdCB0aGF0Cj4gdXNlcnNwYWNlIHRoZW4gYWxzbyBu
ZWVkcyB0byBmb2xsb3cgdGhpcyBwcm90b2NvbC4gIFNvIHRoZSB3aG9sZSBpZGVhCj4gdGhhdCBy
YW5kb20gZHJpdmVyIGNvZGUgY2FsbHMgcmFuZG9tIGxvdy1sZXZlbCBjYWNoZSBtYWludGFpbmFu
Y2UKPiBvcGVyYXRpb25zIChhbmQgdXNlIHRoZSBub24tc3BlY2lmaWMgdGVybSBmbHVzaCB0byBt
YWtlIGl0IGFsbCBtb3JlCj4gY29uZnVzaW5nKSBpcyBhIGJhZCBpZGVhLiAgRm9ydHVuYXRlbHkg
ZW5vdWdoIHdlIGhhdmUgcmVhbGx5IGdvb2QKPiBhcmNoIGhlbHBlcnMgZm9yIGFsbCBub24tY29o
ZXJlbnQgYXJjaGl0ZWN0dXJlcyAodGhpcyBleGNsdWRlcyB0aGUKPiBtYWdpYyBpOTE1IHdvbid0
IGJlIGNvdmVyZWQgYnkgdGhhdCwgYnV0IHRoYXQgaXMgYSBzZXBhcmF0ZSBpc3N1ZQo+IHRvIGJl
IGFkZHJlc3NlZCBsYXRlciwgYW5kIHRoZSBmYWN0IHRoYXQgd2hpbGUgYXJtMzIgZGlkIGdyZXcg
dGhlbQo+IHZlcnkgcmVjZW50bHkgYW5kIGRvZXNuJ3QgZXhwb3NlIHRoZW0gZm9yIGFsbCBjb25m
aWdzLCB3aGljaCBpcyBlYXNpbHkKPiBmaXhhYmxlIGlmIG5lZWRlZCkgd2l0aCBhcmNoX3N5bmNf
ZG1hX2Zvcl9kZXZpY2UgYW5kCj4gYXJjaF9zeW5jX2RtYV9mb3JfY3B1LiAgU28gd2hhdCB3ZSBu
ZWVkIGlzIHRvIGZpZ3VyZSBvdXQgd2hlcmUgd2UKPiBoYXZlIHZhbGlkIGNhc2VzIGZvciBidWZm
ZXIgb3duZXJzaGlwIHRyYW5zZmVyIG91dHNpZGUgdGhlIERNQQo+IEFQSSwgYW5kIGJ1aWxkIHBy
b3BlciB3cmFwcGVycyBhcm91bmQgdGhlIGFib3ZlIGZ1bmN0aW9uIGZvciB0aGF0Lgo+IE15IGd1
ZXNzIGlzIGl0IHNob3VsZCBwcm9iYWJseSBiZSBidWlsZCB0byBnbyB3aXRoIHRoZSBpb21tdSBB
UEkKPiBhcyB0aGF0IGlzIHRoZSBvbmx5IG90aGVyIHdheSB0byBtYXAgbWVtb3J5IGZvciBETUEg
YWNjZXNzLCBidXQKPiBpZiB5b3UgaGF2ZSBhIGJldHRlciBpZGVhIEknZCBiZSBvcGVuIHRvIGRp
c2N1c3Npb24uCgpJIGp1c3QgcmVhZCB0aHJvdWdoIGFsbCB0aGUgYXJjaF9zeW5jX2RtYV9mb3Jf
ZGV2aWNlL2NwdSBmdW5jdGlvbnMgYW5kCm5vbmUgc2VlbSB0byB1c2UgdGhlIHN0cnVjdCAqZGV2
IGFyZ3VtZW50LiBJaXJjIHlvdSd2ZSBzYWlkIHRoYXQncyBvbiB0aGUKd2F5IG91dD8KClRoYXQg
ZGV2IHBhcmFtZXRlciBpcyBhbm90aGVyIGhvbGR1cCBmb3IgdGhlIHBsYWNlcyB3aGVyZSB3ZSBk
byBub3QgeWV0Cmtub3cgd2hhdCB0aGUgbmV3IGRldmljZSB3aWxsIGJlIChlLmcuIGdlbmVyaWMg
ZG1hLWJ1ZiBleHBvcnRlcnMgbGlrZQp2Z2VtKS4gQW5kIHNwcmlua2xpbmcgYSBmYWtlIGRldiBv
ciBwYXNzaW5nIE5VTEwgaXMgYSBiaXQgc2lsbHkuCgpBZGQgYSBIQVZFX0FSQ0hfU1lOQ19ETUEg
YW5kIHRoZSBhYm92ZSByZWZhY3RvciAoYXNzdW1pbmcgaXQncyBvayB0byByb2xsCm91dCBldmVy
eXdoZXJlKSBhbmQgd2Ugc2hvdWxkIGluZGVlZCBiZSBhYmxlIHRvIHVzZSB0aGlzLiBXZSBzdGls
bCBuZWVkIHRvCmhhdmUgYWxsIHRoZSBvdGhlcnMgZm9yIHg4NiBhbmQgYWxsIHRoYXQuIFBsdXMg
SSBndWVzcyB3ZSBzaG91bGQgcm9sbCBvdXQKdGhlIHNwbGl0IGludG8gaW52YWxpZGF0ZSBhbmQg
Zmx1c2guCgpUaGUgb3RoZXIgYml0IGlzIHBoeXMgdnMuIHZpcnQgYWRkciBjb25mdXNpb24sIGJ1
dCBsb29rcyBsaWtlIHN0YW5kYXJkIGlmCnBoeXNfYWRkciBhbmQgeW91IGttYXAgdW5kZXJuZWF0
aCAoZXhjZXB0IGZyb20gZHJtX2NsZmx1c2hfdmlydF9yYW5nZSwKb25seSB1c2VkIGJ5IGk5MTUp
LgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
