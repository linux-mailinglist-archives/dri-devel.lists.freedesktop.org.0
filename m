Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93641FB3A0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 16:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA086ED59;
	Wed, 13 Nov 2019 15:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899406ED60;
 Wed, 13 Nov 2019 15:24:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q70so2431116wme.1;
 Wed, 13 Nov 2019 07:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EZIr8n1tU+j0xhtRpbzRhBLFBsZMuPY7L0CnRVcZR4k=;
 b=Xg6mXu5iAfx97LogtGgvETssaQcsvkM8Any+OutEGDtbnClqGZeVpHxCfldchG9Vs3
 rhxMBJgp91tcF684+sf+H8bm0qzF5Gv2+gHUASRgw+q8Sb9olK/52X0BWg2rmAa+GvK4
 XH3c/TFpPty3UJkV91KnIGsMc/eRsvOm7yOo63W2fViAFq6Wp93l94Twqu9clohEIQ1W
 ONlkf0JkepG2O9QyGVhwZ6AWLmrV0Z8r4YyWykHXCCI9YcpVHHRJfLtiIghWQGkjP4nc
 oh12lGN5llo2uOIC5ChBzIi3FI4T/xgmBCqUHkuLyUU+Pnzs24gOX8nVHqXg/g5lra0Q
 8CZQ==
X-Gm-Message-State: APjAAAU71eJxf/I3yseMPN89xnAI6KAeStJOel2BesiUhvyDFI9KukPZ
 CGX8RPm9zEV4tRAC6Px2F7mS1rCBZ6N0E4ul7+E=
X-Google-Smtp-Source: APXvYqyh/U3wryjoZZSptRRKloXLftAMfY1jR1cvrpoCxOaKPTJf/IYD45uGLGkd1pxrgI+3IHhHsLJO4Mf4t58c4rs=
X-Received: by 2002:a1c:790b:: with SMTP id l11mr3485526wme.127.1573658659004; 
 Wed, 13 Nov 2019 07:24:19 -0800 (PST)
MIME-Version: 1.0
References: <1573649074-72589-1-git-send-email-yukuai3@huawei.com>
In-Reply-To: <1573649074-72589-1-git-send-email-yukuai3@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 13 Nov 2019 10:24:07 -0500
Message-ID: <CADnq5_P38AfOHtRAAYXHVmjPPS9ot4NTGX-dQXgeUiGUjYUCHw@mail.gmail.com>
Subject: Re: [PATCH 0/7] various '-Wunused-but-set-variable' gcc warning fixes
To: yu kuai <yukuai3@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EZIr8n1tU+j0xhtRpbzRhBLFBsZMuPY7L0CnRVcZR4k=;
 b=c/X7BxOj/QjILROu0J4DmJluqRkTUtYoR0f7eEpN/8Yq7Vyg64Xb8zYRvXYHRBDTfI
 Qahh/XnS36s2Q3+nuvxj8n0hh4V+DEQq3MlaejW5Yv/uRPSEPqtWTG9ZTc9Jz3hzIakk
 HnZjZUGnvxb08VG5g26S5ivktTIFPJ9FWZrCnuYgITCkeu5uPgsIx/6FCy5+qGyhhQ/2
 pqxmX75YScunIZ3uUo6Krl8P/I23/PJ4eDzVVO6Zuh/q9Qty81S2NJ8ubrVbmrsfHgYZ
 2Hsk9KE1rsL1pb/e0qyiNonYkWoI1lx4Lqrsq9Q30l+ASHJBNVaxitEpDqH1lndQKH3Y
 s3uw==
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
Cc: yi.zhang@huawei.com, Dave Airlie <airlied@linux.ie>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, zhengbin <zhengbin13@huawei.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Rex Zhu <Rex.Zhu@amd.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZCB0aGUgc2VyaWVzLCBhbHRob3VnaCBhIGNvdXBsZSBvZiB0aGUgcGF0Y2hlcyB3ZXJl
IGFscmVhZHkKYXBwbGllZCBmcm9tIGEgcHJldmlvdXMgcGF0Y2ggc2V0LgoKVGhhbmtzLAoKQWxl
eAoKT24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgOToxMiBBTSB5dSBrdWFpIDx5dWt1YWkzQGh1YXdl
aS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBzZXQgZml4ZXMgdmFyaW91cyB1bnJlbGF0ZWQg
Z2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJwo+IHdhcm5pbmdzLgo+Cj4geXUga3VhaSAo
Nyk6Cj4gICBkcm0vYW1kZ3B1OiByZW1vdmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJsZSAnbWNf
c2hhcmVkX2NobWFwJyBmcm9tCj4gICAgICdnZnhfdjZfMC5jJyBhbmQgJ2dmeF92N18wLmMnCj4g
ICBkcm0vYW1kZ3B1OiByZW1vdmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJsZSAnYW1kZ3B1X2Nv
bm5lY3RvcicKPiAgIGRybS9hbWRncHU6IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxl
ICdjb3VudCcKPiAgIGRybS9hbWRncHU6IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxl
ICdpbnZhbGlkJwo+ICAgZHJtL2FtZGdwdTogcmVtb3ZlIHNldCBidXQgbm90IHVzZWQgdmFyaWFi
bGUgJ3RocmVzaG9sZCcKPiAgIGRybS9hbWRncHU6IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZh
cmlhYmxlICdzdGF0ZScKPiAgIGRybS9hbWRncHU6IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZh
cmlhYmxlICd1c19tdmRkJwo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmRfZ3B1dm0uYyAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rpc3BsYXkuYyAgICAgICAgIHwgIDIgLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3Y2XzAuYyAgICAgICAgICAgICAgIHwgIDMgKy0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dmeF92N18wLmMgICAgICAgICAgICAgICB8ICAzICstLQo+ICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgICAgICAgICAgICAgfCAgNCArKy0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1nci5jICB8ICA3
ICsrLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3ZlZ2FtX3Nt
dW1nci5jIHwgMTIgLS0tLS0tLS0tLS0tCj4gIDcgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAyNyBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi43LjQKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
