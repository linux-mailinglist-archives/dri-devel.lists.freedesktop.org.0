Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B697561EEAA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 10:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6B310E260;
	Mon,  7 Nov 2022 09:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C226B10E248
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 09:01:54 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-13d9a3bb27aso11158752fac.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 01:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FwzBoo831j2amE9SO7fIQ9d9yz2poCZdH+kQPx7SSfM=;
 b=O73ncXeqoOLLbQlyGnWEVcvihOUWknGFrcABqq12yharNfYCxXZ0g7RUKovidVkZAC
 20tDMGKD8CDuAlxxLpmXEh5byEj3XXz85/eSnc0dJRkN32Y7rpJx1Zz2tjcRvvxwiGcI
 E01wp/Ryg46GMHPwV0seGExaaWBaUKePsIdDmegzKqU7QI/t9e8lRhAuEZ954gJpVCiR
 Jwn+qAiSpCWvrogx0ErsgubUJfG+VC+3Z67dqI04BSpMexRB9wrMBW9MwSPJi2w8I5fL
 NbcwxUVtvuSa0SaKR2s7/94LMnLBvMOp6OP5eWsbKWDN5fhMa1vQF1hc1DxiKf/fJj6k
 SBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FwzBoo831j2amE9SO7fIQ9d9yz2poCZdH+kQPx7SSfM=;
 b=dxJulP8ZMst2Gba1zrzVdWPtpCALXI4QAwUVyDKt6FJlBVkTcoeBneEWOwqRGfvtyi
 dpvO9+/4cWBEcHmYLiEolb/birVa/wUsB1N/FCrsJ/rzg8qHJnp7ofIpzcwdHZNfB6F3
 ZLSdOZukp41OHWZO2Xqgb/y/qNeysA65i5ZTVmO4nNH7OHP7S/6lJduKpJJLSRKDkZWw
 t7hdm9pYJnvDGGQzru0LZjKJFeAqL1XdE4U/GtPRoD4/WrH6LFcc2lHQmBPbY+VhxAy5
 aPXLMo44UHuv5AwqFM4mViCvXR/nka4go10GIgjzoED3ZDR0nW1QstTAW1l2jXHNyv/6
 zppA==
X-Gm-Message-State: ACrzQf26jhKeYKT2wmxiCkgdbhhRtJMHrMlmRTjqeD55h/9ov17bjhFa
 H3l33gazRbqqf6mJxVscWLYBLUKsr7I5v/lJZTlXG3xH
X-Google-Smtp-Source: AMsMyM6IS8cbHvO7dvek+QYW2lHmO3Mvsw9H52vof4idxuJKFImYBtyWBXlRHwkuJYkaUSGz/nt4/62bpLP9G3TAnBM=
X-Received: by 2002:a05:6870:41cb:b0:131:9656:cc30 with SMTP id
 z11-20020a05687041cb00b001319656cc30mr39682014oac.51.1667811713898; Mon, 07
 Nov 2022 01:01:53 -0800 (PST)
MIME-Version: 1.0
From: Cc Carnaghi <carnaghicc@gmail.com>
Date: Mon, 7 Nov 2022 03:01:35 -0600
Message-ID: <CAHhA7CuxZ7xgin4FUftsb9W5-_CUJEk-Vys_d3nCjJ7FvSZcSg@mail.gmail.com>
Subject: Re: [PATCH 4/8] pwm: atmel-hlcdc: fix struct clk pointer comparing
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000c25d6005ecddac28"
X-Mailman-Approved-At: Mon, 07 Nov 2022 09:20:34 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000c25d6005ecddac28
Content-Type: text/plain; charset="UTF-8"



--000000000000c25d6005ecddac28
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--000000000000c25d6005ecddac28--
