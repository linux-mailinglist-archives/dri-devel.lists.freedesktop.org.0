Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DCCFBD72
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 02:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D766E106;
	Thu, 14 Nov 2019 01:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2AE6E106
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 01:29:14 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j14so3579824lfk.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 17:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2seD0Q+VqgMi4kWeSwfa3NGLwPZU4LMlwO/OEaUBaWU=;
 b=TzR15JcRZgDyayQIJs6uvcWqZz0TP09/T0CI/4PQjkjjc4CP7j5feL6Ovolhq40Wxy
 toJa0mtfe6PXv8A4ScD8Xz4v9RxzHlFXXUnQvdK1sTmrZPvU984kGArhUuCQHJn4HIWX
 5/UKOeCW18AzFIVuA0B5+5muV8ZNMyh2bxeh6y/jWV06/n3Tbnby+NQqXTAWThWjiqMD
 ViUafiL9w2fVfyi1m/ttg+79OgGvX4OXpaJDXEn0bI68GS8SCljgOfDU4CnLOXakb0zX
 P/S07F09bAxYdi1H6gzDSbb9qDX673STdQEnSEAfGFUzO/QAAT4uxAGyxxLS/XFCSg41
 elww==
X-Gm-Message-State: APjAAAWyGilqWkjbuOhwvK2M73I7/Idv4e+M8axWg2nx0rbjJ6wQAQKY
 UtDygHJbSWiJETJNMq7EgRyhfecoVr8=
X-Google-Smtp-Source: APXvYqyckFNxeFXJd7Lkcyz7uzBuqg2ukkvB1zkrIqFNSyGjjUJuwMkji/0VxQ2qTdOi0U3wewZyeA==
X-Received: by 2002:ac2:5210:: with SMTP id a16mr4801588lfl.156.1573694952719; 
 Wed, 13 Nov 2019 17:29:12 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id w11sm1626414lfe.56.2019.11.13.17.29.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2019 17:29:12 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id j14so3579803lfk.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 17:29:12 -0800 (PST)
X-Received: by 2002:a19:8a02:: with SMTP id m2mr40168lfd.24.1573694951837;
 Wed, 13 Nov 2019 17:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20191023062539.11728-1-kraxel@redhat.com>
In-Reply-To: <20191023062539.11728-1-kraxel@redhat.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 13 Nov 2019 17:29:00 -0800
X-Gmail-Original-Message-ID: <CAAfnVBkuuZH0qq2P5Us2=pQd1wf+Xvm43P=_9De24z-2tkYW0g@mail.gmail.com>
Message-ID: <CAAfnVBkuuZH0qq2P5Us2=pQd1wf+Xvm43P=_9De24z-2tkYW0g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/virtio: various cleanups
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=2seD0Q+VqgMi4kWeSwfa3NGLwPZU4LMlwO/OEaUBaWU=;
 b=cy4qFqc3/PHQzCoWacPLQAU/V0mKPq60AZuq9ZFSe0GDxD7kstmh0uzD9VsbyxBEhK
 1Zj/E/2uu76sgoF2KKp7AFn3WmeVHgjU5y7kwTxc423uLTo1rGp6YfLj3KPIyzO7x7/q
 mBVFkY7Q1yFZHXE1B5mbjyoQDB09mryXKw4n0=
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTE6MjUgUE0gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gTGl0dGxlIHBhdGNoIHNlcmllcyBkb2luZyBzb21lIGNsZWFu
dXBzIGluIHRoZSB2aXJ0aW8gZHJpdmVyLgo+IFBhdGNoZXMgIzEgKyAjMiBoYXZlIGJlZW4gb24g
dGhlIGxpc3QgYmVmb3JlIGFzIHNpbmdsZSBwYXRjaGVzLAo+IGluY2x1ZGVzIGhlcmUgYWdhaW4g
Zm9yIHBhdGNoIGRlcGVuZGVuY3kgcmVhc29ucy4KPgo+IHYyOgo+ICAtIGZpeCBzcGFyc2UgZXJy
b3JzLgo+ICAtIGRyb3AgbWVyZ2VkIHBhdGNoZXMgKCMxICsgIzIpLgo+Cj4gcGxlYXNlIHJldmll
dywKClNlcmllcyBpczoKClJldmlld2VkLWJ5OiBHdXJjaGV0YW4gU2luZ2ggPGd1cmNoZXRhbnNp
bmdoQGNocm9taXVtLm9yZz4KCj4gICBHZXJkCj4KPiBHZXJkIEhvZmZtYW5uICgzKToKPiAgIGRy
bS92aXJ0aW86IGZpeCBieXRlb3JkZXIgaGFuZGxpbmcgaW4KPiAgICAgdmlydGlvX2dwdV9jbWRf
dHJhbnNmZXJfe2Zyb20sdG99X2hvc3RfM2QgZnVuY3Rpb25zCj4gICBkcm0vdmlydGlvOiBTaW1w
bGlmeSB2aXJ0aW9fZ3B1X3ByaW1hcnlfcGxhbmVfdXBkYXRlIHdvcmtmbG93Lgo+ICAgZHJtL3Zp
cnRpbzogZmFjdG9yIG91dCB2aXJ0aW9fZ3B1X3VwZGF0ZV9kdW1iX2JvCj4KPiAgZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oICAgfCAgNSArLQo+ICBkcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfaW9jdGwuYyB8IDIyICsrLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9wbGFuZS5jIHwgNzAgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMgICAgfCAxOSArKysrKy0tCj4gIDQg
ZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25zKC0pCj4KPiAtLQo+
IDIuMTguMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
