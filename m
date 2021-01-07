Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CBA2EEED2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 09:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8966E7E2;
	Fri,  8 Jan 2021 08:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD376E49D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 15:48:28 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id x18so3743545pln.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 07:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cUsvF0h/LF+tRZiLjS/hwsiES38Tx2dW6YMW8ai33wc=;
 b=Qa2rz7vFEIdTquyydipnsbQIhtu0hpIkDOKNOI5DAERcPyBt7KBlh0DBQwJiO9iVqR
 5F92N/iNuEYWUtkGCSq7gbeSA6cTaXUX5ZwqAJ6cH4ogwJD99PDifs7S82punPVKpb9w
 5XJVamFgGqf9MDWbXTXFrM25obB3pvVtaIZASwm8R2QO3qPXtuWLwf7o4HoeVwQPY0zz
 uvj0V0S+x+qUXdLzjqa72BjGG/JiUOb1s5BbRC85++qtTBVu4ZFcC7y3AKzQurrAwpn6
 wtX372G6j1aKq9243gNl00hSayPsVnRU9r4+iW8/9B2DJni2A4BECCAPVgq3j5Bh5Hxd
 cfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cUsvF0h/LF+tRZiLjS/hwsiES38Tx2dW6YMW8ai33wc=;
 b=q6K7PwUHFySqo+TxCbTXFmKjMHFQ3YqfXK3iVVG0RyB8LiERTS1w2+yYdSsB5qVHge
 3S2YEUckg95KC5hzYSJ0vnEGQX5VVfMgWeQQcKiQPDHo3YsnkHDnXiHTTeakupTlhxdc
 CM+ZmVoH19Ysv45CH7JvKOEYlzOh4dIQ+ojKxf6JMZh4usbTcaXc1iKJOUG2s0N6J9tl
 7O7pTPVHB/BLes/4nDsXCFdcy2Ydww67hfAzaGmXoDFa1sV2kLAXy8ubtJZQR4yFmKdA
 zDfIozZAcvyYjygaFke5GzH7ReVi82sEXx02b9a8smfuWvf8cyn/uh9/O/FOGv1P3OPb
 DLug==
X-Gm-Message-State: AOAM532boKc2ex9XyYZ9Yf5c8QAwlLVsJZNBdUTDdzisZcQCsxbL5JXA
 8L71Hir3enFqNrl6DadKz40=
X-Google-Smtp-Source: ABdhPJw27wPEmIjtXNz/1BN1cX/7Un60K0WXp+hPj067dw+Flf/AMObsFmqlLPCN+JtEfxi79iBQXA==
X-Received: by 2002:a17:90a:7a8e:: with SMTP id
 q14mr9924610pjf.200.1610034508402; 
 Thu, 07 Jan 2021 07:48:28 -0800 (PST)
Received: from localhost.localdomain
 (ec2-13-212-86-85.ap-southeast-1.compute.amazonaws.com. [13.212.86.85])
 by smtp.gmail.com with ESMTPSA id z23sm6032154pfn.202.2021.01.07.07.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 07:48:27 -0800 (PST)
From: xuhuijie <huijiexu295@gmail.com>
To: gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jirislaby@kernel.org,
 yepeilin.cs@gmail.com, b.zolnierkie@samsung.com,
 penguin-kernel@I-love.SAKURA.ne.jp, george.kennedy@oracle.com,
 natechancellor@gmail.com
Subject: [Patch] fbcon: i want fbcon soft scrollback feature come back
Date: Thu,  7 Jan 2021 23:48:01 +0800
Message-Id: <20210107154801.1997-1-huijiexu295@gmail.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Jan 2021 08:55:35 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit 50145474f6ef(fbcon: remove soft scrollback code) remove soft scrollback in
fbcon. So the shift+PageDown and shift+PageUp is missing. But PageUp is a vary important
feature when system panic or reset. I can get log by PageUp before, but now there is no
way to get. Especially on the server system, we always use bmc to control computer.
So I hope the community can add this feature back.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
