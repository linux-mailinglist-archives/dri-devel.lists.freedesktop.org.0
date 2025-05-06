Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCB9AAD0CB
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 00:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8408C10E10D;
	Tue,  6 May 2025 22:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XJVCUj0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E4B10E0AD;
 Tue,  6 May 2025 22:11:13 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-af91fc1fa90so5577688a12.0; 
 Tue, 06 May 2025 15:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746569473; x=1747174273; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jiSvSLX5ynbADc4+bICsh2gisZmTrKBlbGfFrdRzhQ0=;
 b=XJVCUj0sKLzNS5ntlCGEOLNXVhkWIEMMUpVjr0q1U3VWD7N4mz16Q6msA2udpqlGLM
 GLHAKIO7vp24MQE0iJ7WsqRTT8lDf4eDVPWsuBXyd3xOYqC6v3qbdth4Ybs+39GuOYgl
 Zi0C0xapvPS9nToxMB4UlgAW3u4HA4QvaPfETbs0ofLZGlPwnIAkKUeFO7LfFo9qkRr4
 A3ALebabsgnHSMUIVEuXz1ZkL+2FLEFRvxx1wPBb+Cz/spPcPzIv0Ccz48D6cstWaQFs
 +1idjCu/Ahiyx/8IzJShFB9aSi2Y6xPWppE/iESeq5BZG+SDYK77n734vXdLIyaehnoO
 SxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746569473; x=1747174273;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jiSvSLX5ynbADc4+bICsh2gisZmTrKBlbGfFrdRzhQ0=;
 b=Jk4WBZWmbwPvZg4khTo2vp4dNCKKOY9BhCZrNz4xWCz+WnVinJnzpTyVWdy5MTPZO5
 /0jLJn7DckNiAZzNIIPK3Q7wkkYC5XtXLAcpE4lSKWkQ7kvzprlt4vweFxFwLcLrNpp7
 JPKKIin1IuY86wVp+OElLMgKYRRGuUaTdKcmMyquWEL/WxfNQRnunfwA2XHtd7OrS1LW
 68umflXeMfbEr6noqCM6BYE8hPUX5goVkoNmTU9guitVtGBi2YKnjkc5HbGR5Z41k6Tj
 CsEVr95oWphZXT5XXLgtAHIdZS1vElhP/JoA0eVnoGb6ecZmBWYMwW1S/dL0bxUoQypj
 nQHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7vOykBXOPkFp4GpmIDOmVXBtDMC3rByQy59beQGcmcijG0nE/8Ef9mwsq7E12xSJEbxdOnGtYSXk=@lists.freedesktop.org,
 AJvYcCWBkv2OHkRXi0WgaLonRNwGEN5x6R02qAyygAdV0uiwLu3TjCvi58Ur5F2DXywPaShIXz5Trk0AkYXX@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0CMKlBPJGMbdcM+eFIxlqbZL50rBTUDBkX4OuUmTQcwl8DpnL
 sgOcblSA0BqpOg8puYJtFuV4mpGAi+P+TpJfOXi0+cQsW42q5SqBUXyzMvWMJmWf+oPK8W4JN+r
 InuC4ui6Qk1+0WFCXZkWuN9q2sAM=
X-Gm-Gg: ASbGncvdfclIfoVxlIUvlZgEnV+pDrCKGtLoK45apj3LtaH4DyzI9RmNsPgqoBgdlfa
 xWSEF98DH97XmpdCzzKqLgS/zxStU1rVe6Gf4y/TKVs6vfBqgPIa2R2hBLQjU2aQLPhvMLMaSpA
 iMzr1nlGEvAw/eynPo/uelZatvSs3yzq5xqKQ5zymbTq6QMsbfnb+uBE8/Zkc3ak8vCw==
X-Google-Smtp-Source: AGHT+IGeqsTTkiGAn1oeKcFKrRs71LkDCoLaCE01JpenyN0p/QfIT5UajvlNK/QC/WepzvGC6dhbtI4G3rw4KXubyYU=
X-Received: by 2002:a17:90b:384f:b0:309:e351:2e3d with SMTP id
 98e67ed59e1d1-30aac19ca51mr1929083a91.12.1746569473068; Tue, 06 May 2025
 15:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250506-dpu-sar2130p-no-split-display-v1-1-b619c0fddea5@oss.qualcomm.com>
 <k4npgl5v3qqdzqytiwesqgs3v362mr27mtvzfbvp6ugm3mn4qr@dxquxscqjqme>
In-Reply-To: <k4npgl5v3qqdzqytiwesqgs3v362mr27mtvzfbvp6ugm3mn4qr@dxquxscqjqme>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 7 May 2025 01:11:02 +0300
X-Gm-Features: ATxdqUFQr1aPwld24RZIIP4EOvP7dGz-MtbCTD8ExU9Lsw9E0oP0KebNjeXg098
Message-ID: <CALT56yMSnnwjETD6zXV3xk=YDHd1H4kuHCkzL8xi7c0w5nDcYw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from SAR2130P
 CTL blocks
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 6 May 2025 at 17:36, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2025-05-06 15:53:48, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <lumag@kernel.org>
> >
> > Follow the changes in the commit a2649952f66e ("drm/msm/dpu: remove
> > DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0") and remove
> > DPU_CTL_SPLIT_DISPLAY from the CTL blocks on the SAR2130P platform.
> > Single CTL is used for all interfaces used by a single path
> >
> > Fixes: 178575173472 ("drm/msm/dpu: add catalog entry for SAR2130P")
>
> This was probably more of a "developed and merged in parallel" problem than a
> faulty patch, because a2649952f66e was merged first. Regardless:

And I unfortunately completely forgot about this chunk when merging
the SAR2130P support.

>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
