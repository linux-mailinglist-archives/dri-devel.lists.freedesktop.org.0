Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C7978FF3E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 16:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC1210E7F7;
	Fri,  1 Sep 2023 14:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C6810E7F7;
 Fri,  1 Sep 2023 14:32:34 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 381C84Ip001967; Fri, 1 Sep 2023 14:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Q0wrztPQKNxL7BwY2wXULSa202TQsxBboqvDpkKWrJM=;
 b=YX902FZPVmYXz+DrPpdwDcd+dfs1d+on8gs6I6Qx4Q+N0+sv8FBwW76+v4NBqu/aQX8T
 Ndgs5583/GkKJI7qn7N13b2ZBzaSVG/tysPTubPku7CQ982fOu1mT8feVRVlYqdUt2UZ
 ipBDY38NJQaKRbEndP6wIadURG+RZveAU7bHhSpFotrXswbmVP1lWMock6PJBW9eVct+
 WmmXe/7MRoBXAHMtP6YhpPbVpA6ZiGv2Du/K4DXhwm5wcg5nqZqHKAHXkWQ6PbaDrIu6
 2NCQ4o58IXXCM8S9TBhjY2hV5V1cO6qLKs1MmWM20bTe1i7d1pK96sgkiJnN0z8tWKi3 zg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3su8k99bcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Sep 2023 14:32:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 381EWO8w002357
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Sep 2023 14:32:24 GMT
Received: from [10.111.179.211] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 1 Sep
 2023 07:32:24 -0700
Message-ID: <ed695b0d-fb98-4a46-8689-101a3d3f9819@quicinc.com>
Date: Fri, 1 Sep 2023 07:32:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V11 3/8] wifi: mac80211: Add support for WBRF features
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>, <lenb@kernel.org>,
 <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <alexander.deucher@amd.com>, <rafael@kernel.org>, <Lijo.Lazar@amd.com>,
 <mario.limonciello@amd.com>
References: <20230831062031.1014799-1-evan.quan@amd.com>
 <20230831062031.1014799-4-evan.quan@amd.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230831062031.1014799-4-evan.quan@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: AB-kadICdKJ0e1wft1YBpT-Mnq2z2jG1
X-Proofpoint-GUID: AB-kadICdKJ0e1wft1YBpT-Mnq2z2jG1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_12,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309010136
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/30/2023 11:20 PM, Evan Quan wrote:
> To support the WBRF mechanism, Wifi adapters utilized in the system must

Since this is the first mention of WBRF in the core wireless code IMO 
you should indicate what this is an acronym for and briefly describe it
(or add a lore link).

I'm wondering if WBRF is just a special case of frequency avoidance, and 
that more generic naming/terminology should be used in core wireless.
For example, I know there are vendor-specific solutions which allow 
Wi-Fi to avoid using channels which may conflict with cellular or 
BlueTooth, and those may benefit from a more generic

