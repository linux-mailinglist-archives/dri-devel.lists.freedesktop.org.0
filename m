Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDF2642B0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B89189B8E;
	Wed, 10 Jul 2019 07:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D6D89A9F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 11:55:57 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id m23so10439939vso.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 04:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BVsg21whGsT0nCQujzZPC48g95cuUgQWLBZNQAx+pZc=;
 b=nLlz2kf3Ve9KfEkBGv12raMF9lYhjLmWDzLiSO0+LrbrWH77nmaLLNx8v9SCCumdXv
 RDcUKJCcSnLq/DQ3kU8OtVkFgxgm+uM0oaY6hF1sjfSLAEGpd66Pz99oloDHYjbn3An9
 UCl5DmQiB0tdnpj34DCh25/Nh+1ed4M30UneF7ssu8yjgjNIOZe/SxhWzZggNZzjmYCW
 dkYRyt1o1QEHgNFKZsSJQ0k6sURkOtznpcFQ3YiNpQhrb+YXB8SZQ67PMkT9I6+kFy7G
 pbbHUD/vh4f1Niaj014gKLv4BB90GemnpMnhnMqqAfsikZBnrUUhm3RYNyjdWQl45LPF
 PqIw==
X-Gm-Message-State: APjAAAU+WemNRPiLqM6cwsoIgvSWUMJrEimxLLi5iq1DOLLqPxV6v4Ah
 BxdkkwEOcXpmm6yhDVC7LNMzyeLOnAslR1FzZEkd/w==
X-Google-Smtp-Source: APXvYqzIvsL1PEG4x0OPfoI+B4eR1OeQ7eQJVZ/D8bs1VUH/IGuRilDy9DOu2h4I32heosv7RyuyXtXOhjY3Ym1TCUo=
X-Received: by 2002:a67:ebcb:: with SMTP id y11mr13483911vso.138.1562673356146; 
 Tue, 09 Jul 2019 04:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-2-cychiang@chromium.org>
 <3d5755cf-34e9-44f7-3b03-6bdfca84ff95@intel.com>
In-Reply-To: <3d5755cf-34e9-44f7-3b03-6bdfca84ff95@intel.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 9 Jul 2019 19:55:29 +0800
Message-ID: <CAFv8NwLos-XcB9K8315vmmfKn+z0XaBph3QxSwrmqhfYqoju2Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: hdmi-codec: Add an op to set callback function
 for plug event
