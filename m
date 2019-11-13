Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8748FB4A1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 17:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606EC6ED82;
	Wed, 13 Nov 2019 16:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9E56ED82
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 16:06:33 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id k11so816508ual.10
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 08:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ayLEgLCWpr2v/YpRT1vekWIlyB7F5pG92dGazdBvwI=;
 b=miwwkvsuipRpOkw+3wdUkOM9Jxy94qgK0Zzq2FMj3fXoIgRxVOM3mpWYFA8O1bV/b8
 mPjRA9R7nxlQWTKYkn8vLHHogIyRG/DjmqsGu9uD3UArmlN4Ze9jGJYNluN9URybqz5a
 ugLn4W759TY+m161q6PInfT2DNV9C9U9kyourbZ2aTqS+SKLvTQwi4pT+DiLqjpGAO28
 cSyfyJcoND0AjJYHqwnSW/IAIz7ha6YwAYVWsTQFp76mSe46mhogkINxG8tI8gVDY6kt
 54PQwYjKgUkiqJl7nSHmeArxby+EedV2ZWN3HbOH4pK7FzaetKFHBx4/brpArJYevmKj
 Lz+w==
X-Gm-Message-State: APjAAAW2XVfVOnN6a2QoRiLxEBnqs38XgVqYs6gUHMLAY6lk0+NEP+Ho
 kJdt70nOJhwIzypuGUIw50Ks2kh/QJkLh/qaTmU=
X-Google-Smtp-Source: APXvYqyzUYrhlIoEugbzPslmvADNMfF2xvcbUO3zTaYeh1c05O5Pyx2U0QDgD4P1JCUm3NiogsNTTpD6/UoykImOIHY=
X-Received: by 2002:ab0:14e8:: with SMTP id f37mr2288342uae.64.1573661192697; 
 Wed, 13 Nov 2019 08:06:32 -0800 (PST)
MIME-Version: 1.0
References: <20191106163031.808061-1-adrian.ratiu@collabora.com>
 <20191106163031.808061-5-adrian.ratiu@collabora.com>
In-Reply-To: <20191106163031.808061-5-adrian.ratiu@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 13 Nov 2019 16:06:05 +0000
Message-ID: <CACvgo506P+qNUg8vbpxY0_E7AAwJMHseM=Jwb3c2K8zo-v-2qQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: display: add IMX MIPI DSI host
 controller doc
To: Adrian Ratiu <adrian.ratiu@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1ayLEgLCWpr2v/YpRT1vekWIlyB7F5pG92dGazdBvwI=;
 b=G0C2zq6m15OVUAh+WFhsjZYXXzcdOByoFghlCOloPCUxpwsOe48d6TWKiBYF1Jt+3P
 pCkyi8gtQTCFIBPO9DwTV6c0WxkptrtOWz4iYPnK/cnKPm7I5zvj+dxET+BVtJ1DQpne
 xvFFiYgEs8mmbZJfAKBvvDnvS95WxPpEuPkR3s9WkN17IYO9Pb5tGG3tSajwy1byyD4N
 F16i2K46Gs2g/bj6Gi2+PLQDxaHl6IMmz66pxEDl3gH6mDW5O41D81GUalCuv66KK2kl
 pzplG0H99Acg6QnE2CyrhUpnwJAaLbkNCMS71/7karx00Scg1v8aAwzEcypXqj1ia3qp
 NQ+Q==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA2IE5vdiAyMDE5IGF0IDE2OjMxLCBBZHJpYW4gUmF0aXUgPGFkcmlhbi5yYXRpdUBj
b2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC5s
LnZlbGlrb3ZAZ21haWwuY29tPgpQbGVhc2UgZHJvcCB0aGlzIG9uZS4gSSdtIG5vdCB0aGF0IGV4
cGVyaWVuY2VkIGluIERUIHRvIHByb3ZpZGUKbWVhbmluZ2Z1bCByZXZpZXcuCgpBY3R1YWxseSwg
SSd2ZSBqdXN0IG5vdGljZWQgdGhhdCByZXNwZWN0aXZlIG1haW50YWluZXJzL2xpc3RzIGFyZSBu
b3QKQ0MnZCBvbiB0aGUgc2VyaWVzLgpQbGVhc2UgdXNlIHRoZSBnZXRfbWFpbnRhaW5lci5wbCBz
Y3JpcHQgZ290IGdldCB0aGUgY29ycmVjdCBpbmZvLgoKUGVyc29uYWxseSwgSSByZWFkIHRocm91
Z2ggdGhlIG91dHB1dCwgYWRkaW5nIG9ubHkgcmVsZXZhbnQgcGVvcGxlIGFzCkNDIGluIHRoZSBj
b21taXQgbWVzc2FnZSBpdHNlbGYuCgpJbiBwYXJ0aWN1bGFyLCBJIGRvbid0IHRoaW5rIGFkZGlu
ZyB0aGUgIm1haW50YWluZXI6IERSTSBEUklWRVIiIG9yCnRoZSAiQVJNL0ZSRUVTQ0FMRSBJTVgg
LyBNWEMgQVJNIEFSQ0hJVEVDVFVSRSIgYXJlIHJlcXVpcmVkLiBPbiB0aGUKb3RoZXIgaGFuZCAi
RFJNIERSSVZFUlMgRk9SIEZSRUVTQ0FMRSBJTVgiIGFuZCAiT1BFTiBGSVJNV0FSRSBBTkQKRkxB
VFRFTkVEIERFVklDRSBUUkVFIEJJTkRJTkdTIiBzZWVtcyBwcmV0dHkgYWNjdXJhdGUgZm9yIHdo
YXQgeW91J3JlCmRvaW5nIGhlcmUuCgpIVEgKRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
