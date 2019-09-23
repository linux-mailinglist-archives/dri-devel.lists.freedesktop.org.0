Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B49BBAE19
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E4E6E113;
	Mon, 23 Sep 2019 06:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBBF6E0EA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 06:51:19 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id q1so30880204ion.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2019 23:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=evwzKkn5TJ8V/5p8U1GA5lnr2fQciYS7Ye2nzlu/Ar0=;
 b=i0p12UQDZSmUT+joZS/WuTou6C36bYiV7a41ge/s5yBDS8Zek7mzV72x1BevYn89iZ
 iVJpYciPTdoTTgSJWtCQRTooaGGm4OJhzOSsmcTuIy2TgIv1t6WYpliL2nMiVvWpWmew
 wtKahMa37ETwrpk6xUBOFPVo7E57y+tMqNYgi3S7A61oDEXJ7P//vOZe6iotbBoAz76r
 zK0XRRAgQ9bs0e2t/bWrdhdw7/fMaeQ8QnTpJ3UaTMjI8sX7cJbwD+O6xFttedD4hhCh
 6saYVTiHPt5Kt8GRQYjJbHhdyHwfeCFcuebW5zOfXQ/IqzlyNRsZOAfKL3okTdyTpqXz
 HZkQ==
X-Gm-Message-State: APjAAAWG6UKTKcG94f5TtmRPgzOe+EM6g4hHxhZaQMxGizXRR2/AgVbc
 KsHMZpgEOzrGnyGAxD/Olsi0S+wREmUvef0I2EE=
X-Google-Smtp-Source: APXvYqwHJLJqkepkero16CeFnVT2p/BRJnGlNyIoVpnrwyU/cIXQnIS9UN2pJqBGUqfPEiA0WorKHiMZRRy9rEkEMlE=
X-Received: by 2002:a5d:8b07:: with SMTP id k7mr27637147ion.20.1569221478478; 
 Sun, 22 Sep 2019 23:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190907090534.GB1712@pc-sasha.localdomain>
 <20190920194450.GA3970@pc-sasha.localdomain>
 <CAKMK7uECOW2YigBe7aeCDPYXoXJ8TVh65xvKBjJXXRt5Y7HngA@mail.gmail.com>
 <20190923063803.c7zpqwcqq5f2acq5@sirius.home.kraxel.org>
