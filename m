Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C95D95A67
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 10:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F28389F24;
	Tue, 20 Aug 2019 08:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7336589F47
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 08:53:33 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w5so5433298edl.8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=rFIJ9CTcB3zRGvI8JWfGMI7wV/Ot4grZu8ZTczPSunk=;
 b=BEw/qkwC2DY8bvaGvL96kzSX6GzDUeNnrSRLscnMhN3VSLvvBihoThD9c4DVdCCqKZ
 H8pKwnkKZ8YriW6kcyI+EujCMkt3DYIhVzaWuPCj1NfQUuElqFLrOCxyfQ8V1MBXOy/H
 7wVPDleHmziX2w6kZxldgHt/g2e1U/vh62FJ9zoKW+WoArS+pTCkb12i0CcFABbZ2L2n
 8bMYHPGsHdob6EBfDwF5LoXePQ6cLnfQBwqn3ckCuoo6i9vSNRHTzd3Fq+r6bdfCZZmu
 dbWk5kGW4WJkMyHgi4z+WQgbAuwyduuwd8dA2lxw0jFUprMduQFepEvjM5Mxo3MqA2mY
 J8hA==
X-Gm-Message-State: APjAAAVhoD/Nt4ZUVa7R/dG6HuCc2pO66VGQw2xIur8EVUZof5prIdbC
 g4PcqtoD3YB7Z2buQZ329edelA==
X-Google-Smtp-Source: APXvYqxaCnyav32Ke+uW+TN66XMsXgz8+9CXwxRl1NuQkfHVVRBs3AbB+FY2yTv6GNv7ug1zoaKxlw==
X-Received: by 2002:aa7:db12:: with SMTP id t18mr24139903eds.266.1566291212120; 
 Tue, 20 Aug 2019 01:53:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id va28sm2482422ejb.36.2019.08.20.01.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:53:31 -0700 (PDT)
Date: Tue, 20 Aug 2019 10:53:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 2/2] drm: bridge: adv7511: Add support for ADV7535
Message-ID: <20190820085329.GC11147@phenom.ffwll.local>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>,
 "Togorean, Bogdan" <Bogdan.Togorean@analog.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "allison@lohutok.net" <allison@lohutok.net>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "matt.redfearn@thinci.com" <matt.redfearn@thinci.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20190809141611.9927-1-bogdan.togorean@analog.com>
 <20190809141611.9927-3-bogdan.togorean@analog.com>
 <20190809152510.GA23265@ravnborg.org>
 <c99cfbd3dc45bb02618e7653c33022f3553e1cce.camel@analog.com>
 <20190819104616.GA15890@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190819104616.GA15890@ravnborg.org>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=rFIJ9CTcB3zRGvI8JWfGMI7wV/Ot4grZu8ZTczPSunk=;
 b=TEAP3bpzzRE8sLuo6bjthjn4uBQj17oZOmXs9NUKZDzQmDPysXh9j1Sc7lAwe+WBm1
 iz2asO2EefZ8HNbs7NP3PUjo29tnfB6SGl0RQsE9aypaHsu2BDLeZRHHpCrQc5W8r6ku
 AYgxr5zTTqajJ0NunF6ZRP2PB9VMhsdfiQyio=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "Togorean,
 Bogdan" <Bogdan.Togorean@analog.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "matt.redfearn@thinci.com" <matt.redfearn@thinci.com>,
 "allison@lohutok.net" <allison@lohutok.net>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMTI6NDY6MTZQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIEJvZ2Rhbi4KPiAKPiA+ID4gPiAgCQlhZHY3NTMzX2RldGFjaF9kc2koYWR2NzUx
MSk7Cj4gPiA+ID4gIAlpMmNfdW5yZWdpc3Rlcl9kZXZpY2UoYWR2NzUxMS0+aTJjX2NlYyk7Cj4g
PiA+ID4gIAlpZiAoYWR2NzUxMS0+Y2VjX2NsaykKPiA+ID4gPiBAQCAtMTI2Niw4ICsxMjc4LDkg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkCj4gPiA+ID4gYWR2NzUxMV9pMmNf
aWRzW10gPSB7Cj4gPiA+ID4gIAl7ICJhZHY3NTExIiwgQURWNzUxMSB9LAo+ID4gPiA+ICAJeyAi
YWR2NzUxMXciLCBBRFY3NTExIH0sCj4gPiA+ID4gIAl7ICJhZHY3NTEzIiwgQURWNzUxMSB9LAo+
ID4gPiA+IC0jaWZkZWYgQ09ORklHX0RSTV9JMkNfQURWNzUzMwo+ID4gPiA+ICsjaWZkZWYgQ09O
RklHX0RSTV9JMkNfQURWNzUzeAo+ID4gPiA+ICAJeyAiYWR2NzUzMyIsIEFEVjc1MzMgfSwKPiA+
ID4gPiArCXsgImFkdjc1MzUiLCBBRFY3NTM1IH0sCj4gPiA+ID4gICNlbmRpZgo+ID4gPiAKPiA+
ID4gVGhpcyBpZmRlZiBtYXkgbm90IGJlIG5lZWRlZD8/Cj4gPiA+IElmIHdlIGRpZCBub3QgZ2V0
IHRoaXMgdHlwZSB3ZSB3aWxsIG5vdCBsb29rIGl0IHVwLgo+ID4gQnV0IGlmIHdlIGhhdmUgZGVm
aW5lZCBpbiBEVCBhZHY3NTMzLzUgZGV2aWNlIGJ1dAo+ID4gQ09ORklHX0RSTV9JMkNfQURWNzUz
eCBub3Qgc2VsZWN0ZWQgcHJvYmUgd2lsbCBmYWlsIHdpdGggRU5PREVWLiBUaGF0Cj4gPiB3b3Vs
ZCBiZSBvaz8KPiAKPiBXaGF0IGRvIHdlIGdhaW4gZnJvbSB0aGlzIGNvbXBsZXhpdHkgaW4gdGhl
IGVuZC4KPiBXaHkgbm90IGxldCB0aGUgZHJpdmVyIGFsd2F5cyBzdXBwb3J0IGFsbCB2YXJpYW50
cy4KPiAKPiBJZiB0aGlzIHJlc3VsdCBpbiBhIHNpbXBsZXIgZHJpdmVyLCBhbmQgbGVzcyBjaG9p
Y2VzIGluIEtjb25maWcKPiB0aGVuIGl0IGlzIGEgd2luLXdpbi4KClllYWggaW4gZ2VuZXJhbCB3
ZSBkb24ndCBLY29uZmlnIHdpdGhpbiBkcml2ZXJzIGluIGRybSB0byBkaXNhYmxlIHNwZWNpZmlj
CmNvZGUtcGF0aHMuIEl0J3Mgbm90IHdvcnRoIHRoZSBwYWluLgotRGFuaWVsCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
