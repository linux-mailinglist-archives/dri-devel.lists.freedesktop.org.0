Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CD2AC0C70
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B3C10EBBF;
	Thu, 22 May 2025 13:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpIPiPnc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CAC10EBBF
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 13:14:13 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7XqGH029173
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 13:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cHG/SgxMi3oa6P3Q/bDEut732xB9dlPlOoJPYxKUmKU=; b=ZpIPiPncn57n2+9R
 OlN3Z+S9ZWfWqwrIXqEGCI7K5lYPuXgZaFQTGKGWncTkUV9PuCr2VJTejWZjW6bG
 9srjJY6PqL+DondgPoL0fkxGOG6kglXC7a4zZzUXwFhmiXdgQkZCIinP3n+41aJ+
 RHeMF9WI70mYUmXH4VPrMSsaFWAFcDg0zCNDmTG7ucPQn1TVPu/o98MS12pUHLxv
 5Puw1xMT7kRNGqhTg8ag5LmzQgHldfPbDY4zQz7otFKeIL87zRuGpHp9ZDV3vY4G
 CgebFaINB1lCxS3fwHmaf0d41OGhqWus1jtoxzuZWr5LG4ib1c/B5/IdokYAgsA8
 +RXDwg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf46g7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 13:14:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6eeb5e86c5fso82202026d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 06:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747919651; x=1748524451;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cHG/SgxMi3oa6P3Q/bDEut732xB9dlPlOoJPYxKUmKU=;
 b=rV8Vn3B53u6ywmmAGNW4+qa/WABGZOH1eSnG+l6annlg7wo1y0vkLDdLFxnidsRE4J
 57zoYss+M1J9xme2yaYvqDplRyblaoQ4TbBoPtCXu3GhDBHIIq99bzrfd9MyV31r5uFo
 s8JwSLZs4Mh3mOtLxOnIOxrquo2e7WJlrdsfMyHeBCSMwMeZspKJClQZPlinR0OKW1Th
 EauMwH/aXliuB8FZNT7bGgMvPi8n0V4iRCG8UwsM2MZq1WXcmq7DQeibS7bKnvvwd09S
 ITtmrPqxxVAyqKGEzpI5BRSEJ2eBZ0f3sL6ECJxJ8Qs7WqPsBc2iltdbfm4EO4raCED9
 d03A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpqcQ6K/clgw9JbzP4XjFgA4lSLTIZ4Ib8wB7+aNHQprl6qhPMoNv1de3KDNz92k/v8bFiQJKwdck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJLNiGpwEAU7tCVM/4NuqMqYCIlmuH1213B++QeTTLW0iVfXHG
 Xg6IpQKcnrL+unHuuE3bZChypPEn0CeZW93bN+1fZsLSz9iUx7uXxyyuUnZZ3xSzOSAT3elgx8x
 VXhRI7gf2tcdAlBtCXKrf/OmnmCKRXSi2Hi8BDuRWGkiMijBQ4kTMJz0qTZlpphiMuBgL/wQ=
X-Gm-Gg: ASbGncsGwiRAdo9mhQdcstIg0rIekTRucFqxipSGlDR2nzCRTFT7WBjYiHlT716AmJZ
 ZUBKv22PtEkYJFDh7SGALuO/CeT/xIZfb9IVcyK0ay+jvXCW3lA+UU0vf5QC+tJudhRuWZA8BY8
 RcZX4W0Dap//WT4yYf5KCFavmvLwuheTWch9wR2iC9XAgA7q5M0BNSG/2HKrUwx6/JsLv0KdSqe
 h3pzAV4wNCy4exywzYG7wQkdvTy+AKCsO8hQ6aNtcqw5Ank5hHOuo6ohjRoPlCy8mH2dz6qj/h1
 mp8WrGDJeSKBAI8f40tHluNJUuQo1mUsHdx2saLMPT3yLHCxWHetuVaz37Y1i79B8W4HbjZ0LnU
 =
