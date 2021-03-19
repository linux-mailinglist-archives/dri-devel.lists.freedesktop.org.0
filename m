Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D741342375
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 18:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647026EA62;
	Fri, 19 Mar 2021 17:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545CD6EA62
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 17:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616175421;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gPoEAPJcZtBPa2hGBhjHmOpRECP1X15O+ra4sz3CfJ0=;
 b=fZgOMJgcTuVW834euNBI3Hzo8KkQ7qgPKzWK5ZsSLrMxu//60c3ykllkoHvWlFor1krQaW
 cmzkMQzD7T0Sxn0i+S+45awd3+HDtr75a2ZxAYMvMZUvEt5ReViGv1k+mXDeF/1Gr/geNX
 gnJY/AflH4mHCfsnyTyjjJWa9rF+U3M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-up9wMQZWO72NfqA9v9lypg-1; Fri, 19 Mar 2021 13:36:59 -0400
X-MC-Unique: up9wMQZWO72NfqA9v9lypg-1
Received: by mail-qk1-f200.google.com with SMTP id i188so34389674qkd.7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 10:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=gPoEAPJcZtBPa2hGBhjHmOpRECP1X15O+ra4sz3CfJ0=;
 b=EFPsO2LoLYnFPlw5mWO4cMOXLwUcQcYM4CF4wBm9QIh1W+Kd5pKjSgyMkxEfZcjtak
 3to+Oi+kyqcVkXBpo5jIqxV8BCK+gcGfuW72AeqX9ne9oQJrajb53Iz03pdHv3Ub76PN
 rtWjMoZQtjVLieMHBnb2rJXpZk0G4cOHsaQ6QjqI6VmkEzU9gmVF/9CBifr8MC7UO4+/
 xWb9F3n5pTk+8QwmHY82SC6LCN4ulvDHLqQWT0zU9mcdZh0dFsMsCeAD7HYKKnJOgLPk
 PQNMwRJ2Ka+jE94Wz1hEoEN8CxUVL5sIEhpQv1FaMI+2gtO3RCTmmsYV2AALcwgExwvI
 h+Gw==
X-Gm-Message-State: AOAM530vWPPEw8gmxdYq2LXiXA01LAoPAODHJFSamSJCGTFY9mr5qkH9
 +Lo4kVy8JU5qL6ssfvI3Cydqtt49UBHly2zobBQboYME0F2tkUI/fiRmZsLK0Hr5aehKkWizJ/T
 V+Y2SfhAj/ovHig83tGAqAo9m+zjq
X-Received: by 2002:ad4:46a6:: with SMTP id br6mr10361017qvb.61.1616175419313; 
 Fri, 19 Mar 2021 10:36:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypAyV+kC37U9VAtNPMOlC2K7/EVvRqkJVrhf8sltJXxZWMrqv//uKkWUNAJx8/U7Bpv3IKmg==
X-Received: by 2002:ad4:46a6:: with SMTP id br6mr10360992qvb.61.1616175419117; 
 Fri, 19 Mar 2021 10:36:59 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id t6sm4209571qti.2.2021.03.19.10.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 10:36:58 -0700 (PDT)
Message-ID: <02765161a07745603e737d427b90d779549a13a5.camel@redhat.com>
Subject: Re: [PATCH 14/19] drm/nouveau/dispnv50/headc57d: Make local
 function 'headc57d_olut' static
From: Lyude Paul <lyude@redhat.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Fri, 19 Mar 2021 13:36:57 -0400
In-Reply-To: <20210319082428.3294591-15-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-15-lee.jones@linaro.org>
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

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBGcmksIDIwMjEt
MDMtMTkgYXQgMDg6MjQgKzAwMDAsIExlZSBKb25lcyB3cm90ZToKPiBGaXhlcyB0aGUgZm9sbG93
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
