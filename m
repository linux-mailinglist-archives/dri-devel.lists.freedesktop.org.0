Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B05FC1EA024
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 10:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3095789E1A;
	Mon,  1 Jun 2020 08:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6994D89C59
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 08:33:17 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q2so7040368ljm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 01:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Yer3urQYiOMXfRZ9l+aQabnMndlBrbK8V5JUt5mhHI=;
 b=Eaxr1G/xdxbYkLuYx88rNIWZHLBEBrWPJTpzxgrV+T71VRLI9TeBmPh8q03bEk5Cr5
 WKhDUS3LqGw9nK22aPl6TUaeYYl0t54CK/+zFGnQ/SXwP/rAZttgjmuPEtyBEuI64k2H
 /qMNZzUyeF4I46o9LWfd2SieboteA4/dIipxTqpkoKuy9fiGxxBgTr6H46CVkCsedhst
 sGrG2BaoTdHIuQtsNzhuS1Km7+ykqmJJequuecJpN1r5LJnpNn/pT19WXKqInVLkMmoP
 naMYcItKiz5kEQFTWfzk3jkjfgY0I5Yhyf3i0E3UcGNGOtFXfI8pN0uNU9gv8wJ2tywR
 RWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8Yer3urQYiOMXfRZ9l+aQabnMndlBrbK8V5JUt5mhHI=;
 b=ol13Vo6KFiqu2knwBgatD9VQehUuzLZcVymSGniyIeAZkCI3eDlhEZ9KD+0iID3BAh
 m8NFj6uAnaRcj/b1Zd0JauGbkDZ9l/m1KsYRP7fdhGiB7HlYxCAgx3ZFAG2J08RJ83hC
 mYR1MR3nIH1Ybri39bz1NIgBo79ivpudulzwKeNHzKM2kjaLoIKNPGdn9AEi3FYv0mlB
 gqVAXowzyfdO6vS9E46wxQ3r/Hvsz+urCH0VtfAnwN8VbrpMbZ/tQ8XmNUxbf+R9z7VW
 gfPkQ1TJbbn/nN+12YCjhzvpV+FdIVgDe4cEuav1lUjfekuk04HWyyU3hyYITV2wBRa+
 m5sQ==
X-Gm-Message-State: AOAM533x8QoaLTbVoH+B/ni3z7IJ4qa44i0X4j+paqjKgDGiy8Ns1+j/
 IQwmdkBwyIcZ8Zx+QvhOuKmPTmNy990=
X-Google-Smtp-Source: ABdhPJyM06YDjm3IwmPKPeeF0RPISmSSuI3RSxjZq9mwb2e1/wrOilfm6lIy/U+oPxjpnBiQsd54yA==
X-Received: by 2002:a2e:95c5:: with SMTP id y5mr10278128ljh.229.1591000395626; 
 Mon, 01 Jun 2020 01:33:15 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
 by smtp.gmail.com with ESMTPSA id f14sm3871433ljp.118.2020.06.01.01.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 01:33:15 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 1/6] dt-bindings: panel: add Seiko 70WVW2T 7" panel
Date: Mon,  1 Jun 2020 10:33:04 +0200
Message-Id: <20200601083309.712606-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601083309.712606-1-sam@ravnborg.org>
References: <20200601083309.712606-1-sam@ravnborg.org>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>,
 Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGNvbXBhdGlibGUgZm9yIFNlaWtvIEluc3RydW1lbnRzIDciIFRGVCBMQ0QuClRoaXMgcGFu
ZWwgaXMgYSBkdW1iIHBhbmVsIHRoYXQgbWF0Y2hlcyB0aGUgcGFuZWwtc2ltcGxlIGJpbmRpbmcu
CgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBTw7hy
ZW4gQW5kZXJzZW4gPHNhbkBza292LmRrPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVk
aW5nQGdtYWlsLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1sICAg
ICAgICAgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwt
c2ltcGxlLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9wYW5lbC1zaW1wbGUueWFtbAppbmRleCBkNmNjYTE0Nzk2MzMuLjYwY2MwOTNmYmQ3NSAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvcGFuZWwtc2ltcGxlLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLnlhbWwKQEAgLTIzOSw2ICsyMzksOCBAQCBw
cm9wZXJ0aWVzOgogICAgICAgLSBzaGFycCxsczAyMGIxZGQwMWQKICAgICAgICAgIyBTaGVsbHkg
U0NBMDcwMTAtQkZOLUxOTiA3LjAiIFdWR0EgVEZUIExDRCBwYW5lbAogICAgICAgLSBzaGVsbHks
c2NhMDcwMTAtYmZuLWxubgorICAgICAgICAjIFNlaWtvIEluc3RydW1lbnRzIEluYy4gNy4wIiBX
VkdBICg4MDB4NDgwKSBURlQgd2l0aCBUb3VjaC1QYW5lbAorICAgICAgLSBzaWksNzB3dncydAog
ICAgICAgICAjIFN0YXJyeSBLUjA3MFBFMlQgNyIgV1ZHQSBURlQgTENEIHBhbmVsCiAgICAgICAt
IHN0YXJyeSxrcjA3MHBlMnQKICAgICAgICAgIyBTdGFycnkgMTIuMiIgKDE5MjB4MTIwMCBwaXhl
bHMpIFRGVCBMQ0QgcGFuZWwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
