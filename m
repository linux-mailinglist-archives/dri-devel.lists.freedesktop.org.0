Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A5923C53E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 07:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C9C6E4D4;
	Wed,  5 Aug 2020 05:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A3D6E4D4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 05:49:50 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id m200so19039347ybf.10
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 22:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aNr2TXpf8fJib6mFlFxfIcQjdb0SkQiiaU1UQ36pZoM=;
 b=MiN8W4wfk6o4Be1DUiaTKfQYltCpwxGKjZYbPAW7Zv1iyZKYfqanC7iFWnexqLTuD4
 LLw3H1XPQqEtIht6L7BhJHqzKkSU1tiN6jIXsPlMnFQzDsYvS7R5Zwis0WVSFcVm+fIJ
 jaqzQ4Q/7rx5sO/6Flo19sd5Bjn4oTPTeMX+R78YzSWmPV/UFwqHENQ5WDSnYwR9Nuge
 Z/6MerqPF7sz5Ic1x6JiPlawJIta4ADaAwnuzk8EFXyi1pAyHyMaarV2r9Bq86h232dB
 exfxmTrGbOrtLg9xJJn2mJPbPGeuACtFXi4Rgogo+t5n3BxsOVKH2L12ti/tvuJY3jxv
 vatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aNr2TXpf8fJib6mFlFxfIcQjdb0SkQiiaU1UQ36pZoM=;
 b=RmYm+92FDZpwa7KCbvgiJ5FHWbKbt+5X1884K0U+7kN9uE29GH/elE+awHARbebLx0
 JGc2kPmdmIE5dxkiTcSj3D4uAtfsiguedgOvl8J89I6MhXp6n4YaygXZKWUblT0Dvr7z
 1/p7sicP7iAwgqmDqKMQtHbBsMzDS+Teis6OPIg13cyj9Hfzb6GnrOhdf6RoGv06/lit
 iCCl4BhMnnc5pB/8T/D6XHQiMIptWxsNUD0xg3agrloVn7lZs0/noJFbJsQ822KIIkAC
 920UNRiUeljaYLqhWOUAWGmZ35qTXooJz2hgQZFOLnfcv7HeGj4T6C7P72Svf2EzhI+/
 Qszg==
X-Gm-Message-State: AOAM5339AEdsOQaS6wwrDojqedR7UACsIL94LobzBeEQFmiYu4iaZzvK
 voEvW5WS6xGIVw7uY7+UTUYQm6s23a8HZ6/bCdg=
X-Google-Smtp-Source: ABdhPJxxgYi+MfpU+CfWavT9oMVvFiu+Je/ejh+p4GKrqlIAKeLqmiSDEbym9oHvvWd1L1f8055HYLZuZpfeC7NhrcY=
X-Received: by 2002:a25:8447:: with SMTP id r7mr2137392ybm.147.1596606590098; 
 Tue, 04 Aug 2020 22:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-45-airlied@gmail.com>
 <ebca7bee-f1e7-caaf-f4ad-e9953af43e71@amd.com>
In-Reply-To: <ebca7bee-f1e7-caaf-f4ad-e9953af43e71@amd.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 5 Aug 2020 15:49:39 +1000
Message-ID: <CACAvsv7xPvGRM=n8YOMzf2e1G8-rafU4eeK_ec4RB9r36WUjMA@mail.gmail.com>
Subject: Re: [PATCH 44/59] drm/ttm: allow drivers to provide their own manager
 subclasses
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
Cc: sroland@vmware.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-graphics-maintainer@vmware.com, Ben Skeggs <bskeggs@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA0IEF1ZyAyMDIwIGF0IDIxOjMwLCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMDQuMDguMjAgdW0gMDQ6NTYgc2NocmllYiBE
YXZlIEFpcmxpZToKPiA+IEZyb206IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4g
Pgo+ID4gVGhpcyB3aWxsIGdldCByZW1vdmVkIGV2ZW50dWFsbHkgYW5kIGFsbCBkcml2ZXJzIHdp
bGwgdXNlIHRoaXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRA
cmVkaGF0LmNvbT4KPgo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5j
b20+Cgo+Cj4gPiAtLS0KPiA+ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCB8IDEx
ICsrKysrKysrKystCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJp
dmVyLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4gPiBpbmRleCAwM2IyNTNk
MTRlNmEuLjY5NDBkODVhNTMxYSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1f
Ym9fZHJpdmVyLmgKPiA+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiA+
IEBAIC00MTksNyArNDE5LDcgQEAgc3RydWN0IHR0bV9ib19kZXZpY2Ugewo+ID4gICAgICAgICog
YWNjZXNzIHZpYSB0dG1fbWFuYWdlcl90eXBlLgo+ID4gICAgICAgICovCj4gPiAgICAgICBzdHJ1
Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgbWFuX3ByaXZbVFRNX05VTV9NRU1fVFlQRVNdOwo+ID4g
LQo+ID4gKyAgICAgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW5fZHJ2W1RUTV9OVU1f
TUVNX1RZUEVTXTsKPiA+ICAgICAgIC8qCj4gPiAgICAgICAgKiBQcm90ZWN0ZWQgYnkgaW50ZXJu
YWwgbG9ja3MuCj4gPiAgICAgICAgKi8KPiA+IEBAIC00NTAsOSArNDUwLDE4IEBAIHN0cnVjdCB0
dG1fYm9fZGV2aWNlIHsKPiA+ICAgc3RhdGljIGlubGluZSBzdHJ1Y3QgdHRtX21lbV90eXBlX21h
bmFnZXIgKnR0bV9tYW5hZ2VyX3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aW50IG1lbV90eXBlKQo+ID4gICB7Cj4gPiArICAgICBpZiAoYmRldi0+bWFuX2RydlttZW1fdHlw
ZV0pCj4gPiArICAgICAgICAgICAgIHJldHVybiBiZGV2LT5tYW5fZHJ2W21lbV90eXBlXTsKPiA+
ICAgICAgIHJldHVybiAmYmRldi0+bWFuX3ByaXZbbWVtX3R5cGVdOwo+ID4gICB9Cj4gPgo+ID4g
K3N0YXRpYyBpbmxpbmUgdm9pZCB0dG1fc2V0X2RyaXZlcl9tYW5hZ2VyKHN0cnVjdCB0dG1fYm9f
ZGV2aWNlICpiZGV2LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGludCB0eXBlLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuYWdlcikKPiA+ICt7Cj4gPiArICAgICBiZGV2
LT5tYW5fZHJ2W3R5cGVdID0gbWFuYWdlcjsKPiA+ICt9Cj4gPiArCj4gPiAgIC8qKgo+ID4gICAg
KiBzdHJ1Y3QgdHRtX2xydV9idWxrX21vdmVfcG9zCj4gPiAgICAqCj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
