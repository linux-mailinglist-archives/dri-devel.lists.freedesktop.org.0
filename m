Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E164E516DD3
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 12:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F5710F49B;
	Mon,  2 May 2022 10:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304A210F49B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 10:02:12 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id m23so17857636ljc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 03:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KOPGdbh45QmU1lZq137wkZ/HaK04DkVGfDPeTAYEjz4=;
 b=l82rXRRBLufeFvK+dS9d53l73gOMvQWaGCEKeu8/PWFsBrKtRwFsNWPZNabGPs2swu
 Y9TxXmw4ohDejcmWM7pKYtd8Cmcuq608SZvjRb4uN4MpwkqqS9FCjqUio8e2xqKrkl9j
 +UFSMESHZl5mZkictZ3dFSSHyZuq5BB+G0NKPxfDSWYmRukQjJH13brAvWj0CKAtdU91
 rF5winjQ3oXW+ZK8WfCtowa5lfpro0Y4eVUeOn1zHsLQLIfF9nC+7lWxHeJQD5CIHKjX
 ijDDKPFG8I0aFS3Dyl0VxRdgIazTDxGLESa+Lc+ZisUrUUkoZerYPY0d+iwXxiN8kJ4W
 gKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KOPGdbh45QmU1lZq137wkZ/HaK04DkVGfDPeTAYEjz4=;
 b=mg/aVgu6svMhf5aDJkmeMMYRzMZexK981EI0jN/dIhphO1FTDnb8MQJbxX6X9MqVXU
 CaUoLeDXhDw2EpeSsiWYoFYOa7E/8qF7aDoihs/sJVCgDj7yzoYJxUg/AawNLkxx8gG3
 BbiyckCkksmIlU0qoZHqMD581HV4eVmtX/J404PR3DoaEaeqGR8BcTIPhHOn845/PnkF
 Ie//aYlVQSxyTK9Ye9LYGznPeOT10e9nJVDTFmwY6j00m30L3aUvO9f53khnbtdIeqaY
 +GMb2mATsVZSEcz+qazq9y1J8y2UFpGbS2AwbHsmziuwGq/BfadLGNrErh8uULBhxRpD
 jzdA==
X-Gm-Message-State: AOAM532l+RcT0xDG5peGVdUH1IwUJo7YVqK5BK9CgO2lHC96/YwBpL+1
 BBwo3qWNAtE+yyfXETLsOSsa7g==
X-Google-Smtp-Source: ABdhPJxE9mqnC0lqweijI9yaTojJRCh2A6Lyf/yBlwRH02oh97snC1crtyfPdgClCgZAGBmy2zJTjA==
X-Received: by 2002:a2e:b5b9:0:b0:24f:fc6:42fe with SMTP id
 f25-20020a2eb5b9000000b0024f0fc642femr7278099ljn.510.1651485730538; 
 Mon, 02 May 2022 03:02:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a05651c200f00b0024f3d1dae99sm1019476ljo.33.2022.05.02.03.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 03:02:10 -0700 (PDT)
Message-ID: <f8986d6d-2c2b-a0a0-d63c-d4670f6864ff@linaro.org>
Date: Mon, 2 May 2022 13:02:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: use RMW cycles in
 dsi_update_dsc_timing
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <b4a3bfed-a842-b4ee-d9a5-5adf5b59c09b@quicinc.com>
 <20220501200635.ekl3fw47dv2zytt3@SoMainline.org>
 <d6a78564-745c-7301-1b57-efc35757fbfd@quicinc.com>
 <20220502083442.t365cfmivlga557g@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220502083442.t365cfmivlga557g@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Sean Paul <sean@poorly.run>, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/05/2022 11:34, Marijn Suijten wrote:
