Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485AFEBF5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 23:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C0F89312;
	Mon, 29 Apr 2019 21:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5BA8930F;
 Mon, 29 Apr 2019 21:14:48 +0000 (UTC)
Received: from localhost (odyssey.drury.edu [64.22.249.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95338215EA;
 Mon, 29 Apr 2019 21:14:47 +0000 (UTC)
Date: Mon, 29 Apr 2019 16:14:46 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 0/9] PCI: add help pci_dev_id
Message-ID: <20190429211446.GA145057@google.com>
References: <2e1f9a57-6d08-d017-24da-3e6b97fa2449@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e1f9a57-6d08-d017-24da-3e6b97fa2449@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556572487;
 bh=XX0aTJglLKQg7dsZbY4eNn1vqzsBT3b0Sj+xLrzx0yk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YxHibykQtphUqTaLCrPFMVUnoPuwdK1iYO2VrtH44UQZDBpPNEIgM+EQM+ho0ajOH
 U7bQco5v19ubB1D43u2lfNBs8KvFl6/Tbwn+o5UIMte+7mdc6Euc/IXTI8nadeZc+Z
 9qxqwwsQIbuhid6oF/FqEvGGNc8TC6PpId9D37hU=
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Jose Abreu <joabreu@synopsys.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Alex Deucher <alexander.deucher@amd.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:8169 10/100/1000 GIGABIT ETHERNET DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:AMD IOMMU \(AMD-VI\)" <iommu@lists.linux-foundation.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMDk6MTA6MjFQTSArMDIwMCwgSGVpbmVyIEthbGx3ZWl0
IHdyb3RlOgo+IEluIHNldmVyYWwgcGxhY2VzIGluIHRoZSBrZXJuZWwgd2UgZmluZCBQQ0lfREVW
SUQgdXNlZCBsaWtlIHRoaXM6Cj4gUENJX0RFVklEKGRldi0+YnVzLT5udW1iZXIsIGRldi0+ZGV2
Zm4pIFRoZXJlZm9yZSBjcmVhdGUgYSBoZWxwZXIKPiBmb3IgaXQuCj4gCj4gdjI6Cj4gLSBhcHBs
eSB0aGUgY2hhbmdlIHRvIGFsbCBhZmZlY3RlZCBwbGFjZXMgaW4gdGhlIGtlcm5lbAo+IAo+IEhl
aW5lciBLYWxsd2VpdCAoOSk6Cj4gICBQQ0k6IGFkZCBoZWxwZXIgcGNpX2Rldl9pZAo+ICAgUENJ
OiB1c2UgaGVscGVyIHBjaV9kZXZfaWQKPiAgIHI4MTY5OiB1c2UgbmV3IGhlbHBlciBwY2lfZGV2
X2lkCj4gICBwb3dlcnBjL3Bvd2VybnYvbnB1OiB1c2UgaGVscGVyIHBjaV9kZXZfaWQKPiAgIGRy
bS9hbWRrZmQ6IHVzZSBoZWxwZXIgcGNpX2Rldl9pZAo+ICAgaW9tbXUvYW1kOiB1c2UgaGVscGVy
IHBjaV9kZXZfaWQKPiAgIGlvbW11L3Z0LWQ6IHVzZSBoZWxwZXIgcGNpX2Rldl9pZAo+ICAgc3Rt
bWFjOiBwY2k6IHVzZSBoZWxwZXIgcGNpX2Rldl9pZAo+ICAgcGxhdGZvcm0vY2hyb21lOiBjaHJv
bWVvc19sYXB0b3A6IHVzZSBoZWxwZXIgcGNpX2Rldl9pZAo+IAo+ICBhcmNoL3Bvd2VycGMvcGxh
dGZvcm1zL3Bvd2VybnYvbnB1LWRtYS5jICAgICAgICAgfCAxNCArKysrKystLS0tLS0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuYyAgICAgICAgfCAgMyArLS0K
PiAgZHJpdmVycy9pb21tdS9hbWRfaW9tbXUuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KPiAgZHJpdmVycy9pb21tdS9pbnRlbC1pb21tdS5jICAgICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KPiAgZHJpdmVycy9pb21tdS9pbnRlbF9pcnFfcmVtYXBwaW5nLmMgICAgICAgICAgICAg
IHwgIDIgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVhbHRlay9yODE2OS5jICAgICAgICAg
ICAgIHwgIDMgKy0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1h
Y19wY2kuYyB8ICAyICstCj4gIGRyaXZlcnMvcGNpL21zaS5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL3BjaS9zZWFyY2guYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAxMCArKystLS0tLS0tCj4gIGRyaXZlcnMvcGxhdGZvcm0vY2hy
b21lL2Nocm9tZW9zX2xhcHRvcC5jICAgICAgICB8ICAyICstCj4gIGluY2x1ZGUvbGludXgvcGNp
LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrKysrCj4gIDExIGZpbGVzIGNo
YW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQoKQXBwbGllZCB3aXRoIGFj
a3MvcmV2aWV3ZWQtYnkgZnJvbSBCZW5zb24sIEpvZXJnLCBDaHJpc3RpYW4sIEFsZXhleSwgYW5k
CkRhdmlkIHRvIHBjaS9taXNjIGZvciB2NS4yLCB0aGFua3MhCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
