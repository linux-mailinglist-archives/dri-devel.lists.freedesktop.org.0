Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D06B88D51C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 04:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC8F10F779;
	Wed, 27 Mar 2024 03:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 423 seconds by postgrey-1.36 at gabe;
 Wed, 27 Mar 2024 03:41:02 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3976B10F779;
 Wed, 27 Mar 2024 03:41:01 +0000 (UTC)
X-QQ-mid: bizesmtp73t1711510263tc4rg3gd
X-QQ-Originating-IP: XfrywTBYuK7/zCAjs1kVXhU1XAcSKnA8JwB99fELdNQ=
Received: from john-PC ( [123.114.60.34]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 27 Mar 2024 11:31:01 +0800 (CST)
X-QQ-SSF: 01400000000000E0L000000A0000000
X-QQ-FEAT: JP/5YZ9VfwkIlLs5w7zd65s3OqQmT/KSBo6slcMJGn9hc6x7d7O2CUgdrxtee
 LlmFsByIBU4ZpnmnNQa5+QTJmjyPUrvVKBNT+svF1igV9fAWfLevHhgTp8ocxsB6uUXo6zH
 k57Vpl8FNiKFQ2AcpwoiItm7ySJL0UbfKQ4Z3t2ok1csAUqsJmcUfbg/V2GKWtkPzS8+s7o
 N61IOFRX907nl95TjveVVQsTccj6yS3FwxsZiJSaBMu7pLEjPZ3Gd2RZk9bDIDD70eYvirk
 ZXPZwbwtVik+jTPqPvzxyn+XB4YM2rjdYk1XmHbdk8OwtvcXJTl1xB7X5lCutJPIRYHbvqg
 aCLhqgva7J4W+HQyWnll69iqn0P47pRWJeP+BKGELDcpgII22ecSRgyC6tKmQt5QJCOxZMi
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5425072357296016359
Date: Wed, 27 Mar 2024 11:31:00 +0800
From: Qiang Ma <maqianga@uniontech.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "SHANMUGAM, SRINIVASAN"
 <SRINIVASAN.SHANMUGAM@amd.com>, "sunran001@208suo.com"
 <sunran001@208suo.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/amdgpu: Clear the hotplug interrupt ack bit
 before hpd initialization
Message-ID: <933F2B53EE8DA7B7+20240327113100.6742ccd5@john-PC>
In-Reply-To: <BL1PR12MB5144F6A9CAB0504C8AD5728CF7292@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20240131075703.24600-1-maqianga@uniontech.com>
 <A65A2F93D9F165EC+20240313141827.40f30bd5@john-PC>
 <BL1PR12MB5144F6A9CAB0504C8AD5728CF7292@BL1PR12MB5144.namprd12.prod.outlook.com>
Organization: UOS
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4a-0
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

On Thu, 14 Mar 2024 14:40:40 +0000
"Deucher, Alexander" <Alexander.Deucher@amd.com> wrote:

> [Public]
> 
> > -----Original Message-----
> > From: Qiang Ma <maqianga@uniontech.com>
> > Sent: Wednesday, March 13, 2024 2:18 AM
> > To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig,
> > Christian <Christian.Koenig@amd.com>; Pan, Xinhui
> > <Xinhui.Pan@amd.com>; airlied@gmail.com; daniel@ffwll.ch;
> > SHANMUGAM, SRINIVASAN <SRINIVASAN.SHANMUGAM@amd.com>;
> > sunran001@208suo.com Cc: amd-gfx@lists.freedesktop.org;
> > dri-devel@lists.freedesktop.org; linux- kernel@vger.kernel.org
> > Subject: Re: [PATCH v2] drm/amdgpu: Clear the hotplug interrupt ack
> > bit before hpd initialization
> >
> > On Wed, 31 Jan 2024 15:57:03 +0800
> > Qiang Ma <maqianga@uniontech.com> wrote:
> >
> > Hello everyone, please help review this patch.  
> 
> This was applied back in January, sorry if I forget to reply.
> 
> Alex

Hi, Alex, it doesn't matter, please take some time to help review this
patch.

This patch mainly solves the problem that after unplugging the HDMI
display during bios initialization, the display does not light up after
the system starts.

Qiang Ma
> 
> >
> >   Qiang Ma
> >  
> > > Problem:
> > > The computer in the bios initialization process, unplug the HDMI
> > > display, wait until the system up, plug in the HDMI display, did
> > > not enter the hotplug interrupt function, the display is not
> > > bright.
> > >
> > > Fix:
> > > After the above problem occurs, and the hpd ack interrupt bit is
> > > 1, the interrupt should be cleared during hpd_init initialization
> > > so that when the driver is ready, it can respond to the hpd
> > > interrupt normally.
> > >
> > > Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> > > ---
> > > v2:
> > >  - Remove unused variable 'tmp'
> > >  - Fixed function spelling errors
> > >
> > > drivers/gpu/drm/amd/amdgpu/dce_v10_0.c |  2 ++
> > > drivers/gpu/drm/amd/amdgpu/dce_v11_0.c |  2 ++
> > > drivers/gpu/drm/amd/amdgpu/dce_v6_0.c  | 22
> > > ++++++++++++++++++---  
> > -  
> > > drivers/gpu/drm/amd/amdgpu/dce_v8_0.c  | 22
> > > ++++++++++++++++++---  
> > -  
> > >  4 files changed, 40 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> > > b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c index
> > > bb666cb7522e..12a8ba929a72 100644 ---
> > > a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c +++
> > > b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c @@ -51,6 +51,7 @@
> > >
> > >  static void dce_v10_0_set_display_funcs(struct amdgpu_device
> > > *adev); static void dce_v10_0_set_irq_funcs(struct amdgpu_device
> > > *adev); +static void dce_v10_0_hpd_int_ack(struct amdgpu_device
> > > *adev, int hpd);
> > >  static const u32 crtc_offsets[] = {
> > >     CRTC0_REGISTER_OFFSET,
> > > @@ -363,6 +364,7 @@ static void dce_v10_0_hpd_init(struct
> > > amdgpu_device *adev) AMDGPU_HPD_DISCONNECT_INT_DELAY_IN_MS);
> > >             WREG32(mmDC_HPD_TOGGLE_FILT_CNTL +
> > > hpd_offsets[amdgpu_connector->hpd.hpd], tmp);
> > > +           dce_v10_0_hpd_int_ack(adev,
> > > amdgpu_connector->hpd.hpd); dce_v10_0_hpd_set_polarity(adev,
> > > amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
> > >                            amdgpu_connector->hpd.hpd); diff --git
> > > a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> > > b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c index
> > > 7af277f61cca..745e4fdffade 100644 ---
> > > a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c +++
> > > b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c @@ -51,6 +51,7 @@
> > >
> > >  static void dce_v11_0_set_display_funcs(struct amdgpu_device
> > > *adev); static void dce_v11_0_set_irq_funcs(struct amdgpu_device
> > > *adev); +static void dce_v11_0_hpd_int_ack(struct amdgpu_device
> > > *adev, int hpd);
> > >  static const u32 crtc_offsets[] =
> > >  {
> > > @@ -387,6 +388,7 @@ static void dce_v11_0_hpd_init(struct
> > > amdgpu_device *adev) AMDGPU_HPD_DISCONNECT_INT_DELAY_IN_MS);
> > >             WREG32(mmDC_HPD_TOGGLE_FILT_CNTL +
> > > hpd_offsets[amdgpu_connector->hpd.hpd], tmp);
> > > +           dce_v11_0_hpd_int_ack(adev,
> > > amdgpu_connector->hpd.hpd); dce_v11_0_hpd_set_polarity(adev,
> > > amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
> > > amdgpu_connector->hpd.hpd); } diff --git
> > > a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> > > b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c index
> > > 143efc37a17f..28c4a735716b 100644 ---
> > > a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c +++
> > > b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c @@ -272,6 +272,21 @@  
> > static  
> > > void dce_v6_0_hpd_set_polarity(struct amdgpu_device *adev,
> > > WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
> > >
> > > +static void dce_v6_0_hpd_int_ack(struct amdgpu_device *adev,
> > > +                            int hpd)
> > > +{
> > > +   u32 tmp;
> > > +
> > > +   if (hpd >= adev->mode_info.num_hpd) {
> > > +           DRM_DEBUG("invalid hdp %d\n", hpd);
> > > +           return;
> > > +   }
> > > +
> > > +   tmp = RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
> > > +   tmp |= DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> > > +   WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
> > > +
> > >  /**
> > >   * dce_v6_0_hpd_init - hpd setup callback.
> > >   *
> > > @@ -311,6 +326,7 @@ static void dce_v6_0_hpd_init(struct  
> > amdgpu_device  
> > > *adev) continue;
> > >             }
> > >
> > > +           dce_v6_0_hpd_int_ack(adev,
> > > amdgpu_connector->hpd.hpd); dce_v6_0_hpd_set_polarity(adev,
> > > amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
> > > amdgpu_connector->hpd.hpd); } @@ -3088,7 +3104,7 @@ static int
> > > dce_v6_0_hpd_irq(struct amdgpu_device *adev, struct amdgpu_irq_src
> > > *source,
> > >                         struct amdgpu_iv_entry *entry)  {
> > > -   uint32_t disp_int, mask, tmp;
> > > +   uint32_t disp_int, mask;
> > >     unsigned hpd;
> > >
> > >     if (entry->src_data[0] >= adev->mode_info.num_hpd) { @@
> > > -3101,9 +3117,7 @@ static int dce_v6_0_hpd_irq(struct
> > > amdgpu_device *adev, mask = interrupt_status_offsets[hpd].hpd;
> > >
> > >     if (disp_int & mask) {
> > > -           tmp = RREG32(mmDC_HPD1_INT_CONTROL +
> > > hpd_offsets[hpd]);
> > > -           tmp |=  
> > DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;  
> > > -           WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd],
> > > tmp);
> > > +           dce_v6_0_hpd_int_ack(adev, hpd);
> > >             schedule_delayed_work(&adev->hotplug_work, 0);
> > >             DRM_DEBUG("IH: HPD%d\n", hpd + 1);
> > >     }
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> > > b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c index
> > > adeddfb7ff12..8ff2b5adfd95 100644 ---
> > > a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c +++
> > > b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c @@ -264,6 +264,21 @@  
> > static  
> > > void dce_v8_0_hpd_set_polarity(struct amdgpu_device *adev,
> > > WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
> > >
> > > +static void dce_v8_0_hpd_int_ack(struct amdgpu_device *adev,
> > > +                            int hpd)
> > > +{
> > > +   u32 tmp;
> > > +
> > > +   if (hpd >= adev->mode_info.num_hpd) {
> > > +           DRM_DEBUG("invalid hdp %d\n", hpd);
> > > +           return;
> > > +   }
> > > +
> > > +   tmp = RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
> > > +   tmp |= DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> > > +   WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
> > > +
> > >  /**
> > >   * dce_v8_0_hpd_init - hpd setup callback.
> > >   *
> > > @@ -303,6 +318,7 @@ static void dce_v8_0_hpd_init(struct  
> > amdgpu_device  
> > > *adev) continue;
> > >             }
> > >
> > > +           dce_v8_0_hpd_int_ack(adev,
> > > amdgpu_connector->hpd.hpd); dce_v8_0_hpd_set_polarity(adev,
> > > amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
> > > amdgpu_connector->hpd.hpd); } @@ -3176,7 +3192,7 @@ static int
> > > dce_v8_0_hpd_irq(struct amdgpu_device *adev, struct amdgpu_irq_src
> > > *source,
> > >                         struct amdgpu_iv_entry *entry)  {
> > > -   uint32_t disp_int, mask, tmp;
> > > +   uint32_t disp_int, mask;
> > >     unsigned hpd;
> > >
> > >     if (entry->src_data[0] >= adev->mode_info.num_hpd) { @@
> > > -3189,9 +3205,7 @@ static int dce_v8_0_hpd_irq(struct
> > > amdgpu_device *adev, mask = interrupt_status_offsets[hpd].hpd;
> > >
> > >     if (disp_int & mask) {
> > > -           tmp = RREG32(mmDC_HPD1_INT_CONTROL +
> > > hpd_offsets[hpd]);
> > > -           tmp |=  
> > DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;  
> > > -           WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd],
> > > tmp);
> > > +           dce_v8_0_hpd_int_ack(adev, hpd);
> > >             schedule_delayed_work(&adev->hotplug_work, 0);
> > >             DRM_DEBUG("IH: HPD%d\n", hpd + 1);
> > >     }  
> 
> 

