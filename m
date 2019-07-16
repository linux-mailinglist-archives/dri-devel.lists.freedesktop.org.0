Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A07026B72A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA13B6E258;
	Wed, 17 Jul 2019 07:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50ADC89B45
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 14:14:48 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id n5so21243131otk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 07:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7p9kaWKWZ1RnK2eKn4KEJD3Gj9Xqk7kKd80amljZoBA=;
 b=Py1U5eymwyh83TmNLyIy8lDWs8YXJjIQBrtZdzwGa3m5ntBbn760hWzBUTPEcAsDnb
 veSsgD6KtWkLOTJx38lnxtOEFP+4U+72kMVt+kJqiI2/xTvG+HvJ7ilgECE6rFQ/zZbT
 k8/ctLXWOgxIlgbqaCyCP58uVzas35+Q6Eg+BqQnXM8PSKZBbXF0ssL34EreJg5oSHOu
 G4gXprqmTlN3kymsPQ8MC7YW1kVg2jnc9wXowDsg1VDJC1YLpZCyaQuQpy6rNMMh7hAa
 twbp42gxEzBJ7MmtSwmBlCQWQC1J9RqfSpw2DRlxInulBVzF/djgL0XViyjsbXqPa4wg
 1m/A==
X-Gm-Message-State: APjAAAWHIgTqsboysHdL9KoFgD5zM9Eh+9LmViN9CtctlK3n1DG2bIem
 5HRv9m8ZZqHPGJdINcdLoWWzHGGPNzFqsEewHpdsKQ==
X-Google-Smtp-Source: APXvYqxrx8/ntAt3Zd7iJAcVEIJOpeAV8oT/asIVbOOvcJcHbUCdJVyQnJvUXuhuaUoA8KWwL8LQ+jY6q3iS71MyDVI=
X-Received: by 2002:a9d:6195:: with SMTP id g21mr26395560otk.103.1563286487230; 
 Tue, 16 Jul 2019 07:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190716115725.66558-1-cychiang@chromium.org>
 <20190716115725.66558-5-cychiang@chromium.org>
In-Reply-To: <20190716115725.66558-5-cychiang@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 16 Jul 2019 22:14:36 +0800
Message-ID: <CA+Px+wV6RSfv4GL8+EJzXGq2nqzKtH9p23VTo2s30h0To2rQtg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] ASoC: rockchip_max98090: Add dai_link for HDMI
To: Cheng-Yi Chiang <cychiang@chromium.org>
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7p9kaWKWZ1RnK2eKn4KEJD3Gj9Xqk7kKd80amljZoBA=;
 b=WY+b2MmneuNwICa5DrCLXAuS2Ym/kIa/8fMTCjzzSDHJaRASHD8bq7nmIJgrdweSsS
 lW3jjoD5QcJJIyyvCHoMNUlIZNjTS3gwCcZw+OiFN7hXiOSyH9ADvlW2kxHCOuH2cxIu
 tCPLZkrJeyPGTbnAW+q4j5QO0RReazYEWdOD+nCh71seMSMeaod6xltVYqgLck89i1vJ
 ZZ1RfI48FJt7Kn9XZo+yb2BCK+6bo4ZICo6ZZy7vGtmqivPeeukvE1Lo2owGb9dXyase
 pCjnZbOzTFcDjgWgJHPrhRewV2AbCD6W2rQ9OCijtmE14GAPIzcgj+hn06DV9EbJe+MC
 MqwQ==
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Douglas Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgNzo1OCBQTSBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5n
QGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3JvY2tjaGlw
L0tjb25maWcgYi9zb3VuZC9zb2Mvcm9ja2NoaXAvS2NvbmZpZwo+IGluZGV4IGI0MzY1N2U2ZTY1
NS4uZDYxMGI1NTNlYTNiIDEwMDY0NAo+IC0tLSBhL3NvdW5kL3NvYy9yb2NrY2hpcC9LY29uZmln
Cj4gKysrIGIvc291bmQvc29jL3JvY2tjaGlwL0tjb25maWcKPiBAQCAtNDAsOSArNDAsMTAgQEAg
Y29uZmlnIFNORF9TT0NfUk9DS0NISVBfTUFYOTgwOTAKPiAgICAgICAgIHNlbGVjdCBTTkRfU09D
X1JPQ0tDSElQX0kyUwo+ICAgICAgICAgc2VsZWN0IFNORF9TT0NfTUFYOTgwOTAKPiAgICAgICAg
IHNlbGVjdCBTTkRfU09DX1RTM0EyMjdFCj4gKyAgICAgICBzZWxlY3QgU05EX1NPQ19IRE1JX0NP
REVDCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIFNheSBZIG9yIE0gaGVyZSBpZiB5b3Ugd2Fu
dCB0byBhZGQgc3VwcG9ydCBmb3IgU29DIGF1ZGlvIG9uIFJvY2tjaGlwCj4gLSAgICAgICAgIGJv
YXJkcyB1c2luZyB0aGUgTUFYOTgwOTAgY29kZWMsIHN1Y2ggYXMgVmV5cm9uLgo+ICsgICAgICAg
ICBib2FyZHMgdXNpbmcgdGhlIE1BWDk4MDkwIGNvZGVjIGFuZCBIRE1JIGNvZGVjLCBzdWNoIGFz
IFZleXJvbi4KWW91IHNob3VsZCBub3QgbmVlZCB0byBzZWxlY3QgdGhlIG9wdGlvbiBpbiB0aGlz
IHBhdGNoIChidXQgaW4gbmV4dApwYXRjaCksIGJlY2F1c2UgdGhpcyBwYXRjaCBkb2VzIG5vdCBk
ZXBlbmQgb24gYW55dGhpbmcgZnJvbQpoZG1pLWNvZGVjLmMuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
