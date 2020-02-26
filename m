Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32F2170B26
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 23:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429528855B;
	Wed, 26 Feb 2020 22:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06E78855B;
 Wed, 26 Feb 2020 22:05:53 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id m13so685206edb.6;
 Wed, 26 Feb 2020 14:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=lO560Vd8elu0vLfNr74TQ8Ij17BoVsrrt1XDoaTrIfo=;
 b=rNT0rnkki86MGc7psiszoA+k+IW0ye6YKaizU3CWPXfEJpDHUWiryx4VkbCgKD7WPU
 9X+mSaA7BTsjsf7lVOGkcdPgs2Q9OJnyHrqleAYDTwad9qLI/qLAyayYiamlCEH9rvM5
 ORlI/QdlLw6qv/uPANIfbRmtea5ZaJZYGoABVmwdFwt/mz+eqvo/4Oi7r998eTRy9yr/
 7eI9UF7wPUPh7BZwCFVSbgP86VRPKT0dscpTNz8SqEYvMJAgiCbdnNWAdva5E5SXpTS5
 5n0XyTvN9qw/TWqQkdb2M1nnO5h6Qqr0jZvY/lVcdlpq+bWpfo1G1d3wwbz3L6b7CVIl
 UZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=lO560Vd8elu0vLfNr74TQ8Ij17BoVsrrt1XDoaTrIfo=;
 b=pNanlB4reTRW6K8U2PNTr1+7/zRQ8hWxexetCFh3pcm/oI1f6lzhzu8+i1nEjIDVVX
 H534BrQDtNbj7eLLue0eslgv7Ke0jSG942QmcBhUoHzb7JeOW+a6AP+5ypfVWTm6qaFZ
 xqQ0Zfb25m/cRjbubKW0a/ef+7YIVYPKuRR3nyIvOM2OSnfaMgxdO/oB/TKh6mzsI7+Q
 mbFOZcrlnSzcuG48EZot7a8CHMFa0UuRCwRYufEP7YPzm97IZJqj+dH1crUsXXrAKu4l
 rZJEul1Bsn66Yf8/t7/krX4aKsAoXIx+x0+TCh8Ay4zBjD2Jmta5pxdLcGEwcDQsznLM
 +x2A==
X-Gm-Message-State: APjAAAWiD3J3VafQlBnRs7MKIDWRjX4L98XERbmyyv/O2JnRcLHtGXKf
 O4x2l6STrY+ptU3J3pgIQ9flim4RPJk=
X-Google-Smtp-Source: APXvYqw9rSLuNZaNiBI9qVmvO8rn/PoXC4JpYq8qWrjWaBXkn8OsgbaEEjuR3EvkUqWsVsyra9NafQ==
X-Received: by 2002:a17:906:785:: with SMTP id l5mr718781ejc.311.1582754752412; 
 Wed, 26 Feb 2020 14:05:52 -0800 (PST)
Received: from smtp.gmail.com ([2001:818:e238:a000:51c6:2c09:a768:9c37])
 by smtp.gmail.com with ESMTPSA id u9sm240590edt.91.2020.02.26.14.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 14:05:51 -0800 (PST)
Date: Wed, 26 Feb 2020 19:05:43 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: [PATCH 0/2] drm/amd/display: dc_link: cleaning up some code style
 issues
Message-ID: <cover.1582752490.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset solves some coding style issues on dc_link for readability
and cleaning up warnings. Change suggested by checkpatch.pl. 

Melissa Wen (2):
  drm/amd/display: dc_link: code clean up on enable_link_dp function
  drm/amd/display: dc_link: code clean up on detect_dp function

 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 67 +++++++++----------
 1 file changed, 32 insertions(+), 35 deletions(-)

-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
