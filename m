Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA622C937C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B5689D60;
	Tue,  1 Dec 2020 00:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C471689D5F;
 Tue,  1 Dec 2020 00:00:59 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id y74so16225811oia.11;
 Mon, 30 Nov 2020 16:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vwAi3j5hKUR5I3v6aaEnj4yZwa+jhIFvRIVmx73mGr4=;
 b=OccpJsDXy6hPItda+235fnSn3RIRuNx9jcOkicT3aqwbLaSal8DSKc8M2vcptYVgCF
 LTFJv5PqxAH9vQDm094SUFW1SAXEYcKoW2Z3tm3KjcoBon8LFhGAUQEj/iH94aR87SkU
 irGBc0VvtBPN3DGph717/v2k3wX5I3qWlT7YOsFG5x0kv8xRYVmXuU7qn2P7chMDDr+w
 ER1dwbim9HiWDTd+F6KiLbsoKmdoRfg5e+i6Kuzekxm5q3SGigkz0Gkvm3r/YCMdFgI/
 gbwAyHrRcaYoPjDLW/8W9MydFstmDKcBez1zQXXbyYfv5Uo1x/bVxqP+V+rThVwYcjFY
 d+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vwAi3j5hKUR5I3v6aaEnj4yZwa+jhIFvRIVmx73mGr4=;
 b=LW2mpm+0gWqXEU3AEj/LSY/pm6ecpIKrs4TP4iYw8q2luG5Fjq7F3XuelzEt71Rmco
 XGS8UkwU8RBOwP4rbqlP4MdXuhNrSZvi58jQ5UyxWCm2AHK+wJlGVc+6QmkFCMov1p62
 iCdEJ1uDRUApezvhT9MVwk7Vd4n22bsgy5CG5YjfMZp/aiaWWhhch+hrx1orBpd+CjMu
 DnG1uEcpOv0Gdb+TXApsqNdsTq+qsOzGRkJAg1U4YiRoZ0efeGhHckHdDN/fqOIZZ5jN
 UeJyCXJtQN3sUAVxwIyxAbDfNTfUyaUIxLxKXR1t9XsVoKDnbHX/tv02mXh30uXwGFx0
 ahPQ==
X-Gm-Message-State: AOAM530ehj6WMb9P6p8aJ8/3W2G1JdF3RTS8rYh9zAnK666fNIvgiVOT
 z2zgCz0gCiZ2k+Z6Ji5JaZzRU7iD5GY10+Z3OxQhfmNn
X-Google-Smtp-Source: ABdhPJx5EW3BogA2TAlZ64hzqIRBxOKmP654oJ/bpQBGF7Yyxc8Qa/aoJ30NVr2vA++NbUaH/yizaWY2sbRPKMRxuHs=
X-Received: by 2002:a54:4608:: with SMTP id p8mr28704oip.5.1606780859215; Mon,
 30 Nov 2020 16:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-34-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-34-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 19:00:47 -0500
Message-ID: <CADnq5_OoA_mGiDmW=P4CW-KYNsR9W2Fu8uFwXzm_mQGBTJqkKQ@mail.gmail.com>
Subject: Re: [PATCH 33/40] drm/amd/display/dc/inc/hw/dpp: Mark
 'dpp_input_csc_matrix' as __maybe_unused
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgODo0MyBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+ICdkcHBfaW5wdXRfY3NjX21hdHJpeCcgaXMgdXNlZCBieSBzb21l
LCBidXQgbm90IGFsbCBzb3VyY2UgZmlsZXMgd2hpY2gKPiBpbmNsdWRlIGRwcC5oLgo+Cj4gRml4
ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9pbmMvaHcvZHBwLmg6NTA6NDI6IHdh
cm5pbmc6IOKAmGRwcF9pbnB1dF9jc2NfbWF0cml44oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFst
V3VudXNlZC1jb25zdC12YXJpYWJsZT1dCj4KPiBOQjogU25pcHBlZCBsb3RzIG9mIHRoZXNlIGZv
ciBicmV2aXR5Cj4KPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+
Cj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVk
LiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2luYy9ody9kcHAuaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2luYy9ody9kcHAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcv
ZHBwLmgKPiBpbmRleCA2NzUxMTg2ZjZmOTA0Li5kZGJlNGJiNTI3MjRhIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvZHBwLmgKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2RwcC5oCj4gQEAgLTQ3LDcgKzQ3LDcg
QEAgc3RydWN0IGRwcF9pbnB1dF9jc2NfbWF0cml4IHsKPiAgICAgICAgIHVpbnQxNl90IHJlZ3Zh
bFsxMl07Cj4gIH07Cj4KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBkcHBfaW5wdXRfY3NjX21hdHJp
eCBkcHBfaW5wdXRfY3NjX21hdHJpeFtdID0gewo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRwcF9p
bnB1dF9jc2NfbWF0cml4IF9fbWF5YmVfdW51c2VkIGRwcF9pbnB1dF9jc2NfbWF0cml4W10gPSB7
Cj4gICAgICAgICB7Q09MT1JfU1BBQ0VfU1JHQiwKPiAgICAgICAgICAgICAgICAgezB4MjAwMCwg
MCwgMCwgMCwgMCwgMHgyMDAwLCAwLCAwLCAwLCAwLCAweDIwMDAsIDB9IH0sCj4gICAgICAgICB7
Q09MT1JfU1BBQ0VfU1JHQl9MSU1JVEVELAo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
