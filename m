Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71190814B4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 11:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87D46E2E1;
	Mon,  5 Aug 2019 09:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE8A6E2E1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:06:08 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id u10so18552122lfm.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 02:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLBpb+diR4xKThCabUve5SH+XVoaGLS8VBszK8IEazE=;
 b=guNmI1OFtE41sKClr+yL4lDjGRFqWDl/++OFS2EytYqK8erNy9KgLrDa5/7ZZg308z
 ZdW04t/dpTZNDcTx3b3SNBgLvcBAH8ijvpsA4F41O9YNsAiHYXA4PbMqJiuEqaCI2xRA
 /6iiCA95czBOIEkyobYKoF1nxZYztHqddZw/frcgl0Z96kXfn+Amin58vgB/Bwphv+3y
 PHeeRLlxmQu+Su/v3kqQW0J5S3Hu9hBdIVBUYsRkQZIOAlvJ4dOlHrWiP2e0Pt1Mt6RZ
 V3iJ77xhBuJ2ERNTQIYj8F5Q6wnj04OA3yM+vqT6X+5EZ8mprfJYBULTiGBM+W73LbPq
 z0FQ==
X-Gm-Message-State: APjAAAWvbaTZVZ+cMlsppkxC0PUaWi5iCh9QZknLDVsEoCAIY3PTa/bx
 hjhrAcnlWk1fSHj3UFnQXICixOUfLDJbczrLyUWdkQ==
X-Google-Smtp-Source: APXvYqxTU7rU4F6Kf9EeXqxDdi5RLJsNpLzBOiXmvg5ZpfkQrCL4+30jsuO4SBg/DQAAtdKes/XdNrrW4DbW2BrVGg4=
X-Received: by 2002:a19:e006:: with SMTP id x6mr69219817lfg.165.1564995966993; 
 Mon, 05 Aug 2019 02:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190708112803.12432-1-linus.walleij@linaro.org>
In-Reply-To: <20190708112803.12432-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2019 11:05:55 +0200
Message-ID: <CACRpkdYYmVjBV+gjiPfjzGUeP-8w+E8AV392ed2Y8cF6AeNPBg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/megachips: Drop GPIO header
To: Andrzej Hajda <a.hajda@samsung.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yLBpb+diR4xKThCabUve5SH+XVoaGLS8VBszK8IEazE=;
 b=l081yo2AvhEd99tmL+5/rebfDuYjz+apvyFlOSDNpHsAGTWdCuYPtMdEDEp4phpLBb
 r4B+KT5DmG5KLx+WIxNW6Ba1Mp6nNYXjdSMM2vLvZg60e+7Jl/UfjJ+KiVHmwPiaGgnW
 DXE6dpaNfvp51ErCwRTpPd4Qfk5rCjOMKVw9YQ0X1xfRqE30QQlWsGahOSgub4ZQGN3I
 uUFlPpRy++ZJP4Ok/gMOKQ26KZYM7kcBK5P+YeUxDM68qwsVIJNQJcrWco3SKCTCUBNc
 spdhMYbNaev/w8fJiWHj/2MXJ0cjDvljrsLU79Sb2u9K1vN/D+wnOwGyuIT3DoY5eaU+
 s2mQ==
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCAxOjI4IFBNIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFRoaXMgZmlsZSBpc24ndCB1c2luZyBhbnkgaW50ZXJm
YWNlcyBmcm9tIDxsaW51eC9ncGlvLmg+IHNvCj4ganVzdCBkcm9wIHRoZSBpbmNsdWRlLgo+Cj4g
U2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoK
U28gd2hhdCBkbyBJIGRvIHdpdGggdGhlc2Ugc2ltcGxlIHBhdGNoZXMgYXMgbm9vbmUgc2VlbXMg
dG8KQUNLIG9yIHJldmlldyB0aGVtIGZvciBhIG1vbnRoPwoKSSBndWVzcyBhcyBsYXN0IHJlc29y
dCBzaW1wbHkgYXBwbHkgdGhlbSB0byB0aGUgR1BJTyB0cmVlLCBidXQKaGV5LgoKWW91cnMsCkxp
bnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
