Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6609F517006
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 15:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92BF10EA0F;
	Mon,  2 May 2022 13:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA2D10EA0F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 13:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651497001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M98yuoliII0uhmAHMZF66gc9CngyxoP5h99A2Tsi4xY=;
 b=DuM8xXOF7r0k+wJi7Q/1EKl/6MLfb8/yL9e19zOkSckNhLq/n0Ye94Rflq0wbRfDLTSJay
 6+RXTzGqDCOXqcoFtUUQYLbTNZcBlv8R+lkumsbhDE3loAkkJee1SzLaSNvS2BFDMaaD09
 ei8+DfH2xMFFfCWKhLYdJ+xZpFYXJtY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-k8AG8bxtNQqr85pKClM-wQ-1; Mon, 02 May 2022 09:10:00 -0400
X-MC-Unique: k8AG8bxtNQqr85pKClM-wQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 b10-20020adfc74a000000b0020ab029d5edso5263374wrh.18
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 06:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M98yuoliII0uhmAHMZF66gc9CngyxoP5h99A2Tsi4xY=;
 b=NZEHsoHXYSS6lUOtbdDT3RjY8LRrjYBdtbBiptDhHEgNZt3hW5bspHzdBDKowkuXOv
 L38Ik23Mw10kPro2GdIlw4OjZReg72/vj2ho+eSkXKcTo1w+MhngPI5s2+ZcHJ+khuAC
 Lq4TCOXt8/PKE0e48tnBx6QikwL9Ptlb1sxYqRmwOHKij3v+AMTgdaiPLV4ljF3R0bQc
 d3gZCTjDAe8c0apI6OBWeuC4+fgnhb7pzYg9oKFIikPdDYLVI6UB8IgTK8XRbqXer1qx
 KeaRiWoHk5ec57yA3l6QjmiYz5i9ypJXMtMb8BB6afrT++1mlMyf7ulkL6DxXC1jBFtV
 vJbA==
X-Gm-Message-State: AOAM533iD+mxFIVJfx1jacu6Ld7tZhGILiZ+SrXCAZXmfaCaO8gC6RUq
 pG3oJBsjgea9UgEfL3vToCy5lUseS8q2X8ulAeXMXo3dYsDPZUHGjz0S6RZpsGKdNtwWNx9Q/73
 osbof7D/xT7sLIyrmt+2mV7VFmJSz
X-Received: by 2002:a5d:4302:0:b0:206:4b2:8690 with SMTP id
 h2-20020a5d4302000000b0020604b28690mr9494459wrq.224.1651496999235; 
 Mon, 02 May 2022 06:09:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKVP2T2hazdS7uD0pMN5Q6bcG0ygMlmFscepv/VzzVywZGxoSQ2B+d0TgKpqI/Cu+rYnhltw==
X-Received: by 2002:a5d:4302:0:b0:206:4b2:8690 with SMTP id
 h2-20020a5d4302000000b0020604b28690mr9494444wrq.224.1651496999021; 
 Mon, 02 May 2022 06:09:59 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 y16-20020adfc7d0000000b0020adc114136sm9302081wrg.0.2022.05.02.06.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 06:09:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] fbdev: Fix a NULL pointer dereference in fb_release()
Date: Mon,  2 May 2022 15:09:42 +0200
Message-Id: <20220502130944.363776-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Helge Deller <deller@gmx.de>,
 Zheyu Ma <zheyuma97@gmail.com>, Changcheng Deng <deng.changcheng@zte.com.cn>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This small series contains fixes for two bugs I found in fbmem.c, that may
explain a bug reported in the rpi4 [0] when using simplefb and vc4 drivers.

I was not able to reproduce the mentioned bug, but looking at the code I
think that it might explain the issue.

I've tested these patches in a rpi4 with both simplefb and vc4 drivers
built-in and did not find any regression.

[0]: https://github.com/raspberrypi/linux/issues/5011

Best regards,
Javier


Javier Martinez Canillas (2):
  fbdev: Check in file_fb_info() if the fb_info was already been freed
  fbdev: Make fb_release() return -ENODEV if fbdev was unregistered

 drivers/video/fbdev/core/fbmem.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.35.1

