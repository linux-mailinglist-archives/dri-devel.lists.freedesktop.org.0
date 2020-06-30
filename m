Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D3920F2AB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 12:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080B76E054;
	Tue, 30 Jun 2020 10:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226956E054
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 10:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vnJ2yw0F6LPBhKLU0hfWB5KMwdJ/W0I4u/CTb2Acgyw=; b=xFi8cN5tg4yayu/ZbMuA0iJ7Zv
 3FIC7oGjhHydO9sH5AdcD6v9wVWEkIBBs9AiG+35wL8wyYSjDyPaKWmqZeWXpCHQr6+26jmuufqhR
 SvANQQkVPc40rlrVmsrT3lcAOj1zjAW8I4slnOwGxFoowVwplQagXkTJM5owuQM54eEYj2NNJ/ETj
 zh7131n1I1Hd/1BEgUZ/+IKmiKL9o5kTTDdekytqjDHPj4hY/s7Ehag9KyhrtFF9LqdWDBnm9XNUL
 TqWHqgmM2EX/5J5OAb8saJoiEUzRQc7QRSX801ahduWmVR91iSUUW2Xgc2lPnQYttYzfwi9bVinjB
 qTfqj2tQ==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1jqDSz-0006hA-AV; Tue, 30 Jun 2020 13:26:17 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
 <62859775-514c-2941-75ed-6905e9282a6f@kapsi.fi>
 <623c1eaa-31fb-8dff-f6c0-d8cd0be60070@gmail.com>
 <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
 <f1a88006-ab3e-9068-e220-15eee17aeba0@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <3b058989-a93a-6796-8d94-f60ce39e3fba@kapsi.fi>
Date: Tue, 30 Jun 2020 13:26:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f1a88006-ab3e-9068-e220-15eee17aeba0@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Erik Faye-Lund <kusmabite@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/29/20 10:42 PM, Dmitry Osipenko wrote:
> 
> Secondly, I suppose neither GPU, nor DLA could wait on a host1x sync
> point, correct? Or are they integrated with Host1x HW?
> 

They can access syncpoints directly. (That's what I alluded to in the 
"Introduction to the hardware" section :) all those things have hardware 
access to syncpoints)

 >
 > .. rest ..
 >

Let me try to summarize once more for my own understanding:

* When submitting a job, you would allocate new syncpoints for the job
* After submitting the job, those syncpoints are not usable anymore
* Postfences of that job would keep references to those syncpoints so 
they aren't freed and cleared before the fences have been released
* Once postfences have been released, syncpoints would be returned to 
the pool and reset to zero

The advantage of this would be that at any point in time, there would be 
a 1:1 correspondence between allocated syncpoints and jobs; so you could 
  shuffle the jobs around channels or reorder them.

Please correct if I got that wrong :)

---

I have two concerns:

* A lot of churn on syncpoints - any time you submit a job you might not 
get a syncpoint for an indefinite time. If we allocate syncpoints 
up-front at least you know beforehand, and then you have the syncpoint 
as long as you need it.
* Plumbing the dma-fence/sync_file everywhere, and keeping it alive 
until waits on it have completed, is more work than just having the 
ID/threshold. This is probably mainly a problem for downstream, where 
updating code for this would be difficult. I know that's not a proper 
argument but I hope we can reach something that works for both worlds.

Here's a proposal in between:

* Keep syncpoint allocation and submission in jobs as in my original 
proposal
* Don't attempt to recover user channel contexts. What this means:
   * If we have a hardware channel per context (MLOCKing), just tear 
down the channel
   * Otherwise, we can just remove (either by patching or by full 
teardown/resubmit of the channel) all jobs submitted by the user channel 
context that submitted the hanging job. Jobs of other contexts would be 
undisturbed (though potentially delayed, which could be taken into 
account and timeouts adjusted)
* If this happens, we can set removed jobs' post-fences to error status 
and user will have to resubmit them.
* We should be able to keep the syncpoint refcounting based on fences.

This can be made more fine-grained by not caring about the user channel 
context, but tearing down all jobs with the same syncpoint. I think the 
result would be that we can get either what you described (or how I 
understood it in the summary in the beginning of the message), or a more 
traditional syncpoint-per-userctx workflow, depending on how the 
userspace decides to allocate syncpoints.

If needed, the kernel can still do e.g. reordering (you mentioned job 
priorities) at syncpoint granularity, which, if the userspace followed 
the model you described, would be the same thing as job granularity.

(Maybe it would be more difficult with current drm_scheduler, sorry, 
haven't had the time yet to read up on that. Dealing with clearing work 
stuff up before summer vacation)

Mikko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
