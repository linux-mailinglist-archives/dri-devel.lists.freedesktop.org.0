Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B0F5E78B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 17:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8712B898EA;
	Wed,  3 Jul 2019 15:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FAB898EA;
 Wed,  3 Jul 2019 15:14:36 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id s184so2358524oie.9;
 Wed, 03 Jul 2019 08:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TOkaUHM2Pta5OrK1zwStGyAgqn6FV+BWv9G6llOhuGg=;
 b=iSVlFL1vs63k57Y4NlCmbmn3DJ0JB189YexBUo7zI6KG9Rl2lsXb/QrdFNvOdSH7WJ
 NQYmQWY5o2ln5x+xSO4BBXDJuz5lGORHX5AA0fwJCBDBEwKjGTG7hz/kwi6Z+6gZrVAc
 d12S4a+2Mf/w4M3En6S1ozsVAhQr3bi+KPK2r0SzWbhj047Rr+7PHLW03Ab2tx+ZQP1e
 qU6mq7S3jltx5WPe8G7ZoG6VbjtBLG2+iucGArWJbaevnbJxpUd0ZH3v0jIZSR1r1PFf
 PzM09gOncsoOvwO71jaZ0qwkUHqnD6ebrbckc5tqpa4WzImROWLc+05KI3t6cJnU8NgH
 MU6A==
X-Gm-Message-State: APjAAAVgqzrUq3MPSfe0BysFsmhXR7AwOfefgF1RmwIYZ8kDciLV2EiA
 Y15PIPaCVBxURYwnFds7+Qogmyp4ySVPnuwhDoIUHvga
X-Google-Smtp-Source: APXvYqzO2cVR17kduR+9DVy8Y8lyPBbSCF7a1VIoAPWtyY+VAcdxJbPLtjZXHs0y+QnmYEvH2dLG+uTxWTz++1ALN5M=
X-Received: by 2002:aca:de56:: with SMTP id v83mr6977333oig.162.1562166875128; 
 Wed, 03 Jul 2019 08:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <0bc184ea-bcc3-48cb-9b28-42e8fc037303@email.android.com>
In-Reply-To: <0bc184ea-bcc3-48cb-9b28-42e8fc037303@email.android.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 3 Jul 2019 16:14:45 +0100
Message-ID: <CACvgo52y50bV90+7JeABvKCNCwT_E7r7CXTw98bOgyiDDzG2Pg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm: introduce DRIVER_FORCE_AUTH
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TOkaUHM2Pta5OrK1zwStGyAgqn6FV+BWv9G6llOhuGg=;
 b=Z681UKydntTdrqjXc1lvfr0XJSTLPwVKcQPLKMsU4NSMHGhIoXW6LSlJNrTzoZtmyR
 t30SjSN/7oJKxcm83DmbYnXQDLcS1huO5qWe1mAx1DFiP+3FGDYDVOH61XNmYn7li99q
 WgHa2Rw7ufDJwrP3tvokOIgXWEkQuVfmoq0xjrdyyWv2m3Tm/Z1puz3tj/REdhfPTQyl
 pye9OcymABmYKgCnw3OzsnshD6iIYZWWr3jAvl5QJFT9laIpg88Sc907k85B9nL2jl49
 OSfy8Lo+eEwpdUVkITtwirH64kObb/p79mfY7vjAixybRCBvadf/Bn0ByRa+WV5dX9Ig
 MfBw==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAzIEp1bCAyMDE5IGF0IDE1OjU4LCBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFu
LktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiBBbSAwMy4wNy4yMDE5IDE2OjUxIHNjaHJpZWIgRW1p
bCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Ogo+Cj4gT24gV2VkLCAzIEp1bCAy
MDE5IGF0IDE1OjMzLCBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29t
PiB3cm90ZToKPiA+IEFtIDAzLjA3LjIwMTkgMTY6MDAgc2NocmllYiBFbWlsIFZlbGlrb3YgPGVt
aWwubC52ZWxpa292QGdtYWlsLmNvbT46Cj4gPgo+ID4gT24gV2VkLCAzIEp1bCAyMDE5IGF0IDE0
OjQ4LCBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gV2VsbCB0aGlzIGlzIHN0aWxsIGEgTkFLLgo+ID4gPgo+ID4gPiBBcyBzdGF0
ZWQgcHJldmlvdXNseSBwbGVhc2UganVzdCBkb24ndCByZW1vdmUgRFJNX0FVVEggYW5kIGtlZXAg
dGhlIGZ1bmN0aW9uYWxpdHkgYXMgaXQgaXMuCj4gPiA+Cj4gPiBBRkFJQ1Qgbm9ib2R5IHdhcyBp
biBmYXZvdXIgb2YgeW91ciBzdWdnZXN0aW9uIHRvIHJlbW92ZSBEUk1fQVVUSCBmcm9tCj4gPiB0
aGUgaGFuZGxlIHRvL2Zyb20gZmQgaW9jbHRzLgo+ID4gVGh1cyB0aGlzIHNlZW1zIGxpa2UgdGhl
IHNlY29uZCBiZXN0IG9wdGlvbi4KPiA+Cj4gPgo+ID4gV2VsbCBqdXN0IGtlZXAgaXQuIEFzIEkg
c2FpZCBwbGVhc2UgZG9uJ3QgY2hhbmdlIGFueXRoaW5nIGhlcmUuCj4gPgo+ID4gRHJvcHBpbmcg
RFJNX0FVVEggZnJvbSB0aGUgZHJpdmVyIElPQ1RMcyB3YXMgc3VmZmljaWVudCB0byB3b3JrIGFy
b3VuZCB0aGUgcHJvYmxlbXMgYXQgaGFuZCBmYXIgYXMgSSBrbm93Lgo+ID4KPiBXZSBhbHNvIG5l
ZWQgdGhlIERSTV9BVVRIIGZvciBoYW5kbGUgdG8vZnJvbSBmZCBvbmVzLiBNZXNhIGRyaXZlcnMg
dXNlCj4gdGhvc2UgaW9jdGxzLgo+Cj4KPiBZZWFoLCBidXQgb25seSBmb3IgaW1wb3J0aW5nL2V4
cG9ydGluZyB0aGluZ3MuCj4KPiBBbmQgaW4gdGhvc2UgY2FzZXMgd2UgZWl0aGVyIGFscmVhZHkg
Z2F2ZSByZW5kZXIgbm9kZXMgb3IgY29ycmVjdGx5IGF1dGhlbnRpY2F0ZWQgcHJpbWFyeSBub2Rl
cy4KPgo+IFNvIG5vIG5lZWQgdG8gY2hhbmdlIGFueXRoaW5nIGhlcmUgYXMgZmFyIGFzIEkgc2Vl
Lgo+Ck5vdCBxdWl0ZS4gV2hlbiB3b3JraW5nIHdpdGggdGhlIHByaW1hcnkgbm9kZSB3ZSBoYXZl
IHRoZSBmb2xsb3dpbmcgc2NlbmFyaW9zOgogLSBoYW5kbGUgdG8gZmQgLT4gcGFzcyBmZCB0byBv
dGhlciBBUElzIC0gZ2JtLCBvcGVuY2wsIHZkcGF1LCBldGMKIC0gaGFuZGxlIHRvIGZkIC0+IGZk
IHRvIGhhbmRsZSAtIHVzZSBpdCBpbnRlcm5hbGx5CgotRW1pbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
