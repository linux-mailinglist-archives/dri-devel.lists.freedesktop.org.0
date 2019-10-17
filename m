Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E6BDB04A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 16:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47236EAB2;
	Thu, 17 Oct 2019 14:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D451D6EAB2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 14:42:38 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id c25so3257071iot.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 07:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yZfbOZSDn+GBucwbwmrlt57XdpVLll7ReX3tKoRiDII=;
 b=PM/MRJsMJ4GM04lXJ4yQaMiRfldcWksFEKPRhY7rue7WqlATeeI+wkhdhJhs37F2iT
 N+x/rgJLr3KGLFH/C1iXsTgtPwI4/gogDyo7nGPI4P8VNoDfrdMy/Ezm9yHWoEiLu7NY
 kmrrGPp2YBl2W+P8KacM0jkNpuPkiCfiFQ+2sPR/TTabnLwk36ktWY/xPIUpnZH9z6P7
 mOXwsjkhnJhg2w7UVltyBsWOsCLOBGuyDIY0shmJxdaeVvsKzarNxkJCBWCy3yFbbGAf
 VCpKhny8O9CcqdOIs7iemOE38zMJ9hHN3HIUqcw+m2d91lOmvMfU9j2RTXxJTeyIZBNj
 vHIg==
X-Gm-Message-State: APjAAAWKkALCY6ICmAdGbteUj0ISzyYZ3HKG3ZLqxHmGmaeLMqLvAtiZ
 fSRFGxhIwl78o3i2D5//LBxM+96twvc/hHqK7EN6nVDy
X-Google-Smtp-Source: APXvYqxLMVhS21hkfBuFNR8qm6HuMhexXhE0GwnhHg2kroaMYxz+FIVQK8husib62kCR6sWcwBK85nJh3Drpu3O6VnU=
X-Received: by 2002:a5d:83c1:: with SMTP id u1mr3466467ior.78.1571323357719;
 Thu, 17 Oct 2019 07:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191016135147.7743-1-aford173@gmail.com>
 <20191016135147.7743-2-aford173@gmail.com>
 <20191016144018.GG5175@pendragon.ideasonboard.com>
 <CAHCN7xJhHHoia_o4rb0VgvCP71X94Pvem684F2quMijNNpNxVA@mail.gmail.com>
 <20191017143738.GA10960@bogus>
