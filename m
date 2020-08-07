Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAD523EE4A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 15:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01156E9E7;
	Fri,  7 Aug 2020 13:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6986E9E7;
 Fri,  7 Aug 2020 13:37:02 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r2so1702574wrs.8;
 Fri, 07 Aug 2020 06:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rox1xDaHqeLFe+gN0pc5zVRxJLvYZNTbM46yT38dB4g=;
 b=JM86ub7ONRDreDT8vPEgJxHq9AIxYi8EyOjPLQTEuF9NEkzX7A+R9zi8ZbsYA1FRO4
 btZzgtnwgDkIVElYoGn1biVgPDHL8OAEaHZ7CvGfORiS811XsvyVluJJ5goun3CGTiya
 5p2gHDoTed8RhF1TM+p2QLTSKmDMZbcH+EFx71OfpvdVykAa8A2HTS5tgNJV/Wfff4I4
 VuSmUExazZhnLONYuhgRNUSJre9LivIcHCT2t2Q58Dzi3bsumXDpwVOyLbBJ2kqTAH7g
 OjzE++n6dKZSz5T9hzSQDMVmQZ3k05TEKXKYGi3qpflg/D8s3oOj3tZWPm9pt8GJxBlH
 s4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rox1xDaHqeLFe+gN0pc5zVRxJLvYZNTbM46yT38dB4g=;
 b=rbMYsd5bdrli5l+IP+wvCNofsux6ZQR9k1lz5uB8eI0cySeiseEa2hRgycjlUfPkuX
 a6qOsJlYXB7aqKizAbqqTe6eSaVrwJSZfhFjtaufGDOx/2OZA4QFnHk5j+waopeGdQiH
 h1LlKinoTMrvRMjBQnlIM0dOJ3TudRhcy0PTythL0uD5+gkLRXOtJZUIxNZrQjnCeGPB
 rVtzJuNMKMWjzKLSvojYmyz+gZ7qxQgt4R96KFV9BeSpft6K9RC8foAHQt1ZTq3guIj8
 0A8fKl9RCNAC+4qWVmtVMGS/IxOkhxKkrWJh7YBiR7AnaAZF0lG8V67IAPELfaJ/Z9J/
 vXcA==
X-Gm-Message-State: AOAM533Xh/SyQom2UiUdxwakcHUi5lPAiFsWCtgsPC1tbDEXJ+Yl1FTo
 aOci2wWcM2FKJ3PuQmQbHomYZivv
X-Google-Smtp-Source: ABdhPJyULErq7nubgGIzjN71SVBfJWwLKzZf4O+DlRc4zCsgkKgKr97X+yeNhVZggqq/3+Qemwuzsw==
X-Received: by 2002:adf:ec45:: with SMTP id w5mr12346016wrn.415.1596807421085; 
 Fri, 07 Aug 2020 06:37:01 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8a1:e63e:700c:859e])
 by smtp.gmail.com with ESMTPSA id k126sm11084609wme.17.2020.08.07.06.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 06:37:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: RFC: How to adjust the trace pid?
Date: Fri,  7 Aug 2020 15:36:57 +0200
Message-Id: <20200807133658.1866-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch, Shashank.Sharma@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everybody,

in amdgpu we got the following issue which I'm seeking advise how to cleanly handle it.

We have a bunch of trace points which are related to the VM subsystem and executed in either a work item, kthread or foreign process context.

Now tracing the pid of the context which we are executing in is not really that useful, so I'm wondering if we could just overwrite the pid recorded in the trace entry?

The following patch does exactly that for the vm_grab_id() trace point, but I'm not 100% sure if that is legal or not.

Any ideas? Comments?

Thanks,
Christian.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
