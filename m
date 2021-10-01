Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ED541EA57
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1356EDA4;
	Fri,  1 Oct 2021 10:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4006EDA4;
 Fri,  1 Oct 2021 10:06:15 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id z2so6809386wmc.3;
 Fri, 01 Oct 2021 03:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nBxy3ulKKNwNU3JRN+DI9TGxvR5T/sYujwDVcUd5t/E=;
 b=SVGez1MdEiVQGoFy/riw0xiEDO0FV02BsjEqc7v0cfxfpXWOsnbq0uWUEmWrvEemIV
 mJTP/RgHr6LJmd/8IEAcwdKIuk3IAbTFK5taIzoXEU2oyeg+30H15A+yC1NWru4Yyh7g
 BsNpkrtO1uuaJhP7LoiKMzki7vuFEMmVqAqUktL0X2S7NLEXWKTSiWTBr5QJ3gNpzCVc
 1UReGn2qC+naWiFsZR9ur5vpHAHQgOYRPIkUCCB2C6Hl8rDk/KXQAX5Q3tzqXzSyw1rl
 bvreaUGIf/MVdzbjzwIeV5Qz5TjSLi27OlHLN0miuDef0ZC8zcGWoI+l0deMsooVm4Ty
 820g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nBxy3ulKKNwNU3JRN+DI9TGxvR5T/sYujwDVcUd5t/E=;
 b=dupmTnDpI/yLSY0hjv6hPLW+Om21kRY9ikB5Kp8Ythcf2Iy2XBQWqOOnucuJfDrefI
 wqVI7KdP7OuKyC3BMs5lzgGHMEf2ynwl0z1i852giVaUFKEljEpZZh/0MOJZxsU1TP9u
 eudup2Jr8ipB9f7Guv0f9/DZxW4QTyC5tPd5iJewbf4IOCSvf62x2LyDxQhLU5SKmEZy
 aRSRjYJGAHmi+B4Iz6qhzAiIRbmjJVv33aam5pWnqw3Zh2tYoifp9PZe2wmiLtE+MbvP
 tPtBYuEYuNCjnvrr785nVr6t9rYOptFHDm/Kaj1bppWDmoXxvF7cmNTEDrGM7FBWObdt
 UUPw==
X-Gm-Message-State: AOAM532FFfSSYyLuNmWgpIfg+3P7h4vq4HdHiuZJJOzed21yvqbhfg+m
 TW4MwXWnrnJB52HBWLnpoRs=
X-Google-Smtp-Source: ABdhPJzzkDQSQyhgkCwBptEv0AsEJopTJjOV/eomBw7zew4bb/Eh++0YuZhIQMGbfnYye1cgUCuEGw==
X-Received: by 2002:a1c:a512:: with SMTP id o18mr3585361wme.162.1633082773573; 
 Fri, 01 Oct 2021 03:06:13 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: Deploying new iterator interface for dma-buf
Date: Fri,  1 Oct 2021 12:05:42 +0200
Message-Id: <20211001100610.2899-1-christian.koenig@amd.com>
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

Hi guys,

I've fixed up the lockdep splat in the new selftests found by the CI
systems and added another path for dma_resv_poll.

I know you guys are flooded, but can we get at least the first few patches
committed? The patches to change the individual drivers could also be pushed later on I think.

Thanks,
Christian.


