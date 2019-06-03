Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4973F339F8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 23:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EC28926E;
	Mon,  3 Jun 2019 21:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95958926E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 21:42:39 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id v69so3169085vke.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 14:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=abYS+Uz7A281R7NvC6O8zM/sshSHcswm8DbDdd1frRg=;
 b=NjVkEFbzA9VMt6sxEStzq3NiFobGv5tq+vq0sIPrYCTnC0bS0TQL+OuHvANMo7/vff
 zGkFQod7B8Su87pGNAfZpaWerI2q6UEAk6CVTkOts999s1LLfCnxJpnER9vALcTuAL0+
 +eeD3IRJevnnhxKQ0XM3mDcMVkYc5sG3zwx/f02Z4opAiW0XU8IoupB1Pls/l4zowUMF
 UWu0L8Fic12YaG4yMWk9fcJSKLNG6BQmtK5aVRJu3z3ET51n1gxrSUVxYj6j+FD3YUOu
 4L4ruIVB3ySpRVvjGVqbDpaWB4hNV66h9hr2soJP6tOZJRHXeYNmLtcIkw7W65gH2t+Z
 KJzg==
X-Gm-Message-State: APjAAAXSvruPyOTATg2lHkIjuzQ84iXwqIpT06lDMvdWyZIAaMdRnIi3
 lxRdFE5mRybv/4ZOZX9Orx0nVtKb5bI=
X-Google-Smtp-Source: APXvYqy3OAdUrfw1UgXPTJslTKrO/Qa9CQCwqiysrobaVxFVsBgiDwKHEuaSyCZ0nwApR9sCsHx77Q==
X-Received: by 2002:a1f:23d6:: with SMTP id j205mr10093237vkj.52.1559598158652; 
 Mon, 03 Jun 2019 14:42:38 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id j22sm2683592vso.17.2019.06.03.14.42.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 14:42:38 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id 7so7066238uah.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 14:42:38 -0700 (PDT)
X-Received: by 2002:ab0:670c:: with SMTP id q12mr13608918uam.106.1559597839129; 
 Mon, 03 Jun 2019 14:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190516214022.65220-1-dianders@chromium.org>
