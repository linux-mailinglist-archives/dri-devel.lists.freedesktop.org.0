Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75C19AE52F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 14:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E013B10E92A;
	Thu, 24 Oct 2024 12:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jd2ECHuZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C52210E92A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 12:42:06 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a99fa009adcso54467466b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 05:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729773724; x=1730378524; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=y3NK5f7I3T0kVap6zRG0XmzzEF76zGfHonnvdBs/CS8=;
 b=jd2ECHuZAO9I8YXna3r3j/q0SPYWjKeg+bS0BDdwYKFts7sgzmcdjTxOPu186nh4ZF
 OxVRGaw4PqGPxxAqSQmPPa2KiNgtEGSKKqXThkQDFO0t7qg4KtA03ntJ0x+MnmEQouTz
 KulZ0P5b5HSgggwp7WesbG7tbCAa3wZxGYWdOYIOaAliNZRGpLArX5iwq6HJP9QePNu3
 FCkcySiOJGE5/J62gzlbSpFdVFUz13TxEL8fntZAWBqDRpXNXo6tS9pN//ZAxjmAakoY
 uUC6v4CykISGJ2+JOWtdFxsLzjCxT4lmfkf1dbsEqqyIA3nJKc/gya+8/P07dUl+QY0Q
 ryYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729773724; x=1730378524;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y3NK5f7I3T0kVap6zRG0XmzzEF76zGfHonnvdBs/CS8=;
 b=UCon5mI3+dTIkkDa5rPcejYm7jkc0/FzZERQxRw1wdgZM4Tl5CC1mZGIq3hRQZTo4T
 UYwGRKspnPE54VO32DsembYJVLBM4hkPGXDaia/p28HlHAlJLNrj5k62b+iPvEkT9rPE
 GzcpNVL84NK8VN+ye5+HpXXmKPCiLkE+H1zspjk3iepsSaH44n6lniR0bWEoGTb1tElv
 PPPSQYoOOFeLwNv6649qvTZNuKWN4FVXPGCjNIJ2S29fAWriP4+u4kzxneejvTDh1cI5
 /0ZAnToDv2kZXPWHdOS2isZn1W87sgeIWHRF5UTgV/nrWZlFBZRt2T3NN1NLB887KLi2
 6g3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFnUWf1XT51XtcGMrm2nY5m52VOXDQW2bn+8CHvy63jueMtO50r22MM9+wpbvBll1Jt/KAm6sxjYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRY+vDn2hRKiA3i3GsY3m+wFhd4pysv9GTmu1q+Ax/yj4MNhcH
 G2rIBRs+qYM3phZyVqdNcRuAs71+hxXctgo376mH6wv7lWp/qhfV
X-Google-Smtp-Source: AGHT+IGYhPceDBeo5lcWr74EsEhCqtuA1jD2BNecETU1tSRZBIpXXOXBfTqLCvZ2KaTfgEA0kZVi8A==
X-Received: by 2002:a05:6402:2b91:b0:5c7:202f:ec9b with SMTP id
 4fb4d7f45d1cf-5cb8b1c125dmr6392590a12.16.1729773723848; 
 Thu, 24 Oct 2024 05:42:03 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1550:4200:da3c:7fbc:c60c:ca4b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66a65419sm5623026a12.25.2024.10.24.05.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 05:42:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: friedrich.vock@gmx.de, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Fix Fix fence merge handling
Date: Thu, 24 Oct 2024 14:41:56 +0200
Message-Id: <20241024124159.4519-1-christian.koenig@amd.com>
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

turned out that userspace can also merge dma_fence_chain contains
which can result in really huge arrays.

Fix those merges to sort the arrays and remove the duplicates.
Additional to that start to use kvzalloc() for dma_fence_array
containers so that can handle much larger arrays if necessary.

Please review and comment,
Christian.


