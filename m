Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEA320F6FA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 16:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3BF6E105;
	Tue, 30 Jun 2020 14:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192EA6E105
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 14:19:36 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a6so16066525wmm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 07:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rdBYXLe8Fldny/ED4Yh8+ArWp9RzNrsXjG/M2HkP9p4=;
 b=CCwgExVjYa7YtTdMuRwQ0sZsicpVy4Nq7ofo9+KZAlrvwtvhJ7DlG4+WqEos32dgMl
 HrO0c2GIz/ORZDuZrtvvW1WlPU592YgD3PfwqdHFW1Oahpq+wyl6MBP9j0MC9KBphE9y
 xAm2PD7dX2nuIblkGl0csSACkfovd7BNxHQEe7Q3RKHJndrp6EcBbS1p64a0Mvxdb+t0
 n8pIwo9hodprUxHXjJH8SEvE9ePZgzLpjSZNTlTYjuHRbBf445INb0Ogzzw20e81ug7C
 tfmhvXFp/AVdV0j4RAtjC3rC+wUzf75iDwhK3635KM8a8NfxlC0reO8nj5WlOnhGf42T
 V69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rdBYXLe8Fldny/ED4Yh8+ArWp9RzNrsXjG/M2HkP9p4=;
 b=g3pYUg2+CGqcFm0YAYbWV7YqzwE8kQjhtHqnKZFA/lQFnaUSPoJATGpy6l2l3ma9Xq
 TFvbbLCFWs9M7hvwp/WhTGulJK70DrG6eo4l4JELa/fs55ZmEC+uz1C/RYbASG91J71K
 5SMjMlJGmqBJbvOnF3naXDcGr140PmgG5wlmhWF8Yd/B8HEdKnrwlBWBo9kQrwoe1GHR
 xkun2wFG3844g2Nqb+JMKKdjypzKN4l/5fRYPR36FV1uM3v5+00x09RXHyb/mpFSEy4w
 vNok11ZM4s9bXc+7Gi73Hl5h5vNDQ7UKdq+hi6k/T/iLgx2fD1rQQukW+Z3D4pw6ONTA
 s+3A==
X-Gm-Message-State: AOAM532cibzl6hyC4DxwHsQgS/HKXpJ7ZK1PegjIoHD5s3mFvreqSqmp
 gWf0dYnP1jVaJD4L13J9o/Yu6w3GZlw+xLqgNsg=
X-Google-Smtp-Source: ABdhPJyyFJzWgv9au9LZmc5AkTlZ0SDiWsM58qrnFS4h0VkAXIaN7IgNcB/lcV6jabaaJMl4hcwuU2m4nLYzCfA2fEM=
X-Received: by 2002:a1c:3954:: with SMTP id g81mr21663433wma.73.1593526774709; 
 Tue, 30 Jun 2020 07:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tz7E5rmRdqWwGQCsS+q+UcPU7XTxsGgkCggQXA8ktn0pw@mail.gmail.com>
 <20200630141505.GE6112@intel.com>
In-Reply-To: <20200630141505.GE6112@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 30 Jun 2020 10:19:23 -0400
Message-ID: <CADnq5_PdqNjD2OnWGWJxv-Q-YUN4ymLUxTdT9km_ESS2cwm68A@mail.gmail.com>
Subject: Re: warning in omap_connector
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMzAsIDIwMjAgYXQgMTA6MTUgQU0gVmlsbGUgU3lyasOkbMOkCjx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAzMCwgMjAyMCBh
dCAwNDozMzozN1BNICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToKPiA+IEhleSBMYXVyZW50LAo+
ID4KPiA+IEkgbWVyZ2VkIGRybS1taXNjLW5leHQgYW5kIG5vdGljZWQgdGhpcywgSSdtIG5vdCBz
dXJlIGlmIGl0J3MKPiA+IGNvbGxhdGVyYWwgZGFtYWdlIGZyb20gc29tZXRoaW5nIGVsc2UgY2hh
bmdpbmcgb3IgSSd2ZSBqdXN0IG1pc3NlZCBpdAo+ID4gcHJldmlvdXNseS4gMzItYml0IGFybSBi
dWlsZC4KPiA+Cj4gPgo+ID4gL2hvbWUvYWlybGllZC9kZXZlbC9rZXJuZWwvZGltL3NyYy9kcml2
ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Nvbm5lY3Rvci5jOgo+ID4gSW4gZnVuY3Rpb24g4oCY
b21hcF9jb25uZWN0b3JfbW9kZV92YWxpZOKAmToKPiA+IC9ob21lL2FpcmxpZWQvZGV2ZWwva2Vy
bmVsL2RpbS9zcmMvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jb25uZWN0b3IuYzo5Mjo5
Ogo+ID4gd2FybmluZzogYnJhY2VzIGFyb3VuZCBzY2FsYXIgaW5pdGlhbGl6ZXIKPiA+ICAgc3Ry
dWN0IGRybV9kaXNwbGF5X21vZGUgbmV3X21vZGUgPSB7IHsgMCB9IH07Cj4KPiBQcm9iYWJseSBm
YWxsb3V0IGZyb20gbXkgZHJtX2Rpc3BsYXlfbW9kZSBzaHJpbmthZ2UuCj4KPiBHb2luZyB0byBy
ZXBlYXQgbXkgdXN1YWwgImp1c3QgdXNlIHt9IHdoZW4gemVybyBpbml0aWFsaXppbmcKPiBzdHJ1
Y3RzIiByZWNvbW1lbmRhdGlvbi4gQXZvaWRzIHRoZXNlIHN0dXBpZCB3YXJuaW5ncywgYW5kIElN
Two+IGFsc28gY29udmV5cyB0aGUgbWVhbmluZyBiZXR0ZXIgc2luY2UgdGhlcmUncyBubyBhbWJp
Z3VpdHkKPiBiZXR3ZWVuIHplcm8gaW5pdGlhbGl6aW5nIHRoZSB3aG9sZSBzdHJ1Y3QgdnMuIHpl
cm8gaW5pdGlhbGl6aW5nCj4ganVzdCB0aGUgZmlyc3QgbWVtYmVyLgoKSUlSQywgTExWTSBhbmQg
R0NDIHRyZWF0IHRoZXNlIHNsaWdodGx5IGRpZmZlcmVudGx5LiAgV2UndmUgZ2VuZXJhbGx5Cmp1
c3QgbW92ZWQgdG8gdXNpbmcgbWVtc2V0IHRvIGF2b2lkIGRpZmZlcmVudCBjb21waWxlciBjb21w
bGFpbnRzIHdoZW4KdXNpbmcgdGhlc2UuCgpBbGV4Cgo+Cj4gPiAgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+Cj4gPiAvaG9tZS9haXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL29tYXBfY29ubmVjdG9yLmM6OTI6OToKPiA+IG5vdGU6IChuZWFyIGluaXRp
YWxpemF0aW9uIGZvciDigJhuZXdfbW9kZS5jbG9ja+KAmSkKPiA+Cj4gPiBEYXZlLgo+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4K
PiAtLQo+IFZpbGxlIFN5cmrDpGzDpAo+IEludGVsCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
