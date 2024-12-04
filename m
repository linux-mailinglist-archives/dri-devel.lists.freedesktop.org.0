Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5169E3787
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 11:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFF910E2A5;
	Wed,  4 Dec 2024 10:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j+yT1JI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034E510E2A5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 10:33:46 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ffc3f2b3a9so89841781fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 02:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733308425; x=1733913225; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c7QuloSgj0r15TwR5fMQCFbF2vjnGQ7hXPKInCZLKyg=;
 b=j+yT1JI1k7O6eqpFWmW8ACxw6hFB1Vdozvr71F+qx0F9wh7a0sethoX/WWnje/jKCY
 ef4DIC8WPljnaEBkvS4jT8O+j2LIDoTyLbn/BIdr7TxIz/ryF1c1Dlwfsy2JjgOcWrvn
 QpX9oQAXJz2W+x4AZFNzRbWKFOCXVLLOMu0lojrth7Wu6N3Bz3DlBPUj5MGCFM6F9+kG
 0dJTMDUNVljaPQ0yjmFICVpyRWwqiO5/j440nkmhCzhMl5jB3F2mheR8vmC0goQ4vK/s
 KYQ4FJYTFr2jUErUq1DCL0OsuxINgLrz+FndvC4iJVr5MRzFxIJESYB4u8BKeU98IQ6L
 g31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733308425; x=1733913225;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7QuloSgj0r15TwR5fMQCFbF2vjnGQ7hXPKInCZLKyg=;
 b=eAucKU0OQPtXZFX4T0BecqSaYXI7E+AWCVFqBTjx8NICNoZbyiQnzXYod29lWcSLGn
 XBH7wa1bhhEDcckTG0ZL3jJLMHf1s/FWdiv3+HqJXHj2OJTHgssziHLPVO7/wa8alb0w
 DHIrl0KonfmFB9NUz0uDbUrkwOkv0Fw2vDS0bC77KrbtpLklyEwS+FPbDrvflPva0JGe
 vdq8lZkMM143elASi8MPUqt2835HGViTMwEufIpc69A0rBjo4zakZTOLG6WjvB+1WkPz
 F6eRs5TVl2mQhyelEIO7EKejoaJ4HqNXCJxlSZRub9ZTwWvaOZ2aVC2b4LdUzokKo9fH
 BmVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY2XsZp/AQY0ovcD1znlL2U3Xqf4NM1LDk+kYYh7rfFuoXP8IsbXw/nhrtQJtXSd1m1bCY8qNpw1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1Nk3ENJupq8gzWNv8sj9cTwlqCCMVVlUIcakw98vlRaPn+KuY
 p4Ac5dRnErgaSZaD2W9jje9lFza9ZVL/2TKFHkj2lw8UeIBRQS5/GGSzEl6T2LM=
X-Gm-Gg: ASbGncvmXisKJ8qcm6xWrcWwvmbUY/iJQpaNdWeFPnDQ91jn0NleoEhjWVGn9NFLw5j
 vf6gpujMXY5r86jv1jnMb0cuHR4VJn1DF/CJtAwpxE9Z/ntZoj3aNFvuyYJ8BTwc+curA8ZxUqf
 iWUS/rU1Eu7OzBSQ4DZPinlbdUPmslupSJuI9aXqRQYxDPnoXHyHCqcT0tglh8n5eVFcxHFkuHa
 CUhpUVydHjBFic9ZeSdiAAL6M5GepMi+diC029xZolvtLueRhU/hoHr9Y68mTtL+KGxKu8Bfg63
 n5HidYiiewSPGrKdm13/80Q/dnDZGA==
X-Google-Smtp-Source: AGHT+IHEKTFXGocF66IHpQf3lweb12Yys+xaiLn/9Oq325/K+Ss10BFbBCPkL38hsPYrE2+4j+byxw==
X-Received: by 2002:a2e:3507:0:b0:300:17a3:7ad9 with SMTP id
 38308e7fff4ca-30017a37d6emr11123981fa.12.1733308424883; 
 Wed, 04 Dec 2024 02:33:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30018a4d0a4sm1455701fa.71.2024.12.04.02.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 02:33:43 -0800 (PST)
