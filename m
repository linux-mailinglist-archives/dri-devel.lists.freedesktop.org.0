Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 207B931B073
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 14:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE6889ECB;
	Sun, 14 Feb 2021 13:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B3989ECB
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 13:16:18 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id o7so2729668pgl.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 05:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UOKkIESa+1l6tDO7IwKvBCYjTQ2JXj8kdAURTiXPxqk=;
 b=s2QG+peNg54RW8TjZ2ocQPwXkt+lU6accdFnZISh1sEGOZw0GIrXL54BjozEt87CEx
 6MsJ0YwKOUTh7R7BprK0jBY7hnsWf5ejM7d8jxBWPbsTELzPjBQKrH1Ka6HvMjIp/R1x
 Pzsy8ry7Zg1Kr9AjqJOwgOqB9dVrZDPq/Zgn+gfYJBC/1Ukr3BWWhrtFB+4/oSkMsdsi
 7UQEu0xfHlR2t9v0/NEVhgrEKLlAgF6znd/mWf4V8OoLdiu6omRRw9a8JF5ski2dyZd+
 2N94S4JuQCa0cVHAUQgSrkht4RaKm8FcztMT36UPTsGpjn+5+oroUMmj34JxXGhdWJQ6
 rrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UOKkIESa+1l6tDO7IwKvBCYjTQ2JXj8kdAURTiXPxqk=;
 b=U5S4Nw9GawYtlR633Pims5APpg79qW64j0yV5SnTa2OD14ZEriV7iCssS+yhnwKkMB
 fxrjzGiErXJuTaaDlcWtgC42o5kJuYe7xCVohVbf24TYFWjHBt2YxF0BkX+HzuPQKP3+
 sdGXm+5uGuOHSAmnArb6eByBBWOIrwfVuXHJSBilEkf2+XyJW0vWzPGTNZ88ytnMClyE
 0fKzgVOMeJ/GhuBb22sca4yXGyZUDhyP09JG6ycooIKZylqWjo0VWiSjB1re7Kt4tSlP
 vpMJd7PlvGLcpplq608LfgFElRRfGfubRn+iASXADhvahQ1aKDUAbkd9xCKe+UMJ6Zaw
 kxGw==
X-Gm-Message-State: AOAM532q+ZO9LR9xBWQSgsPI5w/2N1SuYgyR/+rI1Cmg9vnJAcXOT4Jw
 SfULZ10pPxjfWnP9aeZVXmrH9w==
X-Google-Smtp-Source: ABdhPJycqFS1bHAf7kwjytC57TzvGIgE2cXkwMSE5Iqx82KXRREJgJ5+AqpF5P+tR9B9sGl8KqvNyA==
X-Received: by 2002:a62:f942:0:b029:1c0:aed6:fd57 with SMTP id
 g2-20020a62f9420000b02901c0aed6fd57mr11733121pfm.70.1613308577942; 
 Sun, 14 Feb 2021 05:16:17 -0800 (PST)
Received: from ubuntu.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id c4sm15224625pfj.113.2021.02.14.05.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 05:16:17 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, thierry.reding@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: drm/panel: Add inx Himax8279d MIPI-DSI LCD panel
Date: Sun, 14 Feb 2021 21:16:12 +0800
Message-Id: <20210214131612.30491-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210208162453.7319-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20210208162453.7319-1-xiazhengqiao@huaqin.corp-partner.google.com>
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
Cc: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

	
I am sorry that I am the first time to upload codes, and I mean to 
upload codes to kernel branch v4.19, Do we have to upload the code 
to upstream/master?

	zhengqiao

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
