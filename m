Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B481120F3C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050E86E804;
	Mon, 16 Dec 2019 16:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809B86E0B9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:22:14 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u2so7370568wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=GnQyCw6x7n+jK/JpwBjmwmwD0/tfdVHGIHYKi0tkEAg=;
 b=yU153rUAiGDMblyab1aLX5Xp3Uw5PYZqTAT8vixm/kZ4L5x7wgHyWk71KcxTeKGeth
 HskWwIi2VauSQ2NDfPFH0JTev1/wTYwIskArt8N1P1tAeS6LBUbbXIKKTNzd8ZyyJpvu
 V1kYKxpVGQz316/1D0zfG3H66S+IM8fVVmzKWkL/0ePtwstdBFP1hgZ/SA/Lj8kJZEwI
 fXeBCSWTtqmSD9SQk/kpov3lOk+co+SuNKs2Ld3MJVYhvWOX8MVA95kbtEYNbQOUTx2h
 Vin/whhGQOylyIQzh+ozGUAp92a3LfIL21EUIstV5LHXz97hBKwX47iZmIutTRpyxpfB
 H0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=GnQyCw6x7n+jK/JpwBjmwmwD0/tfdVHGIHYKi0tkEAg=;
 b=hzkcD/rLziPgmCQ9HDXFrSR1vXmu13Td8gvU9cwCaboy+3HI9l4RC/98Y/h9ZzBvM7
 KkqzSH/HdqnivQ6pgYLZQ8VpWmG4IOrtDDUh8ljpKWN1JC4XcQyfWNIuB9uzqldvnSRN
 p56FjcQ/U5wOdNDhX0q2+lKL48mzNIYnOAP1Zrx798B/VoEe+PVl2+Q0mf2sP68VcktO
 8vdE9MBNrxMfNTLZElRZTg2aBan1+fxZvuPFIv2BGJ9DeBQDGsBLBeeuV3+VLBYPG5Ji
 1jbIz7boHNRITtLMx1aFwU9OTZW1Dhnq5o5Db2FYJT0Ufw25J1Bo+W0zbcCs08GVxjFg
 QACQ==
X-Gm-Message-State: APjAAAV8yQDK2G95m/l8/S2D4hxk1uvTlEHP62zD+XAc/lvhXqqPmE6K
 /LKMg35PneOuy4Afx3ju+wUlew==
X-Google-Smtp-Source: APXvYqwvgRXgwlg/FjNnaLLIZCy6reV92SEVT6xh253ko0RuVtrnL2bgwwuPhxFDXUCM6NeHCChZhA==
X-Received: by 2002:a1c:e289:: with SMTP id z131mr29743147wmg.18.1576513333139; 
 Mon, 16 Dec 2019 08:22:13 -0800 (PST)
Received: from dell ([185.17.149.202])
 by smtp.gmail.com with ESMTPSA id x10sm21920943wrp.58.2019.12.16.08.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 08:22:12 -0800 (PST)
Date: Mon, 16 Dec 2019 16:22:12 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 4/6] mfd: atmel-hlcdc: return in case of error
Message-ID: <20191216162212.GP2369@dell>
References: <1576249496-4849-1-git-send-email-claudiu.beznea@microchip.com>
 <1576249496-4849-5-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576249496-4849-5-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: alexandre.belloni@bootlin.com, bbrezillon@kernel.org, airlied@linux.ie,
 nicolas.ferre@microchip.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com,
 sam@ravnborg.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMyBEZWMgMjAxOSwgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6Cgo+IEZvciBITENEQyB0
aW1pbmcgZW5naW5lIGNvbmZpZ3VyYXRpb25zIGJpdCBBVE1FTF9ITENEQ19TSVAgb2YKPiBBVE1F
TF9ITENEQ19TUiBuZWVkcyB0byBiZSBwb2xsZWQgYmVmb3JlIGFwcGx5aW5nIG5ldyBjb25maWcu
IEluIGNhc2Ugb2YKPiB0aW1lb3V0IHRoZXJlIGlzIG5vIGluZGljYXRvciBhYm91dCB0aGlzLCBz
bywgcmV0dXJuIGluIGNhc2Ugb2YgdGltZW91dAo+IGFuZCBhbHNvIHByaW50IGEgbWVzc2FnZSBh
Ym91dCB0aGlzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJl
em5lYUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9hdG1lbC1obGNkYy5jIHwg
MTUgKysrKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKRm9yIG15IG93biByZWZlcmVuY2U6CiAgQWNrZWQtZm9yLU1GRC1ieTog
TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
