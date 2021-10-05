Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E96A4222BA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 11:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082926EB47;
	Tue,  5 Oct 2021 09:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30296EB47
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 09:53:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633427586; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=9NNh8Apyajof6vjdxuO0fo4bjhrIb3avsDuXH6d364Y=;
 b=cmU09FKiJ5qkmJAj9xWHU8xnIZcMGvL9uf9I7Drz6lXs0ywGcdBc6ICwMUpZKYgp9Z8QPzQl
 Wzze6Zcx9hwp3dHTX6Cu/4ohs4kWFbgj0duXjM4CRs+BDuC7Jt51Ib+sHI/NUfBe9muVshhT
 BkloAWVzkMVD9sAQdcqzBfM+iBw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 615c207a47d64efb6d0f59c1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 09:52:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 327B5C4360C; Tue,  5 Oct 2021 09:52:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mkrishn)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7639EC4338F;
 Tue,  5 Oct 2021 09:52:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 05 Oct 2021 15:22:57 +0530
From: mkrishn@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org,
 sbillaka@codeaurora.org, abhinavk@codeaurora.org, robdclark@gmail.com,
 bjorn.andersson@linaro.org, khsieh@codeaurora.org, rajeevny@codeaurora.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sc7280: add display dt nodes
In-Reply-To: <CAE-0n53wqdo7NBZn4UMRZDtc3MrF6JdvZpjcfGapJT1s5iV2jQ@mail.gmail.com>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
 <1629282424-4070-2-git-send-email-mkrishn@codeaurora.org>
 <CAE-0n50b=pX=1MFwGPDvDR=O03tUAkAgyMonGm2+SXBft=16KQ@mail.gmail.com>
 <5adf2ab2c2a162272509d253bd797721@codeaurora.org>
 <CAE-0n53kQU=8pdcWR0OZap1wDgxxwed0qvfaGruc71YT5Cj1iA@mail.gmail.com>
 <8f344213978f31c04e80b804a931db56@codeaurora.org>
 <CAE-0n53wqdo7NBZn4UMRZDtc3MrF6JdvZpjcfGapJT1s5iV2jQ@mail.gmail.com>
Message-ID: <41fb0eec922ff8499bb4b95ab29000f3@codeaurora.org>
X-Sender: mkrishn@codeaurora.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-10-05 07:21, Stephen Boyd wrote:
> Quoting mkrishn@codeaurora.org (2021-09-30 23:39:07)
>> On 2021-09-30 23:28, Stephen Boyd wrote:
>> > Quoting mkrishn@codeaurora.org (2021-09-30 04:56:59)
>> >> On 2021-08-19 01:27, Stephen Boyd wrote:
>> >> > Quoting Krishna Manikandan (2021-08-18 03:27:02)
>> >> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> >> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> >> index 53a21d0..fd7ff1c 100644
>> >> >> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> >> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> >> >> +
>> >> >> +                       status = "disabled";
>> >> >> +
>> >> >> +                       mdp: mdp@ae01000 {
>> >> >
>> >> > display-controller@ae01000
>> >>
>> >> Stephen,
>> >>     In the current driver code, there is a substring comparison for
>> >> "mdp"
>> >> in device node name as part of probe sequence. If "mdp" is not present
>> >> in the node name, it will
>> >>     return an error resulting in probe failure. Can we continue using
>> >> mdp
>> >> as nodename instead of display controller?
>> >>
>> >
>> > Can we fix the driver to not look for node names and look for
>> > compatible
>> > strings instead? It took me a minute to find compare_name_mdp() in
>> > drivers/gpu/drm/msm/msm_drv.c to understand what you're talking about.
>> > Perhaps looking for qcom,mdp5 in there will be sufficient instead of
>> > looking at the node name.
>> 
>> Sure Stephen. I will make the necessary changes in msm_drv.c to look 
>> for
>> compatible string instead of node name.
>> Can I include these two changes (changing mdp--> display controller 
>> and
>> msm_drv.c changes) in a separate series ?
>> 
> 
> Sure. So you'll send the drm driver change now and we'll get the DT
> change after that with the more generic node name?

Yes Stephen.I have raised the change to fix the driver issue.
https://patchwork.kernel.org/project/linux-arm-msm/patch/1633427071-19523-1-git-send-email-mkrishn@codeaurora.org/

Regards,
Krishna

