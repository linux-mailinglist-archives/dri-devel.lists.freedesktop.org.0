Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1295649A77
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3506E107;
	Tue, 18 Jun 2019 07:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23186E107
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:23:55 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k8so20111410edr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 00:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qCmSq7/dX8Bi0Rr7j3EyPomsJ3SBkWb71qFb9BFHhSE=;
 b=qG2lPkqauCD9VAIQ2gt9KTN2Yu/7bwLB+8oFX/X4R2MFaYelb3m4EVUjXwMAo4UZx9
 09fvFC20MR+z0Ctm84Kq78+zn8a5xXhUPkOzGMoAqqxw0lTYLx/ORn5ONpp5mip8xc21
 zXlZDH8zSpeTTX07eEiYrCepTVjkjpT/L/SWvzvbyLMlEJ8NPOKcZ8GPkRfB93Dt9bVc
 Iyr9IaoHlSLuenK6IXGenFzBUx6vaQhwj/66BI98kJnoYRAcg18FPBmUtu9mwI39nMTe
 N8SYDDwc/3kNixjeufkLZRPpR1aWURY4AOvu662whv1L2ALDb/VltVaKmVumrpFQ7NFm
 7qpg==
X-Gm-Message-State: APjAAAUqBT6X8vQUBHBT/Td1U3jOCNe8JpgGZKvxAh6EB7UN4UqnQZxu
 pVJujC0K1LPXJCADECQvKeW2iC0TYSw=
X-Google-Smtp-Source: APXvYqyXEbnlOcHtW+EHLexKLPhfzAcrEef/qUL0/tszsmkPfttRNaeED2DcASy9XcsqZgxhV9Nx+w==
X-Received: by 2002:a17:906:d50b:: with SMTP id
 ge11mr47990399ejb.227.1560842634235; 
 Tue, 18 Jun 2019 00:23:54 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51])
 by smtp.gmail.com with ESMTPSA id c49sm4582103eda.74.2019.06.18.00.23.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 00:23:53 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id s3so1979180wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 00:23:53 -0700 (PDT)
X-Received: by 2002:a1c:f512:: with SMTP id t18mr1991013wmh.47.1560842633421; 
 Tue, 18 Jun 2019 00:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
 <20190614164324.9427-6-jagan@amarulasolutions.com>
 <20190617114503.pclqsf6bo3ih47nt@flea>
 <CAGb2v66RU=m0iA9VoBiYbake+mDoiiGcd5gGGXvNCBjhY2n+Dw@mail.gmail.com>
 <CAMty3ZA0J+2fSRwX+tS-waJDLMyTOf6UY_1pHjXe0qOk5QuzrQ@mail.gmail.com>
