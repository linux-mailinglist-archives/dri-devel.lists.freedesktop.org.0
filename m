Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DECE74E7595
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 16:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EE610E76B;
	Fri, 25 Mar 2022 15:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9724610E73D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:01:44 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220325150143euoutp01d2c308e352edf37bfdf675d610b5e0f7~fp9Cs0_YU2281822818euoutp01D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:01:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220325150143euoutp01d2c308e352edf37bfdf675d610b5e0f7~fp9Cs0_YU2281822818euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1648220503;
 bh=Z3Jgdpb/BI5q24Y5rNF9cGHLoZEZaWp77CPHUVnPC7w=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=DJ2tycH021aGkcsTav85MmVk7dRJvYW86RaoTm4pyCsIZ4GSkPOhGjRt505yy0Bdl
 3lRDIPC5ISJvA6az5vSBjgxdz9Os2VE7jfzPjvt6oRA27p2rDTmtq+My8S8On58s6v
 JYTqVIGbfwODEkEc/eK/G3lS6hOOSGAMTrKDU65M=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220325150143eucas1p21d13976102525b416481bfba57525da8~fp9Cc5wM32345723457eucas1p2R;
 Fri, 25 Mar 2022 15:01:43 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 9E.3B.09887.659DD326; Fri, 25
 Mar 2022 15:01:42 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220325150142eucas1p1be8715062c3b2e743f04b4e78054e3cf~fp9B66UA90731707317eucas1p1P;
 Fri, 25 Mar 2022 15:01:42 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220325150142eusmtrp227137efba37b82a154acaea6a6fd015f~fp9B6CPKT2057920579eusmtrp2e;
 Fri, 25 Mar 2022 15:01:42 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-28-623dd9567c01
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 04.1C.09404.659DD326; Fri, 25
 Mar 2022 15:01:42 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220325150141eusmtip2bb706e1ef2b8c350b2c4b02c11ec8b19~fp9BO-1AV1623216232eusmtip2m;
 Fri, 25 Mar 2022 15:01:41 +0000 (GMT)
