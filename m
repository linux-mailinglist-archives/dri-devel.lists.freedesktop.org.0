Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DAF4EDF44
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 18:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3368610E781;
	Thu, 31 Mar 2022 16:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289D010E781
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:59:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22VBuDC4017428;
 Thu, 31 Mar 2022 18:59:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=w68sfe+NLT4xowKHoyK8e+uvhWVpvW5hTbaOZX1FKxc=;
 b=4dSM6gagwzpU60PG5yeGDDjf/LuwE1kxCFmuMdQKfLmrNabJaIGcJJuoAAHHK3zf0FWc
 GJzlxFlZTQ62nv9UDuYSkLHs/uCUOU3EyDm1oUV9CAw9jgISaG1C1bFwdFJagksdyqHD
 MQCrbVvVEhy2XWqnr8sJqM4g/1hKJIQ7iHNjpbMS2Bwd2UYukztLHYAsFpd0O5txctnh
 BJ39LqMUSlee4sicGOudfA/9CEZk3Astj1U9/2B7SVTqRAEDjvh9c1et8b1vducyQU4r
 yts0mn4cWnQ+MwqkrVvpUUkEddKD4UrXU8h31ZzVT0+FHputeBUob9jzqwyUTivTXK5u 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1tkmu0kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 18:59:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6881510002A;
 Thu, 31 Mar 2022 18:59:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1DFD123711D;
 Thu, 31 Mar 2022 18:59:02 +0200 (CEST)
Received: from [10.211.3.143] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 31 Mar
 2022 18:59:01 +0200
Message-ID: <483b5089-a99e-c348-8dee-11d1e298c20e@foss.st.com>
Date: Thu, 31 Mar 2022 18:58:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm: sti: don't use kernel-doc markers
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Alain Volmat <alain.volmat@foss.st.com>
References: <20220326235132.25192-1-rdunlap@infradead.org>
 <20220328102116.GA2406908@gnbcxd0016.gnb.st.com>
 <YkHFn0UG9FjGeowF@phenom.ffwll.local>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <YkHFn0UG9FjGeowF@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_05,2022-03-31_01,2022-02-23_01
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
Cc: Aditya Srivastava <yashsri421@gmail.com>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/28/22 16:26, Daniel Vetter wrote:
> On Mon, Mar 28, 2022 at 12:21:16PM +0200, Alain Volmat wrote:
>> Hi Randy,
>>
>> thanks for the patch.
>>
>> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> Will Philippe apply this one?

Hi,
yes I will (probably early next week).
Many thanks
Philippe

