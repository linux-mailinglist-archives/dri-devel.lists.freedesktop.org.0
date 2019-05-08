Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A85A71748A
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 11:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE728922B;
	Wed,  8 May 2019 09:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031638922B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 09:06:18 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w37so21369339edw.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 02:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=ZCByRjUdoltM6JQS2wK/k1Vsg/2ECYjryZKrL53UB1A=;
 b=Nq6iO6cse2SSy309F7JDsugK33U4le6omdo3Bv8Yzxjf3FWJ86loiFhM2KMfioSlUq
 bkfp6AILsMf+kNe2dmQFsvTSpj631piY10zxqwUxTT1Ve23ew0dZ5o86DNDpZvVCvzOc
 gzLQuIfVnqiRR2NtG5JIymhxkWZ/SsTxk02Nr87+6NyPAKlUzE2Un9AU+Ek9/RRKU1Aq
 KBuIz78A21geW4LVEDVsBWgsMbXed24CBECGuAr3ca5V6ZybJraLtEdN4QwWY9jJjPNU
 VlOFI88uDZI2CmFoHJTs1Dyjyu3Ok5GMwLg+dgl8mIk/2zuEF6qeBI9ftKfBSQxCWNs9
 oKjg==
X-Gm-Message-State: APjAAAVeWQ2yGi2n1Gzt/G37ImduU60si8VGN586ZZgU9rtQpfYIUA6s
 duWPfVhlAabrYHd74bCQKF+7tw==
X-Google-Smtp-Source: APXvYqyhIyJzQJ2/WQmKoGSeee8pS6Iu8b2u59hMI6uOyjAOYUPnEY7pFFD0PgsSnAjiyZEjRhbMSQ==
X-Received: by 2002:a17:906:a48:: with SMTP id
 x8mr3642206ejf.247.1557306376650; 
 Wed, 08 May 2019 02:06:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f44sm4982723eda.73.2019.05.08.02.06.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 02:06:15 -0700 (PDT)
Date: Wed, 8 May 2019 11:06:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH RE-RESEND 1/2] drm/panel: Add support for Armadeus ST0700
 Adapt
Message-ID: <20190508090612.GT17751@phenom.ffwll.local>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>,
 Fabio Estevam <festevam@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 stable <stable@vger.kernel.org>,
 =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
 <CAOMZO5B2nMsVNO6O_D+YTSjux=-DjNPGxhkEi3AQquOZVODumA@mail.gmail.com>
 <20190507161950.GA24879@ravnborg.org>
 <20190508083303.GR17751@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508083303.GR17751@phenom.ffwll.local>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=ZCByRjUdoltM6JQS2wK/k1Vsg/2ECYjryZKrL53UB1A=;
 b=cAzcttZx8IOcmQDqtJutN0W3TZIg84Kt+H8yqc/dtHNn73Y2pzR4uGqqCerk+xxpRK
 kCgJj/0Cr/9osHXLk0jMGb0DbsYQmdwOxkCRSgnYBTOS4elaRx1CcurT+vvHJOsLuOZf
 kJPxniGaN7IRwAIl1yJA3kUC4nDvoPbGXpO0o=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 stable <stable@vger.kernel.org>,
 =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMTA6MzM6MDNBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE1heSAwNywgMjAxOSBhdCAwNjoxOTo1MFBNICswMjAwLCBTYW0gUmF2
bmJvcmcgd3JvdGU6Cj4gPiBIaSBGYWJpbwo+ID4gCj4gPiBPbiBUdWUsIE1heSAwNywgMjAxOSBh
dCAxMjozMzozOVBNIC0wMzAwLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+ID4gPiBbQWRkaW5nIFNh
bSwgd2hvIGlzIGhlbHBpbmcgdG8gcmV2aWV3L2NvbGxlY3QgcGFuZWwtc2ltcGxlIHBhdGNoZXNd
Cj4gPiA+IAo+ID4gPiBPbiBUdWUsIE1heSA3LCAyMDE5IGF0IDEyOjI3IFBNIFPDqWJhc3RpZW4g
U3p5bWFuc2tpCj4gPiA+IDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JvdGU6
Cj4gPiA+ID4KPiA+ID4gPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgdGhlIEFybWFkZXVz
IFNUMDcwMCBBZGFwdC4gSXQgY29tZXMgd2l0aCBhCj4gPiA+ID4gU2FudGVrIFNUMDcwMEk1WS1S
QlNMVyA3LjAiIFdWR0EgKDgwMHg0ODApIFRGVCBhbmQgYW4gYWRhcHRlciBib2FyZCBzbwo+ID4g
PiA+IHRoYXQgaXQgY2FuIGJlIGNvbm5lY3RlZCBvbiB0aGUgVEZUIGhlYWRlciBvZiBBcm1hZGV1
cyBEZXYgYm9hcmRzLgo+ID4gPiA+Cj4gPiA+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcg
IyB2NC4xOQo+ID4gPiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
Pgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4u
c3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+Cj4gPiAKPiA+IElmIHlvdSB3aWwgbHJlc2VuZCB0aGUgcGF0Y2ggSSBj
YW4gYXBwbHkgaXQuCj4gPiBJIGhhdmUgbG9zdCB0aGUgb3JpZ2luYWwgbWFpbC4KPiAKPiBVc3Vh
bGx5IHBhdGNod29yayBzaG91bGQgaGF2ZSBpdCBhbHJlYWR5IChhbmQgeW91IGNhbiBwaXBlIHRo
ZSByYXcKPiBwYXRjaHdvcmsgbWJveCBpbnRvIGRpbSBhcHBseSksIGJ1dCBzb21laG93IGl0J3Mg
bm90IHRoZXJlIGVpdGhlci4KPiBOb3Qgc3VyZSB3aHksIHNvbWV0aW1lcyB0aGlzIGlzIGJlY2F1
c2UgbWFpbHMgYXJlIHN0dWNrIGluIG1vZGVyYXRpb24sCj4gc29tZXRpbWVzIGJlY2F1c2UgcGVv
cGxlIGRvIGludGVyZXN0aW5nIHRoaW5ncyB3aXRoIHRoZWlyIG1haWxzIChlLmcuIHNtdHAKPiBz
ZXJ2ZXJzIG1hbmdsaW5nIGZvcm1hdHRpbmcpLgoKcGF0Y2h3b3JrIHdhcyBqdXN0IGEgYml0IHNs
b3csIGl0J3MgdGhlcmUgbm93OgoKaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nl
cmllcy82MDQwOC8KCkNoZWVycywgRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
