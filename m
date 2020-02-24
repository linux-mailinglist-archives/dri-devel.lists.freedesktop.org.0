Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBE716BC39
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05906EA19;
	Tue, 25 Feb 2020 08:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC3A8925D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:01:59 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id q39so415522pjc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 15:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:reply-to:mime-version
 :content-transfer-encoding;
 bh=QAUGQMIJ2qSRTcV+i7q+vyYeYMkFDqt+LKQQRfkSlZA=;
 b=a6X/eOwT2WfIukWiIUwJcpuaTNpJkoFYvi/jMvOD3uks0wK+MqOKOamePbqRSljGfO
 oWd6+ZkCg+RX4zyh/n7kBrQN12B6sWjLWy6eUBnFa18bnTS4m9rc3MBQCOR2T67sVVA/
 V2E+DSMITzZGA+QVzuxl2/29e33Dyb6osPKublobpPoCYEg/I5cau6UcS8RXXck38zKM
 KaDc+ua1A2e2c7VFG17rf4Vb4Wg3SCiZ52nclx2eDdanmP6OwgKwvkFxNUmYrsYKMdJ0
 FKEfwS50d6HY9O9wL4FCnEThQ4HL0LTLdzpapts1XySu/Gy0fxVt624WnZdA3aFBT3h9
 EKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:reply-to
 :mime-version:content-transfer-encoding;
 bh=QAUGQMIJ2qSRTcV+i7q+vyYeYMkFDqt+LKQQRfkSlZA=;
 b=N8Hc+vzvfyXNGrS1Z1zutYHI3hq1WgFd/bkopZbmB2EsbI2/kzhnOM0R7ophdiU3os
 hJH4uTYw9oxXurqBvilAB2MJu8QCoPvPElRpjxXTCgmpg3mfNiOcAqQON01h65u3Hmdp
 bYGdo5uTjrcFtdS99snGCX9wxp/eMgLtwcSd26FMXAFLqG/xvsuu9P22lXPCGL61Ur9t
 KFy6U0H3453RwdKMK+UIY96DKKBrMJP3+6frTPHyVAFW592F07XtIB4Dr0Gquy4zBV4X
 rUr2/p8G+pqKrE5/1K0H5bjrVIwBwgZ1Nl2++M1/DocaSstVQiix0fBfQxVPnmGCArCZ
 mbbw==
X-Gm-Message-State: APjAAAVqvmRvwm+/XuVo2ZZpAPVbMdDqneRgAQjdtBmt35PRXagAerEJ
 4ImfWXKJpscEB3uAOW+SwJP7h2LC
X-Google-Smtp-Source: APXvYqyoIM+wBvgSfkF3THv88L/NF62HKh9uGAE3um3ShqUeE9wjJWF35MUxxkr6grd5EJacpEVkJw==
X-Received: by 2002:a17:90a:fa8d:: with SMTP id
 cu13mr1577852pjb.68.1582585318315; 
 Mon, 24 Feb 2020 15:01:58 -0800 (PST)
Received: from paxos.mtv.corp.google.com
 ([2620:15c:202:201:31a4:f84f:da5f:97b4])
 by smtp.gmail.com with ESMTPSA id h7sm14640995pfq.36.2020.02.24.15.01.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 15:01:57 -0800 (PST)
From: Lepton Wu <ytht.net@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: RFC: drm/virtio: Dummy virtio GPU
Date: Mon, 24 Feb 2020 15:01:54 -0800
Message-Id: <20200224230155.120894-1-ytht.net@gmail.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Reply-To: Lepton Wu <ytht.net@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I'd like to get comments on this before I polish it. This is a 
simple way to get something similar with vkms but it heavily reuse
the code provided by virtio-gpu. Please feel free to give me any
feedbacks or comments.

Thanks!


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
