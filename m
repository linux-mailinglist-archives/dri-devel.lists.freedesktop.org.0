Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19255734CA2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 09:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFC010E18F;
	Mon, 19 Jun 2023 07:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic307-53.consmr.mail.ir2.yahoo.com
 (sonic307-53.consmr.mail.ir2.yahoo.com [87.248.110.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D9610E06A
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 13:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1687096036; bh=zJAq0DJA5QUBWq8RFx6AILq6sCNRAR/2bfV+wVuC21A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=FsTWxoWKfwhMFjo9pdz2YSfIdAUHVSZFqY6B5m/7baYYVQ9QlNdhWR4sLqUYXBJQRR3e9yMMazmU4X8l12O/IzhHXENKtvyabnc3bmYZyJQ3OSycPldjTTvHuXhK5+0LvBweFlpF+yLom2H15MerwFtLszZ6DlabAMTtNDcxxWk7Nbbl4MmF2w9adgDrQceenTMVdv4PM5NISdLBAuqJYSF0T3rpeRzbdGWnDKCw/KcqYJWcSLEXtU2w3q9GT9V/yqAXeiyfkGEZKY000FO/lrlz+hNY5GICmNCZTqAfuNJTsGbjUyjCaVE+pOJXZG72Pss/mWVwjGsDMGTFip75Ig==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1687096036; bh=LGk08Mv2Ubrkr9kUJRdAxgVuQGhyijsBrTNpv5qiv6A=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=kqopV+bDkYelYVadOYM+00JClAKd6py2fClSgZsUnvXi51cbUZa63elCoXo35BtlbM9f4niv7s+ySIrZCsgc2nYs790WiNBZBTNTlfwnMsrLtBcV4QmyWpe3AB+p3hYBKgbdb5YNYbIp3VpFMB16gmEbDcHVZNvFtPXJKQjS6sLrqmjyEJC+A/bRi2V+wQSc2SspjyvNCCpTzXDT+RN9zWmKY9hpphkvTGZ0LoI4mfrpTw+xEC3Zb05RWJdtGlK1j2B4Y471CGHxFSLc4OqCMmFaI/V76a3FF5eiv9PqXDFQhiQDgsBQmCqD8SiyzUk1uwJX+HNhXhqdI3ytIBi0wA==
X-YMail-OSG: 8rbh2GoVM1mcywPMqjbJ3ItK8VLFiy5H.gOM_P32Q6RgqB5K1lBfcURQHrC1iN1
 N2nIpEG_UVe.Ts6YrMtWZDgxAekS7BOuh.bJC1oVtVg3yu_7H8jEu6Mra2Wj9C9ybJbQo0iObW.h
 cjG0Z_TzvkmFlIBy1rxVbHlxslx2jScydEd5stAnKFipJgIc6sQ0TjfortlE5kdKQWtu7TphupdE
 vrbYDKRq5OglBCelSXx9ywERAaJDak25lCzoeal54CKF6m10Jl.Bnxh8X6gcckI1ON9GBQGYRWf.
 nvD88jtrX5Cyd0wnF8MNaflZRoqaM6eeEoplDeyS.R5j46yaLqA_9R15EA_aWLfe155_mBQWw1Ux
 n82ndtPxAsMJvFZ6Dt5V1eZosNbpX.fsC4aDv20sGY2Sz34nyt.guCMAZdjbQWbC8JTQuytF_LTj
 1F5XZFzylGytryCu7sG.ZWr6NVk4ptHDDqtmvKwFHosINLhvCeNYlJKMnHotTdN0IF4hRXAFrG_9
 iRSA42dGF.u6qNGMDIHRFE59aA0gFT.IImv3MA64SXIVcVrCm7ti8l0L5imVxcPB6HCWE4NWsH5V
 uwh5beXJhdZqap7HQWEIpC.I_f5tWwR5hnxuNoehL_BtUv39jWc4dMhxWN6yKjnHSu8T_qVVNkuE
 Qf9GA_YTthndEmNwMETGXMnCqEqbcokai6KH9EbZDBQAlcxK8WDGzV5fZg68774Cn1RIyKCEhf4J
 wqOG8kv.aEJkK0X4NJeRQ45mwSzXixK_DsAZ0H_UKgnb5URbpSFAN5tMJ8Az1P7q59znknu8wciX
 lXb.7TrxZzGN9vN_EzaMB0ASsN7vV983JKOUCORXPBFDx.KpeHqPdV4jRMG8rejvWFkTSylSkAZp
 8wRw7cWyOvQdN9mxdp77G2myoBmrDHGZYo3qsGdf3hghlncWH0r2q49o4t70Gl84YZHoP127rdnY
 LX9sVNo_J4yTFzVTR0eMBxCOFteBIAnuEfZi9WIf5CmPda5ZQb4CgNydshoqU_EaeXOcb4VFEk7t
 bL0TO7Th1Xx4oy_S8Vk1z8V7DHlWAPq4VnhX16TbldDCQOjDaId3SvqXhRDF3tILrooJDt.Np9cW
 OR_i7GVwYkxQFcgTwTeTie0_PJPWXQYUd6EwdHOVK558MRDTHxkXLCnhgnIqUjIAofHxh9cLdbza
 K1mpHyIY8fzYhcVaIXxOUZUY7IdoJMTc4X.rwWqPY_vOXryHrzP4_bUJ.fjyHwHakZ376qzauIjH
 8djayxk8IgKm5lrYuiroxyEUZWc2i67hdDkQpNZBbobbaunKduwa.RgpKEXdvLyXQDuKwWRS4KPF
 U_I6S2s9GYINGyFww1Alpz7mior2p5uNsCcBL_B6fExorcESuXq62oje93Sch1g1bbBmjDUFha9K
 1Ei5YFD2Q4XRmrgakmgOzr.haz6Y2QDGFmMGLBGdvsXoJGoy4LAw1n35CZe._naOV9gQJ3yq388D
 wGSEVB9KuXqtR8q.IIRzf1jEav46V5pYZgKmY3msJh_wsyucDpCw0aWa1Oj1rfuMu06CwN9juQnk
 f_vKeqkXW31YtEy2OOI4TtCD58bMRII5UOsiJYHKV8eMvs9DBUSmhpyrH00K7jg9RPMVzN6v4eCG
 o1y5OdvPJ2g.u_yVlhgGSyQgReJp4F2HaPCHH4MTFdhSikq6SgBHCneUKRyODjHVhEopokihyPd6
 wwK1dZsOLpb.EHyPk5VkMVt4mmYZb6t.ihpFEwSerSoxZOyhKN8NMMEoOAUHF9sQYnv_A1tNxjp0
 DEORT2bjAionpodtwjGhTWYn4Rhv.L_oT.nsWEiDeitRUt8.J7UeJwlDiUup0dF.8n8idGJdizeD
 MgDIddvOz.IBo1RsDfIKOqujTsy9TPhkkE9Ga5zBWxtyXbbW2aFhkxDObTtVhOsbGYdEmKpboMXc
 pz3u0vgUaOwUtMBqF9NBcmZPAFjNyyl3zPLYEGeSkIqx.6uGxR6mfsdztomwxSTIXGL_R6hC1zXV
 5wDKCWxzZ.SLB25fbr8Z6uzg2pPGgnYGtXHtEn9wbKFbONhQ5fHMY.QJjmBiSXbX4Wo1LNAWoGw.
 FeerH.bCYGeKQhUGcCvpbKyMPxUGtb.Ux0r_LxUBxsD7F0VKn6mTxvzdsc0w30Qm9ddMCIyDXFc2
 rQneOpiq._BiF1IL1nGpDZMkiaKIqeJuzwrwU5QXBWJ8jLiXq1Lb67Uzr5_iYkjlCwq.Qrxn.EoY
 ymiJb7A6MXN0I8QMB6mloGD2plXLn.CBH4v87fLx1NyXL5F4jHqvQvSM9aFW9QVZ2DIROohujgiV
 Sh8Bf10WGCc7SZ5UGGWQ222eq3kOH20Ynwi8-
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: b274ec6a-3ff9-4e9c-8d6f-3a0c8da40061
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ir2.yahoo.com with HTTP; Sun, 18 Jun 2023 13:47:16 +0000
Received: by hermes--production-ir2-7867f454fc-kqstn (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 82fed9c2dc15f8b9aba5a128f5ba0cec; 
 Sun, 18 Jun 2023 13:47:12 +0000 (UTC)
Message-ID: <e644a590-27f6-0eed-af58-097677beaf13@rocketmail.com>
Date: Sun, 18 Jun 2023 15:47:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/panel: move some dsi commands from unprepare to
 disable
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20230613-panel-dsi-disable-v1-1-5e454e409fa8@linaro.org>
 <ZIjayn8nVy-ejThH@gerhold.net>
 <CACRpkdZ7a3aARMs3iBbBavF_0AkPOPs3fH8e6CrZYo7Ybr6m_A@mail.gmail.com>
 <4f78b601-6e6e-2274-3174-87c62d7cfcd5@linaro.org>
 <CAD=FV=X_xonf1Dz0BsNTKm4-zBm+ccKvPO+wEWFVMUVY_2=h3Q@mail.gmail.com>
From: Jakob Hauser <jahau@rocketmail.com>
In-Reply-To: <CAD=FV=X_xonf1Dz0BsNTKm4-zBm+ccKvPO+wEWFVMUVY_2=h3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21557
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Approved-At: Mon, 19 Jun 2023 07:45:35 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, phone-devel@vger.kernel.org,
 Stephan Gerhold <stephan@gerhold.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-arm-msm@vger.kernel.org,
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>,
 Ajay Kumar <ajaykumar.rs@samsung.com>, Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On 16.06.23 01:36, Doug Anderson wrote:
...
> I guess the tl;dr (summary of my summary) is:
> 
> a) Moving panels like this to "pre_enable_prev_first" seems like a
> reasonable idea anyway and (presumably) works around the issue.
> 
> b) Moving some commands between disable() / post_diable() or
> pre_enable() / enable() can also make sense and isn't terrible. As
> people have pointed out, there is some vagueness on exactly what
> belongs in each.
> 
> c) Ideally someone could fix the MSM DSI driver to behave as Dave documented.
...
Actually I don't want to disturb the discussion here. Still I would like 
to point out that option a) "pre_enable_prev_first" doesn't seem to work 
well yet. On my device samsung-serranove with panel 
samsung-s6e88a0-ams427ap24 (not in mainline, [1]), when applying 
"pre_enable_prev_first" I notice two issues.

