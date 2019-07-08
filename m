Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C78262570
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 17:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F3E89F35;
	Mon,  8 Jul 2019 15:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7F989F2A;
 Mon,  8 Jul 2019 15:56:03 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 207so43580wma.1;
 Mon, 08 Jul 2019 08:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j7GFFUAxkwmd9bZW5ALeCVgIwc3/UM2OlBr8OH2HiFo=;
 b=p6ZPWflHplMzvzOG4KusULs02GY4scEFvOp+/Ui4laGegVrY5CISw0qbSDSx8yQ2lM
 ieElUB58REvDEoybz7alc/RC4WzVViFIaXuvfCfrQZSFdN6VIoKCjFdJsIGFb1jN42Rr
 DuNFzWcRAUt4KNZievWJH1/t5vbVjS3kzUXML1V0RgztTLINmYVSZtR9cb6/wd4Yu0Rv
 P6Dd+xioLqCmq17pgB29kulXKaHgO6qqkONsxwc4Mus4NRKOUQyj729/r3WjGw2ctxYz
 KFsJ/CrPy3w+UYaBrV83PORPZ8W75slXkRHq9DPx+Q/SIShH91AXeOzubnnfdPbk5Caq
 w0DA==
X-Gm-Message-State: APjAAAUHAk9LAinfC1qMWFXJdiF6cDIScMhOlt9mXS/sMmGLicMS0lGs
 U70Faw1qRWDwgAQaISpVxanuYlQyIXc9ijmfCSHehQ==
X-Google-Smtp-Source: APXvYqwvdG9n4dfYmbjZx6tcKpI5aNX/GwQXmiYbc9MMXPeVWi4xE5HFNth6IXVYz3I5PXLtA+BXJt1qVYH4jveeJp8=
X-Received: by 2002:a1c:9e90:: with SMTP id h138mr18280832wme.67.1562601361884; 
 Mon, 08 Jul 2019 08:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190704055217.45860-1-natechancellor@gmail.com>
In-Reply-To: <20190704055217.45860-1-natechancellor@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Jul 2019 11:55:50 -0400
Message-ID: <CADnq5_MGzLLMNPSQXpdxwrBpvsp7Fd1KdExS-K4yNeDBQYEGMg@mail.gmail.com>
Subject: Re: [PATCH 0/7] amdgpu clang warning fixes on next-20190703
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=j7GFFUAxkwmd9bZW5ALeCVgIwc3/UM2OlBr8OH2HiFo=;
 b=vP57rgZvG1ta2wCxkTIBQnUFffTIerXQNC4aDKpFGhSu63chgpd4Xsme91y7VyfxFe
 fI8mnKFRZZAWuZbVN4ghaicILvv72fJ+R5rtcPg25zc9xbptMKFXreA7uhJ1m6Oi6deb
 XWqejMLtLB/d51TskK0+yiHOhda1NF410nhJ+8HJ6SJuzpQ5PLyr+WhGwW5k8vrtImry
 kQX6B6yUYBozQh/l6+IybWELaOmcGOfFhDayyLrPssfkKqToQhVgkv9E9NYu31uSpP45
 FnCDD2+v7PJMbq3oJEX2opxDK1vvEUg9K/qw8WWChA+gp9/PZ7HAzixdtPjEXz05yv+L
 I2QA==
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
Cc: clang-built-linux@googlegroups.com, Leo Li <sunpeng.li@amd.com>,
 Rex Zhu <rex.zhu@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZCB0aGUgc2VyaWVzLiAgdGhhbmtzIQoKQWxleAoKT24gVGh1LCBKdWwgNCwgMjAxOSBh
dCAzOjI2IEFNIE5hdGhhbiBDaGFuY2VsbG9yCjxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+IHdy
b3RlOgo+Cj4gSGkgYWxsLAo+Cj4gSSBkb24ndCBkbyB0aHJlYWRlZCBwYXRjaGVzIHZlcnkgb2Z0
ZW4gc28gaWYgSSBoYXZlIG1lc3NlZCBzb21ldGhpbmcgdXAsCj4gcGxlYXNlIGZvcmdpdmUgbWUg
OikKPgo+IFRoaXMgc2VyaWVzIGZpeGVzIGFsbCBvZiB0aGUgY2xhbmcgd2FybmluZ3MgdGhhdCBJ
IHNhdyBhZGRlZCBpbgo+IG5leHQtMjAxOTA3MDMuIFRoZSBmdWxsIGxpc3QgaXMgdmlzaWJsZSBp
biB0aGUgZ2lzdCBsaW5rZWQgYmVsb3cgYW5kCj4gZWFjaCBmdWxsIGluZGl2aWR1YWwgd2Fybmlu
ZyBjYW4gYmUgc2VlbiBpbiB0aGUgR2l0SHViIGxpbmsgaW4gZWFjaAo+IHBhdGNoLgo+Cj4gaHR0
cHM6Ly9naXN0LmdpdGh1Yi5jb20vNTQxMWFmMDhiOTZjOTliMTRlNjBjNjA4MDBlOTlhNDcKPgo+
IEFsbCBvZiB0aGUgd2FybmluZ3MgYXJlIGZpeGVkIGluIHdoYXQgSSBiZWxpZXZlIGlzIHRoZSBv
cHRpbWFsIHdheSBidXQKPiB0aGUgZW51bSBjb252ZXJzaW9uIHdhcm5pbmdzIHdlcmUgdGhlIHRy
aWNraWVzdDsgcGxlYXNlIHJldmlldyBjYXJlZnVsbHkKPiBhcyB0aGUgY29kZSBwYXRocyBmb3Ig
c29tZSBvZiB0aGVtIGhhdmUgY2hhbmdlZCAoZXNwZWNpYWxseSBpbiBwYXRjaCAzCj4gYW5kIDYp
Lgo+Cj4gVGhhbmsgeW91IQo+IE5hdGhhbgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
