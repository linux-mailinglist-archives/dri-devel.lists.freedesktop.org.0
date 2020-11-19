Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B632B9D07
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 22:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A1D6E81B;
	Thu, 19 Nov 2020 21:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D10E6E81B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 21:44:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605822260; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=N1TBPgiWEu6eeI48iATwp7Wbsru0LkqIRCOUWpWAh30=;
 b=n9oMN+dOjMO+FhsJE0MRUd1AXC+Ft1/ewtLBEy3cEQtEMNRviV6NdH2Nw18zELalrGfNbEBO
 Ev6jcPDSlWkzAGbAfguoxLWYZx9hYorI7HMl/rb5/xnZ9DiLX8zU92uri4AxU5uFDoS68+AA
 ZxqgGmI5J7zPDWXh0pqBzLHgJd0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fb6e71e77b63cdb34be5107 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Nov 2020 21:43:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6353FC43461; Thu, 19 Nov 2020 21:43:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D428C433C6;
 Thu, 19 Nov 2020 21:43:57 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 19 Nov 2020 13:43:57 -0800
From: abhinavk@codeaurora.org
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Remove chatty vbif debug print
In-Reply-To: <4c955afcc2eb28794a5bbcc0e1642592@codeaurora.org>
References: <20201117172608.2091648-1-swboyd@chromium.org>
 <71aebca216babf4010c92d4d1ce9a9b4@codeaurora.org>
 <160565358127.60232.4382778730228368993@swboyd.mtv.corp.google.com>
 <CAF6AEGsDyvFVxAME1_VUprPKdrpEGdvP9XrQEG_-=1mRRcRBow@mail.gmail.com>
 <4c955afcc2eb28794a5bbcc0e1642592@codeaurora.org>
Message-ID: <e8c2bc585f740fdb302c0c14a66d5b67@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-18 12:03, abhinavk@codeaurora.org wrote:
> Hi Stephen
> 
> On 2020-11-18 07:49, Rob Clark wrote:
>> On Tue, Nov 17, 2020 at 2:53 PM Stephen Boyd <swboyd@chromium.org> 
>> wrote:
>>> 
>>> Quoting abhinavk@codeaurora.org (2020-11-17 12:34:56)
>>> > On 2020-11-17 09:26, Stephen Boyd wrote:
>>> > > I don't know what this debug print is for but it is super chatty,
>>> > > throwing 8 lines of debug prints in the logs every time we update a
>>> > > plane. It looks like it has no value. Let's nuke it so we can get
>>> > > better logs.
>>> > >
>>> > > Cc: Sean Paul <sean@poorly.run>
>>> > > Cc: Abhinav Kumar <abhinavk@codeaurora.org>
>>> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>> >
>>> > > ---
>>> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 3 ---
>>> > >  1 file changed, 3 deletions(-)
>>> > >
>>> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>>> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>>> > > index 5e8c3f3e6625..5eb2b2ee09f5 100644
>>> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>>> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>>> > > @@ -245,9 +245,6 @@ void dpu_vbif_set_qos_remap(struct dpu_kms
>>> > > *dpu_kms,
>>> > >       forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl,
>>> > > true);
>>> > >
>>> > >       for (i = 0; i < qos_tbl->npriority_lvl; i++) {
>>> > > -             DPU_DEBUG("vbif:%d xin:%d lvl:%d/%d\n",
>>> > > -                             params->vbif_idx, params->xin_id, i,
>>> > > -                             qos_tbl->priority_lvl[i]);
>>> >
>>> > Instead of getting rid of this print, we should optimize the caller of
>>> > this.
>>> 
>>> Does the print tell us anything? Right now it prints 8 lines where it
>>> feels like it could be trimmed down:
>>> 
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:0/3
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:1/3
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:2/4
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:3/4
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:4/5
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:5/5
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:6/6
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:7/6
>>> 
>>> maybe one line that combines the index into values?
>>> 
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 [3 3 4 4 5 5 6 
>>> 6]
>>> 
>> 
>> or possibly convert to a tracepoint (so it doesn't spam the drm_trace 
>> buffer)
>> 
>> BR,
>> -R
>> 
>>> But again I have no idea if this print is really useful. Maybe we can
>>> print it only if the value changes from what was already there?
>>> Basically move the print into dpu_hw_set_qos_remap() and then skip 
>>> out
>>> early if nothing changed or print and modify the register.
>>> 
>>> > This is what
>>> > we are doing in downstream. So we need to update the property only if we
>>> > are switching from a RT client
>>> > to non-RT client for the plane and vice-versa. So we should try to do
>>> > the same thing here.
>>> >
>>> >         is_rt = sde_crtc_is_rt_client(crtc, crtc->state);
>>> >         if (is_rt != psde->is_rt_pipe) {
>>> >                 psde->is_rt_pipe = is_rt;
>>> >                 pstate->dirty |= SDE_PLANE_DIRTY_QOS;
>>> >         }
>>> >
>>> >
>>> >         if (pstate->dirty & DPU_PLANE_DIRTY_QOS)
>>> >                 _dpu_plane_set_qos_remap(plane);
>>> >
>>> 
>>> Sounds great! Can you send the patch?
> 
> Will finalize approach and send the patch in a day or two.
> 
> Thanks
> 
> Abhinav

patch has been posted here for review : 
https://patchwork.freedesktop.org/patch/401929/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
