Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E924B592C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 18:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D7410E267;
	Mon, 14 Feb 2022 17:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E6310E267;
 Mon, 14 Feb 2022 17:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644861332; x=1676397332;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=C54/U+DHYBApPNlslBVdhM3KM9lFpe7aN8JQV9NJVek=;
 b=nBL5PqctNFY/9HpU5v72xuQXV0SHIVovT0uL7d+K4pmIqjKmfU3H0bD+
 xi+jCx5cWVCXd3LIzCtqTQCmguSJwNP9ToUVCn487gpqNM+mFKR8F1wUk
 tD3pc/J9R+hbsIZinLW1eUbEb8zSngUMfMJwx8eO0K2O8fWRy+GkkSwsp k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Feb 2022 09:55:32 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 09:55:31 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Feb 2022 09:55:31 -0800
Received: from [10.110.63.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 14 Feb
 2022 09:55:29 -0800
Content-Type: multipart/alternative;
 boundary="------------02zNWf5tH0nkXnmCl0yO2N0H"
Message-ID: <3b6cd2c2-5ebb-97a2-f9af-3c32d0899cd8@quicinc.com>
Date: Mon, 14 Feb 2022 09:55:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/msm: populate intf_audio_select() base on hardware
 capability
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1644621822-25407-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqwAxDa142B_N6NA7KkQ6WuuG_Ma7No5SXEpJdBmgKvXQ@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpqwAxDa142B_N6NA7KkQ6WuuG_Ma7No5SXEpJdBmgKvXQ@mail.gmail.com>
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
Cc: quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------02zNWf5tH0nkXnmCl0yO2N0H
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 2/11/2022 3:36 PM, Dmitry Baryshkov wrote:
> On Sat, 12 Feb 2022 at 02:23, Kuogee Hsieh<quic_khsieh@quicinc.com>  wrote:
>> intf_audio_select() callback function use to configure
>> HDMI_DP_CORE_SELECT to decide audio output routes to HDMI or DP
>> interface. HDMI is obsoleted at newer chipset. To keep supporting
>> legacy hdmi application, intf_audio_select call back function have
>> to be populated base on hardware chip capability where legacy
>> chipsets have has_audio_select flag set to true.
>>
>> Signed-off-by: Kuogee Hsieh<quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c     | 9 ++++++---
>>   3 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 272b14b..23680e7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -201,6 +201,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
>>          .has_dim_layer = true,
>>          .has_idle_pc = true,
>>          .has_3d_merge = true,
>> +       .has_audio_select = true,
>>          .max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>          .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>          .max_hdeci_exp = MAX_HORZ_DECIMATION,
>> @@ -229,6 +230,7 @@ static const struct dpu_caps sm8150_dpu_caps = {
>>          .has_dim_layer = true,
>>          .has_idle_pc = true,
>>          .has_3d_merge = true,
>> +       .has_audio_select = true,
>>          .max_linewidth = 4096,
>>          .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>          .max_hdeci_exp = MAX_HORZ_DECIMATION,
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index e5a96d6..b33f91b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -357,6 +357,7 @@ struct dpu_caps {
>>          bool has_dim_layer;
>>          bool has_idle_pc;
>>          bool has_3d_merge;
>> +       bool has_audio_select;
> I'd suggest adding a bit to dpu_mdp_cfg's features instead, following
> the example of other hardware blocks.

it may cause mis leading if we put this in hardware level since 
MDP_HDMI_DP_SELECT  bit has not be connected

to logic for a while even it still present at ipcat. Also this bit but 
will be  removed at next release.

Is dpu_caps level more proper than in hardware feature level?


>
>>          /* SSPP limits */
>>          u32 max_linewidth;
>>          u32 pixel_ram_size;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>> index 282e3c6..e608f4d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>> @@ -261,14 +261,17 @@ static void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp)
>>   }
>>
>>   static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>> -               unsigned long cap)
>> +               unsigned long cap,
>> +               const struct dpu_mdss_cfg *m)
>>   {
>>          ops->setup_split_pipe = dpu_hw_setup_split_pipe;
>>          ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
>>          ops->get_danger_status = dpu_hw_get_danger_status;
>>          ops->setup_vsync_source = dpu_hw_setup_vsync_source;
>>          ops->get_safe_status = dpu_hw_get_safe_status;
>> -       ops->intf_audio_select = dpu_hw_intf_audio_select;
>> +
>> +       if (m->caps->has_audio_select)
>> +               ops->intf_audio_select = dpu_hw_intf_audio_select;
>>   }
>>
>>   static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
>> @@ -320,7 +323,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
>>           */
>>          mdp->idx = idx;
>>          mdp->caps = cfg;
>> -       _setup_mdp_ops(&mdp->ops, mdp->caps->features);
>> +       _setup_mdp_ops(&mdp->ops, mdp->caps->features, m);
>>
>>          return mdp;
>>   }
--------------02zNWf5tH0nkXnmCl0yO2N0H
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/11/2022 3:36 PM, Dmitry Baryshkov
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAA8EJpqwAxDa142B_N6NA7KkQ6WuuG_Ma7No5SXEpJdBmgKvXQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Sat, 12 Feb 2022 at 02:23, Kuogee Hsieh <a class="moz-txt-link-rfc2396E" href="mailto:quic_khsieh@quicinc.com">&lt;quic_khsieh@quicinc.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
intf_audio_select() callback function use to configure
HDMI_DP_CORE_SELECT to decide audio output routes to HDMI or DP
interface. HDMI is obsoleted at newer chipset. To keep supporting
legacy hdmi application, intf_audio_select call back function have
to be populated base on hardware chip capability where legacy
chipsets have has_audio_select flag set to true.

