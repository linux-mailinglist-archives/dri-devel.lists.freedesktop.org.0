Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEE49890F1
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 19:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5679A10E23F;
	Sat, 28 Sep 2024 17:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="I4kUfdc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0A210E23F;
 Sat, 28 Sep 2024 17:53:36 +0000 (UTC)
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default
 [172.22.0.5])
 by mail.mainlining.org (Postfix) with ESMTPSA id E5E9FE450F;
 Sat, 28 Sep 2024 17:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1727546013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSO46y2MsMCH4n0dK8IGiKeBd1ttkG4kqyrsA9j/Hq4=;
 b=I4kUfdc6sg9FvyVB2/m/sDCTm7HrDAsS4AI0dp/yO8e7iGyNDcWxXDrJAMTwFK2YPQJQaP
 tkvBJ96MWbDlUu1tFFL6YCBHOBN01X5oTHcugGECKY8FD1jnLECYaXVg3V3hA9nNsPQ6f3
 hVKT7pmAGC6dctibGKTTd6usR3qE+AaJtLs3QKfiQWRxS+0Q2vtmJ9xCn4fVHCkQk29xMQ
 2cTb2fPvdvq2ejsVDHXqIn6ArbxvOAnk/S5swYCLEKm+uveIEP2jh1Cp8RK3Uwtq+ovVO/
 dFan15jcMyKm2Bv3KV6rp7xt1N8s652vuyDifo8nBJqpP9WLhNhgbpb2yj0W+w==
MIME-Version: 1.0
Date: Sat, 28 Sep 2024 19:53:33 +0200
From: barnabas.czeman@mainlining.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Konrad Dybcio
 <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
In-Reply-To: <CAA8EJpr0C-gXDoJsStTxJzCMEkbZaPeEAcBES3GqZp1FcKb=4Q@mail.gmail.com>
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
 <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22>
 <05c1f93940c38087e8d245d2b6bf90e0@mainlining.org>
 <CAA8EJpr0C-gXDoJsStTxJzCMEkbZaPeEAcBES3GqZp1FcKb=4Q@mail.gmail.com>
Message-ID: <675e6c45a3a2297ccc17aad9de1c802e@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
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

On 2024-09-27 18:02, Dmitry Baryshkov wrote:
> On Fri, 27 Sept 2024 at 17:39, <barnabas.czeman@mainlining.org> wrote:
>> 
>> On 2024-08-01 21:25, Dmitry Baryshkov wrote:
>> > On Fri, Jun 28, 2024 at 04:39:38PM GMT, Barnabás Czémán wrote:
>> >> This patch series add dpu support for MSM8996/MSM8953 devices.
>> >>
>> >> Note, by default these platforms are still handled by the MDP5 driver
>> >> unless the `msm.prefer_mdp5=false' parameter is provided.
>> >
>> > Could you please provide a summary of features actually tested with the
>> > DPU driver? Have you tested YUV output? Have you tested RGB planes?
>> I have checked all planes they are working fine.
>> 
>> > Which LMs have you tested?
>> I have done some more testing and msm8953 LMs are fine but i have 
>> found
>> out
>> on msmm8996 LM_3 and LM_4 is not working as i see in downstream sde 
>> code
>> they are not exists.
>> This kind of messages i got for LM_3 and LM_4
>> [   34.751091] [drm:_dpu_rm_make_reservation] [dpu error]unable to 
>> find
>> appropriate mixers
>> [   34.751112] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw
>> resources: -119
> 
> I think LM_3 / LM_4 are WB-only, but I didn't have time to check that.
> Maybe it's easier to omit them for now.
> 
> I hope to get back to those platforms during the forthcoming or the
> next development cycle, after (hopefully) finishing the HDMI
> conversion story.
I have tested MSM8917 and MSM8937 patches they are also working fine
at least with video mode panels, maybe they can be added for next 
iteration
intr_start also should be removed from CTLs.
