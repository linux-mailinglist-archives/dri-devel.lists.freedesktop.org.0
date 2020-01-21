Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60DC144D30
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0CD6F3DA;
	Wed, 22 Jan 2020 08:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92516EC1A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 09:38:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t2so2388355wrr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 01:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+M730A48Aqh4pFSc6/yOGVnR2p3jp3qMHztEPqPnpzo=;
 b=I4Il4xqb/mQRJaa0qSSl+Y25gZ18e057wP1tdP0lh2yLeaVpX0hadSOR4cl/LQpB3Q
 tyaDpcGYEDRokttwYZKiVcZfJVF8EHoSYV8AeT5Pk8Cx7E9Px1VKdhTcXR1aAUSJd42D
 xFOr6MeGSxv5TF/P/YEky3SS2IZFj68f7cxUiU1OZ4UxuYB744pGOuVT1Fv5ZBgPKRCQ
 7lN+SeGd90TfRO9gjPQRhJKb/pkMVZLlA3k0gUeRo6+ZVDTta1IW1eGaQBVEL1GveVLC
 n0vz510kYT0OpN/IyanOQzCHQTHpjRTMgbVeaY/5N811ccD6PckCAVfLKOa3fN1tAM5n
 aJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+M730A48Aqh4pFSc6/yOGVnR2p3jp3qMHztEPqPnpzo=;
 b=ZxTbtOtq3AaWePRZpBnmCvp3uzaJRU/tYDK7GtkL9xmE6pPyqAAUKRCHrIwkRFKoSo
 7fEuOycKe2W5IpPcDV2pOSXOmu/iU6M+lGbtHMqt/5Qr/l0BsGE2v2H+2QtnZqbjYIsi
 5BlJcXcGtfT6P+AkTZjB5kMx4Xv8BaHJ/zT7MHFZ+GsNREQRhul9xx6rrgB9L7BK/1I9
 w4k4hdGX77amNMRjhls4fEYux3vL0cSg2exWDPixdpHoOjd9e9dwSNOcHmiK5H+IqZBn
 xcqz9NULnkJfMCCSs2Ai77sMV2Fjo5RihVa+umlSJpZDyltOVHDODEcQWbtVDh55QMiw
 cYtg==
X-Gm-Message-State: APjAAAV7pj+rHj441kWoUHnHx+yLPnWIASK5HshyAkgLAC8x/UJts6vi
 1SrdjCw3HjbxuBDcDfGri3VRuQ==
X-Google-Smtp-Source: APXvYqzNPRBGH9fYa6XMUb9Kcbd+L9DaQWdS1c4YXNu4dlR3oazpTgiDZXxcGp6bVMzhgy2FLbeDYg==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr4336811wrn.251.1579599479951; 
 Tue, 21 Jan 2020 01:37:59 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id u22sm54210033wru.30.2020.01.21.01.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 01:37:59 -0800 (PST)
Date: Tue, 21 Jan 2020 09:37:55 +0000
From: Quentin Perret <qperret@google.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
Message-ID: <20200121093755.GA157387@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <20200117105437.GA211774@google.com>
 <40587d98-0e8d-cbac-dbf5-d26501d47a8c@arm.com>
 <20200120150918.GA164543@google.com>
 <8332c4ac-2a7d-1e2d-76e9-7c979a666257@arm.com>
 <b02da0ed-9e0b-36db-9813-daa334cbf2ba@arm.com>
 <c9910c74-ab47-0c78-a1c7-4f3978e1dd09@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9910c74-ab47-0c78-a1c7-4f3978e1dd09@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, daniel.lezcano@linaro.org,
 peterz@infradead.org, viresh.kumar@linaro.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, Morten.Rasmussen@arm.com,
 amit.kucheria@verdurent.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, b.zolnierkie@samsung.com, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, kernel-team@android.com, mgorman@suse.de,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, ionela.voinescu@arm.com,
 Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday 21 Jan 2020 at 10:10:16 (+0100), Dietmar Eggemann wrote:
> True. But then we hard-code that a CPU device performance domain can
> only be a frequency domain (which is true today).
> 
> The task scheduler (build_perf_domains()) and thermal are already using
> cpufreq_cpu_get() to access the cpufreq policy. Now the EM framework
> would too for CPU devices. I assume that could work with a couple of
> adaptations in Documentation/power/energy-model.rst.

Agreed, and if one day we have a real use case where the pd mask and the
cpufreq policy mask need to be different, we'll do the necessary
changes. But until then I don't see a reason to object to Lukasz'
proposal. So +1 from me.

Thanks,
Quentin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
