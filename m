Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2787D9B4728
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 11:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2822010E610;
	Tue, 29 Oct 2024 10:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="SI8rp66E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F60C10E276;
 Tue, 29 Oct 2024 10:44:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1730198680; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Q18rsKf+PSMXkucCDhTyrDVQqlW4qf23y/LMNBCJpzaX8+chM7tV32YF8bIGpB7ENyK70258cN4fmMjdnwY2DTU+EineFbpoTHEgygo6bq4PLxX+fe8XJPtI8moRhjig9scoHfK32SG0Vu66T+XFI3YPrL+k0kSq6/DQZr0KxNU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1730198680;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9N2zS3pa6quP5FMUvhF1UomFbmmHT/cflj3VVEtps0U=; 
 b=QzorSkkDoz6DciB9mvwZvPJ+eSp5FnKAx58IuFhLGBjMFBS9XCspIJzZ0zR4voXdMZzRp2U/FDICxkbZPNrE5lygi3zYe+0JFohYo9TzkZVvThU/J62eoA/mJWjLZI9O1C50QGVpO/b6E90CnX06ghcNvx2QOEG98ci+LVHzHhY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730198680; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=9N2zS3pa6quP5FMUvhF1UomFbmmHT/cflj3VVEtps0U=;
 b=SI8rp66EglzB5AZq6rQSuuAzjl7Kvekanr/db0MhBVxZ+u5/zCq6hTZ/FYCIW38r
 7lcByavhGf2AGIYbKz3LH9QktzsLvn0vL0NVrKtVjP69y+79zpDh1XIg1eZkGs3S04e
 NwoXyEKs5pdWFIUi8Nd6mVE7i8n+Ut5zVRmeJkz0=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1730198679207597.7472577126418;
 Tue, 29 Oct 2024 03:44:39 -0700 (PDT)
Date: Tue, 29 Oct 2024 07:44:39 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Cc: "dri-devel" <dri-devel@lists.freedesktop.org>,
 "daniels" <daniels@collabora.com>, "airlied" <airlied@gmail.com>,
 "daniel" <daniel@ffwll.ch>, "robdclark" <robdclark@gmail.com>,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 "sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
 "deborah.brouwer" <deborah.brouwer@collabora.com>,
 "dmitry.baryshkov" <dmitry.baryshkov@linaro.org>,
 "quic_abhinavk" <quic_abhinavk@quicinc.com>,
 "linux-arm-msm" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx" <intel-gfx@lists.freedesktop.org>,
 "virtualization" <virtualization@lists.linux.dev>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <192d7e0ae4b.b23506ab1050252.6351811084971091951@collabora.com>
In-Reply-To: <20241022094509.85510-1-vignesh.raman@collabora.com>
References: <20241022094509.85510-1-vignesh.raman@collabora.com>
Subject: Re: [PATCH v2 0/2] drm/ci: add new devices for testing
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





---- On Tue, 22 Oct 2024 06:45:03 -0300 Vignesh Raman  wrote ---

 > Add jobs that execute the IGT test suite for sm8350-hdk and dedede. 
 >  
 > Dropped the refactor software-driver stage jobs patch from this series. 
 > I will send it as a separate patch. 
 >  
 > Successful pipeline link, 
 > https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1294877 
 >  
 > Vignesh Raman (2): 
 >  drm/ci: add dedede 
 >  drm/ci: add sm8350-hdk 
 >  
 >  drivers/gpu/drm/ci/arm64.config               |   7 +- 
 >  drivers/gpu/drm/ci/build.sh                   |   1 + 
 >  drivers/gpu/drm/ci/test.yml                   |  25 +++ 
 >  drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  51 +++++ 
 >  drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt |  13 ++ 
 >  drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt  |  20 ++ 
 >  .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |  15 ++ 
 >  .../drm/ci/xfails/msm-sm8350-hdk-flakes.txt   |   6 + 
 >  .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    | 211 ++++++++++++++++++ 
 >  9 files changed, 348 insertions(+), 1 deletion(-) 
 >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt 
 >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt 
 >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt 
 >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt 
 >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt 
 >  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt 
 >  
 > -- 
 > 2.43.0 
 >  
 > 

Applied to drm-misc-next

Thanks
Helen
