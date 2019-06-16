Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B705A47A8D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 09:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F28D891A3;
	Mon, 17 Jun 2019 07:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AE58918A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 18:41:27 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id p10so4493216pgn.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 11:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vNvZcOSuQ6Jo5g5X5I/VGQiYgRCh/h5EB0cesihBsnI=;
 b=XNosPptBDsCqI9R6aeNEe7VSEkYLlpFChlvy9/WxiS+lZq+30xLyOZ9Mmua53nbE2U
 iCsXmMIOIo5TtcGdSg8vb2rsZ/biGKxdkVSFMe8UXG9WbAkMKHlvRCw6ayCu6MLs/jw0
 LLLBN9tIWQbUQ1lZ3nCkXmsPC7JrS3Qx1YabnNcpffAvRyfdtEL47IWvj/8LNeTNfga+
 ov1dHqUQv8AAnECVMgYkW8PGGlsF4HRlNrp/oNKIAPoGZCbAPqEnLUQJPT6+SSFnIZn3
 thdulz1oh5R0kXpMus+bjbSYuJybm1JA3BkmlvdxsLRjX5sV7a2SdzZC8HaCgil7Bn3a
 szkA==
X-Gm-Message-State: APjAAAVpqjPDrhfOz4iDDxhqlFxgd/BKAcKGS6fttqYDIJe3msx2DT8j
 cZUcezOjwetsMVLZOA2NDP7L/g==
X-Google-Smtp-Source: APXvYqy8MuYCLwgfLGoyJOgT82CHJUmXEuT5fIIqofVBorJEHKOsOlQnSDu/DtY+3CVsdMhADzy8GA==
X-Received: by 2002:a65:5945:: with SMTP id g5mr13189053pgu.169.1560710485691; 
 Sun, 16 Jun 2019 11:41:25 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id y185sm9392105pfy.110.2019.06.16.11.41.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 11:41:25 -0700 (PDT)
