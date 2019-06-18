Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC50D4B2DF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8498E6E2EE;
	Wed, 19 Jun 2019 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x462.google.com (mail-wr1-x462.google.com
 [IPv6:2a00:1450:4864:20::462])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D906E106
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:41:56 +0000 (UTC)
Received: by mail-wr1-x462.google.com with SMTP id n4so4662568wrs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 00:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0PrSR+jN+SJngU5g9VL57RLfBmPfgfrprow1ZhWuEaU=;
 b=oCcWEfc6A/Md4zmAsvzNcFk//TO4qXViEWe9K+NEscTGEVucpmb0A9zm+EoJAmSN/d
 bHYRRFplpibCSpdfpFjY7/D+sqBHaCaREOtTBCfLwT2VF6fOG+NenJ1cwxc3Is1xxoCe
 i/WcQFgnU6ZW4+K+I4ILUAMZCinBJWsoRBLAGPujlxibQKB0DX1fZWCxs7WLdCaiSCjg
 dqoSy6Z+uF7tG+ubVn/8QiKlOMLRlbvqGy8k72xIWB3CP5EdY4HmnovkHZlU+1HItL4V
 J9IE/6f+xTQ9lxZrbyFcaDBrtTsmjdQVes5MuHrjbZwy0Vml06nX9nkeAn140G3T/1YV
 7vsw==
X-Gm-Message-State: APjAAAWo8dH7bMkeFKNN9+vhLnAKGYQgP0j9ECAQ+5kDSaY7UALaWQn0
 RHiX0VnzF5gnwkM9R1aaF7d/vLWWIFdd6z8iqH5sMUdsGAtong==
X-Google-Smtp-Source: APXvYqzLg7eWFSh4aDeAY+p0mLGpxFDGnAoM7uLRTr9Z17I85OAZshKEtrRGTEUMuiUDdNcm1goZ80zuNSHH
X-Received: by 2002:a5d:5702:: with SMTP id a2mr37285683wrv.89.1560843714771; 
 Tue, 18 Jun 2019 00:41:54 -0700 (PDT)
Received: from localhost.localdomain (46-163-209-30.blcnet.fi. [46.163.209.30])
 by smtp-relay.gmail.com with ESMTPS id l18sm212063wrn.66.2019.06.18.00.41.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 00:41:54 -0700 (PDT)
X-Relaying-Domain: okoko.fi
From: Marko Kohtala <marko.kohtala@okoko.fi>
To: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] dt-bindings: display: ssd1307fb: Add initialization
 properties
Date: Tue, 18 Jun 2019 10:41:10 +0300
Message-Id: <20190618074111.9309-6-marko.kohtala@okoko.fi>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618074111.9309-1-marko.kohtala@okoko.fi>
References: <20190618074111.9309-1-marko.kohtala@okoko.fi>
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=okoko.fi; s=okoko;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0PrSR+jN+SJngU5g9VL57RLfBmPfgfrprow1ZhWuEaU=;
 b=XbZMhCy9PwEALPH0NPGJdcZHF9zS0XOpOR8x3PSFQlEjCQ6Gz4bo2b0Z/DVboYMNYL
 bawh0DCI+ryYkeLPaXzxB8PkLFsPGYTd04hm54Pli6Hu9JocehoOAo5PJihEnCP9lOXk
 FkcVPkHXMltxhZ2+oh+mgoHbT57SZMkX/prR0=
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
 =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Marko Kohtala <marko.kohtala@okoko.fi>,
 Rob Herring <robh+dt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9jdW1lbnQgbmV3IGJpbmRpbmdzIGZvciBhZGFwdGluZyBzc2QxMzA3ZmIgZHJpdmVyIHRvIG5l
dyBkaXNwbGF5cy4KClNpZ25lZC1vZmYtYnk6IE1hcmtvIEtvaHRhbGEgPG1hcmtvLmtvaHRhbGFA
b2tva28uZmk+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zc2QxMzA3ZmIu
dHh0ICAgICAgICAgIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9zc2QxMzA3ZmIudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvc3NkMTMwN2ZiLnR4dAppbmRleCBiNjdmOGNhYTIxMmMuLjI3MzMzYjk1NTFiMyAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3NkMTMw
N2ZiLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9z
c2QxMzA3ZmIudHh0CkBAIC0yNyw2ICsyNywxNSBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOgogICAt
IHNvbG9tb24scHJlY2hhcmdlcDI6IExlbmd0aCBvZiBwcmVjaGFyZ2UgcGVyaW9kIChwaGFzZSAy
KSBpbiBjbG9jayBjeWNsZXMuCiAgICAgICAgICAgICAgICAgICAgICAgICAgVGhpcyBuZWVkcyB0
byBiZSB0aGUgaGlnaGVyLCB0aGUgaGlnaGVyIHRoZSBjYXBhY2l0YW5jZQogICAgICAgICAgICAg
ICAgICAgICAgICAgIG9mIHRoZSBPTEVEJ3MgcGl4ZWxzIGlzCisgIC0gc29sb21vbixkY2xrLWRp
djogQ2xvY2sgZGl2aXNvciAxIHRvIDE2CisgIC0gc29sb21vbixkY2xrLWZycTogQ2xvY2sgZnJl
cXVlbmN5IDAgdG8gMTUsIGhpZ2hlciB2YWx1ZSBtZWFucyBoaWdoZXIKKyAgICAgICAgICAgICAg
ICAgICAgICBmcmVxdWVuY3kKKyAgLSBzb2xvbW9uLGxvb2t1cC10YWJsZTogOCBiaXQgdmFsdWUg
YXJyYXkgb2YgY3VycmVudCBkcml2ZSBwdWxzZSB3aWR0aHMgZm9yCisgICAgICAgICAgICAgICAg
ICAgICAgICAgIEJBTkswLCBhbmQgY29sb3JzIEEsIEIsIGFuZCBDLiBFYWNoIHZhbHVlIGluIHJh
bmdlCisgICAgICAgICAgICAgICAgICAgICAgICAgIG9mIDMxIHRvIDYzIGZvciBwdWxzZSB3aWR0
aHMgb2YgMzIgdG8gNjQuIENvbG9yIEQKKyAgICAgICAgICAgICAgICAgICAgICAgICAgaXMgYWx3
YXlzIHdpZHRoIDY0LgorICAtIHNvbG9tb24sYXJlYS1jb2xvci1lbmFibGU6IERpc3BsYXkgdXNl
cyBjb2xvciBtb2RlCisgIC0gc29sb21vbixsb3ctcG93ZXIuIERpc3BsYXkgcnVucyBpbiBsb3cg
cG93ZXIgbW9kZQogCiBbMF06IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20v
cHdtLnR4dAogCkBAIC00Niw0ICs1NSw1IEBAIHNzZDEzMDY6IG9sZWRAM2MgewogICAgICAgICBz
b2xvbW9uLGNvbS1scnJlbWFwOwogICAgICAgICBzb2xvbW9uLGNvbS1pbnZkaXI7CiAgICAgICAg
IHNvbG9tb24sY29tLW9mZnNldCA9IDwzMj47CisgICAgICAgIHNvbG9tb24sbG9va3VwLXRhYmxl
ID0gL2JpdHMvIDggPDB4M2YgMHgzZiAweDNmIDB4M2Y+OwogfTsKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
