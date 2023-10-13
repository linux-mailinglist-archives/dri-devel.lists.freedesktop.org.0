Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E4B7C8027
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 10:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597D810E097;
	Fri, 13 Oct 2023 08:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0DB10E5DC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 08:26:14 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32d9b507b00so408988f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 01:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697185573; x=1697790373; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5lZIjZUIrHJnpE4t/QLHPx/DZrADcMrWtR2aEpPyl1M=;
 b=dNVz+w0Tmb2ZxrUyE9df7v6PPrth6hDVOmxOucXVNMB0Auv7b0haMYlYlGRgVl6Qhq
 BEXlsP7y7jTh00Y8KGqNjXiYfsZYVUwzHgSyayVtLtEtf12y8sH9dkKw8Oa2yAPFYKxa
 ajrrh7PCLC/c5Su2OBqGPMiPJULERCyvN1BnLMxDHPtxOG0jxKqrfDMlSjjeN6ckvqb3
 2eTns9lka8nWy7kMz5Qb15JmlIxTWfhw3hw8q1ftgCMCD3n1MyA346BfezC6euqumFHu
 2i6d5gTcmEr8kFbS41uU6h6RtwkVvCioBU8aDJFwU0rqtG70IFj9cLk1B52S/pqFwFV3
 XH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697185573; x=1697790373;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5lZIjZUIrHJnpE4t/QLHPx/DZrADcMrWtR2aEpPyl1M=;
 b=Q03OVEbmBTYCf3M/4P2vf3qMhH+N8G/Ir+8jGR/GLRrMpzTspMjOrxXJVnA3zbtZRW
 LnzNY5ufuhW84ePBaoYxHk/p9K6VHgdsDSI4NiGmYp7LsRROBspLnVNpW7ivn2VLvP35
 zGcVx2rt4Vb/lkceHKdk42RsV+FgRxKokXlKVEeci/gZbckKuQc4vUyV8YfNgETboFOw
 AtgQ3u3T3/zABCPB2kI/Z3AzrK+d4irBm0zKrDbp3QB2QIUEUGWaYnZRHaDr+mwhLZof
 8eBMh0GUEOPJahza54P46zTGdaUw4cdYBGWGwx6GkIQgHpcPvkK1WIE2Y0DcdpGDVRAy
 I3IQ==
X-Gm-Message-State: AOJu0YxH1/KWnKFVRDG4R08b3tEOqmlwHvOFB9ZhGAh2jYj5QjEPeKN0
 98Tzh8sWKirTt0Nfn8EHXSn/jg==
X-Google-Smtp-Source: AGHT+IHFwmu2jkp0Wem5odeef0kN4MbW9MLkLDGoEmUDINiSFC1xy+l7yDeEAV6+kZu/zr8QTLnrOw==
X-Received: by 2002:adf:eac6:0:b0:32d:9a7c:56ed with SMTP id
 o6-20020adfeac6000000b0032d9a7c56edmr1164992wrn.10.1697185573035; 
 Fri, 13 Oct 2023 01:26:13 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 f4-20020a5d4dc4000000b003253523d767sm3778669wru.109.2023.10.13.01.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 01:26:12 -0700 (PDT)
Date: Fri, 13 Oct 2023 11:26:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] drm/msm: remove unnecessary NULL check
Message-ID: <2ac432ce-b253-41c9-9814-19e2afafad5c@kadam.mountain>
References: <5de18b71-c3db-4820-b35e-262b4cac35fc@moroto.mountain>
 <20231013080149.hbcuxww6w362g6xh@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231013080149.hbcuxww6w362g6xh@pengutronix.de>
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
Cc: freedreno@lists.freedesktop.org, Su Hui <suhui@nfschina.com>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 10:01:49AM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, Oct 13, 2023 at 10:17:08AM +0300, Dan Carpenter wrote:
> > This NULL check was required when it was added, but we shuffled the code
> > around in commit 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation
> > to the _probe function") and now it's not.  The inconsistent NULL
> > checking triggers a Smatch warning:
> > 
> >     drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
> >     variable dereferenced before check 'mdp5_kms' (see line 782)
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> LGTM
> 
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> This patch opportunity is valid since commit 1f50db2f3e1e
> ("drm/msm/mdp5: move resource allocation to the _probe function") but
> applies to older trees (where it introduces a bug).
> On one hand it's not really a fix, but maybe still add a Fixes: line to
> ensure it's not backported to older stables? Hmm, I don't know.

Sure.  Being extra safe is good.

regards,
dan carpenter

