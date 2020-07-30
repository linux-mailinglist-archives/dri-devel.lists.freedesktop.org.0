Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2A323400B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C9F6E9EE;
	Fri, 31 Jul 2020 07:36:09 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF016E8EB
 for <dri-devel@freedesktop.org>; Thu, 30 Jul 2020 15:37:29 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id c6so4524131pje.1
 for <dri-devel@freedesktop.org>; Thu, 30 Jul 2020 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9SEQ1OEv82nHNMdL9SqhRCzSBouc4sokzr4x8Hh1/DI=;
 b=MGZ/ahYtIdiF9ni3ETE3Khx9UnzPeaO4A/M7nSu0MJyY5+bCzMAsEhfkzzy2Gy2vHu
 N6joxF9xSH76v6buIa+i8zHYXDLBXuMJT6TDd7p3WcnMb9N2l3Szxxl333c9/wjLes+C
 KtGkEIWrsimjwMDomJX3xuQeVyWoSYJbL0I3PyBtDVqJClaQgg9l4+QISP2TJ2TKivAo
 prRKjq++Yg1p+fpQMs+eU75sFdgTQy1OezcxkoAtTcQky2LSiVUmrmEZ3bdWem0LD+gh
 BUuZmuoHDN7Lc3ZjsiqvPDeGFq3/uxgCTXRPlI9G52R9C+UxF/divsyP6+uS1leZZniY
 d9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9SEQ1OEv82nHNMdL9SqhRCzSBouc4sokzr4x8Hh1/DI=;
 b=KcBohyyS83bV4lT2Oj65J+LzET0AAmQX1iTRyk8I4oNa7vDSVn3xpoFcrWgkkqYWsS
 C4G5KdB9gcwPU4mSUOwfgvRB9Ko6Kms6aC3HQJ2/Q2IPKY25TFZUShK8iz9iIArkLb7+
 2C3JKuL3SMnS0MI3g9ZtZXXyR+RcdxlaeXy1v0/0aVhDF9TtSZSR54eNVwJJmm4h0Yag
 fM08AWFJ1k7aq3ZL1s9TPaUgFwdMZjS3ZYOLll/1VmLmxQMrb/Zragb96ukrzUpyosGz
 8rLObdNNfcyNYsSAoXZ0wbtv5/pnxek+mdlRDB7tM/fDeKLiiqVRdppXSmxEop6CQ8GL
 gIhg==
X-Gm-Message-State: AOAM5320LcNReSyyOQO/+NJBaMEK3Oep55eNDnXqz1Lf9H17OzLBBfHT
 vvyZy6hedO+ZDh8uEDfSP9soXw==
X-Google-Smtp-Source: ABdhPJwQyi8M14QMhOXfHbSaGH7VCYAkvRqASesnwEbOczg1tB8ocLA9RDU1wXDJ/FEr3D1Nv1dW2A==
X-Received: by 2002:a62:520b:: with SMTP id g11mr3981023pfb.168.1596123449285; 
 Thu, 30 Jul 2020 08:37:29 -0700 (PDT)
Received: from localhost ([106.201.14.19])
 by smtp.gmail.com with ESMTPSA id f29sm6943179pga.59.2020.07.30.08.37.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 30 Jul 2020 08:37:27 -0700 (PDT)
Date: Thu, 30 Jul 2020 21:07:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
Message-ID: <20200730153722.cnpg6n6tnmvjtuso@vireshk-mac-ubuntu>
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
 <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
 <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
 <20200730051045.jejrtkor3b32l2qe@vireshk-mac-ubuntu>
 <CAF6AEGuzff9+Wy4EHx0aDx1gBzSEGh--yqT5rnwLHp=U6amnyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGuzff9+Wy4EHx0aDx1gBzSEGh--yqT5rnwLHp=U6amnyA@mail.gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30-07-20, 08:27, Rob Clark wrote:
> Hmm, I've already sent my pull request to Dave, dropping the patch
> would require force-push and sending a new PR.  Which I can do if Dave
> prefers.  OTOH I guess it isn't the end of the world if the patch is
> merged via two different trees.

I don't think a patch can go via two trees, as that would have two sha
keys for the same code.

Though it is fine for a patch to go via two different trees if we make
sure the same sha key is used for both.

Will it be possible for you to provide a branch/tag of your branch
that I can base stuff of ?

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
