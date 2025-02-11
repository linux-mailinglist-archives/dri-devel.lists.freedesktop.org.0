Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5523A31168
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 17:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB1E10E285;
	Tue, 11 Feb 2025 16:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B8Mx8MDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1424E10E285
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 16:31:14 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5de63846e56so6311828a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 08:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739291472; x=1739896272; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=ieNG5550teoOm9evurNGAIt7IDUR7q2jLsMj9bSrcqg=;
 b=B8Mx8MDVyYfnz361hdEiqh9M0NN0lFAxCJxZXMzuQLHYIHfy+UhsAOabYOBDPl3Kn9
 p2oV3ibM/HWQsQbdsIW3rtccKDmb7jRljSSomYnGAgyPVAZRf1iiqEydHOAL1oK8tlE6
 AusO5D0SVUHlTriEG4UIzgHjFO1zTx4kFqbDnbUut3dHMj5wWKZD5CJxvBnvP2xBdSzX
 wMexoQMZ2iU95yi3hJyxOTDRkiYjqmqX19Dzthan/lcGDbddZ9D+BytwwJ27DJDchuga
 vrJuV8exStbWj1E9OzJnYUC3UaymkZTSqH1e97fQIO/p/afHQZoLRdPWmaVjRMQ2WdT3
 fkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739291472; x=1739896272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ieNG5550teoOm9evurNGAIt7IDUR7q2jLsMj9bSrcqg=;
 b=bG8GDvzcs+QdsDofGULP1SBtIvDBLyspVZO5n6VPhVmEVqpV1eWr8xoMTAYBsdDYSu
 GJV37PHkbmR6KrFQcqMklY8gzv43BnhFSDf2QWo0Qau5xfSqKveBPViVtDkpZ79z1z0i
 2oiD6JPtvDzC79PqOXakkvK8/BjGhanG058fDzYqzUGbalY2jD/EFeaTRei1RKlrMq5R
 pnyqELcsuzGbVyBMZ7vKPzMxSby/zl6kv+nbMd2FC82AdQIXo/NjrEtqdY67WmMD+7vB
 m9E4tkJcCKrB2bAVqcpACmRkBcFndDnANC+ByJUM68ZxakDWt/RvoZjW19w83fPn0l8s
 l+Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFuYSLaUQxUFn8ElOIzHYq2KidnXEdClVGM40Y1HEJFnrxiS9v1pJfcUlLgQn8py2hwmh4QM7ncQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhI/LCMqNIW9/LwFJFuop0tiLBiiYOKvh6Ys4K5/iA2OgGqLDG
 8Qd15VvKIfN/DPRnPAbk5zQU6PHbGIo52bOdusjgAZp0Nxsd1Xg1
X-Gm-Gg: ASbGnct+AoC0LUuuHSXYOGK9njKarc+5t6FPdSMRzG4ADAnMYRwSx3IdZc3WlW/Buol
 tQnTjGyripWR9Ri+AE7f4u8XjnS0nU0jjK0CPlJ3S4SoUspMpFKxU7CoeMaN1Ywug2SVK4E52Tw
 ipVFYwBTdHp4aglnib0GMw0dTZ8bvj3f/P5i/uM17nXAChagAQ4T0FX1dJrMCcQipjK8iMZztqg
 FwAPIKIYv+iUB6VdwXxM2fU4+LyfzcWUsHyH8rBRlgzY+p+Z75b5Q63YUht9P/FE+8Li0qA/0X3
 OMII/+y3BwYJyy22CSUbVc+7EwEV
X-Google-Smtp-Source: AGHT+IF9zaAspOwQiSxv/7z5dzkqUR9J5A7ZqS/A+KKeBOQJtea2s4MufoRyeVuFVl7aKnQW5m4ZTQ==
X-Received: by 2002:a05:6402:2381:b0:5dc:1273:63fd with SMTP id
 4fb4d7f45d1cf-5de9a4646eamr3656406a12.20.1739291472100; 
 Tue, 11 Feb 2025 08:31:12 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154a:1300:5b91:7670:e404:c65a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b7ade9sm9838748a12.25.2025.02.11.08.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 08:31:11 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 dmitry.osipenko@collabora.com, tvrtko.ursulin@igalia.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Bunch of DMA-buf cleanup patches
Date: Tue, 11 Feb 2025 17:31:05 +0100
Message-Id: <20250211163109.12200-1-christian.koenig@amd.com>
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

just a few DMA-buf cleanup patches. The first one is fixing an incorrect
documentation which has annoyed me for quite a while.

The rest basically just removes stuff we no longer need or which was
just added as abstraction which was never used.

Please review and/or voice objection if some of that is till needed for
something.

Regards,
Christian.


