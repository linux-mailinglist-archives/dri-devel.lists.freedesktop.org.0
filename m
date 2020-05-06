Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D923F1C69AF
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309986E4AE;
	Wed,  6 May 2020 07:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E8E89C19
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 06:31:42 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id t7so92881plr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 23:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7EFV875GnuITuP+XzUmtUAo5f3YwSiu3ifjVfUUNcrU=;
 b=n2nTfqPYxIVoXKD3mc06paVUcywQOX0ADMpLQVYE+GGEw5xsQxsQjPH1ctWwfCiRZY
 kAklE2EjIopxFBCSaissFj2+vlJCL7lD0MwGYSQtshKxmB65eaCZhlCbD/FAsB1eyasZ
 jS/ydK8TIUifxZzKjF/d1aZTzADHRTgXL7Zip69HA011K/yVmEvhU86TAOOvR7dT2SzH
 Txdv9qsVayFigM9XlaycxYzBbdNlqrlTRC51qFd6y6JXsAyrRXyc6FCeGzhytxd8a7Ax
 Wm9JGgLg+g+RfGpXcQG6Wf3jLap2L7yqy5iB3VUWCrH3LtZEQWs/JrEJeNbvKdQZjj+s
 ZvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7EFV875GnuITuP+XzUmtUAo5f3YwSiu3ifjVfUUNcrU=;
 b=h813/+lciP5/dETrpwJcBNqV57+MLizyBxUIrluaQJXpFHocpP8NJx2f5L4TirU+XD
 DW4oPqWJ0jSVh9LcqEfTSIfGbTtP5AX3hPUjsWLUIZgHS048OSx9PArEF8LBYelkkBVl
 lMYuR4NRKuPFVubt/n/iC6V0xvLi8xev8CPNruKmDv06cJfyOiQ/TAnRZ2kGq+enhesp
 Mx0SxD/4M67YqvADVV6SQixpetnwj1to/ZjDscuPPmMK20RNlftrxnfp3grJkxiE4TrB
 wLjlur9SbBTmofjVEXOimQCMXUzycL2DRZzKsRQnOCNHSuZDMGBXDOCcKs0Yvwwd8fvw
 xIGQ==
X-Gm-Message-State: AGi0PuaBXNhHkZcR/VlAMskglbsnwmLb00Y2HzuM7XrbIS+A+lqaJXlt
 6MtAmkH49saq72zlRqt83lc=
X-Google-Smtp-Source: APiQypIs4vmTcejtmiLefN/58enAnNgmJepQ+lo0qddyiq9LmzDZOjHbgxlJtFfDmaHTLItnhVxXBg==
X-Received: by 2002:a17:902:fe14:: with SMTP id
 g20mr6596435plj.330.1588746701893; 
 Tue, 05 May 2020 23:31:41 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id y3sm3771975pjb.41.2020.05.05.23.31.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 23:31:41 -0700 (PDT)
From: dillon.minfei@gmail.com
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org
Subject: [PATCH 2/4] dt-bindings: display: Add ilitek-9341 binding
Date: Wed,  6 May 2020 14:31:32 +0800
Message-Id: <1588746693-31078-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 06 May 2020 07:02:40 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Add document for ilitek 9341 binding to stm32f429-disco board
some hardware resource can be found here,
https://www.st.com/zh/evaluation-tools/32f429idiscovery.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
