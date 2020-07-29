Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF23E231695
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 02:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2E56E111;
	Wed, 29 Jul 2020 00:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B2C6E111
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 00:04:59 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id n2so16089333edr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 17:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h40D7u/nE7UtrwgRU6b7SlI5QtmCouuQj4VR5X18MzY=;
 b=aOkNgCt/cuptIPrmCUFnEiJjVrLebICt/Y5C82qGSUhWBWOR8i8i0q9KZX73OPAmLB
 yw2XQw/Jpuy9LVWWDwAq9jbcjC0jb2VPlBgECB6biK6o6wgIAzDQkFbctmchIyClR+SN
 hE8XMQt5q2+tiD4NIurrxbiMj8s8vf8dvOiCagqwg53O32c1FlFAZ0K032xPTevoyaol
 XsPx4PXZgyVLCicEePv55bl5ZcCYwIq8MERwx0WeQD5YhsE/Xhj5x8GVy6fISVr8WGgW
 6fRcykCKS1rgW7GKaP81aLl2SMAJwpcceiST/DmVwhiyRZC+Sh/TNcW9QQtGqjJEZTxz
 aFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h40D7u/nE7UtrwgRU6b7SlI5QtmCouuQj4VR5X18MzY=;
 b=kHpaydY997mp6IDbhpKT9TK9yO+yz/qc4KGsmljnkPT9f2HdPzQ0neeeI8CSqROobv
 R+pdICzKevXYnNebNKtPw4XRcvGr47YG8oksJeyfcLp1YQieM4s7GlSP1BX2tM8dVzZX
 qQDKSDO511qyHx5/nCzruHIhLXgUDpxefuh0j6atZp+c5NGwKn4McJ/jY8pM4Sm/It++
 c4y299cRdoG1eZdSm8C3U7soQaq7QOteGsRtpnzt62Oh7n12RZ8Pbw4Da/awF8P25UtU
 ws6Tx6yTAvJR62ZZDjq5Uaqsz/d5ccICqo3NG0ebF5L/oIj+joGTGQ/GOTF15B7N0CA8
 tOag==
X-Gm-Message-State: AOAM531ixlvvstiQMOSDv39c1GqMrzUev+O94/10fezG8EMoF33c5Gz7
 F44WDa2P7dtQI3PHDyWDdLFO1fWs3vTf4BzikhQ=
X-Google-Smtp-Source: ABdhPJxYwFqWj9AMFbrm+v1ZGDznVGeBeUXK/fZ7KV8WrPpFbUQ7RER0XGMQtOfUjeWjo6WpCdtBYH9cl+M8ABUVaSM=
X-Received: by 2002:a50:fc84:: with SMTP id f4mr22032785edq.220.1595981098056; 
 Tue, 28 Jul 2020 17:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200728045129.21065-1-airlied@gmail.com>
 <bbf3f89f-bcb2-dd61-c796-e16960884ed7@amd.com>
In-Reply-To: <bbf3f89f-bcb2-dd61-c796-e16960884ed7@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 29 Jul 2020 10:04:46 +1000
Message-ID: <CAPM=9tzPQmJw58Rpc=ENrXxaP1HF0p78GmLMwkojWBGGNy2imQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: drop unusued function declaration
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

T24gVHVlLCAyOCBKdWwgMjAyMCBhdCAxNzo0OSwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDI4LjA3LjIwIHVtIDA2OjUxIHNjaHJpZWIg
RGF2ZSBBaXJsaWU6Cj4gPiBGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
ID4KPiA+IFRoaXMgd2FzIHJlbW92ZWQgaW4KPiA+IGY1YTlhOTM4M2YyNzlkZTlkYTYzMjk2Y2I2
MjNhNjQxOGE2NjE5NmIgZHJtL3R0bTogcmVtb3ZlIFRUTV9NRU1UWVBFX0ZMQUdfQ01BCj4gPgo+
ID4gYnV0IHRoZSB0aGUgZGVjbGFyYXRpb24gd2FzIGxlZnQgZGFuZ2xpbmcuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPgo+IFJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpJJ3ZlIGp1
c3QgcHVzaGVkIHRoaXMsIHRoZSB1bmJpbmQgYW5kIHN3YXBvdXQgYWxsIHRvIGRybS1uZXh0LgoK
VGhvdWdoIHdlIHNob3VsZCBwcm9iYWJseSBpbiBmdXR1cmUganVzdCBoYXZlIHlvdSBtZXJnZSB0
aGVtIHZpYSBtaXNjLgoKRGF2ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
