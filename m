Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFF770DD2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 01:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A56289DF7;
	Mon, 22 Jul 2019 23:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F204189DF7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 23:59:28 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id o13so18410248pgp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yKJpc6b5YDtH8HQ6uiATAFLuSozdZCVilkIngvbXM5A=;
 b=P/X4uQcez3lSg1tWQKMQi0X8TRERcx6cB92TTqMG9VT15AhHM4vGYHcLLgMqjC35SC
 mcmYjN2CXGmZ0OGqkNqY12Q0IyDW6/fILkHJDRcheXobOoOfP76hDJwUD/AY0MafCCOb
 AevSco6tWh+2soMG3hSeQfIqEmOs0ULvQVt5Goa8R1TpqyuxhTR8pFgma504x58MXUgo
 dSa/rZ69PRNYhI2n4UcWGAjgh9yyDK1Xjk0x92AbHvpVC33D1a26orVu5nUH1PdG5qdp
 I2zgJBVIwUyuKQdorvzcAbSSi191RdbvtBz0KOP8m1CsQJ4aphiJmzy58ujy7zsOJJT3
 Cbug==
X-Gm-Message-State: APjAAAV4/xgirGvIFiuh2ROWkE695GXZNgp6GWenvvHkeCKBzPY7scYu
 2wOoCWhGjJRiwb5blvRmHqLQdQ==
X-Google-Smtp-Source: APXvYqylBuVwl7XZwxbVNxqA1DcLvAlMOG8gWbqhX7r0RR7aDWH3sQ/kfj0iiNgQmQOUzrSpDH2+kA==
X-Received: by 2002:a63:4e60:: with SMTP id o32mr75155489pgl.68.1563839968519; 
 Mon, 22 Jul 2019 16:59:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id f88sm40294971pjg.5.2019.07.22.16.59.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 16:59:27 -0700 (PDT)
Date: Mon, 22 Jul 2019 16:59:26 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3 0/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190722235926.GA250418@google.com>
References: <20190709190007.91260-1-mka@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709190007.91260-1-mka@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yKJpc6b5YDtH8HQ6uiATAFLuSozdZCVilkIngvbXM5A=;
 b=BwwNgGULwWCLx8dsVMfholYHHZtahSRNI4WRi8GeRE1cTEnEj7+QLHRFtS1OwD7OfL
 PBhCf2HLH/xHTCrVy2tXcVrzcxjy/X/9XS3xE3DB5oNwZDSgYT1w2T1voSeXQoCgP+lE
 YAbbno9nOKjFkhoG+ymLqQNzmX7kqXLBCtzVc=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMTI6MDA6MDNQTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxj
a2Ugd3JvdGU6Cj4gQmFja2xpZ2h0IGJyaWdodG5lc3MgY3VydmVzIGNhbiBoYXZlIGRpZmZlcmVu
dCBzaGFwZXMuIFRoZSB0d28gbWFpbgo+IHR5cGVzIGFyZSBsaW5lYXIgYW5kIG5vbi1saW5lYXIg
Y3VydmVzLiBUaGUgaHVtYW4gZXllIGRvZXNuJ3QKPiBwZXJjZWl2ZSBsaW5lYXJseSBpbmNyZWFz
aW5nL2RlY3JlYXNpbmcgYnJpZ2h0bmVzcyBhcyBsaW5lYXIgKHNlZQo+IGFsc28gODhiYTk1YmVk
Yjc5ICJiYWNrbGlnaHQ6IHB3bV9ibDogQ29tcHV0ZSBicmlnaHRuZXNzIG9mIExFRAo+IGxpbmVh
cmx5IHRvIGh1bWFuIGV5ZSIpLCBoZW5jZSBtYW55IGJhY2tsaWdodHMgdXNlIG5vbi1saW5lYXIg
KG9mdGVuCj4gbG9nYXJpdGhtaWMpIGJyaWdodG5lc3MgY3VydmVzLiBUaGUgdHlwZSBvZiBjdXJ2
ZSBpcyBjdXJyZW50bHkgb3BhcXVlCj4gdG8gdXNlcnNwYWNlLCBzbyB1c2Vyc3BhY2Ugb2Z0ZW4g
cmVsaWVzIG9uIG1vcmUgb3IgbGVzcyByZWxpYWJsZQo+IGhldXJpc3RpY3MgKGxpa2UgdGhlIG51
bWJlciBvZiBicmlnaHRuZXNzIGxldmVscykgdG8gZGVjaWRlIHdoZXRoZXIKPiB0byB0cmVhdCBh
IGJhY2tsaWdodCBkZXZpY2UgYXMgbGluZWFyIG9yIG5vbi1saW5lYXIuCj4gCj4gRXhwb3J0IHRo
ZSB0eXBlIG9mIHRoZSBicmlnaHRuZXNzIGN1cnZlIHZpYSBhIG5ldyBzeXNmcyBhdHRyaWJ1dGUu
Cj4gCj4gTWF0dGhpYXMgS2FlaGxja2UgKDQpOgo+ICAgTUFJTlRBSU5FUlM6IEFkZCBlbnRyeSBm
b3Igc3RhYmxlIGJhY2tsaWdodCBzeXNmcyBBQkkgZG9jdW1lbnRhdGlvbgo+ICAgYmFja2xpZ2h0
OiBFeHBvc2UgYnJpZ2h0bmVzcyBjdXJ2ZSB0eXBlIHRocm91Z2ggc3lzZnMKPiAgIGJhY2tsaWdo
dDogcHdtX2JsOiBTZXQgc2NhbGUgdHlwZSBmb3IgQ0lFIDE5MzEgY3VydmVzCj4gICBiYWNrbGln
aHQ6IHB3bV9ibDogU2V0IHNjYWxlIHR5cGUgZm9yIGJyaWdodG5lc3MgY3VydmVzIHNwZWNpZmll
ZCBpbgo+ICAgICB0aGUgRFQKPiAKPiAgLi4uL0FCSS90ZXN0aW5nL3N5c2ZzLWNsYXNzLWJhY2ts
aWdodCAgICAgICAgIHwgMjYgKysrKysrKysrKysrKysKPiAgTUFJTlRBSU5FUlMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysKPiAgZHJpdmVycy92aWRlby9iYWNrbGln
aHQvYmFja2xpZ2h0LmMgICAgICAgICAgIHwgMTkgKysrKysrKysrKwo+ICBkcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9wd21fYmwuYyAgICAgICAgICAgICAgfCAzNSArKysrKysrKysrKysrKysrKyst
Cj4gIGluY2x1ZGUvbGludXgvYmFja2xpZ2h0LmggICAgICAgICAgICAgICAgICAgICB8ICA4ICsr
KysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1jbGFz
cy1iYWNrbGlnaHQKCnBpbmcsIGFueSBjb21tZW50cyBvbiB2Mz8KClRoYW5rcwoKTWF0dGhpYXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
