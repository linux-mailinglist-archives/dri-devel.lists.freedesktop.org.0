Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890034FE306
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 15:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC1310E6DD;
	Tue, 12 Apr 2022 13:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1075810E6DD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 13:47:22 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id t13so17294695pgn.8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 06:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u9XRnu9u/I8RtXs4+6xpsukBxaL8X5/qkoESwoAijl4=;
 b=Spvj2Jk8oAPHpJDpEKvtmr6ABUTt+GGUdft45u+jKlyIqGF3/f1w5ZtGArznmBAA2w
 cJZpH61B5IM+8BVc5yemE4sVh53M3nXDTd0ERKg/++KvBg9WknrO05G0HLa8EjUn7hwG
 hZ7/SiMm1k/lXH1L5Ty3oJUPGyzwmz4Brn8h55cV1v5SAa0vANfXFbpm9eu1uxtbKgI0
 XeNXvjqXyzlx/+oTtTjJwOZrOms2T0g2ALbXXoJhnE/VLFjdhZF+2WLfPAqi3T+KceEk
 oBihMYA7ZdxSlAzLbH5GY71srwPY+M5AkPnT8YqgYArfjf+VtHmvhPE9ct+dWn4LCi17
 z7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u9XRnu9u/I8RtXs4+6xpsukBxaL8X5/qkoESwoAijl4=;
 b=y/fsWNSdbrLNy5PqvRtwwU/Y6M+BPy9Zr7G/d9IiTPPp2f75nZ2hD7CjEP3W2OyW5x
 0Te+zGoZPCQk52PJyh4IwI69qzpLhH5qjYMoOeMQBJeLTsHukLPBa/fvKL5w/nB63O4g
 nE9dodVemfr0gcsv0J1owpB3xPYORfyAfGYJDNxQ0ycSAZp64sCSRunsRyebdXVW4N4R
 cUJa8vi7ddM68V/x75NkF5La/xqGU6+B8fR444jWOoa5+UnH7enhG8oFBPM4HBL4wprL
 ZEekNV1dAFdQU4TpTn6epWvA1zfhkPgj4PJhNRgT2p5rlLYlbSgDb1opf53A9xmEClRr
 fQBQ==
X-Gm-Message-State: AOAM531QD7bQd4aR78o2guiy6EYfteDX023/GS1epNsPfGHjrSLfjT7l
 XCqar46+LCy4ikytDt6BYC4TEvZdoOSCV1SMqVY=
X-Google-Smtp-Source: ABdhPJxxQpIDkcZFn2ZDvyyQEHSDOSoGfWRN2PR7s8KmRiWuwGnwmUlSAQ+nNPIfyGfCQqjU1HAWixv5h+XBSadGtwc=
X-Received: by 2002:a63:4f46:0:b0:382:56b2:f8 with SMTP id
 p6-20020a634f46000000b0038256b200f8mr30671104pgl.90.1649771241447; 
 Tue, 12 Apr 2022 06:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220412014207.1970320-1-james.hilliard1@gmail.com>
In-Reply-To: <20220412014207.1970320-1-james.hilliard1@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 12 Apr 2022 15:47:09 +0200
Message-ID: <CAMeQTsaWVSyA09e8iTannsaRQ0y88=bduUmJ6368vJSYFa46hA@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: add comments to register definitions
To: James Hilliard <james.hilliard1@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 3:42 AM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Extracted from various sources such EMGD releases.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Hi James,
These registers are documented in the Intel 965/G35 and G45
documentation [1]. I don't see a clear benefit of duplicating the
names of the registers here. Most other drivers don't do this either.
See i915, AMD, etc.

I prefer to keep the names in the documentation and then add specific
notes for those registers that differ from docs or need additional
clarification. The SGX and MSVDX registers are an exception since we
don't have docs for them. Any hints about bits for those are welcome
as long as we can confirm that they actually do what we think they do.

[1] https://01.org/linuxgraphics/documentation



