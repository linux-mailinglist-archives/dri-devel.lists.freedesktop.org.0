Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66D82DDFA9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3C089B3C;
	Fri, 18 Dec 2020 08:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A89089791
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 21:31:29 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id t15so130948ual.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 13:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z3wBihlfjGx8i9Bl44iJeyk8d+JtLB8+FBazFf3aqxI=;
 b=Xv6CKojtAib1V+eCUCifJMxvOL5xMNPU12CsNqnS6ZS3cTqa7NBT+snudMyjwBC7lY
 zIrIkm5JS6GRTI9n4MwHvRumjGT1SCi5wqO5WCJJwLyh4yfPfCIO6zimk4VB20fZpPMC
 KahIinuwAd5HF5GktyXA2aRw7m1R46DuuyzNL8ewCvqjW8ba4g8lIZU90vegIxjT2vkm
 lPkkeRfF20ApaEhpHYtH2NKg3fgmnzFYN588hVUrhHSvfiO0U4q+2oSX+WhT11jLhZAz
 EB/ZeVhRO2GcXBUgN8s1T1D/Y9J5/vXitW8lq/LnVsOV1lY9HyExZia/UphQh2G0/btb
 n9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z3wBihlfjGx8i9Bl44iJeyk8d+JtLB8+FBazFf3aqxI=;
 b=oYT+Lr7vEqNWwXsZ2pyyU0RVwghCctrI1d5W/ExiW72whcyxtP3wtSj/22OwIR+LK3
 IcxKfDVqU6wP3PfEMPGPQL7FoEFJASNLq4iB0k/o5O7rRsHN8O/D08PH9iP9IrIVaMpJ
 QCNL2qDGebhi3ExwCOjfyaTfWbtp4HoRUAS4SXjoS65iLud5Wn7KM8tfvdM6OFq3iZj2
 lMlyKY5DsKw1LhG5vkr7jHWpyTzN7I8L9xkvtcUQNYLVkc1hlNgQJAON3sKNEvdUSI62
 qfyBlQcR2vkTaak8Hk+fJ9X1+2QkGKp0c3TD6/r6fFTJFkpA7qQuBHwtnPXdCLP9DUDI
 2OGQ==
X-Gm-Message-State: AOAM533nfDHVZnWuEgPekfetxrItaeWbQPsG2Q+pqPz4qnERH8VqVNSn
 CEd0JBMImqCvGZ+zOc/bmzjuGHbZJNRbNX/J9b8=
X-Google-Smtp-Source: ABdhPJz14o9+L0aLZo3DstAVJ8IUVDdwdJRHGNYX0c6yQJkhR9vIKQiMOnoiOLZwHPdXERCJJ74rkJYBFDeZRKqk1KI=
X-Received: by 2002:ab0:7312:: with SMTP id v18mr1113124uao.13.1608240688971; 
 Thu, 17 Dec 2020 13:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20201204035318.332419-1-jim.cromie@gmail.com>
 <20201204035318.332419-2-jim.cromie@gmail.com>
 <X9OQkyWYBpBb+PDC@intel.com>
