Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493AB30FE00
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 21:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622156EE69;
	Thu,  4 Feb 2021 20:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699916EE69;
 Thu,  4 Feb 2021 20:21:11 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id o18so3375300qtp.10;
 Thu, 04 Feb 2021 12:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Hhif/dUTQoXIIfPryG61RWRP0ankk75APYX7Blt1AJc=;
 b=haoSoMndXJyCLmaDCr53ziw/bvLuMoI9unlpsbh/BUpbXrj1nGZiWpW82ApiDt85YT
 zjc8KccPKk0vuNeP6Sne6tBJPjZ40DMTlhDjsjT196sbSfnRlhlJ6PGnZqxqlkeHuEuf
 VpChiqH+dHfH7AFmWAqD/RPGHmFAEHm8P3sxBh4w64p1yWRPfLwDJt2RmpKPNLZxjLry
 mOAYgjoCtTXc239wCqmALk9/TBwOmTcSDYQE2bqkwj8cRPkirOFrT+CUEkO3IDyz6dal
 fpbywg/NNJGdBVP13aklMdHtqD08rxAjhFHXHGIt3A/B96iEfVQN+UMZwvTTaNFGXcob
 13Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Hhif/dUTQoXIIfPryG61RWRP0ankk75APYX7Blt1AJc=;
 b=sr/bQrla6Q4UqyNmSAJ42PIDsZn6vzqvrl1vtVeHWN42oFWT9hSTU5y4xdIvDYW41j
 msTqlGlhmx5y26mB9Bs59DjW9iCBTl2LOijyquWj4x/DW7w9dim78sr5OqksMxpZfP9F
 As0a4pqWQ5FuO5NhMz/QEpm+QH2xy4GvamRLsdwWTOf8QLkx2dVxk5Fyp15CiLArQkGx
 K+Vl43hoEaYKl7cVICEBzxNgibLoOXO1a6rVZ/0a41TMYhSDlhjhcQkozYYCQrd3fb98
 o3mL88wONocLKULcRj+SyQpw0OX6/aI17KcjTzwBpqPBiC9QLsTQ9N3deCluBggUTVcC
 ollg==
X-Gm-Message-State: AOAM533MFISOOjycfnAvpKGL/2jD2lAFcKAidzi7BvP15LKGTiKqwuOo
 gMhzFyyBLGWOxr7KEB6/j2M=
X-Google-Smtp-Source: ABdhPJzBtWcnl6xe8wj4gW7Fj9w/IksQfuh2DmG51kZHLsHu9r/mNRRmRjkIIJig96HztTbqxgyqBg==
X-Received: by 2002:ac8:5c44:: with SMTP id j4mr1341125qtj.124.1612470070278; 
 Thu, 04 Feb 2021 12:21:10 -0800 (PST)
Received: from ?IPv6:2601:5c0:c200:27c6:cd86:137:1075:f377?
 ([2601:5c0:c200:27c6:cd86:137:1075:f377])
 by smtp.gmail.com with ESMTPSA id l38sm5434750qte.88.2021.02.04.12.21.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Feb 2021 12:21:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v6 02/10] Revert "drm/qxl: do not run release if qxl
 failed to init"
From: Tong Zhang <ztong0001@gmail.com>
In-Reply-To: <3feaeb62-fd50-5cca-26f7-42f6167ef77a@suse.de>
Date: Thu, 4 Feb 2021 15:21:08 -0500
Message-Id: <D78EE3A8-C7A8-4694-86E9-2E2278703A62@gmail.com>
References: <20210204145712.1531203-1-kraxel@redhat.com>
 <20210204145712.1531203-3-kraxel@redhat.com>
 <d217112e-e49d-bd1f-0c39-3eac2dd721fd@suse.de>
 <60B8023C-78C9-441D-AA21-A13C4445F666@gmail.com>
 <3feaeb62-fd50-5cca-26f7-42f6167ef77a@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IE9uIEZlYiA0LCAyMDIxLCBhdCAyOjA2IFBNLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4gCj4gSGkgVG9uZwo+IAo+PiBJIGhhdmUgcG9zdGVkIGFu
IHVwZGF0ZWQgcGF0Y2guCj4+IFRoZSBuZXcgcGF0Y2ggdXNlIHRoZSBmb2xsb3dpbmcgbG9naWMK
Pj4gKwlpZiAoIXFkZXYtPmRkZXYubW9kZV9jb25maWcuZnVuY3MpCj4+ICsJICByZXR1cm47Cj4g
Cj4gVGhpcyBpcyBhZ2FpbiBqdXN0IHBhcGVyaW5nIG92ZXIgdGhlIGlzc3VlLiBCZXR0ZXIgZG9u
J3QgY2FsbCBxeGxfZHJtX3JlbGVhc2UoKSBpbiB0aGUgZXJyb3IgcGF0aCBpZiBxeGxfZGV2aWNl
X2luaXQoKSBmYWlscy4KPiAKPiBJIHNlZSB0d28gc29sdXRpb25zOiBlaXRoZXIgcm9sbC1iYWNr
IG1hbnVhbGx5LCBvciB1c2Ugb3VyIG5ldyBtYW5hZ2VkIERSTSBpbnRlcmZhY2VzLiBUaGlzIGlz
IHdoYXQgdGhlIG90aGVyIGRyaXZlcnMgZG8uCj4gCj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCgoK
SU1ITyAtIHFkZXYtPmRkZXYubW9kZV9jb25maWcuZnVuY3MgaXMgc2V0IG9ubHkgaWYgdGhlIGlu
aXRpYWxpemF0aW9uIGlzIHN1Y2Nlc3NmdWwsCnNvIHVzaW5nIHRoaXMgYXMgYW4gaW5kaWNhdG9y
IG9mIGVycm9yIGNhc2UgbG9va3Mgb2sgdG8gbWUuCgpUaGUgb3RoZXIgdHdvIG9wdGlvbnMgeW91
IHN1Z2dlc3RlZCB3b3VsZCByZXF1aXJlIHNvbWUgc2VyaW91cyBzaWduaWZpY2FudCBhbW91bnQg
b2Ygd29yayB0byBiZSBkb25lLAp3aGljaCBJIGRvbuKAmXQgdGhpbmsgSSBjdXJyZW50bHkgaGF2
ZSBzdWNoIGFiaWxpdHkgdG8gZG8uCgpUaGFua3MsCi0gVG9uZwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
