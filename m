Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15470123BFC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 01:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA7E6E1F7;
	Wed, 18 Dec 2019 00:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00EE6E1F7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:52:35 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id x5so186122ila.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AYVMcfsYQ7/My9/CMSR2wcI0dgtFvQ4q3wHm6ZJbP7A=;
 b=FofQNljNG3XnDs6PJ7xFcBeDlHTzYOtvZ01PQExhZPG6io6qRbCyfSDgrfJus9w+RY
 EUKujDmdEuxs/2PL/yBZHnD0GDVJoKMAHnu8p4swz9hLkIom6X/4WAiA38KgIBg9eSPm
 LuXAOqwZ0wpbfJx4OFtWnU3nUhr2MWfrpndIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AYVMcfsYQ7/My9/CMSR2wcI0dgtFvQ4q3wHm6ZJbP7A=;
 b=Vjt4DcMmy+o4q/9L7zCBWssgF8EwwbK0MncRwfpyehrLrZmeQphx6Z0YWYlMG5caWn
 6ovvTgeaYhc5BANoZrb3QgNcys0IEd1T3quhLo39epbyei+hcbLpncUPDswe4iscDMR6
 wywijAdfAreccp/A1XR04gf7BOl1ff9lBpEi1S1gTfpJCV+/8ykXb3OycUAlXIqXU5f2
 +fcvLTutl5Vjn2gMq1ijZyyFtQoLNb/VN83b+aTBTg8mW+cVXxVqRv2zQzmYAJFpYXwn
 NQyfPLJyGvlR+3n03nXgM3vHhbVNGDOoIFf6vCdcrh2m7U0941kIdz/g9lpLBUXk/UM6
 iXdw==
X-Gm-Message-State: APjAAAWfQZFxiBdZndQkrkdGaQCqL+8Q0mfvPc2cMZ+Cmv9SdBkdku0E
 qXhQe7Jk3YGu6qwUTAKR97OV6U15Gzo=
X-Google-Smtp-Source: APXvYqxZMsl1Y+PPtE8nFORUBRyCcRLbuOEPMURhuOsZZdoKoGmckhonII0RMXEQF13cnoX8p7AIdQ==
X-Received: by 2002:a92:9e99:: with SMTP id s25mr652060ilk.80.1576630354873;
 Tue, 17 Dec 2019 16:52:34 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43])
 by smtp.gmail.com with ESMTPSA id o70sm135834ilb.8.2019.12.17.16.52.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 16:52:34 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id s2so136023iog.10
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:52:33 -0800 (PST)
X-Received: by 2002:a6b:be84:: with SMTP id o126mr546930iof.269.1576630353286; 
 Tue, 17 Dec 2019 16:52:33 -0800 (PST)
MIME-Version: 1.0
References: <20191213154448.8.I251add713bc5c97225200894ab110ea9183434fd@changeid>
 <20191215200459.1018893-1-robdclark@gmail.com>
In-Reply-To: <20191215200459.1018893-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Dec 2019 16:52:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U_trS6U4wTRMnW0_7xCjxqdTkTV5vmhyMC=vGbNAhQdw@mail.gmail.com>
Message-ID: <CAD=FV=U_trS6U4wTRMnW0_7xCjxqdTkTV5vmhyMC=vGbNAhQdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] fixup! drm/bridge: ti-sn65dsi86: Train at faster
 rates if slower ones fail
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBTdW4sIERlYyAxNSwgMjAxOSBhdCAxMjowNSBQTSBSb2IgQ2xhcmsgPHJvYmRjbGFy
a0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21p
dW0ub3JnPgo+Cj4gRml4ZXM6Cj4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYzoyNToKPiAuLi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RpLXNuNjVkc2k4Ni5jOiBJbiBmdW5jdGlvbiDigJh0aV9zbl9icmlkZ2VfZW5hYmxl4oCZ
Ogo+IC4uL2luY2x1ZGUvZHJtL2RybV9wcmludC5oOjMzOToyOiB3YXJuaW5nOiDigJhsYXN0X2Vy
cl9zdHLigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV21h
eWJlLXVuaW5pdGlhbGl6ZWRdCj4gICAzMzkgfCAgZHJtX2Rldl9wcmludGsoZGV2LCBLRVJOX0VS
UiwgIipFUlJPUiogIiBmbXQsICMjX19WQV9BUkdTX18pCj4gICAgICAgfCAgXn5+fn5+fn5+fn5+
fn4KPiAuLi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jOjY1MDoxNDogbm90
ZTog4oCYbGFzdF9lcnJfc3Ry4oCZIHdhcyBkZWNsYXJlZCBoZXJlCj4gICA2NTAgfCAgY29uc3Qg
Y2hhciAqbGFzdF9lcnJfc3RyOwo+ICAgICAgIHwgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fgo+
IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVk
c2k4Ni5jOjI1Ogo+IC4uL2luY2x1ZGUvZHJtL2RybV9wcmludC5oOjMzOToyOiB3YXJuaW5nOiDi
gJhyZXTigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV21h
eWJlLXVuaW5pdGlhbGl6ZWRdCj4gICAzMzkgfCAgZHJtX2Rldl9wcmludGsoZGV2LCBLRVJOX0VS
UiwgIipFUlJPUiogIiBmbXQsICMjX19WQV9BUkdTX18pCj4gICAgICAgfCAgXn5+fn5+fn5+fn5+
fn4KPiAuLi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jOjY1NDo2OiBub3Rl
OiDigJhyZXTigJkgd2FzIGRlY2xhcmVkIGhlcmUKPiAgIDY1NCB8ICBpbnQgcmV0Owo+ICAgICAg
IHwgICAgICBefn4KPiAgIEJ1aWxkaW5nIG1vZHVsZXMsIHN0YWdlIDIuCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKClRoYW5rcyEgIEkgaGF2ZSByb2xs
ZWQgdGhpcyBpbnRvIG15IHYyLgoKLURvdWcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
