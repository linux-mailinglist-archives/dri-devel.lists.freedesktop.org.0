Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BB7184210
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065986E283;
	Fri, 13 Mar 2020 08:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE226E201
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 14:03:59 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id g12so6586500ljj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 07:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qKTaqDytagD0O2wTlbTJF0/J9uHzNIR8oj4ra9daOM8=;
 b=aYkSLnFFgjnfOwrnv1bkZJXAllGNQlS1h6LL+vuczIMAuxlDl2vzOZOZLFaJOF0RYU
 ZnfUwBXFh7vUDzXX4pN6iG9h2dRbP7yHFjQxx4Mjr6894lhMr5dOVGhZ9ja/envyBRJL
 BNC9Dx3ZqJYdAYEfAUoT0ZwrMvEPT1Z5DBDAeoZfXldt3Ghez4olv5UyazN5BIXANt8C
 svsL/tnDl+SXMh7nyyDc3FID0Ze7xXuv2Ql5USUaHgHtiLvetPqSXJqtqyH8/qL1yQCu
 WZsP7G5juEDROdknu2q0lZc8MugXUtk8335LKZWhGwRgmkd4oZlorV1YYEqHb/Q2kPLm
 WKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qKTaqDytagD0O2wTlbTJF0/J9uHzNIR8oj4ra9daOM8=;
 b=Vm3gnplSD6i8mobLHWyGF3vfw6yLgeDS2exeZOwnAoCtjQ26Yxa9QqMdwIgPP44ybB
 g/b3/UAtdMaH/d2GMa0FIwt4K3d+RxZs0fJw1vJISO06ZJMK/h3G9iJXxk9FVHRZwhS3
 wfY+/pKZegDQn4GVQ6aEOkHG1S3mzh8ud58JgTbEJ3dGWQQzecQ7edpPYrbQpK8GBVGQ
 8/F7gmXF+tzTnoqjy4uNWDpQjK6iTTRlI8FoTEhcr+UqLUpZqmGoxHM3Jvwr3YFjpD3j
 PqdrYwld0Jjvet4VMueVH0+XfiMq3wccxsG7ku3XacapwT4FSndfP0rXF50vOyu7i4/y
 TrKg==
X-Gm-Message-State: ANhLgQ0bdr1IWmEJyQwwPIaNfiXTtfEXqTU4iBb5Y5z5IQ7DNgyI5vd+
 dJfXZnF4DGpIONilgejUnag=
X-Google-Smtp-Source: ADFU+vvCITbN/jgqfAHTW4GEJzjWjtUzEGnY8Gksa/EjYHKp9ufrbjJ1E03okV+xVPt7OOVh9jI1dA==
X-Received: by 2002:a2e:9ac5:: with SMTP id p5mr5386486ljj.200.1584021837662; 
 Thu, 12 Mar 2020 07:03:57 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru.
 [94.29.39.224])
 by smtp.googlemail.com with ESMTPSA id c22sm21261599lfi.41.2020.03.12.07.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2020 07:03:57 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] drm/tegra: dc: Silence RGB output deferred-probe
 error
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200308223809.23549-1-digetx@gmail.com>
 <20200308223809.23549-3-digetx@gmail.com> <20200312093353.GB1199023@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d2f72b22-59d1-ed0e-c22c-756091723415@gmail.com>
Date: Thu, 12 Mar 2020 17:03:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312093353.GB1199023@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 13 Mar 2020 08:00:36 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTIuMDMuMjAyMCAxMjozMywgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBNb24sIE1h
ciAwOSwgMjAyMCBhdCAwMTozODowOUFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IERyaXZlciBmYWlscyB0byBwcm9iZSB3aXRoIC1FUFJPQkVfREVGRVIgaWYgZGlzcGxheSBvdXRw
dXQgaXNuJ3QgcmVhZHkKPj4geWV0LiBUaGlzIHByb2R1Y2VzIGEgYml0IG5vaXN5IGVycm9yIG1l
c3NhZ2UgaW4gS01TRyBkdXJpbmcga2VybmVsJ3MgYm9vdAo+PiB1cCBvbiBUZWdyYTIwIGFuZCBU
ZWdyYTMwIGJlY2F1c2UgUkdCIG91dHB1dCB0ZW5kcyB0byBiZSBwcm9iZWQgZWFybGllcgo+PiB0
aGFuIGEgY29ycmVzcG9uZGluZyB2b2x0YWdlIHJlZ3VsYXRvciBkcml2ZXIuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBk
cml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYyB8IDYgKysrKystCj4+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdGVncmEvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jCj4+IGluZGV4
IDU2ZDkzM2U4MTc5Ny4uZDdmMmM0NjU0YjZiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvZGMuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwo+PiBAQCAt
MjU3MSw3ICsyNTcxLDExIEBAIHN0YXRpYyBpbnQgdGVncmFfZGNfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPj4gIAo+PiAgCWVyciA9IHRlZ3JhX2RjX3JnYl9wcm9iZShkYyk7
Cj4+ICAJaWYgKGVyciA8IDAgJiYgZXJyICE9IC1FTk9ERVYpIHsKPj4gLQkJZGV2X2VycigmcGRl
di0+ZGV2LCAiZmFpbGVkIHRvIHByb2JlIFJHQiBvdXRwdXQ6ICVkXG4iLCBlcnIpOwo+PiArCQlp
ZiAoZXJyID09IC1FUFJPQkVfREVGRVIpCj4+ICsJCQlkZXZfZGJnKCZwZGV2LT5kZXYsICJSR0Ig
b3V0cHV0IHByb2JlIGRlZmVycmVkXG4iKTsKPj4gKwkJZWxzZQo+PiArCQkJZGV2X2VycigmcGRl
di0+ZGV2LCAiZmFpbGVkIHRvIHByb2JlIFJHQiBvdXRwdXQ6ICVkXG4iLAo+PiArCQkJCWVycik7
Cj4+ICAJCXJldHVybiBlcnI7Cj4+ICAJfQo+IAo+IEknZCBwcmVmZXIgaWYgd2UgaGFkIGp1c3Qg
YSBzaW5nbGUgbWVzc2FnZSBhbmQgb25seSBkaWZmZXJlbnRpYXRlIG9uIHRoZQo+IGtlcm5lbCBt
ZXNzYWdlIGxldmVsLCBzb21ldGhpbmcgbW9yZSBhbG9uZyB0aGVzZSBsaW5lczoKPiAKPiAJaWYg
KGVyciA8IDAgJiYgZXJyICE9IC1FTk9ERVYpIHsKPiAJCWNvbnN0IGNoYXIgKmxldmVsID0gS0VS
Tl9FUlI7Cj4gCj4gCQlpZiAoZXJyID09IC1FUFJPQkVfREVGRVIpCj4gCQkJbGV2ZWwgPSBLRVJO
X0RFQlVHOwo+IAo+IAkJZGV2X3ByaW50ayhsZXZlbCwgZGMtPmRldiwgImZhaWxlZCB0byBwcm9i
ZSBSR0Igb3V0cHV0OiAlZFxuIiwKPiAJCQkgICBlcnIpOwo+IAkJcmV0dXJuIGVycjsKPiAJfQo+
IAo+IERvIHlvdSBtaW5kIGlmIEkgc3F1YXNoIHRoYXQgaW50byB5b3VyIHBhdGNoPwoKSSBkb24n
dCBtaW5kLCB0aGFua3MgOikKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
