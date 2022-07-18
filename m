Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3425780BB
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 13:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E58F8BDFA;
	Mon, 18 Jul 2022 11:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C3C113EC8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 11:29:09 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ez10so20569226ejc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 04:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=OelQSa0F2MTSzddnDczmkNebNTWu1WtqRyCYV6pgOyQG7LWa5wOLoHFjkFInQbg1WD
 Hj8/oZGT1ta19lHEiPFdBRAmZjCLGSKxsNHmBo9umdNCyrI/oztZorQYSeeJ4zIAB0tH
 w+WBv83iazCuwAjZe+CHhxBX0TTj/f6yEqJnPnjKCZ3J5XldBqEd/wexmsxtfzToCE0P
 tYzDlk405EcP5fRq/XTR1+IAdgoN+eXF5VkIEBTnXUzzBgEJnYXSS46uhYRX4qQ4kF3n
 zdfjXPeH8otforWCBaCJ6lH8AIWW59zCIKk4JdhBaDhbB0txxKK+qLGKPPTxmGvvGuV5
 HN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=ceVTxzI1+CZ0/N4m/UcAKu0w6QB086Ey67GnCmvbZvwZD1wVrFHeUJ3zvmcrOQC8jJ
 Z3EXjpIl2wtTAZtnmnU8frnOBpp5lGjON4lLI4p+cx1cM9pfOV16W9hZlPZMveY0Hbl5
 XBeDJBzjNnCoMEjMGkh/PsyJn+bdUdrtZmFPXNPhK5FaWRD/qKyjnSpVwO8uLKMzLiDZ
 9OMqa5wtiTy6XxtYo1Dpo4obx8SfCHYA5txKY5ur+3Kguw7bzuMXC965CHXHmD3u1BbS
 QqR2HMl77MtQoyJfqiFVYucTs4LdJDZyRxXEqpwUYzzC3lNizBUpakm27q650s22cy0S
 8Hag==
X-Gm-Message-State: AJIora+fLuGTQpl2X53bv7I/C2nw70KdsXVuaxS99Pr3Qd6l2Y0lTM4b
 Ms+S9wzbXLnIV9AtSkCMPizzg/dpQJShJLYBn6+keg==
X-Google-Smtp-Source: AGRyM1uno6W1ACvmavzWpWq+peD6TF0boSaIdBtVvtVS3OlkIZAj/zd4UcJi6WzaB7dm8k8w2zW50rBNH5hS99lLbDw=
X-Received: by 2002:a17:907:3e11:b0:72b:49d1:2054 with SMTP id
 hp17-20020a1709073e1100b0072b49d12054mr25785727ejc.78.1658143748439; Mon, 18
 Jul 2022 04:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220714173715.v2.1.I85af54e9ceda74ec69f661852825845f983fc343@changeid>
 <a7c9c0b2a35e45f89cb7d6d7646396f2@ite.com.tw>
In-Reply-To: <a7c9c0b2a35e45f89cb7d6d7646396f2@ite.com.tw>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 18 Jul 2022 13:28:57 +0200
Message-ID: <CAG3jFyu3pBcde1p_sThTB4i6QPOPHvNEGbEGiwRBOBdtTB-7eA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: it6505: Power on downstream device in
 .atomic_enable
To: allen.chen@ite.com.tw
Content-Type: text/plain; charset="UTF-8"
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
Cc: Kenneth.Hung@ite.com.tw, jonas@kwiboo.se, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, treapking@chromium.org,
 Hermes.Wu@ite.com.tw, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, hsinyi@chromium.org, Jau-Chih.Tseng@ite.com.tw
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next
