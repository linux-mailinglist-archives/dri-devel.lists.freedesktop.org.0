Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354D94ABBA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 22:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677266E247;
	Tue, 18 Jun 2019 20:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68606E247;
 Tue, 18 Jun 2019 20:25:25 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c70so9451535qkg.7;
 Tue, 18 Jun 2019 13:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+J13HW6Ql7AVbYnId9Z2QZkxRcrcMv8VFcAxxJspMsw=;
 b=cFOmXOixNJWt9OiyXkdTLRlt9tCQUKxJ+ZOnnsoG2zTZe/bUfLDZs+R9EuZ7Tt+v3s
 51HWe3Kun+mGk9GwUdfOPRjF0DFdVQih12yizblA+nuxh3BnsQboKr9v9pe2z9nwuLi1
 wmw6gQsrro9f0DUYU9j9h31qaOkmTWlooM7brLTy4Jqyive1HcBgNCjSYXwOHOmJ2DUO
 e7ppi6eSQkSRGs5FUz70qBguY0kpsaNT1sECwRoFotFy0yUOxJ7RrkeVO8oLytmx6NGg
 oNDPD5hSI8S+d9WR9odWNt6mgNzO0GXJaAirbXAveUcqxzyNXJ2x/zX5/OnzrxDeejfm
 AmFA==
X-Gm-Message-State: APjAAAUzJ1oiOLU0/uSnfOudkbgzjOT+hQ6bwswX/GBEZpqucd+sqRPW
 8hUIf2k7dyvehJWN2xd17Au+7E28ZCM=
X-Google-Smtp-Source: APXvYqxNDvLChkQUBiXIko0dDMbNastU/9GEX6agttSnnnTf19sIWCx8uUHQaJTRlVcJjODqD+0iUg==
X-Received: by 2002:a05:620a:10b2:: with SMTP id
 h18mr30836066qkk.14.1560889524900; 
 Tue, 18 Jun 2019 13:25:24 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id r17sm9594246qtf.26.2019.06.18.13.25.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 13:25:24 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] dt-bindings: msm/disp: Introduce interconnect bindings
 for MDSS on SDM845
Date: Tue, 18 Jun 2019 13:24:11 -0700
Message-Id: <20190618202425.15259-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618202425.15259-1-robdclark@gmail.com>
References: <20190618202425.15259-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+J13HW6Ql7AVbYnId9Z2QZkxRcrcMv8VFcAxxJspMsw=;
 b=m+HxYuSmzA49hIX2C0R/5k+lHUKTIv1oK6hQCco3oEPOdHPlkqevF72yM+yYin7kua
 QzrAxnvVqHxxjWLAbb3t56f7b8EC4dkXbCIx7AOuMRYf+gQzgU0FA42UoJ/BddGOIWrU
 XYBbLaRsmrdKpe9RwQ72o0TKKEZOTT5cAZM5o9kzYniijBjFp3F+SKk3x/Istrhyf0OC
 bazZli+kqlvHDv4zh3JqtKHnNb364yPF7y5OQawsRysIarus7HGQ44iLbukMiA47Kxoy
 wGCux6njKAkW+nCyx9U1Oab1OGdGexPnBZHE65mwdTKY+/LAo0cKGdUQExLg+s7ck9gH
 BPvg==
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
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Mark Rutland <mark.rutland@arm.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Georgi Djakov <georgi.djakov@linaro.org>,
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
