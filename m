Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B2E422528
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6D56EB49;
	Tue,  5 Oct 2021 11:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B468A6EB49;
 Tue,  5 Oct 2021 11:37:46 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j8so6358369wro.7;
 Tue, 05 Oct 2021 04:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=164W6w6LWLW8NebvBaOQLdQNgGQ7HT0mCWe77mt2uTA=;
 b=CVGpci/DUifH+cgn4zVZt0u6zvgxk8H2IkT1tiTjfOKlQiOCIbrDrSklxXM2z4uGwE
 NPqUwPXZFpzcRctflKI6m1aRUvSYBlcbC/PZgTtELEiGcpxWAg+4kU8w1ldMrIoNsJW0
 8KdAGK497O4rOkHHwC17PZ7l/kbI6ISm505CNzIYLDUMp9HoZWkfWeytfAAip6GovSxK
 9GWyebTKN9uN+9tyUeGC+ao/jx3lI8SHVHpt6fkEGLdf2F/+kJCXfZyhufV7wSHh49Gb
 aPmivEB/q1wGlJFItDX50C6gvlE0q82iL7o0UA2dmh+3rXFsZKNlEpzvfag1L/CxqCDp
 jMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=164W6w6LWLW8NebvBaOQLdQNgGQ7HT0mCWe77mt2uTA=;
 b=Sa6QRoGSFVuu21vbU9Ru4P1GBwjXqRpCZBuUV13ozMI9wyMoJXgHWQPiAQKTPEhiXI
 CXcZcudC+jddJSA904arMEc8B9XCSGgt/fCZCxccjeE7YHEkQJfeLG6EolbNgdT6TFg7
 JWX6injBVCDwCLZWsGNYm+QCsPCFUmDu4FmZL0FVbl0NRA6h+JmnaHAr1rn4ofSuUgDf
 fGoZ+JP+TvVgShr68YnnigQ8+/PMMDAq0uykpRs+SCsDjytPxFMeYdN3wdbOEduIJ3Mk
 Vqqsa7k16w4yQ5YKKwYF1Dflkrb9JsJNfUe3d6F/dmLPTymnxXJfM9wrdEndbBMoP3LC
 e2Qg==
X-Gm-Message-State: AOAM531enlZvaKk8WPbDzm779WTO3JRLLdMQgKzclnqmtaINh8eJZQG1
 ZnuQPIGRUHTjCZQ8V1yZMZk=
X-Google-Smtp-Source: ABdhPJyhqXRR6L5iPjlJy84F/JJ9ouoYwQ3pgClwPtPCzqX3Ce9742XSqFnuYdjXcMF2edgJm2bXlA==
X-Received: by 2002:adf:a2c4:: with SMTP id t4mr21433926wra.296.1633433865218; 
 Tue, 05 Oct 2021 04:37:45 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c5sm1739912wml.9.2021.10.05.04.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:37:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: Deploying new iterator interface for dma-buf
Date: Tue,  5 Oct 2021 13:37:14 +0200
Message-Id: <20211005113742.1101-1-christian.koenig@amd.com>
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

a few more bug fixes, looks like the more selftests I add the more odies I find.

Assuming the CI tests now pass I will start pushing patches I've already got an rb for to drm-misc-next.

Please review and/or comment,
Christian.


