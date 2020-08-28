Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2C42558CF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 12:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F73F6E48B;
	Fri, 28 Aug 2020 10:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA67B6E48B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 10:46:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s13so493140wmh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 03:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fr2XPTbb6uJ/hq9c7/mXVKuaGQwKQ0+oiK3MtSt/kQg=;
 b=U4hN1Tm0REgz4NOpbgcuzzNicvwei0MAJlj3ihuEPnml6BSbPLb7j6UffbH5apk+qq
 uDKTGYfmyzULsSDUBVQT99Ch8csgcpdiWGOteVvQflVny3nXPvvyAWx2LADPfPRP0tgZ
 drGoBKKJGFRAHm9giPsUrl2z92l6LdI9pm6buuHTaSZe0pFwvksf59m1Y6TUsPXTlBuX
 QY9qSda0RTvKuwIWBWtUn6H891LsaJWa9f9GxsCsNMSY4FdxP6fTfDfwlLe9EEWaSCCF
 kK5nYPmltaBmDF0ivHn9oUG5fzSYnbFQ3+RFhe1wspIRrTD6wnbVqlShM+ku8rOlsEM2
 jvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fr2XPTbb6uJ/hq9c7/mXVKuaGQwKQ0+oiK3MtSt/kQg=;
 b=Dmz8+AG/kIzfFt535+jm53W8T34zPdGhA6frPyyf+jdrgbUndD2FTmMwHzwrdg+BIA
 GI2xtir4s4Rhi6iIl3J7UjOurfybxHSrUniwBJVCPHsPPifhqezGVcRQXpLP1Bm+SWpl
 WUC5FVEPvZT9RJnLCY6jzs6Cz07dpRmx0h0sAIOKon4MWSoJEipd1jftbQvh1AI/o6sz
 sj6uNkBxsGBZnYszHGChwErb91a+UEhZIASzSkGUkcPdtRdmnEKHLHsvuoZfb5SwEWG8
 REKJOmsjP+jZx8klOIVqlTOD1qXuH4bBQxGsZfdAquWZM1rObo1sRwXojxGbcW1VeZy2
 waqA==
X-Gm-Message-State: AOAM533H3329p15zder2R91c7NhtOZpcbYhlPhpJxsVZ6fdD0SIKNYIu
 5N02KmtAV0Xv/S5ApSU5q1fYxw==
X-Google-Smtp-Source: ABdhPJxK88OJlEN6LPQP5gymo5j3WJuk2tMF7ZZVRzBV4kodM8e/AuX/xxskd9ZnjYJGaNYn3WnVGQ==
X-Received: by 2002:a1c:e288:: with SMTP id z130mr1086967wmg.32.1598611590410; 
 Fri, 28 Aug 2020 03:46:30 -0700 (PDT)
Received: from dell ([91.110.221.141])
 by smtp.gmail.com with ESMTPSA id d11sm1426226wrw.77.2020.08.28.03.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:46:29 -0700 (PDT)
Date: Fri, 28 Aug 2020 11:46:28 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3 v3] dt-bindings: backlight: Add some common backlight
 properties
Message-ID: <20200828104628.GO1826686@dell>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819205150.164403-1-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBBdWcgMjAyMCwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gTGV0J3MgdXNlIGEg
Y29tbW9uLnlhbWwgaW5jbHVkZSBmb3IgdGhlIGJhY2tsaWdodCBsaWtlIHdlIGRvIHdpdGgKPiB0
aGUgTEVEcy4gVGhlIExFRHMgYXJlIGluaGVyZW50bHkgaW5jb21wYXRpYmxlIHNvIHRoZWlyIGJp
bmRpbmdzCj4gY2Fubm90IGJlIHJldXNlZCBmb3IgYmFja2xpZ2h0Lgo+IAo+IENjOiBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZwo+IFN1Z2dlc3RlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPgo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpA
bGluYXJvLm9yZz4KPiAtLS0KPiBDaGFuZ2VMb2cgdjItPnYzOgo+IC0gRHJvcCB0aGUgfCBmb3Ig
dGhlIGRlc2NyaXB0aW9uCj4gLSBEcm9wIHRoZSAiZGVmYXVsdC1vbiIgcHJvcGVydHksIHdlJ3Jl
IG5vdCB1c2luZyBpdC4KPiAtIERyb3AgdGhlIG1pbmltdW0gMCBmb3IgdW5zaWduZWQgdTMyOnMK
PiBDaGFuZ2VMb2cgdjEtPnYyOgo+IC0gTmV3IHBhdGNoIGFzIHN1Z2dlc3RlZCBieSBTYW0uCj4g
LS0tCj4gIC4uLi9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9jb21tb24ueWFtbCAgICAgICB8IDM0
ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9s
ZWRzL2JhY2tsaWdodC9jb21tb24ueWFtbAoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25l
cyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMK
TGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBM
aW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
