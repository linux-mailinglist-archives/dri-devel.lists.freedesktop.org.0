Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6943D5773D9
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 05:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC8C8F159;
	Sun, 17 Jul 2022 03:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20998F152
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 03:48:07 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id r186so7836322pgr.2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 20:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Z0QE6TqiTLpNVLq0d6Tn+LJm8jdHQlIKPBhpl1b1IvI=;
 b=Hm/XZDORe8w/23YWh1ILjh5kveofdNCqQ0V7yu07TXBiadO710B4sQcFi584OFzxTg
 MbAbTUZxhED4dxph0IUuYzrgaFeGgk+qs59KYL9dU6a4gT/Amg2JYMnVB+1qPNu3XDlL
 R1CV6eXisR3zOqmF9wvS27nea+FsemZ6R9CtRQEC1ZE1UZ5Oq9V1E8Rb387rHvGuzrRw
 9f/WdSbAJJzOIdI8t7bcdfwGoHSSV3KG0XUyDKKLroc6HTzX7n2UnG5JsSj8jenqMBhN
 jVjVpUyZ5psvEY4DhPxJ1H2wqVxDINPWNUkibUyXCa1/AgSOx41fMuH/SKmrwwavgqDu
 u9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Z0QE6TqiTLpNVLq0d6Tn+LJm8jdHQlIKPBhpl1b1IvI=;
 b=kQzvv6kVlB52IWGMGeuUpwHBApcRQK4CIdEVDRJubLzZ7hmd+S/3V6gtssS7CqIxTw
 gnmoRkJNAnRtqZr6Pq+FUxDN8Bx78o8l9tI6fIO7iiZ+YPuE35nMH8b7kNUsYodWph7P
 O1nDLvsRNpR/6MyjQkkHBHcOCjuRdDRaOqzHgklWWFw5jbK1ZH/gILI/VtPqEb5KQ8b2
 QR3CK0E+iFnYl8fePC0kHOI2RzGQq2ce/y1zcC8WDsv26GbwPlone6kKngxC++zqsMw5
 MAGvLGjNC5a1Z6LabIw6nch9sCaqPocNIc9E9gUYcl9gW3jNqN9umtXxEXCm+QR4hRRz
 hJYw==
X-Gm-Message-State: AJIora9DSZ7iibM1m6aNAQK9jOYREQd0weslyIoASt2eFErsPDfaKzlX
 3XneRqLBE3C15OjHbjPPD5Kf6SOXsQbOPc9vkg==
X-Google-Smtp-Source: AGRyM1ts9KqXoDY4UHuc4G3SVfNilEGzmKzpCb1uTJFtaEWLMKAvCulqjjlSB/KMEm3RW8jR0HClTPzAZCj2jB06jKU=
X-Received: by 2002:a05:6a02:113:b0:412:a7c0:da8e with SMTP id
 bg19-20020a056a02011300b00412a7c0da8emr19808019pgb.113.1658029687199; Sat, 16
 Jul 2022 20:48:07 -0700 (PDT)
MIME-Version: 1.0
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Sun, 17 Jul 2022 11:47:56 +0800
Message-ID: <CAMhUBjn=k-4DV0-u_30_rNQc9n__ZkwVFaLwfP1CP-uk1LjMpg@mail.gmail.com>
Subject: [BUG] most: usb: Found a bug at the probe time
To: sumit.semwal@linaro.org, christian.koenig@amd.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

I found a bug in the most usb driver.

When the driver fails at

    mdev->conf = kcalloc(num_endpoints, sizeof(*mdev->conf), GFP_KERNEL);

I got the following warning message:


[   15.406256] kobject: '(null)' (ffff8881068f8000): is not
initialized, yet kobject_put() is being called.
[   15.406986] WARNING: CPU: 3 PID: 396 at lib/kobject.c:720
kobject_put+0x6e/0x1c0
[   15.410120] RIP: 0010:kobject_put+0x6e/0x1c0
[   15.410470] Code: 01 75 29 4c 89 f8 48 c1 e8 03 80 3c 28 00 74 08
4c 89 ff e8 14 2e 73 ff 49 8b 37 48 c7 c7 c0 fc de 85 4c 89 fa e8 e2
61 21 ff <0f> 0b 49 8d 5f 38 48 89 df be 04 00 00 00 e8 df 2e 73 ff b8
ff ff
[   15.416529] Call Trace:
[   15.416896]  hdm_probe+0xf3d/0x1090 [most_usb]

Since I'm not familiar with the driver, I ask for your help to solve
the warning.

regards,

Zheyu Ma
