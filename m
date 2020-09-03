Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A8D25CE21
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 00:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A45C6EA3D;
	Thu,  3 Sep 2020 22:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E096EA3D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 22:54:44 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D25A2078E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 22:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599173683;
 bh=UXKo8kyys7Jj/KQr45tWL3zKiNH9QtHrNfzW2RvKWt0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EmXfwBYt3D5p90EF4QL4KaB9rOBoRovhKKBkFVE8uGA5dui+0P8hxZrd3FY69Wliu
 TTk9c/A0IjU+NziYUsCaN76rxm3L/o0iaout5mKVSD5nkUgrmwzBBpATVKe/S5ftGP
 8y9pRGpGCh2RjzS9I/QpFRr1OIiFLmH8uoXa9OuQ=
Received: by mail-ed1-f51.google.com with SMTP id w1so4312697edr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 15:54:43 -0700 (PDT)
X-Gm-Message-State: AOAM530lgla92+sziZJRHG9maGpZtMdIEZMSyeZQaUIs4mmDmeXC26fb
 KfFubsT8i7di9rNAB8fkTTavKV5C73yU0xa/Og==
X-Google-Smtp-Source: ABdhPJxV4e9JXF8pl9lR06Tx6AQ3q1ACWUDkZvY2hawRP5jIfK2LoCgaT7r5tM+Hy5bnYViKitxKW+Li7urVLN9lTTw=
X-Received: by 2002:aa7:dcd2:: with SMTP id w18mr5713705edu.288.1599173682230; 
 Thu, 03 Sep 2020 15:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200819081752.4805-1-linux@fw-web.de>
 <3B754053-BA89-4DB7-A089-665C5B6B34CC@public-files.de>
In-Reply-To: <3B754053-BA89-4DB7-A089-665C5B6B34CC@public-files.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 4 Sep 2020 06:54:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9TYUWWNg+1zT4LwomrabBsiZQKXAS9jTHCFKiAmCm4PA@mail.gmail.com>
Message-ID: <CAAOTY_9TYUWWNg+1zT4LwomrabBsiZQKXAS9jTHCFKiAmCm4PA@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] make hdmi work on bananapi-r2
To: Frank Wunderlich <frank-w@public-files.de>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaWvCAyMDIw5bm0Oeac
iDPml6Ug6YCx5ZubIOS4i+WNiDExOjA35a+r6YGT77yaCj4KPiBIaQo+Cj4gQW55IG9waW5pb24g
YWJvdXQgRFRTIFBhdGNoZXM/IFdoaWNoIG1haW50YWluZXIgd2lsbCBpbmNsdWRlIGl0IGluIHRy
ZWU/IElzIGFueSBhY2svcmV2aWV3IG5lZWRlZD8KCkFjY29yZGluZyB0byBtYWludGFpbmVyIGxp
c3QgWzFdLCB0aGUgbWFpbnRhaW5lciBpcwoKQVJNL01lZGlhdGVrIFNvQyBzdXBwb3J0Ck06IE1h
dHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Ckw6IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyAobW9kZXJhdGVkIGZvciBub24tc3Vic2NyaWJlcnMpCkw6
IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcgKG1vZGVyYXRlZCBmb3Igbm9uLXN1
YnNjcmliZXJzKQpTOiBNYWludGFpbmVkClc6IGh0dHBzOi8vbXRrLmJjbmZzLm9yZy8KQzogaXJj
Oi8vY2hhdC5mcmVlbm9kZS5uZXQvbGludXgtbWVkaWF0ZWsKRjogYXJjaC9hcm0vYm9vdC9kdHMv
bXQ2KgpGOiBhcmNoL2FybS9ib290L2R0cy9tdDcqCkY6IGFyY2gvYXJtL2Jvb3QvZHRzL210OCoK
RjogYXJjaC9hcm0vbWFjaC1tZWRpYXRlay8KRjogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay8KRjogZHJpdmVycy9zb2MvbWVkaWF0ZWsvCk46IG10awpOOiBtdFs2NzhdCks6IG1lZGlhdGVr
CgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KClsxXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9s
aW51eC9NQUlOVEFJTkVSUwoKPiByZWdhcmRzIEZyYW5rCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
