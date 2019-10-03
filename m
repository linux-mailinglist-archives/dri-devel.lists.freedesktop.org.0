Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B5DC9D92
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 13:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E636E99D;
	Thu,  3 Oct 2019 11:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA886E99D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 11:42:48 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q9so2560299wrm.8
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 04:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=jT+9een9mM2KMQc2NI2nr4Y5VakV7H0J0wclQgkUils=;
 b=GUiGLTuGFnIUKRZ+GF3WWql3OSjYiS4BjNu9O9oWRRR5sbvIrUiSv4RdgDUHC4DCRt
 nSSCOCCbnRxxuOK58DGx8+Q/aoBRtxno4QQti0TRKLlgRbTNWO+BpgEhwS6oAufoGt4q
 grSIy6NKpjmYcC+1imPFIZ8eMn9O//3l5Nxz+9fcYGV+LrbUhcNFOINqqqjhzFBpyJv2
 TmRE5IBew0mdOD2GRtBJMqcPAuC4a17DVhCvR6V1Q9SP94pRajhEQUSkEisK7ofxzdXE
 Xby8cj+Crzf9oa3yYXj40yx7zgFhGJ+WCfR1pWaQxmXkq1QCp7aVqXBqYIYDPZ3S2WWp
 hNxg==
X-Gm-Message-State: APjAAAXE7yAdFbipLwcCU5LOOe80C3D0/fWFI0i6VAIQX0nRAKt7K1dT
 AaW0BgrmXu0GwwWS6PJUjCGj7Q==
X-Google-Smtp-Source: APXvYqz82V76dcSOpmIIaTo777Rc74WPo1TLzktFeak8EAx8pWm//EW5b77wEGmszSGc+Q2Gg+GDIw==
X-Received: by 2002:a5d:6704:: with SMTP id o4mr6839593wru.365.1570102966533; 
 Thu, 03 Oct 2019 04:42:46 -0700 (PDT)
Received: from dell ([2.27.167.122])
 by smtp.gmail.com with ESMTPSA id 36sm3014735wrp.30.2019.10.03.04.42.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Oct 2019 04:42:46 -0700 (PDT)
Date: Thu, 3 Oct 2019 12:42:42 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v4 2/2] backlight: lm3630a: Add an enable gpio for the
 HWEN pin
Message-ID: <20191003114242.GE21172@dell>
References: <20190912213257.24147-1-andreas@kemnade.info>
 <20190912213257.24147-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190912213257.24147-3-andreas@kemnade.info>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=jT+9een9mM2KMQc2NI2nr4Y5VakV7H0J0wclQgkUils=;
 b=fwQKUaUFQ6a/78eZtJv4rTrh8NiDMuR7wU5XIhUa32e5TXH0+uEfqBrFFkdozLykq1
 GQSrne3+R37jhPKfIGFJf311r73w02PYfez7FjwTcAvND4U6++vYOlaw9c7WX4E2oyY2
 nikycED8a/vkMoQonBwpaQpGZVVqHZtSoxd6HWOawqobtNEPaBTphaIe8FghuMyKs8M7
 Si1Ey/dynw5twF+TVb6+G/a0w5QVMtNTUe+ZkLXqRKR5eM/AqOW7nzpR5fVSezqZ8q7p
 32T39Ez4eEhSJ4vkH30VuovExTH5yDqeqWSaWP4tiMu+75u2sBIPXVp+uzQum8/3hiUN
 VJwg==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMiBTZXAgMjAxOSwgQW5kcmVhcyBLZW1uYWRlIHdyb3RlOgoKPiBGb3Igbm93IGp1
c3QgZW5hYmxlIGl0IGluIHRoZSBwcm9iZSBmdW5jdGlvbiB0byBhbGxvdyBJMkMKPiBhY2Nlc3Mu
IERpc2FibGluZyBhbHNvIG1lYW5zIHJlc2V0dGluZyB0aGUgcmVnaXN0ZXIgdmFsdWVzCj4gdG8g
ZGVmYXVsdCBhbmQgYWNjb3JkaW5nIHRvIHRoZSBkYXRhc2hlZXQgZG9lcyBub3QgZ2l2ZQo+IHBv
d2VyIHNhdmluZ3MuCj4gCj4gVGVzdGVkIG9uIEtvYm8gQ2xhcmEgSEQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmVhcyBLZW1uYWRlIDxhbmRyZWFzQGtlbW5hZGUuaW5mbz4KPiBSZXZpZXdlZC1i
eTogRGFuIE11cnBoeSA8ZG11cnBoeUB0aS5jb20+Cj4gUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9t
cHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gLS0tCj4gY2hhbmdlcyBpbiB2MjoK
PiAtIHNpbXBsaWZpY2F0aW9uCj4gLSBjb3JyZWN0IGdwaW8gZGlyZWN0aW9uIGluaXRpYWxpc2F0
aW9uCj4gCj4gY2hhbmdlcyBpbiB2MzoKPiAtIHJlbW92ZWQgbGVnYWN5IGluY2x1ZGUKPiAKPiAg
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jIHwgOSArKysrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBK
b25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZh
Y2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
