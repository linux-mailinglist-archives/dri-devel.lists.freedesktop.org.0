Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7970E274F55
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 05:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8BC6E107;
	Wed, 23 Sep 2020 03:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8EF6E107;
 Wed, 23 Sep 2020 03:01:27 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id e23so25689167eja.3;
 Tue, 22 Sep 2020 20:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gOojx+HNvqSVgIted5OL+X0FuEsZeCka+hK+XKnYZ/k=;
 b=Wf7haWMqJ+qOOyqyH+rWrwgvPuBAp178N7qXP/Wk8yALc8At/YQZ0GRs5whjxlFwSG
 w7dDpSdveGnw+3vEY+vbpggfkhOkbq6tG6uvwoz9dtblN9dg7X2tTGXhSvlfqdaeJ/BO
 sCtQJuta/Xs3GF7LTR9RUCE1Ln1oYD0cnDD+lEjwB+U7inQMcHB/9OBHVwf3ZiWFTXLk
 crsJ/1KVwfSW1DZS3N/mFTwhrvR5nJSmMvOG7IXhHgSBN25B6tFcp3imj1TtepRAgE7A
 qzAGDspPhkIBkHw7ilItS1t3mqNAqu7W5bfb3vLOz9bjU36NkZzQc/Nvgmveff+CAy4z
 voqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gOojx+HNvqSVgIted5OL+X0FuEsZeCka+hK+XKnYZ/k=;
 b=YHmaPHYSfw019q/01B0f/hkqLa/eyS1US3pmlhcBG0/JwABkoxuW3ZkBCSAh1W4O28
 9CUTPtu1eziKCyJJo8u5CziT7AHiKs6dvrhSWY47RiFuTQRPFwW+wATUhvqTA3mjbwhp
 LlUs1AsT/tIJ2WiP10TGmg8JkTU95FkFQqPoqW3+iBFREwQROG+BMnOyLefW1oGrpgX5
 W//+oxe6jvKQsg9kLXlJ6PATRlmSMM4rd0kXTjPlcdq+y9Ki+UjW5ZgMjzDph6/iWlCT
 PbumEm2Gn+ieC5GmbEBXCQGRYVPmdTEH1NdB2tBCltq8yv68KAi3Cbhgjn4VDsMiwprB
 Qq8g==
X-Gm-Message-State: AOAM533TBG4g9bQCmDi5A7/PcAM8jWZ/2X7s6ZuR9YYSFzxlKGd/WbRW
 1wNa8hBFPdBQkeVlTI3vFju1zVVBhpM1MTXIl8wlX8ud
X-Google-Smtp-Source: ABdhPJzW0X+uvrpBbSgw1hTq0+vyynyVZTXPlBxrK8/DcsH9Xj4RSYVZsQjedN88BtY+/PhivfWzBPB+3pLeczEA30E=
X-Received: by 2002:a17:906:f92:: with SMTP id
 q18mr7903128ejj.237.1600830085894; 
 Tue, 22 Sep 2020 20:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200922133208.1273-1-christian.koenig@amd.com>
In-Reply-To: <20200922133208.1273-1-christian.koenig@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 23 Sep 2020 13:01:14 +1000
Message-ID: <CAPM=9tzhALOXZeuzGaaNS=ThrZNXLSZuaKYnp7XK7SyzX+8-yw@mail.gmail.com>
Subject: Re: [PATCH 01/11] drm/ttm: add ttm_bo_pin()/ttm_bo_unpin() v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 Linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMiBTZXAgMjAyMCBhdCAyMzozMiwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQXMgYW4gYWx0ZXJuYXRpdmUgdG8g
dGhlIHBsYWNlbWVudCBmbGFnIGFkZCBhCj4gcGluIGNvdW50IHRvIHRoZSB0dG0gYnVmZmVyIG9i
amVjdC4KClRoZXNlIGFsbCBsb29rIGdvb2QgdG8gbWUsIG5pY2UgY2xlYW51cC4KCkZvciB0aGUg
c2VyaWVzOgpSZXZpZXdlZC1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
