Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 247368B376
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 11:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39A96E0BC;
	Tue, 13 Aug 2019 09:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026F06E0BD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 09:12:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r1so7960148wrl.7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 02:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FZkkanscr2yXD89j1fbn9ohAAYxCp1RzxWGi4o6zEW8=;
 b=HdLVZkznDqRJFp6KlB/6NDeVXdy6cUoWfMUtPyH0ljLwf0xukT5ErtEIHwAWpai5Zu
 QheQi1Iu5OF7PjtOH+ikpi1RkY5n9x7FwOVivywp+La7T4Nn7waKmRW2cLahfqV/EpeY
 y8w6QxgxtTpMX95Uf3CayAeGy2HPKJ9oZ6WVDdB/kket9tHYgxiQoMOsSlx6V4vv83/1
 B2Zrj7LM3uzuj+Kifvk4Q2JmKyDgblDXlTco9WIX/MrsAWtJb5kedUggDJ6Qh85SC38x
 ns9dJRxjg36nZ4hrFoKVrFWIDvrCv5qt8YBYnig9iMlkC8CxghDO0PedFYCUQfpY949b
 qcpQ==
X-Gm-Message-State: APjAAAW0FI1Eu5xIvT9SwfroRQOU6yElIUhyioSB+aeTYH9pudV80pZ6
 OvFoR0AFF6jNnm+Mmz+Zj9aJbdvSWeG5lg==
X-Google-Smtp-Source: APXvYqwbv5cG9FKibLWc2sKuDq7jDJn87gc4AZJbbRd1Ijcjad32ZCpwaC08SokZHVAHzK87pDWnrw==
X-Received: by 2002:a5d:678a:: with SMTP id v10mr13170524wru.116.1565687573545; 
 Tue, 13 Aug 2019 02:12:53 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id t198sm1283913wmt.39.2019.08.13.02.12.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 02:12:52 -0700 (PDT)
Date: Tue, 13 Aug 2019 10:12:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: Re: [PATCH] backlight: ipaq_micro: Make structure micro_bl_props
 constant
Message-ID: <20190813091251.2nyxtivsvp47aahp@holly.lan>
References: <20190813085855.8302-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813085855.8302-1-nishkadg.linux@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FZkkanscr2yXD89j1fbn9ohAAYxCp1RzxWGi4o6zEW8=;
 b=cE5sGxsaIMTOCowXH1sGPI+8JCImG4j3rBpkOYIFu7Y+DCo9IixpnMvmKpL1J6IF+x
 mcGtI+GudckR6pAanyRlcrZCV/ZV5FJzrIsdgRs+44AUPY4tmnDTVRTHHcAZp380fz0d
 bMJmkNdKG5tisrxJnOTLQ2i0vfHYMvZgSbd0tKAM6+Fta4gS0XOPgSUTIa6/8fl39K/D
 zU/HBy4gyfgdty/tztUpP4CW9OaAvipPxy+yOt1QdzuaYL5ckDTliL1GjDxmo4Oyl0Ze
 4WCcvLfZ9YfTf+R2mYTJrLj28QfS6slRFc8o8AqBf9WvDrMtw63sXd5VMgE4eFpBcCmW
 4M0Q==
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
Cc: jingoohan1@gmail.com, linux-fbdev@vger.kernel.org, lee.jones@linaro.org,
 dri-devel@lists.freedesktop.org, b.zolnierkie@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDI6Mjg6NTVQTSArMDUzMCwgTmlzaGthIERhc2d1cHRh
IHdyb3RlOgo+IFN0YXRpYyBzdHJ1Y3R1cmUgbWljcm9fYmxfcHJvcHMsIGhhdmluZyB0eXBlIGJh
Y2tsaWdodF9wcm9wZXJ0aWVzLCBpcwo+IHVzZWQgb25seSBvbmNlLCB3aGVuIGl0IGlzIHBhc3Nl
ZCBhcyB0aGUgbGFzdCBhcmd1bWVudCB0byBmdW5jdGlvbgo+IGRldm1fYmFja2xpZ2h0X2Rldmlj
ZV9yZWdpc3RlcigpLiBkZXZtX2JhY2tsaWdodF9kZXZpY2VfcmVnaXN0ZXIoKSBpcwo+IGRlZmlu
ZWQgd2l0aCBpdHMgbGFzdCBwYXJhbWV0ZXIgYmVpbmcgZGVjbGFyZWQgY29uc3RhbnQuIEhlbmNl
IG1ha2UKPiBtaWNyb19ibF9wcm9wcyBpdHNlbGYgY29uc3RhbnQgYXMgd2VsbC4KPiBJc3N1ZSBm
b3VuZCB3aXRoIENvY2NpbmVsbGUuCgpEaWQgeW91IGRvIGFueSByZXZpZXcgdG8gc2VlIGlmIHRo
aXMgcGF0dGVybiBvY2N1cnMgaW4gb3RoZXIgYmFja2xpZ2h0CmRyaXZlcnMgKGl0IGxvb2tzIHRv
IG1lIGxpa2UgdGhlIHNhbWUgcGF0dGVybiBhcHBlYXJzIGluCnJhdmUtc3AtYmFja2xpZ2h0LmMu
Li4gZG8gdGhlIHRvb2xzIGJyaW5nIHRoYXQgb25lIG91dCBhcyB3ZWxsKS4KCgpEYW5pZWwuCgoK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBOaXNoa2EgRGFzZ3VwdGEgPG5pc2hrYWRnLmxpbnV4QGdtYWls
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvaXBhcV9taWNyb19ibC5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvaXBhcV9taWNyb19ibC5jIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvaXBhcV9taWNyb19ibC5jCj4gaW5kZXggMTEyM2Y2N2Mx
MmIzLi44NWIxNmNjODI4NzggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
aXBhcV9taWNyb19ibC5jCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvaXBhcV9taWNy
b19ibC5jCj4gQEAgLTQ0LDcgKzQ0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBiYWNrbGlnaHRf
b3BzIG1pY3JvX2JsX29wcyA9IHsKPiAgCS51cGRhdGVfc3RhdHVzICA9IG1pY3JvX2JsX3VwZGF0
ZV9zdGF0dXMsCj4gIH07Cj4gIAo+IC1zdGF0aWMgc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVz
IG1pY3JvX2JsX3Byb3BzID0gewo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGJhY2tsaWdodF9wcm9w
ZXJ0aWVzIG1pY3JvX2JsX3Byb3BzID0gewo+ICAJLnR5cGUgPSBCQUNLTElHSFRfUkFXLAo+ICAJ
Lm1heF9icmlnaHRuZXNzID0gMjU1LAo+ICAJLnBvd2VyID0gRkJfQkxBTktfVU5CTEFOSywKPiAt
LSAKPiAyLjE5LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