1) According to commig 4fb912e5e190 ("drm/bridge: Introduce 
pre_enable_prev_first to alter bridge init order") [2] it's supposed to 
reverse the order in "post_disable" as well. That doesn't work on my 
device, the "post_disable" order doesn't get changed by 
"pre_enable_prev_first".

2) When enabling the panel, for each mipi_dsi_dcs_... command there is 
an error in dmesg "msm_dsi 1a98000.dsi: [drm:dsi_cmds2buf_tx [msm]] 
*ERROR* wait for video done timed out". The panel works well 
nonetheless. However, before commit 007ac0262b0d ("drm/msm/dsi: switch 
to DRM_PANEL_BRIDGE") these errors didn't show up.

I tried to get more insight in the order of issue 1). I added additional 
debug markers in drivers/gpu/drm/drm_bridge.c (original state linked in 
[3]) and got the following behavior. To me it's rather hard to 
understand the decision-making, to be honest. Both in "pre_enable" as 
well as in "post_disable" first the host and then the panel are 
processed. At "post_disable" it should be the other way around.

I'm currently on kernel 6.4-rc4 with cherry-picked commits from 
linux-next 9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up 
DSI hosts at modeset") and d8dd416cb420 ("drm/msm/dsi: More properly 
handle errors in regards to dsi_mgr_bridge_power_on()") and added 
"pre_enable_prev_first" to the panel driver. Device is samsung-serranove 
in X11 environment.

