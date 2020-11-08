Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2462AA8DA
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 02:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1B06E0D0;
	Sun,  8 Nov 2020 01:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4136E0D0
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 01:53:48 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C90CD20704
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 01:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604800428;
 bh=Gig2SIDrt7cb+ATUHWOVvdgio0+3OMp/2fZUD1joO84=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cdVBU0e2I4Ed0XKksB5eDB0tzB3II0mmnjw10uFt7lv1lc3pFe46KCHonZnxvvaDc
 /i0eXcxbTCUrvG5hxSbXsdQeqVozcJagfUSIRqLXak+ZsDqXvTZP+Y47LHFx1SAW4Y
 ptL7fc3qvGxSIhIgk7IXsq9Gnf67/O9RP4vEXkKM=
Received: by mail-ej1-f47.google.com with SMTP id o23so7289309ejn.11
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Nov 2020 17:53:47 -0800 (PST)
X-Gm-Message-State: AOAM532GKWLG7kHuQgiZ4aJtcOXHKTkZB8hdwHzq1LQuUEYExSS8yfcM
 sf6dY8Z1+HSzZ7kX3SWLDkTQsm62O2nhGrFnlg==
X-Google-Smtp-Source: ABdhPJw+JMkdcxFi2E62CLyHrr1EHcjqGBZXOrhKRS2LNp5+RUTgSOC9eBSIEnz/5eF5WsZ+Jh1CBEJHez0gc15GkMQ=
X-Received: by 2002:a17:906:cc4f:: with SMTP id
 mm15mr8912480ejb.267.1604800426455; 
 Sat, 07 Nov 2020 17:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-2-fparent@baylibre.com>
 <20201030154944.GA3905431@bogus>
In-Reply-To: <20201030154944.GA3905431@bogus>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 8 Nov 2020 09:53:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY__vuGYRi+_8Aokko9JmPN1-nvrsWSdBW3Tij6raKe-cHg@mail.gmail.com>
Message-ID: <CAAOTY__vuGYRi+_8Aokko9JmPN1-nvrsWSdBW3Tij6raKe-cHg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: mediatek: disp: add
 documentation for MT8167 SoC
To: Rob Herring <robh@kernel.org>
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
Cc: DTML <devicetree@vger.kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZhYmllbjoKClJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTDm
nIgzMOaXpSDpgLHkupQg5LiL5Y2IMTE6NDnlr6vpgZPvvJoKPgo+IE9uIEZyaSwgMjMgT2N0IDIw
MjAgMTU6MzE6MjYgKzAyMDAsIEZhYmllbiBQYXJlbnQgd3JvdGU6Cj4gPiBBZGQgYmluZGluZyBk
b2N1bWVudGF0aW9uIGZvciB0aGUgTVQ4MTY3IFNvQwoKRm9yIHRoaXMgcGF0Y2gsIGFwcGxpZWQg
dG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cv
P2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPgo+ID4gUmV2aWV3
ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+ID4gLS0tCj4g
Pgo+ID4gQ2hhbmdlbG9nOgo+ID4KPiA+IFYyOiBObyBjaGFuZ2UKPiA+Cj4gPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCAgICB8IDQg
KystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gPgo+Cj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
