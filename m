Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E775673B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 12:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8A26E370;
	Wed, 26 Jun 2019 10:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EE76E370
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 10:56:40 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z23so1609876wma.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=l3xGq8iHbu4VPHSEtvqfb52UstsRlMdZS5rhtavrkfk=;
 b=ZNRBHlGkfy97qjNyvZxXUjM69MuEZeXLQjbKMwRPDor+cGJ60/EuhjGiFQiYCYH1kJ
 k0WvdeQQpZI8aN6VGc1pW0mvAgpmMgO6XzMJaqU4FCTVlV0zU2QyTHLk8A7aNl6PchEG
 TuhQGF7yA1MTfma9/z2viKGnEM0EDcNeQsKTPN4LA/7ohIYl+Bf+qvbGVnsoTMqDuiMH
 jDVGqo7FrfMeW9dPFtdrJ+Myynv+vGR4zSVy3N1F5RYJXjKXmWiQCd2vH7g4Fsyl1lJf
 gGkKKSoFU0qODtUVw5RmoyGX7VLqHJaox49NEt2obwb8PruDaKyXIW8VxxnuQnIHKSY3
 6KBg==
X-Gm-Message-State: APjAAAXhDCl9dtu0NI82zWZyO+b7/g3EpmqIA7j7o802j89289ZT17X/
 LRnHz/Y9fOiaSOeQXnh/DdlHAo8z+Pw=
X-Google-Smtp-Source: APXvYqyXZjo09Cb5XAit2USHVh0oUIciSblg/vIQxabQ7/vHyjIewvMDHnvJHFjO56IzAmBgbVTuzA==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr2469031wmi.0.1561546599066;
 Wed, 26 Jun 2019 03:56:39 -0700 (PDT)
Received: from dell ([2.27.35.164])
 by smtp.gmail.com with ESMTPSA id 128sm2621336wme.12.2019.06.26.03.56.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 26 Jun 2019 03:56:38 -0700 (PDT)
Date: Wed, 26 Jun 2019 11:56:36 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] backlight: pwm_bl: convert to use SPDX identifier
Message-ID: <20190626105636.GO21119@dell>
References: <20190619135927.29745-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619135927.29745-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=l3xGq8iHbu4VPHSEtvqfb52UstsRlMdZS5rhtavrkfk=;
 b=bSfaX/mdVSXrduJMIgmWA94aPV9L9YhlMWwT196AMyYjf0/cWJcl+BF2RHttsx8U7w
 XicxiCo7ImeGcRU5+/f6iofwm4PtC30d8vmoOpVkRzPdpjIwZ/cwNC8o8S8EeEq6JfEZ
 yPH8AjH1y/XOA5U/bnUtIT2HwZu74aD7UEfwuz/EzQ5UpsSQW8vVfhkLrLLVAXJzIMea
 T6JdT0ZTd6xEtu0TKvLb1AcEh/iHGC688urt6Z5ZkyHnyVo+GMs5upz3abd79L+/VXXS
 kYXnxZtmnjaJEv5Z/qT9kjNAFwYLwIGw1SaPDy6Ok9tf1kX4QlbCXtHVU5nZMVZCqyE9
 GFpQ==
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Jingoo Han <jingoohan1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBKdW4gMjAxOSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgoKPiBSZWR1Y2Ugc2l6
ZSBvZiBkdXBsaWNhdGVkIGNvbW1lbnRzIGJ5IHN3aXRjaGluZyB0byB1c2UgU1BEWCBpZGVudGlm
aWVyLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFdoaWxlIGhlcmUsIGNvcnJlY3Qg
TU9EVUxFX0xJQ0VOU0UoKSBzdHJpbmcgdG8gYmUgYWxpZ25lZCB3aXRoIGxpY2Vuc2UgdGV4dC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxp
bnV4LmludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMg
fCAxMSArKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpM
aW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ug
c29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8
IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
