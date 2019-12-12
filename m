Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1488611C866
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139156ECB3;
	Thu, 12 Dec 2019 08:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60ED6ECB1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 08:45:58 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p9so1397422wmc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 00:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=ysjj9kjjoSIsFGYFqXCoqpOZyZtCGjaHakYJs3J9tu0=;
 b=N1PqWi95BtpSJzjsz/imsAalWGW70TyGbewoErGOeVYBvmj9ihXbpRHlxXIvaeIdlR
 nHD/dzoQNgA60wueuAOGCb/L+hXKeY7w9KTGtJUq1VSy6T2dfe1tL7lOYkrcG1ddn4gw
 hOBTY06mszGcg9kdbiouVhtIe1PYsdzXkRvp+rXKt6w0STrNRVaF/lGfCGKAb1pV+Z1Y
 yHpNGXQ3JIoX2JaEcuk5Wp/anUnYiXNSkvJX2qXWnHcutx24QNBY/QFaNHIMyG4LFKSE
 LOOR99KWBWA/Ukr08iOkTK5nE9MvbxjarBOjT/6rEux4i6ppKrzbd2Cynkl7BHjOIzlm
 mdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ysjj9kjjoSIsFGYFqXCoqpOZyZtCGjaHakYJs3J9tu0=;
 b=KoMdQjSHdNwxSbCNAMs9Vecb/Ok9rYxdBVq0G9ZyZXBvBF0Gel/B211qkzTEvaUptb
 D00BNADGutxO3VRz+oNt4EDWEhNXVr4H/atwy51pgh1JQJdlG+z1vkuacN12KhQaafxc
 kQWYufL473+yg83vOdewyj2FQmhxVkv7Dj4BB/X76NU9nWbvkVDmgqTzaA41RGEUYNBu
 rSEuE/WRZIkIxWFYg+qR7xkUN7aj9XIJD70TnLLDvCLEdGEHL+1IlnQAcgABO93QyL+E
 J5Gl1v9gdULsxYWTndt7FNLTkUiWrJd4P8D9VBcX/bctGUwiQwk5+zrGUVCq4ZXPHKzk
 AkbQ==
X-Gm-Message-State: APjAAAV7pHVMENBmZpW6q+91rbA4l3qY3vxudsTxXn+OYesVli4P4mk4
 HIRDXAFheR4zjEUlCsuhYzWEpQ==
X-Google-Smtp-Source: APXvYqwAZfpkK8vySmNTpYajooUQMZ/RgbPaVPzY1J92T1Yb1GNzuR3Kfm3il2PW8j/esg6YAvAe+g==
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr5235577wmh.81.1576140357340; 
 Thu, 12 Dec 2019 00:45:57 -0800 (PST)
Received: from dell ([95.149.164.71])
 by smtp.gmail.com with ESMTPSA id k8sm5263306wrl.3.2019.12.12.00.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 00:45:56 -0800 (PST)
Date: Thu, 12 Dec 2019 08:45:46 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/3] mfd: intel_soc_pmic: Rename pwm_backlight pwm-lookup
 to pwm_pmic_backlight
Message-ID: <20191212084546.GA3468@dell>
References: <20191119151818.67531-1-hdegoede@redhat.com>
 <20191119151818.67531-3-hdegoede@redhat.com>
 <20191210085111.GQ3468@dell>
 <a05e5a2b-568e-2b0d-0293-aa937c590a74@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a05e5a2b-568e-2b0d-0293-aa937c590a74@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMSBEZWMgMjAxOSwgSGFucyBkZSBHb2VkZSB3cm90ZToKCj4gSGkgTGVlLAo+IAo+
