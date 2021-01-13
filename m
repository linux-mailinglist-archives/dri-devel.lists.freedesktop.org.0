Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B9B2F52A3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 19:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA346EBA1;
	Wed, 13 Jan 2021 18:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4796EBA1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 18:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610563694;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCkM8tqtFmqAljGsn+lrhwLEcfZSOOvR/2PaL+unCN0=;
 b=XyzI4bB4k3SDMmN+l1RVoograne414apoNVD0sTojNQ1hTIzxOfouG/f4JHKFKyIugkmdX
 DbHqiaP4dQzW0Au0ge7iF8P87ob9saAN54MOGQQQhO+9wyMIOnCxNimITUzIkR5uD0KEX/
 1zmUWd5+DLFio2OvVpoPS8gEuV1lfw8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-FZlFM6EuNFCs0yi_0L1o9Q-1; Wed, 13 Jan 2021 13:48:13 -0500
X-MC-Unique: FZlFM6EuNFCs0yi_0L1o9Q-1
Received: by mail-qt1-f199.google.com with SMTP id h7so2122531qtn.21
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 10:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=XCkM8tqtFmqAljGsn+lrhwLEcfZSOOvR/2PaL+unCN0=;
 b=IbcLe/4CE8lEkew8jOK8Dy7JiDlfDv8S4rNHTa710tE20w4n1dRWI7hAJQcoEL+08R
 IV9507was6ificNLsdG/k67ozerD7i9moOdZxXl9nHgwSYQY9KTcGTXui9WpgCp/m2p5
 mgSQMJCEcCHXNhFdG29z43DVG0Xyf+nscnpoy4Et109rY75NrGtpl+B20sPKNBTKeBIV
 vI1RyhwO14me3XmIBK591s6KFi0tg60SBSlvL+ccpc32awP2WbGVTeQcX7zm4iY+EJfD
 5CkfivWSr3pjjfGdM6L8XbQ3yjeH0FLpGB4g4uzh8uverKv9NZsZgWAQPjA55wVl1URj
 9dLA==
X-Gm-Message-State: AOAM531Io2PQ7tMMy/HLw1Jhy37BO30awk6r68lrI+WO//l1YWMx9AyE
 ZFPbYUG74Psyt4IQwTIYvL0wixfsTT73knvu582Z6gnK6oK2uL9K7Su59J3hgvx+SrQUnHYr7Ja
 vr2GGoly9uUaYRX6la/jhzpUY0Yep
X-Received: by 2002:ac8:6c4a:: with SMTP id z10mr3566589qtu.183.1610563692843; 
 Wed, 13 Jan 2021 10:48:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsr8BSxKJOMODCmmzJTXvHIK23vnDy1EDAf3ht8aYtQMMUO2lCrf8B/jgZneMtm/Hs7ut10w==
X-Received: by 2002:ac8:6c4a:: with SMTP id z10mr3566570qtu.183.1610563692657; 
 Wed, 13 Jan 2021 10:48:12 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id z20sm1505438qtb.31.2021.01.13.10.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 10:48:11 -0800 (PST)
Message-ID: <a391f7b14dfede904d805a01340345deb4cf2617.camel@redhat.com>
Subject: Re: [PATCH 28/30] drm/nouveau/dispnv50/headc57d: Make local
 function 'headc57d_olut' static
From: Lyude Paul <lyude@redhat.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Wed, 13 Jan 2021 13:48:10 -0500
In-Reply-To: <20210113080752.1003793-29-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
 <20210113080752.1003793-29-lee.jones@linaro.org>
Organization: Red Hat
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBXZWQsIDIwMjEt
MDEtMTMgYXQgMDg6MDcgKzAwMDAsIExlZSBKb25lcyB3cm90ZToKPiBGaXhlcyB0aGUgZm9sbG93
aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiAKPiDCoGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkLmM6MTczOjE6IHdhcm5pbmc6IG5vIHByZXZpb3VzCj4g
cHJvdG90eXBlIGZvciDigJhoZWFkYzU3ZF9vbHV04oCZIFstV21pc3NpbmctcHJvdG90eXBlc10K
PiAKPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4g
wqBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jIHwgMiArLQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkLmMKPiBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkLmMKPiBpbmRleCBmZDUxNTI3
YjU2YjgzLi5iZGNmZDI0MGQ2MWM4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L2Rpc3BudjUwL2hlYWRjNTdkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9oZWFkYzU3ZC5jCj4gQEAgLTE2OSw3ICsxNjksNyBAQCBoZWFkYzU3ZF9vbHV0X2xv
YWQoc3RydWN0IGRybV9jb2xvcl9sdXQgKmluLCBpbnQgc2l6ZSwKPiB2b2lkIF9faW9tZW0gKm1l
bSkKPiDCoMKgwqDCoMKgwqDCoMKgd3JpdGV3KHJlYWR3KG1lbSAtIDQpLCBtZW0gKyA0KTsKPiDC
oH0KPiDCoAo+IC1ib29sCj4gK3N0YXRpYyBib29sCj4gwqBoZWFkYzU3ZF9vbHV0KHN0cnVjdCBu
djUwX2hlYWQgKmhlYWQsIHN0cnVjdCBudjUwX2hlYWRfYXRvbSAqYXN5aCwgaW50IHNpemUpCj4g
wqB7Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChzaXplICE9IDAgJiYgc2l6ZSAhPSAyNTYgJiYgc2l6
ZSAhPSAxMDI0KQoKLS0gClNpbmNlcmVseSwKICAgTHl1ZGUgUGF1bCAoc2hlL2hlcikKICAgU29m
dHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAogICAKTm90ZTogSSBkZWFsIHdpdGggYSBsb3Qgb2Yg
ZW1haWxzIGFuZCBoYXZlIGEgbG90IG9mIGJ1Z3Mgb24gbXkgcGxhdGUuIElmIHlvdSd2ZQphc2tl
ZCBtZSBhIHF1ZXN0aW9uLCBhcmUgd2FpdGluZyBmb3IgYSByZXZpZXcvbWVyZ2Ugb24gYSBwYXRj
aCwgZXRjLiBhbmQgSQpoYXZlbid0IHJlc3BvbmRlZCBpbiBhIHdoaWxlLCBwbGVhc2UgZmVlbCBm
cmVlIHRvIHNlbmQgbWUgYW5vdGhlciBlbWFpbCB0byBjaGVjawpvbiBteSBzdGF0dXMuIEkgZG9u
J3QgYml0ZSEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
