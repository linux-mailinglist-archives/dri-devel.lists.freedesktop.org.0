Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F95663AFC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0B510E54F;
	Tue, 10 Jan 2023 08:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4013510E0BB;
 Mon,  9 Jan 2023 23:14:45 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id b3so15542000lfv.2;
 Mon, 09 Jan 2023 15:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7aMQc5BYXDV/7oNhbW1Pl88FNWIMOAPhqPBJwu9jrno=;
 b=TtZQLFQMSHggBMPL6z/kFK4ohDXrhJQyzkvWNZYoh0iUV9y1EKcOcPxa50mEctFydL
 RX2ewsmFAgVI5kzMGMQYoEnZSCzdMJXj36awfiagUTdsgoLvBKa8xh6F9sExaveOiSpy
 3LwsY+5MmMNVwk5bkqAw2l5UD1xUQ1fXsgzX1dEzy/wdorS8M1V+zHlptNJqqmL1F5Xs
 /XzWq5blLa1nhYGCJHZ8uU/g+nogEQ/HZCLN0tQmYojBwtkTw6SxlmuS0YeVEXtYq7hy
 yVdHFzqmG15K9dEkvBufOdCvZipNwFX5nVK7qxk0gnp/vOdPlMJZMUxz7KDvXBQ6SrkT
 Tdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7aMQc5BYXDV/7oNhbW1Pl88FNWIMOAPhqPBJwu9jrno=;
 b=4Utzimh6893/YI2HRJokhwRrEd3QXY/I8Lb8nTceRiqPqXKZRgZ2izbf38dCGpNhL5
 z41mGtfxEYkW4Ln9oJpjJgqiQ3uDnSj9UAaA7JFATF2SZID4zBLMnthSMTaCK754yiHV
 858kCtLwOwBT7xMQanhOBgtLJjEeby3XhZ117Dqq0+jizrElPsuy/EDU/nM1VBopALgp
 fUHxk/DholiDJRRYZ0tvUB44C0EqOQtblrEmXgmvLR11ukpy+4Xnk+aSxnAp0Nq8iXJp
 Fk/HPYBbzlJbIe829SzIw/T30QNR6wbszDa7DGvyv1cLLVntprnH0YJApwrYDPJbZXIS
 zv3w==
X-Gm-Message-State: AFqh2kr5GGzqLYo6wxnSLD5oM5bW6VVRu4TJEOdWitsywL5l9ZTdzkrX
 pKokW5pcpujhY64d15rTY4A=
X-Google-Smtp-Source: AMrXdXu3fTohzLJHs+Ys6z4kHHnaEEPDUV/31K4z6QI6J3cFIrnFWOYYusRQjmYBJFMM/13MRecttw==
X-Received: by 2002:ac2:5d4e:0:b0:4c3:7634:234c with SMTP id
 w14-20020ac25d4e000000b004c37634234cmr19517431lfd.57.1673306083423; 
 Mon, 09 Jan 2023 15:14:43 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 c21-20020ac244b5000000b004cb015794a8sm1834632lfm.109.2023.01.09.15.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:14:42 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230109214309.586130-1-dmitry.baryshkov@linaro.org>
References: <20230109214309.586130-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: disable DSC blocks for SM8350
Message-Id: <167330408773.609993.12108316021819384010.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Jan 2023 08:28:50 +0000
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 09 Jan 2023 23:43:09 +0200, Dmitry Baryshkov wrote:
> SM8350 has newer version of DSC blocks, which are not supported by the
> driver yet. Remove them for now until these blocks are supported by the
> driver.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: disable DSC blocks for SM8350
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3b2551eaeac3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