> ---
>  drivers/gpu/drm/gma500/psb_intel_reg.h | 212 +++++++++++++------------
>  1 file changed, 107 insertions(+), 105 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_intel_reg.h b/drivers/gpu/drm/gma500/psb_intel_reg.h
> index ced7b433befb..a754bece30f5 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_reg.h
> +++ b/drivers/gpu/drm/gma500/psb_intel_reg.h
> @@ -31,7 +31,7 @@
>  # define GPIO_DATA_VAL_IN              (1 << 12)
>  # define GPIO_DATA_PULLUP_DISABLE      (1 << 13)
>
> -#define GMBUS0                 0x5100 /* clock/port select */
> +#define GMBUS0                 0x5100 /* clock/device select register */
>  #define   GMBUS_RATE_100KHZ    (0<<8)
>  #define   GMBUS_RATE_50KHZ     (1<<8)
>  #define   GMBUS_RATE_400KHZ    (2<<8) /* reserved on Pineview */
> @@ -46,7 +46,7 @@
>                                   /* 6 reserved */
>  #define   GMBUS_PORT_DPD       7 /* HDMID */
>  #define   GMBUS_NUM_PORTS       8
> -#define GMBUS1                 0x5104 /* command/status */
> +#define GMBUS1                 0x5104 /* command/status register */
>  #define   GMBUS_SW_CLR_INT     (1<<31)
>  #define   GMBUS_SW_RDY         (1<<30)
>  #define   GMBUS_ENT            (1<<29) /* enable timeout */
> @@ -59,7 +59,7 @@
>  #define   GMBUS_SLAVE_ADDR_SHIFT 1
>  #define   GMBUS_SLAVE_READ     (1<<0)
>  #define   GMBUS_SLAVE_WRITE    (0<<0)
> -#define GMBUS2                 0x5108 /* status */
> +#define GMBUS2                 0x5108 /* status register */
>  #define   GMBUS_INUSE          (1<<15)
>  #define   GMBUS_HW_WAIT_PHASE  (1<<14)
>  #define   GMBUS_STALL_TIMEOUT  (1<<13)
> @@ -67,18 +67,18 @@
>  #define   GMBUS_HW_RDY         (1<<11)
>  #define   GMBUS_SATOER         (1<<10)
>  #define   GMBUS_ACTIVE         (1<<9)
> -#define GMBUS3                 0x510c /* data buffer bytes 3-0 */
> -#define GMBUS4                 0x5110 /* interrupt mask (Pineview+) */
> +#define GMBUS3                 0x510c /* data buffer 3-0 register */
> +#define GMBUS4                 0x5110 /* REQUEST_INUSE register (Pineview+) */
>  #define   GMBUS_SLAVE_TIMEOUT_EN (1<<4)
>  #define   GMBUS_NAK_EN         (1<<3)
>  #define   GMBUS_IDLE_EN                (1<<2)
>  #define   GMBUS_HW_WAIT_EN     (1<<1)
>  #define   GMBUS_HW_RDY_EN      (1<<0)
> -#define GMBUS5                 0x5120 /* byte index */
> +#define GMBUS5                 0x5120 /* 2-byte index register */
>  #define   GMBUS_2BYTE_INDEX_EN (1<<31)
>
> -#define BLC_PWM_CTL            0x61254
> -#define BLC_PWM_CTL2           0x61250
> +#define BLC_PWM_CTL            0x61254 /* Backlight PWM Control */
> +#define BLC_PWM_CTL2           0x61250 /* Image BLM Histogram Control */
>  #define  PWM_ENABLE            (1 << 31)
>  #define  PWM_LEGACY_MODE       (1 << 30)
>  #define  PWM_PIPE_B            (1 << 29)
> @@ -117,37 +117,38 @@
>  #define I855_CLOCK_166_250             (3 << 0)
>
>  /* I830 CRTC registers */
> -#define HTOTAL_A               0x60000
> -#define HBLANK_A               0x60004
> -#define HSYNC_A                        0x60008
> -#define VTOTAL_A               0x6000c
> -#define VBLANK_A               0x60010
> -#define VSYNC_A                        0x60014
> -#define PIPEASRC               0x6001c
> -#define BCLRPAT_A              0x60020
> +#define HTOTAL_A               0x60000 /* Pipe A Horizontal Total Register */
> +#define HBLANK_A               0x60004 /* Pipe A Horizontal Blank Register */
> +#define HSYNC_A                        0x60008 /* Pipe A Horizontal Sync Register */
> +#define VTOTAL_A               0x6000c /* Pipe A Vertical Total Register */
> +#define VBLANK_A               0x60010 /* Pipe A Vertical Blank Register */
> +#define VSYNC_A                        0x60014 /* Pipe A Vertical Sync Register */
> +#define PIPEASRC               0x6001c /* Pipe A Source Image Size Register */
> +#define BCLRPAT_A              0x60020 /* Pipe A Border Color Pattern Register */
>  #define VSYNCSHIFT_A           0x60028
>
> -#define HTOTAL_B               0x61000
> -#define HBLANK_B               0x61004
> -#define HSYNC_B                        0x61008
> -#define VTOTAL_B               0x6100c
> -#define VBLANK_B               0x61010
> -#define VSYNC_B                        0x61014
> -#define PIPEBSRC               0x6101c
> -#define BCLRPAT_B              0x61020
> +#define HTOTAL_B               0x61000 /* Pipe B Horizontal Total Register */
> +#define HBLANK_B               0x61004 /* Pipe B Horizontal Blank Register */
> +#define HSYNC_B                        0x61008 /* Pipe B Horizontal Sync Register */
> +#define VTOTAL_B               0x6100c /* Pipe B Vertical Total Register */
> +#define VBLANK_B               0x61010 /* Pipe B Vertical Blank Register */
> +#define VSYNC_B                        0x61014 /* Pipe B Vertical Sync Register */
> +#define PIPEBSRC               0x6101c /* Pipe B Source Image Size Register */
> +#define BCLRPAT_B              0x61020 /* Pipe B Border Color Pattern Register */
>  #define VSYNCSHIFT_B           0x61028
>
> -#define HTOTAL_C               0x62000
> -#define HBLANK_C               0x62004
> -#define HSYNC_C                        0x62008
> -#define VTOTAL_C               0x6200c
> -#define VBLANK_C               0x62010
> -#define VSYNC_C                        0x62014
> -#define PIPECSRC               0x6201c
> -#define BCLRPAT_C              0x62020
> +#define HTOTAL_C               0x62000 /* Pipe C Horizontal Total Register */
> +#define HBLANK_C               0x62004 /* Pipe C Horizontal Blank Register */
> +#define HSYNC_C                        0x62008 /* Pipe C Horizontal Sync Register */
> +#define VTOTAL_C               0x6200c /* Pipe C Vertical Total Register */
> +#define VBLANK_C               0x62010 /* Pipe C Vertical Blank Register */
> +#define VSYNC_C                        0x62014 /* Pipe C Vertical Sync Register */
> +#define PIPECSRC               0x6201c /* Pipe C Source Image Size Register */
> +#define BCLRPAT_C              0x62020 /* Pipe C Border Color Pattern Register */
>  #define VSYNCSHIFT_C           0x62028
>
> -#define PP_STATUS              0x61200
> +/* Panel power sequencing */
> +#define PP_STATUS              0x61200 /* LVDS Panel Power Status Register */
>  # define PP_ON                         (1 << 31)
>  /*
>   * Indicates that all dependencies of the panel are on:
> @@ -165,7 +166,7 @@
>  #define        PP_SEQUENCE_STATE_ON_IDLE       (1 << 3)
>  #define        PP_SEQUENCE_STATE_MASK          0x0000000f
>
> -#define PP_CONTROL             0x61204
> +#define PP_CONTROL             0x61204 /* LVDS Panel Power Control Register */
>  #define POWER_TARGET_ON                        (1 << 0)
>  #define        PANEL_UNLOCK_REGS               (0xabcd << 16)
>  #define        PANEL_UNLOCK_MASK               (0xffff << 16)
> @@ -176,9 +177,9 @@
>  #define        PANEL_POWER_ON                  (1 << 0)
>
>  /* Poulsbo/Oaktrail */
> -#define LVDSPP_ON              0x61208
> +#define LVDSPP_ON              0x61208 /* Panel Power On Sequencing Delays */
>  #define LVDSPP_OFF             0x6120c
> -#define PP_CYCLE               0x61210
> +#define PP_CYCLE               0x61210 /* Panel Power Cycle Delay and Reference */
>
>  /* Cedartrail */
>  #define PP_ON_DELAYS           0x61208         /* Cedartrail */
> @@ -202,7 +203,8 @@
>  #define  PANEL_POWER_CYCLE_DELAY_MASK  (0x1f)
>  #define  PANEL_POWER_CYCLE_DELAY_SHIFT 0
>
> -#define PFIT_CONTROL           0x61230
> +/* Panel fitting */
> +#define PFIT_CONTROL           0x61230 /* Panel Fitting Control */
>  #define PFIT_ENABLE                    (1 << 31)
>  #define PFIT_PIPE_MASK                 (3 << 29)
>  #define PFIT_PIPE_SHIFT                        29
> @@ -218,14 +220,14 @@
>  #define HORIZ_AUTO_SCALE               (1 << 5)
>  #define PANEL_8TO6_DITHER_ENABLE       (1 << 3)
>
> -#define PFIT_PGM_RATIOS                0x61234
> +#define PFIT_PGM_RATIOS                0x61234 /* Programmed Panel Fitting Ratios */
>  #define PFIT_VERT_SCALE_MASK                   0xfff00000
>  #define PFIT_HORIZ_SCALE_MASK                  0x0000fff0
>
>  #define PFIT_AUTO_RATIOS       0x61238
>
> -#define DPLL_A                 0x06014
> -#define DPLL_B                 0x06018
> +#define DPLL_A                 0x06014 /* Display PLL A Control */
> +#define DPLL_B                 0x06018 /* Display PLL B Control */
>  #define DPLL_VCO_ENABLE                        (1 << 31)
>  #define DPLL_DVO_HIGH_SPEED            (1 << 30)
>  #define DPLL_SYNCLOCK_ENABLE           (1 << 29)
> @@ -336,7 +338,7 @@
>  #define DPLLA_TEST_M_BYPASS            (1 << 2)
>  #define DPLLA_INPUT_BUFFER_ENABLE      (1 << 0)
>
> -#define ADPA                   0x61100
> +#define ADPA                   0x61100 /* Analog Display Port A Control */
>  #define ADPA_DAC_ENABLE                        (1 << 31)
>  #define ADPA_DAC_DISABLE               0
>  #define ADPA_PIPE_SELECT_MASK          (1 << 30)
> @@ -353,10 +355,10 @@
>  #define ADPA_HSYNC_ACTIVE_HIGH         (1 << 3)
>  #define ADPA_HSYNC_ACTIVE_LOW          0
>
> -#define FPA0                   0x06040
> -#define FPA1                   0x06044
> -#define FPB0                   0x06048
> -#define FPB1                   0x0604c
> +#define FPA0                   0x06040 /* DPLL A Divisor 0 */
> +#define FPA1                   0x06044 /* DPLL A Divisor 1 */
> +#define FPB0                   0x06048 /* DPLL B Divisor 0 */
> +#define FPB1                   0x0604c /* DPLL B Divisor 1 */
>  #define FP_N_DIV_MASK                  0x003f0000
>  #define FP_N_DIV_SHIFT                 16
>  #define FP_M1_DIV_MASK                 0x00003f00
> @@ -476,7 +478,7 @@
>  #define LVDS_B0B3_POWER_DOWN           (0 << 2)
>  #define LVDS_B0B3_POWER_UP             (3 << 2)
>
> -#define PIPEACONF              0x70008
> +#define PIPEACONF              0x70008 /* Pipe A Pixel Pipeline Config Reg */
>  #define PIPEACONF_ENABLE               (1 << 31)
>  #define PIPEACONF_DISABLE              0
>  #define PIPEACONF_DOUBLE_WIDE          (1 << 30)
> @@ -495,7 +497,7 @@
>  #define PIPECONF_PLANE_OFF             (1 << 19)
>  #define PIPECONF_CURSOR_OFF            (1 << 18)
>
> -#define PIPEBCONF              0x71008
> +#define PIPEBCONF              0x71008 /* Pipe B Pixel Pipeline Config Reg */
>  #define PIPEBCONF_ENABLE               (1 << 31)
>  #define PIPEBCONF_DISABLE              0
>  #define PIPEBCONF_DOUBLE_WIDE          (1 << 30)
> @@ -503,15 +505,15 @@
>  #define PIPEBCONF_GAMMA                        (1 << 24)
>  #define PIPEBCONF_PALETTE              0
>
> -#define PIPECCONF              0x72008
> +#define PIPECCONF              0x72008 /* Pipe C Pixel Pipeline Config Reg */
>
> -#define PIPEBGCMAXRED          0x71010
> -#define PIPEBGCMAXGREEN                0x71014
> -#define PIPEBGCMAXBLUE         0x71018
> +#define PIPEBGCMAXRED          0x71010 /* Pipe B Gamma Correct. Max Red */
> +#define PIPEBGCMAXGREEN                0x71014 /* Pipe B Gamma Correct. Max Green */
> +#define PIPEBGCMAXBLUE         0x71018 /* Pipe B Gamma Correct. Max Blue */
>
> -#define PIPEASTAT              0x70024
> -#define PIPEBSTAT              0x71024
> -#define PIPECSTAT              0x72024
> +#define PIPEASTAT              0x70024 /* Pipe A Display Status */
> +#define PIPEBSTAT              0x71024 /* Pipe B Display Status */
> +#define PIPECSTAT              0x72024 /* Pipe C Display Status */
>  #define PIPE_VBLANK_INTERRUPT_STATUS           (1UL << 1)
>  #define PIPE_START_VBLANK_INTERRUPT_STATUS     (1UL << 2)
>  #define PIPE_VBLANK_CLEAR                      (1 << 1)
> @@ -537,8 +539,8 @@
>  #define PIPE_VBLANK_MASK ((1 << 25)|(1 << 24)|(1 << 18)|(1 << 17))
>  #define HISTOGRAM_INT_CONTROL          0x61268
>  #define HISTOGRAM_BIN_DATA             0X61264
> -#define HISTOGRAM_LOGIC_CONTROL                0x61260
> -#define PWM_CONTROL_LOGIC              0x61250
> +#define HISTOGRAM_LOGIC_CONTROL                0x61260 /* Image BLM Histogram Control */
> +#define PWM_CONTROL_LOGIC              0x61250 /* Backlight PWM Control 2 */
>  #define PIPE_HOTPLUG_INTERRUPT_STATUS          (1UL << 10)
>  #define HISTOGRAM_INTERRUPT_ENABLE             (1UL << 31)
>  #define HISTOGRAM_LOGIC_ENABLE                 (1UL << 31)
> @@ -550,12 +552,12 @@
>  #define HISTOGRAM_INT_CTRL_CLEAR               (1UL << 30)
>  #define DPST_YUV_LUMA_MODE                     0
>
> -#define PIPEAFRAMEHIGH         0x70040
> -#define PIPEAFRAMEPIXEL                0x70044
> -#define PIPEBFRAMEHIGH         0x71040
> -#define PIPEBFRAMEPIXEL                0x71044
> -#define PIPECFRAMEHIGH         0x72040
> -#define PIPECFRAMEPIXEL                0x72044
> +#define PIPEAFRAMEHIGH         0x70040 /* Pipe A Frame Count High */
> +#define PIPEAFRAMEPIXEL                0x70044 /* Pipe A Frame Cnt Low and pixel cnt */
> +#define PIPEBFRAMEHIGH         0x71040 /* Pipe B Frame Count High */
> +#define PIPEBFRAMEPIXEL                0x71044 /* Pipe B Frame Cnt Low and pixel cnt */
> +#define PIPECFRAMEHIGH         0x72040 /* Pipe C Frame Count High */
> +#define PIPECFRAMEPIXEL                0x72044 /* Pipe C Frame Cnt Low and pixel cnt */
>  #define PIPE_FRAME_HIGH_MASK   0x0000ffff
>  #define PIPE_FRAME_HIGH_SHIFT  0
>  #define PIPE_FRAME_LOW_MASK    0xff000000
> @@ -566,7 +568,7 @@
>  #define FW_BLC_SELF            0x20e0
>  #define FW_BLC_SELF_EN          (1<<15)
>
> -#define DSPARB                 0x70030
> +#define DSPARB                 0x70030 /* Display Arbitration Control */
>  #define DSPFW1                 0x70034
>  #define DSP_FIFO_SR_WM_MASK            0xFF800000
>  #define DSP_FIFO_SR_WM_SHIFT           23
> @@ -585,10 +587,10 @@
>  #define CURSOR_B_FIFO_WM1_SHIFT                8
>  #define CURSOR_FIFO_SR_WM1_SHIFT       0
>  #define DSPFW6                 0x70058
> -#define DSPCHICKENBIT          0x70400
> -#define DSPACNTR               0x70180
> -#define DSPBCNTR               0x71180
> -#define DSPCCNTR               0x72180
> +#define DSPCHICKENBIT          0x70400 /* Chicken Bit */
> +#define DSPACNTR               0x70180 /* Display Plane A */
> +#define DSPBCNTR               0x71180 /* Display Plane B */
> +#define DSPCCNTR               0x72180 /* Display Plane C */
>  #define DISPLAY_PLANE_ENABLE                   (1 << 31)
>  #define DISPLAY_PLANE_DISABLE                  0
>  #define DISPPLANE_GAMMA_ENABLE                 (1 << 30)
> @@ -618,42 +620,42 @@
>  #define DISPPLANE_SPRITE_ABOVE_OVERLAY         (1)
>  #define DISPPLANE_BOTTOM                       (4)
>
> -#define DSPABASE               0x70184
> +#define DSPABASE               0x70184 /* Display A Start Address */
>  #define DSPALINOFF             0x70184
> -#define DSPASTRIDE             0x70188
> +#define DSPASTRIDE             0x70188 /* Display A Stride */
>
> -#define DSPBBASE               0x71184
> +#define DSPBBASE               0x71184 /* Display B Start Address */
>  #define DSPBLINOFF             0X71184
>  #define DSPBADDR               DSPBBASE
> -#define DSPBSTRIDE             0x71188
> +#define DSPBSTRIDE             0x71188 /* Display B Stride */
>
> -#define DSPCBASE               0x72184
> +#define DSPCBASE               0x72184 /* Display C Start Address */
>  #define DSPCLINOFF             0x72184
> -#define DSPCSTRIDE             0x72188
> +#define DSPCSTRIDE             0x72188 /* Display C Stride */
>
> -#define DSPAKEYVAL             0x70194
> -#define DSPAKEYMASK            0x70198
> +#define DSPAKEYVAL             0x70194 /* Sprite color key value */
> +#define DSPAKEYMASK            0x70198 /* Sprite color key mask */
>
> -#define DSPAPOS                        0x7018C /* reserved */
> -#define DSPASIZE               0x70190
> -#define DSPBPOS                        0x7118C
> -#define DSPBSIZE               0x71190
> -#define DSPCPOS                        0x7218C
> -#define DSPCSIZE               0x72190
> +#define DSPAPOS                        0x7018C /* Display A Position */
> +#define DSPASIZE               0x70190 /* Display A Size */
> +#define DSPBPOS                        0x7118C /* Display B Position */
> +#define DSPBSIZE               0x71190 /* Display B Size */
> +#define DSPCPOS                        0x7218C /* Display C Position */
> +#define DSPCSIZE               0x72190 /* Display C Size */
>
> -#define DSPASURF               0x7019C
> -#define DSPATILEOFF            0x701A4
> +#define DSPASURF               0x7019C /* Display A Suface base address */
> +#define DSPATILEOFF            0x701A4 /* Display A Tiled Offset */
>
> -#define DSPBSURF               0x7119C
> -#define DSPBTILEOFF            0x711A4
> +#define DSPBSURF               0x7119C /* Display B Suface base address */
> +#define DSPBTILEOFF            0x711A4 /* Display B Tiled Offset */
>
> -#define DSPCSURF               0x7219C
> -#define DSPCTILEOFF            0x721A4
> -#define DSPCKEYMAXVAL          0x721A0
> -#define DSPCKEYMINVAL          0x72194
> -#define DSPCKEYMSK             0x72198
> +#define DSPCSURF               0x7219C /* Display C Suface base address */
> +#define DSPCTILEOFF            0x721A4 /* Display C Tiled Offset */
> +#define DSPCKEYMAXVAL          0x721A0 /* Display C Sprint color key Max */
> +#define DSPCKEYMINVAL          0x72194 /* Sprite color key Min */
> +#define DSPCKEYMSK             0x72198 /* Sprite color key mask */
>
> -#define VGACNTRL               0x71400
> +#define VGACNTRL               0x71400 /* VGA Display Plane Control Register */
>  #define VGA_DISP_DISABLE               (1 << 31)
>  #define VGA_2X_MODE                    (1 << 30)
>  #define VGA_PIPE_B_SELECT              (1 << 29)
> @@ -662,7 +664,7 @@
>   * Overlay registers
>   */
>  #define OV_C_OFFSET            0x08000
> -#define OV_OVADD               0x30000
> +#define OV_OVADD               0x30000 /* Overlay Control */
>  #define OV_DOVASTA             0x30008
>  # define OV_PIPE_SELECT                        ((1 << 6)|(1 << 7))
>  # define OV_PIPE_SELECT_POS            6
> @@ -687,7 +689,7 @@
>   * Some BIOS scratch area registers.  The 845 (and 830?) store the amount
>   * of video memory available to the BIOS in SWF1.
>   */
> -#define SWF0                   0x71410
> +#define SWF0                   0x71410 /* Software flags B Base Addr */
>  #define SWF1                   0x71414
>  #define SWF2                   0x71418
>  #define SWF3                   0x7141c
> @@ -698,7 +700,7 @@
>  /*
>   * 855 scratch registers.
>   */
> -#define SWF00                  0x70410
> +#define SWF00                  0x70410 /* Software flags A Base Addr */
>  #define SWF01                  0x70414
>  #define SWF02                  0x70418
>  #define SWF03                  0x7041c
> @@ -748,18 +750,18 @@
>  /*
>   * Interrupt Registers
>   */
> -#define IER                    0x020a0
> -#define IIR                    0x020a4
> -#define IMR                    0x020a8
> -#define ISR                    0x020ac
> +#define IER                    0x020a0 /* Interrupt Enable */
> +#define IIR                    0x020a4 /* Interrupt Identity */
> +#define IMR                    0x020a8 /* Interrupt Mask */
> +#define ISR                    0x020ac /* Interrupt Status */
>
>  /*
>   * MOORESTOWN delta registers
>   */
> -#define MRST_DPLL_A            0x0f014
> +#define MRST_DPLL_A            0x0f014 /* Display PLL A Control */
>  #define DPLLA_MODE_LVDS                        (2 << 26)       /* mrst */
> -#define MRST_FPA0              0x0f040
> -#define MRST_FPA1              0x0f044
> +#define MRST_FPA0              0x0f040 /* DPLL A Divisor 0 */
> +#define MRST_FPA1              0x0f044 /* DPLL A Divisor 1 */
>  #define MRST_PERF_MODE         0x020f4
>
>  /*
> @@ -806,8 +808,8 @@
>  #define PIPEACONF_PIPE_STATE           (1 << 30)
>  /* #define DSPACNTR            0x70180 */
>
> -#define MRST_DSPABASE          0x7019c
> -#define MRST_DSPBBASE          0x7119c
> +#define MRST_DSPABASE          0x7019c /* Display A Suface base address */
> +#define MRST_DSPBBASE          0x7119c /* Display B Suface base address */
>
>  /*
>   * Moorestown registers.
> @@ -1396,14 +1398,14 @@ No status bits are changed.
>   * is 20 bytes in each direction, hence the 5 fixed
>   * data registers
>   */
> -#define DPB_AUX_CH_CTL                 0x64110
> +#define DPB_AUX_CH_CTL                 0x64110 /* Display Port B AUX Channel Control */
>  #define DPB_AUX_CH_DATA1               0x64114
>  #define DPB_AUX_CH_DATA2               0x64118
>  #define DPB_AUX_CH_DATA3               0x6411c
>  #define DPB_AUX_CH_DATA4               0x64120
>  #define DPB_AUX_CH_DATA5               0x64124
>
> -#define DPC_AUX_CH_CTL                 0x64210
> +#define DPC_AUX_CH_CTL                 0x64210 /* Display Port C AUX Channel Control */
>  #define DPC_AUX_CH_DATA1               0x64214
>  #define DPC_AUX_CH_DATA2               0x64218
>  #define DPC_AUX_CH_DATA3               0x6421c
> --
> 2.25.1
>
