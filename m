Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA222CEACA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE1D6E62C;
	Mon,  7 Oct 2019 17:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A566E62C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:38:42 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-YTXVBpzcMliBYavsiGExXA-1; Mon, 07 Oct 2019 13:38:37 -0400
Received: by mail-qk1-f197.google.com with SMTP id 11so15668215qkh.15
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 10:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=KcieA/2Xt6/7cG4p7yFwF153nHVTb/aDWMfjqMJALPY=;
 b=f8DBhySzS0xxwHnAHxepzP8qiIpbuWrapO6CnkkihZgvRMt6R0fcvgluJyXQ8aCeOU
 EQY519nc98facpu+jMgECf3R0j3b1EmvkUNy2/jAMM6LK1kWhZbC0sMQMkARQs/cCJLH
 nKLBELhCcBHpfUMDdB9C09hjqlAiP9kkgIT8nMAYaUfOowsYlyCvApNjQ7Ye+2iWmkzZ
 VIHx19sZVkgS7XfcLGx9y2dyemEloMs7D6G3gO1nnahTQEWiHBMiicAI+RnXnYhy0KC+
 94djNXbpij3tVxDrTIoC2B/phmzyoLEsf26KVeQXjsPhH9606HX0pqpNbx/KUJ2zSQnT
 oKSg==
X-Gm-Message-State: APjAAAXFYmfrGXXvZcfTmsZbAn7oM8O9+VASX7HPaoJYQbNxIVqp8Bt7
 Aq8jQ2olsm1zmbYDnvWVWnCMqSKOwzKQ9vlWgD1MA044ye2NDwT5RbOxw2U4IuvJuQQpidcCQOH
 iJaObtPKWExns1MPzBhgL4h0KBxD0
X-Received: by 2002:a37:9d53:: with SMTP id g80mr24111487qke.67.1570469916976; 
 Mon, 07 Oct 2019 10:38:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWZtSJJOqNn4spAi2Ge280yxxf1P6qRyg6ze5DowmWzG37A58TUJyjB720s9PTBdIeZfGUNg==
X-Received: by 2002:a37:9d53:: with SMTP id g80mr24111454qke.67.1570469916659; 
 Mon, 07 Oct 2019 10:38:36 -0700 (PDT)
Received: from desoxy (c-24-61-245-152.hsd1.ma.comcast.net. [24.61.245.152])
 by smtp.gmail.com with ESMTPSA id j2sm8281468qki.15.2019.10.07.10.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 10:38:36 -0700 (PDT)
Message-ID: <75105bb4d3c4ea37aaf53144be5d644f998f3626.camel@redhat.com>
Subject: Re: [PATCH] drm/i915: customize DPCD brightness control for
 specific panel
From: Adam Jackson <ajax@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, 
 "20191004215851.31446-1-shawn.c.lee@intel.com"
 <20191004215851.31446-1-shawn.c.lee@intel.com>, 
 "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Date: Mon, 07 Oct 2019 13:38:34 -0400
In-Reply-To: <877e5gj52f.fsf@intel.com>
References: <20191004215851.31446-1-shawn.c.lee@intel.com>
 <33dcaf669eae3acfc3b716e68b69c0fe76dd2dbc.camel@redhat.com>
 <87d0fce4mh.fsf@intel.com>
 <D42A2A322A1FCA4089E30E9A9BA36AC65D6A9C66@PGSMSX111.gar.corp.intel.com>
 <877e5gj52f.fsf@intel.com>
