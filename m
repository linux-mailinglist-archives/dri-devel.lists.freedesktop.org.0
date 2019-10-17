Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C60CCDCE2F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168476EB9D;
	Fri, 18 Oct 2019 18:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DD36E43D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 09:27:58 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id h144so2120180iof.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 02:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wz0s1QqmOeptIc8QDhBt7HC6sJO7YJ7zLXDUi4doZPk=;
 b=AhRfyIWggJ8UfPWw4hSfK/Rk7Uk59Vu2TRLUDqPt0mnM6hdZKlkKBxur8sK7nCeJEt
 Lb8WucNQA13JVc8kMTQ9g0e3HVX6hWCBmxajw2Mkdaz5NLb2jHw39AqvGFBiwodeFHsz
 YQWxgsn9w9/Tc1OvD4hHrusmfsY/NtVyBMyGezTvGCk+T4J+eJa4FMRwT9/6ApH2yS0Z
 fDDYTLCZSvuu+ByX7ZV/3SxTG0DRxbVKl/6TUsVRp41RwtCs5793FvXAcsKJxT4CZMXc
 BXCS/Ns4vvezur+oKK2DNFPKooWzDyfTq13uJ5opJX8uvpgGL188wdLXkyASEMYEjUD7
 NZNw==
X-Gm-Message-State: APjAAAVN9nNyEUZkJiUDAGzReEPasxV3KrY7y3lmhKbAwpt8hGp6lJTf
 5jnUab0m8VTXbIx7N+uCbpeib21B2rCaTzWXVn+qia+T
X-Google-Smtp-Source: APXvYqyCypBNp/qrkKZeUbF89wkGSXv7oZv1mPOUdE3uOZg1Y7knp3N/y33iKlpj4tJ7/tcpUtcNwx/X4Nbjlw0guxM=
X-Received: by 2002:a6b:c8d2:: with SMTP id y201mr1821211iof.284.1571304477717; 
 Thu, 17 Oct 2019 02:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191016133916.21475-1-hverkuil-cisco@xs4all.nl>
 <20191016133916.21475-2-hverkuil-cisco@xs4all.nl>
 <20191016161417.GX25745@shell.armlinux.org.uk>
In-Reply-To: <20191016161417.GX25745@shell.armlinux.org.uk>
From: Dariusz Marcinkiewicz <darekm@google.com>
Date: Thu, 17 Oct 2019 11:27:46 +0200
Message-ID: <CALFZZQGewe4vSTcXUjYsep6oT9wZTyQRr8-kzVVbNVSoirwG3A@mail.gmail.com>
Subject: Re: [PATCHv8 1/2] drm: tda998x: use cec_notifier_conn_(un)register
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Wz0s1QqmOeptIc8QDhBt7HC6sJO7YJ7zLXDUi4doZPk=;
 b=Foqzw9J94qCGPQO9L5YG9Ug/B89psLZVCfzDwThDaWpXM1m6Z9KLaeRKoGYZgtGBdk
 2P4uJdqhp7qjDJwB0+jDKee9bK1zFkBLXmcONRP0/BI3xsTIBojJDM1wHUAT+WB2TqN0
 OlUiCXAqF03ZMpZWTxMR3PMDqHOORF8aDC1gj0AK2+jPU9+HrVhIDrhJCiSo5n+ogNpq
 6QZF8hXjkUy5MhMsHfg6cuqmhv5Hgdf8FDFVzbfjouY9tfRag7pJKwLcB8UZ0SWWIsU6
 oHcdAn4Sc6iYQetMI/pk3Kwxak0zlM8ms1iMFBUXvyaJudG8xpnQif+8lfxuPNGGrvUB
 E/GA==
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgNjoxNCBQTSBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXgg
YWRtaW4KPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBPbiBXZWQsIE9jdCAxNiwg
MjAxOSBhdCAwMzozOToxNVBNICswMjAwLCBIYW5zIFZlcmt1aWwgd3JvdGU6Cj4gPiBGcm9tOiBE
YXJpdXN6IE1hcmNpbmtpZXdpY3ogPGRhcmVrbUBnb29nbGUuY29tPgo+ID4KPiA+IFVzZSB0aGUg
bmV3IGNlY19ub3RpZmllcl9jb25uXyh1bilyZWdpc3RlcigpIGZ1bmN0aW9ucyB0bwo+ID4gKHVu
KXJlZ2lzdGVyIHRoZSBub3RpZmllciBmb3IgdGhlIEhETUkgY29ubmVjdG9yLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IERhcml1c3ogTWFyY2lua2lld2ljeiA8ZGFyZWttQGdvb2dsZS5jb20+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD4K
Pgo+IFBsZWFzZSBleHBsYWluIGluIGRldGFpbCB3aGF0IHRoaXMgbXV0ZXggYWN0dWFsbHkgYWNo
aWV2ZXMuCj4KLi4uLgo+IFNvLCBhbGwgaW4gYWxsLCBJIGRvbid0IHNlZSB3aGF0IHRoaXMgbG9j
ayBpcyBkb2luZywgYW5kIEkgdGhpbmsgaXQKPiBzaG91bGQgYmUgcmVtb3ZlZC4KPgo+IElmIGl0
J3MgbmVjZXNzYXJ5IGZvciBhIGZ1dHVyZSBjaGFuZ2UgKHdoaWNoIG1heSBvciBtYXkgbm90IGJl
IG1lcmdlZCkKPiB0aGVuIHRoZSBsb2NrIHNob3VsZCBiZSBwYXJ0IG9mIHRoYXQgZnV0dXJlIGNo
YW5nZSwgYmVjYXVzZSB0aGUgY2hhbmdlCj4gcHJvcG9zZWQgYnkgdGhpcyBwYXRjaCBjZXJ0YWlu
bHkgZG9lcyBub3QgbmVlZCBpdC4KPgoKWWVzLCB3aXRoIHRoZSBjaGFuZ2UgYmVpbmcgc3BsaXQg
aW50byAyIHBhdGNoZXMgbGlrZSB0aGF0LCB0aGUgbXV0ZXgKaXMgbm90IG5lZWRlZCBoZXJlLgoK
VGhhbmsgeW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
