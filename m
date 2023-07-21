Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92F775C6EF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 14:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE9310E67A;
	Fri, 21 Jul 2023 12:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D34010E67A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 12:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=EmK+s79iHYSMxKUHHFzMSHP5Gr4Y9HLSftbd9Ecs9V0=;
 b=GoV3E7VTyj3jSak4WVapZnXdBDXUXPW7O/DjDQR67JvQSlDg0E6Z+7U2EJW2wSazWNIl+zv+6Wa/J
 Oko9BnChqt1i54NKNZoPyniQnmVclXhem4i6z8bBp6NtJIPaQD7+wnhOz/akOwwRa2ZC0ssNMMwmF5
 lNENAy8IzMfy97Ci9nY0MdxDviT9U14WA79crnQh6+4/WN84/8V8IqtRI1v5NfAxNuRyjSyPsveGoD
 tEtb6CyFzXVKij6+gOWLHJl7ZDtkINx+IZzIi9oHL7+60126NBJkga/kfzfjljAZB/5ubdRQDZFbeQ
 /Y4JIVvzIWYXtPd+u2V+2lGM6a3C9eQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=EmK+s79iHYSMxKUHHFzMSHP5Gr4Y9HLSftbd9Ecs9V0=;
 b=9xOKpGptgdPeXrLkjWh5r4V21or4l5WCdvZcs1Z3pKTNr83EHudOHcfJcC9y10AUYCZx4y9WENCOj
 5kj+Y/MAQ==
X-HalOne-ID: b8a6ca80-27c2-11ee-9464-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id b8a6ca80-27c2-11ee-9464-592bb1efe9dc;
 Fri, 21 Jul 2023 12:33:00 +0000 (UTC)
Date: Fri, 21 Jul 2023 14:32:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Subject: Re: [PATCH 6/9] drm/verisilicon: Add drm crtc funcs
Message-ID: <20230721123258.GA337946@ravnborg.org>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-7-keith.zhao@starfivetech.com>
 <07cc89a5-5200-72e6-f078-694c5820a99a@suse.de>
 <a8c51143-01cb-a95f-bfbd-16827325934e@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8c51143-01cb-a95f-bfbd-16827325934e@starfivetech.com>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, Jack Zhu <jack.zhu@starfivetech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Keith,
On Fri, Jul 21, 2023 at 07:57:24PM +0800, Keith Zhao wrote:
> >> +
> >> +struct vs_crtc_funcs {
> >> +    void (*enable)(struct device *dev, struct drm_crtc *crtc);
> >> +    void (*disable)(struct device *dev, struct drm_crtc *crtc);
> >> +    bool (*mode_fixup)(struct device *dev,
> >> +               const struct drm_display_mode *mode,
> >> +               struct drm_display_mode *adjusted_mode);
> >> +    void (*set_gamma)(struct device *dev, struct drm_crtc *crtc,
> >> +              struct drm_color_lut *lut, unsigned int size);
> >> +    void (*enable_gamma)(struct device *dev, struct drm_crtc *crtc,
> >> +                 bool enable);
> >> +    void (*enable_vblank)(struct device *dev, bool enable);
> >> +    void (*commit)(struct device *dev);
> >> +};
> > 
> > Why is this here? You are reproducing our interface with an internal interface. I know where this leads to: you have multiple chipset revisions and each has its own implemenation of these internal interfaces.
> > 
> > That will absolutely come back to haunt you in the long rung: the more chip revisions you support, the more obscure these internal interfaces and implentations become. And you won't be able to change these callbacks, as that affects all revisions. We've seen this with a few drivers. It will become unmaintainable.
> > 
> > A better approach is to treat DRM's atomic callback funcs and atomic helper funcs as your interface for each chip revision. So for each model, you implement a separate modesetting pipeline. When you add a new chip revision, you copy the previous chip's code into a new file and adopt it. If you find comon code among individual revisions, you can put it into a shared helper.  With this design, each chip revision stands on its own.
> > 
> > I suggest to study the mgag200 driver. It detects the chip revision very early and builds a chip-specific modesetting pipline. Although each chip is handled separately, a lot of shared code is in helpers. So the size of the driver remains small.
> > 
> hi Thomas:
> I'm trying to understand what you're thinking

I am not Thomas, but let me try to put a few words on this.

> 1. Different chip ids should have their own independent drm_dev, and should not be supported based on a same drm_dev.
Yes, this part is correct understood.

> 2. diff chip id , for example dc8200 , dc9000,
> 
> struct vs_crtc_funcs {
> 	void (*enable)(struct device *dev, struct drm_crtc *crtc);
> 	void (*disable)(struct device *dev, struct drm_crtc *crtc);
> 	bool (*mode_fixup)(struct device *dev,
> 			   const struct drm_display_mode *mode,
> 			   struct drm_display_mode *adjusted_mode);
> 	void (*set_gamma)(struct device *dev, struct drm_crtc *crtc,
> 			  struct drm_color_lut *lut, unsigned int size);
> 	void (*enable_gamma)(struct device *dev, struct drm_crtc *crtc,
> 			     bool enable);
> 	void (*enable_vblank)(struct device *dev, bool enable);
> 	void (*commit)(struct device *dev);
> };
No - the idea is that you populate crtc_funcs direct.
Drop struct vs_crtc_funcs - just fill out your own crtc_funcs structure.

If it turns out that most of the crtc operations are the same then share
them. Avoid the extra layer of indirection that you have with struct vs_crtc_funcs
as this is not needed when you use the pattern described by Thomas.


> static const struct vs_crtc_funcs vs_dc8200_crtc_funcs = {...}
> static const struct vs_crtc_funcs vs_dc9200_crtc_funcs = {...}
> 
> struct vs_drm_private {
> 	struct drm_device base;
> 	struct device *dma_dev;
> 	struct iommu_domain *domain;
> 	unsigned int pitch_alignment;

This parts looks fine.

> 
> 	const struct vs_crtc_funcs *funcs;
No, here you need a pointer to struct crtc_funcs or a struct that embeds
crtc_funcs.
> };

If you, after reading this, thinks you need struct vs_crtc_funcs, then
try to take an extra look at mgag200. It is not needed.

I hope this helps.

	Sam
