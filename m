Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C734A372FE2
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 20:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418D76EB5A;
	Tue,  4 May 2021 18:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1BC6EB5A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 18:45:14 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id a4so14750021ejk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 11:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NbVhIMCFX3/Rv7gGknfj4DjPNAhT1jyy7BEtshdUxfA=;
 b=N9xM6Bk1NBWAseAORN2s9DOxf3Fq6twnoX2y0i6lWMiboT+uq/8PdPaiKnhl0Vl9Sk
 BOeApmAA7nJfhiJMo8k7D77ZkdUnR81QgSQVjNa3TR5ffOgBU61jFDcecRAK6ORGbWp8
 rfbiP/iCfecgUqpWL4Gc4VnX5EFaMjXCXNQnJF3k3BAp/XPROMErnWZHB0rrsIaJ0K2u
 ipH20rUur4aT8ovXovGD6o2MJxmMQCgxNlHsHP9S+rA8trXw9KEC84ERv3xSDLbG7vD4
 4eYgya1RPsGS6BNNgPJwE+73D4JfZzmTThUwywFTF2YN/IgGP2Q5cAw4PGb52yc+nvNx
 41og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NbVhIMCFX3/Rv7gGknfj4DjPNAhT1jyy7BEtshdUxfA=;
 b=PFq62zcsHwYP4+S82GaWqCj04NYc3TsCBNry3rqzcvkJj03TbL3FeVdFAjmtUaH9Q7
 KwGop4R7agUqm/3rGgvAfYHsCHEEZ9AOhDg0YYGgyGNyC3T162Z3h+fIvXBbQUUp7gyK
 tSw+JlECAoS28LENP7kH92MPXH8tjF2MjBtnv7LdofYlqXMOPE4rew4ED5LlNSd/D2Z6
 9wvAX/DC3R4uuxmHmIxgPomqTfH8JG74v7p+ger99q7+NGwGvX650S9jXri5wnbLafDS
 vFSN7jU5VxNVGsypSgzDoqoKWcuWvdNyEj2U5wviYPpNKUk3hHBM/yM9hZkHkbNlUw06
 rWug==
X-Gm-Message-State: AOAM531wfWgJgj18/X/XXwlMG3dYwiJjLhpowXlNI64s3ePf1zPSaKA5
 PHbCPJ6DVJFBNeUmg/QPrCxbI0d9fEfgqcdhoXU=
X-Google-Smtp-Source: ABdhPJyL1F/F0cIowY5BgY+sCzN06aktYN1M8TCokPWxDC48r3XBpQiezqj52lg6w+qZ3JYBwRDcZork07pte8DJZoo=
X-Received: by 2002:a17:906:ae0a:: with SMTP id
 le10mr23592854ejb.86.1620153912945; 
 Tue, 04 May 2021 11:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <e4r4g4R-yjH.A.CJE.0pVkgB@appolonius>
 <20210504183009.GV6564@kitsune.suse.cz>
In-Reply-To: <20210504183009.GV6564@kitsune.suse.cz>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Tue, 4 May 2021 20:45:01 +0200
Message-ID: <CABkfQAHfjfBFqnVPzg1w5JFOErr=AsLpQgwzwpUJ2Uc_-cmD_w@mail.gmail.com>
Subject: Re: ERROR: modpost: "drm_display_mode_to_videomode"
 [drivers/gpu/drm/bridge/lontium-lt8912b.ko] undefined!
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpJIHRoaW5rIHRoaXMgaXMgc2VsZi1ldmlkZW50IGJ1dCBjb3VsZCB5b3UgcGxlYXNl
IHNlbmQgdGhlIGNvbmZpZyB0byBjb25maXJtPwoKVGhhbmtzLAoKTGUgbWFyLiA0IG1haSAyMDIx
IMOgIDIwOjMwLCBNaWNoYWwgU3VjaMOhbmVrIDxtc3VjaGFuZWtAc3VzZS5kZT4gYSDDqWNyaXQg
Ogo+Cj4gSGVsbG8sCj4KPiBJIGdldCBlcnJvcnMgYWJvdXQgbWlzc2luZyBzeW1ib2wgaW4gdGhl
IGxvbnRpdW0tbHQ4OTEyYiBtb2R1bGUuCj4KPiBJcyB0aGUgcHJvYmxlbSBzZWxmLWV2aWRlbnQg
b3IgZG8geW91IG5lZWQgdGhlIGNvbmZpZyBhcyB3ZWxsPwo+Cj4gSSBkb24ndCBuZWVkIHRoZSBk
cml2ZXIgZm9yIGFueXRoaW5nLCBpdCB3YXMganVzdCBhdXRvLWVuYWJsZWQgYmVjYXVzZQo+IGl0
J3MgbmV3IGFuZCB0aGUgY2hhbmdlIGhhcyBub3QgYmVlbiByZXZpZXdlZC4KPgo+IFRoYW5rcwo+
Cj4gTWljaGFsCj4gPgo+ID4gTGFzdCBvdXRwdXQ6Cj4gPiAgIFdSQVAgICAgYXJjaC9wb3dlcnBj
L2Jvb3QvekltYWdlLm1hcGxlCj4gPiAgIFdSQVAgICAgYXJjaC9wb3dlcnBjL2Jvb3QvekltYWdl
LnBzZXJpZXMKPiA+IG1ha2VbMl06ICoqKiBEZWxldGluZyBmaWxlICdtb2R1bGVzLW9ubHkuc3lt
dmVycycKPiA+ICAgTU9EUE9TVCBtb2R1bGVzLW9ubHkuc3ltdmVycwo+ID4gRVJST1I6IG1vZHBv
c3Q6ICJkcm1fZGlzcGxheV9tb2RlX3RvX3ZpZGVvbW9kZSIgW2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvbG9udGl1bS1sdDg5MTJiLmtvXSB1bmRlZmluZWQhCj4gPiBtYWtlWzJdOiAqKiogWy4uL3Nj
cmlwdHMvTWFrZWZpbGUubW9kcG9zdDoxNTA6IG1vZHVsZXMtb25seS5zeW12ZXJzXSBFcnJvciAx
Cj4gPiBtYWtlWzFdOiAqKiogWy9ob21lL2FidWlsZC9ycG1idWlsZC9CVUlMRC9rZXJuZWwtdmFu
aWxsYS01LjEyLjAuMTM2NzAuZzVlMzIxZGVkMzAyZC9saW51eC01LjEyLTEzNjcwLWc1ZTMyMWRl
ZDMwMmQvTWFrZWZpbGU6MTc3MDogbW9kdWxlc10gRXJyb3IgMgo+ID4gbWFrZTogKioqIFsuLi9N
YWtlZmlsZToyMTU6IF9fc3ViLW1ha2VdIEVycm9yIDIKPiA+IGVycm9yOiBCYWQgZXhpdCBzdGF0
dXMgZnJvbSAvdmFyL3RtcC9ycG0tdG1wLnExb1NJcCAoJWJ1aWxkKQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
