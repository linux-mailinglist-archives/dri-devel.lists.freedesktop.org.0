Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302EA4F3630
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 15:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3724410E92B;
	Tue,  5 Apr 2022 13:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C161810E92B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 13:57:14 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id b18so11053642qtk.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ooVTJG6qHCp0yXAPzRm26+nzLP9pRyshNnyYCdC2/cI=;
 b=IjO1lAYG9dMjEoFuBKubL4solYQl93gBLvk38hPySmUXvALA+uoqB5JW6jq462kv3w
 XAv4VTxdhTe/Ar+F3ht8PctXXH1Z/CEFWL8rIGHVVnKhc8NrYKoeNDSb+gwniYzUwdqy
 cPCbAw7DBwC9H/iGurSWWopq5BX213OioWQjNpms7RtaNWffKommNV11P0techfv+VWq
 jmsl/Xrr/T99SAhsTZABhIAE2rf0H6z4BIeaC/xRBzZudWiZxfRd5sdUll3mUyKzmwBM
 mhubX3e2dDLaS2a/nEk3lBLHP4BdREc3DkUve465WChVkkGjPKvW4m2oQ5IIZOJ7aAL6
 m6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ooVTJG6qHCp0yXAPzRm26+nzLP9pRyshNnyYCdC2/cI=;
 b=thngvv9JPN47d+8hesfG0wDySp4vwHrA9MG90bVuqhxBQ+PEEylH+gC++Mly3Getba
 ASOBO/tQhRQ64Alhvc6HzeDonV7OW4Ieuhw8oszg6v3HZkjAJgut3Dm0p4R5nLWqQxlr
 mNqigkO+/WmG5RWErJqCOQt5WSWB6c2Uj8SvH7aXfqHOXVklxJ+qt/9fImpkgLhiJM8E
 C9xrPWgZnKmDP/N3f14JY94zFGYkRXHL4+m+x+fampTJ3MSPCy63RMluNXlAMT7HLDbz
 2m616gWTqaVWT8szHD8ZZfz0xBmGHyrIyeSMaEG+gBdT+isUcJnMBQsF95CgQbeKksf9
 OVWA==
X-Gm-Message-State: AOAM532j/ZG+2+xXDrxkfKJpWBDajVStvP+qETmdIfpU96Z1y+2iNSzA
 mjdUZBgDkcbMz0p/6RHow2lA1Hl9jlVQN6zus7zRew==
X-Google-Smtp-Source: ABdhPJyvUqZgngY2xTxFZn28xhxZyEZiZ6UDJJnFxcDrOQUW4IEe+56aagmVfjuPhPAcWrPVD5R+J8V5qHnj4OpopWI=
X-Received: by 2002:ac8:4e52:0:b0:2e1:dad8:5141 with SMTP id
 e18-20020ac84e52000000b002e1dad85141mr3050575qtw.62.1649167033885; Tue, 05
 Apr 2022 06:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220404163436.956875-1-vkoul@kernel.org>
 <20220404163436.956875-14-vkoul@kernel.org>
