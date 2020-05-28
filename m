Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B531E6656
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 17:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A256E150;
	Thu, 28 May 2020 15:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286036E150
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 15:40:08 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id z13so3508573vsn.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 08:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GDRa4RFDTWP8hbxoyrpsGnSp7hiJz6RTAPpCucQo+Ss=;
 b=YvS3gvZVh552xy2rAQ2BrmAATmPxg+EwB3F1pNEpPTjjX1NVJFy+EB0NbxSgk04VyF
 IugWO24iSIrmJkpYdvOCvuzCfqM6iiIkHdpeeRTvFZDa3dqf1CiIKKT1c9FT8tq8f4y7
 eUsYD62qf+RhBl+ELOIK2W6h7fLnk6zOXrhCPiMddaXAztvrrhK+9nhlZwLXI3DOPvYq
 OsRqlmdKQJFLT7vNIUXHFkV6tYLkKYzCRccd2vNmqAiu/U+EMS5oRhnDQ0DpqOKgvCOi
 BgVEzHPfdWwU+biIPX1qVzFqd0srFVBdArGherdSJl0AB95Es77EJwvzTvKmGuw4vL1b
 t4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GDRa4RFDTWP8hbxoyrpsGnSp7hiJz6RTAPpCucQo+Ss=;
 b=HymvoEvsIf1+AJ8GduqZLBjTgfxJsZ4qH7fhXCNCRqSgl/hamSArLanyeaAtiWoyZU
 k+TqScZhxNj9dh4ZpqQ3iC8TKx876BZJY4djnQsVml6/JZWu6hioR24n90KJocr0TUCq
 X4OV36UA21vZrtsSC2aJCJ7m8H13oLl2cEGaDh/BK6i8KGqqAPmqERWXqsjCs+yy01eW
 bKRoHkk8Os+kxsfUBlMHcTXnNLbl16wKyVmQF08us8cFAQzBueaUr4poFvs0NCYnpjfF
 yuk1JlRfm9P8TQzQwgUZtUI2mNsASV+m4p5B2j1g5cLN0ZWEU8+hyFOKL/GIrDTwpG1r
 WY7w==
X-Gm-Message-State: AOAM532H60QtWcX4kQQz16lBsBU/eMtF7D97DatpUEktqNhUx17+T5ML
 BFkjOWmuGQkVSSC7dF9PnQ83yA7bTTzK5Se0OVs7Z/Ib
X-Google-Smtp-Source: ABdhPJwJbPSa9xbNBiA5RnvLR6pCaUvIFS7NpCDxidbFS+sok/TiB1CTjGS95VncSGeNOrNjVB4u2ea57MJFcW3sK9Y=
X-Received: by 2002:a67:b149:: with SMTP id z9mr1910559vsl.85.1590680407296;
 Thu, 28 May 2020 08:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200521235201.279642-1-niklas.soderlund@ragnatech.se>
In-Reply-To: <20200521235201.279642-1-niklas.soderlund@ragnatech.se>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 28 May 2020 16:36:59 +0100
Message-ID: <CACvgo50SNourym-gBG1s2UxiD4M96=rMfcd7_y=643BgveRhVg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/fourcc: Add bayer formats and modifiers
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
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
Cc: libcamera-devel@lists.libcamera.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmlrbGFzLAoKT24gRnJpLCAyMiBNYXkgMjAyMCBhdCAwNzo1NiwgTmlrbGFzIFPDtmRlcmx1
bmQKPG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPiB3cm90ZToKPgo+IEJheWVyIGZvcm1h
dHMgYXJlIHVzZWQgd2l0aCBjYW1lcmFzIGFuZCBjb250YWluIGdyZWVuLCByZWQgYW5kIGJsdWUK
PiBjb21wb25lbnRzLCB3aXRoIGFsdGVybmF0aW5nIGxpbmVzIG9mIHJlZCBhbmQgZ3JlZW4sIGFu
ZCBibHVlIGFuZCBncmVlbgo+IHBpeGVscyBpbiBkaWZmZXJlbnQgb3JkZXJzLiBGb3IgZWFjaCBi
bG9jayBvZiAyeDIgcGl4ZWxzIHRoZXJlIGlzIG9uZQo+IHBpeGVsIHdpdGggYSByZWQgZmlsdGVy
LCB0d28gd2l0aCBhIGdyZWVuIGZpbHRlciwgYW5kIG9uZSB3aXRoIGEgYmx1ZQo+IGZpbHRlci4g
VGhlIGZpbHRlcnMgY2FuIGJlIGFycmFuZ2VkIGluIGRpZmZlcmVudCBwYXR0ZXJucy4KPgo+IEFk
ZCBEUk0gZm91cmNjIGZvcm1hdHMgdG8gZGVzY3JpYmUgdGhlIG1vc3QgY29tbW9uIEJheWVyIGZv
cm1hdHMuIEFsc28KPiBhZGQgYSBtb2RpZmllcnMgdG8gZGVzY3JpYmUgdGhlIGN1c3RvbSBwYWNr
aW5nIGxheW91dHMgdXNlZCBieSB0aGUgSW50ZWwKPiBJUFUzIGFuZCBpbiB0aGUgTUlQSSAoTW9i
aWxlIEluZHVzdHJ5IFByb2Nlc3NvciBJbnRlcmZhY2UpIENTSS0yCj4gc3BlY2lmaWNhdGlvbi4K
Pgo+IFNpZ25lZC1vZmYtYnk6IE5pa2xhcyBTw7ZkZXJsdW5kIDxuaWtsYXMuc29kZXJsdW5kQHJh
Z25hdGVjaC5zZT4KPiAtLS0KPiAqIENoYW5nZXMgc2luY2UgdjEKPiAtIFJlbmFtZSB0aGUgZGVm
aW5lcyBmcm9tIERSTV9GT1JNQVRfU1JHR0I4IHRvIERSTV9GT1JNQVRfQkFZRVJfUkdHQjguCj4g
LSBVcGRhdGUgdGhlIGZvdXJjYyBjb2RlcyBwYXNzZWQgdG8gZm91cmNjX2NvZGUoKSB0byBhdm9p
ZCBhIGNvbmZsaWN0Lgo+IC0gQWRkIGRpYWdyYW1zIGZvciBhbGwgQmF5ZXIgZm9ybWF0cyBtZW1v
cnkgbGF5b3V0Lgo+IC0gVXBkYXRlIGRvY3VtZW50YXRpb24uCj4gLS0tCj4gIGluY2x1ZGUvdWFw
aS9kcm0vZHJtX2ZvdXJjYy5oIHwgMjA1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDIwNSBpbnNlcnRpb25zKCspCj4KV2hlcmUgaXMgdGhlIHVz
ZXIgZm9yIHRoZXNlIG5ldyBmb3JtYXRzIC0gYmUgdGhhdCBrZXJuZWwgb3IgdXNlcnNwYWNlPwpE
aWQgeW91IGZvcmdldCB0byB1cGRhdGUgdGhlIF9fZHJtX2Zvcm1hdF9pbmZvKCkgaW4KZHJpdmVy
cy9ncHUvZHJtL2RybV9mb3VyY2MuYz8KCi1FbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
