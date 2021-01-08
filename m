Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E30A2EFA50
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 22:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA6C89449;
	Fri,  8 Jan 2021 21:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA8E89449;
 Fri,  8 Jan 2021 21:22:53 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id d203so12985951oia.0;
 Fri, 08 Jan 2021 13:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jtF04qvq/VTbhIf0eAtTSUNgk9E967muFMcFI2z2Cw0=;
 b=tljPaZFs2W2BXoVm3Xs7iAmWJxMVOvITPidmLE68nl/DJTH/iUMLhy6FY1FnfpP6TY
 DYI8oE9bXAA8BP+qU8Rg9GQrl6vpaK+ZjghdVDpz8i/z/zfe5mluyX/XJ6x86Nic6Dcw
 ZFRed+I0t7J0exHQjxqSCRnEYQC9WU2kDe0RrnSorfAXaBgsfnArxtACVstfrwNtVcdI
 j1Xy0okQMj8OQATomAAwiBR0Q2ASsa0GNQD2YAFsMyKE+L67xpV5TYxWJVowk1ZRi8Dk
 qCHduc9oHDfcqFxicsjqEqoe8iXrgrV28ISGQ7Y2X0EZ6oTwALwT1Y/0lNbY/W2r5Ogg
 bPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jtF04qvq/VTbhIf0eAtTSUNgk9E967muFMcFI2z2Cw0=;
 b=JEEApZVTtXJNvLKEClzT6H7r4E8OjBl1Ei6jC4cptsmVa3TmgBUGbTmvm0kjSgIjHc
 gzkVpXuSb3wWV8D2VEaOgCldsydSA5TyRsdmj3xnfxtfO809o7LY6ut5Vfo8gzPa3CLP
 I6N0vWuEhcwXtu8M+0Xw1hv5IQKmYjKqRWocv5D+sY+JkN3chNwDQPOLhHFciJlDdBuz
 jRMz342Ff1hgsK9mO9wb4//UzksnOrUygnHBNJsYvLOuIq4CGrMLlgV+LVQzNtfREmhG
 bel8KHxOnDXBFH8T595XIAS13jFoXgJleKi6qM6ORt7for3+AQWVx5i6zV4xn/cvagz/
 rzhg==
X-Gm-Message-State: AOAM532mTUJBGbtH5IBHYh7xZlu0Tp9JAw0XWIC33P+n6WHnUYkoA6zT
 Y1j4edjCqtxLQDuU3b5o6/4vxqFj51T+mC9SSIw=
X-Google-Smtp-Source: ABdhPJxxkc06PglmJmBDo80ggNi/XLoKHTp3G235Rou/iW9z9tfX3OBsARCyjKgT7gbYkPskt7IdEks+wbLApfnH9XE=
X-Received: by 2002:a54:4083:: with SMTP id i3mr3500886oii.120.1610140973145; 
 Fri, 08 Jan 2021 13:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-36-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-36-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 16:22:42 -0500
Message-ID: <CADnq5_MmsvvxTMTWZn0EPeFn54=JBq3q1UbbPC91VGfbXQTFGQ@mail.gmail.com>
Subject: Re: [PATCH 35/40] drm/amd/display/dc/bios/command_table: Remove
 unused variable and associated comment
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE2IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9i
aW9zL2NvbW1hbmRfdGFibGUuYzogSW4gZnVuY3Rpb24g4oCYYWRqdXN0X2Rpc3BsYXlfcGxsX3Yy
4oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Jpb3MvY29t
bWFuZF90YWJsZS5jOjE0NjI6MTE6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhwaXhlbF9j
bG9ja18xMEtIel9pbuKAmSBbLVd1bnVzZWQtdmFyaWFibGVdCj4KPiBDYzogSGFycnkgV2VudGxh
bmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQu
Y29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KPiBDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiBDYzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
CgpTZWUgbXkgY29tbWVudCBvbiB0aGUgb3RoZXIgcGF0Y2ggZm9yIHRoaXMgZnVuY3Rpb24uCgpB
bGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5k
X3RhYmxlLmMgfCA0IC0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvY29tbWFuZF90
YWJsZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvY29tbWFuZF90YWJs
ZS5jCj4gaW5kZXggZGQ4OTNhMTE3Njk3OS4uNjZmZTFkMTgxMDc4OSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlLmMKPiBA
QCAtMTQ1NywxMCArMTQ1Nyw2IEBAIHN0YXRpYyBlbnVtIGJwX3Jlc3VsdCBhZGp1c3RfZGlzcGxh
eV9wbGxfdjIoCj4gIHsKPiAgICAgICAgIGVudW0gYnBfcmVzdWx0IHJlc3VsdCA9IEJQX1JFU1VM
VF9GQUlMVVJFOwo+Cj4gLSAgICAgICAvKiBXZSBuZWVkIHRvIGNvbnZlcnQgZnJvbSBLSHogdW5p
dHMgaW50byAxMEtIeiB1bml0cyBhbmQgdGhlbiBjb252ZXJ0Cj4gLSAgICAgICAgKiBvdXRwdXQg
cGl4ZWwgY2xvY2sgYmFjayAxMEtIei0tPktIeiAqLwo+IC0gICAgICAgdWludDMyX3QgcGl4ZWxf
Y2xvY2tfMTBLSHpfaW4gPSBicF9wYXJhbXMtPnBpeGVsX2Nsb2NrIC8gMTA7Cj4gLQo+ICAgICAg
ICAgYnAtPmNtZF9oZWxwZXItPmVuY29kZXJfaWRfdG9fYXRvbSgKPiAgICAgICAgICAgICAgICAg
ZGFsX2dyYXBoaWNzX29iamVjdF9pZF9nZXRfZW5jb2Rlcl9pZChicF9wYXJhbXMtPmVuY29kZXJf
b2JqZWN0X2lkKSk7Cj4gICAgICAgICBicC0+Y21kX2hlbHBlci0+ZW5jb2Rlcl9tb2RlX2JwX3Rv
X2F0b20oYnBfcGFyYW1zLT5zaWduYWxfdHlwZSwgZmFsc2UpOwo+IC0tCj4gMi4yNS4xCj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
