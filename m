Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9685020B4A0
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 17:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A6B6ECBD;
	Fri, 26 Jun 2020 15:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CB46ECBD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 15:33:54 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id o8so9213381wmh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 08:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rpso9ySNKoLDGZyCP/hQvs97M6SXDiiUl7b7MavvpwM=;
 b=Im1TNyjYUqGtSxb3sVpOQyDfuWo+4jL/eqZNHs4NDDTYEFyid04tQdyu89ASBScZ4r
 wb24XBrOxce/WjPuyNXPXoUHQtfJiOu0kaAMJjR3M59cyn6Vkqe368y2feEo+qQEiBk1
 DGBfapEIfDFuUQ2BVVIu2qVIvQnFFinKhlLC/DFjzG2Vl42KM9ir4BThZQhjbOqbEaLn
 PIGe/3KXrsysRdikgnP8sEL3JiLrgrISIBIssg0wXfm9CiCOt594i2d+P+H+yy96DPWd
 chrGgttiyWu7uhIOKgZbaVf2bTgCFyCeXiE4mMc/P5bBOpgpq8XeNZk2VCtLj5y9RojH
 FdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rpso9ySNKoLDGZyCP/hQvs97M6SXDiiUl7b7MavvpwM=;
 b=NhcACNJQvKW4lXVT5RA50dN5mOai1GUOZ9VUzfwuWD8NxRB09zph02xYh0k0iUVEcg
 oXK+MpalkiD3PUm5tEdlJy9MH/TSpIXo/y4QFrsJjMF1omhZjcXxRpvFJEGS83cl4sGx
 w5vXdZW1v3x8swYDLA9W4AV7OXAyIyeipOnGH00sK+9pAhddfyqOhfthEfCUBrli7n79
 WwBYRwjyLhYtmVskhnl0tceXFD6tyR+gnnG7vNBO0xzYga7k4XFB+w2ORip1kUkHbcA4
 Zb5T0WnGI94sExJnYXKtMZ4kofDB10+RRqHROiHhYrq+r61SfbDOAa2kL7r7yNywFd8b
 SszA==
X-Gm-Message-State: AOAM530WU3ng/FK4Eq6BZzEwhnZUfHo/WUDpAO0Lj5Vut5RErxUMbnwG
 yfltakje67vy3RC6XJtxiMOZcQ==
X-Google-Smtp-Source: ABdhPJz9yrxY45T9SAy1cdsmEGjRTcOB+Cz9/AF+lu25KlsF3R66G6fdX+qT3KF8kVohKRgE/ySkTg==
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr4112202wmy.79.1593185633299; 
 Fri, 26 Jun 2020 08:33:53 -0700 (PDT)
Received: from dell ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id f16sm18168315wmh.27.2020.06.26.08.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 08:33:52 -0700 (PDT)
Date: Fri, 26 Jun 2020 16:33:51 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 3/8] backlight: ili922x: Add missing kerneldoc
 descriptions for CHECK_FREQ_REG() args
Message-ID: <20200626153351.GD177734@dell>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-4-lee.jones@linaro.org>
 <20200625094051.u4hanl3rycczlwiy@holly.lan>
 <20200625103334.GO954398@dell>
 <20200626095405.nzhqsfjegj6qg2ro@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626095405.nzhqsfjegj6qg2ro@holly.lan>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Software Engineering <sbabic@denx.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNiBKdW4gMjAyMCwgRGFuaWVsIFRob21wc29uIHdyb3RlOgoKPiBPbiBUaHUsIEp1