X-Received: by 2002:a05:6214:c68:b0:6ea:d033:2853 with SMTP id
 6a1803df08f44-6f8b0893f5emr409115246d6.16.1747919651217; 
 Thu, 22 May 2025 06:14:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJaT9vIU6lEC2EHkfSU8H8PngKanzClUBBmQT9BP7n8XjOM+NYyXnmAucTS28a1j1VfaKGBQ==
X-Received: by 2002:a05:6214:c68:b0:6ea:d033:2853 with SMTP id
 6a1803df08f44-6f8b0893f5emr409114776d6.16.1747919650722; 
 Thu, 22 May 2025 06:14:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085d0dafsm32851611fa.109.2025.05.22.06.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 06:14:09 -0700 (PDT)
Date: Thu, 22 May 2025 16:14:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Jayesh Choudhary <j-choudhary@ti.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kieran.bingham+renesas@ideasonboard.com, linux-kernel@vger.kernel.org,
 max.oss.09@gmail.com, devarsht@ti.com
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
Message-ID: <cr7int6r6lnpgdyvhhqccccuyrh7ltw5qzh7kj5upznhea4pfh@rn6rwlf7ynqt>
References: <20250508115433.449102-1-j-choudhary@ti.com>
 <CAD=FV=V1mNX-WidTAaENH66-2ExN=F_ovuX818uQGfc+Gsym1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=V1mNX-WidTAaENH66-2ExN=F_ovuX818uQGfc+Gsym1Q@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEzNCBTYWx0ZWRfX7Ap2F/sVVEGW
 mFJmxUvx+PbYNZsWSaucmTLVjNUherH72sDxpZ0fAuhU2Wd/RWTZJc7P/sGOIcxzxii3IIcWZ5+
 8Pt+p4Z/VYA48G6zfUjDqvvr9c0zAN0x0wMn2HPmDaX5z99Z8UOVK6WAC14ifGw71Uzv4nvKKjT
 Eq6kUicjU/eVYytTsAiPpZPpHvRch5dET+/OKvdjIXAEYn9z2FHSL+LehtcjOWO2VFj+HauIl/8
 IeIMVSgFXOpSTq5D3jPksxfFw726D+oECl3XnLoJ2PRlYEAvMWBH6azIhQx4uT/EuQyR4K4003r
 ul+hdxAywkssj5jnLXJY14sj0d9qG1zyMI24Ydm40mMxwuBXkqtNJ9ZyXYj6b8GHg0WqqVz6MbY
 33O4pBElerV95e8lPa7++xyemaZ/1N4qG1s+kqWH68y4IfS5P7zb3XV9ZF359TFFvXxh6HTA
X-Proofpoint-GUID: _xr2cowD-67uf7O2z5kfteYbIPCzwAT5
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682f2324 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=m8ToADvmAAAA:8 a=PSi6YmJ-gjCoPkDBYnYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: _xr2cowD-67uf7O2z5kfteYbIPCzwAT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220134
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

