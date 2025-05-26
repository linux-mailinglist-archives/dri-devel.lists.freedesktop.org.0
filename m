Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BE1AC4024
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 15:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1AD8944A;
	Mon, 26 May 2025 13:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fK0u3bzU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EABA8944A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:18:38 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q8eFZb004313
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UtBoSI5pkOcGmROG/Wt4XFAAzw62w6oZmZMH++AO5Mw=; b=fK0u3bzUfir4NpTr
 OJpBdrB/blRwpVLOZO2pvBlf5seBmmJy7LR0vl+9ukiZ5QGitcb/lWBH+GrqTtrE
 42ri0uqUovGPmoJ+0AAyZECiLycUt8ItBxuM0a6yUikQD/rPuReyW11vxTKuIawH
 e+xPcB/5x9w6tWbdzkNYIe6yFJ1JDJTHApRlQXMcO35SLLsGP5vZCqoXkMdYKuXG
 CwhC1CUBMYcRoQW+Jo5I9MgQUGdB/CfpR9cfftN7sCKEShm1ESAEKfVKLxk9TfIz
 ELYD7/lSeWZJlj4dv5dIkEF3hhF0l+wBPIzfn/mR4x6ITXKkQny/KKDbPMjlmqDg
 v4CGgg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmyugpka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:18:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5c9abdbd3so187188585a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 06:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748265516; x=1748870316;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UtBoSI5pkOcGmROG/Wt4XFAAzw62w6oZmZMH++AO5Mw=;
 b=nLdms33j+11HPyXO1dvXOf6qXHV3nQXk0jPqQzzCAvCxupdyliZq5+pQ3LIJwZ1+DE
 L2ahviV2w9xvCvizZaQiyHmgjphnPqOI3EJsohrd65WbsElIkln39atrhDls9FyKKrDP
 3c392AhkoHcHPeF//euODDhsaEJyv8PHyK9AZlwoZM6TnHkwJrTqiYLXbBTsNmZizLnf
 UeFnwjZsH2d4b/oaILYngiF3lJvekZLw2wDJ920DJK/5aNHF6oq17OKqMHBhJUjJOIiB
 fPApl/LqhbrYvwnQGGvL8HkjAs7svLbhME8WMkSbR9DxjEE0ub/3oFjj4eaGA0iH9dh7
 QSeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS1Pk3qg7obXNVYdHqv93cFH38D4ytmeB7X7SXub/DOKgQvH4N6BUT8MnrM26V17HnMTdc6q9ybDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2XBDvw35ropuKZ/UL0kfzecd7edhJbYl5Cw8TLSTLRXxBq6P3
 zQ8SqF8isUv9IvArrqXcQqvZTKr2Mg6qQ9r1b5IhPPfa7bAx0kD+TPbKNeTJ8aeuuzmOia1GiE8
 WKKOeELYubkVpFeOz7Gk6KHR3dOu89wGpMkDd1FhJGhjmUCaRbbXBRcoj5OxkOIYTT3pkCMw=
X-Gm-Gg: ASbGncsGd1cj+ism248TKtkx7oNJzM3z4ICXKVZuWy2jDMRTTCKQHPEgXAE8cOe3qF2
 ZhR4imlh9JRcZohvNI+dEbjOXN/CnOGjwxL1ynSNp52AMZanGjh/SzQieFI3NNBuBtJ+MJ/gdzd
 9zvznmaq0isb1JAm1PKPb5JlBMKnFk4e4UfeUBAnslfu8wxI3epTzc0svDfVCTLBRxSH47O6q5h
 LFjtiGzcKsQhbr+i7Q844HIbt+hg5cCh2qMecvwUCQQIN+zr/GkW+suJ2PrTVUzMSIjxT78klrg
 N2lou4ku5WtFAon1zWjrDGQLmu+UUbWsGZrU5AEfNOPVBpCqTW+4w4+zAddHpZvlYh2uk1j/wvH
 Zy9LVGWRMACWAHazzYhs/4S2Q0NRrVC+bsjKc342x0AadBY68gbSNE1vyTgEv
X-Received: by 2002:a05:620a:414b:b0:7c5:b909:fde1 with SMTP id
 af79cd13be357-7ceecb94895mr1451986285a.25.1748265516055; 
 Mon, 26 May 2025 06:18:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhkpGoxOecW8RkH7bD+ONxhtwTxMfGSExXlOq+Ta+frS4ub+TLyyZANQDA+8PdVAF4xujgBg==
X-Received: by 2002:a05:620a:414b:b0:7c5:b909:fde1 with SMTP id
 af79cd13be357-7ceecb94895mr1451977285a.25.1748265515362; 
 Mon, 26 May 2025 06:18:35 -0700 (PDT)
Received: from ?IPV6:2001:14bb:670:af7:f46f:ffe7:e8d8:2aa?
 (2001-14bb-670-af7-f46f-ffe7-e8d8-2aa.rev.dnainternet.fi.
 [2001:14bb:670:af7:f46f:ffe7:e8d8:2aa])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f16243sm5114836e87.14.2025.05.26.06.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 06:18:34 -0700 (PDT)
Message-ID: <7603c3b1-edff-4c02-a4a5-1d5f72720cad@oss.qualcomm.com>
Date: Mon, 26 May 2025 16:18:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set() with
 atomic_enable()
