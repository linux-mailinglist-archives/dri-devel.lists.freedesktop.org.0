Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1841A29F5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED9A6EAF2;
	Wed,  8 Apr 2020 19:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1BE6EAEA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:52:21 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id s13so6103145lfb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VYly4r8qrsCzIDD9s/1dOkg2kifrOc3QtNDhWtGpr0M=;
 b=Z8GyZwFva9wkBtNxzbWQtihm4YtkF8iWYkyXS880jTa89LjKBdSnMdeflWyfutS/x8
 WWPtTpFDtEEv2NRJXhu70mill3dQ+Dklsu/uZoFUrPTMFfdXFiVztZzkiS+FHDJMzhif
 yg0KxkjkefFWGzE2+LJfT0beUFXpDcwPC63q4UPryLmEOQ0xOVgQ9b5qd8DBgW9+WS8k
 A3piNS43SETtJ6D9VvMIhnbA90Fh4vE+k0OrZs9Tf0fWnE4KhlJ2fSw3OT6RcrJAAm33
 fYE7Xt8eHwZgDFVdkFqLiWq4TfIbtP9hYjqYlGGqgMaYpuu5AYXdEvFWrA0kFz3uNN6L
 6eOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VYly4r8qrsCzIDD9s/1dOkg2kifrOc3QtNDhWtGpr0M=;
 b=uCB0HJYYeBdhLblgIdFgQO6RwAtdfd+Cph4m5Nf1tIYTwKbmLoz+aX0cNl3eeGOOeF
 0Q3Rbhkpq+msgnhMzVTQjggLrPmjcrPvSFSOxddyHnbHlC66w4Yw3LxiVUcNWc/dEfuC
 lPIHpPZzjniz7kDOJmpeubk/D+5i8obJWAuVDlvmFrUP3csPMK2FeVbbo5koLpDFdX7i
 dh5i03vPAiAlVtyCKJSY+OC5C3QAk9kHv3SDQwq5oajZveOHPN9N1tMW8NZkIt5nfNYg
 ABp3ooQY0cAa6/8dYa4/TiQPxx+udBdGDx1oks3uaqq5JrpjnfJRHmKgTZZqQJyeTn6T
 rZjw==
X-Gm-Message-State: AGi0PuYvXLqUdqrT0coPAmaNrsZCzOTmceoZDX0AuxtlMrBOr8OVfmpr
 6VZUoR+Fewz6+IlH5p09ANdqUN45z2Q=
X-Google-Smtp-Source: APiQypJsw0jAML1ydWByy1IInf4xNx7ti8E0whJ9r853xrHrkAucXzc62YZoBcAWQPUxKLN1P1ZSew==
X-Received: by 2002:ac2:4466:: with SMTP id y6mr5589200lfl.125.1586375539526; 
 Wed, 08 Apr 2020 12:52:19 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:52:19 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 36/36] dt-bindings: display: move DSI panels to
 panel-simple-dsi
