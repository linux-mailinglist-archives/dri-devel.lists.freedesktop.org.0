Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9062B40F3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 11:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3000489C68;
	Mon, 16 Nov 2020 10:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDB489C68
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 10:25:33 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p8so18084128wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 02:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9yOkDKk8O8Zbcoo1oIBcwjMEFD0KCWNdx2glmywuk8k=;
 b=OzD+92wXybj6khN9/TPr3KHAFkzhaitOD8SQQ4Bm2lzi1Z7QO4ZVpz1FoGBdhcOT3n
 LlaOvxB8Q/pbIoz8BDwLBgAaxu4e2NZTK1Ny80T3WC6TxcQZ4nGWNPmrGIi1MTSjv/6v
 8MASxWc4Rn/8ftGFdZocRz6Zk9s10S7mnxK/wbyqEnvpNco7CF//OzDr5TSr0SbH9Zo9
 84TftOHzSdw5tQsAwclcKIz4UTMPm33r8BL2k+oGqGh+kc22/iDgJK8vHNO9Os2rzqKm
 GntVuVW5k/gQO45s77zbD3YIa7WFGtN6h4OTeXfvJP5KfjdBrn8RJqzh7cPU4MAfLUCk
 RzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9yOkDKk8O8Zbcoo1oIBcwjMEFD0KCWNdx2glmywuk8k=;
 b=AgibU7X2bivjfYCIEkq7AEiES90/yHBKrfbbptj7z3AukSAu2/amusD3Y81hQGK5LG
 /UbuhybQJqoBjEqB+XMdQ9Jw73d2UY7aKo+KImkaEQlm/lRM0El1fOI0z00e/F+Oqosd
 Zg4mECBApmVHTKfxZoNYHWgkBMZvY+5Slp7X4Pk+hKmEiHQ0UujuAgeEhOgsnvkfml34
 uxNjHc5efeNeqOqTSn9WHJRPDfyR/6fFUmUKlbIuGTUQPwjJ2DD+QopygN07yjlkya3U
 JlrhaRRNGDj3ltzSlhOaz2ECl1V8xGjUnK4kO7diUnjL+yuaZUyPD2TD1Bdt7VP2ZmVL
 K0Xg==
X-Gm-Message-State: AOAM530NX5qYKRtsYx+HohfXAlU2IGot/yiBMjQzAdpqoI0FZ/vk2Ps5
 TsaG7XsqXHEduVznzs/M6lPZ/AoCwoMT/GoU
X-Google-Smtp-Source: ABdhPJwmcKCBCMr7gcoJyJEIWKSc5TgNbHIt3p+CjCaJC1fuxdyZIRT3ZqbW2TBC6bIWej5RfmN78Q==
X-Received: by 2002:adf:f3d2:: with SMTP id g18mr19285633wrp.77.1605522332437; 
 Mon, 16 Nov 2020 02:25:32 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id e6sm19813883wme.27.2020.11.16.02.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 02:25:31 -0800 (PST)
Date: Mon, 16 Nov 2020 10:25:30 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 12/40] drm/pl111/pl111_display: Make local function static
Message-ID: <20201116102530.GN3718728@dell>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-13-lee.jones@linaro.org>
 <20201114191127.GB3797389@ravnborg.org>
 <20201116084023.GL3718728@dell>
 <20201116101734.GA65688@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116101734.GA65688@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxNiBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUsCj4gT24g
TW9uLCBOb3YgMTYsIDIwMjAgYXQgMDg6NDA6MjNBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+
ID4gT24gU2F0LCAxNCBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gCj4gPiA+IEhp
IExlZSwKPiA+ID4gT24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgMDE6NDk6MTBQTSArMDAwMCwgTGVl
IEpvbmVzIHdyb3RlOgo+ID4gPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWls
ZCB3YXJuaW5nKHMpOgo+ID4gPiA+IAo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwx
MTFfZGlzcGxheS5jOjM1Njo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKA
mHBsMTExX2Rpc3BsYXlfZGlzYWJsZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gPiA+ID4g
Cj4gPiA+ID4gQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4gPiA+ID4gQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4gPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+ID4gPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4KPiA+ID4gCj4gPiA+IEVyaWMncyB3YXMgbm90IGNvcGllZCBvbiB0aGlzIG9yIHRoZSBvdGhl
ciBwbDExMSBwYXRjaC4KPiA+ID4gQWRkZWQgRXJpYyBzbyBoZSBjYW4gYmUgYXdhcmUgb2YgdGhp
cyBmaXguCj4gPiAKPiA+IEVyaWMgQW5ob2x0Pwo+ID4gCj4gPiBIZSdzIG9uIENjPwo+IE5vdCBv
biB0aGUgb3JpZ2luYWwgbWFpbCBJIHJlY2VpdmVkLgoKTG9va3MgZmluZSB0byBtZToKCkRhdGU6
IEZyaSwgMTMgTm92IDIwMjAgMTM6NDk6MTAgKzAwMDAKRnJvbTogTGVlIEpvbmVzIDxsZWUuam9u
ZXNAbGluYXJvLm9yZz4KVG86IGxlZS5qb25lc0BsaW5hcm8ub3JnCkNjOiBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnLCBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PiwgRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPiwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiwg
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTdWJqZWN0OiBbUEFUQ0ggMTIvNDBdIGRy
bS9wbDExMS9wbDExMV9kaXNwbGF5OiBNYWtlIGxvY2FsIGZ1bmN0aW9uIHN0YXRpYwoKQWxzbyBy
ZWZsZWN0ZWQgaW4gR21haWw6CgogaHR0cHM6Ly9pLmltZ3VyLmNvbS9kNjlZVHp6LnBuZwoKLS0g
CkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIg
U2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0Nz
CkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