User-Agent: Evolution 3.34.0 (3.34.0-1.fc31)
MIME-Version: 1.0
X-MC-Unique: YTXVBpzcMliBYavsiGExXA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1570469921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=utDzNVc5Po9Srf0wYPq3tnhKS2BoqIcfwjc0diQPbJM=;
 b=iTmcRzF562xqWpVlzskJjS9nGl9jCyiax68jV2HOWKHNx0VVVXXp140WA+RbTi5v2N8cFj
 AyDjQVf50BDsgGDwOHS5FscumtsaqHc2XY66YDm/keWIs+Je/J4XHe66EGxedEApOcCsWj
 niFpTkx017uuVc4yGTRdYeBILbKdyzk=
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
Cc: "Chiou, Cooper" <cooper.chiou@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTEwLTA3IGF0IDEyOjA4ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToKCj4g
VGhlIHByb2JsZW0gd2l0aCB0aGUgRURJRCBxdWlya3MgaXMgdGhhdCBleHBvc2luZyB0aGUgcXVp
cmtzIHN0aWNrcyBvdXQKPiBsaWtlIGEgc29yZSB0aHVtYi4gVGh1cyBmYXIgYWxsIG9mIGl0IGhh
cyBiZWVuIGNvbnRhaW5lZCBpbiBkcm1fZWRpZC5jCj4gYW5kIHRoZXkgYWZmZWN0IGhvdyB0aGUg
RURJRCBnZXRzIHBhcnNlZCwgZm9yIGFsbCBkcml2ZXJzLiBPYnZpb3VzbHkKPiB0aGlzIGNvdWxk
IGJlIGNoYW5nZWQsIGJ1dCBpcyBpdCB0aGUgcmlnaHQgdGhpbmcgdG8gZG8/Cj4gCj4gV2hhdCBJ
IHN1Z2dlc3RlZCB3YXMsIGNoZWNrIHRoZSBPVUkgb25seSwgYW5kIGlmIGl0IG1hdGNoZXMsIGRv
Cj4gbW9yZS4gUGVyaGFwcyB0aGVyZSdzIHNvbWV0aGluZyBpbiB0aGUgMHgzMDAgcmFuZ2Ugb2Yg
RFBDRCBvZmZzZXRzIHRoYXQKPiB5b3UgY2FuIHJlYWQ/IE9yIHBlcmhhcHMgeW91IG5lZWQgdG8g
d3JpdGUgdGhlIHNvdXJjZSBPVUkgZmlyc3QsIGFuZAo+IHRoZW4gZG8gdGhhdC4KCk15IGlzc3Vl
IGlzbid0IHJlYWxseSB3aXRoIGlkZW50aWZ5aW5nIHRoZSBwYW5lbCBmcm9tIEVESUQgcmF0aGVy
IHRoYW4KRFBDRCwgd2hpY2hldmVyIGlkZW50aWZpZXIgaXMgbW9zdCBzcGVjaWZpYyBpcyBwcm9i
YWJseSB0aGUgYmVzdCB0aGluZwp0byB1c2UuIEl0J3MgbW9yZSB0aGF0IHRoaXMgcXVpcmsgaXMg
aWRlbnRpZmllZCBpbiBjb21tb24gY29kZSBidXQgb25seQphcHBsaWVkIGluIG9uZSBkcml2ZXIu
IElmIHRoaXMgcGFuZWwgd2VyZSBldmVyIHRvIGJlIGF0dGFjaGVkIHRvIHNvbWUKb3RoZXIgc291
cmNlLCB0aGV5IG1pZ2h0IHdlbGwgd2FudCB0byBhcHBseSB0aGUgc2FtZSBraW5kIG9mIGZpeC4g
TXkKKGFkbWl0dGVkbHkgbmHDr3ZlKSByZWFkaW5nIG9mIHRoZSBPVUkgaGFuZHNoYWtlIHByb2Nl
c3MgaXMgdGhhdCB3aGVuCnRoZSBzb3VyY2UgZGV2aWNlIHdyaXRlcyBhbiBPVUkgdG8gRFBfU09V
UkNFX09VSSBpdCBpcyB0ZWxsaW5nIHRoZSBzaW5rCiJJJ20gYWJvdXQgdG8gaXNzdWUgY29tbWFu
ZHMgdGhhdCBjb25mb3JtIHRvIF90aGlzXyB2ZW5kb3IncyBvd24KY29udmVudGlvbnMiLiBJZiB0
aGF0IGNvbnZlbnRpb24gY29tbXVuaWNhdGVzIGluZm9ybWF0aW9uIHRoYXQgaXMKZW50aXJlbHkg
Y29udGFpbmVkIHdpdGhpbiBBVVhDSCB0cmFuc2FjdGlvbnMgKGFuZCBkb2Vzbid0LCBmb3IgZXhh
bXBsZSwKcmVxdWlyZSBsb29raW5nIGF0IHNvbWUgb3RoZXIgc3RyYXBwaW5nIHBpbiBvciBleHRl
cm5hbCBkZXZpY2UpIHRoZW4gaW4KcHJpbmNpcGxlIGl0IGRvZXNuJ3QgbWF0dGVyIGlmIHRoZSBz
b3VyY2UgZGV2aWNlICJtYXRjaGVzIiB0aGF0IE9VSTsgaXQKd291bGQgYmUgbGVnYWwgZm9yIGFu
IEFNRCBHUFUgdG8gd3JpdGUgdGhlIHNhbWUgc2VxdWVuY2UgYW5kIGV4cGVjdCB0aGUKc2FtZSBy
ZWFjdGlvbiwgc2hvdWxkIHRoYXQgcGFuZWwgYmUgYXR0YWNoZWQgdG8gYW4gQU1EIEdQVS4KClNv
LCBpdCB3b3VsZCBiZSBuaWNlIHRvIGtub3cgZXhhY3RseSB3aGF0IHRoYXQgcHJvdG9jb2wgaXMg
bWVhbnQgdG8gZG8sCmlmIGl0IGFwcGxpZXMgb25seSB0byB0aGlzIHNwZWNpZmljIHBhbmVsIG9y
IGFueXRoaW5nIGVsc2Ugd2l0aCB0aGUKc2FtZSBUQ09OLCBob3cgb25lIHdvdWxkIGlkZW50aWZ5
IHN1Y2ggVENPTnMgaW4gdGhlIHdpbGQgb3RoZXIgdGhhbgpFRElELCBpZiBpdCByZWxpZXMgb24g
YW4gZXh0ZXJuYWwgUFdNIG9yIHNvbWV0aGluZywgZXRjLiBBbmQgaXQgbWlnaHQKbWFrZSBzZW5z
ZSBmb3Igbm93IHRvIG1ha2UgdGhpcyBhIChzaHVkZGVyKSBkcml2ZXItc3BlY2lmaWMgRURJRCBx
dWlyawpyYXRoZXIgdGhhbiBtYXRjaCBieSBEUENELCBhdCBsZWFzdCB1bnRpbCB3ZSBrbm93IGlm
IHRoZSBwYW5lbCBpcyBldmVyCnNlZW4gYXR0YWNoZWQgdG8gb3RoZXIgc291cmNlIGRldmljZXMg
YW5kIGlmIHRoZSBPVUkgY29udmVudGlvbiBpcwpzZWxmLWNvbnRhaW5lZC4KCi0gYWpheAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
