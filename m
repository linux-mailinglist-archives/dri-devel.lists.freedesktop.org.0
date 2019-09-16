Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F71B3B13
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 15:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FAF6E270;
	Mon, 16 Sep 2019 13:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83EF6E270
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 13:15:30 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id j31so16389440qta.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 06:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+fV1kEmfM8cVIpyb9XMeB/4+z5VrvBSg3jb/39zi3bA=;
 b=dUwMND90YQM68XK84Wmj+r+luJ5L92F8wdbyS7ABZwYBhj0d8pYss5oWbkM91rxoUW
 8Gmw3zcYzjIv+sXyqnwCTf1v/3cKiMQvKPYwgy2+VvNDEk4xuFjjpExMQ09yk5J69Ff+
 8VgNPnc4UgxnNH2QAvfljHKJPUG18yTJmm/Q5MlEZy9Y4R5Ow9ZuUOXy63l8sY3VWil6
 AwA3gjeE659pgnLv1ws+N4C4H7V9Wx22n513DNaRwAYCqWjWhi9xYaeT+MmTyhMkT842
 dPGeMrK4notfZFr1kfyV8Kv7uLJwP31ejAtssW/xuPzpL35SQZ6855WuhGdQ8eg2ue5w
 PMxQ==
X-Gm-Message-State: APjAAAVRd3Mav4+e7zRCOomkMaUR7ljygOsUI39w+Ej09GOTAS9onhrP
 sWdPU6oJutUxsAiEC5hSI851dJ+ZEablHc2+negyjw==
X-Google-Smtp-Source: APXvYqxtKYMb78EesGF1ldt6P+E8nLIICCaPO5lad+W++K7ZDdSqS3r3ZKDChi98RmuHxDrGblaZaUN4r0zIVYB20mI=
X-Received: by 2002:ac8:60d6:: with SMTP id i22mr17110622qtm.250.1568639729842; 
 Mon, 16 Sep 2019 06:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190911084759.6946-1-benjamin.gaignard@st.com>
 <8235afe0-1796-1647-8a39-84ab354e290a@amd.com>