> On 2022-05-01 16:56:45, Abhinav Kumar wrote:
>> [snip]
>> Wouln't this macro already make sure that 'reg' doesnt have anything in
>> the top 16 bits? Its doing a & with 0x00003f00
> 
> Like I said, it is unlikely that this happens, only if someone starts
> changing the code that assigns to `reg` which is unlikely to pass review
> anyway.
> 
>> [snip]
>> We can have a common bitfield layout for the two channels for command mode.
>>
>> So we can do something like below for common fields:
>>
>> -static inline uint32_t
>> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(uint32_t val)
>> +static inline uint32_t
>> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM_DATATYPE(uint32_t val, uint32_t
>> stream_id)
>>    {
>> -       return ((val) <<
>> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT) &
>> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK;
>> +       return ((val) <<
>> (DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT + (stream_id
>> * 16)) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK;
>>    }
>>
>> Video mode can also use all of these except for WC as that field is not
>> present for cmd modes.
>>
>> This can go as a separate change .
>>
>> I can push this and perhaps get a Tested-by from Vinod as I dont have a
>> setup to re-validate this.
> 
> How would you represent this in XML?  I was hoping for a method that
> allows to construct the value in a generic way, without register names,
> and then simply have a "register macro" that moves (and perhaps masks)
> the preconstructed value into the right place.  A bit like how `enum`s
> are currently set up in XML, but with bit ranges for the values and
> macros to set a value.
> 
> I think I've _partially_ found what I was looking for: a `<bitset>`.
> However, I don't know if we can utilize this multiple times within a
> single `reg32`, once with an offset for stream1.  Alas, it's just
> bikeshedding at this point.

Unfortunately the following naïve patch doesn't work, stream1 bits are 
still defined in the 0:15 bit space. One would have to modify rnn tool 
to make sure that it takes into account the low/high parts of the 
bitfield when generating offsets/masks.

diff --git a/src/freedreno/registers/dsi/dsi.xml 
b/src/freedreno/registers/dsi/dsi.xml
index f2eef4ff41ae..b0166628ad0a 100644
--- a/src/freedreno/registers/dsi/dsi.xml
+++ b/src/freedreno/registers/dsi/dsi.xml
@@ -361,22 +361,19 @@ 
xsi:schemaLocation="http://nouveau.freedesktop.org/ rules-ng.xsd">
                 <bitfield name="MAJOR" low="24" high="31" type="uint"/>
         </reg32>
         <reg32 offset="0x002d4" name="CPHY_MODE_CTRL"/>
-       <reg32 offset="0x0029c" name="VIDEO_COMPRESSION_MODE_CTRL">
-               <bitfield name="WC" low="16" high="31" type="uint"/>
+       <bitset name="COMPRESSION_MODE_CTRL" inline="true">
                 <bitfield name="DATATYPE" low="8" high="13" type="uint"/>
                 <bitfield name="PKT_PER_LINE" low="6" high="7" 
type="uint"/>
                 <bitfield name="EOL_BYTE_NUM" low="4" high="5" 
type="uint"/>
                 <bitfield name="EN" pos="0" type="boolean"/>
+       </bitset>
+       <reg32 offset="0x0029c" name="VIDEO_COMPRESSION_MODE_CTRL">
+               <bitfield name="WC" low="16" high="31" type="uint"/>
+               <bitfield name="STREAM0" low="0" high="15" 
type="COMPRESSION_MODE_CTRL"/>
         </reg32>
         <reg32 offset="0x002a4" name="COMMAND_COMPRESSION_MODE_CTRL">
-               <bitfield name="STREAM1_DATATYPE" low="24" high="29" 
type="uint"/>
-               <bitfield name="STREAM1_PKT_PER_LINE" low="22" high="23" 
type="uint"/>
-               <bitfield name="STREAM1_EOL_BYTE_NUM" low="20" high="21" 
type="uint"/>
-               <bitfield name="STREAM1_EN" pos="16" type="boolean"/>
-               <bitfield name="STREAM0_DATATYPE" low="8" high="13" 
type="uint"/>
-               <bitfield name="STREAM0_PKT_PER_LINE" low="6" high="7" 
type="uint"/>
-               <bitfield name="STREAM0_EOL_BYTE_NUM" low="4" high="5" 
type="uint"/>
-               <bitfield name="STREAM0_EN" pos="0" type="boolean"/>
+               <bitfield name="STREAM1" low="16" high="31" 
type="COMPRESSION_MODE_CTRL"/>
+               <bitfield name="STREAM0" low="0" high="15" 
type="COMPRESSION_MODE_CTRL"/>
         </reg32>
         <reg32 offset="0x002a8" name="COMMAND_COMPRESSION_MODE_CTRL2">
                 <bitfield name="STREAM1_SLICE_WIDTH" low="16" high="31" 
type="uint"/>


-- 
With best wishes
Dmitry