Date: Sun, 16 Jun 2019 11:42:12 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v3 0/6] ARM: qcom: working Nexus 5 display support
Message-ID: <20190616184212.GD31088@tuxbook-pro>
References: <20190531094619.31704-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190531094619.31704-1-masneyb@onstation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 17 Jun 2019 07:13:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vNvZcOSuQ6Jo5g5X5I/VGQiYgRCh/h5EB0cesihBsnI=;
 b=TPq6UcvtY+KPybGnKrsDikqW2MaIX+aohw9pbuiKDdiQf5hTqkQfsieip1zN4C2uil
 GtxVS7XrVdVGrSOTxZDf2IqdmTTg5QybgbEYeteT/1ZvGe2bWwnkaPpwgpcVy79JG3Ts
 +fkzSZhLZdIi9pz5PZUerxHMQ1fzkpNcSuZME3AxNc4iWuCLJu1wlDQ/dSqsi7Os7tTz
 5oKcOYUubD+BlvvE5J+PkAB3RbdioJAn5hs5MaYj2fGUVGWv0NrcuxZ7a0fvoUQUP1Pi
 uYfaH+8bvapuZEUnj0YTsJqSfCHyTbVY7i871hw4JHB/jmNl1v7dcUf/8njRNs3UNxH8
 T2tw==
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
Cc: sean@poorly.run, jonathan@marek.ca, jeffrey.l.hugo@gmail.com,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpIDMxIE1heSAwMjo0NiBQRFQgMjAxOSwgQnJpYW4gTWFzbmV5IHdyb3RlOgoKPiBUaGlz
IHBhdGNoIHNlcmllcyBhZGRzIHdvcmtpbmcgZGlzcGxheSBzdXBwb3J0IHRvIHRoZSBMRyBOZXh1
cyA1Cj4gKGhhbW1lcmhlYWQpIHBob25lLgo+IAo+IENoYW5nZXMgc2luY2UgdjI6Cj4gLSBEcm9w
cGVkIHR3byBkcm0vbXNtIGJ1ZyBmaXggcGF0Y2hlcyB0aGF0IGhhdmUgYmVlbiBtZXJnZWQgc2Vw
YXJhdGVseS4KPiAtIE5ldyBwYXRjaDogJ2FkZCBzdXBwb3J0IGZvciBwZXItQ1JUQyBtYXhfdmJs
YW5rX2NvdW50IG9uIG1kcDUnLgo+ICAgU3BlY2lhbCB0aGFua3MgdG8gSmVmZnJleSBIdWdvIGZv
ciBoZWxwaW5nIHRvIHRyYWNrIGRvd24gdGhpcyBpc3N1ZS4KPiAtIEFkZCBwYW5lbF9waW4gdG8g
bXNtODk3NC1oYW1tZXJoZWFkIGRldmljZSB0cmVlLiBEcm9wcGVkIExpbnVzCj4gICBXYWxsZWlq
J3MgcmV2aWV3ZWQtYnkgb24gdGhpcyBwYXRjaCBkdWUgdG8gdGhpcyBjaGFuZ2UuCj4gCj4gQ2hh
bmdlcyBzaW5jZSB2MToKPiAtIFNob3J0ZW5lZCBwcm9ibGVtIGRlc2NyaXB0aW9uIGFib3ZlLiBJ
J2xsIHJlcGx5IHRvIHRoaXMgZW1haWwgYW5kIHNlbmQKPiAgIGEgZnVsbCBkbWVzZyB3aXRoIHRo
ZSBib290IGxvZyB3aXRoIGRlYnVnZ2luZyB0dXJuZWQgb24uCj4gLSBEcm9wcGVkIHBhdGNoICdm
aXggbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlIGluCj4gICBtc21fYXRvbWljX3ByZXBhcmVfZmIo
KScKPiAtIE5ldyBwYXRjaDogUmVtb3ZlIHJlc3YgZmllbGRzIGZyb20gbXNtX2dlbV9vYmplY3Qg
c3RydWN0IHRoYXQgd2FzCj4gICBpbmNvcnJlY3RseSBiZWluZyByZWZlcmVuY2VkIGJ5IHRoZSBw
cmVwYXJlX2ZiIGNhbGxiYWNrcy4KPiAtIEFkZCBkcm1fcGxhbmVfZW5hYmxlX2ZiX2RhbWFnZV9j
bGlwcygpIHRvIHBsYW5lIGluaXQgZm9yIG1kcDQsIG1kcDUsCj4gICBhbmQgZHB1MS4KPiAtIEFk
ZCBMaW51cyBXYWxsZWlqJ3MgcmV2aWV3ZWQtYnkgdG8gcGF0Y2hlcyAzLTYKPiAKPiBNeSBzdGF0
dXMgcGFnZSBhdCBodHRwczovL21hc25leWIuZ2l0aHViLmlvL25leHVzLTUtdXBzdHJlYW0vCj4g
ZGVzY3JpYmVzIHdoYXQgaXMgd29ya2luZyBzbyBmYXIgd2l0aCB0aGUgdXBzdHJlYW0ga2VybmVs
IG9uIHRoZSBOZXh1cwo+IDUuCj4gCgpBc3N1bWluZyB0aGF0IHBhdGNoZXMgMSBhbmQgMiB3b24n
dCBhZmZlY3QgdGhlIGR0cyBhbmQgYXBwbGllZCBwYXRjaGVzIDMKdGhyb3VnaCA2IGZvciB2NS4z
LgoKUmVnYXJkcywKQmpvcm4KCj4gQnJpYW4gTWFzbmV5ICg2KToKPiAgIGRybS9tc206IGFkZCBk
aXJ0eSBmcmFtZWJ1ZmZlciBoZWxwZXIKPiAgIGRybS9tc206IGFkZCBzdXBwb3J0IGZvciBwZXIt
Q1JUQyBtYXhfdmJsYW5rX2NvdW50IG9uIG1kcDUKPiAgIEFSTTogcWNvbV9kZWZjb25maWc6IGFk
ZCBkaXNwbGF5LXJlbGF0ZWQgb3B0aW9ucwo+ICAgQVJNOiBkdHM6IHFjb206IG1zbTg5NzQtaGFt
bWVyaGVhZDogYWRkIHN1cHBvcnQgZm9yIGJhY2tsaWdodAo+ICAgQVJNOiBkdHM6IG1zbTg5NzQ6
IGFkZCBkaXNwbGF5IHN1cHBvcnQKPiAgIEFSTTogZHRzOiBxY29tOiBtc204OTc0LWhhbW1lcmhl
YWQ6IGFkZCBzdXBwb3J0IGZvciBkaXNwbGF5Cj4gCj4gIC4uLi9xY29tLW1zbTg5NzQtbGdlLW5l
eHVzNS1oYW1tZXJoZWFkLmR0cyAgICB8ICA5MiArKysrKysrKysrKysKPiAgYXJjaC9hcm0vYm9v
dC9kdHMvcWNvbS1tc204OTc0LmR0c2kgICAgICAgICAgIHwgMTMyICsrKysrKysrKysrKysrKysr
Kwo+ICBhcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29uZmlnICAgICAgICAgICAgICAgfCAgIDUg
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcGxhbmUuYyAgICAgfCAgIDMg
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X3BsYW5lLmMgICAgfCAgIDMg
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NydGMuYyAgICAgfCAgMTYg
KystCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMgICAgICB8ICAg
MiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X3BsYW5lLmMgICAgfCAg
IDMgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9mYi5jICAgICAgICAgICAgICAgICAgfCAg
IDIgKwo+ICA5IGZpbGVzIGNoYW5nZWQsIDI1NiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+IC0tIAo+IDIuMjAuMQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
