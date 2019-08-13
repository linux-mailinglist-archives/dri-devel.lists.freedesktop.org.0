Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6AD8B9EE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 15:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936556E124;
	Tue, 13 Aug 2019 13:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254596E124
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 13:20:02 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 207so1499246wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 06:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xfLZK+aLXf7IAAQGT9kpcQjUA//C9TO1nW5nQQ+lsfA=;
 b=YSZZZBln5alDh7G//qjkXVY4dt+5258ZCu29UIVmZRMYA6Q5wF3IuzneogYfrubu2D
 TZ7ZlK+5rUKAoMKPyNuG6103SOhhT5t345AvryzkYB5ZuVw/M/YoaI3d1XRevg3/mfw0
 BdcRjMrWmPKCccjrWKRSnSAG0VIu26Y/Aav4WWHFdZErg2cQyQCRr+noZbgNw6OQgIgF
 /kliY6/SQdxz7oq4ElwrmIoSxY0Mn6dAOaAlILaflZlvH4HBuwkixpwhF2QJLWE2yhVe
 ArmXh1fJvAaCnEEdK3ELHSumwBuP8fBYk/YYq8I7suThWUcpCOQGuHyZbRpokM9OXr3J
 HwBQ==
X-Gm-Message-State: APjAAAXMpn06qP95sogGTDthNso+jEhpuKr0wTJ6Ig5Pg01BDEB5sq8I
 8ph1TfJOL34CWO/fzoHR0Bn9rA==
X-Google-Smtp-Source: APXvYqxD9JIaAO8mg/yD2uQuL4bLr+ORAdUW5lgxOkILCPRyLV+UcWdOnX80lXIzt9mo7IA3xJko4w==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr3274136wmc.151.1565702400644; 
 Tue, 13 Aug 2019 06:20:00 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d207sm1225341wmd.0.2019.08.13.06.19.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 06:20:00 -0700 (PDT)
Date: Tue, 13 Aug 2019 14:19:58 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH resend] video: backlight: Drop default m for
 {LCD,BACKLIGHT_CLASS_DEVICE}
Message-ID: <20190813131958.y3fgzeeuzhsfddbh@holly.lan>
References: <20190813115853.30329-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813115853.30329-1-geert@linux-m68k.org>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xfLZK+aLXf7IAAQGT9kpcQjUA//C9TO1nW5nQQ+lsfA=;
 b=HHI7V9VWxdEm2ldMnuSEETf9TtQRRvw0u9IpAnbFdEDIldH0obuMMaRec5Agi5HTUa
 5IW6bcvigEZ8VrczojbBgrCbpZx2BecDQoam7fTeIDEgcnUem6nskJgAs3Z2oqzXxqID
 fI1giGDh1UEvzwuXJqe8vE/Ffyw+loocGo/rm8EmKNGyoz7QnMWQzpbYZ0x4/Rwpev8I
 FE2xzCTqbj/+xYrlcb4PnJZVB0DNbOv0IulMGdy/Yifvnur34UyvGrDqYU5JeqHGz00R
 O3LewDnqlT66dXkbyGQk+3uviMvG6EZ6SgIRA8KX1hSAP/JykmwXkxfDQls710u+6arZ
 CaRg==
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
Cc: linux-fbdev@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDE6NTg6NTNQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IFdoZW4gcnVubmluZyAibWFrZSBvbGRjb25maWciIG9uIGEgLmNvbmZpZyB3
aGVyZQo+IENPTkZJR19CQUNLTElHSFRfTENEX1NVUFBPUlQgaXMgbm90IHNldCwgdHdvIG5ldyBj
b25maWcgb3B0aW9ucwo+ICgiTG93bGV2ZWwgTENEIGNvbnRyb2xzIiBhbmQgIkxvd2xldmVsIEJh
Y2tsaWdodCBjb250cm9scyIpIGFwcGVhciwgYm90aAo+IGRlZmF1bHRpbmcgdG8gIm0iLgo+IAo+
IERyb3AgdGhlICJkZWZhdWx0IG0iLCBhcyBvcHRpb25zIHNob3VsZCBkZWZhdWx0IHRvIGRpc2Fi
bGVkLCBhbmQgYmVjYXVzZQo+IHNldmVyYWwgZHJpdmVyIGNvbmZpZyBvcHRpb25zIGFscmVhZHkg
c2VsZWN0IExDRF9DTEFTU19ERVZJQ0Ugb3IKPiBCQUNLTElHSFRfQ0xBU1NfREVWSUNFIHdoZW4g
bmVlZGVkLgo+IAo+IEZpeGVzOiA4YzVkYzhkOWYxOWM3OTkyICgidmlkZW86IGJhY2tsaWdodDog
UmVtb3ZlIHVzZWxlc3MgQkFDS0xJR0hUX0xDRF9TVVBQT1JUIGtlcm5lbCBzeW1ib2wiKQo+IFNp
Z25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+CgpB
Y2tlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KCj4g
LS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcgfCAyIC0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9LY29uZmlnIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZwo+IGluZGV4
IDhiMDgxZDYxNzczZTIxZWIuLjQwNjc2YmUyZTQ2YWFlNjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0
L0tjb25maWcKPiBAQCAtMTAsNyArMTAsNiBAQCBtZW51ICJCYWNrbGlnaHQgJiBMQ0QgZGV2aWNl
IHN1cHBvcnQiCj4gICMKPiAgY29uZmlnIExDRF9DTEFTU19ERVZJQ0UKPiAgICAgICAgICB0cmlz
dGF0ZSAiTG93bGV2ZWwgTENEIGNvbnRyb2xzIgo+IC0JZGVmYXVsdCBtCj4gIAloZWxwCj4gIAkg
IFRoaXMgZnJhbWV3b3JrIGFkZHMgc3VwcG9ydCBmb3IgbG93LWxldmVsIGNvbnRyb2wgb2YgTENE
Lgo+ICAJICBTb21lIGZyYW1lYnVmZmVyIGRldmljZXMgY29ubmVjdCB0byBwbGF0Zm9ybS1zcGVj
aWZpYyBMQ0QgbW9kdWxlcwo+IEBAIC0xNDMsNyArMTQyLDYgQEAgZW5kaWYgIyBMQ0RfQ0xBU1Nf
REVWSUNFCj4gICMKPiAgY29uZmlnIEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UKPiAgICAgICAgICB0
cmlzdGF0ZSAiTG93bGV2ZWwgQmFja2xpZ2h0IGNvbnRyb2xzIgo+IC0JZGVmYXVsdCBtCj4gIAlo
ZWxwCj4gIAkgIFRoaXMgZnJhbWV3b3JrIGFkZHMgc3VwcG9ydCBmb3IgbG93LWxldmVsIGNvbnRy
b2wgb2YgdGhlIExDRAo+ICAgICAgICAgICAgYmFja2xpZ2h0LiBUaGlzIGluY2x1ZGVzIHN1cHBv
cnQgZm9yIGJyaWdodG5lc3MgYW5kIHBvd2VyLgo+IC0tIAo+IDIuMTcuMQo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
