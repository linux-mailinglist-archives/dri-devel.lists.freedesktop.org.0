Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1004B1813A
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 22:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2ABB89932;
	Wed,  8 May 2019 20:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF8489930;
 Wed,  8 May 2019 20:43:20 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id t1so4667736qtc.12;
 Wed, 08 May 2019 13:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+J13HW6Ql7AVbYnId9Z2QZkxRcrcMv8VFcAxxJspMsw=;
 b=tiUJ8gzcNuKGEGRsosTnRYMpR9lSNKqXmBX8t+T04qzTIoivbT+PXNgZs+MZNRF4+Z
 r4bDiJ7/8wDPUkIWc0gKqMhThjmD/4JA6okDu+27Ybu1HBpmEoZlCgFlHptgvCNnYHzV
 5gwFTST2ofl1+4tjwR39bYGOLCXJn7AcSbeR0liWPGwMNF7XncYcADKUwM1e+plGNOrV
 POh2z4uMTzRo2zSzMUxAtrJWmI64oX/H7eWmp7cD0voaSFrMjzl9tvKwGIraXJRfUULA
 l6H4hsgVP5e8Z9pF+F2121qiQCMMwcfDz+bw39z/3Y+GKFCRn8B5fpE3cBCUDNJYVjMC
 OoSA==
X-Gm-Message-State: APjAAAXR41hkxh9dDm+klbAzWZ09Kipbat4840y6fCZY1ZTtsuNKhqhB
 3s5S13NdfFzPtLngluRi9m9SBjENu4I=
X-Google-Smtp-Source: APXvYqzC+uayIVCgj/sYsqvmOlwsBhYzG+/NFi8gvRxXMRCNTjLlbVy7CUTUTCX52sOI8QS8s2tB+w==
X-Received: by 2002:ac8:26e4:: with SMTP id 33mr57629qtp.388.1557348199900;
 Wed, 08 May 2019 13:43:19 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:6268:7a0b:50be:cebc])
 by smtp.gmail.com with ESMTPSA id x7sm18276qkc.22.2019.05.08.13.43.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 13:43:19 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] dt-bindings: msm/disp: Introduce interconnect bindings
 for MDSS on SDM845
