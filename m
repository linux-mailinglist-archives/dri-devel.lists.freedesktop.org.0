Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9844D4D610A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 12:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B5C10E930;
	Fri, 11 Mar 2022 11:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF1B10E930;
 Fri, 11 Mar 2022 11:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=QKQNUb8gG1815bo0+LJAzephXsrFMrZXGrmPtBwOo6c=; 
 t=1646999652; x=1648209252; b=H7PFbeGMO8u8/BOw2SLNFUUa+tG+BTqiyVEfu1hHBopvf4g
 rk8obx0wULTDkiiOXjJvT+SvT1EWlKdkz1Rx2dtzFHIOr+wx+zp7Q80/1y43iHWhQqct3k195u8cd
 dicUSLPQ28Gmu8z4ibNUYOsLO/DHOgX425o3nanJZG1xVPW9Vi1Q8z+qbdfJRGvWrUI+en3x3kxXH
 MNBqiN3t8rT1r5lVXLAsvd/nWrM2+96Ao6hD7/aS/YNQHzYxZqWmcwTvQ0ZP7OBSq5vJdvtrhEHcD
 wuW0p9r7LsOKC/ZoqLtJRnBSaU7aq8wuXHi4GT/xs7tK05vNX9qPs/rg9RK7K8+w==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nSdqI-00BtPi-Dc; Fri, 11 Mar 2022 12:53:58 +0100
Message-ID: <564672530e489da8872bdf1d8cdee7ce071d6a19.camel@sipsolutions.net>
Subject: Re: [PATCH] devcoredump: increase the device delete timeout to 10 mins
From: Johannes Berg <johannes@sipsolutions.net>
To: Rob Clark <robdclark@gmail.com>, David Laight <David.Laight@aculab.com>
Date: Fri, 11 Mar 2022 12:53:57 +0100
In-Reply-To: <CAF6AEGtNGJanJ9f2pkjst50yPSWGJPo5nDkcZZgq=BkRWMq4yg@mail.gmail.com>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
 <YgZD8vPqB7ISpRpZ@kroah.com>
 <654d620b-9e14-c47f-b48c-762dc0bd32a1@quicinc.com>
 <Ygdb63FrorUsX/Hg@kroah.com>
 <b9156bde-137c-2fac-19e0-b205ab4d6016@quicinc.com>
 <7db7d01fcf5a3edce61161769c0e6eb1541237bf.camel@sipsolutions.net>
 <2add9ba7-7bc8-bd1d-1963-61e8154b0e3c@quicinc.com>
 <989efb15-cc5e-8f6d-c313-118f01498e33@quicinc.com>
 <8fa2f879e33e4e42b76e21c6fbdcb023@AcuMS.aculab.com>
 <CAF6AEGtNGJanJ9f2pkjst50yPSWGJPo5nDkcZZgq=BkRWMq4yg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
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
Cc: "aravindh@codeaurora.org" <aravindh@codeaurora.org>,
 "rafael@kernel.org" <rafael@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "khsieh@codeaurora.org" <khsieh@codeaurora.org>,
 "nganji@codeaurora.org" <nganji@codeaurora.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-03-01 at 09:45 -0800, Rob Clark wrote:
> On Mon, Feb 28, 2022 at 10:49 PM David Laight <David.Laight@aculab.com> wrote:
> > 
> > From: Abhinav Kumar
> > > Sent: 28 February 2022 21:38
> > ...
> > > We also did some profiling around how much increasing the block size
> > > helps and here is the data:
> > > 
> > > Block size    cost
> > > 
> > > 4KB           229s
> > > 8KB            86s
> > 
> > You must have an O(n^2) operation in there - find it.
> 
> The problem is how the devcoredump/sysfs interface works, which
> results in "re-rendering" the output for each block.. it's fine for
> moderate size sysfs files, but scales quite badly once you get into
> couple MB size sysfs files.
> 
> It could be fixed by having some way to keep state across successive
> read callbacks.

I'm not sure that's true? Perhaps for dev_coredumpm(), but only if you
implemented read() badly.

If you have e.g. dev_coredumpsg() or dev_coredumpv() that's just a
simple read from the existing buffer.

johannes