biAyNSwgMjAyMCBhdCAxMTozMzozNEFNICswMTAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBPbiBU
aHUsIDI1IEp1biAyMDIwLCBEYW5pZWwgVGhvbXBzb24gd3JvdGU6Cj4gPiAKPiA+ID4gT24gV2Vk
LCBKdW4gMjQsIDIwMjAgYXQgMDM6NTc6MTZQTSArMDEwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4g
PiA+IEtlcm5lbGRvYyBzeW50YXggaXMgdXNlZCwgYnV0IG5vdCBjb21wbGV0ZS4gIERlc2NyaXB0
aW9ucyByZXF1aXJlZC4KPiA+ID4gPiAKPiA+ID4gPiBQcmV2ZW50cyB3YXJuaW5ncyBsaWtlOgo+
ID4gPiA+IAo+ID4gPiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9pbGk5MjJ4LmM6MTE2OiB3
YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdzJyBub3QgZGVzY3JpYmVkIGlu
ICdDSEVDS19GUkVRX1JFRycKPiA+ID4gPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvaWxpOTIy
eC5jOjExNjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAneCcgbm90IGRl
c2NyaWJlZCBpbiAnQ0hFQ0tfRlJFUV9SRUcnCj4gPiA+ID4gCj4gPiA+ID4gQ2M6IDxzdGFibGVA
dmdlci5rZXJuZWwub3JnPgo+ID4gPiA+IENjOiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxi
LnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4gPiA+ID4gQ2M6IFNvZnR3YXJlIEVuZ2luZWVyaW5n
IDxzYmFiaWNAZGVueC5kZT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9pbGk5MjJ4LmMgfCAyICsrCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvaWxpOTIyeC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvaWxpOTIyeC5jCj4gPiA+ID4g
aW5kZXggOWM1YWEzZmJiMjg0Mi4uOGNiNGI5ZDNjM2JiYSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9k
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9pbGk5MjJ4LmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9pbGk5MjJ4LmMKPiA+ID4gPiBAQCAtMTA3LDYgKzEwNyw4IEBACj4gPiA+
ID4gICAqCWxvd2VyIGZyZXF1ZW5jeSB3aGVuIHRoZSByZWdpc3RlcnMgYXJlIHJlYWQvd3JpdHRl
bi4KPiA+ID4gPiAgICoJVGhlIG1hY3JvIHNldHMgdGhlIGZyZXF1ZW5jeSBpbiB0aGUgc3BpX3Ry
YW5zZmVyIHN0cnVjdHVyZSBpZgo+ID4gPiA+ICAgKgl0aGUgZnJlcXVlbmN5IGV4Y2VlZHMgdGhl
IG1heGltdW0gdmFsdWUuCj4gPiA+ID4gKyAqIEBzOiBwb2ludGVyIHRvIGNvbnRyb2xsZXIgc2lk
ZSBwcm94eSBmb3IgYW4gU1BJIHNsYXZlIGRldmljZQo+ID4gPiAKPiA+ID4gV2hhdCdzIHdyb25n
IHdpdGggImEgcG9pbnRlciB0byBhbiBTUEkgZGV2aWNlIj8KPiA+ID4gCj4gPiA+IEkgYW0gYXdh
cmUsIGhhdmluZyBsb29rZWQgaXQgdXAgdG8gZmluZCBvdXQgd2hhdCB0aGUgYWJvdmUgYWN0dWFs
bHkKPiA+ID4gbWVhbnMsIHRoYXQgdGhpcyBpcyBob3cgc3RydWN0IHNwaV9kZXZpY2UgaXMgZGVz
Y3JpYmVkIGluIGl0cyBvd24ga2VybmVsCj4gPiA+IGRvYyBidXQgcXVvdGluZyBhdCB0aGF0IGxl
dmVsIG9mIGRldGFpbCBvZiBib3RoIG92ZXJraWxsIGFuZCBjb25mdXNpbmcuCj4gPiAKPiA+IEkg
ZmlndXJlZCB0aGF0IHVzaW5nIHRoZSBvZmZpY2lhbCBkZXNjcmlwdGlvbiB3b3VsZCBiZSBiZXR0
ZXIgdGhhbgo+ID4gbWFraW5nIHNvbWV0aGluZyB1cC4gIEhvd2V2ZXIgaWYgeW91IHRoaW5rIGl0
J3MgYmV0dGVyIHRvIEtJU1MsIHRoZW4gSQo+ID4gY2FuIGNoYW5nZSBpdC4KPiAKPiBZZXMsIEkn
ZCBzdHJvbmdseSBwcmVmZXIgS0lTUyBoZXJlLgo+IAo+IEkga25vdyBpdCBpcyBhbiAiSSBhbSB0
aGUgd29ybGQiIGFyZ3VtZW50WzFdIGJ1dCBJIGZvdW5kIHVzaW5nIHN1Y2ggYQo+IGRvZ21hdGlj
YWxseSBhY2N1cmF0ZSBkZXNjcmlwdGlvbiBvdXQgb2YgY29udGV4dCB0byBiZSB2ZXJ5IGNvbmZ1
c2luZwo+IGFuZCB0aGVyZWZvcmUgSSBkb24ndCB0aGluayBzdWNoIGEgY29tbWVudCBpbXByb3Zl
cyByZWFkYWJpbGl0eS4KPiAKPiBbMV06IFNlZSAjMyBmcm9tIGh0dHA6Ly93d3cubGVhbnkuY29t
L2xvZ2ljL0FkYW1zLmh0bWwKCkl0J3MgZmluZSwgeW91IGFyZSB0aGUgd29ybGQsIEkgZ2V0IGl0
LiA7KQoKRG8geW91IGV2ZW4gbGlrZSBDb3VudHJ5IG11c2ljPwoKV2lsbCBmaXghCgotLSAKTGVl
IEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2
aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9s
bG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
