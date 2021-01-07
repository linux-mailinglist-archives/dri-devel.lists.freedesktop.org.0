Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CE02ECD60
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 10:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EFE89CB2;
	Thu,  7 Jan 2021 09:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C0A89CB2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 09:58:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20E90217A0
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610013505;
 bh=/IoyTbDRYdITqQ/ehLHHAr5zNu/uV79exeCn/3qbm4w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FhvFdx7YQqNX76DDQy8bm+QZG3FlLsKv+uvGJTWd+AYLs9DhEmarC2ooCBsWQoMj4
 d/ovB12fQV1lTPXUgTj82hkh4qH+KoDC8BgkjGzKR+hFWJNKdL/CfhtgcXA9RtTgf/
 f1yk/U/8+LQYLbF3rQjfmtKEuKS+p3voXHeiqfmU1LgwgqeG+g+iFrg64bjrgrCn6C
 AllCy1ilu5q5qviydFwac88yWMU4pu99tBPXhHaA4+OK0gEOLgMEJB6yYq9zvUPgKv
 UWamxX+fyPJoLqK5EAc0hjic7m0+L+B7PJDi3c6k88s/UcS2+PuJCH8l79jeiye57I
 cheAhGLJtsMBw==
Received: by mail-ed1-f51.google.com with SMTP id b2so7216415edm.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 01:58:25 -0800 (PST)
X-Gm-Message-State: AOAM533DJHu48RmrJoTF5QN9RXayxunNCrzrCHxGMpV5HB+B/1WOZ5Ca
 2uqg1NAgIVpBezbDy7KRKF/VV5sVtxFroPd/uw==
X-Google-Smtp-Source: ABdhPJzuagogH0mSid9kt6qBlxG0IYM9hSJgtHkS+RyfrWE+l+JBeR+fcJikBQGl7vUlVHVFXv4wKYgD3LkjJMNaChA=
X-Received: by 2002:a05:6402:3048:: with SMTP id
 bu8mr1091459edb.49.1610013503677; 
 Thu, 07 Jan 2021 01:58:23 -0800 (PST)
MIME-Version: 1.0
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609989081-29353-4-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609989081-29353-4-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 7 Jan 2021 17:58:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9aD1ZjVMZbQxL17HTz5fCP7-paZbx-ybMVAJ7QLrVydg@mail.gmail.com>
Message-ID: <CAAOTY_9aD1ZjVMZbQxL17HTz5fCP7-paZbx-ybMVAJ7QLrVydg@mail.gmail.com>
Subject: Re: [PATCH v9, 03/11] arm64: dts: mt8183: rename rdma fifo size
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIg35pelIOmAseWbmyDkuIrljYgxMToxMuWvq+mBk++8mgo+Cj4gcHJv
cGVydHkgbmFtZSBtdXN0IGluY2x1ZGUgb25seSBsb3dlcmNhc2UgYW5kICctJwoKUmV2aWV3ZWQt
Ynk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1v
ZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0tLQo+
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpIHwgNCArKy0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kKPiBpbmRleCA1Yjc4MmE0Li42Yzg0Y2Ni
NyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNp
Cj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQo+IEBAIC0x
MDExLDcgKzEwMTEsNyBAQAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmbW1z
eXMgQ0xLX01NX0RJU1BfUkRNQTA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlvbW11cyA9
IDwmaW9tbXUgTTRVX1BPUlRfRElTUF9SRE1BMD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
bWVkaWF0ZWssbGFyYiA9IDwmbGFyYjA+Owo+IC0gICAgICAgICAgICAgICAgICAgICAgIG1lZGlh
dGVrLHJkbWFfZmlmb19zaXplID0gPDUxMjA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIG1l
ZGlhdGVrLHJkbWEtZmlmby1zaXplID0gPDUxMjA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAg
IG1lZGlhdGVrLGdjZS1jbGllbnQtcmVnID0gPCZnY2UgU1VCU1lTXzE0MDBYWFhYIDB4YjAwMCAw
eDEwMDA+Owo+ICAgICAgICAgICAgICAgICB9Owo+Cj4gQEAgLTEwMjMsNyArMTAyMyw3IEBACj4g
ICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZtbXN5cyBDTEtfTU1fRElTUF9SRE1B
MT47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaW9tbXVzID0gPCZpb21tdSBNNFVfUE9SVF9E
SVNQX1JETUExPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBtZWRpYXRlayxsYXJiID0gPCZs
YXJiMD47Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgbWVkaWF0ZWsscmRtYV9maWZvX3NpemUg
PSA8MjA0OD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgbWVkaWF0ZWsscmRtYS1maWZvLXNp
emUgPSA8MjA0OD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgbWVkaWF0ZWssZ2NlLWNsaWVu
dC1yZWcgPSA8JmdjZSBTVUJTWVNfMTQwMFhYWFggMHhjMDAwIDB4MTAwMD47Cj4gICAgICAgICAg
ICAgICAgIH07Cj4KPiAtLQo+IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+
IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