At boot:
--------
chain_pre_enable: bridge at beginning: 'host'
chain_pre_enable: iter in the list loop at the beginning: 'panel'
chain_pre_enable: next if iter prev_first: 'panel'
chain_pre_enable: limit if iter prev_first: 'host'
chain_pre_enable: next in list loop from_reverse: 'panel'
chain_pre_enable: next in list loop from_reverse: 'host'
chain_pre_enable: break because 'next == bridge' 'host'
chain_pre_enable: marker at end of first list loop block
chain_pre_enable: iter at end of first list loop block: 'panel'
chain_pre_enable: next at end of first list loop block: 'host'
chain_pre_enable: limit at end of first list loop block: 'host'
chain_pre_enable: next in 2nd list loop block: 'host'
chain_pre_enable: next is not iter, call pre_enable within 2nd list loop
                   block: 'host'
call_pre_enable: pre_enable bridge 'host'
call_pre_enable: inside 'else if', do pre_enable
chain_pre_enable: next in 2nd list loop block: 'panel'
chain_pre_enable: break because 'next == iter': 'panel'
chain_pre_enable: marker at end of 2nd list loop block
chain_pre_enable: iter after 2nd list loop block, call pre_enable:
                  'panel'
call_pre_enable: pre_enable bridge 'panel'
call_pre_enable: inside 'if'
call_pre_enable: passed second 'if', do atomic_pre_enable
msm_dsi 1a98000.dsi: [drm:dsi_cmds2buf_tx [msm]] *ERROR* wait for video
                      done timed out
