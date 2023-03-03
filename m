Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9666A96D2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 12:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC92810E5B5;
	Fri,  3 Mar 2023 11:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8383610E5B5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 11:57:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E3734B816D9;
 Fri,  3 Mar 2023 11:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0371FC433D2;
 Fri,  3 Mar 2023 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677844637;
 bh=2Oz5PwF+1UGmgg2mfDe7VGnadXlhuUDsiuUacLQbwlg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GpkN8EZ3cwGZGF//9F7wi8vAoQudZqWs5k4iYi57eiHYRBE21tEwqGR3MHD1AErRm
 rMMCUwxKNDUGH8lRhKuhD1dU71y65lcNG3ZKD0+B+2q/QTmnBaD/h08p1hfZqFLsvZ
 DZZE0i0jUZxqjS6l4Xmv5pJCBcJQDbWUjMHKXvXewx1fTYIbZSfZ92kZLcJV6MaTzQ
 znbZMj3qB2/r3qfq9asbqMnUiKXUa8+p0y5iOkVCIvljyMZ0h8Rtnr77kmclO/BdjD
 9SzJvrpic7h7DW+Fa5FZnAhskpOjcq7LP80/jy9duW/zMITaIBJfJ03TkU/zW6PEIp
 TYmsWRJp/8qlg==
Date: Fri, 3 Mar 2023 11:57:11 +0000
From: Lee Jones <lee@kernel.org>
To: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH] backlight: qcom-wled: Add PMI8950 compatible
Message-ID: <20230303115711.GI2420672@google.com>
References: <20221226-msm8953-6-2-wled-v1-1-e318d4c71d05@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221226-msm8953-6-2-wled-v1-1-e318d4c71d05@z3ntu.xyz>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Feb 2023, Luca Weiss wrote:

> PMI8950 contains WLED of version 4. Add support for it to the driver.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> While adding dt-bindings and dts in a previous series I forgot to add the
> compatible to the driver. Fix that now.
> ---
>  drivers/video/backlight/qcom-wled.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks

-- 
Lee Jones [李琼斯]
