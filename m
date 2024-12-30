Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266609FE5C3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 13:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5C410E4B0;
	Mon, 30 Dec 2024 12:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xnb59LLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56AD10E4BE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 12:08:01 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30036310158so86567781fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 04:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735560420; x=1736165220; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dB9/yODLQe9+puXrprcjZ851oLTBx6bI2CxwOj5wqkw=;
 b=Xnb59LLy0j5muZdHf5w0p5SOCkYIG5iPZ+ILXloyI1rWDj8lNPVpFdliqvF+cjC/CQ
 khNE5qQVpPvtlq7uJGHagKHSiHzYTz2BBlmhlNkW2TP6FbuqO0Ht/E8Z0EBEcev29nBR
 IxLhNeLRe68R1FyeosMsCBFxKTK4LKoFZl18jy6DFpScfsLxtlVabjXS6IsH8b9jtHfn
 a2qDXSwqNIKP/DJoLojuEFXiCMLuU7eF49yeVdnGIDam3D5YIHOfo6qLlNrjLZB39pGi
 PL/0ptUXgsSY78n6tjA0G4geZn5J6H3O7zokuE7XoQCk01fOdR6l4g3aL9f2woNux2Qj
 PgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735560420; x=1736165220;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dB9/yODLQe9+puXrprcjZ851oLTBx6bI2CxwOj5wqkw=;
 b=lba5s6N69HA4c8CftyH+m5A5sNvI6DlV36I5+hkYeDTywKPp42yvaP0BwlrT9hub3z
 +6Mg7UhLEXYLNa5JIkjRhhQ3Z27zVI65LvwMeTyOqaOyuC/0exmhN5Ih9+Namw6ZywNT
 aZXgmBhM/qDo9Ko0Nu8D26TaUgeN0BkbBnsNPQHUxQJd8Yqnd5DuYv23Gfy2FRwzT2Kq
 OMY21EYXY0trzGMY2SvPRxp+3DqB47vrhNT8d2QNj51j7rxPiLkkYPnc2vEPXtaQ6/eQ
 9f8ktuACYu8msJcb83Wp0VqQNybDK8uXRMDCCG0wNT9k+SiFEzA2oJanis3f/OUSLJ6/
 7//g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvVjusULoWHKEyVsKZjriVb4F1PGsUTJDjO3bvSRDucJ9dERnk/ViwFG297soZ5eKn4UjnUINK2uw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFCbQdF7CRGkMEwwq2hXERbbHF1wwXLpcdn/g5ipuiVChkATwV
 hvyN5oLhaROeK8sXx8kTDOJ0fWOmWaNOaHa6CjeEOAhWeEVhecYMkcsTADANxiOBHbClxyLVtkH
 i
X-Gm-Gg: ASbGncs6fJJ9apDXEW0oA4oviu3TVbhZLPGCFvK7Maf+XEMU9rlS5oSxIGzOo+FqTDp
 04SkjY4Lmw0nfLNc3I0wBTVmlm+ALSSOLP8lH4fuldvPCszzYZyFvD/18iks7NEkJGBTWxXde++
 6ct/B24SxVPLhL0ZKy78lMTOUsGayc3ui6lAei1GYXvdCfSCC3IGC5/zkeAr+GahHh6Yk216FHc
 LHnpZ+n8U0W/w/4igBxw5kzGOb34x/nQ0ydaQ66C85MfoMVrceluZqg/4ID1U6wN8hG/pOeQoo=
X-Google-Smtp-Source: AGHT+IH7PQnUhj9epYwjrvd+9otFloYOan9mIkPrQcwD6X8nhBT7WBdL5oh06N9MlYKlRKXTBPHadA==
X-Received: by 2002:a05:600c:314a:b0:434:a815:2b57 with SMTP id
 5b1f17b1804b1-43668b480b9mr260928215e9.20.1735559988376; 
 Mon, 30 Dec 2024 03:59:48 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea42esm358854655e9.9.2024.12.30.03.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 03:59:48 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-arm-msm@vger.kernel.org, Anandu Krishnan E <quic_anane@quicinc.com>
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 quic_ekangupt@quicinc.com, linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable@kernel.org
In-Reply-To: <20241230115241.23202-1-quic_anane@quicinc.com>
References: <20241230115241.23202-1-quic_anane@quicinc.com>
Subject: Re: [PATCH v3] misc: fastrpc: Deregister device nodes properly in
 error scenarios
Message-Id: <173555998703.252613.8963658462497802006.b4-ty@linaro.org>
Date: Mon, 30 Dec 2024 11:59:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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


On Mon, 30 Dec 2024 17:22:41 +0530, Anandu Krishnan E wrote:
> During fastrpc_rpmsg_probe, if secure device node registration
> succeeds but non-secure device node registration fails, the secure
> device node deregister is not called during error cleanup. Add proper
> exit paths to ensure proper cleanup in case of error.
> 
> 

Applied, thanks!

[1/1] misc: fastrpc: Deregister device nodes properly in error scenarios
      commit: bd79a7dbb3625304abe3086de99168534e9552c5

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