Date: Wed, 4 Dec 2024 12:33:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 3/3] drm/msm/dp: add a debugfs node for using tpg
Message-ID: <ibjx5lcpw2yrogp4qygcterjcbchdrqtjtdv77iozlrlicieqr@sxgtt4n42t3z>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
 <20241202-tpg-v1-3-0fd6b518b914@quicinc.com>
 <uv2phgi72mmw5c462ijsqlqedeiv4gahrwi26i2luqkhgwmfxc@ycj7jrujdj6w>
 <2193c915-cdda-416d-8e24-209e808c6d10@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2193c915-cdda-416d-8e24-209e808c6d10@quicinc.com>
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

On Tue, Dec 03, 2024 at 07:57:25PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/3/2024 3:38 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 12:42:00PM -0800, Abhinav Kumar wrote:
> > > DP test pattern generator is a very useful tool to debug issues
> > > where monitor is showing incorrect output as it helps to isolate
> > > whether the issue is due to rest of DPU pipeline or in the DP
> > > controller itself. Expose a debugfs to use the TPG configuration
> > > to help debug DP issues.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_debug.c | 61 +++++++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
> > >   2 files changed, 63 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> > > index 22fd946ee201..843fe77268f8 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> > > @@ -197,6 +197,65 @@ static const struct file_operations test_active_fops = {
> > >   	.write = msm_dp_test_active_write
> > >   };
> > > +static ssize_t msm_dp_tpg_write(struct file *file, const char __user *ubuf,
> > > +				size_t len, loff_t *offp)
> > > +{
> > > +	const struct msm_dp_debug_private *debug;
> > > +	char *input_buffer;
> > > +	int val;
> > > +	int status = 0;
> > > +	struct msm_dp_panel *dp_panel;
> > > +
> > > +	debug = ((struct seq_file *)file->private_data)->private;
> > > +	dp_panel = debug->panel;
> > > +
> > > +	input_buffer = memdup_user_nul(ubuf, len);
> > > +	if (IS_ERR(input_buffer))
> > > +		return PTR_ERR(input_buffer);
> > > +
> > > +	status = kstrtoint(input_buffer, 10, &val);
> > > +	if (status < 0) {
> > > +		kfree(input_buffer);
> > > +		return status;
> > > +	}
> > > +
> > > +	msm_dp_panel_tpg_config(dp_panel, val);
> > > +
> > > +	dp_panel->tpg_enabled = val;
> > 
> > Does this need any kind of locking? The driver performs some actions,
> > then we write the global state. What if the user in parallel writes
> > different values to the file?
> > 
> 
> Sure, I can add a lock to struct msm_dp_debug_private and use it to protect
> the tpg_write and tpg_reads.

Yes, I think it's worth doing that.

> 
> > > +
> > > +	kfree(input_buffer);
> > > +
> > > +	*offp += len;
> > > +	return len;
> > > +}
> > > +
> > > +static int msm_dp_tpg_show(struct seq_file *f, void *data)
> > > +{
> > > +	struct msm_dp_debug_private *debug = f->private;
> > > +	struct msm_dp_panel *dp_panel = debug->panel;
> > > +
> > > +	if (dp_panel->tpg_enabled)
> > > +		seq_puts(f, "1");
> > > +	else
> > > +		seq_puts(f, "0");
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int msm_dp_tpg_open(struct inode *inode, struct file *file)
> > > +{
> > > +	return single_open(file, msm_dp_tpg_show, inode->i_private);
> > > +}
> > > +
> > > +static const struct file_operations msm_dp_tpg_fops = {
> > > +	.owner = THIS_MODULE,
> > > +	.open = msm_dp_tpg_open,
> > > +	.read = seq_read,
> > > +	.llseek = seq_lseek,
> > > +	.release = single_release,
> > > +	.write = msm_dp_tpg_write
> > > +};
> > > +
> > >   int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
> > >   		  struct msm_dp_link *link,
> > >   		  struct drm_connector *connector,
> > > @@ -231,6 +290,8 @@ int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
> > >   		debugfs_create_file("dp_test_type", 0444,
> > >   				    root,
> > >   				    debug, &msm_dp_test_type_fops);
> > > +
> > > +		debugfs_create_file("dp_tpg", 0444, root, debug, &msm_dp_tpg_fops);
> > 
> > I'd say, skip the dp_ part of the name, everything in that dir is
> > DP-related.
> > 
> 
> Ack.

-- 
With best wishes
Dmitry
