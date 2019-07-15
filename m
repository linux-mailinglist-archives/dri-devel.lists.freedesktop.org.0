Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 565C2688C4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 14:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7ECF899DB;
	Mon, 15 Jul 2019 12:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49B689933;
 Mon, 15 Jul 2019 12:15:18 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s3so14926354wms.2;
 Mon, 15 Jul 2019 05:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dczFAT6FPD8cyY2Q/h5wBv/uTH7EpIl68cTCwHm2TQQ=;
 b=UbS7Xy4v+cfwhd43PBi7xO47ddVPaFQRuqheZ/BZ0NyLSpbp1QuBN8+yQ+OaZulfBO
 v/jvUbfuG21GJSxX9hpj9q+Ym2JO2mFChuv0Ukjk0a+rvTQTT1vbLth1ighErQtzJb0e
 WbNWt5pRWRAJupnhIsUrs1XPYSl8/4AKT0vOhljHrqVja9ZFBcK39RP7TR1OZfBlsXSR
 D5jYjfEcPN22HfOubnc1NFnFmPYOH5rIDb4hK/ovTEIN0hVy3D7LKzkjOYJBUdyD2V8R
 DDa08YB8LzCdhBEazT15NMEMzuQDNz2QcWtXypRYtP6RYvafhGDvJTmbtfeWDWRb635K
 adyw==
X-Gm-Message-State: APjAAAV+MPAuAk2QvV8mGs3OB17grdxLtGWogAZ+Oo2C9kMiJJuXSn5f
 cqh+V/cH8wRchhHwyBQmRAhm8on8
X-Google-Smtp-Source: APXvYqyYPuhdM1GsVyRUsKAaz8PdtdA3WXINR1ZLTMPduUrkUSO72evtpNKFu5RKUkD4m2430GlKlA==
X-Received: by 2002:a7b:c748:: with SMTP id w8mr23342803wmk.36.1563192917302; 
 Mon, 15 Jul 2019 05:15:17 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id c4sm15715518wrt.86.2019.07.15.05.15.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 05:15:16 -0700 (PDT)
