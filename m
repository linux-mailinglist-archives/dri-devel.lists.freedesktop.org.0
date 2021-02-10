Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E69DE31679C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 14:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112446EC78;
	Wed, 10 Feb 2021 13:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571696E24E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 13:12:41 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id j11so1790257wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 05:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=06TLiUMrg/gK1BCnrYazHzAso9O/vviLp5XeKWLC8Nc=;
 b=TcF3i2gwx5Tmi229Lswr8tHwSUp4FnGe8selhPmEPLFiHGwzECmsrru4FPqmpaOiXn
 wEWmtRqKhpxLqH1/SA7hB9H8LmOxmMCIoeyx5No97BLmyBg+mUPvPgK5qScOYkzG8Hjm
 LPMMTACRlQpSKp5yoKEl1ljjux4prEN58bKsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=06TLiUMrg/gK1BCnrYazHzAso9O/vviLp5XeKWLC8Nc=;
 b=jeeQRORJGR5dZHu8Qex3vVQEFUuBtJoiA8VVpiLVPBP4KGb4vgIHmGLIuC6DydrH+R
 B8Z4O/C53vYNPy40UulbAZewZGyCJMSWhdwRPvaQYlD6OT81K+e+4yDCStf0xPkVM1iZ
 oEIQ10ESfpvsSnX1YgbByAIb7FMDREE2PpnM6HuKli2n/bTpWE50uvTpCYd9OO99bLOs
 bQCdfJrBLVO99ozcjmWjYugZA0yIkT87LVRkJnmja6tW2j1T84RUfWQ/BBLG8JJTTEE9
 OVZsXIk4yItmWwqigD7BCgiYGCphI3+cqH0c9z8oy4Z1NltOBWrW3+zmtfAa+h/yVR2q
 ylhQ==
X-Gm-Message-State: AOAM530MjZIEt4QNOUIAUjD/N0xb1JxEJ9dZ5p1p2Ll4e6r8SRoclZC5
 Mw2B1E5GJeMXFCew2YCcFPlW7w==
X-Google-Smtp-Source: ABdhPJy4ZuPo59mA1wIBRKapj8He5a/779Cqw/Hlzs8kQbtN9+Z+zVO8u1tp1fHi0Wh5ZYDbsodCMQ==
X-Received: by 2002:a1c:49d7:: with SMTP id w206mr2842211wma.63.1612962760064; 
 Wed, 10 Feb 2021 05:12:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm2907980wrt.8.2021.02.10.05.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 05:12:39 -0800 (PST)
Date: Wed, 10 Feb 2021 14:12:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] video: use getter/setter functions
Message-ID: <YCPbxSHWMipTz+mB@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 kernel-janitors@vger.kernel.org,
 Michal Simek <michal.simek@xilinx.com>,
 dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
 <20210210082341.GH220368@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210082341.GH220368@dell>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-omap@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Simek <michal.simek@xilinx.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-fbdev@vger.kernel.org,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMTAsIDIwMjEgYXQgMDg6MjM6NDFBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIFR1ZSwgMDkgRmViIDIwMjEsIEp1bGlhIExhd2FsbCB3cm90ZToKPiAKPiA+IFVzZSBn
ZXR0ZXIgYW5kIHNldHRlciBmdW5jdGlvbnMsIGZvciBwbGF0Zm9ybV9kZXZpY2Ugc3RydWN0dXJl
cyBhbmQgYQo+ID4gc3BpX2RldmljZSBzdHJ1Y3R1cmUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IEp1bGlhIExhd2FsbCA8SnVsaWEuTGF3YWxsQGlucmlhLmZyPgo+ID4gCj4gPiAtLS0KPiA+ICBk
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgIDIgKy0KPiAKPiBUaGlzIHBhdGNoIGlzIGZpbmUuCj4gCj4gQ291bGQg
eW91IHBsZWFzZSBzcGxpdCBpdCBvdXQgYW5kIHN1Ym1pdCBpdCBzZXBhcmF0ZWx5IHRob3VnaCBw
bGVhc2UuCgpPciBqdXN0IGFwcGx5IHRoZSBlbnRpcmUgcGF0Y2ggdGhyb3VnaCBiYWNrbGlnaHQg
dHJlZSwgdGhlcmUncyBub3RoaW5nCmdvaW5nIG9uIGluIGZiZGV2IGFueXdheSBJIHRoaW5rLgoK
QWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IAo+ID4g
IGRyaXZlcnMvdmlkZW8vZmJkZXYvYW1pZmIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAgNCArKy0tCj4gPiAgZHJpdmVycy92aWRlby9mYmRldi9kYTh4eC1m
Yi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA0ICsrLS0KPiA+
ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2lteGZiLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgIDIgKy0KPiA+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29t
YXBmYi9kaXNwbGF5cy9wYW5lbC1sZ3BoaWxpcHMtbGIwMzVxMDIuYyB8ICAgIDYgKysrLS0tCj4g
PiAgZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZHNzL2RwaS5jICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgICA0ICsrLS0KPiA+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAy
L29tYXBmYi9kc3MvZHNpLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDQgKystLQo+
ID4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rzcy9oZG1pNC5jICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgMiArLQo+ID4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIv
b21hcGZiL2Rzcy9oZG1pNS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMiArLQo+ID4g
IGRyaXZlcnMvdmlkZW8vZmJkZXYveGlsaW54ZmIuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAgMiArLQo+ID4gIDEwIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDE2IGRlbGV0aW9ucygtKQo+IAo+IC4uLl0KPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0
L3Fjb20td2xlZC5jCj4gPiBpbmRleCAzYmM3ODAwZWIwYTkuLjA5MWYwN2U3YzE0NSAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jCj4gPiArKysgYi9k
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYwo+ID4gQEAgLTE2OTIsNyArMTY5Miw3
IEBAIHN0YXRpYyBpbnQgd2xlZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
ID4gIAo+ID4gIHN0YXRpYyBpbnQgd2xlZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiA+ICB7Cj4gPiAtCXN0cnVjdCB3bGVkICp3bGVkID0gZGV2X2dldF9kcnZkYXRhKCZw
ZGV2LT5kZXYpOwo+ID4gKwlzdHJ1Y3Qgd2xlZCAqd2xlZCA9IHBsYXRmb3JtX2dldF9kcnZkYXRh
KHBkZXYpOwo+ID4gIAo+ID4gIAltdXRleF9kZXN0cm95KCZ3bGVkLT5sb2NrKTsKPiA+ICAJY2Fu
Y2VsX2RlbGF5ZWRfd29ya19zeW5jKCZ3bGVkLT5vdnBfd29yayk7Cj4gCj4gRm9yIG15IG93biBy
ZWZlcmVuY2UgKGFwcGx5IHRoaXMgYXMtaXMgdG8geW91ciBzaWduLW9mZiBibG9jayk6Cj4gCj4g
ICBBY2tlZC1mb3ItQmFja2xpZ2h0LWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
Pgo+IAo+IC0tIAo+IExlZSBKb25lcyBb5p2O55C85pavXQo+IFNlbmlvciBUZWNobmljYWwgTGVh
ZCAtIERldmVsb3BlciBTZXJ2aWNlcwo+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3
YXJlIGZvciBBcm0gU29Dcwo+IEZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJs
b2cKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
