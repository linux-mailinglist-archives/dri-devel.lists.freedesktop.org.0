Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BAD85C843
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B9710E599;
	Tue, 20 Feb 2024 21:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XsWD8pON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3670C10E599;
 Tue, 20 Feb 2024 21:20:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41KJCexP030209; Tue, 20 Feb 2024 21:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=H6O6IN0FLUFY67BqvbGDPUwv9Brej8fWYwf7T7Ko96A=; b=Xs
 WD8pON1wuBU8UnXiuPHMAGSPNvtGbh3alZb1w865+6HUy3lbxTDe7DLvGtixy9hi
 kBSOIilj4u1L0aUw5HZSHrXcWKIIW40Z8Vf+kDffZcl3psemNT3YQ/R5ovx65lfN
 rRsYsHSnUnhFRfvvr4LQj2HDiCrlycx4cOhc+haJw8X2VhvGVBc4nydZlkvlWc4m
 Y9Quq8tDekB0WXQfPxYFfm/9Gs8MKjvTMgzyjCK5tbMtO30lwjkEivA1o13n9Ulz
 yagCK+i17/MUf4LqL2NF0cz0gsSgRaD0bg+jOmuTFF8jhavYw1UoeNEBlnMzicxC
 PxjIQqmRPCKx79ROjF/Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd21s8845-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 21:19:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KLJtff011500
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 21:19:55 GMT
Received: from [10.110.62.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 13:19:55 -0800
Message-ID: <2df31f2d-8271-d966-158a-27c6e0581d72@quicinc.com>
Date: Tue, 20 Feb 2024 13:19:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: drm/msm: Second DisplayPort regression in 6.8-rc1
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>, Rob Clark <robdclark@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
CC: Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_sbillaka@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <regressions@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
References: <ZctVmLK4zTwcpW3A@hovoldconsulting.com>
 <343710b1-f0f4-5c05-70e6-3c221cdc9580@quicinc.com>
 <ZczFhVjHIm55JTfO@hovoldconsulting.com>
 <ZdDNcrf4KpflGeYQ@hovoldconsulting.com>
 <ZdMwZa98L23mu3u6@hovoldconsulting.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ZdMwZa98L23mu3u6@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Hl5aawAxtW2f1v768sW3t1t5uudFPIhs
X-Proofpoint-GUID: Hl5aawAxtW2f1v768sW3t1t5uudFPIhs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402200152
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

Hi Johan

On 2/19/2024 2:41 AM, Johan Hovold wrote:
> On Sat, Feb 17, 2024 at 04:14:58PM +0100, Johan Hovold wrote:
>> On Wed, Feb 14, 2024 at 02:52:06PM +0100, Johan Hovold wrote:
>>> On Tue, Feb 13, 2024 at 10:00:13AM -0800, Abhinav Kumar wrote:
> 
>> Since Dmitry had trouble reproducing this issue I took a closer look at
>> the DRM aux bridge series that Abhinav pointed and was able to track
>> down the bridge regressions and come up with a reproducer. I just posted
>> a series fixing this here:
>>
>> 	https://lore.kernel.org/lkml/20240217150228.5788-1-johan+linaro@kernel.org/
>>
>> As I mentioned in the cover letter, I am still seeing intermittent hard
>> resets around the time that the DRM subsystem is initialising, which
>> suggests that we may be dealing with two separate DRM regressions here
>> however.
>>
>> If the hard resets are triggered by something like unclocked hardware,
>> perhaps that bit could this be related to the runtime PM rework?
> 
> It seems my initial suspicion that at least some of these regressions
> were related to the runtime PM work was correct. The hard resets happens
> when the DP controller is runtime suspended after being probed:
> 
> [   16.748475] bus: 'platform': __driver_probe_device: matched device ae00000.display-subsystem with driver msm-mdss
> [   16.759444] msm-mdss ae00000.display-subsystem: Adding to iommu group 21
> [   16.795226] bus: 'platform': __driver_probe_device: matched device ae01000.display-controller with driver msm_dpu
> [   16.807542] probe of ae01000.display-controller returned -517 after 3 usecs
> [   16.821552] bus: 'platform': __driver_probe_device: matched device ae90000.displayport-controller with driver msm-dp-display
> [   16.837749] probe of ae90000.displayport-controller returned -517 after 1 usecs
> [  OK  ] Listening on Load/Save RF Kill Swit[   16.854659] bus: 'platform': __dch Status /dev/rfkill Watch.
> [   16.868458] probe of ae98000.displayport-controller returned -517 after 2 usecs
> [   16.880012] bus: 'platform': __driver_probe_device: matched device aea0000.displayport-controller with driver msm-dp-display
> [   16.891856] probe of aea0000.displayport-controller returned -517 after 2 usecs
> [   16.903825] probe of ae00000.display-subsystem returned 0 after 144497 usecs
> [   16.911636] bus: 'platform': __driver_probe_device: matched device ae01000.display-controller with driver msm_dpu
> [   16.942092] probe of ae01000.display-controller returned 0 after 19593 usecs
>           Starting Load/Save Screen Backligh…rightness[   16.959146] bus: 'platform': _ of backlight:backlight...
> [   16.995355] msm-dp-display ae90000.displayport-controller: dp_display_probe - probe tail
> [   17.004032] probe of ae90000.displayport-controller returned 0 after 30225 usecs
> [   17.012308] bus: 'platform': __driver_probe_device: matched device ae98000.displayport-controller with driver msm-dp-display
> [   17.050193] msm-dp-display ae98000.displayport-controller: dp_display_probe - probe tail
>           Starting Network Name Resolution...
> [   17.058925] probe of ae98000.displayport-controller returned 0 after 34774 usecs
> [   17.074925] bus: 'platform': __driver_probe_device: matched device aea0000.displayport-controller with driver msm-dp-display
> [        Starting Network Time Synchronization...
> [   17.112000] msm-dp-display aea0000.displayport-controller: dp_display_probe - populate aux bus
> [   17.125208] msm-dp-display aea0000.displayport-controller: dp_pm_runtime_resume
>           Starting Record System Boot/Shutdown in UTMP...
>           Starting Virtual Console Setup...
> [  OK  ] Finished Load/Save Screen Backlight Brightness of backlight:backlight.
> [   17.197909] msm-dp-display aea0000.displayport-controller: dp_pm_runtime_suspend
> [   17.198079] probe of aea0Format: Log Type - Time(microsec) - Message - Optional Info
> Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
> S - QC_IMAGE_VERSION_STRING=BOOT.MXF.1.1-00470-MAKENA-1
> S - IMAGE_VARIANT_STRING=SocMakenaWP
> S - OEM_IMAGE_VERSION_STRING=crm-ubuntu92
> 
>    < machine is reset by hypervisor >
> 
> Presumably the reset happens when controller is being shut down while
> still being used by the EFI framebuffer.
> 

I am not sure if we can conclude like that. Even if we shut off the 
controller when the framebuffer was still being fetched that should only 
cause a blank screen and not a reset because we really don't trigger a 
new register write / read while its fetching so as such there is no new 
hardware access.

One thing I must accept is that there are two differences between 
sc8280xp where we are hitting these resets and sc7180/sc7280 chromebooks 
where we tested it more thoroughly without any such issues:

1) with the chromebooks we have depthcharge and not the QC UEFI.

If we are suspecting a hand-off issue here, will it help if we try to 
disable the display in EFI by using "fastboot oem select-display-panel 
none" (assuming this is a fastboot enabled device) and see if you still 
hit the reset issue?

2) chromebooks used "internal_hpd" whereas the pmic_glink method used in 
the sc8280xp.

