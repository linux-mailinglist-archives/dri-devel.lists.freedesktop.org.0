Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AECCB75628
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 19:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC486E7E3;
	Thu, 25 Jul 2019 17:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02F76E7E3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 17:49:28 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id n205so19513364ywb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 10:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OoM8RtRnrNUtmStwHC0+KsBVS4r5eOo6VxB/ZvbIcwo=;
 b=oljyL+WAM83HBAfCXAt0xbl+6dEQvCMs1bzEFUn7mVujRep2u0ZAs7JAYEXoEq7eI1
 /hi22bJCM/qsDmnv0Sr2+XAWGVwEdOrSmBxH/8U/rUj5hOuuWa1SoeRjSA9IMfTq/hzg
 soj6x5DnccxaXb0yCNcJD/yXDiYXGQlenIoETPQIitnknS8/E8akiTdviN9Il47JeFAs
 Bgq8J18KOZKt2DqdkhQ4+qlfP4fd81yCE+v1dKCCRukwRnmIhclHJS6nDETTXCbZ7FAO
 D33r3QhADPJAuJd9B59dZn8rN3Qua8QXXEv67z/tqJ7Mfe9iuncEjO7ESGxrGA9YEk93
 DIIA==
X-Gm-Message-State: APjAAAWd/WEpdjaWMRLtn+2gGO7nGTkkbJ3bbvMmvm7B2TmpXSZLb2MV
 x2Z3wvhyzTLV3Fbmk95AsQm2EA==
X-Google-Smtp-Source: APXvYqxAHNazdJ/L/5l/x5/K71LHWoAyCkyD4hcgJI1CalnKgpmUThw46IPfZZiomqYwo37622E3Ig==
X-Received: by 2002:a81:a705:: with SMTP id e5mr52681935ywh.445.1564076967880; 
 Thu, 25 Jul 2019 10:49:27 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 131sm11662257ywq.21.2019.07.25.10.49.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 10:49:27 -0700 (PDT)
Date: Thu, 25 Jul 2019 13:49:27 -0400
From: Sean Paul <sean@poorly.run>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: Refuse DDC/CI transfers on the
 internal I2C controller
