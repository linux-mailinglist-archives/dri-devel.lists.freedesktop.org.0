Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57160377DA9
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 10:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82F86E415;
	Mon, 10 May 2021 08:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5CD89ED6
 for <dri-devel@lists.freedesktop.org>; Sun,  9 May 2021 15:39:10 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 cl24-20020a17090af698b0290157efd14899so8885191pjb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 09 May 2021 08:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fex-emu.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oj0cxtHt4k2QsOXZJ1mqPuS+LtZjL33yvcuTzOU4i9s=;
 b=iPAkYy0A4N8s4fD0pZoq7FzyT0D+8DjZXwCk6RYtKFLK7vSjHvVnOIk+ObDRKyOj50
 tSp4hbp0MFDRo4U5V5RjC0lJEhqmUhidM34nw1H7TTDHJR3lsbgzdrb86iUWYsekbGoA
 IjlqnNTtyNj3z2m3qndB7GPdKpB6Uirek398l58yxQdH667l3ySPwwKs+ER37NXLZtqC
 f2Xyzakp4dd+55nb7onMffwEfH1/NxuCWefIj3hJ+u6HLcVBWxZKEuHI+/5txKXomSz4
 wo3ORaUiHQ/DnKM8g+YJfNB0mQx3KRG9yKYxbgcP3Z4l2e75E5edYfzZyz6SyM8G5RmA
 Pj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oj0cxtHt4k2QsOXZJ1mqPuS+LtZjL33yvcuTzOU4i9s=;
 b=VArimUSPk07bAvXf+Xs+mkDFeNZIYOPNGYhNdHJFCQm2P/r2aRTEq7+omBurhk+QW0
 4f/M3CljLKXbyvT2IgSGgt3CET1FIsMUGXGgmpD4F4Mcc1RlHgssc9ZHqAi/IZB9BIc6
 o1TWX69+wnligH4K/0wrcBm0NZRLWJhDiHoJzRbAhLLN5HDhECN+M9xp7f4w8gLRbUbd
 BSPUZb9XUwVmacyddP75px6yasFSI/yPfEMaCRTsAF62LN4qBGdMRunJWwINfk+L9Usb
 NETRRKrAOsfGSsmXtHnnD7glURHoSGiS1V0FQxTq519QjoSlIbOVkMqDH4O7JeM9WY4o
 5nqQ==
X-Gm-Message-State: AOAM532Fge/Jxw18y9fXLDMWXeu3F5HFCF3SP50JHgynl/iT2a9cgzZU
 hMIxAidHe9YXsYo3PSfHOnyWNg==
X-Google-Smtp-Source: ABdhPJzuLvXgVXIw+/LHFTPK/5u6YP6h1gj2+taNgTrrzE8i9b7+EhMUEJXEeJqGgSCKFtZKjzuPGg==
X-Received: by 2002:a17:902:7c94:b029:e6:e1d7:62b7 with SMTP id
 y20-20020a1709027c94b02900e6e1d762b7mr20240359pll.29.1620574750226; 
 Sun, 09 May 2021 08:39:10 -0700 (PDT)
Received: from localhost.localdomain
 (76-242-91-105.lightspeed.sntcca.sbcglobal.net. [76.242.91.105])
 by smtp.gmail.com with ESMTPSA id x27sm9505403pfo.216.2021.05.09.08.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 08:39:09 -0700 (PDT)
From: houdek.ryan@fex-emu.org
X-Google-Original-From: Houdek.Ryan@fex-emu.org
To: robdclark@gmail.com
Subject: Tested
Date: Sun,  9 May 2021 08:38:42 -0700
Message-Id: <20210509153842.124974-1-Houdek.Ryan@fex-emu.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210508195641.397198-3-robdclark@gmail.com>
References: <20210508195641.397198-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 May 2021 08:04:24 +0000
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
Cc: robdclark@chromium.org, Ryan Houdek <Houdek.Ryan@fex-emu.org>,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, yaohongbo@huawei.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, sean@poorly.run, miaoqinglang@huawei.com,
 abhinavk@codeaurora.org, kalyan_t@codeaurora.org,
 freedreno@lists.freedesktop.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have tested this on my end and it resolves the 120hz problem.

Tested-By: Ryan Houdek <Houdek.Ryan@fex-emu.org>
