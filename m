Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEE01DF579
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 09:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9BE6EA3B;
	Sat, 23 May 2020 07:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB606EA3B
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 07:19:39 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id p30so6040212pgl.11
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 00:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mQpwDorfwvq+V62PfvwOYJvrHs3QMzFsZXgFJo18jk4=;
 b=MSrBnupi+5YHYIwS9y2RbUaGZ+TCSJcSu1bQ5t995mrwnPtUwyNeHzimkw3adTJCXH
 TaKBt18aHyJ9P8w3pjxzliEmQ1b7kQZ46QssUwJBAfUqLfNiws0JdQPs93NWG0kxVE3x
 uaJGm00uYa8KC7gpxNnpYix0fh+2eauT3zeSgFZ3wk2pD06Om/E402x9vAa639q68p4b
 LRrH3rCbfinfjERxe8qqBRejbiGwQ1oSi/6CjN60NPl9sBlLZW3NUa/Vef/zLGm+r6wz
 2tZY+UPo96qmeCB3PT6R/srJXa3q1q0S8irkCs9F/nA6Ki7B1Cwz72RdQq7Vi4pTBcCw
 WCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mQpwDorfwvq+V62PfvwOYJvrHs3QMzFsZXgFJo18jk4=;
 b=PTscxZ4M7RHYU2xXdOqODKZFckjJ8UhNCxJsI+jNklwhdzp7rThNenWFvFOnaQSPp5
 1ciAlYUJbxpULKy6+9sE1h+03bLUNVCbGT2S3WbJx6a8NnGHik3yB+nPWXitb61L2En2
 SXGOfQl9Pwg4d8R01aMP924MD45Y2T8uIIqKvEFIw/ScvIhfi3hqhQxdEoRZJha23Nww
 GpkSuShGYF3og8tHYlVhCycPHsLjFVMS40ImeZA+zJSXwCHiJ1CfmUrzLwaecQ6an2ZV
 BB+eHMlixl+bRzcirKRMWsrnrOyjTJL0OYwLycHptvt+qU1/XHxzOtTIjUT3O9NUTnZ+
 WIiA==
X-Gm-Message-State: AOAM531RFzENuwTi5AYSi+Y4vxWPp7w/N7IIWEtF2iEwEGL1edCJAvEt
 YLdqNZF+WNH83sKLJXL366w2Ag==
X-Google-Smtp-Source: ABdhPJxqFZXbgyrGG2llkCELkJ4vr8owyGAmFuNdn5IWKK4N2BoHTIjn1LpADdQE5iBYiIrZ/JTh+w==
X-Received: by 2002:a63:e50f:: with SMTP id r15mr4250466pgh.192.1590218378840; 
 Sat, 23 May 2020 00:19:38 -0700 (PDT)
Received: from dragon ([80.251.214.228])
 by smtp.gmail.com with ESMTPSA id d21sm3969329pfd.109.2020.05.23.00.19.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 23 May 2020 00:19:38 -0700 (PDT)
Date: Sat, 23 May 2020 15:19:26 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH v1 0/3] drm/msm: Cleanups ahead of per-instance pagetables
Message-ID: <20200523071925.GA28198@dragon>
References: <20200522220316.23772-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522220316.23772-1-jcrouse@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Marek <jonathan@marek.ca>,
 Konrad Dybcio <konradybcio@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Brian Masney <masneyb@onstation.org>, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, tongtiangen <tongtiangen@huawei.com>,
 Drew Davenport <ddavenport@chromium.org>,
 Wambui Karuga <wambui.karugax@gmail.com>, Enrico Weigelt <info@metux.net>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 22, 2020 at 04:03:13PM -0600, Jordan Crouse wrote:
> These are three cleanup and reorganization patches that were originally
> part of one of my many per-instance pagetable stacks [1] [2] but make life
> better in general and can stand on their own. Send them now to get them
> out of my other stack and make that processs ever so easier.
> 
> [1] https://patchwork.kernel.org/patch/11355255/
> [2] https://patchwork.kernel.org/patch/11355259/
> 
> Jordan Crouse (3):
>   drm/msm: Attach the IOMMU device during initialization
>   drm/msm: Refactor address space initialization
>   drm/msm: Update the MMU helper function APIs

FWIW, on A405 with glmark2:

Tested-by: Shawn Guo <shawn.guo@linaro.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