In-Reply-To: <20190516214022.65220-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 3 Jun 2019 14:37:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ukt+Y=CNDR2uRLx5JhwyBK36UH4fCaY00a3FoMm-0VCA@mail.gmail.com>
Message-ID: <CAD=FV=Ukt+Y=CNDR2uRLx5JhwyBK36UH4fCaY00a3FoMm-0VCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: bridge: dw-hdmi: Add hook for resume
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=abYS+Uz7A281R7NvC6O8zM/sshSHcswm8DbDdd1frRg=;
 b=YI3bF1wxRrFFyQe1fOOz0HEeP24BXNJUB5WaMcuJQiiEXYicZaZjP+RDPlt4vZZTFG
 eXNqIAopT3I9G6yVvErYwCBjRHaou0mmLJA3k221pf03KQ0A+QkDPr4pbAevxP3HQjos
 ANB17tDD0zu4EM4sRMHhzs02e9QgRsbY7hTmc=
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Matthias Kaehlcke <mka@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGF1cmVudCwKCk9uIFRodSwgTWF5IDE2LCAyMDE5IGF0IDI6NDAgUE0gRG91Z2xhcyBBbmRlcnNv
biA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IE9uIFJvY2tjaGlwIHJrMzI4OC1i
YXNlZCBDaHJvbWVib29rcyB3aGVuIHlvdSBkbyBhIHN1c3BlbmQvcmVzdW1lCj4gY3ljbGU6Cj4K
PiAxLiBZb3UgbG9zZSB0aGUgYWJpbGl0eSB0byBkZXRlY3QgYW4gSERNSSBkZXZpY2UgYmVpbmcg
cGx1Z2dlZCBpbi4KPgo+IDIuIElmIHlvdSdyZSB1c2luZyB0aGUgaTJjIGJ1cyBidWlsdCBpbiB0
byBkd19oZG1pIHRoZW4gaXQgc3RvcHMKPiB3b3JraW5nLgo+Cj4gTGV0J3MgYWRkIGEgaG9vayB0
byB0aGUgY29yZSBkdy1oZG1pIGRyaXZlciBzbyB0aGF0IHdlIGNhbiBjYWxsIGl0IGluCj4gZHdf
aGRtaS1yb2NrY2hpcCBpbiB0aGUgbmV4dCBjb21taXQuCj4KPiBOT1RFOiB0aGUgZXhhY3Qgc2V0
IG9mIHN0ZXBzIEkndmUgZG9uZSBoZXJlIGluIHJlc3VtZSBjb21lIGZyb20KPiBsb29raW5nIGF0
IHRoZSBub3JtYWwgZHdfaGRtaSBpbml0IHNlcXVlbmNlIGluIHVwc3RyZWFtIExpbnV4IHBsdXMg
dGhlCj4gc2VxdWVuY2UgdGhhdCB3ZSBkaWQgaW4gZG93bnN0cmVhbSBDaHJvbWUgT1MgMy4xNC4g
IFRlc3Rpbmcgc2hvdyB0aGF0Cj4gaXQgc2VlbXMgdG8gd29yaywgYnV0IGlmIGFuIGV4dHJhIHN0
ZXAgaXMgbmVlZGVkIG9yIHNvbWV0aGluZyBoZXJlIGlzCj4gbm90IG5lZWRlZCB3ZSBjb3VsZCBp
bXByb3ZlIGl0Lgo+Cj4gQXMgcGFydCBvZiB0aGlzIGNoYW5nZSB3ZSdsbCByZWZhY3RvciB0aGUg
aGFyZHdhcmUgaW5pdCBiaXRzIG9mCj4gZHctaGRtaSB0byBoYXBwZW4gYWxsIGluIG9uZSBmdW5j
dGlvbiBhbmQgYWxsIGF0IHRoZSBzYW1lIHRpbWUuICBTaW5jZQo+IHdlIG5lZWQgdG8gaW5pdCB0
aGUgaW50ZXJydXB0IG11dGVzIGJlZm9yZSB3ZSByZXF1ZXN0IHRoZSBJUlEsIHRoaXMKPiBtZWFu
cyBtb3ZpbmcgdGhlIGhhcmR3YXJlIGluaXQgZWFybGllciBpbiB0aGUgZnVuY3Rpb24sIGJ1dCB0
aGVyZQo+IHNob3VsZCBiZSBubyBwcm9ibGVtcyB3aXRoIHRoYXQuICBBbHNvIGFzIHBhcnQgb2Yg
dGhpcyB3ZSBub3cKPiB1bmNvbmRpdGlvbmFsbHkgaW5pdCB0aGUgImkyYyIgcGFydHMgb2YgZHct
aGRtaSwgYnV0IGFnYWluIHRoYXQgb3VnaHQKPiB0byBiZSBmaW5lLgo+Cj4gU2lnbmVkLW9mZi1i
eTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+IC0tLQo+Cj4gQ2hh
bmdlcyBpbiB2MjoKPiAtIE5vIGVtcHR5IHN0dWIgZm9yIHN1c3BlbmQgKExhdXJlbnQpCj4gLSBS
ZWZhY3RvciB0byB1c2UgdGhlIHNhbWUgY29kZSBpbiBwcm9iZSBhbmQgcmVzdW1lIChMYXVyZW50
KQo+IC0gVW5jb25kaXRpb25hbGx5IGluaXQgaTJjIChzZWVtcyBPSyArIG5lZWRlZCBiZWZvcmUg
aGRtaS0+aTJjIGluaXQpCj4gLSBDb21iaW5lICJpbml0IiBvZiBpMmMgYW5kICJzZXR1cCIgb2Yg
aTJjIChubyByZWFzb24gdG8gc3BsaXQpCgpBcmUgeW91IGhhcHB5IHdpdGggdGhpcyBub3c/ICBF
dmVuIGlmIHlvdSBmZWVsIGxpa2UgeW91IGRvbid0IHdhbnQgdG8KZ2l2ZSBpdCBhIGZ1bGwgUmV2
aWV3ZWQtYnksIGl0J2QgZ29vZCBpZiB5b3UgY291bGQgY29uZmlybSB0aGF0IEkKaGFuZGxlZCB5
b3VyIHN1Z2dlc3Rpb25zIHByb3Blcmx5LgoKVGhhbmtzISAgOi0pCgotRG91ZwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