Signed-off-by: Kuogee Hsieh <a class="moz-txt-link-rfc2396E" href="mailto:quic_khsieh@quicinc.com">&lt;quic_khsieh@quicinc.com&gt;</a>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c     | 9 ++++++---
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 272b14b..23680e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -201,6 +201,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
        .has_dim_layer = true,
        .has_idle_pc = true,
        .has_3d_merge = true,
+       .has_audio_select = true,
        .max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
        .max_hdeci_exp = MAX_HORZ_DECIMATION,
@@ -229,6 +230,7 @@ static const struct dpu_caps sm8150_dpu_caps = {
        .has_dim_layer = true,
        .has_idle_pc = true,
        .has_3d_merge = true,
+       .has_audio_select = true,
        .max_linewidth = 4096,
        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
        .max_hdeci_exp = MAX_HORZ_DECIMATION,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index e5a96d6..b33f91b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -357,6 +357,7 @@ struct dpu_caps {
        bool has_dim_layer;
        bool has_idle_pc;
        bool has_3d_merge;
+       bool has_audio_select;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'd suggest adding a bit to dpu_mdp_cfg's features instead, following
the example of other hardware blocks.</pre>
    </blockquote>
    <p>it may cause mis leading if we put this in hardware level since 
      MDP_HDMI_DP_SELECT  bit has not be connected</p>
    <p>to logic for a while even it still present at ipcat. Also this
      bit but will be  removed at next release. <br>
    </p>
    <p>Is dpu_caps level more proper than in hardware feature level?<br>
    </p>
    <p><br>
      <span style="color: rgb(33, 37, 41); font-family: -apple-system,
        BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto,
        &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;,
        sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI
        Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color
        Emoji&quot;; font-size: 14px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(200, 240,
        200); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;"><span></span></span></p>
    <blockquote type="cite"
cite="mid:CAA8EJpqwAxDa142B_N6NA7KkQ6WuuG_Ma7No5SXEpJdBmgKvXQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">        /* SSPP limits */
        u32 max_linewidth;
        u32 pixel_ram_size;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 282e3c6..e608f4d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -261,14 +261,17 @@ static void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp)
 }

 static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
-               unsigned long cap)
+               unsigned long cap,
+               const struct dpu_mdss_cfg *m)
 {
        ops-&gt;setup_split_pipe = dpu_hw_setup_split_pipe;
        ops-&gt;setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
        ops-&gt;get_danger_status = dpu_hw_get_danger_status;
        ops-&gt;setup_vsync_source = dpu_hw_setup_vsync_source;
        ops-&gt;get_safe_status = dpu_hw_get_safe_status;
-       ops-&gt;intf_audio_select = dpu_hw_intf_audio_select;
+
+       if (m-&gt;caps-&gt;has_audio_select)
+               ops-&gt;intf_audio_select = dpu_hw_intf_audio_select;
 }

 static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
@@ -320,7 +323,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
         */
        mdp-&gt;idx = idx;
        mdp-&gt;caps = cfg;
-       _setup_mdp_ops(&amp;mdp-&gt;ops, mdp-&gt;caps-&gt;features);
+       _setup_mdp_ops(&amp;mdp-&gt;ops, mdp-&gt;caps-&gt;features, m);

        return mdp;
 }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------02zNWf5tH0nkXnmCl0yO2N0H--