In-Reply-To: <20190923063803.c7zpqwcqq5f2acq5@sirius.home.kraxel.org>
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date: Mon, 23 Sep 2019 09:50:41 +0300
Message-ID: <CAJ1xhMV2ikra9udRhhLLntLxZKO23jLkU=9AeP=denALhw8r_w@mail.gmail.com>
Subject: Re: Kernel panic during drm/nouveau init 5.3.0-rc7-next-20190903
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:55:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=evwzKkn5TJ8V/5p8U1GA5lnr2fQciYS7Ye2nzlu/Ar0=;
 b=k42kXdpEzpJIgiprOwLFh1cwZ7Yys+0E1k4wofFz3IuJs4wWXaFe4JeJh15Ha/ekpH
 WI/bj3taqJE1PD5I+geYoVLCxlLk0XuLG3m0y2kX/2PZhuGWV+4QvOT9zMMdTmCrQMMt
 0pALJMqQn0OBD8xISo/RWq6z6LfVxJTncDdVWUN/U8FT/m4oLnmrtEK26QRpNFt/tMiF
 7Xv4V2MntqeOtGO3BXBGCqqvG1CqwddbzwbOn4TTVK/IWcQbqqrNsOwKxBo4NzysbZrL
 n9Lmr8aEt6jtGqL81UaeoUaelEXCXIKC8HkO1QnP6wt7RaC5MRkiyilWwufMzBj95MiH
 qYdw==
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-next <linux-next@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgOTozOCBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiA+ID4gJ0dpdCBiaXNlY3QnIGhhcyBpZGVudGlmaWVkIHRoZSBm
b2xsb3dpbmcgY29tbWl0cyBhcyBiZWluZyAnYmFkJy4KPiA+ID4KPiA+ID4gYjk2ZjNlN2M4MDY5
Yjc0OWE0MGNhM2EzM2M5NzgzNWQ1N2RkNDVkMiBpcyB0aGUgZmlyc3QgYmFkIGNvbW1pdAo+ID4g
PiBjb21taXQgYjk2ZjNlN2M4MDY5Yjc0OWE0MGNhM2EzM2M5NzgzNWQ1N2RkNDVkMgo+ID4gPiBB
dXRob3I6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+ID4gPiBEYXRlOiAgIE1v
biBBdWcgNSAxNjowMToxMCAyMDE5ICswMjAwCj4gPiA+Cj4gPiA+ICAgICBkcm0vdHRtOiB1c2Ug
Z2VtIHZtYV9ub2RlCj4gPiA+Cj4gPiA+ICAgICBEcm9wIHZtYV9ub2RlIGZyb20gdHRtX2J1ZmZl
cl9vYmplY3QsIHVzZSB0aGUgZ2VtIHN0cnVjdAo+ID4gPiAgICAgKGJhc2Uudm1hX25vZGUpIGlu
c3RlYWQuCj4gPiA+Cj4gPiA+ICAgICBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KPiA+ID4gICAgIFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiA+ICAgICBMaW5rOiBodHRwOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDgwNTE0MDExOS43MzM3LTkta3JheGVs
QHJlZGhhdC5jb20KPgo+ID4gPiBUb2RheSwgSSB1cGdyYWRlZCB0aGUga2VybmVsIHRvIDUuMy4w
LW5leHQtMjAxOTA5MTksIHdoaWNoIGJvb3RlZCBmaW5lCj4gPiA+IHdpdGggbm8gWG9yZyByZWdy
ZXNzaW9ucyB0byByZXBvcnQuCj4gPiA+Cj4gPiA+IEp1c3Qgd29uZGVyaW5nIGlmIHRoZSBlYXJs
aWVyIGtlcm5lbHMgd291bGQgbm90IGJvb3QgZm9yIG1lIGJlY2F1c2Ugb2YKPiA+ID4gdGhlIGNo
YW5nZXMgaW50cm9kdWNlZCBieSB0aGUgJ2JhZCcgY29tbWl0cyBiZWluZyBwZXJoYXBzIGluY29t
cGxldGU/Cj4KPiBZZXMsIHdlIGhhZCBhIHJlZ3Jlc3Npb24gaW4gbm91dmVhdSwgZml4ZWQgYnkg
dGhpcyBwYXRjaCAoaW4gZHJtLW1pc2MtbmV4dCk6Cj4KPiBjb21taXQgMDE5Y2JkNGE0ZmViM2Fh
M2E5MTdkNzhlNzExMGUzMDExYmJmZjZkNQo+IEF1dGhvcjogVGhpZXJyeSBSZWRpbmcgPHRyZWRp
bmdAbnZpZGlhLmNvbT4KPiBEYXRlOiAgIFdlZCBBdWcgMTQgMTE6MDA6NDggMjAxOSArMDIwMAo+
Cj4gICAgIGRybS9ub3V2ZWF1OiBJbml0aWFsaXplIEdFTSBvYmplY3QgYmVmb3JlIFRUTSBvYmpl
Y3QKPgo+ICAgICBUVE0gYXNzdW1lcyB0aGF0IGRyaXZlcnMgaW5pdGlhbGl6ZSB0aGUgZW1iZWRk
ZWQgR0VNIG9iamVjdCBiZWZvcmUKPiAgICAgY2FsbGluZyB0aGUgdHRtX2JvX2luaXQoKSBmdW5j
dGlvbi4gVGhpcyBpcyBub3QgY3VycmVudGx5IHRoZSBjYXNlCj4gICAgIGluIHRoZSBOb3V2ZWF1
IGRyaXZlci4gRml4IHRoaXMgYnkgc3BsaXR0aW5nIHVwIG5vdXZlYXVfYm9fbmV3KCkKPiAgICAg
aW50byBub3V2ZWF1X2JvX2FsbG9jKCkgYW5kIG5vdXZlYXVfYm9faW5pdCgpIHNvIHRoYXQgdGhl
IEdFTSBjYW4KPiAgICAgYmUgaW5pdGlhbGl6ZWQgYmVmb3JlIFRUTSBCTyBpbml0aWFsaXphdGlv
biB3aGVuIG5lY2Vzc2FyeS4KPgo+ICAgICBGaXhlczogYjk2ZjNlN2M4MDY5ICgiZHJtL3R0bTog
dXNlIGdlbSB2bWFfbm9kZSIpCj4gICAgIEFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4KPiAgICAgQWNrZWQtYnk6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNv
bT4KPiAgICAgU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNv
bT4KPiAgICAgTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21z
Z2lkLzIwMTkwODE0MDkzNTI0LkdBMzEzNDVAdWxtbwo+Cj4gSFRILAo+ICAgR2VyZAo+CgpUZXJy
aWZpYy4KVGhhbmtzIGZvciB0aGUgaW5mby4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
