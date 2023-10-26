Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012877D7A7A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 03:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051EA10E6C9;
	Thu, 26 Oct 2023 01:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E81C10E6C9;
 Thu, 26 Oct 2023 01:50:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 852C6B833DC;
 Thu, 26 Oct 2023 01:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC20C433C8;
 Thu, 26 Oct 2023 01:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698285030;
 bh=ai96/RiTaKCJnWhue29McKV3xTzXFBhmH0+o2CsH4Io=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qVC63HLI7G9VZt/ONftTpoPf5QaFBoC0f8ud9OHi4c857yXk/aZ7c6nAIbbA6k+Nf
 WyYbj93LT14uWYrq/rnV8inw+lnPR02fzSN7j0DyNUjwgq5wmZkj3eSWQArG9v07sO
 kYXrvtVWfSslQjClVYtGR09R4v1hjMlqQz+RaX1v/srB78B+einke9R/X7F+tVyfsT
 sWJUN9vYWwIvfDDqFVXSOZAZa0gY8u8o4YEhPXNlaCOM+y3PZxqs95r04qa+Ry7pDD
 OKTaGM7uY/nlZAmhMgAUyazeutDQ9VoGg8WmucniDVh0DJi3BP+fXAAXitwiL8RE+9
 QeffXn+7Xrmvg==
Date: Wed, 25 Oct 2023 18:54:47 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 5/6] soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
Message-ID: <owpnaizakfjqyzcxcmdfoi3kdjopzsq2iwufzudi3lqi66psru@zhr3m5i4t3b6>
References: <20231025223027.943563-1-dmitry.baryshkov@linaro.org>
 <20231025223027.943563-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025223027.943563-6-dmitry.baryshkov@linaro.org>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 26, 2023 at 01:28:06AM +0300, Dmitry Baryshkov wrote:
> Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
> same functionality for the DRM bridge chain termination.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn
