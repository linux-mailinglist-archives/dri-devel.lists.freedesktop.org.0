Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EA422815D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 15:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F1A6E25D;
	Tue, 21 Jul 2020 13:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754A86E25D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 13:52:37 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a14so6439762wra.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 06:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=a/xttlG5Xmu7Wk/M4tJwIHBfITlAjLmITWDdy7PgMM8=;
 b=yZZ6QXaSmRA7KyXsnWq2IouBLSRUuYnLNl6nG/ze/pUjh+PeiAbgftj93TcMZLGIb1
 XEbbqQ38j9OzsMbSOiDaoURO4nenUnOwAopy7wubW+1Bb9bnet96gvXNS++rJg4l/kVh
 pslstSlN8mQHKviN1lk+5RRGKIOQks34LCm8QkLWAsv6duX0hUaqsm+uxFKawnCXn+42
 WlSRI0FUu0TEbBmhbYTBg35MVInwjTL7GrCuJlqHsPxKZe0iS3/VViDta+jhjTtQVY67
 NIdv/HZU2H1Q+vuE9+jzghSlMEtDB7YEHDzuJiprBaaM8pwqdIZGQmuNt3arjdH/tUz2
 Jp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=a/xttlG5Xmu7Wk/M4tJwIHBfITlAjLmITWDdy7PgMM8=;
 b=eDuZjA+/vz2Sckk0HJ0A63AY2o6bJbMC6se56LndInNfThA6Ya7zqEz/KsmU1Pr4gw
 yZenbMEOVps0oC/ehY/Ej0xSPQnCZptynr3Lt7y+b+iX3QZFff8/LzEKCRnasPuyapOy
 4qgGEJChOLT4D5Hfel3V7pF9M+hGY/9M0FB/atDeOPxtiJHkkXQPbEiF9L6JrsLlQddd
 QXlySvCi8MPpTF6VAd7OcG48VUO2bDNP0oMpf+vZCZcsyJQ/7ZpPQOa8Ceo20L0UM2TY
 PWG5ob5YsyuzaMX/AyLBjEQunMqgF0S6tMVw+dg7OFqDZ3VEyfPb+hnwCmC9P0vbhBJ9
 yUpQ==
X-Gm-Message-State: AOAM531Gcb0Le9UXEYSk+IXJ3CvLHfw4DDOFjTQSxpqGBBiwOMdO5DW4
 PcBzA1DYfxztm0iYRyyL3YT5hw==
X-Google-Smtp-Source: ABdhPJx8QQ+edlbQkzaooVBvyxptignCQ9uQq5RqF/oWQQwrUwcKLUiSRqozu4UcoqmhYtAp2bsirQ==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr2026322wru.364.1595339556090; 
 Tue, 21 Jul 2020 06:52:36 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 65sm3567880wmd.20.2020.07.21.06.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 06:52:35 -0700 (PDT)
Date: Tue, 21 Jul 2020 14:52:33 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] video: backlight: cr_bllcd: Remove unused variable
 'intensity'
Message-ID: <20200721135233.53gmti745t66la5i@holly.lan>
References: <20200721073919.925935-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721073919.925935-1-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjEsIDIwMjAgYXQgMDg6Mzk6MTlBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IEZpeGVzIHRoZSBmb2xsb3dpbmcga2VybmVsIGJ1aWxkIHdhcm5pbmc6Cj4gCj4gIGRyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L2NyX2JsbGNkLmM6IEluIGZ1bmN0aW9uIOKAmGNyX2JhY2tsaWdo
dF9zZXRfaW50ZW5zaXR54oCZOgo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9jcl9ibGxjZC5j
OjYyOjY6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhpbnRlbnNpdHnigJkgWy1XdW51c2Vk
LXZhcmlhYmxlXQo+ICA2MiB8IGludCBpbnRlbnNpdHkgPSBiZC0+cHJvcHMuYnJpZ2h0bmVzczsK
PiAgfCBefn5+fn5+fn4KPiAKPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+
IENjOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IENjOiBK
aW5nb28gSGFuIDxqaW5nb29oYW4xQGdtYWlsLmNvbT4KPiBDYzogQmFydGxvbWllaiBab2xuaWVy
a2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+IEZpeGVz
OiAyNGQzNDYxN2MyNGYgKCJiYWNrbGlnaHQ6IGNyX2JsbGNkOiBJbnRyb2R1Y2UgZ3Bpby1iYWNr
bGlnaHQgc2VtYW50aWNzIikKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgoKSSBkb3VidCB5b3UgYXJlIGF3YWl0aW5nIHRoaXMgZm9yIGEgb25lIGxpbmUg
Zml4dXAuLi4gYnV0IGp1c3QgaW4gY2FzZToKClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24g
PGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgoKCkRhbmllbC4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