To: Cezary Rojewski <cezary.rojewski@intel.com>
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BVsg21whGsT0nCQujzZPC48g95cuUgQWLBZNQAx+pZc=;
 b=Hif8gvZ34qKJMh958dAAJSHO70lREX96FjBgtOfqYNFJyuQpBMR0C1BjfHgf8lDQ92
 sADjoOm6BOziZ8iFV4rfX/D+8PH0/e3yQd9VX01BYzeP27ufOcJLZvyArqht8aRbI3eJ
 IS7yqBpL3VKcMJ1o6/XM6Re5YNCRXm029XCfc=
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
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Doug Anderson <dianders@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgOSwgMjAxOSBhdCA3OjQ3IFBNIENlemFyeSBSb2pld3NraQo8Y2V6YXJ5LnJv
amV3c2tpQGludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDE5LTA3LTA1IDA2OjI2LCBDaGVuZy1Z
aSBDaGlhbmcgd3JvdGU6Cj4gPiArc3RhdGljIHZvaWQgaGRtaV9jb2RlY19qYWNrX3JlcG9ydChz
dHJ1Y3QgaGRtaV9jb2RlY19wcml2ICpoY3AsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgamFja19zdGF0dXMpCj4gPiArewo+ID4gKyAgICAgaWYgKCFo
Y3AtPmphY2spCj4gPiArICAgICAgICAgICAgIHJldHVybjsKPiA+ICsKPiA+ICsgICAgIGlmIChq
YWNrX3N0YXR1cyAhPSBoY3AtPmphY2tfc3RhdHVzKSB7Cj4gPiArICAgICAgICAgICAgIHNuZF9z
b2NfamFja19yZXBvcnQoaGNwLT5qYWNrLCBqYWNrX3N0YXR1cywgU05EX0pBQ0tfTElORU9VVCk7
Cj4gPiArICAgICAgICAgICAgIGhjcC0+amFja19zdGF0dXMgPSBqYWNrX3N0YXR1czsKPiA+ICsg
ICAgIH0KPiA+ICt9Cj4KPiBTaW5nbGUgImlmIiBzdGF0ZW1lbnQgaW5zdGVhZD8gVGhlIGZpcnN0
ICJpZiIgZG9lcyBub3QgZXZlbiBjb3ZlciBhbGwKPiBjYXNlcyAtIGlmIHRoZSBzZWNvbmRhcnkg
Y2hlY2sgZmFpbHMsIHlvdSdsbCAicmV0dXJuOyIgdG9vLgo+CkFDSy4KSSB3aWxsIGZpeCBpbiB2
Mi4KPiA+ICsvKioKPiA+ICsgKiBoZG1pX2NvZGVjX3NldF9qYWNrX2RldGVjdCAtIHJlZ2lzdGVy
IEhETUkgcGx1Z2dlZCBjYWxsYmFjawo+ID4gKyAqIEBjb21wb25lbnQ6IHRoZSBoZG1pLWNvZGVj
IGluc3RhbmNlCj4gPiArICogQGphY2s6IEFTb0MgamFjayB0byByZXBvcnQgKGRpcyljb25uZWN0
aW9uIGV2ZW50cyBvbgo+ID4gKyAqLwo+ID4gK2ludCBoZG1pX2NvZGVjX3NldF9qYWNrX2RldGVj
dChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHNuZF9zb2NfamFjayAqamFjaykKPiA+ICt7Cj4gPiArICAg
ICBzdHJ1Y3QgaGRtaV9jb2RlY19wcml2ICpoY3AgPSBzbmRfc29jX2NvbXBvbmVudF9nZXRfZHJ2
ZGF0YShjb21wb25lbnQpOwo+ID4gKyAgICAgaW50IHJldDsKPiA+ICsKPiA+ICsgICAgIGlmICho
Y3AtPmhjZC5vcHMtPmhvb2tfcGx1Z2dlZF9jYikgewo+ID4gKyAgICAgICAgICAgICBoY3AtPmph
Y2sgPSBqYWNrOwo+ID4gKyAgICAgICAgICAgICByZXQgPSBoY3AtPmhjZC5vcHMtPmhvb2tfcGx1
Z2dlZF9jYihjb21wb25lbnQtPmRldi0+cGFyZW50LAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoY3AtPmhjZC5kYXRhLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbHVnZ2VkX2NiKTsKPiA+
ICsgICAgICAgICAgICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGhjcC0+
amFjayA9IE5VTEw7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsg
ICAgICAgICAgICAgfQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ICsgICAgIH0KPiA+
ICsgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiA+ICt9Cj4gPiArRVhQT1JUX1NZTUJPTF9HUEwo
aGRtaV9jb2RlY19zZXRfamFja19kZXRlY3QpOwo+Cj4gaW50IHJldCA9IC1FT1BOT1RTVVBQOwo+
ICguLi4pCj4KPiByZXR1cm4gcmV0Owo+Cj4gSW4gY29uc2VxdWVuY2UsIHlvdSBjYW4gcmVkdWNl
IHRoZSBudW1iZXIgb2YgInJldHVybihzKSIgYW5kIGFsc28gcmVtb3ZlCj4gdGhlIHJlZHVuZGFu
dCBwYXJlbnRoZXNpcyBmb3IgdGhlIGlmLXN0YXRlbWVudCB1c2VkIHRvIHNldCBqYWNrIHRvIE5V
TEwuCj4KPiBDemFyZWsKQUNLCndpbGwgZml4IGluIHYyLgoKVGhhbmtzIGEgbG90IGZvciB0aGUg
cmV2aWV3IQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
