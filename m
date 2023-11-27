Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48E67FA3A2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 15:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD0F10E2C4;
	Mon, 27 Nov 2023 14:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F5A10E2C6;
 Mon, 27 Nov 2023 14:54:41 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-543c3756521so5899110a12.2; 
 Mon, 27 Nov 2023 06:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701096879; x=1701701679; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=vKtyx+UMuR8/33vOi2Ysy2TZL9FV3DMoqu+lFty52DE=;
 b=caxmRnv/CiYs4Zx3uQIauydLDFAtqK/JRxb8QkoaXzoF92O4p3W1KqBvScMqxSg1MB
 n5hZZRvUNFOlySrnI27WmEGe+Eg4CQTft+b0449ZT9/m8uQxh5iyzMYwMrvzg8KLVha/
 lbf5HmymaiWKxFkDG3b5yyijJsQwTrN09OXWd1TaYjsMafn6aAQRlEFEeg1zk66JDhmk
 aRqI6xVmqKZdkbJipz1h+XCYUcIK789oR+OU/aCmteVIqkZ6A8C0N9T7seo3qNAdPPz3
 uRTQ8FmdQaxvz1xqNQBy2JLotm4QNcZH4svqKle2xtXqNdn5V64m7tvJlfha3I36uE9i
 KuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701096879; x=1701701679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vKtyx+UMuR8/33vOi2Ysy2TZL9FV3DMoqu+lFty52DE=;
 b=crEetndLmye0+ZeMHuKBQIGyqiNqVMPdF4BDVWFAhoCJaBwjtrqJOCR3lKQTzz4mDZ
 hhJy4fQbq4e+8EVGGOuRiP8OxP424B+sHxarzPThzqk7IBW9Z7FPKiP2LrRg0oN7cKVa
 ckiqNjhd92FImccJ4s0LcmX4KE+vn5M04u8gLX5a2gKb0HSdrag9MzCTJbK7DFvUT8QT
 T38nktrfyRPCUxGGiSeqcSNoPDaFWh44F+9ChxCmyHTJDK1CP/LPtw6lvaLXotJUMhdq
 nXBL8a720Gd5X/1bPgIwZF1+bynwHGvyXcPvcbIZn5ot5hpNk2X7tb6niad1y9lB2DR3
 pbww==
X-Gm-Message-State: AOJu0YyH81jO2Xda7c319FkOqL3FO99AAn/x3u7be+NEEYoxtXoX8I2W
 KvNmDmoUWaDBNH1crtNaGpY=
X-Google-Smtp-Source: AGHT+IHVEZfCfaD/cpM2uQc6CXbmyZRdVVIlu3vcaSF26lgLfvjs55eOZX8pqw2IBlAtYb9Lq5pZtA==
X-Received: by 2002:a17:906:130a:b0:a0e:e58:42fb with SMTP id
 w10-20020a170906130a00b00a0e0e5842fbmr3415840ejb.14.1701096879392; 
 Mon, 27 Nov 2023 06:54:39 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:158f:ed00:5d13:a893:4139:6a08])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a170906074d00b00a0c3b122a1esm2888763ejb.63.2023.11.27.06.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 06:54:38 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: jani.nikula@linux.intel.com, kherbst@redhat.com, dakr@redhat.com,
 zackr@vmware.com, marek.olsak@amd.com,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: TTM improvement and amdgpu fix
Date: Mon, 27 Nov 2023 15:54:35 +0100
Message-Id: <20231127145437.15060-1-christian.koenig@amd.com>
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

TTM has a feature which allows to specify placements for normal operation as well as when all domains are "busy" and don't have free space.

Not very widely used since it was a bit inflexible and required making multiple placement lists. Replace the multiple lists with flags and start to use this in amdgpu as well.

As future improvement we should probably re-work was "busy" means for a domain as well.

Please comment and/or test.

Thanks,
Christian.