I am still checking if there are any code paths in the eDP/DP driver 
left exposed due to this difference with pm_runtime which can cause 
this. I am wondering if some sort of drm tracing will help to narrow 
down the reset point.

> In the cases where the machines survives boot, the controller is never
> suspended.
> 
> When investigating this I've also seen intermittent:
> 
> 	[drm:dp_display_probe [msm]] *ERROR* device tree parsing failed
> 

So this error I think is because in dp_parser_parse() ---> 
dp_parser_ctrl_res(), we also have a devm_phy_get().

This can return -EDEFER if the phy driver has not yet probed.

I checked the other things inside dp_parser_parse(), others calls seem 
to be purely DT parsing except this one. I think to avoid the confusion, 
we should move devm_phy_get() outside of DT parsing into a separate call 
or atleast add an error log inside devm_phy_get() failure below to 
indicate that it deferred

         io->phy = devm_phy_get(&pdev->dev, "dp");
         if (IS_ERR(io->phy))
                 return PTR_ERR(io->phy);

If my hypothesis is correct on this, then this error log (even though 
misleading) should be harmless for this issue because if we hit 
DRM_ERROR("device tree parsing failed\n"); we will skip the 
devm_pm_runtime_enable().

> which also appears to be related to the runtime PM rework:
> 
> 	https://lore.kernel.org/lkml/1701472789-25951-1-git-send-email-quic_khsieh@quicinc.com/
> 
> I believe this is enough evidence to conclude that this second
> regression is introduced by commit 5814b8bf086a ("drm/msm/dp:
> incorporate pm_runtime framework into DP driver"):
> 
> #regzbot introduced: 5814b8bf086a
> 
> Has anyone given some thought to how the framebuffer handover is
> supposed to work? It seems we're currently just relying on luck with
> timing.
> 


> Johan