Date: Wed,  8 May 2019 13:42:13 -0700
Message-Id: <20190508204219.31687-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508204219.31687-1-robdclark@gmail.com>
References: <20190508204219.31687-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+J13HW6Ql7AVbYnId9Z2QZkxRcrcMv8VFcAxxJspMsw=;
 b=Abfs+E+a4cAbjo09o779pV+bz6q5nWwGBguyKwYYWnn/uI2QSqGgTKRUiln2uIFM4N
 BxhZGcL32DSB0sABMxEh2Zyx9xLyS6KCXhx8yb8Pyd02t3omhPtoA8MnE+Xqm7T7MT6i
 nQ4Ylsu+rqXDfhkswcHo19S4L6P2spvTDF77/q2mM/mfb/Jijui9J32vAUGsreIeCbI3
 O51sIl4AKUcouILnErmLIu+DnT4NB4RZAxX5psIrrcst7vFExxmEFZlEfKVn+571TBbg
 rgyHJiberhayBRkWLXFMlYEkLExTx8pHba3zt0LLuW1i3t5FpoPrm8pfEdVCODbrVxe6
 aBZA==
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jayant Shekhar <jshekhar@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmF5YW50IFNoZWtoYXIgPGpzaGVraGFyQGNvZGVhdXJvcmEub3JnPgoKQWRkIGludGVy
Y29ubmVjdCBwcm9wZXJ0aWVzIHN1Y2ggYXMgaW50ZXJjb25uZWN0IHByb3ZpZGVyIHNwZWNpZmll
cgosIHRoZSBlZGdlIHNvdXJjZSBhbmQgZGVzdGluYXRpb24gcG9ydHMgd2hpY2ggYXJlIHJlcXVp
cmVkIGJ5IHRoZQppbnRlcmNvbm5lY3QgQVBJIHRvIGNvbmZpZ3VyZSBpbnRlcmNvbm5lY3QgcGF0
aCBmb3IgTURTUy4KCkNoYW5nZXMgaW4gdjI6CgktIE5vbmUKCkNoYW5nZXMgaW4gdjM6CgktIFJl
bW92ZSBjb21tb24gcHJvcGVydHkgZGVmaW5pdGlvbnMgKFJvYiBIZXJyaW5nKQoKQ2hhbmdlcyBp
biB2NDoKCS0gVXNlIHBvcnQgbWFjcm9zIGFuZCBjaGFuZ2UgcG9ydCBzdHJpbmcgbmFtZXMgKEdl
b3JnaSBEamFrb3YpCgpDaGFuZ2VzIGluIHY1LXY3OgoJLSBOb25lCgpTaWduZWQtb2ZmLWJ5OiBT
cmF2YW50aGkgS29sbHVrdWR1cnUgPHNrb2xsdWt1QGNvZGVhdXJvcmEub3JnPgpTaWduZWQtb2Zm
LWJ5OiBKYXlhbnQgU2hla2hhciA8anNoZWtoYXJAY29kZWF1cm9yYS5vcmc+ClJldmlld2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsg
PHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbXNtL2RwdS50eHQgfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kcHUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RwdS50eHQKaW5kZXggYWQyZTg4MzAzMjRlLi5hNjFkZDQw
ZjM3OTIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21zbS9kcHUudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21zbS9kcHUudHh0CkBAIC0yOCw2ICsyOCwxMSBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVz
OgogLSAjYWRkcmVzcy1jZWxsczogbnVtYmVyIG9mIGFkZHJlc3MgY2VsbHMgZm9yIHRoZSBNRFNT
IGNoaWxkcmVuLiBTaG91bGQgYmUgMS4KIC0gI3NpemUtY2VsbHM6IFNob3VsZCBiZSAxLgogLSBy
YW5nZXM6IHBhcmVudCBidXMgYWRkcmVzcyBzcGFjZSBpcyB0aGUgc2FtZSBhcyB0aGUgY2hpbGQg
YnVzIGFkZHJlc3Mgc3BhY2UuCistIGludGVyY29ubmVjdHMgOiBpbnRlcmNvbm5lY3QgcGF0aCBz
cGVjaWZpZXIgZm9yIE1EU1MgYWNjb3JkaW5nIHRvCisgIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pbnRlcmNvbm5lY3QvaW50ZXJjb25uZWN0LnR4dC4gU2hvdWxkIGJlCisgIDIg
cGF0aHMgY29ycmVzcG9uZGluZyB0byAyIEFYSSBwb3J0cy4KKy0gaW50ZXJjb25uZWN0LW5hbWVz
IDogTURTUyB3aWxsIGhhdmUgMiBwb3J0IG5hbWVzIHRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiB0
aGUKKyAgMiBpbnRlcmNvbm5lY3QgcGF0aHMgZGVmaW5lZCB3aXRoIGludGVyY29ubmVjdCBzcGVj
aWZpZXIuCiAKIE9wdGlvbmFsIHByb3BlcnRpZXM6CiAtIGFzc2lnbmVkLWNsb2NrczogbGlzdCBv
ZiBjbG9jayBzcGVjaWZpZXJzIGZvciBjbG9ja3MgbmVlZGluZyByYXRlIGFzc2lnbm1lbnQKQEAg
LTg2LDYgKzkxLDExIEBAIEV4YW1wbGU6CiAJCWludGVycnVwdC1jb250cm9sbGVyOwogCQkjaW50
ZXJydXB0LWNlbGxzID0gPDE+OwogCisJCWludGVyY29ubmVjdHMgPSA8JnJzY19obG9zIE1BU1RF
Ul9NRFAwICZyc2NfaGxvcyBTTEFWRV9FQkkxPiwKKwkJCQk8JnJzY19obG9zIE1BU1RFUl9NRFAx
ICZyc2NfaGxvcyBTTEFWRV9FQkkxPjsKKworCQlpbnRlcmNvbm5lY3QtbmFtZXMgPSAibWRwMC1t
ZW0iLCAibWRwMS1tZW0iOworCiAJCWlvbW11cyA9IDwmYXBwc19pb21tdSAwPjsKIAogCQkjYWRk
cmVzcy1jZWxscyA9IDwyPjsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
