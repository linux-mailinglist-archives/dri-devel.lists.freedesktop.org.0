Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F031B245D40
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825F16E509;
	Mon, 17 Aug 2020 07:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BE36E364
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 17:20:32 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r15so2744948wrp.13
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 10:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=BZwN8MQg3nUFNF05W+2y2xyOzCj9uWLpsipBs2x7lzE=;
 b=OdF2viLC4Km2Gpz9+9RJVA7rt+XjVlOVW9vmiQsJqhFgP4DFsYFTFFQsxN139P66wh
 XbKsdyXac23JjtF85aKekKIDNarJVDAIRysGm87hJpr/O/pWNPl9v1A3juCZQD5MyqKe
 0/6on5ZOq6kFGIY2LewfyMpRrF+PmJGOUGALrnKYzL39EMfvgA7XZCUV85JQHhCpcHZ+
 JsE6oKmJaGaIxYriZneHzAuPnkjZtRBKU+Hg95BqeoLNtP2nS5fERzZ9kQmQc2yM6aqu
 cI1FRBBmNpJlwU2gsj55Ycw8iMd5h/4H5y142uKUOHCLQtMz9+0hifeOGMOeTmpWbieM
 gNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=BZwN8MQg3nUFNF05W+2y2xyOzCj9uWLpsipBs2x7lzE=;
 b=qeQFHmPQl05pO1Y/3/PbR8bq8bPuC1VSPI6ocO6dKe/7Zk1qrS3LjNLA9Jw63aggP/
 zFexRYVMQOkFh4P5CK5s2zKM0Ckx1G7ENiVI6dCgAHum5hkoNpq82fKhScG3nJIabhmm
 hmNc3TSZRCoanxjck5LTA1AGXagJI3d8l+wcjEBzlL3t24eiU/t+Qe70K39X+u1AHBzc
 WmUK53ERPDClU97Q2f9E/AAsrA+Cw42Yqwb3yIgFNCAxQn6ImGmUySF0XM3opwXHh5zj
 vMZmM4qe1El6RdUJj6w0IVJcp1mWm2BxvmV4ouDkEB2NCGs37cbWaU8kHC2rRHVd55kQ
 sNAg==
X-Gm-Message-State: AOAM530fZ0VgzPP8L2SZCReHWylGrzXH93GmNbyozvG6qxre1emElf8z
 PvlV9B8OQPQS4S6Iip4R8Lo=
X-Google-Smtp-Source: ABdhPJwpG5arhaOEzF9s34BmgaRInsqakeB6bRu5uNHOS/NU0bCn50ErFYB617wDDSwr0m7xnSb2bA==
X-Received: by 2002:a05:6000:c:: with SMTP id
 h12mr11192685wrx.49.1597598430704; 
 Sun, 16 Aug 2020 10:20:30 -0700 (PDT)
Received: from tsnow ([94.159.146.190])
 by smtp.gmail.com with ESMTPSA id h7sm27140377wmf.43.2020.08.16.10.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 10:20:30 -0700 (PDT)
Date: Sun, 16 Aug 2020 20:20:26 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/3] Replac BAG/BAG_ON with WARN/WARN_ON
Message-ID: <cover.1597597955.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:42 +0000
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Suren Baghdasaryan <surenb@google.com>, Riley Andrews <riandrews@android.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Hridya Valsaraju <hridya@google.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Laura Abbott <labbott@redhat.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series convert BUGs/BUG_ONs to WARNs/WARN_ONs

Tomer Samara (3):
  staging: androind: Replace BUG_ONs with WARN_ONs
  staging: androind: Add error handling to ion_page_pool_shrink
  staging: androind: Convert BUG() to WARN()

 drivers/staging/android/ion/ion_page_pool.c   | 14 ++++++++++----
 drivers/staging/android/ion/ion_system_heap.c |  3 ++-
 2 files changed, 12 insertions(+), 5 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
