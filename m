Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C8E4B674
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 12:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6756D6E365;
	Wed, 19 Jun 2019 10:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B799C6E35B;
 Wed, 19 Jun 2019 10:49:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m3so2874991wrv.2;
 Wed, 19 Jun 2019 03:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VuM7LUgEulLc4d0NTgq/eUcUIvwiQ8NMTe2WgfNBZlo=;
 b=Lwb9ouUyfgbjP4uzebSJgDH1K9mbyxBmydMcoNtBSESDho5SCfUI7E3UkKy0lAQYxn
 kp3o94fw98iB6ftDH47cQiZgN9fd3yoTGm/oXzwi/EQk1U5UiDhh2m8TPhrHPG6skvZf
 Mt1Bsomi5U4rMS0mrTerbLQTEWT2Lh4LTtCEdOuWCn+/B0C3QS00R/oMEKhSqcwONT4J
 r0Pt7LR9d7vgGWy2Tf6TcX+EYeSTjGvEpb1GGZVwSJdxKL79prctPKfXxLKXqU6lwHmt
 tbpP4yDQlJenFLUuCT605UQqVyhSwFgmD2RV+JI8v78IDL+ru9Suf0KwBMbpo7ts3NTH
 B/Lw==
X-Gm-Message-State: APjAAAXLaeJxH+G4vWmuNYEkvvSNvhsMQOFIISwebSwkgxhmR/si8B4t
 szSeATRvZPsEZ6+1nwR/d8w=
X-Google-Smtp-Source: APXvYqxhbpPwUBSgqq1Dta0NH0ju1PsQEJdVcT1lcMDhkwNYrlwJ0ZsQ1G1njXj97K01Go4nx3SDLQ==
X-Received: by 2002:adf:f909:: with SMTP id b9mr54391100wrr.119.1560941373442; 
 Wed, 19 Jun 2019 03:49:33 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id h90sm34517507wrh.15.2019.06.19.03.49.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 03:49:32 -0700 (PDT)
Date: Wed, 19 Jun 2019 11:47:28 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/prime: Shuffle functions.
Message-ID: <20190619104728.GC1896@arch-x1c3>
References: <20190614203615.12639-4-daniel.vetter@ffwll.ch>
 <20190618092038.17929-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618092038.17929-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VuM7LUgEulLc4d0NTgq/eUcUIvwiQ8NMTe2WgfNBZlo=;
 b=huKVSeY1HK9YhfRvp3eBALyYUSjOYiBKz1eShqAU8yiHfg8/9I912jO0fiDR1vFWB4
 jW/iIV5nhcDNZklsnFlZ5dFcLf4ODzP891eTjm/rk+Wfk2RCkaoRd2OHLbAmJkOTgDj8
 68QRwCneQo7rNgVP1UKJg/UhKqbw71Yd1idptnVVzCQGa8vAx6ANl++Xow5H6CBV0wkx
 65u5Bdfcgr/TQKV4A6wbdIWMWv0XHArEyI1dsK6ClNTsTh09po/bk0a0Ys0m8uX5UwbG
 xeO9xIIFBF8jNk/99827U9rOQz0Am1OCMzsBBNaAlWGk5BJzg0WX6r7Hkj+gAQeJ0Tfm
 aoaA==
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNi8xOCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBSZW9yZGVyIGFsbCB0aGUgZnVu
Y3Rpb25zIGluIGRybV9wcmltZS5baGNdIGludG8gdGhyZWUgZ3JvdXBzOiBjb3JlLAo+IGV4cG9y
dCBoZWxwZXJzLCBpbXBvcnQgaGVscGVycy4KPiAKPiBOb3Qgb3RoZXIgY2hhbmdlcyBiZXlvbmQg
bW92aW5nIHRoZSBmdW5jdGlvbnMgYW5kIHRoZWlyIHVuY2hhbmdlZAo+IGtlcm5lbGRvYyBhcm91
bmQgaW4gaGVyZS4KPiAKPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IENj
OiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+IENjOiBFbWlsIFZlbGlrb3YgPGVtaWwu
bC52ZWxpa292QGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KPiAtLS0KR2l0J3MgLS1jb2xvci1tb3ZlZD16ZWJyYSBkZXRl
Y3RzIG5lYXJseSBldmVyeXRoaW5nIGFzIG1vdmVzLiBDb3VwbGUgb2YKcmV0dXJuIHN0YXRlbWVu
dHMgYW5kIGEgZG1hX2J1Zl9wdXQoKSBkbyBub3QgZ2V0IGZsYWdnZWQgdXAsIGJ1dCBJJ3ZlCmNv
bmZpcm1lZCB0aGUgcmVzaHV0dGxlIHdhcyBPSy4KCkFja2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVt
aWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
