Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AAD35EEA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 16:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A477E89471;
	Wed,  5 Jun 2019 14:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9457F89471;
 Wed,  5 Jun 2019 14:17:07 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id b8so5983714edm.11;
 Wed, 05 Jun 2019 07:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DYFO74imdmleJLw5lYkuA6kO6lk6BDNzHYqBpZMjZ8s=;
 b=GsPOIPjst1yjoM8Rp2N1g22ZhoWmjXvXML3OLEZln/Se8dF56jN5vL8WjkZLY9co+C
 WCLEQjwTFpIhuuebmUNOMFRdTHSB18ZS5tn5q0NVkL4HH4UnSr4fGdtMSoomVB2FXL4D
 XjVNDq9mhklbvln6CrT0DFN6k4AwjbUGDKXwSBUNusCrX9fYIWzOsJMgeMpX3Q9ZQzoj
 /5U30qGXXoxALrzL6G3Vbs6rULcp1SIMnGhyjx5za6taVGkrmJJAyzavCSS4f36rCIzS
 tW485VklnBvYkiOkFDN4HnzT9lC6FrG5ZtlLEroPwnqSsChY2F7OAH8KdZU1sf58EjM3
 7p6g==
X-Gm-Message-State: APjAAAXGzxRYgocOtUqdzoUNXpkqKf5r6hYoU2H1H6q/jufs6cMJQh7V
 Ls6oKQtBA+X7JyNQKgjz3OTEPx2LHcR7VUMaIkc=
X-Google-Smtp-Source: APXvYqz++haK8phyFHbXw+7xx+j+S+xiNW3yfgGMolbWak16tppAeVvpIviRn0GFGAEATK3z185Rfr0/uCa7tvr7S5E=
X-Received: by 2002:a17:906:2ada:: with SMTP id
 m26mr8080786eje.265.1559744226214; 
 Wed, 05 Jun 2019 07:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20181201165348.24140-1-robdclark@gmail.com>
 <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
 <CAF6AEGtj+kyXqKeJK2-0e1jw_A4wz-yBEyv5zhf5Vfoi2_p2CA@mail.gmail.com>
 <CAAFQd5Dmr+xyd4dyc_44vJFpNpwK6+MgG+ensoey59HgbxXV6g@mail.gmail.com>
 <CGME20190605125734epcas1p43b15cc8c556d917ca71b561791861cec@epcas1p4.samsung.com>
 <CAF6AEGuj=QmEWZVzHMtoDgO0M0t-W9+tay5F4AKYThZqy=nkdA@mail.gmail.com>
 <95d6e963-7f30-1d9c-99d7-0f6cc1589997@samsung.com>
In-Reply-To: <95d6e963-7f30-1d9c-99d7-0f6cc1589997@samsung.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Jun 2019 07:16:51 -0700
Message-ID: <CAF6AEGtb1t4oRXCVvZq_cq1vZCJhgok-Ha+FXrruOOCq4APY_Q@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] of/device: add blacklist for iommu dma_ops
To: Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DYFO74imdmleJLw5lYkuA6kO6lk6BDNzHYqBpZMjZ8s=;
 b=kvxtMTCZdYLS36jfstozpuwwHILmf0b2bvAMNZXohkogm+c2hPkV+4Z95BmSa+Iqxh
 ZVGQ9C767Mwx8Ubqg7OXp4cc5CZA5jSH642GgtyyWORUHyEr1yHfT+o5w1ktS+0B1E2k
 VE4Q8MtKaqiEo8ZAclw5warQKFbLbRryMg6MMwGAZdzZ0/aXkoolO6+F5v/FVE8PgoRz
 wjDdu3SfUhW1O6EVCML5GIKEDN1vkOd1YFIkqUl0szkdzv18oI0Pfv/hKcA64SRN4QKq
 RO1JzS9ecXpXP+8nLy05iP+IsEluRraqXvXeKhUhfZOANq+Kntu5MISL4uAXjrVMgbTe
 +6EQ==
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
Cc: devicetree@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tomasz Figa <tfiga@chromium.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gNSwgMjAxOSBhdCA2OjE4IEFNIE1hcmVrIFN6eXByb3dza2kKPG0uc3p5cHJv
d3NraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPiBIaSBSb2IsCj4KPiBPbiAyMDE5LTA2LTA1IDE0
OjU3LCBSb2IgQ2xhcmsgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biA0LCAyMDE5IGF0IDExOjU4IFBN
IFRvbWFzeiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4+IEJ1dCBmaXJzdCBv
ZiBhbGwsIEkgcmVtZW1iZXIgTWFyZWsgYWxyZWFkeSBzdWJtaXR0ZWQgc29tZSBwYXRjaGVzIGxv
bmcKPiA+PiBhZ28gdGhhdCBleHRlbmRlZCBzdHJ1Y3QgZHJpdmVyIHdpdGggc29tZSBmbGFnIHRo
YXQgbWVhbnMgdGhhdCB0aGUKPiA+PiBkcml2ZXIgZG9lc24ndCB3YW50IHRoZSBJT01NVSB0byBi
ZSBhdHRhY2hlZCBiZWZvcmUgcHJvYmUuIFdoeQo+ID4+IHdvdWxkbid0IHRoYXQgd29yaz8gU291
bmRzIGxpa2UgYSBwZXJmZWN0IG9wdC1vdXQgc29sdXRpb24uCj4gPiBBY3R1YWxseSwgeWVhaC4u
IHdlIHNob3VsZCBkbyB0aGF0LiAgVGhhdCBpcyB0aGUgc2ltcGxlc3Qgc29sdXRpb24uCj4KPiBU
b21hc3ogaGFzIHZlcnkgZ29vZCBtZW1vcnkuIEl0IHRvb2sgbWUgYSB3aGlsZSB0byBmaW5kIHRo
YXQgb2xkIHBhdGNoZXM6Cj4KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzQ2
NzcyNTEvCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC80Njc3OTQxLwo+IGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvNDY3NzQwMS8KPgo+IEl0IGxvb2tzIHRo
YXQgbXkgaWRlYSB3YXMgYSBiaXQgYWhlYWQgb2YgaXRzIHRpbWUgOykKPgoKaWYgSSByZS1zcGlu
IHRoaXMsIHdhcyB0aGVpciBhIHJlYXNvbiBub3QgdG8ganVzdCB1c2UgYml0ZmllbGRzLCBpZToK
Ci0gICAgYm9vbCBzdXBwcmVzc19iaW5kX2F0dHJzOyAgICAvKiBkaXNhYmxlcyBiaW5kL3VuYmlu
ZCB2aWEgc3lzZnMgKi8KKyAgICBib29sIHN1cHByZXNzX2JpbmRfYXR0cnMgOiAxOyAgICAvKiBk
aXNhYmxlcyBiaW5kL3VuYmluZCB2aWEgc3lzZnMgKi8KKyAgICBib29sIGhhc19vd25faW9tbXVf
bWFuYWdlciA6IDE7ICAvKiBkcml2ZXIgZXhwbGljdGx5IG1hbmFnZXMgSU9NTVUgKi8KClRoYXQg
c2VlbXMgbGlrZSBpdCB3b3VsZCBoYXZlIGJlZW4gYSBiaXQgbGVzcyBjaHVybiBhbmQgYSBiaXQg
bmljZXIKbG9va2luZyAoSU1PIGF0IGxlYXN0KQoKQlIsCi1SCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
