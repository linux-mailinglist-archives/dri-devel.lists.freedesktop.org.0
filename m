Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC020564B1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94A76E2A3;
	Wed, 26 Jun 2019 08:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1286E2A3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 08:35:45 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a14so2020967edv.12
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 01:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=JqRY3G6bsNlFjD5Nz71/DLy/L1FwnYgjl3T+44Bf528=;
 b=qxmlLujJ/27yepZWXcVFeTLvgfzk/wg65tckXCIcMQMd4Suhlsn4VhQfXJdaGFRbNw
 AgRxklTHxARk5MNrpzrsEiSC86E0dqJAZy1rtD5EN5+HTxsI8UrNf7hs5h/8n+FqLSK/
 lVspGxw4V22VZyscgAKED+F8zo6Z6eM0JuZL/9dozKaojKXeYGZAhuXMvJ0SxhDhx/22
 ptPB2f4RcKYpgIXTfxRIOx6k4t95zFKbQj2AleKVPC9N2dqxzIHqEFCuRtokhLyWkDu/
 PsWN+JFFX/nxpAqwl40/kxc/+CDCaA+OisvLtHDvUVYANqwWvTx/9QFCKz3ygzLvXJnB
 5scA==
X-Gm-Message-State: APjAAAUDxwUfutHMHoUpE871Tzv2pWYuHRa7lOnAl4SdzvfUhH4ZQL5P
 9Sj8iV8kzd+Dr7i4cASwfG0zi+T9Ykk=
X-Google-Smtp-Source: APXvYqzDjN7hHzC1x37EU289kuOeL8M2SyVHP1HPaiKKVsQvJ5g9IZaLMT/8kFtpSNXI4zX0tT8XGA==
X-Received: by 2002:a17:906:9144:: with SMTP id
 y4mr2963695ejw.16.1561538144223; 
 Wed, 26 Jun 2019 01:35:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id d23sm2118641ejj.50.2019.06.26.01.35.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 01:35:43 -0700 (PDT)
Date: Wed, 26 Jun 2019 10:35:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] vga_switcheroo: Depend upon fbcon being built-in, if
 enabled
Message-ID: <20190626083541.GJ12905@phenom.ffwll.local>
References: <20190624092153.23375-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624092153.23375-1-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JqRY3G6bsNlFjD5Nz71/DLy/L1FwnYgjl3T+44Bf528=;
 b=BzNRyMrpn68XLRzN46dz9engyxCRiW0M0laNt9vBGAExvBjVQa8I7yqlmkg34L/C/M
 whbLYiBT/ZTCw94H2DNgrggOUXHPOoRPQLBaeBoduxT0wZ6vjb9vgvH0+aW68616qvBT
 +IuH54+ALzn9il2kQgfrQES/KtxVRryBV/kKE=
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
Cc: Sean Paul <sean@poorly.run>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Hans de Goede <hdegoede@redhat.com>, kbuild test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-fbdev@vger.kernel.org, Yisheng Xie <ysxie@foxmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTE6MjE6NTNBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBGaXhlcyBsaW5raW5nIGZhaWwgd2hlbiBmYmNvbi9mYmRldiBpcyBtb2R1bGFyIGFu
ZCB2Z2Fzd2l0Y2hlcm9vIGlzCj4gZW5hYmxlZDoKPiAKPiB4ODZfNjQtbGludXgtZ251LWxkOiBk
cml2ZXJzL2dwdS92Z2EvdmdhX3N3aXRjaGVyb28ubzogaW4gZnVuY3Rpb24gYHZnYV9zd2l0Y2h0
b19zdGFnZTInOgo+IHZnYV9zd2l0Y2hlcm9vLmM6KC50ZXh0KzB4OTk3KTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgZmJjb25fcmVtYXBfYWxsJwo+IAo+IHYyOiBJIGZpcnN0IHRyaWVkIHRvIGZp
eCB0aGlzIHdpdGggYW4gRVhQT1JUX1NZTUJPTCwgYnV0IHZnYV9zd2l0Y2hlcm9vIGlzCj4gbmV2
ZXIgYSBtb2R1bGUsIHNvIHRoaXMgZG9lc24ndCB3b3JrLgo+IAo+IFJlcG9ydGVkLWJ5OiBTdGVw
aGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4KPiBSZXBvcnRlZC1ieToga2J1aWxk
IHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gRml4ZXM6IDFjZDUxYjVkMjAwZCAoInZnYXN3
aXRjaGVyb286IGNhbGwgZmJjb25fcmVtYXBfYWxsIGRpcmVjdGx5IikKPiBDYzogU3RlcGhlbiBS
b3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+Cj4gQ2M6IEx1a2FzIFd1bm5lciA8bHVrYXNA
d3VubmVyLmRlPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
PiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiBDYzog
U2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gQ2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdp
Y3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPiBDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29l
ZGVAcmVkaGF0LmNvbT4KPiBDYzogWWlzaGVuZyBYaWUgPHlzeGllQGZveG1haWwuY29tPgo+IENj
OiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogRGFuaWVsIFRob21wc29uIDxkYW5p
ZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiBDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1m
YmRldkB2Z2VyLmtlcm5lbC5vcmcKClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAaW50ZWwuY29tPgoKPiAtLQo+IHdydCBtZXJnaW5nIHByb2JhYmx5IGJlc3QgaWYg
TWFhcnRlbiBhZGRzIHRoaXMgdG8gdGhlIHRvcGljIGJyYW5jaCB3ZQo+IGhhdmUgYWxyZWFkeSBh
bmQgc2VuZHMgb3V0IGFuIHVwZGF0ZWQgcHVsbCByZXF1ZXN0Lgo+IAo+IEFwb2xvZ2llcyBmb3Ig
dGhlIG1lc3MuCj4gLURhbmllbAo+IC0tLQo+ICBkcml2ZXJzL2dwdS92Z2EvS2NvbmZpZyB8IDEg
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvdmdhL0tjb25maWcgYi9kcml2ZXJzL2dwdS92Z2EvS2NvbmZpZwo+IGluZGV4IDg0
YWI0ODJkMGRiNi4uYzhjNzcwYjA1ZWQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L3ZnYS9L
Y29uZmlnCj4gKysrIGIvZHJpdmVycy9ncHUvdmdhL0tjb25maWcKPiBAQCAtMjMsNiArMjMsNyBA
QCBjb25maWcgVkdBX1NXSVRDSEVST08KPiAgCWRlcGVuZHMgb24gWDg2Cj4gIAlkZXBlbmRzIG9u
IEFDUEkKPiAgCWRlcGVuZHMgb24gUENJCj4gKwlkZXBlbmRzIG9uIChGUkFNRUJVRkZFUl9DT05T
T0xFPW4gfHwgRkI9eSkKPiAgCXNlbGVjdCBWR0FfQVJCCj4gIAloZWxwCj4gIAkgIE1hbnkgbGFw
dG9wcyByZWxlYXNlZCBpbiAyMDA4LzkvMTAgaGF2ZSB0d28gR1BVcyB3aXRoIGEgbXVsdGlwbGV4
ZXIKPiAtLSAKPiAyLjIwLjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVy
LCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
