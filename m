Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6E234FE3E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3C86E0FC;
	Wed, 31 Mar 2021 10:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102216E0FC
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:42:52 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u9so29316074ejj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 03:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hnN4OxSl7ivhI/81J2O30mDHjbyVdPWI2qtzluI0vpM=;
 b=m4wiyDIA3yBnLZY8q1LZdhIoonufTU7uJCLw5uLGthGcHDZkOP8OuNfXIDapBvEZiK
 LSe2HY0lHucOH037CM2JyUOeGiLhAwd61/lucOdWoOpcrMXgalgNaX+YS2EBr/WWwuqX
 QOToEYyIecQGPJV/7w1TG1TGncJwfFOKTypyT7jk7KVQGycaqMobMWzK5pTf50d/Wgkx
 RQ2hXaLNfeWMyZ8YfYBIFYqZuM4/u5+dOMoZTKEqrNsKw+ALKlzLBIENtE8QnWyYUIHW
 JJHV2ebqe+WN8QS+NB8tUboV8pyCdK6g03Ntp5PDcZNLXSfewsmtgs69d4nwUSHTQSFB
 7FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hnN4OxSl7ivhI/81J2O30mDHjbyVdPWI2qtzluI0vpM=;
 b=B6P1jqVay81mP4OVhVCyjzI1bv9w3J92G3xNW7KlzEXsqeLy3bzVXCtnkC2tNfZlB6
 7aX4lyvHvzO8AfOvrVWIWGccJTvogaD71mLgDVwb1N6MkbtUGcU53IqUCFFUMPAj4CTW
 /a1f/WujDh3gi9ltWkkmbebmy65F7uxl/KDfY5fvONJ91CE/hUxY91E9wDuwry/FZxGt
 eYZgE0dDoe88fJcSvxQ81/cf2AbcF+n5HstfP1yd34BN5AyFacxtLeqHFFKADvvpZLj2
 9QqqUvrttUUTUqmPqyW4imW6Qyh/Nl9BcPRZmeVZYRiw5eVARpJdFo0x7/Jprc9uOKUP
 aPug==
X-Gm-Message-State: AOAM531yCVxezixHAFyEc+26Rr96Fe78CZ0+5mhsb4cw3rnSgd3hFOyQ
 WwoM/j2zi4xKckKahSeJi07AElAJfvEMvlu/GdY=
X-Google-Smtp-Source: ABdhPJy+ol7AHglWni3Ym5Av5XwTXGPRE3fIl85qzRRJpOpSOIbjRj4Ey0T8Z+GRvykJ5Wx1UiTEdtGuEFGZ9VV2gXY=
X-Received: by 2002:a17:907:7785:: with SMTP id
 ky5mr2701050ejc.133.1617187370594; 
 Wed, 31 Mar 2021 03:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210331093822.251839-1-adrien.grassein@gmail.com>
 <20210331093822.251839-2-adrien.grassein@gmail.com>
 <20210331102916.GK2088@kadam>
In-Reply-To: <20210331102916.GK2088@kadam>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Wed, 31 Mar 2021 12:42:39 +0200
Message-ID: <CABkfQAHb96_sJWfevFam7XikQYjajjsTZ12JBvfv=RWugnvEDg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/bridge: lt8912b: Fix issues found during
 static analysis
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWVyLiAzMSBtYXJzIDIwMjEgw6AgMTI6MjksIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50
ZXJAb3JhY2xlLmNvbT4gYSDDqWNyaXQgOgo+Cj4gT24gV2VkLCBNYXIgMzEsIDIwMjEgYXQgMTE6
Mzg6MjJBTSArMDIwMCwgQWRyaWVuIEdyYXNzZWluIHdyb3RlOgo+ID4gU29tZSBpc3N1ZXMgd2hl
cmUgZm91bmQgZHVyaW5nIHN0YXRpYyBhbmFseXNpcyBvZiB0aGlzIGRyaXZlci4KPiA+Cj4gPiBS
ZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+ID4g
U3VnZ2VzdGVkLWJ5OiBEYW4gQ2FycGVudGVyICA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+
ID4gU2lnbmVkLW9mZi1ieTogQWRyaWVuIEdyYXNzZWluIDxhZHJpZW4uZ3Jhc3NlaW5AZ21haWwu
Y29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0ODkxMmIu
YyB8IDIwICsrKysrKysrKysrKy0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvbG9udGl1bS1sdDg5MTJiLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xv
bnRpdW0tbHQ4OTEyYi5jCj4gPiBpbmRleCA2MTQ5MTYxNWJhZDAuLjlhNWExOTY1NTM2MiAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDg5MTJiLmMKPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDg5MTJiLmMKPiA+IEBAIC02
MzUsMTMgKzYzNSwxNSBAQCBzdGF0aWMgaW50IGx0ODkxMl9wYXJzZV9kdChzdHJ1Y3QgbHQ4OTEy
ICpsdCkKPiA+ICAgICAgIGx0LT5ncF9yZXNldCA9IGdwX3Jlc2V0Owo+ID4KPiA+ICAgICAgIGVu
ZHBvaW50ID0gb2ZfZ3JhcGhfZ2V0X2VuZHBvaW50X2J5X3JlZ3MoZGV2LT5vZl9ub2RlLCAwLCAt
MSk7Cj4gPiAtICAgICBpZiAoSVNfRVJSKGVuZHBvaW50KSkgewo+ID4gLSAgICAgICAgICAgICBy
ZXQgPSBQVFJfRVJSKGVuZHBvaW50KTsKPiA+IC0gICAgICAgICAgICAgZ290byBlbmQ7Cj4gPiAt
ICAgICB9Cj4gPiArICAgICBpZiAoIWVuZHBvaW50KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4g
LUVOT0RFVjsKPiA+Cj4gPiAgICAgICBsdC0+ZGF0YV9sYW5lcyA9IG9mX3Byb3BlcnR5X2NvdW50
X3UzMl9lbGVtcyhlbmRwb2ludCwgImRhdGEtbGFuZXMiKTsKPiA+ICAgICAgIG9mX25vZGVfcHV0
KGVuZHBvaW50KTsKPiA+ICsgICAgIGlmIChsdC0+ZGF0YV9sYW5lcyA8IDApIHsKPgo+IEFoIGZs
aXAuICBVbmZvcnR1bmF0ZWx5LCAtPmRhdGFfbGFuZXMgaXMgYSB1OCBzbyBpdCBjYW4ndCBiZSBu
ZWdhdGl2ZS4KPgpvdXBzIF5eLgoKPiA+ICsgICAgICAgICAgICAgZGV2X2VycihsdC0+ZGV2LCAi
JXM6IEJhZCBkYXRhLWxhbmVzIHByb3BlcnR5XG4iLCBfX2Z1bmNfXyk7Cj4gPiArICAgICAgICAg
ICAgIHJldHVybiBsdC0+ZGF0YV9sYW5lczsKPiA+ICsgICAgIH0KPgo+IHJlZ2FyZHMsCj4gZGFu
IGNhcnBlbnRlcgo+ClRoYW5rcywKQWRyaWVuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
