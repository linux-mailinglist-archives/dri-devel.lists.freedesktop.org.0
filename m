Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D195EA78C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 15:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B85610E3B4;
	Mon, 26 Sep 2022 13:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CB910E3B4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 13:43:31 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so3756703wmq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 06:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=4Mwz8FKBL/pek88MW/Akc2WY1dOZecC17pSrrx2Q9IE=;
 b=kTRKPUQCLXqb4d2iAz49BYOxe4BfJKfIXFq07cUnAFEHPQDQABF5IExhfE2AIYzzyz
 i6C/7ZIVBYCUv3+AF1QWroFN/7Sq4i60KlQ5mO+1NZ0BfBDsXm+bFyC5UFfak1E0PNMJ
 wTmBaGN4g4u6pdnFcnCFsxhYTypdZv1boBdTZ5i8FAz8H2H+9SvnX4kfzJs/tWQ9g4FZ
 TSliEY4u/Zf1WwgX521qTpKW/fhRxOMwh+XNa7zjHg+NE0eXT2BikZ3CBlO7G9WF0mVw
 V8fpzQ+I/jD9Y/6iT5ZUEYx9QnMfuXxyx2sEJ4+U7rsmPMdABoAP3ZVTHurIhQyqQ4/q
 dWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=4Mwz8FKBL/pek88MW/Akc2WY1dOZecC17pSrrx2Q9IE=;
 b=lHR2py/AY7AjYp2Nly46r2XbDXrSlBmmTzxuMjZMvtu9DMKp5I7U1ZzlDH0n53ose1
 g90JLYvCyn8PL/5WDnMWfnofbAH6LccIW00u+EApCB624FCKVqcIDjRIsAMFY8cpeZqD
 lw2AKEZX64YSNBoV56R+iS0bHMwZ6roL5LPZ1LKyAsUwaVe904vScMEYOlcYKuAp0RTF
 B3C0hes0luzjB5AId/HRT8GRFpzn/eek3s7fGWAl2bfGjh9ZDvnQNWp3zINsq71WHoan
 4tbMtO1+BAjbbdjIcBIOmc+UH263N4XGqB91/ZwO6PHYBVDU+wG8uRS20HjZGqJJrZLb
 i6vw==
X-Gm-Message-State: ACrzQf3PXkYAdtwUs6iEDgWz626mi59kg0TEr+a7n1hy4VVNniymyJE9
 BJNEPwqSpHm66vC+k9U+W2pZ3cY6qni9e+rt
X-Google-Smtp-Source: AMsMyM4gKxq/yZ7TV1ieeu8m6Dr+MHG3dSv+57jpVevk1SNLxuAo8X7LvQUEvRNEsuo6CVlNC1kGPw==
X-Received: by 2002:a1c:4b05:0:b0:3b4:90c1:e249 with SMTP id
 y5-20020a1c4b05000000b003b490c1e249mr22626267wma.201.1664199809608; 
 Mon, 26 Sep 2022 06:43:29 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 p21-20020a1c5455000000b003b27f644488sm10888886wmi.29.2022.09.26.06.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:43:28 -0700 (PDT)
Date: Mon, 26 Sep 2022 14:43:27 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next] backlight: ktd253: Switch to use dev_err_probe()
 helper
Message-ID: <YzGsf5CSlMB7VvTf@maple.lan>
References: <20220926133525.1107096-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926133525.1107096-1-yangyingliang@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, lee@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022 at 09:35:25PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs. It's more simple in error path.

Please add a SoB and resend.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
