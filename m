Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739043BB775
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 09:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FECA8994D;
	Mon,  5 Jul 2021 07:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Sun, 04 Jul 2021 23:47:16 UTC
Received: from vps5.brixit.nl (vps5.brixit.nl [192.81.221.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC7B89B18;
 Sun,  4 Jul 2021 23:47:16 +0000 (UTC)
Received: from [192.168.20.102] (unknown [77.239.252.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by vps5.brixit.nl (Postfix) with ESMTPSA id 566736086F;
 Sun,  4 Jul 2021 23:40:05 +0000 (UTC)
Subject: Re: [Freedreno] [RFC 3/6] drm/msm/mdp5: move
 mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
 <20210609211723.2565105-4-dmitry.baryshkov@linaro.org>
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <95f0c71f-2d22-98c0-a587-1125070b11de@postmarketos.org>
Date: Mon, 5 Jul 2021 02:41:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210609211723.2565105-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 05 Jul 2021 07:05:10 +0000
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/10/21 12:17 AM, Dmitry Baryshkov wrote:
 > Move a call to mdp5_encoder_set_intf_mode() after
 > msm_dsi_modeset_init(), removing set_encoder_mode callback.
 >
 > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 > ---
 >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++--------
 >   1 file changed, 3 insertions(+), 8 deletions(-)
 >

My Samsung Galaxy S5 with mdp5 and cmd mode panel seems to work same as 
before with these patches applied.

Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

