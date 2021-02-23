Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2A2322FA5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 18:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DAE6E84C;
	Tue, 23 Feb 2021 17:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5B789A35;
 Tue, 23 Feb 2021 17:31:21 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id l23so16367296otn.10;
 Tue, 23 Feb 2021 09:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=8uFUfcDAGQuyiOOAUNMEu1W5IdifFS+X/i4/NHqgFv8=;
 b=p65W4AzofaCWLNPvk8TQ7TW//GqxIGLX3viSLR4pfTGrJQYowFMK4+Q4YLOGfd99IJ
 E+3RD0NF4G0aDwjqM+AI2rIeaRifBpMojw164J3z7sCMg9lSlHSQIblpnNZNBJjAP+jL
 wF954K25dDWdAbOryuNKDKHoZezCeivUeGxlGW/XjrLHQ6E2wkSF1oUkJHVV/RbajPVA
 xzhs2+bALYFExrzOjvb8jCcMzMC0cjDSAjjSgYsdcIsSu1hG4V1l0VBfMi62E9J7Rgz6
 MQ1rdrwp2wVnyZbSw2lREZsnkqJQLEEPARgPfdb6eAWOJy29yRILOjQfpzmoh4w7KfeC
 eZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=8uFUfcDAGQuyiOOAUNMEu1W5IdifFS+X/i4/NHqgFv8=;
 b=RrRjadn4cR3Ix2QbFcqryfxgF0KWOo2b7vgFgFL/YDKRjxmAl290wM9Mqj7VucOtKO
 OEQh2wmr5Z6OxmET4pPhzIM9iRS2GXyAmG04ur2Hcj7y1yT5zH34er58m8OaA7p5tpXi
 jdV3YfVW4HzA22lYWA5myMOeuYJRx4HXINwq1EM2l1CcMIsC1rEZVB47/H5WsWsBYiuh
 LIMeGhwAjdUMDmIFL/N+mhtFfz9EoxRnDQ9DUL4a2W8LNeL2ATSZXaJ5RIJR+S3aA7fm
 wuqvKmGZQg6Uf1/cqrczKApZI6UbgqWNqMh8vpJd43t7NiJlA4Ml/HP/SabKU0/cGwyE
 dFyg==
X-Gm-Message-State: AOAM532n1PVud/v3Sc1Ya+R7+KS9IiA8ioGReixEb9FKmZrOP43hoNKQ
 mX+qTYIjguJ+t2+cSO1aCYAglTVXDobtT9SBinNVpSSH
X-Google-Smtp-Source: ABdhPJwPuucHJsM2rLxL3mAp8wKOzrd6YftWru7XfVMFIQkiEc24Gyvo33iX5kVHKp8nm9sL1/QaaJuBJYPZrNL41wI=
X-Received: by 2002:a9d:760a:: with SMTP id k10mr21224821otl.23.1614101480861; 
 Tue, 23 Feb 2021 09:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20210209234817.55112-1-rikard.falkeborn@gmail.com>
 <e819cb08-98b6-c87d-4d95-338e06f88a48@amd.com>
 <YCPcIwxso67M3VqR@phenom.ffwll.local>
In-Reply-To: <YCPcIwxso67M3VqR@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Feb 2021 12:31:09 -0500
Message-ID: <CADnq5_PPeNxBSryxJbT1sX=n_m_3HxKtGk5QRxtczU9qdae3cw@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/ttm: constify static vm_operations_structs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, David Airlie <airlied@linux.ie>,
 Alex Deucher <alexander.deucher@amd.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Felix Kuehling <Felix.Kuehling@amd.com>, Likun Gao <Likun.Gao@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 nouveau <nouveau@lists.freedesktop.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMTAsIDIwMjEgYXQgODoxNCBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gV2VkLCBGZWIgMTAsIDIwMjEgYXQgMDg6NDU6NTZBTSArMDEw
MCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IGZvciB0aGUgc2VyaWVzLgo+Cj4gU21hc2gg
aXQgaW50byAtbWlzYz8KCkBDaHJpc3RpYW4gS29lbmlnIGRpZCB0aGVzZSBldmVyIGxhbmQ/ICBJ
IGRvbid0IHNlZSB0aGVtIGluIGRybS1taXNjLgoKQWxleAoKPiAtRGFuaWVsCj4KPiA+Cj4gPiBB
bSAxMC4wMi4yMSB1bSAwMDo0OCBzY2hyaWViIFJpa2FyZCBGYWxrZWJvcm46Cj4gPiA+IENvbnN0
aWZ5IGEgZmV3IHN0YXRpYyB2bV9vcGVyYXRpb25zX3N0cnVjdCB0aGF0IGFyZSBuZXZlciBtb2Rp
ZmllZC4gVGhlaXIKPiA+ID4gb25seSB1c2FnZSBpcyB0byBhc3NpZ24gdGhlaXIgYWRkcmVzcyB0
byB0aGUgdm1fb3BzIGZpZWxkIGluIHRoZQo+ID4gPiB2bV9hcmVhX3N0cnVjdCwgd2hpY2ggaXMg
YSBwb2ludGVyIHRvIGNvbnN0IHZtX29wZXJhdGlvbnNfc3RydWN0LiBNYWtlIHRoZW0KPiA+ID4g
Y29uc3QgdG8gYWxsb3cgdGhlIGNvbXBpbGVyIHRvIHB1dCB0aGVtIGluIHJlYWQtb25seSBtZW1v
cnkuCj4gPiA+Cj4gPiA+IFdpdGggdGhpcyBzZXJpZXMgYXBwbGllZCwgYWxsIHN0YXRpYyBzdHJ1
Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3QgaW4gdGhlCj4gPiA+IGtlcm5lbCB0cmVlIGFyZSBjb25z
dC4KPiA+ID4KPiA+ID4gUmlrYXJkIEZhbGtlYm9ybiAoMyk6Cj4gPiA+ICAgIGRybS9hbWRncHUv
dHRtOiBjb25zdGlmeSBzdGF0aWMgdm1fb3BlcmF0aW9uc19zdHJ1Y3QKPiA+ID4gICAgZHJtL3Jh
ZGVvbi90dG06IGNvbnN0aWZ5IHN0YXRpYyB2bV9vcGVyYXRpb25zX3N0cnVjdAo+ID4gPiAgICBk
cm0vbm91dmVhdS90dG06IGNvbnN0aWZ5IHN0YXRpYyB2bV9vcGVyYXRpb25zX3N0cnVjdAo+ID4g
Pgo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8IDIgKy0K
PiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jICAgfCAyICstCj4g
PiA+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgICAgIHwgMiArLQo+ID4g
PiAgIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4g
Pgo+ID4KPgo+IC0tCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