Message-ID: <f13dfce8-63a4-8337-4fe9-56a1ea57e4e4@samsung.com>
Date: Fri, 25 Mar 2022 16:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v6 2/6] drm: bridge: panel: Reset the connector state
 pointer
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220303163654.3381470-3-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNKsWRmVeSWpSXmKPExsWy7djPc7phN22TDH49sbC4v/gzi8WVr+/Z
 LCbdn8Bi8WXTBDaLzolL2C2WT9jHZnGqsZXF4lBftMWnWQ+ZLVb83MrowOWx9uN9Vo/3N1rZ
 PWZ3zGT1WLznJZPHnWt72Dzudx9n8lgy7SqbR9+WVYwBHFFcNimpOZllqUX6dglcGW8/n2Ev
 eChbcabtDVMDY59UFyMnh4SAicT7U+tZuhi5OIQEVjBK7Do1hR3C+cIoMWvnZajMZ0aJu2d3
 MMG0LFg+jREisZxR4uLSDVAtHxklHl//BVbFK2Ancba7jxXEZhFQlVgw5xRUXFDi5MwnLCC2
 qECSxOrtq9lAbGGBYIkzkycygtjMAuISt57MZwIZKiLwiEni6Z//rBAJd4mnb7Yxg9hsAoYS
 XW+7wJo5BZwklm7eyQRRIy+x/e0cZpBmCYF2Tollf06zQdztIrHq/wwWCFtY4tXxLewQtozE
 /50g2ziA7HyJvzOMIcIVEtder2GGsK0l7pz7xQZSwiygKbF+lz5E2FGid9EdZohOPokbbwUh
 LuCTmLRtOlSYV6KjTQiiWk1i1vF1cDsPXrjEPIFRaRZSoMxC8vwsJL/MQti7gJFlFaN4amlx
 bnpqsVFearlecWJucWleul5yfu4mRmD6Ov3v+JcdjMtffdQ7xMjEwXiIUYKDWUmE9/5l6yQh
 3pTEyqrUovz4otKc1OJDjNIcLErivMmZGxKFBNITS1KzU1MLUotgskwcnFINTOmSH6r0+nfk
 mLOJOy/ldJ6yKGfO7spNr3cmxE41d7q051H04cmiGzYvK6ybqWq3scJsT9ChE/fyNXtnGPzX
 lBTYb9+UzHitkY2t55bz7Fny+5fF/feXehf8q+ncykcqS7LfBt/pv7I3a++VuLdWtUknnvUH
 5n1cyiH+Ik6J+4nTv0t2KTxeq5KmO2V0zHh7aYnqpTn7igxOP3Vu8uxfk2233Cn87L/2LwoW
 MoXXP6SLOK99stPHwzbNeS33HrM6w7/cOheuuGzselj2uWBX+dvjTX+E299sOcrtd/NZ7kl3
 vaLw1+wGh1hX1LTu/lOvcGXBji98v3bPTEz7H/NeLXKW7eqFLM2da6prAjOS3ZRYijMSDbWY
 i4oTATLRBUDOAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsVy+t/xe7phN22TDK79ErO4v/gzi8WVr+/Z
 LCbdn8Bi8WXTBDaLzolL2C2WT9jHZnGqsZXF4lBftMWnWQ+ZLVb83MrowOWx9uN9Vo/3N1rZ
 PWZ3zGT1WLznJZPHnWt72Dzudx9n8lgy7SqbR9+WVYwBHFF6NkX5pSWpChn5xSW2StGGFkZ6
 hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GW8/n2EveChbcabtDVMDY59UFyMnh4SA
 icSC5dMYuxi5OIQEljJKPNqwixEiISNxcloDK4QtLPHnWhcbRNF7Rom59z6DJXgF7CTOdveB
 2SwCqhIL5pxigogLSpyc+YQFxBYVSJK41NUONlRYIFjizOSJYDazgLjErSfzmUCGigg8Y5I4
 umktK0TCXeLpm23MENvOMkrMWnQHbBKbgKFE11uQMzg5OAWcJJZu3skE0WAm0bW1C2qqvMT2
 t3OYJzAKzUJyyCwkC2chaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwKjdduzn
 lh2MK1991DvEyMTBeIhRgoNZSYT3/mXrJCHelMTKqtSi/Pii0pzU4kOMpsDQmMgsJZqcD0wb
 eSXxhmYGpoYmZpYGppZmxkrivJ4FHYlCAumJJanZqakFqUUwfUwcnFINTPrytl0WBpyM91ut
 N3PrTU1fwmv80f+OuF7DsvgrewL6/S93tt+VCjT5LaR7uie2amFBQlTYOUVB2cvCkz2VWBui
 DlZ+u28rcN377PIv1usP6Qh9X/WlIKXM8xT/6ausUa88BSLPPP6fbj/b3vScyY2Zm46zrtMW
 Vfr+TGm1zou3PVvuScyqWvCcM7Zrh9Ibm9e87ttCK+1nNq9ZW3nf+dYijy+XJBl/s8eXi89K
 myXS9Mtb2F540+0brdEmPK1qlmkZ3uYvJe+3HjoR+Ev8xoXQ3w3rVRRjmyzWT4o+GvJuQ2Kn
 Z6D9/BebmPiCxD++NYl317899b/lCYFwz3+Gur0vnI/bNdwLCL/04etlJZbijERDLeai4kQA
 Ek5rDmMDAAA=
X-CMS-MailID: 20220325150142eucas1p1be8715062c3b2e743f04b4e78054e3cf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220303163748eucas1p128e4cc29bba3db99ffdcbabe5aa3fbab
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220303163748eucas1p128e4cc29bba3db99ffdcbabe5aa3fbab
References: <20220303163654.3381470-1-jagan@amarulasolutions.com>
 <CGME20220303163748eucas1p128e4cc29bba3db99ffdcbabe5aa3fbab@eucas1p1.samsung.com>
 <20220303163654.3381470-3-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03.03.2022 17:36, Jagan Teki wrote:
