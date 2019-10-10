Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F5FD2BB7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E842E6EB4B;
	Thu, 10 Oct 2019 13:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7636EB4C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 13:50:48 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id f20so5522811edv.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 06:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=o898Z3trs0jH/OlBQbiOm8e/1sEfrvM2Vk3WyyK56M4=;
 b=E20puCNEFuo+hXNCxmEehEhmOATY2pLQ0A0oCA58P+YrXkn00Bl3kYX+WlACg0+3S5
 L3ODLO1DQwN4aHTuBXLMQHjfsY0WBFPfA2Eqg/1eDMYmXBHVVtwE67pF2hHOQOpF9Lfb
 jv1fdZXB3UPgZmzDqVeTqGjUPwwFvXI9oSbADBayW1hxBUmbBJbtWgHkZ+su++ppGGWd
 KMPBZreLabV83/ML0PerkkDcx91AkIM5TDO7BJOeiIAcjf8/XWGDJH8MWNScymMgzdqF
 m7rRmp0sUPWJ7z4cEt211SlLHUR9xeuTuHzISphxIkVg4ZB4Ii8tQ0vCPRzxzxakMSaE
 wGwg==
X-Gm-Message-State: APjAAAUGgzlEEqbuP3wsijq/c5xovM1/YVhY74jjFS7pnmD27GaXRn2V
 MxAgAbv+IUEEO6FmJ6g1wkN28A==
X-Google-Smtp-Source: APXvYqwDTtGo4w8HEdRUZir73TR7uahsebmS6NjOfoevZfEYTOWdmz2kjDkxMdcPaAEi5/omDEtt/g==
X-Received: by 2002:a17:906:7e17:: with SMTP id
 e23mr374597ejr.205.1570715446752; 
 Thu, 10 Oct 2019 06:50:46 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 36sm988776edz.92.2019.10.10.06.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 06:50:45 -0700 (PDT)
Date: Thu, 10 Oct 2019 15:50:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/4] treewide: fix interrupted release
Message-ID: <20191010135043.GA16989@phenom.ffwll.local>
Mail-Followup-To: Johan Hovold <johan@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-s390@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20191010131333.23635-1-johan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010131333.23635-1-johan@kernel.org>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=o898Z3trs0jH/OlBQbiOm8e/1sEfrvM2Vk3WyyK56M4=;
 b=TQZ07FMvCXrWciJ7O9lR+yonpxUCVIcHnhmodCVsy5Dh/Y5im2arlnqViBllsFZMoz
 FX1zMJwHMqtbjlVh/VFK76TKJ5qMTJkhvErbbOvUl3k+Ss1ZPSUdmEOoFoKO4bV2Iigr
 iZ9kCTkHefQMk+aqix6L1jZn0EltF9d/5eWS4=
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
Cc: freedreno@lists.freedesktop.org, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDM6MTM6MjlQTSArMDIwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IFR3byBvbGQgVVNCIGRyaXZlcnMgaGFkIGEgYnVnIGluIHRoZW0gd2hpY2ggY291bGQg
bGVhZCB0byBtZW1vcnkgbGVha3MKPiBpZiBhbiBpbnRlcnJ1cHRlZCBwcm9jZXNzIHJhY2VkIHdp
dGggYSBkaXNjb25uZWN0IGV2ZW50Lgo+IAo+IFR1cm5zIG91dCB3ZSBoYWQgYSBmZXcgbW9yZSBk
cml2ZXIgaW4gb3RoZXIgc3Vic3lzdGVtcyB3aXRoIHRoZSBzYW1lCj4ga2luZCBvZiBidWcgaW4g
dGhlbS4KPiAKPiBOb3RlIHRoYXQgYWxsIGJ1dCB0aGUgczM5MCBwYXRjaCBoYXZlIG9ubHkgYmVl
biBjb21waWxlIHRlc3RlZCwgd2hpbGUKPiB0aGUgczM5MCBvbmUgaGFzIG5vdCBldmVuIGJlZW4g
YnVpbHQuCgpSYW5kb20gZnVubnkgaWRlYTogQ291bGQgd2UgZG8gc29tZSBkZWJ1ZyBhbm5vdGF0
aW9ucyAoYWtpbiB0bwptaWdodF9zbGVlcCkgdGhhdCBzcGxhdHMgd2hlbiB5b3UgbWlnaHRfc2xl
ZXBfaW50ZXJydXB0aWJsZSBzb21ld2hlcmUKd2hlcmUgaW50ZXJydXB0aWJsZSBzbGVlcHMgYXJl
IGdlbmVyYWxseSBhIGJhZCBpZGVhPyBMaWtlIGluCmZvcHMtPnJlbGVhc2U/CgpTb21ldGhpbmcg
bGlrZSBub25fYmxvY2tfc3RhcnQvZW5kIHRoYXQgSSd2ZSByZWNlbnRseSBkb25lLCBidXQgZm9y
CmludGVycnVwdGlibGUgc2xlZXBzIG9ubHk/IFdvdWxkIG5lZWQgbWlnaHRfc2xlZXBfaW50ZXJy
dXB0aWJseSgpCmFubm90YXRpb25zIGFuZCBub25faW50ZXJydXB0bHlfc2xlZXBfc3RhcnQvZW5k
IGFubm90YXRpb25zLgotRGFuaWVsCgo+IAo+IEpvaGFuCj4gCj4gCj4gSm9oYW4gSG92b2xkICg0
KToKPiAgIGRybS9tc206IGZpeCBtZW1sZWFrIG9uIHJlbGVhc2UKPiAgIG1lZGlhOiBiZGlzcDog
Zml4IG1lbWxlYWsgb24gcmVsZWFzZQo+ICAgbWVkaWE6IHJhZGlvOiB3bDEyNzM6IGZpeCBpbnRl
cnJ1cHQgbWFza2luZyBvbiByZWxlYXNlCj4gICBzMzkwL3pjcnlwdDogZml4IG1lbWxlYWsgYXQg
cmVsZWFzZQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kZWJ1Z2ZzLmMgICAgICAgICAg
ICAgfCA2ICstLS0tLQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9iZGlzcC9iZGlzcC12
NGwyLmMgfCAzICstLQo+ICBkcml2ZXJzL21lZGlhL3JhZGlvL3JhZGlvLXdsMTI3My5jICAgICAg
ICAgICAgfCAzICstLQo+ICBkcml2ZXJzL3MzOTAvY3J5cHRvL3pjcnlwdF9hcGkuYyAgICAgICAg
ICAgICAgfCAzICstLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCj4gCj4gLS0gCj4gMi4yMy4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
