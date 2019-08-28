Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE21BA09FD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 20:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A914C89E1B;
	Wed, 28 Aug 2019 18:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D7989E1B;
 Wed, 28 Aug 2019 18:53:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s18so891517wrn.1;
 Wed, 28 Aug 2019 11:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dNeCU+ZF1utHP7CMktWuXnRZpMmmVHfRi6Kx10bzzBE=;
 b=HhA4bUVwF+gc4h6icS/WaTvhk2vFiH2bIt4L6bDNC4AKv8ZW2I3QeTNqER+nYcESeQ
 yKPYvvP8hTIfiuVnilVAcYOGL3SdKWqmpiuawvUCV6vqxGPnuwpp+sbFNBnrlbuuVIiH
 tyXmEyLT5XsVLWegIgEqQmf74UMOZDPQ9hy44IQumC/ckGkq4maQ3YvKLlyRiK9tMbri
 YZ6MIhUYQomkCKW4PQhJxBGF70MtHuYMSRPYdP/9y32aS4YOdJFKeqEh61muCt5fHFUV
 6ATDqD1wc0lfVhmR9Su0/vYRdKcRVCfkq6fWRYG4ok50d7CAlZ6KAE2kWXR5U1zDXXB8
 rpvA==
X-Gm-Message-State: APjAAAUrp415wIoBMsp5pEuZf5lcWiY0Pvr0jFeq7rJYfK+DmDpvO6py
 MbFUgi5ZE0EwZ5GWmoweViCI7cTx7GUrUH2ILD4=
X-Google-Smtp-Source: APXvYqweyMAnZ6yIhLJf6sFauZxV8VlmGh+lO4k0uF5jXv7BE29ZuBpN3aPxry2ik8FodDnqX68+X+75s0hzK6URnCM=
X-Received: by 2002:adf:e286:: with SMTP id v6mr5946246wri.4.1567018429532;
 Wed, 28 Aug 2019 11:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190828034012.sBvm81sYK%akpm@linux-foundation.org>
 <3e4eba58-7d24-f811-baa1-b6e88334e5a2@infradead.org>
In-Reply-To: <3e4eba58-7d24-f811-baa1-b6e88334e5a2@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Aug 2019 14:53:37 -0400
Message-ID: <CADnq5_PHNbSVUsM65sisfUwDxg_4-uEZWZMSQ=u78AWkaRdvtw@mail.gmail.com>
Subject: Re: mmotm 2019-08-27-20-39 uploaded (gpu/drm/amd/display/)
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dNeCU+ZF1utHP7CMktWuXnRZpMmmVHfRi6Kx10bzzBE=;
 b=BA1KWLcFdAWrtBsaDuNr8g3j/SgOrTjFpsCuTY0hNWE9awNEoFniam51IU2VODgqUe
 tWSuDD2MmJ6bGKNakIDXno5bS/OvPqmMHwa9fNrX1dfs9gE7XldIToxleEEzi/ehOzO0
 MKCJAk19lRJbqJCa0+kg7t0a6maVuWyju3oiJA6+iDQmvwhgEJJZycLHj9ayfRmCQ3KC
 neRbMBVmZagmm9I9yR/9bxQPZx2VJ2Uqvztc/ziKBS9h+fT4z/vSOu5QJUM2DVnqTr/Y
 MhJj/HDKmHd/d9T+c/olDopKTALXtdiye+EwbIOXaPXRxT4MDLc6wsFk7ksDReqiG183
 ebbA==
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, mm-commits@vger.kernel.org,
 Leo Li <sunpeng.li@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Michal Hocko <mhocko@suse.cz>,
 linux-mm <linux-mm@kvack.org>, Mark Brown <broonie@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMjo1MSBQTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiA4LzI3LzE5IDg6NDAgUE0sIGFrcG1AbGludXgtZm91