> register the frequencies in use(or unregister those frequencies no longer
> used) via the dedicated calls. So that, other drivers responding to the
> frequencies can take proper actions to mitigate possible interference.
> 
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> --
> v1->v2:
>    - place the new added member(`wbrf_supported`) in
>      ieee80211_local(Johannes)
>    - handle chandefs change scenario properly(Johannes)
>    - some minor fixes around code sharing and possible invalid input
>      checks(Johannes)
> v2->v3:
>    - drop unnecessary input checks and intermediate APIs(Mario)
>    - Separate some mac80211 common code(Mario, Johannes)
> v3->v4:
>    - some minor fixes around return values(Johannes)
> v9->v10:
>    - get ranges_in->num_of_ranges set and passed in(Johannes)
> ---
>   include/linux/ieee80211.h  |   1 +
>   net/mac80211/Makefile      |   2 +
>   net/mac80211/chan.c        |   9 ++++
>   net/mac80211/ieee80211_i.h |   9 ++++
>   net/mac80211/main.c        |   2 +
>   net/mac80211/wbrf.c        | 105 +++++++++++++++++++++++++++++++++++++
>   6 files changed, 128 insertions(+)
>   create mode 100644 net/mac80211/wbrf.c
> 
> diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
> index 4b998090898e..f995d06da87f 100644
> --- a/include/linux/ieee80211.h
> +++ b/include/linux/ieee80211.h
> @@ -4335,6 +4335,7 @@ static inline int ieee80211_get_tdls_action(struct sk_buff *skb, u32 hdr_size)
>   /* convert frequencies */
>   #define MHZ_TO_KHZ(freq) ((freq) * 1000)
>   #define KHZ_TO_MHZ(freq) ((freq) / 1000)
> +#define KHZ_TO_HZ(freq)  ((freq) * 1000)
>   #define PR_KHZ(f) KHZ_TO_MHZ(f), f % 1000
>   #define KHZ_F "%d.%03d"
>   
> diff --git a/net/mac80211/Makefile b/net/mac80211/Makefile
> index b8de44da1fb8..d46c36f55fd3 100644
> --- a/net/mac80211/Makefile
> +++ b/net/mac80211/Makefile
> @@ -65,4 +65,6 @@ rc80211_minstrel-$(CONFIG_MAC80211_DEBUGFS) += \
>   
>   mac80211-$(CONFIG_MAC80211_RC_MINSTREL) += $(rc80211_minstrel-y)
>   
> +mac80211-y += wbrf.o
> +
>   ccflags-y += -DDEBUG
> diff --git a/net/mac80211/chan.c b/net/mac80211/chan.c
> index 68952752b599..458469c224ae 100644
> --- a/net/mac80211/chan.c
> +++ b/net/mac80211/chan.c
> @@ -506,11 +506,16 @@ static void _ieee80211_change_chanctx(struct ieee80211_local *local,
>   
>   	WARN_ON(!cfg80211_chandef_compatible(&ctx->conf.def, chandef));
>   
> +	ieee80211_remove_wbrf(local, &ctx->conf.def);
> +
>   	ctx->conf.def = *chandef;
>   
>   	/* check if min chanctx also changed */
>   	changed = IEEE80211_CHANCTX_CHANGE_WIDTH |
>   		  _ieee80211_recalc_chanctx_min_def(local, ctx, rsvd_for);
> +
> +	ieee80211_add_wbrf(local, &ctx->conf.def);
> +
>   	drv_change_chanctx(local, ctx, changed);
>   
>   	if (!local->use_chanctx) {
> @@ -668,6 +673,8 @@ static int ieee80211_add_chanctx(struct ieee80211_local *local,
>   	lockdep_assert_held(&local->mtx);
>   	lockdep_assert_held(&local->chanctx_mtx);
>   
> +	ieee80211_add_wbrf(local, &ctx->conf.def);
> +
>   	if (!local->use_chanctx)
>   		local->hw.conf.radar_enabled = ctx->conf.radar_enabled;
>   
> @@ -748,6 +755,8 @@ static void ieee80211_del_chanctx(struct ieee80211_local *local,
>   	}
>   
>   	ieee80211_recalc_idle(local);
> +
> +	ieee80211_remove_wbrf(local, &ctx->conf.def);
>   }
>   
>   static void ieee80211_free_chanctx(struct ieee80211_local *local,
> diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
> index 91633a0b723e..719f2c892132 100644
> --- a/net/mac80211/ieee80211_i.h
> +++ b/net/mac80211/ieee80211_i.h
> @@ -1600,6 +1600,8 @@ struct ieee80211_local {
>   
>   	/* extended capabilities provided by mac80211 */
>   	u8 ext_capa[8];
> +
> +	bool wbrf_supported;
>   };
>   
>   static inline struct ieee80211_sub_if_data *
> @@ -2638,4 +2640,11 @@ ieee80211_eht_cap_ie_to_sta_eht_cap(struct ieee80211_sub_if_data *sdata,
>   				    const struct ieee80211_eht_cap_elem *eht_cap_ie_elem,
>   				    u8 eht_cap_len,
>   				    struct link_sta_info *link_sta);
> +
> +void ieee80211_check_wbrf_support(struct ieee80211_local *local);
> +void ieee80211_add_wbrf(struct ieee80211_local *local,
> +			struct cfg80211_chan_def *chandef);
> +void ieee80211_remove_wbrf(struct ieee80211_local *local,
> +			   struct cfg80211_chan_def *chandef);
> +
>   #endif /* IEEE80211_I_H */
> diff --git a/net/mac80211/main.c b/net/mac80211/main.c
> index 24315d7b3126..b20bdaac84db 100644
> --- a/net/mac80211/main.c
> +++ b/net/mac80211/main.c
> @@ -1396,6 +1396,8 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
>   	debugfs_hw_add(local);
>   	rate_control_add_debugfs(local);
>   
> +	ieee80211_check_wbrf_support(local);
> +
>   	rtnl_lock();
>   	wiphy_lock(hw->wiphy);
>   
> diff --git a/net/mac80211/wbrf.c b/net/mac80211/wbrf.c
> new file mode 100644
> index 000000000000..63978c7d2bcb
> --- /dev/null
> +++ b/net/mac80211/wbrf.c
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Wifi Band Exclusion Interface for WWAN
> + * Copyright (C) 2023 Advanced Micro Devices
> + *
> + */
> +
> +#include <linux/acpi_amd_wbrf.h>
> +#include <net/cfg80211.h>
> +#include "ieee80211_i.h"
> +
> +void ieee80211_check_wbrf_support(struct ieee80211_local *local)
> +{
> +	struct wiphy *wiphy = local->hw.wiphy;
> +	struct device *dev;
> +
> +	if (!wiphy)
> +		return;
> +
> +	dev = wiphy->dev.parent;
> +	if (!dev)
> +		return;
> +
> +	local->wbrf_supported = acpi_amd_wbrf_supported_producer(dev);


I haven't been looking at this series closely so perhaps this has 
already been answered, but is this layered correctly? I'm surprised to 
see core wireless code directly invoking a vendor-specific API.
Instead should there be a registration mechanism with associated callbacks?

As I mentioned above I could envision multiple registrants for such an 
interface.

> +	dev_dbg(dev, "WBRF is %s supported\n",
> +		local->wbrf_supported ? "" : "not");
> +}
> +
> +static void get_chan_freq_boundary(u32 center_freq,
> +				   u32 bandwidth,
> +				   u64 *start,
> +				   u64 *end)
> +{
> +	bandwidth = MHZ_TO_KHZ(bandwidth);
> +	center_freq = MHZ_TO_KHZ(center_freq);
> +
> +	*start = center_freq - bandwidth / 2;
> +	*end = center_freq + bandwidth / 2;
> +
> +	/* Frequency in HZ is expected */
> +	*start = KHZ_TO_HZ(*start);
> +	*end = KHZ_TO_HZ(*end);
> +}
> +
> +static void get_ranges_from_chandef(struct cfg80211_chan_def *chandef,
> +				    struct wbrf_ranges_in_out *ranges_in)
> +{
> +	u64 start_freq1, end_freq1;
> +	u64 start_freq2, end_freq2;
> +	int bandwidth;
> +
> +	bandwidth = nl80211_chan_width_to_mhz(chandef->width);
> +
> +	get_chan_freq_boundary(chandef->center_freq1,
> +			       bandwidth,
> +			       &start_freq1,
> +			       &end_freq1);
> +
> +	ranges_in->band_list[0].start = start_freq1;
> +	ranges_in->band_list[0].end = end_freq1;
> +	ranges_in->num_of_ranges = 1;
> +
> +	if (chandef->width == NL80211_CHAN_WIDTH_80P80) {
> +		get_chan_freq_boundary(chandef->center_freq2,
> +				       bandwidth,
> +				       &start_freq2,
> +				       &end_freq2);
> +
> +		ranges_in->band_list[1].start = start_freq2;
> +		ranges_in->band_list[1].end = end_freq2;
> +		ranges_in->num_of_ranges++;
> +	}
> +}
> +
> +void ieee80211_add_wbrf(struct ieee80211_local *local,
> +			struct cfg80211_chan_def *chandef)
> +{
> +	struct wbrf_ranges_in_out ranges_in = {0};
> +	struct device *dev;
> +
> +	if (!local->wbrf_supported)
> +		return;
> +
> +	dev = local->hw.wiphy->dev.parent;
> +
> +	get_ranges_from_chandef(chandef, &ranges_in);
> +
> +	acpi_amd_wbrf_add_exclusion(dev, &ranges_in);
> +}
> +
> +void ieee80211_remove_wbrf(struct ieee80211_local *local,
> +			   struct cfg80211_chan_def *chandef)
> +{
> +	struct wbrf_ranges_in_out ranges_in = {0};
> +	struct device *dev;
> +
> +	if (!local->wbrf_supported)
> +		return;
> +
> +	dev = local->hw.wiphy->dev.parent;
> +
> +	get_ranges_from_chandef(chandef, &ranges_in);
> +
> +	acpi_amd_wbrf_remove_exclusion(dev, &ranges_in);
> +}

