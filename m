Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A359C8516C3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 15:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805B810E5FB;
	Mon, 12 Feb 2024 14:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mAnKUzlX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B2410E5FB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 14:14:43 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6e02597a0afso2265320b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 06:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707747282; x=1708352082; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UjO3tmeDqSfXjMSar0lNGn5BmL/XIyPFGpdugjnb3SQ=;
 b=mAnKUzlX1Cex6ZDQ+NtBJorq9NyCCWuOuKkm6tcGLqfXO7FZS8lfoI2DWukafgfxQO
 zW6QUXxv+voNR+LD+QRmuCH0vSUk2U+UaUfIb5nPxz24sZFfoXHmwa+TT/PMowE/coaJ
 yisR2rQsJA10UCwbwhZZGTnP+HxnW0QQ2oKXKUe9LIF6xzsX8u6sAD4gFDod4y0633DS
 +HGlkKnbmRYVl9nb/dGR/4YnYUdHplwC6dq5RwsRMZl76T0SWp6K5YHQj8U+hq7xEGqj
 rTKlUaH8VkGLuakrPqyWDbdc/NcZzjMaJKTBcolUxUF13mguhky8MxIh8C0z4hbiAb4f
 nX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707747282; x=1708352082;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UjO3tmeDqSfXjMSar0lNGn5BmL/XIyPFGpdugjnb3SQ=;
 b=Ttd8l4dbHHdmehfjN8C3QpIqgLxfDu9uy8/Gf4KZgewInKJK9mIZAVzCV0rgdSPuoc
 /QdxcfrwfIMJQ4x/dipquXPTLze7XimFsIxdSmv/uMYIbcJiwMBx9gI2vdw/vsf3CDo5
 E0Wfopu3tRkQeM0EYcYiNCmlozybajIXpSpdaaIlaG5Fw4MB5QPT70Xf7DZ4Rfw8L+ga
 DAL79rm4+/sEcjNd/oRGU/9wG/F1jy6WMcKnk3d6rvbfua51YBLWYTx+Ybc+Hm8cE/Pm
 KsqsIu4G9Q8RLPyfz0vlAtybHEULDiKDx7bYEEzHKKwJACKaxA6OqWJwgTjTv83KTOPU
 Bx1A==
X-Gm-Message-State: AOJu0YwmGRS5v8ke1Z0Tnja+EmhJcLKrniV/HlcUed0DktYLuGy4W57y
 LzwL5meN8/ioNOQ06NuuWrxeZ1sI5Mi0P+MaZ5108T4oOn+IJrR4
X-Google-Smtp-Source: AGHT+IHBPE2IUt1n597gx69KZ1vfZj7edkTdGiIKU/JprqQfv1zIY5dT8AxSWKci98MkPQvxjNOSlQ==
X-Received: by 2002:a05:6a20:d386:b0:19e:b8a2:6572 with SMTP id
 iq6-20020a056a20d38600b0019eb8a26572mr7963308pzb.6.1707747282214; 
 Mon, 12 Feb 2024 06:14:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXAD+AY0eEshXcWFUlP5w1JXzY85s65WDZ+Dg3eNOBZTv+VZzaie2Bk/0Hw2ftL7KRj/ouIgYblUWtbdVygDxuuZu2p7efBxTH4+rMExGb5VAEEV6MVgKHK2cCpkGYWDW1c245fyvFtv0khXwXHSH/gIcTeYzp3mWiGKLFoxDC79x5yJfh8VwkJJjZJ/pPOb1yaXUOp3ZrYcz+bVaKgrqm1D70RjhC+Rzk=
Received: from five231003 ([2405:201:c006:31f8:4630:e95b:8a0d:b0d0])
 by smtp.gmail.com with ESMTPSA id
 bm6-20020a056a00320600b006e054704c7dsm5560815pfb.123.2024.02.12.06.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 06:14:41 -0800 (PST)
Date: Mon, 12 Feb 2024 19:44:36 +0530
From: Kousik Sanagavarapu <five231003@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] gpu: drm: display: indent fix in comment
Message-ID: <ZconzKCU8CST45KF@five231003>
References: <20240124183659.511731-1-five231003@gmail.com>
 <ZcTxUDb3_Xtqk8uW@five231003>
 <7b17f021-cff8-4110-ac8f-c8f635263293@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7b17f021-cff8-4110-ac8f-c8f635263293@infradead.org>
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

On Sat, Feb 10, 2024 at 10:49:50PM -0800, Randy Dunlap wrote:
> 
> 
> On 2/8/24 07:20, Kousik Sanagavarapu wrote:
> > On Thu, Jan 25, 2024 at 12:05:56AM +0530, Kousik Sanagavarapu wrote:
> >> The comments explaining the function "drm_dp_mst_atom_check_mgr()" had
> >> uneven indentation which made "make htmldocs" complain:
> >>
> >> 	Documentation/gpu/drm-kms-helpers:296:
> >> 	./drivers/gpu/drm/display/drm_dp_mst_topology.c:5496:
> >> 	ERROR: Unexpected indentation.
> >>
> >> 	Documentation/gpu/drm-kms-helpers:296:
> >> 	./drivers/gpu/drm/display/drm_dp_mst_topology.c:5500:
> >> 	WARNING: Block quote ends without a blank line; unexpected unindent.
> >>
> >> Fix this by getting the indent right.
> >>
> >> Signed-off-by: Kousik Sanagavarapu <five231003@gmail.com>
> >> -- 
> > 
> > Ping again.
> > 
> > Thanks
> 
> Hi,
> This seems to be fixed by commit 1a84c213146a.

Makes sense.  Sorry for the noise.

> If you don't agree, please explain.
> Thanks.
> 
> -- 
> #Randy
