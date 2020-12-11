Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 152502D7312
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 10:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036FA6ED08;
	Fri, 11 Dec 2020 09:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75636ED08;
 Fri, 11 Dec 2020 09:52:14 +0000 (UTC)
IronPort-SDR: /cdi8tSh05ctCVuAcMYCb3A+hMJhNacdEtcFsPDI1wxz28FmdlQiqFYmxsHc5+piWkBmVe0MoK
 NI90ZWCsmPLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="153640764"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="153640764"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 01:52:14 -0800
IronPort-SDR: PVl8OU8ROdRYNRcuuI1cwHnm0Pahwqqsf4O0coU6GZWsYYiN/hRTouvAiYE5Ccs0+xvEJJqBLa
 InJ3eAdxnHfQ==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="440808660"
Received: from dkreft-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.158.206])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 01:52:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Thomas
 Gleixner <tglx@linutronix.de>
Subject: Re: [Intel-gfx] [patch 13/30] drm/i915/lpe_audio: Remove pointless
 irq_to_desc() usage
In-Reply-To: <X9J7h+myHaraeoKH@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201210192536.118432146@linutronix.de>
 <20201210194043.862572239@linutronix.de> <X9J7h+myHaraeoKH@intel.com>
Date: Fri, 11 Dec 2020 11:51:57 +0200
Message-ID: <87zh2k7jr6.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Heiko Carstens <hca@linux.ibm.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 David Airlie <airlied@linux.ie>, Lee Jones <lee.jones@linaro.org>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, LKML <linux-kernel@vger.kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMCBEZWMgMjAyMCwgVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6Cj4gT24gVGh1LCBEZWMgMTAsIDIwMjAgYXQgMDg6MjU6NDlQTSAr
MDEwMCwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+PiBOb3RoaW5nIHVzZXMgdGhlIHJlc3VsdCBh
bmQgbm90aGluZyBzaG91bGQgZXZlciB1c2UgaXQgaW4gZHJpdmVyIGNvZGUuCj4+IAo+PiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPj4gQ2M6IEph
bmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+Cj4+IENjOiBKb29uYXMgTGFo
dGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+Cj4+IENjOiBSb2RyaWdvIFZp
dmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+Cj4+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+Cj4+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4+IENjOiBQ
YW5rYWogQmhhcmFkaXlhIDxwYW5rYWoubGF4bWluYXJheWFuLmJoYXJhZGl5YUBpbnRlbC5jb20+
Cj4+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPj4gQ2M6IFdh
bWJ1aSBLYXJ1Z2EgPHdhbWJ1aS5rYXJ1Z2F4QGdtYWlsLmNvbT4KPj4gQ2M6IGludGVsLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPgo+IFJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgoKVGhvbWFzLCBJIHByZXN1bWUgeW91IHdhbnQgdG8gbWVyZ2UgdGhpcyBzZXJp
ZXMgYXMgYSB3aG9sZS4KCkFja2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwu
Y29tPgoKZm9yIG1lcmdpbmcgdmlhIHdoaWNoZXZlciB0cmVlIG1ha2VzIG1vc3Qgc2Vuc2UuIFBs
ZWFzZSBsZXQgdXMga25vdyBpZgp5b3Ugd2FudCB1cyB0byBwaWNrIHRoaXMgdXAgdmlhIGRybS1p
bnRlbCBpbnN0ZWFkLgoKPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfbHBlX2F1ZGlvLmMgfCAgICA0IC0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0
aW9ucygtKQo+PiAKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9s
cGVfYXVkaW8uYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2xw
ZV9hdWRpby5jCj4+IEBAIC0yOTcsMTMgKzI5Nyw5IEBAIGludCBpbnRlbF9scGVfYXVkaW9faW5p
dChzdHJ1Y3QgZHJtX2k5MTUKPj4gICAqLwo+PiAgdm9pZCBpbnRlbF9scGVfYXVkaW9fdGVhcmRv
d24oc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQo+PiAgewo+PiAtCXN0cnVjdCBp
cnFfZGVzYyAqZGVzYzsKPj4gLQo+PiAgCWlmICghSEFTX0xQRV9BVURJTyhkZXZfcHJpdikpCj4+
ICAJCXJldHVybjsKPj4gIAo+PiAtCWRlc2MgPSBpcnFfdG9fZGVzYyhkZXZfcHJpdi0+bHBlX2F1
ZGlvLmlycSk7Cj4+IC0KPj4gIAlscGVfYXVkaW9fcGxhdGRldl9kZXN0cm95KGRldl9wcml2KTsK
Pj4gIAo+PiAgCWlycV9mcmVlX2Rlc2MoZGV2X3ByaXYtPmxwZV9hdWRpby5pcnEpOwo+PiAKPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gSW50ZWwt
Z2Z4IG1haWxpbmcgbGlzdAo+PiBJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cgot
LSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
