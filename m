Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AC73466E4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C288E6EC70;
	Tue, 23 Mar 2021 17:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC88B6EC6F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 17:55:48 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 y19-20020a0568301d93b02901b9f88a238eso20309830oti.11
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7/Hh3MCE8kRrr9gdMisNBW9+iRzCBxyJ6tsm/xA1i1Q=;
 b=dvbUlJbddwEcIjYY6DkZqh7viPuhkvh+Cvmt26t1aasuZLjlZiMegFPQ711kN22O5C
 x0PUd9+Xvz8mW1XjQUh6E73iruZiHewc2ryo3+UvgxImRWuNmbh0lPGYsYAPWYfOI8QI
 kUaZLUlYsPwSR3jdQWIQkLHFqWcOGbtotSBCIxtyNqvv1AyRsb8bLrVMJ0U5S8YjaSUi
 8OhnLXNQVwTyNG+g3ZyKlLHxXyKLSDowu/5tnKwxmqPCwgo6Q4UybOrbazAAiO+1sGSM
 tViRfkjC2NYB00OQRh+1tIULDTbxZzwjmx/CmeW8rXv+/2sYuFMm2vJa2qnxD80U2M+F
 VRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7/Hh3MCE8kRrr9gdMisNBW9+iRzCBxyJ6tsm/xA1i1Q=;
 b=b4bBQrzJ2zh++jZjDd/UIwThlFxA6M41eLtMfphMtKct0DXg5x6ngf4JhdQL1Ps3lm
 /OUQrOGmG2jMqJZkVxYqHP3NWraSNRiPgSaC44Pd9YKNBzD4eqogBQnStiBf3UXiQ35/
 qiyHMc/6H+ZlLX4Z7JHVrGcFPg14SiDaiLz6DyGGpT6MYgxteeRZ3EH1blYavEx0xeF+
 nC5GRbuCXJgySdiKIxozRVFmao+uKAS35GLgUf6ijsXIqHZNGfr3U2Kvmy3AXdF06Ywz
 fNaI2An3vCb3qQT7YJUXBXq0LFSgz5aYXSEWrlgC//FZv8v/gAWGfz+bAPBm5deif/RG
 pd4A==
X-Gm-Message-State: AOAM533PMETOYrg7wmP0NKiRiKLy/GH56rx/4knz5iZ5N1Qv5Lvkpw44
 Us6Ur/sMhRB7IhTOp45YdMGPCwVG5F7bREEJuuF4xQ==
X-Google-Smtp-Source: ABdhPJy1VJfgRxR2IBFCbhFEBHQdJrJOZQfDDfipkAaAZ0rSc/CVeiFImY/ATAyG9r5UpR7sXhsevQaSZvh1X8GYyH0=
X-Received: by 2002:a9d:5e89:: with SMTP id f9mr5452069otl.241.1616522147945; 
 Tue, 23 Mar 2021 10:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210323084453.366863-1-daniel.vetter@ffwll.ch>
 <20210323084453.366863-2-daniel.vetter@ffwll.ch>
 <_qgkbhnFRPb-XwdmeoSsVd7rlelflxuh9B-f9G8GLZoFIeXj48RGtUoEjws4RV0kI1jZvvZSGbOIcHhLWmI_RKJzzawOO9OIyJjBkG9lQH8=@emersion.fr>
In-Reply-To: <_qgkbhnFRPb-XwdmeoSsVd7rlelflxuh9B-f9G8GLZoFIeXj48RGtUoEjws4RV0kI1jZvvZSGbOIcHhLWmI_RKJzzawOO9OIyJjBkG9lQH8=@emersion.fr>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 23 Mar 2021 12:55:37 -0500
Message-ID: <CAOFGe94kCGPW3YD31a9OjhKxpvyKGQS-HJVPg8OqVE1j1qpdJA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/doc: Add RFC section
To: Simon Ser <contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXIgMjMsIDIwMjEgYXQgMTI6MDEgUE0gU2ltb24gU2VyIDxjb250YWN0QGVtZXJz
aW9uLmZyPiB3cm90ZToKPgo+IFNpZGUgbm90ZTogSSBmZWVsIGxpa2Ugd2UgY291bGQgaGF2ZSBi
ZXR0ZXIgbGluZXMgb2YgY29tbXVuaWNhdGlvbgo+IGJldHdlZW4ga2VybmVsIGRldnMgYW5kIHVz
ZXItc3BhY2UgZGV2cy4gVGhlIG5ldyB1QVBJIHJlcXVpcmVtZW50cyBzZWVtCj4gdG8gYmUgYSBo
aWdoIGJhcnJpZXIgdG8gZW50cnkgZm9yIGtlcm5lbCBkZXZzLiBIb3dldmVyIHNvbWV0aW1lcwo+
IHVzZXItc3BhY2UgZGV2cyBtaWdodCBiZSBpbnRlcmVzdGVkIGluIGhlbHBpbmcgb3V0IHdpdGgg
dGhlIHVzZXItc3BhY2UKPiBwYXJ04oCmCj4KPiBNYXliZSBpdCB3b3VsZCBiZSBnb29kIHRvIEND
IGUuZy4gd2F5bGFuZC1kZXZlbCBmb3IgbmV3IFJGQ3MsIHNvIHRoYXQKPiB1c2VyLXNwYWNlIGRl
dnMgY2FuIGp1bXAgaW4gaWYgdGhleSdyZSBpbnRlcmVzdGVkLiBBbmQgYWxzbyBwcm92aWRlCj4g
ZmVlZGJhY2ssIHNpbmNlIG5ldyB1QVBJIGlzIGhhcmQgdG8gc3BvdCBpbiB0aGUgc2VhIG9mIG1l
c3NhZ2VzIGluCj4gZHJpLWRldmVsLgoKVGhhdCdzIGEgZ29vZCBzdWdnZXN0aW9uLiAgQ0Npbmcg
d2F5bGFuZC1kZXYgb3IgbWVzYS1kZXYsIGFzCmFwcHJvcHJpYXRlLCB3aXRoIHN1Y2ggZG9jcyBw
YXRjaGVzIHNvdW5kcyBsaWtlIGEgZ29vZCBpZGVhLiAgSSdtIG5vdApzdXJlIHdoZXJlIHdlIHdv
dWxkIHB1dCB0aGF0IGluIGhlcmUgYnV0IGl0IHdvdWxkIGJlIGdvb2QgdG8gY2FsbCBvdXQuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
