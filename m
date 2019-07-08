Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BB363171
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C2D8989F;
	Tue,  9 Jul 2019 07:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7212489F85
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 16:10:30 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id b3so5207367plr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 09:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fDCoSY5K0ITJqQYvscwo5UxJiyuZc3RyIH7jJSLU88U=;
 b=o8qZALrhDJzTxHPa5rdfChbmAm+W4sSMANAwN9ihv8/mYvzgVqoysURcIwFfLslOVi
 BGxCSGaks2R33fQlBqk5690o1AkMU8r9phEdD0zySrSUnvOkEv1ccKLknDuhHnirc1pj
 R+qkgLdFGMzQeKGIbhCV6OCw/QLgMNG181bolyTtICjjAiObLad/aIFo7/CWiCPQVFCn
 nDqqo1oLhc2xINn5SwhYB+QkOBGYQMAlF0UI2wr2JKGHwWN1T5ELD0mFj7+sOUFJpMEE
 2wjCe7EdxKcfOBVpr7vp+n2qa+tC4D/9EZ97P7Z4UW0eZydCUygdtQNJyKgGwGqnuwh9
 2+jA==
X-Gm-Message-State: APjAAAWNALdLlmxLhWTf/Po+lXaeuoxioJtI1fjQ6AvUupvg3pqL7Dwn
 A0GJYLCQ6LxHfNrzABQVt8veEw==
X-Google-Smtp-Source: APXvYqzD1aivQBDf69llf3avbBHNfxtRkZ9eXNatyrc78REwbz16rreOTstsv5QqjSoYFjtGpjbuhQ==
X-Received: by 2002:a17:902:4623:: with SMTP id
 o32mr25633974pld.112.1562602229878; 
 Mon, 08 Jul 2019 09:10:29 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id j20sm5476488pfr.113.2019.07.08.09.10.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jul 2019 09:10:29 -0700 (PDT)
Date: Mon, 8 Jul 2019 09:10:26 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v2] drm/msm/mdp5: Find correct node for creating gem
 address space
