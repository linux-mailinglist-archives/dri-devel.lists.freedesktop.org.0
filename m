Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1821C17F1
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 16:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DF76E047;
	Fri,  1 May 2020 14:39:25 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010256E047
 for <dri-devel@freedesktop.org>; Fri,  1 May 2020 14:39:24 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id i5so3821106uaq.1
 for <dri-devel@freedesktop.org>; Fri, 01 May 2020 07:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=URjoa0IPAuVJrJzf1GzsjjCJgtImSI4fVU++g+IJyuo=;
 b=SMxlHq5r/xlgb1aFLRF6VaIP1+SWFfbYQhAXjYZD4COiPW8KJ+YqJlOeUxHxCY5DlG
 Idx1WYR1HxdMRSDeEA2FIMDrtrlxs+zIzz57nuJsVPdb23kkRR6vDORPdekV6cr8T2ey
 XFPCDrZn+jfp9p8SrvmZa/jauPbMy65QXIIZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=URjoa0IPAuVJrJzf1GzsjjCJgtImSI4fVU++g+IJyuo=;
 b=LWt+V5aIhHHHUx7MwlvYI2NowRJxQOFWCV/KYC0hIZJxKsXm0jJpEgTMRuRFosTIyQ
 DXG/fCZBWzX+2PGMUss8RVzCrq71+vpDwzlURu6BtIec6sw3HSTuMC7OR5pUfgXeH2AX
 uWkNrbgHMXJYN1rsssxVmt/ctsc7KwWMFVYWHF5PiCj85S4rkNUR5PG4rZlRGNHdBms/
 GkxADzI3y0tXYIk3CiMCHjXBh4Mk9l9eyZlHaCC7oKYGxq0WvfWEUE8WA1zaO9/UXs7A
 twosbWshASbNHEzP1Hrbt2S4pS9MMN4lrpYQ2kZ/7H26uguiUQ1O/nqIiRbP+sedqcf+
 OBoQ==
X-Gm-Message-State: AGi0PuaF69OLk+ouz0ZrKbTs2rL9hEEf/3akCsZ1JLz6v78eTWnHyMGE
 tO6oUiYH0E2AAmmSmOt1dUzBi2blrvY=
X-Google-Smtp-Source: APiQypI8ciR5KeOVCLC+dBCXTFlWr7+LVYaVK7l0YB8XQHfAohzxvQxqJc0FRT+tD5dCnQtX8XCocA==
X-Received: by 2002:a9f:310e:: with SMTP id m14mr3077413uab.103.1588343963867; 
 Fri, 01 May 2020 07:39:23 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54])
 by smtp.gmail.com with ESMTPSA id s184sm801045vss.29.2020.05.01.07.39.23
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 May 2020 07:39:23 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id s11so6400684vsm.3
 for <dri-devel@freedesktop.org>; Fri, 01 May 2020 07:39:23 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr3484487vsq.109.1588343962687; 
 Fri, 01 May 2020 07:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 May 2020 07:39:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W+uaPTZHKXq6WYgx-ZDL1QTedEpNw9T747UBD_g1O8CQ@mail.gmail.com>
Message-ID: <CAD=FV=W+uaPTZHKXq6WYgx-ZDL1QTedEpNw9T747UBD_g1O8CQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
To: Sharat Masetty <smasetty@codeaurora.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 1, 2020 at 3:30 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch adds the required dt nodes and properties
> to enabled A618 GPU.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
> * Remove GCC_DDRSS_GPU_AXI_CLK clock reference from gpu smmu node.
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 102 +++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)

This is the newer version of the patch:

https://lore.kernel.org/r/1581320465-15854-2-git-send-email-smasetty@codeaurora.org

The change to remove the extra IOMMU clock matches our discussions and
there's no longer anything blocking this from landing.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
