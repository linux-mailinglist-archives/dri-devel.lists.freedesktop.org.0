Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FB01870C3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 18:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7746E479;
	Mon, 16 Mar 2020 17:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22ABD6E479
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 17:00:23 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id n7so10291691pfn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 10:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YjH5MjgZiWD2AsCPzj7RL36rRlVP+ZNEC4uN51b8qdI=;
 b=K7kVjtB+7y4URjn4G1hvdMzn78WcrIP9Oz7RSUfwUDvU/XnO2byPqav/Is3jiUWUkB
 W86Xg8p06VavshPMBHqPziU3vXTiy7N48VTAL2j/s2lTWb9lq92j1IU/quTDDTv6S2fu
 DEgpMw1cMNqIxgev0hk/hR3tQhU9JDTDTTbyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YjH5MjgZiWD2AsCPzj7RL36rRlVP+ZNEC4uN51b8qdI=;
 b=WcicchOqxNeawhPAjaXAANiZoI8f57FC/N0j1ojvjYSnIcwu1KkiOIOSGrj3yAghrA
 jGmSaaYdfwOo5glQLiWzCSd6peTvEQfd1Uwt6gYZNGQ5Q3iKkgPk+Sps4s3gTidlH5XB
 0vmu5srnG/hE+F1OERT8xERSsKw29SVf7qZ+6dl+yY3xGnQIk2XdWaKXce+NaPVU8LcP
 +WmVX5k3HQDa3IIS7ufwxBE7y1lG5VLDtM5Jj9LPWpfmDHPkUYUu6bMAW7fVEwQJlSdU
 GnFxJ2rdn2I66CJmvuGOTiHMemzLTufnr9hERmCvmMqoB9hnw8sQnnz83IYDyGEf97Oh
 MFIQ==
X-Gm-Message-State: ANhLgQ2HRGovxmzbBT3XG0fzzoj8QbPlL4QzY2OsSzgO996UzlstPetU
 CJPx4wkMOL5tTEL4b7fuWPufTg==
X-Google-Smtp-Source: ADFU+vv9s0qOxourNNI2GtsjQWv3rsuzY2mQKW8R2dZ8kWjwvGLWsHZAnNuynD6l0oAx3VizaNsAAA==
X-Received: by 2002:a65:678e:: with SMTP id e14mr669453pgr.299.1584378022722; 
 Mon, 16 Mar 2020 10:00:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id u126sm407308pfu.182.2020.03.16.10.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2020 10:00:22 -0700 (PDT)
Date: Mon, 16 Mar 2020 10:00:20 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v7 2/2] drm/panel: add support for rm69299 visionox panel
 driver
Message-ID: <20200316170020.GO144492@google.com>
References: <20200316041647.27953-1-harigovi@codeaurora.org>
 <20200316041647.27953-3-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316041647.27953-3-harigovi@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 09:46:47AM +0530, Harigovindan P wrote:
> Add support for Visionox panel driver.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
