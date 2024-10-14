Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4AB99C1F6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 09:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C9010E3AD;
	Mon, 14 Oct 2024 07:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DMu+wSa+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F06B10E3AD
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 07:50:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 69C1D5C38CC;
 Mon, 14 Oct 2024 07:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460A9C4CEC3;
 Mon, 14 Oct 2024 07:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728892207;
 bh=68BtYOJ0iBMDXJQXHUmn2tYbU25QVRkH69nn/i8UgLI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DMu+wSa+XlrL6fQrA1Y+uhwPowC2xRJxNRn6ERfmMhH4bsuGHyo95ARsZn88sq3QQ
 PbbgmnJnLFSXlxiGv/oQSkH7zeCuB5e4cPZiV9SFqnnUruS1m5Lue0NDfrU+vbCZhW
 asvFDZGR3cdjevLmOtUoFrOSjwr2enjjD3SIzc1+CYrxGPrfPhUdrrHA46W8E2g85O
 peR1tDan4WsQvVkfLeSb9iOImOPVy/8jbnW/yuNY02pKhkpjsoSkzA6d6DNu9dMRx+
 dQkHEakxOoxzBT9DrHhxVfAwGOCnd39uiWaz+j/nDtQodE4p45dK1E939M3NWKutQi
 4cV0TcKa0BZjA==
Date: Mon, 14 Oct 2024 09:50:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@mainlining.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Samsung AMS581VF01
Message-ID: <pw7l2ilfioc5o5rmko5rxrfzbhdzm7rudnjg3s7lu47wxt73yq@cixu5oa2domh>
References: <20241013212402.15624-1-danila@jiaxyga.com>
 <20241013212402.15624-2-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241013212402.15624-2-danila@jiaxyga.com>
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

On Mon, Oct 14, 2024 at 12:24:01AM +0300, Danila Tikhonov wrote:
> The Samsung AMS581VF01 is a 5.81 inch 1080x2340 MIPI-DSI CMD mode
> OLED panel used in Google Pixel 4a (sm7150-google-sunfish)
> 
> Add a dt-binding for it.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  .../display/panel/samsung,ams581vf01.yaml     | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

