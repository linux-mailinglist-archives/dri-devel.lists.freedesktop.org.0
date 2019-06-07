Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AB338AA1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 14:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96D489A74;
	Fri,  7 Jun 2019 12:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3A689A74
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:49:24 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id s57so2029089qte.8
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 05:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Wfc0ONRiE7if96re9IgwhqZxlxJKyUTTfg/JtYHw6Xs=;
 b=db53Enl9g5vqnb3JaoastCyrjXUo1pIs1+WvekdPCYN9S9fGzYVxQsN/nh/8EBi/R0
 FnDgw8IIUPdvHjOh/a2E9WhIZSBpJSOwxTahriZVwVe9SE0RG9s6u4gjxjIocTBXeCoq
 aCwMsOSHw2CoFXbc4R4kgM+Gfq/VRNVxh9KS6s+0JWLzR1aiYaLCxwrRhFk+tyrx+ldl
 kh6LXfmy4EPsmrkzMei1nEcSPnS0fWxtFJpsscxtDnR0QoSb7jeOJXd8rBLeqXV+AIT9
 MIJpiO8rqReBunH7N899m2aPw6fIej8DQAKWNgWarkc4jZ5LxFmXKysuZJ8vWbXc+cgh
 I/wg==
X-Gm-Message-State: APjAAAXYw1ov9aQDTa3xZgAQHayTU2aEiCWpMVn+MVoWwOytxEZldfr4
 +JTgW+vrwH2obDb/gRPqlfq++SS7j9WYz0EzMKuHcQ==
X-Google-Smtp-Source: APXvYqxikxR4bWp/IUM1Vo5wMutzlbB13crxKTadcYTVL5fEBAhSxYAflS6HqhnaINjHAyc+TYR4oIJwdCMD1i+/IoM=
X-Received: by 2002:ac8:395b:: with SMTP id t27mr46770308qtb.115.1559911763243; 
 Fri, 07 Jun 2019 05:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <1559550694-14042-1-git-send-email-yannick.fertre@st.com>
 <ca5d4bcf-6020-e924-5577-d7cf9134958b@st.com>
In-Reply-To: <ca5d4bcf-6020-e924-5577-d7cf9134958b@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 7 Jun 2019 14:49:12 +0200
Message-ID: <CA+M3ks6uUXVCHvzAW90GWMgOpkpQUwFhTo_MWdLwur4ZGmsMXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: ltdc: No message if probe
To: Philippe CORNU <philippe.cornu@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Wfc0ONRiE7if96re9IgwhqZxlxJKyUTTfg/JtYHw6Xs=;
 b=epxnDKo4vb2qpmp6p0AVIYMa9cl9iKK1LLOl5bMlGKR0AY6TJWtGjVXLspm3fDzjpk
 08cqKA5rMFu7QLp1C6F8FdK9n7Q8dw8tZF0E8uRQpfst5CtV3OhRFRVt5SAbGgrFB7Ob
 No+5OQktEuAF0RZ9GvgbPA/OhYIEY9Wt8KaKNtguH25pGRm8L2WXIG962zD3Ohs3cfw1
 OZEYVyHjjWDPBuFSYoDhDQinBJoIMk32aYaCF0k590G0ZnhK09Jm0om6LtTETvTKL5ub
 aK1wbChp7D+i9mX1eTTbaUVO+sWS7XQJTCL3hsuASYEWuhpWN5OzC1X9GGn0tyskeF25
 3T7A==
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>, Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgdmVuLiA3IGp1aW4gMjAxOSDDoCAxMDo1MSwgUGhpbGlwcGUgQ09STlUgPHBoaWxpcHBlLmNv
cm51QHN0LmNvbT4gYSDDqWNyaXQgOgo+Cj4gSGkgWWFubmljaywKPgo+IFRoYW5rIHlvdSBmb3Ig
eW91ciBwYXRjaAo+Cj4gQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBz
dC5jb20+CgpBcHBsaWVkIG9uIGRybS1taXNjLW5leHQKClRoYW5rcywKQmVuamFtaW4KCj4gUGhp
bGlwcGUgOi0pCj4KPiBPbiA2LzMvMTkgMTA6MzEgQU0sIFlhbm5pY2sgRmVydHLDqSB3cm90ZToK
PiA+IFByaW50IGRpc3BsYXkgY29udHJvbGxlciBoYXJkd2FyZSB2ZXJzaW9uIGluIGRlYnVnIG1v
ZGUgb25seS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2su
ZmVydHJlQHN0LmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8
IDIgKy0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVy
cy9ncHUvZHJtL3N0bS9sdGRjLmMKPiA+IGluZGV4IGE0MDg3MGIuLjJmZTZjNGEgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3N0bS9sdGRjLmMKPiA+IEBAIC0xMjI5LDcgKzEyMjksNyBAQCBpbnQgbHRkY19sb2FkKHN0
cnVjdCBkcm1fZGV2aWNlICpkZGV2KQo+ID4gICAgICAgICAgICAgICBnb3RvIGVycjsKPiA+ICAg
ICAgIH0KPiA+Cj4gPiAtICAgICBEUk1fSU5GTygibHRkYyBodyB2ZXJzaW9uIDB4JTA4eCAtIHJl
YWR5XG4iLCBsZGV2LT5jYXBzLmh3X3ZlcnNpb24pOwo+ID4gKyAgICAgRFJNX0RFQlVHX0RSSVZF
UigibHRkYyBodyB2ZXJzaW9uIDB4JTA4eFxuIiwgbGRldi0+Y2Fwcy5od192ZXJzaW9uKTsKPiA+
Cj4gPiAgICAgICAvKiBBZGQgZW5kcG9pbnRzIHBhbmVscyBvciBicmlkZ2VzIGlmIGFueSAqLwo+
ID4gICAgICAgZm9yIChpID0gMDsgaSA8IE1BWF9FTkRQT0lOVFM7IGkrKykgewo+ID4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