In-Reply-To: <X9OQkyWYBpBb+PDC@intel.com>
From: jim.cromie@gmail.com
Date: Thu, 17 Dec 2020 14:31:02 -0700
Message-ID: <CAJfuBxwjW107Hx46_MB5F9wR3AXxcS02fAHjF_new4sWwcGKRQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] drm: RFC add choice to use dynamic debug in
 drm-debug
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jason Baron <jbaron@akamai.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBEZWMgMTEsIDIwMjAgYXQgODozNCBBTSBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgRGVjIDAzLCAyMDIwIGF0
IDA4OjUzOjE3UE0gLTA3MDAsIEppbSBDcm9taWUgd3JvdGU6Cj4gPiBkcm0ncyBkZWJ1ZyBzeXN0
ZW0gdXNlcyBkaXN0aW5jdCBjYXRlZ29yaWVzIG9mIGRlYnVnIG1lc3NhZ2VzLCBtYXBwZWQKPiA+
IHRvIGJpdHMgaW4gZHJtLmRlYnVnLiAgQ3VycmVudGx5LCBjb2RlIGRvZXMgYSBsb3Qgb2YgdW5s
aWtlbHkgYml0LW1hc2sKPiA+IGNoZWNrcyBvbiBkcm0uZGVidWcgKGluIGRybV9kZWJ1Z19lbmFi
bGVkKSwgd2UgY2FuIHVzZSBkeW5hbWljIGRlYnVnCj4gPiBpbnN0ZWFkLCBhbmQgZ2V0IGFsbCB0
aGF0IGp1bXBfbGFiZWwgZ29vZG5lc3MuCgo+IElzIHRoZXJlIGFuIGFjdHVhbCBuZWVkIHRvIGdv
IHRocm91Z2ggZHluZGJnIGFuZCBkbyBhbGwgdGhpcyBzdHJpbmd5Cj4gc3R1ZmYsIG9yIHdvdWxk
IGp1c3QgZWcuIGEgc3RhdGljIGtleXMgYXJyYXkgZm9yIHRoZSBkZWJ1ZyBjYXRlZ29yaWVzCj4g
Z2V0IHVzIHRoZSBiZW5lZml0cyBvZiBqdW1wX2xhYmVsPwo+CgpZb3UgY2VydGFpbmx5IGNhbiBz
dHJpcCB0aGUgY2FyLCB0YWtlIHRoZSBlbmdpbmUuCmJ1dCB5b3UgbWlnaHQgbmVlZCBzb21lIG9m
IHRoZSBkcml2ZXRyYWluIHRvby4KbWF5YmUgeW91IHdhbnQgdG8gc2tpcCB0aGUgaGVhdGVkIHNl
YXRzID8KZHluZGJnIGhhcyBzb21lIHN0dWZmIHlvdSBkb250IG5lZWQsIGZvciBzdXJlLgoKZm9y
IG9uZSwgaXRzIGhlYXZ5IG9uIGRhdGEgcGVyIGNhbGxzaXRlLCB3aXRoIGEgc3RhdGljLWtleSBh
bmQKb3ZlcmhlYWQgZm9yIGVhY2guCgpCdXQgSWQgYmUgd2FyeSB0aGF0IHRoZSBqdW1wLWxhYmVs
IGNvZGUtcGF0Y2hpbmcgaXMgYSBzbG93IHBhdGgsCnNvIHRyeWluZyB0byBjaGFuZ2UgaHVuZHJl
ZHMgb2YganVtcC1zaXRlcyB3aXRoIG9uZSBzdGF0aWMta2V5IGZpZWxkCm1heSBydW4gaW50byBw
cm9ibGVtcyB3aXRoIGxvbmcgbG9jayBob2xkIHRpbWVzLCBldGMuCgpUaGVyZSBpcyBhIGJhdGNo
aW5nIG1lY2hhbmlzbSBidWlsdC1pbiB0byB0aGUganVtcC1sYWJlbCBzdHVmZiBzb21ld2hlcmUs
Cm15IGltcHJlc3Npb24gaXMgdGhhdCBpdCBhbW9ydGl6ZWQgc3lzdGVtLXdpZGUgc3luY3Mgd2hp
bGUgYmVpbmcgUlQgYXdhcmUuCgoKSSd2ZSBiZWVuIHdvcmtpbmcgb24gdHJpbW1pbmcgZHluZGJn
IGRvd24sIGF0IGxlYXN0IHRoZSBtZW1vcnkuCkknbGwgYmUgc2VuZGluZyBpdCBvdXQgc2hvcnRs
eSwgYnV0IGhlcmVzIGEgcHJldmlldzoKCgpTdWJqZWN0OiBbUkZDIFBBVENIIHYyIDAvN10gZHlu
YW1pYyBkZWJ1ZyBkaWV0IHBsYW4KClYyIGlzIGEgcmV0aG91Z2h0IGRpZXQgcGxhbiBmb3IgZHlu
ZGJnIChJIG1lYW50IC12MSBhcyByZmMpLgoKYXQgaGlnaGVzdCBsZXZlbCwgcGF0Y2hzZXQgZG9l
czoKMS0gbW92ZSBzdHJ1Y3QgX2RkZWJ1ZyAic2VsZWN0b3IiIGZpZWxkcyB0byBuZXcgc3RydWN0
IF9kZGVidWdfY2FsbHNpdGUKMi0gbWFrZSBkZGVidWdfY2FsbHNpdGVzIG9wdGlvbmFsLCBnb29k
IGZvciBzb21lIHVzZXJzCjMtIGFsbG93IGRyb3BwaW5nIGNhbGxzaXRlcyBieSB0aG9zZSB1c2Vy
cy4KCjEtdjIuIFJhc211cyBub3RlZCB0aGF0IEkgc2hvdWxkbid0IG1vdmUgZm9ybWF0IHdpdGgg
dGhlIG90aGVyIGZpZWxkcywKYW5kIEkgcmVhbGl6ZWQgdGhhdCB0aGUgIm1vZHVsZTpmdW5jdGlv
bjpsaW5lIiBkeW5hbWljIHByZWZpeGVzIGFyZQp1bHRpbWF0ZWx5IGp1c3QgbG9nIGRlY29yYXRp
b25zLCBhbmQgYXJlIG5vdCBuZWVkZWQgZm9yIGNlcnRhaW4gdXNlCmNhc2VzLCBpbmNsdWRpbmcg
ZHJtICh3aXRoIGNhdGVnb3J5IC0+IHByZWZpeCBhZGFwdGF0aW9uKS4KClRoZSBkcm0gdXNlIGNh
c2U6CgotIGNhbiBiZW5lZml0IGZyb20ganVtcC1sYWJlbHMgdG8gYXZvaWQgZHJtX2RlYnVnX2Vu
YWJsZWQoKQotIGNhbiBtYXAgY2F0ZWdvcmllcyB0byBmb3JtYXQtcHJlZml4ZXM6ICJkcm06Y29y
ZToiICJkcm06a21zOiIgZXRjCi0gY2FuIHVzZSBkeW5hbWljX2RlYnVnX2V4ZWNfcXVlcmllcygi
Zm9ybWF0IF5kcm06Y29yZTogK3AiLCBOVUxMKQotIGRybSArIGFtZGdwdSBoYXZlIH4zMjAwIGRy
bS1kZWJ1Z3MsIGRybSArIGk5MTUgaGF2ZSB+MTYwMAoKSWYgZHJtIGRyb3BwZWQgb3B0aW9uYWwg
c2l0ZSBpbmZvLCBuZXQgMTYgYnl0ZXMgc2F2ZWQgLyBjYWxsc2l0ZSwgbWF5YmUgbW9yZS4uLgoK
ZHJvcHBpbmcgb3B0aW9uYWwgaW5mbyA6IG1vZHVsZSBmaWxlIGZ1bmMgbWVhbnMgbG9zcyBvZiBs
b2cgImRlY29yYXRpb25zIgphbmQgc2xpbW1lciBjb250ZW50cyBvZiBjb250cm9sIGZpbGUuICB1
bmNhdGVnb3JpemVkIHByLWRlYnVncyBjYW4gYmUKYXZvaWRlZCB3aGVuIGRyb3BwaW5nIGNhbGxz
aXRlcy4gICBFdmVuIHdpdGggZHJvcHBlZCBpbmZvLApmb3JtYXQsIGxpbmUsIG1vZHVsZSBxdWVy
aWVzIGNhbiBzZWxlY3QgaW5kaXZpZHVhbCBzaXRlcyBwcmVjaXNlbHkuCgpBcyBvZiBub3csIHdl
IHN0aWxsIG5lZWQgdGhlIF9fZHluZGJnX2NhbGxzaXRlcyBsaW5rZXIgc2VjdGlvbjsgdGhlCjMt
ZHJvcCBpcyBqdXN0IGEgZm9yZ2V0LXRoZS1hZGR5LCBub3QgYSBrZnJlZS4KCkJ1dCBjb21wcmVz
c2lvbiBpcyBwb3NzaWJsZS4gdjEgdHJpZWQgdXNpbmcgenJhbSwgd2l0aCBtaXhlZCBzdWNjZXNz
Lgp2MiBpcyBhIGJldHRlciBmb3VuZGF0aW9uIHRvIHJlLXRyeSB0aGUgenJhbS4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
