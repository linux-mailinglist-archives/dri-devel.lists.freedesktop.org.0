Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80041AEB4E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6C46EC70;
	Sat, 18 Apr 2020 09:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4B26E135
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 19:42:03 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m8so3280024lji.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 12:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RXOh96AVOAPazuvUQmiRvtER0gtvCQDTbuYPQcQSjB4=;
 b=N1s6cGo42QlUdpMqM+4wGChnTYjQOZbH/09K7c/dxFbwtaB4oun6e9nSbbJeHIUCvc
 yottN+C5hbykT0M7IWrWytKalCMwo+d4dck3V+bx/ZWAmxf4PHALhJvCxDrO5LrFqLce
 FysHWMTBqyr+njvV1pQH5fjL57w+qTKIvXzoFIvS/e32bdn6w9j73Cm7KexSUFi3VLmd
 02JH4Zf1OxPSLmE4Ihc51nElkvPPJmdskzq0cFdHTGVH1AhRNAoJv5+6bitIHRuPEL6P
 Tz1N4QV0/NaI1pK5f+XZWqLuPCDk9F45/MGmkHAEv0tMgbiyE2RCupCZEhVcKiDsRQ2L
 U+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RXOh96AVOAPazuvUQmiRvtER0gtvCQDTbuYPQcQSjB4=;
 b=Krp4Jj3aJXQL+d53hX4nI677fntGx9rEGHXZKs9g0ANtzos1NTerJsxPp0N/yfJ7Lc
 dbHszhf9GVKsD09cBYApZPEk0mximPVeCHO20d49X9tagxV+cwfYk0qjcskVF+OdLFDl
 ffrdvoCetIhpC6Dn5SIznz7vsUZ45SShhUyd2l5dlRVn6WgHyKWOdrAQsdYlbghheFgV
 jbRKUQzjf8nXAyRTLWyRphUFRSXSlSMYKeLTcmyv3ZtKpPXaVzm88RPmVPPJCP3hMKQl
 tRfWwQFkKGU6btmwLyBc+u+mID4+IQWqK5bWBslYL29AOchcieZaqI26iG83WDJpfiVr
 6qnA==
X-Gm-Message-State: AGi0PubKySqoHRZ32MSE9YuLicpPRhueBswJQNBDRTGOE3w+5cF9IG5O
 tY8b3IO+ZI4PAnVgc9rw5Gs=
X-Google-Smtp-Source: APiQypKOF+2sIB1XNm7KebOcSpdX71cMxesntX/rmNb19UXLDXxnpC7b1DbBVFGf8WGN554gj0HU+w==
X-Received: by 2002:a2e:914f:: with SMTP id q15mr3076739ljg.238.1587152521275; 
 Fri, 17 Apr 2020 12:42:01 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id q21sm16934556ljh.38.2020.04.17.12.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 12:42:00 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] drm/tegra: output: Support DRM bridges
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-3-digetx@gmail.com>
 <20200417193018.GI5861@pendragon.ideasonboard.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0acc35fd-a74b-e726-7a16-55db13265c39@gmail.com>
Date: Fri, 17 Apr 2020 22:41:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417193018.GI5861@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gTGF1cmVudCwKCjE3LjA0LjIwMjAgMjI6MzAsIExhdXJlbnQgUGluY2hhcnQg0L/QuNGI
0LXRgjoKLi4uCj4+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWMuaD4KPj4gKyNpbmNsdWRlIDxk
cm0vZHJtX2JyaWRnZS5oPgo+IAo+IFlvdSBjb3VsZCBhZGQgYSBmb3J3YXJkIGRlY2xhcmF0aW9u
IG9mIHN0cnVjdCBkcm1fYnJpZGdlIGluc3RlYWQsIHRoYXQKPiBjYW4gbG93ZXIgdGhlIGNvbXBp
bGF0aW9uIHRpbWUgYSBsaXR0bGUgYml0LgoKVGhpcyBpbmNsdWRlIGlzIG5vdCBvbmx5IGZvciB0
aGUgc3RydWN0LCBidXQgYWxzbyBmb3IgdGhlCmRybV9icmlkZ2VfYXR0YWNoKCkuIEl0IGxvb2tz
IHRvIG1lIHRoYXQgaXQgc2hvdWxkIGJlIG5pY2VyIHRvIGtlZXAgdGhlCmluY2x1ZGUgaGVyZS4K
Ci4uLgo+PiArCXBvcnQgPSBvZl9nZXRfY2hpbGRfYnlfbmFtZShvdXRwdXQtPm9mX25vZGUsICJw
b3J0Iik7Cj4gCj4gRG8geW91IG5lZWQgdG8gY2hlY2sgZm9yIHRoZSBwcmVzZW5jZSBvZiBhIHBv
cnQgbm9kZSBmaXJzdCA/IENhbiB5b3UKPiBqdXN0IGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgb2Yg
ZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKCksIGFuZCBmYWxsCj4gYmFjayB0byAibnZpZGlh
LHBhbmVsIiBpZiBpdCByZXR1cm5zIC1FTk9ERVYgPwoKV2l0aG91dCB0aGUgY2hlY2ssIHRoZSBk
cm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UoKSBwcmludHMgYSB2ZXJ5IG5vaXN5CmVycm9yIG1l
c3NhZ2UgYWJvdXQgbWlzc2luZyBwb3J0IG5vZGUgZm9yIGV2ZXJ5IG91dHB1dCB0aGF0IGRvZXNu
J3QgaGF2ZQphIGdyYXBoIHNwZWNpZmllZCBpbiBhIGRldmljZS10cmVlIChIRE1JLCBEU0kgYW5k
IGV0YykuCgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS43LXJjMS9zb3VyY2Uv
ZHJpdmVycy9vZi9wcm9wZXJ0eS5jI0w2MjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