Message-ID: <20190725174927.GN104440@art_vandelay>
References: <20190722181945.244395-1-mka@chromium.org>
 <20190722202426.GL104440@art_vandelay>
 <20190722210207.GZ250418@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722210207.GZ250418@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OoM8RtRnrNUtmStwHC0+KsBVS4r5eOo6VxB/ZvbIcwo=;
 b=PONBzy9mx1DDK1v+PDvnFEOMsIP29+0jf0+9Dje+TouNHnF2UwKEqX8OOyaxBJTGnt
 OV1bfLoOuHYjXDoU1BlfXjNKFe7sEOIcGb+ox+V0IEmBiaF1/HnpmsGUxsy/A6Xigvab
 kdsVP8dDJdZssywclnmsA3ZUWVyamTEQmaG65pED40ts05lpsanvnqa/eOimkuHhGa8Q
 N3eYdh6fDyAMvUKnz++34Ux316nwQeeHe/IgOmUIfDFUTL3VNAit82ry0LJO2taTti33
 gcwZ38qJU33CNcpWNk7X7ujmL+v7j+g5FEb9c2vzDoq4VFSJHVMzmnUqwrOea8prtzZH
 pU7g==
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDI6MDI6MDdQTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxj
a2Ugd3JvdGU6Cj4gT24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDQ6MjQ6MjZQTSAtMDQwMCwgU2Vh
biBQYXVsIHdyb3RlOgo+ID4gT24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMTE6MTk6NDVBTSAtMDcw
MCwgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cj4gPiA+IFRoZSBEREMvQ0kgcHJvdG9jb2wgaW52
b2x2ZXMgc2VuZGluZyBhIG11bHRpLWJ5dGUgcmVxdWVzdCB0byB0aGUKPiA+ID4gZGlzcGxheSB2
aWEgSTJDLCB3aGljaCBpcyB0eXBpY2FsbHkgZm9sbG93ZWQgYnkgYSBtdWx0aS1ieXRlCj4gPiA+
IHJlc3BvbnNlLiBUaGUgaW50ZXJuYWwgSTJDIGNvbnRyb2xsZXIgb25seSBhbGxvd3Mgc2luZ2xl
IGJ5dGUKPiA+ID4gcmVhZHMvd3JpdGVzIG9yIHJlYWRzIG9mIDggc2VxdWVudGlhbCBieXRlcywg
aGVuY2UgRERDL0NJIGlzIG5vdAo+ID4gPiBzdXBwb3J0ZWQgd2hlbiB0aGUgaW50ZXJuYWwgSTJD
IGNvbnRyb2xsZXIgaXMgdXNlZC4gVGhlIEkyQwo+ID4gCj4gPiBUaGlzIGlzIHZlcnkgbGlrZWx5
IGEgc3R1cGlkIHF1ZXN0aW9uLCBidXQgSSBkaWRuJ3Qgc2VlIGFuIGFuc3dlciBmb3IgaXQsIHNv
Cj4gPiBJJ2xsIGp1c3QgYXNrIDopCj4gPiAKPiA+IElmIHRoZSBjb250cm9sbGVyIHN1cHBvcnRz
IHhmZXJzIG9mIDggYnl0ZXMgYW5kIDEgYnl0ZXMsIGNvdWxkIHlvdSBqdXN0IHNwbGl0Cj4gPiB1
cCBhbnkgb2YgdGhlc2UgdHJhbnNhY3Rpb25zIGludG8gbGVuLzgrbGVuJTggdHJhbnNhY3Rpb25z
Pwo+IAo+IFRoZSBjb250cm9sbGVyIGludGVycHJldHMgYWxsIHRyYW5zZmVycyB0byBiZSByZWdp
c3RlciBhY2Nlc3Nlcy4gSXQgaXMKPiBub3QgcG9zc2libGUgdG8ganVzdCBzZW5kIHRoZSBzZXF1
ZW5jZSAnMHgwYSAweDBiIDB4MGMnIGFzIHRocmVlIGJ5dGUKPiB0cmFuc2ZlcnMsIHRoZSBjb250
cm9sbGVyIGV4cGVjdHMgYW4gYWRkcmVzcyBmb3IgZWFjaCBieXRlIGFuZAo+IChzdXBwb3NlZGx5
KSBzZW5kcyBpdCBvdmVyIHRoZSB3aXJlLCB3aGljaCB0eXBpY2FsbHkgaXNuJ3Qgd2hhdCB5b3UK
PiB3YW50Lgo+IAo+IEFsc28gdGhlIDgtYnl0ZSByZWFkcyBvbmx5IHNlZW0gdG8gYmUgc3VwcG9y
dGVkIGluIGNlcnRhaW4KPiBjb25maWd1cmF0aW9ucyAoIndoZW4gdGhlIERXQ19IRE1JX1RYXzIw
IHBhcmFtZXRlciBpcyBlbmFibGVkIikuCgpUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCBhbnN3ZXJz
IChib3RoIHlvdSBhbmQgRG91ZykhCgpUaGlzIGNoYW5nZSBsb29rcyBnb29kIHRvIG1lLCBidXQg
SSdsbCBsZWF2ZSBpdCB0byBhIGR3LWhkbWkgZXhwZXJ0IHRvIGFwcGx5LiBTbwpmd2l3LAoKUmV2
aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgoKCj4gCj4gPiA+IHRyYW5zZmVy
cyBjb21wbGV0ZSB3aXRob3V0IGVycm9ycywgaG93ZXZlciB0aGUgZGF0YSBpbiB0aGUgcmVzcG9u
c2UKPiA+ID4gaXMgZ2FyYmFnZS4gQWJvcnQgdHJhbnNmZXJzIHRvL2Zyb20gc2xhdmUgYWRkcmVz
cyAweDM3IChEREMpIHdpdGgKPiA+ID4gLUVPUE5PVFNVUFAsIHRvIG1ha2UgaXQgZXZpZGVudCB0
aGF0IHRoZSBjb21tdW5pY2F0aW9uIGlzIGZhaWxpbmcuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KPiA+ID4gLS0tCj4gPiA+
IENoYW5nZXMgaW4gdjI6Cj4gPiA+IC0gY2hhbmdlZCBERENfSTJDX0FERFIgdG8gRERDX0NJX0FE
RFIKPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhk
bWkuYyB8IDggKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykK
PiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4g
PiA+IGluZGV4IDA0NWIxYjEzZmQwZS4uMjg5MzM2MjlmM2M3IDEwMDY0NAo+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ID4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ID4gPiBAQCAtMzUsNiArMzUs
NyBAQAo+ID4gPiAgCj4gPiA+ICAjaW5jbHVkZSA8bWVkaWEvY2VjLW5vdGlmaWVyLmg+Cj4gPiA+
ICAKPiA+ID4gKyNkZWZpbmUgRERDX0NJX0FERFIJCTB4MzcKPiA+ID4gICNkZWZpbmUgRERDX1NF
R01FTlRfQUREUgkweDMwCj4gPiA+ICAKPiA+ID4gICNkZWZpbmUgSERNSV9FRElEX0xFTgkJNTEy
Cj4gPiA+IEBAIC0zMjIsNiArMzIzLDEzIEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9pMmNfeGZlcihz
dHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsCj4gPiA+ICAJdTggYWRkciA9IG1zZ3NbMF0uYWRkcjsK
PiA+ID4gIAlpbnQgaSwgcmV0ID0gMDsKPiA+ID4gIAo+ID4gPiArCWlmIChhZGRyID09IEREQ19D
SV9BRERSKQo+ID4gPiArCQkvKgo+ID4gPiArCQkgKiBUaGUgaW50ZXJuYWwgSTJDIGNvbnRyb2xs
ZXIgZG9lcyBub3Qgc3VwcG9ydCB0aGUgbXVsdGktYnl0ZQo+ID4gPiArCQkgKiByZWFkIGFuZCB3
cml0ZSBvcGVyYXRpb25zIG5lZWRlZCBmb3IgRERDL0NJLgo+ID4gPiArCQkgKi8KPiA+ID4gKwkJ
cmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4gPiArCj4gPiA+ICAJZGV2X2RiZyhoZG1pLT5kZXYsICJ4
ZmVyOiBudW06ICVkLCBhZGRyOiAlI3hcbiIsIG51bSwgYWRkcik7Cj4gPiA+ICAKPiA+ID4gIAlm
b3IgKGkgPSAwOyBpIDwgbnVtOyBpKyspIHsKPiA+IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUg
RW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
