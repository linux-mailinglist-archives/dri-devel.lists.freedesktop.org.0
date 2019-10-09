Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB0AD1CD9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 01:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49836EA69;
	Wed,  9 Oct 2019 23:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3326EA69
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 23:31:32 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id k20so3305324oih.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 16:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=To7sz3Pj+9D426NllUrSBfEbVe/N6dxbVkGeiJMXZFI=;
 b=aiIZ4C3IFhXB3Hure+oW+3wdScDYaBzUcU+tRxoA3Zsi6Uc/WsztTrnpOVAZlI2OKS
 J1YQzWawsK2nAJ8TKpA+HbdofibhX2wEkJN1cgrcKGBX294MBJ+RoSSizxCRGmWWmZFE
 IVqzsk18U59OUQaQOVYoEDm5MnIhG1X2JN/7dc1jmGK4B2J4hUbdV7ZKGafqUUt3gO6k
 88tVtXCuvAhLrQa2dGcatdzCX9lNxojnBMIHHWFoEO+2izy7+xvMG6nJZWGMJQnij2ru
 4/OlNw1ogO8jERDrM3qHniasdjsriPneD4z+67Wk+DXWHchC7wjDweCaerzJosZJ+E+U
 JWNg==
X-Gm-Message-State: APjAAAWM5YQLax/gCqkL876VqVR3pAnjLjhfA6Z3nD2xlNRyv6Eewmto
 NFKpLDES2kt1VgKpAz5/bw==
X-Google-Smtp-Source: APXvYqxdZH4Yv74xeDd6uJYTvrlMrf1KIaK0glfrQqoyHvMw957Vce44h0eFAO0IDUshuR+cc81VWA==
X-Received: by 2002:a05:6808:689:: with SMTP id
 k9mr4959453oig.117.1570663891350; 
 Wed, 09 Oct 2019 16:31:31 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r7sm1125101oih.41.2019.10.09.16.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 16:31:30 -0700 (PDT)
Date: Wed, 9 Oct 2019 18:31:30 -0500
From: Rob Herring <robh@kernel.org>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH V4 2/3] dt-bindings: Add Logic PD Type 28 display panel
Message-ID: <20191009233130.GA1002@bogus>
References: <20191001233923.16514-1-aford173@gmail.com>
 <20191001233923.16514-5-aford173@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191001233923.16514-5-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, adam.ford@logicpd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-omap@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDY6Mzk6MjJQTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3Rl
Ogo+IFRoaXMgcGF0Y2ggYWRkcyBkb2N1bWVudGF0aW9uIG9mIGRldmljZSB0cmVlIGJpbmRpbmdz
IGZvciB0aGUgV1ZHQSBwYW5lbAo+IExvZ2ljIFBEIFR5cGUgMjggZGlzcGxheS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KPiAtLS0KPiBWNDogIFVw
ZGF0ZSBwZXIgUm9iIEgncyBzdWdnZXN0aW9ucyBhbmQgY29weSBvdGhlciBwYW5lbCB5YW1sIGV4
YW1wbGUgZnJvbSA1LjQtcmMxCj4gVjM6ICBDb3JyZWN0IGJ1aWxkIGVycm9ycyBmcm9tICdtYWtl
IGR0X2JpbmRpbmdfY2hlY2snCgpUaGUgZXhhbXBsZSBzdGlsbCBmYWlscyB0byBidWlsZCBoZXJl
LgoKPiBWMjogIFVzZSBZQU1MIGluc3RlYWQgb2YgVFhUIGZvciBiaW5kaW5nCj4gCj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2xv
Z2ljcGQsdHlwZTI4LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9sb2dpY3BkLHR5cGUyOC55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwMDAuLmUyYzYyZThmMWRiNAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9sb2dpY3BkLHR5
cGUyOC55YW1sCj4gQEAgLTAsMCArMSw0MiBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL2xvZ2ljcGQsdHlwZTI4LnlhbWwjCj4gKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0
bGU6IExvZ2ljIFBEIFR5cGUgMjggNC4zIiBXUVZHQSBURlQgTENEIHBhbmVsCj4gKwo+ICttYWlu
dGFpbmVyczoKPiArICAtIEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPgo+ICsKPiArYWxs
T2Y6Cj4gKyAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMKPiArCj4gK3Byb3BlcnRpZXM6Cj4g
KyAgY29tcGF0aWJsZToKPiArICAgIGNvbnN0OiBsb2dpY3BkLHR5cGUyOAo+ICsKPiArICBwb3dl
ci1zdXBwbHk6IHRydWUKPiArICBlbmFibGUtZ3Bpb3M6IHRydWUKPiArICBiYWNrbGlnaHQ6IHRy
dWUKPiArICBwb3J0OiB0cnVlCj4gKwo+ICtyZXF1aXJlZDoKPiArICAtIGNvbXBhdGlibGUKPiAr
Cj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8
Cj4gKyAgICBsY2QwOiBkaXNwbGF5IHsKPiArICAgICAgY29tcGF0aWJsZSA9ICJsb2dpY3BkLHR5
cGUyOCI7Cj4gKyAgICAgIGVuYWJsZS1ncGlvcyA9IDwmZ3BpbzUgMjcgR1BJT19BQ1RJVkVfSElH
SD47Cj4gKyAgICAgIGJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKPiArICAgICAgcG9ydCB7Cj4g
KyAgICAgICAgbGNkX2luOiBlbmRwb2ludCB7Cj4gKyAgICAgICAgICByZW1vdGUtZW5kcG9pbnQg
PSA8JmRwaV9vdXQ+Owo+ICsgICAgICAgIH07Cj4gKyAgICAgIH07Cj4gKyAgICB9Owo+ICsKPiAr
Li4uCj4gLS0gCj4gMi4xNy4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
