Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9F57E4A2E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 21:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F31810E6B0;
	Tue,  7 Nov 2023 20:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1C910E6B1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 20:57:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B2D07CE0FAA;
 Tue,  7 Nov 2023 20:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE8CC433C8;
 Tue,  7 Nov 2023 20:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1699390669;
 bh=7ACRIJLIIhFRewyxES9jU9BE2vJL6M7MNnNGzJ/Oz70=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GdW1pJ4btgVPWhLMSRJXq/fIAtmWunmaqDFty+qi1fsCLh9ia4kbvkg/nWfzzNMKP
 h4dcyxKNwjaxHfB0PT+CYgRXoriPiiMIyPzhvFB/kTcC5qJrBwwawuf1ha06Hrbiw+
 KSBfQHO1aZdXCHpjJrDYsstalJ5DLxdXA1yFVmOE=
Date: Tue, 7 Nov 2023 21:57:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v6 3/5] drm/panel-edp: drm/panel-edp: Add several generic
 edp panels
Message-ID: <2023110739-parmesan-exposure-8225@gregkh>
References: <20231107204611.3082200-1-hsinyi@chromium.org>
 <20231107204611.3082200-4-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107204611.3082200-4-hsinyi@chromium.org>
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
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 07, 2023 at 12:41:53PM -0800, Hsin-Yi Wang wrote:
> Add a few generic edp panels used by mt8186 chromebooks.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> no change.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 51 +++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
