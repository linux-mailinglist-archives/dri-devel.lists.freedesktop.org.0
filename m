Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F679326A5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 14:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0321210E6AF;
	Tue, 16 Jul 2024 12:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mp/5rzeM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD37D10E6AF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:35:24 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4266ea6a412so37841885e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721133323; x=1721738123; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=0kmvQUMqWCiGSNwyeo/RQEqGjC+8tqS3QLrhc9+7hFw=;
 b=Mp/5rzeM93pGGQefSIp+z9CbBGdmOILBQrlBwKydN7IgnMOKnmYiXIkt4FCcpvzcBr
 DUPCjYpukZfcfqRIA3KhA4wzD4hHoVqZ8S46qZl4u6AhMvF/FfNQppHJf45B7ATFDgpF
 4Faw+uANKTqFU6gO2eBBpO77MEdioqcUJLE7BVFkUjHASg4CJHPrao4/N4EOnF4/dRAt
 zag4PE/FJbGdXT3e+14wWAkdV+1upF8qh0MkZ1KDqsSnJ9JPkTg+SzORWNl8SEpPSmYv
 ayEw5pBKS0k0j44On5RWstMPqYN9KtMxQDkBwlttC+JYfid1H+S3tzOlFVeTaStY5wQP
 rNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721133323; x=1721738123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0kmvQUMqWCiGSNwyeo/RQEqGjC+8tqS3QLrhc9+7hFw=;
 b=QayYIbAJB2rkG0WsD4s+asNiP8dydyLiBaiavSZRd02ZsKziNK+Uoqoo5VUdm40iUz
 Vx1C99JnOcLrXIAlaq1tr5NJCLVWVAMjHcRX7hRGMNI4L+PojT6hDJMR9Cg+sSHTwQ02
 YwceF2S5Wx+j3oeLo0j/wywkn28QfegIizTURjmDYxWGZPBKRp3B5Ua12H7pPOmZRO9L
 gfdghPzZK1uJGawQ2xFdbOUmPdU3AKCPMS0gL2b1rBZasV/JnPL2qq9nFbOISb02xGoV
 Ko6AVdSjtCmP+C4LbAbGLs9IPT/VrlSyUTpIKGVndiB2SlEtMKM82U/6MHYSwqLGzbqQ
 k/4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCuA4Uw/mDCn4RYrKeisOEE+4romT6lI1FuwEyWLrtxnrtsypLCWTUCrzBF7y7XK1jrzbheuug5fTB7MgUVrpBPtStNmW03jNJCp90Aayj
X-Gm-Message-State: AOJu0YxpFOoGyhJuzx3Ukok9aCB0HCU1vlsR5kG2eJrQrikdzbPc5cQs
 nhmVEWGHkMXQPxoGVAXbN+oGUbY6HVtGJcbVijSOx9jcIEc6FYkPFSSr+XmJ
X-Google-Smtp-Source: AGHT+IHn8Ga9KPSsI8nA/kZ+8rQdadStqoSnfvB44RcMf4CHD71Y/BYzwnu1FXURjGsKxwTNrujWvw==
X-Received: by 2002:a05:600c:3486:b0:426:6a5e:73c5 with SMTP id
 5b1f17b1804b1-427ba6b1457mr12943035e9.37.1721133322257; 
 Tue, 16 Jul 2024 05:35:22 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1592:7f00:1c98:7fd3:7b80:1cc1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e77493sm127058225e9.7.2024.07.16.05.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 05:35:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Switch reference counting to GEM instead of TTM
Date: Tue, 16 Jul 2024 14:35:10 +0200
Message-Id: <20240716123519.1884-1-christian.koenig@amd.com>
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

Hello everyone,

to make use of drm_exec it is necessary to have TTM drivers actually use
the GEM reference count instead of the TTM one.

This patch set is a start to do that. It switches all uses of
ttm_bo_get/put to the GEM counterpart and then makes ttm_bo_get private
to TTM.

Netx step is to completely remove the TTM refcounting.

Please review and/or comment.

Cheers,
Christian.