In-Reply-To: <CAMty3ZA0J+2fSRwX+tS-waJDLMyTOf6UY_1pHjXe0qOk5QuzrQ@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 18 Jun 2019 15:23:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v64htYr+iRUnLx0hKkqCtYa0GbzZJEvb-ViyJFAYzU1sig@mail.gmail.com>
Message-ID: <CAGb2v64htYr+iRUnLx0hKkqCtYa0GbzZJEvb-ViyJFAYzU1sig@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v2 5/9] drm/sun4i: tcon_top: Register
 clock gates in probe
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMzoxMiBQTSBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCA2OjMxIFBN
IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBKdW4g
MTcsIDIwMTkgYXQgNzo0NSBQTSBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4u
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6MTM6MjBQ
TSArMDUzMCwgSmFnYW4gVGVraSB3cm90ZToKPiA+ID4gPiBUQ09OIFRPUCBoYXZlIGNsb2NrIGdh
dGVzIGZvciBUVjAsIFRWMSwgZHNpIGFuZCByaWdodAo+ID4gPiA+IG5vdyB0aGVzZSBhcmUgcmVn
aXN0ZXIgZHVyaW5nIGJpbmQgY2FsbC4KPiA+ID4gPgo+ID4gPiA+IE9mIHdoaWNoLCBkc2kgY2xv
Y2sgZ2F0ZSB3b3VsZCByZXF1aXJlZCBkdXJpbmcgRFBIWSBwcm9iZQo+ID4gPiA+IGJ1dCBzYW1l
IGNhbiBtaXNzIHRvIGdldCBzaW5jZSB0Y29uIHRvcCBpcyBub3QgYm91bmQgYXQKPiA+ID4gPiB0
aGF0IHRpbWUuCj4gPiA+ID4KPiA+ID4gPiBUbyBzb2x2ZSwgdGhpcyBjaXJjdWxhciBkZXBlbmRl
bmN5IG1vdmUgdGhlIGNsb2NrIGdhdGUKPiA+ID4gPiByZWdpc3RyYXRpb24gZnJvbSBiaW5kIHRv
IHByb2JlIHNvLXRoYXQgRFBIWSBjYW4gZ2V0IHRoZQo+ID4gPiA+IGRzaSBnYXRlIGNsb2NrIG9u
IHRpbWUuCj4gPiA+Cj4gPiA+IEl0J3Mgbm90IHJlYWxseSBjbGVhciB0byBtZSB3aGF0IHRoZSBj
aXJjdWxhciBkZXBlbmRlbmN5IGlzPwo+ID4gPgo+ID4gPiBpZiB5b3UgaGF2ZSBhIGNoYWluIHRo
YXQgaXM6Cj4gPiA+Cj4gPiA+IHRjb24tdG9wICstPiBEU0kKPiA+ID4gICAgICAgICAgKy0+IEQt
UEhZCj4gPiA+Cj4gPiA+IFRoZXJlJ3Mgbm8gbG9vcCwgcmlnaHQ/Cj4gPgo+ID4gTG9va2luZyBh
dCBob3cgdGhlIERUU0kgcGF0Y2ggc3RydWN0dXJlcyB0aGluZ3MgKHdpdGhvdXQgZ29pbmcgaW50
bwo+ID4gd2hldGhlciBpdCBpcyBjb3JyZWN0IG9yIGFjY3VyYXRlKToKPiA+Cj4gPiBUaGUgRC1Q
SFkgaXMgbm90IHBhcnQgb2YgdGhlIGNvbXBvbmVudCBncmFwaC4gSG93ZXZlciBpdCByZXF1ZXN0
cwo+ID4gdGhlIERTSSBnYXRlIGNsb2NrIGZyb20gdGhlIFRDT04tVE9QLgo+ID4KPiA+IFRoZSBU
Q09OLVRPUCBkcml2ZXIsIGluIGl0cyBjdXJyZW50IGZvcm0sIG9ubHkgcmVnaXN0ZXJzIHRoZSBj
bG9ja3MKPiA+IGl0IHByb3ZpZGVzIGF0IGNvbXBvbmVudCBiaW5kIHRpbWUuIFRodXMgdGhlIEQt
UEhZIGNhbid0IHN1Y2Nlc3NmdWxseQo+ID4gcHJvYmUgdW50aWwgdGhlIFRDT04tVE9QIGhhcyBi
ZWVuIGJvdW5kLgo+ID4KPiA+IFRoZSBEU0kgaW50ZXJmYWNlIHJlcXVpcmVzIHRoZSBELVBIWSB0
byBiaW5kLiBJdCB3aWxsIHJldHVybiAtRVBST0JFX0RFRkVSCj4gPiBpZiBpdCBjYW5ub3QgcmVx
dWVzdCBpdC4gVGhpcyBpbiB0dXJuIGdvZXMgaW50byB0aGUgZXJyb3IgcGF0aCBvZgo+ID4gY29t
cG9uZW50X2JpbmRfYWxsLCB3aGljaCB1bmJpbmRzIGFsbCBwcmV2aW91cyBjb21wb25lbnRzLgo+
ID4KPiA+IFNvIGl0J3MgYWN0dWFsbHkKPiA+Cj4gPiAgICAgRC1QSFkgLT4gVENPTi1UT1AgLT4g
RFNJCj4gPiAgICAgICBeICAgICAgICAgICAgICAgICAgIHwKPiA+ICAgICAgIHwtLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ID4KPiA+IEkndmUgbm90IGNoZWNrZWQsIGJ1dCBJIHN1c3BlY3QgdGhlcmUn
cyBubyBwb3NzaWJpbGl0eSBvZiBoYXZpbmcgb3RoZXIKPiA+IGRyaXZlcnMgcHJvYmUgKHRvIGRl
YWwgd2l0aCBkZWZlcnJlZCBwcm9iaW5nKSB3aXRoaW4gY29tcG9uZW50X2JpbmRfYWxsLgo+ID4g
T3RoZXJ3aXNlIHdlIHNob3VsZG4ndCBydW4gaW50byB0aGlzIHdlaXJkIGNpcmN1bGFyIGRlcGVu
ZGVuY3kgaXNzdWUuCj4gPgo+ID4gU28gdGhlIHF1ZXN0aW9uIGZvciBKYWdhbiBpcyB0aGF0IGlz
IHRoaXMgaW5kZWVkIHRoZSBjYXNlPyBEb2VzIHRoaXMKPiA+IHBhdGNoIHNvbHZlIGl0LCBvciBh
dCBsZWFzdCB3b3JrIGFyb3VuZCBpdC4KPgo+IFllcywgdGhpcyBpcyB3aGF0IEkgd2FzIG1lbnRp
b25lZCBpbiBpbml0aWFsIHZlcnNpb24sIHNpbmNlIHRoZSAiZHNpIgo+IGdhdGUgaW4gdGNvbiB0
b3AgaXMgcmVnaXN0ZXJpbmcgZHVyaW5nIGJpbmQsIHRoZSBkcGh5IG9mIGRzaQo+IGNvbnRyb2xs
ZXIgd29uJ3QgZ2V0IHRoZSBhc3NvY2lhdGVkIGNsb2NrIGZvciAibW9kIiBzbyBpdCBpcyBrZWVw
IG9uCj4gcmV0dXJuaW5nIC1FUFJPQkVfREVGRVIuIEJ5IG1vdmluZyB0aGUgY2xvY2sgZ2F0ZSBy
ZWdpc3RyYXRpb24gdG8KPiBwcm9iZSwgZXZlcnl0aGluZyBib3VuZCBhcyBleHBlY3RlZC4KCkkg
YmVsaWV2ZSB5b3UgZmFpbGVkIHRvIG1lbnRpb24gdGhlIERTSSBibG9jaywgd2hpY2ggaXMgdGhl
IHBhcnQgdGhhdApjb21wbGV0ZXMgdGhlIGNpcmN1bGFyIGRlcGVuZGVuY3kuIERvbid0IGV4cGVj
dCBvdGhlcnMgdG8gaGF2ZSBmdWxsCmF3YXJlbmVzcyBvZiB0aGUgY29udGV4dC4gWW91IGhhdmUg
dG8gcHJvdmlkZSBpdCBpbiB5b3VyIGNvbW1pdCBsb2cuCgpDaGVuWXUKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