bmRhdGlvbi5vcmcgd3JvdGU6Cj4gPiBUaGUgbW0tb2YtdGhlLW1vbWVudCBzbmFwc2hvdCAyMDE5
LTA4LTI3LTIwLTM5IGhhcyBiZWVuIHVwbG9hZGVkIHRvCj4gPgo+ID4gICAgaHR0cDovL3d3dy5v
emxhYnMub3JnL35ha3BtL21tb3RtLwo+ID4KPiA+IG1tb3RtLXJlYWRtZS50eHQgc2F5cwo+ID4K
PiA+IFJFQURNRSBmb3IgbW0tb2YtdGhlLW1vbWVudDoKPiA+Cj4gPiBodHRwOi8vd3d3Lm96bGFi
cy5vcmcvfmFrcG0vbW1vdG0vCj4gPgo+ID4gVGhpcyBpcyBhIHNuYXBzaG90IG9mIG15IC1tbSBw
YXRjaCBxdWV1ZS4gIFVwbG9hZGVkIGF0IHJhbmRvbSBob3BlZnVsbHkKPiA+IG1vcmUgdGhhbiBv
bmNlIGEgd2Vlay4KPiA+Cj4gPiBZb3Ugd2lsbCBuZWVkIHF1aWx0IHRvIGFwcGx5IHRoZXNlIHBh
dGNoZXMgdG8gdGhlIGxhdGVzdCBMaW51cyByZWxlYXNlICg1LngKPiA+IG9yIDUueC1yY1kpLiAg
VGhlIHNlcmllcyBmaWxlIGlzIGluIGJyb2tlbi1vdXQudGFyLmd6IGFuZCBpcyBkdXBsaWNhdGVk
IGluCj4gPiBodHRwOi8vb3psYWJzLm9yZy9+YWtwbS9tbW90bS9zZXJpZXMKPiA+Cj4gPiBUaGUg
ZmlsZSBicm9rZW4tb3V0LnRhci5neiBjb250YWlucyB0d28gZGF0ZXN0YW1wIGZpbGVzOiAuREFU
RSBhbmQKPiA+IC5EQVRFLXl5eXktbW0tZGQtaGgtbW0tc3MuICBCb3RoIGNvbnRhaW4gdGhlIHN0
cmluZyB5eXl5LW1tLWRkLWhoLW1tLXNzLAo+ID4gZm9sbG93ZWQgYnkgdGhlIGJhc2Uga2VybmVs
IHZlcnNpb24gYWdhaW5zdCB3aGljaCB0aGlzIHBhdGNoIHNlcmllcyBpcyB0bwo+ID4gYmUgYXBw
bGllZC4KPiA+Cj4gPiBUaGlzIHRyZWUgaXMgcGFydGlhbGx5IGluY2x1ZGVkIGluIGxpbnV4LW5l
eHQuICBUbyBzZWUgd2hpY2ggcGF0Y2hlcyBhcmUKPiA+IGluY2x1ZGVkIGluIGxpbnV4LW5leHQs
IGNvbnN1bHQgdGhlIGBzZXJpZXMnIGZpbGUuICBPbmx5IHRoZSBwYXRjaGVzCj4gPiB3aXRoaW4g
dGhlICNORVhUX1BBVENIRVNfU1RBUlQvI05FWFRfUEFUQ0hFU19FTkQgbWFya2VycyBhcmUgaW5j
bHVkZWQgaW4KPiA+IGxpbnV4LW5leHQuCj4KPiBvbiBpMzg2Ogo+Cj4gLi4vZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jOiBJbiBmdW5j
dGlvbiDigJhkY24yMF9od19zZXF1ZW5jZXJfY29uc3RydWN04oCZOgo+IC4uL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYzoyMTI3OjI4
OiBlcnJvcjog4oCYZGNuMjBfZHNjX3BnX2NvbnRyb2zigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNl
IGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYZGNuMjBfZHBwX3BnX2NvbnRyb2zi
gJk/Cj4gICBkYy0+aHdzcy5kc2NfcGdfY29udHJvbCA9IGRjbjIwX2RzY19wZ19jb250cm9sOwo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBkY24yMF9kcHBfcGdfY29udHJvbAo+Cj4KPiBGdWxsIHJh
bmRjb25maWcgZmlsZSBpcyBhdHRhY2hlZC4KCkZpeGVkIGhlcmU6Cmh0dHBzOi8vY2dpdC5mcmVl
ZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4L2NvbW1pdC8/aD1kcm0tbmV4dCZpZD1kYTI2ZGVkM2Iy
ZmZmNjQ2ZDI4NTU5MDA0MTk1YWJlMzUzYmNlNDliCgpBbGV4Cgo+Cj4gLS0KPiB+UmFuZHkKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZngg
bWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
