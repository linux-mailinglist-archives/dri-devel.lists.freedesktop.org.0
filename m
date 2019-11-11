Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A4AF708F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 10:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959316E86B;
	Mon, 11 Nov 2019 09:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C09A6E86B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 09:25:31 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f3so12392329wmc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 01:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=EAGdmecmIYQMbogASNQhQtQecAe8bZ2za4Rdh2+08ME=;
 b=fmF+bnmsm1M5N31CBnAxmU9TY6FHiB1EyHkl6+FNfGaWCPaMxvCoMelFAafinhKgS8
 Sm5+JO3utRH1Y8YUCrQAuJwisW3y1okuble9Q80r4get2ZE1lLI7xBHR7kqBFXOJC/6g
 93hqKInHIatsjVA57uN73CB4i8JbAnhZyVI1lSrYm0q5DG+ylYxsVV+yM/56gGY7vFwH
 T8SmKj6mETEfj/tDdjqPK4kEzCKZGOZ2J3FOWDszXhGYp+C1uHW/6LwfwjEbqSQT+aEx
 fJxB2eorUN15dMahrPvGIpGhAxHfa5QqAPRWW7EMRPBLUi2hKAWXJweQlXy8POOWFgnL
 4fVA==
X-Gm-Message-State: APjAAAUWSL0oQKcX4yh30udx/XXe7e4w/B2sdY7Loqoni+NwWOJLgVKc
 feBSlpLKVtylVV0LVuNEYmTdPg==
X-Google-Smtp-Source: APXvYqxsuEZoMa82YymohR63zheNj31pQiSiawLEKigrwQP7JSqSDgwgZGuFELRxkBAXjKVnTla1UA==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr20598305wml.41.1573464329856; 
 Mon, 11 Nov 2019 01:25:29 -0800 (PST)
Received: from dell ([95.147.198.88])
 by smtp.gmail.com with ESMTPSA id c144sm17688300wmd.1.2019.11.11.01.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 01:25:29 -0800 (PST)
Date: Mon, 11 Nov 2019 09:25:21 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V10 5/8] backlight: qcom-wled: Restructure the driver for
 WLED3.
Message-ID: <20191111092521.GS18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-6-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572589624-6095-6-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=EAGdmecmIYQMbogASNQhQtQecAe8bZ2za4Rdh2+08ME=;
 b=w56mXCzCV0zuIKf5UgKd73iw22KzOjcm/ewjieo905GNM8iSDbjgrHD9m2hsv4+N/p
 w3Mrdp0iqj4WQ1ftEYaBeJpjglqxWWNcz+udxPTk7EkuKxVsG1VrLYriVu2Qy/zPxpYf
 zdpT9yI5Ck0J21noqDhFuBPAhKcW2CzERSW7Yghx7OUbF/hN1Ns78XszQtXvGzy6T39t
 mC6KK5ZBZpkR3k8WPvTegUKeDltIcVUzVyd7IJnqcBRvH74F3hh3QEv9b+DmzXEqnXQr
 6RzPTXp4Pp6QzLoHKgzOsZotTPAXj+8X6qaPo+b4Mg473QAe284G+Ntxo8Xhv2Kh6x86
 Bfww==
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

T24gRnJpLCAwMSBOb3YgMjAxOSwgS2lyYW4gR3VuZGEgd3JvdGU6Cgo+IFJlc3RydWN0dXJlIHRo
ZSBkcml2ZXIgdG8gYWRkIHRoZSBzdXBwb3J0IGZvciBuZXcgV0xFRAo+IHBlcmlwaGVyYWxzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEtpcmFuIEd1bmRhIDxrZ3VuZGFAY29kZWF1cm9yYS5vcmc+Cj4g
QWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4g
LS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jIHwgMzczICsrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjM0IGluc2Vy
dGlvbnMoKyksIDEzOSBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9u
ZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNl
Ym9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
