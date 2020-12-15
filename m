Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DABEA2DA8DA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 09:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B9E891CE;
	Tue, 15 Dec 2020 08:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7CA891CE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 08:04:48 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y17so18847303wrr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 00:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MbW/aNPnMI3Tt8o0eStb7kmZYcIkeHTT/zhJDBmp9Po=;
 b=ERAzFdv3OQLUww5ou7XtAG/8q6kqp/p8+AfwT2MaTB2yzEEM0sYuWSkXTVOI6wIxla
 Z1Yjv2l6iA3MYW0nu0cUyrHGFWKb99pxy9srXvvZ1M3iX2xkYT7r3sNnHhxiC1weYjA9
 wvYgYaIqA7mu88/BRCrDTSyeJKNL466afdLNdIx6FR4CN6bQfTer0bIJXg9T8+y52EbB
 DSRqiVD0IzrCDqB7hzHC/THJaYeVIDSdjXuwXskAdvI3eXrBjrOaZ6Yl+Lur19glBDkl
 GACBOOLJ/OX4ZJ3NUBwYU90XTveFA8aiPEvlfURB3O83mTnSqhsRlUK7C+8LJOwyrlPc
 G0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MbW/aNPnMI3Tt8o0eStb7kmZYcIkeHTT/zhJDBmp9Po=;
 b=ncx4b/gMa7/6rrjkpKuY8gT2VjfeME4KJes6O11nPw2ayzQDNH5ppDhC+Qew3dGQam
 JsPl6AA2pcZoqj5KJRis9i1gJSyRIUKYpXWjmzKFdqiUEMTtZ1dUNsv5OIzSG2/c2IFL
 KLxLii+vVg72mAIa1GiMLM0SBKchlqYndlDGWiY2yANaFsHMQ/RmqBHAPNs+UuBc/e1O
 CEycAa2eX6hSe0gwes9nBTGh9TxsBCwsoncOmf8YaK9xgM8OXLohDSxVdRmZW4p1wyjj
 ZbNLugP6BStotcQNMQCDwlJ9b3VWATmd4fflySS+fl4enXfNVxjU8o3TIuKPGMDxf6WP
 09hg==
X-Gm-Message-State: AOAM532JOHGVNkBdF8hkQiCablagEAloqEuw5nhjWEgfo8FrpgYKsqgG
 LKtcEVGhLDEbrxYHF2mN+Q2L8A==
X-Google-Smtp-Source: ABdhPJyBaJVZxusL4+NkX5M1cL9XgJuSWZPi9uRydM6u2Zpl6/+bh4iwRS1pELsgP/ST1fktxMTHnw==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr32200972wrs.284.1608019487058; 
 Tue, 15 Dec 2020 00:04:47 -0800 (PST)
Received: from dell ([91.110.221.168])
 by smtp.gmail.com with ESMTPSA id n12sm38986631wrg.76.2020.12.15.00.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 00:04:46 -0800 (PST)
Date: Tue, 15 Dec 2020 08:04:44 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH -next] backlight: sky81452-backlight: convert comma to
 semicolon
Message-ID: <20201215080444.GK5029@dell>
References: <20201214133458.3729-1-zhengyongjun3@huawei.com>
 <20201214143632.oiqmvpkai7kurc2d@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214143632.oiqmvpkai7kurc2d@holly.lan>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zheng Yongjun <zhengyongjun3@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxNCBEZWMgMjAyMCwgRGFuaWVsIFRob21wc29uIHdyb3RlOgoKPiBPbiBNb24sIERl
YyAxNCwgMjAyMCBhdCAwOTozNDo1OFBNICswODAwLCBaaGVuZyBZb25nanVuIHdyb3RlOgo+ID4g
UmVwbGFjZSBhIGNvbW1hIGJldHdlZW4gZXhwcmVzc2lvbiBzdGF0ZW1lbnRzIGJ5IGEgc2VtaWNv
bG9uLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGVuZyBZb25nanVuIDx6aGVuZ3lvbmdqdW4z
QGh1YXdlaS5jb20+Cj4gCj4gV2VpcmQhIEkgZ3Vlc3MgaXQgd2FzIGhhcm1sZXNzIGJ1dCBzdGls
bCBzZXJpb3VzbHkgd2VpcmQgOy0pCgpPbmUgb2YgdGhlc2Ugd2FzIGZvdW5kIGluIE1GRCBhIGNv
dXBsZSBvZiB3ZWVrcyBhZ28uCgpZb3VycyB3YXMgZXhhY3RseSBteSB0cmFpbiBvZiB0aG91Z2h0
IQoKT25lIHN1Z2dlc3Rpb24gd2FzIHRvIGNvbnZlcnQgYWxsIHNlbWktY29sb25zIHRvIGNvbW1h
cyBhbmQgZG8gYXdheQp3aXRoIGFsbCB0aGUgY3VybHkgYnJhY2VzIGVuY2Fwc3VsYXRpbmcgaWYo
KXMsIGZvcigpcyBhbmQgd2hpbGUoKXMuCgpXaG8ga25ldyB0aGF0IHdhcyBldmVuIHBvc3NpYmxl
PwoKPiBSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJv
Lm9yZz4KPiAKPiBUaGFua3MhCj4gCj4gCj4gPiAtLS0KPiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9za3k4MTQ1Mi1iYWNrbGlnaHQuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L3NreTgxNDUyLWJhY2tsaWdodC5jIGIvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvc2t5ODE0NTItYmFja2xpZ2h0LmMKPiA+IGluZGV4IDgyNjhhYzQzZDU0Zi4uYzk1ZTBk
ZTdmNGU3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvc2t5ODE0NTIt
YmFja2xpZ2h0LmMKPiA+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3NreTgxNDUyLWJh
Y2tsaWdodC5jCj4gPiBAQCAtMjkxLDcgKzI5MSw3IEBAIHN0YXRpYyBpbnQgc2t5ODE0NTJfYmxf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAJfQo+ID4gIAo+ID4gIAlt
ZW1zZXQoJnByb3BzLCAwLCBzaXplb2YocHJvcHMpKTsKPiA+IC0JcHJvcHMubWF4X2JyaWdodG5l
c3MgPSBTS1k4MTQ1Ml9NQVhfQlJJR0hUTkVTUywKPiA+ICsJcHJvcHMubWF4X2JyaWdodG5lc3Mg
PSBTS1k4MTQ1Ml9NQVhfQlJJR0hUTkVTUzsKPiA+ICAJbmFtZSA9IHBkYXRhLT5uYW1lID8gcGRh
dGEtPm5hbWUgOiBTS1k4MTQ1Ml9ERUZBVUxUX05BTUU7Cj4gPiAgCWJkID0gZGV2bV9iYWNrbGln
aHRfZGV2aWNlX3JlZ2lzdGVyKGRldiwgbmFtZSwgZGV2LCByZWdtYXAsCj4gPiAgCQkJCQkJJnNr
eTgxNDUyX2JsX29wcywgJnByb3BzKTsKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9y
IFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3
aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
