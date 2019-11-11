Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C2EF7092
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 10:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB90F6E86D;
	Mon, 11 Nov 2019 09:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931B86E86D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 09:25:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f2so13714467wrs.11
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 01:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=4p0qtiatlV0SP4T6lSPVHVPXlgHULFnSfHizAyGU0hg=;
 b=BKACfwHL+Z0o+tcvrSsbIz5t60zfgl1n2bm6TaXxI7qlBgxLu/D6FvfQu38hQxhqLk
 6NNTHDs1y6GXaOaObs9FbYGSRO2LY2uRmNFIQGXBmOYLjhcN5A8UNyNCWBzveh/t/bSA
 VvMSJuoLCrxWXasol5ZUOTgJ3KSCF74dAP0WkcddS/OFypRxyvNpoSmmiALcxp1r9yjY
 7GZ/s5tLQ9cA4gafuN6AIGhntFvcjf/AqL5bx6ZflVopou/z+b08sc0djUAc/6n33UjA
 RxkFNJlKVzZRjSCrVBu119x7a35FHdzbCMZsxsJBsUq3vBkyP1f2WSBGDUvq3W97QFk4
 qNmQ==
X-Gm-Message-State: APjAAAVqcyTOSy5Ds1xqbowrS0Kq+foUZN5oOTk6T8f3OfIQiJuHzTWC
 S2KDzbkAg9abvl7fguXTiSpiew==
X-Google-Smtp-Source: APXvYqz33HioT48RXV/AkDamtjCdumAIK3ppi3Q+UqUVT538LwYEY3/vW7NqUhgVByAGLe4va+taaA==
X-Received: by 2002:adf:fa4a:: with SMTP id y10mr15491628wrr.177.1573464337262; 
 Mon, 11 Nov 2019 01:25:37 -0800 (PST)
Received: from dell ([95.147.198.88])
 by smtp.gmail.com with ESMTPSA id c144sm17688792wmd.1.2019.11.11.01.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 01:25:36 -0800 (PST)
Date: Mon, 11 Nov 2019 09:25:29 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V10 6/8] backlight: qcom-wled: Add support for WLED4
 peripheral.
Message-ID: <20191111092529.GT18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-7-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572589624-6095-7-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=4p0qtiatlV0SP4T6lSPVHVPXlgHULFnSfHizAyGU0hg=;
 b=XRCUl0ntONH7UguamnyewxwL8FNRl5jKFpvkjL2XRuqeAejncL98iTV2xLCkpWbQSr
 xBN25JtyymE8a0XBGrYbJI5pHr8jvfi0oM24AqCtNC6LxJle9FvadHt/1gNdE3v0GMOu
 PtJMlSAGdQc/4xD3d1HmBJ3IY1rsgmEOP8jxOtf8VMGGc+riDbT9UFXW500Axiv1SEfi
 0bRZFvpuzSv3jHUUzJhoB9NVmj50aPYp5xy7XWDvbOINxxrUj2MjSW6qg8nReOpGUj5Y
 dhuqErqUx3hv3Y17uJUEdWu8XNeW9ln1h57kAE62ZheE7LKr2WhsS1Y89TThUjnCQ5uZ
 cDUg==
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
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 linux-fbdev@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwMSBOb3YgMjAxOSwgS2lyYW4gR3VuZGEgd3JvdGU6Cgo+IFdMRUQ0IHBlcmlwaGVy
YWwgaXMgcHJlc2VudCBvbiBzb21lIFBNSUNzIGxpa2UgcG1pODk5OCBhbmQKPiBwbTY2MGwuIEl0
IGhhcyBhIGRpZmZlcmVudCByZWdpc3RlciBtYXAgYW5kIGNvbmZpZ3VyYXRpb25zCj4gYXJlIGFs
c28gZGlmZmVyZW50LiBBZGQgc3VwcG9ydCBmb3IgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogS2ly
YW4gR3VuZGEgPGtndW5kYUBjb2RlYXVyb3JhLm9yZz4KPiBSZXZpZXdlZC1ieTogQmpvcm4gQW5k
ZXJzc29uIDxiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZz4KPiBSZXZpZXdlZC1ieTogRGFuaWVs
IFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMgfCAyNTUgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGlu
YXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNv
ZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBC
bG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
