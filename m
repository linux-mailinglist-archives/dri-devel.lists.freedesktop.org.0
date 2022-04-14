Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F16EE501C4A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 22:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47C910E2E5;
	Thu, 14 Apr 2022 20:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AD510E2E5;
 Thu, 14 Apr 2022 20:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649966466; x=1681502466;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6SG+3CsiHlJbOSDbfGJomT4dBWShXsbA04zZqqH4KoU=;
 b=AweCmJUeGR7NQhSgBbOCpTfgjXiewMPqj7NUhBi30csxsN1yVaHCDfQn
 ja8LpRZmdj5nfLNS72BfRtsc76gcYL0JxNT/+kmyB/6RBR8s+8NQqKiZN
 P3weH4DZ+CVRID+QyZxCdla5yma3HOJPVl20rfq3wDczKmWkiRdrDhxtk w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Apr 2022 13:01:06 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 13:01:05 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 13:01:04 -0700
Received: from [10.111.169.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Apr
 2022 13:01:01 -0700
Message-ID: <e3154f3b-aea4-6961-b409-6b20ff8bf18e@quicinc.com>
Date: Thu, 14 Apr 2022 13:00:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v7 0/4] Add support for the eDP panel over
 aux_bus
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Doug Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Ui6BAsnTaJ2_TMh1Tnjtaw7FR92aWoUysS+UT=c0qB3Q@mail.gmail.com>
 <20afcd97-4b8d-f770-151a-268b893b7c5a@linaro.org>
 <CAE-0n51fc-b-8VF7XP29=o8Xi86HQALGB-1u8n3b_3NjVyyJYw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n51fc-b-8VF7XP29=o8Xi86HQALGB-1u8n3b_3NjVyyJYw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>, devicetree@vger.kernel.org,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <seanpaul@chromium.org>, Steev
 Klimaszewski <steev@kali.org>, Aravind
 Venkateswaran <quic_aravindh@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

On 4/14/2022 12:43 PM, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-04-14 12:20:31)
>> On 14/04/2022 19:40, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Thu, Apr 14, 2022 at 5:19 AM Sankeerth Billakanti
>>> <quic_sbillaka@quicinc.com> wrote:
>>>>
>>>> This series adds support for generic eDP panel over aux_bus.
>>>>
>>>> These changes are dependent on the following series:
>>>> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=613654&state=*
>>>
>>> You're basically depending on the last two patches of that series.
>>> What's the plan there? In patchwork they're marked as "Not
>>> Applicable". If they're good to go, maybe we should land them? If not,
>>> maybe you should include them (with Dmitry as the author, of course)
>>> at the beginning of your series?
>>
>> No, please do not resend patches. The patches in question are marked as
>> 'Not applicable' as they are really not applicable to Bjorn's tree.
>> It would be better to point to the correct patchwork:
>>
>> https://patchwork.freedesktop.org/series/98585/
>>
>> Note those patches still lack the R-B tag. I can include them anyway,
>> basing on Sankeerth's Tested-by tag, but the formal R-B would also be good.
>>
> 
> Can you resend those as not RFC?

Yes, please resend these, I can ack them.

Previously I held off my ack, as kuogee ran into some issues testing 
them which was later concluded to be a mismatch in QC internal trees due 
to different versions of the changes.( another reason why we should get 
these landed ).

Now, that Sankeerth has tested these, if you can remove RFC and post 
them, I can ack the.

Thanks

Abhinav
