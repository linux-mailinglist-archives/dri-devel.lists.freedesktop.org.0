Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8066B25992B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2966E88D;
	Tue,  1 Sep 2020 16:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF75899A7
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 10:36:19 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200901103617epoutp02128c889af4145d052ee3b3746750824c~wooksqn9z0953609536epoutp027
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 10:36:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200901103617epoutp02128c889af4145d052ee3b3746750824c~wooksqn9z0953609536epoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598956577;
 bh=idjv0axlrodit456qbHuz2JQWB1ZsRMsjn/wpW2Q1D4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=L/xoqPx8Rz8Y+ZyDvw65i3loarLFxewAlLpvYDuB0BcrP1rsZu44pJBKvkUWUJ71V
 XzCf0Yx8A+CtZ05NXFu3p4r7sPLDnjDTfw40nw6C1aH9iJCwjx7n8Oe1Mxe80HwRJA
 b8KZiqNy1FUYhmGK6BS5gu7+x0mZZjlLi7lJHp8g=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200901103617epcas1p1a261c7321f84e9c4b9d40b4cd4271b5f~wookaqvNR2021120211epcas1p1d;
 Tue,  1 Sep 2020 10:36:17 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.152]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Bgk4v0VDjzMqYkW; Tue,  1 Sep
 2020 10:36:15 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 6E.58.28578.E142E4F5; Tue,  1 Sep 2020 19:36:14 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200901103614epcas1p101638e69f9b8ed03529c27a53301bdb5~woohX_fBy2021120211epcas1p1Q;
 Tue,  1 Sep 2020 10:36:14 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200901103614epsmtrp1d5b8ff1bf682a25fb052d7e5fa6756d5~woohXQNUj1120511205epsmtrp1b;
 Tue,  1 Sep 2020 10:36:14 +0000 (GMT)
X-AuditID: b6c32a39-8dfff70000006fa2-c3-5f4e241ed233
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 65.FB.08303.E142E4F5; Tue,  1 Sep 2020 19:36:14 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200901103613epsmtip2149c19c055d00c90b8a328041abe6a8e~woohB_jYB2969129691epsmtip2W;
 Tue,  1 Sep 2020 10:36:13 +0000 (GMT)
Subject: Re: [PATCH v4 62/78] drm/vc4: hdmi: Adjust HSM clock rate depending
 on pixel rate
