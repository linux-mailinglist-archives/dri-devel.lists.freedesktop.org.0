Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C32B101B0F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5124E6EBA5;
	Tue, 19 Nov 2019 08:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA30A8979E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 00:32:37 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 207so3080124pge.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 16:32:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
 :user-agent:date;
 bh=o0OXgLmHTG6WHUoLd4+XFd/oiOrWoJBJ98oXwGWf49U=;
 b=MSZ7KAOoF1+cIz7Nn5+JW91EVL24VGasXFTp9bCKGX4tPt/n2oXeIOk+GAxlexonGb
 muzbPW7q8Qp/mSLPd1qABxdKheFkQZFV/n6ApM/l2pgAbAJN8zjdrzD0eksMX3TOrJKn
 GFe0Wbo7Lhjkdwb5oD5zJBSITmMDpV3yFs8/VGod8cNPxz+ZwvnG4p0rMf1quJttFG0u
 XrOEDlH8kNtBuTcHFlr5khjNRJW1iTJ7k/GGi4nZFh/cSLwmqSniX848aUjctxfmqUmW
 8PiXQpKPmWc0WkJIZkXzOYiVz+0dlIm+5FfjAWBZQCARmgX0YBCGGV7bmlIlW9JJq79j
 wzTA==
X-Gm-Message-State: APjAAAXgbavcK+C38DfziKbLKU9vxCYb+FODbZNHhSG3gy7kH4amFcQr
 oarmJ3WIUc5jNDksDspr/YRpwg==
X-Google-Smtp-Source: APXvYqyAKyUgyhNNCirKuH+kZ1grecYk6P0rtU1NXPsuBpylGactVDgBMuarRDsz9xu7bEt2bBE6ww==
X-Received: by 2002:a65:47c1:: with SMTP id f1mr2187675pgs.393.1574123557349; 
 Mon, 18 Nov 2019 16:32:37 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id d23sm23136047pfo.140.2019.11.18.16.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 16:32:36 -0800 (PST)
Message-ID: <5dd33824.1c69fb81.2d94a.4f12@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <20191118234043.331542-1-robdclark@gmail.com>
References: <20191118234043.331542-1-robdclark@gmail.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/a6xx: restore previous freq on resume
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date: Mon, 18 Nov 2019 16:32:35 -0800
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:cc:to:subject:from:user-agent:date;
 bh=o0OXgLmHTG6WHUoLd4+XFd/oiOrWoJBJ98oXwGWf49U=;
 b=M5FXXW0mR0xn+5fsbeH0ePNNujEUWE4+jL4vomKqcmMB5GfonCjRlaIdutis/H5QB3
 zAuMK1WjG32gGhpBOHHnDhMAREoTUU7xKb+mmBwWqIxeQbdzL4MQc+HxYvdIqqZ9dKnQ
 opTS860TAZBLz8BVfzAH++6rhEyMViLuHo5rU=
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBSb2IgQ2xhcmsgKDIwMTktMTEtMTggMTU6NDA6MzgpCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmggYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2FkcmVuby9hNnh4X2dtdS5oCj4gaW5kZXggMzlhMjZkZDYzNjc0Li4yYWY5MWVkN2VkMGMgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuaAo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmgKPiBAQCAtNjMsNiArNjMsOSBA
QCBzdHJ1Y3QgYTZ4eF9nbXUgewo+ICAgICAgICAgc3RydWN0IGNsa19idWxrX2RhdGEgKmNsb2Nr
czsKPiAgICAgICAgIHN0cnVjdCBjbGsgKmNvcmVfY2xrOwo+ICAKPiArICAgICAgIC8qIGN1cnJl
bnQgcGVyZm9ybWFuY2UgaW5kZXggc2V0IGV4dGVybmFsbHkgKi8KPiArICAgICAgIGludCBjdXJy
ZW50X3BlcmZfaW5kZXg7Cj4gKwoKSXMgdGhlcmUgYSByZWFzb24gdGhpcyBpc24ndCB1bnNpZ25l
ZD8gSXQgbG9va3MgbGlrZQpfX2E2eHhfZ211X3NldF9mcmVxKCkgdGFrZXMgYW4gaW50LCBidXQg
bWF5YmUgaXQgc2hvdWxkIHRha2UgYSB1MTYgb3IKc29tZXRoaW5nPwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
