Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0605F3C9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B816E299;
	Thu,  4 Jul 2019 07:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054BA6E299
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 07:32:24 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k18so5114485ljc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 00:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=juvnYszAUvejuyyqSkkayCSFcFTrpjVkjP1WiVliqcY=;
 b=AzOUcOkMo2vpwTHEp92MY8p3Vsppx6SLN8zo9BfUlCtcAgoypI6TKkjlTWk7s03Q2Z
 87VaPM+aby1Y0HfTuvST9a8PyXXdkP73kIU4cMHQ51edf80PkSrSnW6aRtD5da7o1/Ae
 rqhqAAaeiCc0PPmngFnhvoyMxqZnfrP10lwImkDDPvwVZhYEBfanRtJLy/dktFp69Fwo
 LrRIus4fKu9Ym3OZcT26cJe7JO0e6Jff2SWwYFnM66bR+XRWr/QlxsjdSJRPZMZz1mrb
 JlFu9clScxZAcu1H+8nLt5PNWXyXNlZQj3sCdT2SMUJcfHOAHH9unVZUg/gJsOYKWzmW
 r/GA==
X-Gm-Message-State: APjAAAVp56qVOcJcBLr10Qb3lrnYRG//cASqKKpZHjqMtXAF5i+GMAcU
 y3KV60sJfW+gDVdnaNOnNk3NWWNOmZXbH8PYDZvtO4ht
X-Google-Smtp-Source: APXvYqx4PeKaBxi1+To82pBs1il62kNH95mpoyycItGH4PPxnDTJyWsdO5kWeKRhyLAFq4t6mfXjQ73rhIQXMC3waZI=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr23991624ljm.180.1562225542520; 
 Thu, 04 Jul 2019 00:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-5-sam@ravnborg.org>
In-Reply-To: <20190630061922.7254-5-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Jul 2019 09:32:10 +0200
Message-ID: <CACRpkdaCLBP9T4UhPFM96G_cCSuX_xoj+3_4f-TttQnkqgau0Q@mail.gmail.com>
Subject: Re: [PATCH v1 04/33] drm/tve200: drop use of drmP.h
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=juvnYszAUvejuyyqSkkayCSFcFTrpjVkjP1WiVliqcY=;
 b=txEINccxi1Y7aFQdkNzdrTEhZoD8jrOeB1lNGc1IaKvv+VmM6wfORO1mEL7rq8qMx+
 BgnX9KfD/xlMD6vgZs1v2bFJTUKbhQbHxN2ggI26/67su+YXkboPPDf/XdyPoNYlJg06
 gr986EQdDvWLwtOqubOwuQxyAaYGEBqR/fsIctd9odnrc85ZfmnIB7DOkaHosrMwD/KI
 Cex3eb2voCG/Plv21Uaw8tqufkkey62MRshFWdZnofVpaIovtgvaxewPB+oG9vxsazO3
 tBfs6FnCTz52bONsZVqDIYiWrb/AuYEV8SNZkd5AORCApeL0JTXcD4a1KoyJEgP2br7Y
 c0+g==
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgODoxOSBBTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgoKPiBEcm9wIHVzZSBvZiB0aGUgZGVwcmVjYXRlZCBoZWFkZXIgZHJtUC5o
Lgo+Cj4gRml4IHNvIGhlYWRlciBmaWxlIGJlY2FtZSBzZWxmLWNvbnRhaW5lZCwKPiBhbmQgdGhl
biBmaXhlZCBmYWxsb3V0IGluIHRoZSBvdGhlciBmaWxlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KClJldmlld2VkLWJ5OiBMaW51
cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVp
agpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