To: Maxime Ripard <maxime@cerno.tech>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <863374f5-d75c-4251-b9f2-e112e2f6c7aa@samsung.com>
Date: Tue, 1 Sep 2020 19:48:41 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200901094509.spgxtkfybebo7mmb@gilmour.lan>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLJsWRmVeSWpSXmKPExsWy7bCmga6cil+8wYFjVhZre4+yWLydu5jF
 4srX92wWBxovM1psenyN1eLyrjlsFhNvb2C3mPHjH6PFtlnL2SzW3XrNZvFo6n1GB26PpvfH
 2Dxm3T/L5nHn3Hk2j/vdx5k8Ni+p92g9+ovFY/Ppao/Pm+QCOKKybTJSE1NSixRS85LzUzLz
 0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
 pCpk5BeX2CqlFqTkFFgW6BUn5haX5qXrJefnWhkaGBiZAhUmZGfsurSQvWCpVsXka+8YGxgn
 KXUxcnJICJhIvJm4kLmLkYtDSGAHo8TkNyegnE+MEn8XnGKEcD4zSmxY1McM09J54RQTRGIX
 o8Tno81QLe8ZJRbvPQJWJSwQI3Gsfz8jiC0ioCpxpXcvWBGzQBezxMFzE9lBEmwCWhL7X9xg
 A7H5BRQlrv54DNbAK2An0XHuFQuIzSKgIrF22g+wGlGBMImT21qgagQlTs58AlbDKWAlceL1
 fLCZzAIGEkcWzWGFsMUlbj2ZzwRhy0tsfzsH7AgJgTMcEme2LmSD+MdF4uOPJ0wQtrDEq+Nb
 2CFsKYmX/W1QdrXEypNH2CCaOxgltuy/wAqRMJbYv3QyVLOixM7fcxkhtvFJvPvaA1TDARTn
 lehoE4IoUZa4/OAuVLmkxOL2TrYJjEqzkPwzC8kPs5D8MAvJDwsYWVYxiqUWFOempxYbFpgi
 x/gmRnA61rLcwTj97Qe9Q4xMHIyHGCU4mJVEeGfe8I0X4k1JrKxKLcqPLyrNSS0+xGgKDOKJ
 zFKiyfnAjJBXEm9oamRsbGxhYmhmamioJM778JZCvJBAemJJanZqakFqEUwfEwenVAOT8nf3
 OXnnjGzXbHffd7a/U7TL8Nnnyc8fHz4uG11bd8X9ouseNt8rayt4d881kXGb+36huVbvjabD
 KZzuuqunnmqLVM0S5bqccqW2NWuHi+ZSNpXPu549WGBR1PN0/RfZn4qP6/SltVd/C28VW//1
 d2QNt8n0vPlX5jd/qF4Zv+Duwd5/v06vDNHoitE6evto+w6Orbvvd5yYm3W8/MMEre+HhHo4
 Oc3sv/4y87n8oIBl7oH7EfklYmpf1jq7+NuuK590NP1ZzcV3vdcsipgCpj48fcc0sfTT9k2J
 nqYpor9OXnvAsuu0l/2D9xOMr6sKbXlyuPf1Pcmfa6dv/n9A6HkNR9BSaZ41R5i3J1/oqFBi
 Kc5INNRiLipOBABuYtu0UAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsWy7bCSvK6cil+8wa9GVou1vUdZLN7OXcxi
 ceXrezaLA42XGS02Pb7GanF51xw2i4m3N7BbzPjxj9Fi26zlbBbrbr1ms3g09T6jA7dH0/tj
 bB6z7p9l87hz7jybx/3u40wem5fUe7Qe/cXisfl0tcfnTXIBHFFcNimpOZllqUX6dglcGbsu
 LWQvWKpVMfnaO8YGxklKXYycHBICJhKdF04xdTFycQgJ7GCUmN01kQUiISkx7eJR5i5GDiBb
 WOLw4WKImreMEic2rQSrERaIkTjWv58RxBYRUJW40ruXGcRmFuhilmjcwQfR8IlJYsLlA2AN
 bAJaEvtf3GADsfkFFCWu/ngM1swrYCfRce4VWA2LgIrE2mk/wGpEBcIkdi55zARRIyhxcuYT
 sBpOASuJE6/ns0Ms05PYcf0XK4QtLnHryXwmCFteYvvbOcwTGIVnIWmfhaRlFpKWWUhaFjCy
 rGKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECI5ILa0djHtWfdA7xMjEwXiIUYKDWUmE
 d+YN33gh3pTEyqrUovz4otKc1OJDjNIcLErivF9nLYwTEkhPLEnNTk0tSC2CyTJxcEo1MO1a
 uZppU5OCZOr9CVZO3S832aW43u4sL6uZWrzSe03UpcptfXwbp8998S1y+SeXS5yOAhndejcV
 b+ms23DedjdfkOy542wWGybV37E5F3OhYn5trzf3qRYj0e8VRsLSZTv0PG7zNBz99Sxq4X4h
 Y+Z7N1IWJV3dK3ru6I6G4jXZpqKS6WvmPZz7M7/7vIOUrJnR9ccTfzB0S1iL/D7BujK/0+hQ
 ekDwjnlbj7Kt3VF9lInl3oup38U+cx7pD//63ntPRvbvqyWLC+7dPNkvs/3Eh56DvxjTqiLL
 nZ6+fvjMu1Xc1q05pMnWx+6pZsTMCUuE3h4pUVmkdWy+z79r8zJ3qQtKsevpzJj6IilqJpcS
 S3FGoqEWc1FxIgAsn9abNwMAAA==
X-CMS-MailID: 20200901103614epcas1p101638e69f9b8ed03529c27a53301bdb5
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200708174513epcas1p2c059db88d8dad1d58aae3651b3c98c2b
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <CGME20200708174513epcas1p2c059db88d8dad1d58aae3651b3c98c2b@epcas1p2.samsung.com>
 <5919dccdd4a792936e6cb7eb55983c530c9a468d.1594230107.git-series.maxime@cerno.tech>
 <95172a9a-e861-5e5d-bf51-2ec03c730237@samsung.com>
 <20200901094509.spgxtkfybebo7mmb@gilmour.lan>
