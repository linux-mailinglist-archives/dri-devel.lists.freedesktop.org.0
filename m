Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5861BBAFD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 12:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F416E357;
	Tue, 28 Apr 2020 10:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4D16E357
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 10:17:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z6so2224696wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 03:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=eV+Th5BniRPcPDXkhwyuSN3cWP7lFrktIHIPo7qrlrI=;
 b=XW1GVGsXY80vV9DGRufEmge0H/eu4FI2dVz4xVST2VJPpwHCI+o+ddaLSy2ba5Hdkb
 iuzJp9SdjDDShZQbQuoBoLj0oJsrsqCBxY6Muw7u+ucBbcK5xBtYMI8M8Ai1CZNYSaOk
 C+bOa6xklbijjdm1mTD/XE2UyPcEXhuKTmAzFTr6zFYpo3ApuM5+g/dZB7qhS8P2gQiw
 2o//7/l9Vl8nr2/BQyOW4z0QDI6NIx6F1w1MiLc1Xg3zkl++9G1nezfF6luc8TSi9mXu
 BJLFzjvv4Y+rer9w6mmFQ+0vrLQxmpNOBepAvsq1Rsip66ShlAcn6dURnGimeTrE9yS8
 hljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=eV+Th5BniRPcPDXkhwyuSN3cWP7lFrktIHIPo7qrlrI=;
 b=BseUfN/qV4o6EDhexLqrQDgeWKMPXZLtKZgj36PM9YukXbjBhaLtHeZPKh5TCCwZT/
 w3INk3IjTj4OolPqinze7DlMPdufFG5cBbNTGylRvOmJTXy9Kr6tsj2D2w/oyLbbQVbJ
 kV3Dp3F/oUBxNnw9STuG/qk/SPNsQf9rmNsKv6QT0MCNzwRXPAncHIpZzZIhO8eAeJ8H
 +jiyA7Zwkca4xxxwkxq0u7NWRoQlIygO9s2fXSLU5mcLbJummf3ghz/FotyOlEiGgxLt
 ebdkEhcE4YpK/oFwBzlZZGI/pj8fDKg7TveV0tAJDANSdTF3MEgiW4jEdC/VLIEhDOCG
 NNwA==
X-Gm-Message-State: AGi0PuYq3swe3yvDNx5VXg5/vwu61sX/iFwj9mUe9obIZqXRQvZafYoQ
 osRdKoYhiEx5+KZiP7eVi9MV6A==
X-Google-Smtp-Source: APiQypIhzI9nKz44SYFmbAjDlx51uIBdA+B/YRligLSbLzuaLGU6jAYkbx4GpfVkznPLFTaFXUJ2kA==
X-Received: by 2002:a05:600c:220c:: with SMTP id
 z12mr3706794wml.84.1588069055751; 
 Tue, 28 Apr 2020 03:17:35 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id 185sm3055694wmc.32.2020.04.28.03.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 03:17:35 -0700 (PDT)
Date: Tue, 28 Apr 2020 11:17:33 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V6 3/4] backlight: qcom-wled: Add WLED5 bindings
Message-ID: <20200428101733.GO3559@dell>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-4-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587656017-27911-4-git-send-email-kgunda@codeaurora.org>
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMyBBcHIgMjAyMCwgS2lyYW4gR3VuZGEgd3JvdGU6Cgo+IEFkZCBXTEVENSBzcGVj
aWZpYyBiaW5kaW5ncy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLaXJhbiBHdW5kYSA8a2d1bmRhQGNv
ZGVhdXJvcmEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFN1YmJhcmFtYW4gTmFyYXlhbmFtdXJ0aHkg
PHN1YmJhcmFtQGNvZGVhdXJvcmEub3JnPgo+IEFja2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRh
bmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbGVkcy9iYWNr
bGlnaHQvcWNvbS13bGVkLnlhbWwgICAgICAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysrLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpOZWVk
cyBhIERUIEFjay4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRl
Y2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
