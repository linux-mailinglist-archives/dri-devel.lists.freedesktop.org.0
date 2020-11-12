Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473A52B0ECB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 21:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB796E420;
	Thu, 12 Nov 2020 20:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C377C6E420
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 20:08:57 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 19so6347486wmf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 12:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=NdNkzlDaSwMULZwdt2G9+gSnA797TK1gCTMOnWVTmic=;
 b=SGdJxSQDiO/tnKMKOXGBrZdx4N8+4uGeEJZeArx9q3b8gl/6puets3SXatZ24xOzUG
 5V4HB5CkMr+hZ4MpidHT2pEscVwmvhBM9UGWQGfB71Qr5xgM+I/XJbw/vMDCFkzHpavL
 P1dBYBiiOYYXO4qs2HhiZgc0ImkGm745k0AQJc1z4UbipSOKVd6xLVQMNUSZByVOrFlw
 yJVGNf5ZASBtBthAo6HFvTk4xM+Z6zPtU+JEBTktOUYsmoX8WZVy2tDmN1xNk/L3HOuN
 z73rFsT0OKQR4T/2Y2aKoMOBqeLpc82FAeQROYZ5OCgqutPBxw2hpJA4vevxVlvGN2dE
 +ntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NdNkzlDaSwMULZwdt2G9+gSnA797TK1gCTMOnWVTmic=;
 b=NRc9lI6Jsqp47MN0tA9jCE9oGi5YGtuMrc9HEvcG5D+wrrTJlwE2dmku6CcDvlKK4P
 nKhA8FBqxcZ9PqJ+9fr7mIetVcqhfY2pFRS7zRdLDco4h5m9+BbbhbCNjfov5zSbJs3m
 VXzw2Sp5LhR1YCz7MrXz8T9C5oV+jCJda446rhcpgW8O/UuJUUL1Ix43+xYM3IFP6IQe
 rdzmDNuMhdbcach9AWfidLvw1NUCCWrprv9boGLCpZBIPwCfnee7Uep7FMKSiMibHbiM
 5yOW6nCZGXLemxD+1av2SGF+fZruEshT56+2HY+khf7shXw5KBuDNZXGNKnbkJQYcL5n
 +QUQ==
X-Gm-Message-State: AOAM530u3Rb3qIhrUYlZBEtdaZBL2VNbsNUZqVVCWnF2LYVO0En7BQQD
 yygqPZnxbbN9kcS5klhne+b9AA==
X-Google-Smtp-Source: ABdhPJytznGMi4YliKX3CB1LkC8RxmcXA4z6KnpfzORZmdGQuZFO+h1pMrtQhOCaNPKGhmoSFb3Lmg==
X-Received: by 2002:a1c:c286:: with SMTP id s128mr1346590wmf.88.1605211734707; 
 Thu, 12 Nov 2020 12:08:54 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id x6sm8081055wmc.48.2020.11.12.12.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 12:08:54 -0800 (PST)
Date: Thu, 12 Nov 2020 20:08:52 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 01/30] drm/savage/savage_bci: Remove set but never used
 'aper_rsrc' and 'fb_rsrc'
Message-ID: <20201112200852.GB2787115@dell>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-2-lee.jones@linaro.org>
 <20201112193113.GD3287572@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112193113.GD3287572@ravnborg.org>
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

T24gVGh1LCAxMiBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBPbiBUaHUsIE5vdiAx
MiwgMjAyMCBhdCAwNzowMDoxMFBNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBUaGUgY29t
bWVudCBhYm91dCB0aGVtIChhbHNvIHJlbW92ZWQpIHNheXM6Cj4gPiAKPiA+ICAvKiBmYl9yc3Jj
IGFuZCBhcGVyX3JzcmMgYXJlbid0IHJlYWxseSB1c2VkIGN1cnJlbnRseSwgYnV0IHN0aWxsIGV4
aXN0Cj4gPiAgICogaW4gY2FzZSB3ZSBkZWNpZGUgd2UgbmVlZCBpbmZvcm1hdGlvbiBvbiB0aGUg
QkFSIGZvciBCU0QgaW4gdGhlCj4gPiAgICogZnV0dXJlLgo+ID4gICAqLwo+ID4gCj4gPiBXZWxs
IHRoYXQgd2FzIHdyaXR0ZW4gMTIgeWVhcnMgYWdvIGluIDIwMDguICBXZSBhcmUgbm93IGluIHRo
ZSBmdXR1cmUKPiA+IGFuZCB0aGV5IGFyZSBzdGlsbCBzdXBlcmZsdW91cy4gIFdlIGNhbiBhbHdh
eXMgYWRkIHRoZW0gYWdhaW4gYXQgYQo+ID4gbGF0ZXIgZGF0ZSBpZiB0aGV5IGFyZSBldmVyIHJl
cXVpcmVkLgo+ID4gCj4gPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2Fy
bmluZyhzKToKPiA+IAo+ID4gIGRyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2YWdlX2JjaS5jOiBJ
biBmdW5jdGlvbiDigJhzYXZhZ2VfZHJpdmVyX2ZpcnN0b3BlbuKAmToKPiA+ICBkcml2ZXJzL2dw
dS9kcm0vc2F2YWdlL3NhdmFnZV9iY2kuYzo1ODA6MjQ6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGFw
ZXJfcnNyY+KAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2YWdlX2JjaS5jOjU4MDoxNTogd2FybmluZzog
dmFyaWFibGUg4oCYZmJfcnNyY+KAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0
LXZhcmlhYmxlXQo+ID4gCj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+
ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IENjOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgo+ID4gLS0tCj4gCj4gVGhhbmtzLCBhcHBsaWVkIHRvIGRybS1taXNj
LW5leHQuCgpUaGFua3MgZm9yIHlvdXIgcHJvbXB0IHJlc3BvbnNlIFNhbS4gIE11Y2ggYXBwcmVj
aWF0ZWQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAt
IERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBm
b3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