> Trigger hotplug event with drm_kms_helper_hotplug_event might fail if the
> connector state pointer is NULL.
>
> BUG observed in exynos dsi driver where drm_bridge_attach is trying to register
> a connector in panel_bridge before the hotplug event is triggered,
>
> WARNING: CPU: 1 PID: 1 at drivers/gpu/drm/drm_atomic_state_helper.c:494 drm_atomic_helper_connector_duplicate_state+0x94/0x9c
> Modules linked in:
> CPU: 1 PID: 1 Comm: swapper/0 Tainted: G W 5.16.0-rc1-00009-g704b1dbfa4c2 #11058
> Hardware name: Samsung Exynos (Flattened Device Tree)
> [<c0110b30>] (unwind_backtrace) from [<c010c618>] (show_stack+0x10/0x14)
> [<c010c618>] (show_stack) from [<c0b657d4>] (dump_stack_lvl+0x58/0x70)
> [<c0b657d4>] (dump_stack_lvl) from [<c01261dc>] (__warn+0xd0/0x134)
> [<c01261dc>] (__warn) from [<c0b5f628>] (warn_slowpath_fmt+0x5c/0xb4)
> [<c0b5f628>] (warn_slowpath_fmt) from [<c064bce4>] (drm_atomic_helper_connector_duplicate_state+0x94/0x9c)
> [<c064bce4>] (drm_atomic_helper_connector_duplicate_state) from [<c0666b64>] (drm_atomic_get_connector_state+0xd4/0x190)
> [<c0666b64>] (drm_atomic_get_connector_state) from [<c0667928>] (__drm_atomic_helper_set_config+0x314/0x368)
> [<c0667928>] (__drm_atomic_helper_set_config) from [<c067e628>] (drm_client_modeset_commit_atomic+0x170/0x278)
> [<c067e628>] (drm_client_modeset_commit_atomic) from [<c067e800>] (drm_client_modeset_commit_locked+0x60/0x1c8)
> [<c067e800>] (drm_client_modeset_commit_locked) from [<c067e98c>] (drm_client_modeset_commit+0x24/0x40)
> [<c067e98c>] (drm_client_modeset_commit) from [<c06509c0>] (drm_fb_helper_set_par+0xb8/0xf8)
> [<c06509c0>] (drm_fb_helper_set_par) from [<c05b86d0>] (fbcon_init+0x2c0/0x518)
> [<c05b86d0>] (fbcon_init) from [<c060636c>] (visual_init+0xc0/0x108)
> [<c060636c>] (visual_init) from [<c06085e4>] (do_bind_con_driver+0x1b8/0x3a4)
> [<c06085e4>] (do_bind_con_driver) from [<c0608b40>] (do_take_over_console+0x13c/0x1e8)
> [<c0608b40>] (do_take_over_console) from [<c05b6854>] (do_fbcon_takeover+0x78/0xd8)
> [<c05b6854>] (do_fbcon_takeover) from [<c05b1154>] (register_framebuffer+0x208/0x2e0)
> [<c05b1154>] (register_framebuffer) from [<c064ead0>] (__drm_fb_helper_initial_config_and_unlock+0x400/0x63c)
> [<c064ead0>] (__drm_fb_helper_initial_config_and_unlock) from [<c063a718>] (drm_kms_helper_hotplug_event+0x24/0x30)
> [<c063a718>] (drm_kms_helper_hotplug_event) from [<c068f668>] (exynos_dsi_host_attach+0x174/0x1fc)
> [<c068f668>] (exynos_dsi_host_attach) from [<c0699354>] (s6e8aa0_probe+0x1b4/0x218)
>
> So reset the atomic state for a given connector by freeing the state pointer
> and allocate a new empty state object. This can be done using connector
> funcs->reset helper and has to be done before the hotplug even calls.
>
> This patch calls the connector->funcs->reset in panel_bridge_attach.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> Changes for v6, v5:
> - none
> Changes for v4:
> - new patch
>
>   drivers/gpu/drm/bridge/panel.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index b32295abd9e7..f6eea194482a 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -83,6 +83,9 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>   	drm_connector_attach_encoder(&panel_bridge->connector,
>   					  bridge->encoder);
>   
> +	if (connector->funcs->reset)
> +		connector->funcs->reset(connector);
> +
>   	return 0;
>   }
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

