Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E1734FCC6
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 11:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D426EA2E;
	Wed, 31 Mar 2021 09:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC716EA2E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:29:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id w18so21564732edc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 02:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KbfOd+tAtH69FWHXUNYJ4IQMzvXlbxHuVJufSIqfiKk=;
 b=oLMHpHTQDPMX9TNqWy4cA3x0U3czkszFMHlRSGOUlZhug8voYmER0QaqTYSgfCM00S
 riUsvd7U9pgwLY2Ku53VePwVRnfWCuBDa9HsVytFbyvpzDt8NB+faPBcpdECg+ldp5rN
 HXr2IKu1z99GUUZU4QN+Sz/aq7ZWHRuRxenzV+U6gmH+fDVkx5gEJLuVhFK9NqIgLIVV
 r9Qg5vmwGVn1OO9uWInHSGLJ9GK+1rzwlFJCvo+k+1pRVUlFebF/HKf5xvoS9/TicUBR
 23P1vhNPRX2AHKrMhBAc8sqWF2RfR5KphgFg/Im+kc+jY27AFMKQ652hlkRuyYSvDo6r
 LPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KbfOd+tAtH69FWHXUNYJ4IQMzvXlbxHuVJufSIqfiKk=;
 b=bCfUVtE7Uy+ZiAChdQgiosH+zhvMi8l8gMwKE3WVvOALjXY70RxDgf79iRxXBRoSVM
 hjUPkFZJAH2CMYxy8IwjnBtUdmSvREBtNKW2RIGT3foY/2OsKXyXGZAqhqNu/x7Fc4p6
 fVe93eTnK+lCAgM0AOK9ysVjdT1pRdBLXs5Ch+IiT5I+eex9jRVthPHBcY3AWfNViowN
 KyHrQvImRftieD2thEwovWk77KGTg8PKKULK32cVU3NFARMIFzUZqKUMhRpGWOtfmv1r
 dbu4XNjIKAOKDUuhHfo8KeawhaCyUQ4w57IjqOJPCI1sVqYuRXOIOmxIWt0RXi/8fg8Q
 njzg==
X-Gm-Message-State: AOAM533AqgxF+S6ZfRY+jyrCO3xDNpg3dTQYEgrAyA0wffTd06GlIdjl
 2WFI2jtCSa4AfK96jphkMCYtYYwbeHgkCD0Ss9w=
X-Google-Smtp-Source: ABdhPJwTe+A3LVG2HxD65yeKh2Yri9p7lPPe2RhhPRI/b92Ft4R2uCuY9/5syChn+jUsLuunigxBB48VQBZWGRf5/x0=
X-Received: by 2002:aa7:cb82:: with SMTP id r2mr2515950edt.209.1617182959524; 
 Wed, 31 Mar 2021 02:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <YGQu9uZ/d5ph+eS9@mwanda> <20210331081438.GF2088@kadam>
 <CABkfQAGZVsRV_hjjGXvK-7yY5vgg+1Bfr9xCvxdLeJwA7OwJyg@mail.gmail.com>
 <20210331092730.GJ2088@kadam>
In-Reply-To: <20210331092730.GJ2088@kadam>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Wed, 31 Mar 2021 11:29:08 +0200
Message-ID: <CABkfQAFuz_dBqNkEF3M65iAJ48TnYBZACfHRHSvFa3XHJ4pJxg@mail.gmail.com>
Subject: Re: [bug report] drm/bridge: Introduce LT8912B DSI to HDMI bridge
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

TGUgbWVyLiAzMSBtYXJzIDIwMjEgw6AgMTE6MjcsIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50
ZXJAb3JhY2xlLmNvbT4gYSDDqWNyaXQgOgo+Cj4gT24gV2VkLCBNYXIgMzEsIDIwMjEgYXQgMTE6
MTc6MjBBTSArMDIwMCwgQWRyaWVuIEdyYXNzZWluIHdyb3RlOgo+ID4gSGVsbG8sCj4gPgo+ID4g
dGhhbmtzIGZvciB5b3VyIHJldmlldy4KPiA+Cj4gPiBJIHdpbGwgcHVibGlzaCBhIHBhdGNoIHNv
b24uCj4gPgo+ID4gV2hhdCB0YWcgc2hvdWxkIEkgYWRkIHRvIG15IGNvbW1pdCB0byBtZW50aW9u
IHRoYXQgeW91IGZpbmQgYnVncwo+ID4gKFN1Z2dlc3RlZC1ieSBmb3IgZXhhbXBsZSk/Cj4KPiBJ
ZiB0aGVyZSBpcyBhIGJ1ZyBmaXggdGhlbiBwbGVhc2UgY291bGQgeW91IHVzZSBSZXBvcnRlZC1i
eT8KPgpJIHdpbGwgZG8gdGhhdCArIFN1Z2dlc3RlZC1ieS4KPiByZWdhcmRzLAo+IGRhbiBjYXJw
ZW50ZXIKPgoKVGhhbmtzIGFnYWluIGZvciB5b3VyIHRpbWUgYW5kIHlvdXIgcmV2aWV3LgoKQWRy
aWVuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
