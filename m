Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8877A1237E
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 22:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD5088584;
	Thu,  2 May 2019 20:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5ADC88584
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 20:38:15 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r7so5125525wrr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 13:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V4BbxkHUcBeSlLKPmHoACtDuguCWzjyzgRqKm9NaP8Y=;
 b=o/yK5vo49cnAQjUH80W/z4KOgeVnD4X9c8IkAVaYQlQH5xBPIReQtWwET3PFNvkuY3
 0tHXA33nRxkbTPA+KQ4MtwEcL2SvzbkHaCqnu1OKR4VTyDfP71xKUDoia5N+TWekOdm7
 N9XGrKrR9t3fRs1Ba90eG6I1ONga/UndRRdjt+e4pvq+B4ctjotyb6XME06sJ/OJ+E3Z
 51tEIsx6o/1+60NgPjI5NCjie1smQ8fZAHVqW3CEvkVYhkQuIX75+lDU8H7YL5//R7Mz
 yLQ7xjVsHDjDsV08z0aSHBhgJ1ifBkR2XWqRYGeoK6JhGSnb2wMmzUKGOTflgDRiBhB+
 nWPA==
X-Gm-Message-State: APjAAAUXFzRmITJafvWK5odhY/RRYrttXavF92t5uiWWtSnH5TiHc0Sm
 x3ZHywSyGsx5b9BTSShFkYwj+QbIwe2bm2+3E28OQA==
X-Google-Smtp-Source: APXvYqxFqRDijcbL7leTPOKhYnK87WQp5/asSC2J0tuRB9ocWoqthjf09ONuE95eKUfCD4kUg/i/CQrFOHcgUtIbXf8=
X-Received: by 2002:adf:dfc3:: with SMTP id q3mr4007163wrn.192.1556829494163; 
 Thu, 02 May 2019 13:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190502180346.4769-1-john.stultz@linaro.org>
 <CAOvepGk_0UTnXztVgXh6qYGBF_3aQFBqs4HUpwhmfMV0G8TMNQ@mail.gmail.com>
 <CAJs_Fx6N88yG_67gnkYLWnOyADa3EkCk8CBk9gFfza+oNijnkQ@mail.gmail.com>
In-Reply-To: <CAJs_Fx6N88yG_67gnkYLWnOyADa3EkCk8CBk9gFfza+oNijnkQ@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 2 May 2019 13:38:02 -0700
Message-ID: <CALAqxLWfZjwvWCAFcfy2J_KU+m-c9xZQiKu7t4zr7s9y7pMWsA@mail.gmail.com>
Subject: Re: [RFC][PATCH 0/3] mesa: Initial build fixups for AOSP/master
To: Rob Clark <robdclark@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=V4BbxkHUcBeSlLKPmHoACtDuguCWzjyzgRqKm9NaP8Y=;
 b=AEpb9u0hMM95T3bT5yY54hwfaB7Tgk8WTHYLf5n4kOzDPcctG9SzKYI6WBFsRrOnsf
 iTccQGX37den4KQ5kfUvBHlo/2IRwi8Meo1s4dqmweJcvVJjLTiyx6LY/G8wMuxj1CbI
 4502HetAehcK2a8fbzs8XMRhJNfXa2ahlth0PbmNM90xKVi/ob2RGRMnGKA7Aq0RvS42
 uc65k5s4Ni9xGFwLXkwiNxK4G3Pdq2g9Wjyakh8dBvSXhqJXMNQFnzTM+Fp0kO6XSRxj
 ZlzLPuyzgjvUyc6MihS5ad4v6l6GseMkt7JokJLBkf98hb1u39UawByd9y9tg1b4ZfZ7
 MkcA==
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Greg Hartman <ghartman@google.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dan Willemsen <dwillemsen@google.com>, Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCAxOjMxIFBNIFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9t
aXVtLm9yZz4gd3JvdGU6Cj4KPiBmeWksIEpvaG4gcHVzaGVkIGEgTVIgdy8gdGhlIHNhbWUgcGF0
Y2hlczoKPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhL21lcmdlX3Jl
cXVlc3RzLzc5NQo+Cj4gKEknbSBub3QgcmVhbGx5IGFuIGV4cGVydCBvbiBhbmRyb2lkIGJ1aWxk
IHN5c3RlbSwgYnV0IGlmIGl0IHdvcmtzLAo+IHRoZW4gYWNrLWJ5IGZyb20gbWUpCj4KClNvIHRo
ZXJlJ3Mgb25lIG5ldyBpc3N1ZSB0aGF0IGNyb3BwZWQgdXAgd2hlbiBJIHJlLWJhc2VkLCBidXQg
SSdsbApoYXZlIGEgZml4IGZvciB0aGF0IGhlcmUgaW4gYSBzZWNvbmQgYW5kIHdpbGwgdXBkYXRl
IHRoZSBNUi4KCnRoYW5rcwotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
