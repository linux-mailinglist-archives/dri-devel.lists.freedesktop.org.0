Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DE0BB597
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951BD6E909;
	Mon, 23 Sep 2019 13:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA846E909
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 13:40:11 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id o80so5464785ybc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 06:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=FUFitBHnVlCQl7UwSMp5w/FoE2mKV7N+/xkfpue4dYw=;
 b=P+9GoFVjiAsJmoalJh8bp0qSqaUHUVfFodmsbCsvCLvGx18lSPBvxQ5bfgx7hlW7LY
 h7ynl3cQmXQxIRXvGs+sIFHTY9G++yAVIWhUw6a5uIsbJJJod4VjDOmgv+bihPUWwF6t
 XhtbL04oF3BxMhx8QhK6bA3M1Fwm3po/kvFr3hB8uocQg6OsX2UyYmDdwffTwqIrCK1M
 /QUAqK58sd0abCVRnOE9twta9p7xngdawMSBbB+1t8JlwxoQ+PVpIScPeO9u5cwjk9i+
 i8yDlxMWgeYSuQBmU8JIddIDRxgCXH4Blq+AdhSLcy2/cirR6TTz6EfSvclopl5NEGJo
 h43Q==
X-Gm-Message-State: APjAAAURO6djYahPWghejKMobw10Xg7c2uHp315OGU41GjAR52mOq7YO
 mry5KvJrTcmqzyKsNH+Te+p7kA==
X-Google-Smtp-Source: APXvYqwz2iUg8T4C+Y89Dq3TTXFOBkaA2Vv6zCCqyFe0Z0oZw7jcdRINdcbbmONDFAltN47FCRgHbw==
X-Received: by 2002:a5b:511:: with SMTP id o17mr17985967ybp.508.1569246010961; 
 Mon, 23 Sep 2019 06:40:10 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id y67sm2624892ywd.63.2019.09.23.06.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 06:40:10 -0700 (PDT)
Date: Mon, 23 Sep 2019 09:40:09 -0400
From: Sean Paul <sean@poorly.run>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/2] drm: Fix duplicate const warning in
 drm_gem_ttm_helper.c
Message-ID: <20190923134009.GY218215@art_vandelay>
References: <20190920193558.89815-1-sean@poorly.run>
 <20190923065929.4dcs7k6sb63ueyax@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923065929.4dcs7k6sb63ueyax@sirius.home.kraxel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=FUFitBHnVlCQl7UwSMp5w/FoE2mKV7N+/xkfpue4dYw=;
 b=bThh4M9UDsgIfkvn2Cew8F6LWPiboIKqeEcuge2r+pZUtbwVAl+AYBo0BcYAn7/JTa
 PrAOSU4TtLzWdgQrvw+OCXI2VJpuOmVtWvGFr2EPUKXPCJDRAEAMrI15/uGNtZx3a3Pg
 mX5KqBvZ9Za2K2R+LNAhrhgWoh93zoZA68lWWKbxrsD/qU6ciMOyyNCnIBvnO5yUiQ53
 /PGrHjqx4yhPD0JDlpayjn83YXqWIzyEOZK2ITUdalzuhfLaoWE613bMVFCwonaWB95e
 xAA3M9AewXFIlX43QdT30KeACZpTBuwAB5H+2pUk3qUPl/V6hi5TI9n6+Tm/pMjm42gW
 JJyQ==
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDg6NTk6MjlBTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBPbiBGcmksIFNlcCAyMCwgMjAxOSBhdCAwMzozNTo1MVBNIC0wNDAwLCBTZWFuIFBh
dWwgd3JvdGU6Cj4gPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiA+
IAo+ID4gRm9yIHRoZSB3YXJuaW5nCj4gPiAuLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1f
aGVscGVyLmM6MjY6MjA6IHdhcm5pbmc6IGR1cGxpY2F0ZSDigJhjb25zdOKAmSBkZWNsYXJhdGlv
biBzcGVjaWZpZXIgWy1XZHVwbGljYXRlLWRlY2wtc3BlY2lmaWVyXQo+IAo+IEkgaGF2ZSBhIGRy
bV9wcmludF9iaXRzIHBhdGNoIGluIGZsaWdodCB3aGljaCBmaXhlcyB0aGlzIHRvbyAoQ2MnZWQg
eW91Cj4gb24gdjIpLgoKQWggbmVhdCwgdGhhbmtzLgoKU2VhbgoKPiAKPiBjaGVlcnMsCj4gICBH
ZXJkCj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21p
dW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
