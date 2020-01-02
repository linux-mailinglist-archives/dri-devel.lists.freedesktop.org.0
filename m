Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F99612E867
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 17:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CF8899D6;
	Thu,  2 Jan 2020 16:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C56899D6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 16:05:25 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m24so5984746wmc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2020 08:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=INDmQoNk/tJLRjiqxNPsW2gTLEyOqRnXAOa6Y+CM3Pw=;
 b=JhmzFIJCwdx9ggVuJa79e18cPxwtou1gcE2KkF73nX52YP4KJfuBKD6A9MvYxQTB58
 ZnhIgjy+uRa72LkOh/wX8AHmX1zPfwDvM2hpfzsCbUIZi/ccsvGD6ONponzCPHA2/406
 9BHfB01Fm+tcSETuQixDIKAzq+WpXxLcKg2vOMEkC+DZLT53n1NWMUGolQQu0tQSxIdd
 zr6eTSmrAxXpOS/Q/51yb93kLZsvvbmjVOyiQYQj4lClGK8OPiMQyfY2m6+7z8H9KeDK
 XBpF6baVTfB61xHzqc3d/ze4fNF2Upt6T/lijlv5QSLL6V1VZumqs/lvEFGwT5OKOT+w
 6K6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=INDmQoNk/tJLRjiqxNPsW2gTLEyOqRnXAOa6Y+CM3Pw=;
 b=SoZluc30BZjP0x1RN7EUm9lS3Pk19lbKYeSpDcim429A9nJ5p3inmdYB3s01c8CP6l
 yVWiB27p4sBSIqoN8F2EqpQbotJR/NS7Oj7YqHzzOrJ2ACTTsgN2vZ6V1r2glh0b0Ajq
 Ru6pf4vU/L6vWDI/xcmnT/OBbUu0euabDk7Zr/0LEehbcqJCU55djcSghoKpvATjJCZn
 TEs8YNr104kQ0O1R2A9W5MQ4mr74XLjlfOPRdgThNL1GBKLSWZq+rtKLW/m+YEbBeZg7
 gaWNs3es0ieQFX5So9xnzuesGcYVrqI39ZfJZhAXICw3hEmq48T5D7MWcXnkVaUE49CT
 bsTw==
X-Gm-Message-State: APjAAAUO8B0b2keYhYE6UM8wwAikts1QVzglpcRqO1uty+Kmc/zbCw58
 r+sLTGUqs01JxhBEUbbwonRfaQ==
X-Google-Smtp-Source: APXvYqyEivYwaP2ns3ILcszz/Grz4Of7NPSptL4+RXbkbFEpLOYTTlIS/61sIXEmkPh/gB/NCcDmKQ==
X-Received: by 2002:a05:600c:d7:: with SMTP id
 u23mr14220226wmm.145.1577981123996; 
 Thu, 02 Jan 2020 08:05:23 -0800 (PST)
Received: from dell ([2.27.35.135])
 by smtp.gmail.com with ESMTPSA id t125sm9077685wmf.17.2020.01.02.08.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 08:05:22 -0800 (PST)
Date: Thu, 2 Jan 2020 16:05:34 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 0/6] fixes for atmel-hlcdc
Message-ID: <20200102160534.GJ22390@dell>
References: <1576672109-22707-1-git-send-email-claudiu.beznea@microchip.com>
 <20200102090554.GB29446@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102090554.GB29446@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 dri-devel@lists.freedesktop.org, peda@axentia.se, boris.brezillon@bootlin.com,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAwMiBKYW4gMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUuCj4gCj4g
SG93IGRvIGRlIGhhbmRsZSB0aGUgdHdvIG1mZCByZWxhdGVkIHBhdGNoZXM/Cj4gCj4gPiBJIGhh
dmUgZmV3IGZpeGVzIGZvciBhdG1lbC1obGNkYyBkcml2ZXIgaW4gdGhpcyBzZXJpZXMgYXMgd2Vs
bAo+ID4gYXMgdHdvIHJldmVydHMuCj4gPiBSZXZlcnQgImRybTogYXRtZWwtaGxjZGM6IGVuYWJs
ZSBzeXNfY2xrIGR1cmluZyBpbml0YWxpemF0aW9uLiIgaXMKPiA+IGR1ZSB0byB0aGUgZml4IGlu
IGluIHBhdGNoIDIvNS4KPiA+IAo+ID4gVGhhbmsgeW91LAo+ID4gQ2xhdWRpdSBCZXpuZWEKPiA+
IAo+ID4gQ2hhbmdlcyBpbiB2MzoKPiA+IC0gY2hhbmdlcyBkZXZfZXJyKCkgbWVzc2FnZSBpbiBw
YXRjaCA0LzYKPiA+IC0gY29sbGVjdCBBY2tlZC1ieSB0YWdzCj4gPiAKPiA+IENoYW5nZXMgaW4g
djI6Cj4gPiAtIGludHJvZHVjZSBwYXRjaCAzLzYKPiA+IC0gdXNlIGRldl9lcnIoKSBpbnBhdGNo
IDQvNgo+ID4gLSBpbnRyb2R1Y2UgcGF0Y2ggNS82IGluc3RlYWQgb2YgcmV2ZXJ0aW5nIGNvbW1p
dCBmNmY3YWQzMjM0NjEKPiA+ICAgKCJkcm0vYXRtZWwtaGxjZGM6IGFsbG93IHNlbGVjdGluZyBh
IGhpZ2hlciBwaXhlbC1jbG9jayB0aGFuIHJlcXVlc3RlZCIpCj4gPiAKPiA+IENsYXVkaXUgQmV6
bmVhICg1KToKPiA+ICAgZHJtOiBhdG1lbC1obGNkYzogdXNlIGRvdWJsZSByYXRlIGZvciBwaXhl
bCBjbG9jayBvbmx5IGlmIHN1cHBvcnRlZAo+ID4gICBkcm06IGF0bWVsLWhsY2RjOiBlbmFibGUg
Y2xvY2sgYmVmb3JlIGNvbmZpZ3VyaW5nIHRpbWluZyBlbmdpbmUKPiAKPiA+ICAgbWZkOiBhdG1l
bC1obGNkYzogYWRkIHN0cnVjdCBkZXZpY2UgbWVtYmVyIHRvIHN0cnVjdAo+ID4gICAgIGF0bWVs
X2hsY2RjX3JlZ21hcAo+ID4gICBtZmQ6IGF0bWVsLWhsY2RjOiByZXR1cm4gaW4gY2FzZSBvZiBl
cnJvcgo+IAo+IFdvdWxkIGl0IGJlIE9LIHRvIGFwcGx5IHRoZSB0byBkcm0tbWlzYy1uZXh0LCBv
ciBzaGFsIHRoZXkgZ28gaW4gdmlhCj4geW91ciBtZmQgdHJlZT8KCkhvdyBhcmUgdGhleSByZWxh
dGVkIHRvIHRoZSBvdGhlciBwYXRjaGVzPyAgRG8gdGhleSBoYXZlIGJ1aWxkLXRpbWUKZGVwZW5k
ZW5jaWVzIG9uIGFueSBvZiB0aGUgb3RoZXIgcGF0Y2hlcywgb3IgdmljZSB2ZXJzYT8gCgotLSAK
TGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5h
cm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFy
bzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
