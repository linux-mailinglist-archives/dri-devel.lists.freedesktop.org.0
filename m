Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 913192A641A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 13:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80146ECF2;
	Wed,  4 Nov 2020 12:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC62882D0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 10:49:19 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id o13so14147614ljj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 02:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hW9JciFa2DMWNwaN8kCGLx85t5PIMbOk3IaZH3qou+A=;
 b=Q5pwsc4CIjBxOiXbSFkw5Dl/kuHxM5HDSgOHCjpUtbrGAALGo8K1fD7gOTqLKFCAmm
 MFVeiKOG2tUB8iv2hhg8ZSBaDI5vPNfissEl0aXiKtostfXerKPvm5ob2PyCeotWCmL3
 dkTHzG8ZkgpbrBy7umJzKVIHdWfPAKm3bf03idMqvClQvPIYDAjySacuItkuc4KZ/BJA
 8hlFWHpYVsyodU/dI4b9KCPK+WKN6ZaQXfZ1ci9LfAwLo4qYgLSY5DirgxoK1w97IMbB
 NToV3J/yOgd7+bgodp1FZ43G7KVWke5dpIUfZekhdAjrMg/++BIhjSQRy1bcrbTMAJWy
 BSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hW9JciFa2DMWNwaN8kCGLx85t5PIMbOk3IaZH3qou+A=;
 b=qhj1ydCZuKEF4nOwXi3WsDdKbGUIFpNgZSpQQLt3SXGTlkPX47TIR0S7fdlL+Kf0HC
 nrK3hCBCiXEMjyY/C1GbWTl45FIK+nggYlplxh8163KSqK5qPJroZonOMJgi6WC0P2KE
 5G50dU3fsYLJ4fZIod8JqzDOlLGJCs39sFh4Z0bWU9BonxA57wQXPmktS9gYH/Pzx1Zh
 KinSjrcLjF53Qud+BGp2ToBGYQwzBODbG9sQccXx6pr0BEIJk2SwdLMiX9s9/HQ8JxM3
 m9IK8QNXXfzD3BsJ3ajWiwimHgnaHGXKlJyFnMC+UBghCoIBs9gQDhPUZSB5+EsA44uz
 OAWg==
X-Gm-Message-State: AOAM533epfbaVcO4GsfZ6kXD56xTCt+pOJP6K1WjfiYgjli6mqo+VcXq
 CqDFCLtt6JcVBMfPssiuc70=
X-Google-Smtp-Source: ABdhPJzzLUKlILds5RKowUnpmArH4wHItQ9txy25FaUm1y8574Xkf4n6JLnrEn8ms7n5JDphgTdq0Q==
X-Received: by 2002:a2e:9cc9:: with SMTP id g9mr10866780ljj.20.1604486957372; 
 Wed, 04 Nov 2020 02:49:17 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.googlemail.com with ESMTPSA id w29sm19857lfc.49.2020.11.04.02.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 02:49:16 -0800 (PST)
Subject: Re: [PATCH V2] drm/tegra: sor: Don't warn on probe deferral
To: Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20201104092328.659169-1-jonathanh@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <420d8e9e-47d5-0d46-a774-a47bcb52bdeb@gmail.com>
Date: Wed, 4 Nov 2020 13:49:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201104092328.659169-1-jonathanh@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 04 Nov 2020 12:19:32 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDQuMTEuMjAyMCAxMjoyMywgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+IERlZmVycmVkIHByb2Jl
IGlzIGFuIGV4cGVjdGVkIHJldHVybiB2YWx1ZSBmb3IgdGVncmFfb3V0cHV0X3Byb2JlKCkuCj4g
R2l2ZW4gdGhhdCB0aGUgZHJpdmVyIGRlYWxzIHdpdGggaXQgcHJvcGVybHksIHRoZXJlJ3Mgbm8g
bmVlZCB0byBvdXRwdXQKPiBhIHdhcm5pbmcgdGhhdCBtYXkgcG90ZW50aWFsbHkgY29uZnVzZSB1
c2Vycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNv
bT4KPiAtLS0KPiAKPiBDaGFuZ2VzIHNpbmNlIFYxOgo+IC0gVGhpcyB0aW1lLCBJIGFjdHVhbGx5
IHZhbGlkYXRlZCBpdCEKPiAKPiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jIHwgNyArKyst
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyBiL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9zb3IuYwo+IGluZGV4IGU4OGExN2MyOTM3Zi4uODk4YTgwY2EzN2ZhIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9zb3IuYwo+IEBAIC0zNzY0LDEwICszNzY0LDkgQEAgc3RhdGljIGludCB0ZWdy
YV9zb3JfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlyZXR1cm4gZXJy
Owo+ICAKPiAgCWVyciA9IHRlZ3JhX291dHB1dF9wcm9iZSgmc29yLT5vdXRwdXQpOwo+IC0JaWYg
KGVyciA8IDApIHsKPiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gcHJvYmUgb3V0
cHV0OiAlZFxuIiwgZXJyKTsKPiAtCQlyZXR1cm4gZXJyOwo+IC0JfQo+ICsJaWYgKGVyciA8IDAp
Cj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgZXJyLAo+ICsJCQkJICAgICAi
ZmFpbGVkIHRvIHByb2JlIG91dHB1dDogJWRcbiIsIGVycik7CgpIZWxsbyBKb24sCgpUaGVyZSBp
cyBubyBuZWVkIHRvIGR1cGxpY2F0ZSB0aGUgZXJyb3IgY29kZSBpbiB0aGUgbWVzc2FnZSBbMV0u
IFBlcmhhcHMKd29ydGggbWFraW5nIGEgdjM/IDopCgpbMV0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvdjUuMTAtcmMyL3NvdXJjZS9kcml2ZXJzL2Jhc2UvY29yZS5jI0w0MjQwCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
