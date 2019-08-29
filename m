Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9630CA16C3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 12:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7528F6E0A0;
	Thu, 29 Aug 2019 10:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360396E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 10:51:01 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id c7so2977158otp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 03:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0gb1RksLZCdZN7Gqwbk2B2Bw8bW0XoBsFuzP7b4DZug=;
 b=NCIxaT82VrnipO7BCtS79UTBRVg93PoMkpS3KVUEekHNczgeoPcwnckUCZovrOY7ze
 Wc7u0lBp8pU1NGDFeaRPYxHG5NWdVDc3GUD73LFOuzW4UlOYG/uAxw/NtMFVuyy/qsJl
 NRnXiO8Pv2NMCZumk9QXFEnQ0xlDw1VLa0svxJYSGZhRA6z/jN/4Ku086BSlqfU2FNVC
 jIYXF5p2bTZ8quDWsdI9avNRNySO/2F2Y8hD9XSMt6Go29r9LnUzIg11df4KuCaxqThR
 e2iErQuVEM7eVghK3+e19jjz7+z/XrLL9VVkEH3X430Diqd3RhNRnGXXC7tYtvyBQUhh
 nbxw==
X-Gm-Message-State: APjAAAUl2Um5W5xjlismWMqVMSMJKF1y3m+M9rEBdBT7ciFQU49ACLIN
 IGbL4UvjgPQWhRkw0VCzue/hRwiA8cDSBa8mxeI=
X-Google-Smtp-Source: APXvYqwIAhcA/nWCNgJup5gdGLXZIeUPRMQV/UuyUh16eWUF27QHCqA90ZmP5kXNe/Ui1iwCsoSRaWrB2EecdmPsd+k=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr7124507oto.250.1567075860475; 
 Thu, 29 Aug 2019 03:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <1567074107-4899-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567074107-4899-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1567074107-4899-3-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2019 12:50:49 +0200
Message-ID: <CAMuHMdW7asYJGC2+c-4=a6006K2WMjEAAigBLA+MTaFip03R+Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with
 idk-1110wr display
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, ebiharaml@si-linux.co.jp,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, xu_shunji@hoperun.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpPbiBUaHUsIEF1ZyAyOSwgMjAxOSBhdCAxMjoyMiBQTSBGYWJyaXppbyBD
YXN0cm8KPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6Cj4gVGhlIEhpSG9w
ZSBSWi9HMk0gaXMgYWR2ZXJ0aXNlZCBhcyBjb21wYXRpYmxlIHdpdGggcGFuZWwgaWRrLTExMTB3
cgo+IGZyb20gQWR2YW50ZWNoLCBob3dldmVyIHRoZSBwYW5lbCBpc24ndCBzb2xkIGFsb25nc2lk
ZSB0aGUgYm9hcmQuCj4gQSBuZXcgZHRzLCBhZGRpbmcgZXZlcnl0aGluZyB0aGF0J3MgcmVxdWly
ZWQgdG8gZ2V0IHRoZSBwYW5lbCB0bwo+IHdvcmsgdGhlIEhpSG9wZSBSWi9HMk0sIGlzIHRoZSBt
b3N0IGNvbnZlbmllbnQgd2F5IHRvIHN1cHBvcnQgdGhlCj4gSGlIb3BlIFJaL0cyTSB3aGVuIGl0
J3MgY29ubmVjdGVkIHRvIHRoZSBpZGstMTExMHdyLgo+Cj4gU2lnbmVkLW9mZi1ieTogRmFicml6
aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgpUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghCgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjhhNzc0YTEtaGlob3BlLXJ6ZzJtLWV4LWlkay0xMTEwd3IuZHRzCgo+ICsmZ3BpbzEg
ewo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFdoZW4gR1AxXzIwIGlzIExPVyBMVkRTMCBpcyBj
b25uZWN0ZWQgdG8gdGhlIExWRFMgY29ubmVjdG9yCj4gKyAgICAgICAgKiBXaGVuIEdQMV8yMCBp
cyBISUdIIExWRFMwIGlzIGNvbm5lY3RlZCB0byB0aGUgTFQ4OTE4TAo+ICsgICAgICAgICovCj4g
KyAgICAgICBsdmRzLWNvbm5lY3Rvci1lbi1ncGlvewoKTWlzc2luZyBzcGFjZSBiZWZvcmUgY3Vy
bHkgYnJhY2UuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlv
bmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9u
cyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
