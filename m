Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2D51C6510
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 02:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F436E279;
	Wed,  6 May 2020 00:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513BA6E279
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 00:28:24 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB222206B8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 00:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588724904;
 bh=DWQzwXVi5jSpdNgL+w7PmIh4LeFt4VjFCSEDXC+7SwM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vPCVMxIGYGpadnCM+jgzVaFSvA1I9nglgBugGqwTM3AYb8hIYe2W3SZl4IeGrLHmp
 ALmred5Ng+DkaSqvPL2SlH2RYZYvWSgFroa04P1rPR5NGspbED9JIipwoyskh7uTFJ
 Q7ujj2Ue3DGl3Huxa5UGjol3FvS1V1HrZcjlK21o=
Received: by mail-ed1-f46.google.com with SMTP id d16so446551edq.7
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 17:28:23 -0700 (PDT)
X-Gm-Message-State: AGi0Pub7PARoaOXtT88sSLWrzJlcNkc2V2fOt+v8VtFhJWTC4Jm7PUPQ
 hEBKLS7SGdXhhzCVRzdqbjOgFopTDjRIuaU5LQ==
X-Google-Smtp-Source: APiQypIved3V8B2EWfluqDx98u8I6Wi+wk4pSnJc5XXqvvRqIaWvQAH7HQXR1ZWrM4QKK2OpRJ3waUIbH7TnOFtz2C0=
X-Received: by 2002:aa7:c649:: with SMTP id z9mr5024685edr.288.1588724902330; 
 Tue, 05 May 2020 17:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200420135045.27984-1-yuehaibing@huawei.com>
 <20200429071337.49528-1-yuehaibing@huawei.com>
 <CAAOTY__5rwRQhuy4vT8OiAKMM2bQtCb7w5AW9B5rqL+UVdVpsg@mail.gmail.com>
In-Reply-To: <CAAOTY__5rwRQhuy4vT8OiAKMM2bQtCb7w5AW9B5rqL+UVdVpsg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 6 May 2020 08:28:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Zaa4ecbmzpP+ikw435ig5c9tR1vZH6mK8bGo2dVGVew@mail.gmail.com>
Message-ID: <CAAOTY_-Zaa4ecbmzpP+ikw435ig5c9tR1vZH6mK8bGo2dVGVew@mail.gmail.com>
Subject: Re: [PATCH v3 -next] drm/mediatek: Fix Kconfig warning
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.orc,
 YueHaibing <yuehaibing@huawei.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFl1ZUhhaWJpbmc6CgpDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g
5pa8IDIwMjDlubQ05pyIMjnml6Ug6YCx5LiJIOS4i+WNiDEwOjE15a+r6YGT77yaCj4KPiBIaSwg
WXVlSGFpYmluZzoKPgo+IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4g5pa8IDIw
MjDlubQ05pyIMjnml6Ug6YCx5LiJIOS4i+WNiDM6MTTlr6vpgZPvvJoKPiA+Cj4gPiBXQVJOSU5H
OiB1bm1ldCBkaXJlY3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBNVEtfTU1TWVMKPiA+ICAg
RGVwZW5kcyBvbiBbbl06IChBUkNIX01FRElBVEVLIFs9eV0gfHwgQ09NUElMRV9URVNUIFs9bl0p
ICYmIENPTU1PTl9DTEtfTVQ4MTczX01NU1lTIFs9bl0KPiA+ICAgU2VsZWN0ZWQgYnkgW3ldOgo+
ID4gICAtIERSTV9NRURJQVRFSyBbPXldICYmIEhBU19JT01FTSBbPXldICYmIERSTSBbPXldICYm
IChBUkNIX01FRElBVEVLIFs9eV0gfHwgQVJNICYmIENPTVBJTEVfVEVTVCBbPW5dKSAmJiBDT01N
T05fQ0xLIFs9eV0gJiYgSEFWRV9BUk1fU01DQ0MgWz15XSAmJiBPRiBbPXldCj4gPgo+ID4gTWFr
ZSBEUk1fTUVESUFURUsgZGVwZW5kIG9uIE1US19NTVNZUyB0byBmaXggdGhpcy4KPgo+IFJldmll
d2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPgoKQXBwbGll
ZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xv
Zy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gPgo+ID4gRml4
ZXM6IDJjNzU4ZTMwMWVkOSAoInNvYyAvIGRybTogbWVkaWF0ZWs6IE1vdmUgcm91dGluZyBjb250
cm9sIHRvIG1tc3lzIGRldmljZSIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVo
YWliaW5nQGh1YXdlaS5jb20+Cj4gPiAtLS0KPiA+IHYzOiBtYWtlIERSTV9NRURJQVRFSyBkZXBl
bmRzIG9uIE1US19NTVNZUwo+ID4gdjI6IHNlbGVjdCBDT01NT05fQ0xLX01UODE3M19NTVNZUyBp
bnN0ZWFkIG9mIGFkZGluZyBEUk1fTUVESUFURUsgZGVwZW5kZW5jeQo+ID4gLS0tCj4gPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tj
b25maWcKPiA+IGluZGV4IGM0MjBmNWEzZDMzYi4uYWE3NGFhYzNjYmNjIDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9LY29uZmlnCj4gPiBAQCAtNiwxMiArNiwxMiBAQCBjb25maWcgRFJNX01F
RElBVEVLCj4gPiAgICAgICAgIGRlcGVuZHMgb24gQ09NTU9OX0NMSwo+ID4gICAgICAgICBkZXBl
bmRzIG9uIEhBVkVfQVJNX1NNQ0NDCj4gPiAgICAgICAgIGRlcGVuZHMgb24gT0YKPiA+ICsgICAg
ICAgZGVwZW5kcyBvbiBNVEtfTU1TWVMKPiA+ICAgICAgICAgc2VsZWN0IERSTV9HRU1fQ01BX0hF
TFBFUgo+ID4gICAgICAgICBzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiA+ICAgICAgICAgc2VsZWN0
IERSTV9NSVBJX0RTSQo+ID4gICAgICAgICBzZWxlY3QgRFJNX1BBTkVMCj4gPiAgICAgICAgIHNl
bGVjdCBNRU1PUlkKPiA+IC0gICAgICAgc2VsZWN0IE1US19NTVNZUwo+ID4gICAgICAgICBzZWxl
Y3QgTVRLX1NNSQo+ID4gICAgICAgICBzZWxlY3QgVklERU9NT0RFX0hFTFBFUlMKPiA+ICAgICAg
ICAgaGVscAo+ID4gLS0KPiA+IDIuMTcuMQo+ID4KPiA+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
