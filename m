Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EED9BF555
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 16:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C880D6ECC8;
	Thu, 26 Sep 2019 14:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B7E6ECC8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 14:57:42 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2DC7F222C9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 14:57:42 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id o12so3244199qtf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 07:57:42 -0700 (PDT)
X-Gm-Message-State: APjAAAVHTc4Pxyg6DbTCHERa9gJVPzCY2DXlL2s5rUTvV7SCeEqTdNf3
 ZfY8cgmF9flXas4Pbnmfr/oYRgIQ/tJ7FROHqQ==
X-Google-Smtp-Source: APXvYqwng6xJNMaVQ11CLDTXoegOv2YK79aD1B3o3PKlaWWmTkbsmvSCET7NFoeLtFMLlnb5Sr+N4pKMAQC26UtfnsY=
X-Received: by 2002:a0c:8a6d:: with SMTP id 42mr3044683qvu.138.1569509861242; 
 Thu, 26 Sep 2019 07:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190925235544.11524-1-laurent.pinchart@ideasonboard.com>
 <20190925235544.11524-2-laurent.pinchart@ideasonboard.com>
 <CAL_JsqL7-33B4CaEX0r5V7PhX9EnghxNfcbZNLT4yo+FLeCOCA@mail.gmail.com>
 <20190926142318.GB16469@pendragon.ideasonboard.com>
