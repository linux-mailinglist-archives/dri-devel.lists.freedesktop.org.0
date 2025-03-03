Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7B0A4B922
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C001010E385;
	Mon,  3 Mar 2025 08:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vs1kD9hR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2B410E368
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:24:32 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5e55ec94962so652300a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 00:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740990270; x=1741595070; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RaZ/CcmeFoBTR8ddNDuQVJv3AT8EACnAOxQQ2V8mS5A=;
 b=Vs1kD9hRoUfaxNT6/jDUNsK9jMIB1XbdewSunHyMNtpgGLMI5ctyJ3EG/RaZD0vVPd
 rkZx3oGN+QUMLTeFGwHJxQGZTPsSQCykijAQ0VOi/6n1+45TpAO5/XCQ3C0xdpEiSDaK
 vE36m+eOhmey04GhPyl/2Fdq0cio8COZThYRp0G3KpjAuN9UJ2ASxv6JVMUu9UaZ2SJp
 Bs7s5PsW1zqOK7cL9ulgvgn10si/jNdLa/B40AzJ4EJBWhp13mqx0CiKUWv5yh9imYvX
 io7ywGyuQvI2vmT1NvvrO38Sirrv/WbISpXI0mrr7VkuaYKs6ondDrO2WkNMimYvA383
 gCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740990270; x=1741595070;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RaZ/CcmeFoBTR8ddNDuQVJv3AT8EACnAOxQQ2V8mS5A=;
 b=oKJoSEuDQBUIoP595Sr2t+JNN/l6s0+aKrw0mhaTiU5gL4B1ZC1i08+8ZzbZkXqp2K
 eviWlKR2ATjBOVY+/4Q0Kg6kgbE5SLFEbg3kAHvPSlfnce1wTXBTZCfRRQwmmqwzk5Th
 15E5TIaxonXKEGOas1N3zYzyosqC/hgqBgpPD7Nnzoh2kgoskCIsosmiSpeaEA4JZ2Hn
 nrFGTI76mi4hvU36yj0ykVED9FujaZNLcVUYv2YL+v19f4cpYhYDP8YoIaiECQT0hG2I
 63OOg8EF9QGtQZ8VEIzlfirchXfPMHbR9foUlaOkSX0ajkwxizts/q+4oxt32Lwqmw3l
 4ZeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMygCGKDdsJAwVDHBuZeMaFg+9CVzl4t1hOJNhMWD83hHsiZsXvS4xPa6hqpgG1JtoYv4mDacnHRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIHU9Tfv20woR3e/iMa7u67Szfy5H+v/1EuMbR67lVYK7OLfoD
 sBp5LSvLIunlz4NHohK44PEbtOHU32GBwA3/he1eukMkyr+NaozWeR4bDYgR1Bk=
X-Gm-Gg: ASbGncvvP0BrNQUPLLR259pYKA7VL8lgEz1GX4bmEQrletJzItKw9HduxSiXQ841tkO
 0Nnh0cMfKLD+1lAmv171IEKGwoMC99a7C/SnZHp5tnSza/+A2Jkys7Ptv9E2CqhjjwUv0UiSp5v
 gBQBiozy8dH2IzgENkYAkf/58B1QgoNy9Sf4+Xc8yKpON/oDktRy3Txs4KUDT5xXgqdjmLpXfp3
 H8LrgV1iD+oNq/bVRkiNwxAdIHnanWDz8Klgmh44u7RU6pDxgLLVpSqDFsumx1Z2n4yuz4rsKQd
 Othcb71Vuph63k2x+9mnCjJobd0333w5/oxT5fPiGguiMD1wvw==
X-Google-Smtp-Source: AGHT+IFy4o0lL4wbVfv25BbUZiZprY5pePIQkrVcMtYcd0n6ALHYFSnKECFQ/9k22YMwYBQpC08ZKg==
X-Received: by 2002:a17:907:6d0c:b0:ac1:791c:1526 with SMTP id
 a640c23a62f3a-ac1791c1cd3mr169820066b.56.1740990270586; 
 Mon, 03 Mar 2025 00:24:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-abf3f3bbfb3sm525674166b.77.2025.03.03.00.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 00:24:30 -0800 (PST)
Date: Mon, 3 Mar 2025 11:24:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND] drm/msm/dpu: Delete a variable initialisation before a
 null pointer check in two functions
Message-ID: <ce9599fb-a798-4f22-b51a-3341e690f8bc@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
 <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
 <12050afd-ab60-4bac-bd25-0c3cc925b38b@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12050afd-ab60-4bac-bd25-0c3cc925b38b@web.de>
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

On Mon, Mar 03, 2025 at 09:15:14AM +0100, Markus Elfring wrote:
> >>> The address of a data structure member was determined before
> >>> a corresponding null pointer check in the implementation of
> >>> the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> >>>
> >>> Thus avoid the risk for undefined behaviour by removing extra
> >>> initialisations for the variable “c” (also because it was already
> >>> reassigned with the same value behind this pointer check).
> >
> > There is no undefined behavior here.
> Will any software development concerns evolve further also according to
> undesirable null pointer dereferences?
> https://wiki.sei.cmu.edu/confluence/display/c/EXP34-C.+Do+not+dereference+null+pointers
> 

It's not a NULL pointer dereference.  It's just pointer math.  It was
a common way to implement offsetof() before we had a builtin for that.

samples/bpf/test_lru_dist.c
# define offsetof(TYPE, MEMBER) ((size_t)&((TYPE *)0)->MEMBER)

regards,
dan carpenter