Date: Mon, 15 Jul 2019 13:15:15 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Oleg Vasilev <oleg.vasilev@intel.com>
Subject: Re: [PATCH v2 5/6] drm/nouveau: utilize subconnector property for DP
Message-ID: <20190715121515.GE20839@arch-x1c3>
References: <20190701080022.9415-1-oleg.vasilev@intel.com>
 <20190715112408.20114-1-oleg.vasilev@intel.com>
 <20190715112408.20114-6-oleg.vasilev@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715112408.20114-6-oleg.vasilev@intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dczFAT6FPD8cyY2Q/h5wBv/uTH7EpIl68cTCwHm2TQQ=;
 b=c1Y5GkSLecCdLj8gVY3jG0wuFx42SUDqlscSPA1CypUpWLSTl3YDliPpUeiS1bOT8a
 LXVAfuRGaN04Q/16HXhoPyPgLuASi7GyEePdxofK1bKv3dMc+vtbKgZdGrngDHjHUxKJ
 FivG/+s2EjF9fIVoZ7I0c4kvftl+QKz2VeorifoCl5ykxUJje7hrzHKqffaAF5YVQ3xb
 jSHaPNLzQRC2VBJvNaSUBxHiZRkhz7z8EQDLvtq0fTinJf/fVJjEYaVo7aYcxq2u2uyj
 nPoHgG4l89S+XWBdCdQJHE9r+M4uUV158zO+EV3+8dqf3EZzAIgs0e15mwVw/Xwk4eB3
 EwAg==
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgT2xlZywKCk9uIDIwMTkvMDcvMTUsIE9sZWcgVmFzaWxldiB3cm90ZToKPiBTaW5jZSBEUC1z
cGVjaWZpYyBpbmZvcm1hdGlvbiBpcyBzdG9yZWQgaW4gZHJpdmVyJ3Mgc3RydWN0dXJlcywgZXZl
cnkKPiBkcml2ZXIgbmVlZHMgdG8gaW1wbGVtZW50IHN1YmNvbm5lY3RvciBwcm9wZXJ0eSBieSBp
dHNlbGYuCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xlZyBWYXNpbGV2IDxvbGVnLnZhc2lsZXZAaW50
ZWwuY29tPgo+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jIHwgMTMgKysrKysrKysrKysr
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RwLmMgICAgICAgIHwgIDkgKysr
KysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZW5jb2Rlci5oICAgfCAg
MSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYwo+IGluZGV4IDQxMTZlZTYyYWRhZi4u
NzI4OTQ5ZDgwM2FmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfY29ubmVjdG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nv
bm5lY3Rvci5jCj4gQEAgLTYzNiw2ICs2MzYsMTcgQEAgbm91dmVhdV9jb25uZWN0b3JfZGV0ZWN0
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wgZm9yY2UpCj4gIAlwbV9ydW50
aW1lX21hcmtfbGFzdF9idXN5KGRldi0+ZGV2KTsKPiAgCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNw
ZW5kKGRldi0+ZGV2KTsKPiAgCj4gKwlpZiAoY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSA9PSBE
Uk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBvcnQgfHwKPiArCSAgICBjb25uZWN0b3ItPmNvbm5l
Y3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5FQ1RPUl9lRFApIHsKPiArCQllbnVtIGRybV9tb2Rl
X3N1YmNvbm5lY3RvciBzdWJjb25uZWN0b3IgPSBEUk1fTU9ERV9TVUJDT05ORUNUT1JfVW5rbm93
bjsKPiArCj4gKwkJaWYgKGNvbm5fc3RhdHVzID09IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVk
ICYmIG52X2VuY29kZXIpCj4gKwkJCXN1YmNvbm5lY3RvciA9IG52X2VuY29kZXItPmRwLnN1YmNv
bm5lY3RvcjsKPiArCQlkcm1fb2JqZWN0X3Byb3BlcnR5X3NldF92YWx1ZSgmY29ubmVjdG9yLT5i
YXNlLAo+ICsJCQljb25uZWN0b3ItPmRldi0+bW9kZV9jb25maWcuZHBfc3ViY29ubmVjdG9yX3By
b3BlcnR5LAo+ICsJCQlzdWJjb25uZWN0b3IpOwo+ICsJfQo+ICsKPiAgCXJldHVybiBjb25uX3N0
YXR1czsKPiAgfQo+ICAKPiBAQCAtMTM1Nyw2ICsxMzY4LDggQEAgbm91dmVhdV9jb25uZWN0b3Jf
Y3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAkJCWtmcmVlKG52X2Nvbm5lY3Rvcik7
Cj4gIAkJCXJldHVybiBFUlJfUFRSKHJldCk7Cj4gIAkJfQo+ICsKPiArCQlkcm1fbW9kZV9hZGRf
ZHBfc3ViY29ubmVjdG9yX3Byb3BlcnR5KGNvbm5lY3Rvcik7Cj4gIAkJZnVuY3MgPSAmbm91dmVh
dV9jb25uZWN0b3JfZnVuY3M7Cj4gIAkJYnJlYWs7Cj4gIAlkZWZhdWx0Ogo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2RwLmMKPiBpbmRleCAwZDA1MmUxNjYwZjguLjdhODdiMGY4MDhhNyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RwLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RwLmMKPiBAQCAtNjMsNiArNjMsNyBA
QCBub3V2ZWF1X2RwX2RldGVjdChzdHJ1Y3Qgbm91dmVhdV9lbmNvZGVyICpudl9lbmNvZGVyKQo+
ICAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1X2RybShkZXYpOwo+ICAJc3RydWN0
IG52a21faTJjX2F1eCAqYXV4Owo+ICAJdTggZHBjZFs4XTsKPiArCXU4IHBvcnRfY2FwW0RQX01B
WF9ET1dOU1RSRUFNX1BPUlRTXSA9IHswfTsKSUlSQyBjbGFuZyB3aWxsIGNvbXBsYWluIGFib3V0
IHswfS4gSG93IGFib3V0IHdlIG1ha2UgdGhpcyBhIHt9LgoKUmVnYXJkbGVzcyBvZiB0aGUgYWJv
dmUgbml0cGljaywgdGhlIHNlcmllcyBpczoKUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1p
bC52ZWxpa292QGNvbGxhYm9yYS5jb20+CgpUaGFua3MgZm9yIHRoZSBmb2xsb3ctdXAgOi0pCkVt
aWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
