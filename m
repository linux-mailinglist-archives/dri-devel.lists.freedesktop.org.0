Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F317EACA45
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2019 03:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E33189D63;
	Sun,  8 Sep 2019 01:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D0A89D49;
 Sun,  8 Sep 2019 01:58:58 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id g11so6190326vsr.8;
 Sat, 07 Sep 2019 18:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9wvcp3nV7La4YoI+ieadHx02sDBCIHvis3wKPKJAabs=;
 b=IKDAZoUJSksUTckWv2HFSdQx4O9ft0kR8GtF3+lrPOVaAOjcwI6+gJ9bY6ZzaeJ8TC
 HL4qxDlsSil4mCJVt9KTR4Mr8vlxI8REI7qutmmUxywTfbjGtU7XbHHL1D5x/9zRtT43
 UewO1lQVwi5IkifpFZ/+Fxc2FjVu5ilBx2lCXZQmD5hbjYOQkWCXB6ycOv4hCoeJFDsZ
 mg8UZjd0QERP+th7WvuxXiiZjHxp/niokOgy9yvpZEoKs5R1FtvXcA315kqmIDnB5jFq
 1CqnYhL3Op0IvG4zPQqKkOHYXgD/plPZsoxAnQQpNtLinSaLWBpc3DNuZqVAexUVS3oz
 up7Q==
X-Gm-Message-State: APjAAAWSLJ175T8e1hlnp9o5SnhAbKtiJACgqnWlT956D8Q7gtvh4DsO
 z185qfbKLHvnZWrQVte0yZUp0z6hi00gerr/Nro=
X-Google-Smtp-Source: APXvYqylZV390V/V1oizqnab5+4dm12EOj8yZUV8cYoKWUvOfP7UehtT5iz9+JYf89ReeVrKsPeKsLwhqt0H+c6F8EM=
X-Received: by 2002:a67:db12:: with SMTP id z18mr7697263vsj.18.1567907937861; 
 Sat, 07 Sep 2019 18:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190805140119.7337-1-kraxel@redhat.com>
 <20190805140119.7337-9-kraxel@redhat.com>
 <20190813151115.GA29955@ulmo>
 <20190814055827.6hrxj6daovxxnnvw@sirius.home.kraxel.org>
 <20190814093524.GA31345@ulmo>
 <20190814101411.lj3p6zjzbjvnnjf4@sirius.home.kraxel.org>
 <CACAvsv5Rar9F=Wf-9HBpndY4QaQZcGCx05j0esvV9pitM=JoGg@mail.gmail.com>
 <20190821115523.GA21839@ulmo>
In-Reply-To: <20190821115523.GA21839@ulmo>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sat, 7 Sep 2019 21:58:46 -0400
Message-ID: <CAKb7UvjXq0ptiPYu5EGH6sJAbbRjN3X4f_knrxyOHD1Zi7P1BA@mail.gmail.com>
Subject: Re: [Nouveau] [Intel-gfx] [PATCH v6 08/17] drm/ttm: use gem vma_node
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: Ben Skeggs <skeggsb@gmail.com>, ML nouveau <nouveau@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-graphics-maintainer@vmware.com,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 spice-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgNzo1NSBBTSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXVnIDIxLCAyMDE5IGF0IDA0OjMz
OjU4UE0gKzEwMDAsIEJlbiBTa2VnZ3Mgd3JvdGU6Cj4gPiBPbiBXZWQsIDE0IEF1ZyAyMDE5IGF0
IDIwOjE0LCBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+ICAgSGksCj4gPiA+Cj4gPiA+ID4gPiBDaGFuZ2luZyB0aGUgb3JkZXIgZG9lc24ndCBsb29r
IGhhcmQuICBQYXRjaCBhdHRhY2hlZCAodW50ZXN0ZWQsIGhhdmUgbm8KPiA+ID4gPiA+IHRlc3Qg
aGFyZHdhcmUpLiAgQnV0IG1heWJlIEkgbWlzc2VkIHNvbWUgZGV0YWlsIC4uLgo+ID4gPiA+Cj4g
PiA+ID4gSSBjYW1lIHVwIHdpdGggc29tZXRoaW5nIHZlcnkgc2ltaWxhciBieSBzcGxpdHRpbmcg
dXAgbm91dmVhdV9ib19uZXcoKQo+ID4gPiA+IGludG8gYWxsb2NhdGlvbiBhbmQgaW5pdGlhbGl6
YXRpb24gc3RlcHMsIHNvIHRoYXQgd2hlbiBuZWNlc3NhcnkgdGhlIEdFTQo+ID4gPiA+IG9iamVj
dCBjYW4gYmUgaW5pdGlhbGl6ZWQgaW4gYmV0d2Vlbi4gSSB0aGluayB0aGF0J3Mgc2xpZ2h0bHkg
bW9yZQo+ID4gPiA+IGZsZXhpYmxlIGFuZCBlYXNpZXIgdG8gdW5kZXJzdGFuZCB0aGFuIGEgYm9v
bGVhbiBmbGFnLgo+ID4gPgo+ID4gPiBZZXMsIHRoYXQgc2hvdWxkIHdvcmsgdG9vLgo+ID4gPgo+
ID4gPiBBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gPiBBY2tl
ZC1ieTogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+Cj4gVGhhbmtzIGd1eXMsIGFw
cGxpZWQgdG8gZHJtLW1pc2MtbmV4dC4KCkhpIFRoaWVycnksCgpJbml0aWFsIGludmVzdGlnYXRp
b25zIHN1Z2dlc3QgdGhhdCB0aGlzIGNvbW1pdCBjdXJyZW50bHkgaW4gZHJtLW5leHQKCmNvbW1p
dCAwMTljYmQ0YTRmZWIzYWEzYTkxN2Q3OGU3MTEwZTMwMTFiYmZmNmQ1CkF1dGhvcjogVGhpZXJy
eSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KRGF0ZTogICBXZWQgQXVnIDE0IDExOjAwOjQ4
IDIwMTkgKzAyMDAKCiAgICBkcm0vbm91dmVhdTogSW5pdGlhbGl6ZSBHRU0gb2JqZWN0IGJlZm9y
ZSBUVE0gb2JqZWN0CgpicmVha3Mgbm91dmVhdSB1c2Vyc3BhY2Ugd2hpY2ggdHJpZXMgdG8gYWxs
b2NhdGUgR0VNIG9iamVjdHMgd2l0aCBhCm5vbi1wYWdlLWFsaWduZWQgc2l6ZS4gUHJldmlvdXNs
eSBub3V2ZWF1X2dlbV9uZXcgd291bGQganVzdCBjYWxsCm5vdXZlYXVfYm9faW5pdCB3aGljaCB3
b3VsZCBjYWxsIG5vdXZlYXVfYm9fZml4dXBfYWxpZ24gYmVmb3JlCmluaXRpYWxpemluZyB0aGUg
R0VNIG9iamVjdC4gV2l0aCB0aGlzIGNoYW5nZSwgaXQgaXMgZG9uZSBhZnRlci4gV2hhdApkbyB5
b3UgdGhpbmsgLS0gT0sgdG8ganVzdCBtb3ZlIHRoYXQgYml0IG9mIGxvZ2ljIGludG8gdGhlIG5l
dwpub3V2ZWF1X2JvX2FsbG9jKCkgKGFuZCBtYWtlIHNpemUvYWxpZ24gYmUgcG9pbnRlcnMgc28g
dGhhdCB0aGV5IGNhbgpiZSBmaXhlZCB1cD8pCgpDaGVlcnMsCgogIC1pbGlhCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
