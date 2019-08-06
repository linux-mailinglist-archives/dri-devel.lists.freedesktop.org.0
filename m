Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15283951
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 21:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F2789932;
	Tue,  6 Aug 2019 19:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FE489930;
 Tue,  6 Aug 2019 19:04:50 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p74so79246094wme.4;
 Tue, 06 Aug 2019 12:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H2Cunc+Unwf7KU+04domOtpvjoHMaWW2nIlPjO6jjTE=;
 b=IvOb36FZRBsXRnGwYaMH8soHeQN7IAHSGgpuwIKdTEhkAQazapnqnVoEBHj4h+zXY1
 9HSLFCuqPrFBRM9s8l/FopQKgIGx53biRJGXNKsIP85wBgaNmqh5ivsmMJWaOLkc3I30
 Zd6mUrJpbEuQIYhcFproJpCjpEa/avZ65JwFLc04XxU7UQcJ2GAYbE4U2sZ0rSBKcZ7m
 h0tBQpwQdo4fkaun5Isl70qakck6JAAwGj1uE6phaBZC8u2jK/0UUWEOhn6942SEElmL
 rVhNdcDO77w6ktwnFk9kc+9SwFUF4AsW1SfTTjPpFBsn7TUwj+6Sgx4FnJ7pxocpYVSf
 LDVA==
X-Gm-Message-State: APjAAAXuzzFPQ6Uj+qoH+uzPmZf0QLkjxT9WWKAeHLFpJktusaLWFVQh
 WXrunmysXQDBjR8kD+xh1hKb/yCQHLVSVOTAKac=
X-Google-Smtp-Source: APXvYqxt13CUFdoIsvF7s1UaYB4shCev9jOY+/A5iMYNG4jYXaQRzQ0A6X4y2qH2KhLwYuXooFHWxN94IO01gg/JqIo=
X-Received: by 2002:a7b:c751:: with SMTP id w17mr6322996wmk.127.1565118288585; 
 Tue, 06 Aug 2019 12:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_OL1+bJUGh44AY48DP=G=xTtdrf+kO2233qjJzudWhw_Q@mail.gmail.com>
 <20190806174549.7856-1-harry.wentland@amd.com>
In-Reply-To: <20190806174549.7856-1-harry.wentland@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Aug 2019 15:04:36 -0400
Message-ID: <CADnq5_NLTOQ31XXhw3o8aoJkRmzq6guurgUz13cxKD6U6M90Cw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Add number of slices per line to DSC
 parameter validation
To: Harry Wentland <harry.wentland@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=H2Cunc+Unwf7KU+04domOtpvjoHMaWW2nIlPjO6jjTE=;
 b=BN6fTSTygoPjeCrvFUr+x4oz3yZvMdv1eG7K80Zk+VtKyHCKONyDXzLIi4SnpqyZjw
 8h2NKM38bkah9qUw9o+RETqEthm/8Dtf2DeewNDMxSSHR4EnJq5UMweNpx/6UysDkqEH
 GkkdkaXwmSvZEyLvnywl3/+vUHht6/p1JYfUHAd/jMh8Apfyo3/AETHY5OZvxy3uyVRx
 PEVi3gcqWN71WUijLkEYMXJsPjJOue5fM5bn54pAnvTfvwvWVSZa7WfJfZrdrYoDUipZ
 5ezCyTXq7qXijKhI1VQP1YyNXygcBJu5KcZrWVsFYqD0VmeWgWPuJYMIa9gUo/gUi2fS
 SZuw==
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
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, Dave Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxOjQ1IFBNIEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50
bGFuZEBhbWQuY29tPiB3cm90ZToKPgo+IEZyb206IE5pa29sYSBDb3JuaWogPG5pa29sYS5jb3Ju
aWpAYW1kLmNvbT4KPgo+IFt3aHldCj4gTnVtYmVyIG9mIHNsaWNlcyBwZXIgbGluZSB3YXMgbWlz
dGFrZW5seSBsZWZ0IG91dAo+Cj4gQ2M6IEhhcmlwcmFzYWQgS2VsYW0gPGhhcmlwcmFzYWQua2Vs
YW1AZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE5pa29sYSBDb3JuaWogPG5pa29sYS5jb3Ju
aWpAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxh
bmRAYW1kLmNvbT4KPiBSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5k
QGFtZC5jb20+CgpBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgoKPiAtLS0KPgo+IFRoYW5rcywgSGFyaXByYXNhZCwgZm9yIHlvdXIgcGF0Y2guIFRoZSBz
ZWNvbmQgY29uZGl0aW9uIHNob3VsZCBhY3R1YWxseSBjaGVjawo+IGZvciBudW1fc2xpY2VzX2gu
Cj4KPiBIYXJyeQo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9kc2MuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX2RzYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2Rj
bjIwX2RzYy5jCj4gaW5kZXggZTg3MGNhYThkNGZhLi5hZGI2OWMwMzhlZmIgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jCj4gQEAg
LTMwMiw3ICszMDIsNyBAQCBzdGF0aWMgYm9vbCBkc2NfcHJlcGFyZV9jb25maWcoc3RydWN0IGRp
c3BsYXlfc3RyZWFtX2NvbXByZXNzb3IgKmRzYywgY29uc3Qgc3RydQo+ICAgICAgICAgICAgICAg
ICAgICAgZHNjX2NmZy0+ZGNfZHNjX2NmZy5saW5lYnVmX2RlcHRoID09IDApKSk7Cj4gICAgICAg
ICBBU1NFUlQoOTYgPD0gZHNjX2NmZy0+ZGNfZHNjX2NmZy5iaXRzX3Blcl9waXhlbCAmJiBkc2Nf
Y2ZnLT5kY19kc2NfY2ZnLmJpdHNfcGVyX3BpeGVsIDw9IDB4M2ZmKTsgLy8gNi4wIDw9IGJpdHNf
cGVyX3BpeGVsIDw9IDYzLjkzNzUKPgo+IC0gICAgICAgaWYgKCFkc2NfY2ZnLT5kY19kc2NfY2Zn
Lm51bV9zbGljZXNfdiB8fCAhZHNjX2NmZy0+ZGNfZHNjX2NmZy5udW1fc2xpY2VzX3YgfHwKPiAr
ICAgICAgIGlmICghZHNjX2NmZy0+ZGNfZHNjX2NmZy5udW1fc2xpY2VzX3YgfHwgIWRzY19jZmct
PmRjX2RzY19jZmcubnVtX3NsaWNlc19oIHx8Cj4gICAgICAgICAgICAgICAgICEoZHNjX2NmZy0+
ZGNfZHNjX2NmZy52ZXJzaW9uX21pbm9yID09IDEgfHwgZHNjX2NmZy0+ZGNfZHNjX2NmZy52ZXJz
aW9uX21pbm9yID09IDIpIHx8Cj4gICAgICAgICAgICAgICAgICFkc2NfY2ZnLT5waWNfd2lkdGgg
fHwgIWRzY19jZmctPnBpY19oZWlnaHQgfHwKPiAgICAgICAgICAgICAgICAgISgoZHNjX2NmZy0+
ZGNfZHNjX2NmZy52ZXJzaW9uX21pbm9yID09IDEgJiYgLy8gdjEuMSBsaW5lIGJ1ZmZlciBkZXB0
aCByYW5nZToKPiAtLQo+IDIuMjIuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
