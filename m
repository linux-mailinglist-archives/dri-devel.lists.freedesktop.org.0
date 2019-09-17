Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9112B54C0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 19:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F226ED24;
	Tue, 17 Sep 2019 17:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C99B6ED24
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 17:58:37 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id e18so3710883oii.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 10:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7dX3IYhgH+re5ug66qG47rfti7dbGb0gT2E31r+ps6E=;
 b=SvDPVLXYhR5st26c5JOrd/t6LT1/o2/3xXCd/HH6q1BckSI+PszEYVdA53YT79AZwH
 lYqnCJB1CpBoRWl/vbo+3nurpB+N5egETdvibno2wtMb6Rbhs4aJWO18Gh5c9h+npLBz
 lT3vlj0rtjdxUpjyqbD2Gond8uf3k+wDtswujuJCrl0CR7E/q0j3zRzbsb+uFHaRU2gA
 Tp2CcK512wZwYfkbhvVjepQyLhhADUxSEXBxyfjNTXu5UIkuErzNptI43k3/6DS03qYN
 Vljmg3ORrweyvdxsaoAaBqX6j7hTKCEjZwfgxx2vkS5cwjo+05ROnan+H2APrnRW4qh9
 WOaw==
X-Gm-Message-State: APjAAAXeVgQF8MK9J9jRPCL5IwFHcqufSQhuyNboU8Mi2XWIAU09bz40
 ca+1XLaWLr9uETzydb8Izw==
X-Google-Smtp-Source: APXvYqz6w6TOJ/O28uXBl30U4/ItHlYTLyX3bChwJpVDFlJIQYgFMGxvKNq5LJV/Lja3JMrrIhJ3sw==
X-Received: by 2002:aca:52cd:: with SMTP id g196mr4827415oib.163.1568743116659; 
 Tue, 17 Sep 2019 10:58:36 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g4sm850712otj.42.2019.09.17.10.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 10:58:35 -0700 (PDT)
Date: Tue, 17 Sep 2019 12:58:35 -0500
From: Rob Herring <robh@kernel.org>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: display, renesas,du: Document cmms
 property
Message-ID: <20190917175835.GA6900@bogus>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-3-jacopo+renesas@jmondi.org>
 <2bcbb30c-db36-38a1-dcff-4f4269c11ad6@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2bcbb30c-db36-38a1-dcff-4f4269c11ad6@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: muroya@ksk.co.jp, devicetree@vger.kernel.org,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie, mark.rutland@arm.com,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 horms@verge.net.au, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com, uli+renesas@fpond.eu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDU6MDY6MzNQTSArMDEwMCwgS2llcmFuIEJpbmdoYW0g
d3JvdGU6Cj4gSGkgSmFjb3BvLAo+IAo+IE9uIDA2LzA5LzIwMTkgMTQ6NTQsIEphY29wbyBNb25k
aSB3cm90ZToKPiA+IERvY3VtZW50IHRoZSBuZXdseSBhZGRlZCAnY21tcycgcHJvcGVydHkgd2hp
Y2ggYWNjZXB0cyBhIGxpc3Qgb2YgcGhhbmRsZQo+ID4gYW5kIGNoYW5uZWwgaW5kZXggcGFpcnMg
dGhhdCBwb2ludCB0byB0aGUgQ01NIHVuaXRzIGF2YWlsYWJsZSBmb3IgZWFjaAo+ID4gRGlzcGxh
eSBVbml0IG91dHB1dCB2aWRlbyBjaGFubmVsLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWNv
cG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4gPiBSZXZpZXdlZC1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gLS0t
Cj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxk
dS50eHQgfCA1ICsrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4g
Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcmVuZXNhcyxkdS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9yZW5lc2FzLGR1LnR4dAo+ID4gaW5kZXggYzk3ZGZhY2FkMjgxLi4xNzczYjBhMmY1NGYg
MTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9yZW5lc2FzLGR1LnR4dAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQKPiA+IEBAIC00NSw2ICs0NSwxMCBAQCBSZXF1aXJl
ZCBQcm9wZXJ0aWVzOgo+ID4gICAgICBpbnN0YW5jZSB0aGF0IHNlcnZlcyB0aGUgRFUgY2hhbm5l
bCwgYW5kIHRoZSBjaGFubmVsIGluZGV4IGlkZW50aWZpZXMgdGhlCj4gPiAgICAgIExJRiBpbnN0
YW5jZSBpbiB0aGF0IFZTUC4KPiA+IAo+ID4gKyAgLSByZW5lc2FzLGNtbXM6IEEgbGlzdCBvZiBw
aGFuZGxlcyB0byB0aGUgQ01NIGluc3RhbmNlcyBwcmVzZW50IGluIHRoZSBTb0MsCj4gPiArICAg
IG9uZSBmb3IgZWFjaCBhdmFpbGFibGUgRFUgY2hhbm5lbC4gVGhlIHByb3BlcnR5IHNoYWxsIG5v
dCBiZSBzcGVjaWZpZWQgZm9yCj4gPiArICAgIFNvQ3MgdGhhdCBkbyBub3QgcHJvdmlkZSBhbnkg
Q01NIChzdWNoIGFzIFYzTSBhbmQgVjNIKS4KPiA+ICsKPiA+ICBSZXF1aXJlZCBub2RlczoKPiA+
IAo+ID4gIFRoZSBjb25uZWN0aW9ucyB0byB0aGUgRFUgb3V0cHV0IHZpZGVvIHBvcnRzIGFyZSBt
b2RlbGVkIHVzaW5nIHRoZSBPRiBncmFwaAo+ID4gQEAgLTkxLDYgKzk1LDcgQEAgRXhhbXBsZTog
UjhBNzc5NSAoUi1DYXIgSDMpIEVTMi4wIERVCj4gPiAgCQkJIDwmY3BnIENQR19NT0QgNzIxPjsK
PiA+ICAJCWNsb2NrLW5hbWVzID0gImR1LjAiLCAiZHUuMSIsICJkdS4yIiwgImR1LjMiOwo+ID4g
IAkJdnNwcyA9IDwmdnNwZDAgMD4sIDwmdnNwZDEgMD4sIDwmdnNwZDIgMD4sIDwmdnNwZDAgMT47
Cj4gPiArCQlyZW5lc2FzLGNtbXMgPSA8JmNtbTAgJmNtbTEgJmNtbTIgJmNtbTM+Owo+IAo+IFNo
b3VsZCB0aGVzZSBiZSBjb21tYSBzZXBhcmF0ZWQgaW4gdGhlIHNhbWUgZmFzaGlvbiBhcyB0aGUg
dnNwcyBhcmUKPiBzZXBhcmF0ZWQ/CgpZZXMuIERvZXNuJ3QgbWF0dGVyIGZyb20gYSBkdGIgc3Rh
bmRwb2ludCwgYnV0IHRoZSBzY2hlbWEgYXJlIGdvaW5nIHRvIApiZSBzdHJpY3RlciBoZXJlLiBC
cmFja2V0IGVhY2ggdW5pdC4KCldpdGggdGhhdCwKClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgoKPiAKPiBJIGRvbid0IHJlYWxseSBtaW5kIGVpdGhlciB3YXkgdGhv
dWdoIC4uLgo+IAo+IFJldmlld2VkLWJ5OiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0r
cmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgo+IAo+IAo+ID4gCj4gPiAgCQlwb3J0cyB7Cj4gPiAg
CQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiAtLQo+ID4gMi4yMy4wCj4gPiAKPiAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