In-Reply-To: <8235afe0-1796-1647-8a39-84ab354e290a@amd.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 16 Sep 2019 15:15:18 +0200
Message-ID: <CA+M3ks7kUjQB0ZkHmugWZt6fUA7ytQcjXu8G9pDFejQpdyNxcw@mail.gmail.com>
Subject: Re: [PATCH] drm: fix warnings in DSC
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+fV1kEmfM8cVIpyb9XMeB/4+z5VrvBSg3jb/39zi3bA=;
 b=jGVE6eplE7FjWUdSKuZIu9TLMcAcpzQszMWLi+CCMLNK/Y26NoDgKDuyPfIdmNiQuC
 VtNi2vlIfT6fDB5+LqA5d5RTFxzRYVBGSAWnYgk5N7lpronpxT0tNyDF6wsC8FmVw27f
 f3MvbxbL3Ot8Tzx7JAPlRDgC33RUtsqfV8yN75x7xTcOt3olhW9P3/vcLwa2E75q69ik
 A7w1dDY4hF5ltTqEoJlGbRsdzghD4hag6ej16j9VXddnRa3OdaZHMFZQXApyIQrmoMym
 vG7oSQudGh3LqdN5TKcow+uP2pZaWzOZSyaRHqTMDMFwKBLaklxiYHXwKHwwShRE3WmN
 Rr0w==
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWVyLiAxMSBzZXB0LiAyMDE5IMOgIDE1OjQxLCBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5A
YW1kLmNvbT4gYSDDqWNyaXQgOgo+Cj4gT24gMjAxOS0wOS0xMSA0OjQ3IGEubS4sIEJlbmphbWlu
IEdhaWduYXJkIHdyb3RlOgo+ID4gUmVtb3ZlIGFsd2F5cyBmYWxzZSBjb21wYXJpc29ucyBkdWUg
dG8gbGltaXRlZCByYW5nZSBvZiBuZmxfYnBnX29mZnNldAo+ID4gYW5kIHNjYWxlX2luY3JlbWVu
dF9pbnRlcnZhbCBmaWVsZHMuCj4gPiBXYXJuaW5ncyBkZXRlY3RlZCB3aGVuIGNvbXBpbGluZyB3
aXRoIFc9MS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFt
aW4uZ2FpZ25hcmRAc3QuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJy
eS53ZW50bGFuZEBhbWQuY29tPgoKQXBwbGllZCBvbiBkcm0tbWlzYy1uZXh0ClRoYW5rcywKQmVu
amFtaW4KCj4KPiBIYXJyeQo+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5j
IHwgMTEgLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEgZGVsZXRpb25zKC0pCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RzYy5jCj4gPiBpbmRleCA3N2Y0ZTVhZTQxOTcuLjI3ZTVjNjAzNjY1OCAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMKPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHNjLmMKPiA+IEBAIC0zMzYsMTIgKzMzNiw2IEBAIGludCBkcm1fZHNjX2Nv
bXB1dGVfcmNfcGFyYW1ldGVycyhzdHJ1Y3QgZHJtX2RzY19jb25maWcgKnZkc2NfY2ZnKQo+ID4g
ICAgICAgZWxzZQo+ID4gICAgICAgICAgICAgICB2ZHNjX2NmZy0+bmZsX2JwZ19vZmZzZXQgPSAw
Owo+ID4KPiA+IC0gICAgIC8qIDJeMTYgLSAxICovCj4gPiAtICAgICBpZiAodmRzY19jZmctPm5m
bF9icGdfb2Zmc2V0ID4gNjU1MzUpIHsKPiA+IC0gICAgICAgICAgICAgRFJNX0RFQlVHX0tNUygi
TmZsQnBnT2Zmc2V0IGlzIHRvbyBsYXJnZSBmb3IgdGhpcyBzbGljZSBoZWlnaHRcbiIpOwo+ID4g
LSAgICAgICAgICAgICByZXR1cm4gLUVSQU5HRTsKPiA+IC0gICAgIH0KPiA+IC0KPiA+ICAgICAg
IC8qIE51bWJlciBvZiBncm91cHMgdXNlZCB0byBjb2RlIHRoZSBlbnRpcmUgc2xpY2UgKi8KPiA+
ICAgICAgIGdyb3Vwc190b3RhbCA9IGdyb3Vwc19wZXJfbGluZSAqIHZkc2NfY2ZnLT5zbGljZV9o
ZWlnaHQ7Cj4gPgo+ID4gQEAgLTM3MSwxMSArMzY1LDYgQEAgaW50IGRybV9kc2NfY29tcHV0ZV9y
Y19wYXJhbWV0ZXJzKHN0cnVjdCBkcm1fZHNjX2NvbmZpZyAqdmRzY19jZmcpCj4gPiAgICAgICAg
ICAgICAgIHZkc2NfY2ZnLT5zY2FsZV9pbmNyZW1lbnRfaW50ZXJ2YWwgPSAwOwo+ID4gICAgICAg
fQo+ID4KPiA+IC0gICAgIGlmICh2ZHNjX2NmZy0+c2NhbGVfaW5jcmVtZW50X2ludGVydmFsID4g
NjU1MzUpIHsKPiA+IC0gICAgICAgICAgICAgRFJNX0RFQlVHX0tNUygiU2NhbGVJbmNyZW1lbnRJ
bnRlcnZhbCBpcyBsYXJnZSBmb3Igc2xpY2UgaGVpZ2h0XG4iKTsKPiA+IC0gICAgICAgICAgICAg
cmV0dXJuIC1FUkFOR0U7Cj4gPiAtICAgICB9Cj4gPiAtCj4gPiAgICAgICAvKgo+ID4gICAgICAg
ICogRFNDIHNwZWMgbWVudGlvbnMgdGhhdCBiaXRzX3Blcl9waXhlbCBzcGVjaWZpZXMgdGhlIHRh
cmdldAo+ID4gICAgICAgICogYml0cy9waXhlbCAoYnBwKSByYXRlIHRoYXQgaXMgdXNlZCBieSB0
aGUgZW5jb2RlciwKPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