IE9uIDEwLTEyLTIwMTkgMDk6NTEsIExlZSBKb25lcyB3cm90ZToKPiA+IE9uIFR1ZSwgMTkgTm92
IDIwMTksIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4gPiAKPiA+ID4gQXQgbGVhc3QgQmF5IFRyYWls
IChCWVQpIGFuZCBDaGVycnkgVHJhaWwgKENIVCkgZGV2aWNlcyBjYW4gdXNlIDEgb2YgMgo+ID4g
PiBkaWZmZXJlbnQgUFdNIGNvbnRyb2xsZXJzIGZvciBjb250cm9sbGluZyB0aGUgTENEJ3MgYmFj
a2xpZ2h0IGJyaWdodG5lc3MuCj4gPiA+IAo+ID4gPiBFaXRoZXIgdGhlIG9uZSBpbnRlZ3JhdGVk
IGludG8gdGhlIFBNSUMgb3IgdGhlIG9uZSBpbnRlZ3JhdGVkIGludG8gdGhlCj4gPiA+IFNvQyAo
dGhlIDFzdCBMUFNTIFBXTSBjb250cm9sbGVyKS4KPiA+ID4gCj4gPiA+IFNvIGZhciBpbiB0aGUg
TFBTUyBjb2RlIG9uIEJZVCB3ZSBoYXZlIHNraXBwZWQgcmVnaXN0ZXJpbmcgdGhlIExQU1MgUFdN
Cj4gPiA+IGNvbnRyb2xsZXIgInB3bV9iYWNrbGlnaHQiIGxvb2t1cCBlbnRyeSB3aGVuIGEgQ3J5
c3RhbCBDb3ZlIFBNSUMgaXMKPiA+ID4gcHJlc2VudCwgYXNzdW1pbmcgdGhhdCBpbiB0aGlzIGNh
c2UgdGhlIFBNSUMgUFdNIGNvbnRyb2xsZXIgd2lsbCBiZSB1c2VkLgo+ID4gPiAKPiA+ID4gT24g
Q0hUIHdlIGhhdmUgYmVlbiByZWx5aW5nIG9uIG9ubHkgMSBvZiB0aGUgMiBQV00gY29udHJvbGxl
cnMgYmVpbmcKPiA+ID4gZW5hYmxlZCBpbiB0aGUgRFNEVCBhdCB0aGUgc2FtZSB0aW1lOyBhbmQg
YWx3YXlzIHJlZ2lzdGVyZWQgdGhlIGxvb2t1cC4KPiA+ID4gCj4gPiA+IFNvIGZhciB0aGlzIGhh
cyBiZWVuIHdvcmtpbmcsIGJ1dCB0aGUgY29ycmVjdCB3YXkgdG8gZGV0ZXJtaW5lIHdoaWNoIFBX
TQo+ID4gPiBjb250cm9sbGVyIG5lZWRzIHRvIGJlIHVzZWQgaXMgYnkgY2hlY2tpbmcgYSBiaXQg
aW4gdGhlIFZCVCB0YWJsZSBhbmQKPiA+ID4gcmVjZW50bHkgSSd2ZSBsZWFybmVkIGFib3V0IDIg
ZGlmZmVyZW50IEJZVCBkZXZpY2VzOgo+ID4gPiBQb2ludCBvZiBWaWV3IE1PQklJIFRBQi1QODAw
Vwo+ID4gPiBBY2VyIFN3aXRjaCAxMCBTVzUtMDEyCj4gPiA+IAo+ID4gPiBXaGljaCB1c2UgYSBD
cnlzdGFsIENvdmUgUE1JQywgeWV0IHRoZSBMQ0QgaXMgY29ubmVjdGVkIHRvIHRoZSBTb0MvTFBT
Uwo+ID4gPiBQV00gY29udHJvbGxlciAoYW5kIHRoZSBWQlQgY29ycmVjdGx5IGluZGljYXRlcyB0
aGlzKSwgc28gaGVyZSBvdXIgb2xkCj4gPiA+IGhldXJpc3RpY3MgZmFpbC4KPiA+ID4gCj4gPiA+
IFNpbmNlIG9ubHkgdGhlIGk5MTUgZHJpdmVyIGhhcyBhY2Nlc3MgdG8gdGhlIFZCVCwgdGhpcyBj
b21taXQgcmVuYW1lcwo+ID4gPiB0aGUgInB3bV9iYWNrbGlnaHQiIGxvb2t1cCBlbnRyaWVzIGZv
ciB0aGUgQ3J5c3RhbCBDb3ZlIFBNSUMncyBQV00KPiA+ID4gY29udHJvbGxlciB0byAicHdtX3Bt
aWNfYmFja2xpZ2h0IiBzbyB0aGF0IHRoZSBpOTE1IGRyaXZlciBjYW4gZG8gYQo+ID4gPiBwd21f
Z2V0KCkgZm9yIHRoZSByaWdodCBjb250cm9sbGVyIGRlcGVuZGluZyBvbiB0aGUgVkJUIGJpdCwg
aW5zdGVhZCBvZgo+ID4gPiB0aGUgaTkxNSBkcml2ZXIgcmVseWluZyBvbiBhICJwd21fYmFja2xp
Z2h0IiBsb29rdXAgZ2V0dGluZyByZWdpc3RlcmVkCj4gPiA+IHdoaWNoIG1hZ2ljYWxseSBwb2lu
dHMgdG8gdGhlIHJpZ2h0IGNvbnRyb2xsZXIuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBI
YW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgo+ID4gPiAtLS0KPiA+ID4gICBkcml2
ZXJzL21mZC9pbnRlbF9zb2NfcG1pY19jb3JlLmMgfCAyICstCj4gPiA+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IEZvciBteSBvd24gcmVm
ZXJlbmNlOgo+ID4gICAgQWNrZWQtZm9yLU1GRC1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KPiAKPiBBcyBtZW50aW9uZWQgaW4gdGhlIGNvdmVyLWxldHRlciwgdG8gYXZvaWQg
YnJlYWtpbmcgYmktc2VjdGFiaWxpdHkKPiBhcyB3ZWxsIGFzIHRvIGF2b2lkIGJyZWFraW5nIHRo
ZSBpbnRlbC1nZnggQ0kgd2UgbmVlZCB0byBtZXJnZSB0aGlzIHNlcmllcwo+IGluIG9uZSBnbyB0
aHJvdWdoIG9uZSB0cmVlLiBTcGVjaWZpY2FsbHkgdGhyb3VnaCB0aGUgZHJtLWludGVsIHRyZWUu
Cj4gSXMgdGhhdCBvayB3aXRoIHlvdSA/Cj4gCj4gSWYgdGhpcyBpcyBvayB3aXRoIHlvdSwgdGhl
biB5b3UgZG8gbm90IGhhdmUgdG8gZG8gYW55dGhpbmcsIEkgd2lsbCBqdXN0IHB1c2gKPiB0aGUg
ZW50aXJlIHNlcmllcyB0byBkcm0taW50ZWwuIGRyaXZlcnMvbWZkL2ludGVsX3NvY19wbWljX2Nv
cmUuYwo+IGRvZXMgbm90IHNlZSBtdWNoIGNoYW5nZXMgc28gSSBkbyBub3QgZXhwZWN0IHRoaXMg
dG8gbGVhZCB0byBhbnkgY29uZmxpY3RzLgoKSXQncyBmaW5lLCBzbyBsb25nIGFzIGEgbWluaW1h
bCBpbW11dGFibGUgcHVsbC1yZXF1ZXN0IGlzIHByb3ZpZGVkLgpXaGV0aGVyIGl0J3MgcHVsbGVk
IG9yIG5vdCB3aWxsIGRlcGVuZCBvbiBhIG51bWJlciBvZiBmYWN0b3JzLCBidXQgaXQKbmVlZHMg
dG8gYmUgYW4gb3B0aW9uLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2Vydmlj
ZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9y
IEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
