Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46034CF533
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 10:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FF96E23B;
	Tue,  8 Oct 2019 08:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF026E23B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 08:42:49 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id v38so14878996edm.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 01:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZMzmSTkMFpJIOChJ7Ruixi4O4QTAn3UGvvR44da4GGY=;
 b=OCVSdPBz3BDxlx6dXEP+hQxTrjTr8NAcvVvbzjHjuGBH1vvV8HScQy/2JnYtV3+oSv
 7iPVG35Ku77gSbyyTycPkIx8Yi1dyGgt463vtEHOj58oZaR3QXSzdFJhXpVdLlUWIC6w
 O4dqjY1MWSwf++ArUk8yDaBNPwElKaGRfYMkAK7XhoksM92xDLx3U186XgftuA536TMA
 MPv9xX2sbm4d3FRWedglfriIlBW1YQnn5thTVbNsMo+VEsLZG1MTG+GQxAwbt8+Is967
 okiIRJ5/IrURPKjXqdmmb8M9EmEoI5wBn21j8Lhb5oNWay5l4yrC00le3p2JtLVZf1VQ
 9YXg==
X-Gm-Message-State: APjAAAWkzGQxmstGX1IkNtSNAnDC7gZz9WtLI1d8C3pLnjQn4MyrW697
 BXNQU6Uciw9/sC816LaUFkTAVQ==
X-Google-Smtp-Source: APXvYqy4XBEmynx/3AHJkD6+Spg5n9Fu8Q8RtU1FWdAYM7K51XbW5/wmxKCvOqVBzb4LlVXtnfe/Jg==
X-Received: by 2002:a17:906:fd4:: with SMTP id
 c20mr28043223ejk.41.1570524168492; 
 Tue, 08 Oct 2019 01:42:48 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b15sm3787964edf.24.2019.10.08.01.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 01:42:47 -0700 (PDT)
Date: Tue, 8 Oct 2019 10:42:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: DRM_MODE_CONNECTOR_PANEL? [Was: drm/panel: Add and fill
 drm_panel type field]
Message-ID: <20191008084245.GD16989@phenom.ffwll.local>
References: <20190823193245.23876-1-laurent.pinchart@ideasonboard.com>
 <20190823193245.23876-4-laurent.pinchart@ideasonboard.com>
 <20190824095421.GC30584@ravnborg.org>
 <CACRpkdYk8S271X7pV_Vxe7BhL_mScV69Xbet2xyOqF0fFsRdcg@mail.gmail.com>
 <CAPj87rN3Dh1ANz=rZD=EMOfRXce7cc7v3M6TR2P0VJhyrT4-yw@mail.gmail.com>
 <45dd0859-b5e7-534f-48ab-6dd4a16f38af@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45dd0859-b5e7-534f-48ab-6dd4a16f38af@ti.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZMzmSTkMFpJIOChJ7Ruixi4O4QTAn3UGvvR44da4GGY=;
 b=dk8AmkUbind3lEYHZQlcxepbyjG1I8orqK1VWYTz1lJTh1GnHEG8P9hCCmTboP7GP7
 Na+DHRid79xg/V4lalbmDeKQQRZImwumrWF5/saLJyNrhUDGIszrQcVicyY2uKaObBBo
 NUIrWx4BYSsqWiL2j9ZLMvTj/zaWL1zM4gRqM=
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Mavrodiev <stefan@olimex.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jyri Sarha <jsarha@ti.com>,
 Sean Paul <sean@poorly.run>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Purism Kernel Team <kernel@puri.sm>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDU6Mjg6MDNQTSArMDMwMCwgVG9taSBWYWxrZWluZW4g
d3JvdGU6Cj4gT24gMjcvMDkvMjAxOSAxNTo0NCwgRGFuaWVsIFN0b25lIHdyb3RlOgo+ID4gSGkg
TGludXMsCj4gPiAKPiA+IE9uIEZyaSwgMjcgU2VwIDIwMTkgYXQgMTM6MzcsIExpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+IEFsc28gdGhlIElMSTkz
MjIgY2FuIGFjdHVhbGx5IHNldCB1cCBnYW1tYSBjb3JyZWN0aW9uIHdoaWNoIGlzCj4gPiA+IHZl
cnkgbmljZSBmb3IgcHJvZmVzc2lvbmFsIGFwcGxpY2F0aW9ucy4gSSBoYXZlbid0IHNlZW4gYW55
IHdheSBmb3IKPiA+ID4gRFJNIHRvIGRvIGdhbW1hIGNvcnJlY3Rpb24gcHJvcGVybHkgb3IgYW55
IGZyYW1ld29yayBmb3IgaXQKPiA+ID4gdG8gYWRqdXN0IGFuZCBwcm9wYWdhdGUgZ2FtbWEgdG8v
ZnJvbSB1c2Vyc3BhY2UgKHNlZW1zIGxpa2UKPiA+ID4gYW5vdGhlciBlbm9ybW91cyB0YXNrKSwg
YnV0IEkgYW0gcHJldHR5IHN1cmUgaXQgd2lsbCBiZSB0aGVyZSBvbmUKPiA+ID4gb2YgdGhlc2Ug
ZGF5cyBzbyBJIHB1dCBpbiBzb21lIGNvbW1lbnRzIGFuZCBwbGFjZWhvbGRlcnMuCj4gPiAKPiA+
IEdhbW1hIGNvcnJlY3Rpb24gaGFzIGJlZW4gc3VwcG9ydGVkIHNpbmNlIGFwcHJveGltYXRlbHkg
dGhlIGRhd24gb2YKPiA+IHRpbWUgd2l0aCBhIDN4OC1iaXQgTFVULgo+IAo+IEJ1dCwgYWZhaWss
IG9ubHkgaW4gdGhlIGRpc3BsYXkgY29udHJvbGxlciBzaWRlLiBJIGRvbid0IHRoaW5rIHdlIGhh
dmUgbWVhbnMKPiB0byBoYXZlIGFueSBwcm9wZXJ0aWVzIGZvciB0aGUgcGFuZWxzIG9yIGJyaWRn
ZXMuCgpJIGd1ZXNzIHdvdWxkIG5lZWQgc29tZSBzZW1pLWVsYWJvcmF0ZSBuZWdvdGlhdGlvbiBk
YW5jZSB0byBtYWtlIHN1cmUgeW91Cm9ubHkgY29ycmVjdCBpbiBlaXRoZXIgdGhlIGJyaWRnZS9w
YW5lbCBvciBpbiB0aGUgY3J0YywgYnV0IHNob3VsZCBiZQpkb2FibGUuIEkgZG9uJ3QgdGhpbmsg
d2UgbmVlZCBhIG5ldyBwcm9wZXJ0eSBvciBjaGFuZ2UgYW55dGhpbmcgd2l0aCB0aGUKdWFwaSBo
ZXJlLCBqdXN0IGtlcm5lbCBpbnRlcm5hbHMuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
