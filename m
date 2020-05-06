Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC011C6E06
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 12:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C716E847;
	Wed,  6 May 2020 10:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9C06E847
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 10:08:12 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x4so1921950wmj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 03:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=d0Mbz4IlNlOD6NWoBttZxtAzOi0yfZP1EXWbU1DQp9Q=;
 b=Z7R1iFysNju6kMVpM8kSyPU9reJ3/lCVZfmYivHjP+o137oLI+OylHjmc+n4PogcNm
 a5Na1bKrSFh6vqcnnuyaGJXMn8AIo2J4Xoib4FDqLFuOJ47GPL2MCqOJM+kyU50i0C90
 86E8mtAD6WruBAVwV+XhgAw1BjN7NhphyxxHRobpypSlG7WtDiL9CNPwcrvE4rD3wSLh
 kMEv+XbPGaRXlXsk71fHXekWGfjwn791PsvSjKJ2OqopNMTtubyn6xDVaruvPm8TL6ml
 SwlHtTh7QVMALH3cydlLNFggmlqWjM5Zi3uDdG5SVVh4C5IF1axFqDJpteLirg8vclOn
 OIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d0Mbz4IlNlOD6NWoBttZxtAzOi0yfZP1EXWbU1DQp9Q=;
 b=RmoakglejhJOzPjiDw6EAP+NCOuTBPpvv2EEtDcSZUkaUzJPWwl1Z717rshoQO3Dfk
 FOsvjJK3s1cR9+vga01b6KO4XhGCiaRxTHztRoYcr8rJkWFjx6epiq3lojEH51aRz3RE
 +xF2ieGYFCwNmTf8RXeYGJxYZ6EM+p2yZpHcDQPNvq9C9GhEWSOTp7M+KYoWml0Rdh8Q
 fqRj0O6OqTd0che0bQnDAQERk3LPm/N2dBbhTsqav9N5xL+2v6N/qsbTWZ0+gSJ8YKOh
 q8/E5mSQRERNumCftzxOMTQMPjwYAYAXOR5CEegbkPLmDqmvywU1DmFs7J03bxahuyS2
 2VAQ==
X-Gm-Message-State: AGi0PuZq9SNi5Vux/O2zcSYQdI1R0hEcg6Hhki2x7lLj5HArkLzQKsNq
 v8Dt9nLLZaj3VI5/GM4sjjX8vQ==
X-Google-Smtp-Source: APiQypL3RUgh074vMzPhOQV/+cRFmEYLPRligBsdSST97UzRQldJjqnOSxvZmUKsze74rOGtmCISQg==
X-Received: by 2002:a05:600c:220c:: with SMTP id
 z12mr3580308wml.84.1588759691135; 
 Wed, 06 May 2020 03:08:11 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id 138sm2440363wmb.14.2020.05.06.03.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 03:08:10 -0700 (PDT)
Date: Wed, 6 May 2020 11:08:08 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V6 2/4] backlight: qcom-wled: Add callback functions
Message-ID: <20200506100808.GE823950@dell>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-3-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587656017-27911-3-git-send-email-kgunda@codeaurora.org>
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
 jingoohan1@gmail.com, Andy Gross <agross@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMyBBcHIgMjAyMCwgS2lyYW4gR3VuZGEgd3JvdGU6Cgo+IEFkZCB3bGVkX2NhYmNf
Y29uZmlnLCB3bGVkX3N5bmNfdG9nZ2xlLCB3bGVkX292cF9mYXVsdF9zdGF0dXMKPiBhbmQgd2xl
ZF9vdnBfZGVsYXkgYW5kIHdsZWRfYXV0b19kZXRlY3Rpb25fcmVxdWlyZWQgY2FsbGJhY2sKPiBm
dW5jdGlvbnMgdG8gcHJlcGFyZSB0aGUgZHJpdmVyIGZvciBhZGRpbmcgV0xFRDUgc3VwcG9ydC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBLaXJhbiBHdW5kYSA8a2d1bmRhQGNvZGVhdXJvcmEub3JnPgo+
IFNpZ25lZC1vZmYtYnk6IFN1YmJhcmFtYW4gTmFyYXlhbmFtdXJ0aHkgPHN1YmJhcmFtQGNvZGVh
dXJvcmEub3JnPgo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNv
bkBsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQu
YyB8IDIxMyArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDE0MSBpbnNlcnRpb25zKCspLCA3MiBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5r
cy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBM
ZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xs
b3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