msm_dsi 1a98000.dsi: [drm:dsi_cmds2buf_tx [msm]] *ERROR* wait for video
                      done timed out
...
chain_pre_enable: if iter is prev_first...: 'panel'
chain_pre_enable: ... change iter to 'limit': 'host'
chain_pre_enable: iter at the end of function: 'host'
chain_pre_enable: bridge at the end of function: 'host'
chain_pre_enable: break if iter is bridge at the end of function: 'host'

Then the panel get's turned off:
--------------------------------
chain_post_disable: bridge at beginning: 'host'
chain_post_disable: bridge of the list loop at the beginning: 'host'
chain_post_disable: if entry is not last, set 'next' to next entry:
                     'panel'
chain_post_disable: if 'next' is prev_first, set 'limit' to next:
                     'panel'
chain_post_disable: loop through the list of 'next': 'panel'
chain_post_disable: if 'next' is prev_first, change 'next' to: 'host'
chain_post_disable: ... and 'limit' to the same: 'host'
chain_post_disable: new loop through list of 'next' in reverse order:
                     'host'
chain_post_disable: break because 'next == bridge' 'host'
chain_post_disable: after !list_is_last block, call post_disable for
                     bridge: 'host'
call_post_disable: post_disable bridge: 'host'
call_post_disable: inside 'else if', do post_disable
chain_post_disable: if limit available, set 'bridge = limit': 'host'
chain_post_disable: bridge of the list loop at the beginning: 'panel'
chain_post_disable: after !list_is_last block, call post_disable for
                     bridge: 'panel'
call_post_disable: post_disable bridge: 'panel'
call_post_disable: inside 'if'
call_post_disable: passed second 'if', do atomic_post_disable
panel-s6e88a0-ams427ap24 1a98000.dsi.0: Failed to set display off: -22
panel-s6e88a0-ams427ap24 1a98000.dsi.0: Failed to un-initialize panel:
                                         -22

It's not my idea to go into detailed debugging. I just wanted to say 
that option a) "pre_enable_prev_first" currently doesn't work well, at 
least on my device. I would assume it affects other devices too. Also I 
didn't want to delay Caleb's patch review. However, it might be related 
if the "pre_enable_prev_first" approach doesn't work on disable.

[1] 
https://github.com/msm8916-mainline/linux/blob/msm8916/6.4-rc4/drivers/gpu/drm/panel/msm8916-generated/panel-samsung-s6e88a0-ams427ap24.c
[2] 
https://github.com/torvalds/linux/commit/4fb912e5e19075874379cfcf074d90bd51ebf8ea
[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_bridge.c?h=v6.4-rc4

Kind regards,
Jakob
