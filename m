Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151A11462EC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 08:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40256FB1B;
	Thu, 23 Jan 2020 07:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3476FB1B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 07:53:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id m24so1467016wmc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 23:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=LkS/V988Ti/1GfKcQfeUkMBm9SsC4LVrMiS9Hhq0LuA=;
 b=Jwrbc4bf/9zfn+7g7L6Mdt6K1JnykaDSeM1CbIruN3JXLZdou2iBHVAZn0K2Rywx3u
 j2keMcRx9RG6t90wQAYQ7g3NnKMOQS1GZfR5r/CKi9hJyXJONTeAvnmTI2UuS2IEvrms
 8p6oUdFLySKJewP3QtHK73gAZo6G83s8DHqx1UtZITLksupSHVgqBBvE+ydGJUtAIkTs
 VnHbh3HI7mIXTrfeBLCP3FsDadqwpFP1ndooqP0tZyoOReFQTiRhtsNeXsjEe/TpQAuK
 kRPrsj7rOxZ0t8HxZZaYRVPb7I9V280AEXOARLuvhXUCaOY1IVzf4Aw075bcorF/HbAF
 Yi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=LkS/V988Ti/1GfKcQfeUkMBm9SsC4LVrMiS9Hhq0LuA=;
 b=kN7VPwz3APr4+reuvgRR0DJYrVw4qiqHRcMaXNWoXCHi1zdPqR9r3+bN5bZUkZFjH6
 NgSHpctpl9qdwgj8aUphsL0dGNfvkcrmHjHNMH4WBzndSXlTI5xIXo8ny0AcXEqMZnej
 ZLFe4+E2SR+FEiTvpvEfCF2i8MJLIAJo2IhJr+FPOERzFC5OBbRUNQwJuXIAdIcJqNeo
 HZG2GvhFrDVsMLPTnq+NhsD2zqxxzM3YJ3HScsiapMJtStlJNAlOSyL7fKt4lVWcZIk3
 yjdE7cApMK71pXWvGErQB46KIpci+xHjup27gnewBEnH9rQVpE9DnD836OQLvNuJZBK9
 usqg==
X-Gm-Message-State: APjAAAV4GsaZ9qDdtwh/s5KtOLpNI4iX80d+PdsayAR/GXm+gQKeDVMJ
 pSqahECphP0AGiSsDwjCAGpZ1g==
X-Google-Smtp-Source: APXvYqzGzPSg/J8qJs1czckc4vtx2G3GfA0fJSoq5iEDFGfxcQef6z7Qhnri8k6z2Zv7KcKTZZf2Gg==
X-Received: by 2002:a7b:cd1a:: with SMTP id f26mr2619310wmj.164.1579766012421; 
 Wed, 22 Jan 2020 23:53:32 -0800 (PST)
Received: from dell ([2.27.35.227])
 by smtp.gmail.com with ESMTPSA id z25sm1749383wmf.14.2020.01.22.23.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 23:53:31 -0800 (PST)
Date: Thu, 23 Jan 2020 07:53:45 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Chen Zhou <chenzhou10@huawei.com>
Subject: Re: [PATCH -next v2] backlight: qcom-wled: fix unsigned comparison
 to zero
Message-ID: <20200123075345.GO15507@dell>
References: <20200122013240.132861-1-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122013240.132861-1-chenzhou10@huawei.com>
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
Cc: daniel.thompson@linaro.org, kgunda@codeaurora.org, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMiBKYW4gMjAyMCwgQ2hlbiBaaG91IHdyb3RlOgoKPiBGaXhlcyBjb2NjaWNoZWNr
IHdhcm5pbmc6Cj4gLi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYzoxMTA0OjUt
MTU6Cj4gCVdBUk5JTkc6IFVuc2lnbmVkIGV4cHJlc3Npb24gY29tcGFyZWQgd2l0aCB6ZXJvOiBz
dHJpbmdfbGVuID4gMAo+IAo+IFRoZSB1bnNpZ25lZCB2YXJpYWJsZSBzdHJpbmdfbGVuIGlzIGFz
c2lnbmVkIGEgcmV0dXJuIHZhbHVlIGZyb20gdGhlIGNhbGwKPiB0byBvZl9wcm9wZXJ0eV9jb3Vu
dF9lbGVtc19vZl9zaXplKCksIHdoaWNoIG1heSByZXR1cm4gbmVnYXRpdmUgZXJyb3IgY29kZS4K
PiAKPiBGaXhlczogNzc1ZDJmZmI0YWY2ICgiYmFja2xpZ2h0OiBxY29tLXdsZWQ6IFJlc3RydWN0
dXJlIHRoZSBkcml2ZXIgZm9yIFdMRUQzIikKPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFpob3UgPGNo
ZW56aG91MTBAaHVhd2VpLmNvbT4KPiBSZXZpZXdlZC1ieTogQmpvcm4gQW5kZXJzc29uIDxiam9y
bi5hbmRlcnNzb25AbGluYXJvLm9yZz4KPiAtLS0KPiAKPiBjaGFuZ2VzIGluIHYyOgo+IC0gZml4
IGNvbW1pdCBtZXNzYWdlIGRlc2NyaXB0aW9uLgo+IAo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9xY29tLXdsZWQuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb
5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIg
T3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29r
IHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
