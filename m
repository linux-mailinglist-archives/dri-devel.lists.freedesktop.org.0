Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2395E841307
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 20:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0F310F6F5;
	Mon, 29 Jan 2024 19:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78AF210F6F5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 19:05:41 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1d8dd580f3dso5264185ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 11:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1706555081; x=1707159881;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=moj8tXtwiFcyiDnu4CMji7ojQuIo+hVa0MEarQMWg9s=;
 b=he4gfy0gyVS5imYm2WxxKQY5MDoyrYjKhpsOx+qR6QbtUCdMz/OkwDIn4vUKHIewB6
 BFoOCS5LqB/9rCxfXIVmwdqlnB2vOhSsAl+z9xkxxK93V9xnQ8w55dVzQwGL6qwOKU80
 sNGrmHJOx20qVyTLllFB2T/Yfw3MXRbvHNO3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706555081; x=1707159881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=moj8tXtwiFcyiDnu4CMji7ojQuIo+hVa0MEarQMWg9s=;
 b=T0VkRnCvCsxOdNE269yt4Bqb7rQ+zm7BSOCNiR4zo1xOg8HOWjPO/iQ6E5SYdAwn5p
 dWpJO8AHXZnP2V0ypz+cAqrHakjeZoprTvBHLW4dFSquDAsTcKHghhAf1WDDPS3VN2yL
 Vyc1vg6IAE2qWf5NUEdCRg32HocQTCyZmYeuc+TLBYuf2Lvy9AiPVJNRBpBqPdQbR0Bq
 gGffPe1rVOB6rbVljKMLWDH3vNrvmY1djFWy/uLgp+7LqoJYwDMSXx5L2ApfesfQIvPp
 RRHlcZ74VORvrjm7D+V2SgWBTgdulipt9spPwYpD/5LyLPIu9USQfF6Wt3G7L4v1Evqx
 sOQA==
X-Gm-Message-State: AOJu0Yx0fvJxjz6ZX4mFc/zQ2oTeDgRQgO0vpinq1IJVtN4YNGERfBjn
 51LseBF2oQrERZnJD3xaH5eWga/zLVAAaSmbLxyVSMaHUWI52+9SP4B3kVxSQw==
X-Google-Smtp-Source: AGHT+IEHX9b0rlWIEawmt0qzSPwT5qyGTOStF72zqx4wtg5MlQwPlST2xpWZXXrCmqoo9O8YiGS7yg==
X-Received: by 2002:a17:902:e549:b0:1d8:fae3:21ea with SMTP id
 n9-20020a170902e54900b001d8fae321eamr1202115plf.61.1706555081067; 
 Mon, 29 Jan 2024 11:04:41 -0800 (PST)
Received: from localhost ([173.205.42.30]) by smtp.gmail.com with ESMTPSA id
 n10-20020a170902968a00b001d71729ec9csm5679406plp.188.2024.01.29.11.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 11:04:40 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: zack.rusin@broadcom.com
Subject: Re: [PATCH 0/5] drm/vmwgfx: Various kms related fixes
Date: Mon, 29 Jan 2024 13:04:42 -0600
Message-Id: <20240129190443.17345-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240126200804.732454-1-zack.rusin@broadcom.com>
References: <20240126200804.732454-1-zack.rusin@broadcom.com>
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
Cc: Ian Forbes <ian.forbes@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM.

Reviewed-by: Ian Forbes <ian.forbes@broadcom.com>

