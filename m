Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34493BC7AE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 10:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5DC893CD;
	Tue,  6 Jul 2021 08:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8964289BC0
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 08:13:30 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso1108250wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 01:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=T/PqfqQ0h7MzyZqYo2/9nNmYqWPwn/er86ne9eTFD9w=;
 b=N0yeCEC2HSDCklis3aDOpJOvyORg2vCBj8XVXHfewWjBM9l0UtwED+aNYOC1JL1Pkd
 KztoU8YaB7DIKU26sMEsISbXbZ/yq/eRX6mGgymTsFYzBQeGzrDdNdvv50VdbHLESUKy
 jPZDvfY6edd5giEpMqWf4P2bJrXABPbVxQ8NE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=T/PqfqQ0h7MzyZqYo2/9nNmYqWPwn/er86ne9eTFD9w=;
 b=lAiwVjgqq7HHcgvI7p/Z25CPNLWFS9hMXpHA2qVheW0EYZKWuEll5M1mVNClQvDvYG
 rtQOWuk16O+AJo2fA5+YNMkT1J/QJwdNZD+9TJYNzX1ZGcLu0PKZ4KD8aIDu2Y3ikFl3
 /7weLnqJtQkOgVUm12VYQdJDc7pnTgbZU7w8vkNl5dg1OkDG6Q7cfqEGO7unTJtxf4cU
 lKCwOF9085d70cgJQ0Ws5q5IhaZXdqOji2R0wzH2qy3su70On0kuuNfs8l6JQWnHdL2n
 rT0ncCsej7olPmLHnn27fTrW3h0tJXsuWnYG98vL8EGmCzYsLJU8/uLZlc6l/Sn4JUCo
 6FAw==
X-Gm-Message-State: AOAM530VJ+cmqUD3K2R43Rsms0XhzKvBB4MT7M5ZcWtCLUESd8p5GnmG
 CqgNH8/TGa08PshgeVtymc1uAA==
X-Google-Smtp-Source: ABdhPJwJHDSA+QpLvnzeIvfoDaYtZjyk+ti+8El02UFix17t3ozgt+mQAV14squtZV1d0GN4DSt8rw==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr3352140wmo.132.1625559208997; 
 Tue, 06 Jul 2021 01:13:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q19sm1898024wmq.38.2021.07.06.01.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 01:13:28 -0700 (PDT)
Date: Tue, 6 Jul 2021 10:13:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 0/2] drm/i915: IRQ fixes
Message-ID: <YOQQpvWLMr+72ZML@phenom.ffwll.local>
References: <20210701173618.10718-1-tzimmermann@suse.de>
 <YN9uPeqktqiqfXc6@phenom.ffwll.local>
 <4e4e067c-4662-aac1-bee6-6124d35f543e@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e4e067c-4662-aac1-bee6-6124d35f543e@suse.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: matthew.brost@intel.com, airlied@linux.ie, mika.kuoppala@linux.intel.com,
 intel-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 03, 2021 at 07:55:31PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.07.21 um 21:51 schrieb Daniel Vetter:
> > On Thu, Jul 01, 2021 at 07:36:16PM +0200, Thomas Zimmermann wrote:
> > > Fix a bug in the usage of IRQs and cleanup references to the DRM
> > > IRQ midlayer.
> > > 
> > > Preferably this patchset would be merged through drm-misc-next.
> > > 
> > > v5:
> > > 	* go back to _hardirq() after CI tests reported atomic
> > > 	  context in PCI probe; add rsp comment
> > > v4:
> > > 	* switch IRQ code to intel_synchronize_irq() (Daniel)
> > > v3:
> > > 	* also use intel_synchronize_hardirq() from other callsite
> > > v2:
> > > 	* split patch
> > > 	* also fix comment
> > > 	* add intel_synchronize_hardirq() (Ville)
> > > 	* update Fixes tag (Daniel)
> > 
> > Ok now I actually pushed the right patch set.
> 
> Oh, I messed up. I forgot to reset the commit message in patch 1 v5. It's
> for v4 and contains the opposite of what's actually happening.
> 
> Is it too late to fix this? If you can force-push into the branch, maybe
> simply replace the current message with the one for v3. [1]

