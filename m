Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D6E32B952
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 17:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91BE6E409;
	Wed,  3 Mar 2021 16:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFD06E409
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 16:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614790366;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vuafV9iaKeRCuCbrDXsJ7dHnd1BZ5WTGR38IgEon89s=;
 b=f/vvQO9d5Q6qEum8PRWDxOhpnANqL09N6gAOxGRQY2mQvFPInRubzzGEJW0qN9R7w+21Cs
 1p/7aok7OM9doTdz1dfZo/a+Qq8YwbhjEto06hkzIHX9GRhzhImhzocofVhoy7+jK1rwbe
 ugasa0g5FatTjf+WDVO+Lt7USqF1sJM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-QOzsV3HfOGSxsEAXnF3IUw-1; Wed, 03 Mar 2021 11:52:44 -0500
X-MC-Unique: QOzsV3HfOGSxsEAXnF3IUw-1
Received: by mail-qt1-f199.google.com with SMTP id k1so16518039qtp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 08:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=vuafV9iaKeRCuCbrDXsJ7dHnd1BZ5WTGR38IgEon89s=;
 b=JL2vxOeK7rHwQiqSwYWgimD1gx+aqPieX7MJC7bTQ0/2QlZb3IaEF+WGCGfzVfX+6H
 S81FG5TXzTGd38X7UtteiMGEQmAK4z/dbvcHDbKQ1oy57PGoSAaHLiOVS+uKuS9pnJ1Q
 jQU3r+NN4LPYxC/1SnmV0tjJMGvhUbE38mhvgU//SyyX2+TX1X5waSq0hlImv2grND9J
 rgoa4C3puWf7MGsx4GbjTrWT5MLeGqRZP/S+Gktv676WMBMqUrAdGneBa/oKmcSiC6lU
 oGP830QkhgG5Jhdr18FepVJw7JVQewm/cKR75h+mJDZ4omcJ+cGjJZaI/ziuCULBX8S2
 orzA==
X-Gm-Message-State: AOAM531ONSoSGQzqRjWjxrx/vrFzwzmZOVTiNMn0jpK614w4mwvr3NfD
 5SOTvQPgJlgRKh0GAWnHjqn5d11LczR1YbUQh8l7OTAV4jFqYW0fX+DV4Luw1eM2JSsG35tY1SS
 cytYt4rGVHz+VEm5RTyXnIodrFqRS
X-Received: by 2002:ac8:7392:: with SMTP id t18mr88280qtp.104.1614790364483;
 Wed, 03 Mar 2021 08:52:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRWwQPHZiKC09PdyNhlbkJTWeTtRw/uphRdlzLLWHMQESdVZfoUpNN0OnE7ymkuHZToRDZ0A==
X-Received: by 2002:ac8:7392:: with SMTP id t18mr88256qtp.104.1614790364277;
 Wed, 03 Mar 2021 08:52:44 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id h12sm16962779qko.29.2021.03.03.08.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 08:52:43 -0800 (PST)
Message-ID: <fb624c779ff09228e8bf4ac31a8bcf9edca658cb.camel@redhat.com>
Subject: Re: [PATCH 17/53] drm/nouveau/dispnv50/headc57d: Make local
 function 'headc57d_olut' static
From: Lyude Paul <lyude@redhat.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Wed, 03 Mar 2021 11:52:42 -0500
In-Reply-To: <20210303134319.3160762-18-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <20210303134319.3160762-18-lee.jones@linaro.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
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

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpUaGFua3MhCgpPbiBX
ZWQsIDIwMjEtMDMtMDMgYXQgMTM6NDIgKzAwMDAsIExlZSBKb25lcyB3cm90ZToKPiBGaXhlcyB0
aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiAKPiDCoGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkLmM6MTczOjE6IHdhcm5pbmc6IG5vIHBy
ZXZpb3VzCj4gcHJvdG90eXBlIGZvciDigJhoZWFkYzU3ZF9vbHV04oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KPiAKPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IENjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jIHwg
MiArLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdk
LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkLmMKPiBpbmRl
eCBmZDUxNTI3YjU2YjgzLi5iZGNmZDI0MGQ2MWM4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jCj4gQEAgLTE2OSw3ICsxNjksNyBAQCBoZWFkYzU3
ZF9vbHV0X2xvYWQoc3RydWN0IGRybV9jb2xvcl9sdXQgKmluLCBpbnQgc2l6ZSwKPiB2b2lkIF9f
aW9tZW0gKm1lbSkKPiDCoMKgwqDCoMKgwqDCoMKgd3JpdGV3KHJlYWR3KG1lbSAtIDQpLCBtZW0g
KyA0KTsKPiDCoH0KPiDCoAo+IC1ib29sCj4gK3N0YXRpYyBib29sCj4gwqBoZWFkYzU3ZF9vbHV0
KHN0cnVjdCBudjUwX2hlYWQgKmhlYWQsIHN0cnVjdCBudjUwX2hlYWRfYXRvbSAqYXN5aCwgaW50
IHNpemUpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChzaXplICE9IDAgJiYgc2l6ZSAhPSAy
NTYgJiYgc2l6ZSAhPSAxMDI0KQoKLS0gClNpbmNlcmVseSwKICAgTHl1ZGUgUGF1bCAoc2hlL2hl
cikKICAgU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAogICAKTm90ZTogSSBkZWFsIHdpdGgg
YSBsb3Qgb2YgZW1haWxzIGFuZCBoYXZlIGEgbG90IG9mIGJ1Z3Mgb24gbXkgcGxhdGUuIElmIHlv
dSd2ZQphc2tlZCBtZSBhIHF1ZXN0aW9uLCBhcmUgd2FpdGluZyBmb3IgYSByZXZpZXcvbWVyZ2Ug
b24gYSBwYXRjaCwgZXRjLiBhbmQgSQpoYXZlbid0IHJlc3BvbmRlZCBpbiBhIHdoaWxlLCBwbGVh
c2UgZmVlbCBmcmVlIHRvIHNlbmQgbWUgYW5vdGhlciBlbWFpbCB0byBjaGVjawpvbiBteSBzdGF0
dXMuIEkgZG9uJ3QgYml0ZSEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