In-Reply-To: <20191017143738.GA10960@bogus>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 17 Oct 2019 09:42:25 -0500
Message-ID: <CAHCN7xJidCBmKL+BTWi_ZmiFyq-bjzzaJBYkQPyUBT+uKJVdaA@mail.gmail.com>
Subject: Re: [PATCH V5 2/3] dt-bindings: Add Logic PD Type 28 display panel
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yZfbOZSDn+GBucwbwmrlt57XdpVLll7ReX3tKoRiDII=;
 b=TJ7k3wmZkSmZRGwxzXl8ni5apLcRVgyHgXlVZmTN853xTgCywU/jS0DRpyulXktKFA
 Wp5w0u7G+QgTFBqleHVpdPHvgKQw8R/XFCh+6Aaryw5X//uTOMzLki38ytR1UJuFoq+C
 3g0hW5wewWMw4tgNkkLZTLKUqgtUXoi66j6vHQn1vIu6wOChW22lKO84gWBbDo/wWpe2
 1mdY3E1meYerma5fd4CpxB9XcYkjqRuqVXmcn7SoTH+6V5tFUbn095naw9fDWlnv3y49
 nS/tHvzPsGSsWryqvHENpkEL2d0Doru2/Z10qEJnaJN2n7qglLiQ1KcLwGkPhcs0YyMd
 /sqQ==
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

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgOTozNyBBTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDA5OjU1OjExQU0gLTA1MDAs
IEFkYW0gRm9yZCB3cm90ZToKPiA+IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDk6NDAgQU0gTGF1
cmVudCBQaW5jaGFydAo+ID4gPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IEhpIEFkYW0sCj4gPiA+Cj4gPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHBh
dGNoLgo+ID4gPgo+ID4gPiBPbiBXZWQsIE9jdCAxNiwgMjAxOSBhdCAwODo1MTo0NkFNIC0wNTAw
LCBBZGFtIEZvcmQgd3JvdGU6Cj4gPiA+ID4gVGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50YXRpb24g
b2YgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBXVkdBIHBhbmVsCj4gPiA+ID4gTG9naWMg
UEQgVHlwZSAyOCBkaXNwbGF5Lgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQWRhbSBG
b3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gVjU6ICBSZXBsYWNl
IEdQSU9fQUNUSVZFX0hJR0ggd2l0aCAwIHRvIGZpeCBtYWtlIGR0X2JpbmRpbmdfY2hlY2sgLWsK
PiA+ID4gPiBWNDogIFVwZGF0ZSBwZXIgUm9iIEgncyBzdWdnZXN0aW9ucyBhbmQgY29weSBvdGhl
ciBwYW5lbCB5YW1sIGV4YW1wbGUgZnJvbSA1LjQtcmMxCj4gPiA+ID4gVjM6ICBDb3JyZWN0IGJ1
aWxkIGVycm9ycyBmcm9tICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snCj4gPiA+ID4gVjI6ICBVc2Ug
WUFNTCBpbnN0ZWFkIG9mIFRYVCBmb3IgYmluZGluZwo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2xvZ2lj
cGQsdHlwZTI4LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9sb2dpY3BkLHR5cGUyOC55YW1sCj4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjI4MzQyODdiOGQ4OAo+ID4gPiA+IC0tLSAvZGV2
L251bGwKPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9sb2dpY3BkLHR5cGUyOC55YW1sCj4gPiA+ID4gQEAgLTAsMCArMSw0MiBAQAo+
ID4gPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiA+ID4gKyVZQU1M
IDEuMgo+ID4gPiA+ICstLS0KPiA+ID4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2No
ZW1hcy9kaXNwbGF5L3BhbmVsL2xvZ2ljcGQsdHlwZTI4LnlhbWwjCj4gPiA+ID4gKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gPiA+ICsK
PiA+ID4gPiArdGl0bGU6IExvZ2ljIFBEIFR5cGUgMjggNC4zIiBXUVZHQSBURlQgTENEIHBhbmVs
Cj4gPiA+ID4gKwo+ID4gPiA+ICttYWludGFpbmVyczoKPiA+ID4gPiArICAtIEFkYW0gRm9yZCA8
YWZvcmQxNzNAZ21haWwuY29tPgo+ID4gPiA+ICsKPiA+ID4gPiArYWxsT2Y6Cj4gPiA+ID4gKyAg
LSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMKPiA+ID4gPiArCj4gPiA+ID4gK3Byb3BlcnRpZXM6
Cj4gPiA+ID4gKyAgY29tcGF0aWJsZToKPiA+ID4gPiArICAgIGNvbnN0OiBsb2dpY3BkLHR5cGUy
OAo+ID4gPiA+ICsKPiA+ID4gPiArICBwb3dlci1zdXBwbHk6IHRydWUKPiA+ID4gPiArICBlbmFi
bGUtZ3Bpb3M6IHRydWUKPiA+ID4gPiArICBiYWNrbGlnaHQ6IHRydWUKPiA+ID4gPiArICBwb3J0
OiB0cnVlCj4gPiA+ID4gKwo+ID4gPiA+ICtyZXF1aXJlZDoKPiA+ID4gPiArICAtIGNvbXBhdGli
bGUKPiA+ID4KPiA+ID4gU2hvdWxkIHRoZSBwb3J0IGJlIHJlcXVpcmVkIHRvbyA/IEFwYXJ0IGZy
b20gdGhhdCwKPiA+Cj4gPiBJIHN1cHBvc2VkIHRoYXQncyB0cnVlLCBidXQgSSB1c2VkIGFtcGly
ZSxhbS00ODAyNzJoM3RtcXctdDAxaC55YW1sIGFzCj4gPiB0aGUgZXhhbXBsZSwgYW5kIGl0IGRv
ZXNuJ3QgbGlzdCBpdCBhcyBhIHJlcXVpcmVkIGl0ZW0uCj4gPiBJcyB0aGVyZSBhbnl0aGluZyBl
bHNlIEkgbmVlZCB0byBhZGRyZXNzPyAgSSBmZWVsIGxpa2UgSSdtIHRyeWluZyB0bwo+ID4gaGl0
IGEgbW92aW5nIHRhcmdldC4KPgo+ICdwb3J0JyBjYW4gYmUgb21pdHRlZCBiZWNhdXNlIHRoZSBw
YW5lbCBjYW4gYmUgYSBjaGlsZCBub2RlIG9mCj4gdGhlIGRpc3BsYXkgY29udHJvbGxlciBpbnN0
ZWFkLiBUaGF0J3MgZGVjaWRlZCBieSB0aGUgZGlzcGxheSBjb250cm9sbGVyCj4gYmluZGluZywg
bm90IHRoZSBwYW5lbCBiaW5kaW5nLgo+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+CgpUaGFuayB5b3UuICBTb3JyeSBpdCB0b29rIGEgd2hpbGUgdG8gZ2V0IHRo
ZXJlLgoKYWRhbQo+Cj4gUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