I already had to do a Fri-late-evening force push to fix my original
mistake right after I pushed it. Now there's other stuff there, so too
late unfortunately :-/

Anyway, not the worst screw-up and the Link: tag at least will point to
this discussion here.
-Daniel

> 
> Best regards
> Thomas
> 
> [1] https://patchwork.freedesktop.org/patch/441954/?series=92054&rev=2
> 
> > -Daniel
> > 
> > > 
> > > Thomas Zimmermann (2):
> > >    drm/i915: Use the correct IRQ during resume
> > >    drm/i915: Drop all references to DRM IRQ midlayer
> > > 
> > >   drivers/gpu/drm/i915/gt/intel_engine_cs.c       |  2 +-
> > >   drivers/gpu/drm/i915/gt/intel_ring_submission.c |  7 +++++--
> > >   drivers/gpu/drm/i915/i915_drv.c                 |  1 -
> > >   drivers/gpu/drm/i915/i915_irq.c                 | 10 +++++-----
> > >   drivers/gpu/drm/i915/i915_irq.h                 |  1 +
> > >   5 files changed, 12 insertions(+), 9 deletions(-)
> > > 
> > > 
> > > base-commit: 67f5a18128770817e4218a9e496d2bf5047c51e8
> > > prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> > > prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> > > prerequisite-patch-id: 0cca17365e65370fa95d193ed2f1c88917ee1aef
> > > prerequisite-patch-id: 12b9894350a0b56579d29542943465ef5134751c
> > > prerequisite-patch-id: 3e1c37d3425f4820fe36ea3da57c65e166fe0ee5
> > > prerequisite-patch-id: 1017c860a0bf95ce370d82b8db1745f5548fb321
> > > prerequisite-patch-id: dcc022baab7c172978de9809702c2f4f54323047
> > > prerequisite-patch-id: 0d05ee247042b43d5ab8f3af216e708a8e09bee8
> > > prerequisite-patch-id: 110c411161bed6072c32185940fcd052d0bdb09a
> > > prerequisite-patch-id: d2d1aeccffdfadf2b951487b8605f59c795d84cf
> > > prerequisite-patch-id: 85fe31e27ca13adc0d1bcc7c19b1ce238a77ee6a
> > > prerequisite-patch-id: c61fdacbe035ba5c17f1ff393bc9087f16aaea7b
> > > prerequisite-patch-id: c4821af5dbba4d121769f1da85d91fbb53020ec0
> > > prerequisite-patch-id: 0b20ef3302abfe6dc123dbc54b9dd087865f935b
> > > prerequisite-patch-id: d34eb96cbbdeb91870ace4250ea75920b1653dc2
> > > prerequisite-patch-id: 7f64fce347d15232134d7636ca7a8d9f5bf1a3a0
> > > prerequisite-patch-id: c83be7a285eb6682cdae0df401ab5d4c208f036b
> > > prerequisite-patch-id: eb1a44d2eb2685cea154dd3f17f5f463dfafd39a
> > > prerequisite-patch-id: 92a8c37dae4b8394fd6702f4af58ac7815ac3069
> > > prerequisite-patch-id: f0237988fe4ae6eba143432d1ace8beb52d935f8
> > > prerequisite-patch-id: bcf4d29437ed7cb78225dec4c99249eb40c18302
> > > prerequisite-patch-id: 6407b4c7f1b80af8d329d5f796b30da11959e936
> > > prerequisite-patch-id: 4a69e6e49d691b555f0e0874d638cd204dcb0c48
> > > prerequisite-patch-id: be09cfa8a67dd435a25103b85bd4b1649c5190a3
> > > prerequisite-patch-id: 813ecc9f94251c3d669155faf64c0c9e6a458393
> > > prerequisite-patch-id: beb2b5000a1682cbd74a7e2ab1566fcae5bccbf0
> > > prerequisite-patch-id: 754c8878611864475a0b75fd49ff38e71a21c795
> > > prerequisite-patch-id: d7d4bac3c19f94ba9593143b3c147d83d82cb71f
> > > prerequisite-patch-id: 983d1efbe060743f5951e474961fa431d886d757
> > > prerequisite-patch-id: 3c78b20c3b9315cd39e0ae9ea1510c6121bf9ca9
> > > --
> > > 2.32.0
> > > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
