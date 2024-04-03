Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A67889768C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 19:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DB1112DE1;
	Wed,  3 Apr 2024 17:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NW0Iij6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E5E112DE1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 17:26:45 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dcbd1d4904dso126105276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 10:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712165204; x=1712770004; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W7QRRgKqsXwD5sSRDZZ8VcuFdOzjyZfFtngo+Xri/jk=;
 b=NW0Iij6BNa+VNEeKxDRGPlCQpodX3W4G7TrSQ08PAzMjInESp44S0+CFvCMc8YOiGx
 Z56xI/C5hfxExWCaLD3fxcFWLu3XhSZoq2uuUrRj295m/lFF97ZXD0Wd7sFWlUPlq/Oc
 MSKV1donffp0U1KKv5E9w+OwmAotJWSS1BPOueSU3wHGAsbzUQiWIWMIspvFk3IoNY9l
 fl4D8zp2uMEYkx0PqKz9nToT40Vn+LIjjViz8ZZSViCq5qP4GglL4V7lnvqD+IRgld2w
 oxBzwF7XIFHC0nl4V4QYT6BWihs0G4X9C923ARX9b64kVmx2rXspV22aBo5Mm48u8jm/
 VBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712165204; x=1712770004;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W7QRRgKqsXwD5sSRDZZ8VcuFdOzjyZfFtngo+Xri/jk=;
 b=LnV42MSNQhsubOdezFVaXTxHE63ybVPsLnEIdQbRhUojIVtX915lj9ZfXJ2k74uaYG
 gjy+cLJV/wZ3xsXbYJTzRZXEFjtghijt9kUF0BIEl96oHGtTx3oMw5iD/sQ1ltDRHFRj
 YbqHl0nxm30sbcmTAooKd3ebV1wGMibO3isl5ZnyubnKJMzf1augxksBZ1zMnaMCO0o4
 aASevU6zOQrQWEJcp1JGV9QHqwu/bAUMs9AKz8Dyddz6CoINSxvGzWQdvLRevsJ061Wu
 kvq6rEjNhY+GUSJi6gSOdAY6lDWzk+zXHUuPD0/tITf0grlu/lFgob3HpDbvkxhwQ7E0
 5NeA==
X-Gm-Message-State: AOJu0Yy1nkZPIPude7JN1T4aMROffJiRXxvLN9IquNIujP3cwJqUgqWv
 Ok9TzanZvxJv4SvO2ijRGxQgIoXOG4zBFB1CbJeXf60b0n8QkB0mTI5qt8EcBL9XRWXS8F6pAGu
 pVV1PMSM6LngbCkT9WySAQPNRp0YkP7kDnueYsg==
X-Google-Smtp-Source: AGHT+IGKs4UZZu1uWec/JwUPIddWSalxBLmZpFq3atHbYhG7vywkXhdOnRse/O/THqsDCZtUL5neZXBtsuKX/2xQd+w=
X-Received: by 2002:a5b:a92:0:b0:dcd:13ba:cdd6 with SMTP id
 h18-20020a5b0a92000000b00dcd13bacdd6mr116607ybq.47.1712165204168; Wed, 03 Apr
 2024 10:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <1711741586-9037-1-git-send-email-quic_khsieh@quicinc.com>
 <f0dcfd6a-55cf-84d8-6599-319a700e1960@quicinc.com>
In-Reply-To: <f0dcfd6a-55cf-84d8-6599-319a700e1960@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 20:26:33 +0300
Message-ID: <CAA8EJpqWa0bcV_ucsyM5_sSu3d0_XFjnNdabUcbq0muHtx_YWg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: assign correct DP controller ID to
 x1e80100 interface table
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
 airlied@gmail.com, agross@kernel.org, abel.vesa@linaro.org, 
 andersson@kernel.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
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

On Wed, 3 Apr 2024 at 20:24, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Dmitry,
>
> any more comments?
>

No, it was picked by Abhinav for msm-fixes.

-- 
With best wishes
Dmitry
