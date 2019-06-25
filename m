Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1BE5510D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 16:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3706E10D;
	Tue, 25 Jun 2019 14:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55616E10D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:06:13 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k18so16388160ljc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 07:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gwp5TPT2ciji6ZbRTS8ylz/3kQtDNDOoQTxqYxzhue4=;
 b=gxif8BMzFD31tFR1+PZOk6e4QaEiGZqxj2A2JSACcrGBiQOn+uF9rr89NOMdWKvSwf
 k1NGZ0NxKmZYb0GRpsJLWCDI7DWN6OT6Yi0SZgIzoqpSgShIW4vC0jVk8tBWmLFkjT4e
 mggpOEY+wZmJ7ubgM/cls+OMVZd3OC0hTW1uJPD6H94CKC/FHTABTx7aL3dchIVQPh6n
 VqCUno1ezP2vqw8PWWbHNv57wxnDpsxG3XC0+fClMtqZkTaiuOjs1BSgKvBXb/fdkufA
 JtqNm6e4Pa03WN3M3jRcQtTS3fTPxCP+DLKFSDUL3sXzVyX3ltYwGmiNNiJQ6ghD3E6p
 Wz7w==
X-Gm-Message-State: APjAAAVL2AaSH4ydrnRw/vXQxOpEMKZHBBvoZl+JpqC9SeeFeDuVQR4c
 0JCoxmFaByC4PjvqNuZxH3Rx86weqL3ggYaPAkk=
X-Google-Smtp-Source: APXvYqyD9vbCXVj03O4VOu4s63qOdHOwOoitgDj9Psv2kO0edfMrJWar0ZJjhTNy7ix+aZWgLSVPOZL/wDQHhlDtods=
X-Received: by 2002:a2e:970a:: with SMTP id r10mr24948199lji.115.1561471572106; 
 Tue, 25 Jun 2019 07:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <1561446674-25084-1-git-send-email-robert.chiras@nxp.com>
 <1561446674-25084-3-git-send-email-robert.chiras@nxp.com>
In-Reply-To: <1561446674-25084-3-git-send-email-robert.chiras@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 25 Jun 2019 11:06:00 -0300
Message-ID: <CAOMZO5C2syuzyGcpjVOvSvDghaA-ifc8oL-pqhivP49wBf=GSw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/panel: Add support for Raydium RM67191 panel
 driver
To: Robert Chiras <robert.chiras@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Gwp5TPT2ciji6ZbRTS8ylz/3kQtDNDOoQTxqYxzhue4=;
 b=B5UWY1gddbzn9ZLIi8SZCis+WjCApR9XfktQCcFIAjw0Qdpn1tYHBslBg6Fm0bv5M9
 Fihue0aKzZs/rPMWqLdluURhozdqsw46dLIgG2qxPeuLs2zBx5md0t3mp7D/ZS1FgK05
 hR/B9zbdpyMY0pPE4xbbwUwQwdfQc1m7T4SKUSy71cJ8s4QOGQ6xvmP/seeu/1haYNix
 RWFBcSbGirNkGljtsf4Whr5xFTrL2BY+exlqkypZAYlhMmCa43IKbiGa6ggbDMkYImBH
 tAi7qTRfAbThUZ9xxVKCjN3J2fOGOa+7RvQB70odU2vMpPgGt9hq8IlnbbhqDUpUncef
 SGag==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LAoKT24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgNDoyOCBBTSBSb2JlcnQgQ2hpcmFz
IDxyb2JlcnQuY2hpcmFzQG54cC5jb20+IHdyb3RlOgoKPiArc3RhdGljIGludCByYWRfYmxfZ2V0
X2JyaWdodG5lc3Moc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsKQo+ICt7Cj4gKyAgICAgICBz
dHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kgPSBibF9nZXRfZGF0YShibCk7Cj4gKyAgICAgICBz
dHJ1Y3QgcmFkX3BhbmVsICpyYWQgPSBtaXBpX2RzaV9nZXRfZHJ2ZGF0YShkc2kpOwo+ICsgICAg
ICAgc3RydWN0IGRldmljZSAqZGV2ID0gJmRzaS0+ZGV2Owo+ICsgICAgICAgdTE2IGJyaWdodG5l
c3M7Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsKPiArICAgICAgIGlmICghcmFkLT5wcmVwYXJlZCkK
PiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgICAgRFJNX0RFVl9ERUJVR19E
UklWRVIoZGV2LCAiXG4iKTsKClBsZWFzZSByZW1vdmUgdGhpcyBkZWJ1ZyBsaW5lLgoKPiArICAg
ICAgIGlmICghcmFkLT5wcmVwYXJlZCkKPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKwo+
ICsgICAgICAgRFJNX0RFVl9ERUJVR19EUklWRVIoZGV2LCAiTmV3IGJyaWdodG5lc3M6ICVkXG4i
LCBibC0+cHJvcHMuYnJpZ2h0bmVzcyk7CgpQbGVhc2UgcmVtb3ZlIGl0LgoKPiArICAgICAgIHJl
dCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAiZHNpLWxhbmVzIiwgJmRzaS0+bGFuZXMpOwo+
ICsgICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxl
ZCB0byBnZXQgZHNpLWxhbmVzIHByb3BlcnR5ICglZClcbiIsIHJldCk7Cj4gKyAgICAgICAgICAg
ICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcGFuZWwtPnJlc2V0ID0g
ZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoZGV2LCAicmVzZXQiLCBHUElPRF9PVVRfTE9XKTsKCkV2
ZW4gaXQgaXMgb3B0aW9uYWwsIHlvdSBzdGlsbCBuZWVkIHRvIGNoZWNrIGZvciBlcnJvciBhbmQg
cHJvcGFnYXRlCml0IGluIHRoZSBjYXNlIG9mIGVycm9yLgoKT3RoZXJ3aXNlIGRlZmVyIHByb2Jl
IHdpbGwgbm90IHdvcmsuCgo+ICsgICAgICAgcmV0ID0gZHJtX3BhbmVsX2FkZCgmcGFuZWwtPnBh
bmVsKTsKPiArICAgICAgIGlmIChyZXQpCj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4g
Kwo+ICsKCk9uZSBibGFuayBsaW5lIGlzIGVub3VnaC4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