To: Maxime Ripard <mripard@kernel.org>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 Adam Ford <aford173@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
 <20250526-cryptic-blue-mussel-ac57fe@houat>
 <91d8a288-1f2d-469c-a596-6265893584ae@bp.renesas.com>
 <20250526104902.GB17743@pendragon.ideasonboard.com>
 <209ddc02-01d2-4375-afcf-2c9a55fe8fc1@bp.renesas.com>
 <20250526-cherubic-ambitious-cobra-3c6a1e@houat>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250526-cherubic-ambitious-cobra-3c6a1e@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDExMyBTYWx0ZWRfX3bUj5IPq2Pk1
 RKtIfveSD1LHI+KNg5D/r6tZypf9blDp8Jim7YO5qsS0r0+yNe3y5/8bwd4uaJOj4gOxKvx4pAC
 8B6I13eUBlojeUnrGMaa6SpIEV/D7XPjVP1hLkXSjuWZHPdt5XG6bIX8x6tumBx7TYc232WGP69
 dSJPFe5Kq/XqCFBAAVzagHaBINkL7xntiz4r1TngaF6OnewCGHTecFlyNeszPbOo/SE4nPsovuT
 t7eKrJTzsmbYOX0AoPfq4vWNZCtARzn+gOYFuzSY1prHMwC2RWrJTUDQmf7rZnlJwqaMlfVTS3x
 f4Qeja3lUmDKxVBuSwmAMPq8CoCxPbVYBs84U6O2orzC3hg0xKmTiHuSaie7H6+col5GxMtzD2C
 /HZo1DFNkQW9YijkxNyFMW8haA+tY1QmJpqj2ymewYwVzSj9PMgIvyyxGfgQuEE0pzBtBi9v
X-Authority-Analysis: v=2.4 cv=MsdS63ae c=1 sm=1 tr=0 ts=68346a2d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8 a=6hqrR-QMLRjKKab7PtcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: GL9Ef36Wugp8NNK6lPZE_FXwwK-iEIkz
X-Proofpoint-ORIG-GUID: GL9Ef36Wugp8NNK6lPZE_FXwwK-iEIkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_06,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260113
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

On 26/05/2025 14:40, Maxime Ripard wrote:
> On Mon, May 26, 2025 at 01:19:23PM +0200, Tommaso Merciai wrote:
>> Hi Laurent,
>> Thanks for your comment.
>>
>> On 26/05/25 12:49, Laurent Pinchart wrote:
>>> On Mon, May 26, 2025 at 11:58:37AM +0200, Tommaso Merciai wrote:
>>>> Hi Maxime,
>>>> Thanks for your comment.
>>>>
>>>> On 26/05/25 11:26, Maxime Ripard wrote:
>>>>> Hi,
>>>>>
>>>>> On Mon, May 26, 2025 at 10:54:52AM +0200, Tommaso Merciai wrote:
>>>>>> After adv7511_mode_set() was merged into .atomic_enable(), only the
>>>>>> native resolution is working when using modetest.
>>>>>>
>>>>>> This is caused by incorrect timings: adv7511_mode_set() must not be
>>>>>> merged into .atomic_enable().
>>>>>>
>>>>>> Move adv7511_mode_set() back to the .mode_set() callback in
>>>>>> drm_bridge_funcs to restore correct behavior.
>>>>>>
>>>>>> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI connector helpers")
>>>>>> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>>> Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
>>>>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>>>>
>>>>> Explaining why, both in the commit log and the comments, would be nice.
>>>>> Because I can't think of any good reason it just can't work for that
>>>>> bridge.
>>>>
>>>> Sorry, let me clarify and share with you some details:
>>>>
>>>> adv7511_mode_set:
>>>>     - Is setting up timings registers for the DSI2HDMI bridge in our case
>>>>       we are using ADV7535 bridge.
>>>>
>>>> rzg2l_mipi_dsi_atomic_enable:
>>>>     - Is setting up the vclock for the DSI ip
>>>>
>>>> Testing new/old implementation a bit we found the following:
>>>>
>>>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
>>>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
>>>> [   49.273134] adv7511_mode_set_old: drm_mode_vrefresh(mode) = 56
>>>> [   49.281006] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>>>>
>>>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-A-1:800x600-56.25@XR24
>>>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
>>>> [   74.076881] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>>>> [   74.092130] adv7511_mode_set: drm_mode_vrefresh(adj_mode) = 56
>>>>
>>>> Same result but different timing (in function call perspective):
>>>>
>>>>     - old: adv7511_mode_set() is call before rzg2l_mipi_dsi_atomic_enable()
>>>>     - new: adv7511_mode_set() is call after rzg2l_mipi_dsi_atomic_enable()
>>>
>>> What is "old" and "new" here ? Is it before and after Dmitry's patch, or
>>> before and after yours ? Please be precise when describing problems.
>>
>> Sorry, you are completely right:
>>
>>   - old --> before Dmitry's patch
>>   - new --> after Dmitry's patch
>>
>>>
>>>> What do you think? Thanks in advance.
>>>
>>> You're only explaining above what the "old" and "new" behaviours are,
>>> and claiming one of them is causing an issue, but you're not explaining
>>> *why* it causes an issue. That's what your commit message is expected to
>>> detail.
>>>
>>
>> Thanks for the clarification! :)
>> I will send v2 explaining better this.
> 
> In particular, if the driver needs to have mode_set called before
> atomic_enable, you should say why moving the call to mode_set earlier in
> the function wouldn't work.

It might be the same thing as we had on PS8640: it had to be brought up 
before the host starts the DSI link, so that there is no clock input on 
the DSI clock lane.

-- 
With best wishes
Dmitry