In-Reply-To: <20190926142318.GB16469@pendragon.ideasonboard.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 26 Sep 2019 09:57:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJTPzXkoyhTwWtc_Rsb5tkY-kggXhJj67EfcYgEk5tq=A@mail.gmail.com>
Message-ID: <CAL_JsqJTPzXkoyhTwWtc_Rsb5tkY-kggXhJj67EfcYgEk5tq=A@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] dt-bindings: display: xlnx: Add ZynqMP DP
 subsystem bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569509862;
 bh=P73T2XmcvlRT8FEegUID9GiJh2jR4RX/vgDGrtYwB6o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b/s7hu4RBqtzgzUnbDUnsjU23RDdlZ6SfKfrizaS+WTqmw1t6C7udsMkxJS7lqVjD
 vAfU7Ex11Q9emXbCgB8WX2YxQ1lxNamAGyjZVRUzhL1uRDVisJWBLAW4oVjhEUXufk
 S+OLdkFoKMoIrNR6w/+klgOs3Nl3zSIhKD5vwihY=
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
Cc: devicetree@vger.kernel.org, Hyun Kwon <hyun.kwon@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgOToyMyBBTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4gT24gVGh1
LCBTZXAgMjYsIDIwMTkgYXQgMDk6MTU6MDFBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4g
PiBPbiBXZWQsIFNlcCAyNSwgMjAxOSBhdCA2OjU2IFBNIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6
Cj4gPiA+Cj4gPiA+IEZyb206IEh5dW4gS3dvbiA8aHl1bi5rd29uQHhpbGlueC5jb20+Cj4gPiA+
Cj4gPiA+IFRoZSBiaW5kaW5ncyBkZXNjcmliZSB0aGUgWnlucU1QIERQIHN1YnN5c3RlbS4gVGhl
eSBkb24ndCBzdXBwb3J0IHRoZQo+ID4gPiBpbnRlcmZhY2Ugd2l0aCB0aGUgcHJvZ3JhbW1hYmxl
IGxvZ2ljIChGUEdBKSBvciBhdWRpbyB5ZXQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEh5
dW4gS3dvbiA8aHl1bi5rd29uQHhpbGlueC5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiA+ID4gLS0t
Cj4gPiA+IENoYW5nZXMgc2luY2Ugdjg6Cj4gPiA+Cj4gPiA+IC0gQ29udmVydCB0byB5YW1sCj4g
PiA+IC0gUmVuYW1lIGFjbGsgdG8gZHBfYXBiX2Nsawo+ID4KPiA+IC9idWlsZHMvcm9iaGVycmlu
Zy9saW51eC1kdC1yZXZpZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkveGxueC94bG54LHp5bnFtcC1kcHN1Yi5leGFtcGxlLmR0LnlhbWw6Cj4gPiBkaXNwbGF5QGZk
NGEwMDAwOiBjbG9jay1uYW1lczoyOiAnZHBfdnRjX3BpeGVsX2Nsa19pbicgd2FzIGV4cGVjdGVk
Cj4KPiBJZiB5b3UgYWxsb3cgbWUgdG8gc3RlYWwgYSBiaXQgb2YgeW91ciBicmFpbiB0aW1lLCBj
b3VsZCB5b3UgaGVscCBtZQo+IGV4cHJlc3NpbmcgdGhlIGNsb2NrcyBjb25zdHJhaW50ID8KPgo+
ICAgY2xvY2tzOgo+ICAgICBkZXNjcmlwdGlvbjoKPiAgICAgICBUaGUgQVhJIGNsb2NrIGFuZCBh
dCBsZWFzdCBvbmUgdmlkZW8gY2xvY2sgYXJlIG1hbmRhdG9yeSwgdGhlIGF1ZGlvIGNsb2NrCj4g
ICAgICAgb3B0aW9uYWwuCj4gICAgIG1pbkl0ZW1zOiAyCj4gICAgIG1heEl0ZW1zOiA0Cj4gICAg
IGl0ZW1zOgo+ICAgICAgIC0gZGVzY3JpcHRpb246IEFYSSBjbG9jawo+ICAgICAgIC0gZGVzY3Jp
cHRpb246IEF1ZGlvIGNsb2NrCj4gICAgICAgLSBkZXNjcmlwdGlvbjogTm9uLWxpdmUgdmlkZW8g
Y2xvY2sgKGZyb20gUHJvY2Vzc2luZyBTeXN0ZW0pCj4gICAgICAgLSBkZXNjcmlwdGlvbjogTGl2
ZSB2aWRlbyBjbG9jayAoZnJvbSBQcm9ncmFtbWFibGUgTG9naWMpCj4gICBjbG9jay1uYW1lczoK
PiAgICAgbWluSXRlbXM6IDIKPiAgICAgbWF4SXRlbXM6IDQKPiAgICAgaXRlbXM6Cj4gICAgICAg
LSBjb25zdDogZHBfYXBiX2Nsawo+ICAgICAgIC0gY29uc3Q6IGRwX2F1ZF9jbGsKPiAgICAgICAt
IGNvbnN0OiBkcF92dGNfcGl4ZWxfY2xrX2luCj4gICAgICAgLSBjb25zdDogZHBfbGl2ZV92aWRl
b19pbl9jbGsKPgo+IGRwX2FwYl9jbGsgaXMgcmVxdWlyZWQsIGRwX2F1ZF9jbGsgaXMgb3B0aW9u
YWwsIGFuZCBhdCBsZWFzdCBvbmUgb2YKPiBkcF92dGNfcGl4ZWxfY2xrX2luIGFuZCBkcF9saXZl
X3ZpZGVvX2luX2NsayBpcyByZXF1aXJlZC4KCkknbSBob3BpbmcgcGVvcGxlJ3MgaW5hYmlsaXR5
IHRvIGV4cHJlc3MgdGhlIHNjaGVtYSB3aWxsIHByZXZlbnQKY29tcGxpY2F0ZWQgb25lcyBsaWtl
IHRoaXMgaW4gdGhlIGZpcnN0IHBsYWNlLi4uCgpjbG9jay1uYW1lczoKICBvbmVPZjoKICAgIC0g
bWluSXRlbXM6IDMKICAgICAgbWF4SXRlbXM6IDQKICAgICAgaXRlbXM6CiAgICAgICAgLSBjb25z
dDogZHBfYXBiX2NsawogICAgICAgIC0gY29uc3Q6IGRwX2F1ZF9jbGsKICAgICAgICAtIGVudW06
IFsgZHBfdnRjX3BpeGVsX2Nsa19pbiwgZHBfbGl2ZV92aWRlb19pbl9jbGsgXQogICAgICAgIC0g
ZW51bTogWyBkcF92dGNfcGl4ZWxfY2xrX2luLCBkcF9saXZlX3ZpZGVvX2luX2NsayBdCiAgICAt
IG1pbkl0ZW1zOiAyCiAgICAgIG1heEl0ZW1zOiAzCiAgICAgIGl0ZW1zOgogICAgICAgIC0gY29u
c3Q6IGRwX2FwYl9jbGsKICAgICAgICAtIGVudW06IFsgZHBfdnRjX3BpeGVsX2Nsa19pbiwgZHBf
bGl2ZV92aWRlb19pbl9jbGsgXQogICAgICAgIC0gZW51bTogWyBkcF92dGNfcGl4ZWxfY2xrX2lu
LCBkcF9saXZlX3ZpZGVvX2luX2NsayBdCgpTdHJpY3RseSBzcGVha2luZywgdGhhdCBsZWF2ZXMg
aXRlbXMgY2xvY2tzIHdyb25nLCBidXQgJ2Rlc2NyaXB0aW9uJwpkb2Vzbid0IGRvIGFueXRoaW5n
LiBTbyBJJ2QganVzdCBsZWF2ZSBpdCBhcyBpcy4KClJvYgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
