Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA68DB031
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 16:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D506E055;
	Thu, 17 Oct 2019 14:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FF66E055
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 14:37:40 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id s22so2080365otr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 07:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EVefoS1uox1PXbNp8a2dEzENp3d5CAL7i63ZLMJgDfE=;
 b=eMn7r4O7+/N8juRL5gdRz4Tt6re+EsRXVQGIjP3bLlh6K24yEUIUUEu9ulvDs4WTRa
 0eDguwyT9YjzAh3BcCeiMaZvLHm5ZrdjD112JqrEzD+pjFJuwWy3UsyhyGPnm1cGp5jd
 fD1A9VoTdKbqMJgIk7+Ca+l5eZvNw4hOYKrt2T8KwIRzpvnfzIwuQGXu8Kcp2I0t16Ky
 WSutdNzXxkHCc4pVi/q3cs9XFtGPyZ+r/G+VwF74SaQejaHcRgfcCLYgz2KIU9uj+L9r
 asqynXQ8OieX4+HtTnlhS/h3XM7YOmcXnf8Fvc1A/ponA0/m1iO1neW8t64LHtFYCG8e
 UoPA==
X-Gm-Message-State: APjAAAW2dHaGJDj9rIdw0g2vPZyr16QyZmRYTFHgBVDU0bIf/A9bOHjo
 iywdm9vgmKcjF2EvmpEXXg==
X-Google-Smtp-Source: APXvYqwMb70hm3fWXirGCzrqwCzu4GcP6vYWFZa5Tyv1x+cngwflxxpcOVSGp1wCM55OXRAM1LbZUg==
X-Received: by 2002:a05:6830:17db:: with SMTP id
 p27mr3446871ota.258.1571323059553; 
 Thu, 17 Oct 2019 07:37:39 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x140sm560586oix.42.2019.10.17.07.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 07:37:38 -0700 (PDT)
Date: Thu, 17 Oct 2019 09:37:38 -0500
From: Rob Herring <robh@kernel.org>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH V5 2/3] dt-bindings: Add Logic PD Type 28 display panel
Message-ID: <20191017143738.GA10960@bogus>
References: <20191016135147.7743-1-aford173@gmail.com>
 <20191016135147.7743-2-aford173@gmail.com>
 <20191016144018.GG5175@pendragon.ideasonboard.com>
 <CAHCN7xJhHHoia_o4rb0VgvCP71X94Pvem684F2quMijNNpNxVA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHCN7xJhHHoia_o4rb0VgvCP71X94Pvem684F2quMijNNpNxVA@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMDk6NTU6MTFBTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3Rl
Ogo+IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDk6NDAgQU0gTGF1cmVudCBQaW5jaGFydAo+IDxs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIEFkYW0s
Cj4gPgo+ID4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4gPgo+ID4gT24gV2VkLCBPY3QgMTYs
IDIwMTkgYXQgMDg6NTE6NDZBTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3RlOgo+ID4gPiBUaGlzIHBh
dGNoIGFkZHMgZG9jdW1lbnRhdGlvbiBvZiBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIFdW
R0EgcGFuZWwKPiA+ID4gTG9naWMgUEQgVHlwZSAyOCBkaXNwbGF5Lgo+ID4gPgo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+
IFY1OiAgUmVwbGFjZSBHUElPX0FDVElWRV9ISUdIIHdpdGggMCB0byBmaXggbWFrZSBkdF9iaW5k
aW5nX2NoZWNrIC1rCj4gPiA+IFY0OiAgVXBkYXRlIHBlciBSb2IgSCdzIHN1Z2dlc3Rpb25zIGFu
ZCBjb3B5IG90aGVyIHBhbmVsIHlhbWwgZXhhbXBsZSBmcm9tIDUuNC1yYzEKPiA+ID4gVjM6ICBD
b3JyZWN0IGJ1aWxkIGVycm9ycyBmcm9tICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snCj4gPiA+IFYy
OiAgVXNlIFlBTUwgaW5zdGVhZCBvZiBUWFQgZm9yIGJpbmRpbmcKPiA+ID4KPiA+ID4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2xv
Z2ljcGQsdHlwZTI4LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9sb2dpY3BkLHR5cGUyOC55YW1sCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjgzNDI4N2I4ZDg4Cj4gPiA+IC0tLSAvZGV2L251
bGwKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvbG9naWNwZCx0eXBlMjgueWFtbAo+ID4gPiBAQCAtMCwwICsxLDQyIEBACj4gPiA+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiA+ICslWUFNTCAxLjIKPiA+ID4g
Ky0tLQo+ID4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3Bh
bmVsL2xvZ2ljcGQsdHlwZTI4LnlhbWwjCj4gPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ID4gKwo+ID4gPiArdGl0bGU6IExvZ2lj
IFBEIFR5cGUgMjggNC4zIiBXUVZHQSBURlQgTENEIHBhbmVsCj4gPiA+ICsKPiA+ID4gK21haW50
YWluZXJzOgo+ID4gPiArICAtIEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPgo+ID4gPiAr
Cj4gPiA+ICthbGxPZjoKPiA+ID4gKyAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMKPiA+ID4g
Kwo+ID4gPiArcHJvcGVydGllczoKPiA+ID4gKyAgY29tcGF0aWJsZToKPiA+ID4gKyAgICBjb25z
dDogbG9naWNwZCx0eXBlMjgKPiA+ID4gKwo+ID4gPiArICBwb3dlci1zdXBwbHk6IHRydWUKPiA+
ID4gKyAgZW5hYmxlLWdwaW9zOiB0cnVlCj4gPiA+ICsgIGJhY2tsaWdodDogdHJ1ZQo+ID4gPiAr
ICBwb3J0OiB0cnVlCj4gPiA+ICsKPiA+ID4gK3JlcXVpcmVkOgo+ID4gPiArICAtIGNvbXBhdGli
bGUKPiA+Cj4gPiBTaG91bGQgdGhlIHBvcnQgYmUgcmVxdWlyZWQgdG9vID8gQXBhcnQgZnJvbSB0
aGF0LAo+IAo+IEkgc3VwcG9zZWQgdGhhdCdzIHRydWUsIGJ1dCBJIHVzZWQgYW1waXJlLGFtLTQ4
MDI3MmgzdG1xdy10MDFoLnlhbWwgYXMKPiB0aGUgZXhhbXBsZSwgYW5kIGl0IGRvZXNuJ3QgbGlz
dCBpdCBhcyBhIHJlcXVpcmVkIGl0ZW0uCj4gSXMgdGhlcmUgYW55dGhpbmcgZWxzZSBJIG5lZWQg
dG8gYWRkcmVzcz8gIEkgZmVlbCBsaWtlIEknbSB0cnlpbmcgdG8KPiBoaXQgYSBtb3ZpbmcgdGFy
Z2V0LgoKJ3BvcnQnIGNhbiBiZSBvbWl0dGVkIGJlY2F1c2UgdGhlIHBhbmVsIGNhbiBiZSBhIGNo
aWxkIG5vZGUgb2YgCnRoZSBkaXNwbGF5IGNvbnRyb2xsZXIgaW5zdGVhZC4gVGhhdCdzIGRlY2lk
ZWQgYnkgdGhlIGRpc3BsYXkgY29udHJvbGxlciAKYmluZGluZywgbm90IHRoZSBwYW5lbCBiaW5k
aW5nLgoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpSb2IKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