Date: Wed,  8 Apr 2020 21:51:09 +0200
Message-Id: <20200408195109.32692-37-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG9taSBub3RpY2VkIHRoYXQgc2V2ZXJhbCBEU0kgcGFuZWxzIHdhcyB3cm9uZ2x5CmRlc2NyaWJl
ZCBpbiBwYW5lbC1zaW1wbGUueWFtbC4KTW92ZSB0aGVtIHRvIHBhbmVsLXNpbXBsZS1kc2kueWFt
bCB3aGVyZSB0aGV5IGJlbG9uZy4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4KQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Ci0t
LQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1sICAgICAg
ICAgIHwgOCArKysrKysrKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9w
YW5lbC1zaW1wbGUueWFtbCAgIHwgOCAtLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxl
LWRzaS55YW1sCmluZGV4IGYyNjk4ZDdjMDllNi4uNDIzNTMyZjU3ZTg5IDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1w
bGUtZHNpLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1sCkBAIC0yOSw4ICsyOSwxNiBAQCBwcm9wZXJ0
aWVzOgogICAgICAgIyBjb21wYXRpYmxlIG11c3QgYmUgbGlzdGVkIGluIGFscGhhYmV0aWNhbCBv
cmRlciwgb3JkZXJlZCBieSBjb21wYXRpYmxlLgogICAgICAgIyBUaGUgZGVzY3JpcHRpb24gaW4g
dGhlIGNvbW1lbnQgaXMgbWFuZGF0b3J5IGZvciBlYWNoIGNvbXBhdGlibGUuCiAKKyAgICAgICAg
IyBBVSBPcHRyb25pY3MgQ29ycG9yYXRpb24gOC4wIiBXVVhHQSBURlQgTENEIHBhbmVsCisgICAg
ICAtIGF1byxiMDgwdWFuMDEKKyAgICAgICAgIyBCb2UgQ29ycG9yYXRpb24gOC4wIiBXVVhHQSBU
RlQgTENEIHBhbmVsCisgICAgICAtIGJvZSx0djA4MHd1bS1ubDAKICAgICAgICAgIyBLaW5nZGlz
cGxheSBLRDA5N0QwNCA5LjciIDE1MzZ4MjA0OCBURlQgTENEIHBhbmVsCiAgICAgICAtIGtpbmdk
aXNwbGF5LGtkMDk3ZDA0CisgICAgICAgICMgTEcgQUNYNDY3QUtNLTcgNC45NSIgMTA4MMOXMTky
MCBMQ0QgUGFuZWwKKyAgICAgIC0gbGcsYWN4NDY3YWttLTcKKyAgICAgICAgIyBMRyBDb3Jwb3Jh
dGlvbiA3IiBXWEdBIFRGVCBMQ0QgcGFuZWwKKyAgICAgIC0gbGcsbGQwNzB3eDMtc2wwMQogICAg
ICAgICAjIE9uZSBTdG9wIERpc3BsYXlzIE9TRDEwMVQyNTg3LTUzVFMgMTAuMSIgMTkyMHgxMjAw
IHBhbmVsCiAgICAgICAtIG9zZGRpc3BsYXlzLG9zZDEwMXQyNTg3LTUzdHMKICAgICAgICAgIyBQ
YW5hc29uaWMgMTAiIFdVWEdBIFRGVCBMQ0QgcGFuZWwKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2lt
cGxlLnlhbWwKaW5kZXggZTRmODEzM2Y0OGJiLi5jNmFhNWRkYzY3OGEgMTAwNjQ0Ci0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBs
ZS55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL3BhbmVsLXNpbXBsZS55YW1sCkBAIC0zMyw4ICszMyw2IEBAIHByb3BlcnRpZXM6CiAgICAg
ICAtIGFtcGlyZSxhbS00ODAyNzJoM3RtcXctdDAxaAogICAgICAgICAjIEFtcGlyZSBBTS04MDA0
ODBSM1RNUVctQTFIIDcuMCIgV1ZHQSBURlQgTENEIHBhbmVsCiAgICAgICAtIGFtcGlyZSxhbTgw
MDQ4MHIzdG1xd2ExaAotICAgICAgICAjIEFVIE9wdHJvbmljcyBDb3Jwb3JhdGlvbiA4LjAiIFdV
WEdBIFRGVCBMQ0QgcGFuZWwKLSAgICAgIC0gYXVvLGIwODB1YW4wMQogICAgICAgICAjIEFVIE9w
dHJvbmljcyBDb3Jwb3JhdGlvbiAxMC4xIiBXU1ZHQSBURlQgTENEIHBhbmVsCiAgICAgICAtIGF1
byxiMTAxYXcwMwogICAgICAgICAjIEFVIE9wdHJvbmljcyBDb3Jwb3JhdGlvbiAxMC4xIiBXU1ZH
QSBURlQgTENEIHBhbmVsCkBAIC03MSw4ICs2OSw2IEBAIHByb3BlcnRpZXM6CiAgICAgICAtIGJv
ZSxudjEwMXd4bW41MQogICAgICAgICAjIEJPRSBOVjE0MEZITS1ONDkgMTQuMCIgRkhEIGEtU2kg
RlQgcGFuZWwKICAgICAgIC0gYm9lLG52MTQwZmhtbjQ5Ci0gICAgICAgICMgQm9lIENvcnBvcmF0
aW9uIDguMCIgV1VYR0EgVEZUIExDRCBwYW5lbAotICAgICAgLSBib2UsdHYwODB3dW0tbmwwCiAg
ICAgICAgICMgQ0RUZWNoKEguSy4pIEVsZWN0cm9uaWNzIExpbWl0ZWQgNC4zIiA0ODB4MjcyIGNv
bG9yIFRGVC1MQ0QgcGFuZWwKICAgICAgIC0gY2R0ZWNoLHMwNDN3cTI2aC1jdDcKICAgICAgICAg
IyBDRFRlY2goSC5LLikgRWxlY3Ryb25pY3MgTGltaXRlZCA3IiA4MDB4NDgwIGNvbG9yIFRGVC1M
Q0QgcGFuZWwKQEAgLTE1NSwxMiArMTUxLDggQEAgcHJvcGVydGllczoKICAgICAgIC0ga3lvLHRj
ZzEyMXhnbHAKICAgICAgICAgIyBMZU1ha2VyIEJMMDM1LVJHQi0wMDIgMy41IiBRVkdBIFRGVCBM
Q0QgcGFuZWwKICAgICAgIC0gbGVtYWtlcixibDAzNS1yZ2ItMDAyCi0gICAgICAgICMgTEcgQUNY
NDY3QUtNLTcgNC45NSIgMTA4MMOXMTkyMCBMQ0QgUGFuZWwKLSAgICAgIC0gbGcsYWN4NDY3YWtt
LTcKICAgICAgICAgIyBMRyA3IiAoODAweDQ4MCBwaXhlbHMpIFRGVCBMQ0QgcGFuZWwKICAgICAg
IC0gbGcsbGIwNzB3djgKLSAgICAgICAgIyBMRyBDb3Jwb3JhdGlvbiA3IiBXWEdBIFRGVCBMQ0Qg
cGFuZWwKLSAgICAgIC0gbGcsbGQwNzB3eDMtc2wwMQogICAgICAgICAjIExHIENvcnBvcmF0aW9u
IDUiIEhEIFRGVCBMQ0QgcGFuZWwKICAgICAgIC0gbGcsbGg1MDB3eDEtc2QwMwogICAgICAgICAj
IExHIExQMDc5UVgxLVNQMFYgNy45IiAoMTUzNngyMDQ4IHBpeGVscykgVEZUIExDRCBwYW5lbAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
