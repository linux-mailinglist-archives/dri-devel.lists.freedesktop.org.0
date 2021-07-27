Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CD43D6B26
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 02:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7195B72DC5;
	Tue, 27 Jul 2021 00:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1958672DB0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 00:39:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627346400; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=PPZzWsj9t1GaVOo/Sz9vj2rWvXeIR9LfpuAnWqpczlk=;
 b=Q71FIaAx1sNsjBw7qt26iSgXAI/h4AdEeRqIOcoInmGar8Vm/MaKO29tIHDvcY1oOqCKz+yM
 ayHEazQ/cKVaYIxOk+67gell/GaaHehvQbPYNVmIvuPYus6+vsQH2NOZ/juTZ94PuMkVUtQV
 iuX2alqiRe9+OJrRA3irJcr50jM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60ff55d5e81205dd0af913f6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Jul 2021 00:39:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8724BC433D3; Tue, 27 Jul 2021 00:39:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: maitreye)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A7ECC433F1;
 Tue, 27 Jul 2021 00:39:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 26 Jul 2021 17:39:48 -0700
From: maitreye@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v5] drm/msm/dp: add logs across DP driver for ease of
 debugging
In-Reply-To: <CAE-0n50gGT8nfQ0KEnCG=g2DiQdCPpQZsFOVB_8iROmHXXjNFg@mail.gmail.com>
References: <1627320986-25436-1-git-send-email-maitreye@codeaurora.org>
 <CAE-0n50gGT8nfQ0KEnCG=g2DiQdCPpQZsFOVB_8iROmHXXjNFg@mail.gmail.com>
Message-ID: <e3a560813463d54d35d8f381e35f4ea9@codeaurora.org>
X-Sender: maitreye@codeaurora.org
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you Stephen for reviewing.

On 2021-07-26 14:31, Stephen Boyd wrote:
> Quoting maitreye (2021-07-26 10:36:26)
>> @@ -509,6 +515,7 @@ static int dp_display_usbpd_attention_cb(struct 
>> device *dev)
>>                 DRM_ERROR("invalid dev\n");
>>                 return -EINVAL;
>>         }
>> +       DRM_DEBUG_DP("sink_request: %d\n", sink_request);
> 
> This one is bad. sink_request isn't assigned yet.
> 
Yes, thank you will fix it
>> 
>>         dp = container_of(g_dp_display,
>>                         struct dp_display_private, dp_display);
>> @@ -523,6 +530,7 @@ static int dp_display_usbpd_attention_cb(struct 
>> device *dev)
>>         rc = dp_link_process_request(dp->link);
>>         if (!rc) {
>>                 sink_request = dp->link->sink_request;
>> +               DRM_DEBUG_DP("hpd_state=%d sink_count=%d\n", 
>> dp->hpd_state, sink_request);
> 
> Should that say sink_request?
> 

Yes will fix this

>>                 if (sink_request & DS_PORT_STATUS_CHANGED)
>>                         rc = 
>> dp_display_handle_port_ststus_changed(dp);
>>                 else
