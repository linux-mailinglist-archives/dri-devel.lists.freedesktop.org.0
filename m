Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C60A5A2916
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 16:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B2D10E799;
	Fri, 26 Aug 2022 14:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45D210E860
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 14:09:05 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id s6so2126782lfo.11
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 07:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=/jvB3Zk9Ur35ndfTH3ClegVJp3L5YsswZJHu0HBwLYs=;
 b=jQx3CjsoG4/KqyBTEu7I7zus+LfGm5o2i5DJwYB8PEnBnlqdKMQzoZvzit0d6HbeH0
 792OCLK+089fkSLzsDQuf2cforIA6vpukpmf76nehp/qDWBuiYMLjsmWpN7WNH5AxDdU
 qpnOWvv9wKrOoyONFNZu8kA2YQFNeacvY52jZO1JOzAfRuPnJ64iqc/6Bj7UjCoJT6WC
 zyeDGn0/ILk/Tj/GtHLoIKMB53JY16zqhRiRyTuqu7Y39WVoUVn4D7QLzoexl5+rPLhO
 uOcCOqIghY4npZvkgBcYBxMGS4rUzVeEnIKhbPm0++/HPXlt1SnjdlVgM4xqrUkhK7kO
 o9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=/jvB3Zk9Ur35ndfTH3ClegVJp3L5YsswZJHu0HBwLYs=;
 b=3CibOlQKSHajEG4MpaKfu4j6ci8bH1LuE6DqO8GuuxiAUvO26nAP/a8godSP+YC475
 qGpmsfqMYacpJ4JDq4xq2XKZEFzQvgc2KoIpEUIL2Kv2L0YgO3T0aHbXpOugJd1FXufs
 WexszJ8RUCE8t4g5maCEdZ+MAoSNrTlJrCMBL8LZBQ55kOLMLHvTnMCcWaq7nqdwnGrk
 mNmHVRzBv+s2K38kmMT9DkLIF6TyIsmUMMBPQEVTxt06aTBOC0LYONBlzsEPnWMFM5Sh
 3WoOCkLWX6kAn8VxNx1r1jWwrI2ybk4UZgvIgW7Hzmt4gOk+zed0Hst9UamSh+oqRqQo
 9hKA==
X-Gm-Message-State: ACgBeo1ip5Zt6TjRdGB3q7z+pOy78j38UmjfY9/UJqDIo7zz2xkBTfSr
 TOgX5kkkjHZlz35FuqXDT7WtOw==
X-Google-Smtp-Source: AA6agR7HiAAjmQ+OSdNfaAHoyknzoyrjx3MUmL1Ng+Vf6qRLQP4g75Bp3THQvj6bRqHPWOxdn6lnQw==
X-Received: by 2002:a05:6512:68d:b0:492:ec42:1dd2 with SMTP id
 t13-20020a056512068d00b00492ec421dd2mr2597519lfe.55.1661522944058; 
 Fri, 26 Aug 2022 07:09:04 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a19ad4a000000b00492c017de43sm390763lfd.127.2022.08.26.07.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 07:09:03 -0700 (PDT)
Message-ID: <37834264-f6a0-fe71-e4c6-2edca9475d5a@linaro.org>
Date: Fri, 26 Aug 2022 17:09:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [v1 2/2] drm/msm/disp/dpu1: enable crtc color management based on
 encoder topology
Content-Language: en-GB
To: Kalyan Thota <kalyant@qti.qualcomm.com>,
 "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>
References: <1655802387-15275-1-git-send-email-quic_kalyant@quicinc.com>
 <1655802387-15275-2-git-send-email-quic_kalyant@quicinc.com>
 <CAA8EJponMDAXDAZ9zpkYEZvONDAztuXhjwZ6y7rgo1HtQOMtfQ@mail.gmail.com>
 <BN0PR02MB81426CB90870085223C308A496B99@BN0PR02MB8142.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <BN0PR02MB81426CB90870085223C308A496B99@BN0PR02MB8142.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/06/2022 14:56, Kalyan Thota wrote:
> Thanks for the comments, Dmitry. I haven't noticed mode->hdisplay being used. My idea was to run thru the topology and tie up the encoders with dspp to the CRTCs.
> Since mode is available only in the commit, we cannot use the dpu_encoder_get_topology during initialization sequence.
> 
> The requirement here is that when we initialize the crtc, we need to enable drm_crtc_enable_color_mgmt only for the crtcs that support it. As I understand from Rob, chrome framework will check for the enablement in order to exercise the feature.
> 
> Do you have any ideas on how to handle this requirement ? Since we will reserve the dspp's only when a commit is issued, I guess it will be too late to enable color management by then.

I have been thinking about this for quite a while.

Basically I fear you have two options:
- Register the color management for all CRTCs. In dpu_rm_reserve() check 
for the ctm, allocate LMs taking the available DSPPs into account. Fail 
the atomic_check() if there are no available LMs with required 
capabilities. Additional bonus point for moving LM/DSPP resource 
allocation from dpu_encoder into dpu_crtc.

- Register CRTCs and it's colormanagement properties according to exact 
available hardware. Let the userspace composer select the CRTC for the 
connector basing on the availability of the CTM support.

I'd vote strongly against any attempt to put the policy ('e.g. enable 
CTM only for the eDP and first DSI display') into the kernel, because we 
can not predict the actual usecases the user needs. It well might be 
that the user of the laptop will work with DP displays only and thus 
require color management for DP.

> 
> @robdclark@gmail.com
> Is it okay, if we disable color management for all the crtcs during initialization and enable it when we have dspps available during modeset. Can we framework code query for the property before issuing a commit for the frame after modeset ?
> 

-- 
With best wishes
Dmitry

