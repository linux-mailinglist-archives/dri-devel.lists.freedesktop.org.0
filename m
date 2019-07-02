Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0395CD4E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 12:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C962689970;
	Tue,  2 Jul 2019 10:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A25B89970
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 10:06:50 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s3so261572wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 03:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=IPhxNdYQv1IO45V1N89WkeYw72yq7YkYbzXa74/qLm8=;
 b=BEE8GWf/cgyGBzPeBX3k9J/tzQiF1nfjablEIUY03odir0Z0cptbvyURo2Ue/83dee
 U6oWvlD5phLLPavY+7hqPgs8AIJsDT8p7fAAGJCkXqUw50mg4pJoMyVud82gMPaNdjik
 mmnPERarpc6o97GqjzhHF3elTid4aCTthBS9Rj5wmBASmXrE4SAQXD57lmFrawFBWNqI
 x6jXxTxLkdSZCSJ7aBKirSDdi5tBDZ+aw9fdSNG+3Fl4oEUVx+TQc9v01HcNiOgnMHWU
 B/5nd87xVx1P2gkXBXdEOmbDv8KwI4LENSBJkMAZN/Oae8klRgmVJAZVMmat/H5SidHd
 KUkQ==
X-Gm-Message-State: APjAAAW5eG2W0Gi5w0ou12iVtbJvS+v+qJF3Gsu1SXS+AJZL2LwNb7iC
 3qIQFPtVIYRiHY8Hw4ZgOAFyjQ==
X-Google-Smtp-Source: APXvYqwdjByD+ebiA2jaUAfMZ0F44rSTtYAIiX/eLfpUiDzg2avALCgxqEFC+Vkzsv/GOweWWbSJqA==
X-Received: by 2002:a1c:a654:: with SMTP id p81mr2771343wme.36.1562062008717; 
 Tue, 02 Jul 2019 03:06:48 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id m24sm2055652wmi.39.2019.07.02.03.06.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 03:06:48 -0700 (PDT)
Date: Tue, 2 Jul 2019 11:06:46 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/12] ARM: davinci: da850-evm: remove more legacy GPIO
 calls
