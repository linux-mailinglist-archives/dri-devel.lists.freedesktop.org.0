Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A199551D9C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 23:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9DB89BCD;
	Mon, 24 Jun 2019 21:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279FC89E2B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:59:12 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k20so177916ios.10
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U6pFo/bIhTqQ0w1jnYxKDUFNH921WAQ1SBJslZuGZ/4=;
 b=XXj3padJwaw8NFxz9HD9KV5FnSLcQaAR41qAw9UDgxfDIEYq7czLEloBaZVYTlpbkq
 uFaSEcCduyONqgQHQ08cWpQpLMNolvee+6LQ84oauEXy76dpzUloIC71LA2B0eYOUt92
 h8R1hZzobRANpBpCiL7CW/Q2shtRjTmtLPYmeTb6KL+gORMlKZSc4yxPyCh07KY1wsr2
 aeRXzuwalngpvt7Ol2EZsfpnNY0U2MMedQU4Wvi9ZsKbQN2qcDnjE62W614JZB4LKoPa
 cQQSaGa6/bXJV9mXyoaTZ1D+6L/9lH07psB7ZU/b8VvinVhs6FvWHHwEdfUxfsySlP2P
 e6/g==
X-Gm-Message-State: APjAAAUZEDY2kkcAxmBJXSQCRau6sOf8sUTOEZTfYrR3tn9mBwXeyoFT
 czrARf39Imn5c2+tZGnKuzohKvg=
X-Google-Smtp-Source: APXvYqxwApUzrVCirnDhUiOVhtpjvg8T1pA8K/0e+4LUTO11JV3Qb/Ynxib5LOUU+BdZ3jjlkFr3Mw==
X-Received: by 2002:a02:aa0d:: with SMTP id r13mr27011835jam.129.1561413551195; 
 Mon, 24 Jun 2019 14:59:11 -0700 (PDT)
Received: from localhost.localdomain ([64.188.179.247])
 by smtp.googlemail.com with ESMTPSA id l5sm14717301ioq.83.2019.06.24.14.59.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 14:59:10 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 12/15] dt-bindings: display: Convert innolux,
 ee101ia-01 panel to DT schema
Date: Mon, 24 Jun 2019 15:56:46 -0600
Message-Id: <20190624215649.8939-13-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624215649.8939-1-robh@kernel.org>
References: <20190624215649.8939-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udmVydCB0aGUgaW5ub2x1eCxlZTEwMWlhLTAxIExWRFMgcGFuZWwgYmluZGluZyB0byBEVCBz
Y2hlbWEuCgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKUmV2aWV3ZWQtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9v
dGxpbi5jb20+CkFja2VkLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgpT
aWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIC4uLi9kaXNw
bGF5L3BhbmVsL2lubm9sdXgsZWUxMDFpYS0wMWQudHh0ICAgICB8ICA3IC0tLS0tLQogLi4uL2Rp
c3BsYXkvcGFuZWwvaW5ub2x1eCxlZTEwMWlhLTAxZC55YW1sICAgIHwgMjIgKysrKysrKysrKysr
KysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL2lubm9sdXgsZWUxMDFpYS0wMWQudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvaW5ub2x1eCxl
ZTEwMWlhLTAxZC55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvaW5ub2x1eCxlZTEwMWlhLTAxZC50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbm5vbHV4LGVlMTAxaWEtMDFk
LnR4dApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZTVjYTRjY2Q1NWVkLi4wMDAwMDAw
MDAwMDAKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvaW5ub2x1eCxlZTEwMWlhLTAxZC50eHQKKysrIC9kZXYvbnVsbApAQCAtMSw3ICswLDAgQEAK
LUlubm9sdXggQ29ycG9yYXRpb24gMTAuMSIgRUUxMDFJQS0wMUQgV1hHQSAoMTI4MHg4MDApIExW
RFMgcGFuZWwKLQotUmVxdWlyZWQgcHJvcGVydGllczoKLS0gY29tcGF0aWJsZTogc2hvdWxkIGJl
ICJpbm5vbHV4LGVlMTAxaWEtMDFkIgotCi1UaGlzIGJpbmRpbmcgaXMgY29tcGF0aWJsZSB3aXRo
IHRoZSBsdmRzLXBhbmVsIGJpbmRpbmcsIHdoaWNoIGlzIHNwZWNpZmllZAotaW4gcGFuZWwtbHZk
cy50eHQgaW4gdGhpcyBkaXJlY3RvcnkuCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbm5vbHV4LGVlMTAxaWEtMDFkLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbm5vbHV4LGVl
MTAxaWEtMDFkLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi41
Y2M5N2NiZTE3ZmEKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbm5vbHV4LGVlMTAxaWEtMDFkLnlhbWwKQEAgLTAsMCAr
MSwyMiBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorJVlBTUwgMS4yCist
LS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9pbm5v
bHV4LGVlMTAxaWEtMDFkLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IElubm9sdXggQ29ycG9yYXRpb24gMTAuMSIg
RUUxMDFJQS0wMUQgV1hHQSAoMTI4MHg4MDApIExWRFMgcGFuZWwKKworbWFpbnRhaW5lcnM6Cisg
IC0gSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQGJxLmNvbT4KKyAgLSBUaGllcnJ5IFJl
ZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgorCithbGxPZjoKKyAgLSAkcmVmOiBsdmRz
LnlhbWwjCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgaXRlbXM6CisgICAgICAt
IGNvbnN0OiBpbm5vbHV4LGVlMTAxaWEtMDFkCisgICAgICAtIHt9ICMgcGFuZWwtbHZkcywgYnV0
IG5vdCBsaXN0ZWQgaGVyZSB0byBhdm9pZCBmYWxzZSBzZWxlY3QKKworLi4uCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
