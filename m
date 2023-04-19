Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC4C6E7F86
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 18:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C1210E3F1;
	Wed, 19 Apr 2023 16:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6005510E1C1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 16:24:42 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94f161ee14fso73245166b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681921480; x=1684513480;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7K6w5OJikldhmL61pOlJnxVZUu5lcwwyjI/qw2nrEo=;
 b=LaTBy49SBwoj4h+oT2GlGpoG1ho4XJx59PLABgeoGZbb55L3JUnyITzH/tFRPmCWF0
 kvH3KOzJ9K63ateEneekFbTU883T5/jyYUikhOREIArW5o9vhGDMXkfqtOAEjLuk6JX4
 FMoaBRBM6Gitpy4VKbUwrJ3bzmUlte6CZRibo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681921480; x=1684513480;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h7K6w5OJikldhmL61pOlJnxVZUu5lcwwyjI/qw2nrEo=;
 b=Co+liCC8MsDs8gu5oBB6kNaFzsYiXAL5gfc6sKuqNq0k7cilLa5U6U8QjEp+j0mzgj
 ysPuFeA4L6cfaDmh+Jx8h8RQEH7Mdleubiv9Rmyn8HJ0tDg1IqG/NGL6qEkjQe3Ysu4v
 rhu6jWrAbl5tQybGONtTmDN8VASDb9ilyZ4+sKQRYEmv/2bfGeUU3KfkInlZ8T8X2TTj
 XYal65ax6Zz1ARerJ3Mdc7ETtV1EHHjkNhfXDa7QrR+EUNHNG0pd1LrN0yqDuU17mWE+
 DXuiA2UaQlM8icqrG+fV8v35/VtA8sLyxVdqwxmyHB9jq2GIBYpg+lGYtmTsoMe+0ili
 tD/w==
X-Gm-Message-State: AAQBX9dSE2i0cpVbuBoLS0Se1jrvtOyDcdbOzcaTj4hyLv5xD6gqvPSP
 y0q2/OF1prrH5131QDiucn3BLg==
X-Google-Smtp-Source: AKy350bL0zGlce4TfTMYhL1LQuXzF7N1ZDTAjWo9P3ioMSAVLzb74mKMm7PgVSCTxsUSN/WDSq+9MQ==
X-Received: by 2002:a17:906:86:b0:94f:4ec3:f0e7 with SMTP id
 6-20020a170906008600b0094f4ec3f0e7mr12463889ejc.2.1681921480400; 
 Wed, 19 Apr 2023 09:24:40 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 qm5-20020a170907674500b0094e3ddcf153sm9387130ejc.115.2023.04.19.09.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 09:24:39 -0700 (PDT)
Date: Wed, 19 Apr 2023 18:24:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mark Brown <broonie@kernel.org>, Dave Airlie <airlied@gmail.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with the mm-stable
 tree
Message-ID: <ZEAVxeIEOny81EGY@phenom.ffwll.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>,
 Dave Airlie <airlied@gmail.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>
References: <20230414125913.851920-1-broonie@kernel.org>
 <ZDuqut+8BKjMXblJ@phenom.ffwll.local>
 <8c90b4db-3075-4275-bea8-01f501b00885@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c90b4db-3075-4275-bea8-01f501b00885@sirena.org.uk>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Nathan Chancellor <nathan@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 07:34:44PM +0100, Mark Brown wrote:
> On Sun, Apr 16, 2023 at 09:58:50AM +0200, Daniel Vetter wrote:
> 
> > Note there was a ppc compile fail, which is why we pushed the ttm revert.
> > That /should/ be fixed now, but would be good if you can confirm?
> 
> According to Nathan (CCed) there's still issues with the interaction
> with the PowerPC tree.

So this revert was supposed to fix this: 56e51681246e ("drm/ttm: revert
"Reduce the number of used allocation orders for TTM pages"")

If there's anything left then I need to chase that asap since the merge
window will open soon.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
