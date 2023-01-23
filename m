Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4B1677B17
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370B410E487;
	Mon, 23 Jan 2023 12:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032FB10E1C5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:38:01 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r9so10666154wrw.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 04:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=k0SDGOj6yXybPWOXI0fMP8pl7SI76y6qCgJVOq7wd3Y=;
 b=GpXuLr1s89IbQNq8YVP7+aIEkWj2M9QCXLnURqJrGDOtNn+MiDcvF6CwMsX1JRRdFu
 gFTGtAzA624j5SspxiuoxqAM4PF+iDIQUYU47W5mDccUa0mJi/T8tEP/plPESBcr9EeM
 6llyFwmbjOMjJyFzZ4yGyUA/3W7XAnW8ZcTHfMFUw+xwbDeoKqiV9G88ZOe/a3ouVY2w
 /NLmmQSy/5TqabrQ6K/qazq0IBgnOZZgX4pnRGin+9nIGubhsSQdsl1Tl6hUeE5Nrm2O
 56fEqC2T4h1ZBwlmIBAA90LU2bSoaVSgd3AgYnU77aEVJbbMZjaj3zNA2XJTNmUgPAKm
 kQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k0SDGOj6yXybPWOXI0fMP8pl7SI76y6qCgJVOq7wd3Y=;
 b=YLj53xaPEnXNB6h/Jy3OsHqR0oV1xM7/pbD8Uq5wFYAEiyWpH5xeyYbTFMXzSedOVn
 Z3G8jIG/mxMezyXMLq+9ASsw8Ms5Tvgug1TMVSkvdGFy5AeEXjN78unN5nC4Rjk785CY
 4zCsIQkaJYrafnCbUR6PbUJX4dSoQVTNoro6cVBB8nyxG40tHDjN7IpS1jrIhGBeLIrc
 2ZpzRUs7hK6hepxLudC3iHIRo+K7K8zjl+Wo7uWlZrAn8IhtA1X7o12ntURVYhhs++l/
 E9exgki3NaJcUe2WI3j5XRU+Layn2MjQONrrkKpUnryaklthnfdUXPAlYjC8GWSjDIwF
 MP/w==
X-Gm-Message-State: AFqh2ko7oG9meJo6nSQ+d3o5qeQUNR6zYMIqcra2YGuiTBxT4rAawbvZ
 EZ0Sx/bgJjdO7SCcAmSDVto=
X-Google-Smtp-Source: AMrXdXuhWpkg1xDO4DN/sJG6IqAq8RqKHMaDkKgR7drCIolSUNpdc6T1YBCDkNoHWnR9meWkZB4XQw==
X-Received: by 2002:a05:6000:98f:b0:2be:296:3b5 with SMTP id
 by15-20020a056000098f00b002be029603b5mr23468134wrb.17.1674477480330; 
 Mon, 23 Jan 2023 04:38:00 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a5d6e83000000b00289bdda07b7sm4284510wrz.92.2023.01.23.04.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 04:37:59 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
 sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
 tfiga@chromium.org, sebastian.wick@redhat.com, hverkuil@xs4all.nl,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, benjamin.gaignard@collabora.com,
 lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
 jstultz@google.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Subject: DMA-heap driver hints
Date: Mon, 23 Jan 2023 13:37:54 +0100
Message-Id: <20230123123756.401692-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

this is just an RFC! The last time we discussed the DMA-buf coherency
problem [1] we concluded that DMA-heap first needs a better way to
communicate to userspace which heap to use for a certain device.

As far as I know userspace currently just hard codes that information
which is certainly not desirable considering that we should have this
inside the kernel as well.

So what those two patches here do is to first add some
dma_heap_create_device_link() and  dma_heap_remove_device_link()
function and then demonstrating the functionality with uvcvideo
driver.

The preferred DMA-heap is represented with a symlink in sysfs between
the device and the virtual DMA-heap device node.

What's still missing is certainly matching userspace for this since I
wanted to discuss the initial kernel approach first.

Please take a look and comment.

Thanks,
Christian.

[1] https://lore.kernel.org/all/11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com/T/


