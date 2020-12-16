Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B749B2DC252
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 15:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0D789BF6;
	Wed, 16 Dec 2020 14:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6384389BF6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 14:36:20 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id c5so19747374wrp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 06:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1+xRvYA1pxFKx0XtDQ31iUMNpTfOzpYfWa3N+b1f36w=;
 b=D9tZo391U+Yk9iuy7EGvkpos9GG2gaP6lh8G8kbYcZbhPLW/ucCrLf5oSkYvVz4jUC
 kMqFUxBTvQCoj3KkuS6V35VGK9KegHusQzeK/hJ5FgEbt6klGf6JYtJ87MA0cuE8vPBP
 z8l0pVPZx/rNU6cfqxJIHMGSCWMAt4kScBC7o59D/2QzFJ7BPLD+jqxiTEIu6flAkXi5
 o6ilk+OtnZ58GRjv3g4aexcHpEoZ7S5WZ56bCKpMVHoCkBGWMhiVGT7U9Q2Mon1Bp0WB
 Fqn4DXcKrjIiKuamW7vmZ0GpkHkyHYFMsDvYschETw0d9ilE1GSKbSyBlhkmqaidaZbu
 h6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1+xRvYA1pxFKx0XtDQ31iUMNpTfOzpYfWa3N+b1f36w=;
 b=EQdmzR15WGbc58V/mQK7ToO5k/yngPsSwbKmNotS7Yr9DnjEfwtuQIJog6GAeJI7gs
 HSCeuKhu94rsJ1AEvpZPuqUIWsMKOX1DtTuyEOoerljC4HdwWbfoZoXHHpn9sGYxEQGg
 H4crNR9kH1UTgAyiJjbYpdOxEX7AYGyWWtqFd5McrofNXMH4lYfdFfjnOB6WbbSetlY9
 apiUb5X5fsQn1rMyR3TBYG0+ENdxWcRYWjzqdfj5K/fC1o8Qv5VM00SRvWhX1x4qfof3
 QDcNhr1d7tR8kOFaJTfTZbyCpLtzlhanMJoLWmV/x4XR1I8oNKQrRGudMoRWtD1qejj9
 Mz7w==
X-Gm-Message-State: AOAM531m1HT3sxMsxcHhkTpfASeyvSGwJpVVKkZtOT1M1h878Ip83m55
 LMNtXNbSD9ONH/F5ma26GvXMKg==
X-Google-Smtp-Source: ABdhPJylSqFMc/S45ragP2Y9ol6Qr2fab8KKBxJIm8g8W2JghL0Rj2OlBZ6f2z6RYm4SALaC6v22ig==
X-Received: by 2002:a5d:554e:: with SMTP id g14mr38990021wrw.264.1608129379055; 
 Wed, 16 Dec 2020 06:36:19 -0800 (PST)
Received: from dell ([91.110.221.200])
 by smtp.gmail.com with ESMTPSA id h20sm3675336wrb.21.2020.12.16.06.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 06:36:18 -0800 (PST)
Date: Wed, 16 Dec 2020 14:36:16 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] backlight: sky81452-backlight: convert comma to
 semicolon
Message-ID: <20201216143616.GF207743@dell>
References: <20201214133458.3729-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214133458.3729-1-zhengyongjun3@huawei.com>
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
Cc: daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxNCBEZWMgMjAyMCwgWmhlbmcgWW9uZ2p1biB3cm90ZToKCj4gUmVwbGFjZSBhIGNv
bW1hIGJldHdlZW4gZXhwcmVzc2lvbiBzdGF0ZW1lbnRzIGJ5IGEgc2VtaWNvbG9uLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFpoZW5nIFlvbmdqdW4gPHpoZW5neW9uZ2p1bjNAaHVhd2VpLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvc2t5ODE0NTItYmFja2xpZ2h0LmMgfCAyICst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKQXBwbGll
ZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExl
YWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
