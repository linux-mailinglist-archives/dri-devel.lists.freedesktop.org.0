Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609527AECFD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 14:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E1810E3C9;
	Tue, 26 Sep 2023 12:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id B721B10E3CB;
 Tue, 26 Sep 2023 12:38:59 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxNujf0BJlOLQsAA--.31868S3;
 Tue, 26 Sep 2023 20:38:55 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxXNzP0BJlI8ISAA--.38301S3; 
 Tue, 26 Sep 2023 20:38:52 +0800 (CST)
Message-ID: <c2f65b2d-67d5-3117-8e04-48a7b5c95855@loongson.cn>
Date: Tue, 26 Sep 2023 20:38:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/8] Add DSC fractional bpp support
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20230926082331.739705-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230926082331.739705-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8AxXNzP0BJlI8ISAA--.38301S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr1kWF13XF1DGw1kKr18tFc_yoW5XrWkpa
 y3Ga4Yqr4rXF42qa47AF1j9FW3Xws3Xa4rGrnxK345Z3WUA3Z8Kw1vkFy5GFWDuF13Z3Z7
 AasxWrW7KFsYyrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
 67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8cz
 VUUUUUU==
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
Cc: jani.nikula@intel.com, ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 swati2.sharma@intel.com, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


For coding style and wording part, this version looks fine for me after a brief skim.
Thanks for the patch. :-)


On 2023/9/26 16:23, Mitul Golani wrote:
> This patch series adds support for DSC fractional compressed bpp
> for MTL+. The series starts with some fixes, followed by patches that
> lay groundwork to iterate over valid compressed bpps to select the
> 'best' compressed bpp with optimal link configuration (taken from
> upstream series: https://patchwork.freedesktop.org/series/105200/).
>
> The later patches, add changes to accommodate compressed bpp with
> fractional part, including changes to QP calculations.
> To get the 'best' compressed bpp, we iterate over the valid compressed
> bpp values, but with fractional step size 1/16, 1/8, 1/4 or 1/2 as per
> sink support.
>
> The last 2 patches add support to depict DSC sink's fractional support,
> and debugfs to enforce use of fractional bpp, while choosing an
> appropriate compressed bpp.
>
> Ankit Nautiyal (5):
>    drm/display/dp: Add helper function to get DSC bpp precision
>    drm/i915/display: Store compressed bpp in U6.4 format
>    drm/i915/display: Consider fractional vdsc bpp while computing m_n
>      values
>    drm/i915/audio : Consider fractional vdsc bpp while computing tu_data
>    drm/i915/dp: Iterate over output bpp with fractional step size
>
> Swati Sharma (2):
>    drm/i915/dsc: Add debugfs entry to validate DSC fractional bpp
>    drm/i915/dsc: Allow DSC only with fractional bpp when forced from
>      debugfs
>
> Vandita Kulkarni (1):
>    drm/i915/dsc/mtl: Add support for fractional bpp
>
>   drivers/gpu/drm/display/drm_dp_helper.c       | 27 ++++++
>   drivers/gpu/drm/i915/display/icl_dsi.c        | 11 +--
>   drivers/gpu/drm/i915/display/intel_audio.c    | 17 ++--
>   drivers/gpu/drm/i915/display/intel_bios.c     |  6 +-
>   drivers/gpu/drm/i915/display/intel_cdclk.c    |  6 +-
>   drivers/gpu/drm/i915/display/intel_display.c  |  8 +-
>   drivers/gpu/drm/i915/display/intel_display.h  |  2 +-
>   .../drm/i915/display/intel_display_debugfs.c  | 84 +++++++++++++++++++
>   .../drm/i915/display/intel_display_types.h    |  4 +-
>   drivers/gpu/drm/i915/display/intel_dp.c       | 81 +++++++++++-------
>   drivers/gpu/drm/i915/display/intel_dp_mst.c   | 32 ++++---
>   drivers/gpu/drm/i915/display/intel_fdi.c      |  2 +-
>   .../i915/display/intel_fractional_helper.h    | 36 ++++++++
>   .../gpu/drm/i915/display/intel_qp_tables.c    |  3 -
>   drivers/gpu/drm/i915/display/intel_vdsc.c     | 30 +++++--
>   include/drm/display/drm_dp_helper.h           |  1 +
>   16 files changed, 276 insertions(+), 74 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_fractional_helper.h
>

