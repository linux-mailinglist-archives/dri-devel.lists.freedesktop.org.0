Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86F51FC738
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB61B6EABD;
	Wed, 17 Jun 2020 07:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED746E89D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 11:25:42 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q19so23079663lji.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 04:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J1DJhGQSDd9qg+4bq2SW3OfC6fEmq2H0sypmce6w78g=;
 b=NdYAIpb7i1OzFNFczOX1yx07+L+e97QHtSv2zsJBVC0+5rFPj/vk8NM6zyAqza9cI/
 aZgSWHyLtVqhA/TO0g+Y5YU7ghd1YNeh7rll7dE1Gmq63UWE1uK1U7A6AB5wDyyjmAGH
 0tCVT1k81e2XaX/j5wxbsboGwAxRlllezqIKYjcYrgo59S/MCSUAgmuYZZtOibTPsdul
 ezj1+z4QIVnIW1e+EdjMWWfu8LSRScN1uN6prsTMMU2U9MEmd9wg5aoHPJnJWZ54kFTS
 1782YCmue9vyxtN6OvJXJt0NSxZLtGMmW87yOmVALqr/l781Bj0s8EPJQiHH0sOmlpaB
 bmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J1DJhGQSDd9qg+4bq2SW3OfC6fEmq2H0sypmce6w78g=;
 b=B77syGv7eGrwiZcCMDF+MwDHhBigzB9HMOW3nzIV0DfUf7UVQJW/MVljZ7VNVZDoWX
 7Wq3HZm8UPJTVAy+r0MhIkUq9EV/olTGoVbQgNx9bURU7WQVHJYKxEphj4lLrvU14Apq
 NLfnWzSzbSx2PhaXJcIhQumlE9W6eiFRhFOAsJMOL2p82Mn6Nms4ZJVgSUV4WCGwSnuq
 185J7HAgvx7A/lL8/ciUq+MjO5LwdzslBNZlQ2smWULhWxYC1hR3alliwlGNa6gifUML
 oE+waU0uWz2jdDcGMPo/W1wktOTEQt+dusP9gi9Jwz4eWfkK1XwJRdXOl4Ple+wgJMtH
 8Xeg==
X-Gm-Message-State: AOAM533k2A7hyiRBBvbR+f6IWdK2vt1cCyKCRKs56VUJypvhoT659ZxM
 U9Lr4R48KPjTCWFyamYY322+CfNn
X-Google-Smtp-Source: ABdhPJxncMV2D3cQoYqF+t1E8bMGN3msVW0HWI/2ula2kxfrb21MS9IJZ6vNePInt+ZL3dFG8Esxxg==
X-Received: by 2002:a2e:8744:: with SMTP id q4mr1240969ljj.91.1592306741034;
 Tue, 16 Jun 2020 04:25:41 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id 72sm5201098lfa.52.2020.06.16.04.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 04:25:40 -0700 (PDT)
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_v2_5/5=5d_drm/tegra=3a_plane=3a_Support_18?=
 =?UTF-8?Q?0=c2=b0_rotation?=
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200614200121.14147-1-digetx@gmail.com>
 <20200614200121.14147-6-digetx@gmail.com>
 <CACvgo50P5i2jX6ZrMD=UuGr_bA=8MbFhYBWBNvkMcdCyJKS5xg@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e21404bd-49c9-039e-4aef-c4912a9c0640@gmail.com>
Date: Tue, 16 Jun 2020 14:25:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CACvgo50P5i2jX6ZrMD=UuGr_bA=8MbFhYBWBNvkMcdCyJKS5xg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:03 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Derek Basehore <dbasehore@chromium.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDYuMjAyMCAwMDo0NywgRW1pbCBWZWxpa292INC/0LjRiNC10YI6Cj4gSGkgYWxsLAo+IAo+
IFBlcmhhcHMgYSBzaWxseSBxdWVzdGlvbjoKPiAKPiBPbiBNb24sIDE1IEp1biAyMDIwIGF0IDA4
OjI4LCBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBDb21i
aW5pbmcgaG9yaXpvbnRhbCBhbmQgdmVydGljYWwgcmVmbGVjdGlvbnMgZ2l2ZXMgdXMgMTgwIGRl
Z3JlZXMgb2YKPj4gcm90YXRpb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5r
byA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMu
YyB8IDEzICsrKysrKysrKysrKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jCj4+IGluZGV4IGYzMWJjYTI3Y2RlNC4u
ZGRkOWI4OGY4ZmNlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwo+IAo+PiArICAgICAgIGlmIChyb3Rh
dGlvbiAmIERSTV9NT0RFX1JPVEFURV8xODApIHsKPj4gKyAgICAgICAgICAgICAgIHBsYW5lX3N0
YXRlLT5yZWZsZWN0X3ggPSAhcGxhbmVfc3RhdGUtPnJlZmxlY3RfeDsKPj4gKyAgICAgICAgICAg
ICAgIHBsYW5lX3N0YXRlLT5yZWZsZWN0X3kgPSAhcGxhbmVfc3RhdGUtPnJlZmxlY3RfeTsKPj4g
KyAgICAgICB9Cj4+ICsKPiBBcyBtZW50aW9uZWQgYnkgVmlsbGUgdGhlIGFib3ZlIGlzIGFscmVh
ZHkgaGFuZGxlZCBieQo+IGRybV9yb3RhdGlvbl9zaW1wbGlmeSgpIC4uLiBhbHRob3VnaCBpdCBt
YWtlcyBtZSB3b25kZXI6Cj4gCj4gCj4+ICAgICAgICAgZXJyID0gZHJtX3BsYW5lX2NyZWF0ZV9y
b3RhdGlvbl9wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fTU9ERV9ST1RBVEVfMCwKPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9NT0RFX1JPVEFURV8w
IHwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERS
TV9NT0RFX1JPVEFURV8xODAgfAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgRFJNX01PREVfUkVGTEVDVF9YIHwKPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9NT0RFX1JFRkxFQ1RfWSk7Cj4gCj4g
V291bGQgaXQgbWFrZSBzZW5zZSBmb3IgZHJtX3BsYW5lX2NyZWF0ZV9yb3RhdGlvbl9wcm9wZXJ0
eSgpIGl0c2VsZiwKPiB0byBhZGQgRFJNX01PREVfUk9UQVRFXzE4MCwgd2hlbiBib3RoIHJlZmxl
Y3Rpb25zIGFyZSBzdXBwb3J0ZWQ/CgpIZWxsbyBFbWlsLAoKVGhhdCdzIGEgZ29vZCBwb2ludCEg
QWxsIERSTV9NT0RFX1JPVEFURV8xODAgc2hvdWxkIGJlIHJlbW92ZWQgYmVjYXVzZQpUZWdyYSBj
YW4ndCBkbyAxODDCsCArIHJlZmxlY3RlZC14LiBUaGUgRFJNIGNvcmUgdGFrZXMgY2FyZSBvZiAx
ODDCsApyb3RhdGlvbiB3aGVuIGJvdGggeC95IHJlZmxlY3Rpb25zIGFyZSBzdXBwb3J0ZWQuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