On Wed, May 21, 2025 at 06:10:59PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, May 8, 2025 at 4:54 AM Jayesh Choudhary <j-choudhary@ti.com> wrote:
> >
> > By default, HPD was disabled on SN65DSI86 bridge. When the driver was
> > added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
> > call which was moved to other function calls subsequently.
> > Later on, commit "c312b0df3b13" added detect utility for DP mode. But with
> > HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
> > state always return 1 (always connected state)
> >
> > Also, with the suspend and resume calls before every register access, the
> > bridge starts with disconnected state and the HPD state is reflected
> > correctly only after debounce time (400ms). However, adding this delay
> > in the detect function causes frame drop and visible glitch in display.
> >
> > So to get the detect utility working properly for DP mode without any
> > performance issues in display, instead of reading HPD state from the
> > register, rely on aux communication. Use 'drm_dp_dpcd_read_link_status'
> > to find if we have something connected at the sink.
> >
> > [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
> >
> > Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP")
> > Cc: Max Krummenacher <max.krummenacher@toradex.com>
> > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > ---
> >
> > v1 patch link which was sent as RFC:
> > <https://patchwork.kernel.org/project/dri-devel/patch/20250424105432.255309-1-j-choudhary@ti.com/>
> >
> > Changelog v1->v2:
> > - Drop additional property in bindings and use conditional.
> > - Instead of register read for HPD state, use dpcd read which returns 0
> >   for success and error codes for no connection
> > - Add relevant history for the required change in commit message
> > - Drop RFC subject-prefix in v2 as v2 is in better state after discussion
> >   in v1 and Max's mail thread
> > - Add "Cc:" tag
> >
> > This approach does not make suspend/resume no-op and no additional
> > delay needs to be added in the detect hook which causes frame drops.
> >
> > Here, I am adding conditional to HPD_DISABLE bit even when we are
> > not using the register read to get HPD state. This is to prevent
> > unnecessary register updates in every resume call.
> > (It was adding to latency and leading to ~2-3 frame drop every 10 sec)
> >
> > Tested and verified on TI's J784S4-EVM platform:
> > - Display comes up
> > - Detect utility works with a couple of seconds latency.
> >   But I guess without interrupt support, this is acceptable.
> > - No frame-drop observed
> >
> > Discussion thread for Max's patch:
> > <https://patchwork.kernel.org/project/dri-devel/patch/20250501074805.3069311-1-max.oss.09@gmail.com/>
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> Sorry for the delay in responding. Things got a little crazy over the
> last few weeks.
> 
> 
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 60224f476e1d..9489e78b6da3 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -352,8 +352,10 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
> >          * change this to be conditional on someone specifying that HPD should
> >          * be used.
> >          */
> > -       regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> > -                          HPD_DISABLE);
> > +
> > +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
> > +               regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> > +                                  HPD_DISABLE);
> 
> Given your an Max's testing, I'm totally on-board with the above.
> 
> >
> >         pdata->comms_enabled = true;
> >
> > @@ -1194,13 +1196,14 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
> >  {
> >         struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> >         int val = 0;
> > +       u8 link_status[DP_LINK_STATUS_SIZE];
> >
> > -       pm_runtime_get_sync(pdata->dev);
> > -       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> > -       pm_runtime_put_autosuspend(pdata->dev);
> > +       val = drm_dp_dpcd_read_link_status(&pdata->aux, link_status);
> >
> > -       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> > -                                        : connector_status_disconnected;
> > +       if (val < 0)
> > +               return connector_status_disconnected;
> > +       else
> > +               return connector_status_connected;
> 
> I'd really rather not do this. It took me a little while to realize
> why this was working and also not being slow like your 400ms delay
> was. I believe that each time you do the AUX transfer it grabs a
> pm_runtime reference and then puts it with "autosuspend". Then you're
> relying on the fact that detect is called often enough so that the
> autosuspend doesn't actually hit so the next time your function runs
> then it's fast. Is that accurate?
> 
> I'd rather see something like this in the bridge's probe (untested)
> 
>   if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort) {
>     pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> 
>     /*
>      * In order for DRM_BRIDGE_OP_DETECT to work in a reasonable
>      * way we need to keep the bridge powered on all the time.
>      * The bridge takes hundreds of milliseconds to debounce HPD
>      * and we simply can't wait that amount of time in every call
>      * to detect.
>      */
>     pm_runtime_get_sync(pdata->dev);
>   }
> 
> ...obviously you'd also need to find the right times to undo this in
> error handling and in remove.

What about:
- keeping pm_runtime_get()/put_autosuspend() in detect, but..
- also adding .hpd_enable() / .hpd_disable() callbacks which would also
  get and put the runtime PM, making sure that there is no additional
  delay in .detect()?

> 
> Nicely, this would be the same type of solution needed for if we ever
> enabled interrupts.

-- 
With best wishes
Dmitry
