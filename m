Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA4EEE642
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 18:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752346E79F;
	Mon,  4 Nov 2019 17:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651F46E79F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 17:40:13 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o28so18097004wro.7
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 09:40:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=qFzvOj2kIekmlBTNitL0550GXXjfDa5dHZ2hXfb84nE=;
 b=BLkQ/rutBza8KQc/yoSsKUFUHT8WlM3O6M+vvxbWJEUs1QwG5xaV6qSsc21k8J+VEr
 Hzd9fBo/7LNPCfG6VprdY2lgnvZmQIXoPzVIp0pmCyJu8mtkgGTjHK09Bgt3nTdb5mbN
 X24j7QlcSpZ/qWqR7TaYd68EqAsXrkM3vvpq21ivnYS+ejH0IdGb9k7FHH9Kp52tJZ92
 QTFJXSh6Qgk+XN2B3qpgrrbmIW4L5e4YI7pqB9uiaPZuKVP9HBXOkxZfgYkZlb+ZDDPA
 uqerwe7efTz7VFoB85JKAxLqMBTnVm+KzQYnz20hD9Y6HMGwKpdjxC2xOsshcrMl3yZh
 yIbQ==
X-Gm-Message-State: APjAAAUukn/sdTtX0MQgY/HC1KNMiBbC8ZE1VjbUjCLdZCE01CmWCqYQ
 dcM6fx+WeDFm2u+qvxcM5R4rUA==
X-Google-Smtp-Source: APXvYqw29YqfrGgjpwh0uFd5WKrqiAbjecSm6tcDlvpk+V7LLi/5MabZh6lMzWqoH8T6/X2qsoJ4jQ==
X-Received: by 2002:adf:e747:: with SMTP id c7mr24315449wrn.384.1572889211910; 
 Mon, 04 Nov 2019 09:40:11 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b17sm8647949wru.36.2019.11.04.09.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 09:40:10 -0800 (PST)
Date: Mon, 4 Nov 2019 18:40:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Subject: Re: [PATCH] drm/vkms: Update VKMS documentation
Message-ID: <20191104174008.GK10326@phenom.ffwll.local>
Mail-Followup-To: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>,
 outreachy-kernel@googlegroups.com, manasi.d.navare@intel.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
References: <20191101223735.2425-1-gabrielabittencourt00@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191101223735.2425-1-gabrielabittencourt00@gmail.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=qFzvOj2kIekmlBTNitL0550GXXjfDa5dHZ2hXfb84nE=;
 b=gdP/u/Z2502qMOMIX5Abj0e+tGILbSh4sD07/PoMKUAftazcuxy2XTGaZjYj+8Y19c
 jl5h1aJYvLfqDcB8eqkoKVzhyat5T/4msDgTalhzxCq2SVhe9oHqkxd/+PjOAxGwl3Ed
 qpZOsqJ65cSsHMYFmVqVPi64e8qn3nq44jM5o=
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 manasi.d.navare@intel.com, outreachy-kernel@googlegroups.com,
 lkcamp@lists.libreplanetbr.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMDc6Mzc6MzVQTSAtMDMwMCwgR2FicmllbGEgQml0dGVu
Y291cnQgd3JvdGU6Cj4gU21hbGwgY2hhbmdlcyBpbiB0aGUgZHJpdmVyIGRvY3VtZW50YXRpb24s
IGNsYXJpZmluZyB0aGUgZGVzY3JpcHRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogR2FicmllbGEg
Qml0dGVuY291cnQgPGdhYnJpZWxhYml0dGVuY291cnQwMEBnbWFpbC5jb20+CgpsZ3RtLCBhcHBs
aWVkLgotRGFuaWVsCgo+IAo+IC0tLQo+IAo+IFRlc3RlZCB1c2luZzogbWFrZSBodG1sZG9jcwo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5jIHwgOCArKysrLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJt
L3ZrbXMvdmttc19kcnYuYwo+IGluZGV4IDgwNTI0YTIyNDEyYS4uNTJlNzYxYmQ2YzJkIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vdmttcy92a21zX2Rydi5jCj4gQEAgLTMsMTAgKzMsMTAgQEAKPiAgLyoqCj4gICAq
IERPQzogdmttcyAoVmlydHVhbCBLZXJuZWwgTW9kZXNldHRpbmcpCj4gICAqCj4gLSAqIHZrbXMg
aXMgYSBzb2Z0d2FyZS1vbmx5IG1vZGVsIG9mIGEga21zIGRyaXZlciB0aGF0IGlzIHVzZWZ1bCBm
b3IgdGVzdGluZywKPiAtICogb3IgZm9yIHJ1bm5pbmcgWCAob3Igc2ltaWxhcikgb24gaGVhZGxl
c3MgbWFjaGluZXMgYW5kIGJlIGFibGUgdG8gc3RpbGwKPiAtICogdXNlIHRoZSBHUFUuIHZrbXMg
YWltcyB0byBlbmFibGUgYSB2aXJ0dWFsIGRpc3BsYXkgd2l0aG91dCB0aGUgbmVlZCBmb3IKPiAt
ICogYSBoYXJkd2FyZSBkaXNwbGF5IGNhcGFiaWxpdHkuCj4gKyAqIFZLTVMgaXMgYSBzb2Z0d2Fy
ZS1vbmx5IG1vZGVsIG9mIGEgS01TIGRyaXZlciB0aGF0IGlzIHVzZWZ1bCBmb3IgdGVzdGluZwo+
ICsgKiBhbmQgZm9yIHJ1bm5pbmcgWCAob3Igc2ltaWxhcikgb24gaGVhZGxlc3MgbWFjaGluZXMu
IFZLTVMgYWltcyB0byBlbmFibGUKPiArICogYSB2aXJ0dWFsIGRpc3BsYXkgd2l0aCBubyBuZWVk
IG9mIGEgaGFyZHdhcmUgZGlzcGxheSBjYXBhYmlsaXR5LCByZWxlYXNpbmcKPiArICogdGhlIEdQ
VSBpbiBEUk0gQVBJIHRlc3RzLgo+ICAgKi8KPiAgCj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUu
aD4KPiAtLSAKPiAyLjIwLjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVy
LCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
