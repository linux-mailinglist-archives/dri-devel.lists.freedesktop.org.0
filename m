Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9549A9E4449
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 20:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15F910E55C;
	Wed,  4 Dec 2024 19:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="foW57rbE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5004410E556;
 Wed,  4 Dec 2024 19:14:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733339672; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=G0eYWHb1WI0eq99x3/jjESsRM0PHKl3oNj0IqguOBfaO8BT33SE7EpsgNdI0ejJqQDXmWxEwFeXCykQX56IipMeG/1VCpE/cPQE9/DXlr7QV3dTWJeFRDC3x80bd61oqlz6QJd3jBw+0Ra19pCp4KAVNtYkjaUMXE05PR81zq6o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733339672;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=xNql7HZ635pXOjw9MZHeIc0tn8TsOE40r41049HwSoc=; 
 b=dBNfk5S4YhwVjEDRSRrcyPSaOJdTjN8q13HZIOEUBVp93QaVTQllesAb82o7RzYqZx/bvNVbHI+ZTC1wPwKvztAL09K1g61IdUbZTrJir1lccdEMoT9sjpUizy595xrsVxFUT+57aRY/sSZG5AlNHs1kGozdRJ0XAfW5Ke0ISRY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733339672; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=xNql7HZ635pXOjw9MZHeIc0tn8TsOE40r41049HwSoc=;
 b=foW57rbEuBcp4jR/tr+riz2FgmIzIKT4dXFzTTm20NcXr35Gxd1dDNaWkGS3JoTG
 0En8FGYDzGHmB+lfu2SiAqrPd1TIx8hg3UQmGn7j5yvkY+g00Mv6V1GfLRzMxGilCDR
 oq6jiZtrY4SYwhyVNk1EZfj9foqahkkx35UERRy0=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1733339670975851.2409563242871;
 Wed, 4 Dec 2024 11:14:30 -0800 (PST)
Date: Wed, 04 Dec 2024 16:14:30 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Abhinav Kumar" <quic_abhinavk@quicinc.com>
Cc: "Rob Clark" <robdclark@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>,
 "Marijn Suijten" <marijn.suijten@somainline.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "linux-kernel" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm" <linux-arm-msm@vger.kernel.org>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "freedreno" <freedreno@lists.freedesktop.org>
Message-ID: <193931869a5.f923adf2270026.8321075661083367617@collabora.com>
In-Reply-To: <20241204-cursor_tor_skip-v1-1-f5f0bba5df7b@quicinc.com>
References: <20241204-cursor_tor_skip-v1-1-f5f0bba5df7b@quicinc.com>
Subject: Re: [PATCH] drm/ci: add kms_cursor_legacy@torture-bo to apq8016 flakes
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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

Hi Abhinav,

Thanks for your patch.



---- On Wed, 04 Dec 2024 15:55:17 -0300 Abhinav Kumar  wrote ---

 > From the jobs [1] and [2] of pipeline [3], its clear that 
 > kms_cursor_legacy@torture-bo is most certainly a flake and 
 > not a fail for apq8016. Mark the test accordingly to match the results. 
 >  
 > [1] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67676481 
 > [2] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67677430 
 > [3]: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1322770 
 >  
 > Signed-off-by: Abhinav Kumar quic_abhinavk@quicinc.com> 
 > --- 
 >  drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt | 5 +++++ 
 >  1 file changed, 5 insertions(+) 
 >  
 > diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt 
 > new file mode 100644 
 > index 000000000000..18639853f18f 
 > --- /dev/null 
 > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt 
 > @@ -0,0 +1,5 @@ 
 > +# Board Name: msm-apq8016-db410c 
 > +# Failure Rate: 100 

Is failure rate is 100%, isn't it a fail than?
(I know we have other cases with Failure Rate: 100, maybe we should fix them as well)

Regards,
Helen

 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.12.0-rc2 
 > +kms_cursor_legacy@torture-bo 
 >  
 > --- 
 > base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b 
 > change-id: 20241204-cursor_tor_skip-9d128dd62c4f 
 >  
 > Best regards, 
 > -- 
 > Abhinav Kumar quic_abhinavk@quicinc.com> 
 >  
 > 

