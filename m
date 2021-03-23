Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B1334540D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 01:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26506E7E6;
	Tue, 23 Mar 2021 00:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17E36E811
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:44:51 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id h25so10003109pgm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 17:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u8gpi64cF5kMqHz3hWfTceD8Btp88LPr/NRXUKhPFF4=;
 b=CXioe6b1M+1aq7DUqGgQaLVdOVTx1QCdGwVlhwACkO2U4bxW2H2coUT0nWGKIRjMjg
 jv16UOvWPb9/Pv2CCS+qlg3bPzaIcAFV7Ryi2ZPoGgM3DwKmt2k+OXEvKo+ydhzVqigl
 /inSRofnWCoaKr9xOgBl46MR9Ljx/zlUTpfjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u8gpi64cF5kMqHz3hWfTceD8Btp88LPr/NRXUKhPFF4=;
 b=IwB5zhtmCOAX044hr1VUb7FS+Grv4NNXNo/m1yDF9ChfgIgD4TYMLESM9uhEQ3dCRo
 QEgObMdXOBqEUpGKeloDL7mcI3y3ptX+ho5q5vWyfVmFI10hjcKi/Ni5U69rxq4xUPcu
 rQAbPInO5boXbRnyMc7uOo/f9nE0mrUk6btPeh2J3U8zTU/Q+fLnsmmpoN3LrA6xT6Ml
 j5WORAv7mKTN0nkKrzpI4Dx1xdTQv6BmFfrYBPsiNcLgJT8/KKDGbQtXEn/lIP1FMh+n
 5co6YYqLNW5SH5LMyidf8xrCiGfq5knJBpyFQclAukMLx6EanbkORmAN/+lpvZWQ6V3f
 t//w==
X-Gm-Message-State: AOAM531j7aaSZhIOeTODdtnsZzlSXPYfKwRvyO6Z6ZoFrSPFE7qqnfq6
 WGGi3qJJa980p3ssOPlzLsbKHg==
X-Google-Smtp-Source: ABdhPJzHtPrfpHQc5JKj7moe1xvgB+smMUBy6BwiKJlLPq5/nDwAlK0lytfkgPQu5ie3TTesgd8x6Q==
X-Received: by 2002:a17:902:b781:b029:e4:545d:77 with SMTP id
 e1-20020a170902b781b02900e4545d0077mr2354442pls.59.1616460291364; 
 Mon, 22 Mar 2021 17:44:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:90a9:b908:f93a:2f78])
 by smtp.gmail.com with UTF8SMTPSA id y66sm7338467pgb.78.2021.03.22.17.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 17:44:50 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
X-Google-Original-From: Matthias Kaehlcke <mka@google.com>
Date: Mon, 22 Mar 2021 17:44:48 -0700
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [v1] drm/msm/disp/dpu1: icc path needs to be set before dpu
 runtime resume
Message-ID: <YFk6AINTcg2S6vDe@google.com>
References: <y>
 <1616404632-13693-1-git-send-email-kalyan_t@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616404632-13693-1-git-send-email-kalyan_t@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, dianders@chromium.org, mkrishn@codeaurora.org,
 linux-arm-msm@vger.kernel.org, hywu@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, y@qualcomm.com, midean@google.com,
 freedreno@lists.freedesktop.org, Kalyan Thota <kalyant@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 02:17:12AM -0700, Kalyan Thota wrote:
> From: Kalyan Thota <kalyant@codeaurora.org>
> 
> DPU runtime resume will request for a min vote on the AXI bus as
> it is a necessary step before turning ON the AXI clock.
> 
> The change does below
> 1) Move the icc path set before requesting runtime get_sync.
> 2) remove the dependency of hw catalog for min ib vote
> as it is initialized at a later point.
> 
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>

Confirmed that this fixes a bunch of warnings at boot on SC7180 when
(out-of-tree) camera support is enabled:

  [    1.832228] gcc_disp_hf_axi_clk status stuck at 'off'
  [    2.118292] gcc_disp_hf_axi_clk status stuck at 'off'
  [    2.442383] gcc_disp_hf_axi_clk already disabled
  [    2.750054] gcc_disp_hf_axi_clk already unprepared
  [    3.154835] gcc_disp_hf_axi_clk already disabled
  [    3.421835] gcc_disp_hf_axi_clk already unprepared

Tested-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
