Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B0410B5C1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 19:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3576E588;
	Wed, 27 Nov 2019 18:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF216E584
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 18:29:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i12so27939005wro.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 10:29:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=q8PU0rul7Ps0UsPr1EhmDg+IsYeeYEG3+1dENJKBMlg=;
 b=S9f8rMIQMJqopZZSfq8DNnmanGG3Lj/P4Cbgr8MQtQYYsUBL+SZOJTdOmIPJAT/oFm
 UH2q1ne7HjHkqxsLi/CCyqyzucY8cEXjawrQ1q6ROzcgpVCrHDmRn9gSdgiVIF0Fs8sT
 4RFFNVgPiZ8bzcZLi4N0vgmI1Yh565d/E04/Rb3xUabFRVKeOtxDAy9PyNuUGfZBF2EJ
 iPZZGYIgnQ0YWf6O9V0HAy6Jml44PVmkogEI2/2XvCK5r08UEUfyibRpbvZfjPpSK6pg
 Yi/q41uaMhi9BonnNFtpfCmR7zlK8S8aSTojcnBLldJDq4i5hwq+7nOw5+pCcoSwusX1
 nK8Q==
X-Gm-Message-State: APjAAAVp4RUiIucog9trKoplLciy4c+zqWO5+ZYrcoMhbjcBs9OPpzv+
 2VV9B96W3n0s3QBbIp4bKEFvpGXuiwE=
X-Google-Smtp-Source: APXvYqzGxb027T6AjbrSIyxgbGT10Rlua3bWwnVmub45qfU7fTieDKg9Vuu7OFHe0iUJBy2r/1eQDw==
X-Received: by 2002:adf:f108:: with SMTP id r8mr13256774wro.390.1574879387660; 
 Wed, 27 Nov 2019 10:29:47 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id h15sm20789799wrb.44.2019.11.27.10.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 10:29:43 -0800 (PST)
Date: Wed, 27 Nov 2019 19:29:40 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 13/13] samples: vfio-mdev: constify fb ops
Message-ID: <20191127182940.GM406127@phenom.ffwll.local>
References: <cover.1574871797.git.jani.nikula@intel.com>
 <fc8342eef9fcd2f55c86fcd78f7df52f7c76fa87.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc8342eef9fcd2f55c86fcd78f7df52f7c76fa87.1574871797.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=q8PU0rul7Ps0UsPr1EhmDg+IsYeeYEG3+1dENJKBMlg=;
 b=HHEosXhsFZU4tqkKFMksMLlRSe317ArG/tQxZhX1RqfwX/e+KF1TMl5jI61vAQkDl/
 8offhU56rjNkhhxp9/ycfqju9SbNu4oaSH9vR/HOha+3oY+pHIdESc1HJmsI3ZsGJ7d2
 /aFmv6TQXTAHuEVAF1AWRDtAOks/esHYEA7Vo=
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
Cc: kvm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDY6MzI6MDlQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gTm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBjb25z
dCwgd2UgY2FuIHN0YXIgbWFraW5nCj4gdGhlIG9wcyBjb25zdCBhcyB3ZWxsLgo+IAo+IENjOiBL
aXJ0aSBXYW5raGVkZSA8a3dhbmtoZWRlQG52aWRpYS5jb20+Cj4gQ2M6IGt2bUB2Z2VyLmtlcm5l
bC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29t
PgoKWW91J3ZlIG1pc3NlZCBhdCBsZWFzdCBkcml2ZXJzL3N0YWdpbmcvZmJ0ZnQgaW4geW91ciBz
ZWFyY2guIEkgZ3Vlc3MgeW91Cm5lZWQgdG8gZG8gYSBmdWxsIG1ha2UgYWxseWVzY29uZmlnIG9u
IHg4Ni9hcm0gYW5kIGFybTY0ICh0aGUgbGF0dGVyCmJlY2F1c2Ugc29tZSBzdHVwaWQgZHJpdmVy
cyBvbmx5IGNvbXBpbGUgdGhlcmUsIG5vdCBvbiBhcm0sIGRvbid0IGFzaykuClN0aWxsIG1pc3Nl
cyBhIHBpbGUgb2YgbWlwcy9wcGMgb25seSBzdHVmZiBhbmQgbWF5YmUgdGhlIHNwYXJjcyBhbmQK
YWxwaGFzLCBidXQgc2hvdWxkIGJlIGdvb2QgZW5vdWdoLgoKV2l0aCB0aGF0IGRvbmUsIG9uIHRo
ZSByZW1haW5pbmcgcGF0Y2hlczoKClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgoKPiAtLS0KPiAgc2FtcGxlcy92ZmlvLW1kZXYvbWRweS1mYi5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvc2FtcGxlcy92ZmlvLW1kZXYvbWRweS1mYi5jIGIvc2FtcGxlcy92Zmlv
LW1kZXYvbWRweS1mYi5jCj4gaW5kZXggMjcxOWJiMjU5NjUzLi4yMWRiZjYzZDZlNDEgMTAwNjQ0
Cj4gLS0tIGEvc2FtcGxlcy92ZmlvLW1kZXYvbWRweS1mYi5jCj4gKysrIGIvc2FtcGxlcy92Zmlv
LW1kZXYvbWRweS1mYi5jCj4gQEAgLTg2LDcgKzg2LDcgQEAgc3RhdGljIHZvaWQgbWRweV9mYl9k
ZXN0cm95KHN0cnVjdCBmYl9pbmZvICppbmZvKQo+ICAJCWlvdW5tYXAoaW5mby0+c2NyZWVuX2Jh
c2UpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgc3RydWN0IGZiX29wcyBtZHB5X2ZiX29wcyA9IHsKPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBmYl9vcHMgbWRweV9mYl9vcHMgPSB7Cj4gIAkub3duZXIJCT0g
VEhJU19NT0RVTEUsCj4gIAkuZmJfZGVzdHJveQk9IG1kcHlfZmJfZGVzdHJveSwKPiAgCS5mYl9z
ZXRjb2xyZWcJPSBtZHB5X2ZiX3NldGNvbHJlZywKPiAtLSAKPiAyLjIwLjEKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