Message-ID: <20190702100646.q3wgzgacvp67m6xv@holly.lan>
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <fe42c0e1-2bfb-2b1c-2c38-0e176e88ec6e@ti.com>
 <20190702063653.GC4652@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702063653.GC4652@dell>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=IPhxNdYQv1IO45V1N89WkeYw72yq7YkYbzXa74/qLm8=;
 b=TmcjfCcxp9A8p09QuoZGu11Tfov1i2w+va27tjKlP+UMLAP9yOMJJmoYEsh6iIKPXW
 msQS1R0Vph9Wj+ScXIqkevVlPoxzL1HHYEnL0H2gqmnJ7GS8yuphQVdojxjDby/fnzqh
 iIKFUsFtpKGPWwSUsSgmtl07V6KTaUluSQ5tQYCKwUwjc3Q5IQfEJBVH6DJYu/677awV
 IlHuPJslNPQamm0aYo9JmdAJhR+kyipkS/zZM93qGpMREddffT/vUybnRw+4iSTpjxOC
 8zyfIrQE+miGNfNstjUZCVlvoYaIGoEeAVlmi724OpGlxR6bdJYkAvraWA3+o22qkLzb
 LxBw==
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
Cc: linux-fbdev@vger.kernel.org, David Lechner <david@lechnology.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Kevin Hilman <khilman@kernel.org>, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMDc6MzY6NTNBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIE1vbiwgMDEgSnVsIDIwMTksIFNla2hhciBOb3JpIHdyb3RlOgo+IAo+ID4gSGkgTGVl
LCBEYW5pZWwsIEppbmdvbywKPiA+IAo+ID4gT24gMjUvMDYvMTkgMTA6MDQgUE0sIEJhcnRvc3og
R29sYXN6ZXdza2kgd3JvdGU6Cj4gPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xh
c3pld3NraUBiYXlsaWJyZS5jb20+Cj4gPiA+IAo+ID4gPiBUaGlzIGlzIGFub3RoZXIgc21hbGwg
c3RlcCBvbiB0aGUgcGF0aCB0byBsaWJlcmF0aW5nIGRhdmluY2kgZnJvbSBsZWdhY3kKPiA+ID4g
R1BJTyBBUEkgY2FsbHMgYW5kIHNocmlua2luZyB0aGUgZGF2aW5jaSBHUElPIGRyaXZlciBieSBu
b3QgaGF2aW5nIHRvCj4gPiA+IHN1cHBvcnQgdGhlIGJhc2UgR1BJTyBudW1iZXIgYW55bW9yZS4K
PiA+ID4gCj4gPiA+IFRoaXMgdGltZSB3ZSdyZSByZW1vdmluZyB0aGUgbGVnYWN5IGNhbGxzIHVz
ZWQgaW5kaXJlY3RseSBieSB0aGUgTENEQwo+ID4gPiBmYmRldiBkcml2ZXIuCj4gPiA+IAo+ID4g
PiBUaGUgZmlyc3QgdGhyZWUgcGF0Y2hlcyBtb2RpZnkgdGhlIEdQSU8gYmFja2xpZ2h0IGRyaXZl
ci4gVGhlIGZpcnN0Cj4gPiA+IG9mIHRoZW0gYWRkcyB0aGUgbmVjZXNzYXJ5IGZ1bmN0aW9uYWxp
dHksIHRoZSBvdGhlciB0d28gYXJlIGp1c3QKPiA+ID4gdHdlYWtzIGFuZCBjbGVhbnVwcy4KPiA+
IAo+ID4gQ2FuIHlvdSB0YWtlIHRoZSBmaXJzdCB0aHJlZSBwYXRjaGVzIGZvciB2NS4zIC0gaWYg
aXRzIG5vdCB0b28gbGF0ZT8gSQo+ID4gdGhpbmsgdGhhdCB3aWxsIG1ha2UgaXQgZWFzeSBmb3Ig
cmVzdCBvZiBwYXRjaGVzIHRvIG1ha2UgaW50byBzdWJzZXF1ZW50Cj4gPiBrZXJuZWwgcmVsZWFz
ZXMuCj4gCj4gSXQncyBhbHJlYWR5IHRvbyBsYXRlIGluIHRoZSBjeWNsZSAoLXJjNykgZm9yIHRo
YXQuICBJIHJlcXVpcmUgcGF0Y2hlcwo+IG9mIHRoaXMgbmF0dXJlIHRvIGhhdmUgYSBnb29kIHNv
YWsgaW4gLW5leHQgYmVmb3JlIGJlaW5nIG1lcmdlZC4gVGhlcmUKPiBzaG91bGRuJ3QgYmUgYW4g
aXNzdWUgd2l0aCBnZXR0aW5nIHRoZW0gaW50byB2NS40IHRob3VnaC4KCk9uIHRoZSBvdGhlciBo
YW5kIEkgdGhpbmsgd2UgZGlkIHRha2UgYSBwYXRjaCB0aGF0IGRpZCBtdWNoIHRoZSBzYW1lIAp0
aGluZyBhcyBwYXRjaCAxLzEyIGluIHRoaXMgc2VyaWVzOgpodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9sZWUvYmFja2xpZ2h0LmdpdC9jb21taXQvP2g9Zm9y
LWJhY2tsaWdodC1uZXh0JmlkPTk4Yjc0MDRlYjdkNjRlNTVmOGZkZDQxOWNiMzk2NWE4YWJmMGUy
MTcKCkknbSBub3QgMTAwJSBzdXJlIGJ1dCBJIHRoaW5rIHRoYXQgbWlnaHQgYWxsb3cgdGhlIHBh
dGNoc2V0IHRvIGJlIHNwbGl0CmludG8gdHdvIHRoYXQgYXJlIGluZGVwZW5kZW50IChvbmUgZm9y
IERhdmluY2kgYW5kIG9uZSBmb3IgZ3BpbwpiYWNrbGlnaHQgaW1wcm92ZW1lbnRzKS4KCgpEYW5p
ZWwuCgo+IAo+ID4gPiBOZXh0IHR3byBwYXRjaGVzIGVuYWJsZSB0aGUgR1BJTyBiYWNrbGlnaHQg
ZHJpdmVyIGluCj4gPiA+IGRhdmluY2lfYWxsX2RlZmNvbmZpZy4KPiA+ID4gCj4gPiA+IFBhdGNo
IDYvMTIgbW9kZWxzIHRoZSBiYWNrbGlnaHQgR1BJTyBhcyBhbiBhY3R1YWwgR1BJTyBiYWNrbGln
aHQgZGV2aWNlLgo+ID4gPiAKPiA+ID4gUGF0Y2hlcyA3LTkgZXh0ZW5kIHRoZSBmYmRldiBkcml2
ZXIgd2l0aCByZWd1bGF0b3Igc3VwcG9ydCBhbmQgY29udmVydAo+ID4gPiB0aGUgZGE4NTAtZXZt
IGJvYXJkIGZpbGUgdG8gdXNpbmcgaXQuCj4gPiA+IAo+ID4gPiBMYXN0IHRocmVlIHBhdGNoZXMg
YXJlIGltcHJvdmVtZW50cyB0byB0aGUgZGE4eHggZmJkZXYgZHJpdmVyIHNpbmNlCj4gPiA+IHdl
J3JlIGFscmVhZHkgdG91Y2hpbmcgaXQgaW4gdGhpcyBzZXJpZXMuCj4gPiAKPiA+IFRoYW5rcywK
PiA+IFNla2hhcgo+ID4gCj4gCj4gLS0gCj4gTGVlIEpvbmVzIFvmnY7nkLzmlq9dCj4gTGluYXJv
IFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCj4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29m
dHdhcmUgZm9yIEFSTSBTb0NzCj4gRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwg
QmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
