Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A631C6E0F
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 12:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3D36E849;
	Wed,  6 May 2020 10:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDF76E849
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 10:08:38 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r26so1951985wmh.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 03:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VzNe2ST4lz1BYAQ/p9YeE0kmmD4jLbs29p9J5C8f3PI=;
 b=lVg/KXxsQi9o5BFRkAdFAHJvM5az1noe+ABa8yeVzaBDNNCZTnPXEe6S/aOwqh/vkp
 8f0NhIcwAJ2PC/4vpwvKstSIXj0hfRFtrIeW0wcQYIan1lOdxvJyQqFAQfoII08sPkC4
 DGORLRfat4zBbEEmmc9MXkI3gjVEeqX+6hILIUTcqtnxODF/CSTLO5D+jI8mALONUf+L
 ikK7bGvxYlGDq4kzxRRF0d6+ObCh8KvLz/0bAVZgpwyprzBb9pD1uOu+cqtkevW0phpJ
 kzTkEGZKVK++p9qj8MHC5TvynAIpX+h0IbgOi9Tqyi9CmY91FSY9d8VpzwtWlO1tQvMq
 g81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VzNe2ST4lz1BYAQ/p9YeE0kmmD4jLbs29p9J5C8f3PI=;
 b=Ysf6dhLLYzyDIh0ipCee4YJJOLBGKZ/Sk8Rmgh0qxdmAuHEtdqxuKjNoGOCGUuRMPI
 dqzQidEK4UOXIrNO5Op8X6jC6g9h/koB55VPvRwHu9fqutvPoWIsd3MvUpgTQr68IRJ1
 2jwsKS3nnBngclEqdZvgdZbIE8KHd17Jq9Hga9Ww4zz9HlCtU9k9j/38eQ4FnsoqvViw
 hX79WglJ+8eEuP8X6LfqMwZ4D2q3zmJzseHp0QXedc0tAiv6OoHjp6HNBpuVe1+OmXsD
 b3oliCkSZLbG0x4+Tkh1x4RYctPizgQQ8rgS5VRJPhpNy3MYlIjlBGbSTCmZUKcRjJAw
 ci8Q==
X-Gm-Message-State: AGi0PubYt/93/bCzZAxigtNC/7ktHefsi3P9I2SkQT/Hmz92+ugtfpMK
 ooG6bX9RGq7LgXzuOh7Dp2ll3w==
X-Google-Smtp-Source: APiQypInYHUDNrqEUITYN/4bNtu4Kh3BGLktqne+H6HDYbuGJNmorPX8kNclKs+5lI97bApQew2ZlQ==
X-Received: by 2002:a1c:7715:: with SMTP id t21mr3332429wmi.182.1588759716943; 
 Wed, 06 May 2020 03:08:36 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id 88sm2000910wrq.77.2020.05.06.03.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 03:08:36 -0700 (PDT)
Date: Wed, 6 May 2020 11:08:34 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V6 4/4] backlight: qcom-wled: Add support for WLED5
 peripheral that is present on PM8150L PMICs
Message-ID: <20200506100834.GG823950@dell>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-5-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587656017-27911-5-git-send-email-kgunda@codeaurora.org>
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

T24gVGh1LCAyMyBBcHIgMjAyMCwgS2lyYW4gR3VuZGEgd3JvdGU6Cgo+IEZyb206IFN1YmJhcmFt
YW4gTmFyYXlhbmFtdXJ0aHkgPHN1YmJhcmFtQGNvZGVhdXJvcmEub3JnPgo+IAo+IFBNODE1MEwg
V0xFRCBzdXBwb3J0cyB0aGUgZm9sbG93aW5nOgo+ICAgICAtIFR3byBtb2R1bGF0b3JzIGFuZCBl
YWNoIHNpbmsgY2FuIHVzZSBhbnkgb2YgdGhlIG1vZHVsYXRvcgo+ICAgICAtIE11bHRpcGxlIENB
QkMgc2VsZWN0aW9uIG9wdGlvbnMgZnJvbSB3aGljaCBvbmUgY2FuIGJlIHNlbGVjdGVkL2VuYWJs
ZWQKPiAgICAgLSBNdWx0aXBsZSBicmlnaHRuZXNzIHdpZHRoIHNlbGVjdGlvbiAoMTIgYml0cyB0
byAxNSBiaXRzKQo+IAo+IFNpZ25lZC1vZmYtYnk6IFN1YmJhcmFtYW4gTmFyYXlhbmFtdXJ0aHkg
PHN1YmJhcmFtQGNvZGVhdXJvcmEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEtpcmFuIEd1bmRhIDxr
Z3VuZGFAY29kZWF1cm9yYS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fj
b20td2xlZC5jIHwgMzc4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMzc2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpBcHBsaWVk
LCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNo
bmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNv
Q3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
