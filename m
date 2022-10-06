Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0259E5F6313
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 10:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F2C10E369;
	Thu,  6 Oct 2022 08:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E33910E369;
 Thu,  6 Oct 2022 08:51:10 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j16so1613200wrh.5;
 Thu, 06 Oct 2022 01:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aIf8xFSpdZbA1GQzuqts7ymYscMRXeakvYyTWUDLadI=;
 b=G2GZPFQtAV+fYMiWZUUw9Ycw4NyH/47he9vDSPotO9NB+kd/J+ZTdp4QRwxs3nUmel
 HsE6XDKEW5sgrt/QH6ElbgDbCHmOcxh+iT0NqyFTt3vJCqNtDZ7xBXJUf2RQDiFIZTFO
 BVmPbl+qzzABOI+E2a3Ou4i+0l7AqwQhJlxrFI10eOvuLOOv39p2bgFOjVUq3IzTNgdm
 imCSquDjoB7r8VPw0135RDuR5doUnprvSetHHzy/LNFGfEJ/YtD0Ir9yiut3enBuyACk
 uQoH3GbZCQR93o/HCw39kkDnAKJWHAGH1wnBO/YrX9FY3UIYazs78CpMd5gNZhMYqaud
 BKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aIf8xFSpdZbA1GQzuqts7ymYscMRXeakvYyTWUDLadI=;
 b=m+Q4rIHPbKjU6nJ7oyw8LGwPJYZk5MgZKECYlqwxADWDYTz6xnfhD3K1wD8IZBWavN
 QQRuORELUS8LZqKR30ntgdZzqkbmh4FZbLcXN1MgK/Xih72BcVwIddEt8CqcCiHQPj9X
 2pDl7VkoU+IqE1beHTAgVsg1kkENUnNZKcl1EgZd47JWEo4KPamPISPGgGcyrnb6NgCa
 zI3FQ64tyQgVpYKoU4LD3Xvso8bvEmMa1EypXorklKFyMSugdbk/baqBzyNEpqywdGi8
 3nVNXG5Uukx3rsrnI+4aGC3+i8EWl2fqL8EkzP9T6zMzy14aFaDYi4F5n/lmxZxmYeWR
 YqvQ==
X-Gm-Message-State: ACrzQf2BeMjeIppjzgEpVdEJ/DPMR/6xrUsL5JuZgkrhESW3yboBFoHZ
 z3Ve/8F5uBRZ1TeBFFF21aY=
X-Google-Smtp-Source: AMsMyM5MMGYHRauq4eVLkpLLZvw2RTDbvRrV8/jSalu4l28kT8hstXJuRFCaWh2Nh/nRrelPatgN7w==
X-Received: by 2002:adf:ef43:0:b0:22d:c507:dd48 with SMTP id
 c3-20020adfef43000000b0022dc507dd48mr2337256wrp.416.1665046268371; 
 Thu, 06 Oct 2022 01:51:08 -0700 (PDT)
Received: from debian (host-78-150-37-98.as13285.net. [78.150.37.98])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a05600c3b0700b003a1980d55c4sm4886918wms.47.2022.10.06.01.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 01:51:08 -0700 (PDT)
Date: Thu, 6 Oct 2022 09:51:06 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: mainline build failure due to 5d8c3e836fc2 ("drm/amd/display: fix
 array-bounds error in dc_stream_remove_writeback()")
Message-ID: <Yz6W+j+l0cJbr5dX@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

The latest mainline kernel branch fails to build allmodconfig for every
ARCH with gcc-11 with the error:

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error: array subscript [0, 0] is outside array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
  527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
      |                                                             ~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
                 from ./drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
                 from ./drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while referencing 'writeback_info'
  241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
      |                                  ^~~~~~~~~~~~~~


git bisect pointed to 5d8c3e836fc2 ("drm/amd/display: fix array-bounds error in dc_stream_remove_writeback()")

I will be happy to test any patch or provide any extra log if needed.

Note:
This is only seen with gcc-11, gcc-12 builds are ok.


-- 
Regards
Sudip
