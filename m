Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A78BBF4FA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 16:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9CC89DA6;
	Thu, 26 Sep 2019 14:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B396E89DA6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 14:23:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9C91B25;
 Thu, 26 Sep 2019 16:23:28 +0200 (CEST)
Date: Thu, 26 Sep 2019 17:23:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v9 1/4] dt-bindings: display: xlnx: Add ZynqMP DP
 subsystem bindings
Message-ID: <20190926142318.GB16469@pendragon.ideasonboard.com>
References: <20190925235544.11524-1-laurent.pinchart@ideasonboard.com>
 <20190925235544.11524-2-laurent.pinchart@ideasonboard.com>
 <CAL_JsqL7-33B4CaEX0r5V7PhX9EnghxNfcbZNLT4yo+FLeCOCA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqL7-33B4CaEX0r5V7PhX9EnghxNfcbZNLT4yo+FLeCOCA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1569507808;
 bh=xxT1mkrHMMZ7msB0GFgxJOGGFCvytnN0N4yY+3OwfHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QfB5jKEiuzy0RfRWBPjOMvTQONh6FEoNE+YfT1Ww//e2XTI17PghB/miLlXupeDze
 r1Y8faYdz/zSXqB1BqNqneO6UZp3BY3dn0NkJSq5/EcJeX5Q5lFYpFmT11JEJxMhGh
 wOlstdcEKkAC9QWLTPbinoIuTZFF61hh2LK4aHy0=
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

SGkgUm9iLAoKT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDk6MTU6MDFBTSAtMDUwMCwgUm9iIEhl
cnJpbmcgd3JvdGU6Cj4gT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgNjo1NiBQTSBMYXVyZW50IFBp
bmNoYXJ0IHdyb3RlOgo+ID4KPiA+IEZyb206IEh5dW4gS3dvbiA8aHl1bi5rd29uQHhpbGlueC5j
b20+Cj4gPgo+ID4gVGhlIGJpbmRpbmdzIGRlc2NyaWJlIHRoZSBaeW5xTVAgRFAgc3Vic3lzdGVt
LiBUaGV5IGRvbid0IHN1cHBvcnQgdGhlCj4gPiBpbnRlcmZhY2Ugd2l0aCB0aGUgcHJvZ3JhbW1h
YmxlIGxvZ2ljIChGUEdBKSBvciBhdWRpbyB5ZXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSHl1
biBLd29uIDxoeXVuLmt3b25AeGlsaW54LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQg
UGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiA+IC0tLQo+ID4g
Q2hhbmdlcyBzaW5jZSB2ODoKPiA+Cj4gPiAtIENvbnZlcnQgdG8geWFtbAo+ID4gLSBSZW5hbWUg
YWNsayB0byBkcF9hcGJfY2xrCj4gCj4gL2J1aWxkcy9yb2JoZXJyaW5nL2xpbnV4LWR0LXJldmll
dy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS94bG54L3hsbngsenlu
cW1wLWRwc3ViLmV4YW1wbGUuZHQueWFtbDoKPiBkaXNwbGF5QGZkNGEwMDAwOiBjbG9jay1uYW1l
czoyOiAnZHBfdnRjX3BpeGVsX2Nsa19pbicgd2FzIGV4cGVjdGVkCgpJZiB5b3UgYWxsb3cgbWUg
dG8gc3RlYWwgYSBiaXQgb2YgeW91ciBicmFpbiB0aW1lLCBjb3VsZCB5b3UgaGVscCBtZQpleHBy
ZXNzaW5nIHRoZSBjbG9ja3MgY29uc3RyYWludCA/CgogIGNsb2NrczoKICAgIGRlc2NyaXB0aW9u
OgogICAgICBUaGUgQVhJIGNsb2NrIGFuZCBhdCBsZWFzdCBvbmUgdmlkZW8gY2xvY2sgYXJlIG1h
bmRhdG9yeSwgdGhlIGF1ZGlvIGNsb2NrCiAgICAgIG9wdGlvbmFsLgogICAgbWluSXRlbXM6IDIK
ICAgIG1heEl0ZW1zOiA0CiAgICBpdGVtczoKICAgICAgLSBkZXNjcmlwdGlvbjogQVhJIGNsb2Nr
CiAgICAgIC0gZGVzY3JpcHRpb246IEF1ZGlvIGNsb2NrCiAgICAgIC0gZGVzY3JpcHRpb246IE5v
bi1saXZlIHZpZGVvIGNsb2NrIChmcm9tIFByb2Nlc3NpbmcgU3lzdGVtKQogICAgICAtIGRlc2Ny
aXB0aW9uOiBMaXZlIHZpZGVvIGNsb2NrIChmcm9tIFByb2dyYW1tYWJsZSBMb2dpYykKICBjbG9j
ay1uYW1lczoKICAgIG1pbkl0ZW1zOiAyCiAgICBtYXhJdGVtczogNAogICAgaXRlbXM6CiAgICAg
IC0gY29uc3Q6IGRwX2FwYl9jbGsKICAgICAgLSBjb25zdDogZHBfYXVkX2NsawogICAgICAtIGNv
bnN0OiBkcF92dGNfcGl4ZWxfY2xrX2luCiAgICAgIC0gY29uc3Q6IGRwX2xpdmVfdmlkZW9faW5f
Y2xrCgpkcF9hcGJfY2xrIGlzIHJlcXVpcmVkLCBkcF9hdWRfY2xrIGlzIG9wdGlvbmFsLCBhbmQg
YXQgbGVhc3Qgb25lIG9mCmRwX3Z0Y19waXhlbF9jbGtfaW4gYW5kIGRwX2xpdmVfdmlkZW9faW5f
Y2xrIGlzIHJlcXVpcmVkLgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
