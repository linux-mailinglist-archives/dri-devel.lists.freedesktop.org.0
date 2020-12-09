Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6808F2D379A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 01:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCC46E0D4;
	Wed,  9 Dec 2020 00:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB606E0D4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 00:29:26 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t4so109601wrr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 16:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wGKxtlzpzHe1r8FsmruDI64Cbqy90qg1huESvhy5BZI=;
 b=Uz8EoURviNkwQ3beDh54bdSusycyHwjAZ1pywau1IXgHt8qWp7HnQMgQuBEUny1EEg
 DJSraoG9hbTGsuu6tZhN++2PHJFC8aeroMJY0FZ6uQ4jMAR9byEQGtqlSTYjdIJgoFso
 9hnTXrLNl30hJZn/IcJZ6PsMjWHvveA+Jmfbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wGKxtlzpzHe1r8FsmruDI64Cbqy90qg1huESvhy5BZI=;
 b=bUMJuNE8mVyXWlxQiEiHERya4oW6hequcyC7rFklnzGyH4bi322RCVF3zqtOelar8m
 EsY+9Tzp3lsShY5pPslH9vhepdSYZFKLZBGilsJzHpeZB1bHvF+mqxuf1VgqCmtmbWJV
 ggAgk6e9So9dKSaYmBDHewwz4V4OUU3dVUt4ky0XyJqMH3bcIYzpakQcpW6b3w9OJOUi
 KvOHqh083dRYQtYgPE5BuhZu4IpTyCOCiUmybIxNsTP8vabzijYV8QAB7WWTPpqzsjBJ
 xhqwGO4FqVH4nbZViWBdaBUt7EtlhkFY4SJ0D6UPC3+3+8/Vedkdcx1YMS9rNtT0lyV+
 O35A==
X-Gm-Message-State: AOAM531ziK/wd1nt/bohO22Ar9IaATpcIGoHL2/ndyvbKlKgBx4BZ7Ky
 ZtjZvOkcEudg+xzgA57N60t4fQ==
X-Google-Smtp-Source: ABdhPJz17iQhS0VHyIJPYJBq9FricCSzebVixbxnkNOVlPErRAKa/VGBQMTgHqsgLzgb6sNpFVb+Eg==
X-Received: by 2002:a5d:51d1:: with SMTP id n17mr642262wrv.313.1607473765655; 
 Tue, 08 Dec 2020 16:29:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c9sm974095wrn.65.2020.12.08.16.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 16:29:24 -0800 (PST)
Date: Wed, 9 Dec 2020 01:29:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH] dma-buf: Fix kerneldoc formatting
Message-ID: <20201209002922.GJ401619@phenom.ffwll.local>
References: <20201204200242.2671481-1-daniel.vetter@ffwll.ch>
 <10aa275c9f174a19816a913bc35d9910@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10aa275c9f174a19816a913bc35d9910@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Vetter,
 Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 07, 2020 at 09:54:13PM +0000, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> >Daniel Vetter
> >Sent: Friday, December 4, 2020 3:03 PM
> >To: DRI Development <dri-devel@lists.freedesktop.org>
> >Cc: Daniel Vetter <daniel.vetter@ffwll.ch>; Vetter, Daniel
> ><daniel.vetter@intel.com>
> >Subject: [PATCH] dma-buf: Fix kerneldoc formatting
> >
> >I wanted to look up something and noticed the hyperlink doesn't work.
> >While fixing that also noticed a trivial kerneldoc comment typo in the
> >same section, fix that too.
> >
> >Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >---
> > Documentation/driver-api/dma-buf.rst | 2 +-
> > include/linux/dma-buf-map.h          | 2 +-
> > 2 files changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-
> >api/dma-buf.rst
> >index d6b2a195dbed..a2133d69872c 100644
> >--- a/Documentation/driver-api/dma-buf.rst
> >+++ b/Documentation/driver-api/dma-buf.rst
> >@@ -190,7 +190,7 @@ DMA Fence uABI/Sync File
> > Indefinite DMA Fences
> > ~~~~~~~~~~~~~~~~~~~~~
> >
> >-At various times &dma_fence with an indefinite time until dma_fence_wait()
> >+At various times struct dma_fence with an indefinite time until
> >dma_fence_wait()
> > finishes have been proposed. Examples include:
> >
> > * Future fences, used in HWC1 to signal when a buffer isn't used by the
> >display
> >diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> 
> Ahh, something to do while compiling...
> 
> Both changes look good to me.
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Thanks for taking a look, patch applied.
-Daniel

> 
> M
> 
> >index 583a3a1f9447..278d489e4bdd 100644
> >--- a/include/linux/dma-buf-map.h
> >+++ b/include/linux/dma-buf-map.h
> >@@ -122,7 +122,7 @@ struct dma_buf_map {
> >
> > /**
> >  * DMA_BUF_MAP_INIT_VADDR - Initializes struct dma_buf_map to an
> >address in system memory
> >- * @vaddr:	A system-memory address
> >+ * @vaddr_:	A system-memory address
> >  */
> > #define DMA_BUF_MAP_INIT_VADDR(vaddr_) \
> > 	{ \
> >--
> >2.29.2
> >
> >_______________________________________________
> >dri-devel mailing list
> >dri-devel@lists.freedesktop.org
> >https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
