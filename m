Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5D1AEB7E9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 14:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1969F10EA03;
	Fri, 27 Jun 2025 12:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PnXVXbvL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7438F10E9FF
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:40:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBtbM9028699
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iHlNGw65/NyPXrUrl04t6D1qYWyjgSpHMuXvzrQ6OaI=; b=PnXVXbvL9qq9IFjQ
 oM2ccLOCXSvwoBWg4NKNTOJsWpiMAnmuVMtPr6wzg7dE/7EgyLHMRIFouu0qSkmM
 y2LAvEGMKTaHjdM4Ll6o/3Y3+6K9T+5XNVUzbnBpz059R+OT4wRihnOcvEtUCOLv
 Rz3ULETE2Wrd0z4tgsOnaL5CgDpCZjaugaDP5v7k5G/AA9HzNdQQp00Emwsj2Dhx
 XebTfMka6XTFBPxgrrfh7l5tVbxYKNRz2MQ+4Msree68f9tGRSMSJseFcWUgbbGH
 OzW/pmSB5Q4O4hvoMMhhbZzbTmOxrkBKhL+oGmP4Zl/1dxU9DVAb324l1h8OpxV4
 LsU3dQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa5051e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:40:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d09bc05b77so329608485a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 05:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751028050; x=1751632850;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iHlNGw65/NyPXrUrl04t6D1qYWyjgSpHMuXvzrQ6OaI=;
 b=FNE0vyD2e7Cnh5qjM6Cl3rTdXXKE4+Aug+lq0r/Adxj19G6KvFmMMDXMNJKkySmuVO
 rD5iGItzhPYS8TvjSVlk3zgLDpkhm91rMGsgFPc8SSrAMxRnMcvJmWWhwDFnvlqMUufL
 qFDPkove2gUFixA9shHy23FneGzrxj+IW6cjfX4xp9KU4ejvZ6/RP1vs4zhAyEAgivz7
 JBR+cgID6qWps3y8iS0kk2ixkjZPQJnipqBgT24PuYugVKC0KgUi0p2W/V64Kh0qU25N
 M0jSnRqy/BcLLd0KcyZgTgjWx1w0BgDx2uxLyL0qfjO04vu5sMlM9bornsYxdx/mzANZ
 3/qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6xSNcMyt22sI+/m6Nm1cN56zWwlWp+r+HuVdmzP2bC2Xn1mPzJpL3eOBoiJuRunE+I9LTc7ahYOs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd/FoAtYEhkQJiDaKv86yXGSaKd7QQOWxJMsZhzoRyrAw0oQYI
 EsI/UfB0GP2dhyDsSQu3bsNjUDWRX53UHhrw4lsRRh4EMaxBqOBltMURqWI59zz3W2iz+u9bFOM
 q/xBY1Jd6hE/dyQ5ZSRyQ78d41MQDTdQQrK7G/Gk9ANRF0judEm20ePHJaX2luR9hs/BCPVU=
X-Gm-Gg: ASbGncvCDMxBblzpiafAi980ddHXXNYsbhgxSRhQT7G4+pXKkIUR7LEjL6i4QuaNhEi
 0ycOnY1/wWpdSqCyr1m21noysR00oId/XS0wsmWNMoSUyRQ6dIe1ikRQUnA4QOxu31/GeJx5mqv
 qdo4Q11OwNoZBmcIBdCndbm2P8MjOj3KMbBsRxjjrunkhbR1D4UN4ahZ6jSF/jSYFOLjKolqmYx
 0PXbiPQK2iQj6+8pOeDIL6vQjRTvAyX9aIKq4Hj4RU0vayx7myRuw8nFnZQz5aLAFEyFdlwt8t6
 K6LXr74ninQfSiomo1vhBgFOhxMKRiRhVA6dmvPNqi8Q6TThAHML1b6Cz1Jm4uKwL3V2jiz9
X-Received: by 2002:a05:620a:4492:b0:7c9:3085:f848 with SMTP id
 af79cd13be357-7d443944496mr405476485a.13.1751028050338; 
 Fri, 27 Jun 2025 05:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGYrhNi8hnOY1cH9dyXDnGqvZDsqwNKN/AW+njjW6jkmrRMGgW9N8CNDZRf1v02A+GskMFFg==
