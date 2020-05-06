Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093B71C6E0C
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 12:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197A56E848;
	Wed,  6 May 2020 10:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8B56E848
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 10:08:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y3so1503962wrt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 03:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=S5wjK64FTvIBUVGDVz6eqN0rnGF+I8hoKjMUDtYZWj8=;
 b=qrtC2sCMpZ60MCnJYVqgIBCr1c4yVFgq0J7IINfi6C2o3ZpkjkmQH+yah9iqks+c0t
 o93h8LJ/SLc7b30VAnD+RH07r6ktNXmtE535lCnuJHRCK5+SXdkPicCLbwSKDL7HiB38
 9sH5eO69Ic7cZTvCU2NqJVvty1qJgb0VUin+wHtLhnjyMEI1NLhfzO9zoGHNKjlcuxi4
 DAbJIzabXgD56W1vmUcEsX5A/BEH1EJ+mb4F5H8O7EzHUjVkS6b4WU5yeaWO5z5NV1NM
 C8p++DwtqPtBl2X2YdsbKARE37kagvNQEGAWK/OEGI0ET4dVoszmnqmpOlqsO9QSE+es
 LIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=S5wjK64FTvIBUVGDVz6eqN0rnGF+I8hoKjMUDtYZWj8=;
 b=a/5oObjDxymsk7ufhXngAROMDk5NMVBwnqVsKqWyHqZl81tgyPam0A1ckmn02WHVr+
 DsXyE82z5a2tecTRGNaSdnj0zOfwUr++Hf6DzJkdr6R/FZN7LCLzfLsiYjtH5AaDuHJa
 TrqfEjrtvHsZu8aRD2kbEWIpJ0HZYGq5G5npImnEGEvb47afdSeAjQ5d5hcJa6UFVXfz
 7YuAOVxbvrW2xHJ6wKexLbpbBvEhwjtV1TSShoO0uh00sEHO8ip+JgArflfsSvZDCqKV
 /55vbQssADtA4+NguZVbp38sB02GZQBFUI3PeL9oKb5Z2pv5LcQjR0h83X+ZhPk2PUQA
 9e8g==
X-Gm-Message-State: AGi0PuaANeNr/p/YZ87W3CwF/Cy3c12SkQrW9x2dkCt1uCgDogQPNuBJ
 eVnZElpyb80QOio0JWlyPqVDv3JPCjM=
X-Google-Smtp-Source: APiQypLG3DH7DJNZShRtgYXyoOjxP+TIAMjAS7WtIWfxoyMmVGs10rGkH6+s+On16puojbDyPclMEA==
X-Received: by 2002:adf:cc89:: with SMTP id p9mr8780517wrj.269.1588759703535; 
 Wed, 06 May 2020 03:08:23 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id j13sm1920029wrx.5.2020.05.06.03.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 03:08:22 -0700 (PDT)
Date: Wed, 6 May 2020 11:08:21 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V6 3/4] backlight: qcom-wled: Add WLED5 bindings
Message-ID: <20200506100821.GF823950@dell>
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
PiAgMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpBcHBs
aWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBU
ZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJN
IFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