X-Mailman-Approved-At: Tue, 01 Sep 2020 16:37:23 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 9/1/20 6:45 PM, Maxime Ripard wrote:
> Hi Chanwoo,
> 
> On Tue, Sep 01, 2020 at 01:36:17PM +0900, Chanwoo Choi wrote:
>> On 7/9/20 2:42 AM, Maxime Ripard wrote:
>>> The HSM clock needs to be setup at around 101% of the pixel rate. This
>>> was done previously by setting the clock rate to 163.7MHz at probe time and
>>> only check in mode_valid whether the mode pixel clock was under the pixel
>>> clock +1% or not.
>>>
>>> However, with 4k we need to change that frequency to a higher frequency
>>> than 163.7MHz, and yet want to have the lowest clock as possible to have a
>>> decent power saving.
>>>
>>> Let's change that logic a bit by setting the clock rate of the HSM clock
>>> to the pixel rate at encoder_enable time. This would work for the
>>> BCM2711 that support 4k resolutions and has a clock that can provide it,
>>> but we still have to take care of a 4k panel plugged on a BCM283x SoCs
>>> that wouldn't be able to use those modes, so let's define the limit in
>>> the variant.
>>>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>> ---
>>>  drivers/gpu/drm/vc4/vc4_hdmi.c | 79 ++++++++++++++++-------------------
>>>  drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +-
>>>  2 files changed, 41 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
>>> index 17797b14cde4..9f30fab744f2 100644
>>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
>>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
>>> @@ -53,7 +53,6 @@
>>>  #include "vc4_hdmi_regs.h"
>>>  #include "vc4_regs.h"
>>>  
>>> -#define HSM_CLOCK_FREQ 163682864
>>>  #define CEC_CLOCK_FREQ 40000
>>>  
>>>  static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
>>> @@ -326,6 +325,7 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
>>>  	HDMI_WRITE(HDMI_VID_CTL,
>>>  		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
>>>  
>>> +	clk_disable_unprepare(vc4_hdmi->hsm_clock);
>>>  	clk_disable_unprepare(vc4_hdmi->pixel_clock);
>>>  
>>>  	ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
>>> @@ -423,6 +423,7 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>>>  	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>>>  	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
>>>  	bool debug_dump_regs = false;
>>> +	unsigned long pixel_rate, hsm_rate;
>>>  	int ret;
>>>  
>>>  	ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
>>> @@ -431,9 +432,8 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>>>  		return;
>>>  	}
>>>  
>>> -	ret = clk_set_rate(vc4_hdmi->pixel_clock,
>>> -			   mode->clock * 1000 *
>>> -			   ((mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1));
>>> +	pixel_rate = mode->clock * 1000 * ((mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1);
>>> +	ret = clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
>>>  	if (ret) {
>>>  		DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
>>>  		return;
>>> @@ -445,6 +445,36 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>>>  		return;
>>>  	}
>>>  
>>> +	/*
>>> +	 * As stated in RPi's vc4 firmware "HDMI state machine (HSM) clock must
>>> +	 * be faster than pixel clock, infinitesimally faster, tested in
>>> +	 * simulation. Otherwise, exact value is unimportant for HDMI
>>> +	 * operation." This conflicts with bcm2835's vc4 documentation, which
>>> +	 * states HSM's clock has to be at least 108% of the pixel clock.
>>> +	 *
>>> +	 * Real life tests reveal that vc4's firmware statement holds up, and
>>> +	 * users are able to use pixel clocks closer to HSM's, namely for
>>> +	 * 1920x1200@60Hz. So it was decided to have leave a 1% margin between
>>> +	 * both clocks. Which, for RPi0-3 implies a maximum pixel clock of
>>> +	 * 162MHz.
>>> +	 *
>>> +	 * Additionally, the AXI clock needs to be at least 25% of
>>> +	 * pixel clock, but HSM ends up being the limiting factor.
>>> +	 */
>>> +	hsm_rate = max_t(unsigned long, 120000000, (pixel_rate / 100) * 101);
>>> +	ret = clk_set_rate(vc4_hdmi->hsm_clock, hsm_rate);
>>> +	if (ret) {
>>> +		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
>>> +		return;
>>> +	}
>>> +
>>> +	ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
>>> +	if (ret) {
>>> +		DRM_ERROR("Failed to turn on HSM clock: %d\n", ret);
>>> +		clk_disable_unprepare(vc4_hdmi->pixel_clock);
>>> +		return;
>>> +	}
>>
>> About vc4_hdmi->hsm_clock instance, usually, we need to enable the clock
>> with clk_prepare_enable() and then touch the clock like clk_set_rate().
>> I think that need to enable the clock before calling clk_set_rate().
>>
>> When I tested this patchset, it is well working because I think that
>> vc4_hdmi->hsm_clock was already enabled on other side.
> 
> There's no clear rule here on the ordering (at least enforced by the
> framework). There's clocks that need to be disabled to change their rate
> (CLK_SET_RATE_GATE) and some that need to be enabled to change their
> rate (CLK_SET_RATE_UNGATE).
> 
> Generally speaking, it seems more logical to me to have first the rate
> changed and then the clock enabled since it won't create any "hiccup",
> but I could very well see the opposite to be preferred.

If it doesn't cause the problem on h/w, I agree. Thanks for the explanation.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
