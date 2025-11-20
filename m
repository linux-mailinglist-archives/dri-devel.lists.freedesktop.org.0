Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1F0C74B4E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 16:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205F110E76B;
	Thu, 20 Nov 2025 15:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bqegT3Cg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676FD10E76A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 15:00:23 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-640c6577120so1670488a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 07:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763650822; x=1764255622; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2KulbU76WPY3aQSimSbq2/pFs1MWqHx/AZnO5bV++60=;
 b=bqegT3CgTqaIWEbnZ7oAxsws851LnLtURAkm1oNGvzRSEvBRbiVn2YSIGlNeLGl/go
 PkjvOVfLeGNDRA1pTQ4wpLDiSUGst2wFdkly+yqfBPBBQZJVWGgzA2g95QM1UCUiccFq
 LrkV6bl3zmYGGJ9QQiJFCgk+bAZ1kXc6Tj7qe2CAJKiPRD5EIDuZXpHZmhev3gqN7hwB
 WJ7kNRAGLc2/cUafg67TbY8I4NuRYwqqgKGFLRFa9PPqAmdfhx3JwOSPPYy52V3oB+PQ
 n/wJJWOU4LhV+dc7LzcTsFJYRAfShkWJ4DLXylmyyFUfmzIDlrCykIAuo+s03kjZPK/j
 AW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763650822; x=1764255622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2KulbU76WPY3aQSimSbq2/pFs1MWqHx/AZnO5bV++60=;
 b=egyvQM53gOaidxF8y+uH+6cfEwusnnXK5APS0uSVZkkB4PZnHMRlhIj2LqrORUJ9aG
 N74ru2lDo2YbVyOsPn7GI3SstKltLsyx1XEcLKM4vINKSDkj1yggdb5VUZJ3hyd0jFp+
 yduNU1XR6ysSQXSaRUqaB4RontyOoiUuvOTyNcrG73j/hJaT19kc/SVwp//ozMdqBXPq
 X9SXoj/EZ5ER/kr3HTklOKESdSv0DbNsRDU3bReXavpI3LCuNh6d3VB+bP0IJ5GN4nuO
 lnHjGVwGlwPLIxYPTyX7IT1ZxuymdTGY+hsErs8xR3dYunodU2EfqZnFLJGvsTuAiVAV
 ROrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYkYahOiMsxx3ewsl4lCY1XfU4qCuyKKkJdtr0Th3cj6M+tKKQXTPPpYn+4GOhsloOVvh5ca/vr0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzW7P3/jiKRXCzLKWnJ00dBDq7N1nhOeKuvHg0koC6g1aADe2WT
 i6yywv+bIWUzbnrJRlykjyIhsv5lrR2Q7qla0jPvVSqRQ7INF73b9RPop54FLg==
X-Gm-Gg: ASbGncsW2BPoHt9OzplTyaGtfUg1VzEToyLfdTrV/lHjjo1sDq22u5FwX+UiEczaCW9
 s8lp+/1kG0lzzU4xsqWXEvcctZ1s5Hw/eAMi+Cm6J4bLrtKt/YtoZPcfJAelc9lt5gAbTCZdoMH
 GcyQsRE+ntg3JQ0h71lbrKBWnQHJcv7iWl812bxehS1gHN/jiloFKOzxq+jNHgEjxbZLBg0238a
 Eg4xX7kRTbC/r6O6V9cgSEuCYOsE4zXi5Fw2NnrNNL/mw5FJT4tIYGEjY7QchxDFDXUPyO83kAP
 dhzQqeM/KRLFPDX5c7ULNOuf1c5Gc9FJw+v5qsBn50Q3YdmN0db67Rgofdk3lHKcZSTyo+/RFRz
 uNrsPNOHrO+o3CKxNQHF7X8oxcQ1MinDyEe8F+fBeujff8hyymBUG4CjY5wRogRYdgIdNPD7ilY
 DslqFhQv5gaeq7RJZgazmke8MlP2pVU81+FUc=
X-Google-Smtp-Source: AGHT+IEZsBC00q7J0sBdOY35QgfeOcewKrhPiIlzGhi9NFGIdO9JdWh4JaOQI9jpjPySO0wsJYu58Q==
X-Received: by 2002:a05:6402:40c5:b0:640:a356:e796 with SMTP id
 4fb4d7f45d1cf-6453819467cmr2516602a12.5.1763650821404; 
 Thu, 20 Nov 2025 07:00:21 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154c:c900:7aba:c4b7:a402:3cd2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6453645f2easm2205878a12.33.2025.11.20.07.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 07:00:20 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org,
	dri-devel@lists.freedesktop.org
Subject: Reasonable maximum signaling timeout for dma_fences
Date: Thu, 20 Nov 2025 15:41:06 +0100
Message-ID: <20251120150018.27385-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Hi everybody,

we have documented here https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#dma-fence-cross-driver-contract that dma_fence objects must signal in a reasonable amount of time, but at the same time note that drivers might have a different idea of what reasonable means.

Recently I realized that this is actually not a good idea. Background is that the wall clock timeout means that for example the OOM killer might actually wait for this timeout to be able to terminate a process and reclaim the memory used. And this is just an example of how general kernel features might depend on that.

Some drivers and fence implementations used 10 seconds and that raised complains by end users. So at least amdgpu recently switched to 2 second which triggered an internal discussion about it.

This patch set here now adds a define to the dma_fence header which gives 2 seconds as reasonable amount of time. SW-sync is modified to always taint the kernel (since it doesn't has a timeout), VGEM is switched over to the new define and the scheduler gets a warning and taints the kernel if a driver uses a timeout longer than that.

I have not much intention of actually committing the patches (maybe except the SW-sync one), but question is if 2 seconds are reasonable?

Regards,
Christian.

