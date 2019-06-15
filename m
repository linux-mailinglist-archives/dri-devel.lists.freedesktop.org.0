Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 526FC4726C
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 00:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC69F8922F;
	Sat, 15 Jun 2019 22:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F4A8922F;
 Sat, 15 Jun 2019 22:38:11 +0000 (UTC)
Received: from localhost (unknown [107.242.116.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28A6C2073F;
 Sat, 15 Jun 2019 22:38:10 +0000 (UTC)
Date: Sat, 15 Jun 2019 18:38:09 -0400
From: Sasha Levin <sashal@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RESEND PATCH v2 1/2] drm/dp/mst: Reprobe EDID for MST ports on
 resume
Message-ID: <20190615223809.GS1513@sasha-vm>
References: <20181024021925.27026-2-juston.li@intel.com>
 <20190614215644.8F9D821874@mail.kernel.org>
 <90274aca8c1b785caf9e3732e8b56e501e573a1f.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90274aca8c1b785caf9e3732e8b56e501e573a1f.camel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560638291;
 bh=+PcXKoEYSFcpmWR4eCRY2o0tn67VO6ioCzBdZ1aNSsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZHCtFO/fIn9Is9ew0H5lSCF9lAhXTGJcnVHpus6ZQUwe5sJ/VYyXPzBDkAPSOTFcL
 4vKJ6bLsi8qCzLwwqN2iO/4PPzZhSq5aPNIygK+e/qS/DVLTW9lGBnb1RCTEcKB8Ao
 Q3ACp0LxVbxsIgHSMtCEtEEApt+8gQ95yhTbqpII=
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Lyude <cpaul@redhat.com>,
 Juston Li <juston.li@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDY6MTA6MjBQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPnVoLCBTYXNoYSBub3Qgc3VyZSBpZiB5b3UncmUgYSBib3Qgb3Igbm90IGJ1dCB0aGlzIHBh
dGNoIGlzbid0IGV2ZW4gdXBzdHJlYW0KClRoaXMgaXMgaW5kZWVkIGEgYm90LCBhbmQgdGhhdCdz
IGluZGVlZCBpdCdzIHB1cnBvc2UgOikKCldlIHRlbmQgdG8gZ2V0IGxlc3MgcmVzcG9uc2VzIGlm
IHdlIHdhaXQgZm9yIHdlZWtzIGZvciBhIHBhdGNoIHRvIGdldAp1cHN0cmVhbSBhbmQgcXVldWVk
IGZvciAtc3RhYmxlIGJlY2F1c2UgbW9zdCBvZnRlbiBmb2xrcyBoYXZlIG1vdmVkIG9uCmFuZCBm
b3Jnb3R0ZW4gYWxsIGFib3V0IGl0LgoKVGhpcyBib3QgbG9va3MgZm9yIGNvbW1pdHMgdGFnZ2Vk
IGZvciBzdGFibGUsIGFuZCBydW5zIGJhc2ljIHNhbml0eQpjaGVja3Mgb24gdGhlbSB3aGlsZSB0
aGV5J3JlIHN0aWxsIGJlaW5nIGRpc2N1c3NlZCBvbiB0aGUgbWFpbGluZyBsaXN0LgpUaGlzIHdh
eSB3ZSBnZXQgbW9yZSByZXNwb25zZXMgd2l0aCBpbnN0cnVjdGlvbnMgb24gaG93IHRvIGRlYWwg
d2l0aCB0aGUKcGF0Y2guCgpFaXRoZXIgd2F5LCBpdCB3b24ndCBiZSBhY3R1YWxseSBxdWV1ZWQg
Zm9yIHN0YWJsZSBiZWZvcmUgaXQncyB1cHN0cmVhbS4KCi0tClRoYW5rcywKU2FzaGEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
