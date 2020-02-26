Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6070E16FEA5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 13:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928C16E8DF;
	Wed, 26 Feb 2020 12:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C826E8DF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 12:08:19 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l18so1816202lfc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 04:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=S9JJYIkNlP5nnK3wfZZu/X+SbI6aTTWOA87BK2SDDno=;
 b=fKlN8HgXtxN2pScLUyXqaU2uMf2lHDdWgGN0YorCQqJiyRnrHxxv++xhjpyp4nJ0n6
 MGjQACQUjmwX22flv3nS8PHVJYGT4oOArcrtzYKk4o3gwoemxxv5UCct/9Yp8q2hyM5t
 VlPGg1SYuNex0ZU5SRkMFrChNs7KMC931tZgSegsc9Q0wrS3huNnj5eunAPfXIZOpSQ+
 3HWc0aOpexHwRciEWsAX2yQYGC/FRJ4nituPrcObbFHn97RtclII9L4fKRfrkVneveuz
 nxoO0+0kCdR+q40YKfIbLSM5KyZLJW+voidkAsXwCyiv0betswmHnBsK5rBnK0JkzybZ
 lsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S9JJYIkNlP5nnK3wfZZu/X+SbI6aTTWOA87BK2SDDno=;
 b=fEwxHhkW6S/tuaXwhISDDU/1BK2H68YaHlaZzy6+KRe8ZcR3zyG11IMoLWVWRv/IoN
 idDKTG0UPeXN7aUrpSTloEoX1vpS6tZk2W/gH0qlGXyYgk/bpBlQgJbLXGsKOW2mZDsp
 ikxMF0FZ+uyl1uhKdxWbB+19dlfTPIcgrauRHsfnFf9mZi88xH4i8h9FJCpz28sFn9V2
 zywPjxCMG/eMPErjyzvzVKhA4365giygbeOicM7AbdGzdNlavo93bPuqRxewk0lNsq66
 NW9/mC0JZHA26xLfQCJc5iqjpLlXKyXJm6ra2UO7mpwmlOncsGDAQIw240z/OI1168wy
 P9cQ==
X-Gm-Message-State: APjAAAWxpmYV6vNIhYDn4JHn1iV2uA5OUt8oF5VfsSDa6FgDkLEjVeKr
 POoegyMc2ZOAi5BIAXV0mRTYvYwrXymunlXH0cvgxg==
X-Google-Smtp-Source: APXvYqw8gFoORTwT9oT2KeMHn3WNzmj9I20a9wQ+SMdkIuI3epVQlzv+ANEqiMJJC4viusDiSZCX4jG7GU6F5yyPgus=
X-Received: by 2002:a19:ed0b:: with SMTP id y11mr2359667lfy.77.1582718897894; 
 Wed, 26 Feb 2020 04:08:17 -0800 (PST)
MIME-Version: 1.0
References: <86d0ec$ae4ffc@fmsmga001.fm.intel.com>
In-Reply-To: <86d0ec$ae4ffc@fmsmga001.fm.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Feb 2020 13:08:06 +0100
Message-ID: <CACRpkdZ4H5fdWsxsXnsbyxb6fwKbgm0h5a6CdqEjU9w5+z0a7Q@mail.gmail.com>
Subject: Re:
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Josh Wu <josh.wu@atmel.com>,
 Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>,
 Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Paul Kocialkowski <contact@paulk.fr>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Gustaf_Lindstr=C3=B6m?= <gl@axentia.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Jonathan Marek <jonathan@marek.ca>,
 Stefan Mavrodiev <stefan@olimex.com>, Adam Ford <aford173@gmail.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Robert Chiras <robert.chiras@nxp.com>, Heiko Schocher <hs@denx.de>,
 Icenowy Zheng <icenowy@aosc.io>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Vincent Abriou <vincent.abriou@st.com>, Andreas Pretzsch <apr@cn-eng.de>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Alex Gonzalez <alex.gonzalez@digi.com>, Purism Kernel Team <kernel@puri.sm>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMTI6NTcgUE0gVmlsbGUgU3lyasOkbMOkCjx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBGZWIgMjUsIDIwMjAgYXQg
MTA6NTI6MjVQTSArMDEwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gPiBJIGhhdmUgbG9uZyBz
dXNwZWN0ZWQgdGhhdCBhIHdob2xlIGJ1bmNoIG9mIHRoZSAic2ltcGxlIiBkaXNwbGF5cwo+ID4g
YXJlIG5vdCBzaW1wbGUgYnV0IGNvbnRhaW5zIGEgZGlzcGxheSBjb250cm9sbGVyIGFuZCBtZW1v
cnkuCj4gPiBUaGF0IG1lYW5zIHRoYXQgdGhlIHNwZWVkIG92ZXIgdGhlIGxpbmsgdG8gdGhlIGRp
c3BsYXkgYW5kCj4gPiBhY3R1YWwgcmVmcmVzaCByYXRlIG9uIHRoZSBhY3R1YWwgZGlzcGxheSBp
cyBhc3ltbWV0cmljIGJlY2F1c2UKPiA+IHdlbGwgd2UgYXJlIGp1c3QgdXBkYXRpbmcgYSBSQU0s
IHRoZSByZXNvbHV0aW9uIGp1c3QgbGltaXRzIGhvdwo+ID4gbXVjaCBkYXRhIHdlIGFyZSBzZW5k
aW5nLCB0aGUgY2xvY2sgbGltaXRzIHRoZSBzcGVlZCBvbiB0aGUKPiA+IGJ1cyBvdmVyIHRvIHRo
ZSBSQU0gb24gdGhlIG90aGVyIHNpZGUuCj4KPiBJTU8gZXZlbiBpbiBjb21tYW5kIG1vZGUgbW9k
ZS0+Y2xvY2sgc2hvdWxkIHByb2JhYmx5IGJlIHRoZSBhY3R1YWwKPiBkb3RjbG9jayB1c2VkIGJ5
IHRoZSBkaXNwbGF5LiBJZiB0aGVyZSdzIGFub3RoZXIgY2xvY2sgZm9yIHRoZSBidXMKPiBzcGVl
ZC9ldGMuIGl0IHNob3VsZCBiZSBzdG9yZWQgc29tZXdoZXJlIGVsc2UuCgpHb29kIHBvaW50LiBG
b3IgdGhlIERTSSBwYW5lbHMgd2UgaGF2ZSB0aGUgZmllbGQgaHNfcmF0ZQpmb3IgdGhlIEhTIGNs
b2NrIGluIHN0cnVjdCBtaXBpX2RzaV9kZXZpY2Ugd2hpY2ggaXMgYmFzZWQKb24gZXhhY3RseSB0
aGlzIHJlYXNvbmluZy4gQW5kIHRoYXQgaXMgd2hhdCBJIGFjdHVhbGx5IHVzZSBmb3IKc2V0dGlu
ZyB0aGUgSFMgY2xvY2suCgpUaGUgcHJvYmxlbSBpcyBob3dldmVyIHRoYXQgd2UgaW4gbWFueSBj
YXNlcyBoYXZlIHNvCnN1YnN0YW5kYXJkIGRvY3VtZW50YXRpb24gb2YgdGhlc2UgcGFuZWxzIHRo
YXQgd2UgaGF2ZQphYnNvbHV0ZWx5IG5vIGlkZWEgYWJvdXQgdGhlIGRvdGNsb2NrLiBNYXliZSB3
ZSBzaG91bGQKanVzdCBzZXQgaXQgdG8gMCBpbiB0aGVzZSBjYXNlcz8KCllvdXJzLApMaW51cyBX
YWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
