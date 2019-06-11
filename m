Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A708F417B8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 23:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A127F89110;
	Tue, 11 Jun 2019 21:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF5B89110
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 21:59:01 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c85so8292739pfc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=STdR09JTplMSpZu8BTmSobDKkVojc1fyDlFwggPK8Uk=;
 b=BGlLqGt/7zIxsw0uL3SumwMzQrrxYRskUJQz5hb+8mvfZwQrHcWQX9/ZVUYCnNXV+m
 ODUrrsT+B2gxDsNADzbon3pv48qZ9kjkyf7/da4e3R06Vl4uLTF7wltqVQ0Qz40RJsS3
 u1QkEL/5Ri9lY/PSGRjmHSobuwCK0NSZZboYf2wZl6SlSYuDf4N3x9AeU8wi/swma34t
 Qx3tC2SmrgKjHX/OMn9wLf5hH9SUe91X6WWHJBs2B6Ux4gj62ls6plfEZpPm//mXGpku
 NPCXKRQ4OZYgKv00KYHeuXhkQcTMkvi4RItja/ZpX3oc2tvDZB77aVGN5LFwwcoEr7IS
 T5rw==
X-Gm-Message-State: APjAAAWz4R+b4EJsv4nutzjxA39170nH0Awsp7o7JXiOlzE9Iiu+t6Ee
 b2R+eZhMQHrCyNKdA1XJ6bSn2Q==
X-Google-Smtp-Source: APXvYqwNRiFSWTAdFHpr/jTf2FF34I6ZRq0BdECtRnB+Jk555Y9lQHvSTV1z1QBb+8m6aiHhXzbajQ==
X-Received: by 2002:a17:90b:d8a:: with SMTP id
 bg10mr29155223pjb.92.1560290341471; 
 Tue, 11 Jun 2019 14:59:01 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id m2sm15311952pgq.48.2019.06.11.14.59.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 14:59:00 -0700 (PDT)
Date: Tue, 11 Jun 2019 14:58:59 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] backlight: pwm_bl: Get number of brightness levels
 for CIE 1931 from the device tree
Message-ID: <20190611215859.GF137143@google.com>
References: <20190610233739.29477-1-mka@chromium.org>
 <20190610233739.29477-2-mka@chromium.org>
 <20190611101843.GD7526@amd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611101843.GD7526@amd>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=STdR09JTplMSpZu8BTmSobDKkVojc1fyDlFwggPK8Uk=;
 b=MR5Ygywl093uFDulviOIYvyfuuIg7LVcRCENxaahnbQl3TWTuyLFxmaN/CsCFje4ZW
 lMOJpV5vlQByThnbSdpFW5pDrScHKNyi5Uayf6G9Qo/JGt6L3QsMwiyIsPBFjywBcNsB
 KOnwwUTJm+TTD2GsLYgy//6zZNVAYMjKqx244=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pwm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-fbdev@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF2ZWwsCgpPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAxMjoxODo0M1BNICswMjAwLCBQYXZl
bCBNYWNoZWsgd3JvdGU6Cj4gT24gTW9uIDIwMTktMDYtMTAgMTY6Mzc6MzksIE1hdHRoaWFzIEth
ZWhsY2tlIHdyb3RlOgo+ID4gQ29tbWl0IDg4YmE5NWJlZGI3OSAoImJhY2tsaWdodDogcHdtX2Js
OiBDb21wdXRlIGJyaWdodG5lc3Mgb2YgTEVECj4gPiBsaW5lYXJseSB0byBodW1hbiBleWUiKSB1
c2VzIHB3bV9wZXJpb2QgLyBod2VpZ2h0MzIocHdtX3BlcmlvZCkgYXMKPiA+IGFzIGhldXJpc3Rp
YyB0byBkZXRlcm1pbmUgdGhlIG51bWJlciBvZiBicmlnaHRuZXNzIGxldmVscyB3aGVuIHRoZSBE
VAo+ID4gZG9lc24ndCBwcm92aWRlIGEgYnJpZ2h0bmVzcyBsZXZlbCB0YWJsZS4gVGhpcyBoZXVy
aXN0aWMgaXMgYnJva2VuCj4gPiBhbmQgY2FuIHJlc3VsdCBpbiBleGNlc3NpdmVseSBsYXJnZSBi
cmlnaHRuZXNzIHRhYmxlcy4KPiA+IAo+ID4gSW5zdGVhZCBvZiB1c2luZyB0aGUgaGV1cmlzdGlj
IHRyeSB0byByZXRyaWV2ZSB0aGUgbnVtYmVyIG9mCj4gPiBicmlnaHRuZXNzIGxldmVscyBmcm9t
IHRoZSBkZXZpY2UgdHJlZSAocHJvcGVydHkgJ21heC1icmlnaHRuZXNzJwo+ID4gKyAxKS4gSWYg
dGhlIHZhbHVlIGlzIG5vdCBzcGVjaWZpZWQgdXNlIGEgZGVmYXVsdCBvZiAyNTYgbGV2ZWxzLgo+
ID4gCj4gPiBGaXhlczogODhiYTk1YmVkYjc5ICgiYmFja2xpZ2h0OiBwd21fYmw6IENvbXB1dGUg
YnJpZ2h0bmVzcyBvZiBMRUQgbGluZWFybHkgdG8gaHVtYW4gZXllIikKPiAKPiBJIGRvbid0IHRo
aW5rIHRoaXMgb25lIGlzIHN1aXRhYmxlIGZvciBzdGFibGUuIEknbSBwcmV0dHkgc3VyZSB0aGUK
PiBoZXVyaXN0aWNzIHdvcmtzIHdlbGwgZm9yIG1hbnkgYm9hcmRzLCBhbmQgeW91IGp1c3QgcmVw
bGFjZWQgaXQgd2l0aAo+IGFub3RoZXIgaGV1cmlzdGljcyAoIjI1NiIpLgoKd2hldGhlciB0aGUg
cGF0Y2ggaXMgc3VpdGFibGUgZm9yIHN0YWJsZS91cHN0cmVhbSBpcyBjZXJ0YWlubHkKZGViYXRh
YmxlLCBpbiBhbnkgY2FzZSBJJ2QgYXJndWUgdGhlIGN1cnJlbnQgaGV1cmlzdGljIGlzIGJvZ3Vz
IGFuZAp3b3JrcyBieSBhY2NpZGVudCBvciBhdCBhIGNvc3Q6CgpubGV2ZWxzID0gcGVyaW9kIC8g
aHdlaWdodChwZXJpb2QpCgp3LyBwZXJpb2QgPSAxMzEwNzEgbnMgICgweDFGRkZGKQoKICBubGV2
ZWxzID0gMTMxMDcxIC8gMTcgPSA3NzEwCgp3LyBwZXJpb2QgPSAxMzEwNzIgbnMgKDB4MjAwMDAp
CgogIG5sZXZlbHMgPSAxMzEwNzIgLyAxID0gMTMxMDcyCgphbmQgc29tZSBQV01zIHVzZSBzaWdu
aWZpY2FudGx5IGhpZ2hlciBwZXJpb2RzIGxpa2UgMSBtcyBvciAxMCBtcy4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
