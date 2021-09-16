Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CCF40D88C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9922B6ECE4;
	Thu, 16 Sep 2021 11:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7798D6ECE4;
 Thu, 16 Sep 2021 11:30:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso4257768wmc.1; 
 Thu, 16 Sep 2021 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JGNtBFFeXnnCnrSDFPgub+2yBqbDjJC9rYoYFIcuhHM=;
 b=Nbnk97eM9wgjZbjEhozZeeQ9jLrrJIWXM7tnp0QyAHiHlNcE15tulovNH3mLKOD5DV
 WRB2X4L8Xh/u43oLPinbPqyyj++YXI2kGeeacr/bSrTRnXuIxPDUFeOAQn6qmjcP9joI
 baXPgxcfHW/QDL/pKgpoN6tQlftrj0iJVKp1zDJchSyfgGl5TqZvRtDWV+JQpiMqksIV
 KRfLhRloMsC0oWv1wLMdTiaGfBh3LrAd5pEpqK0rOmRtolnRF7iAE7aVv5TI+tl7wxeJ
 2w7qw4w2MLo0YXVyYNLePDepcgc2cdTiWyMISFL5s57Xfn0xdwXgOPK0vmJL5CGd/tkV
 yQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JGNtBFFeXnnCnrSDFPgub+2yBqbDjJC9rYoYFIcuhHM=;
 b=J4ku9ATENB1HIvbD1UANS4aUiqRveKSzMazUJ81sgkI1DDdUcwgRBmHyFqNZuMQCYw
 tI8CxTI6Vn4pGeapnJkTmgz1ealJ/Ol7QoeCgbv194FZHgmA8G93p64zCX3QsdZeLw60
 vKw5g8+ynokY+BB///7e9+cSkRTYhZ2W8jJSGbunYeG6NcxVgDU5FPnsIt0rW2DNXIKL
 jxqd8dI8qTZHvGgP0C+dj7Qtv2e0E34c8OVbfW3dR98jUkCKwCMqFrc387sCFwsn24nv
 yz2bfLk8UQUKgLp3si8NupvqWO4zu8iTNoA7CDGmiWrD6eD/NJRKTYQ18QnwhBZ1vDk6
 2FsQ==
X-Gm-Message-State: AOAM5336ffTR6htUFxneDB70uQCmyhuGAyVH/vTH4USQ9RtPNH97/dM7
 avTtfihmmZdfDLecRyX/ZPka2aRgaK2t4PCD
X-Google-Smtp-Source: ABdhPJxUy+sVzLEtRLYNKYyci9xprjccER7X07W9mkIGelPR0RGcNhyoM0Z62f/RuRQPUv8k4cAbsg==
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr9528904wmf.82.1631791846090; 
 Thu, 16 Sep 2021 04:30:46 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:30:45 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: Deploying new iterator interface for dma-buf
Date: Thu, 16 Sep 2021 13:30:16 +0200
Message-Id: <20210916113042.3631-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Next round for that one here, maybe the CI systems are now more
gracefully with me :)

I'm pretty sure that a couple of those dma_resv_for_each_fence_unlocked
should actually be replaced with lock+dma_resv_for_each_fence, but that
needs more auditing.

Please review and comment.

Thanks,
Christian.


