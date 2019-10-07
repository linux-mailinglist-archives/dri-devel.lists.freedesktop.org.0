Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B242CE89A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 18:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8E16E158;
	Mon,  7 Oct 2019 16:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECB76E140;
 Mon,  7 Oct 2019 16:06:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w12so16016753wro.5;
 Mon, 07 Oct 2019 09:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UO5DnHkttF/IxDQcQKOk9eSbt7yoz0JBUdSNkQ1IXmg=;
 b=LjFjhY5BnU8CU7ZwnCAzG79vwt5M5a6wewJ4Sl5zfTrKGj/5kTZ+74zqGX8awgydpV
 exRLG+9Xjw0iacu6dqCabebTIsyaOacBsBXfzR/ylAxdAtaKhX6IZVKK8dAMhD8vg0w4
 IU0j/+elj8XndrbA//fsnnXugEE0xytos9M0rDnLImyLRLlu/iNXDGUfSn2eQvzUKPMn
 B1V1eNHN6/zNlHnUStLWQU5Q2dei84iNmhma6KzFX1/dLoJMVRzZqg1fgPeQnuJyHK5r
 9hsog0gu43clZszzmpwm+Ao9lTzLlM18SI7eMeRL6hh1Edm4hIngawslAp+lkEWnoKeL
 pVwQ==
X-Gm-Message-State: APjAAAUGg/UJ0w502Gc/47LBkYvXhlgSZFXKob1m8/ocYC9nlaNhUrXD
 34K5oEEqbxhcxZ87LYuRSKtVMth/DNxL34zeBNE=
X-Google-Smtp-Source: APXvYqxlLQThATUxba72YxTF1mD0OWv8L5tcMETwDHaKLYWk4rFG+XmRyDyxq5Y7AfjRXQzKbNQaRcLVVW6sbUA0UYA=
X-Received: by 2002:a5d:6052:: with SMTP id j18mr12867036wrt.40.1570464361311; 
 Mon, 07 Oct 2019 09:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191006074404.48416-1-yuehaibing@huawei.com>
In-Reply-To: <20191006074404.48416-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Oct 2019 12:05:48 -0400
Message-ID: <CADnq5_Pjh2xXFHOSHg2NVQfYju21LUnWeAC4+rv-G2_hJVmOYw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: remove duplicated include from
 mmhub_v1_0.c
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UO5DnHkttF/IxDQcQKOk9eSbt7yoz0JBUdSNkQ1IXmg=;
 b=aexpecD6viCna85hBK3lWtRFaA408/UmysRT8DRcBfpZSg93NgPsWcA4y17eJpv98+
 Lr4S9qqYNqBe2aZaO23qbggLovVN5X3oA6Ns8RQwEbPekQN8UhAkBzKmOYpqDLiWZd1C
 McFyohhiA3d+zVqkfkOp6KSjYyjy/Po+Uc5rT7Vqnu6YpiMwh6kljvYVoeljT5Oxy3QE
 nrtrW7VQFOt4wI1D3bbGyRtHwkOzagybm6YggBHiXszScbjYaq8rwtiNweixbcqQMk18
 y7OYLkU4b7xpVV7vWkW7LPNyOojdyyd0wK6FKRQMxGELi7/VnMEX/IBK9F0zv9GWPm/G
 bClA==
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
Cc: Yong Zhao <Yong.Zhao@amd.com>, Dave Airlie <airlied@linux.ie>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Le.Ma" <le.ma@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Trigger Huang <Trigger.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIFN1biwgT2N0IDYsIDIwMTkgYXQgMTE6MDUgUE0g
WXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPiB3cm90ZToKPgo+IFJlbW92ZSBkdXBs
aWNhdGVkIGluY2x1ZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5n
QGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Yx
XzAuYyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYwo+IGluZGV4IDRjN2U4YzY0YTk0ZS4uNjk2NWUx
ZTZmYTllIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Yx
XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYwo+IEBA
IC0zMSw3ICszMSw2IEBACj4gICNpbmNsdWRlICJ2ZWdhMTBfZW51bS5oIgo+Cj4gICNpbmNsdWRl
ICJzb2MxNV9jb21tb24uaCIKPiAtI2luY2x1ZGUgImFtZGdwdV9yYXMuaCIKPgo+ICAjZGVmaW5l
IG1tREFHQjBfQ05UTF9NSVNDMl9SViAweDAwOGYKPiAgI2RlZmluZSBtbURBR0IwX0NOVExfTUlT
QzJfUlZfQkFTRV9JRFggMAo+Cj4KPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
