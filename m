Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3710CE9293
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 23:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC246EC62;
	Tue, 29 Oct 2019 22:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9AE6EC62
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 22:06:22 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id s5so208819oie.10
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 15:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vfqb9iayrD7twK1Yov7mjax5KVdTInGQjQseAedA/Nc=;
 b=HETCjGIraHTrXaGpwRpaD+tQ2Mr4Jh3yvaeYNQm7PkaDHQFzcLa/6pfVi2o2gZ0W8m
 /D0LWHTsMIp1ehc2uR+4hdV9T2O7ZupVk/B7VgB9j1F5qV0c5uP5r4kuSkLLz5NUIp1r
 3YaWle9bq2yz+PuArwErLxdCS4fqw43GQ0zrx7+CBNaevrbDaNvGaJJlnjqMPYVXahlt
 oJNFlEQ5CIELbybuaqxCJPyRzdxYjoO2krSmM5Qzysl41+PaC8wadYtjC5t2sTF3qIRT
 I95od01o2dFL3JJBplKn5Er7b0CITdYcGUlDZkWYAUvqrAcP3Ti5Sz+K3nQP71GbA1Y0
 z97A==
X-Gm-Message-State: APjAAAXlt9N1lOsySNq+sCQd8r8AMyraVW8LTX66MR+Z919i97TZVA+F
 lZOCI+zA8KDAnMBcJb9V0Q==
X-Google-Smtp-Source: APXvYqxwuc2I1yytREdN+EWBcO63dl9Z8r2Iv+fVZtPjjtDikI1+tT3JcyRAJk+RU3PXiiEyUtzOXg==
X-Received: by 2002:aca:e104:: with SMTP id y4mr6256504oig.117.1572386781514; 
 Tue, 29 Oct 2019 15:06:21 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h3sm90777otj.64.2019.10.29.15.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 15:06:20 -0700 (PDT)
Date: Tue, 29 Oct 2019 17:06:20 -0500
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v11 1/7] dt-bindings: sun6i-dsi: Document A64 MIPI-DSI
 controller
Message-ID: <20191029220620.GA14316@bogus>
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
 <20191025175625.8011-2-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025175625.8011-2-jagan@amarulasolutions.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMTE6MjY6MTlQTSArMDUzMCwgSmFnYW4gVGVraSB3cm90
ZToKPiBUaGUgTUlQSSBEU0kgY29udHJvbGxlciBpbiBBbGx3aW5uZXIgQTY0IGlzIHNpbWlsYXIg
dG8gQTMzLgo+IAo+IEJ1dCB1bmxpa2UgQTMzLCBBNjQgZG9lc24ndCBoYXZlIERTSV9TQ0xLIGdh
dGluZyBzbyBpdCBpcyB2YWxpZAo+IHRvIGhhdmUgc2VwYXJhdGUgY29tcGF0aWJsZSBmb3IgQTY0
IG9uIHRoZSBzYW1lIGRyaXZlci4KPiAKPiBEU0lfU0NMSyB1c2VzIG1vZCBjbG9jay1uYW1lcyBv
biBkdC1iaW5kaW5ncywgc28gdGhlIHNhbWUKPiBpcyBub3QgcmVxdWlyZWQgZm9yIEE2NC4KPiAK
PiBPbiB0aGF0IG5vdGUKPiAtIEE2NCByZXF1aXJlIG1pbmltdW0gb2YgMSBjbG9jayBsaWtlIHRo
ZSBidXMgY2xvY2sKPiAtIEEzMyByZXF1aXJlIG1pbmltdW0gb2YgMiBjbG9ja3MgbGlrZSBib3Ro
IGJ1cywgbW9kIGNsb2Nrcwo+IAo+IFNvLCB1cGRhdGUgZHQtYmluZGluZ3Mgc28tdGhhdCBpdCBj
YW4gZG9jdW1lbnQgYm90aCBBMzMsCj4gQTY0IGJpbmRpbmdzIHJlcXVpcmVtZW50cy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAt
LS0KPiAgLi4uL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRzaS55YW1sIHwgMjAg
KysrKysrKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRzaS55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjZpLWEz
MS1taXBpLWRzaS55YW1sCj4gaW5kZXggZGFmYzA5ODBjNGZhLi4yYjcwMTZjYTM4MmMgMTAwNjQ0
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYWxsd2lu
bmVyLHN1bjZpLWEzMS1taXBpLWRzaS55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRzaS55YW1sCj4g
QEAgLTE1LDcgKzE1LDkgQEAgcHJvcGVydGllczoKPiAgICAiI3NpemUtY2VsbHMiOiB0cnVlCj4g
IAo+ICAgIGNvbXBhdGlibGU6Cj4gLSAgICBjb25zdDogYWxsd2lubmVyLHN1bjZpLWEzMS1taXBp
LWRzaQo+ICsgICAgb25lT2Y6Cj4gKyAgICAgIC0gY29uc3Q6IGFsbHdpbm5lcixzdW42aS1hMzEt
bWlwaS1kc2kKPiArICAgICAgLSBjb25zdDogYWxsd2lubmVyLHN1bjUwaS1hNjQtbWlwaS1kc2kK
ClVzZSAnZW51bScgaW5zdGVhZCBvZiBvbmVPZitjb25zdC4KCldpdGggdGhhdCBmaXhlZCwKClJl
dmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKPiAgCj4gICAgcmVnOgo+
ICAgICAgbWF4SXRlbXM6IDEKPiBAQCAtMjQsNiArMjYsOCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAg
bWF4SXRlbXM6IDEKPiAgCj4gICAgY2xvY2tzOgo+ICsgICAgbWluSXRlbXM6IDEKPiArICAgIG1h
eEl0ZW1zOiAyCj4gICAgICBpdGVtczoKPiAgICAgICAgLSBkZXNjcmlwdGlvbjogQnVzIENsb2Nr
Cj4gICAgICAgIC0gZGVzY3JpcHRpb246IE1vZHVsZSBDbG9jawo+IEBAIC02MywxMyArNjcsMjUg
QEAgcmVxdWlyZWQ6Cj4gICAgLSByZWcKPiAgICAtIGludGVycnVwdHMKPiAgICAtIGNsb2Nrcwo+
IC0gIC0gY2xvY2stbmFtZXMKPiAgICAtIHBoeXMKPiAgICAtIHBoeS1uYW1lcwo+ICAgIC0gcmVz
ZXRzCj4gICAgLSB2Y2MtZHNpLXN1cHBseQo+ICAgIC0gcG9ydAo+ICAKPiArYWxsT2Y6Cj4gKyAg
LSBpZjoKPiArICAgICAgcHJvcGVydGllczoKPiArICAgICAgICAgY29tcGF0aWJsZToKPiArICAg
ICAgICAgICBjb250YWluczoKPiArICAgICAgICAgICAgIGNvbnN0OiBhbGx3aW5uZXIsc3VuNmkt
YTMxLW1pcGktZHNpCj4gKyAgICAgIHRoZW46Cj4gKyAgICAgICAgcHJvcGVydGllczoKPiArICAg
ICAgICAgIGNsb2NrczoKPiArICAgICAgICAgICAgbWluSXRlbXM6IDIKPiArICAgICAgICByZXF1
aXJlZDoKPiArICAgICAgICAgIC0gY2xvY2stbmFtZXMKPiArCj4gIGFkZGl0aW9uYWxQcm9wZXJ0
aWVzOiBmYWxzZQo+ICAKPiAgZXhhbXBsZXM6Cj4gLS0gCj4gMi4xOC4wLjMyMS5nZmZjNmZhMGUz
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