In-Reply-To: <20220404163436.956875-14-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Apr 2022 16:57:02 +0300
Message-ID: <CAA8EJprGaix=6q0X4HVb2-yFb1LoF9M7qJE3Vgr5oxZZFp6tFQ@mail.gmail.com>
Subject: Re: [PATCH v6 13/14] drm/msm: Update generated headers
To: Vinod Koul <vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 4 Apr 2022 at 19:35, Vinod Koul <vkoul@kernel.org> wrote:
>
> Update headers from mesa commit:
>
>   commit 28ae397be111c37c6ced397e12d453a7695701bd
>   Author: Vinod Koul <vkoul@kernel.org>
>   Date:   Fri Apr 1 16:53:04 2022 +0530
>
>       freedreno/registers: update dsi registers to support dsc
>
>       Display Stream compression (DSC) compresses the display stream in
>       host which is later decoded by panel. This requires addition of 3 new
>       DSI registers to support DSC over DSI.
>
>       Signed-off-by: Vinod Koul <vkoul@kernel.org>
>       Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14967>
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>  drivers/gpu/drm/msm/dsi/dsi.xml.h | 80 +++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index 4dee6f0bdda6..d1b2a17b0a66 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -704,5 +704,85 @@ static inline uint32_t DSI_VERSION_MAJOR(uint32_t val)
>
>  #define REG_DSI_CPHY_MODE_CTRL                                 0x000002d4
>
> +#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL                    0x0000029c
> +#define DSI_VIDEO_COMPRESSION_MODE_CTRL_WC__MASK               0xffff0000
> +#define DSI_VIDEO_COMPRESSION_MODE_CTRL_WC__SHIFT              16
> +static inline uint32_t DSI_VIDEO_COMPRESSION_MODE_CTRL_WC(uint32_t val)
> +{
> +       return ((val) << DSI_VIDEO_COMPRESSION_MODE_CTRL_WC__SHIFT) & DSI_VIDEO_COMPRESSION_MODE_CTRL_WC__MASK;
> +}
> +#define DSI_VIDEO_COMPRESSION_MODE_CTRL_DATATYPE__MASK         0x00003f00
> +#define DSI_VIDEO_COMPRESSION_MODE_CTRL_DATATYPE__SHIFT                8
> +static inline uint32_t DSI_VIDEO_COMPRESSION_MODE_CTRL_DATATYPE(uint32_t val)
> +{
> +       return ((val) << DSI_VIDEO_COMPRESSION_MODE_CTRL_DATATYPE__SHIFT) & DSI_VIDEO_COMPRESSION_MODE_CTRL_DATATYPE__MASK;
> +}
> +#define DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE__MASK     0x000000c0
> +#define DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE__SHIFT    6
> +static inline uint32_t DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(uint32_t val)
> +{
> +       return ((val) << DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE__SHIFT) & DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE__MASK;
> +}
> +#define DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM__MASK     0x00000030
> +#define DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM__SHIFT    4
> +static inline uint32_t DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(uint32_t val)
> +{
> +       return ((val) << DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM__SHIFT) & DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM__MASK;
> +}
> +#define DSI_VIDEO_COMPRESSION_MODE_CTRL_EN                     0x00000001
> +
> +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL                  0x000002a4
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_DATATYPE__MASK       0x3f000000
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_DATATYPE__SHIFT      24
> +static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_DATATYPE(uint32_t val)
> +{
> +       return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_DATATYPE__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_DATATYPE__MASK;
> +}
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_PKT_PER_LINE__MASK   0x00c00000
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_PKT_PER_LINE__SHIFT  22
> +static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_PKT_PER_LINE(uint32_t val)
> +{
> +       return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_PKT_PER_LINE__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_PKT_PER_LINE__MASK;
> +}
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_EOL_BYTE_NUM__MASK   0x00300000
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_EOL_BYTE_NUM__SHIFT  20
> +static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_EOL_BYTE_NUM(uint32_t val)
> +{
> +       return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_EOL_BYTE_NUM__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_EOL_BYTE_NUM__MASK;
> +}
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_EN           0x00010000
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK       0x00003f00
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT      8
> +static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(uint32_t val)
> +{
> +       return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK;
> +}
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_PKT_PER_LINE__MASK   0x000000c0
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_PKT_PER_LINE__SHIFT  6
> +static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_PKT_PER_LINE(uint32_t val)
> +{
> +       return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_PKT_PER_LINE__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_PKT_PER_LINE__MASK;
> +}
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_EOL_BYTE_NUM__MASK   0x00000030
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_EOL_BYTE_NUM__SHIFT  4
> +static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_EOL_BYTE_NUM(uint32_t val)
> +{
> +       return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_EOL_BYTE_NUM__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_EOL_BYTE_NUM__MASK;
> +}
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_EN           0x00000001
> +
> +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2                 0x000002a8
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM1_SLICE_WIDTH__MASK   0xffff0000
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM1_SLICE_WIDTH__SHIFT  16
> +static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM1_SLICE_WIDTH(uint32_t val)
> +{
> +       return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM1_SLICE_WIDTH__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM1_SLICE_WIDTH__MASK;
> +}
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK   0x0000ffff
> +#define DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__SHIFT  0
> +static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(uint32_t val)
> +{
> +       return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
> +}
>
>  #endif /* DSI_XML */
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