X-Received: by 2002:a05:620a:4492:b0:7c9:3085:f848 with SMTP id
 af79cd13be357-7d443944496mr405472085a.13.1751028049780; 
 Fri, 27 Jun 2025 05:40:49 -0700 (PDT)
Received: from [10.185.26.70] (37-33-181-83.bb.dnainternet.fi. [37.33.181.83])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b255a51sm441777e87.88.2025.06.27.05.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 05:40:48 -0700 (PDT)
Message-ID: <521402f9-06c7-4d49-b78a-080b06378fd8@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 15:40:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/38] drm/msm/dp: split msm_dp_panel_read_sink_caps()
 into two parts and drop panel drm_edid
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-1-a54d8902a23d@quicinc.com>
 <g6wqvbszbrw6gnvxz7cjmhx4rc53kyulcr5wjekfjaisontikl@723odzngtlnd>
 <326bbd02-f414-48e3-a396-4b94f19054f7@quicinc.com>
 <buvgxzf5u5wkj2nxd6rquvcktjmxoclwrkkmxeih6pnikubqe3@yoytvnayvxtv>
 <014d535e-ca9c-4707-9ff4-7afdd489b780@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <014d535e-ca9c-4707-9ff4-7afdd489b780@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685e9153 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=a09MB1VsJqAZHPW3esczKA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=II6myPHIT8NnAhXeErMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eWUfyTAXnLCdQpjCWubWYpyFO-TD2z3W
X-Proofpoint-ORIG-GUID: eWUfyTAXnLCdQpjCWubWYpyFO-TD2z3W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNSBTYWx0ZWRfX95cufhu6H6jO
 JhJj81DvhGPOdlrZnXDY17OCKk8seJnqbch9mTVceEfccFO7DSZBLe002dBV1u8Q1W7LfUhyBqx
 8N+8HkzD/uZHtClZbyJ+AuZzo4fyqRnpW9SrQ1WNR1jr2GRC3eJmyC+8juKsIfR0zFGfKKanGoX
 202bMdemOwlVXbPiWJ3QxPcjTNO6QW+KexDfZlt6yTb5wJgqSWHYTKkY6gPRpVUIlhEah9zrsQ3
 B80oojr00AO6UDzcNd5y/T4T18KlUuNRzO5hFfiFeOz0eHzVksHw6cDbmvgdO+MBK9uejFZuR1O
 oQS+2RVlwpWWVAo6UrDcP52c3Lm8b4K1Dawl/LLc6L4rzRZiqHux9+wEl42uSa+/BhQgFHqp1rH
 CWhrNaqnclWhpjVy+TpbjCfhxNCn0iyu9YwddgW9DSFoIKDN/pK5pfSdTEV/2dPi10htP+dS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270105
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

