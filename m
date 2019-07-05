Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82F460269
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9BD6E441;
	Fri,  5 Jul 2019 08:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3A66E411
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 07:08:49 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id d17so8123976oth.5
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 00:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0IIqKWzRaNse3XXjc9VJC174hdKsP3di+1IIb5DajLs=;
 b=keBp2hj5zHxBaPvtuEi/0ociIxC6peb39kqeeUl7SA746te8g4hmp4k8jvU+d4kAtW
 9YMzB4wYETG3TamebZLeLS/33q8x2S2QfUwIq9rvqMgoNphpM7Qt7xWYyxOmSN0umlQN
 Kf5n/vHZjHlxPBbl8aLgxdMc077eFxZMhbHT4P1i3Kan3LWe0pBmERGhL4SqhXgW1TPg
 79g3Sj6G9qdRk1QNetxKThEL6zudLlxWXxiKoDkwL26msxLGPnCqw4eRqlstpd77tqfw
 O5U/YozXCi6Z3Of4meIiCnPuMXl3OuPZc/PfZJzyFpBDg9yY78hlb+K/tyow9mvzpuck
 rNsA==
X-Gm-Message-State: APjAAAUjrpwc32a9oq0KjgPQaCIJ4SgGA1q/nc8Z4Wl6mdC2bYLDbdgY
 aXeL20K61lY+QVrQOym3LfqW1IJzg57leEtTpaLKcQ==
X-Google-Smtp-Source: APXvYqzldGMEKIRPPEJ0vaUfI2lFQ29kQgI2QwiHDaDqpSbGSw2Xx3CIMBQjB6qsF1gXZ8S1OcSQCm9TeiE6wueHYB4=
X-Received: by 2002:a9d:4f02:: with SMTP id d2mr1738812otl.328.1562310528818; 
 Fri, 05 Jul 2019 00:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-2-cychiang@chromium.org>
In-Reply-To: <20190705042623.129541-2-cychiang@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 5 Jul 2019 15:08:37 +0800
Message-ID: <CA+Px+wXtmf9dQQP7ywPLp7Qbbvqau=WnO3qhZ8+qmbJD1gjx+A@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: hdmi-codec: Add an op to set callback function
 for plug event
To: Cheng-Yi Chiang <cychiang@chromium.org>
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0IIqKWzRaNse3XXjc9VJC174hdKsP3di+1IIb5DajLs=;
 b=gh/Toz6V7CixdKGLGkGy9rPXkrdYpbSEI9toJWHRYaf4kHmQ/0QfMBxGBHsJtDl9i9
 ZwjZg2XdbTSBvk5L41Rc7GwtWbT43JorS2dYawqFZq0UF8xiHjUn30KcpEdiKuzYv91k
 2BB6vbDpC26WiSr5OAiV+1AjkluoSR+vFoFQMvBNdGLTUnZXsqoqP7zX8GOOFaR7IoFU
 P+hfc0NAZuTMJOgudDmWkfHCqRRGjxoW92AgSBMRCJlCTYcgBMm4iLSXUKDrvBhMNGUj
 kOa6/YuH0gC2IBEeHA1yriXC0QfOWUIpElqf+l3HO/EvIv3/ubknXhnXBQU+SJadHsUV
 kP2g==
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
Cc: ALSA development <alsa-devel@alsa-project.org>, dianders@chromium.org,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgNSwgMjAxOSBhdCAxMjoyNiBQTSBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5n
QGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc291bmQvaGRtaS1j
b2RlYy5oIGIvaW5jbHVkZS9zb3VuZC9oZG1pLWNvZGVjLmgKPiBpbmRleCA3ZmVhNDk2ZjFmMzQu
LjI2YzAyYWJiOGViYSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NvdW5kL2hkbWktY29kZWMuaAo+
ICsrKyBiL2luY2x1ZGUvc291bmQvaGRtaS1jb2RlYy5oCj4gQEAgLTQ3LDYgKzQ3LDkgQEAgc3Ry
dWN0IGhkbWlfY29kZWNfcGFyYW1zIHsKPiAgICAgICAgIGludCBjaGFubmVsczsKPiAgfTsKPgo+
ICt0eXBlZGVmIHZvaWQgKCpoZG1pX2NvZGVjX3BsdWdnZWRfY2IpKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKmRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wg
cGx1Z2dlZCk7Cj4gKwpUaGUgY2FsbGJhY2sgcHJvdG90eXBlIGlzICJ3ZWlyZCIgYnkgc3RydWN0
IHBsYXRmb3JtX2RldmljZS4gIElzIGl0CnBvc3NpYmxlIHRvIGhhdmluZyBzbmRfc29jX2NvbXBv
bmVudCBpbnN0ZWFkIG9mIHBsYXRmb3JtX2RldmljZT8KCj4gIHN0cnVjdCBoZG1pX2NvZGVjX3Bk
YXRhOwo+ICBzdHJ1Y3QgaGRtaV9jb2RlY19vcHMgewo+ICAgICAgICAgLyoKPiBAQCAtODgsNiAr
OTEsMTMgQEAgc3RydWN0IGhkbWlfY29kZWNfb3BzIHsKPiAgICAgICAgICAqLwo+ICAgICAgICAg
aW50ICgqZ2V0X2RhaV9pZCkoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21tZW50LAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICplbmRwb2ludCk7Cj4g
Kwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIEhvb2sgY2FsbGJhY2sgZnVuY3Rpb24gdG8gaGFu
ZGxlIGNvbm5lY3RvciBwbHVnIGV2ZW50Lgo+ICsgICAgICAgICogT3B0aW9uYWwKPiArICAgICAg
ICAqLwo+ICsgICAgICAgaW50ICgqaG9va19wbHVnZ2VkX2NiKShzdHJ1Y3QgZGV2aWNlICpkZXYs
IHZvaWQgKmRhdGEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhkbWlfY29kZWNf
cGx1Z2dlZF9jYiBmbik7Cj4gIH07ClRoZSBmaXJzdCBwYXJhbWV0ZXIgZGV2IGNvdWxkIGJlIHJl
bW92ZWQuICBOb3QgdXNlZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
