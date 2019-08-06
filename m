Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F2782C96
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDCF89D87;
	Tue,  6 Aug 2019 07:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919016E2E3;
 Tue,  6 Aug 2019 00:23:00 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 839703E9AC;
 Tue,  6 Aug 2019 00:22:59 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v5 7/7] ARM: qcom_defconfig: add ocmem support
Date: Mon,  5 Aug 2019 20:22:29 -0400
Message-Id: <20190806002229.8304-8-masneyb@onstation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806002229.8304-1-masneyb@onstation.org>
References: <20190806002229.8304-1-masneyb@onstation.org>
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565050979;
 bh=gBeC38WgB3xWQLxVHl7uyELkZ+E+b+WfCATgX0olB60=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ItEGiT10F0jY1COc8vBCK4WBjb2ClScpN83SS4EbvX+ujMeLvnHuK780kakIeZSPF
 lvkebFt4y50XIIvIvDpco+aeFtkfIe3NiOzag9YIA4edu5yWiBgrP0hzh6DhVqgwuJ
 fD3AicZ3aUAVpOjbqcX+ixWBik/vAvFDe8I0th4s=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG9jbWVtIGRyaXZlciB0aGF0J3MgbmVlZGVkIGZvciBzb21lIGEzeHggYW5kIGE0eHggYmFz
ZWQgc3lzdGVtcy4KClNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRp
b24ub3JnPgotLS0KVGhpcyBpcyBhIG5ldyBwYXRjaCB0aGF0IHdhcyBpbnRyb2R1Y2VkIGluIHY1
LgoKIGFyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZj
b25maWcgYi9hcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29uZmlnCmluZGV4IDM0NDMzYmY1ODg1
ZC4uNTk1ZTE5MTBiYTc4IDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29u
ZmlnCisrKyBiL2FyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZjb25maWcKQEAgLTIyNSw2ICsyMjUs
NyBAQCBDT05GSUdfUUNPTV9XQ05TU19QSUw9eQogQ09ORklHX1JQTVNHX0NIQVI9eQogQ09ORklH
X1JQTVNHX1FDT01fU01EPXkKIENPTkZJR19RQ09NX0dTQkk9eQorQ09ORklHX1FDT01fT0NNRU09
eQogQ09ORklHX1FDT01fUE09eQogQ09ORklHX1FDT01fU01FTT15CiBDT05GSUdfUUNPTV9TTURf
UlBNPXkKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
