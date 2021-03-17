Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 222E033ECB7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 10:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5276E504;
	Wed, 17 Mar 2021 09:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CFF6E504
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 09:16:03 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z2so1012448wrl.5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 02:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oTL9AJaFLnaIJwp+xH/32TIHC+0/+FSk9wN00bes39U=;
 b=uMXE+VtjZWadyYCebKZ3fIggjz4V1ChdYHWACmzHieC+U5oQgoCuWUExVACd5lgsxw
 w8s4oFwYG2AfLmamwBO9l9q/0TJ0gCkYFIuji6TWH18CtdAPoR6InemljL7TIsIXKRtt
 4A7O7wFyg52FK5pUVZzz0oLvx9BjVIqhabtjd6KLq01ti84V3Jhp4GcEDmBBZ3vOAH1e
 fUDXTKuJbq6ffGadIu8bCA9YpaFqktUqK6fzurFSa82mW9TodOD9yp+4OW+3IXowiWBO
 aa59V0PpQbYGVaH6WRVool0cghcBDK8OnkTMFtqO/nFZAO4i2WcpJTi7t9ouldiPeFE6
 4N9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oTL9AJaFLnaIJwp+xH/32TIHC+0/+FSk9wN00bes39U=;
 b=BGyCoEa2FGyfDCt9Oi624llzfriPqa76krVhEifo26SUw2kwf/F+8eLkU+BeBq4xjW
 tybobcribNFjkjuJQPScd1tK0xnsJvDgTl8xb86kLRS/uP8tt0UclRMjeD07zFksXKUM
 dyt8VNQCptq020YsVlB74Lc+keMosA8spEnHiGehBaLqnFx0X81k3J32tUA/q58838pZ
 9Iq8dPfHqR74CDaPF486WznMAS0mzcOaJTFIRdxiIWf+54fFCZ5I4UwQM2DCydzHuj2v
 m1/Lx7rix29y2L73fwRY+uvYkfbKj1Hu1srJ61AsCwJGMZJ89GPDQ3hU54VDz0K3xB+w
 YpVg==
X-Gm-Message-State: AOAM5320WQxFikz9pPxTMVHW3c2dE2fDQKsyJVF1BpsQ85/BtsgXZJyX
 GmBz/rIiv+rCZ9snQftC9j77Gw==
X-Google-Smtp-Source: ABdhPJzccso7yYfvjZ0BNG+B/bhDroptmdi0xF07T+f0b52aGSdXhB4T8OlAfzgB2MnMHmOq7BNizg==
X-Received: by 2002:a5d:4587:: with SMTP id p7mr3343208wrq.205.1615972562580; 
 Wed, 17 Mar 2021 02:16:02 -0700 (PDT)
Received: from dell ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id p14sm1765900wmc.30.2021.03.17.02.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:16:02 -0700 (PDT)
Date: Wed, 17 Mar 2021 09:16:00 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH] backlight: qcom-wled: Use sink_addr for sync toggle
Message-ID: <20210317091600.GJ701493@dell>
References: <20210314101110.48024-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210314101110.48024-1-marijn.suijten@somainline.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Obeida Shamoun <oshmoun100@googlemail.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAxNCBNYXIgMjAyMSwgTWFyaWpuIFN1aWp0ZW4gd3JvdGU6Cgo+IEZyb206IE9iZWlk
YSBTaGFtb3VuIDxvc2htb3VuMTAwQGdvb2dsZW1haWwuY29tPgo+IAo+IFdMRUQzX1NJTktfUkVH
X1NZTkMgaXMsIGFzIHRoZSBuYW1lIGltcGxpZXMsIGEgc2luayByZWdpc3RlciBvZmZzZXQuCj4g
VGhlcmVmb3JlLCB1c2UgdGhlIHNpbmsgYWRkcmVzcyBhcyBiYXNlIGluc3RlYWQgb2YgdGhlIGN0
cmwgYWRkcmVzcy4KPiAKPiBUaGlzIGZpeGVzIHRoZSBzeW5jIHRvZ2dsZSBvbiB3bGVkNCwgd2hp
Y2ggY2FuIGJlIG9ic2VydmVkIGJ5IHRoZSBmYWN0Cj4gdGhhdCBhZGp1c3RpbmcgYnJpZ2h0bmVz
cyBub3cgd29ya3MuCj4gCj4gSXQgaGFzIG5vIGVmZmVjdCBvbiB3bGVkMyBiZWNhdXNlIHNpbmsg
YW5kIGN0cmwgYmFzZSBhZGRyZXNzZXMgYXJlIHRoZQo+IHNhbWUuICBUaGlzIGFsbG93cyBhZGp1
c3RpbmcgdGhlIGJyaWdodG5lc3Mgd2l0aG91dCBoYXZpbmcgdG8gZGlzYWJsZQo+IHRoZW4gcmVl
bmFibGUgdGhlIG1vZHVsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPYmVpZGEgU2hhbW91biA8b3No
bW91bjEwMEBnb29nbGVtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBLb25yYWQgRHliY2lvIDxr
b25yYWQuZHliY2lvQHNvbWFpbmxpbmUub3JnPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmlqbiBTdWlq
dGVuIDxtYXJpam4uc3VpanRlbkBzb21haW5saW5lLm9yZz4KPiAtLS0KPiAgZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvcWNvbS13bGVkLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9u
ZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2Vz
CkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cg
TGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