Message-ID: <20190708161026.GB27383@builder>
References: <20190708151224.22555-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708151224.22555-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fDCoSY5K0ITJqQYvscwo5UxJiyuZc3RyIH7jJSLU88U=;
 b=CfLjv4t9r4Kg2mSofS2nlQZMto3UY4mstJJjBcy91IFpxTd6+xOv3VwdVLcgFVUdVW
 j5PVsTuIkjKvjex7sWx70GltkB3B71Am79TnP0MeO+ihAkpGOpOQDafpfMi9i7wnEUUH
 3OHP5VEf+64cy0LL8hikc/pn1wZ/KR2jge1woKA5a6tL1EGf27T4yOG48LdVyh8xewdi
 4/+ddMjgJKskc5Ivy46J/G5z+QyT2ZWcf3TxK2wuJqimj0xykazxXmlcv65ZFjE1aIJl
 TYa/I2day1zmNig/jiZU9ScLfIp2yEcPl0pav2+YEs06oGpQ0n42my45uw5pfHQBvory
 TtXA==
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uIDA4IEp1bCAwODoxMiBQRFQgMjAxOSwgSmVmZnJleSBIdWdvIHdyb3RlOgoKPiBDcmVh
dGluZyB0aGUgbXNtIGdlbSBhZGRyZXNzIHNwYWNlIHJlcXVpcmVzIGEgcmVmZXJlbmNlIHRvIHRo
ZSBkZXYgd2hlcmUKPiB0aGUgaW9tbXUgaXMgbG9jYXRlZC4gIFRoZSBkcml2ZXIgY3VycmVudGx5
IGFzc3VtZXMgdGhpcyBpcyB0aGUgc2FtZSBhcwo+IHRoZSBwbGF0Zm9ybSBkZXZpY2UsIHdoaWNo
IGJyZWFrcyB3aGVuIHRoZSBpb21tdSBpcyBvdXRzaWRlIG9mIHRoZQo+IHBsYXRmb3JtIGRldmlj
ZSAoaWUgaW4gdGhlIHBhcmVudCkuICBEZWZhdWx0IHRvIHVzaW5nIHRoZSBwbGF0Zm9ybSBkZXZp
Y2UsCj4gYnV0IGNoZWNrIHRvIHNlZSBpZiB0aGF0IGhhcyBhbiBpb21tdSByZWZlcmVuY2UsIGFu
ZCBpZiBub3QsIHVzZSB0aGUgcGFyZW50Cj4gZGV2aWNlIGluc3RlYWQuICBUaGlzIHNob3VsZCBo
YW5kbGUgYWxsIHRoZSB2YXJpb3VzIGlvbW11IGRlc2lnbnMgZm9yCj4gbWRwNSBzdXBwb3J0ZWQg
c3lzdGVtcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdv
QGdtYWlsLmNvbT4KClRlc3RlZC1ieTogQmpvcm4gQW5kZXJzc29uIDxiam9ybi5hbmRlcnNzb25A
bGluYXJvLm9yZz4KCj4gLS0tCj4gCj4gdjI6IEl0IHR1cm5zIG91dCB0aGVyZSBpc24ndCBhIHVu
aXZlcnNhbCB3YXkgdG8gZ2V0IHRoZSBpb21tdSBkZXZpY2UsIHNvIAo+IGNoZWNrIHRvIHNlZSBp
ZiBpdHMgaW4gdGhlIGN1cnJlbnQgbm9kZSBvciBwYXJlbnQKPiAKPiAgZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYyB8IDcgKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvbWRwNS9tZHA1X2ttcy5jCj4gaW5kZXggNGE2MGY1ZmNhNmIwLi4wMmRjN2Q0MjZjYjAgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKPiBAQCAtNjYzLDYg
KzY2Myw3IEBAIHN0cnVjdCBtc21fa21zICptZHA1X2ttc19pbml0KHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYpCj4gIAlzdHJ1Y3QgbXNtX2ttcyAqa21zOwo+ICAJc3RydWN0IG1zbV9nZW1fYWRkcmVz
c19zcGFjZSAqYXNwYWNlOwo+ICAJaW50IGlycSwgaSwgcmV0Owo+ICsJc3RydWN0IGRldmljZSAq
aW9tbXVfZGV2Owo+ICAKPiAgCS8qIHByaXYtPmttcyB3b3VsZCBoYXZlIGJlZW4gcG9wdWxhdGVk
IGJ5IHRoZSBNRFA1IGRyaXZlciAqLwo+ICAJa21zID0gcHJpdi0+a21zOwo+IEBAIC03MDIsNyAr
NzAzLDExIEBAIHN0cnVjdCBtc21fa21zICptZHA1X2ttc19pbml0KHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYpCj4gIAltZGVsYXkoMTYpOwo+ICAKPiAgCWlmIChjb25maWctPnBsYXRmb3JtLmlvbW11
KSB7Cj4gLQkJYXNwYWNlID0gbXNtX2dlbV9hZGRyZXNzX3NwYWNlX2NyZWF0ZSgmcGRldi0+ZGV2
LAo+ICsJCWlvbW11X2RldiA9ICZwZGV2LT5kZXY7Cj4gKwkJaWYgKCFpb21tdV9kZXYtPmlvbW11
X2Z3c3BlYykKPiArCQkJaW9tbXVfZGV2ID0gaW9tbXVfZGV2LT5wYXJlbnQ7Cj4gKwo+ICsJCWFz
cGFjZSA9IG1zbV9nZW1fYWRkcmVzc19zcGFjZV9jcmVhdGUoaW9tbXVfZGV2LAo+ICAJCQkJY29u
ZmlnLT5wbGF0Zm9ybS5pb21tdSwgIm1kcDUiKTsKPiAgCQlpZiAoSVNfRVJSKGFzcGFjZSkpIHsK
PiAgCQkJcmV0ID0gUFRSX0VSUihhc3BhY2UpOwo+IC0tIAo+IDIuMTcuMQo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
