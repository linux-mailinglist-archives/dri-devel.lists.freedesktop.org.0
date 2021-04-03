Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA869353405
	for <lists+dri-devel@lfdr.de>; Sat,  3 Apr 2021 14:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87C56E14C;
	Sat,  3 Apr 2021 12:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3CA6E14C;
 Sat,  3 Apr 2021 12:32:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3A9461248;
 Sat,  3 Apr 2021 12:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617453162;
 bh=+k9MTodMeEgKogh28jfbdqocaD8da3H88l4U1z6UVL4=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=LJvwqlNSyh/y4NnsS3g6zqfj4MCQ8dKl27gP+vwqyLrP9kaVKCqN78mQ7IpgqblLm
 F7FkzK2L1SNDc7ARzWKz7dUd6A65/FCJOtIlXJ7HZeXC9Au7EotWKAxlbPEf2dh3nx
 b3N+bmpnYL/pSseRmERfZde4Hzk8ZE5drDIzVTFMZaMZhv42isOw4q9r3SOfTKTUKn
 8tvMZ6Fg6MdP/hZ5O8yn052RVk19HJssCWqdARseRDODZiykbNrveQePoQ6I0a5PHX
 bIVofga2otPKTb9HFWpO/gHccV8DvPOWfB7LApZ3qXmMboYC93ENMS3lTJGuRWu4R6
 ICb7MIRATXDKg==
Received: by mail-il1-f171.google.com with SMTP id u2so6625614ilk.1;
 Sat, 03 Apr 2021 05:32:42 -0700 (PDT)
X-Gm-Message-State: AOAM531Zask20RkQDM37t0ARRMQC6LutP3EQK53spLHxScNvtxRSE4mM
 YlyU+PXKhnDeM4n0ny1JUGOFbJS1LXFPnFgMuYI=
X-Google-Smtp-Source: ABdhPJwFiMurmXTYUpCztx9/USRE76mk6X912InkXuO6l9LsT7LbYyNicKgRu63mgoMXfJRKUxNqLGz9CU4Kg/Hkr9E=
X-Received: by 2002:a05:6e02:154c:: with SMTP id
 j12mr13558296ilu.206.1617453162129; 
 Sat, 03 Apr 2021 05:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <63f0c675-d04b-1961-53cd-e621b48dab94@linaro.org>
In-Reply-To: <63f0c675-d04b-1961-53cd-e621b48dab94@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sat, 3 Apr 2021 08:32:31 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6Q_kRu7K++6=+T+ZeR9VJNNgBGvPehF2dqM9YyF+pX=g@mail.gmail.com>
Message-ID: <CA+5PVA6Q_kRu7K++6=+T+ZeR9VJNNgBGvPehF2dqM9YyF+pX=g@mail.gmail.com>
Subject: Re: Update firmware for Qualcomm SM8250 platform
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux Firmware <linux-firmware@kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pulled and pushed out.

josh

On Thu, Apr 1, 2021 at 4:11 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hello linux-firmware maintainers,
>
> Could you please pull updated firmware for Qualcomm SM8250-based
> platforms. Firmware successfully tested on Qualcomm Robotics RB5 platform.
>
>
> The following changes since commit 3f026a2f13a8f130cde849168a111ec80f12e27b:
>
>    rtl_bt: Update RTL8822C BT(UART I/F) FW to 0x59A_76A3 (2021-03-22
> 10:17:18 -0400)
>
> are available in the Git repository at:
>
>    https://github.com/lumag/linux-firmware sm8250-new-fw
>
> for you to fetch changes up to d8fa0cfb4a285d11fd7102efd1763f1be90fac99:
>
>    qcom: sm8250: update remoteproc firmware (2021-04-01 23:05:00 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (2):
>        qcom: update a650 firmware files
>        qcom: sm8250: update remoteproc firmware
>
>   WHENCE                   |   2 +-
>   qcom/a650_sqe.fw         | Bin 31488 -> 31804 bytes
>   qcom/sm8250/a650_zap.mbn | Bin 13964 -> 13964 bytes
>   qcom/sm8250/adsp.mbn     | Bin 15515796 -> 15515796 bytes
>   qcom/sm8250/cdsp.mbn     | Bin 5822228 -> 5822228 bytes
>   5 files changed, 1 insertion(+), 1 deletion(-)
>
>
>
> --
> With best wishes
> Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