> 
> Just trying to make sure this wont be lost, just acking isn't enough :-)
> -Daniel
> 
>>
>> Alain
>>
>> On Sat, Mar 26, 2022 at 04:51:32PM -0700, Randy Dunlap wrote:
>>> Don't mark static functions as kernel-doc.
>>>
>>> Prevents multiple kernel-doc build warnings:
>>>
>>> drivers/gpu/drm/sti/sti_hdmi.c:187: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>>>   * HDMI interrupt handler threaded
>>> drivers/gpu/drm/sti/sti_hdmi.c:219: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>>>   * HDMI interrupt handler
>>> drivers/gpu/drm/sti/sti_hdmi.c:241: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>>>   * Set hdmi active area depending on the drm display mode selected
>>> drivers/gpu/drm/sti/sti_hdmi.c:262: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>>>   * Overall hdmi configuration
>>> drivers/gpu/drm/sti/sti_hdmi.c:340: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>>>   * Helper to concatenate infoframe in 32 bits word
>>> drivers/gpu/drm/sti/sti_hdmi.c:357: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>>>   * Helper to write info frame
>>> drivers/gpu/drm/sti/sti_hdmi.c:427: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>>>   * Prepare and configure the AVI infoframe
>>> drivers/gpu/drm/sti/sti_hdmi.c:470: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>>>   * Prepare and configure the AUDIO infoframe
>>> drivers/gpu/drm/sti/sti_hdmi.c:555: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>>>   * Software reset of the hdmi subsystem
>>>
>>> Fixes: 5402626c83a2 ("drm: sti: add HDMI driver")
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Aditya Srivastava <yashsri421@gmail.com>
>>> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>>> Cc: Alain Volmat <alain.volmat@foss.st.com>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> ---
>>>   drivers/gpu/drm/sti/sti_hdmi.c |   20 ++++++++++----------
>>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>>
>>> --- linux-next-20220325.orig/drivers/gpu/drm/sti/sti_hdmi.c
>>> +++ linux-next-20220325/drivers/gpu/drm/sti/sti_hdmi.c
>>> @@ -183,7 +183,7 @@ void hdmi_write(struct sti_hdmi *hdmi, u
>>>   	writel(val, hdmi->regs + offset);
>>>   }
>>>   
>>> -/**
>>> +/*
>>>    * HDMI interrupt handler threaded
>>>    *
>>>    * @irq: irq number
>>> @@ -215,7 +215,7 @@ static irqreturn_t hdmi_irq_thread(int i
>>>   	return IRQ_HANDLED;
>>>   }
>>>   
>>> -/**
>>> +/*
>>>    * HDMI interrupt handler
>>>    *
>>>    * @irq: irq number
>>> @@ -237,7 +237,7 @@ static irqreturn_t hdmi_irq(int irq, voi
>>>   	return IRQ_WAKE_THREAD;
>>>   }
>>>   
>>> -/**
>>> +/*
>>>    * Set hdmi active area depending on the drm display mode selected
>>>    *
>>>    * @hdmi: pointer on the hdmi internal structure
>>> @@ -258,7 +258,7 @@ static void hdmi_active_area(struct sti_
>>>   	hdmi_write(hdmi, ymax, HDMI_ACTIVE_VID_YMAX);
>>>   }
>>>   
>>> -/**
>>> +/*
>>>    * Overall hdmi configuration
>>>    *
>>>    * @hdmi: pointer on the hdmi internal structure
>>> @@ -336,7 +336,7 @@ static void hdmi_infoframe_reset(struct
>>>   		hdmi_write(hdmi, 0x0, pack_offset + i);
>>>   }
>>>   
>>> -/**
>>> +/*
>>>    * Helper to concatenate infoframe in 32 bits word
>>>    *
>>>    * @ptr: pointer on the hdmi internal structure
>>> @@ -353,7 +353,7 @@ static inline unsigned int hdmi_infofram
>>>   	return value;
>>>   }
>>>   
>>> -/**
>>> +/*
>>>    * Helper to write info frame
>>>    *
>>>    * @hdmi: pointer on the hdmi internal structure
>>> @@ -423,7 +423,7 @@ static void hdmi_infoframe_write_infopac
>>>   	hdmi_write(hdmi, val, HDMI_SW_DI_CFG);
>>>   }
>>>   
>>> -/**
>>> +/*
>>>    * Prepare and configure the AVI infoframe
>>>    *
>>>    * AVI infoframe are transmitted at least once per two video field and
>>> @@ -466,7 +466,7 @@ static int hdmi_avi_infoframe_config(str
>>>   	return 0;
>>>   }
>>>   
>>> -/**
>>> +/*
>>>    * Prepare and configure the AUDIO infoframe
>>>    *
>>>    * AUDIO infoframe are transmitted once per frame and
>>> @@ -551,7 +551,7 @@ static int hdmi_vendor_infoframe_config(
>>>   
>>>   #define HDMI_TIMEOUT_SWRESET  100   /*milliseconds */
>>>   
>>> -/**
>>> +/*
>>>    * Software reset of the hdmi subsystem
>>>    *
>>>    * @hdmi: pointer on the hdmi internal structure
>>> @@ -785,7 +785,7 @@ static void sti_hdmi_disable(struct drm_
>>>   	cec_notifier_set_phys_addr(hdmi->notifier, CEC_PHYS_ADDR_INVALID);
>>>   }
>>>   
>>> -/**
>>> +/*
>>>    * sti_hdmi_audio_get_non_coherent_n() - get N parameter for non-coherent
>>>    * clocks. None-coherent clocks means that audio and TMDS clocks have not the
>>>    * same source (drifts between clocks). In this case assumption is that CTS is
> 
