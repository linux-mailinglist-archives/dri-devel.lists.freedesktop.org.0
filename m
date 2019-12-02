Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D920310E9F6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 13:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9246E14E;
	Mon,  2 Dec 2019 12:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C074C6E14E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 12:16:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b11so21520583wmj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 04:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G5VVqLIwV9Oy2LyiFq2YXUvWWl4zfcZWaLI+Ia6usqU=;
 b=bYqLew172vv5QoxEmVXpDiiobq4x+b6y0IH7EucMQPW4u5i4sFNsAy/g2KUQ7NEFZZ
 YBin7wUHzjF/e84n8iQt77W5ijXM3rviORLG8v5TD3ZE/CfuaXHO6u1s6COUOMrZ/P2a
 7tZZCmDi8MzQI9wZdmty/d8TmCjhPQ0TB+mBQ5UAI2R7+7HstTgLnctAvwbO9Pf3Ml7M
 BRbyqD/lJp5o9ZydljCfFMdMA4H2ywMs5iJJDCjly6QSWTE7Xta3YbmVpNDoObA2oxCk
 g/Z+c7JtvgHWMJkeBurRmMOgsSjQRSBv0kSSQho8m/LQb8HTIASkvCs6jcM278/x2RGg
 iHtQ==
X-Gm-Message-State: APjAAAVLNBFhOXgcVMb+N9OwCtle+Bhk/7XLP2G7IjiNp1uyQHiXRqbJ
 jiBsNsCFHizdT7GJjOJQts+c2A==
X-Google-Smtp-Source: APXvYqzyMSjgUm5K+PbmczIPFFT+F55OIsonm5FZs6rTt6tEGSDFPi074g+gEFhewx/TKdjAlvQd6w==
X-Received: by 2002:a7b:c773:: with SMTP id x19mr29029223wmk.109.1575289005319; 
 Mon, 02 Dec 2019 04:16:45 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d8sm9460315wrx.71.2019.12.02.04.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 04:16:44 -0800 (PST)
Date: Mon, 2 Dec 2019 12:16:43 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: ams369fg06: Drop GPIO include
Message-ID: <20191202121643.oenwtj5vrrfifdib@holly.lan>
References: <20191202103005.102696-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202103005.102696-1-linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G5VVqLIwV9Oy2LyiFq2YXUvWWl4zfcZWaLI+Ia6usqU=;
 b=BuKepvcS81GQc2a1N3uVexjhPgWbvbv7bikzhOdfHu7nlgpE6HsOHNR1cXx11ltq11
 K8eYXQ0J4/4tkX331CQhK2PN5AZ2fbhe/hMJoi7xQRwQrSNZYrKjmAs4UE/uC6sZHMPh
 O8Rmk5yIGPjAMrjkvDXPDBJ4S5b+bWEWtW2N8OfnUncGZAJ/BIGwJzX92gcev6OHlzfn
 fXxEk0lm6ABiQ4ved9ywt7X+0mV+Whi72pj/O4eTbacCMdWhdzsnuuOElfRYXP2+SRLU
 xYsuEa/l/2FCijEDRKysTuzkfjxkvceZbYjFOHdRkNZQlGswYMsg1RSdak8uTMBphAkG
 URVw==
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMDIsIDIwMTkgYXQgMTE6MzA6MDVBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBUaGUgZHJpdmVyIGluY2x1ZGVzIDxsaW51eC9ncGlvLmg+IHlldCBmYWlscyB0byB1
c2Ugc3ltYm9scwo+IGZyb20gYW55IHRoZSBoZWFkZXIgc28gZHJvcCB0aGUgaW5jbHVkZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+
CgpSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9y
Zz4KCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2FtczM2OWZnMDYuYyB8IDEgLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9hbXMzNjlmZzA2LmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9h
bXMzNjlmZzA2LmMKPiBpbmRleCA5NGNjYjkwNDI0NDAuLjhhNDM2MWU5NWExMSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hbXMzNjlmZzA2LmMKPiArKysgYi9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9hbXMzNjlmZzA2LmMKPiBAQCAtMTEsNyArMTEsNiBAQAo+ICAjaW5j
bHVkZSA8bGludXgvYmFja2xpZ2h0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ICAj
aW5jbHVkZSA8bGludXgvZmIuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L2dwaW8uaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L2xjZC5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9zcGkvc3BpLmg+Cj4gLS0gCj4gMi4yMy4wCj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
