Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 606F6CBD7C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 16:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39116EBB5;
	Fri,  4 Oct 2019 14:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8149D6EBB5
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 14:38:53 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y135so9778339wmc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 07:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=YJvih0AsR33ViZwBb015+RycjOZ9btNkziiHqgTe20E=;
 b=lAw8xE5Lsq/PM5ptskipzv8KcmqTVeOsZpLyWmFTcvWzSXuhscxTIYvjVzAio5nsht
 MC8dMldzegDraRAxbGO0BZ1nYPdgqFGYz1nnBOk4hde+aLrqOTnIv6Y3tPAHwOVF9yP+
 pxS2yRf3uAA203kRBRtKeledj9iPzTEvcBjVgM0BEGC4I7FsTSYu0AaHDXUsCx4hlJkA
 k+teDNF+nzTCU8gaWU2QR/afwkptR+lsauPfQrCNPlaXhxre4doEOxFhcwfDI3MERTaI
 nw6Xb4JluFWj4EpnOeVCtxgBMErqwtoSI7smaZ9Su86BGFI2xYAPNR5KfnI6c6pt8plV
 0HhA==
X-Gm-Message-State: APjAAAV9awBMn+xFMeyJ9QTqe7cXOHtTrPVYZKQcCRqDTU9FFh3bGROX
 03h/pJXwU/DbjM9UKAWcyJnJSQ==
X-Google-Smtp-Source: APXvYqxaIbrB05oPH5diNroquYYUcFG0Ky2cGHUBNsZqv03BqdPWyrc1uWBrIKxtW+c3tbw7CrOe/g==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr10801719wmi.106.1570199932083; 
 Fri, 04 Oct 2019 07:38:52 -0700 (PDT)
Received: from dell ([2.27.167.122])
 by smtp.gmail.com with ESMTPSA id o19sm10233542wmh.27.2019.10.04.07.38.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 04 Oct 2019 07:38:51 -0700 (PDT)
Date: Fri, 4 Oct 2019 15:38:50 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v7 4/5] dt-bindings: backlight: Add led-backlight binding
Message-ID: <20191004143850.GN18429@dell>
References: <20190918145730.22805-1-jjhiblot@ti.com>
 <20190918145730.22805-5-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918145730.22805-5-jjhiblot@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=YJvih0AsR33ViZwBb015+RycjOZ9btNkziiHqgTe20E=;
 b=Yu3JokhAmryrtzowEz6R3vPkgY4HM3KIe667y0r7YQ4WcVmxDn1Sty5y59LuwrVZzc
 m52B+kRGFegj76+8YKRGb5o/DEcFlBpf+7D4ibju5O55VReLIZvH9zcJY4YXm+6GAS60
 9kOTmyKpxxXU+NCumlcbF75BHw3QTClcKtMIXgWN9IFrgQ0F+3Pke17pO0WuqRkgs1aJ
 CEs/JNYIw4K0FfBn/hgjXUdMs8wViWxrXED4l5RRLIXuL0mCG7PCoJqfTUch5PUFr1w5
 wMjWLf9SdLaije47D8IuJM07zmvo4t3afOctbaOOYe/gfmHIDHKtj5nRfYzc2A+KmhcQ
 ecVw==
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tomi.valkeinen@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOCBTZXAgMjAxOSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKCj4gQWRkIERU
IGJpbmRpbmcgZm9yIGxlZC1iYWNrbGlnaHQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmVhbi1KYWNx
dWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPgo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBz
b24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbGVk
cy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQgfCAyOCArKysrKysrKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2ts
aWdodC50eHQKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGlu
YXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNv
ZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBC
bG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
