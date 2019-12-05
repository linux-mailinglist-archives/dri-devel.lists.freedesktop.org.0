Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24281146B9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 19:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D99F6E150;
	Thu,  5 Dec 2019 18:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961806E150;
 Thu,  5 Dec 2019 18:18:13 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id i15so3437769oto.7;
 Thu, 05 Dec 2019 10:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ctt78cWwZCaPfsbkOwoWRKaRaaHO7Q0cJcGkZb/xygE=;
 b=m/1CDxJifKsIpLAjg5IsT2FrXJ1p3pcHB4+C8Y0EXj0kgedxV0degqiYLW6iHZrng6
 rE6dy/1wC9V3UP/3aKmm2UI1dwU4VmQZdWAsyl2OYo7FOB3nwAXSTW72+uWzYSwPS7Fw
 PNSPyvUrJzog3xTdd4uBbAMsEAKr4CcKCjCGNzRXajTOlRviUOtSXEsh4KszRuC2wRog
 ogfYQx/BjZbwvdVpdAydgTmvqM3pG9d2OoT8LhBG2bhTif9/EOQVaL1pWfw3LR4Mg0i5
 dUC9nKtJ2M0WOI/lJdZJ9BOropsUGgArR/9t4G5Fmw/C80zx6MhBWe2WK6MvdxbbuXaw
 yKAA==
X-Gm-Message-State: APjAAAXS66m9wJ4BejzhMOfLekDf1GrT1O/Z9yRH47Q39EQM5be91g0j
 9qGTFGivBBNE3xj87QVAvA==
X-Google-Smtp-Source: APXvYqyfs8OhUj0eeDczAIKIgi1gk0+FRTxh0W2z3IWAj0xjcIUjt8xn3BxVAR2EWbyK3UtPCpCimw==
X-Received: by 2002:a9d:554f:: with SMTP id h15mr8059510oti.338.1575569892874; 
 Thu, 05 Dec 2019 10:18:12 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n16sm3596887otk.25.2019.12.05.10.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 10:18:12 -0800 (PST)
Date: Thu, 5 Dec 2019 12:18:11 -0600
From: Rob Herring <robh@kernel.org>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [PATCH 1/4] dt-bindings: msm:disp: add sc7180 DPU variant
Message-ID: <20191205181811.GA5706@bogus>
References: <1574683169-19342-1-git-send-email-kalyan_t@codeaurora.org>
 <1574683169-19342-2-git-send-email-kalyan_t@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574683169-19342-2-git-send-email-kalyan_t@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, dhar@codeaurora.org, travitej@codeaurora.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 Kalyan Thota <kalyan_t@codeaurora.org>, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org, chandanu@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyNSBOb3YgMjAxOSAxNzoyOToyNiArMDUzMCwgS2FseWFuIFRob3RhIHdyb3RlOgo+
IEFkZCBhIGNvbXBhdGlibGUgc3RyaW5nIHRvIHN1cHBvcnQgc2M3MTgwIGRwdSB2ZXJzaW9uLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEthbHlhbiBUaG90YSA8a2FseWFuX3RAY29kZWF1cm9yYS5vcmc+
Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9k
cHUudHh0IHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gCgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
