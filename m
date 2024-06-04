Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29088FB866
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1CF10E0CF;
	Tue,  4 Jun 2024 16:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V/cov/ho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7ACD10E025;
 Tue,  4 Jun 2024 16:05:09 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2e6f2534e41so51939521fa.0; 
 Tue, 04 Jun 2024 09:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717517107; x=1718121907; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RoxlcNM4x2p5AhsoAowVa80jz+ZgS6tHXDagcOVkm70=;
 b=V/cov/hoq/nf5f0JYB2UZsunWP7PAQfBoA3BkmJgUeVX/+3V2E1Yt1norAqUeGNjKW
 CoyWlcUOX3QiAQD+gKK4gGB0SvyhB9JlIrHupx0SFoBRR0uuojr7+qPiPIm0jo/nnySn
 9XK8mDnzbZ+bKhP0qJl/flYoPRs/FK46T0rWZYu6HG8NdPc7Fze1X2R8Ff5VMB85LSxE
 iMch3aYELAnptaFgOLZiRFusMkE6E4Ty0g0feUsgxxtv4i5p4Ht827Eq1xUpT+6jLquF
 XLo1AH8k1FfmNyALaJDyzAroaIinhl/gwxfSA8svG7Z7lniDTOxK5zbecXDCrlQ7uugY
 Zw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717517107; x=1718121907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RoxlcNM4x2p5AhsoAowVa80jz+ZgS6tHXDagcOVkm70=;
 b=nH1c5MOfjLfMWV9+o3RyxXqbAGokd1pc2bLWhnyBpOfZ2xNzeR1V9/rFpI2VLGoTuN
 utUk2uCtGrWml7A4mA3t/c0WKq17vmim26y8QDfrYdnS+2EdXVd4F592SrmE9apSyLUQ
 qhqO+bcOv52Lp1uF4+eikEa4+8tDGOtWt2zRpQfDAHbM6oQO7+VRYfQ8+4cGkEwAiKzU
 EhCs5KserrNHjPHn8A2zsTFOUKM1hFTgtHq2O1V/zwOD+rVAgm903pPFDr3KJ9DFsMIl
 Uml5NFwbV0etgodrcPdkuwnx8+5kubVMDK3vPUqjpl9czXlesSNuhLl3lLFdAZW8vZte
 9SfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKGEZop2+whXqNjFfL5ImMUqUcdCIYGtX1okYOQRBrF9oQiDxXaq8V72TZHFFAyDNNfGnkytsh5nFYtp6ociN6anPjfBkY3poYvOMO7w==
X-Gm-Message-State: AOJu0YzRTDE5us0J9cRBQmcZp65S0iVBdIZLiE3tGKv2ILPaXOfbQjL0
 GAD78ctk1V0xDtuUqt8QyrddIvkDunTzQpBoLQzIalzCAIMihgK/
X-Google-Smtp-Source: AGHT+IFHBjnzmn4BH8qQ6MshYf37nnENsweYiRkq0p5dDj+rZUpqc7Ei84q4iBUnkg9NYqIS/O+91w==
X-Received: by 2002:a05:651c:14c:b0:2ea:8125:604 with SMTP id
 38308e7fff4ca-2ea950af013mr87679751fa.4.1717517107283; 
 Tue, 04 Jun 2024 09:05:07 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157b:4500:3a1f:103c:c5a9:7f90])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e7e07d7besm2388082f8f.18.2024.06.04.09.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 09:05:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tursulin@ursulin.net,
	friedrich.vock@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: Rate limit improvements for TTM
Date: Tue,  4 Jun 2024 18:04:57 +0200
Message-Id: <20240604160503.43359-1-christian.koenig@amd.com>
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

as already discussed on the mailing list Tvrtko and Friedrich stumbled
over a bunch of problems with the memory management. Especially that
move rate limit didn't seemed to work for VRAM|GTT BOs and causing bunch
of additional and unecessary overhead during CS.

This (not well tested) patch set tries to address some of those issues.
Especially patch #3 seems to fix some issues on APUs for the recently
introduced resume functionality.

I still need to do some more testing why the rate limit doesn't have the
desired effect sometimes.

Regards,
Christian.