On 27/06/2025 10:49, Yongxing Mou wrote:
> 
> 
> On 2025/6/25 21:32, Dmitry Baryshkov wrote:
>> On Wed, Jun 25, 2025 at 04:43:55PM +0800, Yongxing Mou wrote:
>>>
>>>
>>> On 2025/6/9 20:41, Dmitry Baryshkov wrote:
>>>> On Mon, Jun 09, 2025 at 08:21:20PM +0800, Yongxing Mou wrote:
>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>
>>>>> In preparation of DP MST where link caps are read for the
>>>>> immediate downstream device and the edid is read through
>>>>
>>>> EDID, not edid. Please review all your patches for up/down case.
>>>>
>>> Got it. Thanks~
>>>>> sideband messaging, split the msm_dp_panel_read_sink_caps() into
>>>>> two parts which read the link parameters and the edid parts
>>>>> respectively. Also drop the panel drm_edid cached as we actually
>>>>> don't need it.
>>>>
>>>> Also => separate change.
>>>>
>>> Got it.
>>>>>
>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++----
>>>>>    drivers/gpu/drm/msm/dp/dp_panel.c   | 55 +++++++++++++++++++ 
>>>>> +-----------------
>>>>>    drivers/gpu/drm/msm/dp/dp_panel.h   |  6 ++--
>>>>>    3 files changed, 40 insertions(+), 34 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/ 
>>>>> msm/dp/dp_display.c
>>>>> index 
>>>>> 6f05a939ce9e648e9601597155999b6f85adfcff..4a9b65647cdef1ed6c3bb851f93df0db8be977af 100644
>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>> @@ -389,7 +389,11 @@ static int 
>>>>> msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>>>>        dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
>>>>> -    rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
>>>>> +    rc = msm_dp_panel_read_link_caps(dp->panel);
>>>>> +    if (rc)
>>>>> +        goto end;
>>>>> +
>>>>> +    rc = msm_dp_panel_read_edid(dp->panel, connector);
>>>>>        if (rc)
>>>>>            goto end;
>>>>> @@ -720,7 +724,6 @@ static int msm_dp_irq_hpd_handle(struct 
>>>>> msm_dp_display_private *dp, u32 data)
>>>>>    static void msm_dp_display_deinit_sub_modules(struct 
>>>>> msm_dp_display_private *dp)
>>>>>    {
>>>>>        msm_dp_audio_put(dp->audio);
>>>>> -    msm_dp_panel_put(dp->panel);
>>>>>        msm_dp_aux_put(dp->aux);
>>>>>    }
>>>>> @@ -783,7 +786,7 @@ static int msm_dp_init_sub_modules(struct 
>>>>> msm_dp_display_private *dp)
>>>>>            rc = PTR_ERR(dp->ctrl);
>>>>>            DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
>>>>>            dp->ctrl = NULL;
>>>>> -        goto error_ctrl;
>>>>> +        goto error_link;
>>>>>        }
>>>>>        dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp- 
>>>>> >catalog);
>>>>> @@ -791,13 +794,11 @@ static int msm_dp_init_sub_modules(struct 
>>>>> msm_dp_display_private *dp)
>>>>>            rc = PTR_ERR(dp->audio);
>>>>>            pr_err("failed to initialize audio, rc = %d\n", rc);
>>>>>            dp->audio = NULL;
>>>>> -        goto error_ctrl;
>>>>> +        goto error_link;
>>>>>        }
>>>>>        return rc;
>>>>> -error_ctrl:
>>>>> -    msm_dp_panel_put(dp->panel);
>>>>>    error_link:
>>>>>        msm_dp_aux_put(dp->aux);
>>>>>    error:
>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/ 
>>>>> msm/dp/dp_panel.c
>>>>> index 
>>>>> 4e8ab75c771b1e3a2d62f75e9993e1062118482b..d9041e235104a74b3cc50ff2e307eae0c4301ef3 100644
>>>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>>>>> @@ -118,14 +118,13 @@ static u32 
>>>>> msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
>>>>>        return min_supported_bpp;
>>>>>    }
>>>>> -int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>>>>> -    struct drm_connector *connector)
>>>>> +int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel)
>>>>>    {
>>>>>        int rc, bw_code;
>>>>>        int count;
>>>>>        struct msm_dp_panel_private *panel;
>>>>> -    if (!msm_dp_panel || !connector) {
>>>>> +    if (!msm_dp_panel) {
>>>>>            DRM_ERROR("invalid input\n");
>>>>>            return -EINVAL;
>>>>>        }
>>>>> @@ -160,26 +159,29 @@ int msm_dp_panel_read_sink_caps(struct 
>>>>> msm_dp_panel *msm_dp_panel,
>>>>>        rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel- 
>>>>> >dpcd,
>>>>>                         msm_dp_panel->downstream_ports);
>>>>> -    if (rc)
>>>>> -        return rc;
>>>>> +    return rc;
>>>>> +}
>>>>> -    drm_edid_free(msm_dp_panel->drm_edid);
>>>>> +int msm_dp_panel_read_edid(struct msm_dp_panel *msm_dp_panel, 
>>>>> struct drm_connector *connector)
>>>>> +{
>>>>> +    struct msm_dp_panel_private *panel;
>>>>> +    const struct drm_edid *drm_edid;
>>>>> +
>>>>> +    panel = container_of(msm_dp_panel, struct 
>>>>> msm_dp_panel_private, msm_dp_panel);
>>>>> -    msm_dp_panel->drm_edid = drm_edid_read_ddc(connector, &panel- 
>>>>> >aux->ddc);
>>>>> +    drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
>>>>> -    drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
>>>>> +    drm_edid_connector_update(connector, drm_edid);
>>>>> -    if (!msm_dp_panel->drm_edid) {
>>>>> +    if (!drm_edid) {
>>>>>            DRM_ERROR("panel edid read failed\n");
>>>>>            /* check edid read fail is due to unplug */
>>>>>            if (!msm_dp_catalog_link_is_connected(panel->catalog)) {
>>>>> -            rc = -ETIMEDOUT;
>>>>> -            goto end;
>>>>> +            return -ETIMEDOUT;
>>>>>            }
>>>>>        }
>>>>> -end:
>>>>> -    return rc;
>>>>> +    return 0;
>>>>>    }
>>>>>    u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
>>>>> @@ -208,15 +210,20 @@ u32 msm_dp_panel_get_mode_bpp(struct 
>>>>> msm_dp_panel *msm_dp_panel,
>>>>>    int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
>>>>>        struct drm_connector *connector)
>>>>>    {
>>>>> +    struct msm_dp_panel_private *panel;
>>>>> +    const struct drm_edid *drm_edid;
>>>>> +
>>>>>        if (!msm_dp_panel) {
>>>>>            DRM_ERROR("invalid input\n");
>>>>>            return -EINVAL;
>>>>>        }
>>>>> -    if (msm_dp_panel->drm_edid)
>>>>> -        return drm_edid_connector_add_modes(connector);
>>>>> +    panel = container_of(msm_dp_panel, struct 
>>>>> msm_dp_panel_private, msm_dp_panel);
>>>>> +
>>>>> +    drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
>>>>> +    drm_edid_connector_update(connector, drm_edid);
>>>>
>>>> If EDID has been read and processed after HPD high event, why do we 
>>>> need
>>>> to re-read it again? Are we expecting that EDID will change?
>>>>
>>> Here we indeed don't need to read the EDID again, so we can directly 
>>> call
>>> drm_edid_connector_add_modes. Thanks.
>>>>> -    return 0;
>>>>> +    return drm_edid_connector_add_modes(connector);
>>>>>    }
>>>>>    static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
>>>>> @@ -229,6 +236,7 @@ static u8 msm_dp_panel_get_edid_checksum(const 
>>>>> struct edid *edid)
>>>>>    void msm_dp_panel_handle_sink_request(struct msm_dp_panel 
>>>>> *msm_dp_panel)
>>>>>    {
>>>>>        struct msm_dp_panel_private *panel;
>>>>> +    const struct drm_edid *drm_edid;
>>>>>        if (!msm_dp_panel) {
>>>>>            DRM_ERROR("invalid input\n");
>>>>> @@ -238,8 +246,13 @@ void msm_dp_panel_handle_sink_request(struct 
>>>>> msm_dp_panel *msm_dp_panel)
>>>>>        panel = container_of(msm_dp_panel, struct 
>>>>> msm_dp_panel_private, msm_dp_panel);
>>>>>        if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
>>>>> +        drm_edid = drm_edid_read_ddc(msm_dp_panel->connector, 
>>>>> &panel->aux->ddc);
>>>>
>>>> And again....
>>>>
>>> Here we need the struct edid,since we drop the cached drm_edid, so we 
>>> need
>>> to read it again. Or we can return the drm_edid from 
>>> msm_dp_panel_read_edid
>>> and pass it to msm_dp_panel_handle_sink_request, then we don't need 
>>> to read
>>> drm_edid here. Emm, I'm still a bit curious why we can't cache the 
>>> drm_edid?
>>> It would help us to access it when needed. Emm, i see other drivers also
>>> cache it.
>>
>> Yes, they can cache EDID. However, in this case we don't even need it at
>> all. This piece needs to be rewritten to use
>> drm_dp_send_real_edid_checksum(), connector->real_edid_checksum.
>>
>> Corresponding changes can be submitted separately.
>>
> Got it, thanks, will separate this patch from MST patches..  Even if we 
> use drm_dp_send_real_edid_checksum to send connector- 
>  >real_edid_checksum, that’s only when the EDID state is incorrect.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ 
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c?h=v6.16-rc3#n1020
>   When the EDID is read correctly, it should send edid->checksum instead.

I wonder if we should fix the drm_edid to always set real_edid_checksum 
instead.

>>
> 


-- 
With best wishes
Dmitry
