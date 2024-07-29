Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1481A93FBE2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 18:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5619C10E432;
	Mon, 29 Jul 2024 16:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M/Bqhvta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C718210E3D9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 13:28:54 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-70d199fb3dfso2772456b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 06:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722259734; x=1722864534; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1yL0QCQNpqeOCAknWlO99YLMk+NffPf4WTYM45aZYO8=;
 b=M/BqhvtaBDKcBQ/pVW7iZJyVy0VMcNk0KW95OmlxCcRtafozkSe+pa1dp7nnxncpBv
 lnhXGihSbVj2K8gOqCcMZqn5NlU0ZKQRogOrt7xL6OmNPW+nb/LrW5mg90Ezi65CPG7Q
 zsTc7JMPxrp18jVXcIQtEpV/t6O9pnObs+xiVO+02tlSAuOjq8D3syW9E8e8da1zdIaD
 nApYV7Snr6JFdsBqw11UdovGcawhk2568FzkDPCReSd9fTfnLzIbUwjSqnLWWIXz2AfA
 XVjbJLVFnMO13dKh9udp3t9YkW1Q3srC95rb4/rTC/zYP87lZJiNnL4Prha9odVtorkJ
 Nyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722259734; x=1722864534;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1yL0QCQNpqeOCAknWlO99YLMk+NffPf4WTYM45aZYO8=;
 b=aFz/yXWHErl9XzfJmS1D8kT/T9Zxp/2APwGHeKLn7al6jx3MfSY5/+snDYUbTwlTpO
 5IiFqHBrMEO68cGJtMczGoY9nKf4BrHaJZZ+Qj4ERjiLvmXt4+2drJfmrKXL1aBJaEJL
 bm3qx5unjLaAPBbsdPjYQT4QotsF452bcUzp2bwktR5NHq1N4k3py2YgjNYTy3JIO8QM
 3aUJbI4V1/EblY4smLETsqLTjOTZAO/Ic0Q9JSEsuPDdQVHlDh+8fbADdPTGazhXyblu
 kIjSCfDoO69PAIRR9oKoXOdX+RjUoLFx9eJi4TGkXqOuTo4AE6xaEXvOrg5deLLJoISI
 H3Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX84ihxH7IPUffHt7UWXLu94YqsPOFXH45KN8dUWizMuJClsUA/reEdHaYl8dh8ZgXj/rVy7wyWHWRFxt7MkWrzJsp5Gbld6ZIx8hH5Ggey
X-Gm-Message-State: AOJu0YycwbprlO/g+z+syDpD5QCWCnFVYMujBZDKfFFR2lVP2mdtyPY6
 QwkW3u6bbS3yhcgoy+BI3Oc897s5nm8eHfRsYHnZh20jNOOzpmWu
X-Google-Smtp-Source: AGHT+IESX2PnLeI0EtJGrSeydGADF81jYh2s6zS5/LFhKulfASe7HsgEsqSl8L4xJCRK+QMMjg9fOQ==
X-Received: by 2002:a05:6a21:78a9:b0:1c1:89f8:8609 with SMTP id
 adf61e73a8af0-1c4a0e15171mr10085097637.0.1722259734258; 
 Mon, 29 Jul 2024 06:28:54 -0700 (PDT)
Received: from void.tail05c47.ts.net ([240c:c001:1:4300:752c:bb84:7d45:2db])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7edd91asm82647505ad.131.2024.07.29.06.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 06:28:53 -0700 (PDT)
Date: Mon, 29 Jul 2024 21:28:48 +0800
From: Yanjun Yang <yangyj.ee@gmail.com>
To: Philippe CORNU <philippe.cornu@foss.st.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RESEND v3 0/3] Update STM DSI PHY driver
Message-ID: <ZqeZEB9peRSQkOLZ@void.tail05c47.ts.net>
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
 <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
 <CAE8JAfy9NtBa--DnUt2AEZPFnvjU6idj8DqUbaeLaH0DMFvuhw@mail.gmail.com>
 <e059f157-ff9c-32cb-57a6-48f2331f2555@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e059f157-ff9c-32cb-57a6-48f2331f2555@foss.st.com>
X-Mailman-Approved-At: Mon, 29 Jul 2024 16:55:27 +0000
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

On Fri, Jul 26, 2024 at 09:55:35AM +0200, Philippe CORNU wrote:
> 
> 
> On 7/22/24 10:38, Yanjun Yang wrote:
> > 
> > This patch (commit id:185f99b614427360) seems to break the dsi of
> > stm32f469 chip.
> > I'm not familiar with the drm and the clock framework, maybe it's
> > because there is no
> >   "ck_dsi_phy" defined for stm32f469.
> > PS:  Sorry for receiving multiple copies of this email, I forgot to
> > use plain text mode last time.
> > 
> 
> Hi,
> Thank you for letting us know that there was this error. We should have
> detected this before merging, really sorry for the problems caused by this
> patch. We will investigate the issue and get back to you as soon as
> possible. In the meantime, I think you can revert this patch in your git
> tree.
> 
> Philippe :-)
> 

Hi,
After some testing, the reason behind my problem is the parent's name of
'clk_dsi_phy' for stm32f4 is 'clk-hse' other than 'ck_hse'.  I don't
know which is the better why to fix it:
1. Change "ck_hse" to "clk-hse" in where "clk_dsi_phy" is defined.
2. Use "pll_in_khz = clk_get_rate(dsi->pllref_clk) / 1000" instead of
   "pll_in_khz = (unsigned int)(parent_rate / 1000)" when get the clock
   rate.

Both method can fix my problem. The first one might break other
platforms. Maybe I should change the clock name of 'clk-hse'. However,
I can't find the defination of this clock name for stm32f4.
