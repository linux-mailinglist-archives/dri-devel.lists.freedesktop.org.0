Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398EA1664E9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 18:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B322896DD;
	Thu, 20 Feb 2020 17:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB525896DD;
 Thu, 20 Feb 2020 17:32:57 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id 7so3180694vsr.10;
 Thu, 20 Feb 2020 09:32:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FQc9DcjywetNpCF4Lbw4T0x+cYC+tfLtotoC3/DL5NA=;
 b=bQqJ6FBa+S0W23bXMeA9YwD6bxuaReRVUm4JaiorL8wMneTeb1j9Rnxid11uayP0Yi
 +zumKWFuJHAJsYp/5TqoSqZxf54HgnbilPifxPcp0zXeF2TLuntoJIaUAJDXB4En3u03
 DpMIH1lARvZwaPaCPV02/eo40aZAkKdTzblCFr2OVINHwLIeWpP/Qh06FpMdbTjrkr0D
 XtCzShZkMF25GBiKKuZ908iLf3hGqp5qmmTH9nhiMcAP/TtcSiePY9huP1RXeK13o5Nm
 QMT3P21S4boFdKWPa15VnMCoaDh/n9nXvRA/KFpOMZP+2VggaSoJ6RkRKX84jV8han+B
 lHUA==
X-Gm-Message-State: APjAAAV578ZaZCW9G0neKNvzO25V9Cr0CfJHXbGxXstGiXvTAbNRpvdK
 dClNSugAvbNr6Mzd5He04FJGqKwNxnOnRiiK9tw=
X-Google-Smtp-Source: APXvYqx4kt7MHHbKi0SjwgZkjp+H3tuQgvLnGV4lQ1Qi1dUUjvSAWJLZlwr3QRTs60UyN+0mHesS993+k7i+NF7ntmI=
X-Received: by 2002:a67:f412:: with SMTP id p18mr18444585vsn.207.1582219976717; 
 Thu, 20 Feb 2020 09:32:56 -0800 (PST)
MIME-Version: 1.0
References: <dac89843-5258-5bed-ee86-7038e94e56da@qubes-os.org>
 <c94ce223-56d5-e31a-2a2c-59defb988b28@qubes-os.org>
In-Reply-To: <c94ce223-56d5-e31a-2a2c-59defb988b28@qubes-os.org>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 20 Feb 2020 12:32:45 -0500
Message-ID: <CAKb7Uvh8Ob592LOizH9FGZz5ag=VJ3R=dh0G5iZSg2-JzWZFMQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] nv50_disp_chan_mthd: ensure mthd is not NULL
To: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRnLDqWTDqXJpYywKCkl0IGFwcGVhcnMgQmVuIG1hZGUgaGlzIG93biB2ZXJzaW9uIG9mIHRo
aXMgcGF0Y2ggKHByb2JhYmx5IGJhc2VkIG9uCnRoZSBvbmUgeW91IGFkZGVkIHRvIHRoZSBrZXJu
ZWwgYnopLCBhbmQgaXQncyBhbHJlYWR5IHVwc3RyZWFtOgoKaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aD12
NS42LXJjMiZpZD0wZTYxNzZjNmQyODYzMTZlOTQzMWI0ZjY5NTk0MGNmYWM0ZmZlNmMyCgpDaGVl
cnMsCgogIC1pbGlhCgpPbiBUaHUsIEZlYiAyMCwgMjAyMCBhdCAxMjoxOSBQTSBGcsOpZMOpcmlj
IFBpZXJyZXQKPGZyZWRlcmljLnBpZXJyZXRAcXViZXMtb3Mub3JnPiB3cm90ZToKPgo+IEhpLAo+
IElzIGFueXRoaW5nIG1pc3NpbmcgaGVyZT8gSG93IGNhbiBJIGdldCB0aGlzIG1lcmdlZD8KPgo+
IEJlc3QgcmVnYXJkcywKPiBGcsOpZMOpcmljIFBpZXJyZXQKPgo+IE9uIDIwMjAtMDItMDggMjA6
NDMsIEZyw6lkw6lyaWMgUGllcnJldCB3cm90ZToKPiA+IFBvaW50ZXIgdG8gc3RydWN0dXJlIGFy
cmF5IGlzIGFzc3VtZWQgbm90IE5VTEwgYnkgZGVmYXVsdC4gSXQgaGFzCj4gPiB0aGUgY29uc2Vx
dWVuY2UgdG8gcmFpc2UgYSBrZXJuZWwgcGFuaWMgd2hlbiBpdCdzIG5vdCB0aGUgY2FzZS4KPiA+
Cj4gPiBCYXNpY2FsbHksIHJ1bm5pbmcgYXQgbGVhc3QgYSBSVFgyMDgwVEkgb24gWGVuIG1ha2Vz
IGEgYmFkIG1taW8gZXJyb3IKPiA+IHdoaWNoIGNhdXNlcyBoYXZpbmcgJ210aGQnIHBvaW50ZXIg
dG8gYmUgTlVMTCBpbiAnY2hhbm52NTAuYycuIEZyb20gdGhlCj4gPiBjb2RlLCBpdCdzIGFzc3Vt
ZWQgdG8gYmUgbm90IE5VTEwgYnkgYWNjZXNzaW5nIGRpcmVjdGx5ICdtdGhkLT5kYXRhWzBdJwo+
ID4gd2hpY2ggaXMgdGhlIHJlYXNvbiBvZiB0aGUga2VybmVsIHBhbmljLiBTaW1wbHkgY2hlY2sg
aWYgdGhlIHBvaW50ZXIKPiA+IGlzIG5vdCBOVUxMIGJlZm9yZSBjb250aW51aW5nLgo+ID4KPiA+
IEJ1Z0xpbms6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA2
Mjk5Cj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogRnLD
qWTDqXJpYyBQaWVycmV0IChmZXBpdHJlKSA8ZnJlZGVyaWMucGllcnJldEBxdWJlcy1vcy5vcmc+
Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kaXNwL2No
YW5udjUwLmMgfCAyICsrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kaXNw
L2NoYW5udjUwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kaXNwL2No
YW5udjUwLmMKPiA+IGluZGV4IGJjZjMyZDkyZWU1YS4uNTBlMzUzOWYzM2QyIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGlzcC9jaGFubnY1MC5j
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kaXNwL2NoYW5u
djUwLmMKPiA+IEBAIC03NCw2ICs3NCw4IEBAIG52NTBfZGlzcF9jaGFuX210aGQoc3RydWN0IG52
NTBfZGlzcF9jaGFuICpjaGFuLCBpbnQgZGVidWcpCj4gPgo+ID4gICAgICAgaWYgKGRlYnVnID4g
c3ViZGV2LT5kZWJ1ZykKPiA+ICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKyAgICAgaWYgKCFt
dGhkKQo+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPgo+ID4gICAgICAgZm9yIChpID0gMDsg
KGxpc3QgPSBtdGhkLT5kYXRhW2ldLm10aGQpICE9IE5VTEw7IGkrKykgewo+ID4gICAgICAgICAg
ICAgICB1MzIgYmFzZSA9IGNoYW4tPmhlYWQgKiBtdGhkLT5hZGRyOwo+ID4KPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTm91dmVhdSBtYWlsaW5n
IGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
