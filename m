Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC2B27DBE
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 15:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D439089E11;
	Thu, 23 May 2019 13:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6837889E14
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 13:11:28 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id i2so5328336otr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 06:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2NQoQ/laq1oYfg4OPGpMMgUuGm2m5zflmCWAX0cf5lI=;
 b=N8jCrgUJksv9nrGcXAym9jmqPq75nsg8owqv8jUY56ufoshs/O3G8Pa6AflULycJrs
 aK1f79TzFy7gYtGJ4RyD8hsrx6f58SP4e9Fr1/j7+KvkAMsIa6DQn2w9ZaJ1U6XQAJZK
 th8sCc+5o8x2e6oraeVB+8FDBBJu21F7cmRpZTyKDFhZ2nAf6jkdQ2oGF8k6V95Y/gJR
 5ZwnxWORfg+I8uiAzBMdYnaHFZ5nqkWCkLDEx/1CrXg0W12u0qAYZphuypz+DUiP00ev
 njEs1dE6qsXcqsF0+/lOBbVTyi73Koh060HplLwPONC/yFPZL533gZz2shyUaelfq53d
 XgMw==
X-Gm-Message-State: APjAAAXZcCjvw0YourSaJlYvT5Dfy+tv3pVladIvI9JOSLBl/v36QHBa
 ODheYkPaPnb743MZ4kv4aE8EXlOz3BWrN1jtXU+51A==
X-Google-Smtp-Source: APXvYqxgNgKbbCitW3Ugw4bFFPH6+OTbWM7dO+fzhxCE451+DtNbDtUKJoByZC2Umozp0zdgCnY8j7F2+VioH+/8mMU=
X-Received: by 2002:a05:6830:16d2:: with SMTP id
 l18mr24911325otr.303.1558617087702; 
 Thu, 23 May 2019 06:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190521105151.51ffa942@canb.auug.org.au>
 <20190523115355.joyeqlmbjkufueyn@flea>
 <20190523230409.31da92b9@canb.auug.org.au>
In-Reply-To: <20190523230409.31da92b9@canb.auug.org.au>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 23 May 2019 15:11:15 +0200
Message-ID: <CAKMK7uHvUFtRNn5j6TnmBrs5ndkSuNwJWzB026j2zczaV9O_Tg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=2NQoQ/laq1oYfg4OPGpMMgUuGm2m5zflmCWAX0cf5lI=;
 b=BLXPB4DCl41HOQ1mf12XPci8Inwo2NGNn83mwHy63yYcRGpk3jGl+Gpy04h6PXXBSI
 F93f4WfGJQd0hNostZDzlKKtImjU9WJerCK9kY/88Ob2luPK+3+A6tlCt4DcdH1BMiTF
 QsNVB0p0EM1m2Srhnl46IU3Xzdax90S8M1Trg=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jyri Sarha <jsarha@ti.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, DRI <dri-devel@lists.freedesktop.org>,
 Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMzowNCBQTSBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2Fu
Yi5hdXVnLm9yZy5hdT4gd3JvdGU6Cj4KPiBIaSBNYXhpbWUsCj4KPiBPbiBUaHUsIDIzIE1heSAy
MDE5IDEzOjUzOjU1ICswMjAwIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5j
b20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgTWF5IDIxLCAyMDE5IGF0IDEwOjUxOjUxQU0gKzEw
MDAsIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6Cj4gPiA+Cj4gPiA+IFRvZGF5J3MgbGludXgtbmV4
dCBtZXJnZSBvZiB0aGUgZHJtLW1pc2MgdHJlZSBnb3QgYSBjb25mbGljdCBpbjoKPiA+ID4KPiA+
ID4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnR4
dAo+ID4gPgo+ID4gPiBiZXR3ZWVuIGNvbW1pdDoKPiA+ID4KPiA+ID4gICA4MTIyZGU1NDYwMmUg
KCJkdC1iaW5kaW5nczogQ29udmVydCB2ZW5kb3IgcHJlZml4ZXMgdG8ganNvbi1zY2hlbWEiKQo+
ID4gPgo+ID4gPiBmcm9tIExpbnVzJyB0cmVlIGFuZCBjb21taXRzOgo+ID4gPgo+ID4gPiAgIGI0
YTJjMDA1NWE0ZiAoImR0LWJpbmRpbmdzOiBBZGQgdmVuZG9yIHByZWZpeCBmb3IgVlhUIEx0ZCIp
Cj4gPiA+ICAgYjFiMGQzNmJkYjE1ICgiZHQtYmluZGluZ3M6IGRybS9wYW5lbDogc2ltcGxlOiBB
ZGQgYmluZGluZyBmb3IgVEZDIFM5NzAwUlRXVjQzVFItMDFCIikKPiA+ID4gICBmYmQ4YjY5YWI2
MTYgKCJkdC1iaW5kaW5nczogQWRkIHZlbmRvciBwcmVmaXggZm9yIEV2ZXJ2aXNpb24gRWxlY3Ry
b25pY3MiKQo+ID4gPgo+ID4gPiBmcm9tIHRoZSBkcm0tbWlzYyB0cmVlLgo+ID4KPiA+IEkganVz
dCB0b29rIHlvdXIgcGF0Y2ggYW5kIHB1c2hlZCBhIHRlbXAgYnJhbmNoIHRoZXJlOgo+ID4gaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXJpcGFyZC9saW51
eC5naXQvY29tbWl0Lz9oPWRybS1taXNjLW5leHQmaWQ9MzgzMmYyY2FkNTMwN2ViY2VkZWVhZDEz
ZmJkOGQzY2YwNmJhNWU5MAo+ID4KPiA+IFJvYiwgU3RlcGhlbiwgYXJlIHlvdSBvayB3aXRoIHRo
ZSBjaGFuZ2U/IElmIHNvLCBJJ2xsIHB1c2ggaXQuCj4KPiBBbGwgdGhhdCBuZWVkcyB0byBiZSBk
b25lIGlzIGZvciBteSBwYXRjaCAoc2xpZ2h0bHkgY29ycmVjdGVkKSBuZWVkcyB0bwo+IGJlIGFw
cGxpZWQgdG8gdGhlIGRybS1taXNjIHRyZWUuICBUaGF0IHRyZWUgYWxyZWFkeSBoYXMgdGhlIGJh
Y2sgbWVyZ2UKPiBvZiBMaW51cycgdHJlZSBhbmQgdGhlIHR4dCBmaWxlIGhhcyBiZWVuIHJlbW92
ZWQgKG15IHBhdGNoIHNob3VsZCBoYXZlCj4gYmVlbiBhcHBsaWVkIGFzIHBhcnQgb2YgdGhlIG1l
cmdlIHJlc29sdXRpb24gYnV0IGRvaW5nIGl0IGxhdGVyIGlzIGZpbmUpLgoKVGhhdCBjb21taXQg
aXMgb24gdG9wIG9mIGRybS1taXNjLCBhbmQgc29tZWhvdyB0aGUgLnR4dCB2ZXJzaW9uIGhhcwpi
ZWVuIHJlc3VycmVjdCBpbiBkcm0tbWlzYy1uZXh0IChzbyBuZWVkcyB0byBiZSByZS1kZWxldGVk
IHRvbykuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
