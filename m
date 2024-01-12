Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3029282C008
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 13:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7DB10EADF;
	Fri, 12 Jan 2024 12:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B880F10EADF;
 Fri, 12 Jan 2024 12:52:03 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55783b7b47aso6653417a12.0; 
 Fri, 12 Jan 2024 04:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705063922; x=1705668722; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=+sPKYiwjeusGEFOnn/mGfYmsok0eRyUbkI90h5/qLXg=;
 b=fXJuiMI4DlKUNmwasYc8u+3CXJcok1BCcZuPI9Q2NjJiLU+7nDqLBqdKwlxKMhm1co
 F0SjBAueA7+SzrC3K8A+UXv7hDk7ucQ1V1mX7TJpNaAAJQeXoR/sNumDfA2Engl7YLER
 ySYFEmxAzCm0L/58Jd4beHoFaLruxDJYJdkl7YaukxVIcTKf6KftX+CbaVlA1dNx4Exf
 h03MHnlcKX5Ng3tQ0Izsngosl3UoPWrDUDuc6YPqOpQzDbtL6jwP8gExp6XOPG2cvKRt
 Ipn93d5Pn8Ujfgi7SEPtd/m30rX82NhQsXGZ4fP6kAISfGOCayQoBAAf6U+mdDTYoijs
 gkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705063922; x=1705668722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+sPKYiwjeusGEFOnn/mGfYmsok0eRyUbkI90h5/qLXg=;
 b=XJBdK7IQGAal+IOGRMTN+zE1QIqGmRwgqPLh47yDhnHAolpHq0VeOp456iX/kneLsn
 R2n3FKOlnHoHtuEkzea+XlFQagzZiPIAaM/mNzDcMiWqVj8rrKrorfy4zX7X3pOHpXrL
 LoChrs0xL476gTqJOUYU0I6gITOFt+YZo8C7YVjucfZNYF1bFSBdIcjuauJE05/h5hEl
 VFggE1molM6P20bRljIqNOQXjVDUJn7J0pb+6WEhSGhJmOzvDiswsTBy9vXT67PK6tBk
 UVJZNo5O8a/NsHSIczNW2NfkUlAs8D0vvdfk+vQhFJK8VP7xlU2nZbemTPJqQ2hz275s
 Bk0A==
X-Gm-Message-State: AOJu0Yym890BmhBLowOSRdZBJnD51RhT9eNYj8HF/6enUhAKQeJw4a+2
 sR7DD6TbcFuKmBT+H5TM8PBibpM3qLoGMg==
X-Google-Smtp-Source: AGHT+IEjEAwsSFN2y+GjzEbopjsKTHYYaYd/1KoxoPfq0R/D/tlJNKIo4Hgzrs0UdBLPTg/gXqa6uQ==
X-Received: by 2002:a05:6402:3182:b0:557:bee6:4dac with SMTP id
 di2-20020a056402318200b00557bee64dacmr527166edb.27.1705063921870; 
 Fri, 12 Jan 2024 04:52:01 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:5d00:a6e1:95b5:7596:5333])
 by smtp.gmail.com with ESMTPSA id
 y10-20020aa7ccca000000b005572a1159b9sm1752427edt.22.2024.01.12.04.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 04:52:00 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com, nouveau@lists.freedesktop.org,
 jani.nikula@linux.intel.com, kherbst@redhat.com, lyude@redhat.com,
 zackr@vmware.com, michel.daenzer@mailbox.org
Subject: Rework TTMs busy handling
Date: Fri, 12 Jan 2024 13:51:53 +0100
Message-Id: <20240112125158.2748-1-christian.koenig@amd.com>
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

same as the last time. Things I've changed:

Implemented the requirements from Zack to correctly fill in the busy
placements for VMWGFX.

Renamed the placement flags to desired and fallback as suggested by
Michel.

Rebased on drm-tip instead of drm-misc-next and fixed XE as well.

Please review and comment,
Christian.


