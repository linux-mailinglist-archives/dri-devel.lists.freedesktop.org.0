Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B71100075
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 09:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633546E05C;
	Mon, 18 Nov 2019 08:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE306E44E;
 Sun, 17 Nov 2019 11:48:40 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 976133F233;
 Sun, 17 Nov 2019 11:48:39 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	robh+dt@kernel.org
Subject: [PATCH 1/4] dt-bindings: drm/msm/gpu: document second interconnect
Date: Sun, 17 Nov 2019 06:48:22 -0500
Message-Id: <20191117114825.13541-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117114825.13541-1-masneyb@onstation.org>
References: <20191117114825.13541-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Nov 2019 08:36:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1573991319;
 bh=IF5jVC/IJ/HGFr94VZv3lqZ7QDpm1s7uu+GgLtg8z60=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kzB7W0se4g1Mm/JwUOV5vsXp5jZJ6YzdyozpICfW6eLEyrPCGsmxAYPJk7X3jYPbi
 P9uCZNhfO8srSC5SHG/o5FawaAWUAw6H2eQq5m5Lym+PVoEHE9wxtISRviVCRe+Gyz
 N7+ZKvVn47o7i+rO4D61rg20TQvMqxR6W5KLVGmo=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBBM3h4IGFuZCBhbGwgQTR4eCBBZHJlbm8gR1BVcyBkbyBub3QgaGF2ZSBHTUVNIGluc2lk
ZSB0aGUgR1BVIGNvcmUKYW5kIG11c3QgdXNlIHRoZSBPbiBDaGlwIE1FTW9yeSAoT0NNRU0pIGlu
IG9yZGVyIHRvIGJlIGZ1bmN0aW9uYWwuClRoZXJlJ3MgYSBzZXBhcmF0ZSBpbnRlcmNvbm5lY3Qg
cGF0aCB0aGF0IG5lZWRzIHRvIGJlIHNldHVwIHRvIE9DTUVNLgpMZXQncyBkb2N1bWVudCB0aGlz
IHNlY29uZCBpbnRlcmNvbm5lY3QgcGF0aCB0aGF0J3MgYXZhaWxhYmxlLgoKU2lnbmVkLW9mZi1i
eTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+Ci0tLQogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dwdS50eHQgfCA2ICsrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9ncHUudHh0IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dwdS50eHQKaW5k
ZXggMmI4ZmQyNmM0M2IwLi4zZTZjZDNmNjRhNzggMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9ncHUudHh0CisrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9ncHUudHh0CkBAIC0yMyw3ICsyMywx
MCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogLSBpb21tdXM6IG9wdGlvbmFsIHBoYW5kbGUgdG8g
YW4gYWRyZW5vIGlvbW11IGluc3RhbmNlCiAtIG9wZXJhdGluZy1wb2ludHMtdjI6IG9wdGlvbmFs
IHBoYW5kbGUgdG8gdGhlIE9QUCBvcGVyYXRpbmcgcG9pbnRzCiAtIGludGVyY29ubmVjdHM6IG9w
dGlvbmFsIHBoYW5kbGUgdG8gYW4gaW50ZXJjb25uZWN0IHByb3ZpZGVyLiAgU2VlCi0gIC4uL2lu
dGVyY29ubmVjdC9pbnRlcmNvbm5lY3QudHh0IGZvciBkZXRhaWxzLgorICAuLi9pbnRlcmNvbm5l
Y3QvaW50ZXJjb25uZWN0LnR4dCBmb3IgZGV0YWlscy4gU29tZSBBM3h4IGFuZCBhbGwgQTR4eCBw
bGF0Zm9ybXMKKyAgd2lsbCBoYXZlIHR3byBwYXRoczsgYWxsIG90aGVycyB3aWxsIGhhdmUgb25l
IHBhdGguCistIGludGVyY29ubmVjdC1uYW1lczogVGhlIG5hbWVzIG9mIHRoZSBpbnRlcmNvbm5l
Y3QgcGF0aHMgdGhhdCBjb3JyZXNwb25kIHRvIHRoZQorICBpbnRlcmNvbm5lY3RzIHByb3BlcnR5
LiBWYWx1ZXMgbXVzdCBiZSBnZngtbWVtIGFuZCBvY21lbS4KIC0gcWNvbSxnbXU6IEZvciBHTVUg
YXR0YWNoZWQgZGV2aWNlcyBhIHBoYW5kbGUgdG8gdGhlIEdNVSBkZXZpY2UgdGhhdCB3aWxsCiAg
IGNvbnRyb2wgdGhlIHBvd2VyIGZvciB0aGUgR1BVLiBBcHBsaWNhYmxlIHRhcmdldHM6CiAgICAg
LSBxY29tLGFkcmVuby02MzAuMgpAQCAtNzYsNiArNzksNyBAQCBFeGFtcGxlIGE2eHggKHdpdGgg
R01VKToKIAkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmZ3B1X29wcF90YWJsZT47CiAKIAkJaW50
ZXJjb25uZWN0cyA9IDwmcnNjX2hsb3MgTUFTVEVSX0dGWDNEICZyc2NfaGxvcyBTTEFWRV9FQkkx
PjsKKwkJaW50ZXJjb25uZWN0LW5hbWVzID0gImdmeC1tZW0iOwogCiAJCXFjb20sZ211ID0gPCZn
bXU+OwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
