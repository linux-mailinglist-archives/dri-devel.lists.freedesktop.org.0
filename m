Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65E210FF1A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93C16E530;
	Tue,  3 Dec 2019 13:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038C86E530
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:48:35 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id d199so1876923pfd.11
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 05:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UUlsRRK2pgCm9l96Sadau8/Jinv10/1VueVd+pNemqM=;
 b=pqv01v6fo3mpq7TQX00vt18EaHRdaCsGXmLTUKgRgQNDOg9oJXZj8B4GZsmbY7Zyoa
 lF/4fyJ4dIg0xBMBqwZKG7DVrxxO4lR/BgD8vYHJehnhoKMf1WNx+xbosnVKiMqfG4bv
 WxyoA/I8QKSPSoqhX7AzRJabSDgFa9hiZ/1xzIMbS4x/lI0L6jsA5/XvBbfCWT3YoWjN
 JtQmiTzbmt+7Hv+P/CMLMF7Xmq9dbp2SrNq6MALvUjI81K5xN8Q/ipZytyDroGlt7EYq
 6OgEghSKHrlcqcPuwNxRk1237rAF1bOJUBW84EihQcBInQ9XJhLLPL0cOiVsW1GrOGHl
 2TUg==
X-Gm-Message-State: APjAAAV0QCX9so7fMswJh90DROnH1e9yeyLeeA4sEhIVBi7VFWySNVCV
 PZvGJn92IxuiOnU2Nhxh3lhZqg==
X-Google-Smtp-Source: APXvYqybsy7gWan3hjAOgJUaGmGoAqpOTEE3wpc7hSQ1++Wb69OSIzyrvfi/r0nKL4x2BRjmdiyFJw==
X-Received: by 2002:a63:e94d:: with SMTP id q13mr5361869pgj.209.1575380914518; 
 Tue, 03 Dec 2019 05:48:34 -0800 (PST)
Received: from localhost.localdomain ([115.97.190.29])
 by smtp.gmail.com with ESMTPSA id y144sm4397892pfb.188.2019.12.03.05.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 05:48:34 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v12 1/7] dt-bindings: sun6i-dsi: Document A64 MIPI-DSI
 controller
Date: Tue,  3 Dec 2019 19:18:10 +0530
Message-Id: <20191203134816.5319-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191203134816.5319-1-jagan@amarulasolutions.com>
References: <20191203134816.5319-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UUlsRRK2pgCm9l96Sadau8/Jinv10/1VueVd+pNemqM=;
 b=kxVcUwh6Bbz7GVnMzIw7OTehgR8KgnjaD4BiGmDF/ZlEyM7XbXFeVNJkNUjcS0t6l1
 ug08pUmwQ8V3G1mAq5V/rr+pNYT5oBj1D04K4ejrpKH8Q0S2oo0oJ4yVDGTkroAclcl8
 ITvyf4yd9x2XCvuTbtm7VgEqscmkSFDA0Nuxw=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE1JUEkgRFNJIGNvbnRyb2xsZXIgaW4gQWxsd2lubmVyIEE2NCBpcyBzaW1pbGFyIHRvIEEz
My4KCkJ1dCB1bmxpa2UgQTMzLCBBNjQgZG9lc24ndCBoYXZlIERTSV9TQ0xLIGdhdGluZyBzbyBp
dCBpcyB2YWxpZAp0byBoYXZlIHNlcGFyYXRlIGNvbXBhdGlibGUgZm9yIEE2NCBvbiB0aGUgc2Ft
ZSBkcml2ZXIuCgpEU0lfU0NMSyB1c2VzIG1vZCBjbG9jay1uYW1lcyBvbiBkdC1iaW5kaW5ncywg
c28gdGhlIHNhbWUKaXMgbm90IHJlcXVpcmVkIGZvciBBNjQuCgpPbiB0aGF0IG5vdGUKLSBBNjQg
cmVxdWlyZSBtaW5pbXVtIG9mIDEgY2xvY2sgbGlrZSB0aGUgYnVzIGNsb2NrCi0gQTMzIHJlcXVp
cmUgbWluaW11bSBvZiAyIGNsb2NrcyBsaWtlIGJvdGggYnVzLCBtb2QgY2xvY2tzCgpTbywgdXBk
YXRlIGR0LWJpbmRpbmdzIHNvLXRoYXQgaXQgY2FuIGRvY3VtZW50IGJvdGggQTMzLApBNjQgYmlu
ZGluZ3MgcmVxdWlyZW1lbnRzLgoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+ClNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgotLS0KQ2hhbmdlcyBmb3IgdjEyOgotIFVzZSAnZW51bScgaW5zdGVhZCBvZiBvbmVPZitj
b25zdAoKIC4uLi9kaXNwbGF5L2FsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kc2kueWFtbCB8IDIw
ICsrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kc2kueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW42aS1hMzEtbWlw
aS1kc2kueWFtbAppbmRleCBkYWZjMDk4MGM0ZmEuLmI5MTQ0NjQ3NWYzNSAxMDA2NDQKLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjZp
LWEzMS1taXBpLWRzaS55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2FsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kc2kueWFtbApAQCAtMTUsNyArMTUs
OSBAQCBwcm9wZXJ0aWVzOgogICAiI3NpemUtY2VsbHMiOiB0cnVlCiAKICAgY29tcGF0aWJsZToK
LSAgICBjb25zdDogYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRzaQorICAgIGVudW06CisgICAg
ICAtIGFsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kc2kKKyAgICAgIC0gYWxsd2lubmVyLHN1bjUw
aS1hNjQtbWlwaS1kc2kKIAogICByZWc6CiAgICAgbWF4SXRlbXM6IDEKQEAgLTI0LDYgKzI2LDgg
QEAgcHJvcGVydGllczoKICAgICBtYXhJdGVtczogMQogCiAgIGNsb2NrczoKKyAgICBtaW5JdGVt
czogMQorICAgIG1heEl0ZW1zOiAyCiAgICAgaXRlbXM6CiAgICAgICAtIGRlc2NyaXB0aW9uOiBC
dXMgQ2xvY2sKICAgICAgIC0gZGVzY3JpcHRpb246IE1vZHVsZSBDbG9jawpAQCAtNjMsMTMgKzY3
LDI1IEBAIHJlcXVpcmVkOgogICAtIHJlZwogICAtIGludGVycnVwdHMKICAgLSBjbG9ja3MKLSAg
LSBjbG9jay1uYW1lcwogICAtIHBoeXMKICAgLSBwaHktbmFtZXMKICAgLSByZXNldHMKICAgLSB2
Y2MtZHNpLXN1cHBseQogICAtIHBvcnQKIAorYWxsT2Y6CisgIC0gaWY6CisgICAgICBwcm9wZXJ0
aWVzOgorICAgICAgICAgY29tcGF0aWJsZToKKyAgICAgICAgICAgY29udGFpbnM6CisgICAgICAg
ICAgICAgY29uc3Q6IGFsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kc2kKKyAgICAgIHRoZW46Cisg
ICAgICAgIHByb3BlcnRpZXM6CisgICAgICAgICAgY2xvY2tzOgorICAgICAgICAgICAgbWluSXRl
bXM6IDIKKyAgICAgICAgcmVxdWlyZWQ6CisgICAgICAgICAgLSBjbG9jay1uYW1lcworCiBhZGRp
dGlvbmFsUHJvcGVydGllczogZmFsc2UKIAogZXhhbXBsZXM6Ci0tIAoyLjE4LjAuMzIxLmdmZmM2
ZmEwZTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
