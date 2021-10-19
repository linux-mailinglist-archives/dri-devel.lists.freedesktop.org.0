Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A30C6433DEB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 19:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61D26E11E;
	Tue, 19 Oct 2021 17:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467736E11E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 17:57:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634666259; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=JUNqYZeawlj0c5T5/8bzsOkwxflbBJAoxHjGuzI9mrc=;
 b=c2Ijf/C/3Jd4cYkf0vxAGIOnpj3mVYCDXEE1Y9JU0FXqkat6TMCxz388D2cHreLMDECi8YNd
 SoqcPa7FPvpsME3VynwrYf0UDKlBHDVFdRAl2TdOHSMeSdl6R/8qhxmt3JOAQLEpci78rtNy
 kM7PEMAD4+ygUSGOlmoDS/WmB7E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 616f06ecb03398c06cc19187 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Oct 2021 17:57:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0C271C43616; Tue, 19 Oct 2021 17:57:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL autolearn=ham autolearn_force=no version=3.4.0
Received: from [172.20.10.6] (mobile-166-170-50-11.mycingular.net
 [166.170.50.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jesszhan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CC352C4360C;
 Tue, 19 Oct 2021 17:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CC352C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <fa2be3e2-5857-6ca4-e81b-39f4aea2b399@codeaurora.org>
Date: Tue, 19 Oct 2021 10:56:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [bug report] drm/msm/dp: add debugfs support to DP driver
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>, abhinavk@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20211001135937.GA10064@kili>
From: Jessica Zhang <jesszhan@codeaurora.org>
In-Reply-To: <20211001135937.GA10064@kili>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Dan,

On 10/1/2021 6:59 AM, Dan Carpenter wrote:
> Hello Abhinav Kumar,
>
> The patch d11a93690df7: "drm/msm/dp: add debugfs support to DP
> driver" from Sep 12, 2020, leads to the following
> Smatch static checker warning:
>
> 	drivers/gpu/drm/msm/dp/dp_debug.c:194 dp_debug_read_info()
> 	warn: userbuf overflow? is 'len' <= 'count'
>
> drivers/gpu/drm/msm/dp/dp_debug.c
>      46 static ssize_t dp_debug_read_info(struct file *file, char __user *user_buff,
>      47                 size_t count, loff_t *ppos)
>      48 {
>      49         struct dp_debug_private *debug = file->private_data;
>      50         char *buf;
>      51         u32 len = 0, rc = 0;
>      52         u64 lclk = 0;
>      53         u32 max_size = SZ_4K;
>      54         u32 link_params_rate;
>      55         struct drm_display_mode *drm_mode;
>      56
>      57         if (!debug)
>      58                 return -ENODEV;
>      59
>      60         if (*ppos)
>      61                 return 0;
>      62
>      63         buf = kzalloc(SZ_4K, GFP_KERNEL);
>      64         if (!buf)
>      65                 return -ENOMEM;
>      66
>      67         drm_mode = &debug->panel->dp_mode.drm_mode;
>      68
>      69         rc = snprintf(buf + len, max_size, "\tname = %s\n", DEBUG_NAME);
>      70         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      71                 goto error;
>      72
>      73         rc = snprintf(buf + len, max_size,
>      74                         "\tdp_panel\n\t\tmax_pclk_khz = %d\n",
>      75                         debug->panel->max_pclk_khz);
>      76         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      77                 goto error;
>      78
>      79         rc = snprintf(buf + len, max_size,
>      80                         "\tdrm_dp_link\n\t\trate = %u\n",
>      81                         debug->panel->link_info.rate);
>      82         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      83                 goto error;
>      84
>      85         rc = snprintf(buf + len, max_size,
>      86                          "\t\tnum_lanes = %u\n",
>      87                         debug->panel->link_info.num_lanes);
>      88         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      89                 goto error;
>      90
>      91         rc = snprintf(buf + len, max_size,
>      92                         "\t\tcapabilities = %lu\n",
>      93                         debug->panel->link_info.capabilities);
>      94         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      95                 goto error;
>      96
>      97         rc = snprintf(buf + len, max_size,
>      98                         "\tdp_panel_info:\n\t\tactive = %dx%d\n",
>      99                         drm_mode->hdisplay,
>      100                         drm_mode->vdisplay);
>      101         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      102                 goto error;
>      103
>      104         rc = snprintf(buf + len, max_size,
>      105                         "\t\tback_porch = %dx%d\n",
>      106                         drm_mode->htotal - drm_mode->hsync_end,
>      107                         drm_mode->vtotal - drm_mode->vsync_end);
>      108         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      109                 goto error;
>      110
>      111         rc = snprintf(buf + len, max_size,
>      112                         "\t\tfront_porch = %dx%d\n",
>      113                         drm_mode->hsync_start - drm_mode->hdisplay,
>      114                         drm_mode->vsync_start - drm_mode->vdisplay);
>      115         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      116                 goto error;
>      117
>      118         rc = snprintf(buf + len, max_size,
>      119                         "\t\tsync_width = %dx%d\n",
>      120                         drm_mode->hsync_end - drm_mode->hsync_start,
>      121                         drm_mode->vsync_end - drm_mode->vsync_start);
>      122         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      123                 goto error;
>      124
>      125         rc = snprintf(buf + len, max_size,
>      126                         "\t\tactive_low = %dx%d\n",
>      127                         debug->panel->dp_mode.h_active_low,
>      128                         debug->panel->dp_mode.v_active_low);
>      129         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      130                 goto error;
>      131
>      132         rc = snprintf(buf + len, max_size,
>      133                         "\t\th_skew = %d\n",
>      134                         drm_mode->hskew);
>      135         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      136                 goto error;
>      137
>      138         rc = snprintf(buf + len, max_size,
>      139                         "\t\trefresh rate = %d\n",
>      140                         drm_mode_vrefresh(drm_mode));
>      141         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      142                 goto error;
>      143
>      144         rc = snprintf(buf + len, max_size,
>      145                         "\t\tpixel clock khz = %d\n",
>      146                         drm_mode->clock);
>      147         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      148                 goto error;
>      149
>      150         rc = snprintf(buf + len, max_size,
>      151                         "\t\tbpp = %d\n",
>      152                         debug->panel->dp_mode.bpp);
>      153         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      154                 goto error;
>      155
>      156         /* Link Information */
>      157         rc = snprintf(buf + len, max_size,
>      158                         "\tdp_link:\n\t\ttest_requested = %d\n",
>      159                         debug->link->sink_request);
>      160         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      161                 goto error;
>      162
>      163         rc = snprintf(buf + len, max_size,
>      164                         "\t\tnum_lanes = %d\n",
>      165                         debug->link->link_params.num_lanes);
>      166         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      167                 goto error;
>      168
>      169         link_params_rate = debug->link->link_params.rate;
>      170         rc = snprintf(buf + len, max_size,
>      171                         "\t\tbw_code = %d\n",
>      172                         drm_dp_link_rate_to_bw_code(link_params_rate));
>      173         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      174                 goto error;
>      175
>      176         lclk = debug->link->link_params.rate * 1000;
>      177         rc = snprintf(buf + len, max_size,
>      178                         "\t\tlclk = %lld\n", lclk);
>      179         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      180                 goto error;
>      181
>      182         rc = snprintf(buf + len, max_size,
>      183                         "\t\tv_level = %d\n",
>      184                         debug->link->phy_params.v_level);
>      185         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      186                 goto error;
>      187
>      188         rc = snprintf(buf + len, max_size,
>      189                         "\t\tp_level = %d\n",
>      190                         debug->link->phy_params.p_level);
>      191         if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
>      192                 goto error;
>      193
> --> 194         if (copy_to_user(user_buff, buf, len))
>
> This function does not take "count" into consideration so it can end
> up copying more than the user wanted (memory corruption in the user
> program).

Recently, Bjorn Andersson released a patch that removes copy_to_user() 
from this method (https://patchwork.freedesktop.org/patch/457978/). It's 
been added to msm-next-staging. Can you retest with this patch?

Thanks,

Jessica Zhang

> Technically if copy_to_user() fails it should return -EFAULT, not -EINVAL.
>
> It's weird how it return -EINVAL when the kernel can't fit its output
> in one page.  Normally we would just print the first page and hope that
> was enough.  Use scprintf() instead snprintf().
>
> 	len += scnprintf(buf + len, size - len, "blah blah blah");
>
>      195                 goto error;
>      196
>      197         *ppos += len;
>      198
>      199         kfree(buf);
>      200         return len;
>      201  error:
>      202         kfree(buf);
>      203         return -EINVAL;
>      204 }
>
> regards,
> dan carpenter
